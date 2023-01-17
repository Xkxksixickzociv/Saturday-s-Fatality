function onEvent(name, value1, value2)
    local var string = (value1)
    local var color = (value2)
    if name == "Lyrics" then

        makeLuaText('captions', 'Lyrics go here', 1000, 200, 580)
        setTextString('captions',  '' .. string)
        setTextFont('captions', 'wi.ttf')
        setTextColor('captions', '' .. color)
        setTextSize('captions', 32);
        addLuaText('captions')
	setObjectCamera('captions', 'other');
        setTextAlignment('captions', 'center')
        --removeLuaText('captions', true)     
    end
end

