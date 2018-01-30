function OutTransFunction()
    IsM16 = false
	IsAK = false

	IsOnClick = false
	ReleaseMouseButton(1)
end	
	
function TransAK()
	IsOnClick = false
	IsM16 = false
	IsAK = not IsAK
end

function TransM16()
	IsOnClick = false
	IsAK = false
	IsM16 = not IsM16
end

function AkFunc(arg)
	if	IsKeyLockOn(FourCode)  then
		AKFourPoint() 
	else 
		UsualAK()
	end 
end

function M16Func(arg)
	if	IsKeyLockOn(FourCode)  then
		M16FourPoint()
	else 
		UsualM16() 
	end 
end

function UsualAK()
	shotTime = 0       
	repeat
		if (IsMouseButtonPressed(1)) then
			if  shotTime>1400 then
				MoveMouseRelative(0, 7.5)
			elseif shotTime>1000 then
				MoveMouseRelative(0, 7.5)
			elseif shotTime &lt; 1000 then
				MoveMouseRelative(0, 6)
			end
			PressAndReleaseKey(FireCode)
			Sleep(30)
			shotTime = shotTime+30
		else
			break
		end
	until( not IsOnClick )
end

function AKFourPoint()
	shotTime = 0       
	repeat
		if (IsMouseButtonPressed(1)) then
			if  shotTime>1400 then
				MoveMouseRelative(0, 28)
			elseif shotTime>1000 then
				MoveMouseRelative(0, 37)
			elseif shotTime &lt; 1000 then
				MoveMouseRelative(0, 20)
			end
			PressAndReleaseKey(FireCode)
			Sleep(30)
			shotTime = shotTime+30
		else
			break
		end
	until( not IsOnClick )
end

function UsualM16()
	shotTime = 0 
	repeat
		if (IsMouseButtonPressed(1)) then
			if  shotTime>1840 then 
				MoveMouseRelative(0, 8)
			elseif  shotTime>1000 then
				MoveMouseRelative(0, 8)
			elseif shotTime>680 then
				MoveMouseRelative(0, 11)
			elseif shotTime &lt; 680 then
				MoveMouseRelative(0, 7)
			end
			PressAndReleaseKey(FireCode)
			Sleep(30)
			shotTime = shotTime+30
		else
			break
        end
    until( not IsOnClick )
end

function M16FourPoint()
	shotTime = 0 
	repeat
		if (IsMouseButtonPressed(1)) then
			if  shotTime>1840 then 
				MoveMouseRelative(0, 29)
			elseif  shotTime>1000 then
				MoveMouseRelative(0, 29)
			elseif shotTime>680 then
				MoveMouseRelative(0, 45)
			elseif shotTime &lt; 680 then
				MoveMouseRelative(0, 26)
			end
			PressAndReleaseKey(FireCode)
			Sleep(30)
			shotTime = shotTime+30
		else
			break
		end
	until( not IsOnClick )      
end

function OnEvent(event, arg)
    OutputLogMessage("event = %s, 键号是 = %s\n", event, arg)
	AkNumber = 6;
	M16Number = 7;
	FireCode = "Left";
	FourCode = "scrolllock";--四倍
	SuperClose = 8; --一键关闭
	
	if (event == "MOUSE_BUTTON_RELEASED" and arg == 1) then
		-- 鼠标按键1已被释放
		IsOnClick = false	
		ReleaseKey(FireCode)
	end
	
	if (event == "PROFILE_ACTIVATED") then
        EnablePrimaryMouseButtonEvents(true)
    elseif event == "PROFILE_DEACTIVATED" then
		IsOnClick = false
    end
	
	IsOnClick = false
	
	if (event == "MOUSE_BUTTON_PRESSED" and arg == 1) then
		IsOnClick = not IsOnClick
	end
	
	if (event == "MOUSE_BUTTON_PRESSED" and arg == AkNumber) then --Trans AKkey
		OutputLogMessage("event AKAK\n", event, arg)
		TransAK()
		IsOnClick = false
    end
	
	if (event == "MOUSE_BUTTON_PRESSED" and arg == M16Number) then --Trans M16key
		TransM16()
		IsOnClick = false
    end
	
	if (event == "MOUSE_BUTTON_PRESSED" and arg == SuperClose) then --Out Trans OutTranskey
		OutTransFunction()
		IsOnClick = false
    end	
	
	
	if (event == "MOUSE_BUTTON_PRESSED" and arg == 1 and IsAK) then
		AkFunc(arg)
	elseif (event == "MOUSE_BUTTON_PRESSED" and arg == 1 and IsM16) then
		M16Func(arg)
	elseif (event == "MOUSE_BUTTON_PRESSED" and arg == 1) then
		if not PingBiFunc() then
			PressKey(FireCode) 
		end
    end	
	
end