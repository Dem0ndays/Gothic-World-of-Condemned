
instance KDF_403_Drago_RUNE(C_Info)
{
	npc = KDF_403_Drago;
	condition = KDF_403_Drago_RUNE_Condition;
	information = KDF_403_Drago_RUNE_Info;
	important = 1;
	permanent = 0;
};


func int KDF_403_Drago_RUNE_Condition()
{
	if(Npc_KnowsInfo(hero,KDF_402_Corristo_ROBE))
	{
		return TRUE;
	};
};

func void KDF_403_Drago_RUNE_Info()
{
	AI_Output(self,other,"KDF_403_Drago_RUNE_Info_13_01");	//Przyjmij tê runê jako znak przychylnoœci Innosa. Oby ciê chroni³a podczas marszu przez tw¹ œcie¿kê ¿ycia.
	CreateInvItem(self,ItArRuneFirebolt);
	B_GiveInvItems(self,other,ItArRuneFirebolt,1);
	AI_StopProcessInfos(self);
};


instance KDF_403_Drago_Exit(C_Info)
{
	npc = KDF_403_Drago;
	nr = 999;
	condition = KDF_403_Drago_Exit_Condition;
	information = KDF_403_Drago_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int KDF_403_Drago_Exit_Condition()
{
	return TRUE;
};

func void KDF_403_Drago_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance kdf_403_drago_geschah(C_Info)
{
	npc = KDF_403_Drago;
	condition = kdf_403_drago_geschah_condition;
	information = kdf_403_drago_geschah_info;
	important = 0;
	permanent = 0;
	description = "Masz dla mnie jakieœ zadanie?";
};


func int kdf_403_drago_geschah_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_STT) || (Npc_GetTrueGuild(hero) == GIL_GRD) || (Npc_GetTrueGuild(hero) == GIL_KDF))
	{
		return TRUE;
	};
};

func void kdf_403_drago_geschah_info()
{
	AI_Output(other,self,"KDF_403_Drago_Geschah_Info_13_01");	//Masz dla mnie jakieœ zadanie?
	AI_Output(self,other,"KDF_403_Drago_Geschah_Info_13_02");	//A tak, znalaz³oby siê zajêcie dla ciebie.
	AI_Output(self,other,"KDF_403_Drago_Geschah_Info_13_03");	//Polega³oby ono na odszukaniu pewnych artefaktów.
	AI_Output(self,other,"KDF_403_Drago_Geschah_Info_13_04");	//Te artefakty s¹ bardzo wa¿ne dla naszych badañ, poniewa¿ zawieraj¹ w sobie nieznan¹ dla nas magiê.
	AI_Output(self,other,"KDF_403_Drago_Geschah_Info_13_05");	//Jakiœ czas temu pos³a³em kilku ludzi na poszukiwania, jednak nigdy nie wrócili.
	AI_Output(self,other,"KDF_403_Drago_Geschah_Info_13_06");	//Dlatego te poszukiwania mog¹ byæ bardzo niebezpieczne.
};


var int joinoc_aufgabe;

instance kdf_403_drago_artefakte(C_Info)
{
	npc = KDF_403_Drago;
	condition = kdf_403_drago_artefakte_condition;
	information = kdf_403_drago_artefakte_info;
	important = 0;
	permanent = 0;
	description = "Co to za artefakty?";
};


func int kdf_403_drago_artefakte_condition()
{
	if(Npc_KnowsInfo(hero,kdf_403_drago_geschah))
	{
		return TRUE;
	};
};

func void kdf_403_drago_artefakte_info()
{
	AI_Output(other,self,"KDF_403_Drago_Artefakte_Info_13_01");	//Co to by³y za artefakty, których szukali?
	if((Npc_KnowsInfo(hero,kdf_403_drago_geschah) && (Npc_GetTrueGuild(hero) == GIL_STT)) || (Npc_KnowsInfo(hero,kdf_403_drago_geschah) && (Npc_GetTrueGuild(hero) == GIL_GRD)) || (Npc_KnowsInfo(hero,kdf_403_drago_geschah) && (Npc_GetTrueGuild(hero) == GIL_KDF)))
	{
		AI_Output(self,other,"KDF_403_Drago_Artefakte_Info_13_02");	//Magiczne runy z dawno zapomnianego ju¿ okresu magii.
		AI_Output(self,other,"KDF_403_Drago_Artefakte_Info_13_03");	//Prastare legendy g³osz¹, ¿e niegdyœ w ruinach klasztornych nad morzem ¿yli mnisi, którzy posiadali zdolnoœæ przemieniania siê w zwierzêta.
		AI_Output(self,other,"KDF_403_Drago_Artefakte_Info_13_04");	//Te artefakty s¹ dla nas takie wa¿ne, poniewa¿ mog³yby staæ siê prawdziwym narzêdziem zniszczenia, gdyby wpad³y w niepowo³ane rêce.
		AI_Output(self,other,"KDF_403_Drago_Artefakte_Info_13_05");	//Wprawdzie przeszukaliœmy te ruiny ju¿ wiele lat temu, ale wówczas ¿adnych artefaktów tam nie znaleŸliœmy.
		AI_Output(self,other,"KDF_403_Drago_Artefakte_Info_13_06");	//Dlatego pos³a³em ludzi do innych miejsc, o których wspominaj¹ nasze pisma.
		AI_Output(self,other,"KDF_403_Drago_Artefakte_Info_13_07");	//Co najwyraŸniej by³o na pró¿no...
		joinoc_aufgabe = TRUE;
	}
	else
	{
		AI_Output(self,other,"KDF_403_Drago_Artefakte_Info_13_08");	//Hmm... nie jestem pewien czy mogê ci zaufaæ. Dopiero jeœli zdecydujesz siê do³¹czyæ do naszego obozu, bêdê móg³ powierzyæ ci to zadanie.
		AI_StopProcessInfos(self);
	};
};


instance KDF_403_DRAGO_WONOCH(C_Info)
{
	npc = KDF_403_Drago;
	condition = kdf_403_drago_wonoch_condition;
	information = kdf_403_drago_wonoch_info;
	important = 0;
	permanent = 0;
	description = "S¹ jakieœ inne tereny?";
};


func int kdf_403_drago_wonoch_condition()
{
	if(Npc_KnowsInfo(hero,kdf_403_drago_artefakte) && (joinoc_aufgabe == TRUE))
	{
		return TRUE;
	};
};

func void kdf_403_drago_wonoch_info()
{
	AI_Output(other,self,"KDF_403_Drago_WoNoch_Info_13_01");	//S¹ jeszcze jakieœ inne tereny, w których mog³yby znajdowaæ siê te artefakty?
	AI_Output(self,other,"KDF_403_Drago_WoNoch_Info_13_02");	//Tak, jest jedno miejsce, w którym jeszcze nie szukaliœmy.
	AI_Output(self,other,"KDF_403_Drago_WoNoch_Info_13_03");	//Chodzi o prastare miejsce kultu nieopodal st¹d.
	AI_Output(other,self,"KDF_403_Drago_WoNoch_Info_13_04");	//To dlaczego jeszcze go nie zbadaliœcie?
	AI_Output(self,other,"KDF_403_Drago_WoNoch_Info_13_05");	//Bo orkowie korzystaj¹ z tego miejsca. To by³oby piekielnie niebezpieczne, poniewa¿ przebywa tam kilku potê¿nych szamanów orków.
	AI_Output(self,other,"KDF_403_Drago_WoNoch_Info_13_06");	//Znalaz³o siê kiedyœ kilku œmia³ków, którzy próbowali odwiedziæ to miejsce kultu. ¯aden z nich ju¿ stamt¹d nie wróci³.
};


instance kdf_403_drago_versuchen(C_Info)
{
	npc = KDF_403_Drago;
	condition = kdf_403_drago_versuchen_condition;
	information = kdf_403_drago_versuchen_info;
	important = 0;
	permanent = 0;
	description = "Ja spróbujê.";
};


func int kdf_403_drago_versuchen_condition()
{
	if(Npc_KnowsInfo(hero,kdf_403_drago_artefakte) && (joinoc_aufgabe == TRUE))
	{
		return TRUE;
	};
};

func void kdf_403_drago_versuchen_info()
{
	AI_Output(other,self,"KDF_403_Drago_versuchen_Info_13_01");	//Ja spróbujê.
	AI_Output(self,other,"KDF_403_Drago_versuchen_Info_13_02");	//¯e co?! Jesteœ tego pewny?
	AI_Output(other,self,"KDF_403_Drago_versuchen_Info_13_03");	//Jeœli istnieje droga prowadz¹ca do tych artefaktów - znajdê j¹.
	AI_Output(self,other,"KDF_403_Drago_versuchen_Info_13_04");	//No dobrze. W takim razie bêdê tu na ciebie czekaæ. Jeœli ci siê uda, przynieœ mi te artefakty i pomówimy o twojej nagrodzie.
	AI_Output(self,other,"KDF_403_Drago_versuchen_Info_13_05");	//WeŸ jeszcze ze sob¹ te mikstury lecznicze. Uœmierz¹ twój ból, jeœli tylko zranisz siê podczas walki.
	AI_Output(self,other,"KDF_403_Drago_versuchen_Info_13_06");	//Niech Innos ma ciê w swojej opiece.
	Log_CreateTopic(ARTEFACTS,LOG_MISSION);
	Log_SetTopicStatus(ARTEFACTS,LOG_RUNNING);
	B_LogEntry(ARTEFACTS,"Drago, jeden z Magów Ognia ze Starego Obozu, poprosi³ mnie o odnalezienie miejsca kultu orków i rozejrzenie siê tam za pewnym artefaktem.");
	magic_artefacts = LOG_RUNNING;
	Wld_InsertNpc(orc_5047_shaman,"OW_PATH_ORCRUIN_GOLEM");
	AI_StopProcessInfos(self);
	CreateInvItems(self,ItFo_Potion_Health_02,2);
	B_GiveInvItems(self,other,ItFo_Potion_Health_02,2);
};


instance KDF_403_DRAGO_WO(C_Info)
{
	npc = KDF_403_Drago;
	condition = kdf_403_drago_wo_condition;
	information = kdf_403_drago_wo_info;
	important = 0;
	permanent = 0;
	description = "Gdzie dok³adnie znajduje siê to miejsce kultu?";
};


func int kdf_403_drago_wo_condition()
{
	if(Npc_KnowsInfo(hero,kdf_403_drago_versuchen))
	{
		return TRUE;
	};
};

func void kdf_403_drago_wo_info()
{
	AI_Output(other,self,"KDF_403_Drago_Wo_Info_13_01");	//Gdzie dok³adnie znajduje siê to miejsce kultu?
	AI_Output(self,other,"KDF_403_Drago_Wo_Info_13_02");	//Poza obozem znajdziesz cz³owieka imieniem Cavalorn. Na lewo od jego chaty ci¹gnie siê szeroki w¹wóz. Wystarczy po prostu siê nim udaæ.
	B_LogEntry(ARTEFACTS,"To miejsce kultu znajduje siê w pobli¿u chaty Cavalorna. Wystarczy po prostu udaæ siê tamtejszym w¹wozem, a¿ w koñcu powinienem dotrzeæ do mojego celu.");
};


instance kdf_403_drago_kultståtte(C_Info)
{
	npc = KDF_403_Drago;
	condition = kdf_403_drago_kultståtte_condition;
	information = kdf_403_drago_kultståtte_info;
	important = 0;
	permanent = 0;
	description = "By³em w tym miejscu kultu.";
};


func int kdf_403_drago_kultståtte_condition()
{
	if(Npc_KnowsInfo(hero,kdf_403_drago_versuchen) && Npc_HasItems(other,itarrunetrfscavenger))
	{
		return TRUE;
	};
};

func void kdf_403_drago_kultståtte_info()
{
	AI_Output(other,self,"KDF_403_Drago_Kultstätte_Info_13_01");	//By³em w tym miejscu kultu.
	AI_Output(self,other,"KDF_403_Drago_Kultstätte_Info_13_02");	//I jak? Co tam znalaz³eœ?
	Info_ClearChoices(kdf_403_drago_kultståtte);
	Info_AddChoice(kdf_403_drago_kultståtte,"Znalaz³em tê runê przemiany.",kdf_403_drago_kultståtte_ja);
	Info_AddChoice(kdf_403_drago_kultståtte,"Nic tam ciekawego nie by³o.",kdf_403_drago_kultståtte_nein);
};

func void kdf_403_drago_kultståtte_ja()
{
	AI_Output(other,self,"KDF_403_Drago_Kultstätte_JA_15_00");	//Znalaz³em tê runê przemiany.
	AI_Output(self,other,"KDF_403_Drago_Kultstätte_JA_11_01");	//Znalaz³eœ? To znakomicie! Poka¿ mi tê runê.
	AI_Output(other,self,"KDF_403_Drago_Kultstätte_JA_11_02");	//Oto ona.
	AI_Output(self,other,"KDF_403_Drago_Kultstätte_JA_11_03");	//Wyœwiadczy³eœ nam wielk¹ przys³ugê. Taka runa mog³aby byæ przyczyn¹ katastrofalnych skutków w niepowo³anych rêkach.
	AI_Output(self,other,"KDF_403_Drago_Kultstätte_JA_11_04");	//WeŸ to jako znak mojej wdziêcznoœci i podziêkowanie od Innosa.
	B_GiveXP(XP_MYSTERIOUSNOTICES2);
	Log_SetTopicStatus(ARTEFACTS,LOG_SUCCESS);
	B_LogEntry(ARTEFACTS,"Odda³em Drago runê. By³ bardzo zadowolony i nagrody nie posk¹pi³.");
	magic_artefacts = LOG_SUCCESS;
	CreateInvItem(self,Schutzring_Magie1_Fire1);
	B_GiveInvItems(self,other,Schutzring_Magie1_Fire1,1);
	B_GiveInvItems(other,self,itarrunetrfscavenger,1);
	Npc_RemoveInvItem(self,itarrunetrfscavenger);
	AI_StopProcessInfos(self);
};

func void kdf_403_drago_kultståtte_nein()
{
	AI_Output(other,self,"KDF_403_Drago_Kultstätte_NEIN_15_00");	//Nic tam ciekawego nie by³o.
	AI_Output(self,other,"KDF_403_Drago_Kultstätte_NEIN_11_01");	//To niedobrze. Czyli wszystkie nasze starania na pró¿no.
	AI_Output(self,other,"KDF_403_Drago_Kultstätte_NEIN_11_02");	//Poœwiêcê siê znowu tym pismom i poszukam jakichœ wskazówek.
	AI_Output(self,other,"KDF_403_Drago_Kultstätte_NEIN_11_03");	//Mo¿esz ju¿ iœæ i zaj¹æ siê swoimi zadaniami.
	Log_SetTopicStatus(ARTEFACTS,LOG_FAILED);
	B_LogEntry(ARTEFACTS,"Nie odda³em runy Drago i powiedzia³em mu, ¿e nic tam ciekawego nie znalaz³em.");
	magic_artefacts = LOG_FAILED;
	AI_StopProcessInfos(self);
};

