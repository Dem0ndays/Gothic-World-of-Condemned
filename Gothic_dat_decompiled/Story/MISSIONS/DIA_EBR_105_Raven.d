
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
	AI_Output(self,other,"DIA_Raven_FirstIn_10_00");	//Co mogê dla ciebie zrobiæ?
};


instance DIA_Raven_Who(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_Who_Condition;
	information = DIA_Raven_Who_Info;
	permanent = 0;
	description = "Kim jesteœ?";
};


func int DIA_Raven_Who_Condition()
{
	return 1;
};

func void DIA_Raven_Who_Info()
{
	AI_Output(other,self,"DIA_Raven_Who_15_00");	//Kim jesteœ?
	AI_Output(self,other,"DIA_Raven_Who_10_01");	//Nazywam siê Kruk. Jestem praw¹ rêk¹ Gomeza. Ka¿dy, kto chce siê spotkaæ z szefem, musi najpierw porozmawiaæ ze mn¹.
};


instance DIA_Raven_Krautbote(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_Krautbote_Condition;
	information = DIA_Raven_Krautbote_Info;
	permanent = 0;
	description = "Mam trochê bagiennego ziela dla Gomeza od Cor Kaloma.";
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
	AI_Output(other,self,"DIA_Raven_Krautbote_15_00");	//Mam trochê bagiennego ziela dla Gomeza od Cor Kaloma.
	AI_Output(self,other,"DIA_Raven_Krautbote_10_01");	//Gomez nie zajmuje siê takimi rzeczami osobiœcie. To dzia³ka Bartholo.
	AI_Output(self,other,"DIA_Raven_Krautbote_10_02");	//Znajdziesz go w komnacie na prawo od wejœcia, albo w kuchni w du¿ej wie¿y.
	AI_Output(self,other,"DIA_Raven_Krautbote_10_03");	//Oczywiœcie w nocy pewnie œpi. Na twoim miejscu nie przeszkadza³bym mu do rana.
	B_LogEntry(CH1_KrautBote,"Ziele dla Gomeza nale¿y dostarczyæ do Bartholo. Znajdê go w rezydencji Magnatów.");
};


instance DIA_Raven_Aufnahme(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_Aufnahme_Condition;
	information = DIA_Raven_Aufnahme_Info;
	permanent = 0;
	description = "Chcê siê zobaczyæ z Gomezem. Thorus powiedzia³, ¿e mogê zostaæ Cieniem.";
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
	AI_Output(other,self,"DIA_Raven_Aufnahme_15_00");	//Chcê siê zobaczyæ z Gomezem. Thorus powiedzia³, ¿e mogê zostaæ Cieniem.
	AI_Output(self,other,"DIA_Raven_Aufnahme_10_01");	//Dobrych ludzi nigdy nie za wielu. Chyba masz wystarczaj¹co równo pod sufitem. Mo¿esz siê nam przydaæ.
	AI_Output(self,other,"DIA_Raven_Aufnahme_10_02");	//Zabiorê ciê do Gomeza. ChodŸ za mn¹, tylko niczego nie dotykaj!
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
	AI_Output(self,other,"DIA_Raven_There_10_01");	//Gomez jest tam. Jeœli nie oka¿esz mu nale¿nego szacunku, osobiœcie nauczê ciê dobrych manier. Zrozumiano?
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
	description = "Jak idzie handel rud¹?";
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
	AI_Output(other,self,"DIA_Raven_PERM_15_00");	//Jak idzie handel rud¹?
	AI_Output(self,other,"DIA_Raven_PERM_10_01");	//Stara Kopalnia jakoœ radzi sobie z wydobyciem. Ostatni transport do zewnêtrznego œwiata by³ bardzo du¿y.
};


instance DIA_Raven_BinDabei(C_Info)
{
	npc = EBR_105_Raven;
	nr = 8;
	condition = DIA_Raven_BinDabei_Condition;
	information = DIA_Raven_BinDabei_Info;
	permanent = 0;
	description = "Gomez powiedzia³, ¿e siê nadajê.";
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
	AI_Output(other,self,"DIA_Raven_BinDabei_15_00");	//Gomez powiedzia³, ¿e siê nadajê.
	AI_Output(self,other,"DIA_Raven_BinDabei_10_01");	//Œwietnie! Tak siê sk³ada, ¿e mo¿esz od razu udowodniæ, na co ciê staæ. Jest dla ciebie robota.
	AI_Output(self,other,"DIA_Raven_BinDabei_10_02");	//To nie powinno byæ zbyt trudne, jeœli rzeczywiœcie masz kontakty, o jakich mówi³eœ.
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
	description = "Co mam zrobiæ?";
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
	AI_Output(other,self,"DIA_Raven_SpySect_15_00");	//Co mam zrobiæ?
	AI_Output(self,other,"DIA_Raven_SpySect_10_01");	//Prowadzimy intensywn¹ wymianê handlow¹ z Bractwem, co nie znaczy, ¿e im do koñca ufamy.
	AI_Output(self,other,"DIA_Raven_SpySect_10_02");	//IdŸ na bagna.
	AI_Output(self,other,"DIA_Raven_SpySect_10_03");	//Kiedy dotrzesz do Obozu Bractwa, miej uszy i oczy szeroko otwarte. Ka¿dy strzêpek informacji mo¿e siê okazaæ niezwykle cenny.
	AI_Output(self,other,"DIA_Raven_SpySect_10_04");	//Im wiêcej wywêszysz, tym lepiej. Ta misja wymaga odrobiny taktu, jeœli wiesz, co mam na myœli.
	AI_Output(other,self,"DIA_Raven_SpySect_15_05");	//Bez obaw. Postaram siê ich nie rozz³oœciæ.
	AI_Output(self,other,"DIA_Raven_SpySect_10_06");	//Wiedzia³em, ¿e siê zrozumiemy.
	Raven_SpySect = LOG_RUNNING;
	Log_CreateTopic(CH1_GoToPsi,LOG_MISSION);
	Log_SetTopicStatus(CH1_GoToPsi,LOG_RUNNING);
	B_LogEntry(CH1_GoToPsi,"Kruk wys³a³ mnie do obozu Bractwa. Mam siê tam trochê rozejrzeæ i donieœæ mu o wszystkich podejrzanych wydarzeniach. Mo¿e uda mi siê dowiedzieæ czegoœ ciekawego.");
};


instance DIA_Raven_Equipment(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_Equipment_Condition;
	information = DIA_Raven_Equipment_Info;
	permanent = 0;
	description = "Gdzie mogê dostaæ lepsze wyposa¿enie?";
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
	AI_Output(other,self,"DIA_Raven_Equipment_15_00");	//Gdzie mogê dostaæ lepsze wyposa¿enie?
	AI_Output(self,other,"DIA_Raven_Equipment_10_01");	//Porozmawiaj z Diego, on da ci jak¹œ zbrojê. Ten pancerz nie tylko uchroni ciê przed œmierci¹, ale bêdzie równie¿ s³u¿y³ jako znak rozpoznawczy.
	AI_Output(self,other,"DIA_Raven_Equipment_10_02");	//Dziêki niemu zyskasz dostêp do wszystkich wa¿niejszych miejsc.
	AI_Output(self,other,"DIA_Raven_Equipment_10_03");	//Gdybyœ potrzebowa³ broni, porozmawiaj ze Skipem. Znajdziesz go w tej wielkiej szopie, w lewym tylnym rogu zamkowego dziedziñca.
	Log_CreateTopic(GE_TraderOC,LOG_NOTE);
	B_LogEntry(GE_TraderOC,"Diego ma lepsze wyposa¿enie dla Cieni Gomeza. Znajdê go przy zamkowej bramie.");
	if(!Npc_KnowsInfo(hero,DIA_Skip_First))
	{
		B_LogEntry(GE_TraderOC,"Skip, stra¿nik z tylnego dziedziñca, sprzedaje orê¿, ale tylko ludziom Gomeza.");
	};
};


instance DIA_Raven_SpyBericht(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_SpyBericht_Condition;
	information = DIA_Raven_SpyBericht_Info;
	permanent = 1;
	description = "Pomyœla³em, ¿e zdam ci raport...";
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
	AI_Output(other,self,"DIA_Raven_SpyBericht_15_00");	//Pomyœla³em, ¿e zdam ci raport...
	AI_Output(self,other,"DIA_Raven_SpyBericht_10_01");	//To dobrze. Lubiê byæ informowany na bie¿¹co.
	if((Npc_HasItems(other,ItAt_Crawlerqueen) >= 1) || (CorKalom_BringMCQBalls == LOG_SUCCESS))
	{
		if(Kapitel >= 3)
		{
			AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_04");	//Odby³o siê wielkie przywo³anie.
			AI_Output(self,other,"DIA_Raven_SpyBericht_10_04");	//Dobrze siê spisa³eœ.
			Raven_SpySect = LOG_SUCCESS;
			B_GiveXP(XP_ReportToRaven);
			Log_SetTopicStatus(CH1_GoToPsi,LOG_SUCCESS);
			B_LogEntry(CH1_GoToPsi,"Kruk sp³awi³ mnie byle gadk¹. Nie potrzeba mi takich przyjació³. Od tej pory dzia³am na w³asny rachunek.");
		}
		else
		{
			AI_Output(other,self,"DIA_Raven_SpyBericht_15_02");	//Teraz Bractwo potrzebuje jaj królowej pe³zaczy. Przygotuj¹ z nich napój, który umo¿liwi im nawi¹zanie kontaktu ze Œni¹cym. Mam te jaja przy sobie.
			if(CorKalom_BringMCQBalls != LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Raven_SpyBericht_10_03");	//Hmm, interesuj¹ce. Ciekawe czy to zadzia³a. Zanieœ jaja do œwi¹tyni.
			}
			else
			{
				AI_Output(self,other,"DIA_Raven_SpyBericht_10_04");	//Dobrze siê spisa³eœ.
				Raven_SpySect = LOG_SUCCESS;
				B_GiveXP(XP_ReportToRaven);
				Log_SetTopicStatus(CH1_GoToPsi,LOG_SUCCESS);
				B_LogEntry(CH1_GoToPsi,"Kruk sp³awi³ mnie byle gadk¹. Nie potrzeba mi takich przyjació³. Od tej pory dzia³am na w³asny rachunek.");
			};
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Raven_SpyBericht_15_05");	//Niestety, jeszcze nie wiem, co planuj¹ ludzie z Bractwa.
		AI_Output(self,other,"DIA_Raven_SpyBericht_10_06");	//To dlaczego zawracasz mi g³owê?
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
	AI_Output(other,self,"DIA_Raven_OreBaron_10_01");	//Co siê sta³o?
	AI_Output(self,other,"DIA_Raven_OreBaron_10_02");	//Wiele o tobie s³ysza³em. Wyrobi³eœ sobie renomê w obozie, jak i wielce siê mu przys³u¿y³eœ.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_03");	//Osobiœcie œledzi³em twoj¹ karierê w tym obozie.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_04");	//By³eœ nikim, kiedy trafi³eœ do tej Kolonii.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_05");	//Tymczasem wypracowa³eœ sobie wysok¹ pozycjê, i to szybciej, ni¿ ktokolwiek inny.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_06");	//Po swoim krótkim pobycie w Kolonii zdecydowa³eœ siê do³¹czyæ do Cieni. Ale nawet wtedy nie by³eœ takim zwyczajnym Cieniem, jak pozostali.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_07");	//By³eœ tym, który uwolni³ nas od plagi pe³zaczy w kopalni, i to w pojedynkê.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_08");	//Jako Stra¿nik odwali³eœ kawa³ solidnej roboty, jak i wykona³eœ imponuj¹c¹ liczbê zadañ. ¯aden z naszych Stra¿ników nie mo¿e siê poszczyciæ takimi osi¹gniêciami co ty.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_09");	//Ponadto dobitnie udowodni³eœ swoj¹ lojalnoœæ w stosunku do Starego Obozu.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_11");	//Naradzi³em siê razem z reszt¹ Magnatów i wspólnie podjêliœmy decyzjê.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_12");	//Jesteœmy sk³onni zaoferowaæ ci miejsce w szeregach mistrzów.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_13");	//Miejsce jako jeden ze stra¿ników przybocznych Gomeza, miejsce jako Magnat Starego Obozu.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_14");	//Ktoœ, kto oddaje ¿ycie za Gomeza i obóz, zas³uguje na prawo mianowania siê Magnatem.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_15");	//Dajê ci niepowtarzaln¹ szansê. Albo wiêc do³¹czysz do nas i bêdziesz jednym z najlepszych, albo stracisz tê szansê i w dalszym ci¹gu pozostaniesz tylko prostym Stra¿nikiem.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_16");	//Jaka wiêc jest twoja decyzja? Jesteœ gotów zaj¹æ miejsce jako osobisty stra¿nik Gomeza i ws³awiæ siê jako Magnat?
	ore_baron = LOG_RUNNING;
	Log_CreateTopic(GE_BECOMEOREBARON,LOG_MISSION);
	Log_SetTopicStatus(GE_BECOMEOREBARON,LOG_RUNNING);
	B_LogEntry(GE_BECOMEOREBARON,"Kruk, jeden z Magnatów Starego Obozu, opowiedzia³ mi, jak to œledzi³ moje poczynania i przekonywa³ mnie do tego, ¿e mogê nale¿eæ do najlepszych. Dlatego te¿ da³ mi niepowtarzaln¹ szansê zostania jednym z przybocznych stra¿ników Gomeza.");
	Info_ClearChoices(dia_raven_orebaron);
	Info_AddChoice(dia_raven_orebaron,"Wchodzê w to!",dia_raven_orebaron_yes);
	Info_AddChoice(dia_raven_orebaron,"Nie, nie jestem na to gotowy.",dia_raven_orebaron_no);
};

func void dia_raven_orebaron_yes()
{
	AI_Output(other,self,"DIA_Raven_OreBaron_YES_10_16");	//Wchodzê w to!
	AI_Output(self,other,"DIA_Raven_OreBaron_YES_10_17");	//Œwietnie, w takim razie witam ciê w szeregu przybocznych stra¿ników Gomeza.
	AI_Output(self,other,"DIA_Raven_OreBaron_YES_10_18");	//Od teraz nie musisz siê zajmowaæ ¿adnymi zadaniami, ty je po prostu zlecasz innym.
	AI_Output(self,other,"DIA_Raven_OreBaron_YES_10_19");	//Nale¿ysz teraz do najlepszych w tej Kolonii.
	AI_Output(self,other,"DIA_Raven_OreBaron_YES_10_20");	//Nikt ci ju¿ nie podskoczy.
	AI_Output(self,other,"DIA_Raven_OreBaron_YES_10_22");	//Dobrze, ¿e to w³aœnie TY jesteœ teraz jednym z nas.
	AI_Output(self,other,"DIA_Raven_OreBaron_YES_10_23");	//IdŸ ju¿ i sprawdŸ siê na swoim nowym stanowisku.
	Info_ClearChoices(dia_raven_orebaron);
	ore_baron = LOG_SUCCESS;
	Log_SetTopicStatus(GE_BECOMEOREBARON,LOG_SUCCESS);
	B_LogEntry(GE_BECOMEOREBARON,"Przyj¹³em ofertê od Kruka i od teraz liczê siê jako jeden z Magnatów. Uda³o mi siê zdobyæ najwy¿sz¹ rangê w Starym Obozie.");
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
	AI_Output(self,other,"DIA_Raven_OreBaron_NO_11_01");	//CO? Oferujê ci tak¹ propozycjê, a ty jeszcze œmiesz j¹ odrzucaæ?
	AI_Output(self,other,"DIA_Raven_OreBaron_NO_11_02");	//Doprawdy... zawiod³em siê.
	AI_Output(self,other,"DIA_Raven_OreBaron_NO_11_03");	//OdejdŸ, zaprzepaœci³eœ swoj¹ szansê na bycie jednym z najlepszych.
	AI_Output(self,other,"DIA_Raven_OreBaron_NO_11_04");	//Takiej szansy nie dostaniesz ju¿ NIGDY...
	Info_ClearChoices(dia_raven_orebaron);
	ore_baron = LOG_FAILED;
	Log_SetTopicStatus(GE_BECOMEOREBARON,LOG_FAILED);
	B_LogEntry(GE_BECOMEOREBARON,"Kruk by³ rozczarowany odrzuceniem jego oferty przeze mnie. Powiedzia³, ¿e takiej szansy ju¿ nigdy wiêcej nie dostanê. Wnioskujê, ¿e ju¿ nie mam co pokazywaæ siê u Magnatów.");
};

