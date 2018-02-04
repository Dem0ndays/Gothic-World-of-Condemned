
instance DIA_Fletcher_EXIT(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 999;
	condition = DIA_Fletcher_EXIT_Condition;
	information = DIA_Fletcher_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Fletcher_EXIT_Condition()
{
	return 1;
};

func void DIA_Fletcher_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Fletcher_First(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 1;
	condition = DIA_Fletcher_First_Condition;
	information = DIA_Fletcher_First_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Fletcher_First_Condition()
{
	if(Wld_IsTime(0,0,6,0))
	{
		return 1;
	};
};

func void DIA_Fletcher_First_Info()
{
	AI_Output(self,other,"DIA_Fletcher_First_06_00");	//Hej, ty!
	AI_Output(other,self,"DIA_Fletcher_First_15_01");	//Kto? Ja?
	AI_Output(self,other,"DIA_Fletcher_First_06_02");	//Wiesz dobrze, do kogo m�wi�, synku!
	AI_Output(self,other,"DIA_Fletcher_First_06_03");	//Co� ci powiem: to m�j rejon. I nie chc� tutaj �adnych k�opot�w!
	AI_Output(self,other,"DIA_Fletcher_First_06_04");	//Ale nowi, tacy jak ty, zawsze sprawiaj� k�opoty. Zw�aszcza, kiedy buszuj� tutaj w nocy.
	AI_Output(self,other,"DIA_Fletcher_First_06_05");	//Lepiej b�dzie je�li p�jdziesz sobie ju� do domu i nie poka�esz si� tutaj zbyt pr�dko. Przy arenie jest jedna pusta chata, ma daszek nad wej�ciem. Id� spa�!
	AI_Output(self,other,"DIA_Fletcher_First_06_06");	//Ale je�li z�api� ci� na grzebaniu w cudzych chatach, osobi�cie postaram si�, �eby� ju� nigdy wi�cej tego nie zrobi�!
	AI_StopProcessInfos(self);
};


var int fletcher_whytalk;

instance DIA_Fletcher_Hello(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 2;
	condition = DIA_Fletcher_Hello_Condition;
	information = DIA_Fletcher_Hello_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Fletcher_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return 1;
	};
};

func void DIA_Fletcher_Hello_Info()
{
	AI_Output(other,self,"DIA_Fletcher_Hello_15_00");	//Hej, ty!
	AI_Output(self,other,"DIA_Fletcher_Hello_06_01");	//Je�li chcesz si� pozby� swoich pieni�dzy za ochron�, wybra�e� z�y dzie�.
	AI_Output(other,self,"DIA_Fletcher_Hello_15_02");	//Tak? A dlaczego?
	AI_Output(self,other,"DIA_Fletcher_Hello_06_03");	//Bo mnie tu nie ma.
	Info_ClearChoices(DIA_Fletcher_Hello);
	Info_AddChoice(DIA_Fletcher_Hello,"Rozumiem.",DIA_Fletcher_Hello_ISee);
	Info_AddChoice(DIA_Fletcher_Hello,"To jakim cudem z tob� rozmawiam?",DIA_Fletcher_Hello_WhyTalk);
	Info_AddChoice(DIA_Fletcher_Hello,"Czy�by? A gdzie jeste�?",DIA_Fletcher_Hello_WhereElse);
};

func void DIA_Fletcher_Hello_WhereElse()
{
	AI_Output(other,self,"DIA_Fletcher_Hello_WhereElse_15_00");	//Czy�by? A gdzie jeste�?
	AI_Output(self,other,"DIA_Fletcher_Hello_WhereElse_06_01");	//W tej chwili siedz� w zamku, przy ognisku i popijam piwo.
};

func void DIA_Fletcher_Hello_WhyTalk()
{
	AI_Output(other,self,"DIA_Fletcher_Hello_WhyTalk_15_00");	//To jakim cudem z tob� rozmawiam?
	AI_Output(self,other,"DIA_Fletcher_Hello_WhyTalk_06_01");	//Nek gdzie� znikn��. Zwykle to on patroluje ten rejon.
	AI_Output(self,other,"DIA_Fletcher_Hello_WhyTalk_06_02");	//A dop�ki nie raczy si� tutaj zjawi�, Thorus kaza� MI mie� oko na wszystko.
	fletcher_whytalk = TRUE;
	Info_ClearChoices(DIA_Fletcher_Hello);
};

func void DIA_Fletcher_Hello_ISee()
{
	AI_Output(other,self,"DIA_Fletcher_Hello_ISee_15_00");	//Rozumiem.
	Info_ClearChoices(DIA_Fletcher_Hello);
};


instance DIA_Fletcher_WoNek(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 1;
	condition = DIA_Fletcher_WoNek_Condition;
	information = DIA_Fletcher_WoNek_Info;
	permanent = 0;
	description = "Wiesz, gdzie si� podziewa Nek?";
};


func int DIA_Fletcher_WoNek_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_STT_315_LostNek) || (fletcher_whytalk == TRUE))
	{
		return 1;
	};
};

func void DIA_Fletcher_WoNek_Info()
{
	AI_Output(other,self,"DIA_Fletcher_WoNek_15_00");	//Wiesz, gdzie si� podziewa Nek?
	AI_Output(self,other,"DIA_Fletcher_WoNek_06_01");	//Nie, i raczej si� tego nie dowiem.
	AI_Output(self,other,"DIA_Fletcher_WoNek_06_02");	//Je�li komu� co� o tym wiadomo, to pewnie tutejszym Kopaczom. Ale oni nie rozmawiaj� ze Stra�nikami.
	AI_Output(self,other,"DIA_Fletcher_WoNek_06_03");	//A zw�aszcza ze mn�, bo wiedz�, �e brzydz� si� ich robot�. Za�o�� si�, �e pod�miewaj� si� ze mnie za moimi plecami.
	if(Sly_LostNek != LOG_SUCCESS)
	{
		Log_CreateTopic(CH1_LostNek,LOG_MISSION);
	};
	Log_SetTopicStatus(CH1_LostNek,LOG_RUNNING);
	B_LogEntry(CH1_LostNek,"Mo�e Kopacze mieszkaj�cy w pobli�u areny wiedz� gdzie si� podzia� Nek.");
};


instance DIA_Fletcher_TroSchu(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 1;
	condition = DIA_Fletcher_TroSchu_Condition;
	information = DIA_Fletcher_TroSchu_Info;
	permanent = 0;
	description = "Ale dlaczego nie zbierasz pieni�dzy za ochron�?";
};


func int DIA_Fletcher_TroSchu_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Fletcher_Hello))
	{
		return 1;
	};
};

func void DIA_Fletcher_TroSchu_Info()
{
	AI_Output(other,self,"DIA_Fletcher_TroSchu_15_00");	//Ale dlaczego nie zbierasz pieni�dzy za ochron�?
	AI_Output(self,other,"DIA_Fletcher_TroSchu_06_01");	//Nek zebra� ju�, co by�o do zebrania. Wi�cej z nich nie wycisn�.
};


var int fletcher_foundNek;

instance DIA_Fletcher_WegenNek(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 1;
	condition = DIA_Fletcher_WegenNek_Condition;
	information = DIA_Fletcher_WegenNek_Info;
	permanent = 1;
	description = "Chodzi o Neka...";
};


func int DIA_Fletcher_WegenNek_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Fletcher_WoNek) && (fletcher_foundNek == FALSE))
	{
		return 1;
	};
};

func void DIA_Fletcher_WegenNek_Info()
{
	var C_Npc Nek;
	AI_Output(other,self,"DIA_Fletcher_WegenNek_15_00");	//Chodzi o Neka.
	AI_Output(self,other,"DIA_Fletcher_WegenNek_06_01");	//Tak?
	Nek = Hlp_GetNpc(GRD_282_Nek);
	if((Sly_LostNek == LOG_SUCCESS) || !Hlp_IsValidNpc(Nek))
	{
		AI_Output(other,self,"DIA_Fletcher_WegenNek_15_02");	//Chyba go znalaz�em.
		AI_Output(self,other,"DIA_Fletcher_WegenNek_06_03");	//Co? Gdzie on jest?
		AI_Output(other,self,"DIA_Fletcher_WegenNek_15_04");	//W innym, lepszym �wiecie...
		AI_Output(self,other,"DIA_Fletcher_WegenNek_06_05");	//O cholera! To znaczy, �e b�d� tutaj tkwi� do ko�ca �ycia. Mia�em nadziej�, �e ten b�cwa� jednak wr�ci.
		AI_Output(self,other,"DIA_Fletcher_WegenNek_06_06");	//Teraz mam k�opot.
		fletcher_foundNek = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Fletcher_WegenNek_15_07");	//�adnych wie�ci.
		AI_Output(self,other,"DIA_Fletcher_WegenNek_06_08");	//Informuj mnie na bie��co.
	};
};


instance DIA_Fletcher_Problem(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 1;
	condition = DIA_Fletcher_Problem_Condition;
	information = DIA_Fletcher_Problem_Info;
	permanent = 0;
	description = "Jaki problem?";
};


func int DIA_Fletcher_Problem_Condition()
{
	if(fletcher_foundNek == TRUE)
	{
		return 1;
	};
};

func void DIA_Fletcher_Problem_Info()
{
	AI_Output(other,self,"DIA_Fletcher_Problem_15_00");	//Jaki problem?
	AI_Output(self,other,"DIA_Fletcher_Problem_06_01");	//Jestem winien Scatty'emu nie lada sumk�. Kiedy dowie si�, �e przej��em dzia�k� Neka, b�dzie mnie nachodzi� codziennie...
};


instance dia_fletcher_reden(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 1;
	condition = dia_fletcher_reden_condition;
	information = dia_fletcher_reden_info;
	permanent = 0;
	description = "M�g�bym o tym porozmawia� ze Scattym.";
};


func int dia_fletcher_reden_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Fletcher_Problem))
	{
		return 1;
	};
};

func void dia_fletcher_reden_info()
{
	AI_Output(other,self,"DIA_Fletcher_Reden_15_00");	//M�g�bym o tym porozmawia� ze Scattym.
	AI_Output(self,other,"DIA_Fletcher_Reden_06_01");	//Tak, zr�b to, tylko mog� ci od razu powiedzie�, �e z pewno�ci� tak �atwo nie daruje moich d�ug�w.
	fletcher_schulden = LOG_RUNNING;
	Log_CreateTopic(CH1_FLETCHER_SCHULDEN,LOG_MISSION);
	B_LogEntry(CH1_FLETCHER_SCHULDEN,"Fletcher powiedzia� mi, �e jest winien Scatty'emu nie lada sumk�. Mo�e powinienem z nim porozmawia� na ten temat.");
	Log_SetTopicStatus(CH1_FLETCHER_SCHULDEN,LOG_RUNNING);
};


instance dia_fletcher_gottofight(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 1;
	condition = dia_fletcher_gottofight_condition;
	information = dia_fletcher_gottofight_info;
	permanent = 0;
	description = "Rozmawia�em ze Scattym.";
};


func int dia_fletcher_gottofight_condition()
{
	if(Npc_KnowsInfo(hero,dia_scatty_remember) || (scatty_idoit == TRUE))
	{
		return 1;
	};
};

func void dia_fletcher_gottofight_info()
{
	AI_Output(other,self,"DIA_Fletcher_GottoFight_15_00");	//Rozmawia�em ze Scattym.
	AI_Output(self,other,"DIA_Fletcher_GottoFight_06_01");	//I co powiedzia�?
	AI_Output(other,self,"DIA_Fletcher_GottoFight_06_02");	//Jest w stanie darowa� ci d�ugi, je�li uda mi si� pokona� Gor Hanisa na arenie.
	AI_Output(self,other,"DIA_Fletcher_GottoFight_06_03");	//W takim razie wybra�e� sobie twardego przeciwnika.
	AI_Output(self,other,"DIA_Fletcher_GottoFight_06_04");	//Gor Hanis to jeden ze Stra�nik�w �wi�tynnych z obozu tych sekciarzy.
	AI_Output(self,other,"DIA_Fletcher_GottoFight_06_05");	//Ci go�cie wiedz� jak obchodzi� si� z mieczem.
	AI_Output(self,other,"DIA_Fletcher_GottoFight_06_06");	//Na twoim miejscu walczy�bym z nim dopiero wtedy, kiedy nabra�bym ju� porz�dnej wprawy we w�adaniu mieczem.
	AI_Output(self,other,"DIA_Fletcher_GottoFight_06_07");	//To le�y w interesie nas obu.
	B_LogEntry(CH1_FLETCHER_SCHULDEN,"Powiedzia�em Fletcherowi o tej propozycji. Twierdzi�, �e powinienem najpierw porz�dnie potrenowa�, zanim stan� przeciw Gor Hanisowi.");
};


instance DIA_FLETCHER_RESULT(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 1;
	condition = dia_fletcher_result_condition;
	information = dia_fletcher_result_info;
	permanent = 0;
	description = "Walczy�em na arenie.";
};


func int dia_fletcher_result_condition()
{
	var C_Npc hanis;
	hanis = Hlp_GetNpc(Tpl_1422_GorHanis);
	if((hanis_herausforderung == TRUE) && ((hanis.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (hanis.aivar[AIV_HASDEFEATEDSC] == TRUE)))
	{
		return 1;
	};
};

func void dia_fletcher_result_info()
{
	var C_Npc hanis;
	hanis = Hlp_GetNpc(Tpl_1422_GorHanis);
	AI_Output(other,self,"DIA_Fletcher_Result_15_00");	//Walczy�em na arenie.
	if(hanis.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Fletcher_Result_01_01");	//Z jakim rezultatem?
		AI_Output(other,self,"DIA_Fletcher_Result_01_02");	//Da�em Gor Hanisowi w ko��.
		AI_Output(self,other,"DIA_Fletcher_Result_01_03");	//Wy�mienicie. Czyli nie mam ju� �adnych d�ug�w u Scatty'ego. Trzymaj, jako nagrod� we� t� cz�� rudy, kt�r� uzbiera�em.
		AI_Output(other,self,"DIA_Fletcher_Result_01_04");	//Tylko te par� bry�ek?
		AI_Output(self,other,"DIA_Fletcher_Result_01_05");	//Na t� chwil� wi�cej nie mam. Ale m�wi� ci, odwdzi�cz� si� jeszcze w przysz�o�ci.
		B_GiveInvItems(self,other,ItMiNugget,75);
		AI_StopProcessInfos(self);
	}
	else if(hanis.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Fletcher_Result_02_01");	//Z jakim rezultatem?
		AI_Output(other,self,"DIA_Fletcher_Result_02_02");	//Gor Hanis z�oi� mi sk�r�.
		AI_Output(self,other,"DIA_Fletcher_Result_02_03");	//No do licha ci�kiego! Teraz dalej b�d� musia� zbiera� rud� dla Scatty'ego...
		AI_Output(other,self,"DIA_Fletcher_Result_02_04");	//Ech... no tak, prawda, i tak nawiasem jeszcze m�wi�c... podw�jnie...
		AI_Output(self,other,"DIA_Fletcher_Result_02_05");	//S�UCHAM?! Dlaczego mi o tym wcze�niej nie powiedzia�e�? Nie znosz�, kiedy si� ze mnie dworuje...
		AI_Output(other,self,"DIA_Fletcher_Result_02_06");	//C�...
		AI_Output(self,other,"EXTRA_FICKDICHSELBER");	//Ch�do� si�, skurczysynu!
		AI_StopProcessInfos(self);
		Npc_SetPermAttitude(self,ATT_ANGRY);
	};
};


instance Grd_255_Fletcher_WELCOME(C_Info)
{
	npc = GRD_255_Fletcher;
	condition = Grd_255_Fletcher_WELCOME_Condition;
	information = Grd_255_Fletcher_WELCOME_Info;
	important = 1;
	permanent = 0;
};


func int Grd_255_Fletcher_WELCOME_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return TRUE;
	};
};

func void Grd_255_Fletcher_WELCOME_Info()
{
	AI_Output(self,other,"Grd_255_Fletcher_WELCOME_Info_06_01");	//Widz�, �e szybko nauczy�e� si� dba� o swoje interesy. Witamy w Stra�y!
};


instance grd_255_fletcher_whatsup(C_Info)
{
	npc = GRD_255_Fletcher;
	condition = grd_255_fletcher_whatsup_condition;
	information = grd_255_fletcher_whatsup_info;
	important = 0;
	permanent = 0;
	description = "Co si� sta�o?";
};


func int grd_255_fletcher_whatsup_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_GRD) && (Kapitel == 3) && (fletcher_schulden == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void grd_255_fletcher_whatsup_info()
{
	AI_Output(other,self,"Grd_255_Fletcher_WhatsUp_Info_06_01");	//Co si� sta�o?
	AI_Output(self,other,"Grd_255_Fletcher_WhatsUp_Info_06_02");	//Cz�owieku... nawet nie jestem w stanie ci tego wyrazi� w s�owach, jak bardzo mnie ju� wkurza ta g�wniana robota.
	AI_Output(other,self,"Grd_255_Fletcher_WhatsUp_Info_06_03");	//A nie ma nikogo, kto by m�g� ci� tu zmieni�?
	AI_Output(self,other,"Grd_255_Fletcher_WhatsUp_Info_06_04");	//Nie, jestem jedynym ze Stra�nik�w, kt�ry mo�e obecnie zajmowa� si� t� dzielnic�.
	AI_Output(self,other,"Grd_255_Fletcher_WhatsUp_Info_06_05");	//Pozostali maj� jakie� inne, wa�niejsze rzeczy do roboty.
};


instance grd_255_fletcher_abloesung(C_Info)
{
	npc = GRD_255_Fletcher;
	condition = grd_255_fletcher_abloesung_condition;
	information = grd_255_fletcher_abloesung_info;
	important = 0;
	permanent = 0;
	description = "A gdybym tak ci� zast�pi�?";
};


func int grd_255_fletcher_abloesung_condition()
{
	if(Npc_KnowsInfo(hero,grd_255_fletcher_whatsup))
	{
		return TRUE;
	};
};

func void grd_255_fletcher_abloesung_info()
{
	AI_Output(other,self,"Grd_255_Fletcher_Abloesung_Info_06_01");	//A gdybym tak ci� zast�pi�?
	AI_Output(self,other,"Grd_255_Fletcher_Abloesung_Info_06_02");	//W sumie... nie taki g�upi pomys�. B�d� co b�d� pomog�e� mi z d�ugami u Scatty'ego.
	AI_Output(self,other,"Grd_255_Fletcher_Abloesung_Info_06_03");	//Czyli chyba mog� powierzy� ci i to zadanie.
};


instance grd_255_fletcher_musstun(C_Info)
{
	npc = GRD_255_Fletcher;
	condition = grd_255_fletcher_musstun_condition;
	information = grd_255_fletcher_musstun_info;
	important = 0;
	permanent = 0;
	description = "Czym dok�adnie mam si� zaj��?";
};


func int grd_255_fletcher_musstun_condition()
{
	if(Npc_KnowsInfo(hero,grd_255_fletcher_abloesung))
	{
		return TRUE;
	};
};

func void grd_255_fletcher_musstun_info()
{
	AI_Output(other,self,"Grd_255_Fletcher_MussTun_Info_06_01");	//Czym dok�adnie mam si� zaj��?
	AI_Output(self,other,"Grd_255_Fletcher_MussTun_Info_06_02");	//To nic wielkiego. Trzeba zebra� pieni�dze za ochron� za te zaleg�e pi�� dni. B�dziesz musia� si� po prostu przej�� po Kopaczach, b�d� wiedzieli w czym rzecz.
	AI_Output(self,other,"Grd_255_Fletcher_MussTun_Info_06_03");	//A tak swoj� drog�, to do ciebie nale�y ca�a ta dzielnica wok� areny. O pozosta�e nie masz co si� martwi�, to dzia�ka Szakala i Bloodwyna.
	AI_Output(other,self,"Grd_255_Fletcher_MussTun_Info_06_04");	//Rozumiem.
	AI_Output(self,other,"Grd_255_Fletcher_MussTun_Info_06_05");	//No, to wygl�da na to, �e nareszcie mog� si� roz�o�y� przy ognisku, popijaj�c przy tym zimnego browara!
	Log_CreateTopic(GE_ORECOLLECT,LOG_NOTE);
	B_LogEntry(GE_ORECOLLECT,"Mam teraz okazj� zebra� nieco pieni�dzy za ochron� w dzielnicy wok� areny Starego Obozu. Musz� pozbiera� od Kopaczy nale�no�� za te pi�� dni.");
	Npc_ExchangeRoutine(self,"ChapterThree");
};


instance Info_Fletcher_DIE(C_Info)
{
	npc = GRD_255_Fletcher;
	condition = Info_Fletcher_DIE_Condition;
	information = Info_Fletcher_DIE_Info;
	permanent = 0;
	important = 1;
};


func int Info_Fletcher_DIE_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void Info_Fletcher_DIE_Info()
{
	AI_GotoNpc(self,hero);
	if((oldHeroGuild == GIL_STT) || (oldHeroGuild == GIL_GRD) || (oldHeroGuild == GIL_KDF))
	{
		if(oldHeroGuild == GIL_GRD)
		{
			AI_Output(self,hero,"Info_Fletcher_DIE_06_01");	//Zdrajco! I pomy�le�, �e uwa�ali�my ci� za jednego z nas!
		}
		else if(oldHeroGuild == GIL_KDF)
		{
			AI_Output(self,hero,"Info_Fletcher_DIE_06_02");	//To jeden z tych zdradzieckich Mag�w Ognia!
		}
		else if(oldHeroGuild == GIL_EBR)
		{
			AI_Output(self,hero,"Info_Fletcher_DIE_07_02");	//Do dzisiaj si� zastanawiam, co sk�oni�o Kruka do tego, �eby zrobi� z CIEBIE Magnata! Szkoda, �e taki zaprzaniec si� z ciebie zrobi�. Mia�e� szans� zaj�� naprawd� daleko!
		}
		else
		{
			AI_Output(self,hero,"Info_Fletcher_DIE_06_03");	//Witaj, ZDRAJCO! Teraz nie pomog� ci nawet znajomo�ci w�r�d Cieni!
		};
		AI_Output(hero,self,"Info_Fletcher_DIE_15_04");	//O czym ty do diab�a m�wisz, Fletcher?
		AI_Output(self,hero,"Info_Fletcher_DIE_06_05");	//Zadajesz si� z tymi bandziorami z Nowego Obozu! A mo�e nie?!
		AI_Output(hero,self,"Info_Fletcher_DIE_15_06");	//Zaczekaj...
		AI_Output(self,hero,"Info_Fletcher_DIE_06_07");	//My�la�e�, �e si� nie domy�limy, co? CO?!
		AI_Output(hero,self,"Info_Fletcher_DIE_15_08");	//Hej... Postrada�e� zmys�y?!
		AI_Output(self,hero,"Info_Fletcher_DIE_06_09");	//Ja? Ale� sk�d. Za to TY za chwil� stracisz G�OW�, kolego.
		AI_Output(self,hero,"Info_Fletcher_DIE_06_10");	//GI�, ZDRAJCO!!!
		if(Npc_KnowsInfo(hero,Info_Bloodwyn_DIE))
		{
			B_LogEntry(CH4_BannedFromOC,"Bloodwyn okopa� si� przy tylnej bramie. Na m�j widok zareagowa� podobnie jak Fletcher. Mam wra�enie, �e ma to co� wsp�lnego z moimi poszukiwaniami kamienia ogniskuj�cego dla Nowego Obozu.");
		}
		else if(Npc_GetTrueGuild(hero) == GIL_None)
		{
			Log_CreateTopic(CH4_BannedFromOC,LOG_MISSION);
			Log_SetTopicStatus(CH4_BannedFromOC,LOG_RUNNING);
			B_LogEntry(CH4_BannedFromOC,"Fletcher, kt�ry strze�e teraz g��wnej bramy Starego Obozu, nazwa� mnie zdrajc�. Nie chcia� mnie nawet wys�ucha� - od razu rzuci� si� do ataku!");
			B_LogEntry(CH4_BannedFromOC,"Wygl�da na to, �e zosta�em wygnany ze Starego Obozu!");
		};
	}
	else
	{
		if(C_NpcBelongsToNewCamp(hero))
		{
			AI_Output(self,hero,"Info_Fletcher_DIE_06_11");	//No prosz�. To go�� z Nowego Obozu!
		}
		else
		{
			AI_Output(self,hero,"Info_Fletcher_DIE_06_12");	//Patrzcie no. To go�� z Sekty!
		};
		AI_Output(hero,self,"Info_Fletcher_DIE_15_13");	//I co z tego? Masz z tym jaki� problem?
		AI_Output(self,hero,"Info_Fletcher_DIE_06_14");	//Mie�, to ja b�d� wasz� ma�� kopalni�!
		AI_Output(hero,self,"Info_Fletcher_DIE_15_15");	//Czy�by? Chyba �nisz!
		AI_Output(self,hero,"Info_Fletcher_DIE_06_16");	//Przykro mi, ale nie mo�emy pozwoli�, �eby� o tym komu� powiedzia�!
		AI_Output(hero,self,"Info_Fletcher_DIE_15_17");	//Zaczekaj, nie szukam k�opot�w.
		AI_Output(self,hero,"Info_Fletcher_DIE_06_18");	//Trzeba by�o o tym pomy�le� zanim tutaj przyszed�e�!
		AI_Output(hero,self,"Info_Fletcher_DIE_15_19");	//Hej, co u...
		AI_Output(self,hero,"Info_Fletcher_DIE_06_20");	//Dalej ch�opcy! Na niego!
	};
	Npc_ExchangeRoutine(self,"FMTaken2");
	B_ExchangeRoutine(GRD_252_Gardist,"FMTaken2");
	B_ExchangeRoutine(GRD_253_Gardist,"FMTaken2");
	B_ExchangeRoutine(GRD_244_Gardist,"FMTaken2");
	B_ExchangeRoutine(GRD_214_Torwache,"FMTaken2");
	B_ExchangeRoutine(GRD_215_Torwache,"FMTaken2");
	B_SetPermAttitude(GRD_255_Fletcher,ATT_HOSTILE);
	B_SetPermAttitude(GRD_252_Gardist,ATT_HOSTILE);
	B_SetPermAttitude(GRD_253_Gardist,ATT_HOSTILE);
	B_SetPermAttitude(GRD_244_Gardist,ATT_HOSTILE);
	B_SetPermAttitude(GRD_214_Torwache,ATT_HOSTILE);
	B_SetPermAttitude(GRD_215_Torwache,ATT_HOSTILE);
	if(!Npc_KnowsInfo(hero,Info_Bloodwyn_DIE))
	{
		B_LogEntry(CH4_Firemages,"Bramy do Starego Obozu zosta�y zamkni�te i pozostaj� pilnie strze�one. Stra�nicy atakuj� ka�dego, kto podejdzie w pobli�e obozu.");
	};
	AI_StopProcessInfos(self);
};


instance GRD_255_FLETCHER_NC(C_Info)
{
	npc = GRD_255_Fletcher;
	condition = grd_255_fletcher_nc_condition;
	information = grd_255_fletcher_nc_info;
	important = 1;
	permanent = 0;
};


func int grd_255_fletcher_nc_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_ORG) || (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		return TRUE;
	};
};

func void grd_255_fletcher_nc_info()
{
	AI_Output(self,other,"Grd_255_Fletcher_NC_Info_06_01");	//Co kto� taki jak ty robi w naszym obozie? Zmiataj lepiej z powrotem do reszty tej bandy szumowin z Nowego Obozu.
};

