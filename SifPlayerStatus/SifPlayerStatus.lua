local function getUnitStateString(unit)
	local state = "At keyboard";
	if UnitIsAFK(unit) then 
		state = "AFK";
	end
	if UnitIsPVP(unit) then
		if UnitIsAFK(unit) then
			state = "PVP - AFK";
		else
			state = "PVP";
		end
	end
	return state;
end

local unit = "player";
DEFAULT_CHAT_FRAME:AddMessage(UnitName(unit) .. "'s status: " .. getUnitStateString(unit));