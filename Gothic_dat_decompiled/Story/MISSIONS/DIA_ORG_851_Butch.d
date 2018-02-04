
instance DIA_Butch_Exit(C_Info)
{
	npc = ORG_851_Butch;
	nr = 999;
	condition = DIA_Butch_Exit_Condition;
	information = DIA_Butch_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Butch_Exit_Condition()
{
	return TRUE;
};

func void DIA_Butch_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Butch_Hello(C_Info)
{
	npc = ORG_851_Butch;
	nr = 1;
	condition = DIA_Butch_Hello_Condition;
	information = DIA_Butch_Hello_Info;
	important = 0;
	description = "Cze��. Kim jeste�?";
};


func int DIA_Butch_Hello_Condition()
{
	return 1;
};

func void DIA_Butch_Hello_Info()
{
	AI_Output(other,self,"DIA_Butch_Hello_15_00");	//Cze��. Kim jeste�?
	AI_Output(self,other,"DIA_Butch_Hello_13_01");	//Nie tw�j interes! Nie podoba mi si� twoja g�ba!
	AI_StopProcessInfos(self);
};


instance dia_butch_hey(C_Info)
{
	npc = ORG_851_Butch;
	nr = 1;
	condition = dia_butch_hey_condition;
	information = dia_butch_hey_info;
	important = 0;
	description = "Hej, Butch!";
};


func int dia_butch_hey_condition()
{
	if((fingers_thief == LOG_RUNNING) && (Npc_HasItems(ORG_850_Wedge,butchs_amulett) >= 1))
	{
		return 1;
	};
};

func void dia_butch_hey_info()
{
	AI_Output(other,self,"DIA_Butch_Hey_15_00");	//Hej, Butch! Zauwa�y�em, �e Klin jest w posiadaniu amuletu, na kt�rym wygrawerowane jest twoje imi�...
	AI_Output(self,other,"DIA_Butch_Hey_13_01");	//A to gnida parszywa! To on mi go niedawno zachapa�. Zejd� mi z drogi, albo zaraz i na ciebie przyjdzie kolej!
	AI_StopProcessInfos(self);
	B_LogEntry(CH1_THIEFS,"Podzia�a�o. Wygl�da�o to tak, jakby Klin ukrad� ten amulet Butchowi, dzi�ki czemu od razu dosz�o do b�jki mi�dzy nimi.");
	Npc_SetTarget(self,ORG_850_Wedge);
	AI_StartState(self,ZS_Attack,1,"");
};


instance DIA_ORG_851_SCGOMEZ(C_Info)
{
	npc = ORG_851_Butch;
	nr = 1;
	condition = dia_org_851_scgomez_condition;
	information = dia_org_851_scgomez_info;
	permanent = 0;
	important = 1;
};


func int dia_org_851_scgomez_condition()
{
	if((other.guild == GIL_STT) || (other.guild == GIL_GRD))
	{
		return 1;
	};
};

func void dia_org_851_scgomez_info()
{
	AI_Output(self,other,"DIA_Org_851_ScGomez_06_00");	//Patrzcie ludziska, kogo tu mamy...
	AI_Output(self,other,"DIA_Org_851_ScGomez_06_01");	//Jeden z ludzi Gomeza do nas zawita�.
	AI_Output(self,other,"DIA_Org_851_ScGomez_06_02");	//Poka�my mu, jak si� takich traktuje w Nowym Obozie!
	AI_StopProcessInfos(self);
	Npc_SetTarget(ORG_851_Butch,other);
	AI_StartState(ORG_851_Butch,ZS_Attack,1,"");
	Npc_SetTarget(ORG_807_Organisator,other);
	AI_StartState(ORG_807_Organisator,ZS_Attack,1,"");
	Npc_SetTarget(ORG_822_Organisator,other);
	AI_StartState(ORG_822_Organisator,ZS_Attack,1,"");
};

