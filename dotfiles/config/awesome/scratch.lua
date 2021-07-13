pcall(require, "luarocks.loader")
local bling = require("bling")
local naughty = require("naughty")
local awestore = require("awestore")


local anim_y = awestore.tweened(1100, {
    duration = 300,
    easing = awestore.easing.cubic_in_out
})

local anim_x = awestore.tweened(1920, {
    duration = 300,
    easing = awestore.easing.cubic_in_out
})

local term = bling.module.scratchpad:new {
	command = "urxvt",
	rule = { instance = "scpd" },
	sticky = true,
	autoclose = true,
	geometry = {x=360, y=90, height=900, width=1200},
	reapply = true,
	dont_focus_before_close = false,
}

awesome.connect_signal("scratch::term", function() term:toggle() end)