
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
	description = "Troszczysz siê o pola ry¿owe, czy¿ nie?";
};


func int DIA_Ricelord_Hello_Condition()
{
	return 1;
};

func void DIA_Ricelord_Hello_Info()
{
	AI_Output(other,self,"DIA_Ricelord_Hello_15_00");	//Troszczysz siê o pola ry¿owe, czy¿ nie?
	AI_Output(self,other,"DIA_Ricelord_Hello_12_01");	//Czemu pytasz? Szukasz pracy?
	Log_CreateTopic(GE_TraderNC,LOG_NOTE);
	B_LogEntry(GE_TraderNC,"Ry¿owy Ksi¹¿ê mo¿e mi zaoferowaæ ró¿norodne towary.");
};


instance DIA_RICELORD_TEACHME(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 1;
	condition = dia_ricelord_teachme_condition;
	information = dia_ricelord_teachme_info;
	permanent = 0;
	description = "Mo¿esz mnie czegoœ nauczyæ?";
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
	AI_Output(hero,self,"Info_Diego_Teach_15_00");	//Mo¿esz mnie czegoœ nauczyæ?
	AI_Output(self,other,"DIA_Ricelord_TeachMe_12_01");	//Pewnie. Znam siê na obrabianiu ry¿u i jego gotowaniu.
	AI_Output(self,other,"DIA_Ricelord_TeachMe_12_02");	//Jednak zanim ciê tego nauczê, bêdziesz musia³ nieco popracowaæ na polu, tak jak pozostali.
	AI_Output(self,other,"DIA_Ricelord_TeachMe_12_03");	//Tak ¿e przynieœ mi 15 sztuk ry¿u siewnego i mo¿emy zaczynaæ.
	learn_ricelord = LOG_RUNNING;
	Log_CreateTopic(CH1_FARMER,LOG_MISSION);
	Log_SetTopicStatus(CH1_FARMER,LOG_RUNNING);
	B_LogEntry(CH1_FARMER,"Jeœli Ry¿owy Ksi¹¿ê ma mnie czegokolwiek nauczyæ, muszê pierw popracowaæ trochê na polu tak jak reszta zbieraczy. Mam zerwaæ 15 sztuk ry¿u siewnego i zanieœæ je do Ksiêcia. Dopiero wtedy nauczy mnie on gotowaæ.");
};


instance dia_ricelord_deliever(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 1;
	condition = dia_ricelord_deliever_condition;
	information = dia_ricelord_deliever_info;
	permanent = 0;
	description = "Oto twój ry¿.";
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
	AI_Output(other,self,"DIA_Ricelord_Deliever_15_00");	//Oto twój ry¿.
	AI_Output(self,other,"DIA_Ricelord_Deliever_12_01");	//Achh. Czyli jednak na coœ siê przyda³eœ. Dobra, jeœli chcesz, mogê ciê nauczyæ w jaki sposób mo¿na ugotowaæ ten ry¿.
	AI_Output(self,other,"DIA_Ricelord_Deliever_12_02");	//Oczywiœcie jeœli bêdziesz mia³ w tym choæ trochê doœwiadczenia.
	B_GiveInvItems(other,self,itmi_plants_rice_01,15);
	learn_ricelord = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_FARMER,LOG_SUCCESS);
	B_LogEntry(CH1_FARMER,"Przynios³em Ry¿owemu Ksiêciu jego roœliny, dziêki czemu mogê teraz liczyæ na jego pomoc. Od teraz mo¿e mnie nauczyæ w jaki sposób mo¿na ugotowaæ ry¿.");
	B_GiveXP(XP_RICELORDTRAIN);
};


instance DIA_RICELORD_RICE(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 3;
	condition = dia_ricelord_rice_condition;
	information = dia_ricelord_rice_info;
	permanent = 1;
	description = "Ry¿ (Koszt: 1 punkt nauki)";
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
	AI_Output(other,self,"DIA_Ricelord_Rice_15_00");	//Naucz mnie gotowaæ ry¿.
	if(hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output(self,other,"DIA_Ricelord_Rice_12_01");	//Zaczynasz pierw od zagotowania wody.
		AI_Output(self,other,"DIA_Ricelord_Rice_12_02");	//Kiedy ju¿ bêdzie porz¹dnie kipiæ, dodajesz do garnka ry¿.
		AI_Output(self,other,"DIA_Ricelord_Rice_12_03");	//Z ry¿em musisz byæ nader ostro¿ny, ¿eby siê czasem za d³ugo nie gotowa³. W przeciwnym razie mo¿esz o wszystkim zapomnieæ.
		AI_Output(self,other,"DIA_Ricelord_Rice_12_04");	//Jak ju¿ tylko zagotujesz ten ry¿, mo¿esz go przesypaæ do miski i skonsumowaæ. To nie powinno byæ trudne.
		Log_CreateTopic(GE_COOK,LOG_NOTE);
		B_LogEntry(GE_COOK,"Potrafiê od teraz gotowaæ ry¿.");
		B_LogEntry(GE_COOK,"Sk³adniki: 2 sztuki ry¿u siewnego oraz woda.");
		knows_rice = TRUE;
		PrintScreen("Nowa umiejêtnoœæ: Gotowanie ry¿u",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Za ma³o punktów umiejêtnoœci!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
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
	description = "A masz dla mnie jakieœ zajêcie?";
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
	AI_Output(other,self,"DIA_Ricelord_Arbeit_15_00");	//A masz dla mnie jakieœ zajêcie?
	AI_Output(self,other,"DIA_Ricelord_Arbeit_12_01");	//Porozmawiaj z Lewusem. Krêci siê zwykle na prawo od szopy.
};


instance DIA_Ricelord_TRADE(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 800;
	condition = DIA_Ricelord_TRADE_Condition;
	information = DIA_Ricelord_TRADE_Info;
	permanent = 1;
	description = "Mo¿e siê dogadamy...";
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
	AI_Output(other,self,"DIA_Ricelord_TRADE_15_00");	//Mo¿e siê dogadamy...
	AI_Output(self,other,"DIA_Ricelord_TRADE_12_01");	//A co mo¿esz mi zaoferowaæ?
};


var int ricelord_onceaday;

instance DIA_Ricelord_LeftySentMe(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 1;
	condition = DIA_Ricelord_LeftySentMe_Condition;
	information = DIA_Ricelord_LeftySentMe_Info;
	permanent = 1;
	description = "Przysy³a mnie Lewus.";
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
	AI_Output(other,self,"DIA_Ricelord_LeftySentMe_15_00");	//Przysy³a mnie Lewus.
	AI_Output(self,other,"DIA_Ricelord_LeftySentMe_12_01");	//Tak? I co powiedzia³?
	Ricelord_AskedForWater = TRUE;
};


instance DIA_Ricelord_GetWater(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 1;
	condition = DIA_Ricelord_GetWater_Condition;
	information = DIA_Ricelord_GetWater_Info;
	permanent = 1;
	description = "Mam zanieœæ wodê zbieraczom ry¿u!";
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
	AI_Output(other,self,"DIA_Ricelord_GetWater_15_00");	//Mam zanieœæ wodê zbieraczom ry¿u!
	if(Lefty_WorkDay == Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Ricelord_GetWater_12_01");	//Dobra. Masz tu tuzin butelek.
		AI_Output(self,other,"DIA_Ricelord_GetWater_12_02");	//To jakieœ dwa razy wiêcej ni¿ liczba zbieraczy, wiêc postaraj siê rozdzieliæ je sprawiedliwie.
		CreateInvItems(self,ItFo_Potion_Water_01,12);
		B_GiveInvItems(self,other,ItFo_Potion_Water_01,12);
		ricelord_onceaday = Wld_GetDay();
		Ricelord_AskedForWater = FALSE;
		B_LogEntry(CH1_CarryWater,"Ry¿owy Ksi¹¿e da³ mi tuzin butelek z wod¹.");
		AI_StopProcessInfos(self);
	}
	else if(Lefty_WorkDay == (Wld_GetDay() - 1))
	{
		AI_Output(self,other,"DIA_Ricelord_GetWater_TooLate_12_00");	//To by³o wczoraj, ch³opcze. Lepiej zajrzyj znowu do Lewusa. Chyba ma ci coœ do powiedzenia.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Ricelord_GetWater_TooLate_12_01");	//To by³o parê dni temu, ch³opcze. Lepiej zajrzyj znowu do Lewusa. Chyba ma ci coœ do powiedzenia.
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
	description = "Op³aca siê pracowaæ jako jeden z twoich ochroniarzy?";
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
	AI_Output(other,self,"DIA_Ricelord_Lefty_15_00");	//Op³aca siê pracowaæ jako jeden z twoich ochroniarzy?
	AI_Output(self,other,"DIA_Ricelord_Lefty_15_01");	//Moi ludzie nie narzekaj¹ na p³acê. A czemu pytasz? Szukasz roboty?
	AI_Output(other,self,"DIA_Ricelord_Lefty_15_02");	//Nie, zobaczy³em po prostu u Lewusa doœæ cenny pierœcieñ na jego palcu i tak mnie to tylko zaciekawi³o.
	AI_Output(self,other,"DIA_Ricelord_Lefty_15_03");	//Pierœcieñ? Doprawdy?
	AI_Output(self,other,"DIA_Ricelord_Lefty_15_04");	//Zabawne, bo mój w³aœnie zosta³ skradziony. I mówisz, ¿e jest on w posiadaniu nowego pierœcienia?
	AI_Output(self,other,"DIA_Ricelord_Lefty_15_05");	//Poczekaj chwilkê, muszê sobie zamieniæ z Lewusem kilka s³ów...
	CreateInvItems(self,ricelords_ring,1);
	EquipItem(self,ricelords_ring);
	Npc_RemoveInvItems(Org_844_Lefty,ricelords_ring,1);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,Org_844_Lefty);
	AI_StartState(self,ZS_Attack,1,"");
};

