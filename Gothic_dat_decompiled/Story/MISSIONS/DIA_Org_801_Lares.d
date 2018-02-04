
instance ORG_801_Lares_Exit(C_Info)
{
	npc = Org_801_Lares;
	nr = 999;
	condition = ORG_801_Lares_Exit_Condition;
	information = ORG_801_Lares_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int ORG_801_Lares_Exit_Condition()
{
	return 1;
};

func void ORG_801_Lares_Exit_Info()
{
	AI_StopProcessInfos(self);
};


var int Lares_vorbeigemogelt;

instance ORG_801_Lares_YouHere(C_Info)
{
	npc = Org_801_Lares;
	nr = 1;
	condition = ORG_801_Lares_YouHere_Condition;
	information = ORG_801_Lares_YouHere_Info;
	permanent = 1;
	important = 1;
};


func int ORG_801_Lares_YouHere_Condition()
{
	var C_Npc Roscoe;
	Roscoe = Hlp_GetNpc(ORG_840_Roscoe);
	if(Roscoe.aivar[AIV_PASSGATE] == FALSE)
	{
		return 1;
	};
};

func void ORG_801_Lares_YouHere_Info()
{
	var C_Npc Roscoe;
	Roscoe = Hlp_GetNpc(ORG_840_Roscoe);
	if(Npc_IsInState(Roscoe,ZS_MagicSleep) || (Npc_GetTempAttitude(Roscoe,other) == ATT_FRIENDLY))
	{
		AI_Output(self,other,"ORG_801_Lares_YouHere_11_00");	//Jak si� tu dosta�e�? Co si� dzieje z Roscoe?
		AI_Output(other,self,"ORG_801_Lares_YouHere_15_01");	//Wola� nie pr�bowa� mnie powstrzymywa�!
		AI_Output(self,other,"ORG_801_Lares_YouHere_11_02");	//Czego chcesz?
		Roscoe.aivar[AIV_PASSGATE] = TRUE;
		Lares_vorbeigemogelt = TRUE;
		B_GiveXP(XP_CheatedIntoLaresHut);
	}
	else
	{
		Npc_SetTempAttitude(self,ATT_HOSTILE);
		AI_StopProcessInfos(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_Attack,1,"");
	};
};


instance ORG_801_Lares_WannaJoin(C_Info)
{
	npc = Org_801_Lares;
	nr = 1;
	condition = ORG_801_Lares_WannaJoin_Condition;
	information = ORG_801_Lares_WannaJoin_Info;
	permanent = 0;
	description = "Chc� do was do��czy�.";
};


func int ORG_801_Lares_WannaJoin_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_None) && (Kapitel < 2))
	{
		return 1;
	};
};

func void ORG_801_Lares_WannaJoin_Info()
{
	AI_Output(other,self,"ORG_801_Lares_WannaJoin_15_00");	//Chc� do was do��czy�.
	AI_Output(self,other,"ORG_801_Lares_WannaJoin_11_01");	//Tak? A co takiego mo�esz nam zaoferowa�?
};


var int Lares_BringListBack;

instance ORG_801_Lares_BringList(C_Info)
{
	npc = Org_801_Lares;
	nr = 2;
	condition = ORG_801_Lares_BringList_Condition;
	information = ORG_801_Lares_BringList_Info;
	permanent = 0;
	description = "Mam przy sobie list� zam�wie� dla Starej Kopalni.";
};


func int ORG_801_Lares_BringList_Condition()
{
	if(Npc_KnowsInfo(hero,ORG_801_Lares_WannaJoin) && Npc_HasItems(hero,TheList))
	{
		return 1;
	};
};

func void ORG_801_Lares_BringList_Info()
{
	AI_Output(other,self,"ORG_801_Lares_BringList_15_00");	//Mam przy sobie list� zam�wie� dla Starej Kopalni.
	AI_Output(self,other,"ORG_801_Lares_BringList_11_01");	//O niech mnie... Albo jeste� cholernie odwa�ny, albo cholernie g�upi...
	AI_Output(self,other,"ORG_801_Lares_BringList_11_02");	//Poka�!
	AI_Output(other,self,"ORG_801_Lares_BringList_15_03");	//Oto ona...
	B_UseFakeScroll();
	AI_Output(self,other,"ORG_801_Lares_BringList_11_04");	//Rzeczywi�cie! Wiesz, co z ni� teraz zrobimy? Dopiszemy par� rzeczy, a ty zaniesiesz j� do Starego Obozu!
	AI_Output(self,other,"ORG_801_Lares_BringList_11_05");	//A jak ju� dostarcz� wszystko do kopalni, obrabujemy ich ze wszystkiego! To nie zajmie d�ugo... Ha! Masz tu list�. Wiesz, co masz robi�.
	Points_NC = Points_NC + 10;
	Lares_BringListBack = LOG_RUNNING;
	Npc_RemoveInvItem(hero,TheList);
	CreateInvItem(hero,TheListNC);
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		Log_CreateTopic(CH1_JoinNC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinNC,LOG_RUNNING);
	};
	B_LogEntry(CH1_JoinNC,"Przyw�dca Szkodnik�w by� zaskoczony, gdy wr�czy�em mu list� zam�wie�. Doda� do niej kilka rzeczy i kaza� mi dostarczy� j� Diego.");
	B_GiveXP(XP_GiveListToLares);
};


instance ORG_801_Lares_BringListBack(C_Info)
{
	npc = Org_801_Lares;
	nr = 2;
	condition = ORG_801_Lares_BringListBack_Condition;
	information = ORG_801_Lares_BringListBack_Info;
	permanent = 0;
	description = "Przekaza�em list� Diego.";
};


func int ORG_801_Lares_BringListBack_Condition()
{
	if((Lares_BringListBack == LOG_RUNNING) && (Diego_BringList == LOG_SUCCESS))
	{
		return 1;
	};
};

func void ORG_801_Lares_BringListBack_Info()
{
	AI_Output(other,self,"ORG_801_Lares_BringListBack_15_00");	//Przekaza�em list� Diego.
	AI_Output(self,other,"ORG_801_Lares_BringListBack_15_01");	//�wietnie! Nast�pne co zrobisz, to przejdziesz si� do Gorna. On ci wszystko o napadzie opowie.
	AI_Output(other,self,"ORG_801_Lares_BringListBack_15_02");	//A co ma z tym Gorn wsp�lnego?
	AI_Output(self,other,"ORG_801_Lares_BringListBack_15_03");	//Czasami lepiej jest nie wiedzie� za du�o. Id� ju� po prostu i z nim pogadaj.
	if(Npc_GetTrueGuild(hero) != GIL_ORG)
	{
		AI_Output(self,other,"ORG_801_Lares_BringListBack_15_04");	//A tak, do naszych napad�w nie b�dziemy brali obcych, logiczne, dlatego pierw b�dziesz musia� do nas do��czy�.
	};
	Points_NC = Points_NC + 10;
	Lares_BringListBack = LOG_SUCCESS;
	B_LogEntry(CH1_JoinNC,"Lares by� zadowolony z mojej pracy. Powiedzia�, �e powinienem pogada� z Gornem w sprawie napadu na konw�j. Dop�ki jednak nie zostan� Szkodnikiem, nie mam co liczy� na t� wypraw� zb�jeck�.");
	B_GiveXP(XP_ReportListDeliveryToLares);
};


instance ORG_801_Lares_MordragSentMe(C_Info)
{
	npc = Org_801_Lares;
	nr = 2;
	condition = ORG_801_Lares_MordragSentMe_Condition;
	information = ORG_801_Lares_MordragSentMe_Info;
	permanent = 0;
	description = "Przysy�a mnie Mordrag. Mam dla ciebie pier�cie�.";
};


func int ORG_801_Lares_MordragSentMe_Condition()
{
	if(Npc_KnowsInfo(hero,ORG_801_Lares_WannaJoin) && Npc_HasItems(hero,MordragsRing) && (Kapitel < 2))
	{
		return 1;
	};
};

func void ORG_801_Lares_MordragSentMe_Info()
{
	B_GiveInvItems(other,self,MordragsRing,1);
	AI_Output(other,self,"ORG_801_Lares_MordragSentMe_15_00");	//Przysy�a mnie Mordrag. Mam dla ciebie pier�cie�.
	AI_Output(self,other,"ORG_801_Lares_MordragSentMe_11_01");	//Cenna b�yskotka. To taki zwyczaj - cz�� �upu oddaje si� szefowi bandy.
	AI_Output(self,other,"ORG_801_Lares_MordragSentMe_11_02");	//Ale skoro powierzy� ci ten pier�cie�, musi mie� o tobie wysokie mniemanie.
	AI_Output(self,other,"ORG_801_Lares_MordragSentMe_11_03");	//Chc�, �eby� poszed� do niego i przekaza� mu wiadomo�� ode mnie.
	AI_Output(self,other,"ORG_801_Lares_MordragSentMe_11_04");	//Powiedz mu, �e potrzebuj� kogo� w obozie na bagnie. Bractwo planuje co� du�ego, a ja chc� wiedzie�, co si� tam b�dzie dzia�o.
	Lares_InformMordrag = LOG_RUNNING;
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		Log_CreateTopic(CH1_JoinNC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinNC,LOG_RUNNING);
	};
	B_LogEntry(CH1_JoinNC,"Lares wys�a� mnie do Mordraga. Mam mu przekaza�, �e do obozu Bractwa nale�y wys�a� szpiega.");
	B_GiveXP(XP_GiveRingToLares);
	Points_NC = Points_NC + 10;
};


instance ORG_801_Lares_Vorbeigemogelt(C_Info)
{
	npc = Org_801_Lares;
	nr = 2;
	condition = ORG_801_Lares_Vorbeigemogelt_Condition;
	information = ORG_801_Lares_Vorbeigemogelt_Info;
	permanent = 0;
	description = "Uda�o mi si� omin�� twoje stra�e.";
};


func int ORG_801_Lares_Vorbeigemogelt_Condition()
{
	if(Npc_KnowsInfo(hero,ORG_801_Lares_WannaJoin) && (Lares_vorbeigemogelt == TRUE))
	{
		return 1;
	};
};

func void ORG_801_Lares_Vorbeigemogelt_Info()
{
	AI_Output(other,self,"ORG_801_Lares_Vorbeigemogelt_15_00");	//Uda�o mi si� omin�� twoje stra�e.
	AI_Output(self,other,"ORG_801_Lares_Vorbeigemogelt_11_01");	//Fakt. Ale to jeszcze za ma�o.
	Points_NC = Points_NC + 10;
};


var int Lares_Get400Ore;

instance ORG_801_Lares_GetKraut(C_Info)
{
	npc = Org_801_Lares;
	nr = 10;
	condition = ORG_801_Lares_GetKraut_Condition;
	information = ORG_801_Lares_GetKraut_Info;
	permanent = 0;
	description = "To co mam zrobi�, �eby ci� przekona�?";
};


func int ORG_801_Lares_GetKraut_Condition()
{
	if(Npc_KnowsInfo(hero,ORG_801_Lares_BringList) || Npc_KnowsInfo(hero,ORG_801_Lares_MordragSentMe) || Npc_KnowsInfo(hero,ORG_801_Lares_Vorbeigemogelt))
	{
		return 1;
	};
};

func void ORG_801_Lares_GetKraut_Info()
{
	AI_Output(other,self,"ORG_801_Lares_GetKraut_15_00");	//To co mam zrobi�, �eby ci� przekona�?
	AI_Output(self,other,"ORG_801_Lares_GetKraut_11_01");	//Pewien cz�owiek z Sekty, niejaki Baal Isidro, ma przy sobie ziele warte co najmniej 400 bry�ek rudy. Chc�, �eby� mi je przyni�s�. Jak tego dokonasz - to ju� twoja sprawa.
	if((BaalIsidro_DealerJob == LOG_RUNNING) || (BaalIsidro_DealerJob == LOG_SUCCESS))
	{
		AI_Output(other,self,"ORG_801_Lares_GetKraut_15_02");	//Je�li masz na my�li t� stert� trawy, to mam j� ju� od dawna.
		AI_Output(self,other,"ORG_801_Lares_GetKraut_11_03");	//Widz�, �e sprytny z ciebie ch�opak!
	};
	AI_Output(self,other,"ORG_801_Lares_GetKraut_11_04");	//Skoro masz ju� ziele, chc�, �eby� je sprzeda�. Przynie� mi 400 bry�ek rudy.
	AI_Output(self,other,"ORG_801_Lares_GetKraut_11_05");	//Wtedy wr�cimy do twojego cz�onkostwa w mojej bandzie.
	Lares_Get400Ore = LOG_RUNNING;
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		Log_CreateTopic(CH1_JoinNC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinNC,LOG_RUNNING);
	};
	B_LogEntry(CH1_JoinNC,"Mam zabra� parti� ziela Baalowi Isidro i sprzeda� j� za 400 bry�ek rudy. Zyski maj� trafi� do Laresa.");
};


instance ORG_801_Lares_400Ore(C_Info)
{
	npc = Org_801_Lares;
	nr = 2;
	condition = ORG_801_Lares_400Ore_Condition;
	information = ORG_801_Lares_400Ore_Info;
	permanent = 1;
	description = "Mam dla ciebie 400 bry�ek.";
};


func int ORG_801_Lares_400Ore_Condition()
{
	if((Lares_Get400Ore == LOG_RUNNING) && ((BaalIsidro_DealerJob == LOG_RUNNING) || (BaalIsidro_DealerJob == LOG_SUCCESS)))
	{
		return 1;
	};
};

func void ORG_801_Lares_400Ore_Info()
{
	AI_Output(other,self,"ORG_801_Lares_400Ore_15_00");	//Mam dla ciebie 400 bry�ek.
	if(Npc_HasItems(other,ItMiNugget) >= 400)
	{
		AI_Output(self,other,"ORG_801_Lares_400Ore_11_01");	//Dobrze! �wietnie! To mi chyba wystarczy.
		Lares_Get400Ore = LOG_SUCCESS;
		Points_NC = Points_NC + 10;
		B_GiveInvItems(other,self,ItMiNugget,400);
		B_LogEntry(CH1_JoinNC,"Lares otrzyma� swoje 400 bry�ek rudy ze sprzeda�y ziela. Wydawa� si� usatysfakcjonowany.");
		B_GiveXP(XP_BaalIsidroPayLares);
	}
	else
	{
		AI_Output(self,other,"ORG_801_Lares_400Ore_NOORE_11_00");	//Lepiej przelicz jeszcze raz! Mam nadziej�, �e nie wyda�e� ich na gorza��!
	};
};


instance ORG_801_Lares_Reicht(C_Info)
{
	npc = Org_801_Lares;
	nr = 5;
	condition = ORG_801_Lares_Reicht_Condition;
	information = ORG_801_Lares_Reicht_Info;
	permanent = 1;
	description = "Czy to wystarczy, by�cie mnie przyj�li?";
};


func int ORG_801_Lares_Reicht_Condition()
{
	if(Npc_KnowsInfo(hero,ORG_801_Lares_WannaJoin) && (Npc_KnowsInfo(hero,ORG_801_Lares_MordragSentMe) || Npc_KnowsInfo(hero,ORG_801_Lares_BringList)) && (Npc_GetTrueGuild(other) == GIL_None) && (Kapitel < 2))
	{
		return 1;
	};
};

func void ORG_801_Lares_Reicht_Info()
{
	AI_Output(other,self,"ORG_801_Lares_Reicht_15_00");	//Czy to wystarczy, by�cie mnie przyj�li?
	if((Points_NC >= 30) && (hero.level >= 5))
	{
		AI_Output(self,other,"ORG_801_Lares_Reicht_AUFNAHME_11_00");	//My�l�, �e tak!
		AI_Output(self,other,"ORG_801_Lares_Reicht_AUFNAHME_11_01");	//I mam dla ciebie ma�y prezent! Lepszy pancerz. Mo�e nie jest to szczyt marze�, ale zas�u�y�e� na niego.
		Mdl_SetVisualBody(hero,"hum_body_Naked0",0,1,"Hum_Head_Pony",9,2,-1);
		Mdl_ApplyOverlayMds(hero,"Humans_Relaxed.mds");
		hero.guild = GIL_ORG;
		Npc_SetTrueGuild(hero,GIL_ORG);
		CreateInvItem(hero,org_armor_l);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		AI_EquipBestArmor(hero);
		B_GiveXP(XP_BecomeBandit);
		Wld_AssignRoomToGuild("psih22",GIL_NOV);
		Wld_AssignRoomToGuild("h�tte26",GIL_VLK);
		GRD_215_Torwache.aivar[AIV_PASSGATE] = FALSE;
		B_LogEntry(CH1_JoinNC,"Lares przyj�� mnie do swojej bandy. Od dzi� Nowy Ob�z b�dzie moim nowym domem.");
		Log_SetTopicStatus(CH1_JoinNC,LOG_SUCCESS);
		Log_CreateTopic(CH1_JoinOC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinOC,LOG_FAILED);
		B_LogEntry(CH1_JoinOC,"Cz�onek bandy Laresa nie mo�e do��czy� do Starego Obozu!");
		Log_CreateTopic(CH1_JoinPsi,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinPsi,LOG_FAILED);
		B_LogEntry(CH1_JoinPsi,"Bractwo b�dzie musia�o radzi� sobie beze mnie. Od dzi� moim domem jest Nowy Ob�z!");
	}
	else
	{
		if(Npc_KnowsInfo(hero,ORG_801_Lares_MordragSentMe))
		{
			AI_Output(self,other,"ORG_801_Lares_Reicht_11_02");	//Mordrag opowiedzia� si� za tob�.
		};
		if(Npc_KnowsInfo(hero,ORG_801_Lares_BringList))
		{
			AI_Output(self,other,"ORG_801_Lares_Reicht_11_03");	//Sta�e� si� bardzo popularny, odk�d przynios�e� nam t� list�.
		};
		AI_Output(self,other,"ORG_801_Lares_Reicht_11_04");	//Ale nie jeste� gotowy. Popracuj nad sob� jeszcze troch�.
		B_PrintGuildCondition(5);
	};
};


instance ORG_801_Lares_GotoKalom(C_Info)
{
	npc = Org_801_Lares;
	nr = 10;
	condition = ORG_801_Lares_GotoKalom_Condition;
	information = ORG_801_Lares_GotoKalom_Info;
	permanent = 0;
	description = "I co mam robi� dalej?";
};


func int ORG_801_Lares_GotoKalom_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_ORG)
	{
		return 1;
	};
};

func void ORG_801_Lares_GotoKalom_Info()
{
	var C_Npc Mordrag;
	AI_Output(other,self,"ORG_801_Lares_GotoKalom_15_00");	//I co mam robi� dalej?
	AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_01");	//Nale�ysz teraz do naszej bandy. Mo�esz robi�, co ci si� �ywnie podoba.
	Log_CreateTopic(CH1_GotoPsiCamp,LOG_MISSION);
	Log_SetTopicStatus(CH1_GotoPsiCamp,LOG_RUNNING);
	B_LogEntry(CH1_GotoPsiCamp,"Bractwo �ni�cego planuje co� du�ego. Lares, przyw�dca Szkodnik�w z Nowego Obozu, chce si� dowiedzie�, co to jest.");
	if(Lares_InformMordrag == LOG_RUNNING)
	{
		AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_02");	//Je�li chcesz robi� co� po�ytecznego, pogadaj z Mordragiem i pom� mu w sprawie Sekty.
		B_LogEntry(CH1_GotoPsiCamp,"Mam pom�c Mordragowi w wyja�nieniu tej sprawy!");
	}
	else
	{
		Mordrag = Hlp_GetNpc(ORG_826_Mordrag);
		if(Npc_IsDead(Mordrag))
		{
			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_03");	//Zgin�� Mordrag, jeden z naszych ludzi w Starym Obozie. Przed �mierci� zd��y� przys�a� nam wiadomo��. Wygl�da na to, �e w obozie Sekty dzieje si� co� wa�nego.
			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_04");	//Chc�, �eby� uda� si� do obozu na bagnie i troch� tam pow�szy�.
			B_LogEntry(CH1_GotoPsiCamp,"Wys�a� mnie wprost do obozu Bractwa.");
		}
		else
		{
			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_05");	//Wr�ci� Mordrag, jeden z naszych ludzi w Starym Obozie.
			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_06");	//Chc�, �eby� z nim porozmawia�. Powiedz mu, �e potrzebuj� wtyczki w obozie Sekty. Bractwo planuje co� du�ego, a ja chc� wiedzie�, co si� tam dzieje.
			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_07");	//Masz mu pom�c.
			B_LogEntry(CH1_GotoPsiCamp,"Ma si� tym zaj�� Szkodnik imieniem Mordrag. Znajd� go w karczmie na jeziorze.");
			B_ExchangeRoutine(ORG_826_Mordrag,"START");
			Lares_InformMordrag = LOG_RUNNING;
		};
	};
};


instance ORG_801_Lares_WhereLearn(C_Info)
{
	npc = Org_801_Lares;
	nr = 20;
	condition = ORG_801_Lares_WhereLearn_Condition;
	information = ORG_801_Lares_WhereLearn_Info;
	permanent = 0;
	description = "Gdzie mog� si� tu czego� nauczy�?";
};


func int ORG_801_Lares_WhereLearn_Condition()
{
	return TRUE;
};

func void ORG_801_Lares_WhereLearn_Info()
{
	AI_Output(other,self,"ORG_801_Lares_WhereLearn_Info_15_01");	//Gdzie mog� si� tu czego� nauczy�?
	AI_Output(self,other,"ORG_801_Lares_WhereLearn_Info_11_02");	//Na przyk�ad u mnie. Mog� ci pokaza�, jak zwi�kszy� twoj� si�� i zr�czno��.
	Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
	B_LogEntry(GE_TeacherNC,"Lares mo�e mi pokaza�, jak zwi�kszy� moj� si�� i umiej�tno�ci.");
};


instance ORG_801_Lares_Teach(C_Info)
{
	npc = Org_801_Lares;
	nr = 20;
	condition = ORG_801_Lares_Teach_Condition;
	information = ORG_801_Lares_Teach_Info;
	permanent = 1;
	description = "Chc� nauczy� si� czego� nowego.";
};


func int ORG_801_Lares_Teach_Condition()
{
	if(Npc_KnowsInfo(hero,ORG_801_Lares_WhereLearn))
	{
		return TRUE;
	};
};

func void ORG_801_Lares_Teach_Info()
{
	AI_Output(other,self,"ORG_801_Lares_Teach_15_00");	//Chc� nauczy� si� czego� nowego.
	Info_ClearChoices(ORG_801_Lares_Teach);
	Info_AddChoice(ORG_801_Lares_Teach,DIALOG_BACK,ORG_801_Lares_Teach_BACK);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),ORG_801_Lares_Teach_STR_5);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),ORG_801_Lares_Teach_STR_1);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_801_Lares_Teach_DEX_5);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_801_Lares_Teach_DEX_1);
};

func void ORG_801_Lares_Teach_BACK()
{
	Info_ClearChoices(ORG_801_Lares_Teach);
};

func void ORG_801_Lares_Teach_STR_1()
{
	B_BuyAttributePoints(other,ATR_STRENGTH,LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(ORG_801_Lares_Teach);
	Info_AddChoice(ORG_801_Lares_Teach,DIALOG_BACK,ORG_801_Lares_Teach_BACK);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),ORG_801_Lares_Teach_STR_5);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),ORG_801_Lares_Teach_STR_1);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_801_Lares_Teach_DEX_5);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_801_Lares_Teach_DEX_1);
};

func void ORG_801_Lares_Teach_STR_5()
{
	B_BuyAttributePoints(other,ATR_STRENGTH,5 * LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(ORG_801_Lares_Teach);
	Info_AddChoice(ORG_801_Lares_Teach,DIALOG_BACK,ORG_801_Lares_Teach_BACK);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),ORG_801_Lares_Teach_STR_5);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),ORG_801_Lares_Teach_STR_1);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_801_Lares_Teach_DEX_5);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_801_Lares_Teach_DEX_1);
};

func void ORG_801_Lares_Teach_DEX_1()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(ORG_801_Lares_Teach);
	Info_AddChoice(ORG_801_Lares_Teach,DIALOG_BACK,ORG_801_Lares_Teach_BACK);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),ORG_801_Lares_Teach_STR_5);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),ORG_801_Lares_Teach_STR_1);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_801_Lares_Teach_DEX_5);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_801_Lares_Teach_DEX_1);
};

func void ORG_801_Lares_Teach_DEX_5()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(ORG_801_Lares_Teach);
	Info_AddChoice(ORG_801_Lares_Teach,DIALOG_BACK,ORG_801_Lares_Teach_BACK);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),ORG_801_Lares_Teach_STR_5);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),ORG_801_Lares_Teach_STR_1);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_801_Lares_Teach_DEX_5);
	Info_AddChoice(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_801_Lares_Teach_DEX_1);
};

