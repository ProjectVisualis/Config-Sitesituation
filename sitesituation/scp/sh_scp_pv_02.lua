ix.sitesituation.Register("SCPPV02",3,function(valeur)
    if SERVER then 
        return
    end
    -- ix.sounds.PlayAt("sound/project_visualis/intercom/defcon/defcon"..valeur,"facility")
end)


ix.command.Add("SetSitPV02",{
    arguments = {ix.type.number},
    OnRun = function(self,client,sit)
        if sit < 1 or sit > 5 then
            return "@invalidArg",1,"3"
        end
        ix.sitesituation.SetSCPPV02(sit)
        return "@SituationPV02Changed",nil,sit
    end,
    description = "@Changer la situation de PV02",
    OnCheckAccess = function(self,client)
        return client:IsSuperAdmin()
    end
})
