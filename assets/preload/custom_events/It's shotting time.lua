function onCreate()--Codigo/Mecanica por Nickobelit (Si lo usas deja creditos)
	Dodged = false;
    canDodge = false;
end

function onEvent(name)
    if name == "It's shott" then
    if getPropertyFromClass('ClientPrefs', 'middleScroll') == false then--Esto mejora la jugabilidad porque la canci n es re dif cil (Nickobelit)
	makeAnimatedLuaSprite('warning', 'mechanics/warning', -100, 250);
	end
     if getPropertyFromClass('ClientPrefs', 'middleScroll') == true then--Detalles pa ,Detalles
    makeAnimatedLuaSprite('warning', 'mechanics/warning', 300, 200);
    end
    luaSpriteAddAnimationByPrefix('warning', 'advertencia', 'Advertencia', 24, false);
	luaSpritePlayAnimation('warning', 'spacebar');
	setObjectCamera('warning', 'other');
	scaleLuaSprite('warning', 1,1); 
    addLuaSprite('warning', true); 
    playSound('mechanics/Warning', 1);
    runTimer('MickeyJeringaAnim', 0.3)
	end
end

function onUpdate()--Simplemente Nickobelit p
    if keyJustPressed('space') or (getMouseX('camHUD') > 1100 and getMouseX('camHUD') < 1250) and (getMouseY('camHUD') > 410 and getMouseY('camHUD') < 540 and mouseClicked('left')) then 
   objectPlayAnimation('BotonDodge','boton2',false)
   end
   if canDodge == true and keyJustPressed('space') or canDodge == true and (getMouseX('camHUD') > 1100 and getMouseX('camHUD') < 1250) and (getMouseY('camHUD') > 410 and getMouseY('camHUD') < 540 and mouseClicked('left')) or canDodge == true and botPlay then --Si,el botplay te juega la Mec nica  
   Dodged = true;
   canDodge = false;
   triggerEvent('Play Animation', 'dodge','boyfriend');
   setProperty('boyfriend.specialAnim', true);
   end
end

function onTimerCompleted(tag, loops, loopsLeft)--NO BORRAR canDodge = false DE AQUI (A no ser q quieras ventajas xd)(Ahora q lo pienso porque puse esto aaaa)
   if tag == 'MickeyJeringaAnim' then--Creo q si le s 
   canDodge = true;
   triggerEvent('Play Animation', 'dodge','dad');
	runTimer('BajaVida', 0.5);
   end
   if tag == 'BajaVida' and Dodged == false then
   setProperty('health',getProperty('health') - 0.3)
   triggerEvent('Play Animation', 'at','boyfriend');
   canDodge = false;--NO BORRAR
   elseif tag == 'BajaVida' and Dodged == true then
   Dodged = false
   canDodge = false;--NO BORRAR
   end   
end