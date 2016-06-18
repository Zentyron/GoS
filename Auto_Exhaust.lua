OnLoad(function()
   AutoExhaust = MenuConfig("AutoExhaust", "Auto Exhaust")
	AutoExhaust:Menu("d", "Settings")
		AutoExhaust.d:Boolean("On", "Enable Auto Exhaust", true)
		AutoExhaust.d:Boolean("Only", "Only if enemies > allies", false)
		AutoExhaust.d:Slider("PercentAlly", "Minimum Ally HP %", 15, 1, 100)
		AutoExhaust.d:Slider("PercentEnemy", "Minimum Enemy HP %", 15, 1, 100)

    if GetCastName(myHero, SUMMONER_1):lower():find("summonerexhaust") then
      Exhaust = SUMMONER_1
    elseif GetCastName(myHero, SUMMONER_2):lower():find("summonerexhaust") then
      Exhaust = SUMMONER_2
    end    
end)

OnTick(function()
	for _, ally in pairs(GetAllyHeroes()) do
	for _, enemy in pairs(GetEnemyHeroes()) do
	if AutoExhaust.d.On:Value() and Exhaust then
		if AutoExhaust.d.Only:Value() then
			if EnemiesAround(ally, 1000) > AlliesAround(ally, 1000) then
				if AutoExhaust.d.PercentAlly:Value() <= GetPercentHP(ally) and AutoExhaust.d.PercentEnemy:Value() <= GetPercentHP(enemy) then
					if IsReady(Exhaust) then
						CastTargetSpell(enemy, Exhaust)
					end
				end
			end
		else
			if AutoExhaust.d.PercentAlly:Value() <= GetPercentHP(ally) and AutoExhaust.d.PercentEnemy:Value() <= GetPercentHP(enemy) then
				if IsReady(Exhaust) then
					CastTargetSpell(enemy, Exhaust)
				end
			end
		end
	end
	end
	end
end)	    
