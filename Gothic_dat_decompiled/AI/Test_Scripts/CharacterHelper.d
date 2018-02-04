
instance ch(Npc_Default)
{
	name[0] = "CharacterHelper";
	npcType = npctype_main;
	guild = GIL_None;
	level = 10;
	voice = 15;
	id = 0;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,-1);
	start_aistate = ZS_CH_Hangaround;
};


func void ZS_CH_Hangaround()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_CH_Hangaround");
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_AssessSC);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
};

func void ZS_CH_Hangaround_Loop()
{
	PrintDebugNpc(PD_ZS_LOOP,"ZS_CH_Hangaround_Loop");
};

func void ZS_CH_Hangaround_End()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_CH_Hangaround_End");
};

func void B_SetHeroExp()
{
	var string Attributes;
	hero.exp = 250 * (hero.level + 1) * hero.level;
	hero.exp_next = 250 * (hero.level + 2) * (hero.level + 1);
	hero.lp = hero.level * LP_PER_LEVEL;
	Attributes = "Level Up: Lernpunkte:";
	Attributes = ConcatStrings(Attributes,IntToString(hero.lp));
	Attributes = ConcatStrings(Attributes,"Hitpoints:");
	Attributes = ConcatStrings(Attributes,IntToString(hero.attribute[ATR_HITPOINTS_MAX]));
	PrintScreen(Attributes,-1,-1,"font_old_20_white.tga",3);
	Snd_Play("LEVELUP");
};

func void B_SetHeroEquipment()
{
	PrintDebugNpc(PD_ZS_Check,"B_SetHeroEquipment");
	CreateInvItems(hero,ItAmArrow,100);
	CreateInvItems(hero,ItAmBolt,100);
	CreateInvItems(hero,ItLsTorch,30);
	CreateInvItems(hero,ItMiNugget,1000);
	CreateInvItems(hero,ItFo_Potion_Health_03,10);
	CreateInvItems(hero,ItFo_Potion_Mana_03,10);
	CreateInvItems(hero,ItKeLockpick,30);
	CreateInvItems(hero,ItWrWorldmap,1);
};

func void B_SetHeroAttributes(var int selection,var int increase,var int LP_Cost)
{
	var string Attributes;
	if(hero.lp >= LP_Cost)
	{
		hero.lp = hero.lp - LP_Cost;
		Npc_ChangeAttribute(hero,selection,increase);
		Attributes = "Lernpunkte:";
		Attributes = ConcatStrings(Attributes,IntToString(hero.lp));
		Attributes = ConcatStrings(Attributes,"Str:");
		Attributes = ConcatStrings(Attributes,IntToString(hero.attribute[ATR_STRENGTH]));
		Attributes = ConcatStrings(Attributes,"Dex:");
		Attributes = ConcatStrings(Attributes,IntToString(hero.attribute[ATR_DEXTERITY]));
		Attributes = ConcatStrings(Attributes,"Mana:");
		Attributes = ConcatStrings(Attributes,IntToString(hero.attribute[ATR_MANA_MAX]));
		PrintScreen(Attributes,-1,-1,"font_old_20_white.tga",3);
	}
	else
	{
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void B_SetHeroWeapon()
{
	if(hero.level <= 5)
	{
		CreateInvItem(hero,ItMw_1H_Mace_02);
		CreateInvItem(hero,ItRw_Bow_Small_04);
		PrintScreen("n�tig STR 11  DEX 16",-1,-1,"font_old_20_white.tga",10);
	}
	else if(hero.level <= 10)
	{
		CreateInvItem(hero,ItMw_1H_Sword_Long_01);
		CreateInvItem(hero,ItRw_Bow_Long_02);
		PrintScreen("n�tig STR 17  DEX 22",-1,-1,"font_old_20_white.tga",10);
	}
	else if(hero.level <= 15)
	{
		CreateInvItem(hero,ItMw_1H_Sword_Broad_01);
		CreateInvItem(hero,ItRw_Bow_Long_05);
		PrintScreen("n�tig: STR 26  DEX 28",-1,-1,"font_old_20_white.tga",10);
	}
	else if(hero.level <= 20)
	{
		CreateInvItem(hero,ItMw_2H_Sword_Light_01);
		CreateInvItem(hero,ItMw_1H_Sword_Broad_04);
		CreateInvItem(hero,ItRw_Bow_Long_08);
		PrintScreen("n�tig STR 52  DEX 34",-1,-1,"font_old_20_white.tga",10);
	}
	else if(hero.level <= 25)
	{
		CreateInvItem(hero,ItMw_2H_Sword_03);
		CreateInvItem(hero,ItMw_1H_Sword_Broad_04);
		CreateInvItem(hero,ItRw_Bow_War_02);
		PrintScreen("n�tig STR 62  DEX 40",-1,-1,"font_old_20_white.tga",10);
	}
	else if(hero.level <= 30)
	{
		CreateInvItem(hero,ItMw_2H_Axe_Heavy_04);
		CreateInvItem(hero,ItMw_1H_Sword_Broad_04);
		CreateInvItem(hero,ItRw_Bow_War_05);
		PrintScreen("n�tig STR 78  DEX 50",-1,-1,"font_old_20_white.tga",10);
	};
	AI_EquipBestMeleeWeapon(hero);
	AI_EquipBestRangedWeapon(hero);
	B_SetHeroEquipment();
};


instance CH_Exit(C_Info)
{
	npc = ch;
	nr = 999;
	condition = CH_Exit_Condition;
	information = CH_Exit_Info;
	important = 0;
	permanent = 1;
	description = "ENDE";
};


func int CH_Exit_Condition()
{
	return 1;
};

func void CH_Exit_Info()
{
	AI_StopProcessInfos(self);
};

func void CH_Level_BACK()
{
	Info_ClearChoices(CH_Level);
};


instance CH_Level(C_Info)
{
	npc = ch;
	condition = CH_Level_Condition;
	information = CH_Level_Info;
	important = 0;
	permanent = 1;
	description = "Gib mir Level!";
};


func int CH_Level_Condition()
{
	if(hero.level == 0)
	{
		return TRUE;
	};
};

func void CH_Level_Info()
{
	Info_ClearChoices(CH_Level);
	Info_AddChoice(CH_Level,"BACK",CH_Level_BACK);
	Info_AddChoice(CH_Level,"Level  1 -  5",CH_Level1);
	Info_AddChoice(CH_Level,"Level  6 - 10",CH_Level6);
	Info_AddChoice(CH_Level,"Level 11 - 15",CH_Level11);
	Info_AddChoice(CH_Level,"Level 16 - 20",CH_Level16);
	Info_AddChoice(CH_Level,"Level 21 - 25",CH_Level21);
	Info_AddChoice(CH_Level,"Level 26 - 30",CH_Level26);
};

func void CH_Level26()
{
	Info_ClearChoices(CH_Level);
	Info_AddChoice(CH_Level,"BACK",CH_Level_BACK);
	Info_AddChoice(CH_Level,"Level 26",CH_Level_26);
	Info_AddChoice(CH_Level,"Level 27",CH_Level_27);
	Info_AddChoice(CH_Level,"Level 28",CH_Level_28);
	Info_AddChoice(CH_Level,"Level 29",CH_Level_29);
	Info_AddChoice(CH_Level,"Level 30",CH_Level_30);
};

func void CH_Level21()
{
	Info_ClearChoices(CH_Level);
	Info_AddChoice(CH_Level,"BACK",CH_Level_BACK);
	Info_AddChoice(CH_Level,"Level 21",CH_Level_21);
	Info_AddChoice(CH_Level,"Level 22",CH_Level_22);
	Info_AddChoice(CH_Level,"Level 23",CH_Level_23);
	Info_AddChoice(CH_Level,"Level 24",CH_Level_24);
	Info_AddChoice(CH_Level,"Level 25",CH_Level_25);
};

func void CH_Level16()
{
	Info_ClearChoices(CH_Level);
	Info_AddChoice(CH_Level,"BACK",CH_Level_BACK);
	Info_AddChoice(CH_Level,"Level 16",CH_Level_16);
	Info_AddChoice(CH_Level,"Level 17",CH_Level_17);
	Info_AddChoice(CH_Level,"Level 18",CH_Level_18);
	Info_AddChoice(CH_Level,"Level 19",CH_Level_19);
	Info_AddChoice(CH_Level,"Level 20",CH_Level_20);
};

func void CH_Level11()
{
	Info_ClearChoices(CH_Level);
	Info_AddChoice(CH_Level,"BACK",CH_Level_BACK);
	Info_AddChoice(CH_Level,"Level 11",CH_Level_11);
	Info_AddChoice(CH_Level,"Level 12",CH_Level_12);
	Info_AddChoice(CH_Level,"Level 13",CH_Level_13);
	Info_AddChoice(CH_Level,"Level 14",CH_Level_14);
	Info_AddChoice(CH_Level,"Level 15",CH_Level_15);
};

func void CH_Level6()
{
	Info_ClearChoices(CH_Level);
	Info_AddChoice(CH_Level,"BACK",CH_Level_BACK);
	Info_AddChoice(CH_Level,"Level  6",CH_Level_6);
	Info_AddChoice(CH_Level,"Level  7",CH_Level_7);
	Info_AddChoice(CH_Level,"Level  8",CH_Level_8);
	Info_AddChoice(CH_Level,"Level  9",CH_Level_9);
	Info_AddChoice(CH_Level,"Level 10",CH_Level_10);
};

func void CH_Level1()
{
	Info_ClearChoices(CH_Level);
	Info_AddChoice(CH_Level,"BACK",CH_Level_BACK);
	Info_AddChoice(CH_Level,"Level 1",CH_Level_1);
	Info_AddChoice(CH_Level,"Level 2",CH_Level_2);
	Info_AddChoice(CH_Level,"Level 3",CH_Level_3);
	Info_AddChoice(CH_Level,"Level 4",CH_Level_4);
	Info_AddChoice(CH_Level,"Level 5",CH_Level_5);
};

func void CH_Level_1()
{
	Info_ClearChoices(CH_Level);
	hero.level = 1;
	hero.attribute[ATR_HITPOINTS_MAX] = 52;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_2()
{
	Info_ClearChoices(CH_Level);
	hero.level = 2;
	hero.attribute[ATR_HITPOINTS_MAX] = 64;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_3()
{
	Info_ClearChoices(CH_Level);
	hero.level = 3;
	hero.attribute[ATR_HITPOINTS_MAX] = 76;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_4()
{
	Info_ClearChoices(CH_Level);
	hero.level = 4;
	hero.attribute[ATR_HITPOINTS_MAX] = 88;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_5()
{
	Info_ClearChoices(CH_Level);
	hero.level = 5;
	hero.attribute[ATR_HITPOINTS_MAX] = 100;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_6()
{
	Info_ClearChoices(CH_Level);
	hero.level = 6;
	hero.attribute[ATR_HITPOINTS_MAX] = 112;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_7()
{
	Info_ClearChoices(CH_Level);
	hero.level = 7;
	hero.attribute[ATR_HITPOINTS_MAX] = 124;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_8()
{
	Info_ClearChoices(CH_Level);
	hero.level = 8;
	hero.attribute[ATR_HITPOINTS_MAX] = 136;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_9()
{
	Info_ClearChoices(CH_Level);
	hero.level = 9;
	hero.attribute[ATR_HITPOINTS_MAX] = 148;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_10()
{
	Info_ClearChoices(CH_Level);
	hero.level = 10;
	hero.attribute[ATR_HITPOINTS_MAX] = 160;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_11()
{
	Info_ClearChoices(CH_Level);
	hero.level = 11;
	hero.attribute[ATR_HITPOINTS_MAX] = 172;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_12()
{
	Info_ClearChoices(CH_Level);
	hero.level = 12;
	hero.attribute[ATR_HITPOINTS_MAX] = 184;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_13()
{
	Info_ClearChoices(CH_Level);
	hero.level = 13;
	hero.attribute[ATR_HITPOINTS_MAX] = 196;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_14()
{
	Info_ClearChoices(CH_Level);
	hero.level = 14;
	hero.attribute[ATR_HITPOINTS_MAX] = 208;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_15()
{
	Info_ClearChoices(CH_Level);
	hero.level = 15;
	hero.attribute[ATR_HITPOINTS_MAX] = 220;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_16()
{
	Info_ClearChoices(CH_Level);
	hero.level = 16;
	hero.attribute[ATR_HITPOINTS_MAX] = 232;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_17()
{
	Info_ClearChoices(CH_Level);
	hero.level = 17;
	hero.attribute[ATR_HITPOINTS_MAX] = 244;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_18()
{
	Info_ClearChoices(CH_Level);
	hero.level = 18;
	hero.attribute[ATR_HITPOINTS_MAX] = 256;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_19()
{
	Info_ClearChoices(CH_Level);
	hero.level = 19;
	hero.attribute[ATR_HITPOINTS_MAX] = 268;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_20()
{
	Info_ClearChoices(CH_Level);
	hero.level = 20;
	hero.attribute[ATR_HITPOINTS_MAX] = 280;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_21()
{
	Info_ClearChoices(CH_Level);
	hero.level = 21;
	hero.attribute[ATR_HITPOINTS_MAX] = 292;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_22()
{
	Info_ClearChoices(CH_Level);
	hero.level = 22;
	hero.attribute[ATR_HITPOINTS_MAX] = 304;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_23()
{
	Info_ClearChoices(CH_Level);
	hero.level = 23;
	hero.attribute[ATR_HITPOINTS_MAX] = 316;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_24()
{
	Info_ClearChoices(CH_Level);
	hero.level = 24;
	hero.attribute[ATR_HITPOINTS_MAX] = 328;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_25()
{
	Info_ClearChoices(CH_Level);
	hero.level = 25;
	hero.attribute[ATR_HITPOINTS_MAX] = 340;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_26()
{
	Info_ClearChoices(CH_Level);
	hero.level = 26;
	hero.attribute[ATR_HITPOINTS_MAX] = 352;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_27()
{
	Info_ClearChoices(CH_Level);
	hero.level = 27;
	hero.attribute[ATR_HITPOINTS_MAX] = 364;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_28()
{
	Info_ClearChoices(CH_Level);
	hero.level = 28;
	hero.attribute[ATR_HITPOINTS_MAX] = 376;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_29()
{
	Info_ClearChoices(CH_Level);
	hero.level = 29;
	hero.attribute[ATR_HITPOINTS_MAX] = 388;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_30()
{
	Info_ClearChoices(CH_Level);
	hero.level = 30;
	hero.attribute[ATR_HITPOINTS_MAX] = 400;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Guild_BACK()
{
	Info_ClearChoices(CH_Guild);
};


instance CH_Guild(C_Info)
{
	npc = ch;
	condition = CH_Guild_Condition;
	information = CH_Guild_Info;
	important = 0;
	permanent = 1;
	description = "Gib mir Gilde!";
};


func int CH_Guild_Condition()
{
	if((hero.level > 5) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return TRUE;
	};
};

func void CH_Guild_Info()
{
	Info_ClearChoices(CH_Guild);
	Info_AddChoice(CH_Guild,"BACK",CH_Guild_BACK);
	if(hero.level >= 0)
	{
		Info_AddChoice(CH_Guild,"Schatten",CH_Shadow);
	};
	if(hero.level >= 0)
	{
		Info_AddChoice(CH_Guild,"Gardist",CH_Guard);
	};
	if(hero.level >= 0)
	{
		Info_AddChoice(CH_Guild,"Feuermagier",CH_Firemage);
	};
	if(hero.level >= 0)
	{
		Info_AddChoice(CH_Guild,"Bandit",CH_Bandit);
	};
	if(hero.level >= 0)
	{
		Info_AddChoice(CH_Guild,"S�ldner",CH_Mercenary);
	};
	if(hero.level >= 0)
	{
		Info_AddChoice(CH_Guild,"Wassermagier",CH_Watermage);
	};
	if(hero.level >= 0)
	{
		Info_AddChoice(CH_Guild,"D�monenbeschw�rer",ch_demon);
	};
	if(hero.level >= 0)
	{
		Info_AddChoice(CH_Guild,"Novize",CH_Novice);
	};
	if(hero.level >= 0)
	{
		Info_AddChoice(CH_Guild,"Templer",CH_Templar);
	};
	if(hero.level >= 0)
	{
		Info_AddChoice(CH_Guild,"Guru",ch_guru);
	};
};

func void CH_Templar()
{
	Info_ClearChoices(CH_Guild);
	hero.guild = GIL_TPL;
	Npc_SetTrueGuild(hero,GIL_TPL);
	if(hero.level <= 15)
	{
		CreateInvItem(hero,tpl_armor_l);
		AI_EquipArmor(hero,tpl_armor_l);
		hero_face5 = TRUE;
	}
	else
	{
		CreateInvItem(hero,tpl_armor_m);
		AI_EquipArmor(hero,tpl_armor_m);
		hero_face4 = TRUE;
	};
};

func void CH_Novice()
{
	Info_ClearChoices(CH_Guild);
	hero.guild = GIL_NOV;
	Npc_SetTrueGuild(hero,GIL_NOV);
	if(hero.level <= 15)
	{
		CreateInvItem(hero,nov_armor_l);
		AI_EquipArmor(hero,nov_armor_l);
		hero_face6 = TRUE;
	}
	else
	{
		CreateInvItem(hero,nov_armor_h);
		AI_EquipArmor(hero,nov_armor_h);
		hero_face1 = TRUE;
	};
};

func void CH_Watermage()
{
	Info_ClearChoices(CH_Guild);
	hero.guild = GIL_KDW;
	Npc_SetTrueGuild(hero,GIL_KDW);
	if(hero.level <= 20)
	{
		CreateInvItem(hero,kdw_armor_l);
		AI_EquipArmor(hero,kdw_armor_l);
	}
	else
	{
		CreateInvItem(hero,kdw_armor_h);
		AI_EquipArmor(hero,kdw_armor_h);
	};
};

func void CH_Mercenary()
{
	Info_ClearChoices(CH_Guild);
	hero.guild = GIL_SLD;
	Npc_SetTrueGuild(hero,GIL_SLD);
	if(hero.level <= 15)
	{
		CreateInvItem(hero,sld_armor_m);
		AI_EquipArmor(hero,sld_armor_m);
	}
	else
	{
		CreateInvItem(hero,sld_armor_h);
		AI_EquipArmor(hero,sld_armor_h);
	};
};

func void CH_Bandit()
{
	Info_ClearChoices(CH_Guild);
	hero.guild = GIL_ORG;
	Npc_SetTrueGuild(hero,GIL_ORG);
	CreateInvItem(hero,org_armor_h);
	AI_EquipArmor(hero,org_armor_h);
};

func void CH_Firemage()
{
	Info_ClearChoices(CH_Guild);
	hero.guild = GIL_KDF;
	Npc_SetTrueGuild(hero,GIL_KDF);
	CreateInvItem(hero,kdf_armor_h);
	AI_EquipArmor(hero,kdf_armor_h);
};

func void CH_Guard()
{
	Info_ClearChoices(CH_Guild);
	hero.guild = GIL_GRD;
	Npc_SetTrueGuild(hero,GIL_GRD);
	if(hero.level <= 15)
	{
		CreateInvItem(hero,grd_armor_l);
		AI_EquipArmor(hero,grd_armor_l);
	}
	else
	{
		CreateInvItem(hero,grd_armor_h);
		AI_EquipArmor(hero,grd_armor_h);
	};
};

func void CH_Shadow()
{
	Info_ClearChoices(CH_Guild);
	hero.guild = GIL_STT;
	Npc_SetTrueGuild(hero,GIL_STT);
	CreateInvItem(hero,stt_armor_h);
	AI_EquipArmor(hero,stt_armor_h);
};

func void ch_demon()
{
	Info_ClearChoices(CH_Guild);
	hero.guild = GIL_DMB;
	Npc_SetTrueGuild(hero,GIL_DMB);
	CreateInvItem(hero,dmb_armor_m);
	AI_EquipArmor(hero,dmb_armor_m);
};

func void ch_guru()
{
	Info_ClearChoices(CH_Guild);
	hero.guild = GIL_GUR;
	Npc_SetTrueGuild(hero,GIL_GUR);
	if(hero.level <= 15)
	{
		CreateInvItem(hero,gur_armor_m);
		AI_EquipArmor(hero,gur_armor_m);
		hero_face4 = TRUE;
	}
	else
	{
		CreateInvItem(hero,gur_armor_h);
		AI_EquipArmor(hero,gur_armor_h);
		hero_face2 = TRUE;
	};
};


instance CH_Training_STR(C_Info)
{
	npc = ch;
	condition = CH_Training_STR_Condition;
	information = CH_Training_STR_Info;
	important = 0;
	permanent = 1;
	description = "ATTRIBUTE: St�rke";
};


func int CH_Training_STR_Condition()
{
	if(hero.lp > 0)
	{
		return TRUE;
	};
};

func void CH_Training_STR_Info()
{
	Info_ClearChoices(CH_Training_STR);
	Info_AddChoice(CH_Training_STR,"ZUR�CK",CH_Training_STR_BACK);
	Info_AddChoice(CH_Training_STR,"St�rke (alle restlichen Lernpunkte)",CH_Strength_all);
	Info_AddChoice(CH_Training_STR,"St�rke (f�r beste Nahkampfwaffe)",CH_Strength_Weapon);
	if(hero.lp >= (20 * LPCOST_ATTRIBUTE_STRENGTH))
	{
		Info_AddChoice(CH_Training_STR,B_BuildLearnString(NAME_LearnStrength_20,20 * LPCOST_ATTRIBUTE_STRENGTH,0),CH_Strength20);
	};
	if(hero.lp >= (10 * LPCOST_ATTRIBUTE_STRENGTH))
	{
		Info_AddChoice(CH_Training_STR,B_BuildLearnString(NAME_LearnStrength_10,10 * LPCOST_ATTRIBUTE_STRENGTH,0),CH_Strength10);
	};
	if(hero.lp >= (5 * LPCOST_ATTRIBUTE_STRENGTH))
	{
		Info_AddChoice(CH_Training_STR,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),CH_Strength5);
	};
	if(hero.lp >= LPCOST_ATTRIBUTE_STRENGTH)
	{
		Info_AddChoice(CH_Training_STR,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),CH_Strength1);
	};
};

func void CH_Strength1()
{
	B_SetHeroAttributes(ATR_STRENGTH,1,LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(CH_Training_STR);
};

func void CH_Strength5()
{
	B_SetHeroAttributes(ATR_STRENGTH,5,5 * LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(CH_Training_STR);
};

func void CH_Strength10()
{
	B_SetHeroAttributes(ATR_STRENGTH,10,10 * LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(CH_Training_STR);
};

func void CH_Strength20()
{
	B_SetHeroAttributes(ATR_STRENGTH,20,20 * LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(CH_Training_STR);
};

func void CH_Strength_Weapon()
{
	var int value;
	var int increase;
	Info_ClearChoices(CH_Training_STR);
	if(hero.level <= 5)
	{
		value = 11;
	}
	else if(hero.level <= 9)
	{
		value = 17;
	}
	else if(hero.level <= 15)
	{
		value = 26;
	}
	else if(hero.level <= 20)
	{
		value = 52;
	}
	else if(hero.level <= 25)
	{
		value = 62;
	}
	else if(hero.level <= 30)
	{
		value = 78;
	};
	if(hero.attribute[ATR_STRENGTH] < value)
	{
		increase = value - hero.attribute[ATR_STRENGTH];
		B_SetHeroAttributes(ATR_STRENGTH,increase,increase * LPCOST_ATTRIBUTE_STRENGTH);
		AI_EquipBestMeleeWeapon(hero);
	}
	else
	{
		PrintScreen("n�tige STR bereits vorhanden",-1,-1,"font_old_20_white.tga",10);
	};
};

func void CH_Strength_all()
{
	B_SetHeroAttributes(ATR_STRENGTH,hero.lp,hero.lp * LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(CH_Training_STR);
};

func void CH_Training_STR_BACK()
{
	Info_ClearChoices(CH_Training_STR);
};


instance CH_Training_DEX(C_Info)
{
	npc = ch;
	condition = CH_Training_DEX_Condition;
	information = CH_Training_DEX_Info;
	important = 0;
	permanent = 1;
	description = "ATTRIBUTE: Geschick";
};


func int CH_Training_DEX_Condition()
{
	if(hero.lp > 0)
	{
		return TRUE;
	};
};

func void CH_Training_DEX_Info()
{
	Info_ClearChoices(CH_Training_DEX);
	Info_AddChoice(CH_Training_DEX,"ZUR�CK",CH_Training_DEX_BACK);
	Info_AddChoice(CH_Training_DEX,"Geschick (alle restlichen Lernpunkte)",CH_Dexterity_all);
	Info_AddChoice(CH_Training_DEX,"Geschick (f�r beste Fernkampfwaffe)",CH_Dexterity_Weapon);
	if(hero.lp >= 20)
	{
		Info_AddChoice(CH_Training_DEX,B_BuildLearnString(NAME_LearnDexterity_20,20 * LPCOST_ATTRIBUTE_DEXTERITY,0),CH_Dexterity20);
	};
	if(hero.lp >= 10)
	{
		Info_AddChoice(CH_Training_DEX,B_BuildLearnString(NAME_LearnDexterity_10,10 * LPCOST_ATTRIBUTE_DEXTERITY,0),CH_Dexterity10);
	};
	if(hero.lp >= 5)
	{
		Info_AddChoice(CH_Training_DEX,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),CH_Dexterity5);
	};
	if(hero.lp >= 1)
	{
		Info_AddChoice(CH_Training_DEX,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),CH_Dexterity1);
	};
};

func void CH_Dexterity1()
{
	B_SetHeroAttributes(ATR_DEXTERITY,1,LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(CH_Training_DEX);
};

func void CH_Dexterity5()
{
	B_SetHeroAttributes(ATR_DEXTERITY,5,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(CH_Training_DEX);
};

func void CH_Dexterity10()
{
	B_SetHeroAttributes(ATR_DEXTERITY,10,10 * LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(CH_Training_DEX);
};

func void CH_Dexterity20()
{
	B_SetHeroAttributes(ATR_DEXTERITY,20,20 * LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(CH_Training_DEX);
};

func void CH_Dexterity_Weapon()
{
	var int value;
	var int increase;
	Info_ClearChoices(CH_Training_DEX);
	if(hero.level <= 5)
	{
		value = 16;
	}
	else if(hero.level <= 9)
	{
		value = 22;
	}
	else if(hero.level <= 15)
	{
		value = 28;
	}
	else if(hero.level <= 20)
	{
		value = 34;
	}
	else if(hero.level <= 25)
	{
		value = 40;
	}
	else if(hero.level <= 30)
	{
		value = 50;
	};
	if(hero.attribute[ATR_DEXTERITY] < value)
	{
		increase = value - hero.attribute[ATR_DEXTERITY];
		B_SetHeroAttributes(ATR_DEXTERITY,increase,increase * LPCOST_ATTRIBUTE_DEXTERITY);
		AI_EquipBestRangedWeapon(hero);
	}
	else
	{
		PrintScreen("n�tige DEX bereits vorhanden",-1,-1,"font_old_20_white.tga",10);
	};
};

func void CH_Dexterity_all()
{
	B_SetHeroAttributes(ATR_DEXTERITY,hero.lp,hero.lp * LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(CH_Training_DEX);
};

func void CH_Training_DEX_BACK()
{
	Info_ClearChoices(CH_Training_DEX);
};


instance CH_Training_Mana(C_Info)
{
	npc = ch;
	condition = CH_Training_Mana_Condition;
	information = CH_Training_Mana_Info;
	important = 0;
	permanent = 1;
	description = "ATTRIBUTE: Mana";
};


func int CH_Training_Mana_Condition()
{
	if(hero.lp > 0)
	{
		return TRUE;
	};
};

func void CH_Training_Mana_Info()
{
	Info_ClearChoices(CH_Training_Mana);
	Info_AddChoice(CH_Training_Mana,"BACK",CH_Training_Mana_BACK);
	Info_AddChoice(CH_Training_Mana,"Mana (restliche Lernpunkte)",CH_Mana_all);
	if(hero.lp >= 20)
	{
		Info_AddChoice(CH_Training_Mana,B_BuildLearnString(NAME_LearnMana_20,20 * LPCOST_ATTRIBUTE_MANA,0),CH_Mana20);
	};
	if(hero.lp >= 10)
	{
		Info_AddChoice(CH_Training_Mana,B_BuildLearnString(NAME_LearnMana_10,10 * LPCOST_ATTRIBUTE_MANA,0),CH_Mana10);
	};
	if(hero.lp >= 5)
	{
		Info_AddChoice(CH_Training_Mana,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),CH_Mana5);
	};
	if(hero.lp >= 1)
	{
		Info_AddChoice(CH_Training_Mana,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),CH_Mana1);
	};
};

func void CH_Mana1()
{
	B_SetHeroAttributes(ATR_MANA_MAX,1,LPCOST_ATTRIBUTE_MANA);
	B_SetHeroAttributes(ATR_MANA,1,0);
	Info_ClearChoices(CH_Training_Mana);
};

func void CH_Mana5()
{
	B_SetHeroAttributes(ATR_MANA_MAX,5,5 * LPCOST_ATTRIBUTE_MANA);
	B_SetHeroAttributes(ATR_MANA,5,0);
	Info_ClearChoices(CH_Training_Mana);
};

func void CH_Mana10()
{
	B_SetHeroAttributes(ATR_MANA_MAX,10,10 * LPCOST_ATTRIBUTE_MANA);
	B_SetHeroAttributes(ATR_MANA,10,0);
	Info_ClearChoices(CH_Training_Mana);
};

func void CH_Mana20()
{
	B_SetHeroAttributes(ATR_MANA_MAX,20,20 * LPCOST_ATTRIBUTE_MANA);
	B_SetHeroAttributes(ATR_MANA,20,0);
	Info_ClearChoices(CH_Training_Mana);
};

func void CH_Mana_all()
{
	var int lp;
	lp = hero.lp;
	B_SetHeroAttributes(ATR_MANA_MAX,hero.lp,hero.lp * LPCOST_ATTRIBUTE_MANA);
	B_SetHeroAttributes(ATR_MANA,lp,0);
	Info_ClearChoices(CH_Training_Mana);
};

func void CH_Training_Mana_BACK()
{
	Info_ClearChoices(CH_Training_Mana);
};


instance CH_Training_Combat(C_Info)
{
	npc = ch;
	condition = CH_Training_Combat_Condition;
	information = CH_Training_Combat_Info;
	important = 0;
	permanent = 1;
	description = "TALENTE: Kampf";
};


func int CH_Training_Combat_Condition()
{
	if(hero.lp > 0)
	{
		return TRUE;
	};
};

func void CH_Training_Combat_Info()
{
	Info_ClearChoices(CH_Training_Combat);
	Info_AddChoice(CH_Training_Combat,"BACK",CH_Training_Combat_BACK);
	if((hero.lp >= LPCOST_TALENT_CROSSBOW_2) && (Npc_GetTalentSkill(hero,NPC_TALENT_CROSSBOW) == 1))
	{
		Info_AddChoice(CH_Training_Combat,B_BuildLearnString(NAME_LearnCrossbow_2,LPCOST_TALENT_CROSSBOW_2,0),CH_CrossbowL2);
	};
	if((hero.lp >= LPCOST_TALENT_CROSSBOW_1) && (Npc_GetTalentSkill(hero,NPC_TALENT_CROSSBOW) == 0))
	{
		Info_AddChoice(CH_Training_Combat,B_BuildLearnString(NAME_LearnCrossbow_1,LPCOST_TALENT_CROSSBOW_1,0),CH_CrossbowL1);
	};
	if((hero.lp >= LPCOST_TALENT_BOW_2) && (Npc_GetTalentSkill(hero,NPC_TALENT_BOW) == 1))
	{
		Info_AddChoice(CH_Training_Combat,B_BuildLearnString(NAME_LearnBow_2,LPCOST_TALENT_BOW_2,0),CH_BowL2);
	};
	if((hero.lp >= LPCOST_TALENT_BOW_1) && (Npc_GetTalentSkill(hero,NPC_TALENT_BOW) == 0))
	{
		Info_AddChoice(CH_Training_Combat,B_BuildLearnString(NAME_LearnBow_1,LPCOST_TALENT_BOW_1,0),CH_BowL1);
	};
	if((hero.lp >= LPCOST_TALENT_2H_2) && (Npc_GetTalentSkill(hero,NPC_TALENT_2H) == 1))
	{
		Info_AddChoice(CH_Training_Combat,B_BuildLearnString(NAME_Learn2h_2,LPCOST_TALENT_2H_2,0),CH_2hL2);
	};
	if((hero.lp >= LPCOST_TALENT_2H_1) && (Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 2) && (Npc_GetTalentSkill(hero,NPC_TALENT_2H) == 0))
	{
		Info_AddChoice(CH_Training_Combat,B_BuildLearnString(NAME_Learn2h_1,LPCOST_TALENT_2H_1,0),CH_2hL1);
	};
	if((hero.lp >= LPCOST_TALENT_1H_2) && (Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 1))
	{
		Info_AddChoice(CH_Training_Combat,B_BuildLearnString(NAME_Learn1h_2,LPCOST_TALENT_1H_2,0),CH_1hL2);
	};
	if((hero.lp >= LPCOST_TALENT_1H_1) && (Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 0))
	{
		Info_AddChoice(CH_Training_Combat,B_BuildLearnString(NAME_Learn1h_1,LPCOST_TALENT_1H_1,0),CH_1hL1);
	};
};

func void CH_1hL1()
{
	Info_ClearChoices(CH_Training_Combat);
	B_GiveSkill(hero,NPC_TALENT_1H,1,LPCOST_TALENT_1H_1);
};

func void CH_1hL2()
{
	Info_ClearChoices(CH_Training_Combat);
	B_GiveSkill(hero,NPC_TALENT_1H,2,LPCOST_TALENT_1H_2);
};

func void CH_2hL1()
{
	Info_ClearChoices(CH_Training_Combat);
	B_GiveSkill(hero,NPC_TALENT_2H,1,LPCOST_TALENT_2H_1);
};

func void CH_2hL2()
{
	Info_ClearChoices(CH_Training_Combat);
	B_GiveSkill(hero,NPC_TALENT_2H,2,LPCOST_TALENT_2H_2);
};

func void CH_BowL1()
{
	Info_ClearChoices(CH_Training_Combat);
	B_GiveSkill(hero,NPC_TALENT_BOW,1,LPCOST_TALENT_BOW_1);
};

func void CH_BowL2()
{
	Info_ClearChoices(CH_Training_Combat);
	B_GiveSkill(hero,NPC_TALENT_BOW,2,LPCOST_TALENT_BOW_2);
};

func void CH_CrossbowL1()
{
	Info_ClearChoices(CH_Training_Combat);
	B_GiveSkill(hero,NPC_TALENT_CROSSBOW,1,LPCOST_TALENT_CROSSBOW_1);
};

func void CH_CrossbowL2()
{
	Info_ClearChoices(CH_Training_Combat);
	B_GiveSkill(hero,NPC_TALENT_CROSSBOW,2,LPCOST_TALENT_CROSSBOW_2);
};

func void CH_Training_Combat_BACK()
{
	Info_ClearChoices(CH_Training_Combat);
};


instance CH_Training_Magic(C_Info)
{
	npc = ch;
	condition = CH_Training_Magic_Condition;
	information = CH_Training_Magic_Info;
	important = 0;
	permanent = 1;
	description = "TALENTE: Magie";
};


func int CH_Training_Magic_Condition()
{
	if(hero.lp > 0)
	{
		return TRUE;
	};
};

func void CH_Training_Magic_Info()
{
	Info_ClearChoices(CH_Training_Magic);
	Info_AddChoice(CH_Training_Magic,"BACK",CH_Training_Magic_BACK);
	if((hero.level >= 24) && (hero.lp >= LPCOST_TALENT_MAGE_6) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5))
	{
		Info_AddChoice(CH_Training_Magic,B_BuildLearnString(NAME_LearnMage_6,LPCOST_TALENT_MAGE_6,0),CH_Magic6);
	};
	if((hero.lp >= LPCOST_TALENT_MAGE_5) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4))
	{
		Info_AddChoice(CH_Training_Magic,B_BuildLearnString(NAME_LearnMage_5,LPCOST_TALENT_MAGE_5,0),CH_Magic5);
	};
	if((hero.lp >= LPCOST_TALENT_MAGE_4) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3))
	{
		Info_AddChoice(CH_Training_Magic,B_BuildLearnString(NAME_LearnMage_4,LPCOST_TALENT_MAGE_4,0),CH_Magic4);
	};
	if((hero.lp >= LPCOST_TALENT_MAGE_3) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2))
	{
		Info_AddChoice(CH_Training_Magic,B_BuildLearnString(NAME_LearnMage_3,LPCOST_TALENT_MAGE_3,0),CH_Magic3);
	};
	if((hero.lp >= LPCOST_TALENT_MAGE_2) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1))
	{
		Info_AddChoice(CH_Training_Magic,B_BuildLearnString(NAME_LearnMage_2,LPCOST_TALENT_MAGE_2,0),CH_Magic2);
	};
	if((hero.lp >= LPCOST_TALENT_MAGE_1) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 0))
	{
		Info_AddChoice(CH_Training_Magic,B_BuildLearnString(NAME_LearnMage_1,LPCOST_TALENT_MAGE_1,0),CH_Magic1);
	};
};

func void CH_Magic1()
{
	Info_ClearChoices(CH_Training_Magic);
	B_GiveSkill(hero,NPC_TALENT_MAGE,1,LPCOST_TALENT_MAGE_1);
	CreateInvItem(hero,ItArRuneLight);
	CreateInvItem(hero,ItArRuneFirebolt);
	CreateInvItem(hero,ItArRuneThunderbolt);
	CreateInvItems(hero,ItArScrollTrfScavenger,10);
	CreateInvItems(hero,ItArScrollTrfMolerat,10);
	CreateInvItems(hero,ItArScrollTrfWaran,10);
};

func void CH_Magic2()
{
	Info_ClearChoices(CH_Training_Magic);
	B_GiveSkill(hero,NPC_TALENT_MAGE,2,LPCOST_TALENT_MAGE_2);
	CreateInvItem(hero,ItArRuneHeal);
	CreateInvItem(hero,ItArRuneSleep);
	CreateInvItem(hero,ItArRuneWindfist);
	CreateInvItems(hero,ItArScrollTrfWolf,10);
	CreateInvItems(hero,ItArScrollTrfBloodfly,10);
	CreateInvItems(hero,ItArScrollTrfLurker,10);
};

func void CH_Magic3()
{
	Info_ClearChoices(CH_Training_Magic);
	B_GiveSkill(hero,NPC_TALENT_MAGE,3,LPCOST_TALENT_MAGE_3);
	CreateInvItem(hero,ItArRuneTelekinesis);
	CreateInvItem(hero,ItArRunePyrokinesis);
	CreateInvItem(hero,ItArRuneIceCube);
	CreateInvItem(hero,ItArRuneCharm);
	CreateInvItem(hero,ItArRuneFireball);
	CreateInvItem(hero,ItArRuneThunderball);
	CreateInvItems(hero,ItArScrollTrfMeatbug,10);
	CreateInvItems(hero,ItArScrollTrfCrawler,10);
	CreateInvItems(hero,ItArScrollTrfSnapper,10);
	CreateInvItems(hero,ItArScrollSummonSkeletons,10);
};

func void CH_Magic4()
{
	Info_ClearChoices(CH_Training_Magic);
	B_GiveSkill(hero,NPC_TALENT_MAGE,4,LPCOST_TALENT_MAGE_4);
	CreateInvItem(hero,ItArRuneControl);
	CreateInvItem(hero,ItArRuneChainLightning);
	CreateInvItem(hero,ItArRuneStormfist);
	CreateInvItem(hero,ItArRuneDestroyUndead);
	CreateInvItem(hero,ItArRuneFirestorm);
	CreateInvItem(hero,itarruneberzerk);
	CreateInvItem(hero,itarruneshrink);
	CreateInvItems(hero,ItArScrollTrfOrcdog,10);
	CreateInvItems(hero,ItArScrollTrfShadowbeast,10);
	CreateInvItems(hero,ItArScrollSummonGolem,10);
	CreateInvItems(hero,ItArScrollFear,10);
	CreateInvItems(hero,ItArScrollBerzerk,10);
	CreateInvItems(hero,ItArScrollShrink,10);
};

func void CH_Magic5()
{
	Info_ClearChoices(CH_Training_Magic);
	B_GiveSkill(hero,NPC_TALENT_MAGE,5,LPCOST_TALENT_MAGE_5);
	CreateInvItem(hero,ItArRuneIceWave);
	CreateInvItem(hero,ItArRuneFireRain);
	CreateInvItems(hero,ItArScrollSummonDemon,10);
};

func void CH_Magic6()
{
	Info_ClearChoices(CH_Training_Magic);
	B_GiveSkill(hero,NPC_TALENT_MAGE,6,LPCOST_TALENT_MAGE_6);
	CreateInvItem(hero,ItArRuneBreathOfDeath);
	CreateInvItems(hero,ItArScrollArmyOfDarkness,10);
};

func void CH_Training_Magic_BACK()
{
	Info_ClearChoices(CH_Training_Magic);
};


instance CH_Training_Thievery(C_Info)
{
	npc = ch;
	condition = CH_Training_Thievery_Condition;
	information = CH_Training_Thievery_Info;
	important = 0;
	permanent = 1;
	description = "TALENTE: Dieb";
};


func int CH_Training_Thievery_Condition()
{
	if(hero.lp > 0)
	{
		return TRUE;
	};
};

func void CH_Training_Thievery_Info()
{
	Info_ClearChoices(CH_Training_Thievery);
	Info_AddChoice(CH_Training_Thievery,"BACK",CH_Training_Thievery_BACK);
	if((hero.lp >= LPCOST_TALENT_ACROBAT) && (Npc_GetTalentSkill(hero,NPC_TALENT_ACROBAT) == 0))
	{
		Info_AddChoice(CH_Training_Thievery,B_BuildLearnString(NAME_LearnAcrobat,LPCOST_TALENT_ACROBAT,0),CH_Acrobat);
	};
	if((hero.lp >= LPCOST_TALENT_SNEAK) && (Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == 0))
	{
		Info_AddChoice(CH_Training_Thievery,B_BuildLearnString(NAME_LearnSneak,LPCOST_TALENT_SNEAK,0),CH_Sneak);
	};
	if((hero.lp >= LPCOST_TALENT_PICKPOCKET_2) && (Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 1))
	{
		Info_AddChoice(CH_Training_Thievery,B_BuildLearnString(NAME_LearnPickpocket_2,LPCOST_TALENT_PICKPOCKET_2,0),CH_Pickpocket2);
	};
	if((hero.lp >= LPCOST_TALENT_PICKPOCKET_1) && (Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 0))
	{
		Info_AddChoice(CH_Training_Thievery,B_BuildLearnString(NAME_LearnPickpocket_1,LPCOST_TALENT_PICKPOCKET_1,0),CH_Pickpocket1);
	};
	if((hero.lp >= LPCOST_TALENT_PICKLOCK_2) && (Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == 1))
	{
		Info_AddChoice(CH_Training_Thievery,B_BuildLearnString(NAME_LearnPicklock_2,LPCOST_TALENT_PICKLOCK_2,0),CH_Picklock2);
	};
	if((hero.lp >= LPCOST_TALENT_PICKLOCK_1) && (Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == 0))
	{
		Info_AddChoice(CH_Training_Thievery,B_BuildLearnString(NAME_LearnPicklock_1,LPCOST_TALENT_PICKLOCK_1,0),CH_Picklock1);
	};
};

func void CH_Picklock1()
{
	Info_ClearChoices(CH_Training_Thievery);
	B_GiveSkill(hero,NPC_TALENT_PICKLOCK,1,LPCOST_TALENT_PICKLOCK_1);
};

func void CH_Picklock2()
{
	Info_ClearChoices(CH_Training_Thievery);
	B_GiveSkill(hero,NPC_TALENT_PICKLOCK,2,LPCOST_TALENT_PICKLOCK_2);
};

func void CH_Pickpocket1()
{
	Info_ClearChoices(CH_Training_Thievery);
	B_GiveSkill(hero,NPC_TALENT_PICKPOCKET,1,LPCOST_TALENT_PICKPOCKET_1);
};

func void CH_Pickpocket2()
{
	Info_ClearChoices(CH_Training_Thievery);
	B_GiveSkill(hero,NPC_TALENT_PICKPOCKET,2,LPCOST_TALENT_PICKPOCKET_2);
};

func void CH_Sneak()
{
	Info_ClearChoices(CH_Training_Thievery);
	B_GiveSkill(hero,NPC_TALENT_SNEAK,1,LPCOST_TALENT_SNEAK);
};

func void CH_Acrobat()
{
	Info_ClearChoices(CH_Training_Thievery);
	B_GiveSkill(hero,NPC_TALENT_ACROBAT,1,LPCOST_TALENT_ACROBAT);
};

func void CH_Training_Thievery_BACK()
{
	Info_ClearChoices(CH_Training_Thievery);
};

