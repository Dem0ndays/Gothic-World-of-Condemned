
instance DIA_Snaf_Exit(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 999;
	condition = DIA_Snaf_Exit_Condition;
	information = DIA_Snaf_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Snaf_Exit_Condition()
{
	return 1;
};

func void DIA_Snaf_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Snaf_Hello(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 2;
	condition = DIA_Snaf_Hello_Condition;
	information = DIA_Snaf_Hello_Info;
	permanent = 0;
	description = "Jak leci?";
};


func int DIA_Snaf_Hello_Condition()
{
	return 1;
};

func void DIA_Snaf_Hello_Info()
{
	AI_Output(other,self,"DIA_Snaf_Hello_15_00");	//Jak leci?
	AI_Output(self,other,"DIA_Snaf_Hello_01_01");	//Nienajgorzej! Cz³owiek, który umie dobrze gotowaæ, ma tutaj wielu przyjació³!
	AI_Output(self,other,"DIA_Snaf_Hello_01_02");	//Chcesz mo¿e trochê mojej ry¿owej zupy?
	AI_Output(other,self,"DIA_Snaf_Hello_15_03");	//Dziêki.
	AI_Output(self,other,"DIA_Snaf_Hello_01_04");	//Móg³byœ coœ dla mnie zrobiæ...
	CreateInvItem(self,ItFoRice);
	B_GiveInvItems(self,other,ItFoRice,1);
};


var int Snaf_Zutaten;
var int Snaf_FreeMBRagout;

instance DIA_Snaf_Zutaten(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 2;
	condition = DIA_Snaf_Zutaten_Condition;
	information = DIA_Snaf_Zutaten_Info;
	permanent = 0;
	description = "Co takiego?";
};


func int DIA_Snaf_Zutaten_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Snaf_Hello))
	{
		return 1;
	};
};

func void DIA_Snaf_Zutaten_Info()
{
	AI_Output(other,self,"DIA_Snaf_Zutaten_15_00");	//Co takiego?
	AI_Output(self,other,"DIA_Snaf_Zutaten_01_01");	//Za³o¿ê siê, ¿e lubisz sobie dobrze podjeœæ. Opracowa³em w³aœnie nowy przepis: potrawka z chrz¹szcza a la Snaf z ry¿em i grzybami.
	AI_Output(self,other,"DIA_Snaf_Zutaten_01_02");	//Dostaniesz ile tylko zechcesz, ale potrzebujê jeszcze 3 chrz¹szczy i parê piekielników - 5 powinno wystarczyæ.
	Info_ClearChoices(DIA_Snaf_Zutaten);
	Info_AddChoice(DIA_Snaf_Zutaten,"Chcesz, ¿ebym siê porzyga³?",DIA_Snaf_Zutaten_KOTZ);
	Info_AddChoice(DIA_Snaf_Zutaten,"Brzmi nieŸle.",DIA_Snaf_Zutaten_DoIt);
};

func void DIA_Snaf_Zutaten_KOTZ()
{
	AI_Output(other,self,"DIA_Snaf_Zutaten_KOTZ_15_00");	//Chcesz, ¿ebym siê porzyga³?
	AI_Output(self,other,"DIA_Snaf_Zutaten_KOTZ_01_01");	//Nie musisz tego jeœæ, ale powinieneœ przynajmniej spróbowaæ! Zreszt¹, zawsze mo¿esz to komuœ odsprzedaæ!
	AI_Output(self,other,"DIA_Snaf_Zutaten_KOTZ_01_02");	//Wys³a³em ju¿ kogoœ po sk³adniki, ale œlad po nim zagin¹³. Pewnie uciek³ do Nowego Obozu.
	Snaf_Zutaten = LOG_RUNNING;
	Log_CreateTopic(CH1_SnafsRecipe,LOG_MISSION);
	Log_SetTopicStatus(CH1_SnafsRecipe,LOG_RUNNING);
	B_LogEntry(CH1_SnafsRecipe,"Snaf, kucharz mieszkaj¹cy w Zewnêtrznym Pierœcieniu, wys³a³ mnie po 3 chrz¹szcze i 5 grzybów zwanych piekielnikami, których potrzebuje do swojego nowego przepisu.");
	Info_ClearChoices(DIA_Snaf_Zutaten);
};

func void DIA_Snaf_Zutaten_DoIt()
{
	AI_Output(other,self,"DIA_Snaf_Zutaten_DoIt_15_00");	//Brzmi nieŸle.
	AI_Output(self,other,"DIA_Snaf_Zutaten_DoIt_01_01");	//Zatem idŸ, i przynieœ mi potrzebne sk³adniki.
	AI_Output(self,other,"DIA_Snaf_Zutaten_DoIt_01_02");	//Poprzedni cz³owiek, którego wys³a³em nie wróci³. Zapewne uciek³ do Nowego Obozu.
	Snaf_Zutaten = LOG_RUNNING;
	Snaf_FreeMBRagout = TRUE;
	Log_CreateTopic(CH1_SnafsRecipe,LOG_MISSION);
	Log_SetTopicStatus(CH1_SnafsRecipe,LOG_RUNNING);
	B_LogEntry(CH1_SnafsRecipe,"Snaf, kucharz mieszkaj¹cy w Zewnêtrznym Pierœcieniu, wys³a³ mnie po 3 chrz¹szcze i 5 grzybów zwanych piekielnikami, których potrzebuje do swojego nowego przepisu. W nagrodê mogê liczyæ na darmowe porcje.");
	Info_ClearChoices(DIA_Snaf_Zutaten);
};


instance DIA_Snaf_ZutatenSuccess(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 2;
	condition = DIA_Snaf_ZutatenSuccess_Condition;
	information = DIA_Snaf_ZutatenSuccess_Info;
	permanent = 0;
	description = "Mam przy sobie rzeczy, o które prosi³eœ!";
};


func int DIA_Snaf_ZutatenSuccess_Condition()
{
	if((Snaf_Zutaten == LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_mushroom_01) >= 5) && (Npc_HasItems(other,ItAt_Meatbug_01) >= 3))
	{
		return 1;
	};
};

func void DIA_Snaf_ZutatenSuccess_Info()
{
	AI_Output(other,self,"DIA_Snaf_ZutatenSuccess_15_00");	//Mam przy sobie rzeczy, o które prosi³eœ!
	AI_Output(self,other,"DIA_Snaf_ZutatenSuccess_01_01");	//Œwietnie! Teraz muszê je tylko wrzuciæ i za chwilê potrawka bêdzie gotowa. Zaczekaj...
	CreateInvItems(other,ItFo_Plants_mushroom_01,3);
	B_GiveInvItems(other,self,ItFo_Plants_mushroom_01,5);
	Npc_RemoveInvItems(self,ItFo_Plants_mushroom_01,5);
	Npc_RemoveInvItems(other,ItAt_Meatbug_01,3);
	CreateInvItems(self,ItFoMeatbugragout,3);
	B_GiveInvItems(self,other,ItFoMeatbugragout,3);
	Snaf_Zutaten = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_SnafsRecipe,LOG_SUCCESS);
	B_LogEntry(CH1_SnafsRecipe,"Snaf ucieszy³ siê, gdy da³em mu sk³adniki, których szuka³.");
	if(Snaf_FreeMBRagout == TRUE)
	{
		B_LogEntry(CH1_SnafsRecipe,"Od tej pory bêdzie mi codziennie dawa³ darmow¹ porcjê swojej nowej potrawy.");
	};
	B_GiveXP(100);
	AI_StopProcessInfos(self);
};


var int Snaf_RagoutDay;

instance DIA_Snaf_AfterSuccess(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 2;
	condition = DIA_Snaf_AfterSuccess_Condition;
	information = DIA_Snaf_AfterSuccess_Info;
	permanent = 1;
	description = "Powiedzia³eœ, ¿e mogê dostaæ tyle potrawki ile tylko zapragnê...";
};


func int DIA_Snaf_AfterSuccess_Condition()
{
	if((Snaf_Zutaten == LOG_SUCCESS) && (Snaf_FreeMBRagout == TRUE))
	{
		return 1;
	};
};

func void DIA_Snaf_AfterSuccess_Info()
{
	AI_Output(other,self,"DIA_Snaf_AfterSuccess_15_00");	//Powiedzia³eœ, ¿e mogê dostaæ tyle potrawki ile tylko zapragnê...
	if(Snaf_RagoutDay != Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Snaf_AfterSuccess_01_01");	//I dotrzymam s³owa. Proszê, weŸ te 3 porcje.
		CreateInvItems(self,ItFoMeatbugragout,3);
		B_GiveInvItems(self,other,ItFoMeatbugragout,3);
		Snaf_RagoutDay = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Snaf_AfterSuccess_01_02");	//Jasne! Ale nic mi ju¿ dzisiaj nie zosta³o. Wróæ jutro!
	};
};


instance DIA_Snaf_WhereMeatbugs(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 3;
	condition = DIA_Snaf_WhereMeatbugs_Condition;
	information = DIA_Snaf_WhereMeatbugs_Info;
	permanent = 0;
	description = "Gdzie mogê znaleŸæ te chrz¹szcze?";
};


func int DIA_Snaf_WhereMeatbugs_Condition()
{
	if(Snaf_Zutaten == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Snaf_WhereMeatbugs_Info()
{
	AI_Output(other,self,"DIA_Snaf_WhereMeatbugs_15_00");	//Gdzie mogê znaleŸæ te chrz¹szcze?
	AI_Output(self,other,"DIA_Snaf_WhereMeatbugs_01_01");	//Wszêdzie, gdzie walaj¹ siê jakieœ odpady. Poszukaj w opuszczonych chatach przy zamkowych murach.
	AI_Output(self,other,"DIA_Snaf_WhereMeatbugs_01_02");	//Tylko niech ciê nie odstraszy ich paskudny wygl¹d. Po ugotowaniu s¹ ca³kiem smaczne.
	B_LogEntry(CH1_SnafsRecipe,"Chrz¹szcze znajdê w opuszczonych chatach, przy zamkowych murach.");
};


instance DIA_Snaf_WhereMushrooms(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 4;
	condition = DIA_Snaf_WhereMushrooms_Condition;
	information = DIA_Snaf_WhereMushrooms_Info;
	permanent = 0;
	description = "Gdzie znajdê te piekielniki?";
};


func int DIA_Snaf_WhereMushrooms_Condition()
{
	if(Snaf_Zutaten == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Snaf_WhereMushrooms_Info()
{
	AI_Output(other,self,"DIA_Snaf_WhereMushrooms_15_00");	//Gdzie znajdê te piekielniki?
	AI_Output(self,other,"DIA_Snaf_WhereMushrooms_01_01");	//WyjdŸ z Obozu przez po³udniow¹ bramê, to ta pod zawalon¹ wie¿¹. Znajdziesz siê na ³¹ce, na której rosn¹ grzyby.
	B_LogEntry(CH1_SnafsRecipe,"Piekielniki rosn¹ na ³¹ce, przy zawalonej wie¿y po³udniowej bramy.");
};


instance DIA_Snaf_WhereNek(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 5;
	condition = DIA_Snaf_WhereNek_Condition;
	information = DIA_Snaf_WhereNek_Info;
	permanent = 0;
	description = "Kim by³ cz³owiek, którego wys³a³eœ na poszukiwania przede mn¹?";
};


func int DIA_Snaf_WhereNek_Condition()
{
	if(Snaf_Zutaten == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Snaf_WhereNek_Info()
{
	AI_Output(other,self,"DIA_Snaf_WhereNek_15_00");	//Kim by³ cz³owiek, którego wys³a³eœ na poszukiwania przede mn¹?
	AI_Output(self,other,"DIA_Snaf_WhereNek_01_01");	//Nazywa³ siê Nek. Chyba nie czu³ siê tu zbyt dobrze. Podejrzewam, ¿e uciek³ do Nowego Obozu.
	AI_Output(self,other,"DIA_Snaf_WhereNek_01_02");	//Wys³a³em go po grzyby, ale nigdy nie wróci³...
	if((Sly_LostNek != LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		Log_CreateTopic(CH1_LostNek,LOG_MISSION);
		Log_SetTopicStatus(CH1_LostNek,LOG_RUNNING);
	};
	B_LogEntry(CH1_LostNek,"Snaf wys³a³ Neka na poszukiwanie grzybów.");
};


instance dia_snaf_teach(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 5;
	condition = dia_snaf_teach_condition;
	information = dia_snaf_teach_info;
	permanent = 0;
	description = "Móg³byœ nauczyæ mnie te¿ czegoœ o gotowaniu?";
};


func int dia_snaf_teach_condition()
{
	if(Snaf_Zutaten == LOG_SUCCESS)
	{
		return 1;
	};
};

func void dia_snaf_teach_info()
{
	AI_Output(other,self,"DIA_Snaf_teach_15_00");	//Móg³byœ nauczyæ mnie te¿ czegoœ o gotowaniu?
	AI_Output(self,other,"DIA_Snaf_teach_01_01");	//Zdradzê ci mój przepis na przygotowanie swoistej potrawki z chrz¹szcza.
	AI_Output(self,other,"DIA_Snaf_teach_01_02");	//B¹dŸ co b¹dŸ to ty za³atwi³eœ mi do niej potrzebne sk³adniki.
	Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
	B_LogEntry(GE_TeacherOC,"Kucharz Snaf, stacjonuj¹cy w Zewnêtrznym Pierœcieniu Starego Obozu, mo¿e mnie nauczyæ gotowaæ.");
};


instance DIA_SNAF_LEARN(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 3;
	condition = dia_snaf_learn_condition;
	information = dia_snaf_learn_info;
	permanent = 1;
	description = "Potrawka z chrz¹szcza (Koszt: 1 PN)";
};


func int dia_snaf_learn_condition()
{
	if((Snaf_Zutaten == LOG_SUCCESS) && Npc_KnowsInfo(hero,dia_snaf_teach) && (knows_meatbugragout == FALSE))
	{
		return 1;
	};
};

func void dia_snaf_learn_info()
{
	AI_Output(other,self,"DIA_Snaf_Learn_15_00");	//Naucz mnie, jak przyrz¹dziæ potrawkê z chrz¹szcza.
	if(hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output(self,other,"DIA_Snaf_Learn_12_01");	//Zaczynasz najpierw od zagotowania wody.
		AI_Output(self,other,"DIA_Snaf_Learn_12_02");	//Po zagotowaniu dodajesz do garnka piekielniki. Wa¿ne jest, by od tego momentu ca³y czas mieszaæ.
		AI_Output(self,other,"DIA_Snaf_Learn_12_03");	//Po jakimœ czasie dorzucasz jeszcze miêso chrz¹szcza. Trzeba je wrzucaæ do garnka zawsze po piekielnikach, bo po d³ugotrwa³ym gotowaniu zawsze szybko traci ono swój smak.
		AI_Output(self,other,"DIA_Snaf_Learn_12_04");	//Po zapachu poznasz, kiedy ju¿ bêdzie gotowe do spo¿ycia.
		Log_CreateTopic(GE_COOK,LOG_NOTE);
		B_LogEntry(GE_COOK,"Umiem ju¿ od teraz przyrz¹dziæ sobie potrawkê z chrz¹szcza.");
		B_LogEntry(GE_COOK,"Sk³adniki: 2x miêso chrz¹szcza oraz 4 piekielniki.");
		knows_meatbugragout = TRUE;
		PrintScreen("Nowa umiejêtnoœæ: Potrawka z chrz¹szcza",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Za ma³o punktów nauki!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

