
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
	description = "Mo�esz mnie czego� nauczy�?";
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
	AI_Output(other,self,"DIA_GorNaToth_AngarTalked_15_00");	//Mo�esz mnie czego� nauczy�?
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_11_01");	//Zejd� mi z oczu, niegodny robaku! Ucz� wy��cznie Stra�nik�w �wi�tyni �ni�cego.
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
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_11_00");	//Rozmawia�e� z Cor Angarem? I co powiedzia�?
	Info_ClearChoices(DIA_GorNaToth_AngarTalked);
	Info_AddChoice(DIA_GorNaToth_AngarTalked,"Powiedzia�, �e jeste� niegodny, by nosi� zbroj� �wi�tynnego Stra�nika.",DIA_GorNaToth_AngarTalked_Unworthy);
	Info_AddChoice(DIA_GorNaToth_AngarTalked,"Powiedzia�, �e nigdy nie lubi� b�otnych w�y.",DIA_GorNaToth_AngarTalked_Shark);
	Info_AddChoice(DIA_GorNaToth_AngarTalked,"Kaza� mi zg�osi� si� do niego, gdy ju� zostan� �wi�tynnym Stra�nikiem.",DIA_GorNaToth_AngarTalked_Normal);
};

func void DIA_GorNaToth_AngarTalked_Normal()
{
	AI_Output(other,self,"DIA_GorNaToth_AngarTalked_Normal_15_00");	//Kaza� mi zg�osi� si� do niego, gdy ju� zostan� �wi�tynnym Stra�nikiem.
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Normal_11_01");	//Najwyra�niej ma o tobie wysokie mniemanie. Inaczej nie odezwa�by si� do ciebie.
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Normal_11_02");	//To wielki zaszczyt zosta� przez niego cho�by zauwa�onym. Do mnie odezwa� si� po raz ostatni ca�e dwa miesi�ce temu!
	Info_ClearChoices(DIA_GorNaToth_AngarTalked);
};

func void DIA_GorNaToth_AngarTalked_Shark()
{
	AI_Output(other,self,"DIA_GorNaToth_AngarTalked_Shark_15_00");	//Powiedzia�, �e nigdy nie lubi� b�otnych w�y.
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Shark_11_01");	//Co...? (zdecydowanie) Czeka mnie �wi�ta misja!
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Shark_11_02");	//�yczenie mojego mistrza jest dla mnie rozkazem.
	shark_hunter = TRUE;
	Info_ClearChoices(DIA_GorNaToth_AngarTalked);
};

func void DIA_GorNaToth_AngarTalked_Unworthy()
{
	AI_Output(other,self,"DIA_GorNaToth_AngarTalked_Unworthy_15_00");	//Powiedzia�, �e jeste� niegodny, by nosi� zbroj� �wi�tynnego Stra�nika.
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Unworthy_11_01");	//Nigdy! Nie m�g� tak powiedzie�! Nie o mnie!
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
	description = "Chcia�bym odebra� moj� zbroj� �wi�tynnego Stra�nika.";
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
	AI_Output(other,self,"TPL_1402_GorNaToth_GETSTUFF_Info_15_01");	//Chcia�bym odebra� moj� zbroj� �wi�tynnego Stra�nika.
	AI_Output(self,other,"TPL_1402_GorNaToth_GETSTUFF_Info_11_02");	//To prawdziwy zaszczyt wr�czy� zbroj� cz�owiekowi, kt�ry zdoby� dla nas jaja pe�zaczy.
	AI_Output(self,other,"TPL_1402_GorNaToth_GETSTUFF_Info_11_03");	//Niech ta zbroja chroni ci� r�wnie dobrze jak �ni�cy chroni nasze Bractwo!
	B_LogEntry(GE_BecomeTemplar,"Gor Na Toth da� mi moj� pierwsz� zbroj� �wi�tynnej Stra�y. Teraz jestem pe�noprawnym cz�onkiem tej spo�eczno�ci!");
	Log_CreateTopic(GE_TraderPSI,LOG_NOTE);
	B_LogEntry(GE_TraderPSI,"Gor Na Toth ma na sk�adzie lepsze zbroje �wi�tynnej Stra�y. Niestety, �eby je otrzyma�, musz� najpierw z�o�y� poka�ny datek na rzecz Bractwa. W ci�gu dnia Toth przebywa zwykle na placu treningowym.");
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
	description = "Potrzebuj� lepszej zbroi.";
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
	AI_Output(other,self,"Info_GorNaToth_ARMOR_15_01");	//Potrzebuj� lepszej zbroi.
	AI_Output(self,other,"Info_GorNaToth_ARMOR_11_02");	//C�, m�g�bym ci da� lepsz� zbroj�, ale musia�by� najpierw przekaza� spory datek na rzecz Bractwa.
	Info_ClearChoices(TPL_1402_GorNaToth_ARMOR);
	Info_AddChoice(TPL_1402_GorNaToth_ARMOR,DIALOG_BACK,TPL_1402_GorNaToth_ARMOR_BACK);
	Info_AddChoice(TPL_1402_GorNaToth_ARMOR,B_BuildBuyArmorString(NAME_GorNaTothHeavyTpl,value_tpl_armor_h),TPL_1402_GorNaToth_ARMOR_H);
	Info_AddChoice(TPL_1402_GorNaToth_ARMOR,B_BuildBuyArmorString(NAME_GorNaTothTpl,value_tpl_armor_m),TPL_1402_GorNaToth_ARMOR_M);
};

func void TPL_1402_GorNaToth_ARMOR_M()
{
	AI_Output(hero,self,"Info_GorNaToth_ARMOR_M_15_01");	//Potrzebuj� wzmocnionej zbroi Stra�nik�w �wi�tynnych.
	if(Kapitel < 3)
	{
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_M_11_02");	//Nie jeste� wystarczaj�co do�wiadczony. Udowodnij swoj� przydatno�� w Stra�y, a zas�u�ysz sobie na lepszy pancerz!
	}
	else if(Npc_HasItems(hero,ItMiNugget) < value_tpl_armor_m)
	{
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_M_11_03");	//Gdy tylko wesprzesz nasz� spo�eczno�� odpowiednim datkiem, zbroja b�dzie twoja!
	}
	else
	{
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_M_11_04");	//Teraz, gdy jeste� got�w wesprze� nas swoim hojnym datkiem, mo�esz odebra� swoj� zbroj�.
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
	AI_Output(hero,self,"Info_GorNaToth_ARMOR_H_15_01");	//Chcia�bym otrzyma� ci�k� zbroj� Stra�y �wi�tynnej.
	if(Kapitel < 4)
	{
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_H_11_02");	//Nie jeste� jeszcze wystarczaj�co do�wiadczony. Udowodnij swoj� przydatno�� dla naszej spo�eczno�ci, a dost�pisz zaszczytu noszenia tak wspania�ego pancerza.
	}
	else if(Npc_HasItems(hero,ItMiNugget) < value_tpl_armor_h)
	{
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_H_11_03");	//Widz�, �e jeste� ju� got�w, by nosi� t� wspania�� zbroj�. Gdyby� tylko mia� do�� rudy, by wspom�c nasz� ma�� spo�eczno�� jakim� hojnym datkiem...
	}
	else
	{
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_H_11_04");	//Od tej pory ten wspania�y pancerz b�dzie dawa� �wiadectwo twego m�stwa i po�wi�cenia.
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
	AI_Output(hero,self,"Info_GorNaToth_ARMOR_BACK_15_01");	//Chyba si� jednak rozmy�l�.
	AI_Output(self,hero,"Info_GorNaToth_ARMOR_BACK_11_02");	//Jak sobie �yczysz. Wiesz, gdzie mnie szuka�.
	Info_ClearChoices(TPL_1402_GorNaToth_ARMOR);
};


instance TPL_1402_GorNaToth_Teach(C_Info)
{
	npc = TPL_1402_GorNaToth;
	nr = 10;
	condition = TPL_1402_GorNaToth_Teach_Condition;
	information = TPL_1402_GorNaToth_Teach_Info;
	permanent = 1;
	description = "Mo�esz mnie czego� nauczy�?";
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
	AI_Output(other,self,"TPL_1402_GorNaToth_Teach_15_00");	//Mo�esz mnie czego� nauczy�?
	AI_Output(self,other,"TPL_1402_GorNaToth_Teach_11_01");	//Si�a i zr�czno�� s� r�wnie istotne jak pot�ga umys�u.
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
		B_LogEntry(GE_TeacherPSI,"Gor Na Toth mo�e mi pom�c zwi�kszy� moj� si��, zr�czno�� i mana.");
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
		B_LogEntry(GE_TeacherPSI,"Gor Na Toth mo�e mnie nauczy� walki jednor�cznym or�em.");
		log_gornatothfight = TRUE;
	};
	AI_Output(other,self,"TPL_1402_GorNaToth_TRAIN_Info_15_00");	//Chcia�bym nauczy� si� walki jednor�cznym or�em.
	if(B_GiveSkill(hero,NPC_TALENT_1H,1,LPCOST_TALENT_1H_1))
	{
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_01");	//M�dra decyzja. Jednak zanim poznasz bardziej zaawansowane techniki, powiniene� nauczy� si� prawid�owo trzyma� or� w r�ku.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_02");	//Pocz�tkuj�cy cz�sto �api� zwyk�y miecz obydwoma r�kami. Radzi�bym ci si� do tego nie przyzwyczaja�, to fatalny nawyk.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_03");	//Trzymaj bro� jedn� r�k�, ostrzem do g�ry, i zacznij ni� macha�.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_04");	//Musisz si� nauczy�, jak zgra� twoje ruchy z bezw�adno�ci� or�a. Dzi�ki temu twoje ataki b�d� szybsze i bardziej zaskakuj�ce.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_05");	//Zapami�taj sobie dobrze co ci powiedzia�em, a tw�j styl walki stanie si� o wiele bardziej elegancki i skuteczny.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_06");	//A, i jeszcze co�! Niekt�re ciosy powoduj� wi�ksze obra�enia ni� zwykle. Oczywi�cie, jako pocz�tkuj�cy masz raczej niewielkie szanse na zadanie krytycznego uderzenia.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_07");	//Ale to si� zmieni w miar� czynienia przez ciebie post�p�w.
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
	AI_Output(other,self,"TPL_1402_GorNaToth_TRAINAGAIN_Info_15_01");	//Naucz mnie, jak sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if(B_GiveSkill(hero,NPC_TALENT_1H,2,LPCOST_TALENT_1H_2))
	{
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_02");	//Dobrze, podstawy ju� znasz. Nieznaczne opuszczenie broni zwi�kszy si�� twojego pierwszego ciosu.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_03");	//Musisz wykorzysta� si�� bezw�adno�ci, pami�tasz? �wietnie. Teraz nauczysz si� lepiej balansowa� cia�em. Po zadaniu dw�ch cios�w wykonaj obr�t. To powinno zmyli� twojego przeciwnika i pozwoli� ci wyj�� na dobr� pozycj� do nast�pnego ataku.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_04");	//Wtedy wyprowad� nast�pne ci�cie z prawej strony...
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_05");	//I znowu do przodu. Pami�taj - trening czyni mistrza, wi�c najlepiej we� si� od razu do roboty!
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
	description = "Za czym tak wygl�dasz?";
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
	AI_Output(other,self,"DIA_GorNaToth_Jagd_15_00");	//Za czym tak wygl�dasz?
	if(C_NpcBelongsToPsiCamp(hero))
	{
		AI_Output(self,other,"DIA_GorNaToth_Jagd_11_01");	//Gor Na Ran widzia� kilka dni temu b�otnego w�a, kt�ry kr�ci� si� niebezpiecznie blisko obozu.
		AI_Output(self,other,"DIA_GorNaToth_Jagd_11_02");	//Wprawdzie zaatakowa� go, ale uda�o mu si� urwa� z powrotem w bagna i na pewno przygotowuje si� ju� do nast�pnego ataku.
		AI_Output(self,other,"DIA_GorNaToth_Jagd_11_03");	//Nadszed� czas na m�j �wi�ty obowi�zek.
		joinpsi_aufgabe = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_GorNaToth_Jagd_11_04");	//Zejd� mi z oczu! Zadania Stra�y �wi�tynnej s� zbyt skomplikowane, �eby niewierni mieli to zrozumie�.
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
	description = "A mog� ci pom�c przy twym �wi�tym obowi�zku?";
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
	AI_Output(other,self,"DIA_GorNaToth_Helfen_15_00");	//A mog� ci pom�c przy twym "�wi�tym obowi�zku"?
	AI_Output(self,other,"DIA_GorNaToth_Helfen_11_01");	//Tak, mo�esz. Chyba nawet b�dzie lepiej, je�li zaatakujemy tego w�a we dw�jk�.
	if(Npc_GetTrueGuild(hero) == GIL_TPL)
	{
		AI_Output(self,other,"DIA_GorNaToth_Helfen_11_02");	//Wprawdzie jeste� jeszcze Nowicjuszem, ale je�li �ni�cy jest z tob�, to i w tej sytuacji sobie poradzisz.
	}
	else if(Npc_GetTrueGuild(hero) == GIL_TPL)
	{
		AI_Output(self,other,"DIA_GorNaToth_Helfen_11_03");	//W ko�cu jako Stra�nik �ni�cego do twoich obowi�zk�w nale�y ochrona obozu.
	}
	else if(Npc_GetTrueGuild(hero) == GIL_GUR)
	{
		AI_Output(self,other,"DIA_GorNaToth_Helfen_11_04");	//Jako �e jeste� jednym z Guru naszego obozu, to jestem pewien, �e twoja magia i si�a duchowa dadz� nam przewag� w walce.
	};
	AI_Output(self,other,"DIA_GorNaToth_Helfen_11_05");	//Razem pozb�dziemy si� tego w�a b�otnego.
	AI_Output(self,other,"DIA_GorNaToth_Helfen_11_06");	//Ale powinni�my zachowa� ostro�no��.
	AI_Output(self,other,"DIA_GorNaToth_Helfen_11_07");	//Gor Na Ran twierdzi�, �e tu nie chodzi o zwyk�ego w�a. Wydaje si� by� o wiele silniejszy i agresywniejszy od przeci�tnych okaz�w.
	AI_Output(self,other,"DIA_GorNaToth_Helfen_11_08");	//Najlepiej id� za mn�. P�jd� przodem i przeprowadz� nas przez bagno mo�liwie jak najbezpieczniej.
	AI_Output(self,other,"DIA_GorNaToth_Helfen_11_09");	//Niech �ni�cy b�dzie z nami!
	gornatoth_sharkhunt = LOG_RUNNING;
	Log_CreateTopic(CH3_SHARKHUNT,LOG_MISSION);
	Log_SetTopicStatus(CH3_SHARKHUNT,LOG_RUNNING);
	B_LogEntry(CH3_SHARKHUNT,"Gor Na Toth powiedzia� mi, �e w pobli�u obozu kr�ci si� ranny w�� b�otny. Zgodzi�em si� mu pom�c w odnalezieniu tego w�a.");
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
	description = "Ten w�� b�otny nale�y ju� do przesz�o�ci.";
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
	AI_Output(self,other,"DIA_GorNaToth_Erledigt_15_00");	//Ten w�� b�otny nale�y ju� do przesz�o�ci.
	AI_Output(self,other,"DIA_GorNaToth_Erledigt_12_01");	//Znakomita robota. Ob�z znowu powinien by� przez jaki� czas bezpieczny.
	AI_Output(self,other,"DIA_GorNaToth_Erledigt_12_02");	//Mo�esz ju� wraca� do obozu i zaj�� si� z powrotem swoimi obowi�zkami.
	AI_Output(other,self,"DIA_GorNaToth_Erledigt_12_03");	//A co z nagrod�?
	AI_Output(self,other,"DIA_GorNaToth_Erledigt_12_04");	//A czy nie dosta�e� ju� do�� w swoje r�ce?
	AI_Output(self,other,"DIA_GorNaToth_Erledigt_12_05");	//Czy� nie jest to pi�kne, by� natchnionym przez samego �ni�cego?
	AI_Output(self,other,"DIA_GorNaToth_Erledigt_12_06");	//Jestem pewien, �e �ni�cy czuwa nad twoimi post�pkami i zawsze jest przy tobie.
	AI_Output(self,other,"DIA_GorNaToth_Erledigt_12_07");	//Powodzenia przy pozosta�ych zadaniach. Nigdy nie zapominaj, �e wszystko co robisz, jest ku chwale �ni�cego. On nas wszystkich uwolni.
	gornatoth_sharkhunt = LOG_SUCCESS;
	B_GiveXP(XP_SHARKHUNT);
	Log_SetTopicStatus(CH3_SHARKHUNT,LOG_SUCCESS);
	B_LogEntry(CH3_SHARKHUNT,"Sprz�tn��em tego b�otnego w�a razem z Gor Na Tothem. Niestety, zamiast jakiej� namacalnej nagrody, zyska�em jedynie przychylno�� �ni�cego.");
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};

