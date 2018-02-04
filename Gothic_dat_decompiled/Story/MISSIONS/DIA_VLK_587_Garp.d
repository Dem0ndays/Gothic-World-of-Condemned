
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
	AI_Output(self,other,"Vlk_587_Garp_ORK_Info_01_02");	//Z³apali go nasi stra¿nicy. Od tej pory pracuje dla nas.
	AI_Output(other,self,"Vlk_587_Garp_ORK_Info_15_03");	//Przecie¿ nie jest nawet skuty ³añcuchami. Czemu po prostu nie ucieknie?
	AI_Output(self,other,"Vlk_587_Garp_ORK_Info_01_04");	//Raz spróbowa³. Stra¿nicy tak go urz¹dzili, ¿e nie móg³ siê ruszyæ przez parê tygodni. Od tej pory nigdy wiêcej siê nie buntowa³.
};


instance vlk_587_garp_schulden(C_Info)
{
	npc = VLK_587_Garp;
	nr = 2;
	condition = vlk_587_garp_schulden_condition;
	information = vlk_587_garp_schulden_info;
	important = 0;
	permanent = 0;
	description = "Przysy³a mnie twój kumpel.";
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
	AI_Output(other,self,"Vlk_587_Garp_Schulden_Info_15_01");	//Przysy³a mnie twój kumpel.
	AI_Output(self,other,"Vlk_587_Garp_Schulden_Info_01_02");	//I co w zwi¹zku z tym?
	AI_Output(other,self,"Vlk_587_Garp_Schulden_Info_15_03");	//Mówi³, ¿e jeszcze wisisz mu rudê i teraz chce j¹ odzyskaæ.
	AI_Output(self,other,"Vlk_587_Garp_Schulden_Info_01_04");	//Odda³bym mu jego rudê, gdybym tylko mia³ z czego. Jeden ze Stra¿ników mi j¹ zabra³, kiedy chcia³em wejœæ do kopalni.
	AI_Output(self,other,"Vlk_587_Garp_Schulden_Info_01_05");	//Twierdzi³, ¿e muszê mu jeszcze uiœciæ op³atê za przejœcie, jeœli chcê siê do niej dostaæ. I tak oto przyw³aszczy³ sobie ca³¹ moj¹ rudê.
	B_LogEntry(CH1_SCHULDEN,"Garp nie ma ju¿ rudy dla swojego kumpla. Musia³ j¹ wydaæ na op³atê za przejœcie do kopalni.");
};


instance vlk_587_garp_typ(C_Info)
{
	npc = VLK_587_Garp;
	nr = 2;
	condition = vlk_587_garp_typ_condition;
	information = vlk_587_garp_typ_info;
	important = 0;
	permanent = 0;
	description = "Co to za goœæ?";
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
	AI_Output(other,self,"Vlk_587_Garp_Typ_Info_15_01");	//Kim by³ ten goœæ, który ci zabra³ rudê?
	AI_Output(self,other,"Vlk_587_Garp_Typ_Info_01_02");	//Facet nazywa siê Garaz i jest jednym ze Stra¿ników Gomeza.
	AI_Output(self,other,"Vlk_587_Garp_Typ_Info_15_03");	//Przez ca³y dzieñ nie ma nic lepszego do roboty, jak tylko siê opitalaæ i zabieraæ rudê Kopaczom.
	AI_Output(self,other,"Vlk_587_Garp_Typ_Info_15_04");	//A jeœli chcesz siê mu postawiæ - zapomnij. To doœwiadczony wojownik i porz¹dnie by ci w buŸkê nastuka³.
	AI_Output(self,other,"Vlk_587_Garp_Typ_Info_15_05");	//Powinieneœ raczej postaraæ siê o klucz i zachapaæ sobie jego rzeczy ze skrzyni. Z tego co wiem, przechowuje je w swoim kufrze niedaleko ogniska.
	AI_Output(self,other,"Vlk_587_Garp_Typ_Info_17_06");	//Tylko czasem nie daj siê z³apaæ na tym, jak mu po skrzyni gmerasz, bo ciê ze skóry ogo³oci.
	AI_Output(self,other,"Vlk_587_Garp_Typ_Info_16_06");	//Pogadaj te¿ z Miguelem. Wprawdzie to tylko Cieñ i handluje zielskiem, ale w porz¹dku goœæ.
	AI_Output(self,other,"Vlk_587_Garp_Typ_Info_15_07");	//No, to powodzenia! Przyda ci siê.
	AI_StopProcessInfos(self);
	B_LogEntry(CH1_SCHULDEN,"Garaz, jeden ze Stra¿ników Gomeza, przyw³aszczy³ sobie rudê Garpa. Wygl¹da na to, ¿e bêdê musia³ siê do niego zwróciæ, jeœli chcê zdobyæ tê rudê. Garp twierdzi³, ¿e powinienem za³atwiæ sobie klucz do skrzyni Garaza, ¿ebym móg³ sobie tê rudê po prostu zabraæ.");
};


instance VLK_587_GARP_GARRET(C_Info)
{
	npc = VLK_587_Garp;
	condition = vlk_587_garp_garret_condition;
	information = vlk_587_garp_garret_info;
	important = 0;
	permanent = 0;
	description = "Wiesz coœ o cz³owieku imieniem Garret?";
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
	AI_Output(other,self,"Vlk_587_Garp_GARRET_Info_15_01");	//Wiesz coœ o cz³owieku imieniem Garret?
	AI_Output(self,other,"Vlk_587_Garp_GARRET_Info_15_02");	//A tak, pracowa³ razem z nami przez jakiœ czas na dole szybu.
	AI_Output(self,other,"Vlk_587_Garp_GARRET_Info_15_03");	//Ale ju¿ od d³u¿szego czasu go nie spotka³em.
	AI_Output(self,other,"Vlk_587_Garp_GARRET_Info_15_04");	//Ostatniego razu widzia³em go na krótko przed tym atakiem pe³zaczy. Od tego czasu ju¿ go tutaj nie by³o.
	AI_Output(self,other,"Vlk_587_Garp_GARRET_Info_15_05");	//Mia³ wrêcz paniczny strach przed tymi bestiami. Ca³kiem mo¿liwe, ¿e jedna z nich go po prostu ze¿ar³a.
	AI_Output(other,self,"Vlk_587_Garp_GARRET_Info_15_06");	//Dziêki, to by³o bardzo pomocne.
	AI_Output(self,other,"Vlk_587_Garp_GARRET_Info_15_07");	//Przykro mi, ale nie mam pojêcia, gdzie siê ten goœæ mo¿e ukrywaæ.
	B_LogEntry(CH1_LOSTDIGGER,"Garp nie by³ w stanie mi niestety pomóc w tej sprawie. Nie ma pojêcia, co siê mog³o staæ z Garretem.");
};

