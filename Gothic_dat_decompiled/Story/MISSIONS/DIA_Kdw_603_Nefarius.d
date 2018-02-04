
instance Info_Nefarius_EXIT(C_Info)
{
	npc = Kdw_603_Nefarius;
	nr = 999;
	condition = Info_Nefarius_EXIT_Condition;
	information = Info_Nefarius_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Nefarius_EXIT_Condition()
{
	return 1;
};

func void Info_Nefarius_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Nefarius_Hallo(C_Info)
{
	npc = Kdw_603_Nefarius;
	nr = 1;
	condition = Info_Nefarius_Hallo_Condition;
	information = Info_Nefarius_Hallo_Info;
	permanent = 0;
	description = "Kim jeste�?";
};


func int Info_Nefarius_Hallo_Condition()
{
	return 1;
};

func void Info_Nefarius_Hallo_Info()
{
	AI_Output(other,self,"Info_Nefarius_Hallo_15_00");	//Kim jeste�?
	AI_Output(self,other,"Info_Nefarius_Hallo_04_01");	//Nazywam si� Nefarius. Mag Kr�gu Wody.
};


instance Info_Nefarius_WoSaturas(C_Info)
{
	npc = Kdw_603_Nefarius;
	nr = 2;
	condition = Info_Nefarius_WoSaturas_Condition;
	information = Info_Nefarius_WoSaturas_Info;
	permanent = 0;
	description = "Gdzie mog� znale�� Saturasa?";
};


func int Info_Nefarius_WoSaturas_Condition()
{
	return 1;
};

func void Info_Nefarius_WoSaturas_Info()
{
	AI_Output(other,self,"Info_Nefarius_WoSaturas_15_00");	//Gdzie mog� znale�� Saturasa?
	AI_Output(self,other,"Info_Nefarius_WoSaturas_04_01");	//Poszukaj za t� wielk�, okr�g�� bram�.
};


instance Info_Nefarius_WannaMage(C_Info)
{
	npc = Kdw_603_Nefarius;
	nr = 1;
	condition = Info_Nefarius_WannaMage_Condition;
	information = Info_Nefarius_WannaMage_Info;
	permanent = 0;
	description = "Chcia�bym zosta� Magiem Kr�gu Wody.";
};


func int Info_Nefarius_WannaMage_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Nefarius_Hallo))
	{
		return 1;
	};
};

func void Info_Nefarius_WannaMage_Info()
{
	AI_Output(other,self,"Info_Nefarius_WannaMage_15_00");	//Chcia�bym zosta� Magiem Kr�gu Wody.
	AI_Output(self,other,"Info_Nefarius_WannaMage_04_01");	//Nie tak szybko, m�j ch�opcze!
	AI_Output(self,other,"Info_Nefarius_WannaMage_04_02");	//Nie przyjmujemy do naszego grona byle kogo. Najpierw musisz si� wykaza� czym� niezwyk�ym.
	AI_Output(self,other,"Info_Nefarius_WannaMage_04_03");	//Potem czeka ci� okres pr�bny.
	AI_Output(self,other,"Info_Nefarius_WannaMage_04_04");	//Je�eli powa�nie my�lisz o zostaniu Magiem Wody, do��cz najpierw do Najemnik�w. W ten spos�b b�dziesz m�g� nam udowodni� swoj� warto��.
	AI_Output(self,other,"Info_Nefarius_WannaMage_04_05");	//Kto wie, mo�e pewnego dnia uda ci si� nas przekona�...
};


instance Info_Nefarius_NowReady(C_Info)
{
	npc = Kdw_603_Nefarius;
	nr = 1;
	condition = Info_Nefarius_NowReady_Condition;
	information = Info_Nefarius_NowReady_Info;
	permanent = 1;
	description = "Czy jestem ju� got�w, by zosta� Magiem Wody?";
};


func int Info_Nefarius_NowReady_Condition()
{
	if(!FMTaken && Npc_KnowsInfo(hero,Info_Nefarius_WannaMage) && (Npc_GetTrueGuild(hero) != GIL_KDW))
	{
		return 1;
	};
};

func void Info_Nefarius_NowReady_Info()
{
	AI_Output(other,self,"Info_Nefarius_NowReady_15_00");	//Czy jestem ju� got�w, by zosta� Magiem Wody?
	if(Npc_GetTrueGuild(hero) != GIL_SLD)
	{
		AI_Output(self,other,"Info_Nefarius_NowReady_04_01");	//Najpierw zaci�gnij si� do Najemnik�w, potem - zobaczymy...
	}
	else
	{
		AI_Output(self,other,"Info_Nefarius_NowReady_04_02");	//Jak widz�, zosta�e� jednym z Najemnik�w. Dobrze, bardzo dobrze!
		AI_Output(self,other,"Info_Nefarius_NowReady_04_03");	//Czekaj teraz cierpliwie na swoj� szans�...
	};
};


var int nefarius_kdw;

instance Info_Nefarius_OCNews(C_Info)
{
	npc = Kdw_603_Nefarius;
	nr = 1;
	condition = Info_Nefarius_OCNews_Condition;
	information = Info_Nefarius_OCNews_Info;
	permanent = 0;
	important = 1;
};


func int Info_Nefarius_OCNews_Condition()
{
	if(FMTaken && !FindXardas)
	{
		return TRUE;
	};
};

func void Info_Nefarius_OCNews_Info()
{
	AI_Output(self,other,"Info_Nefarius_OCNews_04_00");	//S� jakie� wie�ci od naszych przyjaci� ze Starego Obozu?
	AI_Output(other,self,"Info_Nefarius_OCNews_15_01");	//Gomez kaza� wymordowa� wszystkich Mag�w Ognia!
	AI_Output(self,other,"Info_Nefarius_OCNews_04_02");	//Nie! Durny barbarzy�ca! Uprzedza�em Corristo - Gomezowi od pocz�tku nie mo�na by�o ufa�! Musisz donie�� o tym Saturasowi!
	if(Npc_GetTrueGuild(hero) == GIL_SLD)
	{
		AI_Output(self,other,"Info_Nefarius_OCNews_04_03");	//Czekaj!
		AI_Output(self,other,"Info_Nefarius_OCNews_04_04");	//Narazi�e� si� dla nas na nie lada niebezpiecze�stwa.
		AI_Output(self,other,"Info_Nefarius_OCNews_04_05");	//Jeste� ju� chyba godzien, by nosi� szaty Maga Wody.
		AI_Output(self,other,"Info_Nefarius_OCNews_04_06");	//A teraz spiesz do Saturasa! Nie tra� czasu!
		nefarius_kdw = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_KDW_NEFARIUS_HERODMB(C_Info)
{
	npc = Kdw_603_Nefarius;
	nr = 3;
	condition = dia_kdw_nefarius_herodmb_condition;
	information = dia_kdw_nefarius_herodmb_info;
	permanent = 0;
	important = 1;
};


func int dia_kdw_nefarius_herodmb_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_DMB)
	{
		return 1;
	};
};

func void dia_kdw_nefarius_herodmb_info()
{
	AI_Output(self,other,"DIA_KDW_Nefarius_HeroDMB_15_00");	//Co jest grane? Dlaczego zwr�ci�e� si� w stron� czarnej magii?
	AI_StopProcessInfos(self);
};

