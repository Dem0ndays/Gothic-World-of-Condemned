
instance DIA_BRUCE_EXIT(C_Info)
{
	npc = ORG_828_Bruce;
	nr = 999;
	condition = dia_bruce_exit_condition;
	information = dia_bruce_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_bruce_exit_condition()
{
	return 1;
};

func void dia_bruce_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BRUCE_HELLO(C_Info)
{
	npc = ORG_828_Bruce;
	nr = 1;
	condition = dia_bruce_hello_condition;
	information = dia_bruce_hello_info;
	permanent = 1;
	important = 0;
	description = "Jak leci?";
};


func int dia_bruce_hello_condition()
{
	return 1;
};

func void dia_bruce_hello_info()
{
	AI_Output(other,self,"DIA_Bruce_Hello_15_00");	//Jak leci?
	AI_Output(self,other,"DIA_Bruce_Hello_12_01");	//A ty kim jeste�? Nigdy ci� tu jeszcze nie widzia�em.
	AI_Output(other,self,"DIA_Bruce_Hello_12_02");	//Nic dziwnego, dopiero co tu trafi�em.
	AI_Output(self,other,"DIA_Bruce_Hello_12_03");	//Aha, i zapoznajesz si� z obozem, co?
	AI_Output(self,other,"DIA_Bruce_Hello_12_04");	//Je�li szukasz roboty, porozmawiaj z Laresem. On zawsze co� dla nowych znajdzie.
	AI_StopProcessInfos(self);
};


instance dia_bruce_amulett(C_Info)
{
	npc = ORG_828_Bruce;
	nr = 1;
	condition = dia_bruce_amulett_condition;
	information = dia_bruce_amulett_info;
	permanent = 0;
	important = 0;
	description = "Masz na sobie nietuzinkowy amulet.";
};


func int dia_bruce_amulett_condition()
{
	if(franco_amulett == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_bruce_amulett_info()
{
	AI_Output(other,self,"DIA_Bruce_Amulett_15_00");	//Masz na sobie nietuzinkowy amulet.
	AI_Output(self,other,"DIA_Bruce_Amulett_12_01");	//Te� tak s�dz�, he he.
	AI_Output(self,other,"DIA_Bruce_Amulett_12_02");	//Jeden z naszych dawnych Szkodnik�w podarowa� mi go jaki� czas temu w prezencie.
};


instance DIA_BRUCE_FRANCO(C_Info)
{
	npc = ORG_828_Bruce;
	nr = 1;
	condition = dia_bruce_franco_condition;
	information = dia_bruce_franco_info;
	permanent = 0;
	important = 0;
	description = "Przecie� to jest amulet Franko.";
};


func int dia_bruce_franco_condition()
{
	if((franco_amulett == LOG_RUNNING) && Npc_KnowsInfo(hero,dia_bruce_amulett))
	{
		return 1;
	};
};

func void dia_bruce_franco_info()
{
	AI_Output(other,self,"DIA_Bruce_Franco_15_00");	//Przecie� to jest amulet Franko. Co� mi sie zdaje, �e mu go zwyczajnie gwizdn��e�.
	AI_Output(self,other,"DIA_Bruce_Franco_12_01");	//Ach tak? I co w zwi�zku z tym?
	AI_Output(self,other,"DIA_Bruce_Franco_12_02");	//Je�li chcesz, mo�esz spr�bowa� mi go odebra�. Nie mam nic przeciwko.
	AI_StopProcessInfos(self);
};

