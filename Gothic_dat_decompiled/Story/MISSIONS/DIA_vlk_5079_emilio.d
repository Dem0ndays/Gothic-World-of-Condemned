
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
	description = "Czeœæ! Kim jesteœ?";
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
	AI_Output(other,self,"Info_Emilio_Welcome_11_01");	//Czeœæ! Kim jesteœ?
	AI_Output(self,other,"Info_Emilio_Welcome_11_02");	//Nazywam siê Emilio. Trafi³em tutaj w³aœnie podczas ostatniego przewozu z zewnêtrznego œwiata, kilka dni temu.
	AI_Output(self,other,"Info_Emilio_Welcome_11_03");	//Póki co sterczê tutaj, ale pewnie ju¿ nied³ugo pójdê zasuwaæ w kopalni.
	AI_Output(self,other,"Info_Emilio_Welcome_11_04");	//Tak patrz¹c po tych wszystkich Stra¿nikach tutaj, to pewnie nie mam innego wyboru.
};


instance VLK_5079_EMILIO_HAPPENED(C_Info)
{
	npc = vlk_5079_emilio;
	condition = vlk_5079_emilio_happened_condition;
	information = vlk_5079_emilio_happened_info;
	important = 0;
	permanent = 0;
	description = "Wydarzy³o siê tu ostatnio coœ ciekawego?";
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
	AI_Output(other,self,"Info_Emilio_happened_11_01");	//Wydarzy³o siê tu ostatnio coœ ciekawego?
	AI_Output(self,other,"Info_Emilio_happened_11_02");	//Dosz³y mnie s³uchy, ¿e by³ tu jakiœ czas temu facet, który zaj¹³ siê calutkim gniazdem pe³zaczy.
	AI_Output(self,other,"Info_Emilio_happened_11_03");	//Od tego czasu w Starej Kopalni znów jest w miarê bezpiecznie i my Kopacze mo¿emy dalej harowaæ dla tego Gomeza.
	AI_Output(self,other,"Info_Emilio_happened_11_04");	//Prawdziwy bohater... (wzdycha)
	B_GiveXP(XP_EMILIO);
};

