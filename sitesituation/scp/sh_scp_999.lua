ix.sitesituation.Register("SCP999",2,function(valeur)
    if SERVER then 
        return
    end
    -- ix.sounds.PlayAt("sound/project_visualis/intercom/defcon/defcon"..valeur,"facility")
end)


ix.command.Add("SetSit999",{
    arguments = {ix.type.number},
    OnRun = function(self,client,sit)
        if sit < 1 or sit > 6 then
            return "@invalidArg",1,"5"
        end
        ix.sitesituation.SetSCP999(sit)
        return "@Situation999Changed",nil,sit
    end,
    description = "@Changer la situation de 999",
    OnCheckAccess = function(self,client)
        return client:IsSuperAdmin()
    end
})
