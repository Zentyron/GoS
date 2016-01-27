if Ignite then
    if IsReady(Ignite) then
       for _,enemy in pairs(GetEnemyHeroes()) do
           if 20*GetLevel(myHero)+50 > GetHP(enemy)+GetHPRegen(enemy)*3 and ValidTarget(enemy, 600) then
                CastTargetSpell(enemy, Ignite)
           end
       end
    end
end
