
instance DIA_GRD_5032_EXIT(C_Info)
{
	npc = grd_5032_carlos;
	nr = 999;
	condition = dia_grd_5032_exit_condition;
	information = dia_grd_5032_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_grd_5032_exit_condition()
{
	return 1;
};

func void dia_grd_5032_exit_info()
{
	AI_StopProcessInfos(self);
};


instance dia_grd_5032_kleiner(C_Info)
{
	npc = grd_5032_carlos;
	nr = 1;
	condition = dia_grd_5032_kleiner_condition;
	information = dia_grd_5032_kleiner_info;
	permanent = 0;
	important = 1;
	description = "Hej, ty!";
};


func int dia_grd_5032_kleiner_condition()
{
	if(Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

func void dia_grd_5032_kleiner_info()
{
	AI_Output(self,other,"DIA_Grd_5032_kleiner_15_00");	//Hej, ty! Podejd� no tu!
};


instance dia_grd_5032_willst(C_Info)
{
	npc = grd_5032_carlos;
	nr = 1;
	condition = dia_grd_5032_willst_condition;
	information = dia_grd_5032_willst_info;
	permanent = 0;
	important = 0;
	description = "Czego ode mnie chcesz?";
};


func int dia_grd_5032_willst_condition()
{
	if(Npc_KnowsInfo(hero,dia_grd_5032_kleiner))
	{
		return 1;
	};
};

func void dia_grd_5032_willst_info()
{
	AI_Output(other,self,"DIA_Grd_5032_willst_15_00");	//Czego ode mnie chcesz?
	AI_Output(self,other,"DIA_Grd_5032_willst_01_01");	//To ciebie niedawno tutaj zrzucili, co? Tak si� sk�ada, �e mo�esz od razu si� na co� przyda�.
	AI_Output(self,other,"DIA_Grd_5032_willst_01_02");	//Zanim ci� tutaj wrzucono, dostali�my do�� poka�n� dostaw� z towarami z zewn�trznego �wiata.
	AI_Output(self,other,"DIA_Grd_5032_willst_01_03");	//Niestety kilka rzeczy wpad�o przy okazji do wody, kiedy je tutaj odstawiali.
	AI_Output(self,other,"DIA_Grd_5032_willst_01_04");	//Skocz tam szybko do wody i przynie� je z powrotem.
	Info_ClearChoices(dia_grd_5032_willst);
	Info_AddChoice(dia_grd_5032_willst,"A co mi z tego przyjdzie?",dia_grd_5032_willst_okay);
	Info_AddChoice(dia_grd_5032_willst,"A dlaczego nie p�jdziesz i sam sobie tego g�wna nie przyniesiesz?",dia_grd_5032_willst_selbst);
};

func void dia_grd_5032_willst_okay()
{
	AI_Output(other,self,"DIA_Grd_5032_willst_Okay_15_00");	//A co mi z tego przyjdzie?
	AI_Output(self,other,"DIA_Grd_5032_willst_okay_01_00");	//Pogadamy o tym, kiedy ju� si� z tym uporasz.
	AI_Output(self,other,"DIA_Grd_5032_willst_okay_01_01");	//Wi�c mo�e zabra�by� ju� swoje dupsko �askawie do wody.
	Info_ClearChoices(dia_grd_5032_willst);
	Info_AddChoice(dia_grd_5032_willst,"Pom�wmy najpierw o nagrodzie.",dia_grd_5032_willst_belohnung);
	Info_AddChoice(dia_grd_5032_willst,"No, to w takim razie bior� si� do roboty.",dia_grd_5032_willst_jetzt);
};

func void dia_grd_5032_willst_selbst()
{
	AI_Output(other,self,"DIA_Grd_5032_willst_selbst_15_00");	//A dlaczego nie p�jdziesz i sam sobie tego g�wna nie przyniesiesz?
	AI_Output(self,other,"DIA_Grd_5032_willst_selbst_02_00");	//Zwa�aj jak do mnie m�wisz, ch�opcze!
	AI_Output(self,other,"DIA_Grd_5032_willst_selbst_02_01");	//Chyba powinienem ci� nauczy�, jak masz si� zwraca� do mnie i moich kumpli, frajerze.
	AI_Output(self,other,"DIA_Grd_5032_willst_selbst_02_02");	//Jako �e dzi� mam dobry dzie�, udziel� ci tej lekcji za darmo.
	Info_ClearChoices(dia_grd_5032_willst);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void dia_grd_5032_willst_belohnung()
{
	AI_Output(other,self,"DIA_Grd_5032_willst_Belohnung_15_00");	//Pom�wmy najpierw o nagrodzie.
	AI_Output(self,other,"DIA_Grd_5032_willst_Belohnung_01_00");	//Wiesz, jak si� tutaj rozprawiamy z bezczelnymi �wie�akami? Nie? To ci poka��.
	Info_ClearChoices(dia_grd_5032_willst);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void dia_grd_5032_willst_jetzt()
{
	AI_Output(other,self,"DIA_Grd_5032_willst_Jetzt_15_00");	//No, to w takim razie bior� si� do roboty.
	AI_Output(self,other,"DIA_Grd_5032_willst_Jetzt_01_00");	//I po�piesz si� troch�. Ta dostawa powinna by�a ju� dawno dotrze� do Starego Obozu.
	Info_ClearChoices(dia_grd_5032_willst);
	AI_StopProcessInfos(self);
	carlos_things = LOG_RUNNING;
	Log_CreateTopic(CH1_CARLOSTHINGS,LOG_MISSION);
	Log_SetTopicStatus(CH1_CARLOSTHINGS,LOG_RUNNING);
	B_LogEntry(CH1_CARLOSTHINGS,"Carlos powiedzia� mi, �e podczas ostatniej dostawy kilka rzeczy wpad�o do wody przy placu wymian, a ja oczywi�cie mam je odzyska�.");
};


instance DIA_GRD_5032_NUNHELFEN(C_Info)
{
	npc = grd_5032_carlos;
	nr = 1;
	condition = dia_grd_5032_nunhelfen_condition;
	information = dia_grd_5032_nunhelfen_info;
	permanent = 0;
	important = 1;
	description = "Wiesz ju�, co robimy z nowymi?";
};


func int dia_grd_5032_nunhelfen_condition()
{
	var C_Npc Carlos;
	Carlos = Hlp_GetNpc(grd_5032_carlos);
	if((Carlos.aivar[AIV_HASDEFEATEDSC] == TRUE) && (carlos_things == LOG_RUNNING))
	{
		return 1;
	};
};

func void dia_grd_5032_nunhelfen_info()
{
	AI_Output(self,other,"DIA_Grd_5032_nunhelfen_15_00");	//Tak w�a�nie post�pujemy tutaj z aroganckimi frajerami, kt�rzy nie wiedz� nawet jak si� zachowa�.
	AI_Output(self,other,"DIA_Grd_5032_nunhelfen_01_01");	//Zabieraj teraz �askawie swoje dupsko do wody albo sam ci� tam wrzuc�!
	carlos_things = LOG_RUNNING;
	Log_CreateTopic(CH1_CARLOSTHINGS,LOG_MISSION);
	Log_SetTopicStatus(CH1_CARLOSTHINGS,LOG_RUNNING);
	B_LogEntry(CH1_CARLOSTHINGS,"Carlos pokaza� mi w do�� nieprzyjemnym stylu, jak wygl�da �ycie w tej kolonii. Lepiej b�dzie, jak po prostu przejd� si� poszuka� tych rzeczy.");
};


instance DIA_GRD_5032_HABALLES(C_Info)
{
	npc = grd_5032_carlos;
	nr = 1;
	condition = dia_grd_5032_haballes_condition;
	information = dia_grd_5032_haballes_info;
	permanent = 0;
	important = 0;
	description = "Mam rzeczy, kt�re chcia�e�.";
};


func int dia_grd_5032_haballes_condition()
{
	if((Npc_HasItems(other,ItMiNugget) >= 3) && (Npc_HasItems(other,ItFo_Potion_Health_01) >= 2) && (Npc_HasItems(other,ItMiHammer) >= 1) && (Npc_HasItems(other,ItMi_Stuff_Cup_02) >= 1) && (Npc_HasItems(other,ItMiLute) >= 1) && (carlos_things == LOG_RUNNING))
	{
		return 1;
	};
};

func void dia_grd_5032_haballes_info()
{
	AI_Output(other,self,"DIA_Grd_5032_HabAlles_15_00");	//Mam rzeczy, kt�re chcia�e�.
	AI_Output(self,other,"DIA_Grd_5032_HabAlles_01_01");	//Doskonale. Czyli mog� ju� wys�a� reszt� nast�pnym konwojem do obozu.
	AI_Output(other,self,"DIA_Grd_5032_HabAlles_01_02");	//Co z moim wynagrodzeniem?
	AI_Output(self,other,"DIA_Grd_5032_HabAlles_02_03");	//Masz tu bry�k� rudy. To ci na pewno wystarczy.
	AI_Output(self,other,"DIA_Grd_5032_HabAlles_02_04");	//A teraz zje�d�aj mi st�d!
	B_GiveInvItems(other,self,ItMiNugget,3);
	Npc_RemoveInvItems(hero,ItFo_Potion_Health_01,2);
	Npc_RemoveInvItems(hero,ItMiHammer,1);
	Npc_RemoveInvItems(hero,ItMi_Stuff_Cup_02,1);
	Npc_RemoveInvItems(hero,ItMiLute,1);
	B_GiveInvItems(self,other,ItMiNugget,1);
	carlos_things = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_CARLOSTHINGS,LOG_SUCCESS);
	B_LogEntry(CH1_CARLOSTHINGS,"Wy�owi�em Carlosowi rzeczy z jeziora, a on w zamian za to da� mi jedynie t� n�dzn� bry�k� rudy.");
	B_GiveXP(XP_CARLOSTHINGS);
};


instance DIA_GRD_5032_SUCHEN(C_Info)
{
	npc = grd_5032_carlos;
	nr = 1;
	condition = dia_grd_5032_suchen_condition;
	information = dia_grd_5032_suchen_info;
	permanent = 1;
	important = 0;
	description = "Gdzie mam dok�adnie szuka�?";
};


func int dia_grd_5032_suchen_condition()
{
	var C_Npc Carlos;
	Carlos = Hlp_GetNpc(grd_5032_carlos);
	if(carlos_things == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_grd_5032_suchen_info()
{
	AI_Output(other,self,"DIA_Grd_5032_suchen_15_00");	//Gdzie mam dok�adnie szuka�?
	AI_Output(self,other,"DIA_Grd_5032_suchen_01_01");	//Kpisz sobie teraz? Wbij tam po prostu i przeszukaj ca�y brzeg.
};


instance DIA_GRD_5032_DUELL(C_Info)
{
	npc = grd_5032_carlos;
	nr = 1;
	condition = dia_grd_5032_duell_condition;
	information = dia_grd_5032_duell_info;
	permanent = 0;
	important = 0;
	description = "Tak �atwo ci ze mn� nie p�jdzie!";
};


func int dia_grd_5032_duell_condition()
{
	if(carlos_things == LOG_SUCCESS)
	{
		return 1;
	};
};

func void dia_grd_5032_duell_info()
{
	AI_Output(other,self,"DIA_Grd_5032_DUELL_15_00");	//Tak �atwo ci ze mn� nie p�jdzie!
	AI_Output(self,other,"DIA_Grd_5032_DUELL_01_01");	//Ach tak? I co masz zamiar zrobi�? Poprzetr�ca� mi gnaty?
	AI_Output(other,self,"DIA_Grd_5032_DUELL_01_02");	//W rzeczy samej.
	AI_Output(self,other,"DIA_Grd_5032_DUELL_01_03");	//Mam lepszy pomys� - co powiesz na to, �ebym to ja pogruchota� ci gnaty?
	AI_StopProcessInfos(self);
	self.guild = GIL_None;
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

