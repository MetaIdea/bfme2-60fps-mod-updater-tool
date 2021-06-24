INIValueChangeTable = { --Filename, Valuename, NewValue
	{[[EXTRACTED-MOD/data/ini/gamedata.ini]],
		{"UseFPSLimit","No"},
		{"FramesPerSecondLimit",FPS}
	}
} 

GameSlowDownObjectSingleValueContainer = {  
	{{[[]]},{
			{TIMEFACTOR_, "AnimationBlendTime"},
			{SPEEDFACTOR_, "LocomotorSet","Speed" },
			{TIMEFACTOR_, "Delay" },
			{TIMEFACTOR_, "Time" },
			--{SPEEDFACTOR_, "Rate" },
			{SPEEDFACTOR_, "Interval" },
			{SPEEDFACTOR_, "Duration" }
		}
	}
}

GameSlowDownMultiObjectValueContainer = { --for multiple values per line
	{{[[]]},{
			{SPEEDFACTOR_, "AnimationSpeedFactorRange" }
		}
	}
} --"fxlist.ini" und fxparticlesystem.ini beide "InitialDelay"  

StandardValueScaleContainer =
{
	{SPEEDFACTOR_, "Speed"},
	{SPEEDFACTOR_, "speed"},
	{SPEEDFACTOR_, "SPEED"},
	{TIMEFACTOR_, "Time"},
	{TIMEFACTOR_, "time"},
	{TIMEFACTOR_, "TIME"},
	{TIMEFACTOR_, "Delay"},
	{TIMEFACTOR_, "delay"},
	{TIMEFACTOR_, "DELAY"},
	{TIMEFACTOR_, "Duration"},
	{TIMEFACTOR_, "DURATION"},
	{TIMEFACTOR_, "duration"},
	{TIMEFACTOR_, "Interval"},
	{TIMEFACTOR_, "INTERVAL"},
	{TIMEFACTOR_, "interval"}
	--{SPEEDFACTOR_, "Rate" },
	--{SPEEDFACTOR_, "RATE" },
	--{SPEEDFACTOR_, "rate" },
	--{SPEEDFACTOR_, "frequency" },
}

GameSlowDownValueContainerAll = {
	{{[[EXTRACTED-MOD/data/ini/gamedata.ini]]},
		{
			--{TIMEFACTOR_,"FramesPerSecondLimit"},		
			{TIMEFACTOR_,"#define", "_DURATION"},
			{TIMEFACTOR_,"#define", "BUILDTIME"},
			{"*1","LVL2_BUILD_SPEED"}, --factor for base time not absolute value
			{"*1","LVL3_BUILD_SPEED"},
			{"*2","BUILD_SPEED"},
			{SPEEDFACTOR_,"#define","_SPEED"},
			{TIMEFACTOR_,"#define", "_TIME"},
			{TIMEFACTOR_,"OutTime"},
			{TIMEFACTOR_,"InTime"},
			{TIMEFACTOR_,"ReinvisibityDelay"},
			{TIMEFACTOR_,"BaseRegenDelay"},
			{TIMEFACTOR_,"HEALDELAY"},
			{TIMEFACTOR_,"EXIT_DELAY"},
			{TIMEFACTOR_,"REGEN_DELAY"},
			{TIMEFACTOR_,"CREATE_DELAY"},
			{TIMEFACTOR_,"EXIT_DELAY"},
			{TIMEFACTOR_,"PREATTACKDELAY"},
			{TIMEFACTOR_,"RELOADTIME_MIN"},
			{TIMEFACTOR_,"RELOADTIME_MAX"},
			{TIMEFACTOR_,"RELOADTIME"},
			{TIMEFACTOR_,"FIRINGDURATION"},
			{TIMEFACTOR_,"DELAYBETWEENSHOTS"}
			--{TIMEFACTOR_,"MinLowEnergyProductionSpeed"},
			--{TIMEFACTOR_,"_BURNRATE"},
			--{TIMEFACTOR_,"_DECAY"},
			--{TIMEFACTOR_,"NumMinutesBeforePlayersCanTransferMoney"},
			--{TIMEFACTOR_,"MaxPathfindCellsPerFrame"},
			--{TIMEFACTOR_,"TerrainLODTargetTimeMS"},
			--{TIMEFACTOR_,"SPEEDFACTOR_"}
		}
	},
	{{[[EXTRACTED-MOD/data/ini/specialpower.ini]]},
		{
			{TIMEFACTOR_, "ReloadTime"}
		}
	},
	{{[[EXTRACTED-MOD/data/ini/createaherospecialpowers.ini]]},
		{
			{TIMEFACTOR_, "ReloadTime"}
		}
	},
	{{[[EXTRACTED-MOD/data/ini/attributemodifier.ini]]},
		{{TIMEFACTOR_, "Duration"}}
	},
	{{[[EXTRACTED-MOD/data/ini/weapon.ini]]},
		{
			{TIMEFACTOR_, "DelayTime"},
			{TIMEFACTOR_, "DelayBetweenShots"},
			{TIMEFACTOR_, "PreAttackDelay"},
			{TIMEFACTOR_, "FiringDuration"},
			{TIMEFACTOR_, "ClipReloadTime"},
			{SPEEDFACTOR_, "WeaponSpeed"},
			{SPEEDFACTOR_, "MinWeaponSpeed"},
			{SPEEDFACTOR_, "MaxWeaponSpeed"}
		}
	},
	--ClipReloadTime = Min:1 Max:1
	{{[[EXTRACTED-MOD/data/ini/upgrade.ini]]},
		{
			{TIMEFACTOR_, "BuildTime"}
		}
	},
	{{[[EXTRACTED-MOD/data/ini/objectcreationlist.ini]]},
		{
			{TIMEFACTOR_, "FadeTime"},
			{TIMEFACTOR_, "JustBuiltDuration"},
			{TIMEFACTOR_, "StartingBusyTime"},
			{TIMEFACTOR_, "InvulnerableTime"},
			{SPEEDFACTOR_, "Speed"},
			{SPEEDFACTOR_, "speed"},
			{SPEEDFACTOR_, "SPEED"},
			{TIMEFACTOR_, "Time"},
			{TIMEFACTOR_, "time"},
			{TIMEFACTOR_, "TIME"},
			{TIMEFACTOR_, "Delay"},
			{TIMEFACTOR_, "delay"},
			{TIMEFACTOR_, "DELAY"},
			{TIMEFACTOR_, "Duration"},
			{TIMEFACTOR_, "DURATION"},
			{TIMEFACTOR_, "duration"},
			{TIMEFACTOR_, "Intervall"},
			{TIMEFACTOR_, "INTERVALL"},
			{TIMEFACTOR_, "intervall"}
		}
	},
	{{[[EXTRACTED-MOD/data/ini/locomotor.ini]]},
		{
			{SPEEDFACTOR_, "Speed"},
			{TIMEFACTOR_,  "Time"},
			{"*1", "ForwardAccelerationPitchFactor"},  --to protect it from getting changed
			{"*1", "AccelerationPitchLimit"},
			{"*1", "LateralAccelerationRollFactor"},
			{SPEEDFACTOR_, "Acceleration"},
			{SPEEDFACTOR_, "Braking"},		
			{SPEEDFACTOR_, "Velocity"},
			{SPEEDFACTOR_, "Lift"},
			{TIMEFACTOR_, "Rate"}
		}
	},
	{{[[EXTRACTED-MOD/data/ini/fxparticlesystem.ini]]},
		{
			{TIMEFACTOR_, "Lifetime"},
			{SPEEDFACTOR_, "Speed"},
			{SPEEDFACTOR_, "speed"},
			{TIMEFACTOR_, "Time"},
			{TIMEFACTOR_, "time"},
			--{"*1", "InitialDelay"},
			{TIMEFACTOR_, "Delay"},
			{TIMEFACTOR_, "delay"}
		}
	},
	--BurstDelay = TIMEFACTOR0 TIMEFACTOR0
	{{[[EXTRACTED-MOD/data/ini/fxlist.ini]]},
		{
			{TIMEFACTOR_, "Lifetime"},
			{SPEEDFACTOR_, "Speed"},
			{SPEEDFACTOR_, "speed"},
			{TIMEFACTOR_, "Time"},
			{TIMEFACTOR_, "time"},
			--{"*1", "InitialDelay"},
			{TIMEFACTOR_, "Delay"},
			{TIMEFACTOR_, "delay"}
		}
	},
	{{[[EXTRACTED-MOD/data/ini/eva.ini]]}, StandardValueScaleContainer },
	{{[[EXTRACTED-MOD/data/ini/ingameui.ini]]}, StandardValueScaleContainer },
	{{[[EXTRACTED-MOD/data/ini/emotions.ini]]}, StandardValueScaleContainer },
	{{[[EXTRACTED-MOD/data/ini/damagefx.ini]]}, StandardValueScaleContainer },
	{{[[EXTRACTED-MOD/data/ini/crate.ini]]}, StandardValueScaleContainer },
	{{[[EXTRACTED-MOD/data/ini/animation2d.ini]]}, StandardValueScaleContainer },
	{{[[EXTRACTED-MOD/data/ini/weather.ini]]}, StandardValueScaleContainer },
	{{[[EXTRACTED-MOD/data/ini/createaherogamedata.inc]]}, StandardValueScaleContainer }
}

AddCodeContainer = {
{[[EXTRACTED-MOD/data/ini/object/createahero/createahero.ini]], "\n" .. [[//]]},
{[[EXTRACTED-MOD/data/ini/upgrade.ini]], "\n" .. [[//]]},
{[[EXTRACTED-MOD/data/scripts/scripts.lua]],
[[
---------------------------------------------------------------------------------------------------------------
-----------------------------------------CUSTOM CODE SECTION---------------------------------------------------
---------------------------------------------------------------------------------------------------------------

FPS = 60

function GenericCrateSpawner(self)
	PreloadLUAScript()
end

function PreloadLUAScript()
	if rename("scripts.lua","scripts.lua") then 
		dofile("scripts.lua") 
		ExecuteAction("DISPLAY_TEXT", "MESSAGE:ExternalLUAScriptsLoaded")
	end
end

SuperweaponPreventer_Init = false

function NoSuperweaponsOption(self)
	if not SuperweaponPreventer_Init then
		SuperweaponPreventer_Init = true
		SuperweaponsBuildability("NO")
		SpawnSuperweaponPreventerDummy(self)
	end
end

function SuperweaponsBuildability(what)
	local BUILDABILITY_TYPE = {["YES"]=0, ["IGNORE_PREREQUISITES"]=1, ["NO"]=2, ["ONLY_BY_AI"]=3}	
	local SuperweaponObjectList = {}	
	for i=1,getn(SuperweaponObjectList),1 do
		ExecuteAction("TECHTREE_MODIFY_BUILDABILITY_OBJECT", SuperweaponObjectList[i], BUILDABILITY_TYPE[what])
	end
end

function SpawnSuperweaponPreventerDummy(self)
	for i=1,8,1 do
		ExecuteAction("CREATE_UNNAMED_ON_TEAM_AT_WAYPOINT", "SuperweaponPreventerDummy", "Player_" .. tostring(i) .. "/teamPlayer_" .. tostring(i), "Player_" .. tostring(i) .. "_Start")
		ExecuteAction("CREATE_UNNAMED_ON_TEAM_AT_WAYPOINT", "SuperweaponPreventerDummy", "Player_" .. tostring(i) .. "/defaultSkirmishTeamPlayer_" .. tostring(i), "Player_" .. tostring(i) .. "_Start")
		--ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", "SuperweaponPreventerDummy_" .. i, "SuperweaponPreventerDummy", "Player_" .. i .. "/teamPlayer_" .. i, "((0.00,0.00,0.00))", 0)
	end
end

function GetValidTeamList()
	local TeamList={
	"Player_1/teamPlayer_1",
	"Player_2/teamPlayer_2",
	"Player_3/teamPlayer_3",
	"Player_4/teamPlayer_4",
	"Player_5/teamPlayer_5",
	"Player_6/teamPlayer_6",
	"Player_7/teamPlayer_7",
	"Player_8/teamPlayer_8",
	"Player_1/defaultSkirmishTeamPlayer_1",
	"Player_2/defaultSkirmishTeamPlayer_2",
	"Player_3/defaultSkirmishTeamPlayer_3",
	"Player_4/defaultSkirmishTeamPlayer_4",
	"Player_5/defaultSkirmishTeamPlayer_5",
	"Player_6/defaultSkirmishTeamPlayer_6",
	"Player_7/defaultSkirmishTeamPlayer_7",
	"Player_8/defaultSkirmishTeamPlayer_8",
	--"/team", --NeutralTeam
	--"PlyrCivilian/teamPlyrCivilian",
	--"PlyrCreeps/teamPlyrCreeps",
	--"ReplayObserver/teamReplayObserver",
	}	
	local ValidTeamList = {}
	for i=1,getn(TeamList),1 do
		local TempUnitRef = "UNITREF_" .. tostring(GetRandomNumber())
		ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", TempUnitRef, "GDIHarvester", TeamList[i], "((0.00,0.00,0.00))", 0)
		if EvaluateCondition("NAMED_NOT_DESTROYED", TempUnitRef) then tinsert(ValidTeamList, TeamList[i]) end --EvaluateCondition("TEAM_DESTROYED", TeamList[i])
		ExecuteAction("NAMED_DELETE", TempUnitRef)
	end
	return ValidTeamList
end

SlowDownGame50PercentDummy_SpawnState = false

function SpawnSlowDownGame50PercentDummy(self)
	if not SlowDownGame50PercentDummy_SpawnState then
		SlowDownGame50PercentDummy_SpawnState = true
		--ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", "UNITREF_SlowDownGame50PercentDummy", "SlowDownGame50PercentDummy", "/team", "((0.00,0.00,0.00))", 0)
		ExecuteAction("MAP_CHANGE_CLOUD_SPEED", 100 * 30/FPS)
		ExecuteAction("SET_FPS_LIMIT", FPS)   --to limit fps in windowd mode
		--ExecuteAction("TEAM_EXECUTE_SEQUENTIAL_SCRIPT_LOOPING", "/team", "FPS_SCRIPT", 1)
	end
end
  
function HandleFPSAndGameSpeed() --unused, doesn't work
	local CUSTOM_FPS=60
	local NORMAL_FPS=30
	ExecuteAction("SET_FPS_LIMIT", CUSTOM_FPS)
	ExecuteAction("SET_VISUAL_SPEED_MULTIPLIER", NORMAL_FPS/CUSTOM_FPS)
	ExecuteAction("CAMERA_MOD_SET_FINAL_SPEED_MULTIPLIER", 0.5)
	ExecuteAction("MAP_CHANGE_CLOUD_SPEED", 50)
	ExecuteAction("ENABLE_SCRIPT", "FPS_SCRIPT")
	ExecuteAction("TEAM_EXECUTE_SEQUENTIAL_SCRIPT_LOOPING", "/team", "FPS_SCRIPT", 1)  --is working, uses a map script from a library map
end

---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------	
]]},
{[[EXTRACTED-MOD/data/ini/weapon.ini]],
[[
//60FPS MOD RELATED
Weapon SlowDownGame50PercentWeapon
	RadiusDamageAffects = ENEMIES ALLIES NEUTRALS
	;WeaponSpeed			= 99999.0
	;DelayBetweenShots   = 0;	
	;PreAttackType       = PER_SHOT
	;PreAttackDelay      = 0 ; time from start of anim to axe release
	;FiringDuration      = 1000 ; duration of firing cycle
	AttackRange 		= 500000
	AttributeModifierNugget
		AttributeModifier   = AttributeModifier_SlowDownGame50Percent
		Radius			 	= 500000
		SpecialObjectFilter = ALL
		;+INFANTRY +STRUCTURE +CAVALRY +MONSTER
		;AffectHordeMembers  = Yes
	End
End
]]},
{
[[EXTRACTED-MOD/data/ini/attributemodifier.ini]],
[[
//60FPS MOD RELATED - artificial game speed slow down -old unused
ModifierList AttributeModifier_SlowDownGame50Percent
	Category = DEBUFF
	//StackingLimit = 1
	ReplaceInCategoryIfLongest	= No
	IgnoreIfAnticategoryActive	= No
	Modifier = PRODUCTION 50%
	Modifier = SPEED 50%
	Modifier = RATE_OF_FIRE 50%
	Modifier = RECHARGE_TIME 200%
	Modifier = AUTO_HEAL 50%
	;Modifier = MIN_CRUSH_VELOCITY_PERCENTAGE 50%
	Duration = 10000.0
End
]]
}
}

AddNewFilesContainer = {
{[[EXTRACTED-MOD/data/ini/object/SlowDownDummy.ini]],
[[
Object SlowDownGame50PercentDummy_SpawnDelayer
Body = ImmortalBody ModuleTag_01
		MaxHealth = 9999999
	End
	EditorSorting = SYSTEM
	Side = Neutral
	KindOf = UNATTACKABLE NO_COLLIDE IGNORE_FOR_VICTORY IGNORED_IN_GUI
	Behavior = LifetimeUpdate ModuleTag_04
		MinLifetime = 0.4        ; min lifetime in msec
		MaxLifetime = 0.4        ; max lifetime in msec
	End
	Behavior = AIUpdateInterface ModuleTag_AI
		AILuaEventsList				= SlowDownGame50PercentDummy_SpawnDelayerEvent
		AutoAcquireEnemiesWhenIdle	= No
		;MoodAttackCheckRate			= 250
	End
End

Object SlowDownGame50PercentDummy
	Body = ActiveBody ModuleTag_01
		MaxHealth = 999999
	End
	EditorSorting = SYSTEM
	Side = Neutral
	KindOf = UNATTACKABLE NO_COLLIDE IGNORE_FOR_VICTORY IGNORED_IN_GUI
	;IMMOBILE INERT
	
	Behavior = FireWeaponUpdate FireWeaponUpdateModuleTag
		FireWeaponNugget
			WeaponName = SlowDownGame50PercentWeapon
			FireDelay = 0
			OneShot = No
		End
	End
	
	; Behavior = AttributeModifierAuraUpdate ModuleTag_AttributeModifier
		; StartsActive        = Yes
		; BonusName           = AttributeModifier_SlowDownGame50Percent
		; RefreshDelay        = 1000
		; Range               = 50000
		; ObjectFilter        = ALL
		; ;ObjectFilter    = ANY +CAVALRY +INFANTRY +HORDE +HERO -DOZER ; -HERO -DOZER -HERO ; 
		; TargetEnemy         = Yes
		; AntiCategory        = BUFF
		; RunWhileDead        = Yes
		; AllowSelf           = Yes
		; AffectContainedOnly = No
	; End
	
	; Behavior = SpecialPowerModule ModuleTag_SpecialPowerAttributeModifier
		; SpecialPowerTemplate      	= SpecialAbilityWargHowl
		; UpdateModuleStartsAttack  	= No
		; StartsPaused				= No
		; AttributeModifier 			= AttributeModifier_SlowDownGame50Percent
		; AttributeModifierRange 		= 50000
		; AttributeModifierAffectsSelf 	= Yes
		; AttributeModifierAffects 	= ALL
		; AttributeModifierFX 		= FX_WargHowl
	; End
	
	Behavior = AIUpdateInterface ModuleTag_AI
		AutoAcquireEnemiesWhenIdle	= No
	End
End	
]]}
}

LuaSciptEvents = 
[[
	<EventList Name="SlowDownGame50PercentDummy_SpawnDelayerEvent">
		<EventHandler EventName="OnCreated"	ScriptFunctionName="SpawnSlowDownGame50PercentDummy" DebugSingleStep="false"/>
	</EventList>	
]]

AddLineContainer = {  --file, preceding key word in line prior, new line
{[[EXTRACTED-MOD/data/ini/playertemplate.ini]],{"StartingBuilding"}, "    StartingUnit2     			= SlowDownGame50PercentDummy_SpawnDelayer"}
}
