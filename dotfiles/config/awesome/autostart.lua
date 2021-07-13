local awful = require ("awful")

awful.spawn.with_shell("picom")
awful.spawn.with_shell("nitrogen --restore")

--systray items
awful.spawn.with_shell("pgrep -x udiskie > /dev/null || udiskie -t")
awful.spawn.with_shell("pgrep -x nm-applet > /dev/null/ || nm-applet")

-- daemons
awful.spawn.with_shell("pgrep -x mps > /dev/null/ || mpd")
awful.spawn.with_shell("pgrep -x mpd_discord_richpresence --no-idle > /dev/null/ || mpd_discord_richpresence --no-idle")
--awful.spawn.with_shell("pgrep -x playerctld daemon> /dev/null/ || playerctld daemon")

-- wm session startup
awful.spawn.with_shell("pgrep -x lxsession > /dev/null/ || lxsession")
awful.spawn.with_shell("pgrep -x lxpolkit > /dev/null/ || lxpolkit")
