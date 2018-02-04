
instance DIA_Silas_EXIT(C_Info)
{
	npc = ORG_841_Silas;
	nr = 999;
	condition = DIA_Silas_EXIT_Condition;
	information = DIA_Silas_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Silas_EXIT_Condition()
{
	return 1;
};

func void DIA_Silas_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Silas_Hehler(C_Info)
{
	npc = ORG_841_Silas;
	nr = 1;
	condition = DIA_Silas_Hehler_Condition;
	information = DIA_Silas_Hehler_Info;
	permanent = 0;
	description = "Jak leci?";
};


func int DIA_Silas_Hehler_Condition()
{
	return 1;
};

func void DIA_Silas_Hehler_Info()
{
	AI_Output(other,self,"DIA_Silas_Hehler_15_00");	//Jak leci?
	AI_Output(self,other,"DIA_Silas_Hehler_06_01");	//�wietnie! Sprzedajemy tu nasz� ry��wk� za par� bry�ek rudy.
	AI_Output(self,other,"DIA_Silas_Hehler_06_02");	//Da si� z tego wy�y�. W ko�cu co innego mog� ch�opcy zrobi� z ci�ko zarobion� rud�?
};


instance DIA_Silas_Trade(C_Info)
{
	npc = ORG_841_Silas;
	nr = 1;
	condition = DIA_Silas_Trade_Condition;
	information = DIA_Silas_Trade_Info;
	permanent = 1;
	description = "Chc� si� napi�.";
	trade = 1;
};


func int DIA_Silas_Trade_Condition()
{
	return 1;
};

func void DIA_Silas_Trade_Info()
{
	AI_Output(other,self,"DIA_Silas_Trade_15_00");	//Chc� si� napi�.
	AI_Output(self,other,"DIA_Silas_Trade_06_01");	//Nie ma nic za darmo.
};


instance dia_silas_quest(C_Info)
{
	npc = ORG_841_Silas;
	nr = 1;
	condition = dia_silas_quest_condition;
	information = dia_silas_quest_info;
	permanent = 0;
	description = "Potrzebujesz pomocy?";
};


func int dia_silas_quest_condition()
{
	return 1;
};

func void dia_silas_quest_info()
{
	AI_Output(other,self,"DIA_Silas_Quest_15_00");	//Potrzebujesz pomocy?
	AI_Output(self,other,"DIA_Silas_Quest_06_01");	//Paru ch�opak�w donios�o mi, �e siepacze Gomeza maj� na sk�adzie naprawd� dobre piwo.
	AI_Output(self,other,"DIA_Silas_Quest_06_02");	//"Mocne piwo", z tego co mi wiadomo.
	AI_Output(self,other,"DIA_Silas_Quest_06_03");	//Wprawdzie niez�y mam zysk z tej ry��wki, ale gdybym mia� to piwo, m�g�bym je sprzedawa� za podw�jn� cen�.
	AI_Output(self,other,"DIA_Silas_Quest_06_04");	//A z tego co wiem, masz niez�e kontakty w Starym Obozie, tak �e miej uszy otwarte i postaraj si� za�atwi� kilka butelek.
	AI_Output(self,other,"DIA_Silas_Quest_06_05");	//Oczywi�cie zap�ac� ci za fatyg�.
	silas_beer = LOG_RUNNING;
	Log_CreateTopic(CH1_SILAS,LOG_MISSION);
	Log_SetTopicStatus(CH1_SILAS,LOG_RUNNING);
	B_LogEntry(CH1_SILAS,"Silas, gospodarz knajpy w Nowym Obozie, da� mi za zadanie zdobycie skrzynki mocnego piwa. Twierdzi, �e w Starym Obozie m�g�bym si� pokusi� o jej znalezienie.");
};


instance DIA_SILAS_BEER(C_Info)
{
	npc = ORG_841_Silas;
	nr = 1;
	condition = dia_silas_beer_condition;
	information = dia_silas_beer_info;
	permanent = 1;
	description = "Masz tu mocne piwo.";
};


func int dia_silas_beer_condition()
{
	if(Npc_KnowsInfo(hero,dia_silas_quest) && (silas_beer == LOG_RUNNING))
	{
		return 1;
	};
};

func void dia_silas_beer_info()
{
	AI_Output(other,self,"DIA_Silas_Beer_15_00");	//Masz tu mocne piwo.
	AI_Output(self,other,"DIA_Silas_Beer_15_01");	//No, poka�. Ju� jestem ciekaw.
	if(Npc_HasItems(other,ItFo_OM_Beer_01) >= 6)
	{
		AI_Output(self,other,"DIA_Silas_Beer_15_02");	//Dobra robota. Wreszcie ch�opcy b�d� mogli spr�bowa� czego� porz�dnego.
		B_GiveInvItems(hero,self,ItFo_OM_Beer_01,6);
		silas_beer = LOG_SUCCESS;
		Log_CreateTopic(CH1_SILAS,LOG_MISSION);
		Log_SetTopicStatus(CH1_SILAS,LOG_SUCCESS);
		B_LogEntry(CH1_SILAS,"Za�atwi�em Silasowi skrzynk� piwa i by� usatysfakcjonowany z mojej pracy. Dosta�em od niego nagrod� w postaci rudy.");
		B_GiveXP(XP_SILAS);
	}
	else
	{
		AI_Output(self,other,"DIA_Silas_Beer_15_04");	//Hmm... jeszcze kilka butelek i powinno by� w porz�dku.
		AI_Output(self,other,"DIA_Silas_Beer_15_05");	//Przyjd� do mnie z powrotem z przynajmniej 6 butelkami.
	};
};

