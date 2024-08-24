ix.sitesituation.Register("SCP682",5,function(valeur)
    if SERVER then 
        return
    end
    -- ix.sounds.PlayAt("sound/project_visualis/intercom/defcon/defcon"..valeur,"facility")
end)


ix.command.Add("SetSit682",{
    arguments = {ix.type.number},
    OnRun = function(self,client,sit)
        if sit < 1 or sit > 5 then
            return "@invalidArg",1,"5"
        end
        ix.sitesituation.SetSCP682(sit)
        return "@Situation682Changed",nil,sit
    end,
    description = "@Changer la situation de 682",
    OnCheckAccess = function(self,client)
        return client:IsSuperAdmin()
    end
})
