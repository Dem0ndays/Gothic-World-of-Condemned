
instance Vlk_587_Garp_Exit(C_Info)
{
	npc = VLK_587_Garp;
	nr = 999;
	condition = Vlk_587_Garp_Exit_Condition;
	information = Vlk_587_Garp_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Vlk_587_Garp_Exit_Condition()
{
	return 1;
};

func void Vlk_587_Garp_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Vlk_587_Garp_ORK(C_Info)
{
	npc = VLK_587_Garp;
	nr = 1;
	condition = Vlk_587_Garp_ORK_Condition;
	information = Vlk_587_Garp_ORK_Info;
	important = 0;
	permanent = 0;
	description = "Co tu robi ten Ork?";
};


func int Vlk_587_Garp_ORK_Condition()
{
	return 1;
};

func void Vlk_587_Garp_ORK_Info()
{
	AI_Output(other,self,"Vlk_587_Garp_ORK_Info_15_01");	//Co tu robi ten Ork?
	AI_Output(self,other,"Vlk_587_Garp_ORK_Info_01_02");	//Z�apali go nasi stra�nicy. Od tej pory pracuje dla nas.
	AI_Output(other,self,"Vlk_587_Garp_ORK_Info_15_03");	//Przecie� nie jest nawet skuty �a�cuchami. Czemu po prostu nie ucieknie?
	AI_Output(self,other,"Vlk_587_Garp_ORK_Info_01_04");	//Raz spr�bowa�. Stra�nicy tak go urz�dzili, �e nie m�g� si� ruszy� przez par� tygodni. Od tej pory nigdy wi�cej si� nie buntowa�.
};


instance vlk_587_garp_schulden(C_Info)
{
	npc = VLK_587_Garp;
	nr = 2;
	condition = vlk_587_garp_schulden_condition;
	information = vlk_587_garp_schulden_info;
	important = 0;
	permanent = 0;
	description = "Przysy�a mnie tw�j kumpel.";
};


func int vlk_587_garp_schulden_condition()
{
	if(erz_schulden == LOG_RUNNING)
	{
		return 1;
	};
};

func void vlk_587_garp_schulden_info()
{
	AI_Output(other,self,"Vlk_587_Garp_Schulden_Info_15_01");	//Przysy�a mnie tw�j kumpel.
	AI_Output(self,other,"Vlk_587_Garp_Schulden_Info_01_02");	//I co w zwi�zku z tym?
	AI_Output(other,self,"Vlk_587_Garp_Schulden_Info_15_03");	//M�wi�, �e jeszcze wisisz mu rud� i teraz chce j� odzyska�.
	AI_Output(self,other,"Vlk_587_Garp_Schulden_Info_01_04");	//Odda�bym mu jego rud�, gdybym tylko mia� z czego. Jeden ze Stra�nik�w mi j� zabra�, kiedy chcia�em wej�� do kopalni.
	AI_Output(self,other,"Vlk_587_Garp_Schulden_Info_01_05");	//Twierdzi�, �e musz� mu jeszcze ui�ci� op�at� za przej�cie, je�li chc� si� do niej dosta�. I tak oto przyw�aszczy� sobie ca�� moj� rud�.
	B_LogEntry(CH1_SCHULDEN,"Garp nie ma ju� rudy dla swojego kumpla. Musia� j� wyda� na op�at� za przej�cie do kopalni.");
};


instance vlk_587_garp_typ(C_Info)
{
	npc = VLK_587_Garp;
	nr = 2;
	condition = vlk_587_garp_typ_condition;
	information = vlk_587_garp_typ_info;
	important = 0;
	permanent = 0;
	description = "Co to za go��?";
};


func int vlk_587_garp_typ_condition()
{
	if((erz_schulden == LOG_RUNNING) && Npc_KnowsInfo(hero,vlk_587_garp_schulden))
	{
		return 1;
	};
};

func void vlk_587_garp_typ_info()
{
	AI_Output(other,self,"Vlk_587_Garp_Typ_Info_15_01");	//Kim by� ten go��, kt�ry ci zabra� rud�?
	AI_Output(self,other,"Vlk_587_Garp_Typ_Info_01_02");	//Facet nazywa si� Garaz i jest jednym ze Stra�nik�w Gomeza.
	AI_Output(self,other,"Vlk_587_Garp_Typ_Info_15_03");	//Przez ca�y dzie� nie ma nic lepszego do roboty, jak tylko si� opitala� i zabiera� rud� Kopaczom.
	AI_Output(self,other,"Vlk_587_Garp_Typ_Info_15_04");	//A je�li chcesz si� mu postawi� - zapomnij. To do�wiadczony wojownik i porz�dnie by ci w bu�k� nastuka�.
	AI_Output(self,other,"Vlk_587_Garp_Typ_Info_15_05");	//Powiniene� raczej postara� si� o klucz i zachapa� sobie jego rzeczy ze skrzyni. Z tego co wiem, przechowuje je w swoim kufrze niedaleko ogniska.
	AI_Output(self,other,"Vlk_587_Garp_Typ_Info_17_06");	//Tylko czasem nie daj si� z�apa� na tym, jak mu po skrzyni gmerasz, bo ci� ze sk�ry ogo�oci.
	AI_Output(self,other,"Vlk_587_Garp_Typ_Info_16_06");	//Pogadaj te� z Miguelem. Wprawdzie to tylko Cie� i handluje zielskiem, ale w porz�dku go��.
	AI_Output(self,other,"Vlk_587_Garp_Typ_Info_15_07");	//No, to powodzenia! Przyda ci si�.
	AI_StopProcessInfos(self);
	B_LogEntry(CH1_SCHULDEN,"Garaz, jeden ze Stra�nik�w Gomeza, przyw�aszczy� sobie rud� Garpa. Wygl�da na to, �e b�d� musia� si� do niego zwr�ci�, je�li chc� zdoby� t� rud�. Garp twierdzi�, �e powinienem za�atwi� sobie klucz do skrzyni Garaza, �ebym m�g� sobie t� rud� po prostu zabra�.");
};


instance VLK_587_GARP_GARRET(C_Info)
{
	npc = VLK_587_Garp;
	condition = vlk_587_garp_garret_condition;
	information = vlk_587_garp_garret_info;
	important = 0;
	permanent = 0;
	description = "Wiesz co� o cz�owieku imieniem Garret?";
};


func int vlk_587_garp_garret_condition()
{
	if(lost_digger == LOG_RUNNING)
	{
		return 1;
	};
};

func void vlk_587_garp_garret_info()
{
	AI_Output(other,self,"Vlk_587_Garp_GARRET_Info_15_01");	//Wiesz co� o cz�owieku imieniem Garret?
	AI_Output(self,other,"Vlk_587_Garp_GARRET_Info_15_02");	//A tak, pracowa� razem z nami przez jaki� czas na dole szybu.
	AI_Output(self,other,"Vlk_587_Garp_GARRET_Info_15_03");	//Ale ju� od d�u�szego czasu go nie spotka�em.
	AI_Output(self,other,"Vlk_587_Garp_GARRET_Info_15_04");	//Ostatniego razu widzia�em go na kr�tko przed tym atakiem pe�zaczy. Od tego czasu ju� go tutaj nie by�o.
	AI_Output(self,other,"Vlk_587_Garp_GARRET_Info_15_05");	//Mia� wr�cz paniczny strach przed tymi bestiami. Ca�kiem mo�liwe, �e jedna z nich go po prostu ze�ar�a.
	AI_Output(other,self,"Vlk_587_Garp_GARRET_Info_15_06");	//Dzi�ki, to by�o bardzo pomocne.
	AI_Output(self,other,"Vlk_587_Garp_GARRET_Info_15_07");	//Przykro mi, ale nie mam poj�cia, gdzie si� ten go�� mo�e ukrywa�.
	B_LogEntry(CH1_LOSTDIGGER,"Garp nie by� w stanie mi niestety pom�c w tej sprawie. Nie ma poj�cia, co si� mog�o sta� z Garretem.");
};

