ix.sitesituation.Register("SCP1048",2,function(valeur)
    if SERVER then 
        return
    end
    -- ix.sounds.PlayAt("sound/project_visualis/intercom/defcon/defcon"..valeur,"facility")
end)


ix.command.Add("SetSit1048",{
    arguments = {ix.type.number},
    OnRun = function(self,client,sit)
        if sit < 1 or sit > 6 then
            return "@invalidArg",1,"5"
        end
        ix.sitesituation.SetSCP1048(sit)
        return "@Situation1048Changed",nil,sit
    end,
    description = "@Changer la situation de 1048",
    OnCheckAccess = function(self,client)
        return client:IsSuperAdmin()
    end
})
