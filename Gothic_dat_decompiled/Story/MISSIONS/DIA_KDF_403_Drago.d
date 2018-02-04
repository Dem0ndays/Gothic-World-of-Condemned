
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
	AI_Output(self,other,"KDF_403_Drago_RUNE_Info_13_01");	//Przyjmij t� run� jako znak przychylno�ci Innosa. Oby ci� chroni�a podczas marszu przez tw� �cie�k� �ycia.
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
	description = "Masz dla mnie jakie� zadanie?";
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
	AI_Output(other,self,"KDF_403_Drago_Geschah_Info_13_01");	//Masz dla mnie jakie� zadanie?
	AI_Output(self,other,"KDF_403_Drago_Geschah_Info_13_02");	//A tak, znalaz�oby si� zaj�cie dla ciebie.
	AI_Output(self,other,"KDF_403_Drago_Geschah_Info_13_03");	//Polega�oby ono na odszukaniu pewnych artefakt�w.
	AI_Output(self,other,"KDF_403_Drago_Geschah_Info_13_04");	//Te artefakty s� bardzo wa�ne dla naszych bada�, poniewa� zawieraj� w sobie nieznan� dla nas magi�.
	AI_Output(self,other,"KDF_403_Drago_Geschah_Info_13_05");	//Jaki� czas temu pos�a�em kilku ludzi na poszukiwania, jednak nigdy nie wr�cili.
	AI_Output(self,other,"KDF_403_Drago_Geschah_Info_13_06");	//Dlatego te poszukiwania mog� by� bardzo niebezpieczne.
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
	AI_Output(other,self,"KDF_403_Drago_Artefakte_Info_13_01");	//Co to by�y za artefakty, kt�rych szukali?
	if((Npc_KnowsInfo(hero,kdf_403_drago_geschah) && (Npc_GetTrueGuild(hero) == GIL_STT)) || (Npc_KnowsInfo(hero,kdf_403_drago_geschah) && (Npc_GetTrueGuild(hero) == GIL_GRD)) || (Npc_KnowsInfo(hero,kdf_403_drago_geschah) && (Npc_GetTrueGuild(hero) == GIL_KDF)))
	{
		AI_Output(self,other,"KDF_403_Drago_Artefakte_Info_13_02");	//Magiczne runy z dawno zapomnianego ju� okresu magii.
		AI_Output(self,other,"KDF_403_Drago_Artefakte_Info_13_03");	//Prastare legendy g�osz�, �e niegdy� w ruinach klasztornych nad morzem �yli mnisi, kt�rzy posiadali zdolno�� przemieniania si� w zwierz�ta.
		AI_Output(self,other,"KDF_403_Drago_Artefakte_Info_13_04");	//Te artefakty s� dla nas takie wa�ne, poniewa� mog�yby sta� si� prawdziwym narz�dziem zniszczenia, gdyby wpad�y w niepowo�ane r�ce.
		AI_Output(self,other,"KDF_403_Drago_Artefakte_Info_13_05");	//Wprawdzie przeszukali�my te ruiny ju� wiele lat temu, ale w�wczas �adnych artefakt�w tam nie znale�li�my.
		AI_Output(self,other,"KDF_403_Drago_Artefakte_Info_13_06");	//Dlatego pos�a�em ludzi do innych miejsc, o kt�rych wspominaj� nasze pisma.
		AI_Output(self,other,"KDF_403_Drago_Artefakte_Info_13_07");	//Co najwyra�niej by�o na pr�no...
		joinoc_aufgabe = TRUE;
	}
	else
	{
		AI_Output(self,other,"KDF_403_Drago_Artefakte_Info_13_08");	//Hmm... nie jestem pewien czy mog� ci zaufa�. Dopiero je�li zdecydujesz si� do��czy� do naszego obozu, b�d� m�g� powierzy� ci to zadanie.
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
	description = "S� jakie� inne tereny?";
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
	AI_Output(other,self,"KDF_403_Drago_WoNoch_Info_13_01");	//S� jeszcze jakie� inne tereny, w kt�rych mog�yby znajdowa� si� te artefakty?
	AI_Output(self,other,"KDF_403_Drago_WoNoch_Info_13_02");	//Tak, jest jedno miejsce, w kt�rym jeszcze nie szukali�my.
	AI_Output(self,other,"KDF_403_Drago_WoNoch_Info_13_03");	//Chodzi o prastare miejsce kultu nieopodal st�d.
	AI_Output(other,self,"KDF_403_Drago_WoNoch_Info_13_04");	//To dlaczego jeszcze go nie zbadali�cie?
	AI_Output(self,other,"KDF_403_Drago_WoNoch_Info_13_05");	//Bo orkowie korzystaj� z tego miejsca. To by�oby piekielnie niebezpieczne, poniewa� przebywa tam kilku pot�nych szaman�w ork�w.
	AI_Output(self,other,"KDF_403_Drago_WoNoch_Info_13_06");	//Znalaz�o si� kiedy� kilku �mia�k�w, kt�rzy pr�bowali odwiedzi� to miejsce kultu. �aden z nich ju� stamt�d nie wr�ci�.
};


instance kdf_403_drago_versuchen(C_Info)
{
	npc = KDF_403_Drago;
	condition = kdf_403_drago_versuchen_condition;
	information = kdf_403_drago_versuchen_info;
	important = 0;
	permanent = 0;
	description = "Ja spr�buj�.";
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
	AI_Output(other,self,"KDF_403_Drago_versuchen_Info_13_01");	//Ja spr�buj�.
	AI_Output(self,other,"KDF_403_Drago_versuchen_Info_13_02");	//�e co?! Jeste� tego pewny?
	AI_Output(other,self,"KDF_403_Drago_versuchen_Info_13_03");	//Je�li istnieje droga prowadz�ca do tych artefakt�w - znajd� j�.
	AI_Output(self,other,"KDF_403_Drago_versuchen_Info_13_04");	//No dobrze. W takim razie b�d� tu na ciebie czeka�. Je�li ci si� uda, przynie� mi te artefakty i pom�wimy o twojej nagrodzie.
	AI_Output(self,other,"KDF_403_Drago_versuchen_Info_13_05");	//We� jeszcze ze sob� te mikstury lecznicze. U�mierz� tw�j b�l, je�li tylko zranisz si� podczas walki.
	AI_Output(self,other,"KDF_403_Drago_versuchen_Info_13_06");	//Niech Innos ma ci� w swojej opiece.
	Log_CreateTopic(ARTEFACTS,LOG_MISSION);
	Log_SetTopicStatus(ARTEFACTS,LOG_RUNNING);
	B_LogEntry(ARTEFACTS,"Drago, jeden z Mag�w Ognia ze Starego Obozu, poprosi� mnie o odnalezienie miejsca kultu ork�w i rozejrzenie si� tam za pewnym artefaktem.");
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
	description = "Gdzie dok�adnie znajduje si� to miejsce kultu?";
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
	AI_Output(other,self,"KDF_403_Drago_Wo_Info_13_01");	//Gdzie dok�adnie znajduje si� to miejsce kultu?
	AI_Output(self,other,"KDF_403_Drago_Wo_Info_13_02");	//Poza obozem znajdziesz cz�owieka imieniem Cavalorn. Na lewo od jego chaty ci�gnie si� szeroki w�w�z. Wystarczy po prostu si� nim uda�.
	B_LogEntry(ARTEFACTS,"To miejsce kultu znajduje si� w pobli�u chaty Cavalorna. Wystarczy po prostu uda� si� tamtejszym w�wozem, a� w ko�cu powinienem dotrze� do mojego celu.");
};


instance kdf_403_drago_kultst�tte(C_Info)
{
	npc = KDF_403_Drago;
	condition = kdf_403_drago_kultst�tte_condition;
	information = kdf_403_drago_kultst�tte_info;
	important = 0;
	permanent = 0;
	description = "By�em w tym miejscu kultu.";
};


func int kdf_403_drago_kultst�tte_condition()
{
	if(Npc_KnowsInfo(hero,kdf_403_drago_versuchen) && Npc_HasItems(other,itarrunetrfscavenger))
	{
		return TRUE;
	};
};

func void kdf_403_drago_kultst�tte_info()
{
	AI_Output(other,self,"KDF_403_Drago_Kultst�tte_Info_13_01");	//By�em w tym miejscu kultu.
	AI_Output(self,other,"KDF_403_Drago_Kultst�tte_Info_13_02");	//I jak? Co tam znalaz�e�?
	Info_ClearChoices(kdf_403_drago_kultst�tte);
	Info_AddChoice(kdf_403_drago_kultst�tte,"Znalaz�em t� run� przemiany.",kdf_403_drago_kultst�tte_ja);
	Info_AddChoice(kdf_403_drago_kultst�tte,"Nic tam ciekawego nie by�o.",kdf_403_drago_kultst�tte_nein);
};

func void kdf_403_drago_kultst�tte_ja()
{
	AI_Output(other,self,"KDF_403_Drago_Kultst�tte_JA_15_00");	//Znalaz�em t� run� przemiany.
	AI_Output(self,other,"KDF_403_Drago_Kultst�tte_JA_11_01");	//Znalaz�e�? To znakomicie! Poka� mi t� run�.
	AI_Output(other,self,"KDF_403_Drago_Kultst�tte_JA_11_02");	//Oto ona.
	AI_Output(self,other,"KDF_403_Drago_Kultst�tte_JA_11_03");	//Wy�wiadczy�e� nam wielk� przys�ug�. Taka runa mog�aby by� przyczyn� katastrofalnych skutk�w w niepowo�anych r�kach.
	AI_Output(self,other,"KDF_403_Drago_Kultst�tte_JA_11_04");	//We� to jako znak mojej wdzi�czno�ci i podzi�kowanie od Innosa.
	B_GiveXP(XP_MYSTERIOUSNOTICES2);
	Log_SetTopicStatus(ARTEFACTS,LOG_SUCCESS);
	B_LogEntry(ARTEFACTS,"Odda�em Drago run�. By� bardzo zadowolony i nagrody nie posk�pi�.");
	magic_artefacts = LOG_SUCCESS;
	CreateInvItem(self,Schutzring_Magie1_Fire1);
	B_GiveInvItems(self,other,Schutzring_Magie1_Fire1,1);
	B_GiveInvItems(other,self,itarrunetrfscavenger,1);
	Npc_RemoveInvItem(self,itarrunetrfscavenger);
	AI_StopProcessInfos(self);
};

func void kdf_403_drago_kultst�tte_nein()
{
	AI_Output(other,self,"KDF_403_Drago_Kultst�tte_NEIN_15_00");	//Nic tam ciekawego nie by�o.
	AI_Output(self,other,"KDF_403_Drago_Kultst�tte_NEIN_11_01");	//To niedobrze. Czyli wszystkie nasze starania na pr�no.
	AI_Output(self,other,"KDF_403_Drago_Kultst�tte_NEIN_11_02");	//Po�wi�c� si� znowu tym pismom i poszukam jakich� wskaz�wek.
	AI_Output(self,other,"KDF_403_Drago_Kultst�tte_NEIN_11_03");	//Mo�esz ju� i�� i zaj�� si� swoimi zadaniami.
	Log_SetTopicStatus(ARTEFACTS,LOG_FAILED);
	B_LogEntry(ARTEFACTS,"Nie odda�em runy Drago i powiedzia�em mu, �e nic tam ciekawego nie znalaz�em.");
	magic_artefacts = LOG_FAILED;
	AI_StopProcessInfos(self);
};

