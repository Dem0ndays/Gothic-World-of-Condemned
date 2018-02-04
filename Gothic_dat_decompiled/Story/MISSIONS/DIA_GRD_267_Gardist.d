
instance DIA_GRD_267_EXIT(C_Info)
{
	npc = GRD_267_Gardist;
	nr = 999;
	condition = dia_grd_267_exit_condition;
	information = dia_grd_267_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_grd_267_exit_condition()
{
	return 1;
};

func void dia_grd_267_exit_info()
{
	AI_StopProcessInfos(self);
};


instance grd_267_gardist_sittingork(C_Info)
{
	npc = GRD_267_Gardist;
	condition = grd_267_gardist_sittingork_condition;
	information = grd_267_gardist_sittingork_info;
	important = 1;
	permanent = 0;
};


func int grd_267_gardist_sittingork_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_None) && (Kapitel == 1))
	{
		return TRUE;
	};
};

func void grd_267_gardist_sittingork_info()
{
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_15_01");	//Ach, patrzcie no. Mamy go�cia.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_02");	//Nowa twarz. Od razu to po tobie zauwa�y�em.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_03");	//C�, panuje tutaj taki zwyczaj, �e my, Stra�nicy, obja�niamy w�a�nie takim Kopaczom sk�d wieje wiatr.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_04");	//I oczywi�cie dbamy o to, �eby Kopacze tacy jak ty i twoi koledzy wydobywali tutaj rud� dla Gomeza.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_05");	//To sprawia, �e wszyscy tutaj dzi�ki temu maj� przyzwoite �ycie.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_06");	//Wy, Kopacze, op�acacie pewien rodzaj podatku - podatek od rudy.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_07");	//My dbamy o to, �eby wasza ruda trafi�a w dobre r�ce, a wy w zamian za to macie tym samym spokojne �ycie w Starym Obozie.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_08");	//B�d� co b�d�, my, Stra�nicy, dogl�damy was na ka�dym kroku, a to jest... do�� kosztowne zaj�cie, jak zapewne rozumiesz. Hehe.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_09");	//My�l�, �e to najwa�niejsze, co na t� chwil� musisz wiedzie�.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_10");	//Masz tu sw�j kilof. To b�dzie tw�j sta�y towarzysz w przysz�o�ci.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_11");	//Nie op�aci�e� mi jeszcze swojego podatku od rudy, wi�c do roboty i postaraj si� o to, �eby� odpracowa� sw�j d�ug.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_12");	//I nie martw si�, b�dziemy was pilnowa�, tak �e b�dziesz m�g� pracowa� sobie w spokoju.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_13");	//Mi�ej zabawy podczas swojego nowego zaj�cia. Od teraz b�d� mia� na ciebie oko, ch�opcze.
	CreateInvItems(self,ItMwPickaxe,1);
	B_GiveInvItems(self,other,ItMwPickaxe,1);
	ore_vlk = LOG_RUNNING;
	Log_CreateTopic(CH1_HEROVLK,LOG_MISSION);
	Log_SetTopicStatus(CH1_HEROVLK,LOG_RUNNING);
	B_LogEntry(CH1_HEROVLK,"Jeden ze Stra�nik�w Starego Obozu zwr�ci� mi uwag�, �e powinienem pracowa� w kopalni tak jak ca�a reszta. Da� mi kilof i pos�a� mnie do miejsca wydobycia. Je�li do jutra nie uda mi si� zebra� 150 bry�ek, dostan� od niego porz�dn� nauczk�.");
};


instance GRD_267_GARDIST_WORKINGORK(C_Info)
{
	npc = GRD_267_Gardist;
	condition = grd_267_gardist_workingork_condition;
	information = grd_267_gardist_workingork_info;
	important = 1;
	permanent = 0;
};


func int grd_267_gardist_workingork_condition()
{
	if(Npc_KnowsInfo(hero,grd_267_gardist_sittingork) && (ore_vlk == LOG_RUNNING) && (Npc_HasItems(other,ItMiNugget) >= 150))
	{
		return 1;
	};
};

func void grd_267_gardist_workingork_info()
{
	AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_15_01");	//No prosz�, kto nas tu znowu odwiedzi�. Dobrze, �e jeste�. Jestem w�a�nie w trakcie zbierania nale�no�ci od Kopaczy.
	AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_15_02");	//Poka� no, co� tam zd��y� zebra�.
	AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_06_03");	//Achh. Pi�knie si� patrzy na t� rud�, nieprawda�? Nie martw si�, dobrze si� ni� zaopiekuj�.
	if(Npc_HasItems(other,ItMiNugget) <= 150)
	{
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_01_02");	//150 bry�ek? To pi�knie, �e tak trzymasz si� naszej umowy i op�acasz sw�j nale�ny podatek.
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_01_04");	//Masz tu jeszcze troch� rudy dla siebie. Z czego� w ko�cu musisz �y�, prawda?
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_01_05");	//Uwa�aj na siebie, ch�opcze. Na pewno jeszcze si� kiedy� spotkamy.
		B_GiveInvItems(other,self,ItMiNugget,150);
		B_GiveInvItems(self,other,ItMiNugget,10);
		ore_vlk = LOG_SUCCESS;
		Log_SetTopicStatus(CH1_HEROVLK,LOG_SUCCESS);
		B_LogEntry(CH1_HEROVLK,"Przekaza�em Stra�nikowi jego 150 bry�ek rudy, z czego 10 bry�ek dosta�em jako sw�j udzia�.");
		B_GiveXP(XP_VLKHERO);
	}
	else if(Npc_HasItems(other,ItMiNugget) <= 200)
	{
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_02_02");	//200 bry�ek? Z pewno�ci� nie b�dziesz mia� nic przeciwko, je�li uwzgl�dni� sobie t� sumk� jako ma�� zaliczk�.
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_02_03");	//To dla dobra sprawy. Hehe.
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_02_04");	//Masz tu jeszcze troch� rudy dla siebie. Z czego� w ko�cu musisz �y�, prawda?
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_02_05");	//Uwa�aj na siebie, ch�opcze. Na pewno jeszcze si� kiedy� spotkamy.
		B_GiveInvItems(other,self,ItMiNugget,200);
		B_GiveInvItems(self,other,ItMiNugget,15);
		ore_vlk = LOG_SUCCESS;
		Log_SetTopicStatus(CH1_HEROVLK,LOG_SUCCESS);
		B_LogEntry(CH1_HEROVLK,"Kiedy tylko Stra�nik zauwa�y�, �e mia�em przy sobie 200 bry�ek rudy, bez ogr�dek wszystko zagarn�� dla siebie i twierdzi�, �e to b�dzie dla niego tylko taka zaliczka. 15 bry�ek to wszystko co dosta�em za ca�� robot�.");
		B_GiveXP(XP_VLKHERO);
	}
	else if(Npc_HasItems(other,ItMiNugget) >= 250)
	{
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_04_02");	//No, zdaje si�, �e ca�kiem porz�dnie� pracowa�. Sporo tej rudy zebra�e�.
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_04_03");	//Przechowam ca�� t� rud� dla ciebie. Bez obaw, jest w dobrych r�kach.
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_04_04");	//Potraktuj to jako swego rodzaju inwestycj� w przysz�o��. Dobrze si� twoj� rud� zaopiekuj�, mo�esz by� tego pewien.
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_04_05");	//Uwa�aj na siebie, ch�opcze. Na pewno jeszcze si� kiedy� spotkamy.
		B_GiveInvItems(other,self,ItMiNugget,Npc_HasItems(other,ItMiNugget));
		ore_vlk = LOG_SUCCESS;
		Log_SetTopicStatus(CH1_HEROVLK,LOG_SUCCESS);
		B_LogEntry(CH1_HEROVLK,"Mia�em spor� ilo�� rudy przy sobie, kiedy spotka�em si� ze Stra�nikiem. Przyw�aszczy� sobie wszystko co mia�em i potraktowa� to jako przysz�� inwestycj�. Nie dosta�em kompletnie nic za ca�� swoj� prac�.");
		B_GiveXP(XP_VLKHERO_TIRED);
	};
};

