
instance DIA_FRANCO_EXIT(C_Info)
{
	npc = org_866_franco;
	nr = 999;
	condition = dia_franco_exit_condition;
	information = dia_franco_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_franco_exit_condition()
{
	return 1;
};

func void dia_franco_exit_info()
{
	AI_StopProcessInfos(self);
};


instance dia_franco_hello(C_Info)
{
	npc = org_866_franco;
	nr = 1;
	condition = dia_franco_hello_condition;
	information = dia_franco_hello_info;
	permanent = 0;
	description = "Cze��!";
};


func int dia_franco_hello_condition()
{
	return 1;
};

func void dia_franco_hello_info()
{
	AI_Output(other,self,"DIA_Franco_Hello_15_00");	//Cze��!
	AI_Output(self,other,"DIA_Franco_Hello_15_01");	//Czego chcesz? Nie widzisz, �e jestem zaj�ty?
	AI_StopProcessInfos(self);
};


instance DIA_FRANCO_HOWRU(C_Info)
{
	npc = org_866_franco;
	nr = 1;
	condition = dia_franco_howru_condition;
	information = dia_franco_howru_info;
	permanent = 0;
	description = "Jak leci?";
};


func int dia_franco_howru_condition()
{
	if(Npc_KnowsInfo(hero,dia_franco_hello))
	{
		return 1;
	};
};

func void dia_franco_howru_info()
{
	AI_Output(other,self,"DIA_Franco_HowRU_15_00");	//Jak leci?
	AI_Output(self,other,"DIA_Franco_HowRU_15_01");	//Znowu ty? Nie m�wi�em, �e masz st�d sp�ywa�?
	AI_StopProcessInfos(self);
};


instance dia_franco_esteban(C_Info)
{
	npc = org_866_franco;
	nr = 1;
	condition = dia_franco_esteban_condition;
	information = dia_franco_esteban_info;
	permanent = 0;
	description = "Co my�lisz o Estebanie?";
};


func int dia_franco_esteban_condition()
{
	if(esteban_leader == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_franco_esteban_info()
{
	AI_Output(other,self,"DIA_Franco_Esteban_15_00");	//Co my�lisz o Estebanie?
	AI_Output(self,other,"DIA_Franco_Esteban_15_01");	//A co ci� to obchodzi?
	AI_Output(self,other,"DIA_Franco_Esteban_15_02");	//Nie widz� powodu, dla kt�rego mia�bym co� m�wi� osobie postronnej.
	AI_Output(self,other,"DIA_Franco_Esteban_15_03");	//Zmiataj st�d!
	AI_StopProcessInfos(self);
};


instance DIA_FRANCO_AMULETT(C_Info)
{
	npc = org_866_franco;
	nr = 1;
	condition = dia_franco_amulett_condition;
	information = dia_franco_amulett_info;
	permanent = 0;
	description = "To dla mnie naprawd� wa�ne, �ebym si� tego dowiedzia�.";
};


func int dia_franco_amulett_condition()
{
	if((esteban_leader == LOG_RUNNING) && Npc_KnowsInfo(hero,dia_franco_esteban))
	{
		return 1;
	};
};

func void dia_franco_amulett_info()
{
	AI_Output(other,self,"DIA_Franco_Amulett_15_00");	//To dla mnie naprawd� wa�ne, �ebym si� tego dowiedzia�.
	AI_Output(self,other,"DIA_Franco_Amulett_15_01");	//Serio, takie to wa�ne dla ciebie?
	AI_Output(self,other,"DIA_Franco_Amulett_15_02");	//No dobra, w sumie mam pewne zadanie dla ciebie.
	AI_Output(self,other,"DIA_Franco_Amulett_15_03");	//Pewien jegomo�� z Nowego Obozu ukrad� mi co� bardzo warto�ciowego.
	AI_Output(self,other,"DIA_Franco_Amulett_15_04");	//Sam nie mog� si� ju� pokazywa� w obozie, bo jaki� czas temu niestety narobi�em tam sobie k�opot�w.
	AI_Output(self,other,"DIA_Franco_Amulett_15_05");	//Tak �e musi to by� kto�, o kim nawet nie wiedz�, �e mnie zna.
	AI_Output(self,other,"DIA_Franco_Amulett_15_06");	//I tu w�a�nie wkraczasz ty.
	AI_Output(self,other,"DIA_Franco_Amulett_15_07");	//Facet nazywa si� Bruce i jest jednym ze Szkodnik�w.
	AI_Output(self,other,"DIA_Franco_Amulett_15_08");	//Kiedy� go�� by� moim towarzyszem podczas polowa�, jednak nie potrafi� trzyma� swoich paluch�w z dala od moich rzeczy, no i w gruncie rzeczy musia� sobie w ko�cu zakosi� m�j amulet.
	AI_Output(self,other,"DIA_Franco_Amulett_15_09");	//Ch�tnie widzia�bym go z powrotem.
	AI_Output(self,other,"DIA_Franco_Amulett_15_10");	//Za�o�� si�, �e ten psubrat nosi go sobie teraz na szyi i spaceruje z nim po Nowym Obozie.
	AI_Output(self,other,"DIA_Franco_Amulett_15_11");	//Jak ju� odzyskasz m�j amulet, to pogadamy.
	AI_Output(self,other,"DIA_Franco_Amulett_15_12");	//Ale pierw zadbaj o to, aby go do mnie przynie��.
	franco_amulett = LOG_RUNNING;
	Log_CreateTopic(CH1_AMULETT,LOG_MISSION);
	Log_SetTopicStatus(CH1_AMULETT,LOG_RUNNING);
	B_LogEntry(CH1_AMULETT,"Je�li Franko ma mi pom�c, musz� przede wszystkim przynie�� mu jego amulet z powrotem. Pono� ukrad� go jeden ze Szkodnik�w z Nowego Obozu, niejaki Bruce. Dawniej by� jego kompanem podczas polowa� i pewnie ci�gle kr�ci si� gdzie� po obozie.");
	AI_StopProcessInfos(self);
};


var int franco_esteban;

instance DIA_FRANCO_SUCCESS(C_Info)
{
	npc = org_866_franco;
	nr = 1;
	condition = dia_franco_success_condition;
	information = dia_franco_success_info;
	permanent = 0;
	important = 0;
	description = "Oto tw�j amulet.";
};


func int dia_franco_success_condition()
{
	if((franco_amulett == LOG_RUNNING) && Npc_HasItems(hero,francos_amulett))
	{
		return 1;
	};
};

func void dia_franco_success_info()
{
	AI_Output(other,self,"DIA_Org_5033_Franco_SUCCESS_15_00");	//Oto tw�j amulet.
	AI_Output(self,other,"DIA_Org_5033_Franco_SUCCESS_13_01");	//He he, cudownie.
	AI_Output(self,other,"DIA_Org_5033_Franco_SUCCESS_13_02");	//Nigdy bym si� nie spodziewa�, �e ci si� to uda.
	AI_Output(other,self,"DIA_Org_5033_Franco_SUCCESS_13_03");	//Mia�e� mi co� powiedzie�...
	AI_Output(self,other,"DIA_Org_5033_Franco_SUCCESS_13_04");	//A tak. Quentin nie ma ju� co sta� na czele tego obozu. Esteban ju� wkr�tce zajmie jego miejsce.
	B_GiveInvItems(other,self,francos_amulett,1);
	franco_amulett = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_AMULETT,LOG_SUCCESS);
	B_LogEntry(CH1_AMULETT,"Franko by� jak zwykle niezno�ny, ale przynajmniej by� zadowolony, �e przynios�em mu jego amulet z powrotem.");
	B_GiveXP(XP_FRANCO);
	B_LogEntry(CH1_ESTEBANQUENTIN,"Franko jest zniesmaczony robot� Quentina. Jest jednym z nielicznych ludzi, kt�rzy w pe�ni popieraj� Estebana.");
	franco_esteban = TRUE;
	AI_StopProcessInfos(self);
};

