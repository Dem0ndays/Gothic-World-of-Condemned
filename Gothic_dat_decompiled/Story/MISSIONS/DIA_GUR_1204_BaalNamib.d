
instance DIA_BaalNamib_EXIT(C_Info)
{
	npc = GUR_1204_BaalNamib;
	nr = 999;
	condition = DIA_BaalNamib_EXIT_Condition;
	information = DIA_BaalNamib_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_BaalNamib_EXIT_Condition()
{
	return 1;
};

func void DIA_BaalNamib_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BaalNamib_NoTalk(C_Info)
{
	npc = GUR_1204_BaalNamib;
	nr = 1;
	condition = DIA_BaalNamib_NoTalk_Condition;
	information = DIA_BaalNamib_NoTalk_Info;
	permanent = 1;
	important = 1;
};


func int DIA_BaalNamib_NoTalk_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (BaalNamib_Ansprechbar == FALSE) && (Npc_GetPermAttitude(self,other) != ATT_FRIENDLY))
	{
		return 1;
	};
};

func void DIA_BaalNamib_NoTalk_Info()
{
	Info_ClearChoices(DIA_BaalNamib_NoTalk);
	Info_AddChoice(DIA_BaalNamib_NoTalk,DIALOG_ENDE,DIA_BaalNamib_NoTalk_ENDE);
	Info_AddChoice(DIA_BaalNamib_NoTalk,"Wszystko w porz�dku, kolego?",DIA_BaalNamib_NoTalk_Imp);
	Info_AddChoice(DIA_BaalNamib_NoTalk,"Niech �ni�cy b�dzie z tob�!",DIA_BaalNamib_NoTalk_Sleeper);
	Info_AddChoice(DIA_BaalNamib_NoTalk,"Cze��! Jestem tu nowy!",DIA_BaalNamib_NoTalk_Hi);
};

func void DIA_BaalNamib_NoTalk_Hi()
{
	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Hi_15_00");	//Cze��! Jestem tu nowy!
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Hi_02_01");	//
	BaalNamib_Sakrileg = TRUE;
};

func void DIA_BaalNamib_NoTalk_Sleeper()
{
	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Sleeper_15_00");	//Niech �ni�cy b�dzie z tob�!
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Sleeper_02_01");	//
	BaalNamib_Sakrileg = TRUE;
};

func void DIA_BaalNamib_NoTalk_Imp()
{
	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Imp_15_00");	//Wszystko w porz�dku, kolego?
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Imp_02_01");	//
	BaalNamib_Sakrileg = TRUE;
};

func void DIA_BaalNamib_NoTalk_ENDE()
{
	AI_StopProcessInfos(self);
};


var int namib_gotocalom;

instance DIA_BaalNamib_FirstTalk(C_Info)
{
	npc = GUR_1204_BaalNamib;
	nr = 1;
	condition = DIA_BaalNamib_FirstTalk_Condition;
	information = DIA_BaalNamib_FirstTalk_Info;
	permanent = 0;
	important = 1;
};


func int DIA_BaalNamib_FirstTalk_Condition()
{
	if(BaalNamib_Ansprechbar == TRUE)
	{
		return 1;
	};
};

func void DIA_BaalNamib_FirstTalk_Info()
{
	AI_Output(self,other,"DIA_BaalNamib_FirstTalk_02_00");	//
	AI_Output(self,other,"DIA_BaalNamib_FirstTalk_02_01");	//Zosta�e� wybrany przez �ni�cego. Czy twoim �yczeniem naprawd� jest do��czy� do nas?
	Info_ClearChoices(DIA_BaalNamib_FirstTalk);
	Info_AddChoice(DIA_BaalNamib_FirstTalk,"Nic nie m�w",DIA_BaalNamib_FirstTalk_Mute);
	Info_AddChoice(DIA_BaalNamib_FirstTalk,"Tak, chc� pod��a� drog� �ni�cego!",DIA_BaalNamib_FirstTalk_Sleeper);
};

func void DIA_BaalNamib_FirstTalk_Mute()
{
	AI_Output(other,self,"DIA_BaalNamib_FirstTalk_Mute_15_00");	//
	AI_Output(self,other,"DIA_BaalNamib_FirstTalk_Mute_02_01");	//Co takiego?
};

func void DIA_BaalNamib_FirstTalk_Sleeper()
{
	AI_Output(other,self,"DIA_BaalNamib_FirstTalk_Sleeper_15_00");	//Tak, chc� pod��a� drog� �ni�cego!
	AI_Output(self,other,"DIA_BaalNamib_FirstTalk_Sleeper_02_01");	//Id� do Cor Kaloma. Powiedz mu, �e przysy�am ci� do niego, bo widz�, i� twoja wiara jest szczera!
	Info_ClearChoices(DIA_BaalNamib_FirstTalk);
	namib_gotocalom = TRUE;
	B_LogEntry(CH1_JoinPsi,"Zaaran�owane przez Lestera przedstawienie zdzia�a�o cuda. Baal Namib przem�wi� do mnie i da� si� przekona�, �e jestem prawdziwym wyznawc� kultu �ni�cego. Teraz mam si� uda� do laboratorium alchemicznego Cor Kaloma!");
	B_GiveXP(XP_ImpressBaalNamib);
};


instance gur_1204_namib_betterarmor(C_Info)
{
	npc = GUR_1204_BaalNamib;
	condition = gur_1204_namib_betterarmor_condition;
	information = gur_1204_namib_betterarmor_info;
	important = 0;
	permanent = 1;
	description = "Chcia�bym otrzyma� lepsz� zbroj�.";
};


func int gur_1204_namib_betterarmor_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_NOV)
	{
		return TRUE;
	};
};

func void gur_1204_namib_betterarmor_info()
{
	AI_Output(hero,self,"GUR_1204_BaalNamib_ARMOR_Info_15_01");	//Chcia�bym otrzyma� lepsz� zbroj�.
	AI_Output(self,other,"GUR_1204_Namib_BETTERARMOR_Info_06_02");	//Je�li udowodnisz, �e jeste� jej godzien i ui�cisz to hojnym datkiem...
	Info_ClearChoices(gur_1204_namib_betterarmor);
	Info_AddChoice(gur_1204_namib_betterarmor,DIALOG_BACK,gur_1204_namib_betterarmor_back);
	Info_AddChoice(gur_1204_namib_betterarmor,B_BuildBuyArmorString(NAME_NAMIBHEAVYNOVICE,value_nov_armor_h),gur_1204_namib_betterarmor_h);
	Info_AddChoice(gur_1204_namib_betterarmor,B_BuildBuyArmorString(NAME_NAMIBNOVICE,value_nov_armor_m),gur_1204_namib_betterarmor_m);
};

func void gur_1204_namib_betterarmor_m()
{
	AI_Output(hero,self,"GUR_1204_Namib_BETTERARMOR_Info_M_13_02");	//Chcia�bym dosta� lekk� zbroj� Nowicjusza.
	if(Kapitel < 2)
	{
		AI_Output(self,other,"GUR_1204_BaalNamib_ARMOR_Info_01_05");	//Minie jeszcze troch� czasu, zanim dane ci b�dzie nosi� lekk� zbroj� Nowicjusza.
	}
	else if(Npc_HasItems(hero,ItMiNugget) < value_nov_armor_m)
	{
		AI_Output(self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_03");	//Wr��, gdy uzbierasz troch� wi�cej rudy.
	}
	else
	{
		AI_Output(self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_04");	//Ta zbroja chroni� b�dzie twoje cia�o, tak jak �ni�cy chroni twoj� dusz�!
		B_GiveInvItems(hero,self,ItMiNugget,value_nov_armor_m);
		B_GiveInvItems(self,hero,nov_armor_m,1);
		AI_EquipBestArmor(hero);
	};
	Info_ClearChoices(gur_1204_namib_betterarmor);
};

func void gur_1204_namib_betterarmor_h()
{
	AI_Output(hero,self,"GRD_219_BaalNamib_BETTERARMOR_Info_H_15_01");	//Chcia�bym dosta� ci�k� zbroj� Nowicjusza.
	if(Kapitel < 2)
	{
		AI_Output(self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_02");	//Minie jeszcze troch� czasu, zanim dane ci b�dzie nosi� ci�k� zbroj� Nowicjusza.
	}
	else if(Npc_HasItems(hero,ItMiNugget) < value_nov_armor_h)
	{
		AI_Output(self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_03");	//Wr��, gdy uzbierasz troch� wi�cej rudy.
	}
	else
	{
		AI_Output(self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_04");	//Ta zbroja chroni� b�dzie twoje cia�o, tak jak �ni�cy chroni twoj� dusz�!
		B_GiveInvItems(hero,self,ItMiNugget,value_nov_armor_h);
		B_GiveInvItems(self,hero,nov_armor_h,1);
		AI_EquipBestArmor(hero);
	};
	Info_ClearChoices(gur_1204_namib_betterarmor);
};

func void gur_1204_namib_betterarmor_back()
{
	AI_Output(hero,self,"GRD_219_Stone_BETTERARMOR_Info_BACK_15_01");	//Rozmy�li�em si�.
	Info_ClearChoices(gur_1204_namib_betterarmor);
};


instance Info_BaalNamib_BROTHERHOOD(C_Info)
{
	npc = GUR_1204_BaalNamib;
	condition = Info_BaalNamib_BROTHERHOOD_Condition;
	information = Info_BaalNamib_BROTHERHOOD_Info;
	important = 0;
	permanent = 0;
	description = "Czy s� jakie� zadania, kt�rych m�g�bym si� podj��?";
};


func int Info_BaalNamib_BROTHERHOOD_Condition()
{
	if((Kapitel == 2) && Npc_KnowsInfo(hero,PC_Psionic_SEND) && (Npc_GetTrueGuild(hero) == GIL_NOV))
	{
		return TRUE;
	};
};

func void Info_BaalNamib_BROTHERHOOD_Info()
{
	AI_Output(other,self,"Info_BaalNamib_BROTHERHOOD_15_01");	//Czy s� jakie� zadania, kt�rych m�g�bym si� podj��?
	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_02_02");	//Nasz mistrz, m�dry Y'Berion, kaza� sobie przys�a� Nowicjusza. Jako �e jeste� teraz jednym z nas, mo�esz i�� do niego i zaoferowa� swoje us�ugi.
	Info_ClearChoices(Info_BaalNamib_BROTHERHOOD);
	Info_AddChoice(Info_BaalNamib_BROTHERHOOD,"W porz�dku. Zajrz� do niego natychmiast.",Info_BaalNamib_BROTHERHOOD_OK);
	Info_AddChoice(Info_BaalNamib_BROTHERHOOD,"Gdzie znajd� Y'Beriona?",Info_BaalNamib_BROTHERHOOD_YBWO);
	Info_AddChoice(Info_BaalNamib_BROTHERHOOD,"Wiesz mo�e jakie zadanie ma dla mnie Y'Berion?",Info_BaalNamib_BROTHERHOOD_YBWAS);
};

func void Info_BaalNamib_BROTHERHOOD_YBWO()
{
	AI_Output(other,self,"Info_BaalNamib_BROTHERHOOD_YBWO_15_01");	//Gdzie znajd� Y'Beriona?
	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_YBWO_02_02");	//Jego siedziba znajduje si� pod �wi�tynnym wzg�rzem.
};

func void Info_BaalNamib_BROTHERHOOD_YBWAS()
{
	AI_Output(other,self,"Info_BaalNamib_BROTHERHOOD_YBWAS_15_01");	//Wiesz mo�e jakie zadanie ma dla mnie Y'Berion?
	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_02");	//Aby dosz�o do wielkiego przyzwania musimy najpierw zdoby� pewien magiczny artefakt.
	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_03");	//Y'Berion poszukuje �mia�ka, kt�ry zechce si� podj�� tego zadania.
	AI_Output(other,self,"Info_BaalNamib_BROTHERHOOD_YBWAS_15_04");	//To nie wydaje si� zbyt trudne.
	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_05");	//Gdyby by�o �atwe, ju� dawno mieliby�my ten artefakt w naszym obozie. Porozmawiaj z Y'Berionem. On ci wszystko wyja�ni.
};

func void Info_BaalNamib_BROTHERHOOD_OK()
{
	var C_Npc YBerion;
	AI_Output(other,self,"Info_BaalNamib_BROTHERHOOD_OK_15_01");	//W porz�dku. Zajrz� do niego natychmiast.
	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_OK_02_02");	//Niech �ni�cy b�dzie z tob�!
	Info_ClearChoices(Info_BaalNamib_BROTHERHOOD);
	Log_CreateTopic(CH2_Focus,LOG_MISSION);
	Log_SetTopicStatus(CH2_Focus,LOG_RUNNING);
	B_LogEntry(CH2_Focus,"Baal Namib odes�a� mnie do Y'Beriona, bym poszuka� pewnego artefaktu, kt�ry jest potrzebny Bractwu do wielkiego przyzwania. Stra�nik �wi�tyni powinien mnie bez problem�w wpu�ci�, je�li tylko mu powiem, �e przys�a� mnie Baal Namib.");
	YBerion = Hlp_GetNpc(GUR_1200_YBerion);
	YBerion.aivar[AIV_FINDABLE] = TRUE;
};


instance gur_1204_baalnamib_guraufnahme(C_Info)
{
	npc = GUR_1204_BaalNamib;
	condition = gur_1204_baalnamib_guruaufnahme_condition;
	information = gur_1204_baalnamib_guruaufnahme_info;
	important = 1;
	permanent = 0;
};


func int gur_1204_baalnamib_guruaufnahme_condition()
{
	if(((Npc_HasItems(hero,ItAt_Crawlerqueen) >= 1) || (CorKalom_BringMCQBalls == LOG_SUCCESS)) && (Npc_GetTrueGuild(hero) == GIL_NOV) && (Npc_GetDistToNpc(hero,self) < 1000) && Npc_KnowsInfo(hero,DIA_BaalTondral_SendToKalom) && Npc_KnowsInfo(hero,DIA_BaalTyon_Vision) && Npc_KnowsInfo(hero,dia_baallukor_hypnoticteacher) && Npc_KnowsInfo(hero,DIA_BaalNamib_FirstTalk) && Npc_KnowsInfo(hero,DIA_BaalCadar_SleepSpell) && Npc_KnowsInfo(hero,DIA_BaalOrun_GotWeed))
	{
		return TRUE;
	};
};

func void gur_1204_baalnamib_guruaufnahme_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Gur_1204_BaalNamib_GURAUFNAHME_Info_13_01");	//Poczekaj chwil�!
	AI_Output(self,other,"Gur_1204_BaalNamib_GURAUFNAHME_Info_13_10");	//Swoimi dokonaniami w kopalni pokaza�e� nam, �e �ni�cy nam tob� czuwa.
	AI_Output(self,other,"Gur_1204_BaalNamib_GURAUFNAHME_Info_13_03");	//Tym samym spotyka ci� zaszczyt zaj�cia szczeg�lnego stanowiska w naszym spo�ecze�stwie.
	AI_Output(self,other,"Gur_1204_BaalNamib_GURAUFNAHME_Info_13_04");	//Udaj si� do Y'Beriona, on powie ci wi�cej na ten temat.
	Log_CreateTopic(GE_BECOMEGURU,LOG_NOTE);
	B_LogEntry(GE_BECOMEGURU,"Baal Namib powiedzia� mi, i� jestem wybra�cem �ni�cego i spotka mnie zaszczyt zaj�cia szczeg�lnego stanowiska w obozie Bractwa. Po wi�cej informacji powinienem si� zg�osi� do Y'Beriona.");
};


instance info_baalnamib_tattoos(C_Info)
{
	npc = GUR_1204_BaalNamib;
	condition = info_baalnamib_tattoos_condition;
	information = info_baalnamib_tattoos_info;
	important = 1;
	permanent = 0;
};


func int info_baalnamib_tattoos_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_NOV)
	{
		return TRUE;
	};
};

func void info_baalnamib_tattoos_info()
{
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_15_01");	//Jak widz� przyj��e� zaproszenie Cor Kaloma.
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_15_02");	//Ale o co chodzi?
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_01_01");	//O rytua�. Rytua�, dzi�ki kt�remu przypiecz�tujesz swoj� przynale�no�� do Bractwa.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_01_02");	//Ka�dy nowy zwolennik naszej spo�eczno�ci bierze udzia� w takim rytuale.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_01_03");	//Zanim jednak zaczniemy, musz� ci jeszcze zada� ostatnie pytanie.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_01_04");	//Dlaczego tak w og�le zdecydowa�e� si� pod��a� �cie�k� �ni�cego?
	Info_ClearChoices(info_baalnamib_tattoos);
	Info_AddChoice(info_baalnamib_tattoos,"Poniewa�...",info_baalnamib_tattoos_weil);
};

func void info_baalnamib_tattoos_weil()
{
	Info_ClearChoices(info_baalnamib_tattoos);
	Info_AddChoice(info_baalnamib_tattoos,"...wasze zio�o mnie do tego przekona�o.",info_baalnamib_tattoos_kraut);
	Info_AddChoice(info_baalnamib_tattoos,"...wiedzia�em, �e w pozosta�ych obozach nie b�de m�g� by� wolny.",info_baalnamib_tattoos_frei);
	Info_AddChoice(info_baalnamib_tattoos,"...tak si� po prostu jako� z�o�y�o.",info_baalnamib_tattoos_ergeben);
	Info_AddChoice(info_baalnamib_tattoos,"...dostrzeg�em �ni�cego jako mojego prawdziwego odkupiciela.",info_baalnamib_tattoos_erl�ser);
	Info_AddChoice(info_baalnamib_tattoos,"...nie mia�em innego wyboru.",info_baalnamib_tattoos_wahl);
	Info_AddChoice(info_baalnamib_tattoos,"...prze�y�em objawienie od �ni�cego.",info_baalnamib_tattoos_vision);
};

func void info_baalnamib_tattoos_kraut()
{
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_24_01");	//Wasze zio�o mnie do tego przekona�o.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_24_02");	//To mam nadziej�, �e r�wnie dobrze pozwoli ci ono zbli�y� si� do �ni�cego.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_24_03");	//Przeprowadzimy teraz rytua�, kt�ry powi��e ci� z nami wszystkimi.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_24_04");	//Oto nap�j z wydzieliny �ni�cego. Wypij go, zanim przejdziemy do medytacji.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_24_05");	//Je�li ju� jeste� gotowy, zajmij miejsce przed portalem.
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_04");
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_24_06");	//Co to za portal?
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_24_07");	//To �wi�ty artefakt naszego Bractwa. Pozwala on zbli�y� si� bardziej do �ni�cego.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_24_08");	//Ponadto zostan� umieszczone na twojej g�owie jego znaki.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_24_10");	//Dzi�ki tym znakom b�dzie wiadomo, �e jeste� oddanym s�ug� �ni�cego.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_24_09");	//Zaczynajmy ju� ten rytua�.
	Info_ClearChoices(info_baalnamib_tattoos);
	hero_face1 = TRUE;
	CreateInvItem(self,itfo_potion_elixier_crawler);
	B_GiveInvItems(self,hero,itfo_potion_elixier_crawler,1);
	AI_UseItem(hero,itfo_potion_elixier_crawler);
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_04");
	AI_StopProcessInfos(self);
};

func void info_baalnamib_tattoos_frei()
{
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_21_01");	//Wiedzia�em, �e w pozosta�ych obozach nigdy nie b�de m�g� by� prawdziwie wolny.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_21_02");	//W rzeczy samej. �ni�cy wska�e nam drog� do wolno�ci.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_21_03");	//Przeprowadzimy teraz rytua�, kt�ry powi��e ci� z nami wszystkimi.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_21_04");	//Oto nap�j z wydzieliny �ni�cego. Wypij go, zanim przejdziemy do medytacji.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_21_05");	//Je�li ju� jeste� gotowy, zajmij miejsce przed portalem.
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_04");
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_21_06");	//Co to za portal?
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_21_07");	//To �wi�ty artefakt naszego Bractwa. Pozwala on zbli�y� si� bardziej do �ni�cego.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_21_08");	//Ponadto zostan� umieszczone na twojej g�owie jego znaki.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_21_10");	//Dzi�ki tym znakom b�dzie wiadomo, �e jeste� oddanym s�ug� �ni�cego.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_21_09");	//Zaczynajmy ju� ten rytua�.
	Info_ClearChoices(info_baalnamib_tattoos);
	hero_face2 = TRUE;
	CreateInvItem(self,itfo_potion_elixier_crawler);
	B_GiveInvItems(self,hero,itfo_potion_elixier_crawler,1);
	AI_UseItem(hero,itfo_potion_elixier_crawler);
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_04");
	AI_StopProcessInfos(self);
};

func void info_baalnamib_tattoos_ergeben()
{
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_22_01");	//Tak si� po prostu jako� z�o�y�o.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_22_02");	//To mo�e z czasem i kontakt ze �ni�cym ci si�... "z�o�y".
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_22_03");	//Przeprowadzimy teraz rytua�, kt�ry powi��e ci� z nami wszystkimi.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_22_04");	//Oto nap�j z wydzieliny �ni�cego. Wypij go, zanim przejdziemy do medytacji.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_22_05");	//Je�li ju� jeste� gotowy, zajmij miejsce przed portalem.
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_04");
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_22_06");	//Co to za portal?
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_22_07");	//To �wi�ty artefakt naszego Bractwa. Pozwala on zbli�y� si� bardziej do �ni�cego.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_22_08");	//Ponadto zostan� umieszczone na twojej g�owie jego znaki.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_22_10");	//Dzi�ki tym znakom b�dzie wiadomo, �e jeste� oddanym s�ug� �ni�cego.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_22_09");	//Zaczynajmy ju� ten rytua�.
	Info_ClearChoices(info_baalnamib_tattoos);
	hero_face3 = TRUE;
	CreateInvItem(self,itfo_potion_elixier_crawler);
	B_GiveInvItems(self,hero,itfo_potion_elixier_crawler,1);
	AI_UseItem(hero,itfo_potion_elixier_crawler);
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_04");
	AI_StopProcessInfos(self);
};

func void info_baalnamib_tattoos_erl�ser()
{
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_23_01");	//Dostrzeg�em �ni�cego jako mojego prawdziwego odkupiciela.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_23_02");	//W takim razie jeste� prawdziwym wyznawc� naszej wiary i czeka na ciebie droga pe�na zrozumienia.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_23_03");	//Przeprowadzimy teraz rytua�, kt�ry powi��e ci� z nami wszystkimi.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_23_04");	//Oto nap�j z wydzieliny �ni�cego. Wypij go, zanim przejdziemy do medytacji.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_23_05");	//Je�li ju� jeste� gotowy, zajmij miejsce przed portalem.
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_04");
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_23_06");	//Co to za portal?
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_23_07");	//To �wi�ty artefakt naszego Bractwa. Pozwala on zbli�y� si� bardziej do �ni�cego.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_23_08");	//Ponadto zostan� umieszczone na twojej g�owie jego znaki.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_23_10");	//Dzi�ki tym znakom b�dzie wiadomo, �e jeste� oddanym s�ug� �ni�cego.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_23_09");	//Zaczynajmy ju� ten rytua�.
	Info_ClearChoices(info_baalnamib_tattoos);
	hero_face4 = TRUE;
	CreateInvItem(self,itfo_potion_elixier_crawler);
	B_GiveInvItems(self,hero,itfo_potion_elixier_crawler,1);
	AI_UseItem(hero,itfo_potion_elixier_crawler);
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_04");
	AI_StopProcessInfos(self);
};

func void info_baalnamib_tattoos_wahl()
{
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_25_01");	//Nie mia�em innego wyboru.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_25_02");	//Mam tylko nadziej�, �e odnajdziesz jeszcze zrozumienie, by prowadzi� lepsze �ycie jako zwolennik naszej wiary ni� w jakimkolwiek innym miejscu w kolonii.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_25_03");	//Przeprowadzimy teraz rytua�, kt�ry powi��e ci� z nami wszystkimi.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_25_04");	//Oto nap�j z wydzieliny �ni�cego. Wypij go, zanim przejdziemy do medytacji.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_25_05");	//Je�li ju� jeste� gotowy, zajmij miejsce przed portalem.
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_04");
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_25_06");	//Co to za portal?
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_25_07");	//To �wi�ty artefakt naszego Bractwa. Pozwala on zbli�y� si� bardziej do �ni�cego.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_25_08");	//Ponadto zostan� umieszczone na twojej g�owie jego znaki.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_25_10");	//Dzi�ki tym znakom b�dzie wiadomo, �e jeste� oddanym s�ug� �ni�cego.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_25_09");	//Zaczynajmy ju� ten rytua�.
	Info_ClearChoices(info_baalnamib_tattoos);
	hero_face5 = TRUE;
	CreateInvItem(self,itfo_potion_elixier_crawler);
	B_GiveInvItems(self,hero,itfo_potion_elixier_crawler,1);
	AI_UseItem(hero,itfo_potion_elixier_crawler);
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_04");
	AI_StopProcessInfos(self);
};

func void info_baalnamib_tattoos_vision()
{
	AI_Output(other,self,"Info_BaalNamib_VISION_25_01");	//Prze�y�em objawienie od �ni�cego.
	AI_Output(self,other,"Info_BaalNamib_VISION_25_02");	//W takim razie sam �ni�cy wybra� ci�, by� do nas do��czy�. Twoje przeznaczenie ju� wkr�tce si� zi�ci.
	AI_Output(self,other,"Info_BaalNamib_VISION_25_03");	//Przeprowadzimy teraz rytua�, kt�ry powi��e ci� z nami wszystkimi.
	AI_Output(self,other,"Info_BaalNamib_VISION_25_04");	//Oto nap�j z wydzieliny �ni�cego. Wypij go, zanim przejdziemy do medytacji.
	AI_Output(self,other,"Info_BaalNamib_VISION_25_05");	//Je�li ju� jeste� gotowy, zajmij miejsce przed portalem.
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_04");
	AI_Output(other,self,"Info_BaalNamib_VISION_25_06");	//Co to za portal?
	AI_Output(self,other,"Info_BaalNamib_VISION_25_07");	//To �wi�ty artefakt naszego Bractwa. Pozwala on zbli�y� si� bardziej do �ni�cego.
	AI_Output(self,other,"Info_BaalNamib_VISION_25_08");	//Ponadto zostan� umieszczone na twojej g�owie jego znaki.
	AI_Output(self,other,"Info_BaalNamib_VISION_25_10");	//Dzi�ki tym znakom b�dzie wiadomo, �e jeste� oddanym s�ug� �ni�cego.
	AI_Output(self,other,"Info_BaalNamib_VISION_25_09");	//Zaczynajmy ju� ten rytua�.
	Info_ClearChoices(info_baalnamib_tattoos);
	hero_face6 = TRUE;
	CreateInvItem(self,itfo_potion_elixier_crawler);
	B_GiveInvItems(self,hero,itfo_potion_elixier_crawler,1);
	AI_UseItem(hero,itfo_potion_elixier_crawler);
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_04");
	AI_StopProcessInfos(self);
};


instance info_baalnamib_beginning(C_Info)
{
	npc = GUR_1204_BaalNamib;
	condition = info_baalnamib_beginning_condition;
	information = info_baalnamib_beginning_info;
	important = 1;
	permanent = 0;
};


func int info_baalnamib_beginning_condition()
{
	if(Npc_KnowsInfo(hero,info_baalnamib_tattoos))
	{
		return TRUE;
	};
};

func void info_baalnamib_beginning_info()
{
	if(hero_face1 == TRUE)
	{
		AI_PlayAniBS(self,"T_STAND_2_PRAY",BS_SIT);
		AI_PlayAniBS(hero,"T_STAND_2_PRAY",BS_SIT);
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_01");	//�ni�cy, oddaj� w twoje r�ce nowego s�ug�.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_02");	//Udowodni�, �e jest godzien i powinien by� got�w, by ci s�u�y�.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_03");	//Jest prawdziwym zwolennikiem wiary i chce si� wydosta� z tego miejsca, tak jak my wszyscy.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_04");	//Wska� mu drog� i chro� jego dusz� przed wszelkimi zagro�eniami.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_05");	//Albowiem odt�d staje si� on cz�ci� naszej spo�eczno�ci.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_06");	//Powtarzaj za mn�.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_07");	//�ni�cy, o�wiadczam niniejszym...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_08");	//�ni�cy, o�wiadczam niniejszym...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_09");	//...�em got�w jest s�u�y� ci po wsze czasy...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_10");	//...�em got�w jest s�u�y� ci po wsze czasy...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_11");	//...aby ma dusza zosta�a wyzwolona dzi�ki twej sile...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_12");	//...aby ma dusza zosta�a wyzwolona dzi�ki twej sile...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_13");	//...wska� mi drog� do wolno�ci i ze�lij natchnienie...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_14");	//...wska� mi drog� do wolno�ci i ze�lij natchnienie...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_15");	//...albowiem droga twa jest kluczem do zbawienia.
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_16");	//...albowiem droga twa jest kluczem do zbawienia.
		AI_StopProcessInfos(self);
		Wld_PlayEffect("SPELLFX_TELEPORT",hero,hero,0,0,0,FALSE);
		Mdl_SetVisualBody(hero,"hum_body_Naked0",1,1,"HUM_HEAD_BALD",124,2,-1);
		AI_Standup(self);
		AI_Standup(hero);
	}
	else if(hero_face2 == TRUE)
	{
		AI_PlayAniBS(self,"T_STAND_2_PRAY",BS_SIT);
		AI_PlayAniBS(hero,"T_STAND_2_PRAY",BS_SIT);
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_01");	//�ni�cy, oddaj� w twoje r�ce nowego s�ug�.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_02");	//Udowodni�, �e jest godzien i powinien by� got�w, by ci s�u�y�.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_03");	//Jest prawdziwym zwolennikiem wiary i chce si� wydosta� z tego miejsca, tak jak my wszyscy.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_04");	//Wska� mu drog� i chro� jego dusz� przed wszelkimi zagro�eniami.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_05");	//Albowiem odt�d staje si� on cz�ci� naszej spo�eczno�ci.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_06");	//Powtarzaj za mn�.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_07");	//�ni�cy, o�wiadczam niniejszym...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_08");	//�ni�cy, o�wiadczam niniejszym...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_09");	//...�em got�w jest s�u�y� ci po wsze czasy...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_10");	//...�em got�w jest s�u�y� ci po wsze czasy...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_11");	//...aby ma dusza zosta�a wyzwolona dzi�ki twej sile...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_12");	//...aby ma dusza zosta�a wyzwolona dzi�ki twej sile...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_13");	//...wska� mi drog� do wolno�ci i ze�lij natchnienie...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_14");	//...wska� mi drog� do wolno�ci i ze�lij natchnienie...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_15");	//...albowiem droga twa jest kluczem do zbawienia.
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_16");	//...albowiem droga twa jest kluczem do zbawienia.
		AI_StopProcessInfos(self);
		Wld_PlayEffect("SPELLFX_TELEPORT",hero,hero,0,0,0,FALSE);
		Mdl_SetVisualBody(hero,"hum_body_Naked0",1,1,"HUM_HEAD_BALD",118,2,-1);
		AI_Standup(self);
		AI_Standup(hero);
	}
	else if(hero_face3 == TRUE)
	{
		AI_PlayAniBS(self,"T_STAND_2_PRAY",BS_SIT);
		AI_PlayAniBS(hero,"T_STAND_2_PRAY",BS_SIT);
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_01");	//�ni�cy, oddaj� w twoje r�ce nowego s�ug�.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_02");	//Udowodni�, �e jest godzien i powinien by� got�w, by ci s�u�y�.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_03");	//Jest prawdziwym zwolennikiem wiary i chce si� wydosta� z tego miejsca, tak jak my wszyscy.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_04");	//Wska� mu drog� i chro� jego dusz� przed wszelkimi zagro�eniami.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_05");	//Albowiem odt�d staje si� on cz�ci� naszej spo�eczno�ci.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_06");	//Powtarzaj za mn�.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_07");	//�ni�cy, o�wiadczam niniejszym...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_08");	//�ni�cy, o�wiadczam niniejszym...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_09");	//...�em got�w jest s�u�y� ci po wsze czasy...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_10");	//...�em got�w jest s�u�y� ci po wsze czasy...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_11");	//...aby ma dusza zosta�a wyzwolona dzi�ki twej sile...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_12");	//...aby ma dusza zosta�a wyzwolona dzi�ki twej sile...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_13");	//...wska� mi drog� do wolno�ci i ze�lij natchnienie...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_14");	//...wska� mi drog� do wolno�ci i ze�lij natchnienie...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_15");	//...albowiem droga twa jest kluczem do zbawienia.
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_16");	//...albowiem droga twa jest kluczem do zbawienia.
		AI_StopProcessInfos(self);
		Wld_PlayEffect("SPELLFX_TELEPORT",hero,hero,0,0,0,FALSE);
		Mdl_SetVisualBody(hero,"hum_body_Naked0",1,1,"HUM_HEAD_BALD",122,2,-1);
		AI_Standup(self);
		AI_Standup(hero);
	}
	else if(hero_face4 == TRUE)
	{
		AI_PlayAniBS(self,"T_STAND_2_PRAY",BS_SIT);
		AI_PlayAniBS(hero,"T_STAND_2_PRAY",BS_SIT);
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_01");	//�ni�cy, oddaj� w twoje r�ce nowego s�ug�.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_02");	//Udowodni�, �e jest godzien i powinien by� got�w, by ci s�u�y�.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_03");	//Jest prawdziwym zwolennikiem wiary i chce si� wydosta� z tego miejsca, tak jak my wszyscy.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_04");	//Wska� mu drog� i chro� jego dusz� przed wszelkimi zagro�eniami.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_05");	//Albowiem odt�d staje si� on cz�ci� naszej spo�eczno�ci.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_06");	//Powtarzaj za mn�.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_07");	//�ni�cy, o�wiadczam niniejszym...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_08");	//�ni�cy, o�wiadczam niniejszym...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_09");	//...�em got�w jest s�u�y� ci po wsze czasy...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_10");	//...�em got�w jest s�u�y� ci po wsze czasy...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_11");	//...aby ma dusza zosta�a wyzwolona dzi�ki twej sile...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_12");	//...aby ma dusza zosta�a wyzwolona dzi�ki twej sile...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_13");	//...wska� mi drog� do wolno�ci i ze�lij natchnienie...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_14");	//...wska� mi drog� do wolno�ci i ze�lij natchnienie...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_15");	//...albowiem droga twa jest kluczem do zbawienia.
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_16");	//...albowiem droga twa jest kluczem do zbawienia.
		AI_StopProcessInfos(self);
		Wld_PlayEffect("SPELLFX_TELEPORT",hero,hero,0,0,0,FALSE);
		Mdl_SetVisualBody(hero,"hum_body_Naked0",1,1,"HUM_HEAD_BALD",121,2,-1);
		AI_Standup(self);
		AI_Standup(hero);
	}
	else if(hero_face5 == TRUE)
	{
		AI_PlayAniBS(self,"T_STAND_2_PRAY",BS_SIT);
		AI_PlayAniBS(hero,"T_STAND_2_PRAY",BS_SIT);
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_01");	//�ni�cy, oddaj� w twoje r�ce nowego s�ug�.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_02");	//Udowodni�, �e jest godzien i powinien by� got�w, by ci s�u�y�.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_03");	//Jest prawdziwym zwolennikiem wiary i chce si� wydosta� z tego miejsca, tak jak my wszyscy.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_04");	//Wska� mu drog� i chro� jego dusz� przed wszelkimi zagro�eniami.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_05");	//Albowiem odt�d staje si� on cz�ci� naszej spo�eczno�ci.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_06");	//Powtarzaj za mn�.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_07");	//�ni�cy, o�wiadczam niniejszym...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_08");	//�ni�cy, o�wiadczam niniejszym...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_09");	//...�em got�w jest s�u�y� ci po wsze czasy...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_10");	//...�em got�w jest s�u�y� ci po wsze czasy...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_11");	//...aby ma dusza zosta�a wyzwolona dzi�ki twej sile...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_12");	//...aby ma dusza zosta�a wyzwolona dzi�ki twej sile...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_13");	//...wska� mi drog� do wolno�ci i ze�lij natchnienie...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_14");	//...wska� mi drog� do wolno�ci i ze�lij natchnienie...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_15");	//...albowiem droga twa jest kluczem do zbawienia.
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_16");	//...albowiem droga twa jest kluczem do zbawienia.
		AI_StopProcessInfos(self);
		Wld_PlayEffect("SPELLFX_TELEPORT",hero,hero,0,0,0,FALSE);
		Mdl_SetVisualBody(hero,"hum_body_Naked0",1,1,"HUM_HEAD_BALD",123,2,-1);
		AI_Standup(self);
		AI_Standup(hero);
	}
	else if(hero_face6 == TRUE)
	{
		AI_PlayAniBS(self,"T_STAND_2_PRAY",BS_SIT);
		AI_PlayAniBS(hero,"T_STAND_2_PRAY",BS_SIT);
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_01");	//�ni�cy, oddaj� w twoje r�ce nowego s�ug�.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_02");	//Udowodni�, �e jest godzien i powinien by� got�w, by ci s�u�y�.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_03");	//Jest prawdziwym zwolennikiem wiary i chce si� wydosta� z tego miejsca, tak jak my wszyscy.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_04");	//Wska� mu drog� i chro� jego dusz� przed wszelkimi zagro�eniami.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_05");	//Albowiem odt�d staje si� on cz�ci� naszej spo�eczno�ci.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_06");	//Powtarzaj za mn�.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_07");	//�ni�cy, o�wiadczam niniejszym...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_08");	//�ni�cy, o�wiadczam niniejszym...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_09");	//...�em got�w jest s�u�y� ci po wsze czasy...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_10");	//...�em got�w jest s�u�y� ci po wsze czasy...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_11");	//...aby ma dusza zosta�a wyzwolona dzi�ki twej sile...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_12");	//...aby ma dusza zosta�a wyzwolona dzi�ki twej sile...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_13");	//...wska� mi drog� do wolno�ci i ze�lij natchnienie...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_14");	//...wska� mi drog� do wolno�ci i ze�lij natchnienie...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_15");	//...albowiem droga twa jest kluczem do zbawienia.
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_16");	//...albowiem droga twa jest kluczem do zbawienia.
		AI_StopProcessInfos(self);
		Wld_PlayEffect("SPELLFX_TELEPORT",hero,hero,0,0,0,FALSE);
		Mdl_SetVisualBody(hero,"hum_body_Naked0",1,1,"HUM_HEAD_BALD",125,2,-1);
		AI_Standup(self);
		AI_Standup(hero);
	};
};


instance INFO_BAALNAMIB_WILLKOMMEN(C_Info)
{
	npc = GUR_1204_BaalNamib;
	condition = info_baalnamib_willkommen_condition;
	information = info_baalnamib_willkommen_info;
	important = 1;
	permanent = 0;
};


func int info_baalnamib_willkommen_condition()
{
	if(Npc_KnowsInfo(hero,info_baalnamib_beginning))
	{
		return TRUE;
	};
};

func void info_baalnamib_willkommen_info()
{
	AI_Output(self,other,"Info_BaalNamib_WILLKOMMEN_15_01");	//Witam ci� w imieniu ca�ego Bractwa �ni�cego.
	AI_Output(self,other,"Info_BaalNamib_WILLKOMMEN_15_02");	//Przed tob� d�uga, ale i lukratywna droga.
	AI_Output(self,other,"Info_BaalNamib_WILLKOMMEN_01_03");	//Podj��e� s�uszn� decyzj�.
	AI_Output(self,other,"Info_BaalNamib_WILLKOMMEN_01_04");	//Czas poka�e, jak� �cie�k� wyznaczy� dla ciebie �ni�cy.
	AI_Output(self,other,"Info_BaalNamib_WILLKOMMEN_01_05");	//Mo�e staniesz si� jego wybra�cem, tak jak i ja?
	AI_Output(self,other,"Info_BaalNamib_WILLKOMMEN_01_06");	//Albo zostaniesz wyznaczony do ochrony obozu jak Cor Angar.
	AI_Output(self,other,"Info_BaalNamib_WILLKOMMEN_01_07");	//Zobaczymy.
	AI_Output(self,other,"Info_BaalNamib_WILLKOMMEN_01_08");	//Niech �ni�cy ma ci� w swojej opiece, Nowicjuszu.
	AI_Standup(self);
	AI_Standup(hero);
	namib_ritual = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_RITUAL,LOG_SUCCESS);
	B_LogEntry(CH1_RITUAL,"Baal Namib przeprowadzi� rytua�, dzi�ki kt�remu oficjalnie zosta�em cz�onkiem obozu Bractwa.");
	B_GiveXP(XP_NAMIBRITUAL);
	Npc_ExchangeRoutine(GUR_1204_BaalNamib,"START");
	Npc_ExchangeRoutine(tpl_5051_templer,"START");
	Npc_ExchangeRoutine(tpl_5052_templer,"START");
	AI_StopProcessInfos(self);
};

