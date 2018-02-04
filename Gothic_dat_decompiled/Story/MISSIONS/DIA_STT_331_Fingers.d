
instance DIA_STT_331_Fingers_Exit(C_Info)
{
	npc = STT_331_Fingers;
	nr = 999;
	condition = DIA_STT_331_Fingers_Exit_Condition;
	information = DIA_STT_331_Fingers_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_STT_331_Fingers_Exit_Condition()
{
	return 1;
};

func void DIA_STT_331_Fingers_Exit_Info()
{
	AI_StopProcessInfos(self);
};


var int Fingers_CanTeach;

instance DIA_Fingers_BecomeShadow(C_Info)
{
	npc = STT_331_Fingers;
	nr = 2;
	condition = DIA_Fingers_BecomeShadow_Condition;
	information = DIA_Fingers_BecomeShadow_Info;
	permanent = 1;
	description = "Chc� zosta� Cieniem.";
};


func int DIA_Fingers_BecomeShadow_Condition()
{
	if((Fingers_CanTeach == FALSE) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void DIA_Fingers_BecomeShadow_Info()
{
	AI_Output(other,self,"DIA_Fingers_BecomeShadow_15_00");	//Chc� zosta� Cieniem.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_05_01");	//I co z tego?
	Info_ClearChoices(DIA_Fingers_BecomeShadow);
	Info_AddChoice(DIA_Fingers_BecomeShadow,DIALOG_BACK,DIA_Fingers_BecomeShadow_BACK);
	if(Npc_KnowsInfo(hero,Info_Diego_Teachers))
	{
		Info_AddChoice(DIA_Fingers_BecomeShadow,"Szukam kogo�, kto m�g�by mnie czego� nauczy�.",DIA_Fingers_BecomeShadow_TeachMe);
	};
	Info_AddChoice(DIA_Fingers_BecomeShadow,"Mo�esz mi pom�c?",DIA_Fingers_BecomeShadow_AnyTips);
};

func void DIA_Fingers_BecomeShadow_BACK()
{
	Info_ClearChoices(DIA_Fingers_BecomeShadow);
};

func void DIA_Fingers_BecomeShadow_AnyTips()
{
	AI_Output(other,self,"DIA_Fingers_BecomeShadow_AnyTips_15_00");	//Mo�esz mi pom�c?
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_AnyTips_05_01");	//Nie mam poj�cia jak to zrobi�...
};

func void DIA_Fingers_BecomeShadow_TeachMe()
{
	AI_Output(other,self,"DIA_Fingers_BecomeShadow_TeachMe_15_00");	//Szukam kogo�, kto m�g�by mnie czego� nauczy�.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_01");	//To dlaczego przyszed�e� do mnie?
	AI_Output(other,self,"DIA_Fingers_BecomeShadow_TeachMe_15_02");	//Przys�a� mnie Diego.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_03");	//Trzeba by�o m�wi� tak od razu.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_04");	//Je�li chcesz do��czy� do naszego obozu, powiniene� by� dobrym wojownikiem albo zr�cznym z�odziejem.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_05");	//Wp�ywowi ludzie z Obozu b�d� mieli dla ciebie r�ne zlecenia, podczas wykonywania kt�rych lepiej nie da� si� z�apa�.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_06");	//Dlatego na pocz�tek proponowa�bym ci szkolenie si� w fachu z�odziejskim.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_07");	//Zupe�nym przypadkiem, tak si� sk�ada, �e jestem najlepszym z�odziejem w ca�ym Starym Obozie.
	Fingers_CanTeach = TRUE;
	Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
	B_LogEntry(GE_TeacherOC,"R�czka mo�e mnie nauczy� otwierania zamk�w i kradzie�y kieszonkowej.");
	Info_ClearChoices(DIA_Fingers_BecomeShadow);
};


var int Fingers_Wherecavalorn;

instance DIA_Fingers_Lehrer(C_Info)
{
	npc = STT_331_Fingers;
	nr = 2;
	condition = DIA_Fingers_Lehrer_Condition;
	information = DIA_Fingers_Lehrer_Info;
	permanent = 1;
	description = "Czego mo�esz mnie nauczy�?";
};


func int DIA_Fingers_Lehrer_Condition()
{
	if(Fingers_CanTeach == TRUE)
	{
		return 1;
	};
};

func void DIA_Fingers_Lehrer_Info()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_15_00");	//Czego mo�esz mnie nauczy�?
	AI_Output(self,other,"DIA_Fingers_Lehrer_05_02");	//To zale�y tylko od tego, co chcia�by� wiedzie�.
	Info_ClearChoices(DIA_Fingers_Lehrer);
	Info_AddChoice(DIA_Fingers_Lehrer,DIALOG_BACK,DIA_Fingers_Lehrer_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 1)
	{
		Info_AddChoice(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2,LPCOST_TALENT_PICKPOCKET_2,0),DIA_Fingers_Lehrer_Pickpocket2);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 0)
	{
		Info_AddChoice(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1,LPCOST_TALENT_PICKPOCKET_1,0),DIA_Fingers_Lehrer_Pickpocket);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == 1)
	{
		Info_AddChoice(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2,LPCOST_TALENT_PICKLOCK_2,0),DIA_Fingers_Lehrer_Lockpick2);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == 0)
	{
		Info_AddChoice(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1,LPCOST_TALENT_PICKLOCK_1,0),DIA_Fingers_Lehrer_Lockpick);
	};
	Info_AddChoice(DIA_Fingers_Lehrer,"Chcia�bym umie� porusza� si� niepostrze�enie.",DIA_Fingers_Lehrer_Schleichen);
};

func void DIA_Fingers_Lehrer_Schleichen()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_Schleichen_15_00");	//Chcia�bym umie� porusza� si� niepostrze�enie.
	AI_Output(self,other,"DIA_Fingers_Lehrer_Schleichen_05_01");	//My�l� - bez �adnej fa�szywej skromno�ci - �e jestem jednym z najlepszych z�odziei zrzuconych do tej przekl�tej kolonii.
	AI_Output(self,other,"DIA_Fingers_Lehrer_Schleichen_05_02");	//Ale je�li chodzi o skradanie si�, powiniene� porozmawia� z Cavalornem.
	Fingers_Wherecavalorn = TRUE;
};

func void DIA_Fingers_Lehrer_Lockpick()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_Lockpick_15_00");	//Chcia�bym nauczy� si� otwiera� zamki.
	if(B_GiveSkill(other,NPC_TALENT_PICKLOCK,1,LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick_05_01");	//Nie w�tpi�! C�... Pocz�tki nie s� zbyt trudne.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick_05_02");	//Przede wszystkim musisz uwa�a�, �eby nie z�ama� wytrycha.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick_05_03");	//Musisz by� bardzo cierpliwy. Wtedy nie b�dziesz potrzebowa� tylu wytrych�w, he he!
	};
};

func void DIA_Fingers_Lehrer_Lockpick2()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_Lockpick2_15_00");	//Chcia�bym zosta� ekspertem w otwieraniu zamk�w.
	if(B_GiveSkill(other,NPC_TALENT_PICKLOCK,2,LPCOST_TALENT_PICKLOCK_2))
	{
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick2_05_01");	//Gdy nabierzesz ju� troch� do�wiadczenia, nauczysz si� rozpoznawa� d�wi�k, jaki wydaje wytrych zanim p�knie.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick2_05_02");	//My�l�, �e powiniene� sobie z tym poradzi�. Ws�uchaj si� uwa�nie w d�wi�ki jakie wydaje otwierany zamek, a nie b�dziesz potrzebowa� tylu wytrych�w, he, he!
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick2_05_03");	//Prawdziwy mistrz w tym fachu potrafi otworzy� ka�d� skrzyni� nie �ami�c ani jednego wytrycha.
	};
};

func void DIA_Fingers_Lehrer_Pickpocket()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_PICKPOCKET_15_00");	//Chcia�bym zosta� zr�cznym kieszonkowcem!
	if(Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == 1)
	{
		if(B_GiveSkill(other,NPC_TALENT_PICKPOCKET,1,LPCOST_TALENT_PICKPOCKET_1))
		{
			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_01");	//Chcia�by� odci��y� par� os�b z ich dobytku, co? No dobra.
			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_02");	//Poka�� ci na czym powiniene� si� skoncentrowa�, ale szanse, �e zostaniesz z�apany b�d� nadal znaczne.
			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_03");	//Podejmuj ryzyko wy��cznie je�li w pobli�u ofiary nie ma os�b trzecich.
			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_04");	//Tylko prawdziwy mistrz potrafi ukra�� co� pozostaj�c ca�kowicie niezauwa�onym!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Fingers_lehrer_Pickpocket_05_05");	//Nie ma o czym m�wi�! Nie b�dzie z ciebie z�odzieja, dop�ki nie nauczysz si� skrada�!
	};
};

func void DIA_Fingers_Lehrer_Pickpocket2()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_Pickpocket2_15_00");	//Chcia�bym zosta� mistrzem kieszonkowc�w!
	if(B_GiveSkill(other,NPC_TALENT_PICKPOCKET,2,LPCOST_TALENT_PICKPOCKET_2))
	{
		AI_Output(self,other,"DIA_Fingers_Lehrer_Pickpocket2_05_01");	//C�, chyba rzeczywi�cie potrafisz ju� wystarczaj�co du�o, �eby opanowa� zaawansowane sztuczki.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Pickpocket2_05_02");	//Ale musisz pami�ta�, �e nawet mistrzowie z�odziejscy od czasu do czasu zostaj� z�apani.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Pickpocket2_05_03");	//Uwa�aj na siebie.
	};
};

func void DIA_Fingers_Lehrer_BACK()
{
	Info_ClearChoices(DIA_Fingers_Lehrer);
};


instance DIA_Fingers_WhereCavalorn(C_Info)
{
	npc = STT_331_Fingers;
	nr = 2;
	condition = DIA_Fingers_WhereCavalorn_Condition;
	information = DIA_Fingers_WhereCavalorn_Info;
	permanent = 1;
	description = "Gdzie znajd� Cavalorna?";
};


func int DIA_Fingers_WhereCavalorn_Condition()
{
	if(Fingers_Wherecavalorn == TRUE)
	{
		return 1;
	};
};

func void DIA_Fingers_WhereCavalorn_Info()
{
	AI_Output(other,self,"DIA_Fingers_WhereCavalorn_15_00");	//Gdzie znajd� Cavalorna?
	AI_Output(self,other,"DIA_Fingers_WhereCavalorn_05_01");	//Poluje gdzie� poza Obozem. Pewnie znajdziesz go na drodze do Nowego Obozu. Na zach�d st�d jest taki kanion.
	AI_Output(self,other,"DIA_Fingers_WhereCavalorn_05_02");	//Tam znajdziesz opuszczon� chat� drwala. Cavalorn powinien kr�ci� si� w jej pobli�u.
	B_LogEntry(GE_TeacherOW,"Cavalorn mo�e mi pokaza�, jak nale�y si� skrada�. Jego chata znajduje si� w kanionie, na zach�d od Starego Obozu.");
};


var int Fingers_Learnt;

instance DIA_Fingers_Learnt(C_Info)
{
	npc = STT_331_Fingers;
	nr = 2;
	condition = DIA_Fingers_Learnt_Condition;
	information = DIA_Fingers_Learnt_Info;
	permanent = 1;
	description = "Nie m�g�by� wstawi� si� za mn� u Diego?";
};


func int DIA_Fingers_Learnt_Condition()
{
	if((Fingers_Learnt != LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void DIA_Fingers_Learnt_Info()
{
	AI_Output(other,self,"DIA_Fingers_Learnt_15_00");	//Nie m�g�by� wstawi� si� za mn� u Diego?
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) + Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) + Npc_GetTalentSkill(other,NPC_TALENT_SNEAK)) > 0)
	{
		AI_Output(self,other,"DIA_Fingers_Learnt_05_01");	//Czemu nie. Nauczy�e� si� czego�, co czyni ci� przydatnym dla Starego Obozu.
		AI_Output(self,other,"DIA_Fingers_Learnt_05_02");	//Zr�cznych z�odziei nigdy nie za wiele. Mo�esz na mnie liczy�.
		Fingers_Learnt = LOG_SUCCESS;
		B_GiveXP(XP_Fingerstrain);
		B_LogEntry(CH1_JoinOC,"R�czka jest bardzo zadowolony z post�p�w, kt�re poczyni�em.");
	}
	else
	{
		AI_Output(self,other,"DIA_Fingers_Learnt_05_03");	//To zale�y...
		AI_Output(self,other,"DIA_Fingers_Learnt_05_04");	//Je�li udowodnisz, �e nauczy�e� si� czego� w z�odziejskim fachu, uznam, �e b�dzie z ciebie jaki� po�ytek.
		AI_Output(other,self,"DIA_Fingers_Learnt_15_05");	//Jak mam to niby zrobi�?
		AI_Output(self,other,"DIA_Fingers_Learnt_05_06");	//Wyucz si� kt�rej� ze z�odziejskich umiej�tno�ci. Naucz si� skrada� niepostrze�enie, okrada� ludzi albo otwiera� zamki. Wtedy b�dziesz m�g� liczy� na m�j g�os.
		Fingers_Learnt = LOG_RUNNING;
		B_LogEntry(CH1_JoinOC,"R�czka wstawi si� za mn�, je�li wyucz� si� jakiej� z�odziejskiej umiej�tno�ci.");
	};
};


instance dia_fingers_hunosschwert(C_Info)
{
	npc = STT_331_Fingers;
	nr = 2;
	condition = dia_fingers_hunosschwert_condition;
	information = dia_fingers_hunosschwert_info;
	permanent = 0;
	description = "Co wiesz o mieczu Huno?";
};


func int dia_fingers_hunosschwert_condition()
{
	if(huno_swordsold == TRUE)
	{
		return 1;
	};
};

func void dia_fingers_hunosschwert_info()
{
	AI_Output(other,self,"DIA_Fingers_HunosSchwert_15_00");	//Co wiesz o mieczu Huno?
	AI_Output(self,other,"DIA_Fingers_HunosSchwert_05_01");	//A czemu w og�le mia�bym co� wiedzie�?
	AI_Output(other,self,"DIA_Fingers_HunosSchwert_05_02");	//Fisk mi o tobie wspomina�.
	AI_Output(self,other,"DIA_Fingers_HunosSchwert_05_03");	//No, skoro tak...
	AI_Output(self,other,"DIA_Fingers_HunosSchwert_05_04");	//Nie tak dawno obznajomi�em takiego jednego w otwieraniu zamk�w.
	AI_Output(self,other,"DIA_Fingers_HunosSchwert_05_05");	//Wnioskuj�, �e w�a�nie u niego m�g�by� znale�� to czego szukasz.
	AI_Output(self,other,"DIA_Fingers_HunosSchwert_05_06");	//Nazywa si� Jesse.
	AI_Output(other,self,"DIA_Fingers_HunosSchwert_05_07");	//Dzi�ki, trzymaj si�.
	B_LogEntry(CH1_HUNOLOSTSWORD,"R�czka powiedzia� mi, �e powinienem pogada� z Kopaczem imieniem Jesse. Pono� wie wi�cej na temat tego miecza.");
};


instance DIA_FINGERS_QUEST(C_Info)
{
	npc = STT_331_Fingers;
	nr = 2;
	condition = dia_fingers_quest_condition;
	information = dia_fingers_quest_info;
	permanent = 0;
	important = 1;
};


func int dia_fingers_quest_condition()
{
	if((Fingers_Learnt == LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_STT))
	{
		return 1;
	};
};

func void dia_fingers_quest_info()
{
	AI_Output(self,other,"DIA_Fingers_Quest_15_00");	//Widz�, �e ci si� uda�o i teraz jeste� jednym z Cieni. Dobra robota. Nie myli�em si� co do ciebie.
	AI_Output(self,other,"DIA_Fingers_Quest_15_01");	//I c�, w takim wypadku mia�bym nawet rob�tk� dla takiego dobrego z�odzieja.
	AI_Output(other,self,"DIA_Fingers_Quest_15_02");	//Mia�by� co� dla mnie? W czym rzecz?
	AI_Output(self,other,"DIA_Fingers_Quest_15_03");	//Chc�, by� uda� si� do Nowego Obozu. Znajdziesz tam cz�owieka, kt�rego zowi� Lares. To przyw�dca tamtejszych Szkodnik�w.
	AI_Output(self,other,"DIA_Fingers_Quest_15_04");	//Wiem, �e jest on w posiadaniu magicznego pier�cienia, kt�ry dodaje mu si�.
	AI_Output(self,other,"DIA_Fingers_Quest_15_05");	//W�a�nie z tego powodu chcia�bym, �eby� mu podiwani� ten pier�cie�. U mnie sprawdzi si� on zdecydowanie lepiej.
	AI_Output(self,other,"DIA_Fingers_Quest_15_06");	//Tylko pod �ADNYM pozorem nie daj si� z�apa�. Je�li Lares nakryje ci� na kradzie�y, pewnie zaraz podburzy przeciw tobie po�ow� obozu.
	AI_Output(self,other,"DIA_Fingers_Quest_15_07");	//Tak wi�c uwa�aj na siebie. Aczkolwiek jestem pewny, �e nie myl� si� co do twoich umiej�tno�ci. Zale�nie od tego, jak dobrze poradzisz sobie z t� spraw�, mo�e znajd� jeszcze dla ciebie co� do zrobienia.
	AI_Output(self,other,"DIA_Fingers_Quest_15_08");	//Ale p�ki co wypraw si� do Nowego Obozu. Twoje zadanie ju� na ciebie czeka.
	fingers_ring = LOG_RUNNING;
	Log_CreateTopic(CH1_FINGERSTHIEF,LOG_MISSION);
	Log_SetTopicStatus(CH1_FINGERSTHIEF,LOG_RUNNING);
	B_LogEntry(CH1_FINGERSTHIEF,"R�czka poprosi� mnie, bym odwiedzi� przyw�dc� Szkodnik�w z Nowego Obozu, niejakiego Laresa. Pono� jest w posiadaniu magicznego pier�cienia, kt�ry dodaje mu si�. R�czka chce, bym go sobie przyw�aszczy�.");
};


instance DIA_FINGERS_SUCCESS(C_Info)
{
	npc = STT_331_Fingers;
	nr = 1;
	condition = dia_fingers_success_condition;
	information = dia_fingers_success_info;
	permanent = 0;
	important = 0;
	description = "Mam przy sobie pier�cie� Laresa.";
};


func int dia_fingers_success_condition()
{
	if((fingers_ring == LOG_RUNNING) && (Npc_HasItems(other,Lares_Ring) >= 1))
	{
		return 1;
	};
};

func void dia_fingers_success_info()
{
	AI_Output(other,self,"DIA_Fingers_SUCCESS_15_00");	//Mam przy sobie pier�cie� Laresa.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_10");	//Naprawd�? Wiedzia�em, �e zwr�ci�em si� do w�a�ciwego cz�owieka!
	AI_Output(other,self,"DIA_Fingers_SUCCESS_15_20");	//Mianowicie?
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_30");	//Znowu chodzi o Szkodnika z Nowego Obozu.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_40");	//Facet nazywa si� Klin i jest jednym z najlepszych z�odziei w obozie.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_50");	//No, przynajmniej za takiego si� podaje.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_60");	//I c�, mog� nieco straci� swoj� reputacj�, dlatego dobrze by by�o, gdyby kto� zadba� o to, �eby Klin straci� swoj�.
	AI_Output(other,self,"DIA_Fingers_SUCCESS_15_70");	//I tutaj do gry wkraczam ja.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_80");	//Ot� to. W Nowym Obozie jest pewien cz�owiek, kt�rego wo�aj� Butch. M�wi si�, �e jest jednym z najpodlejszych Szkodnik�w.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_90");	//Wiem, �e jest w posiadaniu amuletu, na kt�rym widnieje jego imi�.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_11");	//Masz mu ten amulet zw�dzi�, a potem przemyci� do kieszeni Klina.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_12");	//Jak tylko Klin wejdzie w posiadanie tego amuletu, m�wisz o tym Butchowi.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_13");	//Ca�a reszta za�atwi si� sama.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_14");	//Z�odziej, kt�ry okrada swoich w�asnych sojusznik�w, nie ma co liczy� w przysz�o�ci na dobre imi�.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_15");	//Wr�� do mnie, kiedy tylko wykonasz zadanie.
	AI_StopProcessInfos(self);
	fingers_ring = LOG_SUCCESS;
	B_GiveXP(XP_FINGERSQUESTONE);
	Log_SetTopicStatus(CH1_FINGERSTHIEF,LOG_SUCCESS);
	B_LogEntry(CH1_FINGERSTHIEF,"Przynios�em R�czce jego po��dany pier�cie�. Wydawa� si� by� bardzo zadowolony i wynagrodzi� mnie w postaci kilku bry�ek rudy.");
	CreateInvItems(self,ItMiNugget,30);
	B_GiveInvItems(self,other,ItMiNugget,30);
	fingers_thief = LOG_RUNNING;
	Log_CreateTopic(CH1_THIEFS,LOG_MISSION);
	Log_SetTopicStatus(CH1_THIEFS,LOG_RUNNING);
	B_LogEntry(CH1_THIEFS,"R�czka poprosi� mnie, bym uda� si� do Nowego Obozu i odszuka� tam Szkodnika imieniem Klin. Mam za zadanie przemyci� amulet do jego kieszeni od niejakiego Butcha. Na koniec mam poinformowa� Butcha o tym w taki spos�b, by Klin dosta� porz�dn� nauczk�, a R�czka zachowa� swoj� reputacj�.");
};


instance DIA_FINGERS_BUTCH(C_Info)
{
	npc = STT_331_Fingers;
	nr = 1;
	condition = dia_fingers_butch_condition;
	information = dia_fingers_butch_info;
	permanent = 0;
	important = 0;
	description = "Klin ju� nigdy nie b�dzie okre�lany mistrzem...";
};


func int dia_fingers_butch_condition()
{
	if(Npc_KnowsInfo(hero,dia_butch_hey))
	{
		return 1;
	};
};

func void dia_fingers_butch_info()
{
	var int zufallsbelohnung;
	AI_Output(other,self,"DIA_Fingers_Butch_15_01");	//Co� mi si� zdaje, �e Klin ju� nigdy nie b�dzie okre�lany mistrzem z�odziejskiego fachu.
	AI_Output(self,other,"DIA_Fingers_Butch_15_02");	//Czyli podzia�a�o? Dobra robota. My�l�, �e tym razem zas�u�y�e� sobie na nieco poka�niejsz� nagrod�.
	AI_Output(self,other,"DIA_Fingers_Butch_15_03");	//Niemniej jednak nasza wsp�praca sko�czy si� dopiero, gdy Nowy Ob�z baczniej zwr�ci na nas uwag�.
	AI_Output(self,other,"DIA_Fingers_Butch_15_04");	//Kto wie, mo�e w przysz�o�ci znowu b�d� potrzebowa� twojej pomocy. Czas poka�e.
	AI_Output(other,self,"DIA_Fingers_Butch_15_05");	//Dzi�ki.
	AI_Output(self,other,"DIA_Fingers_Butch_15_06");	//I nie zapominaj - najlepsi Cienie wype�niaj� swoje zadania bez wzbudzania podejrze�, jak gdyby co� si� zmieni�o. Ukradkiem, cicho i w tajemnicy...
	AI_StopProcessInfos(self);
	B_GiveXP(XP_FINGERSQUESTTWO);
	zufallsbelohnung = Hlp_Random(100);
	if(zufallsbelohnung >= 75)
	{
		CreateInvItems(self,Schutzring_Waffen1,1);
		B_GiveInvItems(self,other,Schutzring_Waffen1,1);
	}
	else if(zufallsbelohnung >= 60)
	{
		CreateInvItems(self,Schutzring_Geschosse2,1);
		B_GiveInvItems(self,other,Schutzring_Geschosse2,1);
	}
	else if(zufallsbelohnung >= 50)
	{
		CreateInvItem(self,ItMi_Alchemy_Syrianoil_01);
		B_GiveInvItems(self,hero,ItMi_Alchemy_Syrianoil_01,1);
	}
	else if(zufallsbelohnung >= 40)
	{
		CreateInvItems(self,ItRw_Bow_Small_05,1);
		B_GiveInvItems(self,other,ItRw_Bow_Small_05,1);
	}
	else if(zufallsbelohnung >= 30)
	{
		CreateInvItems(self,ItMw_1H_Sword_04,1);
		B_GiveInvItems(self,other,ItMw_1H_Sword_04,1);
	}
	else if(zufallsbelohnung >= 20)
	{
		CreateInvItems(self,ItMiNugget,150);
		B_GiveInvItems(self,other,ItMiNugget,150);
	}
	else if(zufallsbelohnung >= 10)
	{
		CreateInvItem(self,ItFo_Potion_Dex_01);
		B_GiveInvItems(self,hero,ItFo_Potion_Dex_01,1);
	};
	fingers_thief = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_THIEFS,LOG_SUCCESS);
	B_LogEntry(CH1_THIEFS,"R�czka by� zachwycony z moich poczyna� i wr�czy� mi przyzwoit� nagrod�. Na koniec doda�, �e nasza wsp�praca zako�czy si� dopiero, kiedy Nowy Ob�z nabierze jakich� podejrze�.");
};

