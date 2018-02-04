
instance NOV_1333_BaalIsidro(Npc_Default)
{
	name[0] = "Baal Isidro";
	npcType = npctype_main;
	guild = GIL_NOV;
	level = 9;
	voice = 3;
	id = 1333;
	attribute[ATR_STRENGTH] = 45;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 35;
	attribute[ATR_MANA] = 35;
	attribute[ATR_HITPOINTS_MAX] = 172;
	attribute[ATR_HITPOINTS] = 172;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_FatBald",29,2,nov_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,ItMw_1H_Axe_Old_01);
	CreateInvItems(self,ItMiJoint_1,10);
	CreateInvItems(self,ItMiJoint_2,20);
	CreateInvItems(self,ItMiJoint_3,20);
	daily_routine = Rtn_start_1333;
};


func void Rtn_start_1333()
{
	TA_SitAround(8,0,18,0,"NC_TAVERN_SIT2");
	TA_StandAround(18,0,3,0,"NC_TAVERN_ROOM06");
	TA_SitAround(3,0,8,0,"NC_TAVERN_SIT2");
};

