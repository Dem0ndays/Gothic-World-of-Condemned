
instance Info_Org_6_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Org_6_EXIT_Condition;
	information = Info_Org_6_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Org_6_EXIT_Condition()
{
	return 1;
};

func void Info_Org_6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Org_6_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Org_6_EinerVonEuchWerden_Condition;
	information = Info_Org_6_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Chc� do was do��czy�.";
};


func int Info_Org_6_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Org_6_EinerVonEuchWerden_Info()
{
	var C_Npc Lares;
	AI_Output(other,self,"Info_Org_6_EinerVonEuchWerden_15_00");	//Chc� do was do��czy�.
	AI_Output(self,other,"Info_Org_6_EinerVonEuchWerden_06_01");	//Lares decyduje, kto si� nadaje do bandy.
	AI_Output(self,other,"Info_Org_6_EinerVonEuchWerden_06_02");	//Ale �eby si� z nim spotka�, musisz mie� nie lada pow�d.
	AI_Output(other,self,"Info_Org_6_EinerVonEuchWerden_15_03");	//Na przyk�ad jaki?
	AI_Output(self,other,"Info_Org_6_EinerVonEuchWerden_06_04");	//Na przyk�ad kto� m�g�by ci� do niego wys�a�.
	Lares = Hlp_GetNpc(Org_801_Lares);
	Lares.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Org_6_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Org_6_WichtigePersonen_Condition;
	information = Info_Org_6_WichtigePersonen_Info;
	permanent = 1;
	description = "Kto tu jest przyw�dc�?";
};


func int Info_Org_6_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Org_6_WichtigePersonen_Info()
{
	var C_Npc Lee;
	var C_Npc Lares;
	AI_Output(other,self,"Info_Org_6_WichtigePersonen_15_00");	//Kto tu jest przyw�dc�?
	AI_Output(self,other,"Info_Org_6_WichtigePersonen_06_01");	//Przybywasz prosto ze Starego Obozu, co?
	AI_Output(self,other,"Info_Org_6_WichtigePersonen_06_02");	//Tutaj nie ma przyw�dcy! Cholerny Lee pr�buje nas trzyma� na smyczy, ale i tak robimy, co si� nam �ywnie podoba.
	AI_Output(self,other,"Info_Org_6_WichtigePersonen_06_03");	//Gdyby�my mieli jakiego� szefa, by�by nim pewnie Lares. No, ale on MA do�� rozumu, �eby nie miesza� si� do cudzych spraw.
	Lee = Hlp_GetNpc(Sld_700_Lee);
	Lee.aivar[AIV_FINDABLE] = TRUE;
	Lares = Hlp_GetNpc(Org_801_Lares);
	Lares.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Org_6_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Org_6_DasLager_Condition;
	information = Info_Org_6_DasLager_Info;
	permanent = 1;
	description = "Co powinienem wiedzie� o tym miejscu?";
};


func int Info_Org_6_DasLager_Condition()
{
	return 1;
};

func void Info_Org_6_DasLager_Info()
{
	AI_Output(other,self,"Info_Org_6_DasLager_15_00");	//Co powinienem wiedzie� o tym miejscu?
	AI_Output(self,other,"Info_Org_6_DasLager_06_01");	//Na �rodku jaskini znajduje si� wielka dziura wype�niona rud�. Ale je�li ostrzysz sobie na ni� z�by, radz� ci o tym zapomnie�.
	AI_Output(self,other,"Info_Org_6_DasLager_06_02");	//Sam kiedy� spr�bowa�em szcz�cia, ale Najemnicy trzymaj� przy niej stra� dniem i noc�.
};


instance Info_Org_6_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Org_6_DieLage_Condition;
	information = Info_Org_6_DieLage_Info;
	permanent = 1;
	description = "Jak si� masz?";
};


func int Info_Org_6_DieLage_Condition()
{
	return 1;
};

func void Info_Org_6_DieLage_Info()
{
	AI_Output(other,self,"Info_Org_6_DieLage_15_00");	//Jak si� masz?
	AI_Output(self,other,"Info_Org_6_DieLage_06_01");	//A jak si� mog� mie� jedz�c ry� ca�ymi dniami i czekaj�c na dogodn� chwil�, �eby zdoby� troch� rudy?!
	AI_Output(self,other,"Info_Org_6_DieLage_06_02");	//Potem mo�na p�j�� do baru i schla� si� do nieprzytomno�ci ry��wk�!
};


instance Info_Org_6_Krautprobe(C_Info)
{
	nr = 5;
	condition = Info_Org_6_Krautprobe_Condition;
	information = Info_Org_6_Krautprobe_Info;
	permanent = 1;
	description = "Mam przy sobie troch� bagiennego ziela? Mo�e chcesz troch� kupi�?";
};


func int Info_Org_6_Krautprobe_Condition()
{
	if(((BaalKagan_VerteilKraut == LOG_RUNNING) || (BaalKagan_VerteilKraut == LOG_SUCCESS)) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return TRUE;
	};
};

func void Info_Org_6_Krautprobe_Info()
{
	AI_Output(other,self,"Info_Org_6_Krautprobe_15_00");	//Mam przy sobie troch� bagiennego ziela? Mo�e chcesz troch� kupi�?
	if((Npc_HasItems(other,ItMiJoint_1) > 0) || (Npc_HasItems(other,ItMiJoint_2) > 0) || (Npc_HasItems(other,ItMiJoint_3) > 0))
	{
		if(Npc_HasItems(other,ItMiJoint_1))
		{
			B_GiveInvItems(other,self,ItMiJoint_1,1);
		}
		else if(Npc_HasItems(other,ItMiJoint_2))
		{
			B_GiveInvItems(other,self,ItMiJoint_2,1);
		}
		else if(Npc_HasItems(other,ItMiJoint_3))
		{
			B_GiveInvItems(other,self,ItMiJoint_3,1);
		};
		AI_Output(self,other,"Info_Org_6_Krautprobe_06_01");	//Jasne. Masz tu 10 bry�ek rudy.
		AI_Output(self,other,"Info_Org_6_Krautprobe_06_02");	//Zajrzyj do mnie jeszcze, jak b�dziesz mia� tego wi�cej, dobra?
		CreateInvItems(self,ItMiNugget,10);
		B_GiveInvItems(self,other,ItMiNugget,10);
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Org_6_Krautprobe_No_Joint_06_00");	//Gdzie? Nie widz� �adnego ziela.
	};
};

func void B_AssignAmbientInfos_Org_6(var C_Npc slf)
{
	B_AssignFindNpc_NC(slf);
	Info_Org_6_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Org_6_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Org_6_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Org_6_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Org_6_DieLage.npc = Hlp_GetInstanceID(slf);
	Info_Org_6_Krautprobe.npc = Hlp_GetInstanceID(slf);
};


instance INFO_BDT_EXIT(C_Info)
{
	nr = 999;
	condition = info_bdt_exit_condition;
	information = info_bdt_exit_info;
	permanent = 1;
	description = "KONIEC";
};


func int info_bdt_exit_condition()
{
	return 1;
};

func void info_bdt_exit_info()
{
	AI_StopProcessInfos(self);
};

func void b_assignambientinfos_bdt(var C_Npc slf)
{
	info_bdt_exit.npc = Hlp_GetInstanceID(slf);
};

