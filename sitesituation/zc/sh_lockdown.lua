ix.sitesituation.Register("LockdownZC",false,function(valeur)
    if SERVER then 
        if valeur then
            for k,v in pairs(player.GetAll()) do
                ix.util.Notify("Lockdown ZC", v)
            end
        else
            for k,v in pairs(player.GetAll()) do
                ix.util.Notify("Lockdown ZC end", v)
            end
        end
        return
    end
    if valeur then
        ix.sounds.PlayAt("sound/project_visualis/intercom/zc/verrouillage_1min","ZC")
        timer.Simple(60, function()
            timer.Create("LockdownZC",30,0,function()
                if ix.sitesituation.GetLockdownZC() then
                    ix.sounds.PlayAt("sound/project_visualis/intercom/zc/verrouillage_continue","ZC")
                else
                    ix.sounds.PlayAt("sound/project_visualis/intercom/zc/verrouillage_fin","ZC")
                    timer.Remove("LockdownZC")
                end
            end)
        end)
    end
end)
ix.command.Add("LockdownZC", {
    OnRun = function(self,client)
        ix.sitesituation.SetLockdownZC(!ix.sitesituation.GetLockdownZC())
        return "@cmdLockdownZC"
    end,
    description = "@cmdLockdownZC",
    OnCheckAccess = function(self,client)
        return client:IsSuperAdmin() or ( client:GetCharacter():GetFaction() == FACTION_SECURITY and client:GetCharacter():GetRank() > 5)
    end
})