--Script made by JohnL#6869 kek


local player
local wearingholster = nil
local texturevar = 0
local hasweapon = nil
local holsteredweapon = true
local gangstadrawanim = 'reaction@intimidation@1h'
local holsterdrawanim = 'reaction@intimidation@cop@unarmed'
local animlock = false


----#####DONT DELETE
--DEBUG
--[[function ShowText(text, posx, posy)
	SetTextFont(4)
	SetTextScale(0.0, 0.31)
	SetTextJustification(1)
	SetTextColour(250, 250, 120, 255)
	SetTextDropshadow(1, 255, 255, 255, 255)
	SetTextEdge(1, 0, 0, 0, 205)
	BeginTextCommandDisplayText("STRING")
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(posx, posy)
end]]

--[[Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		player = GetPlayerPed(-1)
		ShowText(tostring(GetPedDrawableVariation(player, 7)), 0.3, 0.3)
	end
end)]]
--END OF DEBUG

function CheckHolster(pl)
	for i=1, #Config.HolsterModels do
		Citizen.Wait(0)
		if GetPedDrawableVariation(pl, 7) == Config.HolsterModels[i] then
			wearingholster = true
			return true
		end
		wearingholster = false
	end
	return false
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		loadAnimDict("rcmjosh4")
		loadAnimDict(holsterdrawanim)
		loadAnimDict(gangstadrawanim)
		if Config.HolsterDraw then
			if not IsPedInAnyVehicle(player, false) then
				if CheckHolster(player) then
					if CheckWeapon(player) and wearingholster == true then
						if holsteredweapon then
							animlock = true
							SetPedCurrentWeaponVisible(player, 0, 1, 1, 1)
							TaskPlayAnim(player, holsterdrawanim, "intro", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0)
							Citizen.Wait(Config.Cooldown)
							SetPedCurrentWeaponVisible(player, 1, 1, 1, 1)
							TaskPlayAnim(player, "rcmjosh4", "josh_leadout_cop2", 8.0, 2.0, -1, 48, 10, 0, 0, 0)
							Citizen.Wait(400)
							ClearPedTasks(player)
							holsteredweapon = false
						else
							animlock = false
						end
					else
						if holsteredweapon == false then
							TaskPlayAnim(player, "rcmjosh4", "josh_leadout_cop2", 8.0, 2.0, -1, 48, 10, 0, 0, 0)
							Citizen.Wait(500)
							TaskPlayAnim(player, holsterdrawanim, "outro", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0)
							Citizen.Wait(60)
							ClearPedTasks(player)
							holsteredweapon = true
						end
					end
				end
			else
				holsteredweapon = true
			end
		end
		if Config.GangsterDraw and not CheckHolster(player) then

			if not IsPedInAnyVehicle(player, false) then
				if CheckWeapon(player) then
					if holsteredweapon then
						animlock = true
						SetPedCurrentWeaponVisible(player, 0, 1, 1, 1)
						TaskPlayAnim(player, gangstadrawanim, "intro", 5.0, 1.0, -1, 50, 0, 0, 0, 0)
						Citizen.Wait(1250)
						SetPedCurrentWeaponVisible(player, 1, 1, 1, 1)
						Citizen.Wait(Config.Cooldown)
						ClearPedTasks(player)
						holsteredweapon = false
					else
						animlock = false
					end
				else
					if holsteredweapon == false then
						TaskPlayAnim(player, gangstadrawanim, "outro", 8.0, 3.0, -1, 50, 0, 0, 0.125, 0)
						Citizen.Wait(1700)
						ClearPedTasks(player)
						holsteredweapon = true
					end
				end
			else
				holsteredweapon = true
			end
		end
	end
end)

function loadAnimDict(dict)
	while ( not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(0)
	end
end


function CheckWeapon(pl)
	if IsEntityDead(pl) then
		animlock = false
			return false
		else
			for i = 1, #Config.HolsterWeapons do
				if GetHashKey(Config.HolsterWeapons[i]) == GetSelectedPedWeapon(pl) then
					return true
				end
			end
		return false
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		player = GetPlayerPed(-1)
		if animlock then
			DisableControlAction(1, 25, true)
			DisableControlAction(1, 140, true)
			DisableControlAction(1, 141, true)
			DisableControlAction(1, 142, true)
			DisableControlAction(1, 23, true)
			DisableControlAction(1, 37, true) -- Disables INPUT_SELECT_WEAPON (TAB)
			if not IsPedInAnyVehicle(player, false) then
				DisablePlayerFiring(player, true) -- Disable weapon firing
			end
		end
	end
end)