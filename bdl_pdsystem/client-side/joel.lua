-- [ ESSE SISTEMA FOI DESENVOLVIDO POR Edu#0069 ou rossiniJS ] --
-- [ ESSE SISTEMA É 100% GRATUITO E OPEN SOURCE, SUA VENDA É PROIBIDA ] --
-- [ VISITE NOSSA LOJA E SAIBA MAIS SOBRE NOSSO TRABALHO - discord.gg/bABGBEX ] --
-- [ VISITE NOSSO GITHUB PARA TER ACESSO A MAIS SCRIPTS GRATUITOS COMO ESSE AQUI ] --
-- [ PARA CONSEGUIR AJUDA COM ESSE OU OUTRO DE NOSSOS SISTEMAS GRATUITOS, ACESSE NOSSO DISCORD ] --

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

vRPex = Tunnel.getInterface("bdl_pdsystem")

local menuactive = false
function ToggleActionMenu()
	menuactive = not menuactive
	if menuactive then
		SetNuiFocus(true,true)
		TransitionToBlurred(1000)
		SendNUIMessage({ showmenu = true })
	else
		SetNuiFocus(false)
		TransitionFromBlurred(1000)
		SendNUIMessage({ hidemenu = true })
	end
end

-- [ Callback das ações dos botões ]
RegisterNUICallback("ButtonClick",function(data,cb)
	local ped = PlayerPedId()
	if data == "m4a1" then
		if vRPex.checkPermission("lspd.permission") then
			RemoveWeaponFromPed(ped,GetHashKey("WEAPON_CARBINERIFLE"))
			GiveWeaponToPed(ped,GetHashKey("WEAPON_CARBINERIFLE_MK2"),150,0,0)
		else
			TriggerEvent("Notify","negado","Você precisa entrar em serviço para pegar qualquer equipamento do arsenal",9000)
		end

	elseif data == "m4a4" then
		if vRPex.checkPermission("lspd.permission") then
			RemoveWeaponFromPed(ped,GetHashKey("WEAPON_CARBINERIFLE_MK2"))
			GiveWeaponToPed(ped,GetHashKey("WEAPON_CARBINERIFLE"),150,0,0)
		else
			TriggerEvent("Notify","negado","Você precisa entrar em serviço para pegar qualquer equipamento do arsenal.",9000)
		end

	elseif data == "mp5" then
		if vRPex.checkPermission("lspd.permission") then
			RemoveWeaponFromPed(ped,GetHashKey("WEAPON_COMBATPDW"))
			GiveWeaponToPed(ped,GetHashKey("WEAPON_SMG"),130,0,0)
		else
			TriggerEvent("Notify","negado","Você precisa entrar em serviço para pegar qualquer equipamento do arsenal.",9000)
		end

	elseif data == "mpx" then
		if vRPex.checkPermission("lspd.permission") then
			RemoveWeaponFromPed(ped,GetHashKey("WEAPON_SMG"))
			GiveWeaponToPed(ped,GetHashKey("WEAPON_COMBATPDW"),130,0,0)
		else
			TriggerEvent("Notify","negado","Você precisa entrar em serviço para pegar qualquer equipamento do arsenal.",9000)
		end

	elseif data == "shot45" then
		if vRPex.checkPermission("lspd.permission") then
			RemoveWeaponFromPed(ped,GetHashKey("WEAPON_PUMPSHOTGUN"))
			GiveWeaponToPed(ped,GetHashKey("WEAPON_PUMPSHOTGUN_MK2"),10,0,0)
		else
			TriggerEvent("Notify","negado","Você precisa entrar em serviço para pegar qualquer equipamento do arsenal.",9000)
		end

	elseif data == "shot12" then
		if vRPex.checkPermission("lspd.permission") then
			RemoveWeaponFromPed(ped,GetHashKey("WEAPON_PUMPSHOTGUN_MK2"))
			GiveWeaponToPed(ped,GetHashKey("WEAPON_PUMPSHOTGUN"),10,0,0)
		else
			TriggerEvent("Notify","negado","Você precisa entrar em serviço para pegar qualquer equipamento do arsenal.",9000)
		end

	elseif data == "fiveseven" then
		if vRPex.checkPermission("lspd.permission") then
			RemoveWeaponFromPed(ped,GetHashKey("WEAPON_COMBATPISTOL"))
			GiveWeaponToPed(ped,GetHashKey("WEAPON_PISTOL_MK2"),75,0,0)
		else
			TriggerEvent("Notify","negado","Você precisa entrar em serviço para pegar qualquer equipamento do arsenal.",9000)
		end

	elseif data == "glock18" then
		if vRPex.checkPermission("lspd.permission") then
			RemoveWeaponFromPed(ped,GetHashKey("WEAPON_PISTOL_MK2"))
			GiveWeaponToPed(ped,GetHashKey("WEAPON_COMBATPISTOL"),75,0,0)
		else
			TriggerEvent("Notify","negado","Você precisa entrar em serviço para pegar qualquer equipamento do arsenal.",9000)
		end
		
	elseif data == "take-kit" then
		if vRPex.checkPermission("lspd.permission") then
			GiveWeaponToPed(ped,GetHashKey("WEAPON_NIGHTSTICK"),0,0,0)
			GiveWeaponToPed(ped,GetHashKey("WEAPON_STUNGUN"),0,0,0)
			GiveWeaponToPed(ped,GetHashKey("WEAPON_FLASHLIGHT"),0,0,0)
		else
			TriggerEvent("Notify","negado","Você precisa entrar em serviço para pegar qualquer equipamento do arsenal.",9000)
		end
		
	elseif data == "rem-kit" then
		RemoveWeaponFromPed(ped,GetHashKey("WEAPON_NIGHTSTICK"))
		RemoveWeaponFromPed(ped,GetHashKey("WEAPON_STUNGUN"))
		RemoveWeaponFromPed(ped,GetHashKey("WEAPON_FLASHLIGHT"))
		TriggerEvent("Notify","sucesso","Você guardou seu kit básico.")
		
	elseif data == "clear" then
		RemoveAllPedWeapons(ped,0)
		TriggerEvent("Notify","sucesso","Você guardou todos os equipamentos no arsenal.")

	elseif data == "on-duty" then
		TriggerServerEvent('bdl:onduty')

	elseif data == "off-duty" then
		TriggerServerEvent('bdl:offduty')
		
	elseif data == "onarmor" then
		if vRPex.checkPermission("lspd.permission") then
			TriggerServerEvent('bdl:onarmor')
		else
			TriggerEvent("Notify","negado","Você precisa entrar em serviço para pegar qualquer equipamento do arsenal.",9000)
		end
		
	elseif data == "offarmor" then
		TriggerServerEvent('bdl:offarmor')
	
	elseif data == "fechar" then
		ToggleActionMenu()
	
	end
end)

-- [ Coordenadas ] --
local system = {
	{ ['x'] = -1098.82, ['y'] = -826.02, ['z'] = 14.29 },
}



-- [ Thread do Menu ] --
Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		local sleep = 1000
		for k,v in pairs(system) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			local distance = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)
			local system = system[k]
			
			if distance <= 5 then
				DrawMarker(20, system.x, system.y, system.z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,0,0,50,0,0,0,1)
				sleep = 5
				if distance <= 1.2 then
					if IsControlJustPressed(0,38) and vRPex.checkOfficer() then
						ToggleActionMenu()
					end
				end
			end
		end
		Citizen.Wait(sleep)
	end
end)
