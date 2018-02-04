
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
	AI_Output(self,other,"Org_818_Ratford_WrongWay_07_02");	//Chcê ciê ostrzec. Id¹c dalej wejdziesz na nasze tereny ³owieckie.
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
	AI_Output(self,other,"Org_818_Ratford_WhatGame_07_01");	//G³ównie na œcierwojady. Da siê je zjeœæ, no i nietrudno je zabiæ... Jeœli wie siê jak to zrobiæ.
	AI_Output(other,self,"Org_818_Ratford_WhatGame_15_02");	//Naprawdê? Macie jak¹œ specjaln¹ metodê?
	AI_Output(self,other,"Org_818_Ratford_WhatGame_07_03");	//Zapytaj mojego kumpla, Draxa. Nikt nie wie wiêcej o œcierwojadach ni¿ on.
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
	AI_Output(self,other,"Org_818_Ratford_WhyDangerous_07_01");	//Jesteœ tu nowy, co? W ca³ej kolonii jest mnóstwo mniej lub bardziej niebezpiecznych miejsc.
	AI_Output(self,other,"Org_818_Ratford_WhyDangerous_07_02");	//Œcie¿ki pomiêdzy obozami s¹ doœæ bezpieczne, ale nawet tam mo¿na natkn¹æ siê na stado wilków, które bêd¹ chcia³y zjeœæ ciê na kolacjê.
	AI_Output(self,other,"Org_818_Ratford_WhyDangerous_07_03");	//Dlatego lepiej nie ruszaæ siê nigdzie bez odpowiedniego orê¿a i zbroi.
};


instance Org_818_Ratford_WoEquipment(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_WoEquipment_Condition;
	information = Org_818_Ratford_WoEquipment_Info;
	permanent = 0;
	description = "Sk¹d mogê wzi¹æ lepsze wyposa¿enie?";
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
	AI_Output(other,self,"Org_818_Ratford_WoEquipment_15_00");	//Sk¹d mogê wzi¹æ lepsze wyposa¿enie?
	AI_Output(self,other,"Org_818_Ratford_WoEquipment_07_01");	//Najbli¿ej bêdzie pewnie Stary Obóz. IdŸ dalej t¹ sam¹ œcie¿k¹, na pewno trafisz.
	AI_Output(self,other,"Org_818_Ratford_WoEquipment_07_02");	//Ale lepsze ceny znajdziesz u nas - w Nowym Obozie. Oczywiœcie pod warunkiem, ¿e znasz w³aœciwych ludzi.
	AI_Output(self,other,"Org_818_Ratford_WoEquipment_07_03");	//Kiedy trafisz do Starego Obozu, poszukaj mê¿czyzny imieniem Mordrag. To jeden z naszych. Za kilka bry³ek rudy mo¿na u niego kupiæ wiele wartoœciowych rzeczy.
	Log_CreateTopic(GE_TraderOC,LOG_NOTE);
	B_LogEntry(GE_TraderOC,"Szkodnik Mordrag handluje w Starym Obozie ró¿nymi towarami. Ponoæ ma bardzo przystêpne ceny.");
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
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_01");	//Jeœli zamierzasz podró¿owaæ miêdzy obozami, przyda ci siê mapa z wszystkimi œcie¿kami i œlepymi zau³kami.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_02");	//Niektóre œcie¿ki prowadz¹ do niebezpiecznych kanionów, gdzie mo¿na wpaœæ na istoty, na które... lepiej nie wpadaæ.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_03");	//Pod ¿adnym pozorem nie w³ócz siê w pobli¿u starych ruin. Wiêkszoœæ z nich pamiêta jeszcze pierwsz¹ wojnê z Orkami. Niektóre s¹ nawet pozosta³oœciami po ich osiedlach.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_04");	//Czêsto krêc¹ siê tam Orkowie albo jeszcze gorsze poczwary. Na twoim miejscu unika³bym takich miejsc jak ognia. Zw³aszcza noc¹.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_05");	//I jeszcze jedna rada - nie wchodŸ do lasu!
};


instance Org_818_Ratford_WoKarte(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_WoKarte_Condition;
	information = Org_818_Ratford_WoKarte_Info;
	permanent = 0;
	description = "Gdzie mogê zdobyæ jak¹œ mapê?";
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
	AI_Output(other,self,"Org_818_Ratford_WoKarte_15_00");	//Gdzie mogê zdobyæ jak¹œ mapê?
	AI_Output(self,other,"Org_818_Ratford_WoKarte_07_01");	//Popytaj ludzi w Starym Obozie. Mieszka tam jeden kartograf.
	AI_Output(self,other,"Org_818_Ratford_WoKarte_07_02");	//Mo¿e uda ci siê gwizdn¹æ mu jak¹œ mapê. Przy okazji móg³byœ zwin¹æ tak¿e jedn¹ dla mnie!
	ratford_map = LOG_RUNNING;
	Log_CreateTopic(CH1_RATFORDMAP,LOG_MISSION);
	Log_SetTopicStatus(CH1_RATFORDMAP,LOG_RUNNING);
	B_LogEntry(CH1_RATFORDMAP,"Ratford, jeden ze Szkodników z Nowego Obozu chce, abym za³atwi³ mu ze Starego Obozu jak¹œ mapê. Powinien tam przesiadywaæ kartograf imieniem Graham, u którego bêdê móg³ nabyæ jedn¹ z nich.");
	Info_ClearChoices(Org_818_Ratford_WoKarte);
	Info_AddChoice(Org_818_Ratford_WoKarte,"Jeœli uda mi siê zdobyæ je bez p³acenia, wezmê ile tylko dam radê udŸwign¹æ!",Org_818_Ratford_WoKarte_Stehlen);
	Info_AddChoice(Org_818_Ratford_WoKarte,"Dlaczego? Jego mapy nie s¹ na sprzeda¿?",Org_818_Ratford_WoKarte_Kaufen);
};

func void Org_818_Ratford_WoKarte_Stehlen()
{
	var C_Npc Lares;
	AI_Output(other,self,"Org_818_Ratford_WoKarte_Stehlen_15_00");	//Jeœli uda mi siê zdobyæ je bez p³acenia, wezmê ile tylko dam radê udŸwign¹æ!
	AI_Output(self,other,"Org_818_Ratford_WoKarte_Stehlen_07_01");	//Równy z ciebie goœæ! Powinieneœ pomyœleæ o do³¹czeniu do Nowego Obozu. Gdybyœ kiedyœ tam trafi³, pytaj o Laresa. To on zajmuje siê nowymi. Na pewno znajdzie dla ciebie jakieœ zajêcie!
	Lares = Hlp_GetNpc(Org_801_Lares);
	Lares.aivar[AIV_FINDABLE] = TRUE;
	Info_ClearChoices(Org_818_Ratford_WoKarte);
};

func void Org_818_Ratford_WoKarte_Kaufen()
{
	AI_Output(other,self,"Org_818_Ratford_WoKarte_Kaufen_15_00");	//Dlaczego? Jego mapy nie s¹ na sprzeda¿?
	AI_Output(self,other,"Org_818_Ratford_WoKarte_Kaufen_07_01");	//Jeœli staæ ciê na tak ogromny wydatek...
	Info_ClearChoices(Org_818_Ratford_WoKarte);
};


instance Org_818_Ratford_Thanks(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 888;
	condition = Org_818_Ratford_Thanks_Condition;
	information = Org_818_Ratford_Thanks_Info;
	permanent = 0;
	description = "Dziêki za pomoc.";
};


func int Org_818_Ratford_Thanks_Condition()
{
	return 1;
};

func void Org_818_Ratford_Thanks_Info()
{
	AI_Output(other,self,"Org_818_Ratford_Thanks_15_00");	//Dziêki za pomoc.
	AI_Output(self,other,"Org_818_Ratford_Thanks_07_01");	//Tylko nie myœl, ¿e wszyscy tutaj s¹ tacy mili!
	AI_Output(self,other,"Org_818_Ratford_Thanks_07_02");	//Niewiele mo¿na znaleŸæ w kieszeniach Nowego, ale w kolonii s¹ ludzie, którzy roz³upaliby ci czaszkê za stary kilof.
	AI_Output(other,self,"Org_818_Ratford_Thanks_15_04");	//Bêdê o tym pamiêta³.
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
	AI_Output(self,other,"DIA_Ratford_NowORG_09_00");	//Jak widzê, Lares przyj¹³ ciê do naszej bandy. Dobra robota, ch³opcze.
};


instance DIA_RATFORD_MAP(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = dia_ratford_map_condition;
	information = dia_ratford_map_info;
	permanent = 0;
	important = 0;
	description = "Mam mapê dla ciebie.";
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
	AI_Output(other,self,"DIA_Ratford_Map_09_00");	//Mam mapê dla ciebie.
	AI_Output(self,other,"DIA_Ratford_Map_09_01");	//Bardzo dobrze. I co? Jak wszed³eœ w jej posiadanie?
	if(Npc_HasItems(other,ItWrWorldmap) > 0)
	{
		B_GiveInvItems(other,self,ItWrWorldmap,1);
		AI_Output(other,self,"DIA_Ratford_MapBuy_09_00");	//Odkupi³em j¹ od Grahama.
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Ratford_MapBuy_09_01");	//Doprawdy? Myœla³em, ¿e masz w sobie trochê wiêcej odwagi.
		AI_Output(self,other,"DIA_Ratford_MapBuy_09_02");	//Ale mniejsza o to, masz tu za fatygê.
		CreateInvItems(self,ItMiNugget,10);
		B_GiveInvItems(self,other,ItMiNugget,10);
		ratford_map = LOG_SUCCESS;
		Log_SetTopicStatus(CH1_RATFORDMAP,LOG_SUCCESS);
		B_LogEntry(CH1_RATFORDMAP,"Za³atwi³em Ratfordowi mapê. Nie by³ zbytnio zachwycony tym, ¿e jedynie odkupi³em j¹ od Grahama, zamiast mu j¹ ukraœæ.");
		B_GiveXP(XP_RATFORDMAP);
	}
	else if(Npc_HasItems(other,itwrworldmap_mission) > 0)
	{
		AI_Output(other,self,"DIA_Ratford_MapStolen_09_00");	//Wykrad³em j¹ Grahamowi ze skrzyni.
		B_GiveInvItems(other,self,itwrworldmap_mission,1);
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Ratford_MapStolen_09_01");	//NieŸle, ch³opcze. Hehe.
		AI_Output(self,other,"DIA_Ratford_MapStolen_09_02");	//Przyda³by nam siê ktoœ taki jak ty w Nowym Obozie.
		AI_Output(self,other,"DIA_Ratford_MapStolen_09_03");	//Trzymaj, na pewno ci siê przyda.
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
		B_LogEntry(CH1_RATFORDMAP,"Za³atwi³em Ratfordowi mapê. By³ zachwycony, ¿e uda³o mi siê j¹ wykraœæ Grahamowi. Powiedzia³ nawet, ¿e pasowa³bym do Nowego Obozu.");
		B_GiveXP(XP_RATFORDMAP);
	};
};

