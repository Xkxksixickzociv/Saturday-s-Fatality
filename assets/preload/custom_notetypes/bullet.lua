function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an desviation note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'bullet' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'HURTNOTE_assets'); --Change texture
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has no penalties
		end
	end
	--debugPrint('Script started!')
	function noteMiss(id, i, noteType, isSustainNote)
		if noteType == 'bullet' then
			playSound('shoot', 0.4)
		characterPlayAnim('boyfriend', 'hurt', true);
		addHealth(-(0.88 + (getHealth() / 3.856)))
		cameraShake('camGame', 0.01, 0.2);
		cameraShake('camHUD', 0.01, 0.1);

	end
end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'bullet' then
		playSound('shoot', 0.4)
		characterPlayAnim('boyfriend', 'dodge', true);
		cameraShake('camGame', 0.01, 0.2);
		cameraShake('camHUD', 0.01, 0.1);
	end
end