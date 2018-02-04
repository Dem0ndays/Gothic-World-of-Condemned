
instance Info_ORG_830_EXIT(C_Info)
{
	npc = Org_830_Organisator;
	nr = 999;
	condition = Info_ORG_830_EXIT_Condition;
	information = Info_ORG_830_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_ORG_830_EXIT_Condition()
{
	return 1;
};

func void Info_ORG_830_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_ORG_830_Hello(C_Info)
{
	npc = Org_830_Organisator;
	nr = 1;
	condition = Info_ORG_830_Hello_Condition;
	information = Info_ORG_830_Hello_Info;
	permanent = 0;
	description = "Czeœæ, jestem tu nowy.";
};


func int Info_ORG_830_Hello_Condition()
{
	return 1;
};

func void Info_ORG_830_Hello_Info()
{
	AI_Output(other,self,"Info_ORG_830_Hello_15_00");	//Czeœæ, jestem tu nowy.
	AI_Output(self,other,"Info_ORG_830_Hello_13_01");	//I co z tego?
};


instance Info_ORG_830_What(C_Info)
{
	npc = Org_830_Organisator;
	nr = 1;
	condition = Info_ORG_830_What_Condition;
	information = Info_ORG_830_What_Info;
	permanent = 0;
	description = "Co robisz?";
};


func int Info_ORG_830_What_Condition()
{
	if(Npc_KnowsInfo(hero,Info_ORG_830_Hello))
	{
		return 1;
	};
};

func void Info_ORG_830_What_Info()
{
	AI_Output(other,self,"Info_ORG_830_What_15_00");	//Co robisz?
	AI_Output(self,other,"Info_ORG_830_What_13_01");	//A na co ci to wygl¹da? Palê!
	AI_Output(self,other,"Info_ORG_830_What_13_02");	//Jeœli myœlisz, ¿e dam ci siê zaci¹gn¹æ, to siê grubo mylisz!
};


instance Info_ORG_830_Aufhalten(C_Info)
{
	npc = Org_830_Organisator;
	nr = 2;
	condition = Info_ORG_830_Aufhalten_Condition;
	information = Info_ORG_830_Aufhalten_Info;
	permanent = 0;
	description = "Nie bêdziesz próbowa³ mnie zatrzymaæ?";
};


func int Info_ORG_830_Aufhalten_Condition()
{
	if(Npc_KnowsInfo(hero,Info_ORG_830_Hello))
	{
		return 1;
	};
};

func void Info_ORG_830_Aufhalten_Info()
{
	AI_Output(other,self,"Info_ORG_830_Aufhalten_15_00");	//Nie bêdziesz próbowa³ mnie zatrzymaæ? Nie zapytasz czego tu szukam, albo coœ w tym rodzaju?
	AI_Output(self,other,"Info_ORG_830_Aufhalten_13_01");	//A po cholerê mam sobie zawracaæ g³owê. Zreszt¹ ktoœ taki jak ty nie narobi raczej wielkich szkód.
};


instance Info_ORG_830_Perm(C_Info)
{
	npc = Org_830_Organisator;
	nr = 3;
	condition = Info_ORG_830_Perm_Condition;
	information = Info_ORG_830_Perm_Info;
	permanent = 1;
	description = "Co s³ychaæ wewn¹trz?";
};


func int Info_ORG_830_Perm_Condition()
{
	if(Npc_KnowsInfo(hero,Info_ORG_830_Hello))
	{
		return 1;
	};
};

func void Info_ORG_830_Perm_Info()
{
	AI_Output(other,self,"Info_ORG_830_Perm_15_00");	//Co s³ychaæ wewn¹trz?
	AI_Output(self,other,"Info_ORG_830_Perm_13_01");	//To co zwykle - ogólnie spokój, od czasu do czasu jakaœ drobna burda.
};


instance ORG_830_TORWACHE_MUD(C_Info)
{
	npc = Org_830_Organisator;
	condition = org_830_torwache_mud_condition;
	information = org_830_torwache_mud_info;
	important = 1;
	permanent = 0;
};


func int org_830_torwache_mud_condition()
{
	var C_Npc mud;
	mud = Hlp_GetNpc(VLK_574_Mud);
	if(Npc_GetDistToNpc(self,mud) < 500)
	{
		return TRUE;
	};
};

func void org_830_torwache_mud_info()
{
	AI_Output(self,other,"ORG_830_Torwache_MUD_Info_07_01");	//Hej, druhy, patrzcie no kogo nam tu przywia³o. Nasz stary przyjaciel. Wygl¹da, jakby potrzebowa³ porz¹dnego obicia pyska.
	AI_Output(other,self,"ORG_830_Torwache_MUD_Info_15_02");	//Co?!
	AI_Output(self,other,"ORG_830_Torwache_MUD_Info_07_03");	//Ech, a kto tu w ogóle gada o tobie? My tu mówimy o twoim koledze, Wrzodzie. Hehe.
	AI_Output(self,other,"ORG_830_Torwache_MUD_Info_07_04");	//Ostatniego razu nie do koñca z tob¹ skoñczyliœmy, wiesz. Najwy¿szy czas to nadrobiæ. Hehe.
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,VLK_574_Mud);
	AI_StartState(self,ZS_Attack,1,"");
	B_GiveXP(100);
};

