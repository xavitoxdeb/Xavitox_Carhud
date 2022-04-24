local _sleep = 500
local cinturon = false 

function Cinturon(ped)

    while true do 
        if cinturon then 
            DisableControlAction(0, 75, true)  -- Disable exit vehicle when stop
            DisableControlAction(27, 75, true) -- Disable exit vehicle when Driving
        else
            Citizen.Wait(1000)
        end
        Citizen.Wait(0)
    end
end

CreateThread(function()
    while true do 
        local ped = PlayerPedId()
        if IsPedInAnyVehicle(ped) then 
            _sleep = 150
            local vehiculo = GetVehiclePedIsUsing(ped)
            local velo = (GetEntitySpeed(vehiculo)* 3.6)
            local gaso = GetVehicleFuelLevel(vehiculo)
            SendNUIMessage({
                action = 'showCarhud',
                velo = velo,
                gaso = gaso,
                cinturon = cinturon
            })
        else
            _sleep  =500
            SendNUIMessage({
                action = 'hideCarhud'
            })
        end
        Wait(_sleep)
    end
end)


RegisterCommand('cinto', function ()
    local jugador = PlayerPedId()
    if IsPedInAnyVehicle(jugador) then
        if cinturon then 
            --Notificacion de que se quito cinturon
            cinturon = false
            Cinturon(jugador)
        else
            --Notificacion de que se puso cinturon
            cinturon = true
            Cinturon(jugador)
        end
    end
end)


RegisterKeyMapping('cinto', 'Cinturon', 'keyboard', 'M')