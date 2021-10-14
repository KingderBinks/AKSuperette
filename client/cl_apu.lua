ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(5000)
	end
end)

--- MENU ---

local open = false 
local MainApu = RageUI.CreateMenu("", 'Superette', nil, nil, "shopui_title_conveniencestore", "shopui_title_conveniencestore")
local subApu1 = RageUI.CreateSubMenu(MainApu, "", "Nourritures")
local subApu2 = RageUI.CreateSubMenu(MainApu, "", "Boissons")
local subApu4 = RageUI.CreateSubMenu(MainApu, "", "Accessoires")
local subApu5 = RageUI.CreateSubMenu(MainApu, "", "Produits locaux")
local vigneron = RageUI.CreateSubMenu(MainApu, "", "Produits locaux")
local tabac = RageUI.CreateSubMenu(MainApu, "", "Produits locaux")
local brasseur = RageUI.CreateSubMenu(MainApu, "", "Produits locaux")
MainApu.Display.Header = true 
MainApu.Closed = function()
  open = false
end

--- FUNCTION OPENMENU ---

function MenuSuperette()
	if open then 
		open = false
		RageUI.Visible(MainApu, false)
		return
	else
		open = true 
		RageUI.Visible(MainApu, true)
		CreateThread(function()
		while open do 
		   RageUI.IsVisible(MainApu,function() 

			RageUI.Button("Nourritures", nil, {RightLabel = "→"}, true , {
				onSelected = function()
				end
			}, subApu1)

			RageUI.Button("Boissons", nil, {RightLabel = "→"}, true , {
				onSelected = function()
				end
			}, subApu2)

			  RageUI.Button("Divers", nil, {RightLabel = "→"}, true , {
				onSelected = function()
				end
			}, subApu4)

			RageUI.Button("Produits locaux", nil, {RightLabel = "→"}, true , {
				onSelected = function()
				end
			}, subApu5)


		end)

		RageUI.IsVisible(subApu5,function() 
			RageUI.Button("Vigneron", "Chaque achat sera versé aux ~p~Vigneron", {RightLabel = "→"}, true , {
				onSelected = function()
				end
			}, vigneron)
			RageUI.Button("Tabac", "Chaque achat sera versé aux ~y~Tabac", {RightLabel = "→"}, true , {
				onSelected = function()
				end
			}, tabac)

			RageUI.Button("Brasseur", "Chaque achat sera versé aux ~o~Brasseur", {RightLabel = "→"}, true , {
				onSelected = function()
				end
			}, brasseur)
		end)

		RageUI.IsVisible(brasseur,function() 

			for k, v in pairs(ConfShop.Type.brasseur) do
				RageUI.Button(v.Label, nil, {RightLabel = "~g~"..v.Price.."$"}, true , {
					onSelected = function()
						TriggerServerEvent('brrrbrbrrbrrrloc', v)
					end
				})
			end
	
			end)

		RageUI.IsVisible(vigneron,function() 

			for k, v in pairs(ConfShop.Type.vigneron) do
				RageUI.Button(v.Label, nil, {RightLabel = "~g~"..v.Price.."$"}, true , {
					onSelected = function()
						TriggerServerEvent('locaulocaloaca', v)
					end
				})
			end
	
			end)

			RageUI.IsVisible(tabac,function() 

				for k, v in pairs(ConfShop.Type.tabac) do
					RageUI.Button(v.Label, nil, {RightLabel = "~g~"..v.Price.."$"}, true , {
						onSelected = function()
							TriggerServerEvent('tabloctabcwshlast', v)
						end
					})
				end
		
				end)

		RageUI.IsVisible(subApu1,function() 

			for k, v in pairs(ConfShop.Type.Nourritures) do
			RageUI.Button(v.Label, nil, {RightLabel = "~g~"..v.Price.."$"}, true , {
				onSelected = function()
					TriggerServerEvent('apuapuapuapuapua', v)
				end
			})
		end


		end)

		RageUI.IsVisible(subApu4,function() 

			for k, v in pairs(ConfShop.Type.Divers) do
			RageUI.Button(v.Label, nil, {RightLabel = "~g~"..v.Price.."$"}, true , {
				onSelected = function()
					TriggerServerEvent('apuapuapuapuapua', v)
				end
			})
		end


		end)

		RageUI.IsVisible(subApu2,function() 

			for k, v in pairs(ConfShop.Type.Boissons) do
			RageUI.Button(v.Label, nil, {RightLabel = "~g~"..v.Price.."$"}, true , {
				onSelected = function()
					TriggerServerEvent('apuapuapuapuapua', v)
				end
			})
		end
	end)

		Wait(5)
	   end
	end)
 end
end


Citizen.CreateThread(function()
	while true do
		local wait = 1000
		local playerCoords = GetEntityCoords(PlayerPedId())

		for k, v in pairs(ConfShop.Pos) do
			local distance = GetDistanceBetweenCoords(playerCoords, v.x, v.y, v.z, true)
            
            if distance <= 1.5 then
				wait = 0
				Visual.Subtitle("Appuyer sur ~b~[E]~s~ pour parler à ~g~Apu", 1) 

                if IsControlJustPressed(1, 51) then
					MenuSuperette()
                end
        --    end
            end
        end
        Citizen.Wait(wait)
	end
end)


Citizen.CreateThread(function()
	for k, v in pairs(ConfShop.Pos) do
		local blip = AddBlipForCoord(v.x, v.y, v.z)

		SetBlipSprite(blip, 59)
		SetBlipScale (blip, 0.75)
		SetBlipColour(blip, 2)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName('Superette')
		EndTextCommandSetBlipName(blip)
	end
end)