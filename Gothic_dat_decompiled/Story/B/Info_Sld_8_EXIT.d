
instance Info_Sld_8_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Sld_8_EXIT_Condition;
	information = Info_Sld_8_EXIT_Info;
	permanent = 1;
	description = "KONIEC";
};


func int Info_Sld_8_EXIT_Condition()
{
	return 1;
};

func void Info_Sld_8_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Sld_8_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Sld_8_EinerVonEuchWerden_Condition;
	information = Info_Sld_8_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Nie przyda�by si� wam dodatkowy cz�owiek?";
};


func int Info_Sld_8_EinerVonEuchWerden_Condition()
{
	if((Npc_GetTrueGuild(other) != GIL_SLD) && (Npc_GetTrueGuild(other) != GIL_KDW) && !C_NpcBelongsToOldCamp(other) && !C_NpcBelongsToPsiCamp(other))
	{
		return TRUE;
	};
};

func void Info_Sld_8_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Sld_8_EinerVonEuchWerden_15_00");	//Nie przyda�by si� wam dodatkowy cz�owiek?
	AI_Output(self,other,"Info_Sld_8_EinerVonEuchWerden_08_01");	//Lee nie przyjmuje ludzi, kt�rzy nie sp�dzili tu kilku lat i nie maja du�ego do�wiadczenia.
	AI_Output(self,other,"Info_Sld_8_EinerVonEuchWerden_08_02");	//Je�li chcesz zosta� w Obozie musisz najpierw postawi� si� Szkodnikom.
};


instance Info_Sld_8_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Sld_8_WichtigePersonen_Condition;
	information = Info_Sld_8_WichtigePersonen_Info;
	permanent = 1;
	description = "Kto tu dowodzi?";
};


func int Info_Sld_8_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Sld_8_WichtigePersonen_Info()
{
	var C_Npc Lee;
	var C_Npc Cronos;
	AI_Output(other,self,"Info_Sld_8_WichtigePersonen_15_00");	//Kto tu dowodzi?
	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_01");	//Wszyscy Najemnicy s�uchaj� Lee. Szef zawar� umow� z Magami - my ich ochraniamy, a oni pomog� nam st�d zwia�!
	AI_Output(other,self,"Info_Sld_8_WichtigePersonen_15_02");	//A wi�c w rzeczywisto�ci rz�dz� tu Magowie?
	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_03");	//Nie, obozem NIKT tak naprawd� nie rz�dzi. Wi�kszo�� z mieszkaj�cych tu ludzi nie chcia�a b�d� nie mog�a mieszka� w Starym Obozie.
	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_04");	//Ka�dy dba tu o w�asny interes. Zgadzamy si� tylko co do jednego: lepiej ju� usypa� z rudy wielki kopiec i wysadzi� go w powietrze, ni� wchodzi� w uk�ady z kr�lem, niech mu ziemia ci�k� b�dzie.
	Lee = Hlp_GetNpc(Sld_700_Lee);
	Lee.aivar[AIV_FINDABLE] = TRUE;
	Cronos = Hlp_GetNpc(KDW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Sld_8_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Sld_8_DasLager_Condition;
	information = Info_Sld_8_DasLager_Info;
	permanent = 1;
	description = "Co mo�esz mi opowiedzie� o tym obozie?";
};


func int Info_Sld_8_DasLager_Condition()
{
	if(!C_NpcBelongsToNewCamp(other))
	{
		return 1;
	};
};

func void Info_Sld_8_DasLager_Info()
{
	var C_Npc Cronos;
	AI_Output(other,self,"Info_Sld_8_DasLager_15_00");	//Co mo�esz mi opowiedzie� o tym obozie?
	AI_Output(self,other,"Info_Sld_8_DasLager_08_01");	//Uwa�aj na siebie! W Obozie a� roi si� od morderc�w i rabusi�w!
	AI_Output(self,other,"Info_Sld_8_DasLager_08_02");	//Mamy tutaj kilka niepisanych praw. Pierwsze: tylko Najemnicy mog� wchodzi� do strefy Mag�w.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_03");	//Drugie: zanim zbli�ysz si� do kopca rudy, wykop sobie wygodny gr�b. Trzecie: nie pokazuj si� w knajpie na jeziorze.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_04");	//Widzisz, to jest lokal Szkodnik�w, a oni nie lubi� jak pokazuj� si� tam ��todzioby takie jak ty.
	Cronos = Hlp_GetNpc(KDW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Sld_8_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Sld_8_DieLage_Condition;
	information = Info_Sld_8_DieLage_Info;
	permanent = 1;
	description = "Jak leci?";
};


func int Info_Sld_8_DieLage_Condition()
{
	return 1;
};

func void Info_Sld_8_DieLage_Info()
{
	var C_Npc Cronos;
	AI_Output(other,self,"Info_Sld_8_DieLage_15_00");	//Jak leci?
	AI_Output(self,other,"Info_Sld_8_DieLage_08_01");	//Jak zwykle. Pilnujemy, �eby nikt nie zbli�y� si� do Mag�w ani do rudy.
	Cronos = Hlp_GetNpc(KDW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Sld_8_Krautprobe(C_Info)
{
	nr = 5;
	condition = Info_Sld_8_Krautprobe_Condition;
	information = Info_Sld_8_Krautprobe_Info;
	permanent = 1;
	description = "Mam przy sobie troch� bagiennego ziela? Mo�e chcesz troch� kupi�?";
};


func int Info_Sld_8_Krautprobe_Condition()
{
	if(((BaalKagan_VerteilKraut == LOG_RUNNING) || (BaalKagan_VerteilKraut == LOG_SUCCESS)) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return TRUE;
	};
};

func void Info_Sld_8_Krautprobe_Info()
{
	AI_Output(other,self,"Info_Sld_8_Krautprobe_15_00");	//Mam przy sobie troch� bagiennego ziela? Mo�e chcesz troch� kupi�?
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
		AI_Output(self,other,"Info_Sld_8_Krautprobe_08_01");	//Czemu nie? Dam ci za nie 10 bry�ek rudy.
		AI_Output(self,other,"Info_Sld_8_Krautprobe_08_02");	//Pogadaj jeszcze z reszt� ch�opak�w. Oni pewnie te� b�d� zainteresowani.
		CreateInvItems(self,ItMiNugget,10);
		B_GiveInvItems(self,other,ItMiNugget,10);
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Sld_8_Krautprobe_No_Joint_08_00");	//Nie tak szybko. Najpierw poka� ziele! Nie masz, co?!
	};
};

func void B_AssignAmbientInfos_Sld_8(var C_Npc slf)
{
	B_AssignFindNpc_NC(slf);
	Info_Sld_8_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Sld_8_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Sld_8_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Sld_8_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Sld_8_DieLage.npc = Hlp_GetInstanceID(slf);
	Info_Sld_8_Krautprobe.npc = Hlp_GetInstanceID(slf);
};

