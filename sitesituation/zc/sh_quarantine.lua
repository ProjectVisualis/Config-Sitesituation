ix.sitesituation.Register("QuarantaineZC",false,function(valeur)
    if SERVER then 
        if valeur then
            for k,v in pairs(player.GetAll()) do
                ix.util.Notify("Quarantaine ZC", v)
            end
        else
            for k,v in pairs(player.GetAll()) do
                ix.util.Notify("Quarantaine ZC end", v)
            end
        end
        return
    end
    if valeur then
        ix.sounds.PlayAt("sound/project_visualis/intercom/zc/quarantaine","ZC")
    else
        ix.sounds.PlayAt("sound/project_visualis/intercom/zc/quarantaine_fin","ZC")
    end
end)
ix.command.Add("QuarantaineZC", {
    OnRun = function(self,client)        
        ix.sitesituation.SetQuarantaineZC(!ix.sitesituation.GetQuarantaineZC())
        ix.log.Add(client,"QuarantaineZC",!ix.sitesituation.GetQuarantaineZC())
        return "@cmdQuarantaineZC"
    end,
    description = "@cmdQuarantaineZC",
    OnCheckAccess = function(self,client)
        return client:IsSuperAdmin() or ( client:GetCharacter():GetFaction() == FACTION_SECURITY and client:GetCharacter():GetRank() > 7)
    end
})