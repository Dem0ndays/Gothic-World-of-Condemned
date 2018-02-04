
instance DIA_Grim_Exit(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 999;
	condition = DIA_Grim_Exit_Condition;
	information = DIA_Grim_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Grim_Exit_Condition()
{
	return 1;
};

func void DIA_Grim_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Grim_Falle(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 2;
	condition = DIA_Grim_Falle_Condition;
	information = DIA_Grim_Falle_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Grim_Falle_Condition()
{
	if((Grim_ProtectionBully == TRUE) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void DIA_Grim_Falle_Info()
{
	AI_Output(self,other,"DIA_Grim_Falle_06_00");	//Hej, ty! Czy to nie ty chcesz do��czy� do naszego obozu?
	AI_Output(other,self,"DIA_Grim_Falle_15_01");	//A je�li chc�?
	AI_Output(self,other,"DIA_Grim_Falle_06_02");	//M�g�bym ci pom�c...
	AI_Output(other,self,"DIA_Grim_Falle_15_03");	//Jak?
	AI_Output(self,other,"DIA_Grim_Falle_06_04");	//Na zewn�trz Obozu siedzi dw�ch go�ci. Jeden z nich ukrad� co� cennego Magnatom. To cenny amulet, kt�ry mia� nam zosta� przys�any z ostatnim transportem ze �wiata zewn�trznego.
	AI_Output(self,other,"DIA_Grim_Falle_06_05");	//Kt�ry� z nich powinien mie� ten amulet przy sobie. Je�li zaatakujemy ich razem, powinno nam si� uda�. Sam raczej nie dam rady. Co ty na to?
	Info_ClearChoices(DIA_Grim_Falle);
	Info_AddChoice(DIA_Grim_Falle,"To nie dla mnie. Poszukaj sobie kogo� innego.",DIA_Grim_Falle_Deny);
	Info_AddChoice(DIA_Grim_Falle,"A co si� stanie, gdy ju� zdob�dziemy amulet?",DIA_Grim_Falle_HowShare);
	Info_AddChoice(DIA_Grim_Falle,"P�jd� z tob�.",DIA_Grim_Falle_Accepr);
};

func void DIA_Grim_Falle_Deny()
{
	AI_Output(other,self,"DIA_Grim_Falle_Deny_15_00");	//To nie dla mnie. Poszukaj sobie kogo� innego.
	AI_Output(self,other,"DIA_Grim_Falle_Deny_06_01");	//Z takim podej�ciem d�ugo tu miejsca nie zagrzejesz. Daj mi zna�, gdyby� zmieni� zdanie!
	Info_ClearChoices(DIA_Grim_Falle);
};

func void DIA_Grim_Falle_HowShare()
{
	AI_Output(other,self,"DIA_Grim_Falle_HowShare_15_00");	//A co si� stanie, gdy ju� zdob�dziemy amulet?
	AI_Output(self,other,"DIA_Grim_Falle_HowShare_06_01");	//To proste. Zwr�c� go Magnatom i odbior� nagrod�. Przy okazji powiem im, �e mi pomog�e�. Ta wiadomo�� na pewno dotrze do Gomeza!
	Info_ClearChoices(DIA_Grim_Falle);
	Info_AddChoice(DIA_Grim_Falle,"To nie dla mnie. Poszukaj sobie kogo� innego.",DIA_Grim_Falle_Deny);
	Info_AddChoice(DIA_Grim_Falle,"Nie! Albo dzielimy si� po po�owie, albo baw si� sam!",DIA_Grim_Falle_HalfHalf);
	Info_AddChoice(DIA_Grim_Falle,"P�jd� z tob�.",DIA_Grim_Falle_Accepr);
};

func void DIA_Grim_Falle_HalfHalf()
{
	AI_Output(other,self,"DIA_Grim_Falle_HalfHalf_15_00");	//Nie! Albo dzielimy si� po po�owie, albo baw si� sam!
	AI_Output(self,other,"DIA_Grim_Falle_HalfHalf_06_01");	//Niech b�dzie, p� na p�! Nagrody wystarczy dla nas dw�ch! To jak? Mog� na ciebie liczy�?
};

func void DIA_Grim_Falle_Accepr()
{
	AI_Output(other,self,"DIA_Grim_Falle_Accepr_15_00");	//P�jd� z tob�.
	AI_Output(self,other,"DIA_Grim_Falle_Accepr_06_01");	//�wietnie, daj mi zna�, gdy b�dziesz got�w.
	Info_ClearChoices(DIA_Grim_Falle);
};


instance DIA_Grim_ReadyToGo(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 2;
	condition = DIA_Grim_ReadyToGo_Condition;
	information = DIA_Grim_ReadyToGo_Info;
	permanent = 0;
	description = "Jestem gotowy. Chod�my po ten amulet.";
};


func int DIA_Grim_ReadyToGo_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Grim_Falle))
	{
		return 1;
	};
};

func void DIA_Grim_ReadyToGo_Info()
{
	AI_Output(other,self,"DIA_Grim_ReadyToGo_15_00");	//Jestem gotowy. Chod�my po ten amulet.
	AI_Output(self,other,"DIA_Grim_ReadyToGo_06_01");	//Zatem do dzie�a!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDE");
};


instance DIA_Grim_AtOCdraussen(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 3;
	condition = DIA_Grim_AtOCdraussen_Condition;
	information = DIA_Grim_AtOCdraussen_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Grim_AtOCdraussen_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Grim_ReadyToGo) && (Npc_GetDistToWP(hero,"OC_ROUND_22_CF_2_MOVEMENT") < 500))
	{
		return 1;
	};
};

func void DIA_Grim_AtOCdraussen_Info()
{
	var C_Npc Bu520;
	var C_Npc Bu534;
	AI_Output(self,other,"DIA_Grim_AtOCdraussen_06_00");	//Oto jeste�my - daleko od twojego kumpla, Diego.
	if(((Npc_GetDistToNpc(self,Bu520) < 1000) && !Npc_IsDead(Bu520)) || ((Npc_GetDistToNpc(self,Bu534) < 1000) && !Npc_IsDead(Bu534)))
	{
		AI_Output(self,other,"DIA_Grim_AtOCdraussen_06_01");	//Mamy ci przekaza� pozdrowienia od Bloodwyna!
	}
	else
	{
		AI_Output(self,other,"DIA_Grim_AtOCdraussen_06_02");	//Mam ci przekaza� pozdrowienia od Bloodwyna!
	};
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
	Bu520 = Hlp_GetNpc(VLK_520_Buddler);
	Bu534 = Hlp_GetNpc(VLK_534_Buddler);
	if((Npc_GetDistToNpc(self,Bu520) < 1000) && !Npc_IsDead(Bu520))
	{
		Npc_SetTarget(Bu520,other);
		AI_StartState(Bu520,ZS_Attack,1,"");
	};
	if((Npc_GetDistToNpc(self,Bu534) < 1000) && !Npc_IsDead(Bu534))
	{
		Npc_SetTarget(Bu534,other);
		AI_StartState(Bu534,ZS_Attack,1,"");
	};
};


instance DIA_Grim_NACHFalle(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 2;
	condition = DIA_Grim_NACHFalle_Condition;
	information = DIA_Grim_NACHFalle_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Grim_NACHFalle_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Grim_AtOCdraussen) && (Npc_GetDistToNpc(self,other) < ZivilAnquatschDist))
	{
		return 1;
	};
};

func void DIA_Grim_NACHFalle_Info()
{
	AI_Output(other,self,"DIA_Grim_NACHFalle_15_01");	//Ty g�upcze, chcia�e� mnie zwabi� w pu�apk�...
	AI_Output(self,other,"DIA_Grim_NACHFalle_06_02");	//Hej, stary! Jedziemy na tym samym w�zku! Ja te� nie zamierzam ry� pod ziemi� do ko�ca moich dni!
	AI_Output(self,other,"DIA_Grim_NACHFalle_06_03");	//Dlatego wype�niam polecenia Stra�nik�w. Ja te� chc� do��czy� do Obozu!
	AI_Output(self,other,"DIA_Grim_NACHFalle_06_04");	//Zreszt� sam zas�u�y�e� na ca�y ten bajzel. Dlaczego zadar�e� ze Stra�nikami?
	AI_Output(self,other,"DIA_Grim_NACHFalle_06_05");	//Osobi�cie nic do ciebie nie mam. To jak b�dzie - wojna czy pok�j.
	Info_ClearChoices(DIA_Grim_NACHFalle);
	Info_AddChoice(DIA_Grim_NACHFalle,"Wojna.",DIA_Grim_NACHFalle_Weiterpruegeln);
	Info_AddChoice(DIA_Grim_NACHFalle,"Pok�j.",DIA_Grim_NACHFalle_Frieden);
};

func void DIA_Grim_NACHFalle_Weiterpruegeln()
{
	AI_Output(other,self,"DIA_Grim_NACHFalle_Weiterpruegeln_15_00");	//Nie mam nic przeciwko wojnie!
	AI_Output(self,other,"DIA_Grim_NACHFalle_Weiterpruegeln_06_01");	//Stary, mam ju� tego do��...
	Info_ClearChoices(DIA_Grim_NACHFalle);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void DIA_Grim_NACHFalle_Frieden()
{
	AI_Output(other,self,"DIA_Grim_NACHFalle_Frieden_15_00");	//Niech b�dzie pok�j.
	AI_Output(self,other,"DIA_Grim_NACHFalle_Frieden_06_01");	//Ciesz� si�, �e mogli�my to sobie wyja�ni�. Najlepiej zapomnijmy o ca�ej sprawie. Od tej chwili jestem po twojej stronie.
	AI_Output(self,other,"DIA_Grim_NACHFalle_Frieden_06_02");	//Gdyby� jeszcze kiedy� wpad� w tarapaty, mo�esz na mnie liczy�. W ko�cu jestem ci co� winien.
	Info_ClearChoices(DIA_Grim_NACHFalle);
	Npc_SetPermAttitude(self,ATT_FRIENDLY);
};


var int FirstOver;

instance DIA_Grim_Hallo(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = DIA_Grim_Hallo_Condition;
	information = DIA_Grim_Hallo_Info;
	permanent = 0;
	description = "Jestem tu nowy.";
};


func int DIA_Grim_Hallo_Condition()
{
	if(Grim_ProtectionBully == TRUE)
	{
		FirstOver = TRUE;
	};
	if(FirstOver == FALSE)
	{
		return 1;
	};
};

func void DIA_Grim_Hallo_Info()
{
	AI_Output(other,self,"DIA_Grim_Hallo_15_00");	//Jestem tu nowy.
	AI_Output(self,other,"DIA_Grim_Hallo_06_01");	//��todzi�b, co? Nazywam si� Grim - te� jestem tu od niedawna. Wrzucili mnie nied�ugo przed tob�.
};


instance DIA_Grim_Leben(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 2;
	condition = DIA_Grim_Leben_Condition;
	information = DIA_Grim_Leben_Info;
	permanent = 0;
	description = "Jak wygl�da �ycie w kolonii?";
};


func int DIA_Grim_Leben_Condition()
{
	return 1;
};

func void DIA_Grim_Leben_Info()
{
	AI_Output(other,self,"DIA_Grim_Leben_15_00");	//Jak wygl�da �ycie w kolonii?
	AI_Output(self,other,"DIA_Grim_Leben_06_01");	//Nie jest �le, je�li zap�acisz Stra�nikom za ochron�.
};


instance DIA_Grim_Aufnahme(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 3;
	condition = DIA_Grim_Aufnahme_Condition;
	information = DIA_Grim_Aufnahme_Info;
	permanent = 0;
	description = "Co mam zrobi�, je�li chc� zosta� przyj�ty do tego obozu?";
};


func int DIA_Grim_Aufnahme_Condition()
{
	return 1;
};

func void DIA_Grim_Aufnahme_Info()
{
	AI_Output(other,self,"DIA_Grim_Aufnahme_15_00");	//Co mam zrobi�, je�li chc� zosta� przyj�ty do tego obozu?
	AI_Output(self,other,"DIA_Grim_Aufnahme_06_01");	//Na pocz�tek musisz zosta� Cieniem. W tym celu poszukaj sobie jakiego� wp�ywowego opiekuna. Kogo�, kto wyja�ni ci co w trawie piszczy i wska�e ci w�a�ciw� drog�.
	AI_Output(self,other,"DIA_Grim_Aufnahme_06_02");	//Na twoim miejscu trzyma�bym si� blisko Diego - ja tak zrobi�em i nie �a�uj�!
	AI_Output(self,other,"DIA_Grim_Aufnahme_06_03");	//On podda ci� testowi zaufania - dla ka�dego wygl�da on troch� inaczej. No i musisz wype�nia� jeszcze zadania zlecane ci przez Cienie.
	AI_Output(self,other,"DIA_Grim_Aufnahme_06_04");	//Je�li ci si� uda, zostaniesz jednym z nas.
};


var int Grim_Tests;

instance DIA_Grim_HowFarAreYou(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 4;
	condition = DIA_Grim_HowFarAreYou_Condition;
	information = DIA_Grim_HowFarAreYou_Info;
	permanent = 1;
	description = "A ty, jak sobie radzisz?";
};


func int DIA_Grim_HowFarAreYou_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Grim_Aufnahme) && Npc_KnowsInfo(hero,Info_Diego_Rules) && (Kapitel == 1))
	{
		return 1;
	};
};

func void DIA_Grim_HowFarAreYou_Info()
{
	AI_Output(other,self,"DIA_Grim_HowFarAreYou_15_00");	//A ty, jak sobie radzisz?
	AI_Output(self,other,"DIA_Grim_HowFarAreYou_06_01");	//Rozmawia�em ju� z Dexterem, Z�ym i R�czk�. To jedni najbardziej wp�ywowych ludzi w Zewn�trznym Pier�cieniu.
	if(!Grim_Tests)
	{
		B_LogEntry(CH1_JoinOC,"Dexter, Z�y i R�czka nale�� do wp�ywowych Cieni.");
		Grim_Tests = TRUE;
	};
};


instance DIA_Grim_YourPDV(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 5;
	condition = DIA_Grim_YourPDV_Condition;
	information = DIA_Grim_YourPDV_Info;
	permanent = 0;
	description = "A jak wygl�da� TW�J test zaufania?";
};


func int DIA_Grim_YourPDV_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Grim_Aufnahme))
	{
		return 1;
	};
};

func void DIA_Grim_YourPDV_Info()
{
	AI_Output(other,self,"DIA_Grim_YourPDV_15_00");	//A jak wygl�da� TW�J test zaufania?
	AI_Output(self,other,"DIA_Grim_YourPDV_06_01");	//Tego nie mog� ci powiedzie�. O takich rzeczach lepiej nie m�wi� g�o�no!
};


instance DIA_Grim_INEXTREMO(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = DIA_Grim_INEXTREMO_Condition;
	information = DIA_Grim_INEXTREMO_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Grim_INEXTREMO_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Grim_INEXTREMO_Info()
{
	AI_Output(self,other,"DIA_Grim_INEXTREMO_06_01");	//Hej, s�ysza�e� ju� wie�ci?
	AI_Output(self,other,"DIA_Grim_INEXTREMO_06_02");	//S� tu In Extremo! W�a�nie weszli na scen�!
	AI_Output(self,other,"DIA_Grim_INEXTREMO_06_03");	//Pospiesz si�, albo przegapisz koncert!
	Npc_ExchangeRoutine(self,"InExtremo");
	AI_StopProcessInfos(self);
};


instance DIA_GRIM_SCHATTEN(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = dia_grim_schatten_condition;
	information = dia_grim_schatten_info;
	permanent = 1;
	important = 0;
	description = "Jeste� teraz Cieniem?";
};


func int dia_grim_schatten_condition()
{
	if(Kapitel >= 2)
	{
		return TRUE;
	};
};

func void dia_grim_schatten_info()
{
	AI_Output(other,self,"DIA_Grim_SCHATTEN_06_01");	//Jeste� teraz Cieniem?
	AI_Output(self,other,"DIA_Grim_SCHATTEN_06_02");	//Tak, przyj�li mnie niedawno.
	AI_Output(self,other,"DIA_Grim_SCHATTEN_06_03");	//Naprawd�, mi�o si� �yje jako jeden z ludzi Gomeza.
	AI_Output(self,other,"DIA_Grim_SCHATTEN_06_04");	//Nic lepszego sobie nie mog� wyobrazi�.
	if(Npc_GetTrueGuild(hero) == GIL_STT)
	{
		AI_Output(self,other,"DIA_Grim_SCHATTEN_06_05");	//I zdaje si�, �e ty te�, kolego.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Grim_INEXTREMOAWAY(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = DIA_Grim_INEXTREMOAWAY_Condition;
	information = DIA_Grim_INEXTREMOAWAY_Info;
	permanent = 0;
	important = 0;
	description = "Gdzie s� In Extremo?";
};


func int DIA_Grim_INEXTREMOAWAY_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Grim_INEXTREMO) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Grim_INEXTREMOAWAY_Info()
{
	AI_Output(hero,self,"DIA_Grim_INEXTREMOAWAY_15_01");	//Gdzie s� In Extremo?
	AI_Output(self,hero,"DIA_Grim_INEXTREMOAWAY_06_02");	//Pojechali dalej. Szkoda. Zd��y�em si� przyzwyczai� do imprez pod scen�.
	AI_StopProcessInfos(self);
};


var int grim_member;
var int grim_kumpel;

instance dia_grim_letsgo(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 9;
	condition = dia_grim_letsgo_condition;
	information = dia_grim_letsgo_info;
	permanent = 0;
	description = "M�wi�e�, �e mog� odt�d liczy� na twoj� pomoc.";
};


func int dia_grim_letsgo_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Grim_NACHFalle))
	{
		return 1;
	};
};

func void dia_grim_letsgo_info()
{
	AI_Output(other,self,"DIA_Grim_LetsToGo_15_00");	//M�wi�e�, �e mog� odt�d liczy� na twoj� pomoc.
	AI_Output(self,other,"DIA_Grim_LetsToGo_06_01");	//Masz na my�li t� spraw� z amuletem? Bez obaw, dotrzymuj� danego s�owa.
	AI_Output(self,other,"DIA_Grim_LetsToGo_06_02");	//Je�li b�dziesz mnie potrzebowa�, to po prostu powiedz i dotrzymam ci towarzystwa podczas walki.
	grim_kumpel = TRUE;
};


instance DIA_GRIM_GOGO(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 9;
	condition = dia_grim_gogo_condition;
	information = dia_grim_gogo_info;
	permanent = 1;
	description = "Chod� ze mn�.";
};


func int dia_grim_gogo_condition()
{
	if(Npc_KnowsInfo(hero,dia_grim_letsgo) && (grim_kumpel == TRUE) && (grim_member == FALSE))
	{
		return 1;
	};
};

func void dia_grim_gogo_info()
{
	AI_Output(other,self,"DIA_Grim_GoGo_15_00");	//Chod� ze mn�.
	AI_Output(self,other,"DIA_Grim_GoGo_06_01");	//Jasne. B�d� tu� za tob�.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
	grim_member = TRUE;
};


instance DIA_GRIM_STOP(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 9;
	condition = dia_grim_stop_condition;
	information = dia_grim_stop_info;
	permanent = 1;
	description = "Tutaj nasze drogi si� rozchodz�.";
};


func int dia_grim_stop_condition()
{
	if(Npc_KnowsInfo(hero,dia_grim_letsgo) && (grim_member == TRUE))
	{
		return 1;
	};
};

func void dia_grim_stop_info()
{
	AI_Output(other,self,"DIA_Grim_Stop_15_00");	//Tutaj nasze drogi si� rozchodz�.
	AI_Output(self,other,"DIA_Grim_Stop_06_01");	//Jak sobie chcesz. Je�li b�dziesz czego� potrzebowa�, wiesz gdzie mnie znale��.
	AI_StopProcessInfos(self);
	if((Kapitel == 1) || (Kapitel >= 3))
	{
		Npc_ExchangeRoutine(self,"START");
	}
	else if(Kapitel == 2)
	{
		Npc_ExchangeRoutine(self,"INEXTREMO");
	};
	grim_member = FALSE;
};


instance info_grim_ncwait(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = info_grim_ncwait_condition;
	information = info_grim_ncwait_info;
	important = 1;
	permanent = 0;
};


func int info_grim_ncwait_condition()
{
	if(Npc_GetDistToWP(self,"OW_PATH_174") < 1000)
	{
		return TRUE;
	};
};

func void info_grim_ncwait_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Grim_NCWAIT_09_01");	//Czekaj no...
	AI_Output(self,other,"Info_Grim_NCWAIT_09_02");	//Nie potrafi� powiedzie� dlaczego, ale jest w tej wie�y co� niepokoj�cego. Czuj� to.
	AI_Output(self,other,"Info_Grim_NCWAIT_15_03");	//Oczywi�cie je�li� ch�tny j� zwiedzi�, to bardzo prosz�. Tylko nie jestem do ko�ca pewien, czy wyjdziemy stamt�d �ywi.
	AI_Output(self,other,"Info_Grim_NCWAIT_15_04");	//Tak tylko m�wi�, �eby nie by�o, �e ci� nie ostrzega�em.
	AI_StopProcessInfos(self);
};


instance info_grim_psi(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = info_grim_psi_condition;
	information = info_grim_psi_info;
	important = 1;
	permanent = 0;
};


func int info_grim_psi_condition()
{
	if(Npc_GetDistToWP(self,"PSI_START") < 1000)
	{
		return TRUE;
	};
};

func void info_grim_psi_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Grim_PSI_09_01");	//A wi�c to jest ten ca�y ob�z na bagnie...
	AI_Output(self,other,"Info_Grim_PSI_09_02");	//Nigdy tu jeszcze nie by�em, ale s�ysza�em, �e ci go�cie s� ca�kiem w porz�dku.
	AI_Output(self,other,"Info_Grim_PSI_15_03");	//Tylko paru z nich ma nieco poprzewracane w g��wce, bo wypalili troch� za du�o tego swojego towaru.
	AI_Output(self,other,"Info_Grim_PSI_15_04");	//Mo�e wejd�my do �rodka i rozejrzyjmy si�.
	AI_StopProcessInfos(self);
};


instance INFO_GRIM_SHIP(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = info_grim_ship_condition;
	information = info_grim_ship_info;
	important = 1;
	permanent = 0;
};


func int info_grim_ship_condition()
{
	if(Npc_GetDistToWP(self,"LOCATION_25_01") < 1000)
	{
		return TRUE;
	};
};

func void info_grim_ship_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Grim_Ship_09_01");	//Hm... statek...
	AI_Output(self,other,"Info_Grim_Ship_09_02");	//My�lisz, �e jest tam jeszcze co zw�dzi�?
	AI_Output(self,other,"Info_Grim_Ship_15_03");	//S�ysza�em kiedy� opowie�ci o piratach, zanim mnie tu w og�le zrzucono.
	AI_Output(self,other,"Info_Grim_Ship_15_04");	//To m�g�by by� w�a�nie jeden z ich statk�w. Diabli wiedz� ile czasu ju� tu jest.
	AI_Output(self,other,"Info_Grim_Ship_15_05");	//No... tak czy inaczej, mog�oby by� tam co� warto�ciowego.
	AI_StopProcessInfos(self);
};


instance info_grim_orc(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = info_grim_orc_condition;
	information = info_grim_orc_info;
	important = 1;
	permanent = 0;
};


func int info_grim_orc_condition()
{
	if(Npc_GetDistToWP(self,"OW_PATH_016") < 1000)
	{
		return TRUE;
	};
};

func void info_grim_orc_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Grim_ORC_09_01");	//Cz�owieku, ty naprawd� chcesz tam i��?!
	AI_Output(self,other,"Info_Grim_ORC_09_02");	//Orkowe terytoria to chyba nie na nasze si�y, co?
	AI_Output(self,other,"Info_Grim_ORC_15_03");	//Kr�ci si� tam pe�no wszelakiego plugastwa.
	AI_Output(self,other,"Info_Grim_ORC_15_04");	//S�ysza�em, �e jest tam nawet ca�e miasto pe�ne ork�w.
	AI_Output(self,other,"Info_Grim_ORC_15_05");	//Nie mam poj�cia czy to prawda. W ko�cu jeszcze nikt nigdy stamt�d nie wr�ci�...
	AI_StopProcessInfos(self);
};


instance info_grim_nc(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = info_grim_nc_condition;
	information = info_grim_nc_info;
	important = 1;
	permanent = 0;
};


func int info_grim_nc_condition()
{
	if(Npc_GetDistToWP(self,"OW_PATH_07_21") < 1000)
	{
		return TRUE;
	};
};

func void info_grim_nc_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Grim_NC_09_01");	//Tylko sp�jrz na to - Nowy Ob�z. Miejsce, do kt�rego nigdy nie chcia�em trafi�.
	AI_Output(self,other,"Info_Grim_NC_09_02");	//Wcze�niej nas�ucha�em si� o nim samych z�ych rzeczy. �e pono� s� tutaj go�cie, kt�rzy potrafi� za kawa�ek chleba poder�n�� ci gard�o.
	AI_Output(self,other,"Info_Grim_NC_15_03");	//Je�li jednak mimo wszystko chcia�by� si� tam wybra�, to trzymaj lepiej bro� w pogotowiu.
	AI_Output(self,other,"Info_Grim_NC_15_04");	//Z takimi �ajzami nigdy nic nie wiadomo...
	AI_StopProcessInfos(self);
};


instance info_grim_grave(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = info_grim_grave_condition;
	information = info_grim_grave_info;
	important = 1;
	permanent = 0;
};


func int info_grim_grave_condition()
{
	if(Npc_GetDistToWP(self,"OW_PATH_3_STONES") < 1000)
	{
		return TRUE;
	};
};

func void info_grim_grave_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Grim_Grave_09_01");	//Czekaj!
	AI_Output(self,other,"Info_Grim_Grave_09_02");	//S�ysza�em plotki, �e tutaj a� si� roi od nieumar�ych.
	AI_Output(self,other,"Info_Grim_Grave_15_03");	//Pono� pewien Magnat ze Starego Obozu kiedy� tam zszed� i ju� nigdy nie wr�ci�. Teraz nazywany jest "Stra�nikiem".
	AI_Output(self,other,"Info_Grim_Grave_15_04");	//Od tego czasu ka�dy unika tego miejsca.
	AI_StopProcessInfos(self);
};


instance info_grim_start(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = info_grim_start_condition;
	information = info_grim_start_info;
	important = 1;
	permanent = 0;
};


func int info_grim_start_condition()
{
	if(Npc_GetDistToWP(self,"WP_INTRO_FALL3") < 1000)
	{
		return TRUE;
	};
};

func void info_grim_start_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Grim_Start_09_01");	//Nie min�o zbyt du�o czasu, odk�d tu by�em ostatniego razu.
	AI_Output(self,other,"Info_Grim_Start_09_02");	//Ju� wsp�czuj� tym biednym bydlakom, kt�rych si� tu wrzuci jako nast�pnych.
	AI_StopProcessInfos(self);
};


instance INFO_GRIM_EASTEREGG(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = info_grim_easteregg_condition;
	information = info_grim_easteregg_info;
	important = 1;
	permanent = 0;
};


func int info_grim_easteregg_condition()
{
	if(Npc_KnowsInfo(hero,info_grim_ncwait) && Npc_KnowsInfo(hero,info_grim_psi) && Npc_KnowsInfo(hero,info_grim_nc) && Npc_KnowsInfo(hero,info_grim_orc) && Npc_KnowsInfo(hero,info_grim_grave) && Npc_KnowsInfo(hero,info_grim_start))
	{
		return TRUE;
	};
};

func void info_grim_easteregg_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Grim_EasterEgg_09_01");	//Powiem ci, �e nawet ca�kiem fajnie jest si� tak z tob� powa��sa�.
	AI_Output(self,other,"Info_Grim_EasterEgg_09_02");	//Nie by� to wcale taki g�upi pomys�, �eby si� z tob� zabra�.
	AI_Output(self,other,"Info_Grim_EasterEgg_09_03");	//Obiecuj� ci, �e je�li kiedy� si� znowu st�d wydostaniemy, to b�d� ci winien ogromn� przys�ug�.
	B_GiveXP(XP_GRIMGUIDE);
	AI_StopProcessInfos(self);
};

