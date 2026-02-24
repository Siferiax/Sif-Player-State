local function getAFKState(unit)
	local state = "";
	if UnitIsAFK(unit) then 
		state = "AFK";
	end
	return state;
end

local function getPVPState(unit)
	local state = "";
	if UnitIsPVP(unit) then
		state = "PVP";
	end
	return state;
end

local function getUnitState(unit)
	local state = "";
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

if (C_AddOns.IsAddOnLoaded("UnhaltedUnitFrames")) then
	UUFG:AddTag("curafk", "PLAYER_FLAGS_CHANGED", function(unit) return getAFKState(unit) or "" end, "Misc", "AFK status");
	UUFG:AddTag("curpvp", "PVP_TIMER_UPDATE", function(unit) return getPVPState(unit) or "" end, "Misc", "PVP status");
	UUFG:AddTag("curstate", "PLAYER_FLAGS_CHANGED PVP_TIMER_UPDATE", function(unit) return getUnitState(unit) or "" end, "Misc", "PVP - AFK status");
end

DEFAULT_CHAT_FRAME:AddMessage("Sif's Player Status: Custom tags added to UUF");