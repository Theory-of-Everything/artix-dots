--  __ ___      _____  ___  ___  _ __ ___   _____      ___ __ ___  
-- / _` \ \ /\ / / _ \/ __|/ _ \| '_ ` _ \ / _ \ \ /\ / / '_ ` _ \ 
--| (_| |\ V  V /  __/\__ \ (_) | | | | | |  __/\ V  V /| | | | | |
-- \__,_| \_/\_/ \___||___/\___/|_| |_| |_|\___| \_/\_/ |_| |_| |_|
--                                                                 
--
-- Theory's AwesomeWM Configs
--
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")
require("awful.autofocus")
local hotkeys_popup = require("awful.hotkeys_popup")

--bling lb
local bling = require('bling')

--local lib
local keys = require("keys")
require("autostart")
require("signals")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions

-- Themes define colours, icons, font and wallpapers.
beautiful.init("/home/theorytoe/.config/awesome/theme.lua")
--for s = 1, screen.count() do
--	gears.wallpaper.maximized(beautiful.wallpaper, s, true)
--end

-- This is used later as the default terminal and editor to run.
terminal = "urxvt"
editor = os.getenv("nvim") or "nano"
editor_cmd = terminal .. " -e " .. editor
browser = "brave"
flieman = "Thunar"
imageman = "feh"
videoman = "mpv"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.tile,
    -- awful.layout.suit.tile.left,
    -- awful.layout.suit.tile.bottom,
    -- awful.layout.suit.tile.top,
    -- awful.layout.suit.fair,
    -- awful.layout.suit.fair.horizontal,
    -- awful.layout.suit.spiral,
    -- awful.layout.suit.spiral.dwindle,
    -- awful.layout.suit.max,
    -- awful.layout.suit.max.fullscreen,
    -- awful.layout.suit.magnifier,
    -- awful.layout.suit.corner.nw,
    awful.layout.suit.floating,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}
-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
   { "Hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "Manual", terminal .. " -e man awesome" },
   { "Awesome Docs", browser .. " --new-tab https://awesomewm.org/doc/api/" },
   -- { "Edit config (editor)", editor_cmd .. " " .. awesome.conffile },
   { "Edit config", terminal .. " -e nvim ~/.config/awesome/" },
   { "Restart", awesome.restart },
   { "Quit", function() awesome.quit() end },
}

webmenu = {
   { "TheoryWare", browser .. " --new-tab https://theoryware.net" },
   { "GitHub", browser .. " --new-tab https://github.com/Theory-of-Everything" },
   { "GitLab", browser .. " --new-tab https://gitlab.com/Theory_of_Everything" },
   { "ProtonMail", browser .. " --new-tab https://mail.protonmail.com/login" },
   { "Discord", browser .. " --new-tab https://discord.com" },
   { "Reddit", browser .. " --new-tab https://reddit.com" },
}

linuxwebmenu = {
   { "ArchWiki", browser .. " --new-tab https://wiki.archlinux.org/" },
   { "ArtixWiki", browser .. " --newt-tab https://wiki.artixlinux.org/" },
   { "Distrowatch", browser .. " --new-tab https://distrowatch.com/" },
   { "AUR", browser .. " --new-tab https://aur.archlinux.org/" },
}

mymainmenu = awful.menu({ items = { { "Awesome", myawesomemenu, beautiful.pfp_icon },
				    { "Web Stuff", webmenu },
				    { "Linux Web", linuxwebmenu },
                                    { "Urxvt", terminal },
				    { "Waterfox", browser },
				    { "Thunar", fileman },
				    { "feh", imageman },
				    { "mpv", videoman },
				    { "Neovim", terminal .. " -e nvim"},
				    { "News", terminal .. " -e newsboat"},
                                  }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock()

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

local battery_wid = require("awesome-wm-widgets.batteryarc-widget.batteryarc")
local todo_wid = require("awesome-wm-widgets.todo-widget.todo")
local pomo_wid = require("awesome-wm-widgets.pomodoroarc-widget.pomodoroarc")
local fs_wid = require("awesome-wm-widgets.fs-widget.fs-widget")
local vol_wid = require('awesome-wm-widgets.volume-widget.volume')
--local mpd_wid = require('awesome-wm-widgets.mpdarc-widget.mpdarc')

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(keys.layout_buttons)

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = keys.taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = keys.tasklist_buttons
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            mylauncher,
            s.mytaglist,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            --mykeyboardlayout,
            --mpd_wid,
            wibox.widget.systray(),
	    todo_wid(),
            mytextclock,
	    battery_wid(),
	    fs_wid({ mounts = { '/', '/home' } }),
            s.mylayoutbox,
        },
    }
end)
-- }}}

-- {{{ Set Mouse bindings
root.buttons(keys.desktop_buttons)
-- }}}

-- {{{ Set key bindings
root.keys(keys.globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = keys.clientkeys,
                     buttons = keys.clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },

    -- Floating clients.
    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
          "pinentry",
        },
        class = {
          "Arandr",
          "Blueman-manager",
          "Gpick",
          "Kruler",
          "MessageWin",  -- kalarm.
      --    "Sxiv",
          "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
          "Wpa_gui",
          "veromix",
          "xtightvncviewer"},
  	  

        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = {
          "Event Tester",  -- xev.
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "ConfigManager",  -- Thunderbird's about:config.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { floating = true }},

    -- Add titlebars to normal clients and dialogs
    { rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = false }
    },
    { rule = { class = "brave-browser" },
      properties = { tag = "3"} 
    },
    { rule = { instance = "scpd"},
      properties = { floating = true }
    },


    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { screen = 1, tag = "2" } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- {{{ signals
-- in signals.lua file
-- }}}

-- test widget
--local buttons_example = wibox {
--	visible = true,
--	bg = '#2E3440',
--	ontop = true,
--	height = 200,
--	width = 200,
--	shape = function(cr, width, height)
--		gears.shape.rounded_rect(cr, width, height, 3)
--	end
--
--}
--
--local button = {
--	text = 'Hello world!',
--	widget = wibox.widget.textbox
--}
--
--
--buttons_example:setup {
--	button,
--	valigh = 'center',
--	layout = wibox.container.place
--}
--
--awful.placement.top(buttons_example, {margins = {top = 40}, parent = awful.screen.focused()})
