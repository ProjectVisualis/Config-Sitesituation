ix.sitesituation.Register("SCP268",3,function(valeur)
    if SERVER then 
        return
    end
    -- ix.sounds.PlayAt("sound/project_visualis/intercom/defcon/defcon"..valeur,"facility")
end)


ix.command.Add("SetSit268",{ 
    arguments = {ix.type.number},
    OnRun = function(self,client,sit)
        if sit < 1 or sit > 5 then
            return "@invalidArg",1,"3"
        end
        ix.sitesituation.SetSCP268(sit)
        return "@Situation268Changed",nil,sit
    end,
    description = "@Changer la situation de 268",
    OnCheckAccess = function(self,client)
        return client:IsSuperAdmin()
    end
})
