
instance DIA_ORG_855_Wolf_Exit(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 999;
	condition = DIA_ORG_855_Wolf_Exit_Condition;
	information = DIA_ORG_855_Wolf_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_ORG_855_Wolf_Exit_Condition()
{
	return TRUE;
};

func void DIA_ORG_855_Wolf_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wolf_Hello(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 1;
	condition = DIA_Wolf_Hello_Condition;
	information = DIA_Wolf_Hello_Info;
	permanent = 0;
	description = "Kim jeste�?";
};


func int DIA_Wolf_Hello_Condition()
{
	return TRUE;
};

func void DIA_Wolf_Hello_Info()
{
	AI_Output(other,self,"DIA_Wolf_Hello_15_00");	//Kim jeste�?
	AI_Output(self,other,"DIA_Wolf_Hello_09_01");	//Jestem p�atnerzem. M�wi� na mnie Wilk.
	Log_CreateTopic(GE_TraderNC,LOG_NOTE);
	B_LogEntry(GE_TraderNC,"Wilk zaopatruje Szkodniki w zbroje. Zwykle przesiaduje przed swoj� chat�, w wielkiej jaskini.");
};


instance DIA_Wolf_GreetORG(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 1;
	condition = DIA_Wolf_GreetORG_Condition;
	information = DIA_Wolf_GreetORG_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Wolf_GreetORG_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_ORG)
	{
		return TRUE;
	};
};

func void DIA_Wolf_GreetORG_Info()
{
	AI_Output(self,other,"DIA_Wolf_GreetORG_09_00");	//Hej, teraz jeste� jednym z nas!
};


instance Org_855_Wolf_TRADE(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 2;
	condition = Org_855_Wolf_TRADE_Condition;
	information = Org_855_Wolf_TRADE_Info;
	permanent = 0;
	description = "Zajmujesz si� czym� jeszcze?";
};


func int Org_855_Wolf_TRADE_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Wolf_Hello))
	{
		return TRUE;
	};
};

func void Org_855_Wolf_TRADE_Info()
{
	AI_Output(other,self,"Org_855_Wolf_TRADE_15_00");	//Zajmujesz si� czym� jeszcze?
	AI_Output(self,other,"Org_855_Wolf_TRADE_09_01");	//Skupuj� sk�ry i futra od my�liwych. Gdyby� mia� kiedy� taki towar na zbyciu - zg�o� si� do mnie.
};


instance ORG_855_WOLF_TRADENOW(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 1;
	condition = org_855_wolf_tradenow_condition;
	information = org_855_wolf_tradenow_info;
	permanent = 1;
	description = "Poka� mi swoje towary.";
	trade = 1;
};


func int org_855_wolf_tradenow_condition()
{
	if(Npc_KnowsInfo(hero,Org_855_Wolf_TRADE))
	{
		return TRUE;
	};
};

func void org_855_wolf_tradenow_info()
{
	AI_Output(other,self,"STT_336_cavalorn_TRADE_Info_15_01");	//Poka� mi swoje towary.
};


instance Org_855_Wolf_WhereHunter(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 3;
	condition = Org_855_Wolf_WhereHunter_Condition;
	information = Org_855_Wolf_WhereHunter_Info;
	permanent = 1;
	description = "Jak mog� zdoby� futra albo sk�ry?";
};


func int Org_855_Wolf_WhereHunter_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Wolf_Hello))
	{
		return TRUE;
	};
};

func void Org_855_Wolf_WhereHunter_Info()
{
	AI_Output(other,self,"Org_855_Wolf_WhereHunter_15_00");	//Jak mog� zdoby� futra albo sk�ry?
	AI_Output(self,other,"Org_855_Wolf_WhereHunter_09_01");	//Po drodze do Starego Obozu natkniesz si� w ko�cu na tak� star� chat�. Nale�y ona do Aidana.
	AI_Output(self,other,"Org_855_Wolf_WhereHunter_10_02");	//Ale nigdy go tam praktycznie nie ma. Z tego co si� orientuj�, to kr�ci si� cz�sto daleko na wschodzie kolonii.
	AI_Output(self,other,"Org_855_Wolf_WhereHunter_10_03");	//On mo�e ci� nauczy�, jak �ci�ga� sk�r� ze zwierz�t.
	AI_Output(self,other,"Org_855_Wolf_WhereHunter_10_04");	//Drax i Ratford te� musz� si� gdzie� tam wa��sa�. Drax to do�wiadczony my�liwy i z pewno�ci� podzieli si� z tob� swoj� wiedz�.
	AI_Output(self,other,"Org_855_Wolf_WhereHunter_10_05");	//A Gestatha widzia�em ostatniego razu na drodze do Wolnej Kopalni. Ma tam gdzie� swoje ma�e obozowisko.
	AI_Output(self,other,"Org_855_Wolf_WhereHunter_10_06");	//Ach, i z tego co wiem, to ci rabusie w g�rach te� s� my�liwymi. Ale to tak tylko gdzie� zas�ysza�em, nie mam poj�cia ile w tym prawdy.
};


instance DIA_Wolf_SellArmor(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 4;
	condition = DIA_Wolf_SellArmor_Condition;
	information = DIA_Wolf_SellArmor_Info;
	permanent = 1;
	description = "Potrzebuj� lepszej zbroi.";
};


func int DIA_Wolf_SellArmor_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Wolf_Hello) && !Npc_KnowsInfo(hero,Info_Wolf_ARMORFINISHED))
	{
		return TRUE;
	};
};

func void DIA_Wolf_SellArmor_Info()
{
	AI_Output(other,self,"DIA_Wolf_SellArmor_15_00");	//Potrzebuj� lepszej zbroi.
	if((Npc_GetTrueGuild(other) == GIL_ORG) || (Npc_GetTrueGuild(other) == GIL_SLD))
	{
		AI_Output(self,other,"DIA_Wolf_SellArmor_09_01");	//Teraz, kiedy jeste� jednym z nas, mog� ci jak�� sprzeda�.
		Info_ClearChoices(DIA_Wolf_SellArmor);
		Info_AddChoice(DIA_Wolf_SellArmor,DIALOG_BACK,DIA_Wolf_SellArmor_BACK);
		Info_AddChoice(DIA_Wolf_SellArmor,B_BuildBuyArmorString(NAME_WolfBandits,value_org_armor_m),DIA_Wolf_SellArmor_M);
		Info_AddChoice(DIA_Wolf_SellArmor,B_BuildBuyArmorString(NAME_WolfHeavyBandits,value_org_armor_h),DIA_Wolf_SellArmor_H);
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_SellArmor_WRONGGUILD_09_00");	//Nie mog� ci nic sprzeda�. Lares zabi�by mnie, gdyby dowiedzia� si�, �e sprzedaj� zbroje obcym.
	};
};

func void DIA_Wolf_SellArmor_BACK()
{
	Info_ClearChoices(DIA_Wolf_SellArmor);
};

func void DIA_Wolf_SellArmor_M()
{
	AI_Output(other,self,"DIA_Wolf_SellArmor_M_15_01");	//Potrzebuj� wzmocnionego pancerza.
	if(Npc_HasItems(hero,ItMiNugget) < value_org_armor_m)
	{
		AI_Output(self,other,"DIA_Wolf_SellArmor_M_09_02");	//Nie ma rudy, nie ma zbroi.
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_SellArmor_M_09_03");	//To solidny pancerz. Oczywi�cie nie tak dobry jak ten, kt�ry mam na sobie, ale zapewnia niez�� ochron�.
		B_GiveInvItems(hero,self,ItMiNugget,value_org_armor_m);
		CreateInvItem(hero,org_armor_m);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
	};
};

func void DIA_Wolf_SellArmor_H()
{
	AI_Output(other,self,"DIA_Wolf_SellArmor_H_15_01");	//Mo�esz mi sprzeda� ci�ki pancerz?
	if(Npc_HasItems(hero,ItMiNugget) < value_org_armor_h)
	{
		AI_Output(self,other,"DIA_Wolf_SellArmor_H_09_02");	//Nie ma rudy, nie ma zbroi.
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_SellArmor_H_09_03");	//Ta zbroja uchroni ci� przed ka�dym zagro�eniem. Sam tak� nosz�, i jak dot�d nie zosta�em nawet dra�ni�ty. To bardzo solidny pancerz.
		B_GiveInvItems(hero,self,ItMiNugget,value_org_armor_h);
		CreateInvItem(hero,org_armor_h);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
	};
};


instance ORG_855_Wolf_TRAINOFFER(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 5;
	condition = ORG_855_Wolf_TRAINOFFER_Condition;
	information = ORG_855_Wolf_TRAINOFFER_Info;
	important = 0;
	permanent = 0;
	description = "Chcia�bym nauczy� si� strzela� z �uku.";
};


func int ORG_855_Wolf_TRAINOFFER_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_BOW) != 2) && Npc_KnowsInfo(hero,DIA_Wolf_Hello))
	{
		return TRUE;
	};
};

func void ORG_855_Wolf_TRAINOFFER_Info()
{
	AI_Output(other,self,"ORG_855_Wolf_TRAINOFFER_Info_15_01");	//Chcia�bym nauczy� si� strzela� z �uku.
	AI_Output(self,other,"ORG_855_Wolf_TRAINOFFER_Info_09_02");	//C�, m�g�bym ci� nauczy�, ale to b�dzie kosztowa�. Ja te� musz� je��, no nie?
	AI_Output(other,self,"ORG_855_Wolf_TRAINOFFER_Info_15_03");	//Ile?
	AI_Output(self,other,"ORG_855_Wolf_TRAINOFFER_Info_09_04");	//50 bry�ek, bez targowania.
	Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
	B_LogEntry(GE_TeacherNC,"Szkodnik imieniem Wilk mo�e mnie nauczy� strzelania z �uku.");
};


instance ORG_855_Wolf_TRAIN(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 5;
	condition = ORG_855_Wolf_TRAIN_Condition;
	information = ORG_855_Wolf_TRAIN_Info;
	important = 0;
	permanent = 0;
	description = B_BuildLearnString(NAME_LearnBow_1,LPCOST_TALENT_BOW_1,50);
};


func int ORG_855_Wolf_TRAIN_Condition()
{
	if(Npc_KnowsInfo(hero,ORG_855_Wolf_TRAINOFFER) && (Npc_GetTalentSkill(hero,NPC_TALENT_BOW) == 0))
	{
		return TRUE;
	};
};

func void ORG_855_Wolf_TRAIN_Info()
{
	AI_Output(other,self,"ORG_855_Wolf_TRAIN_Info_15_01");	//Naucz mnie strzela� z �uku.
	if(Npc_HasItems(hero,ItMiNugget) >= 50)
	{
		if(B_GiveSkill(hero,NPC_TALENT_BOW,1,LPCOST_TALENT_BOW_1))
		{
			AI_Output(self,other,"ORG_855_Wolf_TRAIN_Info_09_02");	//Twoja celno�� zale�y g��wnie od twojej zr�czno�ci. Im bardziej zwinnie b�d� twoje ruchy, tym pewniej twoje strza�y b�d� trafia�y w cel.
			AI_Output(self,other,"ORG_855_Wolf_TRAIN_Info_09_03");	//Twoje umiej�tno�ci wp�yn� na odleg�o�� z jakiej b�dziesz m�g� skutecznie razi� wrog�w. Je�li chcesz kiedy� zosta� strzelcem wyborowym, musisz systematycznie rozwija� zar�wno zr�czno�� jak i umiej�tno�ci.
			B_GiveInvItems(hero,self,ItMiNugget,50);
		};
	};
};


instance ORG_855_WOLF_TRAINAGAIN(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 5;
	condition = org_855_wolf_trainagain_condition;
	information = org_855_wolf_trainagain_info;
	important = 0;
	permanent = 0;
	description = B_BuildLearnString(NAME_LearnBow_2,LPCOST_TALENT_BOW_2,50);
};


func int org_855_wolf_trainagain_condition()
{
	if(Npc_KnowsInfo(hero,ORG_855_Wolf_TRAINOFFER) && (Npc_GetTalentSkill(hero,NPC_TALENT_BOW) == 1))
	{
		return TRUE;
	};
};

func void org_855_wolf_trainagain_info()
{
	AI_Output(other,self,"ORG_855_Wolf_TRAINAGAIN_Info_15_01");	//Chcia�bym sprawniej pos�ugiwa� si� �ukiem.
	if(Npc_HasItems(hero,ItMiNugget) >= 50)
	{
		if(B_GiveSkill(hero,NPC_TALENT_BOW,2,LPCOST_TALENT_BOW_2))
		{
			AI_Output(self,other,"ORG_855_Wolf_TRAINAGAIN_Info_09_02");	//Jeste� ju� ca�kiem niez�ym my�liwym. Teraz pora aby� pozna� reszt� najwa�niejszych informacji.
			AI_Output(self,other,"ORG_855_Wolf_TRAINAGAIN_Info_09_03");	//Dobry �ucznik bierze pod uwag� wiele czynnik�w zewn�trznych, ale robi to odruchowo, nie�wiadomie.
			AI_Output(self,other,"ORG_855_Wolf_TRAINAGAIN_Info_09_04");	//Odkryj tajniki funkcjonowania twojego oka, pami�taj o sile naci�gu i wyobra�aj sobie trajektori� lotu strza�y, ale przede wszystkim - zawsze b�d� czujny!
			AI_Output(self,other,"ORG_855_Wolf_TRAINAGAIN_Info_09_05");	//Opanowa�e� ju� wi�kszo�� tajnik�w strzelania z �uku. Teraz pozosta�o ci tylko rozwija� twoje umiej�tno�ci podczas polowania i walki.
			B_GiveInvItems(hero,self,ItMiNugget,50);
		};
	};
};


instance ORG_855_Wolf_Teach(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 6;
	condition = ORG_855_Wolf_Teach_Condition;
	information = ORG_855_Wolf_Teach_Info;
	permanent = 1;
	description = "Mo�esz mnie czego� nauczy�?";
};


func int ORG_855_Wolf_Teach_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_ORG) || (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		return TRUE;
	};
};

func void ORG_855_Wolf_Teach_Info()
{
	AI_Output(other,self,"ORG_855_Wolf_Teach_15_00");	//Mo�esz mnie czego� nauczy�?
	AI_Output(self,other,"ORG_855_Wolf_Teach_09_01");	//Powodzenie podczas polowania zale�y przede wszystkim od twojej zr�czno�ci.
	if(log_wolftrain == FALSE)
	{
		Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
		B_LogEntry(GE_TeacherNC,"Szkodnik imieniem Wilk mo�e pom�c mi zwi�kszy� moj� zwinno��.");
		log_wolftrain = TRUE;
	};
	Info_ClearChoices(ORG_855_Wolf_Teach);
	Info_AddChoice(ORG_855_Wolf_Teach,DIALOG_BACK,ORG_855_Wolf_Teach_BACK);
	Info_AddChoice(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_5);
	Info_AddChoice(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_1);
};

func void ORG_855_Wolf_Teach_BACK()
{
	Info_ClearChoices(ORG_855_Wolf_Teach);
};

func void ORG_855_Wolf_Teach_DEX_1()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(ORG_855_Wolf_Teach);
	Info_AddChoice(ORG_855_Wolf_Teach,DIALOG_BACK,ORG_855_Wolf_Teach_BACK);
	Info_AddChoice(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_5);
	Info_AddChoice(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_1);
};

func void ORG_855_Wolf_Teach_DEX_5()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(ORG_855_Wolf_Teach);
	Info_AddChoice(ORG_855_Wolf_Teach,DIALOG_BACK,ORG_855_Wolf_Teach_BACK);
	Info_AddChoice(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_5);
	Info_AddChoice(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_1);
};


instance Org_855_Wolf_SELLBOW(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 1;
	condition = Org_855_Wolf_SELLBOW_Condition;
	information = Org_855_Wolf_SELLBOW_Info;
	important = 0;
	permanent = 0;
	description = "Gdzie mog� kupi� jaki� �uk?";
};


func int Org_855_Wolf_SELLBOW_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Wolf_Hello))
	{
		return TRUE;
	};
};

func void Org_855_Wolf_SELLBOW_Info()
{
	AI_Output(other,self,"Org_855_Wolf_SELLBOW_Info_15_01");	//Gdzie mog� kupi� jaki� �uk?
	AI_Output(self,other,"Org_855_Wolf_SELLBOW_Info_09_02");	//Trafi�e� pod w�a�ciwy adres. Mam tu dobry towar za bardzo przyst�pne ceny.
	Log_CreateTopic(GE_TraderNC,LOG_NOTE);
	B_LogEntry(GE_TraderNC,"Szkodnik imieniem Wilk sprzedaje �uki.");
};


instance Info_Wolf_GOOD(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Info_Wolf_GOOD_Condition;
	information = Info_Wolf_GOOD_Info;
	important = 0;
	permanent = 0;
	description = "Gorn powiedzia�, �e chcesz ze mn� pilnie porozmawia�?";
};


func int Info_Wolf_GOOD_Condition()
{
	if(Gorn_GotoWolf == TRUE)
	{
		return TRUE;
	};
};

func void Info_Wolf_GOOD_Info()
{
	AI_Output(hero,self,"Info_Wolf_GOOD_15_01");	//Gorn powiedzia�, �e chcesz ze mn� pilnie porozmawia�?
	AI_Output(self,hero,"Info_Wolf_GOOD_09_02");	//Dobrze, �e zd��y�e� zajrze� do mnie przed wymarszem!
	if(!Npc_KnowsInfo(hero,Info_Gorn_FMCENTRANCE))
	{
		AI_Output(hero,self,"Info_Wolf_GOOD_15_03");	//Przed jakim wymarszem?
		AI_Output(self,hero,"Info_Wolf_GOOD_09_04");	//Przed waszym wymarszem do Niezupe�nie-Wolnej-Kopalni.
	};
};


instance Info_Wolf_SPEAK(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Info_Wolf_SPEAK_Condition;
	information = Info_Wolf_SPEAK_Info;
	important = 0;
	permanent = 0;
	description = "O co chodzi?";
};


func int Info_Wolf_SPEAK_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Wolf_GOOD))
	{
		return TRUE;
	};
};

func void Info_Wolf_SPEAK_Info()
{
	AI_Output(hero,self,"Info_Wolf_SPEAK_15_01");	//O co chodzi?
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_02");	//Mam pomys� na zupe�nie nowy rodzaj pancerza.
	AI_Output(hero,self,"Info_Wolf_SPEAK_15_03");	//Czy�by? A c� to za pomys�?
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_04");	//Pancerze pe�zaczy s� niezwykle twarde. Znacznie trwalsze ni� cho�by stal.
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_05");	//Oczywi�cie nie mam tu na my�li tych wychudzonych osobnik�w, kt�re nawiedza�y zawalon� kopalni� Gomeza...
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_06");	//... O nie, one nie wystarcz�. W NASZEJ kopalni �yj� PRAWDZIWE PE�ZACZE. Wi�ksze, silniejsze i jeszcze bardziej wredne.
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_07");	//Pancerz tych bestii jest niemal nie do przebicia!
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_08");	//Gdyby� m�g� mi przynie�� kilka p�ytek z ich pancerzy, m�g�bym z nich posk�ada� nie lada zbroj�!
};


instance Info_Wolf_SKIN(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Info_Wolf_SKIN_Condition;
	information = Info_Wolf_SKIN_Info;
	important = 0;
	permanent = 0;
	description = "W jaki spos�b mam oddzieli� te p�ytki od zw�ok pe�zaczy?";
};


func int Info_Wolf_SKIN_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Wolf_SPEAK))
	{
		return TRUE;
	};
};

func void Info_Wolf_SKIN_Info()
{
	AI_Output(hero,self,"Info_Wolf_SKIN_15_01");	//W jaki spos�b mam oddzieli� te p�ytki od zw�ok pe�zaczy?
	AI_Output(self,hero,"Info_Wolf_SKIN_09_02");	//To proste. P�ytki na grzbiecie przymocowane s� tylko przy kraw�dziach.
	AI_Output(self,hero,"Info_Wolf_SKIN_09_03");	//Wystarczy wzi�� ostry n� i "ci�� wzd�u� przerywanej linii".
	AI_Output(hero,self,"Info_Wolf_SKIN_15_04");	//W porz�dku. Postaram si� przynie�� ci kilka p�ytek z pancerzy pe�zaczy.
	Knows_GetMCPlates = TRUE;
	PrintScreen("Nowa umiej�tno��: Wycinanie p�ytek pancerza",-1,-1,"FONT_OLD_20_WHITE.TGA",3);
	Log_CreateTopic(CH4_MCPlateArmor,LOG_MISSION);
	Log_SetTopicStatus(CH4_MCPlateArmor,LOG_RUNNING);
	B_LogEntry(CH4_MCPlateArmor,"Wilk, Szkodnik z Nowego Obozu, zaproponowa� mi wykonanie zbroi z pancerzy pe�zaczy. Pokaza� mi jak nale�y je usuwa� z martwych potwor�w.");
	Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry(GE_AnimalTrophies,"Umiej�tno�� usuwania pancerzy z martwych pe�zaczy-wojownik�w.");
	AI_StopProcessInfos(self);
};


instance Info_Wolf_PROFIT(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Info_Wolf_PROFIT_Condition;
	information = Info_Wolf_PROFIT_Info;
	important = 0;
	permanent = 0;
	description = "I m�wisz mi to wszystko nie ��daj�c niczego w zamian?";
};


func int Info_Wolf_PROFIT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Wolf_SPEAK))
	{
		return TRUE;
	};
};

func void Info_Wolf_PROFIT_Info()
{
	AI_Output(hero,self,"Info_Wolf_PROFIT_15_01");	//I m�wisz mi to wszystko nie ��daj�c niczego w zamian?
	AI_Output(self,hero,"Info_Wolf_PROFIT_09_02");	//No niezupe�nie... Je�li uda mi si� skleci� z tych p�ytek porz�dn� zbroj�, b�d�... bardzo szybko... bardzo du�o... Ach, niewa�ne!
};


instance Info_Wolf_MCPLATESFEW(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Info_Wolf_MCPLATESFEW_Condition;
	information = Info_Wolf_MCPLATESFEW_Info;
	important = 0;
	permanent = 0;
	description = "Przynios�em ci kilka tych p�ytek, o kt�re prosi�e�!";
};


func int Info_Wolf_MCPLATESFEW_Condition()
{
	if(Knows_GetMCPlates && (Npc_HasItems(hero,ItAt_Crawler_02) > 0) && (Npc_HasItems(hero,ItAt_Crawler_02) < 15))
	{
		return TRUE;
	};
};

func void Info_Wolf_MCPLATESFEW_Info()
{
	AI_Output(hero,self,"Info_Wolf_MCPLATESFEW_15_01");	//Przynios�em ci kilka tych p�ytek, o kt�re prosi�e�!
	AI_Output(self,hero,"Info_Wolf_MCPLATESFEW_09_02");	//To za ma�o! Nie starczy na ca�� zbroj�!
	AI_Output(self,hero,"Info_Wolf_MCPLATESFEW_09_03");	//Przynie� mi wi�cej p�ytek!
};


instance Info_Wolf_MCPLATESENOUGH(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Info_Wolf_MCPLATESENOUGH_Condition;
	information = Info_Wolf_MCPLATESENOUGH_Info;
	important = 0;
	permanent = 0;
	description = "Zebra�em mn�stwo p�ytek z pancerzy pe�zaczy!";
};


func int Info_Wolf_MCPLATESENOUGH_Condition()
{
	if(Knows_GetMCPlates && (Npc_HasItems(hero,ItAt_Crawler_02) >= 15))
	{
		return TRUE;
	};
};

func void Info_Wolf_MCPLATESENOUGH_Info()
{
	var int zufallsbelohnung;
	AI_Output(hero,self,"Info_Wolf_MCPLATESENOUGH_15_01");	//Zebra�em mn�stwo p�ytek z pancerzy pe�zaczy!
	AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_09_02");	//Fantastycznie! Natychmiast zabieram si� do roboty!
	if(Npc_GetTrueGuild(hero) == GIL_SLD)
	{
		AI_Output(hero,self,"Info_Wolf_MCPLATESENOUGH_15_03");	//Jak d�ugo to zajmie?
		AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_09_04");	//Nie mam poj�cia. To co� zupe�nie nowego. Jeszcze nigdy czego� takiego nie robi�em!
		AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_09_05");	//B�dziesz musia� zagl�da� do mnie od czasu do czasu.
		MCPlatesDelivered = TRUE;
		B_LogEntry(CH4_MCPlateArmor,"Da�em Wilkowi 15 tych p�ytek z pancerzy. Teraz potrzebuje troch� czasu, �eby sporz�dzi� z nich dla mnie now� zbroj�.");
		B_GiveXP(XP_DeliveredMCPlates);
		B_GiveInvItems(hero,self,ItAt_Crawler_02,15);
		AI_StopProcessInfos(self);
	}
	else if(Npc_GetTrueGuild(hero) != GIL_SLD)
	{
		AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_19_01");	//Szkoda tylko, �e nie jeste� jednym z nas. Wtedy ch�tnie bym zrobi� taki pancerz dla ciebie.
		AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_19_02");	//Ale jako cz�onek innego obozu b�dziesz musia� si� niestety obej�� smakiem.
		AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_19_03");	//Mam ju� nawet pewnego klienta, kt�ry jest zainteresowany tego rodzaju zbroj�.
		AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_19_04");	//Niemniej jednak mam co� dla ciebie. Nie chc�, by� odszed� z pustymi r�kami. Trzymaj!
		Log_SetTopicStatus(CH4_MCPlateArmor,LOG_SUCCESS);
		B_LogEntry(CH4_MCPlateArmor,"Po oddaniu Wilkowi 15 p�ytek z pancerzy pe�zaczy powiedzia� mi, �e tak� zbroj� mo�e zrobi� jedynie dla cz�onka Nowego Obozu. No c�, chyba b�d� musia� obej�� si� smakiem. Na pocieszenie otrzyma�em od niego pewien cenny nap�j.");
		B_GiveXP(XP_GORPSIPLATEARMOR);
		Mdl_SetVisualBody(org_5033_gestath,"hum_body_Naked0",0,3,"Hum_Head_Psionic",12,0,crw_armor_h);
		Npc_RemoveInvItem(org_5033_gestath,ItRw_Bow_Long_01);
		Npc_RemoveInvItem(org_5033_gestath,ItMw_1H_Mace_War_02);
		CreateInvItems(org_5033_gestath,ItMw_2H_Sword_Heavy_02,1);
		AI_EquipBestMeleeWeapon(org_5033_gestath);
		AI_EquipBestArmor(org_5033_gestath);
		B_GiveInvItems(hero,self,ItAt_Crawler_02,15);
		MCPlatesDelivered = TRUE;
		zufallsbelohnung = Hlp_Random(100);
		if(zufallsbelohnung >= 75)
		{
			CreateInvItem(self,ItFo_Potion_Dex_03);
			B_GiveInvItems(self,hero,ItFo_Potion_Dex_03,1);
		}
		else if(zufallsbelohnung >= 50)
		{
			CreateInvItem(self,ItFo_Potion_Strength_03);
			B_GiveInvItems(self,hero,ItFo_Potion_Strength_03,1);
		}
		else if(zufallsbelohnung >= 25)
		{
			CreateInvItem(self,ItFo_Potion_Health_Perma_03);
			B_GiveInvItems(self,hero,ItFo_Potion_Health_Perma_03,1);
		};
		AI_StopProcessInfos(self);
	};
};


instance Info_Wolf_ARMORINWORK(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Info_Wolf_ARMORINWORK_Condition;
	information = Info_Wolf_ARMORINWORK_Info;
	important = 0;
	permanent = 1;
	description = "Jak post�puj� prace nad nowym pancerzem?";
};


func int Info_Wolf_ARMORINWORK_Condition()
{
	if((MCPlatesDelivered == TRUE) && (FreemineOrc_LookingUlumulu != LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		return TRUE;
	};
};

func void Info_Wolf_ARMORINWORK_Info()
{
	AI_Output(hero,self,"Info_Wolf_ARMORINWORK_15_01");	//Jak post�puj� prace nad nowym pancerzem?
	AI_Output(self,hero,"Info_Wolf_ARMORINWORK_09_02");	//To zajmie d�u�ej ni� my�la�em! Te p�ytki s� niezwykle twarde. Nie bardzo wiem jak mam je ze sob� po��czy�!
	AI_Output(self,hero,"Info_Wolf_ARMORINWORK_09_03");	//Daj mi jeszcze troch� czasu! Dam rad�, zaufaj mi!
	AI_StopProcessInfos(self);
};


instance Info_Wolf_ARMORFINISHED(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Info_Wolf_ARMORFINISHED_Condition;
	information = Info_Wolf_ARMORFINISHED_Info;
	important = 0;
	permanent = 0;
	description = "Jak post�puj� prace nad nowym pancerzem?";
};


func int Info_Wolf_ARMORFINISHED_Condition()
{
	if((MCPlatesDelivered == TRUE) && (FreemineOrc_LookingUlumulu == LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		return TRUE;
	};
};

func void Info_Wolf_ARMORFINISHED_Info()
{
	AI_Output(hero,self,"Info_Wolf_ARMORFINISHED_15_01");	//Jak post�puj� prace nad nowym pancerzem?
	AI_Output(self,hero,"Info_Wolf_ARMORFINISHED_09_02");	//Uda�o mi si� wreszcie znale�� spos�b na po��czenie p�ytek ze sob�!
	AI_Output(hero,self,"Info_Wolf_ARMORFINISHED_15_03");	//Czy to znaczy, �e zbroja jest ju� gotowa!
	AI_Output(self,hero,"Info_Wolf_ARMORFINISHED_09_04");	//Dok�adnie! Oto i ona! Jest twardsza ni� jakikolwiek pancerz jaki widzia�em na oczy!
	AI_Output(hero,self,"Info_Wolf_ARMORFINISHED_15_05");	//Dzi�ki, jestem twoim d�u�nikiem!
	AI_Output(self,hero,"Info_Wolf_ARMORFINISHED_09_06");	//Nie ma o czym m�wi�! Na pewno na tym nie strac�! Co to, to nie! Ha Ha!
	B_LogEntry(CH4_MCPlateArmor,"Wilk sko�czy� ju� moj� now� zbroj�. To najlepszy pancerz, jaki w �yciu widzia�em!");
	Log_SetTopicStatus(CH4_MCPlateArmor,LOG_SUCCESS);
	B_GiveXP(XP_GorMCPlateArmor);
	CreateInvItem(self,crw_armor_h);
	B_GiveInvItems(self,hero,crw_armor_h,1);
};


instance info_wolf_craft(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 9;
	condition = info_wolf_craft_condition;
	information = info_wolf_craft_info;
	important = 0;
	permanent = 0;
	description = "M�g�by� zrobi� dla mnie zbroj�?";
};


func int info_wolf_craft_condition()
{
	if(Npc_KnowsInfo(hero,dia_gestath_armor))
	{
		return TRUE;
	};
};

func void info_wolf_craft_info()
{
	AI_Output(hero,self,"Info_Wolf_CRAFT_15_01");	//M�g�by� zrobi� dla mnie zbroj�?
	AI_Output(self,hero,"Info_Wolf_CRAFT_09_02");	//M�g�bym, jednak nie mam do�� komponent�w, �eby ci takow� wykona�.
	AI_Output(hero,self,"Info_Wolf_CRAFT_09_03");	//A co, je�li bym ci te rzeczy za�atwi�?
	AI_Output(self,hero,"Info_Wolf_CRAFT_09_04");	//A to zmienia posta� rzeczy. Tylko wiesz, musia�by� si� zna� dobrze na polowaniu, bo bez sk�r, z�b�w i tego rodzaju rzeczy si� nie obejdzie.
	AI_Output(self,hero,"Info_Wolf_CRAFT_09_05");	//No i oczywi�cie nie zrobi� tego za darmo, w ko�cu te� musz� jako� wyj�� na swoje.
	Log_CreateTopic(GE_TraderNC,LOG_NOTE);
	B_LogEntry(GE_TraderNC,"Wilk z ch�ci� wykona dla mnie pancerze, je�li tylko za�atwi� mu potrzebne komponenty.");
};


instance info_wolf_craft_which(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 9;
	condition = info_wolf_craft_which_condition;
	information = info_wolf_craft_which_info;
	important = 0;
	permanent = 1;
	description = "Jaki pancerz m�g�by� dla mnie wykona�?";
};


func int info_wolf_craft_which_condition()
{
	if(Npc_KnowsInfo(hero,info_wolf_craft))
	{
		return TRUE;
	};
};

func void info_wolf_craft_which_info()
{
	AI_Output(hero,self,"Info_Wolf_CRAFT_WHICH_15_01");	//Jaki pancerz m�g�by� dla mnie wykona�?
	AI_Output(self,hero,"Info_Wolf_CRAFT_WHICH_09_02");	//Wybierz sobie.
	Info_ClearChoices(info_wolf_craft_which);
	Info_AddChoice(info_wolf_craft_which,DIALOG_BACK,info_wolf_craft_which_back);
	Info_AddChoice(info_wolf_craft_which,"Pancerz z wilczych sk�r (4 sk�r wilka, 3 z�by, 2 pazury, 600 bry�ek)",info_wolf_craft_which_wolf);
	Info_AddChoice(info_wolf_craft_which,"Pancerz ze sk�r topielc�w (5 sk�r topielca, 2 z�by, 2 pazury, 800 bry�ek)",info_wolf_craft_which_lurker);
	if(Kapitel > 1)
	{
		Info_AddChoice(info_wolf_craft_which,"Pancerz ze sk�r orkowych ps�w (7 sk�r orkowego psa, 6 z�b�w, 4 pazur�w, 1250 bry�ek)",info_wolf_craft_which_orc);
	};
	if(Kapitel > 2)
	{
		Info_AddChoice(info_wolf_craft_which,"Pancerz z b�otnych w�y (6 sk�r b�otnego w�a, 5 k��w b�otnych w�y, 2 pazury, 1700 bry�ek)",info_wolf_craft_which_shark);
	};
	if(Kapitel > 3)
	{
		Info_AddChoice(info_wolf_craft_which,"Pancerz ze sk�r trolla (2 sk�r trolla, 4 k�y trolla, 4 pazury, 2050 bry�ek)",info_wolf_craft_which_troll);
	};
};

func void info_wolf_craft_which_back()
{
	Info_ClearChoices(info_wolf_craft_which);
};

func void info_wolf_craft_which_wolf()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_Wolf_13_01");	//Chcia�bym, aby� zmajstrowa� dla mnie pancerz z wilczych sk�r.
	if((Npc_HasItems(other,ItAt_Wolf_01) >= 4) && (Npc_HasItems(other,ItAt_Claws_01) >= 2) && (Npc_HasItems(other,ItAt_Teeth_01) >= 3) && (Npc_HasItems(hero,ItMiNugget) >= VALUE_NON_ARMOR_K))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_16_02");	//W porz�dku, da si� zrobi�.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_15_04");	//Mam t� zbroj� jeszcze na sk�adzie, tak �e po prostu dam ci j� w zamian za materia�y.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_15_05");	//Mi�ej zabawy!
		B_GiveInvItems(other,self,ItAt_Wolf_01,4);
		B_GiveInvItems(other,self,ItAt_Claws_01,2);
		B_GiveInvItems(other,self,ItAt_Teeth_01,3);
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_NON_ARMOR_K);
		CreateInvItem(hero,non_armor_l);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		AI_EquipBestArmor(hero);
		Info_ClearChoices(info_wolf_craft_which);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_15_02");	//Wr��, kiedy zdob�dziesz dostateczn� ilo�� materia��w.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which);
	};
};

func void info_wolf_craft_which_orc()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_Orc_12_01");	//Chcia�bym, aby� zmajstrowa� dla mnie pancerz ze sk�r orkowych ps�w.
	if((Npc_HasItems(other,ItAt_Wolf_02) >= 7) && (Npc_HasItems(other,ItAt_Claws_01) >= 6) && (Npc_HasItems(other,ItAt_Teeth_01) >= 4) && (Npc_HasItems(hero,ItMiNugget) >= value_non_armor_n))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_16_02");	//W porz�dku, da si� zrobi�.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_15_04");	//Mam t� zbroj� jeszcze na sk�adzie, tak �e po prostu dam ci j� w zamian za materia�y.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_15_05");	//Mi�ej zabawy!
		B_GiveInvItems(other,self,ItAt_Wolf_02,7);
		B_GiveInvItems(other,self,ItAt_Claws_01,6);
		B_GiveInvItems(other,self,ItAt_Teeth_01,4);
		B_GiveInvItems(hero,self,ItMiNugget,value_non_armor_n);
		CreateInvItem(hero,non_armor_n);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		AI_EquipBestArmor(hero);
		Info_ClearChoices(info_wolf_craft_which);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_15_02");	//Wr��, kiedy zdob�dziesz dostateczn� ilo�� materia��w.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which);
	};
};

func void info_wolf_craft_which_shark()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_Wolf_34_01");	//Chcia�bym, aby� zmajstrowa� dla mnie pancerz ze sk�r b�otnych w�y.
	if((Npc_HasItems(other,ItAt_Swampshark_01) >= 6) && (Npc_HasItems(other,ItAt_Claws_01) >= 2) && (Npc_HasItems(other,ItAt_Swampshark_02) >= 5) && (Npc_HasItems(hero,ItMiNugget) >= VALUE_NON_ARMOR_L))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Shark_16_02");	//W porz�dku, da si� zrobi�.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_15_04");	//Mam t� zbroj� jeszcze na sk�adzie, tak �e po prostu dam ci j� w zamian za materia�y.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_15_05");	//Mi�ej zabawy!
		B_GiveInvItems(other,self,ItAt_Swampshark_01,6);
		B_GiveInvItems(other,self,ItAt_Claws_01,2);
		B_GiveInvItems(other,self,ItAt_Swampshark_02,5);
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_NON_ARMOR_L);
		CreateInvItem(hero,non_armor_k);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		AI_EquipBestArmor(hero);
		Info_ClearChoices(info_wolf_craft_which);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_15_02");	//Wr��, kiedy zdob�dziesz dostateczn� ilo�� materia��w.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which);
	};
};

func void info_wolf_craft_which_lurker()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_Lurker_34_01");	//Chcia�bym, aby� zmajstrowa� dla mnie pancerz ze sk�r topielc�w.
	if((Npc_HasItems(other,ItAt_Lurker_02) >= 5) && (Npc_HasItems(other,ItAt_Claws_01) >= 2) && (Npc_HasItems(other,ItAt_Teeth_01) >= 2) && (Npc_HasItems(hero,ItMiNugget) >= value_non_armor_u))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Lurker_16_02");	//W porz�dku, da si� zrobi�.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Lurker_15_04");	//Mam t� zbroj� jeszcze na sk�adzie, tak �e po prostu dam ci j� w zamian za materia�y.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Lurker_15_05");	//Mi�ej zabawy!
		B_GiveInvItems(other,self,ItAt_Lurker_02,5);
		B_GiveInvItems(other,self,ItAt_Claws_01,2);
		B_GiveInvItems(other,self,ItAt_Teeth_01,2);
		B_GiveInvItems(hero,self,ItMiNugget,value_non_armor_u);
		CreateInvItem(hero,non_armor_u);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		AI_EquipBestArmor(hero);
		Info_ClearChoices(info_wolf_craft_which);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Lurker_15_02");	//Wr��, kiedy zdob�dziesz dostateczn� ilo�� materia��w.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which);
	};
};

func void info_wolf_craft_which_troll()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_Troll_34_01");	//Chcia�bym, aby� zmajstrowa� dla mnie pancerz ze sk�r trolla.
	if((Npc_HasItems(other,ItAt_Troll_01) >= 2) && (Npc_HasItems(other,ItAt_Claws_01) >= 4) && (Npc_HasItems(other,ItAt_Troll_02) >= 4) && (Npc_HasItems(hero,ItMiNugget) >= VALUE_NON_ARMOR_W))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Troll_16_02");	//W porz�dku, da si� zrobi�.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Troll_15_04");	//Mam t� zbroj� jeszcze na sk�adzie, tak �e po prostu dam ci j� w zamian za materia�y.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Troll_15_05");	//Mi�ej zabawy!
		B_GiveInvItems(other,self,ItAt_Troll_01,2);
		B_GiveInvItems(other,self,ItAt_Claws_01,4);
		B_GiveInvItems(other,self,ItAt_Troll_02,4);
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_NON_ARMOR_W);
		CreateInvItem(hero,non_armor_p);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		AI_EquipBestArmor(hero);
		Info_ClearChoices(info_wolf_craft_which);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Troll_15_02");	//Wr��, kiedy zdob�dziesz dostateczn� ilo�� materia��w.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which);
	};
};


instance INFO_WOLF_CRAFT_WHICH_IMPROVE(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 9;
	condition = info_wolf_craft_which_improve_condition;
	information = info_wolf_craft_which_improve_info;
	important = 0;
	permanent = 1;
	description = "Potrafisz te� wzmiacnia� pancerze?";
};


func int info_wolf_craft_which_improve_condition()
{
	if(((Npc_GetTrueGuild(hero) == GIL_ORG) && Npc_KnowsInfo(hero,DIA_Wolf_Hello)) || ((Npc_GetTrueGuild(hero) == GIL_SLD) && Npc_KnowsInfo(hero,DIA_Wolf_Hello)) || ((Npc_GetTrueGuild(hero) == GIL_KDW) && Npc_KnowsInfo(hero,DIA_Wolf_Hello)))
	{
		return TRUE;
	};
};

func void info_wolf_craft_which_improve_info()
{
	AI_Output(hero,self,"Info_Wolf_CRAFT_WHICH_IMPROVE_15_01");	//Potrafisz te� wzmiacnia� pancerze?
	AI_Output(self,hero,"Info_Wolf_CRAFT_WHICH_IMPROVE_09_02");	//Jasne, jednak potrzebna mi do tego b�dzie odpowiednia zbroja, jak i godziwa zap�ata w rudzie.
	Info_ClearChoices(info_wolf_craft_which_improve);
	Info_AddChoice(info_wolf_craft_which_improve,DIALOG_BACK,info_wolf_craft_which_improve_back);
	if(Npc_HasItems(other,org_armor_l) >= 1)
	{
		Info_AddChoice(info_wolf_craft_which_improve,"Wzmocniony lekki str�j Szkodnika (375 bry�ek)",info_wolf_craft_which_improve_orgl);
	};
	if(Npc_HasItems(other,org_armor_m) >= 1)
	{
		Info_AddChoice(info_wolf_craft_which_improve,"Wzmocniony str�j Szkodnika (525 bry�ek)",info_wolf_craft_which_improve_orgm);
	};
	if(Npc_HasItems(other,org_armor_h) >= 1)
	{
		Info_AddChoice(info_wolf_craft_which_improve,"Wzmocniony ci�ki str�j Szkodnika (600 bry�ek)",info_wolf_craft_which_improve_orgh);
	};
	if(Npc_HasItems(other,sld_armor_l) >= 1)
	{
		Info_AddChoice(info_wolf_craft_which_improve,"Wzmocniona lekka zbroja Najemnika (675 bry�ek)",info_wolf_craft_which_improve_sldl);
	};
	if(Npc_HasItems(other,sld_armor_m) >= 1)
	{
		Info_AddChoice(info_wolf_craft_which_improve,"Wzmocniona zbroja Najemnika (825 bry�ek)",info_wolf_craft_which_improve_sldm);
	};
	if(Npc_HasItems(other,sld_armor_h) >= 1)
	{
		Info_AddChoice(info_wolf_craft_which_improve,"Wzmocniona ci�ka zbroja Najemnika (1050 bry�ek)",info_wolf_craft_which_improve_sldh);
	};
	if(Npc_HasItems(other,kdw_armor_l) >= 1)
	{
		Info_AddChoice(info_wolf_craft_which_improve,"Wzmocniona szata Wody (975 bry�ek)",info_wolf_craft_which_improve_kdwl);
	};
};

func void info_wolf_craft_which_improve_back()
{
	Info_ClearChoices(info_wolf_craft_which_improve);
};

func void info_wolf_craft_which_improve_orgl()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_13_01");	//Oto pancerz.
	if((Npc_HasItems(other,org_armor_l) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 375))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_16_02");	//W porz�dku, da si� zrobi� - tak my�l�.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_04");	//Jedn� chwil�.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,org_armor_l,1);
		B_GiveInvItems(hero,self,ItMiNugget,375);
		Npc_RemoveInvItem(self,org_armor_l);
		CreateInvItem(self,org_armor_l_upgrade);
		B_GiveInvItems(self,hero,org_armor_l_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_05");	//No, masz tu sw�j pancerz z powrotem. Niech ci s�u�y!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_02");	//Nie masz do�� rudy.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which_improve);
	};
};

func void info_wolf_craft_which_improve_orgm()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_13_01");	//Oto pancerz.
	if((Npc_HasItems(other,org_armor_m) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 525))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_16_02");	//W porz�dku, da si� zrobi� - tak my�l�.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_04");	//Jedn� chwil�.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,org_armor_m,1);
		B_GiveInvItems(hero,self,ItMiNugget,525);
		Npc_RemoveInvItem(self,org_armor_m);
		CreateInvItem(self,org_armor_m_upgrade);
		B_GiveInvItems(self,hero,org_armor_m_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_05");	//No, masz tu sw�j pancerz z powrotem. Niech ci s�u�y!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_02");	//Nie masz do�� rudy.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which_improve);
	};
};

func void info_wolf_craft_which_improve_orgh()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_IMPROVEWolf_13_01");	//Oto pancerz.
	if((Npc_HasItems(other,org_armor_h) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 600))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_16_02");	//W porz�dku, da si� zrobi� - tak my�l�.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_04");	//Jedn� chwil�.
		B_GiveInvItems(hero,self,ItMiNugget,600);
		Npc_RemoveInvItem(hero,org_armor_h);
		CreateInvItem(hero,org_armor_h_upgrade);
		AI_EquipBestArmor(hero);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_05");	//No, masz tu sw�j pancerz z powrotem. Niech ci s�u�y!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_IMPROVE_Wolf_15_02");	//Nie masz do�� rudy.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which_improve);
	};
};

func void info_wolf_craft_which_improve_sldl()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_13_01");	//Oto pancerz.
	if((Npc_HasItems(other,sld_armor_l) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 675))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_16_02");	//W porz�dku, da si� zrobi� - tak my�l�.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_04");	//Jedn� chwil�.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,sld_armor_l,1);
		B_GiveInvItems(hero,self,ItMiNugget,675);
		Npc_RemoveInvItem(self,sld_armor_l);
		CreateInvItem(self,sld_armor_l_upgrade);
		B_GiveInvItems(self,hero,sld_armor_l_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_05");	//No, masz tu sw�j pancerz z powrotem. Niech ci s�u�y!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_02");	//Nie masz do�� rudy.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which_improve);
	};
};

func void info_wolf_craft_which_improve_sldm()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_13_01");	//Oto pancerz.
	if((Npc_HasItems(other,sld_armor_m) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 825))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_16_02");	//W porz�dku, da si� zrobi� - tak my�l�.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_04");	//Jedn� chwil�.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,sld_armor_m,1);
		B_GiveInvItems(hero,self,ItMiNugget,825);
		Npc_RemoveInvItem(self,sld_armor_m);
		CreateInvItem(self,sld_armor_m_upgrade);
		B_GiveInvItems(self,hero,sld_armor_m_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_05");	//No, masz tu sw�j pancerz z powrotem. Niech ci s�u�y!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_IMPROVE_15_02");	//Nie masz do�� rudy.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which_improve);
	};
};

func void info_wolf_craft_which_improve_sldh()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_13_01");	//Oto pancerz.
	if((Npc_HasItems(other,sld_armor_h) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 1050))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_16_02");	//W porz�dku, da si� zrobi� - tak my�l�.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_04");	//Jedn� chwil�.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,sld_armor_h,1);
		B_GiveInvItems(hero,self,ItMiNugget,1050);
		Npc_RemoveInvItem(self,sld_armor_h);
		CreateInvItem(self,sld_armor_h_upgrade);
		B_GiveInvItems(self,hero,sld_armor_h_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_05");	//No, masz tu sw�j pancerz z powrotem. Niech ci s�u�y!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_02");	//Nie masz do�� rudy.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which_improve);
	};
};

func void info_wolf_craft_which_improve_kdwl()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_13_01");	//Oto pancerz.
	if((Npc_HasItems(other,kdw_armor_l) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 975))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_16_02");	//W porz�dku, da si� zrobi� - tak my�l�.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_04");	//Jedn� chwil�.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,kdw_armor_l,1);
		B_GiveInvItems(hero,self,ItMiNugget,975);
		Npc_RemoveInvItem(self,kdw_armor_l);
		CreateInvItem(self,kdw_armor_l_upgrade);
		B_GiveInvItems(self,hero,kdw_armor_l_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_05");	//No, masz tu sw�j pancerz z powrotem. Niech ci s�u�y!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_02");	//Nie masz do�� rudy.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which_improve);
	};
};


instance DIA_WOLF_GREETSLD(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 1;
	condition = dia_wolf_greetsld_condition;
	information = dia_wolf_greetsld_info;
	permanent = 1;
	important = 0;
	description = "Jeste� teraz Najemnikiem?";
};


func int dia_wolf_greetsld_condition()
{
	if(Npc_GetTrueGuild(self) == GIL_SLD)
	{
		return TRUE;
	};
};

func void dia_wolf_greetsld_info()
{
	AI_Output(other,self,"DIA_Wolf_GreetSLD_09_00");	//Jeste� teraz Najemnikiem?
	AI_Output(self,other,"DIA_Wolf_GreetSLD_09_01");	//Lee s�ysza� o tym, jak ci�gle skleca�em jego ch�opcom ich powgniatane zbroje.
	AI_Output(self,other,"DIA_Wolf_GreetSLD_09_02");	//Ponadto by� pod wra�eniem, z jakich materia��w potrafi� sporz�dzi� r�norakie pancerze.
	AI_Output(self,other,"DIA_Wolf_GreetSLD_09_03");	//I dzi�ki temu powiedzia� mi, �e jestem ju� got�w zosta� Najemnikiem w s�u�bie mag�w.
};


instance DIA_WOLF_SELLFUR(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 600;
	condition = dia_wolf_sellfur_condition;
	information = dia_wolf_sellfur_info;
	permanent = 1;
	description = "Mam dla ciebie kilka sk�r...";
};


func int dia_wolf_sellfur_condition()
{
	if(Npc_KnowsInfo(hero,Org_855_Wolf_TRADE))
	{
		return TRUE;
	};
};

func void dia_wolf_sellfur_info()
{
	AI_Output(other,self,"DIA_wolf_SellFur_15_00");	//Mam dla ciebie kilka sk�r...
	if((Npc_HasItems(other,ItAt_Wolf_01) > 0) || (Npc_HasItems(other,ItAt_Wolf_02) > 0) || (Npc_HasItems(other,ItAt_Shadow_01) > 0) || (Npc_HasItems(other,ItAt_Troll_01) > 0) || (Npc_HasItems(other,ItAt_Swampshark_01) > 0) || (Npc_HasItems(other,ItAt_Lurker_02) > 0))
	{
		if(Npc_HasItems(other,ItAt_Wolf_01) > 0)
		{
			AI_Output(self,other,"DIA_wolf_SellFur_11_01");	//Wilcza sk�ra? Mo�e si� przyda�.
			CreateInvItems(other,ItMiNugget,Npc_HasItems(other,ItAt_Wolf_01) * Value_Wolfsfell);
			Npc_RemoveInvItems(other,ItAt_Wolf_01,Npc_HasItems(other,ItAt_Wolf_01));
		};
		if(Npc_HasItems(other,ItAt_Wolf_02) > 0)
		{
			AI_Output(self,other,"DIA_wolf_SellFur_11_02");	//Sk�ra orkowego psa? Te bestie s� niebezpieczne.
			CreateInvItems(other,ItMiNugget,Npc_HasItems(other,ItAt_Wolf_02) * Value_Orkhundfell);
			Npc_RemoveInvItems(other,ItAt_Wolf_02,Npc_HasItems(other,ItAt_Wolf_02));
		};
		if(Npc_HasItems(other,ItAt_Shadow_01) > 0)
		{
			AI_Output(self,other,"DIA_wolf_SellFur_11_03");	//Za�atwi�e� cieniostwora? Nie cz�sto widuje si� te bestie w tej okolicy.
			CreateInvItems(other,ItMiNugget,Npc_HasItems(other,ItAt_Shadow_01) * Value_Shadowbeastfell);
			Npc_RemoveInvItems(other,ItAt_Shadow_01,Npc_HasItems(other,ItAt_Shadow_01));
		};
		if(Npc_HasItems(other,ItAt_Lurker_02) > 0)
		{
			AI_Output(self,other,"DIA_wolf_SellFur_11_04");	//Sk�ra topielca, nie�le si� takie obrabia.
			CreateInvItems(other,ItMiNugget,Npc_HasItems(other,ItAt_Lurker_02) * Value_Lurkerhaut);
			Npc_RemoveInvItems(other,ItAt_Lurker_02,Npc_HasItems(other,ItAt_Lurker_02));
		};
		if(Npc_HasItems(other,ItAt_Swampshark_01) > 0)
		{
			AI_Output(self,other,"DIA_wolf_SellFur_11_05");	//Sk�ra b�otnego w�a? Pewnie przechodzi�e� akurat przez bagno tych �wir�w z Sekty, co?
			CreateInvItems(other,ItMiNugget,Npc_HasItems(other,ItAt_Swampshark_01) * Value_Sumpfhaihaut);
			Npc_RemoveInvItems(other,ItAt_Swampshark_01,Npc_HasItems(other,ItAt_Swampshark_01));
		};
		if(Npc_HasItems(other,ItAt_Troll_01) > 0)
		{
			AI_Output(self,other,"DIA_wolf_SellFur_11_06");	//A co to za sk�ra?
			AI_Output(other,self,"DIA_wolf_SellFur_11_07");	//Zdar�em j� z trolla.
			AI_Output(self,other,"DIA_wolf_SellFur_11_08");	//Trolla? Jak dot�d s�ysza�em jedynie opowie�ci o tych stworzeniach.
			CreateInvItems(other,ItMiNugget,Npc_HasItems(other,ItAt_Troll_01) * Value_Trollfell);
			Npc_RemoveInvItems(other,ItAt_Troll_01,Npc_HasItems(other,ItAt_Troll_01));
		};
		AI_Output(self,other,"DIA_wolf_SellFur_11_09");	//Solidne zdobycze, powiem ci. Je�li b�dziesz mia� nast�pne, to wiesz do kogo si� zwr�ci�.
	}
	else
	{
		AI_Output(self,other,"DIA_wolf_SellFur_11_10");	//Ale ja tu �adnych sk�r nie widz�. Wr��, kiedy ju� b�dziesz mia� przy sobie co� ciekawego.
	};
};

