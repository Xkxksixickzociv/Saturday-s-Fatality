function onCreate()
	makeLuaSprite('black', 'blam/black', -500, -200)
	scaleObject('black', 1700, 1700);
	setScrollFactor('black', 0,0)
	setProperty('black.alpha', 0)
	addLuaSprite('black', false)
	this = 0
end
function onEvent(name, value1, value2)
	if name == 'Blammed Lights' then
		if value1 == '0' then --turn off
			this = 2
			doTweenAlpha('leave', 'black', 0, 0.55, 'linear')
			Color = 0
		elseif value1 == '1' then --blue
			if this == 0 then --the fade in
				doTweenAlpha('background', 'black', 1, 0.66, 'linear')
			else --for the quick flash
				doTweenAlpha('black', 'black', 1, 0.001, 'linear')
			end
			Color = 1
		elseif value1 == '2' then --green
			if this == 0 then --the fade in
				doTweenAlpha('background', 'black', 1, 0.66, 'linear')
			else --for the quick flash
				doTweenAlpha('black', 'black', 1, 0.001, 'linear')
			end
			Color = 2
		elseif value1 == "3" then --pink
			if this == 0 then --the fade in
				doTweenAlpha('background', 'black', 1, 0.66, 'linear')
			else --for the quick flash
				doTweenAlpha('black', 'black', 1, 0.001, 'linear')
			end
			Color = 3
		elseif value1 == '4' then --red
			if this == 0 then --the fade in
				doTweenAlpha('background', 'black', 1, 0.66, 'linear')
			else --for the quick flash
				doTweenAlpha('black', 'black', 1, 0.001, 'linear')
			end
			Color = 4
		elseif value1 == '5' then --orange
			if this == 0 then --the fade in
				doTweenAlpha('background', 'black', 1, 0.66, 'linear')
			else --for the quick flash
				doTweenAlpha('black', 'black', 1, 0.001, 'linear')
			end
			Color = 5
		else --random
			lol = math.floor(math.random(1, 5)) --1200
			if lol == Color then
				triggerEvent('Blammed Lights', 6, '')
			else
				triggerEvent('Blammed Lights', lol, '')
			end
		end
		if this == 2 then
		else
			this = 1
		end
	end
end

function onBeatHit()
	if curBeat % 4 then
		if this == 2 then
			this = 3
		elseif this == 3 then
			this = 0
		end
	end
end