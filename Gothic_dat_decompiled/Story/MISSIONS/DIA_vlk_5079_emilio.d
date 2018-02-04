
instance VLK_5079_ANNOUNCER_EXIT(C_Info)
{
	npc = vlk_5079_emilio;
	nr = 999;
	condition = vlk_5079_emilio_exit_condition;
	information = vlk_5079_emilio_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int vlk_5079_emilio_exit_condition()
{
	return 1;
};

func void vlk_5079_emilio_exit_info()
{
	AI_StopProcessInfos(self);
};


instance vlk_5079_emilio_welcome(C_Info)
{
	npc = vlk_5079_emilio;
	condition = vlk_5079_emilio_welcome_condition;
	information = vlk_5079_emilio_welcome_info;
	important = 0;
	permanent = 0;
	description = "Cze��! Kim jeste�?";
};


func int vlk_5079_emilio_welcome_condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void vlk_5079_emilio_welcome_info()
{
	AI_Output(other,self,"Info_Emilio_Welcome_11_01");	//Cze��! Kim jeste�?
	AI_Output(self,other,"Info_Emilio_Welcome_11_02");	//Nazywam si� Emilio. Trafi�em tutaj w�a�nie podczas ostatniego przewozu z zewn�trznego �wiata, kilka dni temu.
	AI_Output(self,other,"Info_Emilio_Welcome_11_03");	//P�ki co stercz� tutaj, ale pewnie ju� nied�ugo p�jd� zasuwa� w kopalni.
	AI_Output(self,other,"Info_Emilio_Welcome_11_04");	//Tak patrz�c po tych wszystkich Stra�nikach tutaj, to pewnie nie mam innego wyboru.
};


instance VLK_5079_EMILIO_HAPPENED(C_Info)
{
	npc = vlk_5079_emilio;
	condition = vlk_5079_emilio_happened_condition;
	information = vlk_5079_emilio_happened_info;
	important = 0;
	permanent = 0;
	description = "Wydarzy�o si� tu ostatnio co� ciekawego?";
};


func int vlk_5079_emilio_happened_condition()
{
	if(Npc_KnowsInfo(hero,vlk_5079_emilio_welcome))
	{
		return TRUE;
	};
};

func void vlk_5079_emilio_happened_info()
{
	AI_Output(other,self,"Info_Emilio_happened_11_01");	//Wydarzy�o si� tu ostatnio co� ciekawego?
	AI_Output(self,other,"Info_Emilio_happened_11_02");	//Dosz�y mnie s�uchy, �e by� tu jaki� czas temu facet, kt�ry zaj�� si� calutkim gniazdem pe�zaczy.
	AI_Output(self,other,"Info_Emilio_happened_11_03");	//Od tego czasu w Starej Kopalni zn�w jest w miar� bezpiecznie i my Kopacze mo�emy dalej harowa� dla tego Gomeza.
	AI_Output(self,other,"Info_Emilio_happened_11_04");	//Prawdziwy bohater... (wzdycha)
	B_GiveXP(XP_EMILIO);
};

