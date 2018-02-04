
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
	AI_Output(self,other,"DIA_Wegelagerer_Hello_15_00");	//Te, a dok¹d to siê wybieramy?
	AI_Output(other,self,"DIA_Wegelagerer_Hello_12_01");	//A gówno ciê to interesuje.
	AI_Output(self,other,"DIA_Wegelagerer_Hello_12_02");	//Poprzedni typek tak samo gada³.
	AI_Output(self,other,"DIA_Wegelagerer_Hello_12_03");	//Ale jak zauwa¿y³eœ, ja to widzia³em nieco inaczej i dlatego teraz jest tylko jad³em dla szczurów.
	AI_Output(self,other,"DIA_Wegelagerer_Hello_12_04");	//Z tob¹ inaczej nie bêdzie. Przykro mi, ale kolonia rz¹dzi siê w³asnymi prawami.
	AI_Output(self,other,"DIA_Wegelagerer_Hello_12_05");	//Wypijê za twoje zdrowie - za twoj¹ rudê. Hehe.
	AI_StopProcessInfos(self);
	Npc_SetAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
};

