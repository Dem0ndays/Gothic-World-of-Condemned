
instance Org_818_Ratford_Exit(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 999;
	condition = Org_818_Ratford_Exit_Condition;
	information = Org_818_Ratford_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Org_818_Ratford_Exit_Condition()
{
	return 1;
};

func void Org_818_Ratford_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Org_818_Ratford_WrongWay(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_WrongWay_Condition;
	information = Org_818_Ratford_WrongWay_Info;
	permanent = 0;
	important = 1;
};


func int Org_818_Ratford_WrongWay_Condition()
{
	return 1;
};

func void Org_818_Ratford_WrongWay_Info()
{
	AI_Output(self,other,"Org_818_Ratford_WrongWay_07_00");	//Hej, ty!
	AI_Output(other,self,"Org_818_Ratford_WrongWay_15_01");	//Czego chcesz?
	AI_Output(self,other,"Org_818_Ratford_WrongWay_07_02");	//Chc� ci� ostrzec. Id�c dalej wejdziesz na nasze tereny �owieckie.
	Npc_ExchangeRoutine(self,"HUNT");
};


instance Org_818_Ratford_WhatGame(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_WhatGame_Condition;
	information = Org_818_Ratford_WhatGame_Info;
	permanent = 0;
	description = "Na co polujecie?";
};


func int Org_818_Ratford_WhatGame_Condition()
{
	return 1;
};

func void Org_818_Ratford_WhatGame_Info()
{
	AI_Output(other,self,"Org_818_Ratford_WhatGame_15_00");	//Na co polujecie?
	AI_Output(self,other,"Org_818_Ratford_WhatGame_07_01");	//G��wnie na �cierwojady. Da si� je zje��, no i nietrudno je zabi�... Je�li wie si� jak to zrobi�.
	AI_Output(other,self,"Org_818_Ratford_WhatGame_15_02");	//Naprawd�? Macie jak�� specjaln� metod�?
	AI_Output(self,other,"Org_818_Ratford_WhatGame_07_03");	//Zapytaj mojego kumpla, Draxa. Nikt nie wie wi�cej o �cierwojadach ni� on.
};


instance Org_818_Ratford_WhyDangerous(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_WhyDangerous_Condition;
	information = Org_818_Ratford_WhyDangerous_Info;
	permanent = 0;
	description = "Dlaczego ten teren jest tak niebezpieczny?";
};


func int Org_818_Ratford_WhyDangerous_Condition()
{
	return 1;
};

func void Org_818_Ratford_WhyDangerous_Info()
{
	AI_Output(other,self,"Org_818_Ratford_WhyDangerous_15_00");	//Dlaczego ten teren jest tak niebezpieczny?
	AI_Output(self,other,"Org_818_Ratford_WhyDangerous_07_01");	//Jeste� tu nowy, co? W ca�ej kolonii jest mn�stwo mniej lub bardziej niebezpiecznych miejsc.
	AI_Output(self,other,"Org_818_Ratford_WhyDangerous_07_02");	//�cie�ki pomi�dzy obozami s� do�� bezpieczne, ale nawet tam mo�na natkn�� si� na stado wilk�w, kt�re b�d� chcia�y zje�� ci� na kolacj�.
	AI_Output(self,other,"Org_818_Ratford_WhyDangerous_07_03");	//Dlatego lepiej nie rusza� si� nigdzie bez odpowiedniego or�a i zbroi.
};


instance Org_818_Ratford_WoEquipment(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_WoEquipment_Condition;
	information = Org_818_Ratford_WoEquipment_Info;
	permanent = 0;
	description = "Sk�d mog� wzi�� lepsze wyposa�enie?";
};


func int Org_818_Ratford_WoEquipment_Condition()
{
	if(Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous))
	{
		return 1;
	};
};

func void Org_818_Ratford_WoEquipment_Info()
{
	AI_Output(other,self,"Org_818_Ratford_WoEquipment_15_00");	//Sk�d mog� wzi�� lepsze wyposa�enie?
	AI_Output(self,other,"Org_818_Ratford_WoEquipment_07_01");	//Najbli�ej b�dzie pewnie Stary Ob�z. Id� dalej t� sam� �cie�k�, na pewno trafisz.
	AI_Output(self,other,"Org_818_Ratford_WoEquipment_07_02");	//Ale lepsze ceny znajdziesz u nas - w Nowym Obozie. Oczywi�cie pod warunkiem, �e znasz w�a�ciwych ludzi.
	AI_Output(self,other,"Org_818_Ratford_WoEquipment_07_03");	//Kiedy trafisz do Starego Obozu, poszukaj m�czyzny imieniem Mordrag. To jeden z naszych. Za kilka bry�ek rudy mo�na u niego kupi� wiele warto�ciowych rzeczy.
	Log_CreateTopic(GE_TraderOC,LOG_NOTE);
	B_LogEntry(GE_TraderOC,"Szkodnik Mordrag handluje w Starym Obozie r�nymi towarami. Pono� ma bardzo przyst�pne ceny.");
};


instance Org_818_Ratford_MoreLocations(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_MoreLocations_Condition;
	information = Org_818_Ratford_MoreLocations_Info;
	permanent = 0;
	description = "Opowiedz mi jeszcze o kolonii.";
};


func int Org_818_Ratford_MoreLocations_Condition()
{
	if(Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous))
	{
		return 1;
	};
};

func void Org_818_Ratford_MoreLocations_Info()
{
	AI_Output(other,self,"Org_818_Ratford_MoreLocations_15_00");	//Opowiedz mi jeszcze o kolonii.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_01");	//Je�li zamierzasz podr�owa� mi�dzy obozami, przyda ci si� mapa z wszystkimi �cie�kami i �lepymi zau�kami.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_02");	//Niekt�re �cie�ki prowadz� do niebezpiecznych kanion�w, gdzie mo�na wpa�� na istoty, na kt�re... lepiej nie wpada�.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_03");	//Pod �adnym pozorem nie w��cz si� w pobli�u starych ruin. Wi�kszo�� z nich pami�ta jeszcze pierwsz� wojn� z Orkami. Niekt�re s� nawet pozosta�o�ciami po ich osiedlach.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_04");	//Cz�sto kr�c� si� tam Orkowie albo jeszcze gorsze poczwary. Na twoim miejscu unika�bym takich miejsc jak ognia. Zw�aszcza noc�.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_05");	//I jeszcze jedna rada - nie wchod� do lasu!
};


instance Org_818_Ratford_WoKarte(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_WoKarte_Condition;
	information = Org_818_Ratford_WoKarte_Info;
	permanent = 0;
	description = "Gdzie mog� zdoby� jak�� map�?";
};


func int Org_818_Ratford_WoKarte_Condition()
{
	if(Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous))
	{
		return 1;
	};
};

func void Org_818_Ratford_WoKarte_Info()
{
	AI_Output(other,self,"Org_818_Ratford_WoKarte_15_00");	//Gdzie mog� zdoby� jak�� map�?
	AI_Output(self,other,"Org_818_Ratford_WoKarte_07_01");	//Popytaj ludzi w Starym Obozie. Mieszka tam jeden kartograf.
	AI_Output(self,other,"Org_818_Ratford_WoKarte_07_02");	//Mo�e uda ci si� gwizdn�� mu jak�� map�. Przy okazji m�g�by� zwin�� tak�e jedn� dla mnie!
	ratford_map = LOG_RUNNING;
	Log_CreateTopic(CH1_RATFORDMAP,LOG_MISSION);
	Log_SetTopicStatus(CH1_RATFORDMAP,LOG_RUNNING);
	B_LogEntry(CH1_RATFORDMAP,"Ratford, jeden ze Szkodnik�w z Nowego Obozu chce, abym za�atwi� mu ze Starego Obozu jak�� map�. Powinien tam przesiadywa� kartograf imieniem Graham, u kt�rego b�d� m�g� naby� jedn� z nich.");
	Info_ClearChoices(Org_818_Ratford_WoKarte);
	Info_AddChoice(Org_818_Ratford_WoKarte,"Je�li uda mi si� zdoby� je bez p�acenia, wezm� ile tylko dam rad� ud�wign��!",Org_818_Ratford_WoKarte_Stehlen);
	Info_AddChoice(Org_818_Ratford_WoKarte,"Dlaczego? Jego mapy nie s� na sprzeda�?",Org_818_Ratford_WoKarte_Kaufen);
};

func void Org_818_Ratford_WoKarte_Stehlen()
{
	var C_Npc Lares;
	AI_Output(other,self,"Org_818_Ratford_WoKarte_Stehlen_15_00");	//Je�li uda mi si� zdoby� je bez p�acenia, wezm� ile tylko dam rad� ud�wign��!
	AI_Output(self,other,"Org_818_Ratford_WoKarte_Stehlen_07_01");	//R�wny z ciebie go��! Powiniene� pomy�le� o do��czeniu do Nowego Obozu. Gdyby� kiedy� tam trafi�, pytaj o Laresa. To on zajmuje si� nowymi. Na pewno znajdzie dla ciebie jakie� zaj�cie!
	Lares = Hlp_GetNpc(Org_801_Lares);
	Lares.aivar[AIV_FINDABLE] = TRUE;
	Info_ClearChoices(Org_818_Ratford_WoKarte);
};

func void Org_818_Ratford_WoKarte_Kaufen()
{
	AI_Output(other,self,"Org_818_Ratford_WoKarte_Kaufen_15_00");	//Dlaczego? Jego mapy nie s� na sprzeda�?
	AI_Output(self,other,"Org_818_Ratford_WoKarte_Kaufen_07_01");	//Je�li sta� ci� na tak ogromny wydatek...
	Info_ClearChoices(Org_818_Ratford_WoKarte);
};


instance Org_818_Ratford_Thanks(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 888;
	condition = Org_818_Ratford_Thanks_Condition;
	information = Org_818_Ratford_Thanks_Info;
	permanent = 0;
	description = "Dzi�ki za pomoc.";
};


func int Org_818_Ratford_Thanks_Condition()
{
	return 1;
};

func void Org_818_Ratford_Thanks_Info()
{
	AI_Output(other,self,"Org_818_Ratford_Thanks_15_00");	//Dzi�ki za pomoc.
	AI_Output(self,other,"Org_818_Ratford_Thanks_07_01");	//Tylko nie my�l, �e wszyscy tutaj s� tacy mili!
	AI_Output(self,other,"Org_818_Ratford_Thanks_07_02");	//Niewiele mo�na znale�� w kieszeniach Nowego, ale w kolonii s� ludzie, kt�rzy roz�upaliby ci czaszk� za stary kilof.
	AI_Output(other,self,"Org_818_Ratford_Thanks_15_04");	//B�d� o tym pami�ta�.
};


instance DIA_RATFORD_NOWORG(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = dia_ratford_noworg_condition;
	information = dia_ratford_noworg_info;
	permanent = 0;
	important = 1;
};


func int dia_ratford_noworg_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_ORG)
	{
		return TRUE;
	};
};

func void dia_ratford_noworg_info()
{
	AI_Output(self,other,"DIA_Ratford_NowORG_09_00");	//Jak widz�, Lares przyj�� ci� do naszej bandy. Dobra robota, ch�opcze.
};


instance DIA_RATFORD_MAP(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = dia_ratford_map_condition;
	information = dia_ratford_map_info;
	permanent = 0;
	important = 0;
	description = "Mam map� dla ciebie.";
};


func int dia_ratford_map_condition()
{
	if(((Npc_HasItems(other,ItWrWorldmap) > 0) && (ratford_map == LOG_RUNNING)) || ((Npc_HasItems(other,itwrworldmap_mission) > 0) && (ratford_map == LOG_RUNNING)))
	{
		return TRUE;
	};
};

func void dia_ratford_map_info()
{
	var int zufallsbelohnung;
	AI_Output(other,self,"DIA_Ratford_Map_09_00");	//Mam map� dla ciebie.
	AI_Output(self,other,"DIA_Ratford_Map_09_01");	//Bardzo dobrze. I co? Jak wszed�e� w jej posiadanie?
	if(Npc_HasItems(other,ItWrWorldmap) > 0)
	{
		B_GiveInvItems(other,self,ItWrWorldmap,1);
		AI_Output(other,self,"DIA_Ratford_MapBuy_09_00");	//Odkupi�em j� od Grahama.
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Ratford_MapBuy_09_01");	//Doprawdy? My�la�em, �e masz w sobie troch� wi�cej odwagi.
		AI_Output(self,other,"DIA_Ratford_MapBuy_09_02");	//Ale mniejsza o to, masz tu za fatyg�.
		CreateInvItems(self,ItMiNugget,10);
		B_GiveInvItems(self,other,ItMiNugget,10);
		ratford_map = LOG_SUCCESS;
		Log_SetTopicStatus(CH1_RATFORDMAP,LOG_SUCCESS);
		B_LogEntry(CH1_RATFORDMAP,"Za�atwi�em Ratfordowi map�. Nie by� zbytnio zachwycony tym, �e jedynie odkupi�em j� od Grahama, zamiast mu j� ukra��.");
		B_GiveXP(XP_RATFORDMAP);
	}
	else if(Npc_HasItems(other,itwrworldmap_mission) > 0)
	{
		AI_Output(other,self,"DIA_Ratford_MapStolen_09_00");	//Wykrad�em j� Grahamowi ze skrzyni.
		B_GiveInvItems(other,self,itwrworldmap_mission,1);
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Ratford_MapStolen_09_01");	//Nie�le, ch�opcze. Hehe.
		AI_Output(self,other,"DIA_Ratford_MapStolen_09_02");	//Przyda�by nam si� kto� taki jak ty w Nowym Obozie.
		AI_Output(self,other,"DIA_Ratford_MapStolen_09_03");	//Trzymaj, na pewno ci si� przyda.
		zufallsbelohnung = Hlp_Random(100);
		if(zufallsbelohnung >= 75)
		{
			CreateInvItems(self,ItAt_Lurker_02,2);
			B_GiveInvItems(self,other,ItAt_Lurker_02,2);
		}
		else if(zufallsbelohnung >= 60)
		{
			CreateInvItems(self,ItFo_Potion_Dex_01,1);
			B_GiveInvItems(self,other,ItFo_Potion_Dex_01,1);
		}
		else if(zufallsbelohnung >= 50)
		{
			CreateInvItems(self,ItMi_Stuff_OldCoin_01,3);
			B_GiveInvItems(self,hero,ItMi_Stuff_OldCoin_01,3);
		}
		else if(zufallsbelohnung >= 40)
		{
			CreateInvItems(self,ItAt_Crawler_01,2);
			B_GiveInvItems(self,other,ItAt_Crawler_01,2);
		}
		else if(zufallsbelohnung >= 30)
		{
			CreateInvItems(self,ItFoMutton,3);
			B_GiveInvItems(self,other,ItFoMutton,3);
		}
		else if(zufallsbelohnung >= 20)
		{
			CreateInvItems(self,ItRw_Bow_Small_04,1);
			B_GiveInvItems(self,other,ItRw_Bow_Small_04,1);
		}
		else if(zufallsbelohnung >= 10)
		{
			CreateInvItems(self,ItMw_1H_Mace_01,1);
			B_GiveInvItems(self,other,ItMw_1H_Mace_01,1);
		};
		ratford_map = LOG_SUCCESS;
		Log_SetTopicStatus(CH1_RATFORDMAP,LOG_SUCCESS);
		B_LogEntry(CH1_RATFORDMAP,"Za�atwi�em Ratfordowi map�. By� zachwycony, �e uda�o mi si� j� wykra�� Grahamowi. Powiedzia� nawet, �e pasowa�bym do Nowego Obozu.");
		B_GiveXP(XP_RATFORDMAP);
	};
};

