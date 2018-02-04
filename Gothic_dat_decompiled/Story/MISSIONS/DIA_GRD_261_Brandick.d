
instance GRD_261_Brandick_Exit(C_Info)
{
	npc = GRD_261_Brandick;
	nr = 999;
	condition = GRD_261_Brandick_Exit_Condition;
	information = GRD_261_Brandick_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int GRD_261_Brandick_Exit_Condition()
{
	return 1;
};

func void GRD_261_Brandick_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance GRD_261_Brandick_ALEPH(C_Info)
{
	npc = GRD_261_Brandick;
	condition = GRD_261_Brandick_ALEPH_Condition;
	information = GRD_261_Brandick_ALEPH_Info;
	important = 0;
	permanent = 0;
	description = "(Wydaj Alepha)";
};


func int GRD_261_Brandick_ALEPH_Condition()
{
	if(Npc_KnowsInfo(hero,VLK_585_Aleph_GUARDS))
	{
		return 1;
	};
};

func void GRD_261_Brandick_ALEPH_Info()
{
	AI_Output(other,self,"GRD_261_Brandick_ALEPH_Info_15_01");	//S³uchaj, za ka¿dym razem, kiedy siê odwracasz, Aleph siedzi bezczynnie i zbija b¹ki.
	AI_Output(self,other,"GRD_261_Brandick_ALEPH_Info_06_02");	//Czy¿by?
	AI_Output(self,other,"GRD_261_Brandick_ALEPH_Info_06_03");	//Wiesz jakich ludzi nienawidzê jeszcze bardziej od obiboków? Donosicieli! ZejdŸ mi z oczu!
	AI_StopProcessInfos(self);
};


instance GRD_261_BRANDICK_WANNA(C_Info)
{
	npc = GRD_261_Brandick;
	condition = grd_261_brandick_wanna_condition;
	information = grd_261_brandick_wanna_info;
	important = 1;
	permanent = 0;
};


func int grd_261_brandick_wanna_condition()
{
	return 1;
};

func void grd_261_brandick_wanna_info()
{
	AI_Output(self,other,"GRD_261_Brandick_WANNA_Info_15_01");	//Hej, ch³optasiu, mo¿e zamiast siê tu w³óczyæ bez celu wyœwiadczy³byœ mi ma³¹ przys³ugê?
	AI_Output(other,self,"GRD_261_Brandick_WANNA_Info_06_02");	//Co takiego?
	AI_Output(self,other,"GRD_261_Brandick_WANNA_Info_06_03");	//Przynieœ mi piwo. Gnijê tutaj ca³y dzieñ i normalnie ju¿ nie wytrzymujê.
	AI_Output(self,other,"GRD_261_Brandick_WANNA_Info_06_04");	//Najlepiej udaj siê do g³ównego szybu, tam na pewno jakieœ maj¹.
	brandick_beer = LOG_RUNNING;
	Log_CreateTopic(CH1_BRANDICKBEER,LOG_MISSION);
	Log_SetTopicStatus(CH1_BRANDICKBEER,LOG_RUNNING);
	B_LogEntry(CH1_BRANDICKBEER,"Stra¿nik Brandick ze Starej Kopalni poprosi³ mnie, abym za³atwi³ mu piwo. Powinienem rozejrzeæ siê trochê po g³ównym szybie.");
};


instance GRD_261_BRANDICK_BEER(C_Info)
{
	npc = GRD_261_Brandick;
	condition = grd_261_brandick_beer_condition;
	information = grd_261_brandick_beer_info;
	important = 0;
	permanent = 0;
	description = "Masz tu swoje piwo.";
};


func int grd_261_brandick_beer_condition()
{
	if(Npc_HasItems(other,ItFoBeer) > 0)
	{
		return 1;
	};
};

func void grd_261_brandick_beer_info()
{
	AI_Output(other,self,"GRD_261_Brandick_BEER_Info_15_01");	//Masz tu swoje piwo.
	AI_Output(self,other,"GRD_261_Brandick_BEER_Info_06_02");	//Dziêki, tego w³aœnie by³o mi trzeba.
	B_GiveInvItems(other,self,ItFoBeer,1);
	AI_UseItem(self,ItFoBeer);
	AI_Output(self,other,"GRD_261_Brandick_BEER_Info_06_03");	//No, masz tu 10 bry³ek za fatygê.
	CreateInvItems(self,ItMiNugget,10);
	B_GiveInvItems(self,other,ItMiNugget,10);
	AI_Output(self,other,"GRD_261_Brandick_BEER_Info_06_04");	//A teraz wracaæ do roboty.
	brandick_beer = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_BRANDICKBEER,LOG_SUCCESS);
	B_LogEntry(CH1_BRANDICKBEER,"Brandick zdo³a³ ugasiæ pragnienie i da³ mi w nagrodê 10 bry³ek.");
	B_GiveXP(XP_BRANDICKBEER);
};

