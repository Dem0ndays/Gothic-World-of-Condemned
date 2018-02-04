
instance DIA_Cutter_Exit(C_Info)
{
	npc = GRD_208_Cutter;
	nr = 999;
	condition = DIA_Cutter_Exit_Condition;
	information = DIA_Cutter_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Cutter_Exit_Condition()
{
	return 1;
};

func void DIA_Cutter_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Cutter_Hello(C_Info)
{
	npc = GRD_208_Cutter;
	nr = 1;
	condition = DIA_Cutter_Hello_Condition;
	information = DIA_Cutter_Hello_Info;
	permanent = 0;
	description = "Wasz zamek jest bardzo du�y.";
};


func int DIA_Cutter_Hello_Condition()
{
	if(!C_NpcBelongsToOldCamp(other))
	{
		return 1;
	};
};

func void DIA_Cutter_Hello_Info()
{
	AI_Output(other,self,"DIA_Cutter_Hello_15_00");	//Wasz zamek jest bardzo du�y.
	AI_Output(self,other,"DIA_Cutter_Hello_08_01");	//Chyba ci� jeszcze tutaj nie widzia�em. Kim jeste�?
	AI_Output(other,self,"DIA_Cutter_Hello_15_02");	//Jestem tu nowy. Chcia�em si� troch� rozejrze�.
};


instance DIA_Cutter_Burg(C_Info)
{
	npc = GRD_208_Cutter;
	nr = 1;
	condition = DIA_Cutter_Burg_Condition;
	information = DIA_Cutter_Burg_Info;
	permanent = 0;
	description = "Mo�esz mi opowiedzie� o tym zamku?";
};


func int DIA_Cutter_Burg_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Cutter_Hello))
	{
		return 1;
	};
};

func void DIA_Cutter_Burg_Info()
{
	AI_Output(other,self,"DIA_Cutter_Burg_15_00");	//Mo�esz mi opowiedzie� o tym zamku?
	AI_Output(self,other,"DIA_Cutter_Burg_08_01");	//Co tu du�o m�wi�: Gomez i jego ludzie zaj�li go po wielkim buncie.
	AI_Output(self,other,"DIA_Cutter_Burg_08_02");	//Od pocz�tku wiedzia�em, �e warto b�dzie stan�� po jego stronie.
	AI_Output(self,other,"DIA_Cutter_Burg_08_03");	//Wielu z nas, jeszcze jako wi�niowie zamkni�ci w lochach lub zmuszani do pracy w kopalni, uznawa�o zwierzchnictwo Gomeza.
	AI_Output(other,self,"DIA_Cutter_Burg_15_04");	//Czy te lochy znajduj� si� pod zamkiem?
	AI_Output(self,other,"DIA_Cutter_Burg_08_05");	//Tak, ale teraz �wiec� pustk�. Nikt tam nie schodzi� od czasu wielkiego buntu.
};


instance DIA_Cutter_PERM(C_Info)
{
	npc = GRD_208_Cutter;
	nr = 1;
	condition = DIA_Cutter_PERM_Condition;
	information = DIA_Cutter_PERM_Info;
	permanent = 1;
	description = "Jak wygl�da �ycie stra�nika?";
};


func int DIA_Cutter_PERM_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Cutter_Burg))
	{
		return 1;
	};
};

func void DIA_Cutter_PERM_Info()
{
	AI_Output(other,self,"DIA_Cutter_PERM_15_00");	//Jak wygl�da �ycie stra�nika?
	AI_Output(self,other,"DIA_Cutter_PERM_08_01");	//Jest spokojne. Jeste�my najwi�kszym i najsilniejszym obozem w kolonii. Nikt nie �mie nas zaczepia�.
	AI_Output(other,self,"DIA_Cutter_PERM_15_02");	//Rozumiem.
};


instance GRD_208_Cutter_WELCOME(C_Info)
{
	npc = GRD_208_Cutter;
	condition = GRD_208_Cutter_WELCOME_Condition;
	information = GRD_208_Cutter_WELCOME_Info;
	important = 1;
	permanent = 0;
};


func int GRD_208_Cutter_WELCOME_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return TRUE;
	};
};

func void GRD_208_Cutter_WELCOME_Info()
{
	AI_Output(self,other,"GRD_208_Cutter_WELCOME_Info_08_01");	//Dokona�e� w�a�ciwego wyboru. Spodoba ci si� bycie Stra�nikiem!
	AI_StopProcessInfos(self);
};


instance DIA_CUTTER_GUY(C_Info)
{
	npc = GRD_208_Cutter;
	nr = 1;
	condition = dia_cutter_guy_condition;
	information = dia_cutter_guy_info;
	permanent = 0;
	important = 1;
};


func int dia_cutter_guy_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_STT)
	{
		return 1;
	};
};

func void dia_cutter_guy_info()
{
	AI_Output(self,other,"DIA_Cutter_GUY_15_00");	//Ej, ty! Podejd� no tu.
	AI_Output(other,self,"DIA_Cutter_GUY_08_01");	//Czego chcesz?
	AI_Output(self,other,"DIA_Cutter_GUY_15_02");	//A wi�c Gomez ci� przyj��? Dobra robota.
	AI_Output(self,other,"DIA_Cutter_GUY_08_02");	//Skoro ju� tu jeste�, mog� ci te� da� robot� od r�ki.
	AI_Output(self,other,"DIA_Cutter_GUY_08_03");	//Niedawno dotar�a w�a�nie dostawa z zewn�trznego �wiata, a w�r�d niej znalaz�a si� te� nowa twarz.
	AI_Output(self,other,"DIA_Cutter_GUY_08_04");	//Bez obaw, Bullit i jego ch�opcy ju� go ochrzcili. Hehe.
	AI_Output(self,other,"DIA_Cutter_GUY_08_05");	//Ale widocznie typek sam do tego miejsca drogi nie znajdzie. W ka�dym razie jeszcze si� tu nie pojawi�.
	AI_Output(self,other,"DIA_Cutter_GUY_08_06");	//Dlatego przejd� si� na plac wymian i przekonaj jegomo�cia, �e najlepszym miejscem dla niego b�dzie Stary Ob�z.
	AI_Output(self,other,"DIA_Cutter_GUY_08_07");	//Jak to zrobisz to ju� twoja sprawa, ale nie powinno ci to sprawi� wi�kszych problem�w. Bullit m�wi�, �e ten go�� ma jeszcze mleko pod nosem.
	AI_Output(self,other,"DIA_Cutter_GUY_08_08");	//Po�lij go bezpo�rednio do naszego obozu, przyda nam si� ka�dy Kopacz do roboty w kopalni. Hehe.
	Wld_InsertNpc(non_5054_paul,"OC_1");
	paul_oc = LOG_RUNNING;
	Log_CreateTopic(CH1_PAULOC,LOG_MISSION);
	Log_SetTopicStatus(CH1_PAULOC,LOG_RUNNING);
	B_LogEntry(CH1_PAULOC,"Siekacz, jeden ze Stra�nik�w Gomeza, rozkaza� mi uda� si� na plac wymian. Powiedzia�, �e przyby�a w�a�nie nowa dostawa z zewn�trznego �wiata i do tego nowa twarz. Zdaje si� jednak, �e nie dotar� jeszcze do Starego Obozu, dlatego te� mam si� przej�� na plac wymian i sprawdzi� co jest grane.");
};


instance dia_cutter_success(C_Info)
{
	npc = GRD_208_Cutter;
	nr = 1;
	condition = dia_cutter_success_condition;
	information = dia_cutter_success_info;
	permanent = 0;
	important = 0;
	description = "Paul jest teraz w obozie.";
};


func int dia_cutter_success_condition()
{
	if(paul_oc == LOG_SUCCESS)
	{
		return 1;
	};
};

func void dia_cutter_success_info()
{
	AI_Output(other,self,"DIA_Cutter_SUCCESS_15_00");	//Paul jest teraz w obozie.
	AI_Output(self,other,"DIA_Cutter_SUCCESS_08_01");	//Ten nowy? Dobra robota. Gomez b�dzie zachwycony.
	AI_Output(self,other,"DIA_Cutter_SUCCESS_15_02");	//Trzymaj, zas�u�y�e� sobie.
	CreateInvItems(self,ItMiNugget,75);
	B_GiveInvItems(self,other,ItMiNugget,75);
	AI_StopProcessInfos(self);
};


instance DIA_CUTTER_FAIL(C_Info)
{
	npc = GRD_208_Cutter;
	nr = 1;
	condition = dia_cutter_fail_condition;
	information = dia_cutter_fail_info;
	permanent = 0;
	important = 0;
	description = "Paul nie poka�e si� ju� wi�cej w obozie.";
};


func int dia_cutter_fail_condition()
{
	if(paul_oc == LOG_FAILED)
	{
		return 1;
	};
};

func void dia_cutter_fail_info()
{
	AI_Output(other,self,"DIA_Cutter_FAIL_15_00");	//Paul nie poka�e si� ju� wi�cej w obozie.
	AI_Output(self,other,"DIA_Cutter_FAIL_08_01");	//Jak �e� to m�g� t�paku tak spartoli�? Przecie� to jest niemo�liwe!
	AI_Output(self,other,"DIA_Cutter_FAIL_15_02");	//Ech, szkoda gada�, zejd� mi z oczu, padalcu!
	AI_StopProcessInfos(self);
};

