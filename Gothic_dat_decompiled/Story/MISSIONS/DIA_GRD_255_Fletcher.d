
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
	AI_Output(self,other,"DIA_Fletcher_First_06_02");	//Wiesz dobrze, do kogo mówiê, synku!
	AI_Output(self,other,"DIA_Fletcher_First_06_03");	//Coœ ci powiem: to mój rejon. I nie chcê tutaj ¿adnych k³opotów!
	AI_Output(self,other,"DIA_Fletcher_First_06_04");	//Ale nowi, tacy jak ty, zawsze sprawiaj¹ k³opoty. Zw³aszcza, kiedy buszuj¹ tutaj w nocy.
	AI_Output(self,other,"DIA_Fletcher_First_06_05");	//Lepiej bêdzie jeœli pójdziesz sobie ju¿ do domu i nie poka¿esz siê tutaj zbyt prêdko. Przy arenie jest jedna pusta chata, ma daszek nad wejœciem. IdŸ spaæ!
	AI_Output(self,other,"DIA_Fletcher_First_06_06");	//Ale jeœli z³apiê ciê na grzebaniu w cudzych chatach, osobiœcie postaram siê, ¿ebyœ ju¿ nigdy wiêcej tego nie zrobi³!
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
	AI_Output(self,other,"DIA_Fletcher_Hello_06_01");	//Jeœli chcesz siê pozbyæ swoich pieniêdzy za ochronê, wybra³eœ z³y dzieñ.
	AI_Output(other,self,"DIA_Fletcher_Hello_15_02");	//Tak? A dlaczego?
	AI_Output(self,other,"DIA_Fletcher_Hello_06_03");	//Bo mnie tu nie ma.
	Info_ClearChoices(DIA_Fletcher_Hello);
	Info_AddChoice(DIA_Fletcher_Hello,"Rozumiem.",DIA_Fletcher_Hello_ISee);
	Info_AddChoice(DIA_Fletcher_Hello,"To jakim cudem z tob¹ rozmawiam?",DIA_Fletcher_Hello_WhyTalk);
	Info_AddChoice(DIA_Fletcher_Hello,"Czy¿by? A gdzie jesteœ?",DIA_Fletcher_Hello_WhereElse);
};

func void DIA_Fletcher_Hello_WhereElse()
{
	AI_Output(other,self,"DIA_Fletcher_Hello_WhereElse_15_00");	//Czy¿by? A gdzie jesteœ?
	AI_Output(self,other,"DIA_Fletcher_Hello_WhereElse_06_01");	//W tej chwili siedzê w zamku, przy ognisku i popijam piwo.
};

func void DIA_Fletcher_Hello_WhyTalk()
{
	AI_Output(other,self,"DIA_Fletcher_Hello_WhyTalk_15_00");	//To jakim cudem z tob¹ rozmawiam?
	AI_Output(self,other,"DIA_Fletcher_Hello_WhyTalk_06_01");	//Nek gdzieœ znikn¹³. Zwykle to on patroluje ten rejon.
	AI_Output(self,other,"DIA_Fletcher_Hello_WhyTalk_06_02");	//A dopóki nie raczy siê tutaj zjawiæ, Thorus kaza³ MI mieæ oko na wszystko.
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
	description = "Wiesz, gdzie siê podziewa Nek?";
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
	AI_Output(other,self,"DIA_Fletcher_WoNek_15_00");	//Wiesz, gdzie siê podziewa Nek?
	AI_Output(self,other,"DIA_Fletcher_WoNek_06_01");	//Nie, i raczej siê tego nie dowiem.
	AI_Output(self,other,"DIA_Fletcher_WoNek_06_02");	//Jeœli komuœ coœ o tym wiadomo, to pewnie tutejszym Kopaczom. Ale oni nie rozmawiaj¹ ze Stra¿nikami.
	AI_Output(self,other,"DIA_Fletcher_WoNek_06_03");	//A zw³aszcza ze mn¹, bo wiedz¹, ¿e brzydzê siê ich robot¹. Za³o¿ê siê, ¿e podœmiewaj¹ siê ze mnie za moimi plecami.
	if(Sly_LostNek != LOG_SUCCESS)
	{
		Log_CreateTopic(CH1_LostNek,LOG_MISSION);
	};
	Log_SetTopicStatus(CH1_LostNek,LOG_RUNNING);
	B_LogEntry(CH1_LostNek,"Mo¿e Kopacze mieszkaj¹cy w pobli¿u areny wiedz¹ gdzie siê podzia³ Nek.");
};


instance DIA_Fletcher_TroSchu(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 1;
	condition = DIA_Fletcher_TroSchu_Condition;
	information = DIA_Fletcher_TroSchu_Info;
	permanent = 0;
	description = "Ale dlaczego nie zbierasz pieniêdzy za ochronê?";
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
	AI_Output(other,self,"DIA_Fletcher_TroSchu_15_00");	//Ale dlaczego nie zbierasz pieniêdzy za ochronê?
	AI_Output(self,other,"DIA_Fletcher_TroSchu_06_01");	//Nek zebra³ ju¿, co by³o do zebrania. Wiêcej z nich nie wycisnê.
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
		AI_Output(other,self,"DIA_Fletcher_WegenNek_15_02");	//Chyba go znalaz³em.
		AI_Output(self,other,"DIA_Fletcher_WegenNek_06_03");	//Co? Gdzie on jest?
		AI_Output(other,self,"DIA_Fletcher_WegenNek_15_04");	//W innym, lepszym œwiecie...
		AI_Output(self,other,"DIA_Fletcher_WegenNek_06_05");	//O cholera! To znaczy, ¿e bêdê tutaj tkwi³ do koñca ¿ycia. Mia³em nadziejê, ¿e ten bêcwa³ jednak wróci.
		AI_Output(self,other,"DIA_Fletcher_WegenNek_06_06");	//Teraz mam k³opot.
		fletcher_foundNek = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Fletcher_WegenNek_15_07");	//¯adnych wieœci.
		AI_Output(self,other,"DIA_Fletcher_WegenNek_06_08");	//Informuj mnie na bie¿¹co.
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
	AI_Output(self,other,"DIA_Fletcher_Problem_06_01");	//Jestem winien Scatty'emu nie lada sumkê. Kiedy dowie siê, ¿e przej¹³em dzia³kê Neka, bêdzie mnie nachodzi³ codziennie...
};


instance dia_fletcher_reden(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 1;
	condition = dia_fletcher_reden_condition;
	information = dia_fletcher_reden_info;
	permanent = 0;
	description = "Móg³bym o tym porozmawiaæ ze Scattym.";
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
	AI_Output(other,self,"DIA_Fletcher_Reden_15_00");	//Móg³bym o tym porozmawiaæ ze Scattym.
	AI_Output(self,other,"DIA_Fletcher_Reden_06_01");	//Tak, zrób to, tylko mogê ci od razu powiedzieæ, ¿e z pewnoœci¹ tak ³atwo nie daruje moich d³ugów.
	fletcher_schulden = LOG_RUNNING;
	Log_CreateTopic(CH1_FLETCHER_SCHULDEN,LOG_MISSION);
	B_LogEntry(CH1_FLETCHER_SCHULDEN,"Fletcher powiedzia³ mi, ¿e jest winien Scatty'emu nie lada sumkê. Mo¿e powinienem z nim porozmawiaæ na ten temat.");
	Log_SetTopicStatus(CH1_FLETCHER_SCHULDEN,LOG_RUNNING);
};


instance dia_fletcher_gottofight(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 1;
	condition = dia_fletcher_gottofight_condition;
	information = dia_fletcher_gottofight_info;
	permanent = 0;
	description = "Rozmawia³em ze Scattym.";
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
	AI_Output(other,self,"DIA_Fletcher_GottoFight_15_00");	//Rozmawia³em ze Scattym.
	AI_Output(self,other,"DIA_Fletcher_GottoFight_06_01");	//I co powiedzia³?
	AI_Output(other,self,"DIA_Fletcher_GottoFight_06_02");	//Jest w stanie darowaæ ci d³ugi, jeœli uda mi siê pokonaæ Gor Hanisa na arenie.
	AI_Output(self,other,"DIA_Fletcher_GottoFight_06_03");	//W takim razie wybra³eœ sobie twardego przeciwnika.
	AI_Output(self,other,"DIA_Fletcher_GottoFight_06_04");	//Gor Hanis to jeden ze Stra¿ników Œwi¹tynnych z obozu tych sekciarzy.
	AI_Output(self,other,"DIA_Fletcher_GottoFight_06_05");	//Ci goœcie wiedz¹ jak obchodziæ siê z mieczem.
	AI_Output(self,other,"DIA_Fletcher_GottoFight_06_06");	//Na twoim miejscu walczy³bym z nim dopiero wtedy, kiedy nabra³bym ju¿ porz¹dnej wprawy we w³adaniu mieczem.
	AI_Output(self,other,"DIA_Fletcher_GottoFight_06_07");	//To le¿y w interesie nas obu.
	B_LogEntry(CH1_FLETCHER_SCHULDEN,"Powiedzia³em Fletcherowi o tej propozycji. Twierdzi³, ¿e powinienem najpierw porz¹dnie potrenowaæ, zanim stanê przeciw Gor Hanisowi.");
};


instance DIA_FLETCHER_RESULT(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 1;
	condition = dia_fletcher_result_condition;
	information = dia_fletcher_result_info;
	permanent = 0;
	description = "Walczy³em na arenie.";
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
	AI_Output(other,self,"DIA_Fletcher_Result_15_00");	//Walczy³em na arenie.
	if(hanis.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Fletcher_Result_01_01");	//Z jakim rezultatem?
		AI_Output(other,self,"DIA_Fletcher_Result_01_02");	//Da³em Gor Hanisowi w koœæ.
		AI_Output(self,other,"DIA_Fletcher_Result_01_03");	//Wyœmienicie. Czyli nie mam ju¿ ¿adnych d³ugów u Scatty'ego. Trzymaj, jako nagrodê weŸ tê czêœæ rudy, któr¹ uzbiera³em.
		AI_Output(other,self,"DIA_Fletcher_Result_01_04");	//Tylko te parê bry³ek?
		AI_Output(self,other,"DIA_Fletcher_Result_01_05");	//Na tê chwilê wiêcej nie mam. Ale mówiê ci, odwdziêczê siê jeszcze w przysz³oœci.
		B_GiveInvItems(self,other,ItMiNugget,75);
		AI_StopProcessInfos(self);
	}
	else if(hanis.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Fletcher_Result_02_01");	//Z jakim rezultatem?
		AI_Output(other,self,"DIA_Fletcher_Result_02_02");	//Gor Hanis z³oi³ mi skórê.
		AI_Output(self,other,"DIA_Fletcher_Result_02_03");	//No do licha ciê¿kiego! Teraz dalej bêdê musia³ zbieraæ rudê dla Scatty'ego...
		AI_Output(other,self,"DIA_Fletcher_Result_02_04");	//Ech... no tak, prawda, i tak nawiasem jeszcze mówi¹c... podwójnie...
		AI_Output(self,other,"DIA_Fletcher_Result_02_05");	//S£UCHAM?! Dlaczego mi o tym wczeœniej nie powiedzia³eœ? Nie znoszê, kiedy siê ze mnie dworuje...
		AI_Output(other,self,"DIA_Fletcher_Result_02_06");	//Có¿...
		AI_Output(self,other,"EXTRA_FICKDICHSELBER");	//Chêdo¿ siê, skurczysynu!
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
	AI_Output(self,other,"Grd_255_Fletcher_WELCOME_Info_06_01");	//Widzê, ¿e szybko nauczy³eœ siê dbaæ o swoje interesy. Witamy w Stra¿y!
};


instance grd_255_fletcher_whatsup(C_Info)
{
	npc = GRD_255_Fletcher;
	condition = grd_255_fletcher_whatsup_condition;
	information = grd_255_fletcher_whatsup_info;
	important = 0;
	permanent = 0;
	description = "Co siê sta³o?";
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
	AI_Output(other,self,"Grd_255_Fletcher_WhatsUp_Info_06_01");	//Co siê sta³o?
	AI_Output(self,other,"Grd_255_Fletcher_WhatsUp_Info_06_02");	//Cz³owieku... nawet nie jestem w stanie ci tego wyraziæ w s³owach, jak bardzo mnie ju¿ wkurza ta gówniana robota.
	AI_Output(other,self,"Grd_255_Fletcher_WhatsUp_Info_06_03");	//A nie ma nikogo, kto by móg³ ciê tu zmieniæ?
	AI_Output(self,other,"Grd_255_Fletcher_WhatsUp_Info_06_04");	//Nie, jestem jedynym ze Stra¿ników, który mo¿e obecnie zajmowaæ siê t¹ dzielnic¹.
	AI_Output(self,other,"Grd_255_Fletcher_WhatsUp_Info_06_05");	//Pozostali maj¹ jakieœ inne, wa¿niejsze rzeczy do roboty.
};


instance grd_255_fletcher_abloesung(C_Info)
{
	npc = GRD_255_Fletcher;
	condition = grd_255_fletcher_abloesung_condition;
	information = grd_255_fletcher_abloesung_info;
	important = 0;
	permanent = 0;
	description = "A gdybym tak ciê zast¹pi³?";
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
	AI_Output(other,self,"Grd_255_Fletcher_Abloesung_Info_06_01");	//A gdybym tak ciê zast¹pi³?
	AI_Output(self,other,"Grd_255_Fletcher_Abloesung_Info_06_02");	//W sumie... nie taki g³upi pomys³. B¹dŸ co b¹dŸ pomog³eœ mi z d³ugami u Scatty'ego.
	AI_Output(self,other,"Grd_255_Fletcher_Abloesung_Info_06_03");	//Czyli chyba mogê powierzyæ ci i to zadanie.
};


instance grd_255_fletcher_musstun(C_Info)
{
	npc = GRD_255_Fletcher;
	condition = grd_255_fletcher_musstun_condition;
	information = grd_255_fletcher_musstun_info;
	important = 0;
	permanent = 0;
	description = "Czym dok³adnie mam siê zaj¹æ?";
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
	AI_Output(other,self,"Grd_255_Fletcher_MussTun_Info_06_01");	//Czym dok³adnie mam siê zaj¹æ?
	AI_Output(self,other,"Grd_255_Fletcher_MussTun_Info_06_02");	//To nic wielkiego. Trzeba zebraæ pieni¹dze za ochronê za te zaleg³e piêæ dni. Bêdziesz musia³ siê po prostu przejœæ po Kopaczach, bêd¹ wiedzieli w czym rzecz.
	AI_Output(self,other,"Grd_255_Fletcher_MussTun_Info_06_03");	//A tak swoj¹ drog¹, to do ciebie nale¿y ca³a ta dzielnica wokó³ areny. O pozosta³e nie masz co siê martwiæ, to dzia³ka Szakala i Bloodwyna.
	AI_Output(other,self,"Grd_255_Fletcher_MussTun_Info_06_04");	//Rozumiem.
	AI_Output(self,other,"Grd_255_Fletcher_MussTun_Info_06_05");	//No, to wygl¹da na to, ¿e nareszcie mogê siê roz³o¿yæ przy ognisku, popijaj¹c przy tym zimnego browara!
	Log_CreateTopic(GE_ORECOLLECT,LOG_NOTE);
	B_LogEntry(GE_ORECOLLECT,"Mam teraz okazjê zebraæ nieco pieniêdzy za ochronê w dzielnicy wokó³ areny Starego Obozu. Muszê pozbieraæ od Kopaczy nale¿noœæ za te piêæ dni.");
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
			AI_Output(self,hero,"Info_Fletcher_DIE_06_01");	//Zdrajco! I pomyœleæ, ¿e uwa¿aliœmy ciê za jednego z nas!
		}
		else if(oldHeroGuild == GIL_KDF)
		{
			AI_Output(self,hero,"Info_Fletcher_DIE_06_02");	//To jeden z tych zdradzieckich Magów Ognia!
		}
		else if(oldHeroGuild == GIL_EBR)
		{
			AI_Output(self,hero,"Info_Fletcher_DIE_07_02");	//Do dzisiaj siê zastanawiam, co sk³oni³o Kruka do tego, ¿eby zrobiæ z CIEBIE Magnata! Szkoda, ¿e taki zaprzaniec siê z ciebie zrobi³. Mia³eœ szansê zajœæ naprawdê daleko!
		}
		else
		{
			AI_Output(self,hero,"Info_Fletcher_DIE_06_03");	//Witaj, ZDRAJCO! Teraz nie pomog¹ ci nawet znajomoœci wœród Cieni!
		};
		AI_Output(hero,self,"Info_Fletcher_DIE_15_04");	//O czym ty do diab³a mówisz, Fletcher?
		AI_Output(self,hero,"Info_Fletcher_DIE_06_05");	//Zadajesz siê z tymi bandziorami z Nowego Obozu! A mo¿e nie?!
		AI_Output(hero,self,"Info_Fletcher_DIE_15_06");	//Zaczekaj...
		AI_Output(self,hero,"Info_Fletcher_DIE_06_07");	//Myœla³eœ, ¿e siê nie domyœlimy, co? CO?!
		AI_Output(hero,self,"Info_Fletcher_DIE_15_08");	//Hej... Postrada³eœ zmys³y?!
		AI_Output(self,hero,"Info_Fletcher_DIE_06_09");	//Ja? Ale¿ sk¹d. Za to TY za chwilê stracisz G£OWÊ, kolego.
		AI_Output(self,hero,"Info_Fletcher_DIE_06_10");	//GIÑ, ZDRAJCO!!!
		if(Npc_KnowsInfo(hero,Info_Bloodwyn_DIE))
		{
			B_LogEntry(CH4_BannedFromOC,"Bloodwyn okopa³ siê przy tylnej bramie. Na mój widok zareagowa³ podobnie jak Fletcher. Mam wra¿enie, ¿e ma to coœ wspólnego z moimi poszukiwaniami kamienia ogniskuj¹cego dla Nowego Obozu.");
		}
		else if(Npc_GetTrueGuild(hero) == GIL_None)
		{
			Log_CreateTopic(CH4_BannedFromOC,LOG_MISSION);
			Log_SetTopicStatus(CH4_BannedFromOC,LOG_RUNNING);
			B_LogEntry(CH4_BannedFromOC,"Fletcher, który strze¿e teraz g³ównej bramy Starego Obozu, nazwa³ mnie zdrajc¹. Nie chcia³ mnie nawet wys³uchaæ - od razu rzuci³ siê do ataku!");
			B_LogEntry(CH4_BannedFromOC,"Wygl¹da na to, ¿e zosta³em wygnany ze Starego Obozu!");
		};
	}
	else
	{
		if(C_NpcBelongsToNewCamp(hero))
		{
			AI_Output(self,hero,"Info_Fletcher_DIE_06_11");	//No proszê. To goœæ z Nowego Obozu!
		}
		else
		{
			AI_Output(self,hero,"Info_Fletcher_DIE_06_12");	//Patrzcie no. To goœæ z Sekty!
		};
		AI_Output(hero,self,"Info_Fletcher_DIE_15_13");	//I co z tego? Masz z tym jakiœ problem?
		AI_Output(self,hero,"Info_Fletcher_DIE_06_14");	//Mieæ, to ja bêdê wasz¹ ma³¹ kopalniê!
		AI_Output(hero,self,"Info_Fletcher_DIE_15_15");	//Czy¿by? Chyba œnisz!
		AI_Output(self,hero,"Info_Fletcher_DIE_06_16");	//Przykro mi, ale nie mo¿emy pozwoliæ, ¿ebyœ o tym komuœ powiedzia³!
		AI_Output(hero,self,"Info_Fletcher_DIE_15_17");	//Zaczekaj, nie szukam k³opotów.
		AI_Output(self,hero,"Info_Fletcher_DIE_06_18");	//Trzeba by³o o tym pomyœleæ zanim tutaj przyszed³eœ!
		AI_Output(hero,self,"Info_Fletcher_DIE_15_19");	//Hej, co u...
		AI_Output(self,hero,"Info_Fletcher_DIE_06_20");	//Dalej ch³opcy! Na niego!
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
		B_LogEntry(CH4_Firemages,"Bramy do Starego Obozu zosta³y zamkniête i pozostaj¹ pilnie strze¿one. Stra¿nicy atakuj¹ ka¿dego, kto podejdzie w pobli¿e obozu.");
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
	AI_Output(self,other,"Grd_255_Fletcher_NC_Info_06_01");	//Co ktoœ taki jak ty robi w naszym obozie? Zmiataj lepiej z powrotem do reszty tej bandy szumowin z Nowego Obozu.
};

