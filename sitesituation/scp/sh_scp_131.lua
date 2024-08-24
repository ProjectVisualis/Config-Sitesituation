ix.sitesituation.Register("SCP131",2,function(valeur)
    if SERVER then 
        return
    end
    -- ix.sounds.PlayAt("sound/project_visualis/intercom/defcon/defcon"..valeur,"facility")
end)


ix.command.Add("SetSit131",{
    arguments = {ix.type.number},
    OnRun = function(self,client,sit)
        if sit < 1 or sit > 6 then
            return "@invalidArg",1,"5"
        end
        ix.sitesituation.SetSCP131(sit)
        return "@Situation131Changed",nil,sit
    end,
    description = "@Changer la situation de 131",
    OnCheckAccess = function(self,client)
        return client:IsSuperAdmin()
    end
})
