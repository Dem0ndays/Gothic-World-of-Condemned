
instance DIA_TPL_1402_GorNaToth_Exit(C_Info)
{
	npc = TPL_1402_GorNaToth;
	nr = 999;
	condition = DIA_TPL_1402_GorNaToth_Exit_Condition;
	information = DIA_TPL_1402_GorNaToth_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_TPL_1402_GorNaToth_Exit_Condition()
{
	return TRUE;
};

func void DIA_TPL_1402_GorNaToth_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GorNaToth_Abweisend(C_Info)
{
	npc = TPL_1402_GorNaToth;
	nr = 1;
	condition = DIA_GorNaToth_Abweisend_Condition;
	information = DIA_GorNaToth_Abweisend_Info;
	permanent = 1;
	description = "Mo¿esz mnie czegoœ nauczyæ?";
};


func int DIA_GorNaToth_Abweisend_Condition()
{
	if(!Npc_KnowsInfo(hero,DIA_GorNaToth_AngarTalked) && !C_NpcBelongsToPsiCamp(hero))
	{
		return 1;
	};
};

func void DIA_GorNaToth_Abweisend_Info()
{
	AI_Output(other,self,"DIA_GorNaToth_AngarTalked_15_00");	//Mo¿esz mnie czegoœ nauczyæ?
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_11_01");	//ZejdŸ mi z oczu, niegodny robaku! Uczê wy³¹cznie Stra¿ników Œwi¹tyni Œni¹cego.
	AI_StopProcessInfos(self);
};


var int shark_hunter;

instance DIA_GorNaToth_AngarTalked(C_Info)
{
	npc = TPL_1402_GorNaToth;
	nr = 1;
	condition = DIA_GorNaToth_AngarTalked_Condition;
	information = DIA_GorNaToth_AngarTalked_Info;
	permanent = 0;
	important = 1;
};


func int DIA_GorNaToth_AngarTalked_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_CorAngar_LaterTrainer))
	{
		return 1;
	};
};

func void DIA_GorNaToth_AngarTalked_Info()
{
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_11_00");	//Rozmawia³eœ z Cor Angarem? I co powiedzia³?
	Info_ClearChoices(DIA_GorNaToth_AngarTalked);
	Info_AddChoice(DIA_GorNaToth_AngarTalked,"Powiedzia³, ¿e jesteœ niegodny, by nosiæ zbrojê Œwi¹tynnego Stra¿nika.",DIA_GorNaToth_AngarTalked_Unworthy);
	Info_AddChoice(DIA_GorNaToth_AngarTalked,"Powiedzia³, ¿e nigdy nie lubi³ b³otnych wê¿y.",DIA_GorNaToth_AngarTalked_Shark);
	Info_AddChoice(DIA_GorNaToth_AngarTalked,"Kaza³ mi zg³osiæ siê do niego, gdy ju¿ zostanê Œwi¹tynnym Stra¿nikiem.",DIA_GorNaToth_AngarTalked_Normal);
};

func void DIA_GorNaToth_AngarTalked_Normal()
{
	AI_Output(other,self,"DIA_GorNaToth_AngarTalked_Normal_15_00");	//Kaza³ mi zg³osiæ siê do niego, gdy ju¿ zostanê Œwi¹tynnym Stra¿nikiem.
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Normal_11_01");	//NajwyraŸniej ma o tobie wysokie mniemanie. Inaczej nie odezwa³by siê do ciebie.
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Normal_11_02");	//To wielki zaszczyt zostaæ przez niego choæby zauwa¿onym. Do mnie odezwa³ siê po raz ostatni ca³e dwa miesi¹ce temu!
	Info_ClearChoices(DIA_GorNaToth_AngarTalked);
};

func void DIA_GorNaToth_AngarTalked_Shark()
{
	AI_Output(other,self,"DIA_GorNaToth_AngarTalked_Shark_15_00");	//Powiedzia³, ¿e nigdy nie lubi³ b³otnych wê¿y.
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Shark_11_01");	//Co...? (zdecydowanie) Czeka mnie œwiêta misja!
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Shark_11_02");	//¯yczenie mojego mistrza jest dla mnie rozkazem.
	shark_hunter = TRUE;
	Info_ClearChoices(DIA_GorNaToth_AngarTalked);
};

func void DIA_GorNaToth_AngarTalked_Unworthy()
{
	AI_Output(other,self,"DIA_GorNaToth_AngarTalked_Unworthy_15_00");	//Powiedzia³, ¿e jesteœ niegodny, by nosiæ zbrojê Œwi¹tynnego Stra¿nika.
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Unworthy_11_01");	//Nigdy! Nie móg³ tak powiedzieæ! Nie o mnie!
	Info_ClearChoices(DIA_GorNaToth_AngarTalked);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};


instance TPL_1402_GorNaToth_GETSTUFF(C_Info)
{
	npc = TPL_1402_GorNaToth;
	condition = TPL_1402_GorNaToth_GETSTUFF_Condition;
	information = TPL_1402_GorNaToth_GETSTUFF_Info;
	important = 0;
	permanent = 0;
	description = "Chcia³bym odebraæ moj¹ zbrojê Œwi¹tynnego Stra¿nika.";
};


func int TPL_1402_GorNaToth_GETSTUFF_Condition()
{
	if(Npc_KnowsInfo(hero,GUR_1202_CorAngar_WANNABETPL) && (Npc_GetTrueGuild(hero) == GIL_TPL))
	{
		return TRUE;
	};
};

func void TPL_1402_GorNaToth_GETSTUFF_Info()
{
	AI_Output(other,self,"TPL_1402_GorNaToth_GETSTUFF_Info_15_01");	//Chcia³bym odebraæ moj¹ zbrojê Œwi¹tynnego Stra¿nika.
	AI_Output(self,other,"TPL_1402_GorNaToth_GETSTUFF_Info_11_02");	//To prawdziwy zaszczyt wrêczyæ zbrojê cz³owiekowi, który zdoby³ dla nas jaja pe³zaczy.
	AI_Output(self,other,"TPL_1402_GorNaToth_GETSTUFF_Info_11_03");	//Niech ta zbroja chroni ciê równie dobrze jak Œni¹cy chroni nasze Bractwo!
	B_LogEntry(GE_BecomeTemplar,"Gor Na Toth da³ mi moj¹ pierwsz¹ zbrojê Œwi¹tynnej Stra¿y. Teraz jestem pe³noprawnym cz³onkiem tej spo³ecznoœci!");
	Log_CreateTopic(GE_TraderPSI,LOG_NOTE);
	B_LogEntry(GE_TraderPSI,"Gor Na Toth ma na sk³adzie lepsze zbroje Œwi¹tynnej Stra¿y. Niestety, ¿eby je otrzymaæ, muszê najpierw z³o¿yæ pokaŸny datek na rzecz Bractwa. W ci¹gu dnia Toth przebywa zwykle na placu treningowym.");
	CreateInvItem(hero,tpl_armor_l);
	CreateInvItem(self,ItAmArrow);
	B_GiveInvItems(self,hero,ItAmArrow,1);
	Npc_RemoveInvItem(hero,ItAmArrow);
	AI_EquipBestArmor(hero);
};


instance TPL_1402_GorNaToth_ARMOR(C_Info)
{
	npc = TPL_1402_GorNaToth;
	condition = TPL_1402_GorNaToth_ARMOR_Condition;
	information = TPL_1402_GorNaToth_ARMOR_Info;
	important = 0;
	permanent = 1;
	description = "Potrzebujê lepszej zbroi.";
};


func int TPL_1402_GorNaToth_ARMOR_Condition()
{
	if(Npc_KnowsInfo(hero,TPL_1402_GorNaToth_GETSTUFF))
	{
		return TRUE;
	};
};

func void TPL_1402_GorNaToth_ARMOR_Info()
{
	AI_Output(other,self,"Info_GorNaToth_ARMOR_15_01");	//Potrzebujê lepszej zbroi.
	AI_Output(self,other,"Info_GorNaToth_ARMOR_11_02");	//Có¿, móg³bym ci daæ lepsz¹ zbrojê, ale musia³byœ najpierw przekazaæ spory datek na rzecz Bractwa.
	Info_ClearChoices(TPL_1402_GorNaToth_ARMOR);
	Info_AddChoice(TPL_1402_GorNaToth_ARMOR,DIALOG_BACK,TPL_1402_GorNaToth_ARMOR_BACK);
	Info_AddChoice(TPL_1402_GorNaToth_ARMOR,B_BuildBuyArmorString(NAME_GorNaTothHeavyTpl,value_tpl_armor_h),TPL_1402_GorNaToth_ARMOR_H);
	Info_AddChoice(TPL_1402_GorNaToth_ARMOR,B_BuildBuyArmorString(NAME_GorNaTothTpl,value_tpl_armor_m),TPL_1402_GorNaToth_ARMOR_M);
};

func void TPL_1402_GorNaToth_ARMOR_M()
{
	AI_Output(hero,self,"Info_GorNaToth_ARMOR_M_15_01");	//Potrzebujê wzmocnionej zbroi Stra¿ników Œwi¹tynnych.
	if(Kapitel < 3)
	{
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_M_11_02");	//Nie jesteœ wystarczaj¹co doœwiadczony. Udowodnij swoj¹ przydatnoœæ w Stra¿y, a zas³u¿ysz sobie na lepszy pancerz!
	}
	else if(Npc_HasItems(hero,ItMiNugget) < value_tpl_armor_m)
	{
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_M_11_03");	//Gdy tylko wesprzesz nasz¹ spo³ecznoœæ odpowiednim datkiem, zbroja bêdzie twoja!
	}
	else
	{
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_M_11_04");	//Teraz, gdy jesteœ gotów wesprzeæ nas swoim hojnym datkiem, mo¿esz odebraæ swoj¹ zbrojê.
		B_GiveInvItems(hero,self,ItMiNugget,value_tpl_armor_m);
		CreateInvItem(hero,tpl_armor_m);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		AI_EquipBestArmor(hero);
	};
	Info_ClearChoices(TPL_1402_GorNaToth_ARMOR);
};

func void TPL_1402_GorNaToth_ARMOR_H()
{
	AI_Output(hero,self,"Info_GorNaToth_ARMOR_H_15_01");	//Chcia³bym otrzymaæ ciê¿k¹ zbrojê Stra¿y Œwi¹tynnej.
	if(Kapitel < 4)
	{
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_H_11_02");	//Nie jesteœ jeszcze wystarczaj¹co doœwiadczony. Udowodnij swoj¹ przydatnoœæ dla naszej spo³ecznoœci, a dost¹pisz zaszczytu noszenia tak wspania³ego pancerza.
	}
	else if(Npc_HasItems(hero,ItMiNugget) < value_tpl_armor_h)
	{
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_H_11_03");	//Widzê, ¿e jesteœ ju¿ gotów, by nosiæ tê wspania³¹ zbrojê. Gdybyœ tylko mia³ doœæ rudy, by wspomóc nasz¹ ma³¹ spo³ecznoœæ jakimœ hojnym datkiem...
	}
	else
	{
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_H_11_04");	//Od tej pory ten wspania³y pancerz bêdzie dawa³ œwiadectwo twego mêstwa i poœwiêcenia.
		B_GiveInvItems(hero,self,ItMiNugget,value_tpl_armor_h);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		CreateInvItem(hero,tpl_armor_h);
		AI_EquipBestArmor(hero);
	};
	Info_ClearChoices(TPL_1402_GorNaToth_ARMOR);
};

func void TPL_1402_GorNaToth_ARMOR_BACK()
{
	AI_Output(hero,self,"Info_GorNaToth_ARMOR_BACK_15_01");	//Chyba siê jednak rozmyœlê.
	AI_Output(self,hero,"Info_GorNaToth_ARMOR_BACK_11_02");	//Jak sobie ¿yczysz. Wiesz, gdzie mnie szukaæ.
	Info_ClearChoices(TPL_1402_GorNaToth_ARMOR);
};


instance TPL_1402_GorNaToth_Teach(C_Info)
{
	npc = TPL_1402_GorNaToth;
	nr = 10;
	condition = TPL_1402_GorNaToth_Teach_Condition;
	information = TPL_1402_GorNaToth_Teach_Info;
	permanent = 1;
	description = "Mo¿esz mnie czegoœ nauczyæ?";
};


func int TPL_1402_GorNaToth_Teach_Condition()
{
	if(C_NpcBelongsToPsiCamp(hero))
	{
		return TRUE;
	};
};

func void TPL_1402_GorNaToth_Teach_Info()
{
	AI_Output(other,self,"TPL_1402_GorNaToth_Teach_15_00");	//Mo¿esz mnie czegoœ nauczyæ?
	AI_Output(self,other,"TPL_1402_GorNaToth_Teach_11_01");	//Si³a i zrêcznoœæ s¹ równie istotne jak potêga umys³u.
	Info_ClearChoices(TPL_1402_GorNaToth_Teach);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,DIALOG_BACK,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_1);
	if(log_gornatothtrain == FALSE)
	{
		Log_CreateTopic(GE_TeacherPSI,LOG_NOTE);
		B_LogEntry(GE_TeacherPSI,"Gor Na Toth mo¿e mi pomóc zwiêkszyæ moj¹ si³ê, zrêcznoœæ i mana.");
		log_gornatothtrain = TRUE;
	};
};

func void TPL_1402_GorNaToth_Teach_BACK()
{
	Info_ClearChoices(TPL_1402_GorNaToth_Teach);
};

func void TPL_1402_GorNaToth_Teach_STR_1()
{
	B_BuyAttributePoints(other,ATR_STRENGTH,LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(TPL_1402_GorNaToth_Teach);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,DIALOG_BACK,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_1);
};

func void TPL_1402_GorNaToth_Teach_STR_5()
{
	B_BuyAttributePoints(other,ATR_STRENGTH,5 * LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(TPL_1402_GorNaToth_Teach);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,DIALOG_BACK,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_1);
};

func void TPL_1402_GorNaToth_Teach_DEX_1()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(TPL_1402_GorNaToth_Teach);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,DIALOG_BACK,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_1);
};

func void TPL_1402_GorNaToth_Teach_DEX_5()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(TPL_1402_GorNaToth_Teach);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,DIALOG_BACK,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_1);
};

func void TPL_1402_GorNaToth_Teach_MAN_1()
{
	B_BuyAttributePoints(other,ATR_MANA_MAX,LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices(TPL_1402_GorNaToth_Teach);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,DIALOG_BACK,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_1);
};

func void TPL_1402_GorNaToth_Teach_MAN_5()
{
	B_BuyAttributePoints(other,ATR_MANA_MAX,5 * LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices(TPL_1402_GorNaToth_Teach);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,DIALOG_BACK,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_1);
};


instance TPL_1402_GorNaToth_TRAIN(C_Info)
{
	npc = TPL_1402_GorNaToth;
	condition = TPL_1402_GorNaToth_TRAIN_Condition;
	information = TPL_1402_GorNaToth_TRAIN_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_Learn1h_1,LPCOST_TALENT_1H_1,0);
};


func int TPL_1402_GorNaToth_TRAIN_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_1H) < 1) && C_NpcBelongsToPsiCamp(hero))
	{
		return TRUE;
	};
};

func void TPL_1402_GorNaToth_TRAIN_Info()
{
	if(log_gornatothfight == FALSE)
	{
		Log_CreateTopic(GE_TeacherPSI,LOG_NOTE);
		B_LogEntry(GE_TeacherPSI,"Gor Na Toth mo¿e mnie nauczyæ walki jednorêcznym orê¿em.");
		log_gornatothfight = TRUE;
	};
	AI_Output(other,self,"TPL_1402_GorNaToth_TRAIN_Info_15_00");	//Chcia³bym nauczyæ siê walki jednorêcznym orê¿em.
	if(B_GiveSkill(hero,NPC_TALENT_1H,1,LPCOST_TALENT_1H_1))
	{
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_01");	//M¹dra decyzja. Jednak zanim poznasz bardziej zaawansowane techniki, powinieneœ nauczyæ siê prawid³owo trzymaæ orê¿ w rêku.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_02");	//Pocz¹tkuj¹cy czêsto ³api¹ zwyk³y miecz obydwoma rêkami. Radzi³bym ci siê do tego nie przyzwyczajaæ, to fatalny nawyk.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_03");	//Trzymaj broñ jedn¹ rêk¹, ostrzem do góry, i zacznij ni¹ machaæ.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_04");	//Musisz siê nauczyæ, jak zgraæ twoje ruchy z bezw³adnoœci¹ orê¿a. Dziêki temu twoje ataki bêd¹ szybsze i bardziej zaskakuj¹ce.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_05");	//Zapamiêtaj sobie dobrze co ci powiedzia³em, a twój styl walki stanie siê o wiele bardziej elegancki i skuteczny.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_06");	//A, i jeszcze coœ! Niektóre ciosy powoduj¹ wiêksze obra¿enia ni¿ zwykle. Oczywiœcie, jako pocz¹tkuj¹cy masz raczej niewielkie szanse na zadanie krytycznego uderzenia.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_07");	//Ale to siê zmieni w miarê czynienia przez ciebie postêpów.
		TPL_1402_GorNaToth_TRAIN.permanent = 0;
		AI_StopProcessInfos(self);
	};
};


instance TPL_1402_GORNATOTH_TRAINAGAIN(C_Info)
{
	npc = TPL_1402_GorNaToth;
	condition = tpl_1402_gornatoth_trainagain_condition;
	information = tpl_1402_gornatoth_trainagain_info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_Learn1h_2,LPCOST_TALENT_1H_2,0);
};


func int tpl_1402_gornatoth_trainagain_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 1) && C_NpcBelongsToPsiCamp(hero))
	{
		return TRUE;
	};
};

func void tpl_1402_gornatoth_trainagain_info()
{
	AI_Output(other,self,"TPL_1402_GorNaToth_TRAINAGAIN_Info_15_01");	//Naucz mnie, jak sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if(B_GiveSkill(hero,NPC_TALENT_1H,2,LPCOST_TALENT_1H_2))
	{
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_02");	//Dobrze, podstawy ju¿ znasz. Nieznaczne opuszczenie broni zwiêkszy si³ê twojego pierwszego ciosu.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_03");	//Musisz wykorzystaæ si³ê bezw³adnoœci, pamiêtasz? Œwietnie. Teraz nauczysz siê lepiej balansowaæ cia³em. Po zadaniu dwóch ciosów wykonaj obrót. To powinno zmyliæ twojego przeciwnika i pozwoliæ ci wyjœæ na dobr¹ pozycjê do nastêpnego ataku.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_04");	//Wtedy wyprowadŸ nastêpne ciêcie z prawej strony...
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_05");	//I znowu do przodu. Pamiêtaj - trening czyni mistrza, wiêc najlepiej weŸ siê od razu do roboty!
		tpl_1402_gornatoth_trainagain.permanent = 0;
		AI_StopProcessInfos(self);
	};
};


var int joinpsi_aufgabe;

instance DIA_GORNATOTH_JAGD(C_Info)
{
	npc = TPL_1402_GorNaToth;
	nr = 1;
	condition = dia_gornatoth_jagd_condition;
	information = dia_gornatoth_jagd_info;
	permanent = 1;
	description = "Za czym tak wygl¹dasz?";
};


func int dia_gornatoth_jagd_condition()
{
	if(Npc_KnowsInfo(hero,DIA_GorNaToth_AngarTalked) && (shark_hunter == TRUE) && (Kapitel == 3))
	{
		return 1;
	};
};

func void dia_gornatoth_jagd_info()
{
	AI_Output(other,self,"DIA_GorNaToth_Jagd_15_00");	//Za czym tak wygl¹dasz?
	if(C_NpcBelongsToPsiCamp(hero))
	{
		AI_Output(self,other,"DIA_GorNaToth_Jagd_11_01");	//Gor Na Ran widzia³ kilka dni temu b³otnego wê¿a, który krêci³ siê niebezpiecznie blisko obozu.
		AI_Output(self,other,"DIA_GorNaToth_Jagd_11_02");	//Wprawdzie zaatakowa³ go, ale uda³o mu siê urwaæ z powrotem w bagna i na pewno przygotowuje siê ju¿ do nastêpnego ataku.
		AI_Output(self,other,"DIA_GorNaToth_Jagd_11_03");	//Nadszed³ czas na mój œwiêty obowi¹zek.
		joinpsi_aufgabe = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_GorNaToth_Jagd_11_04");	//ZejdŸ mi z oczu! Zadania Stra¿y Œwi¹tynnej s¹ zbyt skomplikowane, ¿eby niewierni mieli to zrozumieæ.
		AI_StopProcessInfos(self);
	};
};


instance DIA_GORNATOTH_HELFEN(C_Info)
{
	npc = TPL_1402_GorNaToth;
	nr = 1;
	condition = dia_gornatoth_helfen_condition;
	information = dia_gornatoth_helfen_info;
	permanent = 0;
	description = "A mogê ci pomóc przy twym œwiêtym obowi¹zku?";
};


func int dia_gornatoth_helfen_condition()
{
	if((joinpsi_aufgabe == TRUE) && (shark_hunter == TRUE))
	{
		return 1;
	};
};

func void dia_gornatoth_helfen_info()
{
	AI_Output(other,self,"DIA_GorNaToth_Helfen_15_00");	//A mogê ci pomóc przy twym "œwiêtym obowi¹zku"?
	AI_Output(self,other,"DIA_GorNaToth_Helfen_11_01");	//Tak, mo¿esz. Chyba nawet bêdzie lepiej, jeœli zaatakujemy tego wê¿a we dwójkê.
	if(Npc_GetTrueGuild(hero) == GIL_TPL)
	{
		AI_Output(self,other,"DIA_GorNaToth_Helfen_11_02");	//Wprawdzie jesteœ jeszcze Nowicjuszem, ale jeœli Œni¹cy jest z tob¹, to i w tej sytuacji sobie poradzisz.
	}
	else if(Npc_GetTrueGuild(hero) == GIL_TPL)
	{
		AI_Output(self,other,"DIA_GorNaToth_Helfen_11_03");	//W koñcu jako Stra¿nik Œni¹cego do twoich obowi¹zków nale¿y ochrona obozu.
	}
	else if(Npc_GetTrueGuild(hero) == GIL_GUR)
	{
		AI_Output(self,other,"DIA_GorNaToth_Helfen_11_04");	//Jako ¿e jesteœ jednym z Guru naszego obozu, to jestem pewien, ¿e twoja magia i si³a duchowa dadz¹ nam przewagê w walce.
	};
	AI_Output(self,other,"DIA_GorNaToth_Helfen_11_05");	//Razem pozbêdziemy siê tego wê¿a b³otnego.
	AI_Output(self,other,"DIA_GorNaToth_Helfen_11_06");	//Ale powinniœmy zachowaæ ostro¿noœæ.
	AI_Output(self,other,"DIA_GorNaToth_Helfen_11_07");	//Gor Na Ran twierdzi³, ¿e tu nie chodzi o zwyk³ego wê¿a. Wydaje siê byæ o wiele silniejszy i agresywniejszy od przeciêtnych okazów.
	AI_Output(self,other,"DIA_GorNaToth_Helfen_11_08");	//Najlepiej idŸ za mn¹. Pójdê przodem i przeprowadzê nas przez bagno mo¿liwie jak najbezpieczniej.
	AI_Output(self,other,"DIA_GorNaToth_Helfen_11_09");	//Niech Œni¹cy bêdzie z nami!
	gornatoth_sharkhunt = LOG_RUNNING;
	Log_CreateTopic(CH3_SHARKHUNT,LOG_MISSION);
	Log_SetTopicStatus(CH3_SHARKHUNT,LOG_RUNNING);
	B_LogEntry(CH3_SHARKHUNT,"Gor Na Toth powiedzia³ mi, ¿e w pobli¿u obozu krêci siê ranny w¹¿ b³otny. Zgodzi³em siê mu pomóc w odnalezieniu tego wê¿a.");
	Npc_ExchangeRoutine(self,"GUIDE");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(HurtSwampshark,"PATH_AROUND_PSI21");
};


instance DIA_GORNATOTH_ERLEDIGT(C_Info)
{
	npc = TPL_1402_GorNaToth;
	nr = 1;
	condition = dia_gornatoth_erledigt_condition;
	information = dia_gornatoth_erledigt_info;
	permanent = 0;
	important = 1;
	description = "Ten w¹¿ b³otny nale¿y ju¿ do przesz³oœci.";
};


func int dia_gornatoth_erledigt_condition()
{
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"PATH_AROUND_PSI21"))
	{
		return 1;
	};
};

func void dia_gornatoth_erledigt_info()
{
	AI_Output(self,other,"DIA_GorNaToth_Erledigt_15_00");	//Ten w¹¿ b³otny nale¿y ju¿ do przesz³oœci.
	AI_Output(self,other,"DIA_GorNaToth_Erledigt_12_01");	//Znakomita robota. Obóz znowu powinien byæ przez jakiœ czas bezpieczny.
	AI_Output(self,other,"DIA_GorNaToth_Erledigt_12_02");	//Mo¿esz ju¿ wracaæ do obozu i zaj¹æ siê z powrotem swoimi obowi¹zkami.
	AI_Output(other,self,"DIA_GorNaToth_Erledigt_12_03");	//A co z nagrod¹?
	AI_Output(self,other,"DIA_GorNaToth_Erledigt_12_04");	//A czy nie dosta³eœ ju¿ doœæ w swoje rêce?
	AI_Output(self,other,"DIA_GorNaToth_Erledigt_12_05");	//Czy¿ nie jest to piêkne, byæ natchnionym przez samego Œni¹cego?
	AI_Output(self,other,"DIA_GorNaToth_Erledigt_12_06");	//Jestem pewien, ¿e Œni¹cy czuwa nad twoimi postêpkami i zawsze jest przy tobie.
	AI_Output(self,other,"DIA_GorNaToth_Erledigt_12_07");	//Powodzenia przy pozosta³ych zadaniach. Nigdy nie zapominaj, ¿e wszystko co robisz, jest ku chwale Œni¹cego. On nas wszystkich uwolni.
	gornatoth_sharkhunt = LOG_SUCCESS;
	B_GiveXP(XP_SHARKHUNT);
	Log_SetTopicStatus(CH3_SHARKHUNT,LOG_SUCCESS);
	B_LogEntry(CH3_SHARKHUNT,"Sprz¹tn¹³em tego b³otnego wê¿a razem z Gor Na Tothem. Niestety, zamiast jakiejœ namacalnej nagrody, zyska³em jedynie przychylnoœæ Œni¹cego.");
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};

