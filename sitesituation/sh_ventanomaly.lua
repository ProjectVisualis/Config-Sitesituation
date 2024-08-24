ix.sitesituation.Register("VentDetected",false,function(valeur)
    if SERVER then 
        if valeur then
            timer.Simple(90,function()
                ix.sitesituation.SetVentDetected(false)
            end)
            for k,v in pairs(player.GetAll()) do
                if !v:Team() == FACTION_SECURITY then continue end
                ix.util.Notify("Anomaly in Vent Detected", v)
            end
        end
        return 
    end
    if valeur then 
        ix.sounds.PlayAt("sound/project_visualis/intercom/vent/anomaly","facility")
    end
end)
if SERVER then
    ix.sitesituation.SetVentDetected(false)
    ix.log.AddType("AreaMove", function(client, area)
        return Format("%s moved to the area '%s'", client:SteamName(), area)
    end, FLAG_SERVER)
    hook.Add("OnPlayerAreaChanged","PV_SiteSituationCamerareaChecker",function(client,oldAreaID,newAreaID)
        if newAreaID == "Vent Spoted" then
            if(ix.sitesituation.GetVentDetected()) then            return        end
            ix.sitesituation.SetVentDetected(true)
            ix.log.Add(client,"AreaMove","Vent Spoted")
        elseif (newAreaID== "Control Room") then
            ix.log.Add(client,"AreaMove","Control Room")
        else
            ix.log.Add(client,"AreaMove",newAreaID)
        end
    end)
end
return true