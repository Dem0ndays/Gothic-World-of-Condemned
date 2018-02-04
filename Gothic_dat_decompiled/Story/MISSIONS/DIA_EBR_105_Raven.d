
instance DIA_Raven_Exit(C_Info)
{
	npc = EBR_105_Raven;
	nr = 999;
	condition = DIA_Raven_Exit_Condition;
	information = DIA_Raven_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Raven_Exit_Condition()
{
	return 1;
};

func void DIA_Raven_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Raven_FirstIn(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_FirstIn_Condition;
	information = DIA_Raven_FirstIn_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Raven_FirstIn_Condition()
{
	var C_Npc wache218;
	wache218 = Hlp_GetNpc(Grd_218_Gardist);
	if(wache218.aivar[AIV_PASSGATE] == TRUE)
	{
		return 1;
	};
};

func void DIA_Raven_FirstIn_Info()
{
	AI_Output(self,other,"DIA_Raven_FirstIn_10_00");	//Co mog� dla ciebie zrobi�?
};


instance DIA_Raven_Who(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_Who_Condition;
	information = DIA_Raven_Who_Info;
	permanent = 0;
	description = "Kim jeste�?";
};


func int DIA_Raven_Who_Condition()
{
	return 1;
};

func void DIA_Raven_Who_Info()
{
	AI_Output(other,self,"DIA_Raven_Who_15_00");	//Kim jeste�?
	AI_Output(self,other,"DIA_Raven_Who_10_01");	//Nazywam si� Kruk. Jestem praw� r�k� Gomeza. Ka�dy, kto chce si� spotka� z szefem, musi najpierw porozmawia� ze mn�.
};


instance DIA_Raven_Krautbote(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_Krautbote_Condition;
	information = DIA_Raven_Krautbote_Info;
	permanent = 0;
	description = "Mam troch� bagiennego ziela dla Gomeza od Cor Kaloma.";
};


func int DIA_Raven_Krautbote_Condition()
{
	if(Kalom_Krautbote == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Raven_Krautbote_Info()
{
	AI_Output(other,self,"DIA_Raven_Krautbote_15_00");	//Mam troch� bagiennego ziela dla Gomeza od Cor Kaloma.
	AI_Output(self,other,"DIA_Raven_Krautbote_10_01");	//Gomez nie zajmuje si� takimi rzeczami osobi�cie. To dzia�ka Bartholo.
	AI_Output(self,other,"DIA_Raven_Krautbote_10_02");	//Znajdziesz go w komnacie na prawo od wej�cia, albo w kuchni w du�ej wie�y.
	AI_Output(self,other,"DIA_Raven_Krautbote_10_03");	//Oczywi�cie w nocy pewnie �pi. Na twoim miejscu nie przeszkadza�bym mu do rana.
	B_LogEntry(CH1_KrautBote,"Ziele dla Gomeza nale�y dostarczy� do Bartholo. Znajd� go w rezydencji Magnat�w.");
};


instance DIA_Raven_Aufnahme(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_Aufnahme_Condition;
	information = DIA_Raven_Aufnahme_Info;
	permanent = 0;
	description = "Chc� si� zobaczy� z Gomezem. Thorus powiedzia�, �e mog� zosta� Cieniem.";
};


func int DIA_Raven_Aufnahme_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Thorus_ReadyForGomez) && (Npc_GetTrueGuild(other) == GIL_None))
	{
		return 1;
	};
};

func void DIA_Raven_Aufnahme_Info()
{
	AI_Output(other,self,"DIA_Raven_Aufnahme_15_00");	//Chc� si� zobaczy� z Gomezem. Thorus powiedzia�, �e mog� zosta� Cieniem.
	AI_Output(self,other,"DIA_Raven_Aufnahme_10_01");	//Dobrych ludzi nigdy nie za wielu. Chyba masz wystarczaj�co r�wno pod sufitem. Mo�esz si� nam przyda�.
	AI_Output(self,other,"DIA_Raven_Aufnahme_10_02");	//Zabior� ci� do Gomeza. Chod� za mn�, tylko niczego nie dotykaj!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDE");
};


instance DIA_Raven_There(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_There_Condition;
	information = DIA_Raven_There_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Raven_There_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Raven_Aufnahme) && Hlp_StrCmp(Npc_GetNearestWP(self),"OCC_BARONS_GREATHALL_CENTER_MOVEMENT"))
	{
		return 1;
	};
};

func void DIA_Raven_There_Info()
{
	AI_Output(self,other,"DIA_Raven_There_10_01");	//Gomez jest tam. Je�li nie oka�esz mu nale�nego szacunku, osobi�cie naucz� ci� dobrych manier. Zrozumiano?
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Raven_PERM(C_Info)
{
	npc = EBR_105_Raven;
	nr = 8;
	condition = DIA_Raven_PERM_Condition;
	information = DIA_Raven_PERM_Info;
	permanent = 1;
	description = "Jak idzie handel rud�?";
};


func int DIA_Raven_PERM_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Thorus_ReadyForGomez))
	{
		return 1;
	};
};

func void DIA_Raven_PERM_Info()
{
	AI_Output(other,self,"DIA_Raven_PERM_15_00");	//Jak idzie handel rud�?
	AI_Output(self,other,"DIA_Raven_PERM_10_01");	//Stara Kopalnia jako� radzi sobie z wydobyciem. Ostatni transport do zewn�trznego �wiata by� bardzo du�y.
};


instance DIA_Raven_BinDabei(C_Info)
{
	npc = EBR_105_Raven;
	nr = 8;
	condition = DIA_Raven_BinDabei_Condition;
	information = DIA_Raven_BinDabei_Info;
	permanent = 0;
	description = "Gomez powiedzia�, �e si� nadaj�.";
};


func int DIA_Raven_BinDabei_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Gomez_Dabei))
	{
		return 1;
	};
};

func void DIA_Raven_BinDabei_Info()
{
	CreateInvItem(hero,stt_armor_m);
	CreateInvItem(self,ItAmArrow);
	B_GiveInvItems(self,hero,ItAmArrow,1);
	Npc_RemoveInvItem(hero,ItAmArrow);
	AI_Output(other,self,"DIA_Raven_BinDabei_15_00");	//Gomez powiedzia�, �e si� nadaj�.
	AI_Output(self,other,"DIA_Raven_BinDabei_10_01");	//�wietnie! Tak si� sk�ada, �e mo�esz od razu udowodni�, na co ci� sta�. Jest dla ciebie robota.
	AI_Output(self,other,"DIA_Raven_BinDabei_10_02");	//To nie powinno by� zbyt trudne, je�li rzeczywi�cie masz kontakty, o jakich m�wi�e�.
	AI_EquipBestArmor(hero);
};


var int Raven_SpySect;

instance DIA_Raven_SpySect(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_SpySect_Condition;
	information = DIA_Raven_SpySect_Info;
	permanent = 0;
	description = "Co mam zrobi�?";
};


func int DIA_Raven_SpySect_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Raven_BinDabei))
	{
		return 1;
	};
};

func void DIA_Raven_SpySect_Info()
{
	AI_Output(other,self,"DIA_Raven_SpySect_15_00");	//Co mam zrobi�?
	AI_Output(self,other,"DIA_Raven_SpySect_10_01");	//Prowadzimy intensywn� wymian� handlow� z Bractwem, co nie znaczy, �e im do ko�ca ufamy.
	AI_Output(self,other,"DIA_Raven_SpySect_10_02");	//Id� na bagna.
	AI_Output(self,other,"DIA_Raven_SpySect_10_03");	//Kiedy dotrzesz do Obozu Bractwa, miej uszy i oczy szeroko otwarte. Ka�dy strz�pek informacji mo�e si� okaza� niezwykle cenny.
	AI_Output(self,other,"DIA_Raven_SpySect_10_04");	//Im wi�cej wyw�szysz, tym lepiej. Ta misja wymaga odrobiny taktu, je�li wiesz, co mam na my�li.
	AI_Output(other,self,"DIA_Raven_SpySect_15_05");	//Bez obaw. Postaram si� ich nie rozz�o�ci�.
	AI_Output(self,other,"DIA_Raven_SpySect_10_06");	//Wiedzia�em, �e si� zrozumiemy.
	Raven_SpySect = LOG_RUNNING;
	Log_CreateTopic(CH1_GoToPsi,LOG_MISSION);
	Log_SetTopicStatus(CH1_GoToPsi,LOG_RUNNING);
	B_LogEntry(CH1_GoToPsi,"Kruk wys�a� mnie do obozu Bractwa. Mam si� tam troch� rozejrze� i donie�� mu o wszystkich podejrzanych wydarzeniach. Mo�e uda mi si� dowiedzie� czego� ciekawego.");
};


instance DIA_Raven_Equipment(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_Equipment_Condition;
	information = DIA_Raven_Equipment_Info;
	permanent = 0;
	description = "Gdzie mog� dosta� lepsze wyposa�enie?";
};


func int DIA_Raven_Equipment_Condition()
{
	if(Raven_SpySect == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Raven_Equipment_Info()
{
	AI_Output(other,self,"DIA_Raven_Equipment_15_00");	//Gdzie mog� dosta� lepsze wyposa�enie?
	AI_Output(self,other,"DIA_Raven_Equipment_10_01");	//Porozmawiaj z Diego, on da ci jak�� zbroj�. Ten pancerz nie tylko uchroni ci� przed �mierci�, ale b�dzie r�wnie� s�u�y� jako znak rozpoznawczy.
	AI_Output(self,other,"DIA_Raven_Equipment_10_02");	//Dzi�ki niemu zyskasz dost�p do wszystkich wa�niejszych miejsc.
	AI_Output(self,other,"DIA_Raven_Equipment_10_03");	//Gdyby� potrzebowa� broni, porozmawiaj ze Skipem. Znajdziesz go w tej wielkiej szopie, w lewym tylnym rogu zamkowego dziedzi�ca.
	Log_CreateTopic(GE_TraderOC,LOG_NOTE);
	B_LogEntry(GE_TraderOC,"Diego ma lepsze wyposa�enie dla Cieni Gomeza. Znajd� go przy zamkowej bramie.");
	if(!Npc_KnowsInfo(hero,DIA_Skip_First))
	{
		B_LogEntry(GE_TraderOC,"Skip, stra�nik z tylnego dziedzi�ca, sprzedaje or�, ale tylko ludziom Gomeza.");
	};
};


instance DIA_Raven_SpyBericht(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_SpyBericht_Condition;
	information = DIA_Raven_SpyBericht_Info;
	permanent = 1;
	description = "Pomy�la�em, �e zdam ci raport...";
};


func int DIA_Raven_SpyBericht_Condition()
{
	if(Raven_SpySect == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Raven_SpyBericht_Info()
{
	AI_Output(other,self,"DIA_Raven_SpyBericht_15_00");	//Pomy�la�em, �e zdam ci raport...
	AI_Output(self,other,"DIA_Raven_SpyBericht_10_01");	//To dobrze. Lubi� by� informowany na bie��co.
	if((Npc_HasItems(other,ItAt_Crawlerqueen) >= 1) || (CorKalom_BringMCQBalls == LOG_SUCCESS))
	{
		if(Kapitel >= 3)
		{
			AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_04");	//Odby�o si� wielkie przywo�anie.
			AI_Output(self,other,"DIA_Raven_SpyBericht_10_04");	//Dobrze si� spisa�e�.
			Raven_SpySect = LOG_SUCCESS;
			B_GiveXP(XP_ReportToRaven);
			Log_SetTopicStatus(CH1_GoToPsi,LOG_SUCCESS);
			B_LogEntry(CH1_GoToPsi,"Kruk sp�awi� mnie byle gadk�. Nie potrzeba mi takich przyjaci�. Od tej pory dzia�am na w�asny rachunek.");
		}
		else
		{
			AI_Output(other,self,"DIA_Raven_SpyBericht_15_02");	//Teraz Bractwo potrzebuje jaj kr�lowej pe�zaczy. Przygotuj� z nich nap�j, kt�ry umo�liwi im nawi�zanie kontaktu ze �ni�cym. Mam te jaja przy sobie.
			if(CorKalom_BringMCQBalls != LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Raven_SpyBericht_10_03");	//Hmm, interesuj�ce. Ciekawe czy to zadzia�a. Zanie� jaja do �wi�tyni.
			}
			else
			{
				AI_Output(self,other,"DIA_Raven_SpyBericht_10_04");	//Dobrze si� spisa�e�.
				Raven_SpySect = LOG_SUCCESS;
				B_GiveXP(XP_ReportToRaven);
				Log_SetTopicStatus(CH1_GoToPsi,LOG_SUCCESS);
				B_LogEntry(CH1_GoToPsi,"Kruk sp�awi� mnie byle gadk�. Nie potrzeba mi takich przyjaci�. Od tej pory dzia�am na w�asny rachunek.");
			};
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Raven_SpyBericht_15_05");	//Niestety, jeszcze nie wiem, co planuj� ludzie z Bractwa.
		AI_Output(self,other,"DIA_Raven_SpyBericht_10_06");	//To dlaczego zawracasz mi g�ow�?
	};
};


var int ore_baron;

instance dia_raven_orebaron(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = dia_raven_orebaron_condition;
	information = dia_raven_orebaron_info;
	permanent = 0;
	important = 1;
};


func int dia_raven_orebaron_condition()
{
	if((Npc_GetTrueGuild(other) == GIL_GRD) && (hero.level >= 20) && (Kapitel == 3) && (fletcher_schulden == LOG_SUCCESS) && (Fisk_GetNewHehler == LOG_SUCCESS) && (lost_digger == LOG_SUCCESS) && (messagekdf == LOG_SUCCESS) && (scar_quest == LOG_SUCCESS) && (paul_oc == LOG_SUCCESS) && (convoy_oc == LOG_SUCCESS) && (Thorus_MordragKo == LOG_SUCCESS) && (carlos_things == LOG_SUCCESS) && (magic_artefacts == LOG_SUCCESS) && (huno_lostsword == LOG_SUCCESS) && (orry_message == LOG_SUCCESS) && (brandick_beer == LOG_SUCCESS) && (omid_recept == LOG_SUCCESS) && (MordragKO_StayAtNC != TRUE))
	{
		return 1;
	};
};

func void dia_raven_orebaron_info()
{
	AI_Output(self,other,"DIA_Raven_OreBaron_15_00");	//Hej, ty!
	AI_Output(other,self,"DIA_Raven_OreBaron_10_01");	//Co si� sta�o?
	AI_Output(self,other,"DIA_Raven_OreBaron_10_02");	//Wiele o tobie s�ysza�em. Wyrobi�e� sobie renom� w obozie, jak i wielce si� mu przys�u�y�e�.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_03");	//Osobi�cie �ledzi�em twoj� karier� w tym obozie.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_04");	//By�e� nikim, kiedy trafi�e� do tej Kolonii.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_05");	//Tymczasem wypracowa�e� sobie wysok� pozycj�, i to szybciej, ni� ktokolwiek inny.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_06");	//Po swoim kr�tkim pobycie w Kolonii zdecydowa�e� si� do��czy� do Cieni. Ale nawet wtedy nie by�e� takim zwyczajnym Cieniem, jak pozostali.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_07");	//By�e� tym, kt�ry uwolni� nas od plagi pe�zaczy w kopalni, i to w pojedynk�.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_08");	//Jako Stra�nik odwali�e� kawa� solidnej roboty, jak i wykona�e� imponuj�c� liczb� zada�. �aden z naszych Stra�nik�w nie mo�e si� poszczyci� takimi osi�gni�ciami co ty.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_09");	//Ponadto dobitnie udowodni�e� swoj� lojalno�� w stosunku do Starego Obozu.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_11");	//Naradzi�em si� razem z reszt� Magnat�w i wsp�lnie podj�li�my decyzj�.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_12");	//Jeste�my sk�onni zaoferowa� ci miejsce w szeregach mistrz�w.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_13");	//Miejsce jako jeden ze stra�nik�w przybocznych Gomeza, miejsce jako Magnat Starego Obozu.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_14");	//Kto�, kto oddaje �ycie za Gomeza i ob�z, zas�uguje na prawo mianowania si� Magnatem.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_15");	//Daj� ci niepowtarzaln� szans�. Albo wi�c do��czysz do nas i b�dziesz jednym z najlepszych, albo stracisz t� szans� i w dalszym ci�gu pozostaniesz tylko prostym Stra�nikiem.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_16");	//Jaka wi�c jest twoja decyzja? Jeste� got�w zaj�� miejsce jako osobisty stra�nik Gomeza i ws�awi� si� jako Magnat?
	ore_baron = LOG_RUNNING;
	Log_CreateTopic(GE_BECOMEOREBARON,LOG_MISSION);
	Log_SetTopicStatus(GE_BECOMEOREBARON,LOG_RUNNING);
	B_LogEntry(GE_BECOMEOREBARON,"Kruk, jeden z Magnat�w Starego Obozu, opowiedzia� mi, jak to �ledzi� moje poczynania i przekonywa� mnie do tego, �e mog� nale�e� do najlepszych. Dlatego te� da� mi niepowtarzaln� szans� zostania jednym z przybocznych stra�nik�w Gomeza.");
	Info_ClearChoices(dia_raven_orebaron);
	Info_AddChoice(dia_raven_orebaron,"Wchodz� w to!",dia_raven_orebaron_yes);
	Info_AddChoice(dia_raven_orebaron,"Nie, nie jestem na to gotowy.",dia_raven_orebaron_no);
};

func void dia_raven_orebaron_yes()
{
	AI_Output(other,self,"DIA_Raven_OreBaron_YES_10_16");	//Wchodz� w to!
	AI_Output(self,other,"DIA_Raven_OreBaron_YES_10_17");	//�wietnie, w takim razie witam ci� w szeregu przybocznych stra�nik�w Gomeza.
	AI_Output(self,other,"DIA_Raven_OreBaron_YES_10_18");	//Od teraz nie musisz si� zajmowa� �adnymi zadaniami, ty je po prostu zlecasz innym.
	AI_Output(self,other,"DIA_Raven_OreBaron_YES_10_19");	//Nale�ysz teraz do najlepszych w tej Kolonii.
	AI_Output(self,other,"DIA_Raven_OreBaron_YES_10_20");	//Nikt ci ju� nie podskoczy.
	AI_Output(self,other,"DIA_Raven_OreBaron_YES_10_22");	//Dobrze, �e to w�a�nie TY jeste� teraz jednym z nas.
	AI_Output(self,other,"DIA_Raven_OreBaron_YES_10_23");	//Id� ju� i sprawd� si� na swoim nowym stanowisku.
	Info_ClearChoices(dia_raven_orebaron);
	ore_baron = LOG_SUCCESS;
	Log_SetTopicStatus(GE_BECOMEOREBARON,LOG_SUCCESS);
	B_LogEntry(GE_BECOMEOREBARON,"Przyj��em ofert� od Kruka i od teraz licz� si� jako jeden z Magnat�w. Uda�o mi si� zdoby� najwy�sz� rang� w Starym Obozie.");
	B_GiveXP(XP_OREBARON);
	CreateInvItem(hero,ebr_armor_m);
	CreateInvItem(self,ItAmArrow);
	B_GiveInvItems(self,hero,ItAmArrow,1);
	Npc_RemoveInvItem(hero,ItAmArrow);
	AI_EquipBestArmor(hero);
	Mdl_SetVisualBody(hero,"hum_body_Naked0",0,1,"Hum_Head_Pony",9,1,-1);
	Mdl_ApplyOverlayMds(hero,"Humans_Arrogance.mds");
	Npc_SetTrueGuild(hero,GIL_EBR);
	hero.guild = GIL_EBR;
};

func void dia_raven_orebaron_no()
{
	AI_Output(other,self,"DIA_Raven_OreBaron_NO_15_00");	//Nie, nie jestem na to gotowy.
	AI_Output(self,other,"DIA_Raven_OreBaron_NO_11_01");	//CO? Oferuj� ci tak� propozycj�, a ty jeszcze �miesz j� odrzuca�?
	AI_Output(self,other,"DIA_Raven_OreBaron_NO_11_02");	//Doprawdy... zawiod�em si�.
	AI_Output(self,other,"DIA_Raven_OreBaron_NO_11_03");	//Odejd�, zaprzepa�ci�e� swoj� szans� na bycie jednym z najlepszych.
	AI_Output(self,other,"DIA_Raven_OreBaron_NO_11_04");	//Takiej szansy nie dostaniesz ju� NIGDY...
	Info_ClearChoices(dia_raven_orebaron);
	ore_baron = LOG_FAILED;
	Log_SetTopicStatus(GE_BECOMEOREBARON,LOG_FAILED);
	B_LogEntry(GE_BECOMEOREBARON,"Kruk by� rozczarowany odrzuceniem jego oferty przeze mnie. Powiedzia�, �e takiej szansy ju� nigdy wi�cej nie dostan�. Wnioskuj�, �e ju� nie mam co pokazywa� si� u Magnat�w.");
};

