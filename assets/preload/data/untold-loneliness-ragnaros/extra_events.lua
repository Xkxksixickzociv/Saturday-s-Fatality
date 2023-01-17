function onCreate()
  setProperty('banjo.visible', false)

    makeLuaSprite('BarradeArriba', '', 0, -120)
	makeGraphic('BarradeArriba', 1280, 120, '000000')
	setObjectCamera('BarradeArriba', 'camHUD')
	addLuaSprite('BarradeArriba', false)

	makeLuaSprite('BarradeAbajo', '', 0, 720)
	makeGraphic('BarradeAbajo', 1280, 120, '000000')
	setObjectCamera('BarradeAbajo', 'camHUD')
	addLuaSprite('BarradeAbajo', false)

    makeAnimatedLuaSprite('oswaldicon2', 'icons/oswald-suicide', getProperty('iconP2.x'), getProperty('iconP2.y'))

	luaSpriteAddAnimationByPrefix('oswaldicon2', 'idle', 'idle', 24, true)
	luaSpriteAddAnimationByPrefix('oswaldicon2', 'losing', 'angryish', 24, true)

	setObjectCamera('oswaldicon2', 'hud')
	addLuaSprite('oswaldicon2', true)
	setObjectOrder('oswaldicon2', getObjectOrder('iconP2') + 1)
	setProperty('oswaldicon2.visible', false)
	objectPlayAnimation('oswaldicon2', 'idle', true)
end
function onUpdate()
	setProperty('oswaldicon2.x', getProperty('iconP2.x') + 15)
	setProperty('oswaldicon2.y', getProperty('iconP2.y') + 5)
	setProperty('oswaldicon2.angle', getProperty('iconP2.angle'))
	scaleObject('oswaldicon2', getProperty('iconP2.scale.x'), getProperty('iconP2.scale.y'))
	if getProperty('healthBar.percent') > 80 then
		if getProperty('oswaldicon2.animation.curAnim.name') ~= 'losing' then
			objectPlayAnimation('oswaldicon2', 'losing', true)
		end
	else
		objectPlayAnimation('oswaldicon2', 'idle', true)
	end
end

function onStepHit()
    if curStep >= 21 then
        noteTweenAlpha("notapl1", 0, 0, 0.15, "linear")
        noteTweenAlpha("notapl2", 1, 0, 0.15, "linear")
        noteTweenAlpha("notapl3", 2, 0, 0.15, "linear")
        noteTweenAlpha("notapl4", 3, 0, 0.15, "linear")
          noteTweenAlpha("notaop1", 4, 0, 0.15, "linear")
        noteTweenAlpha("notaop2", 5, 0, 0.15, "linear")
        noteTweenAlpha("notaop3", 6, 0, 0.15, "linear")
        noteTweenAlpha("notaop4", 7, 0, 0.15, "linear")
          doTweenAlpha('AlphaTween1', 'healthBarBG', 0, 0.15)
        doTweenAlpha('AlphaTween2', 'healthBar', 0, 0.15)
        doTweenAlpha('AlphaTween3', 'scoreTxt', 0, 0.15)
        doTweenAlpha('AlphaTween4', 'iconP1', 0, 0.15)
        doTweenAlpha('AlphaTween5', 'iconP2', 0, 0.15)
        doTweenAlpha('AlphaTween6', 'timeBar', 0, 0.15)
        doTweenAlpha('AlphaTween7', 'timeBarBG', 0, 0.15)
        doTweenAlpha('AlphaTween8', 'timeTxt', 0, 0.15)
        doTweenAlpha('AlphaTween9', 'marktime', 0, 0.15)
        doTweenAlpha('AlphaTween10', 'sick', 0, 0.15)
        doTweenAlpha('AlphaTween11', 'good', 0, 0.15)
        doTweenAlpha('AlphaTween12', 'bad', 0, 0.15)
        doTweenAlpha('AlphaTween13', 'shit', 0, 0.15)
        doTweenAlpha('AlphaTween14', 'score', 0, 0.15)
        doTweenAlpha('AlphaTween15', 'misses', 0, 0.15)
        doTweenAlpha('AlphaTween16', 'accu', 0, 0.15)
        doTweenAlpha('AlphaTween17', 'songname', 0, 0.15)
        doTweenAlpha('AlphaTween18', 'camGame', 0, 0.15)
    end
    if curStep >= 33 and curStep < 35 then
        cameraFlash('other', 'FFFFFF', 0.5, true) 
    end
    if curStep >= 33 then
        doTweenAlpha('AlphaTween18', 'camGame', 1, 0.1)
    end
    if curStep >= 153 then
        noteTweenAlpha("notapl1", 0, 1, 0.15, "linear")
        noteTweenAlpha("notapl2", 1, 1, 0.15, "linear")
        noteTweenAlpha("notapl3", 2, 1, 0.15, "linear")
        noteTweenAlpha("notapl4", 3, 1, 0.15, "linear")
          noteTweenAlpha("notaop1", 4, 1, 0.15, "linear")
        noteTweenAlpha("notaop2", 5, 1, 0.15, "linear")
        noteTweenAlpha("notaop3", 6, 1, 0.15, "linear")
        noteTweenAlpha("notaop4", 7, 1, 0.15, "linear")
          doTweenAlpha('AlphaTween1', 'healthBarBG', 1, 0.15)
        doTweenAlpha('AlphaTween2', 'healthBar', 1, 0.15)
        doTweenAlpha('AlphaTween3', 'scoreTxt', 1, 0.15)
        doTweenAlpha('AlphaTween4', 'iconP1', 1, 0.15)
        doTweenAlpha('AlphaTween5', 'iconP2', 1, 0.15)
        doTweenAlpha('AlphaTween6', 'timeBar', 1, 0.15)
        doTweenAlpha('AlphaTween7', 'timeBarBG', 1, 0.15)
        doTweenAlpha('AlphaTween8', 'timeTxt', 1, 0.15)
        doTweenAlpha('AlphaTween9', 'marktime', 1, 0.15)
        doTweenAlpha('AlphaTween10', 'sick', 1, 0.15)
        doTweenAlpha('AlphaTween11', 'good', 1, 0.15)
        doTweenAlpha('AlphaTween12', 'bad', 1, 0.15)
        doTweenAlpha('AlphaTween13', 'shit', 1, 0.15)
        doTweenAlpha('AlphaTween14', 'score', 1, 0.15)
        doTweenAlpha('AlphaTween15', 'misses', 1, 0.15)
        doTweenAlpha('AlphaTween16', 'accu', 1, 0.15)
        doTweenAlpha('AlphaTween17', 'songname', 1, 0.15)
    end
    if curStep >= 697 and curStep < 699 then
        cameraFlash('other', 'FFFFFF', 0.5, true) 
    end
    if curStep >= 697 then
        doTweenY('BarraNegra1', 'BarradeArriba', -60, 1, 'quartOut')
        doTweenY('BarraNegra2', 'BarradeAbajo', 660, 1, 'quartOut')
    end
    if curStep >= 952 then
        noteTweenAlpha("notapl1", 0, 0, 0.15, "linear")
        noteTweenAlpha("notapl2", 1, 0, 0.15, "linear")
        noteTweenAlpha("notapl3", 2, 0, 0.15, "linear")
        noteTweenAlpha("notapl4", 3, 0, 0.15, "linear")
          noteTweenAlpha("notaop1", 4, 0, 0.15, "linear")
        noteTweenAlpha("notaop2", 5, 0, 0.15, "linear")
        noteTweenAlpha("notaop3", 6, 0, 0.15, "linear")
        noteTweenAlpha("notaop4", 7, 0, 0.15, "linear")
          doTweenAlpha('AlphaTween1', 'healthBarBG', 0, 0.15)
        doTweenAlpha('AlphaTween2', 'healthBar', 0, 0.15)
        doTweenAlpha('AlphaTween3', 'scoreTxt', 0, 0.15)
        doTweenAlpha('AlphaTween4', 'iconP1', 0, 0.15)
        doTweenAlpha('AlphaTween5', 'iconP2', 0, 0.15)
        doTweenAlpha('AlphaTween6', 'timeBar', 0, 0.15)
        doTweenAlpha('AlphaTween7', 'timeBarBG', 0, 0.15)
        doTweenAlpha('AlphaTween8', 'timeTxt', 0, 0.15)
        doTweenAlpha('AlphaTween9', 'marktime', 0, 0.15)
        doTweenAlpha('AlphaTween10', 'sick', 0, 0.15)
        doTweenAlpha('AlphaTween11', 'good', 0, 0.15)
        doTweenAlpha('AlphaTween12', 'bad', 0, 0.15)
        doTweenAlpha('AlphaTween13', 'shit', 0, 0.15)
        doTweenAlpha('AlphaTween14', 'score', 0, 0.15)
        doTweenAlpha('AlphaTween15', 'misses', 0, 0.15)
        doTweenAlpha('AlphaTween16', 'accu', 0, 0.15)
        doTweenAlpha('AlphaTween17', 'songname', 0, 0.15)
    end
    if curStep >= 1072 then
        noteTweenAlpha("notapl1", 0, 1, 0.55, "linear")
        noteTweenAlpha("notapl2", 1, 1, 0.55, "linear")
        noteTweenAlpha("notapl3", 2, 1, 0.55, "linear")
        noteTweenAlpha("notapl4", 3, 1, 0.55, "linear")
          noteTweenAlpha("notaop1", 4, 1, 0.55, "linear")
        noteTweenAlpha("notaop2", 5, 1, 0.55, "linear")
        noteTweenAlpha("notaop3", 6, 1, 0.55, "linear")
        noteTweenAlpha("notaop4", 7, 1, 0.55, "linear")
    end
    if curStep >= 1209 and curStep < 1211 then
        cameraFlash('other', 'FFFFFF', 0.5, true)
    end
    if curStep >= 1209 then
        doTweenY('BarraNegra1', 'BarradeArriba', -120, 1, 'quartOut')
        doTweenY('BarraNegra2', 'BarradeAbajo', 720, 1, 'quartOut')
        doTweenAlpha('AlphaTween1', 'healthBarBG', 1, 0.15)
        doTweenAlpha('AlphaTween2', 'healthBar', 1, 0.15)
        doTweenAlpha('AlphaTween3', 'scoreTxt', 1, 0.15)
        doTweenAlpha('AlphaTween4', 'iconP1', 1, 0.15)
        doTweenAlpha('AlphaTween6', 'timeBar', 1, 0.15)
        doTweenAlpha('AlphaTween7', 'timeBarBG', 1, 0.15)
        doTweenAlpha('AlphaTween8', 'timeTxt', 1, 0.15)
        doTweenAlpha('AlphaTween9', 'marktime', 1, 0.15)
        doTweenAlpha('AlphaTween10', 'sick', 1, 0.15)
        doTweenAlpha('AlphaTween11', 'good', 1, 0.15)
        doTweenAlpha('AlphaTween12', 'bad', 1, 0.15)
        doTweenAlpha('AlphaTween13', 'shit', 1, 0.15)
        doTweenAlpha('AlphaTween14', 'score', 1, 0.15)
        doTweenAlpha('AlphaTween15', 'misses', 1, 0.15)
        doTweenAlpha('AlphaTween16', 'accu', 1, 0.15)
        doTweenAlpha('AlphaTween17', 'songname', 1, 0.15) 
        setProperty('oswaldicon2.visible', true)
    end
    if curStep >= 1721 and curStep < 1722 then
      cameraFlash('other', 'FFFFFF', 0.5, true) 
    end
    if curStep >= 1977 and curStep < 1978 then
      cameraFlash('other', 'FFFFFF', 0.5, true) 
    end
    if curStep >= 2232 then
      noteTweenAlpha("notapl1", 0, 0, 0.15, "linear")
      noteTweenAlpha("notapl2", 1, 0, 0.15, "linear")
      noteTweenAlpha("notapl3", 2, 0, 0.15, "linear")
      noteTweenAlpha("notapl4", 3, 0, 0.15, "linear")
        noteTweenAlpha("notaop1", 4, 0, 0.15, "linear")
      noteTweenAlpha("notaop2", 5, 0, 0.15, "linear")
      noteTweenAlpha("notaop3", 6, 0, 0.15, "linear")
      noteTweenAlpha("notaop4", 7, 0, 0.15, "linear")
        doTweenAlpha('AlphaTween1', 'healthBarBG', 0, 0.15)
      doTweenAlpha('AlphaTween2', 'healthBar', 0, 0.15)
      doTweenAlpha('AlphaTween3', 'scoreTxt', 0, 0.15)
      doTweenAlpha('AlphaTween4', 'iconP1', 0, 0.15)
      doTweenAlpha('AlphaTween5', 'iconP2', 0, 0.15)
      doTweenAlpha('AlphaTween6', 'timeBar', 0, 0.15)
      doTweenAlpha('AlphaTween7', 'timeBarBG', 0, 0.15)
      doTweenAlpha('AlphaTween8', 'timeTxt', 0, 0.15)
      doTweenAlpha('AlphaTween9', 'marktime', 0, 0.15)
      doTweenAlpha('AlphaTween10', 'sick', 0, 0.15)
      doTweenAlpha('AlphaTween11', 'good', 0, 0.15)
      doTweenAlpha('AlphaTween12', 'bad', 0, 0.15)
      doTweenAlpha('AlphaTween13', 'shit', 0, 0.15)
      doTweenAlpha('AlphaTween14', 'score', 0, 0.15)
      doTweenAlpha('AlphaTween15', 'misses', 0, 0.15)
      doTweenAlpha('AlphaTween16', 'accu', 0, 0.15)
      doTweenAlpha('AlphaTween17', 'songname', 0, 0.15)
      doTweenAlpha('AlphaTween18', 'camGame', 0, 0.15)
      doTweenAlpha('AlphaTween19', 'oswaldicon2', 0, 0.15)
    end
    if curStep >= 2368 and curStep < 2369 then
      cameraFlash('other', 'FFFFFF', 0.5, true) 
    end
    if curStep >= 2368 then
      doTweenY('BarraNegra1', 'BarradeArriba', -60, 1, 'quartOut')
      doTweenY('BarraNegra2', 'BarradeAbajo', 660, 1, 'quartOut')
      noteTweenAlpha("notapl1", 0, 1, 1, "linear")
      noteTweenAlpha("notapl2", 1, 1, 1, "linear")
      noteTweenAlpha("notapl3", 2, 1, 1, "linear")
      noteTweenAlpha("notapl4", 3, 1, 1, "linear")
      doTweenAlpha('AlphaTween1', 'healthBarBG', 1, 0.1)
    doTweenAlpha('AlphaTween2', 'healthBar', 1, 0.1)
    doTweenAlpha('AlphaTween3', 'scoreTxt', 1, 0.1)
    doTweenAlpha('AlphaTween4', 'iconP1', 1, 0.1)
    doTweenAlpha('AlphaTween6', 'timeBar', 1, 0.1)
    doTweenAlpha('AlphaTween7', 'timeBarBG', 1, 0.1)
    doTweenAlpha('AlphaTween8', 'timeTxt', 1, 0.1)
    doTweenAlpha('AlphaTween9', 'marktime', 1, 0.1)
    doTweenAlpha('AlphaTween10', 'sick', 1, 0.1)
    doTweenAlpha('AlphaTween11', 'good', 1, 0.1)
    doTweenAlpha('AlphaTween12', 'bad', 1, 0.1)
    doTweenAlpha('AlphaTween13', 'shit', 1, 0.1)
    doTweenAlpha('AlphaTween14', 'score', 1, 0.1)
    doTweenAlpha('AlphaTween15', 'misses', 1, 0.1)
    doTweenAlpha('AlphaTween16', 'accu', 1, 0.1)
    doTweenAlpha('AlphaTween17', 'songname', 1, 0.1)
    doTweenAlpha('AlphaTween18', 'camGame', 1, 0.1)
    doTweenAlpha('AlphaTween19', 'oswaldicon2', 1, 0.1)
    end
    if curStep >= 2480 then
      noteTweenAlpha("notaop1", 4, 1, 1, "linear")
      noteTweenAlpha("notaop2", 5, 1, 1, "linear")
      noteTweenAlpha("notaop3", 6, 1, 1, "linear")
      noteTweenAlpha("notaop4", 7, 1, 1, "linear")
    end
    if curStep >= 2881 then
      doTweenY('BarraNegra1', 'BarradeArriba', -120, 1, 'quartOut')
      doTweenY('BarraNegra2', 'BarradeAbajo', 720, 1, 'quartOut')
    end
    if curStep >= 3137 then
      noteTweenAlpha("notapl1", 0, 0, 0.15, "linear")
      noteTweenAlpha("notapl2", 1, 0, 0.15, "linear")
      noteTweenAlpha("notapl3", 2, 0, 0.15, "linear")
      noteTweenAlpha("notapl4", 3, 0, 0.15, "linear")
        noteTweenAlpha("notaop1", 4, 0, 0.15, "linear")
      noteTweenAlpha("notaop2", 5, 0, 0.15, "linear")
      noteTweenAlpha("notaop3", 6, 0, 0.15, "linear")
      noteTweenAlpha("notaop4", 7, 0, 0.15, "linear")
        doTweenAlpha('AlphaTween1', 'healthBarBG', 0, 0.15)
      doTweenAlpha('AlphaTween2', 'healthBar', 0, 0.15)
      doTweenAlpha('AlphaTween3', 'scoreTxt', 0, 0.15)
      doTweenAlpha('AlphaTween4', 'iconP1', 0, 0.15)
      doTweenAlpha('AlphaTween6', 'timeBar', 0, 0.15)
      doTweenAlpha('AlphaTween7', 'timeBarBG', 0, 0.15)
      doTweenAlpha('AlphaTween8', 'timeTxt', 0, 0.15)
      doTweenAlpha('AlphaTween9', 'marktime', 0, 0.15)
      doTweenAlpha('AlphaTween10', 'sick', 0, 0.15)
      doTweenAlpha('AlphaTween11', 'good', 0, 0.15)
      doTweenAlpha('AlphaTween12', 'bad', 0, 0.15)
      doTweenAlpha('AlphaTween13', 'shit', 0, 0.15)
      doTweenAlpha('AlphaTween14', 'score', 0, 0.15)
      doTweenAlpha('AlphaTween15', 'misses', 0, 0.15)
      doTweenAlpha('AlphaTween16', 'accu', 0, 0.15)
      doTweenAlpha('AlphaTween17', 'songname', 0, 0.15)
      doTweenAlpha('AlphaTween19', 'oswaldicon2', 0, 0.15)
    end
    if curStep >= 3232 then
      doTweenAlpha('AlphaTween18', 'camGame', 0, 0.55)
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote) 
    health = getProperty('health') 
    if curStep >= 1207 then
      triggerEvent('Screen Shake', "0.1, 0.008", "0.1, 0.008")
        if getProperty('health') > 0.21 then
          setProperty('health', health- 0.021); 
      end
    end
end
