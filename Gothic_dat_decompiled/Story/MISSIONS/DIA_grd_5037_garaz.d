
instance INFO_GRD_5037_GARAZ_EXIT(C_Info)
{
	npc = grd_5037_garaz;
	nr = 999;
	condition = info_grd_5037_garaz_exit_condition;
	information = info_grd_5037_garaz_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_grd_5037_garaz_exit_condition()
{
	return 1;
};

func void info_grd_5037_garaz_exit_info()
{
	AI_StopProcessInfos(self);
};


instance info_grd_5037_garaz_siehtsaus(C_Info)
{
	npc = grd_5037_garaz;
	nr = 1;
	condition = info_grd_5037_garaz_siehtsaus_condition;
	information = info_grd_5037_garaz_siehtsaus_info;
	permanent = 0;
	description = "Jak si� maj� sprawy?";
};


func int info_grd_5037_garaz_siehtsaus_condition()
{
	return 1;
};

func void info_grd_5037_garaz_siehtsaus_info()
{
	AI_Output(other,self,"Info_Grd_5037_Garaz_SiehtsAus_15_00");	//Jak si� maj� sprawy?
	AI_Output(self,other,"Info_Grd_5037_Garaz_SiehtsAus_06_01");	//A nie wida�? Stercz� tutaj ca�ymi dniami, podczas gdy reszta ch�opak�w rozkoszuje si� �yciem w zamku!
	AI_Output(self,other,"Info_Grd_5037_Garaz_SiehtsAus_05_02");	//Potrzebny jest kto�, kto zatroszczy si� o zapasy Starej Kopalni, m�wili. Garaz, jeste� naszym druhem, m�wili.
	AI_Output(self,other,"Info_Grd_5037_Garaz_SiehtsAus_07_02");	//Za ka�dym razem brudna robota spada na mnie.
	AI_Output(self,other,"Info_Grd_5037_Garaz_SiehtsAus_06_03");	//TAK to w�a�nie wygl�da.
};


instance info_grd_5037_garaz_truhe(C_Info)
{
	npc = grd_5037_garaz;
	nr = 1;
	condition = info_grd_5037_garaz_truhe_condition;
	information = info_grd_5037_garaz_truhe_info;
	permanent = 0;
	description = "Co to za skrzynie za tob�?";
};


func int info_grd_5037_garaz_truhe_condition()
{
	if(Npc_KnowsInfo(hero,info_grd_5037_garaz_siehtsaus))
	{
		return 1;
	};
};

func void info_grd_5037_garaz_truhe_info()
{
	AI_Output(other,self,"Info_Grd_5037_Garaz_Truhe_15_00");	//Co to za skrzynie za tob�?
	AI_Output(self,other,"Info_Grd_5037_Garaz_Truhe_06_01");	//O co ci za� chodzi?
	AI_Output(other,self,"Info_Grd_5037_Garaz_Truhe_06_02");	//No... co jest w �rodku?
	AI_Output(self,other,"Info_Grd_5037_Garaz_Truhe_06_03");	//Nawet o tym nie my�l, ch�opcze!
};


var int garaz_bier;

instance INFO_GRD_5037_GARAZ_AUSGEBEN(C_Info)
{
	npc = grd_5037_garaz;
	nr = 1;
	condition = info_grd_5037_garaz_ausgeben_condition;
	information = info_grd_5037_garaz_ausgeben_info;
	permanent = 1;
	description = "Prosz�, strzel sobie browara, ja stawiam.";
};


func int info_grd_5037_garaz_ausgeben_condition()
{
	if(Npc_KnowsInfo(hero,info_grd_5037_garaz_truhe) && (garaz_bier == FALSE))
	{
		return 1;
	};
};

func void info_grd_5037_garaz_ausgeben_info()
{
	if(Npc_HasItems(other,ItFoBeer) > 0)
	{
		B_GiveInvItems(other,self,ItFoBeer,1);
		AI_Output(other,self,"Grd_5037_Garaz_ausgeben_15_00");	//Prosz�, strzel sobie browara, ja stawiam.
		AI_UseItem(self,ItFoBeer);
		AI_Output(self,other,"Grd_5037_Garaz_ausgeben_06_01");	//Tego w�a�nie by�o mi trzeba. Takie ci�g�e stanie potrafi nie�le zasuszy� gard�o, m�wi� ci.
		AI_Output(other,self,"Grd_5037_Garaz_ausgeben_06_02");	//Chcia�e� mi powiedzie�, co jest w skrzyniach.
		AI_Output(self,other,"Grd_5037_Garaz_ausgeben_06_03");	//A tak, to tylko zapasy, kt�re dotar�y tu razem z konwojem i s� przeznaczone dla Stra�nik�w w obozie, jak i w kopalni.
		AI_Output(self,other,"Grd_5037_Garaz_ausgeben_06_04");	//To wszystko, co mam ci do powiedzenia.
		garaz_bier = TRUE;
	}
	else
	{
		AI_Output(other,self,"Grd_5037_Garaz_ausgeben_KEIN_BIER_15_00");	//Prosz�, strzel sobie browara, ja stawiam.
		AI_Output(self,other,"Grd_5037_Garaz_ausgeben_KEIN_BIER_06_01");	//�e co? Nie widz� tu �adnego browara.
		AI_Output(self,other,"Grd_5037_Garaz_ausgeben_KEIN_BIER_06_02");	//Postaraj si� o nie, to potem si� zobaczy.
	};
};


instance info_grd_5037_garaz_tax(C_Info)
{
	npc = grd_5037_garaz;
	nr = 1;
	condition = info_grd_5037_garaz_tax_condition;
	information = info_grd_5037_garaz_tax_info;
	permanent = 0;
	description = "Zbierasz myto od Kopaczy?";
};


func int info_grd_5037_garaz_tax_condition()
{
	if((erz_schulden == LOG_RUNNING) && Npc_KnowsInfo(hero,vlk_587_garp_typ))
	{
		return 1;
	};
};

func void info_grd_5037_garaz_tax_info()
{
	AI_Output(other,self,"Info_Grd_5037_Garaz_Tax_15_00");	//S�ysza�em, �e zbierasz op�at� za przej�cie od Kopaczy.
	AI_Output(self,other,"Info_Grd_5037_Garaz_Tax_06_01");	//Mo�e, tylko nie bardzo wiem co ci� to obchodzi.
	AI_Output(self,other,"Info_Grd_5037_Garaz_Tax_07_02");	//Nie r�b sobie �adnych nadziei. I tak tej rudy nie mam przy sobie. Le�y w mojej skrzyni, a bez klucza nic nie wsk�rasz.
	AI_Output(self,other,"Info_Grd_5037_Garaz_Tax_06_03");	//Zawsze trzymam go ze sob�, hehe.
	B_LogEntry(CH1_SCHULDEN,"Wygl�da na to, �e b�d� musia� nieco pog��wkowa� jak tu zdoby� klucz od Garaza, �eby m�c otworzy� jego skrzyni�. Mo�e powinienem uci�� sobie pogaw�dk� z Miguelem, tak jak wspomina� Garp.");
};


var int garaz_wein;

instance INFO_GRD_5037_GARAZ_WEINAUSGEBEN(C_Info)
{
	npc = grd_5037_garaz;
	nr = 1;
	condition = info_grd_5037_garaz_weinausgeben_condition;
	information = info_grd_5037_garaz_weinausgeben_info;
	permanent = 1;
	description = "Co by� powiedzia� na troch� winka?";
};


func int info_grd_5037_garaz_weinausgeben_condition()
{
	if(Npc_KnowsInfo(hero,stt_5036_miguel_garaz) && (garaz_wein == FALSE))
	{
		return 1;
	};
};

func void info_grd_5037_garaz_weinausgeben_info()
{
	if(Npc_HasItems(other,ItFoWine) > 0)
	{
		B_GiveInvItems(other,self,ItFoWine,1);
		AI_Output(other,self,"Grd_5037_Garaz_WeinAusgeben_15_00");	//Co by� powiedzia� na troch� winka?
		AI_UseItem(self,ItFoWine);
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_DRUNKEN.MDS",Time_Haste3);
		AI_Output(self,other,"Grd_5037_Garaz_WeinAusgeben_06_01");	//Niess�a rzeszz, braacie.
		AI_Output(self,other,"Grd_5037_Garaz_WeinAusgeben_06_02");	//Chyyba jestem sii so� winien.
		AI_Output(other,self,"Grd_5037_Garaz_WeinAusgeben_06_03");	//Chcia�bym sobie na chwil� po�yczy� tw�j klucz.
		AI_Output(self,other,"Grd_5037_Garaz_WeinAusgeben_06_04");	//Alesz oczywii�cie. Prosz�, bier go spokojnie. Mii tam on niee jess potrzebnyy.
		B_GiveInvItems(self,other,itke_omcamp_01,1);
		B_LogEntry(CH1_SCHULDEN,"Podzia�a�o - Garaz da� mi sw�j klucz, kt�rego potrzebuj� do otwarcia jego skrzyni. Nareszcie b�d� mia� rud� dla tego Kopacza.");
		garaz_wein = TRUE;
	}
	else
	{
		AI_Output(other,self,"Grd_5037_Garaz_ausgeben_KEIN_WeinAusgeben_15_00");	//Co by� powiedzia� na troch� winka?
		AI_Output(self,other,"Grd_5037_Garaz_ausgeben_KEIN_WeinAusgeben_06_01");	//To mo�e pierw jakie� za�atw, zanim usi�ujesz si� ze mnie podkpiwa�.
	};
};

