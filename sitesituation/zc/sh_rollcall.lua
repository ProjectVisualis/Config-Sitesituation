ix.sitesituation.Register("ZCRollCall",false,function(valeur)
    if SERVER then 
        if valeur then
            for k,v in pairs(player.GetAll()) do
                if v:Team() == FACTION_SECURITY or v:Team() == FACTION_CLASSD then
                    v:Notify("ZCRollCall")
                end
            end
            timer.Simple(150,function()
                ix.sitesituation.SetZCRollCall(false)
            end)
        end
        return 
    end
    if valeur then
        ix.sounds.PlayAt("sound/project_visualis/intercom/zc/appel","ZC")
    end
end)
ix.command.Add("DoRollCall", {
    OnRun = function(self,client)
        ix.sitesituation.SetZCRollCall(true)
        return "@cmdDoRollCall"
    end,
    description = "@cmdDoRollCall",
    OnCheckAccess = function(self,client)
        return client:IsSuperAdmin() or ( client:GetCharacter():GetFaction() == FACTION_SECURITY and client:GetCharacter():GetRank() > 4)
    end
})