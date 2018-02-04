
instance STT_301_IAN_Exit(C_Info)
{
	npc = STT_301_Ian;
	nr = 999;
	condition = STT_301_IAN_Exit_Condition;
	information = STT_301_IAN_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int STT_301_IAN_Exit_Condition()
{
	return 1;
};

func void STT_301_IAN_Exit_Info()
{
	if(Ian_gearwheel == LOG_SUCCESS)
	{
		AI_Output(other,self,"STT_301_IAN_Exit_Info_15_01");	//Rozejrz� si� troch� po okolicy.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"STT_301_IAN_Exit_Info_15_01");	//Rozejrz� si� troch� po okolicy.
		AI_Output(self,other,"STT_301_IAN_Exit_Info_13_02");	//Nie sprawiaj �adnych k�opot�w.
		AI_StopProcessInfos(self);
	};
};


instance stt_301_ian_hi(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_HI_Condition;
	information = STT_301_IAN_HI_Info;
	important = 0;
	permanent = 0;
	description = "To ty jeste� Ian, szef tej kopalni?";
};


func int STT_301_IAN_HI_Condition()
{
	if(!Npc_KnowsInfo(hero,stt_301_ian_nest))
	{
		return TRUE;
	};
};

func void STT_301_IAN_HI_Info()
{
	AI_Output(other,self,"STT_301_IAN_HI_Info_15_01");	//To ty jeste� Ian, szef tej kopalni?
	AI_Output(self,other,"STT_301_IAN_HI_Info_13_02");	//Tak, to ja. A to moja kopalnia, wi�c lepiej nie pr�buj niczego g�upiego.
};


instance stt_301_ian_gomez(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_GOMEZ_Condition;
	information = STT_301_IAN_GOMEZ_Info;
	important = 0;
	permanent = 0;
	description = "My�la�em, �e to kopalnia Gomeza?";
};


func int STT_301_IAN_GOMEZ_Condition()
{
	if(Npc_KnowsInfo(hero,stt_301_ian_hi))
	{
		return TRUE;
	};
};

func void STT_301_IAN_GOMEZ_Info()
{
	AI_Output(other,self,"STT_301_IAN_GOMEZ_Info_15_01");	//My�la�em, �e to kopalnia Gomeza?
	AI_Output(self,other,"STT_301_IAN_GOMEZ_Info_13_02");	//No c�, oczywi�cie, kopalnia nale�y do Starego Obozu. Ale tutaj, pod ziemi�, jest tylko jeden szef - ja!
};


instance stt_301_ian_ore(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_ORE_Condition;
	information = STT_301_IAN_ORE_Info;
	important = 0;
	permanent = 0;
	description = "Mo�esz mi opowiedzie� o wydobyciu rudy?";
};


func int STT_301_IAN_ORE_Condition()
{
	if(Npc_KnowsInfo(hero,stt_301_ian_gomez))
	{
		return TRUE;
	};
};

func void STT_301_IAN_ORE_Info()
{
	AI_Output(other,self,"STT_301_IAN_ORE_Info_15_01");	//Mo�esz mi opowiedzie� o wydobyciu rudy?
	AI_Output(self,other,"STT_301_IAN_ORE_Info_13_02");	//Kopiemy dniem i noc�. Dzi�ki temu wydobywamy oko�o 200 work�w rudy na miesi�c, plus jakie� 20 work�w, kt�re od razu zostaj� przetopione.
	AI_Output(self,other,"STT_301_IAN_ORE_Info_13_03");	//Z rudy, kt�r� dostarczamy kr�lowi mo�na by wyku� or� dla nie lada armii.
};


instance stt_301_ian_more(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_MORE_Condition;
	information = STT_301_IAN_MORE_Info;
	important = 0;
	permanent = 0;
	description = "S�ysza�em, �e ruda ma w�a�ciwo�ci magiczne. Opowiedz mi o tym.";
};


func int STT_301_IAN_MORE_Condition()
{
	return Npc_KnowsInfo(hero,stt_301_ian_ore);
};

func void STT_301_IAN_MORE_Info()
{
	AI_Output(other,self,"STT_301_IAN_MORE_Info_15_01");	//S�ysza�em, �e ruda ma w�a�ciwo�ci magiczne. Opowiedz mi o tym.
	AI_Output(self,other,"STT_301_IAN_MORE_Info_13_02");	//Tak, nasza ruda rzeczywi�cie posiada w�a�ciwo�ci magiczne. Wykuta z niej bro� nigdy si� nie psuje, a miecze i topory s� ostrzejsze, ni� te wykute ze stali.
	AI_Output(self,other,"STT_301_IAN_MORE_Info_13_03");	//Ka�da armia wyposa�ona w taki or� ma powa�n� przewag� w boju.
};


instance STT_301_IAN_MAGIC(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_MAGIC_Condition;
	information = STT_301_IAN_MAGIC_Info;
	important = 0;
	permanent = 0;
	description = "Opowiedz mi co� jeszcze o rudzie.";
};


func int STT_301_IAN_MAGIC_Condition()
{
	return Npc_KnowsInfo(hero,stt_301_ian_more);
};

func void STT_301_IAN_MAGIC_Info()
{
	AI_Output(other,self,"STT_301_IAN_MAGIC_Info_15_01");	//Opowiedz mi co� jeszcze o rudzie.
	AI_Output(self,other,"STT_301_IAN_MAGIC_Info_13_02");	//Niestety, magiczne w�a�ciwo�ci rudy zanikaj� podczas przetapiania. W hutach Nordmaru znaj� odpowiednie techniki przetapiania.
	AI_Output(self,other,"STT_301_IAN_MAGIC_Info_13_03");	//Ale nawet bez mocy magicznych, bro� wykonana z naszej rudy jest bardziej wytrzyma�a i zadaje wi�ksze obra�enia ni� zwyk�y or�.
};


instance STT_301_IAN_MINE(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_MINE_Condition;
	information = STT_301_IAN_MINE_Info;
	important = 0;
	permanent = 0;
	description = "Opowiedz mi o kopalni.";
};


func int STT_301_IAN_MINE_Condition()
{
	if((Kapitel < 3) && Npc_KnowsInfo(hero,stt_301_ian_hi))
	{
		return TRUE;
	};
};

func void STT_301_IAN_MINE_Info()
{
	AI_Output(other,self,"STT_301_IAN_MINE_Info_15_01");	//Opowiedz mi o kopalni.
	AI_Output(self,other,"STT_301_IAN_MINE_Info_13_02");	//Je�li chcesz si� tu troch� rozejrze�, to radz� ci dobrze uwa�a�. W jaskiniach kryj� si� pe�zacze. Najlepiej trzymaj si� g��wnego szybu.
	AI_Output(self,other,"STT_301_IAN_MINE_Info_13_03");	//I nie przeszkadzaj �wi�tynnym Stra�nikom. Chocia� przez wi�kszo�� czasu zbijaj� b�ki, to najlepsi sprzymierze�cy, jakich mo�na sobie wyobrazi� podczas starcia z pe�zaczami.
	AI_Output(other,self,"STT_301_IAN_MINE_Info_15_04");	//Postaram si� o tym pami�ta�.
	AI_Output(self,other,"STT_301_IAN_MINE_Info_13_05");	//Mam jeszcze sporo roboty. A, i nie przeszkadzaj w pracy moim ludziom!
	AI_Output(other,self,"STT_301_IAN_MINE_Info_15_06");	//Tylko si� tu troch� rozejrz�.
};


instance STT_301_IAN_WANTLIST(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_WANTLIST_Condition;
	information = STT_301_IAN_WANTLIST_Info;
	important = 0;
	permanent = 0;
	description = "Przychodz� tu po list� dla Obozu.";
};


func int STT_301_IAN_WANTLIST_Condition()
{
	if((Diego_BringList == LOG_RUNNING) && !Npc_KnowsInfo(hero,Info_Diego_IanPassword))
	{
		return TRUE;
	};
};

func void STT_301_IAN_WANTLIST_Info()
{
	AI_Output(other,self,"STT_301_IAN_WANTLIST_Info_15_01");	//Przychodz� tu po list� dla Obozu.
	AI_Output(self,other,"STT_301_IAN_WANTLIST_Info_13_02");	//Ka�dy mo�e tak powiedzie�. Spadaj.
};


instance STT_301_IAN_GETLIST(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_GETLIST_Condition;
	information = STT_301_IAN_GETLIST_Info;
	important = 0;
	permanent = 0;
	description = "Przysy�a mnie Diego. Mam odebra� list�.";
};


func int STT_301_IAN_GETLIST_Condition()
{
	if((Diego_BringList == LOG_RUNNING) && Npc_KnowsInfo(hero,Info_Diego_IanPassword))
	{
		return TRUE;
	};
};

func void STT_301_IAN_GETLIST_Info()
{
	AI_Output(other,self,"STT_301_IAN_GETLIST_Info_15_01");	//Przysy�a mnie Diego. Mam odebra� list�.
	AI_Output(self,other,"STT_301_IAN_GETLIST_Info_13_02");	//W porz�dku. Oto i ona. Powiedz im, �eby si� pospieszyli z dostawami.
	B_LogEntry(CH1_BringList,"Ian bez sprzeciwu wr�czy� mi list� zam�wie�.");
	B_GiveInvItems(self,hero,TheList,1);
};


instance stt_301_ian_nest(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_NEST_Condition;
	information = STT_301_IAN_NEST_Info;
	important = 0;
	permanent = 0;
	description = "Gdzie� tutaj musi by� gniazdo pe�zaczy.";
};


func int STT_301_IAN_NEST_Condition()
{
	if((CorKalom_BringMCQBalls == LOG_RUNNING) && Npc_KnowsInfo(hero,stt_301_ian_hi))
	{
		return 1;
	};
};

func void STT_301_IAN_NEST_Info()
{
	AI_Output(other,self,"STT_301_IAN_NEST_Info_15_01");	//Gdzie� tutaj musi by� gniazdo pe�zaczy.
	AI_Output(self,other,"STT_301_IAN_NEST_Info_13_02");	//Za�o�� si�, �e jest tu przynajmniej z tuzin gniazd.
	AI_Output(other,self,"STT_301_IAN_NEST_Info_15_03");	//S�uchaj, musz� natychmiast i�� do tego gniazda...
	AI_Output(self,other,"STT_301_IAN_NEST_Info_13_04");	//Nie mam teraz na to czasu! Par� godzin temu zepsu�a si� nasza m�ocarnia. Ko�o z�bate p�k�o w drzazgi.
	AI_Output(self,other,"STT_301_IAN_NEST_Info_13_05");	//Nie mam poj�cia, gdzie znajd� nowe.
	AI_Output(self,other,"STT_301_IAN_NEST_Info_13_06");	//Przynie� mi ko�o z�bate. Wtedy zajm� si� twoim problemem.
	B_LogEntry(CH2_MCEggs,"Ian, szef Starej Kopalni, nie pomo�e mi w odnalezieniu gniazda pe�zaczy. Mam za to przynie�� mu ko�o z�bate do zepsutego rozdrabniacza rudy. Podobno mog� je znale�� w kt�rym� z opuszczonych bocznych tuneli.");
	Ian_gearwheel = LOG_RUNNING;
};


instance STT_301_IAN_GEAR_RUN(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_GEAR_RUN_Condition;
	information = STT_301_IAN_GEAR_RUN_Info;
	important = 0;
	permanent = 0;
	description = "Ko�o z�bate? A gdzie ja niby mam je znale��?";
};


func int STT_301_IAN_GEAR_RUN_Condition()
{
	PrintDebugInt(PD_MISSION,"Ian_gearwheel: ",Ian_gearwheel);
	if((Ian_gearwheel == LOG_RUNNING) && !Npc_HasItems(hero,ItMi_Stuff_Gearwheel_01))
	{
		return 1;
	};
};

func void STT_301_IAN_GEAR_RUN_Info()
{
	AI_Output(other,self,"STT_301_IAN_GEAR_RUN_Info_15_01");	//Ko�o z�bate? A gdzie ja niby mam je znale��?
	AI_Output(self,other,"STT_301_IAN_GEAR_RUN_Info_13_02");	//Nie mam poj�cia. Jestem r�wnie bezradny co ty!
	AI_Output(self,other,"STT_301_IAN_GEAR_RUN_Info_13_03");	//W kt�rym� z bocznych szyb�w stoi zepsuta m�ocarnia. Mo�e tam co� znajdziesz.
};


instance stt_301_ian_gear_suc(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_GEAR_SUC_Condition;
	information = STT_301_IAN_GEAR_SUC_Info;
	important = 0;
	permanent = 0;
	description = "Mam ko�o z�bate.";
};


func int STT_301_IAN_GEAR_SUC_Condition()
{
	if(Npc_HasItems(hero,ItMi_Stuff_Gearwheel_01) && (Ian_gearwheel == LOG_RUNNING))
	{
		return 1;
	};
};

func void STT_301_IAN_GEAR_SUC_Info()
{
	var C_Npc Sklave;
	B_GiveInvItems(hero,self,ItMi_Stuff_Gearwheel_01,1);
	Npc_RemoveInvItem(self,ItMi_Stuff_Gearwheel_01);
	Ian_gearwheel = LOG_SUCCESS;
	B_GiveXP(XP_BringGearWheel);
	Sklave = Hlp_GetNpc(Orc_2001_Sklave);
	Npc_ExchangeRoutine(Sklave,"Stomper");
	AI_Output(other,self,"STT_301_IAN_GEAR_SUC_Info_15_01");	//Mam ko�o z�bate.
	AI_Output(self,other,"STT_301_IAN_GEAR_SUC_Info_13_02");	//Dobra robota! Powinno dzia�a�. No a teraz wr��my do twojej sprawy. Szukasz gniazda pe�zaczy... Hmmm...
	AI_Output(self,other,"STT_301_IAN_GEAR_SUC_Info_13_03");	//Znajd� Asghana i powiedz mu, �eby otworzy� ci drzwi. B�dziesz m�g� rozejrze� si� po zamkni�tych korytarzach.
	AI_Output(self,other,"STT_301_IAN_GEAR_SUC_Info_13_04");	//Powiedz mu "Wszystko b�dzie w porz�dku". Po tym pozna, �e to ja ci� przysy�am.
	B_LogEntry(CH2_MCEggs,"Przynios�em Ianowi ko�o z�bate, o kt�re prosi�. Teraz mam powiedzie� Asghanowi, �e WSZYSTKO B�DZIE W PORZ�DKU. Wtedy Stra�nik otworzy dla mnie bram� do opuszczonych szyb�w.");
};


instance STT_301_IAN_GOTOASGHAN(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_GOTOASGHAN_Condition;
	information = STT_301_IAN_GOTOASGHAN_Info;
	important = 0;
	permanent = 0;
	description = "Nadal szukam gniazda pe�zaczy.";
};


func int STT_301_IAN_GOTOASGHAN_Condition()
{
	if((Ian_gearwheel == LOG_SUCCESS) && !Npc_KnowsInfo(hero,Grd_263_Asghan_NEST))
	{
		return 1;
	};
};

func void STT_301_IAN_GOTOASGHAN_Info()
{
	AI_Output(other,self,"STT_301_IAN_GOTOASGHAN_Info_15_01");	//Nadal szukam gniazda pe�zaczy.
	AI_Output(self,other,"STT_301_IAN_GOTOASGHAN_Info_13_02");	//M�wi�em ci ju� - id� do Asghana. To dow�dca stra�nik�w. Znajdziesz go gdzie� na najni�szym poziomie.
	B_LogEntry(CH2_MCEggs,"Je�li chc� odnale�� gniazdo pe�zaczy, powinienem porozmawia� z Asghanem.");
};


instance STT_301_IAN_AFTERALL(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_AFTERALL_Condition;
	information = STT_301_IAN_AFTERALL_Info;
	important = 0;
	permanent = 0;
	description = "Znalaz�em gniazdo!";
};


func int STT_301_IAN_AFTERALL_Condition()
{
	if(Npc_HasItems(hero,ItAt_Crawlerqueen) >= 3)
	{
		return 1;
	};
};

func void STT_301_IAN_AFTERALL_Info()
{
	AI_Output(other,self,"STT_301_IAN_AFTERALL_Info_15_01");	//Znalaz�em gniazdo!
	AI_Output(self,other,"STT_301_IAN_AFTERALL_Info_13_02");	//No to nareszcie b�dziemy tu mieli chwil� spokoju. Ha ha ha!
	AI_Output(self,other,"STT_301_IAN_AFTERALL_Info_13_03");	//Bez obrazy. Dobra robota, ch�opcze.
	AI_Output(self,other,"STT_301_IAN_AFTERALL_Info_13_04");	//Masz. We� t� skrzynk� piwa. Zas�u�y�e�.
	CreateInvItems(self,ItFo_OM_Beer_01,6);
	B_GiveInvItems(self,hero,ItFo_OM_Beer_01,6);
};


instance STT_301_IAN_NOTENOUGH(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_NOTENOUGH_Condition;
	information = STT_301_IAN_NOTENOUGH_Info;
	important = 0;
	permanent = 0;
	description = "Znalaz�em gniazdo! I jaja z�o�one przez kr�low� pe�zaczy!";
};


func int STT_301_IAN_NOTENOUGH_Condition()
{
	if((Npc_HasItems(hero,ItAt_Crawlerqueen) > 1) && (Npc_HasItems(hero,ItAt_Crawlerqueen) < 3))
	{
		return TRUE;
	};
};

func void STT_301_IAN_NOTENOUGH_Info()
{
	AI_Output(other,self,"STT_301_IAN_NOTENOUGH_Info_15_01");	//Znalaz�em gniazdo! I jaja z�o�one przez kr�low� pe�zaczy!
	AI_Output(self,other,"STT_301_IAN_NOTENOUGH_Info_13_02");	//Co? Tylko tyle tych jaj? A zreszt�... Udowodni�e�, �e twardy z ciebie go��.
};


instance STT_301_IAN_LOSTDIGGER(C_Info)
{
	npc = STT_301_Ian;
	condition = stt_301_ian_lostdigger_condition;
	information = stt_301_ian_lostdigger_info;
	important = 1;
	permanent = 0;
};


func int stt_301_ian_lostdigger_condition()
{
	if(Npc_KnowsInfo(hero,stt_301_ian_hi))
	{
		return TRUE;
	};
};

func void stt_301_ian_lostdigger_info()
{
	AI_Output(self,other,"STT_301_IAN_LOSTDIGGER_Info_15_01");	//Czekaj no. Je�li rzeczywi�cie chcia�by� si� na co� przyda�, to mia�bym dla ciebie robot�.
	AI_Output(other,self,"STT_301_IAN_LOSTDIGGER_Info_13_02");	//O co chodzi?
	AI_Output(self,other,"STT_301_IAN_LOSTDIGGER_Info_15_02");	//Jaki� czas temu znikn�� nam jeden z Kopaczy. Nazywa si� Garret.
	AI_Output(self,other,"STT_301_IAN_LOSTDIGGER_Info_15_03");	//Pracowa� przez pewien czas w g��wnym szybie na dole ko�o hutnika. Potem nagle gdzie� przepad�, kiedy zostali�my zaatakowani przez pe�zacze.
	AI_Output(self,other,"STT_301_IAN_LOSTDIGGER_Info_15_04");	//Wiesz, gdyby to by� jaki� tam zwyk�y Kopacz, to by�oby mi to na r�k�. Ale niestety facet ma do�wiadczenie w tym co robi i dlatego go tu potrzebujemy.
	AI_Output(self,other,"STT_301_IAN_LOSTDIGGER_Info_15_05");	//Rozgl�dnij si� za nim. Mo�e nawet bym i nagrody nie posk�pi�.
	AI_Output(self,other,"STT_301_IAN_LOSTDIGGER_Info_15_06");	//Zasi�gnij na pocz�tek j�zyka u kopaczy, kt�rzy s� rozeznani w temacie.
	lost_digger = LOG_RUNNING;
	Log_CreateTopic(CH1_LOSTDIGGER,LOG_MISSION);
	Log_SetTopicStatus(CH1_LOSTDIGGER,LOG_RUNNING);
	B_LogEntry(CH1_LOSTDIGGER,"Szef Starej Kopalni - Ian - opowiedzia� mi o niejakim Kopaczu Garrecie. Pono� znikn�� gdzie� jaki� czas temu, kiedy to g��wny szyb zosta� przyci�ni�ty przez pe�zacze. Sam nie ma poj�cia, gdzie m�g� si� ukry� Garret, ale je�li ju� kto� mia�by wiedz� na ten temat, to tylko Kopacze pracuj�cy w kopalni.");
};


instance STT_301_IAN_FOUNDDIGGER(C_Info)
{
	npc = STT_301_Ian;
	condition = stt_301_ian_founddigger_condition;
	information = stt_301_ian_founddigger_info;
	important = 0;
	permanent = 0;
	description = "Znalaz�em Garreta.";
};


func int stt_301_ian_founddigger_condition()
{
	if((lost_digger == LOG_RUNNING) && Npc_HasItems(hero,garrets_pickaxe))
	{
		return TRUE;
	};
};

func void stt_301_ian_founddigger_info()
{
	var int zufallsbelohnung;
	AI_Output(other,self,"STT_301_IAN_FOUNDDIGGER_Info_15_01");	//Znalaz�em Garreta.
	AI_Output(self,other,"STT_301_IAN_FOUNDDIGGER_Info_13_02");	//I gdzie on jest?
	AI_Output(other,self,"STT_301_IAN_FOUNDDIGGER_Info_15_02");	//Nie �yje. Znalaz�em go w jednym z bocznych szyb�w.
	AI_Output(self,other,"STT_301_IAN_FOUNDDIGGER_Info_15_03");	//Co? Masz na to jaki� dow�d?
	AI_Output(other,self,"STT_301_IAN_FOUNDDIGGER_Info_15_04");	//Tak, jego kilof.
	AI_Output(self,other,"STT_301_IAN_FOUNDDIGGER_Info_15_05");	//Do diab�a! I TO jest problem. Teraz b�d� musia� zabiega� o to, �eby ch�opcy ze Starego Obozu przys�ali mi tu kolejnego Kopacza.
	AI_Output(self,other,"STT_301_IAN_FOUNDDIGGER_Info_15_06");	//C�, mimo wszystko dzi�kuj� ci za pomoc. Prosz�, to dla ciebie.
	lost_digger = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_LOSTDIGGER,LOG_SUCCESS);
	B_LogEntry(CH1_LOSTDIGGER,"Ian nie by� specjalnie zadowolony wie�ciami na temat �mierci Garreta. Dla niego jest to kolejny problem, poniewa� brakuje mu teraz jednego Kopacza. Mimo to i tak dosta�em nagrod� za to, �e mu pomog�em.");
	B_GiveXP(XP_LOSTDIGGER);
	zufallsbelohnung = Hlp_Random(100);
	if(zufallsbelohnung >= 75)
	{
		CreateInvItems(self,ItAt_Wolf_02,2);
		B_GiveInvItems(self,other,ItAt_Wolf_02,2);
	}
	else if(zufallsbelohnung >= 60)
	{
		CreateInvItems(self,ItMw_1H_LightGuardsSword_03,1);
		B_GiveInvItems(self,other,ItMw_1H_LightGuardsSword_03,1);
	}
	else if(zufallsbelohnung >= 50)
	{
		CreateInvItem(self,ItMi_Stuff_OldCoin_01);
		B_GiveInvItems(self,hero,ItMi_Stuff_OldCoin_01,8);
	}
	else if(zufallsbelohnung >= 40)
	{
		CreateInvItems(self,ItFoBeer,6);
		B_GiveInvItems(self,other,ItFoBeer,6);
	}
	else if(zufallsbelohnung >= 30)
	{
		CreateInvItems(self,ItFoLoaf,5);
		B_GiveInvItems(self,other,ItFoLoaf,5);
	}
	else if(zufallsbelohnung >= 20)
	{
		CreateInvItems(self,ItArScrollHeal,1);
		B_GiveInvItems(self,other,ItArScrollHeal,1);
	}
	else if(zufallsbelohnung >= 10)
	{
		CreateInvItems(self,ItArScrollLight,1);
		B_GiveInvItems(self,other,ItArScrollLight,1);
	};
	B_GiveInvItems(hero,self,garrets_pickaxe,1);
	Npc_RemoveInvItem(self,garrets_pickaxe);
};

