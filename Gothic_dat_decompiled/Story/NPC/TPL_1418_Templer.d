
instance TPL_1418_Templer(Npc_Default)
{
	name[0] = NAME_Templer;
	npcType = npctype_guard;
	guild = GIL_TPL;
	level = 12;
	voice = 13;
	id = 1418;
	attribute[ATR_STRENGTH] = 55;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 214;
	attribute[ATR_HITPOINTS] = 214;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_FatBald",61,0,tpl_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	EquipItem(self,ItMw_2H_Sword_Light_01);
	CreateInvItem(self,ItFoSoup);
	CreateInvItem(self,ItMiJoint_1);
	daily_routine = Rtn_start_1418;
};


func void Rtn_start_1418()
{
	TA_Sleep(0,0,6,0,"PSI_33_HUT_IN");
	TA_PracticeSword(6,0,15,0,"PSI_PATH_6_7");
	TA_SitAround(15,0,20,0,"PSI_TRAINING_3");
	TA_PracticeSword(20,0,0,0,"PSI_PATH_6_7");
};

