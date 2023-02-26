--configuración fácil de los scripts
IntroTextSize2 = 25	--Tamaño del texto de la cosa "Difficulty is".
IntroSubTextSize2 = 28 --tamaño del texto para el nombre de la canción.
IntroTagColor2 = '8300c3'	--Color de la etiqueta al final de la caja.
IntroTagWidth2 = 15	--Ancho de la etiqueta de la caja.
--configuración fácil de los scripts

--actual script
function onCreate()
	--la etiqueta al final de la caja
	makeLuaSprite('JukeBoxTag2', 'empty', -305-IntroTagWidth2, 135)
	makeGraphic('JukeBoxTag2', 300+IntroTagWidth2, 100, '3EFFE4')
	setObjectCamera('JukeBoxTag2', 'other')
	addLuaSprite('JukeBoxTag2', true)

	--la caja
	makeLuaSprite('JukeBox2', 'empty', -305-IntroTagWidth2, 135)
	makeGraphic('JukeBox2', 300, 100, '000000')
	setObjectCamera('JukeBox2', 'other')
	addLuaSprite('JukeBox2', true)
	
	--el texto para el bit "Difficulty is:"
	makeLuaText('JukeBoxText2', 'Difficuly is:', 300, -305-IntroTagWidth2, 150)
	setTextAlignment('JukeBoxText2', 'left')
	setObjectCamera('JukeBoxText2', 'other')
	setTextSize('JukeBoxText2', IntroTextSize2)
	addLuaText('JukeBoxText2')
	
	--texto para el nombre de la canción
        currentDifficulty = getProperty('storyDifficultyText');
	makeLuaText('JukeBoxSubText2', currentDifficulty, 300, -305-IntroTagWidth2, 180)
	setTextAlignment('JukeBoxSubText2', 'left')
	setObjectCamera('JukeBoxSubText2', 'other')
	setTextSize('JukeBoxSubText2', IntroSubTextSize2)
	addLuaText('JukeBoxSubText2')
end

--funciones de movimiento
function onSongStart()
	-- Inst y Vocales comienzan a sonar, songPosition = 0
	doTweenX('MoveInOne2', 'JukeBoxTag2', 0, 1, 'CircInOut2')
	doTweenX('MoveInTwo2', 'JukeBox2', 0, 1, 'CircInOut2')
	doTweenX('MoveInThree2', 'JukeBoxText2', 0, 1, 'CircInOut2')
	doTweenX('MoveInFour2', 'JukeBoxSubText2', 0, 1, 'CircInOut2')
	
	runTimer('JukeBoxWait2', 3, 1)
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- Un bucle de un temporizador que has llamado se ha completado, el valor "tag" es su etiqueta
	-- loops = cuántos bucles habrá hecho cuando termine por completo
	-- loopsLeft = cuántos quedan
	if tag == 'JukeBoxWait2' then
		doTweenX('MoveOutOne2', 'JukeBoxTag2', -450, 1.5, 'CircInOut2')
		doTweenX('MoveOutTwo2', 'JukeBox2', -450, 1.5, 'CircInOut2')
		doTweenX('MoveOutThree2', 'JukeBoxText2', -450, 1.5, 'CircInOut2')
		doTweenX('MoveOutFour2', 'JukeBoxSubText2', -450, 1.5, 'CircInOut2')
	end
end