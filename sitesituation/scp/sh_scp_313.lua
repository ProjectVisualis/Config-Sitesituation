ix.sitesituation.Register("SCP313",3,function(valeur)
    if SERVER then 
        return
    end
    -- ix.sounds.PlayAt("sound/project_visualis/intercom/defcon/defcon"..valeur,"facility")
end)


ix.command.Add("SetSit313",{ 
    arguments = {ix.type.number},
    OnRun = function(self,client,sit)
        if sit < 1 or sit > 5 then
            return "@invalidArg",1,"3"
        end
        ix.sitesituation.SetSCP313(sit)
        return "@Situation313Changed",nil,sit
    end,
    description = "@Changer la situation de 313",
    OnCheckAccess = function(self,client)
        return client:IsSuperAdmin()
    end
})
