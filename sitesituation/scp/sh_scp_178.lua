ix.sitesituation.Register("SCP178",2,function(valeur)
    if SERVER then 
        return
    end
    -- ix.sounds.PlayAt("sound/project_visualis/intercom/defcon/defcon"..valeur,"facility")
end)


ix.command.Add("SetSit178",{
    arguments = {ix.type.number},
    OnRun = function(self,client,sit)
        if sit < 1 or sit > 5 then
            return "@invalidArg",1,"2"
        end
        ix.sitesituation.SetSCP178(sit)
        return "@Situation178Changed",nil,sit
    end,
    description = "@Changer la situation de 178",
    OnCheckAccess = function(self,client)
        return client:IsSuperAdmin()
    end
})
