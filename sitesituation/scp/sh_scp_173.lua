ix.sitesituation.Register("SCP173",2,function(valeur)
    if SERVER then 
        return
    end
    -- ix.sounds.PlayAt("sound/project_visualis/intercom/defcon/defcon"..valeur,"facility")
end)


ix.command.Add("SetSit173",{
    arguments = {ix.type.number},
    OnRun = function(self,client,sit)
        if sit < 1 or sit > 5 then
            return "@invalidArg",1,"2"
        end
        ix.sitesituation.SetSCP173(sit)
        return "@Situation173Changed",nil,sit
    end,
    description = "@Changer la situation de 173",
    OnCheckAccess = function(self,client)
        return client:IsSuperAdmin()
    end
})
