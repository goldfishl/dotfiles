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

switchKeyBind("alt", "i", "code")
switchKeyBind("alt", "o", "hammerspoon")
switchKeyBind("alt", "b", "firefox")
switchKeyBind("alt", "m", "obsidian")
switchKeyBind("alt", "h", "chrome")

-- hammerspoon events
function applicationWatcher(appName, eventType, app)
	if (appName == "Hammerspoon") then
		if (eventType == hs.application.watcher.activated) then
			hs.openConsole()
		end
		if (eventType == hs.application.watcher.deactivated) then
			hs.closeConsole()
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
