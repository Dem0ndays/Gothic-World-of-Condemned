
instance DIA_ORG_833_Buster(C_Info)
{
	npc = ORG_833_Buster;
	condition = DIA_ORG_833_Buster_Condition;
	information = DIA_ORG_833_Buster_Info;
	important = 1;
	permanent = 0;
};


func int DIA_ORG_833_Buster_Condition()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_ACROBAT) == 0)
	{
		return TRUE;
	};
};

func void DIA_ORG_833_Buster_Info()
{
	AI_Output(self,other,"DIA_ORG_833_Buster_02_01");	//Wiesz co, poruszasz si� tak jako� sztywno. M�g�bym ci pom�c.
};


instance DIA_ORG_833_Buster_Exit(C_Info)
{
	npc = ORG_833_Buster;
	nr = 999;
	condition = DIA_ORG_833_Buster_Exit_Condition;
	information = DIA_ORG_833_Buster_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_ORG_833_Buster_Exit_Condition()
{
	return 1;
};

func void DIA_ORG_833_Buster_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORG_833_Buster3(C_Info)
{
	npc = ORG_833_Buster;
	condition = DIA_ORG_833_Buster3_Condition;
	information = DIA_ORG_833_Buster3_Info;
	important = 0;
	permanent = 0;
	description = "Jak mo�esz mi pom�c?";
};


func int DIA_ORG_833_Buster3_Condition()
{
	return 1;
};

func void DIA_ORG_833_Buster3_Info()
{
	AI_Output(other,self,"DIA_Grim_Falle_15_03");	//Jak?
	AI_Output(self,other,"DIA_ORG_833_Buster3_02_01");	//Mog� ci pokaza�, jak nale�y balansowa� cia�em. Naucz� ci� AKROBATYKI.
	Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
	B_LogEntry(GE_TeacherNC,"Szkodnik imieniem Buster mo�e mnie nauczy� akrobatyki.");
};


var int buster_learned;

instance DIA_ORG_833_BUSTER_FIX(C_Info)
{
	npc = ORG_833_Buster;
	condition = dia_org_833_buster_fix_condition;
	information = dia_org_833_buster_fix_info;
	important = 0;
	permanent = 1;
	description = "Nauka akrobatyki (10 PN)";
};


func int dia_org_833_buster_fix_condition()
{
	if(Npc_KnowsInfo(hero,DIA_ORG_833_Buster3) && (buster_learned == FALSE))
	{
		return 1;
	};
};

func void dia_org_833_buster_fix_info()
{
	if(B_GiveSkill(other,NPC_TALENT_ACROBAT,1,LPCOST_TALENT_ACROBAT))
	{
		AI_Output(other,self,"ORG_801_Lares_Teach_15_00");	//Chc� nauczy� si� czego� nowego.
		AI_Output(self,other,"DIA_ORG_833_Buster3_02_02");	//Po kilku lekcjach nauczysz si� skaka� na wi�ksze odleg�o�ci.
		AI_Output(self,other,"DIA_ORG_833_Buster3_02_03");	//Poka�� ci w jaki spos�b mo�na z�agodzi� efekt upadku z du�ej wysoko�ci. Tylko nie my�l sobie, �e b�dziesz m�g� skaka� b�g wie sk�d!
		AI_Output(self,other,"DIA_ORG_833_Buster3_02_04");	//Akrobatyka przyda ci si� r�wnie� w trakcie walki. Poka�� ci jak bardzo szybko zmniejszy� lub zwi�kszy� odleg�o�� dziel�c� ci� od przeciwnika. Powodzenia!
		buster_learned = TRUE;
	};
};

