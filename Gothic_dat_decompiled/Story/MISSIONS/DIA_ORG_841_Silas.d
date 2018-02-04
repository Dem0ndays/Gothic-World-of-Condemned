
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
	AI_Output(self,other,"DIA_Silas_Hehler_06_01");	//Œwietnie! Sprzedajemy tu nasz¹ ry¿ówkê za parê bry³ek rudy.
	AI_Output(self,other,"DIA_Silas_Hehler_06_02");	//Da siê z tego wy¿yæ. W koñcu co innego mog¹ ch³opcy zrobiæ z ciê¿ko zarobion¹ rud¹?
};


instance DIA_Silas_Trade(C_Info)
{
	npc = ORG_841_Silas;
	nr = 1;
	condition = DIA_Silas_Trade_Condition;
	information = DIA_Silas_Trade_Info;
	permanent = 1;
	description = "Chcê siê napiæ.";
	trade = 1;
};


func int DIA_Silas_Trade_Condition()
{
	return 1;
};

func void DIA_Silas_Trade_Info()
{
	AI_Output(other,self,"DIA_Silas_Trade_15_00");	//Chcê siê napiæ.
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
	AI_Output(self,other,"DIA_Silas_Quest_06_01");	//Paru ch³opaków donios³o mi, ¿e siepacze Gomeza maj¹ na sk³adzie naprawdê dobre piwo.
	AI_Output(self,other,"DIA_Silas_Quest_06_02");	//"Mocne piwo", z tego co mi wiadomo.
	AI_Output(self,other,"DIA_Silas_Quest_06_03");	//Wprawdzie niez³y mam zysk z tej ry¿ówki, ale gdybym mia³ to piwo, móg³bym je sprzedawaæ za podwójn¹ cenê.
	AI_Output(self,other,"DIA_Silas_Quest_06_04");	//A z tego co wiem, masz niez³e kontakty w Starym Obozie, tak ¿e miej uszy otwarte i postaraj siê za³atwiæ kilka butelek.
	AI_Output(self,other,"DIA_Silas_Quest_06_05");	//Oczywiœcie zap³acê ci za fatygê.
	silas_beer = LOG_RUNNING;
	Log_CreateTopic(CH1_SILAS,LOG_MISSION);
	Log_SetTopicStatus(CH1_SILAS,LOG_RUNNING);
	B_LogEntry(CH1_SILAS,"Silas, gospodarz knajpy w Nowym Obozie, da³ mi za zadanie zdobycie skrzynki mocnego piwa. Twierdzi, ¿e w Starym Obozie móg³bym siê pokusiæ o jej znalezienie.");
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
	AI_Output(self,other,"DIA_Silas_Beer_15_01");	//No, poka¿. Ju¿ jestem ciekaw.
	if(Npc_HasItems(other,ItFo_OM_Beer_01) >= 6)
	{
		AI_Output(self,other,"DIA_Silas_Beer_15_02");	//Dobra robota. Wreszcie ch³opcy bêd¹ mogli spróbowaæ czegoœ porz¹dnego.
		B_GiveInvItems(hero,self,ItFo_OM_Beer_01,6);
		silas_beer = LOG_SUCCESS;
		Log_CreateTopic(CH1_SILAS,LOG_MISSION);
		Log_SetTopicStatus(CH1_SILAS,LOG_SUCCESS);
		B_LogEntry(CH1_SILAS,"Za³atwi³em Silasowi skrzynkê piwa i by³ usatysfakcjonowany z mojej pracy. Dosta³em od niego nagrodê w postaci rudy.");
		B_GiveXP(XP_SILAS);
	}
	else
	{
		AI_Output(self,other,"DIA_Silas_Beer_15_04");	//Hmm... jeszcze kilka butelek i powinno byæ w porz¹dku.
		AI_Output(self,other,"DIA_Silas_Beer_15_05");	//PrzyjdŸ do mnie z powrotem z przynajmniej 6 butelkami.
	};
};

