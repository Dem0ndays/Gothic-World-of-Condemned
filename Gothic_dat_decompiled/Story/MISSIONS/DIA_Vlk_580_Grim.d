
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
	AI_Output(self,other,"DIA_Grim_Falle_06_00");	//Hej, ty! Czy to nie ty chcesz do³¹czyæ do naszego obozu?
	AI_Output(other,self,"DIA_Grim_Falle_15_01");	//A jeœli chcê?
	AI_Output(self,other,"DIA_Grim_Falle_06_02");	//Móg³bym ci pomóc...
	AI_Output(other,self,"DIA_Grim_Falle_15_03");	//Jak?
	AI_Output(self,other,"DIA_Grim_Falle_06_04");	//Na zewn¹trz Obozu siedzi dwóch goœci. Jeden z nich ukrad³ coœ cennego Magnatom. To cenny amulet, który mia³ nam zostaæ przys³any z ostatnim transportem ze œwiata zewnêtrznego.
	AI_Output(self,other,"DIA_Grim_Falle_06_05");	//Któryœ z nich powinien mieæ ten amulet przy sobie. Jeœli zaatakujemy ich razem, powinno nam siê udaæ. Sam raczej nie dam rady. Co ty na to?
	Info_ClearChoices(DIA_Grim_Falle);
	Info_AddChoice(DIA_Grim_Falle,"To nie dla mnie. Poszukaj sobie kogoœ innego.",DIA_Grim_Falle_Deny);
	Info_AddChoice(DIA_Grim_Falle,"A co siê stanie, gdy ju¿ zdobêdziemy amulet?",DIA_Grim_Falle_HowShare);
	Info_AddChoice(DIA_Grim_Falle,"Pójdê z tob¹.",DIA_Grim_Falle_Accepr);
};

func void DIA_Grim_Falle_Deny()
{
	AI_Output(other,self,"DIA_Grim_Falle_Deny_15_00");	//To nie dla mnie. Poszukaj sobie kogoœ innego.
	AI_Output(self,other,"DIA_Grim_Falle_Deny_06_01");	//Z takim podejœciem d³ugo tu miejsca nie zagrzejesz. Daj mi znaæ, gdybyœ zmieni³ zdanie!
	Info_ClearChoices(DIA_Grim_Falle);
};

func void DIA_Grim_Falle_HowShare()
{
	AI_Output(other,self,"DIA_Grim_Falle_HowShare_15_00");	//A co siê stanie, gdy ju¿ zdobêdziemy amulet?
	AI_Output(self,other,"DIA_Grim_Falle_HowShare_06_01");	//To proste. Zwrócê go Magnatom i odbiorê nagrodê. Przy okazji powiem im, ¿e mi pomog³eœ. Ta wiadomoœæ na pewno dotrze do Gomeza!
	Info_ClearChoices(DIA_Grim_Falle);
	Info_AddChoice(DIA_Grim_Falle,"To nie dla mnie. Poszukaj sobie kogoœ innego.",DIA_Grim_Falle_Deny);
	Info_AddChoice(DIA_Grim_Falle,"Nie! Albo dzielimy siê po po³owie, albo baw siê sam!",DIA_Grim_Falle_HalfHalf);
	Info_AddChoice(DIA_Grim_Falle,"Pójdê z tob¹.",DIA_Grim_Falle_Accepr);
};

func void DIA_Grim_Falle_HalfHalf()
{
	AI_Output(other,self,"DIA_Grim_Falle_HalfHalf_15_00");	//Nie! Albo dzielimy siê po po³owie, albo baw siê sam!
	AI_Output(self,other,"DIA_Grim_Falle_HalfHalf_06_01");	//Niech bêdzie, pó³ na pó³! Nagrody wystarczy dla nas dwóch! To jak? Mogê na ciebie liczyæ?
};

func void DIA_Grim_Falle_Accepr()
{
	AI_Output(other,self,"DIA_Grim_Falle_Accepr_15_00");	//Pójdê z tob¹.
	AI_Output(self,other,"DIA_Grim_Falle_Accepr_06_01");	//Œwietnie, daj mi znaæ, gdy bêdziesz gotów.
	Info_ClearChoices(DIA_Grim_Falle);
};


instance DIA_Grim_ReadyToGo(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 2;
	condition = DIA_Grim_ReadyToGo_Condition;
	information = DIA_Grim_ReadyToGo_Info;
	permanent = 0;
	description = "Jestem gotowy. ChodŸmy po ten amulet.";
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
	AI_Output(other,self,"DIA_Grim_ReadyToGo_15_00");	//Jestem gotowy. ChodŸmy po ten amulet.
	AI_Output(self,other,"DIA_Grim_ReadyToGo_06_01");	//Zatem do dzie³a!
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
	AI_Output(self,other,"DIA_Grim_AtOCdraussen_06_00");	//Oto jesteœmy - daleko od twojego kumpla, Diego.
	if(((Npc_GetDistToNpc(self,Bu520) < 1000) && !Npc_IsDead(Bu520)) || ((Npc_GetDistToNpc(self,Bu534) < 1000) && !Npc_IsDead(Bu534)))
	{
		AI_Output(self,other,"DIA_Grim_AtOCdraussen_06_01");	//Mamy ci przekazaæ pozdrowienia od Bloodwyna!
	}
	else
	{
		AI_Output(self,other,"DIA_Grim_AtOCdraussen_06_02");	//Mam ci przekazaæ pozdrowienia od Bloodwyna!
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
	AI_Output(other,self,"DIA_Grim_NACHFalle_15_01");	//Ty g³upcze, chcia³eœ mnie zwabiæ w pu³apkê...
	AI_Output(self,other,"DIA_Grim_NACHFalle_06_02");	//Hej, stary! Jedziemy na tym samym wózku! Ja te¿ nie zamierzam ryæ pod ziemi¹ do koñca moich dni!
	AI_Output(self,other,"DIA_Grim_NACHFalle_06_03");	//Dlatego wype³niam polecenia Stra¿ników. Ja te¿ chcê do³¹czyæ do Obozu!
	AI_Output(self,other,"DIA_Grim_NACHFalle_06_04");	//Zreszt¹ sam zas³u¿y³eœ na ca³y ten bajzel. Dlaczego zadar³eœ ze Stra¿nikami?
	AI_Output(self,other,"DIA_Grim_NACHFalle_06_05");	//Osobiœcie nic do ciebie nie mam. To jak bêdzie - wojna czy pokój.
	Info_ClearChoices(DIA_Grim_NACHFalle);
	Info_AddChoice(DIA_Grim_NACHFalle,"Wojna.",DIA_Grim_NACHFalle_Weiterpruegeln);
	Info_AddChoice(DIA_Grim_NACHFalle,"Pokój.",DIA_Grim_NACHFalle_Frieden);
};

func void DIA_Grim_NACHFalle_Weiterpruegeln()
{
	AI_Output(other,self,"DIA_Grim_NACHFalle_Weiterpruegeln_15_00");	//Nie mam nic przeciwko wojnie!
	AI_Output(self,other,"DIA_Grim_NACHFalle_Weiterpruegeln_06_01");	//Stary, mam ju¿ tego doœæ...
	Info_ClearChoices(DIA_Grim_NACHFalle);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void DIA_Grim_NACHFalle_Frieden()
{
	AI_Output(other,self,"DIA_Grim_NACHFalle_Frieden_15_00");	//Niech bêdzie pokój.
	AI_Output(self,other,"DIA_Grim_NACHFalle_Frieden_06_01");	//Cieszê siê, ¿e mogliœmy to sobie wyjaœniæ. Najlepiej zapomnijmy o ca³ej sprawie. Od tej chwili jestem po twojej stronie.
	AI_Output(self,other,"DIA_Grim_NACHFalle_Frieden_06_02");	//Gdybyœ jeszcze kiedyœ wpad³ w tarapaty, mo¿esz na mnie liczyæ. W koñcu jestem ci coœ winien.
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
	AI_Output(self,other,"DIA_Grim_Hallo_06_01");	//¯ó³todziób, co? Nazywam siê Grim - te¿ jestem tu od niedawna. Wrzucili mnie nied³ugo przed tob¹.
};


instance DIA_Grim_Leben(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 2;
	condition = DIA_Grim_Leben_Condition;
	information = DIA_Grim_Leben_Info;
	permanent = 0;
	description = "Jak wygl¹da ¿ycie w kolonii?";
};


func int DIA_Grim_Leben_Condition()
{
	return 1;
};

func void DIA_Grim_Leben_Info()
{
	AI_Output(other,self,"DIA_Grim_Leben_15_00");	//Jak wygl¹da ¿ycie w kolonii?
	AI_Output(self,other,"DIA_Grim_Leben_06_01");	//Nie jest Ÿle, jeœli zap³acisz Stra¿nikom za ochronê.
};


instance DIA_Grim_Aufnahme(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 3;
	condition = DIA_Grim_Aufnahme_Condition;
	information = DIA_Grim_Aufnahme_Info;
	permanent = 0;
	description = "Co mam zrobiæ, jeœli chcê zostaæ przyjêty do tego obozu?";
};


func int DIA_Grim_Aufnahme_Condition()
{
	return 1;
};

func void DIA_Grim_Aufnahme_Info()
{
	AI_Output(other,self,"DIA_Grim_Aufnahme_15_00");	//Co mam zrobiæ, jeœli chcê zostaæ przyjêty do tego obozu?
	AI_Output(self,other,"DIA_Grim_Aufnahme_06_01");	//Na pocz¹tek musisz zostaæ Cieniem. W tym celu poszukaj sobie jakiegoœ wp³ywowego opiekuna. Kogoœ, kto wyjaœni ci co w trawie piszczy i wska¿e ci w³aœciw¹ drogê.
	AI_Output(self,other,"DIA_Grim_Aufnahme_06_02");	//Na twoim miejscu trzyma³bym siê blisko Diego - ja tak zrobi³em i nie ¿a³ujê!
	AI_Output(self,other,"DIA_Grim_Aufnahme_06_03");	//On podda ciê testowi zaufania - dla ka¿dego wygl¹da on trochê inaczej. No i musisz wype³niaæ jeszcze zadania zlecane ci przez Cienie.
	AI_Output(self,other,"DIA_Grim_Aufnahme_06_04");	//Jeœli ci siê uda, zostaniesz jednym z nas.
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
	AI_Output(self,other,"DIA_Grim_HowFarAreYou_06_01");	//Rozmawia³em ju¿ z Dexterem, Z³ym i R¹czk¹. To jedni najbardziej wp³ywowych ludzi w Zewnêtrznym Pierœcieniu.
	if(!Grim_Tests)
	{
		B_LogEntry(CH1_JoinOC,"Dexter, Z³y i R¹czka nale¿¹ do wp³ywowych Cieni.");
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
	description = "A jak wygl¹da³ TWÓJ test zaufania?";
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
	AI_Output(other,self,"DIA_Grim_YourPDV_15_00");	//A jak wygl¹da³ TWÓJ test zaufania?
	AI_Output(self,other,"DIA_Grim_YourPDV_06_01");	//Tego nie mogê ci powiedzieæ. O takich rzeczach lepiej nie mówiæ g³oœno!
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
	AI_Output(self,other,"DIA_Grim_INEXTREMO_06_01");	//Hej, s³ysza³eœ ju¿ wieœci?
	AI_Output(self,other,"DIA_Grim_INEXTREMO_06_02");	//S¹ tu In Extremo! W³aœnie weszli na scenê!
	AI_Output(self,other,"DIA_Grim_INEXTREMO_06_03");	//Pospiesz siê, albo przegapisz koncert!
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
	description = "Jesteœ teraz Cieniem?";
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
	AI_Output(other,self,"DIA_Grim_SCHATTEN_06_01");	//Jesteœ teraz Cieniem?
	AI_Output(self,other,"DIA_Grim_SCHATTEN_06_02");	//Tak, przyjêli mnie niedawno.
	AI_Output(self,other,"DIA_Grim_SCHATTEN_06_03");	//Naprawdê, mi³o siê ¿yje jako jeden z ludzi Gomeza.
	AI_Output(self,other,"DIA_Grim_SCHATTEN_06_04");	//Nic lepszego sobie nie mogê wyobraziæ.
	if(Npc_GetTrueGuild(hero) == GIL_STT)
	{
		AI_Output(self,other,"DIA_Grim_SCHATTEN_06_05");	//I zdaje siê, ¿e ty te¿, kolego.
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
	description = "Gdzie s¹ In Extremo?";
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
	AI_Output(hero,self,"DIA_Grim_INEXTREMOAWAY_15_01");	//Gdzie s¹ In Extremo?
	AI_Output(self,hero,"DIA_Grim_INEXTREMOAWAY_06_02");	//Pojechali dalej. Szkoda. Zd¹¿y³em siê przyzwyczaiæ do imprez pod scen¹.
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
	description = "Mówi³eœ, ¿e mogê odt¹d liczyæ na twoj¹ pomoc.";
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
	AI_Output(other,self,"DIA_Grim_LetsToGo_15_00");	//Mówi³eœ, ¿e mogê odt¹d liczyæ na twoj¹ pomoc.
	AI_Output(self,other,"DIA_Grim_LetsToGo_06_01");	//Masz na myœli tê sprawê z amuletem? Bez obaw, dotrzymujê danego s³owa.
	AI_Output(self,other,"DIA_Grim_LetsToGo_06_02");	//Jeœli bêdziesz mnie potrzebowa³, to po prostu powiedz i dotrzymam ci towarzystwa podczas walki.
	grim_kumpel = TRUE;
};


instance DIA_GRIM_GOGO(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 9;
	condition = dia_grim_gogo_condition;
	information = dia_grim_gogo_info;
	permanent = 1;
	description = "ChodŸ ze mn¹.";
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
	AI_Output(other,self,"DIA_Grim_GoGo_15_00");	//ChodŸ ze mn¹.
	AI_Output(self,other,"DIA_Grim_GoGo_06_01");	//Jasne. Bêdê tu¿ za tob¹.
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
	description = "Tutaj nasze drogi siê rozchodz¹.";
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
	AI_Output(other,self,"DIA_Grim_Stop_15_00");	//Tutaj nasze drogi siê rozchodz¹.
	AI_Output(self,other,"DIA_Grim_Stop_06_01");	//Jak sobie chcesz. Jeœli bêdziesz czegoœ potrzebowa³, wiesz gdzie mnie znaleŸæ.
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
	AI_Output(self,other,"Info_Grim_NCWAIT_09_02");	//Nie potrafiê powiedzieæ dlaczego, ale jest w tej wie¿y coœ niepokoj¹cego. Czujê to.
	AI_Output(self,other,"Info_Grim_NCWAIT_15_03");	//Oczywiœcie jeœliœ chêtny j¹ zwiedziæ, to bardzo proszê. Tylko nie jestem do koñca pewien, czy wyjdziemy stamt¹d ¿ywi.
	AI_Output(self,other,"Info_Grim_NCWAIT_15_04");	//Tak tylko mówiê, ¿eby nie by³o, ¿e ciê nie ostrzega³em.
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
	AI_Output(self,other,"Info_Grim_PSI_09_01");	//A wiêc to jest ten ca³y obóz na bagnie...
	AI_Output(self,other,"Info_Grim_PSI_09_02");	//Nigdy tu jeszcze nie by³em, ale s³ysza³em, ¿e ci goœcie s¹ ca³kiem w porz¹dku.
	AI_Output(self,other,"Info_Grim_PSI_15_03");	//Tylko paru z nich ma nieco poprzewracane w g³ówce, bo wypalili trochê za du¿o tego swojego towaru.
	AI_Output(self,other,"Info_Grim_PSI_15_04");	//Mo¿e wejdŸmy do œrodka i rozejrzyjmy siê.
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
	AI_Output(self,other,"Info_Grim_Ship_09_02");	//Myœlisz, ¿e jest tam jeszcze co zwêdziæ?
	AI_Output(self,other,"Info_Grim_Ship_15_03");	//S³ysza³em kiedyœ opowieœci o piratach, zanim mnie tu w ogóle zrzucono.
	AI_Output(self,other,"Info_Grim_Ship_15_04");	//To móg³by byæ w³aœnie jeden z ich statków. Diabli wiedz¹ ile czasu ju¿ tu jest.
	AI_Output(self,other,"Info_Grim_Ship_15_05");	//No... tak czy inaczej, mog³oby byæ tam coœ wartoœciowego.
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
	AI_Output(self,other,"Info_Grim_ORC_09_01");	//Cz³owieku, ty naprawdê chcesz tam iœæ?!
	AI_Output(self,other,"Info_Grim_ORC_09_02");	//Orkowe terytoria to chyba nie na nasze si³y, co?
	AI_Output(self,other,"Info_Grim_ORC_15_03");	//Krêci siê tam pe³no wszelakiego plugastwa.
	AI_Output(self,other,"Info_Grim_ORC_15_04");	//S³ysza³em, ¿e jest tam nawet ca³e miasto pe³ne orków.
	AI_Output(self,other,"Info_Grim_ORC_15_05");	//Nie mam pojêcia czy to prawda. W koñcu jeszcze nikt nigdy stamt¹d nie wróci³...
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
	AI_Output(self,other,"Info_Grim_NC_09_01");	//Tylko spójrz na to - Nowy Obóz. Miejsce, do którego nigdy nie chcia³em trafiæ.
	AI_Output(self,other,"Info_Grim_NC_09_02");	//Wczeœniej nas³ucha³em siê o nim samych z³ych rzeczy. ¯e ponoæ s¹ tutaj goœcie, którzy potrafi¹ za kawa³ek chleba poder¿n¹æ ci gard³o.
	AI_Output(self,other,"Info_Grim_NC_15_03");	//Jeœli jednak mimo wszystko chcia³byœ siê tam wybraæ, to trzymaj lepiej broñ w pogotowiu.
	AI_Output(self,other,"Info_Grim_NC_15_04");	//Z takimi ³ajzami nigdy nic nie wiadomo...
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
	AI_Output(self,other,"Info_Grim_Grave_09_02");	//S³ysza³em plotki, ¿e tutaj a¿ siê roi od nieumar³ych.
	AI_Output(self,other,"Info_Grim_Grave_15_03");	//Ponoæ pewien Magnat ze Starego Obozu kiedyœ tam zszed³ i ju¿ nigdy nie wróci³. Teraz nazywany jest "Stra¿nikiem".
	AI_Output(self,other,"Info_Grim_Grave_15_04");	//Od tego czasu ka¿dy unika tego miejsca.
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
	AI_Output(self,other,"Info_Grim_Start_09_01");	//Nie minê³o zbyt du¿o czasu, odk¹d tu by³em ostatniego razu.
	AI_Output(self,other,"Info_Grim_Start_09_02");	//Ju¿ wspó³czujê tym biednym bydlakom, których siê tu wrzuci jako nastêpnych.
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
	AI_Output(self,other,"Info_Grim_EasterEgg_09_01");	//Powiem ci, ¿e nawet ca³kiem fajnie jest siê tak z tob¹ powa³êsaæ.
	AI_Output(self,other,"Info_Grim_EasterEgg_09_02");	//Nie by³ to wcale taki g³upi pomys³, ¿eby siê z tob¹ zabraæ.
	AI_Output(self,other,"Info_Grim_EasterEgg_09_03");	//Obiecujê ci, ¿e jeœli kiedyœ siê znowu st¹d wydostaniemy, to bêdê ci winien ogromn¹ przys³ugê.
	B_GiveXP(XP_GRIMGUIDE);
	AI_StopProcessInfos(self);
};

