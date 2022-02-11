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
local top_y = y - 200
local y_step = 50

local japanId, rainId, vacuumId

widget.newButton{
	x = xl, y = top_y,
	width = w, height = h,
	label = 'Add Japan',
	onRelease = function()
		japanId = nativeaudio.addSource{
			filename = 'sounds/music/japan_1.mp3',
			onComplete = function()
				print('Japan ended.')
			end
		}
		print('japan_1')
	end}

widget.newButton{
	x = xr, y = top_y,
	width = w, height = h,
	label = 'Add rain',
	onRelease = function()
		rainId = nativeaudio.addSource{
			filename = 'sounds/sfx/rain.mp3',
			loop = true
		}
		print('rain')
	end}

widget.newButton{
	x = xl, y = top_y + y_step,
	width = w, height = h,
	label = 'Add vacuum',
	onRelease = function()
		vacuumId = nativeaudio.addSource{
			filename = 'sounds/sfx/vacuum_cleaner.mp3'
		}
		print('vacuum')
	end}

widget.newButton{
	x = xr, y = top_y + y_step,
	width = w, height = h,
	label = 'Start',
	onRelease = function()
		nativeaudio.start()
		print('start')
	end}

widget.newButton{
	x = xl, y = top_y + 2 * y_step,
	width = w, height = h,
	label = 'Stop',
	onRelease = function()
		nativeaudio.stop()
		print('stop')
	end}

widget.newButton{
	x = xr, y = top_y + 2 * y_step,
	width = w, height = h,
	label = 'Play Japan',
	onRelease = function()
		nativeaudio.playSource(japanId)
		print('play japanId')
	end}

widget.newButton{
	x = xl, y = top_y + 3 * y_step,
	width = w, height = h,
	label = 'Play rain',
	onRelease = function()
		nativeaudio.playSource(rainId)
		print('play rain')
	end}

widget.newButton{
	x = xr, y = top_y + 3 * y_step,
	width = w, height = h,
	label = 'Play vacuum',
	onRelease = function()
		nativeaudio.playSource(vacuumId)
		print('play vacuum')
	end}

widget.newButton{
	x = xl, y = top_y + 4 * y_step,
	width = w, height = h,
	label = 'Pause Japan',
	onRelease = function()
		nativeaudio.pauseSource(japanId)
		print('pause japan')
	end}

widget.newButton{
	x = xr, y = top_y + 4 * y_step,
	width = w, height = h,
	label = 'Volume 50% Japan',
	onRelease = function()
		nativeaudio.setSourceOptions(japanId, {volume = 0.5})
		print('volume 50% japan')
	end}

widget.newButton{
	x = xl, y = top_y + 5 * y_step,
	width = w, height = h,
	label = 'Set Info',
	onRelease = function()
		nativeaudio.setInfo{
			title = 'My Awesome Audio App',
			image = {
				filename = 'artwork.jpg'
				--baseDir = ...
			}
		}
		print('set info')
	end}

widget.newButton{
	x = xr, y = top_y + 5 * y_step,
	width = w, height = h,
	label = 'Set Fade Out',
	onRelease = function()
		nativeaudio.setFadeOut{
			delay = 5000,
			duration = 10000
		}
		print('set fade out')
	end}

widget.newButton{
	x = xl, y = top_y + 6 * y_step,
	width = w, height = h,
	label = 'Cancel Fade Out',
	onRelease = function()
		nativeaudio.cancelFadeOut()
		print('cancel fade out')
	end}
