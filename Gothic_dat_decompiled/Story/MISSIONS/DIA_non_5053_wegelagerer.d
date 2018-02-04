
instance DIA_WEGELAGERER_EXIT(C_Info)
{
	npc = non_5053_wegelagerer;
	nr = 999;
	condition = dia_wegelagerer_exit_condition;
	information = dia_wegelagerer_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_wegelagerer_exit_condition()
{
	return 1;
};

func void dia_wegelagerer_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WEGELAGERER_HELLO(C_Info)
{
	npc = non_5053_wegelagerer;
	nr = 1;
	condition = dia_wegelagerer_hello_condition;
	information = dia_wegelagerer_hello_info;
	permanent = 0;
	important = 1;
};


func int dia_wegelagerer_hello_condition()
{
	return 1;
};

func void dia_wegelagerer_hello_info()
{
	AI_Output(self,other,"DIA_Wegelagerer_Hello_15_00");	//Te, a dok�d to si� wybieramy?
	AI_Output(other,self,"DIA_Wegelagerer_Hello_12_01");	//A g�wno ci� to interesuje.
	AI_Output(self,other,"DIA_Wegelagerer_Hello_12_02");	//Poprzedni typek tak samo gada�.
	AI_Output(self,other,"DIA_Wegelagerer_Hello_12_03");	//Ale jak zauwa�y�e�, ja to widzia�em nieco inaczej i dlatego teraz jest tylko jad�em dla szczur�w.
	AI_Output(self,other,"DIA_Wegelagerer_Hello_12_04");	//Z tob� inaczej nie b�dzie. Przykro mi, ale kolonia rz�dzi si� w�asnymi prawami.
	AI_Output(self,other,"DIA_Wegelagerer_Hello_12_05");	//Wypij� za twoje zdrowie - za twoj� rud�. Hehe.
	AI_StopProcessInfos(self);
	Npc_SetAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
};

