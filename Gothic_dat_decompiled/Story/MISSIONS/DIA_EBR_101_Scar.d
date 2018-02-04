
instance DIA_SCAR_EXIT(C_Info)
{
	npc = EBR_101_Scar;
	nr = 999;
	condition = DIA_SCAR_EXIT_Condition;
	information = DIA_SCAR_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_SCAR_EXIT_Condition()
{
	return 1;
};

func void DIA_SCAR_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SCAR_Hello(C_Info)
{
	npc = EBR_101_Scar;
	nr = 3;
	condition = DIA_SCAR_Hello_Condition;
	information = DIA_SCAR_Hello_Info;
	permanent = 0;
	description = "Kim jeste�?";
};


func int DIA_SCAR_Hello_Condition()
{
	return 1;
};

func void DIA_SCAR_Hello_Info()
{
	AI_Output(other,self,"DIA_SCAR_Hello_15_00");	//Kim jeste�?
	AI_Output(self,other,"DIA_SCAR_Hello_08_01");	//M�wi� na mnie Blizna.
};


instance DIA_SCAR_What(C_Info)
{
	npc = EBR_101_Scar;
	nr = 3;
	condition = DIA_SCAR_What_Condition;
	information = DIA_SCAR_What_Info;
	permanent = 0;
	description = "Czym si� zajmujesz?";
};


func int DIA_SCAR_What_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_SCAR_Hello))
	{
		return 1;
	};
};

func void DIA_SCAR_What_Info()
{
	AI_Output(other,self,"DIA_SCAR_What_15_00");	//Czym si� zajmujesz?
	AI_Output(self,other,"DIA_SCAR_What_08_01");	//Ja i Arto zapewniamy Gomezowi spok�j przed nieproszonymi go��mi.
	AI_Output(self,other,"DIA_SCAR_What_08_02");	//Opr�cz tego, do moich obowi�zk�w nale�y poskramianie co zadziorniejszych kobiet.
};


instance DIA_SCAR_Frau(C_Info)
{
	npc = EBR_101_Scar;
	nr = 3;
	condition = DIA_SCAR_Frau_Condition;
	information = DIA_SCAR_Frau_Info;
	permanent = 0;
	description = "Kiedy mnie tu zrzucano, widzia�em kobiet� opuszczan� na d�.";
};


func int DIA_SCAR_Frau_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_SCAR_What))
	{
		return 1;
	};
};

func void DIA_SCAR_Frau_Info()
{
	AI_Output(other,self,"DIA_SCAR_Frau_15_00");	//Kiedy mnie tu zrzucano, widzia�em kobiet� opuszczan� na d� wraz z �adunkiem.
	AI_Output(self,other,"DIA_SCAR_Frau_08_01");	//I co z tego?
	AI_Output(other,self,"DIA_SCAR_Frau_15_02");	//Jest tutaj?
	AI_Output(self,other,"DIA_SCAR_Frau_08_03");	//S�uchaj, je�li wi��esz z ni� jakie� nadzieje, dam ci dobr� rad�: Zapomnij o niej.
	AI_Output(self,other,"DIA_SCAR_Frau_08_04");	//Dopiero co j� dostarczono i Gomez kaza� j� zamkn�� w swojej komnacie.
	AI_Output(self,other,"DIA_SCAR_Frau_08_05");	//Jak ju� mu si� znudzi, mo�e przy�le j� tu, na d�. Ale p�ki co, ona nale�y DO NIEGO, wi�c lepiej nie zawracaj sobie ni� g�owy.
};


instance DIA_SCAR_PERM(C_Info)
{
	npc = EBR_101_Scar;
	nr = 3;
	condition = DIA_SCAR_PERM_Condition;
	information = DIA_SCAR_PERM_Info;
	permanent = 1;
	description = "Co mo�esz mi powiedzie� o Gomezie?";
};


func int DIA_SCAR_PERM_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_SCAR_Frau))
	{
		return 1;
	};
};

func void DIA_SCAR_PERM_Info()
{
	AI_Output(other,self,"DIA_SCAR_PERM_15_00");	//Co mo�esz mi powiedzie� o Gomezie?
	AI_Output(self,other,"DIA_SCAR_PERM_08_01");	//To najpot�niejszy cz�owiek w ca�ej kolonii. To ci powinno wystarczy�.
	AI_Output(self,other,"DIA_SCAR_PERM_08_02");	//Dostaje wszystko, czego zapragnie, cho� tak naprawd� zale�y mu tylko na w�adzy.
};


instance DIA_SCAR_RING(C_Info)
{
	npc = EBR_101_Scar;
	nr = 3;
	condition = dia_scar_ring_condition;
	information = dia_scar_ring_info;
	permanent = 0;
	important = 1;
};


func int dia_scar_ring_condition()
{
	if(Npc_HasItems(other,scarsring) >= 1)
	{
		return 1;
	};
};

func void dia_scar_ring_info()
{
	AI_Output(self,other,"DIA_SCAR_Ring_15_00");	//Ej, ty!
	AI_Output(self,other,"DIA_SCAR_Ring_08_01");	//Sk�d masz ten pier�cie�?
	AI_Output(other,self,"DIA_SCAR_Ring_08_02");	//Ja, ehm...
	AI_Output(self,other,"DIA_SCAR_Ring_08_03");	//Ukrad�e� mi go, prawda?
	AI_Output(self,other,"DIA_SCAR_Ring_08_04");	//Czekaj no, draniu, ju� jeste� trupem!
	AI_StopProcessInfos(self);
	Npc_SetPermAttitude(self,ATT_HOSTILE);
	Npc_SetTarget(self,other);
};


instance DIA_SCAR_SCBARON(C_Info)
{
	npc = EBR_101_Scar;
	nr = 3;
	condition = dia_scar_scbaron_condition;
	information = dia_scar_scbaron_info;
	permanent = 0;
	important = 1;
};


func int dia_scar_scbaron_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_EBR)
	{
		return 1;
	};
};

func void dia_scar_scbaron_info()
{
	AI_Output(self,other,"DIA_SCAR_SCBARON_15_00");	//Podj��e� s�uszn� decyzj�. Hehe.
	AI_Output(self,other,"DIA_SCAR_SCBARON_08_01");	//Wierz mi, spodoba ci si� �ycie Magnata.
	AI_Output(self,other,"DIA_SCAR_SCBARON_08_02");	//Jeste�my w�adcami tej kolonii i odt�d ten przywilej przys�uguje r�wnie� i tobie.
	AI_StopProcessInfos(self);
};


instance DIA_SCAR_RAEUBER(C_Info)
{
	npc = EBR_101_Scar;
	nr = 3;
	condition = dia_scar_raeuber_condition;
	information = dia_scar_raeuber_info;
	permanent = 0;
	important = 1;
};


func int dia_scar_raeuber_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return 1;
	};
};

func void dia_scar_raeuber_info()
{
	AI_Output(self,other,"DIA_SCAR_RAEUBER_15_01");	//Dobrze, �e ci� widz�. Mia�bym robot� do wykonania dla kogo� takiego jak ty.
	AI_Output(self,other,"DIA_SCAR_RAEUBER_08_02");	//Jaki� czas temu paru Kopaczy zwin�o si� z obozu, podw�dzaj�c przy tym ca�y �adunek rudy.
	AI_Output(self,other,"DIA_SCAR_RAEUBER_08_03");	//Gomezowi si� to wyj�tkowo nie spodoba�o. Jest w plecy z rud�, w wyniku czego jego wizerunek znacznie ucierpia�.
	AI_Output(self,other,"DIA_SCAR_RAEUBER_08_04");	//Wyobra� sobie co by by�o, gdyby nagle pozostali Kopacze zacz�li tak samo my�le� i migiem zmyliby si� z obozu. Nie mo�emy do tego dopu�ci�.
	AI_Output(self,other,"DIA_SCAR_RAEUBER_08_05");	//Dlatego nadszed� czas, �eby kto� udzieli� lekcji tym zbuntowanym Kopaczom.
	AI_Output(self,other,"DIA_SCAR_RAEUBER_08_06");	//I to w�a�nie zrobisz TY.
	AI_Output(self,other,"DIA_SCAR_RAEUBER_08_07");	//Sporo kr�cisz si� po kolonii, dlatego wcze�niej czy p�niej si� na nich natkniesz. A wtedy dasz im lekcj�, kt�rej nie zapomn�.
	AI_Output(self,other,"DIA_SCAR_RAEUBER_08_08");	//Ja niestety nie jestem w stanie ci powiedzie�, gdzie dok�adnie si� ukrywaj�, prawdopodobnie rozle�li si� po ca�ej kolonii i robi� teraz za pospolitych rabusi�w.
	AI_Output(self,other,"DIA_SCAR_RAEUBER_08_09");	//Zabij ich, kiedy ich znajdziesz. A skradzion� rud� sobie zatrzymaj, je�li j� przy nich zastaniesz. Gomezowi chodzi wy��cznie o Kopaczy.
	AI_Output(self,other,"DIA_SCAR_RAEUBER_08_10");	//Za�atw jaki� dow�d ich �mierci i wracaj czym pr�dzej do mnie. No, lepiej si� z tym szybko uwi�. Gomez jest niecierpliwym cz�owiekiem.
	scar_quest = LOG_RUNNING;
	Log_CreateTopic(CH2_SCARQUEST,LOG_MISSION);
	Log_SetTopicStatus(CH2_SCARQUEST,LOG_RUNNING);
	B_LogEntry(CH2_SCARQUEST,"Blizna, jeden z Magnat�w ze Starego Obozu, da� mi za zadanie odnalezienie grupki Kopaczy, kt�rzy zwiali ze Starego Obozu i okroili Gomeza. Niestety nie ma on poj�cia, gdzie teraz ci Kopacze przebywaj�. No c�, chyba wypada�oby samemu si� tego dowiedzie�.");
	AI_StopProcessInfos(self);
};


instance DIA_SCAR_FIN(C_Info)
{
	npc = EBR_101_Scar;
	nr = 1;
	condition = dia_scar_fin_condition;
	information = dia_scar_fin_info;
	permanent = 0;
	important = 0;
	description = "Ju� po rozb�jnikach.";
};


func int dia_scar_fin_condition()
{
	if((scar_quest == LOG_RUNNING) && (Npc_HasItems(other,ore_bandits_message) >= 1) && (Npc_HasItems(other,ore_bandits_message2) >= 1) && (Npc_HasItems(other,ore_bandits_message3) >= 1) && (Npc_HasItems(other,ore_bandits_message4) >= 1))
	{
		return 1;
	};
};

func void dia_scar_fin_info()
{
	AI_Output(other,self,"DIA_SCAR_FIN_15_01");	//Ju� po rozb�jnikach.
	AI_Output(self,other,"DIA_SCAR_FIN_08_02");	//To mi�o, hehe. Wiedzia�em, �e jeste� odpowiednim cz�owiekiem do tego zadania. Masz na to jakie� dowody?
	AI_Output(other,self,"DIA_SCAR_FIN_08_03");	//Znalaz�em przy nich te wpisy do pami�tnika. Cz�sto wspominana jest w nich ucieczka ze Starego Obozu i to, co planowali zrobi� z rud�.
	AI_Output(self,other,"DIA_SCAR_FIN_08_04");	//Pozw�l no spojrze�.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_SCAR_FIN_08_05");	//Wykona�e� kawa� solidnej roboty. Gomez b�dzie w si�dmym niebie.
	AI_Output(self,other,"DIA_SCAR_FIN_08_06");	//Polec� Stone'owi, �eby sprzeda� ci ci�k� zbroj� Stra�nika. Uwa�am, �e zas�ugujesz, by nale�e� od teraz do naszej elity.
	AI_Output(self,other,"DIA_SCAR_FIN_08_07");	//Id� ju�. Nie mam na razie nic wi�cej dla ciebie do roboty.
	scar_quest = LOG_SUCCESS;
	Log_SetTopicStatus(CH2_SCARQUEST,LOG_SUCCESS);
	B_LogEntry(CH2_SCARQUEST,"Blizna by� zadowolony, kiedy jako dow�d mojej zas�ugi przynios�em mu wpisy do pami�tnika tych rozb�jnik�w i powiedzia�, �e to jest dok�adnie to, o czym Gomez chcia�by us�ysze�. Namacalnej nagrody nie dosta�em, jednak obieca� mi, �e pogada ze Stonem w sprawie ci�kiej zbroi Stra�nika. Mo�e powinienem do niego zajrze�.");
	B_GiveXP(XP_SCARRAEUBER);
	AI_StopProcessInfos(self);
};

