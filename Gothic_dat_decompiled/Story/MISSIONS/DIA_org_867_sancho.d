
instance DIA_SANCHO_EXIT(C_Info)
{
	npc = org_867_sancho;
	nr = 999;
	condition = dia_sancho_exit_condition;
	information = dia_sancho_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_sancho_exit_condition()
{
	return 1;
};

func void dia_sancho_exit_info()
{
	AI_StopProcessInfos(self);
};


instance dia_sancho_hello(C_Info)
{
	npc = org_867_sancho;
	nr = 1;
	condition = dia_sancho_hello_condition;
	information = dia_sancho_hello_info;
	permanent = 0;
	important = 1;
};


func int dia_sancho_hello_condition()
{
	return 1;
};

func void dia_sancho_hello_info()
{
	AI_Output(self,other,"DIA_Sancho_Hello_15_00");	//A dok�d to si� wybierasz?
	AI_Output(other,self,"DIA_Sancho_Hello_12_01");	//A co jest tam dalej?
	AI_Output(self,other,"DIA_Sancho_Hello_12_02");	//Nasz ob�z. My, bandyci, rz�dzimy na tych terenach, a Quentin jest naszym przyw�dc�.
	AI_Output(self,other,"DIA_Sancho_Hello_12_03");	//To on dba o to, aby w obozie panowa� �ad i porz�dek.
};


instance dia_sancho_in(C_Info)
{
	npc = org_867_sancho;
	nr = 1;
	condition = dia_sancho_in_condition;
	information = dia_sancho_in_info;
	permanent = 0;
	important = 0;
	description = "Mog� wej��?";
};


func int dia_sancho_in_condition()
{
	if(Npc_KnowsInfo(hero,dia_sancho_hello))
	{
		return 1;
	};
};

func void dia_sancho_in_info()
{
	AI_Output(other,self,"DIA_Sancho_In_15_00");	//Mog� wej��?
	AI_Output(self,other,"DIA_Sancho_In_12_01");	//Pewnie, �e mo�esz, w ko�cu co kto� taki jak ty m�g�by tutaj nabroi�.
	AI_Output(self,other,"DIA_Sancho_In_12_02");	//Ale lepiej uwa�aj na to co robisz, dobra? Paru ch�opak�w to prawdziwe szczyle, kt�rzy tylko czerpi� przyjemno�� z nabijania guz�w takim jak ty.
};


instance DIA_SANCHO_HOW(C_Info)
{
	npc = org_867_sancho;
	nr = 1;
	condition = dia_sancho_how_condition;
	information = dia_sancho_how_info;
	permanent = 1;
	important = 0;
	description = "Co tam?";
};


func int dia_sancho_how_condition()
{
	if(Npc_KnowsInfo(hero,dia_sancho_in))
	{
		return 1;
	};
};

func void dia_sancho_how_info()
{
	AI_Output(other,self,"DIA_Sancho_How_15_00");	//Co tam?
	AI_Output(self,other,"DIA_Sancho_How_12_01");	//Na razie jest do�� spokojnie. Z�bacze trzymaj� si� od nas w bezpiecznej odleg�o�ci, a w obozie p�ki co po staremu.
};


instance DIA_SANCHO_SKINNER(C_Info)
{
	npc = org_867_sancho;
	nr = 1;
	condition = dia_sancho_skinner_condition;
	information = dia_sancho_skinner_info;
	permanent = 0;
	important = 1;
};


func int dia_sancho_skinner_condition()
{
	if(Npc_KnowsInfo(hero,dia_sancho_hello))
	{
		return 1;
	};
};

func void dia_sancho_skinner_info()
{
	AI_Output(self,other,"DIA_Sancho_Skinner_15_00");	//Ach, bym jeszcze zapomnia�!
	AI_Output(self,other,"DIA_Sancho_Skinner_12_01");	//Skoro ju� wybierasz si� do obozu, to zaraz na lewo znajdziesz pewn� chat�.
	AI_Output(self,other,"DIA_Sancho_Skinner_12_02");	//Nale�y ona do Skinnera i dla w�asnego dobra lepiej pozw�l mu spa�.
	AI_Output(self,other,"DIA_Sancho_Skinner_12_03");	//Wierz mi, tak b�dzie dla ciebie najlepiej.
};


var int sancho_esteban;

instance DIA_SANCHO_ABOUT(C_Info)
{
	npc = org_867_sancho;
	nr = 1;
	condition = dia_sancho_about_condition;
	information = dia_sancho_about_info;
	permanent = 0;
	important = 0;
	description = "Jakie masz zdanie o Estebanie?";
};


func int dia_sancho_about_condition()
{
	if(esteban_leader == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_sancho_about_info()
{
	AI_Output(other,self,"DIA_Sancho_About_15_00");	//Jakie masz zdanie o Estebanie?
	AI_Output(self,other,"DIA_Sancho_About_12_01");	//Pewnie obi�y ci si� ju� te plotki o uszy, co?
	AI_Output(self,other,"DIA_Sancho_About_12_02");	//Wiesz, mnie tam nie interesuje kto jest szefem, a kto nie. Dla mnie tutaj przed bram� i tak to nie ma wi�kszego znaczenia.
	AI_Output(self,other,"DIA_Sancho_About_12_03");	//Ale wcze�niej czy p�niej Esteban w ko�cu sprz�tnie Quentina, to jest pewne.
	B_LogEntry(CH1_ESTEBANQUENTIN,"Dla Sancha jest wszystko jedno kto jest szefem a kto nie. I tak pewnie w dalszym ci�gu zachowa swoje stanowisko. Twierdzi te�, �e Esteban ju� niebawem przejmie stery.");
	sancho_esteban = TRUE;
};


instance DIA_SANCHO_RAVEN(C_Info)
{
	npc = org_867_sancho;
	nr = 1;
	condition = dia_sancho_raven_condition;
	information = dia_sancho_raven_info;
	permanent = 0;
	important = 1;
};


func int dia_sancho_raven_condition()
{
	if(Kapitel >= 4)
	{
		return 1;
	};
};

func void dia_sancho_raven_info()
{
	AI_Output(self,other,"DIA_Sancho_Raven_15_00");	//Hej, ty! Na twoim miejscu bym zawr�ci�.
	AI_Output(other,self,"DIA_Sancho_Raven_12_01");	//Dlaczego?
	if(Npc_IsDead(Org_858_Quentin))
	{
		AI_Output(self,other,"DIA_Sancho_Raven_12_12");	//Bo za�atwi�e� Quentina i teraz to Esteban sprawuje w�adz� w obozie.
		AI_Output(other,self,"DIA_Sancho_Raven_12_03");	//�e co?!
		AI_Output(self,other,"DIA_Sancho_Raven_12_04");	//To jeszcze nie wszystko.
		AI_Output(self,other,"DIA_Sancho_Raven_12_05");	//Po tym jak Stary Ob�z napad� na Woln� Kopalni�, jeden z Magnat�w razem z kilkoma Stra�nikami z�o�yli nam wizyt� w obozie, aby paktowa� z Estebanem.
		AI_Output(self,other,"DIA_Sancho_Raven_12_08");	//Teraz on i ten Magnat przesiaduj� w kotlinie i planuj� dalsze posuni�cia.
		AI_Output(self,other,"DIA_Sancho_Raven_12_09");	//Na twoim miejscu nie szed�bym dalej, pewnikiem obdarliby ci� ze sk�ry.
	}
	else
	{
		AI_Output(self,other,"DIA_Sancho_Raven_12_02");	//Bo Esteban teraz poci�ga za sznurki. Za�atwi� Quentina.
		AI_Output(other,self,"DIA_Sancho_Raven_12_03");	//�e co?!
		AI_Output(self,other,"DIA_Sancho_Raven_12_04");	//To jeszcze nie wszystko.
		AI_Output(self,other,"DIA_Sancho_Raven_12_05");	//Po tym jak Stary Ob�z napad� na Woln� Kopalni�, jeden z Magnat�w razem z kilkoma Stra�nikami z�o�yli nam wizyt� w obozie, aby paktowa� z Estebanem.
		AI_Output(self,other,"DIA_Sancho_Raven_12_15");	//Chcia�, �eby Quentin i jego ch�opcy pomogli im podczas najazdu na Woln� Kopalni�.
		AI_Output(self,other,"DIA_Sancho_Raven_12_06");	//Quentin odm�wi� udzielenia pomocy Staremu Obozowi, jako �e nie chcia� zdradzi� Nowego Obozu.
		AI_Output(self,other,"DIA_Sancho_Raven_12_07");	//Esteban by� za� innego zdania i usun�� Quentina ze swojej drogi.
		AI_Output(self,other,"DIA_Sancho_Raven_12_08");	//Teraz on i ten Magnat przesiaduj� w kotlinie i planuj� dalsze posuni�cia.
		AI_Output(self,other,"DIA_Sancho_Raven_12_09");	//Na twoim miejscu nie szed�bym dalej, pewnikiem obdarliby ci� ze sk�ry.
	};
};

