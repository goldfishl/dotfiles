hs.console.clearConsole()

function clear()
	hs.console.clearConsole()
end
-- hotkey binding

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x - 10
  win:setFrame(f)
end)

-- hs.hotkey.bind("alt", "o", "hammerspoon console", 
	-- function() 
		-- local hsApp = hs.application.find("hammerspoon")
		-- if hsApp:isFrontmost() then
			-- hsApp:hide()
			-- hs.closeConsole()
		-- else
			-- hs.openConsole() 
		-- end 
	-- end)

-- Config auto loading

function reloadConfig(files)
	doReload = false
	for _, file in pairs(files) do
		if file:sub(-4) == ".lua" then
			doReload = true
		end
	end
	if doReload then
		hs.reload()
	end
end


-- Application Frontmost switch hotkey binding.

prevFrontApp = hs.application.find("Finder")

function switchKeyBind(mods, key, appName)
	hs.hotkey.bind(mods, key,
		function() 
			local app = hs.application.find(appName)
	
			-- when app is frontmost,show previous frontmost app
			if app:isFrontmost() then
				curApp = prevFrontApp
				prevFrontApp:activate()
				prevFrontApp = app
			-- show the appshow the app
			else
				if hs.application.frontmostApplication() ~= prevFrontApp then
					prevFrontApp = hs.application.frontmostApplication()
				end
				app:activate()
				curApp = app
			end 
			hs.alert(curApp:name(), 0.3)
		end)
end

switchKeyBind("alt", "2", "code")
switchKeyBind("alt", "0", "hammerspoon")
switchKeyBind("alt", "1", "firefox")
switchKeyBind("alt", "3", "obsidian")
switchKeyBind("alt", "9", "chrome")
switchKeyBind("alt", "-", "iTerm2")

-- hammerspoon events
-- -- open console when `hammerspoon` active
function applicationWatcher(appName, eventType, app)
	if (appName == "Hammerspoon") then
		if (eventType == hs.application.watcher.activated) then
			hs.openConsole()
		end
		if (eventType == hs.application.watcher.deactivated) then
			-- hs.closeConsole()
			-- app:hide()
		end
	end
end

appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()
-- appWatch = hs.application.watcher.new(applicationWatcher)
-- appWatch:start()


hsConifgWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon", reloadConfig):start()
hs.alert.show("hammerspoon config reloaded")


-- tutorial

-- window manager
dofile("/Users/longjinyu/.hammerspoon/window_manager.lua")

-- Move focused window to another monitor
-- function moveWindowToMonitor(monitor)
--     local win = hs.window.focusedWindow()
--     local newScreen = hs.screen.findByName(monitor)

--     if win and newScreen then
--         win:moveToScreen(newScreen)
--     end
-- end

-- -- Define keyboard shortcuts to move window to left or right monitor
-- hs.hotkey.bind({"alt", "cmd"}, "L", function()
--     moveWindowToMonitor("LG")
-- end)

-- hs.hotkey.bind({"alt", "cmd"}, "H", function()
--     moveWindowToMonitor("Retina")
-- end)

local builtinScreen = hs.screen.findByName("Retina")
local LGScreen = hs.screen.findByName("LG")

hs.hotkey.bind({"alt"}, "]", function()
  local focusedWindow = hs.window.focusedWindow()
  local screen = focusedWindow:screen()

  if screen == builtinScreen then
    focusedWindow:moveToScreen(LGScreen)
  else
    focusedWindow:moveToScreen(builtinScreen)
  end
end)

-- hs.hotkey.bind({"alt"}, "[", function()
--   local currentApp = hs.application.frontmostApplication()
--   local nextWindow = currentApp:nextWindow()

--   if nextWindow then
--     nextWindow:focus()
--   end
-- end)



local hyper = {"alt"}
local win = hs.window
local fnutils = hs.fnutils
debug_w = nil
hs.hotkey.bind(hyper, "[", function()
    windows = win.focusedWindow():application():allWindows()

    windows[#windows]:focus()
end)

-- local hyper = {"alt"}
-- local win = hs.window

-- hs.hotkey.bind(hyper, "[", function()
--     local windows = win.focusedWindow():application():allWindows()
--     local nextWindow = windows[1]

--     for i, w in ipairs(windows) do
--         if w == win.focusedWindow() then
--             nextWindow = windows[(i % #windows) + 1]
--             break
--         end
--     end

--     nextWindow:focus()
-- end)

