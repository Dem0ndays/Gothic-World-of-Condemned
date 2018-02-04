
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
	description = "Czeœæ!";
};


func int dia_franco_hello_condition()
{
	return 1;
};

func void dia_franco_hello_info()
{
	AI_Output(other,self,"DIA_Franco_Hello_15_00");	//Czeœæ!
	AI_Output(self,other,"DIA_Franco_Hello_15_01");	//Czego chcesz? Nie widzisz, ¿e jestem zajêty?
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
	AI_Output(self,other,"DIA_Franco_HowRU_15_01");	//Znowu ty? Nie mówi³em, ¿e masz st¹d sp³ywaæ?
	AI_StopProcessInfos(self);
};


instance dia_franco_esteban(C_Info)
{
	npc = org_866_franco;
	nr = 1;
	condition = dia_franco_esteban_condition;
	information = dia_franco_esteban_info;
	permanent = 0;
	description = "Co myœlisz o Estebanie?";
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
	AI_Output(other,self,"DIA_Franco_Esteban_15_00");	//Co myœlisz o Estebanie?
	AI_Output(self,other,"DIA_Franco_Esteban_15_01");	//A co ciê to obchodzi?
	AI_Output(self,other,"DIA_Franco_Esteban_15_02");	//Nie widzê powodu, dla którego mia³bym coœ mówiæ osobie postronnej.
	AI_Output(self,other,"DIA_Franco_Esteban_15_03");	//Zmiataj st¹d!
	AI_StopProcessInfos(self);
};


instance DIA_FRANCO_AMULETT(C_Info)
{
	npc = org_866_franco;
	nr = 1;
	condition = dia_franco_amulett_condition;
	information = dia_franco_amulett_info;
	permanent = 0;
	description = "To dla mnie naprawdê wa¿ne, ¿ebym siê tego dowiedzia³.";
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
	AI_Output(other,self,"DIA_Franco_Amulett_15_00");	//To dla mnie naprawdê wa¿ne, ¿ebym siê tego dowiedzia³.
	AI_Output(self,other,"DIA_Franco_Amulett_15_01");	//Serio, takie to wa¿ne dla ciebie?
	AI_Output(self,other,"DIA_Franco_Amulett_15_02");	//No dobra, w sumie mam pewne zadanie dla ciebie.
	AI_Output(self,other,"DIA_Franco_Amulett_15_03");	//Pewien jegomoœæ z Nowego Obozu ukrad³ mi coœ bardzo wartoœciowego.
	AI_Output(self,other,"DIA_Franco_Amulett_15_04");	//Sam nie mogê siê ju¿ pokazywaæ w obozie, bo jakiœ czas temu niestety narobi³em tam sobie k³opotów.
	AI_Output(self,other,"DIA_Franco_Amulett_15_05");	//Tak ¿e musi to byæ ktoœ, o kim nawet nie wiedz¹, ¿e mnie zna.
	AI_Output(self,other,"DIA_Franco_Amulett_15_06");	//I tu w³aœnie wkraczasz ty.
	AI_Output(self,other,"DIA_Franco_Amulett_15_07");	//Facet nazywa siê Bruce i jest jednym ze Szkodników.
	AI_Output(self,other,"DIA_Franco_Amulett_15_08");	//Kiedyœ goœæ by³ moim towarzyszem podczas polowañ, jednak nie potrafi³ trzymaæ swoich paluchów z dala od moich rzeczy, no i w gruncie rzeczy musia³ sobie w koñcu zakosiæ mój amulet.
	AI_Output(self,other,"DIA_Franco_Amulett_15_09");	//Chêtnie widzia³bym go z powrotem.
	AI_Output(self,other,"DIA_Franco_Amulett_15_10");	//Za³o¿ê siê, ¿e ten psubrat nosi go sobie teraz na szyi i spaceruje z nim po Nowym Obozie.
	AI_Output(self,other,"DIA_Franco_Amulett_15_11");	//Jak ju¿ odzyskasz mój amulet, to pogadamy.
	AI_Output(self,other,"DIA_Franco_Amulett_15_12");	//Ale pierw zadbaj o to, aby go do mnie przynieœæ.
	franco_amulett = LOG_RUNNING;
	Log_CreateTopic(CH1_AMULETT,LOG_MISSION);
	Log_SetTopicStatus(CH1_AMULETT,LOG_RUNNING);
	B_LogEntry(CH1_AMULETT,"Jeœli Franko ma mi pomóc, muszê przede wszystkim przynieœæ mu jego amulet z powrotem. Ponoæ ukrad³ go jeden ze Szkodników z Nowego Obozu, niejaki Bruce. Dawniej by³ jego kompanem podczas polowañ i pewnie ci¹gle krêci siê gdzieœ po obozie.");
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
	description = "Oto twój amulet.";
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
	AI_Output(other,self,"DIA_Org_5033_Franco_SUCCESS_15_00");	//Oto twój amulet.
	AI_Output(self,other,"DIA_Org_5033_Franco_SUCCESS_13_01");	//He he, cudownie.
	AI_Output(self,other,"DIA_Org_5033_Franco_SUCCESS_13_02");	//Nigdy bym siê nie spodziewa³, ¿e ci siê to uda.
	AI_Output(other,self,"DIA_Org_5033_Franco_SUCCESS_13_03");	//Mia³eœ mi coœ powiedzieæ...
	AI_Output(self,other,"DIA_Org_5033_Franco_SUCCESS_13_04");	//A tak. Quentin nie ma ju¿ co staæ na czele tego obozu. Esteban ju¿ wkrótce zajmie jego miejsce.
	B_GiveInvItems(other,self,francos_amulett,1);
	franco_amulett = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_AMULETT,LOG_SUCCESS);
	B_LogEntry(CH1_AMULETT,"Franko by³ jak zwykle nieznoœny, ale przynajmniej by³ zadowolony, ¿e przynios³em mu jego amulet z powrotem.");
	B_GiveXP(XP_FRANCO);
	B_LogEntry(CH1_ESTEBANQUENTIN,"Franko jest zniesmaczony robot¹ Quentina. Jest jednym z nielicznych ludzi, którzy w pe³ni popieraj¹ Estebana.");
	franco_esteban = TRUE;
	AI_StopProcessInfos(self);
};

