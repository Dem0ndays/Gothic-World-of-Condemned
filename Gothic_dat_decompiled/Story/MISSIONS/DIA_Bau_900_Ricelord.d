
instance DIA_Ricelord_EXIT(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 999;
	condition = DIA_Ricelord_EXIT_Condition;
	information = DIA_Ricelord_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Ricelord_EXIT_Condition()
{
	return 1;
};

func void DIA_Ricelord_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ricelord_Hello(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 1;
	condition = DIA_Ricelord_Hello_Condition;
	information = DIA_Ricelord_Hello_Info;
	permanent = 0;
	description = "Troszczysz si� o pola ry�owe, czy� nie?";
};


func int DIA_Ricelord_Hello_Condition()
{
	return 1;
};

func void DIA_Ricelord_Hello_Info()
{
	AI_Output(other,self,"DIA_Ricelord_Hello_15_00");	//Troszczysz si� o pola ry�owe, czy� nie?
	AI_Output(self,other,"DIA_Ricelord_Hello_12_01");	//Czemu pytasz? Szukasz pracy?
	Log_CreateTopic(GE_TraderNC,LOG_NOTE);
	B_LogEntry(GE_TraderNC,"Ry�owy Ksi��� mo�e mi zaoferowa� r�norodne towary.");
};


instance DIA_RICELORD_TEACHME(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 1;
	condition = dia_ricelord_teachme_condition;
	information = dia_ricelord_teachme_info;
	permanent = 0;
	description = "Mo�esz mnie czego� nauczy�?";
};


func int dia_ricelord_teachme_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ricelord_Hello))
	{
		return 1;
	};
};

func void dia_ricelord_teachme_info()
{
	AI_Output(hero,self,"Info_Diego_Teach_15_00");	//Mo�esz mnie czego� nauczy�?
	AI_Output(self,other,"DIA_Ricelord_TeachMe_12_01");	//Pewnie. Znam si� na obrabianiu ry�u i jego gotowaniu.
	AI_Output(self,other,"DIA_Ricelord_TeachMe_12_02");	//Jednak zanim ci� tego naucz�, b�dziesz musia� nieco popracowa� na polu, tak jak pozostali.
	AI_Output(self,other,"DIA_Ricelord_TeachMe_12_03");	//Tak �e przynie� mi 15 sztuk ry�u siewnego i mo�emy zaczyna�.
	learn_ricelord = LOG_RUNNING;
	Log_CreateTopic(CH1_FARMER,LOG_MISSION);
	Log_SetTopicStatus(CH1_FARMER,LOG_RUNNING);
	B_LogEntry(CH1_FARMER,"Je�li Ry�owy Ksi��� ma mnie czegokolwiek nauczy�, musz� pierw popracowa� troch� na polu tak jak reszta zbieraczy. Mam zerwa� 15 sztuk ry�u siewnego i zanie�� je do Ksi�cia. Dopiero wtedy nauczy mnie on gotowa�.");
};


instance dia_ricelord_deliever(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 1;
	condition = dia_ricelord_deliever_condition;
	information = dia_ricelord_deliever_info;
	permanent = 0;
	description = "Oto tw�j ry�.";
};


func int dia_ricelord_deliever_condition()
{
	if((learn_ricelord == LOG_RUNNING) && (Npc_HasItems(other,itmi_plants_rice_01) >= 15))
	{
		return 1;
	};
};

func void dia_ricelord_deliever_info()
{
	AI_Output(other,self,"DIA_Ricelord_Deliever_15_00");	//Oto tw�j ry�.
	AI_Output(self,other,"DIA_Ricelord_Deliever_12_01");	//Achh. Czyli jednak na co� si� przyda�e�. Dobra, je�li chcesz, mog� ci� nauczy� w jaki spos�b mo�na ugotowa� ten ry�.
	AI_Output(self,other,"DIA_Ricelord_Deliever_12_02");	//Oczywi�cie je�li b�dziesz mia� w tym cho� troch� do�wiadczenia.
	B_GiveInvItems(other,self,itmi_plants_rice_01,15);
	learn_ricelord = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_FARMER,LOG_SUCCESS);
	B_LogEntry(CH1_FARMER,"Przynios�em Ry�owemu Ksi�ciu jego ro�liny, dzi�ki czemu mog� teraz liczy� na jego pomoc. Od teraz mo�e mnie nauczy� w jaki spos�b mo�na ugotowa� ry�.");
	B_GiveXP(XP_RICELORDTRAIN);
};


instance DIA_RICELORD_RICE(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 3;
	condition = dia_ricelord_rice_condition;
	information = dia_ricelord_rice_info;
	permanent = 1;
	description = "Ry� (Koszt: 1 punkt nauki)";
};


func int dia_ricelord_rice_condition()
{
	if((learn_ricelord == LOG_SUCCESS) && Npc_KnowsInfo(hero,dia_ricelord_deliever) && (knows_rice == FALSE))
	{
		return 1;
	};
};

func void dia_ricelord_rice_info()
{
	AI_Output(other,self,"DIA_Ricelord_Rice_15_00");	//Naucz mnie gotowa� ry�.
	if(hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output(self,other,"DIA_Ricelord_Rice_12_01");	//Zaczynasz pierw od zagotowania wody.
		AI_Output(self,other,"DIA_Ricelord_Rice_12_02");	//Kiedy ju� b�dzie porz�dnie kipi�, dodajesz do garnka ry�.
		AI_Output(self,other,"DIA_Ricelord_Rice_12_03");	//Z ry�em musisz by� nader ostro�ny, �eby si� czasem za d�ugo nie gotowa�. W przeciwnym razie mo�esz o wszystkim zapomnie�.
		AI_Output(self,other,"DIA_Ricelord_Rice_12_04");	//Jak ju� tylko zagotujesz ten ry�, mo�esz go przesypa� do miski i skonsumowa�. To nie powinno by� trudne.
		Log_CreateTopic(GE_COOK,LOG_NOTE);
		B_LogEntry(GE_COOK,"Potrafi� od teraz gotowa� ry�.");
		B_LogEntry(GE_COOK,"Sk�adniki: 2 sztuki ry�u siewnego oraz woda.");
		knows_rice = TRUE;
		PrintScreen("Nowa umiej�tno��: Gotowanie ry�u",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_Ricelord_Arbeit(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 1;
	condition = DIA_Ricelord_Arbeit_Condition;
	information = DIA_Ricelord_Arbeit_Info;
	permanent = 0;
	description = "A masz dla mnie jakie� zaj�cie?";
};


func int DIA_Ricelord_Arbeit_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ricelord_Hello) && !Npc_KnowsInfo(hero,DIA_Lefty_First) && (LeftyDead == FALSE))
	{
		return 1;
	};
};

func void DIA_Ricelord_Arbeit_Info()
{
	AI_Output(other,self,"DIA_Ricelord_Arbeit_15_00");	//A masz dla mnie jakie� zaj�cie?
	AI_Output(self,other,"DIA_Ricelord_Arbeit_12_01");	//Porozmawiaj z Lewusem. Kr�ci si� zwykle na prawo od szopy.
};


instance DIA_Ricelord_TRADE(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 800;
	condition = DIA_Ricelord_TRADE_Condition;
	information = DIA_Ricelord_TRADE_Info;
	permanent = 1;
	description = "Mo�e si� dogadamy...";
	trade = 1;
};


func int DIA_Ricelord_TRADE_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ricelord_Hello))
	{
		return 1;
	};
};

func void DIA_Ricelord_TRADE_Info()
{
	AI_Output(other,self,"DIA_Ricelord_TRADE_15_00");	//Mo�e si� dogadamy...
	AI_Output(self,other,"DIA_Ricelord_TRADE_12_01");	//A co mo�esz mi zaoferowa�?
};


var int ricelord_onceaday;

instance DIA_Ricelord_LeftySentMe(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 1;
	condition = DIA_Ricelord_LeftySentMe_Condition;
	information = DIA_Ricelord_LeftySentMe_Info;
	permanent = 1;
	description = "Przysy�a mnie Lewus.";
};


func int DIA_Ricelord_LeftySentMe_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ricelord_Hello) && (Lefty_Mission == LOG_RUNNING) && (Ricelord_AskedForWater == FALSE) && (LeftyDead == FALSE))
	{
		return 1;
	};
};

func void DIA_Ricelord_LeftySentMe_Info()
{
	AI_Output(other,self,"DIA_Ricelord_LeftySentMe_15_00");	//Przysy�a mnie Lewus.
	AI_Output(self,other,"DIA_Ricelord_LeftySentMe_12_01");	//Tak? I co powiedzia�?
	Ricelord_AskedForWater = TRUE;
};


instance DIA_Ricelord_GetWater(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 1;
	condition = DIA_Ricelord_GetWater_Condition;
	information = DIA_Ricelord_GetWater_Info;
	permanent = 1;
	description = "Mam zanie�� wod� zbieraczom ry�u!";
};


func int DIA_Ricelord_GetWater_Condition()
{
	if((Ricelord_AskedForWater == TRUE) && (Lefty_Mission == LOG_RUNNING))
	{
		return 1;
	};
};

func void DIA_Ricelord_GetWater_Info()
{
	AI_Output(other,self,"DIA_Ricelord_GetWater_15_00");	//Mam zanie�� wod� zbieraczom ry�u!
	if(Lefty_WorkDay == Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Ricelord_GetWater_12_01");	//Dobra. Masz tu tuzin butelek.
		AI_Output(self,other,"DIA_Ricelord_GetWater_12_02");	//To jakie� dwa razy wi�cej ni� liczba zbieraczy, wi�c postaraj si� rozdzieli� je sprawiedliwie.
		CreateInvItems(self,ItFo_Potion_Water_01,12);
		B_GiveInvItems(self,other,ItFo_Potion_Water_01,12);
		ricelord_onceaday = Wld_GetDay();
		Ricelord_AskedForWater = FALSE;
		B_LogEntry(CH1_CarryWater,"Ry�owy Ksi��e da� mi tuzin butelek z wod�.");
		AI_StopProcessInfos(self);
	}
	else if(Lefty_WorkDay == (Wld_GetDay() - 1))
	{
		AI_Output(self,other,"DIA_Ricelord_GetWater_TooLate_12_00");	//To by�o wczoraj, ch�opcze. Lepiej zajrzyj znowu do Lewusa. Chyba ma ci co� do powiedzenia.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Ricelord_GetWater_TooLate_12_01");	//To by�o par� dni temu, ch�opcze. Lepiej zajrzyj znowu do Lewusa. Chyba ma ci co� do powiedzenia.
		AI_StopProcessInfos(self);
	};
};


instance dia_ricelord_lefty(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 1;
	condition = dia_ricelord_lefty_condition;
	information = dia_ricelord_lefty_info;
	permanent = 0;
	description = "Op�aca si� pracowa� jako jeden z twoich ochroniarzy?";
};


func int dia_ricelord_lefty_condition()
{
	if(Npc_KnowsInfo(hero,dia_lefty_ring) && (riot_ricelord == LOG_RUNNING))
	{
		return 1;
	};
};

func void dia_ricelord_lefty_info()
{
	AI_Output(other,self,"DIA_Ricelord_Lefty_15_00");	//Op�aca si� pracowa� jako jeden z twoich ochroniarzy?
	AI_Output(self,other,"DIA_Ricelord_Lefty_15_01");	//Moi ludzie nie narzekaj� na p�ac�. A czemu pytasz? Szukasz roboty?
	AI_Output(other,self,"DIA_Ricelord_Lefty_15_02");	//Nie, zobaczy�em po prostu u Lewusa do�� cenny pier�cie� na jego palcu i tak mnie to tylko zaciekawi�o.
	AI_Output(self,other,"DIA_Ricelord_Lefty_15_03");	//Pier�cie�? Doprawdy?
	AI_Output(self,other,"DIA_Ricelord_Lefty_15_04");	//Zabawne, bo m�j w�a�nie zosta� skradziony. I m�wisz, �e jest on w posiadaniu nowego pier�cienia?
	AI_Output(self,other,"DIA_Ricelord_Lefty_15_05");	//Poczekaj chwilk�, musz� sobie zamieni� z Lewusem kilka s��w...
	CreateInvItems(self,ricelords_ring,1);
	EquipItem(self,ricelords_ring);
	Npc_RemoveInvItems(Org_844_Lefty,ricelords_ring,1);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,Org_844_Lefty);
	AI_StartState(self,ZS_Attack,1,"");
};

