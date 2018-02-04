
instance DIA_PAUL_EXIT(C_Info)
{
	npc = non_5054_paul;
	nr = 999;
	condition = dia_paul_exit_condition;
	information = dia_paul_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_paul_exit_condition()
{
	return 1;
};

func void dia_paul_exit_info()
{
	AI_StopProcessInfos(self);
};


instance dia_paul_who(C_Info)
{
	npc = non_5054_paul;
	nr = 1;
	condition = dia_paul_who_condition;
	information = dia_paul_who_info;
	permanent = 0;
	important = 0;
	description = "Co tam?";
};


func int dia_paul_who_condition()
{
	if(paul_oc == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_paul_who_info()
{
	AI_Output(other,self,"DIA_PAUL_WHO_15_00");	//Co tam?
	AI_Output(self,other,"DIA_PAUL_WHO_02_01");	//Czego ode mnie chcesz? Ty te� ch�tny, �eby mi w z�by przywali�?
};


instance dia_paul_oc(C_Info)
{
	npc = non_5054_paul;
	nr = 1;
	condition = dia_paul_oc_condition;
	information = dia_paul_oc_info;
	permanent = 0;
	important = 0;
	description = "Jestem tu, by z�o�y� ci propozycj�.";
};


func int dia_paul_oc_condition()
{
	if((paul_oc == LOG_RUNNING) && Npc_KnowsInfo(hero,dia_paul_who))
	{
		return 1;
	};
};

func void dia_paul_oc_info()
{
	AI_Output(other,self,"DIA_PAUL_OC_15_00");	//Jestem tu, by z�o�y� ci propozycj�.
	AI_Output(self,other,"DIA_PAUL_OC_02_01");	//Co to za propozycja?
	AI_Output(other,self,"DIA_PAUL_OC_02_02");	//Szansa do��czenia do Starego Obozu.
	AI_Output(self,other,"DIA_PAUL_OC_02_03");	//Ach, pewnie jeste� jego dzia�aczem, co? Ostatnio jeden z waszych nie�le mi si� dobra� do sk�ry.
	AI_Output(self,other,"DIA_PAUL_OC_02_04");	//Wi�c czemu niby mia�bym chcie� do was do��czy�?
	Info_ClearChoices(dia_paul_oc);
	Info_AddChoice(dia_paul_oc,"Bo w Starym Obozie b�dziesz mia� perspektywy.",dia_paul_oc_chances);
	Info_AddChoice(dia_paul_oc,"�ycie w Starym Obozie jest prawdziwie wolnym �yciem.",dia_paul_oc_free);
	Info_AddChoice(dia_paul_oc,"Bo inaczej dostaniesz w z�by, Paul.",dia_paul_oc_maul);
};

func void dia_paul_oc_chances()
{
	AI_Output(other,self,"DIA_PAUL_OC_CHANCES_Info_15_01");	//Bo w Starym Obozie b�dziesz mia� perspektywy.
	AI_Output(self,other,"DIA_PAUL_OC_CHANCES_Info_14_02");	//Doprawdy? A jakie� to perspektywy na mnie czekaj�?
	Info_ClearChoices(dia_paul_oc);
	Info_AddChoice(dia_paul_oc,"B�dziesz m�g� wypracowa� sobie wysok� pozycj�.",dia_paul_oc_workhard);
	Info_AddChoice(dia_paul_oc,"B�dziesz m�g� zarobi� od groma rudy w kopalni.",dia_paul_oc_earnore);
};

func void dia_paul_oc_free()
{
	AI_Output(other,self,"DIA_PAUL_OC_FREE_Info_15_01");	//�ycie w Starym Obozie jest prawdziwie wolnym �yciem.
	AI_Output(self,other,"DIA_PAUL_OC_FREE_Info_14_02");	//Nie s�dz�. Nie mam si� co spodziewa� swobodnego �ycia w obozie, w kt�rym na powitanie dostaj� po mordzie.
	AI_Output(self,other,"DIA_PAUL_OC_FREE_Info_14_03");	//Znajd� sobie innego pacana. Moja noga w Starym Obozie nigdy nie postanie.
	paul_oc = LOG_FAILED;
	Log_SetTopicStatus(CH1_PAULOC,LOG_FAILED);
	B_LogEntry(CH1_PAULOC,"Nie uda�o mi si� przekona� Paula, �e najlepsze b�dzie dla niego do��czenie do Starego Obozu. Siekaczowi si� to nie spodoba.");
	Info_ClearChoices(dia_paul_oc);
	AI_StopProcessInfos(self);
};

func void dia_paul_oc_maul()
{
	AI_Output(other,self,"DIA_PAUL_OC_MAUL_Info_15_01");	//Bo inaczej dostaniesz w z�by, Paul.
	AI_Output(self,other,"DIA_PAUL_OC_MAUL_Info_14_02");	//Wiedzia�em, �e jeste� dok�adnie takim samym obdartusem co tamten.
	AI_Output(self,other,"DIA_PAUL_OC_MAUL_Info_14_03");	//Spadaj st�d!
	paul_oc = LOG_FAILED;
	Log_SetTopicStatus(CH1_PAULOC,LOG_FAILED);
	B_LogEntry(CH1_PAULOC,"Nie uda�o mi si� przekona� Paula, �e najlepsze b�dzie dla niego do��czenie do Starego Obozu. Siekaczowi si� to nie spodoba.");
	Info_ClearChoices(dia_paul_oc);
	AI_StopProcessInfos(self);
};

func void dia_paul_oc_workhard()
{
	AI_Output(other,self,"DIA_PAUL_OC_WORKHARD_Info_15_01");	//B�dziesz m�g� wypracowa� sobie wysok� pozycj�.
	AI_Output(self,other,"DIA_PAUL_OC_WORKHARD_Info_14_02");	//Ty te� tak zrobi�e�?
	AI_Output(other,self,"DIA_PAUL_OC_WORKHARD_Info_14_03");	//Ot� to.
	AI_Output(self,other,"DIA_PAUL_OC_WORKHARD_Info_14_04");	//I zdaje si�, �e nie�le ci idzie.
	AI_Output(self,other,"DIA_PAUL_OC_WORKHARD_Info_14_05");	//My�l�, �e rusz� w drog� i zerkn� na ten ob�z.
	AI_Output(self,other,"DIA_PAUL_OC_WORKHARD_Info_14_06");	//Dzi�ki za pomoc!
	paul_oc = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_PAULOC,LOG_SUCCESS);
	B_LogEntry(CH1_PAULOC,"Uda�o mi si� przekona� Paula, �e najlepsze b�dzie dla niego do��czenie do Starego Obozu. Wykona�em swoje zadanie, Siekacz b�dzie wniebowzi�ty.");
	B_GiveXP(XP_PAUL);
	Info_ClearChoices(dia_paul_oc);
	Npc_ExchangeRoutine(self,"OLDCAMP");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"OLDCAMP");
};

func void dia_paul_oc_earnore()
{
	AI_Output(other,self,"DIA_PAUL_OC_EARNORE_Info_15_01");	//B�dziesz m�g� zarobi� od groma rudy w kopalni.
	AI_Output(self,other,"DIA_PAUL_OC_EARNORE_Info_14_02");	//Mam dobrowolnie tyra� w kopalni?
	AI_Output(self,other,"DIA_PAUL_OC_EARNORE_Info_14_03");	//Nie, to ju� wol� poszuka� sobie innego obozu, zamiast si� mordowa� dla tych Magnat�w.
	paul_oc = LOG_FAILED;
	Log_SetTopicStatus(CH1_PAULOC,LOG_FAILED);
	B_LogEntry(CH1_PAULOC,"Nie uda�o mi si� przekona� Paula, �e najlepsze b�dzie dla niego do��czenie do Starego Obozu. Siekaczowi si� to nie spodoba.");
	Info_ClearChoices(dia_paul_oc);
	AI_StopProcessInfos(self);
};


instance DIA_PAUL_NOW(C_Info)
{
	npc = non_5054_paul;
	nr = 1;
	condition = dia_paul_now_condition;
	information = dia_paul_now_info;
	permanent = 1;
	important = 0;
	description = "Jak tam?";
};


func int dia_paul_now_condition()
{
	if(Npc_KnowsInfo(hero,dia_cutter_success))
	{
		return 1;
	};
};

func void dia_paul_now_info()
{
	AI_Output(other,self,"DIA_PAUL_NOW_15_00");	//Jak tam?
	AI_Output(self,other,"DIA_PAUL_NOW_02_01");	//Dobrze. Stary Ob�z nie jest wcale takim z�ym miejscem do �ycia.
	AI_Output(self,other,"DIA_PAUL_NOW_02_02");	//Przynajmniej lepsze to, ni� jakbym mia� si� ci�gle przedziera� przez t� dzicz na zewn�trz.
	AI_Output(self,other,"DIA_PAUL_NOW_02_03");	//Na razie b�d� pracowa� u Huno. Obieca�, �e we�mie mnie na czeladnika i przyuczy do kowalstwa.
};

