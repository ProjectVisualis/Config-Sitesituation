ix.sitesituation.Register("SCP1346",3,function(valeur)
    if SERVER then 
        return
    end
    -- ix.sounds.PlayAt("sound/project_visualis/intercom/defcon/defcon"..valeur,"facility")
end)


ix.command.Add("SetSit1346",{
    arguments = {ix.type.number},
    OnRun = function(self,client,sit)
        if sit < 1 or sit > 5 then
            return "@invalidArg",1,"3"
        end
        ix.sitesituation.SetSCP1346(sit)
        return "@Situation1346Changed",nil,sit
    end,
    description = "@Changer la situation de 1346",
    OnCheckAccess = function(self,client)
        return client:IsSuperAdmin()
    end
})
