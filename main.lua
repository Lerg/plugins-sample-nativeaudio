-- Sample app for the NativeAudio plugin for Solar2D
-- Documentation: http://spiralcodestudio.com/plugin-nativeaudio/

display.setStatusBar(display.HiddenStatusBar)

local json = require('json')
local widget = require('widget')
local nativeaudio = require('plugin.nativeaudio')

nativeaudio.init()

display.setDefault('background', 1)

local xl, xr, y = display.contentWidth * .35, display.contentWidth * .65, display.contentCenterY
local w, h = display.contentWidth * 0.3, 40

local japanId, rainId, vacuumId

widget.newButton{
	x = xl, y = y - 200,
	width = w, height = h,
	label = 'Add Japan',
	onRelease = function()
		japanId = nativeaudio.addSource{
			filename = 'sounds/music/japan_1.mp3'
		}
		print('japan_1')
	end}

widget.newButton{
	x = xr, y = y - 200,
	width = w, height = h,
	label = 'Add rain',
	onRelease = function()
		rainId = nativeaudio.addSource{
			filename = 'sounds/sfx/rain.mp3'
		}
		print('rain')
	end}

widget.newButton{
	x = xl, y = y - 120,
	width = w, height = h,
	label = 'Add vacuum',
	onRelease = function()
		vacuumId = nativeaudio.addSource{
			filename = 'sounds/sfx/vacuum_cleaner.mp3'
		}
		print('vacuum')
	end}

widget.newButton{
	x = xl, y = y - 40,
	width = w, height = h,
	label = 'Start',
	onRelease = function()
		nativeaudio.start()
		print('start')
	end}

widget.newButton{
	x = xr, y = y - 40,
	width = w, height = h,
	label = 'Stop',
	onRelease = function()
		nativeaudio.stop()
		print('stop')
	end}

widget.newButton{
	x = xl, y = y + 40,
	width = w, height = h,
	label = 'Play Japan',
	onRelease = function()
		nativeaudio.playSource(japanId)
		print('play japanId')
	end}

widget.newButton{
	x = xr, y = y + 40,
	width = w, height = h,
	label = 'Play rain',
	onRelease = function()
		nativeaudio.playSource(rainId)
		print('play rain')
	end}

widget.newButton{
	x = xl, y = y + 120,
	width = w, height = h,
	label = 'Play vacuum',
	onRelease = function()
		nativeaudio.playSource(vacuumId)
		print('play vacuum')
	end}

widget.newButton{
	x = xr, y = y + 120,
	width = w, height = h,
	label = 'Pause Japan',
	onRelease = function()
		nativeaudio.pauseSource(japanId)
		print('pause japan')
	end}

widget.newButton{
	x = xl, y = y + 200,
	width = w, height = h,
	label = 'Volume 50% Japan',
	onRelease = function()
		nativeaudio.setSourceOptions(japanId, {volume = 0.5})
		print('volume 50% japan')
	end}
