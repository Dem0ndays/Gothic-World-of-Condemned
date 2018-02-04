
instance DIA_Orry_PreExit(C_Info)
{
	npc = GRD_254_Orry;
	nr = 999;
	condition = DIA_Orry_PreExit_Condition;
	information = DIA_Orry_PreExit_Info;
	permanent = 0;
	description = DIALOG_ENDE;
};


func int DIA_Orry_PreExit_Condition()
{
	return 1;
};

func void DIA_Orry_PreExit_Info()
{
	AI_Output(self,other,"DIA_Orry_PreExit_06_00");	//Postaraj si� dotrze� do Starego Obozu w jednym kawa�ku!
	AI_StopProcessInfos(self);
};


instance DIA_Orry_Exit(C_Info)
{
	npc = GRD_254_Orry;
	nr = 999;
	condition = DIA_Orry_Exit_Condition;
	information = DIA_Orry_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Orry_Exit_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orry_PreExit))
	{
		return 1;
	};
};

func void DIA_Orry_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Orry_GuardGate(C_Info)
{
	npc = GRD_254_Orry;
	nr = 2;
	condition = DIA_Orry_GuardGate_Condition;
	information = DIA_Orry_GuardGate_Info;
	permanent = 0;
	description = "Czym si� tutaj zajmujesz?";
};


func int DIA_Orry_GuardGate_Condition()
{
	if(Kapitel <= 1)
	{
		return 1;
	};
};

func void DIA_Orry_GuardGate_Info()
{
	AI_Output(other,self,"DIA_Orry_GuardGate_15_00");	//Czym si� tutaj zajmujesz?
	AI_Output(self,other,"DIA_Orry_GuardGate_06_01");	//Dbam o to, by nikt niepowo�any nie dosta� si� w pobli�e miejsca wymiany. Zw�aszcza ci bandyci z Nowego Obozu.
	AI_Output(self,other,"DIA_Orry_GuardGate_06_02");	//Hej, to ciebie dzi� zrzucili tutaj, co?
	AI_Output(other,self,"DIA_Orry_GuardGate_15_03");	//Zgadza si�.
	AI_Output(self,other,"DIA_Orry_GuardGate_06_04");	//W takim razie uwa�aj na ludzi z Nowego Obozu!
	AI_Output(self,other,"DIA_Orry_GuardGate_06_05");	//Ja jestem ze Starego Obozu, tak jak wszyscy, kt�rych widzia�e� na miejscu wymiany.
	AI_Output(self,other,"DIA_Orry_GuardGate_06_06");	//Zak�adam, �e rozmawia�e� ju� z Diego?
	Info_ClearChoices(DIA_Orry_GuardGate);
	Info_AddChoice(DIA_Orry_GuardGate,"Nie.",DIA_Orry_GuardGate_No);
	Info_AddChoice(DIA_Orry_GuardGate,"Tak.",DIA_Orry_GuardGate_Yes);
};

func void DIA_Orry_GuardGate_No()
{
	AI_Output(other,self,"DIA_Orry_GuardGate_No_15_00");	//Nie.
	AI_Output(self,other,"DIA_Orry_GuardGate_No_06_01");	//Wi�c zr�b to! On zajmuje si� wszystkimi nowoprzyby�ymi.
	AI_Output(self,other,"DIA_Orry_GuardGate_No_06_02");	//Od niego dowiesz si� wszystkiego co ��todzi�b wiedzie� powinien.
	Info_ClearChoices(DIA_Orry_GuardGate);
};

func void DIA_Orry_GuardGate_Yes()
{
	AI_Output(other,self,"DIA_Orry_GuardGate_Yes_15_00");	//Tak, rozmawia�em.
	AI_Output(self,other,"DIA_Orry_GuardGate_Yes_06_01");	//To dobrze. Zatem wiesz ju� mniej wi�cej co i jak.
	Info_ClearChoices(DIA_Orry_GuardGate);
};


instance DIA_Orry_NewCamp(C_Info)
{
	npc = GRD_254_Orry;
	nr = 1;
	condition = DIA_Orry_NewCamp_Condition;
	information = DIA_Orry_NewCamp_Info;
	permanent = 0;
	description = "Dlaczego mam uwa�a� na ludzi z Nowego Obozu?";
};


func int DIA_Orry_NewCamp_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

func void DIA_Orry_NewCamp_Info()
{
	AI_Output(other,self,"DIA_Orry_NewCamp_15_00");	//Dlaczego mam uwa�a� na ludzi z Nowego Obozu?
	AI_Output(self,other,"DIA_Orry_NewCamp_06_01");	//W por�wnaniu z Nowym Obozem, Stary Ob�z to ciche i przytulne miejsce!
	AI_Output(self,other,"DIA_Orry_NewCamp_06_02");	//Nowy Ob�z nie otrzymuje �adnych przesy�ek z zewn�trz. Te szkodniki po prostu kradn� wszystko, czego potrzebuj�.
};


instance DIA_Orry_OldCamp(C_Info)
{
	npc = GRD_254_Orry;
	nr = 2;
	condition = DIA_Orry_OldCamp_Condition;
	information = DIA_Orry_OldCamp_Info;
	permanent = 0;
	description = "A Stary Ob�z?";
};


func int DIA_Orry_OldCamp_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

func void DIA_Orry_OldCamp_Info()
{
	AI_Output(other,self,"DIA_Orry_OldCamp_15_00");	//A Stary Ob�z?
	AI_Output(self,other,"DIA_Orry_OldCamp_06_01");	//Tutaj wszystkim rz�dz� Magnaci, handluj�cy rud�. Pod nimi s� Stra�nicy, a nast�pnie Cienie. Najni�sz� kast� stanowi� Kopacze.
	AI_Output(self,other,"DIA_Orry_OldCamp_06_02");	//Ka�dy, kto tu trafi, zaczyna jako Kopacz. Je�li masz wi�ksze ambicje, musisz zosta� przyj�ty do Cieni.
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		hero.guild = GIL_VLK;
		Mdl_ApplyOverlayMds(hero,"Humans_Tired.mds");
		Log_CreateTopic(CH1_JoinOC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinOC,LOG_RUNNING);
		B_LogEntry(CH1_JoinOC,"Stra�nik Orry opowiada� mi, �e ka�dy, kto tu trafi, zaczyna jako Kopacz. Je�li oczywi�cie wyka�� si� wi�kszymi ambicjami, m�g�bym spr�bowa� zaci�gn�� si� do Cieni.");
	};
};


instance DIA_Orry_Shore(C_Info)
{
	npc = GRD_254_Orry;
	nr = 3;
	condition = DIA_Orry_Shore_Condition;
	information = DIA_Orry_Shore_Info;
	permanent = 0;
	description = "Kiedy tutaj wyl�dowa�em, jeden z waszych uderzy� mnie w twarz.";
};


func int DIA_Orry_Shore_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

func void DIA_Orry_Shore_Info()
{
	AI_Output(other,self,"DIA_Orry_Shore_15_00");	//Kiedy tutaj wyl�dowa�em, jeden z waszych uderzy� mnie w twarz.
	AI_Output(self,other,"DIA_Orry_Shore_06_01");	//Robi� tak z wszystkimi nowymi. M�wi� na to "Chrzest Wody".
	AI_Output(other,self,"DIA_Orry_Shore_15_02");	//Rozumiem. Czy w Starym Obozie jest wielu takich zawadiak�w?
	AI_Output(self,other,"DIA_Orry_Shore_06_03");	//Jest kilka czarnych owiec. Ale nie zrobi� ci krzywdy, je�li zap�acisz im za ochron�.
};


instance DIA_Orry_Woman(C_Info)
{
	npc = GRD_254_Orry;
	nr = 3;
	condition = DIA_Orry_Woman_Condition;
	information = DIA_Orry_Woman_Info;
	permanent = 0;
	description = "Widzia�em, jak spuszczano tutaj jak�� kobiet�.";
};


func int DIA_Orry_Woman_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

func void DIA_Orry_Woman_Info()
{
	AI_Output(other,self,"DIA_Orry_Woman_15_00");	//Widzia�em, jak spuszczano tutaj jak�� kobiet�.
	AI_Output(self,other,"DIA_Orry_Woman_06_01");	//C�, Magnaci dostaj� wszystko, czego zapragn�.
	AI_Output(other,self,"DIA_Orry_Woman_15_02");	//Chcesz powiedzie�, �e kr�l wymienia kobiety na rud�?
	AI_Output(self,other,"DIA_Orry_Woman_06_03");	//Naturalnie one te� trafiaj� tutaj prosto z wi�zienia. Gdyby Gomez nie �ci�gn�� ich tutaj, dalej gni�yby w jakim� lochu.
	AI_Output(self,other,"DIA_Orry_Woman_06_04");	//Sam ju� nie wiem, co jest dla nich gorsze...
};


instance DIA_Orry_Waffe(C_Info)
{
	npc = GRD_254_Orry;
	nr = 3;
	condition = DIA_Orry_Waffe_Condition;
	information = DIA_Orry_Waffe_Info;
	permanent = 0;
	description = "Potrzebuj� broni...";
};


func int DIA_Orry_Waffe_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

func void DIA_Orry_Waffe_Info()
{
	AI_Output(other,self,"DIA_Orry_Waffe_15_00");	//Potrzebuj� broni...
	AI_Output(self,other,"DIA_Orry_Waffe_06_01");	//Rozejrzyj si� troch� przy zamkni�tej kopalni, w g��bi kanionu. Na pewno co� tam znajdziesz.
	AI_Output(self,other,"DIA_Orry_Waffe_06_02");	//Tylko nie wdawaj si� w powa�ne b�jki uzbrojony w g�upi kilof. To bardzo ci�ka i niepor�czna bro�.
	AI_Output(self,other,"DIA_Orry_Waffe_06_03");	//Niedo�wiadczony wojownik powinien pos�ugiwa� si� nim tylko w ostateczno�ci.
	AI_Output(self,other,"DIA_Orry_Waffe_06_04");	//Ach, i jeszcze co�...
	AI_Output(self,other,"DIA_Orry_Waffe_06_05");	//Niewykluczone, �e znajdziesz te� po drodze par� innych rzeczy, takie jak na przyk�ad stare monety.
	AI_Output(self,other,"DIA_Orry_Waffe_06_06");	//Z tego co wiem, to Diego para si� ich zbieraniem.
	AI_Output(self,other,"DIA_Orry_Waffe_06_07");	//Je�li nie b�dziesz wiedzia� co z nimi zrobi�, to powiniene� si� z tym w�a�nie zwr�ci� do Diego. Na pewno co� ci za nie odpali.
};


instance DIA_ORRY_MESSAGE(C_Info)
{
	npc = GRD_254_Orry;
	nr = 1;
	condition = dia_orry_message_condition;
	information = dia_orry_message_info;
	important = 1;
	permanent = 0;
};


func int dia_orry_message_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

func void dia_orry_message_info()
{
	AI_Output(self,other,"DIA_Orry_Message_15_00");	//Skoro wybierasz si� do Starego Obozu, m�g�by� mi wy�wiadczy� pewn� przys�ug�.
	AI_Output(self,other,"DIA_Orry_Message_15_01");	//Chodzi tylko po prostu o to, by� przekaza� wiadomo��.
	AI_Output(self,other,"DIA_Orry_Message_15_02");	//Jest taki go�� w Starym Obozie, nazywa si� Pacho. Jak go kiedy spotkasz, przeka� mu, �e jestem nast�pny w kolejce.
	AI_Output(self,other,"DIA_Orry_Message_15_03");	//Po prostu mu to powiedz. B�dzie wiedzia�, o co chodzi.
	orry_message = LOG_RUNNING;
	Log_CreateTopic(CH1_MESSAGEPACHO,LOG_MISSION);
	B_LogEntry(CH1_MESSAGEPACHO,"Stra�nik Orry zleci� mi przekazanie wiadomo�ci pewnemu cz�owiekowi imieniem Pacho. Je�li go kiedy� spotkam po drodze, mam mu powiedzie�, �e Orry jest nast�pny w kolejce - cokolwiek to znaczy.");
	Log_SetTopicStatus(CH1_MESSAGEPACHO,LOG_RUNNING);
};

