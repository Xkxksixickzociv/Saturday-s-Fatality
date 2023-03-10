animationsList = {}

local defaultstrumy
local noteoffset

local player3 = 'toony_mickey' 
local isStrummin = false

function makeAnimationList()
	animationsList[0] = 'keyArrow' 
	animationsList[1] = 'keyConfirm' 
	animationsList[2] = 'keyPressed' 
end

offsets = {};

function makeOffsets(object)
	offsets[0] = {x=45, y=46}
	offsets[1] = {x=70, y=69}
	offsets[2] = {x=42, y=44}
end

function onCreate()
	setProperty('skipArrowStartTween',true)
end

function onCreatePost()
	--gracias a los papus del port de bonedoggle por estas lineas de codigo

	defaultstrumy = 570
	noteoffset = -570
	for i = 0,7 do
    setPropertyFromGroup('strumLineNotes', i, 'scale.x', 0.7)
	setPropertyFromGroup('strumLineNotes', i, 'scale.y', 0.7)
	end
	for i = 0,3 do
	setPropertyFromGroup('strumLineNotes', i, 'x', 150 + (95 * (i % 4)))
	end
	for i = 4,7 do
	setPropertyFromGroup('strumLineNotes', i, 'x', 720 + (95 * (i % 4)))
	end
	if not downscroll then
	defaultstrumy = 61
	noteoffset = 20
	end

	directions = {'left', 'down', 'up', 'right'}
	makeAnimationList()
	makeOffsets()

	for i=1, #directions do
		makeAnimatedLuaSprite('strum'..directions[i], 'BLACK_assets', getPropertyFromGroup('opponentStrums', i-1, 'x') - 140, defaultstrumy - 100)
		if not downscroll then
			setProperty('strum'..directions[i]..'.y', defaultstrumy+100)
		end		
        
		addAnimationByPrefix('strum'..directions[i], 'keyConfirm', directions[i]..' confirm', 24, false)
		addAnimationByPrefix('strum'..directions[i], 'keyPressed', directions[i]..' press', 24, false)
		addAnimationByPrefix('strum'..directions[i], 'keyArrow', 'arrow'..directions[i]:upper(), 24, false)

		setObjectCamera('strum'..directions[i], 'camHUD')
		scaleObject('strum'..directions[i], 0.7, 0.7)
		
		setProperty('strum'..directions[i]..'.alpha', 0)
		
		addLuaSprite('strum'..directions[i])

		playAnimation('strum'..directions[i], 0, true)
	end	
end

function playAnimation(character, animId, forced) -- thank you shadowmario :evil:
animName = animationsList[animId]
objectPlayAnimation(character, animName, forced); -- this part is easily broke if you use objectPlayAnim (I have no idea why its like this)
setProperty(character..'.offset.x', offsets[animId].x);
setProperty(character..'.offset.y', offsets[animId].y);
if animId == 1 then
 runTimer('stopanim'..character, 0.1)
	end
end

function onTimerCompleted(tag)
	if(string.sub(tag,1,8) == "stopanim") then
        	playAnimation(string.sub(tag,9), 0, true)
    end
end

function onUpdatePost()
	for i=0, getProperty('notes.length')-1 do
		if getPropertyFromGroup('notes', i, 'noteType') == 'plr3' then
			if not isStrummin then
				return
			end
			noteX = getPropertyFromGroup('notes', i, 'x');
			noteY = getPropertyFromGroup('notes', i, 'y');
			setPropertyFromGroup('notes', i, 'ignoreNote', true)	
			hitbox = 30;
			isSustainNote = getPropertyFromGroup('notes', i, 'isSustainNote');
			noteData = getPropertyFromGroup('notes', i, 'noteData');
			strumY = getProperty('strum'..directions[noteData + 1]..'.y')	
			noteX = getProperty('strum'..directions[noteData + 1]..'.x')
			if downscroll then
				noteY = (noteY - strumY - noteoffset - offsets[0].x)
			else
				noteY = (noteY + noteoffset + offsets[0].x)
			end
			if isSustainNote then
				noteX = noteX + 32;
			end			
			setPropertyFromGroup('notes', i, 'x', noteX)
			setPropertyFromGroup('notes', i, 'y', noteY)
			if math.abs(noteY - strumY) <= hitbox then
				playAnimation('strum'..directions[noteData+1], 1, true)
				characterPlayAnim('gf', 'sing'..directions[noteData+1]:upper(), true);
				setProperty('gf.specialAnim', true);
				removeFromGroup('notes', i)
			end
			
		end
	end
end

function tobool(val)
	if val=='true' then
		return true
	else
		return false
	end
end

function onEvent(n, v1, v2)
	if n == '3rdstrum' then
		isStrummin = tobool(v1)
		if tobool(v1) then
			for strum=1, #directions do
				doTweenY('strumTweening'..strum, 'strum'..directions[strum], defaultstrumy, 0.35 + 0.1*strum, 'quadInOut')
				doTweenAlpha('strumAlphaTweening'..strum, 'strum'..directions[strum], 1, 0.35 + 0.05*strum, 'easeInOut')
			end
		else
			for strum=1, #directions do
				if downscroll then
					doTweenY('strumTweening'..strum, 'strum'..directions[math.abs(strum-5)], defaultstrumy-100, 0.35 + 0.1*strum, 'quadInOut')
				else
					doTweenY('strumTweening'..strum, 'strum'..directions[math.abs(strum-5)], defaultstrumy+100, 0.35 + 0.1*strum, 'quadInOut')
				end
				doTweenAlpha('strumAlphaTweening'..strum, 'strum'..directions[math.abs(strum-5)], 0, 0.35 + 0.05*strum, 'easeInOut')
				
			end
		end
	end
end