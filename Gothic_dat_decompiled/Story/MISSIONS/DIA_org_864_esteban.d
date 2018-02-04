
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
	description = "Czeœæ! Kim jesteœ?";
};


func int dia_esteban_hello_condition()
{
	return 1;
};

func void dia_esteban_hello_info()
{
	AI_Output(other,self,"DIA_Esteban_Hello_15_00");	//Czeœæ! Kim jesteœ?
	AI_Output(self,other,"DIA_Esteban_Hello_12_01");	//Nazywam siê Esteban.
	AI_Output(self,other,"DIA_Esteban_Hello_12_02");	//I jedno ci ju¿ mogê powiedzieæ - jeœli nic siê tu wkrótce nie zmieni, to w³aœnie stoi przed tob¹ przysz³y dowódca tego obozu.
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
		AI_Output(self,other,"DIA_Esteban_In_12_01");	//Quentin mi tu nie odpowiada i ca³y ten jego styl zarz¹dzania.
		AI_Output(self,other,"DIA_Esteban_In_12_02");	//Quentin jest zdania, ¿e najlepiej bêdzie, jeœli nadal bêdziemy wspieraæ Nowy Obóz i uczestniczyæ w napadach.
		AI_Output(self,other,"DIA_Esteban_In_12_03");	//A ja to widzê nieco inaczej.
		AI_Output(other,self,"DIA_Esteban_In_12_04");	//Mianowicie?
		AI_Output(self,other,"DIA_Esteban_In_12_05");	//Du¿o korzystniejsze by³oby dla nas, gdybyœmy siê spiknêli na d³u¿sz¹ metê ze Starym Obozem.
		AI_Output(self,other,"DIA_Esteban_In_12_06");	//Magnaci wszystkie swoje towary dostaj¹ z zewnêtrznego œwiata i jeœli czêœæ z nich powêdrowa³aby do nas, moglibyœmy prowadziæ lepsze ¿ycie ni¿ dotychczas.
		AI_Output(self,other,"DIA_Esteban_In_12_07");	//Mo¿e i idzie siê nieŸle dorobiæ na tych napadach, ale i tak po³owê ³upu musimy odst¹piæ Nowemu Obozowi.
	}
	else
	{
		AI_Output(other,self,"DIA_Esteban_In_12_00");	//Teraz ju¿ nic. Skoro Quentin gryzie ziemiê, wszystko jest w porz¹deczku. (chich)
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
	description = "Mogê ci w czymœ pomóc?";
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
	AI_Output(other,self,"DIA_Esteban_Why_15_00");	//Mogê ci w czymœ pomóc?
	AI_Output(self,other,"DIA_Esteban_How_12_01");	//Hmm... Tak s¹dzê.
	AI_Output(self,other,"DIA_Esteban_How_12_02");	//Musia³byœ rozejrzeæ siê nieco po obozie.
	AI_Output(self,other,"DIA_Esteban_How_12_03");	//Chcê wiedzieæ, kto tutaj stoi po czyjej stronie.
	AI_Output(self,other,"DIA_Esteban_How_12_04");	//Popytaj ludzi i dowiedz siê, kto popiera mnie, a kto Quentina.
	AI_Output(self,other,"DIA_Esteban_How_12_05");	//Jak tylko ju¿ wypytasz ka¿dego, wracaj do mnie i podziel siê wra¿eniami.
	AI_Output(self,other,"DIA_Esteban_How_12_06");	//Tylko widzisz, jest jeszcze jeden problem.
	AI_Output(self,other,"DIA_Esteban_How_12_07");	//Ludziska wiedz¹, ¿e rozmawialiœmy ze sob¹.
	AI_Output(self,other,"DIA_Esteban_How_12_08");	//I wiedz¹ te¿, ¿e chêtnie przej¹³bym dowództwo nad tym obozem.
	AI_Output(self,other,"DIA_Esteban_How_12_09");	//W celu rozwiania wszelkich podejrzeñ, bêdziesz musia³ daæ siê spraæ przeze mnie po naszej rozmowie.
	AI_Output(self,other,"DIA_Esteban_How_12_10");	//Dziêki temu nikt nie nabierze podejrzeñ, rozumiesz.
	AI_Output(self,other,"DIA_Esteban_How_12_11");	//Tak¿e tego... przygotuj siê na to.
	esteban_leader = LOG_RUNNING;
	Log_CreateTopic(CH1_ESTEBANQUENTIN,LOG_MISSION);
	Log_SetTopicStatus(CH1_ESTEBANQUENTIN,LOG_RUNNING);
	B_LogEntry(CH1_ESTEBANQUENTIN,"Esteban, jeden z rozbójników w obozie jest zdania, ¿e Quentin nie powinien ju¿ d³u¿ej sprawowaæ nadzoru nad obozem. Quentin sprzymierzy³ siê z Nowym Obozem, a Estebanowi jednak bardziej odpowiada Stary Obóz. Mam siê teraz dla niego popytaæ w obozie, kto stoi po jego stronie, a kto po Quentina. Jak tylko wszystkiego siê dowiem, mam do niego zawitaæ i wszystko mu wyœpiewaæ.");
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
	AI_Output(self,other,"DIA_Esteban_Skinner_15_00");	//CZY¯ NIE WYRAZI£EM SIÊ JASNO, ¯E MASZ ST¥D ZMIATAÆ?!
	AI_Output(self,other,"DIA_Esteban_Skinner_12_01");	//TRZEBA CI BÊDZIE PRZETRZEPAÆ SKÓRÊ!
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
	description = "Rozmawia³em z kilkoma ludŸmi.";
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
	AI_Output(other,self,"DIA_Esteban_SUCCESS_15_00");	//Rozmawia³em z kilkoma ludŸmi.
	AI_Output(self,other,"DIA_Esteban_SUCCESS_12_01");	//I?
	AI_Output(other,self,"DIA_Esteban_SUCCESS_12_02");	//Franko jest po twojej stronie. Uwa¿a, ¿e mia³byœ zadatki na lidera.
	AI_Output(other,self,"DIA_Esteban_SUCCESS_12_03");	//Logan twierdzi, ¿e czas Quentina ju¿ min¹³.
	AI_Output(other,self,"DIA_Esteban_SUCCESS_12_04");	//Dla Sancho jest w³aœciwie wszystko jedno. W koñcu tak czy siak bêdzie sta³ ca³ymi dniami na swojej pozycji.
	AI_Output(other,self,"DIA_Esteban_SUCCESS_12_05");	//Senyan jest po twojej stronie. Uwa¿a ciê za pradziwego przywódcê.
	AI_Output(other,self,"DIA_Esteban_SUCCESS_12_06");	//I to by byli ju¿ wszyscy.
	AI_Output(self,other,"DIA_Esteban_SUCCESS_12_08");	//Brzmi nieŸle. Wygl¹da na to, ¿e mój czas wreszcie nadszed³.
	AI_Output(self,other,"DIA_Esteban_SUCCESS_12_09");	//Ods³oni³eœ mi drogê do mojego przywództwa, ch³opcze. He he.
	AI_Output(self,other,"DIA_Esteban_SUCCESS_12_10");	//Trzymaj, to za fatygê.
	AI_Output(self,other,"DIA_Esteban_SUCCESS_12_11");	//A teraz odejdŸ. Nie jesteœ mi ju¿ potrzebny.
	B_GiveInvItems(self,other,estebans_bogen,1);
	esteban_leader = LOG_SUCCESS;
	B_GiveXP(XP_ESTEBAN);
	Log_SetTopicStatus(CH1_ESTEBANQUENTIN,LOG_SUCCESS);
	B_LogEntry(CH1_ESTEBANQUENTIN,"Esteban by³ usatysfakcjonowany z mojej pracy i jest pewien, ¿e by³by lepszym liderem. Powiedzia³ mi, ¿e ju¿ nie potrzebuje mojej pomocy i musi siê nieco przygotowaæ. Dziêki mnie nic ju¿ nie stoi mu na przeszkodzie do przejêcia w³adzy w obozie.");
};

