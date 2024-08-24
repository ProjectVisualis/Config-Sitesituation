ix.sitesituation.Register("Defcon",5,function(valeur)
    if SERVER then 
        -- notify all player
        for k,v in pairs(player.GetAll()) do
            if (valeur) then
                v:Notify("DEFCON "..valeur.." !")
                end        
            end
        return
    end
    ix.sounds.PlayAt("sound/project_visualis/intercom/defcon/defcon"..valeur,"facility")
end)


ix.command.Add("SetDefcon",{
    arguments = {ix.type.number},
    OnRun = function(self,client,defcon)
        if defcon < 0 or defcon > 5 then
            return "@invalidArg",1,"5"
        end
        if defcon == 0 && !client:IsSuperAdmin() then
            return "@notSuperAdmin"
        end
        ix.sitesituation.SetDefcon(defcon)
        return "@cmdSetDefconSet",nil,defcon
    end,
    description = "@cmdSetDefcon",
    OnCheckAccess = function(self,client)
        return (client:GetCharacter():GetFaction() == FACTION_SECURITY && client:GetCharacter():GetRank() > 10) or client:IsSuperAdmin()
    end
})