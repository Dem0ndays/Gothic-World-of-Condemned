
instance DIA_ESTEBAN_EXIT(C_Info)
{
	npc = org_864_esteban;
	nr = 999;
	condition = dia_esteban_exit_condition;
	information = dia_esteban_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_esteban_exit_condition()
{
	return 1;
};

func void dia_esteban_exit_info()
{
	AI_StopProcessInfos(self);
};


instance dia_esteban_hello(C_Info)
{
	npc = org_864_esteban;
	nr = 1;
	condition = dia_esteban_hello_condition;
	information = dia_esteban_hello_info;
	permanent = 0;
	important = 0;
	description = "Cze��! Kim jeste�?";
};


func int dia_esteban_hello_condition()
{
	return 1;
};

func void dia_esteban_hello_info()
{
	AI_Output(other,self,"DIA_Esteban_Hello_15_00");	//Cze��! Kim jeste�?
	AI_Output(self,other,"DIA_Esteban_Hello_12_01");	//Nazywam si� Esteban.
	AI_Output(self,other,"DIA_Esteban_Hello_12_02");	//I jedno ci ju� mog� powiedzie� - je�li nic si� tu wkr�tce nie zmieni, to w�a�nie stoi przed tob� przysz�y dow�dca tego obozu.
};


instance dia_esteban_in(C_Info)
{
	npc = org_864_esteban;
	nr = 1;
	condition = dia_esteban_in_condition;
	information = dia_esteban_in_info;
	permanent = 0;
	important = 0;
	description = "A co jest nie tak z tym obozem?";
};


func int dia_esteban_in_condition()
{
	if(Npc_KnowsInfo(hero,dia_esteban_hello))
	{
		return 1;
	};
};

func void dia_esteban_in_info()
{
	if(!Npc_IsDead(Org_858_Quentin))
	{
		AI_Output(other,self,"DIA_Esteban_In_15_00");	//A co jest nie tak z tym obozem?
		AI_Output(self,other,"DIA_Esteban_In_12_01");	//Quentin mi tu nie odpowiada i ca�y ten jego styl zarz�dzania.
		AI_Output(self,other,"DIA_Esteban_In_12_02");	//Quentin jest zdania, �e najlepiej b�dzie, je�li nadal b�dziemy wspiera� Nowy Ob�z i uczestniczy� w napadach.
		AI_Output(self,other,"DIA_Esteban_In_12_03");	//A ja to widz� nieco inaczej.
		AI_Output(other,self,"DIA_Esteban_In_12_04");	//Mianowicie?
		AI_Output(self,other,"DIA_Esteban_In_12_05");	//Du�o korzystniejsze by�oby dla nas, gdyby�my si� spikn�li na d�u�sz� met� ze Starym Obozem.
		AI_Output(self,other,"DIA_Esteban_In_12_06");	//Magnaci wszystkie swoje towary dostaj� z zewn�trznego �wiata i je�li cz�� z nich pow�drowa�aby do nas, mogliby�my prowadzi� lepsze �ycie ni� dotychczas.
		AI_Output(self,other,"DIA_Esteban_In_12_07");	//Mo�e i idzie si� nie�le dorobi� na tych napadach, ale i tak po�ow� �upu musimy odst�pi� Nowemu Obozowi.
	}
	else
	{
		AI_Output(other,self,"DIA_Esteban_In_12_00");	//Teraz ju� nic. Skoro Quentin gryzie ziemi�, wszystko jest w porz�deczku. (chich)
	};
};


instance dia_esteban_why(C_Info)
{
	npc = org_864_esteban;
	nr = 1;
	condition = dia_esteban_why_condition;
	information = dia_esteban_why_info;
	permanent = 0;
	important = 0;
	description = "Mog� ci w czym� pom�c?";
};


func int dia_esteban_why_condition()
{
	if(Npc_KnowsInfo(hero,dia_esteban_in) && !Npc_IsDead(Org_858_Quentin))
	{
		return 1;
	};
};

func void dia_esteban_why_info()
{
	AI_Output(other,self,"DIA_Esteban_Why_15_00");	//Mog� ci w czym� pom�c?
	AI_Output(self,other,"DIA_Esteban_How_12_01");	//Hmm... Tak s�dz�.
	AI_Output(self,other,"DIA_Esteban_How_12_02");	//Musia�by� rozejrze� si� nieco po obozie.
	AI_Output(self,other,"DIA_Esteban_How_12_03");	//Chc� wiedzie�, kto tutaj stoi po czyjej stronie.
	AI_Output(self,other,"DIA_Esteban_How_12_04");	//Popytaj ludzi i dowiedz si�, kto popiera mnie, a kto Quentina.
	AI_Output(self,other,"DIA_Esteban_How_12_05");	//Jak tylko ju� wypytasz ka�dego, wracaj do mnie i podziel si� wra�eniami.
	AI_Output(self,other,"DIA_Esteban_How_12_06");	//Tylko widzisz, jest jeszcze jeden problem.
	AI_Output(self,other,"DIA_Esteban_How_12_07");	//Ludziska wiedz�, �e rozmawiali�my ze sob�.
	AI_Output(self,other,"DIA_Esteban_How_12_08");	//I wiedz� te�, �e ch�tnie przej��bym dow�dztwo nad tym obozem.
	AI_Output(self,other,"DIA_Esteban_How_12_09");	//W celu rozwiania wszelkich podejrze�, b�dziesz musia� da� si� spra� przeze mnie po naszej rozmowie.
	AI_Output(self,other,"DIA_Esteban_How_12_10");	//Dzi�ki temu nikt nie nabierze podejrze�, rozumiesz.
	AI_Output(self,other,"DIA_Esteban_How_12_11");	//Tak�e tego... przygotuj si� na to.
	esteban_leader = LOG_RUNNING;
	Log_CreateTopic(CH1_ESTEBANQUENTIN,LOG_MISSION);
	Log_SetTopicStatus(CH1_ESTEBANQUENTIN,LOG_RUNNING);
	B_LogEntry(CH1_ESTEBANQUENTIN,"Esteban, jeden z rozb�jnik�w w obozie jest zdania, �e Quentin nie powinien ju� d�u�ej sprawowa� nadzoru nad obozem. Quentin sprzymierzy� si� z Nowym Obozem, a Estebanowi jednak bardziej odpowiada Stary Ob�z. Mam si� teraz dla niego popyta� w obozie, kto stoi po jego stronie, a kto po Quentina. Jak tylko wszystkiego si� dowiem, mam do niego zawita� i wszystko mu wy�piewa�.");
};


instance DIA_ESTEBAN_MAUL(C_Info)
{
	npc = org_864_esteban;
	nr = 1;
	condition = dia_esteban_maul_condition;
	information = dia_esteban_maul_info;
	permanent = 0;
	important = 1;
};


func int dia_esteban_maul_condition()
{
	if((esteban_leader == LOG_RUNNING) && Npc_KnowsInfo(hero,dia_esteban_why))
	{
		return 1;
	};
};

func void dia_esteban_maul_info()
{
	AI_Output(self,other,"DIA_Esteban_Skinner_15_00");	//CZY� NIE WYRAZI�EM SI� JASNO, �E MASZ ST�D ZMIATA�?!
	AI_Output(self,other,"DIA_Esteban_Skinner_12_01");	//TRZEBA CI B�DZIE PRZETRZEPA� SK�R�!
	AI_StopProcessInfos(self);
	Npc_SetTarget(org_864_esteban,other);
	AI_StartState(org_864_esteban,ZS_Attack,1,"");
};


instance DIA_ESTEBAN_SUCCESS(C_Info)
{
	npc = org_864_esteban;
	nr = 1;
	condition = dia_esteban_success_condition;
	information = dia_esteban_success_info;
	permanent = 0;
	important = 0;
	description = "Rozmawia�em z kilkoma lud�mi.";
};


func int dia_esteban_success_condition()
{
	if((esteban_leader == LOG_RUNNING) && (franco_esteban == TRUE) && (senyan_esteban == TRUE) && (logan_esteban == TRUE) && (sancho_esteban == TRUE))
	{
		return 1;
	};
};

func void dia_esteban_success_info()
{
	AI_Output(other,self,"DIA_Esteban_SUCCESS_15_00");	//Rozmawia�em z kilkoma lud�mi.
	AI_Output(self,other,"DIA_Esteban_SUCCESS_12_01");	//I?
	AI_Output(other,self,"DIA_Esteban_SUCCESS_12_02");	//Franko jest po twojej stronie. Uwa�a, �e mia�by� zadatki na lidera.
	AI_Output(other,self,"DIA_Esteban_SUCCESS_12_03");	//Logan twierdzi, �e czas Quentina ju� min��.
	AI_Output(other,self,"DIA_Esteban_SUCCESS_12_04");	//Dla Sancho jest w�a�ciwie wszystko jedno. W ko�cu tak czy siak b�dzie sta� ca�ymi dniami na swojej pozycji.
	AI_Output(other,self,"DIA_Esteban_SUCCESS_12_05");	//Senyan jest po twojej stronie. Uwa�a ci� za pradziwego przyw�dc�.
	AI_Output(other,self,"DIA_Esteban_SUCCESS_12_06");	//I to by byli ju� wszyscy.
	AI_Output(self,other,"DIA_Esteban_SUCCESS_12_08");	//Brzmi nie�le. Wygl�da na to, �e m�j czas wreszcie nadszed�.
	AI_Output(self,other,"DIA_Esteban_SUCCESS_12_09");	//Ods�oni�e� mi drog� do mojego przyw�dztwa, ch�opcze. He he.
	AI_Output(self,other,"DIA_Esteban_SUCCESS_12_10");	//Trzymaj, to za fatyg�.
	AI_Output(self,other,"DIA_Esteban_SUCCESS_12_11");	//A teraz odejd�. Nie jeste� mi ju� potrzebny.
	B_GiveInvItems(self,other,estebans_bogen,1);
	esteban_leader = LOG_SUCCESS;
	B_GiveXP(XP_ESTEBAN);
	Log_SetTopicStatus(CH1_ESTEBANQUENTIN,LOG_SUCCESS);
	B_LogEntry(CH1_ESTEBANQUENTIN,"Esteban by� usatysfakcjonowany z mojej pracy i jest pewien, �e by�by lepszym liderem. Powiedzia� mi, �e ju� nie potrzebuje mojej pomocy i musi si� nieco przygotowa�. Dzi�ki mnie nic ju� nie stoi mu na przeszkodzie do przej�cia w�adzy w obozie.");
};

