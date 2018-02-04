
instance DIA_BRAGO_EXIT(C_Info)
{
	npc = stt_5027_brago;
	nr = 999;
	condition = dia_brago_exit_condition;
	information = dia_brago_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_brago_exit_condition()
{
	return 1;
};

func void dia_brago_exit_info()
{
	AI_StopProcessInfos(self);
};


instance dia_brago_first(C_Info)
{
	npc = stt_5027_brago;
	nr = 1;
	condition = dia_brago_first_condition;
	information = dia_brago_first_info;
	permanent = 0;
	important = 0;
	description = "Cze��! Jestem tu nowy.";
};


func int dia_brago_first_condition()
{
	return 1;
};

func void dia_brago_first_info()
{
	AI_Output(other,self,"Info_GRD_276_Tips_15_00");	//Cze��! Jestem tu nowy.
	AI_Output(self,other,"DIA_Brago_First_10_01");	//Aha... i czego oczekujesz ode mnie?
};


instance DIA_BRAGO_WASGIBT(C_Info)
{
	npc = stt_5027_brago;
	nr = 2;
	condition = dia_brago_wasgibt_condition;
	information = dia_brago_wasgibt_info;
	permanent = 0;
	description = "Chcia�bym si� dowiedzie�, jak si� tu �yje.";
};


func int dia_brago_wasgibt_condition()
{
	if(Npc_KnowsInfo(hero,dia_brago_first))
	{
		return 1;
	};
};

func void dia_brago_wasgibt_info()
{
	AI_Output(other,self,"DIA_Brago_WasGibt_15_00");	//Chcia�bym si� dowiedzie�, jak si� tu �yje.
	AI_Output(self,other,"DIA_Brago_WasGibt_10_01");	//��todziobom? Nijak, poza tym, �e co krok natrafiaj� na jakie� problemy.
	AI_Output(self,other,"DIA_Brago_WasGibt_10_02");	//Ale je�li ju� mia�bym ci s�u�y� jak�� rad�, to przede wszystkim uwa�aj z kim masz do czynienia.
	AI_Output(self,other,"DIA_Brago_WasGibt_10_03");	//Wiesz, garstka ludzi, kt�rych tu widzisz, zosta�a wrzucona tutaj za czyn niewiele gorszy od zw�dzenia jab�ka...
};


instance dia_brago_name(C_Info)
{
	npc = stt_5027_brago;
	nr = 1;
	condition = dia_brago_name_condition;
	information = dia_brago_name_info;
	permanent = 0;
	description = "Kim jeste�?";
};


func int dia_brago_name_condition()
{
	if(Npc_KnowsInfo(hero,dia_brago_first))
	{
		return 1;
	};
};

func void dia_brago_name_info()
{
	AI_Output(other,self,"DIA_Lester_Hallo_15_00");	//Kim jeste�?
	AI_Output(self,other,"DIA_Brago_Name_10_01");	//Nazywam si� Brago, jestem jednym z Cieni.
	AI_Output(other,self,"DIA_Brago_Name_10_02");	//Cieni?
	AI_Output(self,other,"DIA_Brago_Name_10_03");	//Ano Cieni. Tak samo jak i Stra�nicy, nale�ymy do ludzi Gomeza.
	AI_Output(self,other,"DIA_Brago_Name_10_04");	//Do��cz tylko do naszej bandy, a przekonasz si�, �e �ycie w kolonii wcale nie musi wygl�da� tak paskudnie.
};


instance dia_brago_hilfe(C_Info)
{
	npc = stt_5027_brago;
	nr = 1;
	condition = dia_brago_hilfe_condition;
	information = dia_brago_hilfe_info;
	permanent = 0;
	description = "M�g�by� mi pom�c dosta� si� do zamku?";
};


func int dia_brago_hilfe_condition()
{
	if(Npc_KnowsInfo(hero,dia_brago_name))
	{
		return 1;
	};
};

func void dia_brago_hilfe_info()
{
	AI_Output(other,self,"DIA_Brago_Hilfe__15_00");	//Jeste� jednym z ludzi Gomeza? M�g�by� mi pom�c dosta� si� do zamku?
	AI_Output(self,other,"DIA_Brago_Hilfe__10_01");	//A po c� chcesz si� tam dosta�?
	Info_ClearChoices(dia_brago_hilfe);
	Info_AddChoice(dia_brago_hilfe,"Mam list do Arcymistrza Mag�w Ognia.",dia_brago_hilfe_brief);
	Info_AddChoice(dia_brago_hilfe,"Chcia�bym zosta� dopuszczony przed oblicze Gomeza.",dia_brago_hilfe_gomez);
};

func void dia_brago_hilfe_brief()
{
	AI_Output(other,self,"DIA_Brago_Hilfe_Brief_15_00");	//Mam list do Arcymistrza Mag�w Ognia.
	AI_Output(self,other,"DIA_Brago_Hilfe_Brief_05_01");	//A wi�c to tak. Pewnie dosta�e� go, zanim ci� tu w og�le zrzucono, co?
	AI_Output(other,self,"DIA_Brago_Hilfe_Brief_15_01");	//Ot� to.
	AI_Output(self,other,"DIA_Brago_Hilfe_Brief_15_02");	//W porz�dku, chyba mog� ci pom�c.
	AI_Output(other,self,"DIA_Brago_Hilfe_Brief_15_03");	//A w jaki spos�b?
	AI_Output(self,other,"DIA_Brago_Hilfe_Brief_15_04");	//Istnieje takie ukryte tylne wej�cie do zamku. Niewiele os�b wie o jego istnieniu, a je�li ju�, to nie maj� oni klucza do tamtejszych drzwi.
	AI_Output(other,self,"DIA_Brago_Hilfe_Brief_15_05");	//A ty go masz?
	AI_Output(self,other,"DIA_Brago_Hilfe_Brief_15_06");	//Pewnie. Ale je�li ju� mam ci pom�c, musisz mi obieca�, �e nikomu nie wypaplasz naszego planu, rozumiemy si�?
	AI_Output(other,self,"DIA_Brago_Hilfe_Brief_15_07");	//Oczywi�cie. To gdzie jest ta kryj�wka?
	AI_Output(self,other,"DIA_Brago_Hilfe_Brief_15_08");	//Je�li chcesz, mo�emy rusza� od razu. Daj zna�, gdy b�dziesz got�w.
	Info_ClearChoices(dia_brago_hilfe);
	Info_AddChoice(dia_brago_hilfe,"Chod�my.",dia_brago_hilfe_go);
	Info_AddChoice(dia_brago_hilfe,"Sam znajd� drog�.",dia_brago_hilfe_walkalone);
};

func void dia_brago_hilfe_gomez()
{
	AI_Output(other,self,"DIA_Brago_Hilfe_Gomez_15_00");	//Chcia�bym zosta� dopuszczony przed oblicze Gomeza.
	AI_Output(self,other,"DIA_Brago_Hilfe_Gomez_05_01");	//Hehe... zapomnij.
	AI_Output(self,other,"DIA_Brago_Hilfe_Gomez_05_02");	//Nawet je�li uda�oby ci si� jako� wtargn�� do zamku, to ze stra�nikami siedziby Magnat�w nie masz ju� najmniejszych szans.
	AI_Output(self,other,"DIA_Brago_Hilfe_Gomez_05_03");	//Jedynie z rozkazu samego Thorusa co� by z tego by�o.
	Info_ClearChoices(dia_brago_hilfe);
};

func void dia_brago_hilfe_go()
{
	AI_Output(other,self,"DIA_Brago_Hilfe_Go_15_00");	//Chod�my.
	AI_Output(self,other,"DIA_Brago_Hilfe_Go_05_01");	//No to w drog�!
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"GUIDE");
	AI_StopProcessInfos(self);
};

func void dia_brago_hilfe_walkalone()
{
	AI_Output(other,self,"DIA_Brago_Hilfe_WalkAlone_15_00");	//Sam znajd� drog�.
	AI_Output(self,other,"DIA_Brago_Hilfe_WalkAlone_05_01");	//W porz�dku. Je�li twierdzisz, �e samemu ci si� to uda...
	Info_ClearChoices(dia_brago_hilfe);
};


instance DIA_BRAGO_TRAP(C_Info)
{
	npc = stt_5027_brago;
	nr = 1;
	condition = dia_brago_trap_condition;
	information = dia_brago_trap_info;
	permanent = 0;
	important = 1;
	description = "No, to jeste�my.";
};


func int dia_brago_trap_condition()
{
	if(Npc_KnowsInfo(hero,dia_brago_hilfe) && Hlp_StrCmp(Npc_GetNearestWP(self),"OW_PATH_297"))
	{
		return 1;
	};
};

func void dia_brago_trap_info()
{
	AI_Output(self,other,"DIA_Brago_Trap_15_00");	//No, to jeste�my.
	AI_Output(other,self,"DIA_Brago_Trap_10_01");	//I gdzie to tajne wej�cie?
	AI_Output(self,other,"DIA_Brago_Trap_10_02");	//Hehe... nie ma �adnego tajnego wej�cia.
	AI_Output(other,self,"DIA_Brago_Trap_10_03");	//Co?!
	AI_Output(self,other,"DIA_Brago_Trap_10_04");	//Troch� to nierozwa�ne z twojej strony, tak po prostu m�wi� mi o li�cie do Mag�w...
	AI_Output(self,other,"DIA_Brago_Trap_10_05");	//Ale spokojna g�owa, jestem pewien, �e ju� nigdy takiego b��du nie pope�nisz.
	AI_Output(self,other,"DIA_Brago_Trap_10_06");	//Ju� ja o to zadbam...
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
	Npc_SetPermAttitude(self,ATT_HOSTILE);
	Npc_SetTarget(self,other);
	Npc_ExchangeRoutine(self,"START");
};

