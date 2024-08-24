ix.sitesituation.Register("SCPPV04",3,function(valeur)
    if SERVER then 
        return
    end
    -- ix.sounds.PlayAt("sound/project_visualis/intercom/defcon/defcon"..valeur,"facility")
end)


ix.command.Add("SetSitPV04",{
    arguments = {ix.type.number},
    OnRun = function(self,client,sit)
        if sit < 1 or sit > 5 then
            return "@invalidArg",1,"3"
        end
        ix.sitesituation.SetSCPPV03(sit)
        return "@SituationPV04Changed",nil,sit
    end,
    description = "@Changer la situation de PV-04",
    OnCheckAccess = function(self,client)
        return client:IsSuperAdmin()
    end
})
