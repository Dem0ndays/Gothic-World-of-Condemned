
instance DIA_ORG_855_Wolf_Exit(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 999;
	condition = DIA_ORG_855_Wolf_Exit_Condition;
	information = DIA_ORG_855_Wolf_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_ORG_855_Wolf_Exit_Condition()
{
	return TRUE;
};

func void DIA_ORG_855_Wolf_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wolf_Hello(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 1;
	condition = DIA_Wolf_Hello_Condition;
	information = DIA_Wolf_Hello_Info;
	permanent = 0;
	description = "Kim jesteœ?";
};


func int DIA_Wolf_Hello_Condition()
{
	return TRUE;
};

func void DIA_Wolf_Hello_Info()
{
	AI_Output(other,self,"DIA_Wolf_Hello_15_00");	//Kim jesteœ?
	AI_Output(self,other,"DIA_Wolf_Hello_09_01");	//Jestem p³atnerzem. Mówi¹ na mnie Wilk.
	Log_CreateTopic(GE_TraderNC,LOG_NOTE);
	B_LogEntry(GE_TraderNC,"Wilk zaopatruje Szkodniki w zbroje. Zwykle przesiaduje przed swoj¹ chat¹, w wielkiej jaskini.");
};


instance DIA_Wolf_GreetORG(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 1;
	condition = DIA_Wolf_GreetORG_Condition;
	information = DIA_Wolf_GreetORG_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Wolf_GreetORG_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_ORG)
	{
		return TRUE;
	};
};

func void DIA_Wolf_GreetORG_Info()
{
	AI_Output(self,other,"DIA_Wolf_GreetORG_09_00");	//Hej, teraz jesteœ jednym z nas!
};


instance Org_855_Wolf_TRADE(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 2;
	condition = Org_855_Wolf_TRADE_Condition;
	information = Org_855_Wolf_TRADE_Info;
	permanent = 0;
	description = "Zajmujesz siê czymœ jeszcze?";
};


func int Org_855_Wolf_TRADE_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Wolf_Hello))
	{
		return TRUE;
	};
};

func void Org_855_Wolf_TRADE_Info()
{
	AI_Output(other,self,"Org_855_Wolf_TRADE_15_00");	//Zajmujesz siê czymœ jeszcze?
	AI_Output(self,other,"Org_855_Wolf_TRADE_09_01");	//Skupujê skóry i futra od myœliwych. Gdybyœ mia³ kiedyœ taki towar na zbyciu - zg³oœ siê do mnie.
};


instance ORG_855_WOLF_TRADENOW(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 1;
	condition = org_855_wolf_tradenow_condition;
	information = org_855_wolf_tradenow_info;
	permanent = 1;
	description = "Poka¿ mi swoje towary.";
	trade = 1;
};


func int org_855_wolf_tradenow_condition()
{
	if(Npc_KnowsInfo(hero,Org_855_Wolf_TRADE))
	{
		return TRUE;
	};
};

func void org_855_wolf_tradenow_info()
{
	AI_Output(other,self,"STT_336_cavalorn_TRADE_Info_15_01");	//Poka¿ mi swoje towary.
};


instance Org_855_Wolf_WhereHunter(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 3;
	condition = Org_855_Wolf_WhereHunter_Condition;
	information = Org_855_Wolf_WhereHunter_Info;
	permanent = 1;
	description = "Jak mogê zdobyæ futra albo skóry?";
};


func int Org_855_Wolf_WhereHunter_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Wolf_Hello))
	{
		return TRUE;
	};
};

func void Org_855_Wolf_WhereHunter_Info()
{
	AI_Output(other,self,"Org_855_Wolf_WhereHunter_15_00");	//Jak mogê zdobyæ futra albo skóry?
	AI_Output(self,other,"Org_855_Wolf_WhereHunter_09_01");	//Po drodze do Starego Obozu natkniesz siê w koñcu na tak¹ star¹ chatê. Nale¿y ona do Aidana.
	AI_Output(self,other,"Org_855_Wolf_WhereHunter_10_02");	//Ale nigdy go tam praktycznie nie ma. Z tego co siê orientujê, to krêci siê czêsto daleko na wschodzie kolonii.
	AI_Output(self,other,"Org_855_Wolf_WhereHunter_10_03");	//On mo¿e ciê nauczyæ, jak œci¹gaæ skórê ze zwierz¹t.
	AI_Output(self,other,"Org_855_Wolf_WhereHunter_10_04");	//Drax i Ratford te¿ musz¹ siê gdzieœ tam wa³êsaæ. Drax to doœwiadczony myœliwy i z pewnoœci¹ podzieli siê z tob¹ swoj¹ wiedz¹.
	AI_Output(self,other,"Org_855_Wolf_WhereHunter_10_05");	//A Gestatha widzia³em ostatniego razu na drodze do Wolnej Kopalni. Ma tam gdzieœ swoje ma³e obozowisko.
	AI_Output(self,other,"Org_855_Wolf_WhereHunter_10_06");	//Ach, i z tego co wiem, to ci rabusie w górach te¿ s¹ myœliwymi. Ale to tak tylko gdzieœ zas³ysza³em, nie mam pojêcia ile w tym prawdy.
};


instance DIA_Wolf_SellArmor(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 4;
	condition = DIA_Wolf_SellArmor_Condition;
	information = DIA_Wolf_SellArmor_Info;
	permanent = 1;
	description = "Potrzebujê lepszej zbroi.";
};


func int DIA_Wolf_SellArmor_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Wolf_Hello) && !Npc_KnowsInfo(hero,Info_Wolf_ARMORFINISHED))
	{
		return TRUE;
	};
};

func void DIA_Wolf_SellArmor_Info()
{
	AI_Output(other,self,"DIA_Wolf_SellArmor_15_00");	//Potrzebujê lepszej zbroi.
	if((Npc_GetTrueGuild(other) == GIL_ORG) || (Npc_GetTrueGuild(other) == GIL_SLD))
	{
		AI_Output(self,other,"DIA_Wolf_SellArmor_09_01");	//Teraz, kiedy jesteœ jednym z nas, mogê ci jak¹œ sprzedaæ.
		Info_ClearChoices(DIA_Wolf_SellArmor);
		Info_AddChoice(DIA_Wolf_SellArmor,DIALOG_BACK,DIA_Wolf_SellArmor_BACK);
		Info_AddChoice(DIA_Wolf_SellArmor,B_BuildBuyArmorString(NAME_WolfBandits,value_org_armor_m),DIA_Wolf_SellArmor_M);
		Info_AddChoice(DIA_Wolf_SellArmor,B_BuildBuyArmorString(NAME_WolfHeavyBandits,value_org_armor_h),DIA_Wolf_SellArmor_H);
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_SellArmor_WRONGGUILD_09_00");	//Nie mogê ci nic sprzedaæ. Lares zabi³by mnie, gdyby dowiedzia³ siê, ¿e sprzedajê zbroje obcym.
	};
};

func void DIA_Wolf_SellArmor_BACK()
{
	Info_ClearChoices(DIA_Wolf_SellArmor);
};

func void DIA_Wolf_SellArmor_M()
{
	AI_Output(other,self,"DIA_Wolf_SellArmor_M_15_01");	//Potrzebujê wzmocnionego pancerza.
	if(Npc_HasItems(hero,ItMiNugget) < value_org_armor_m)
	{
		AI_Output(self,other,"DIA_Wolf_SellArmor_M_09_02");	//Nie ma rudy, nie ma zbroi.
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_SellArmor_M_09_03");	//To solidny pancerz. Oczywiœcie nie tak dobry jak ten, który mam na sobie, ale zapewnia niez³¹ ochronê.
		B_GiveInvItems(hero,self,ItMiNugget,value_org_armor_m);
		CreateInvItem(hero,org_armor_m);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
	};
};

func void DIA_Wolf_SellArmor_H()
{
	AI_Output(other,self,"DIA_Wolf_SellArmor_H_15_01");	//Mo¿esz mi sprzedaæ ciê¿ki pancerz?
	if(Npc_HasItems(hero,ItMiNugget) < value_org_armor_h)
	{
		AI_Output(self,other,"DIA_Wolf_SellArmor_H_09_02");	//Nie ma rudy, nie ma zbroi.
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_SellArmor_H_09_03");	//Ta zbroja uchroni ciê przed ka¿dym zagro¿eniem. Sam tak¹ noszê, i jak dot¹d nie zosta³em nawet draœniêty. To bardzo solidny pancerz.
		B_GiveInvItems(hero,self,ItMiNugget,value_org_armor_h);
		CreateInvItem(hero,org_armor_h);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
	};
};


instance ORG_855_Wolf_TRAINOFFER(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 5;
	condition = ORG_855_Wolf_TRAINOFFER_Condition;
	information = ORG_855_Wolf_TRAINOFFER_Info;
	important = 0;
	permanent = 0;
	description = "Chcia³bym nauczyæ siê strzelaæ z ³uku.";
};


func int ORG_855_Wolf_TRAINOFFER_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_BOW) != 2) && Npc_KnowsInfo(hero,DIA_Wolf_Hello))
	{
		return TRUE;
	};
};

func void ORG_855_Wolf_TRAINOFFER_Info()
{
	AI_Output(other,self,"ORG_855_Wolf_TRAINOFFER_Info_15_01");	//Chcia³bym nauczyæ siê strzelaæ z ³uku.
	AI_Output(self,other,"ORG_855_Wolf_TRAINOFFER_Info_09_02");	//Có¿, móg³bym ciê nauczyæ, ale to bêdzie kosztowaæ. Ja te¿ muszê jeœæ, no nie?
	AI_Output(other,self,"ORG_855_Wolf_TRAINOFFER_Info_15_03");	//Ile?
	AI_Output(self,other,"ORG_855_Wolf_TRAINOFFER_Info_09_04");	//50 bry³ek, bez targowania.
	Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
	B_LogEntry(GE_TeacherNC,"Szkodnik imieniem Wilk mo¿e mnie nauczyæ strzelania z ³uku.");
};


instance ORG_855_Wolf_TRAIN(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 5;
	condition = ORG_855_Wolf_TRAIN_Condition;
	information = ORG_855_Wolf_TRAIN_Info;
	important = 0;
	permanent = 0;
	description = B_BuildLearnString(NAME_LearnBow_1,LPCOST_TALENT_BOW_1,50);
};


func int ORG_855_Wolf_TRAIN_Condition()
{
	if(Npc_KnowsInfo(hero,ORG_855_Wolf_TRAINOFFER) && (Npc_GetTalentSkill(hero,NPC_TALENT_BOW) == 0))
	{
		return TRUE;
	};
};

func void ORG_855_Wolf_TRAIN_Info()
{
	AI_Output(other,self,"ORG_855_Wolf_TRAIN_Info_15_01");	//Naucz mnie strzelaæ z ³uku.
	if(Npc_HasItems(hero,ItMiNugget) >= 50)
	{
		if(B_GiveSkill(hero,NPC_TALENT_BOW,1,LPCOST_TALENT_BOW_1))
		{
			AI_Output(self,other,"ORG_855_Wolf_TRAIN_Info_09_02");	//Twoja celnoœæ zale¿y g³ównie od twojej zrêcznoœci. Im bardziej zwinnie bêd¹ twoje ruchy, tym pewniej twoje strza³y bêd¹ trafia³y w cel.
			AI_Output(self,other,"ORG_855_Wolf_TRAIN_Info_09_03");	//Twoje umiejêtnoœci wp³yn¹ na odleg³oœæ z jakiej bêdziesz móg³ skutecznie raziæ wrogów. Jeœli chcesz kiedyœ zostaæ strzelcem wyborowym, musisz systematycznie rozwijaæ zarówno zrêcznoœæ jak i umiejêtnoœci.
			B_GiveInvItems(hero,self,ItMiNugget,50);
		};
	};
};


instance ORG_855_WOLF_TRAINAGAIN(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 5;
	condition = org_855_wolf_trainagain_condition;
	information = org_855_wolf_trainagain_info;
	important = 0;
	permanent = 0;
	description = B_BuildLearnString(NAME_LearnBow_2,LPCOST_TALENT_BOW_2,50);
};


func int org_855_wolf_trainagain_condition()
{
	if(Npc_KnowsInfo(hero,ORG_855_Wolf_TRAINOFFER) && (Npc_GetTalentSkill(hero,NPC_TALENT_BOW) == 1))
	{
		return TRUE;
	};
};

func void org_855_wolf_trainagain_info()
{
	AI_Output(other,self,"ORG_855_Wolf_TRAINAGAIN_Info_15_01");	//Chcia³bym sprawniej pos³ugiwaæ siê ³ukiem.
	if(Npc_HasItems(hero,ItMiNugget) >= 50)
	{
		if(B_GiveSkill(hero,NPC_TALENT_BOW,2,LPCOST_TALENT_BOW_2))
		{
			AI_Output(self,other,"ORG_855_Wolf_TRAINAGAIN_Info_09_02");	//Jesteœ ju¿ ca³kiem niez³ym myœliwym. Teraz pora abyœ pozna³ resztê najwa¿niejszych informacji.
			AI_Output(self,other,"ORG_855_Wolf_TRAINAGAIN_Info_09_03");	//Dobry ³ucznik bierze pod uwagê wiele czynników zewnêtrznych, ale robi to odruchowo, nieœwiadomie.
			AI_Output(self,other,"ORG_855_Wolf_TRAINAGAIN_Info_09_04");	//Odkryj tajniki funkcjonowania twojego oka, pamiêtaj o sile naci¹gu i wyobra¿aj sobie trajektoriê lotu strza³y, ale przede wszystkim - zawsze b¹dŸ czujny!
			AI_Output(self,other,"ORG_855_Wolf_TRAINAGAIN_Info_09_05");	//Opanowa³eœ ju¿ wiêkszoœæ tajników strzelania z ³uku. Teraz pozosta³o ci tylko rozwijaæ twoje umiejêtnoœci podczas polowania i walki.
			B_GiveInvItems(hero,self,ItMiNugget,50);
		};
	};
};


instance ORG_855_Wolf_Teach(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 6;
	condition = ORG_855_Wolf_Teach_Condition;
	information = ORG_855_Wolf_Teach_Info;
	permanent = 1;
	description = "Mo¿esz mnie czegoœ nauczyæ?";
};


func int ORG_855_Wolf_Teach_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_ORG) || (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		return TRUE;
	};
};

func void ORG_855_Wolf_Teach_Info()
{
	AI_Output(other,self,"ORG_855_Wolf_Teach_15_00");	//Mo¿esz mnie czegoœ nauczyæ?
	AI_Output(self,other,"ORG_855_Wolf_Teach_09_01");	//Powodzenie podczas polowania zale¿y przede wszystkim od twojej zrêcznoœci.
	if(log_wolftrain == FALSE)
	{
		Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
		B_LogEntry(GE_TeacherNC,"Szkodnik imieniem Wilk mo¿e pomóc mi zwiêkszyæ moj¹ zwinnoœæ.");
		log_wolftrain = TRUE;
	};
	Info_ClearChoices(ORG_855_Wolf_Teach);
	Info_AddChoice(ORG_855_Wolf_Teach,DIALOG_BACK,ORG_855_Wolf_Teach_BACK);
	Info_AddChoice(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_5);
	Info_AddChoice(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_1);
};

func void ORG_855_Wolf_Teach_BACK()
{
	Info_ClearChoices(ORG_855_Wolf_Teach);
};

func void ORG_855_Wolf_Teach_DEX_1()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(ORG_855_Wolf_Teach);
	Info_AddChoice(ORG_855_Wolf_Teach,DIALOG_BACK,ORG_855_Wolf_Teach_BACK);
	Info_AddChoice(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_5);
	Info_AddChoice(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_1);
};

func void ORG_855_Wolf_Teach_DEX_5()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(ORG_855_Wolf_Teach);
	Info_AddChoice(ORG_855_Wolf_Teach,DIALOG_BACK,ORG_855_Wolf_Teach_BACK);
	Info_AddChoice(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_5);
	Info_AddChoice(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_1);
};


instance Org_855_Wolf_SELLBOW(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 1;
	condition = Org_855_Wolf_SELLBOW_Condition;
	information = Org_855_Wolf_SELLBOW_Info;
	important = 0;
	permanent = 0;
	description = "Gdzie mogê kupiæ jakiœ ³uk?";
};


func int Org_855_Wolf_SELLBOW_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Wolf_Hello))
	{
		return TRUE;
	};
};

func void Org_855_Wolf_SELLBOW_Info()
{
	AI_Output(other,self,"Org_855_Wolf_SELLBOW_Info_15_01");	//Gdzie mogê kupiæ jakiœ ³uk?
	AI_Output(self,other,"Org_855_Wolf_SELLBOW_Info_09_02");	//Trafi³eœ pod w³aœciwy adres. Mam tu dobry towar za bardzo przystêpne ceny.
	Log_CreateTopic(GE_TraderNC,LOG_NOTE);
	B_LogEntry(GE_TraderNC,"Szkodnik imieniem Wilk sprzedaje ³uki.");
};


instance Info_Wolf_GOOD(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Info_Wolf_GOOD_Condition;
	information = Info_Wolf_GOOD_Info;
	important = 0;
	permanent = 0;
	description = "Gorn powiedzia³, ¿e chcesz ze mn¹ pilnie porozmawiaæ?";
};


func int Info_Wolf_GOOD_Condition()
{
	if(Gorn_GotoWolf == TRUE)
	{
		return TRUE;
	};
};

func void Info_Wolf_GOOD_Info()
{
	AI_Output(hero,self,"Info_Wolf_GOOD_15_01");	//Gorn powiedzia³, ¿e chcesz ze mn¹ pilnie porozmawiaæ?
	AI_Output(self,hero,"Info_Wolf_GOOD_09_02");	//Dobrze, ¿e zd¹¿y³eœ zajrzeæ do mnie przed wymarszem!
	if(!Npc_KnowsInfo(hero,Info_Gorn_FMCENTRANCE))
	{
		AI_Output(hero,self,"Info_Wolf_GOOD_15_03");	//Przed jakim wymarszem?
		AI_Output(self,hero,"Info_Wolf_GOOD_09_04");	//Przed waszym wymarszem do Niezupe³nie-Wolnej-Kopalni.
	};
};


instance Info_Wolf_SPEAK(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Info_Wolf_SPEAK_Condition;
	information = Info_Wolf_SPEAK_Info;
	important = 0;
	permanent = 0;
	description = "O co chodzi?";
};


func int Info_Wolf_SPEAK_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Wolf_GOOD))
	{
		return TRUE;
	};
};

func void Info_Wolf_SPEAK_Info()
{
	AI_Output(hero,self,"Info_Wolf_SPEAK_15_01");	//O co chodzi?
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_02");	//Mam pomys³ na zupe³nie nowy rodzaj pancerza.
	AI_Output(hero,self,"Info_Wolf_SPEAK_15_03");	//Czy¿by? A có¿ to za pomys³?
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_04");	//Pancerze pe³zaczy s¹ niezwykle twarde. Znacznie trwalsze ni¿ choæby stal.
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_05");	//Oczywiœcie nie mam tu na myœli tych wychudzonych osobników, które nawiedza³y zawalon¹ kopalniê Gomeza...
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_06");	//... O nie, one nie wystarcz¹. W NASZEJ kopalni ¿yj¹ PRAWDZIWE PE£ZACZE. Wiêksze, silniejsze i jeszcze bardziej wredne.
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_07");	//Pancerz tych bestii jest niemal nie do przebicia!
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_08");	//Gdybyœ móg³ mi przynieœæ kilka p³ytek z ich pancerzy, móg³bym z nich posk³adaæ nie lada zbrojê!
};


instance Info_Wolf_SKIN(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Info_Wolf_SKIN_Condition;
	information = Info_Wolf_SKIN_Info;
	important = 0;
	permanent = 0;
	description = "W jaki sposób mam oddzieliæ te p³ytki od zw³ok pe³zaczy?";
};


func int Info_Wolf_SKIN_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Wolf_SPEAK))
	{
		return TRUE;
	};
};

func void Info_Wolf_SKIN_Info()
{
	AI_Output(hero,self,"Info_Wolf_SKIN_15_01");	//W jaki sposób mam oddzieliæ te p³ytki od zw³ok pe³zaczy?
	AI_Output(self,hero,"Info_Wolf_SKIN_09_02");	//To proste. P³ytki na grzbiecie przymocowane s¹ tylko przy krawêdziach.
	AI_Output(self,hero,"Info_Wolf_SKIN_09_03");	//Wystarczy wzi¹æ ostry nó¿ i "ci¹æ wzd³u¿ przerywanej linii".
	AI_Output(hero,self,"Info_Wolf_SKIN_15_04");	//W porz¹dku. Postaram siê przynieœæ ci kilka p³ytek z pancerzy pe³zaczy.
	Knows_GetMCPlates = TRUE;
	PrintScreen("Nowa umiejêtnoœæ: Wycinanie p³ytek pancerza",-1,-1,"FONT_OLD_20_WHITE.TGA",3);
	Log_CreateTopic(CH4_MCPlateArmor,LOG_MISSION);
	Log_SetTopicStatus(CH4_MCPlateArmor,LOG_RUNNING);
	B_LogEntry(CH4_MCPlateArmor,"Wilk, Szkodnik z Nowego Obozu, zaproponowa³ mi wykonanie zbroi z pancerzy pe³zaczy. Pokaza³ mi jak nale¿y je usuwaæ z martwych potworów.");
	Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry(GE_AnimalTrophies,"Umiejêtnoœæ usuwania pancerzy z martwych pe³zaczy-wojowników.");
	AI_StopProcessInfos(self);
};


instance Info_Wolf_PROFIT(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Info_Wolf_PROFIT_Condition;
	information = Info_Wolf_PROFIT_Info;
	important = 0;
	permanent = 0;
	description = "I mówisz mi to wszystko nie ¿¹daj¹c niczego w zamian?";
};


func int Info_Wolf_PROFIT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Wolf_SPEAK))
	{
		return TRUE;
	};
};

func void Info_Wolf_PROFIT_Info()
{
	AI_Output(hero,self,"Info_Wolf_PROFIT_15_01");	//I mówisz mi to wszystko nie ¿¹daj¹c niczego w zamian?
	AI_Output(self,hero,"Info_Wolf_PROFIT_09_02");	//No niezupe³nie... Jeœli uda mi siê skleciæ z tych p³ytek porz¹dn¹ zbrojê, bêdê... bardzo szybko... bardzo du¿o... Ach, niewa¿ne!
};


instance Info_Wolf_MCPLATESFEW(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Info_Wolf_MCPLATESFEW_Condition;
	information = Info_Wolf_MCPLATESFEW_Info;
	important = 0;
	permanent = 0;
	description = "Przynios³em ci kilka tych p³ytek, o które prosi³eœ!";
};


func int Info_Wolf_MCPLATESFEW_Condition()
{
	if(Knows_GetMCPlates && (Npc_HasItems(hero,ItAt_Crawler_02) > 0) && (Npc_HasItems(hero,ItAt_Crawler_02) < 15))
	{
		return TRUE;
	};
};

func void Info_Wolf_MCPLATESFEW_Info()
{
	AI_Output(hero,self,"Info_Wolf_MCPLATESFEW_15_01");	//Przynios³em ci kilka tych p³ytek, o które prosi³eœ!
	AI_Output(self,hero,"Info_Wolf_MCPLATESFEW_09_02");	//To za ma³o! Nie starczy na ca³¹ zbrojê!
	AI_Output(self,hero,"Info_Wolf_MCPLATESFEW_09_03");	//Przynieœ mi wiêcej p³ytek!
};


instance Info_Wolf_MCPLATESENOUGH(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Info_Wolf_MCPLATESENOUGH_Condition;
	information = Info_Wolf_MCPLATESENOUGH_Info;
	important = 0;
	permanent = 0;
	description = "Zebra³em mnóstwo p³ytek z pancerzy pe³zaczy!";
};


func int Info_Wolf_MCPLATESENOUGH_Condition()
{
	if(Knows_GetMCPlates && (Npc_HasItems(hero,ItAt_Crawler_02) >= 15))
	{
		return TRUE;
	};
};

func void Info_Wolf_MCPLATESENOUGH_Info()
{
	var int zufallsbelohnung;
	AI_Output(hero,self,"Info_Wolf_MCPLATESENOUGH_15_01");	//Zebra³em mnóstwo p³ytek z pancerzy pe³zaczy!
	AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_09_02");	//Fantastycznie! Natychmiast zabieram siê do roboty!
	if(Npc_GetTrueGuild(hero) == GIL_SLD)
	{
		AI_Output(hero,self,"Info_Wolf_MCPLATESENOUGH_15_03");	//Jak d³ugo to zajmie?
		AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_09_04");	//Nie mam pojêcia. To coœ zupe³nie nowego. Jeszcze nigdy czegoœ takiego nie robi³em!
		AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_09_05");	//Bêdziesz musia³ zagl¹daæ do mnie od czasu do czasu.
		MCPlatesDelivered = TRUE;
		B_LogEntry(CH4_MCPlateArmor,"Da³em Wilkowi 15 tych p³ytek z pancerzy. Teraz potrzebuje trochê czasu, ¿eby sporz¹dziæ z nich dla mnie now¹ zbrojê.");
		B_GiveXP(XP_DeliveredMCPlates);
		B_GiveInvItems(hero,self,ItAt_Crawler_02,15);
		AI_StopProcessInfos(self);
	}
	else if(Npc_GetTrueGuild(hero) != GIL_SLD)
	{
		AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_19_01");	//Szkoda tylko, ¿e nie jesteœ jednym z nas. Wtedy chêtnie bym zrobi³ taki pancerz dla ciebie.
		AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_19_02");	//Ale jako cz³onek innego obozu bêdziesz musia³ siê niestety obejœæ smakiem.
		AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_19_03");	//Mam ju¿ nawet pewnego klienta, który jest zainteresowany tego rodzaju zbroj¹.
		AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_19_04");	//Niemniej jednak mam coœ dla ciebie. Nie chcê, byœ odszed³ z pustymi rêkami. Trzymaj!
		Log_SetTopicStatus(CH4_MCPlateArmor,LOG_SUCCESS);
		B_LogEntry(CH4_MCPlateArmor,"Po oddaniu Wilkowi 15 p³ytek z pancerzy pe³zaczy powiedzia³ mi, ¿e tak¹ zbrojê mo¿e zrobiæ jedynie dla cz³onka Nowego Obozu. No có¿, chyba bêdê musia³ obejœæ siê smakiem. Na pocieszenie otrzyma³em od niego pewien cenny napój.");
		B_GiveXP(XP_GORPSIPLATEARMOR);
		Mdl_SetVisualBody(org_5033_gestath,"hum_body_Naked0",0,3,"Hum_Head_Psionic",12,0,crw_armor_h);
		Npc_RemoveInvItem(org_5033_gestath,ItRw_Bow_Long_01);
		Npc_RemoveInvItem(org_5033_gestath,ItMw_1H_Mace_War_02);
		CreateInvItems(org_5033_gestath,ItMw_2H_Sword_Heavy_02,1);
		AI_EquipBestMeleeWeapon(org_5033_gestath);
		AI_EquipBestArmor(org_5033_gestath);
		B_GiveInvItems(hero,self,ItAt_Crawler_02,15);
		MCPlatesDelivered = TRUE;
		zufallsbelohnung = Hlp_Random(100);
		if(zufallsbelohnung >= 75)
		{
			CreateInvItem(self,ItFo_Potion_Dex_03);
			B_GiveInvItems(self,hero,ItFo_Potion_Dex_03,1);
		}
		else if(zufallsbelohnung >= 50)
		{
			CreateInvItem(self,ItFo_Potion_Strength_03);
			B_GiveInvItems(self,hero,ItFo_Potion_Strength_03,1);
		}
		else if(zufallsbelohnung >= 25)
		{
			CreateInvItem(self,ItFo_Potion_Health_Perma_03);
			B_GiveInvItems(self,hero,ItFo_Potion_Health_Perma_03,1);
		};
		AI_StopProcessInfos(self);
	};
};


instance Info_Wolf_ARMORINWORK(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Info_Wolf_ARMORINWORK_Condition;
	information = Info_Wolf_ARMORINWORK_Info;
	important = 0;
	permanent = 1;
	description = "Jak postêpuj¹ prace nad nowym pancerzem?";
};


func int Info_Wolf_ARMORINWORK_Condition()
{
	if((MCPlatesDelivered == TRUE) && (FreemineOrc_LookingUlumulu != LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		return TRUE;
	};
};

func void Info_Wolf_ARMORINWORK_Info()
{
	AI_Output(hero,self,"Info_Wolf_ARMORINWORK_15_01");	//Jak postêpuj¹ prace nad nowym pancerzem?
	AI_Output(self,hero,"Info_Wolf_ARMORINWORK_09_02");	//To zajmie d³u¿ej ni¿ myœla³em! Te p³ytki s¹ niezwykle twarde. Nie bardzo wiem jak mam je ze sob¹ po³¹czyæ!
	AI_Output(self,hero,"Info_Wolf_ARMORINWORK_09_03");	//Daj mi jeszcze trochê czasu! Dam radê, zaufaj mi!
	AI_StopProcessInfos(self);
};


instance Info_Wolf_ARMORFINISHED(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Info_Wolf_ARMORFINISHED_Condition;
	information = Info_Wolf_ARMORFINISHED_Info;
	important = 0;
	permanent = 0;
	description = "Jak postêpuj¹ prace nad nowym pancerzem?";
};


func int Info_Wolf_ARMORFINISHED_Condition()
{
	if((MCPlatesDelivered == TRUE) && (FreemineOrc_LookingUlumulu == LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		return TRUE;
	};
};

func void Info_Wolf_ARMORFINISHED_Info()
{
	AI_Output(hero,self,"Info_Wolf_ARMORFINISHED_15_01");	//Jak postêpuj¹ prace nad nowym pancerzem?
	AI_Output(self,hero,"Info_Wolf_ARMORFINISHED_09_02");	//Uda³o mi siê wreszcie znaleŸæ sposób na po³¹czenie p³ytek ze sob¹!
	AI_Output(hero,self,"Info_Wolf_ARMORFINISHED_15_03");	//Czy to znaczy, ¿e zbroja jest ju¿ gotowa!
	AI_Output(self,hero,"Info_Wolf_ARMORFINISHED_09_04");	//Dok³adnie! Oto i ona! Jest twardsza ni¿ jakikolwiek pancerz jaki widzia³em na oczy!
	AI_Output(hero,self,"Info_Wolf_ARMORFINISHED_15_05");	//Dziêki, jestem twoim d³u¿nikiem!
	AI_Output(self,hero,"Info_Wolf_ARMORFINISHED_09_06");	//Nie ma o czym mówiæ! Na pewno na tym nie stracê! Co to, to nie! Ha Ha!
	B_LogEntry(CH4_MCPlateArmor,"Wilk skoñczy³ ju¿ moj¹ now¹ zbrojê. To najlepszy pancerz, jaki w ¿yciu widzia³em!");
	Log_SetTopicStatus(CH4_MCPlateArmor,LOG_SUCCESS);
	B_GiveXP(XP_GorMCPlateArmor);
	CreateInvItem(self,crw_armor_h);
	B_GiveInvItems(self,hero,crw_armor_h,1);
};


instance info_wolf_craft(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 9;
	condition = info_wolf_craft_condition;
	information = info_wolf_craft_info;
	important = 0;
	permanent = 0;
	description = "Móg³byœ zrobiæ dla mnie zbrojê?";
};


func int info_wolf_craft_condition()
{
	if(Npc_KnowsInfo(hero,dia_gestath_armor))
	{
		return TRUE;
	};
};

func void info_wolf_craft_info()
{
	AI_Output(hero,self,"Info_Wolf_CRAFT_15_01");	//Móg³byœ zrobiæ dla mnie zbrojê?
	AI_Output(self,hero,"Info_Wolf_CRAFT_09_02");	//Móg³bym, jednak nie mam doœæ komponentów, ¿eby ci takow¹ wykonaæ.
	AI_Output(hero,self,"Info_Wolf_CRAFT_09_03");	//A co, jeœli bym ci te rzeczy za³atwi³?
	AI_Output(self,hero,"Info_Wolf_CRAFT_09_04");	//A to zmienia postaæ rzeczy. Tylko wiesz, musia³byœ siê znaæ dobrze na polowaniu, bo bez skór, zêbów i tego rodzaju rzeczy siê nie obejdzie.
	AI_Output(self,hero,"Info_Wolf_CRAFT_09_05");	//No i oczywiœcie nie zrobiê tego za darmo, w koñcu te¿ muszê jakoœ wyjœæ na swoje.
	Log_CreateTopic(GE_TraderNC,LOG_NOTE);
	B_LogEntry(GE_TraderNC,"Wilk z chêci¹ wykona dla mnie pancerze, jeœli tylko za³atwiê mu potrzebne komponenty.");
};


instance info_wolf_craft_which(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 9;
	condition = info_wolf_craft_which_condition;
	information = info_wolf_craft_which_info;
	important = 0;
	permanent = 1;
	description = "Jaki pancerz móg³byœ dla mnie wykonaæ?";
};


func int info_wolf_craft_which_condition()
{
	if(Npc_KnowsInfo(hero,info_wolf_craft))
	{
		return TRUE;
	};
};

func void info_wolf_craft_which_info()
{
	AI_Output(hero,self,"Info_Wolf_CRAFT_WHICH_15_01");	//Jaki pancerz móg³byœ dla mnie wykonaæ?
	AI_Output(self,hero,"Info_Wolf_CRAFT_WHICH_09_02");	//Wybierz sobie.
	Info_ClearChoices(info_wolf_craft_which);
	Info_AddChoice(info_wolf_craft_which,DIALOG_BACK,info_wolf_craft_which_back);
	Info_AddChoice(info_wolf_craft_which,"Pancerz z wilczych skór (4 skór wilka, 3 zêby, 2 pazury, 600 bry³ek)",info_wolf_craft_which_wolf);
	Info_AddChoice(info_wolf_craft_which,"Pancerz ze skór topielców (5 skór topielca, 2 zêby, 2 pazury, 800 bry³ek)",info_wolf_craft_which_lurker);
	if(Kapitel > 1)
	{
		Info_AddChoice(info_wolf_craft_which,"Pancerz ze skór orkowych psów (7 skór orkowego psa, 6 zêbów, 4 pazurów, 1250 bry³ek)",info_wolf_craft_which_orc);
	};
	if(Kapitel > 2)
	{
		Info_AddChoice(info_wolf_craft_which,"Pancerz z b³otnych wê¿y (6 skór b³otnego wê¿a, 5 k³ów b³otnych wê¿y, 2 pazury, 1700 bry³ek)",info_wolf_craft_which_shark);
	};
	if(Kapitel > 3)
	{
		Info_AddChoice(info_wolf_craft_which,"Pancerz ze skór trolla (2 skór trolla, 4 k³y trolla, 4 pazury, 2050 bry³ek)",info_wolf_craft_which_troll);
	};
};

func void info_wolf_craft_which_back()
{
	Info_ClearChoices(info_wolf_craft_which);
};

func void info_wolf_craft_which_wolf()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_Wolf_13_01");	//Chcia³bym, abyœ zmajstrowa³ dla mnie pancerz z wilczych skór.
	if((Npc_HasItems(other,ItAt_Wolf_01) >= 4) && (Npc_HasItems(other,ItAt_Claws_01) >= 2) && (Npc_HasItems(other,ItAt_Teeth_01) >= 3) && (Npc_HasItems(hero,ItMiNugget) >= VALUE_NON_ARMOR_K))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_16_02");	//W porz¹dku, da siê zrobiæ.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_15_04");	//Mam tê zbrojê jeszcze na sk³adzie, tak ¿e po prostu dam ci j¹ w zamian za materia³y.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_15_05");	//Mi³ej zabawy!
		B_GiveInvItems(other,self,ItAt_Wolf_01,4);
		B_GiveInvItems(other,self,ItAt_Claws_01,2);
		B_GiveInvItems(other,self,ItAt_Teeth_01,3);
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_NON_ARMOR_K);
		CreateInvItem(hero,non_armor_l);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		AI_EquipBestArmor(hero);
		Info_ClearChoices(info_wolf_craft_which);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_15_02");	//Wróæ, kiedy zdobêdziesz dostateczn¹ iloœæ materia³ów.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which);
	};
};

func void info_wolf_craft_which_orc()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_Orc_12_01");	//Chcia³bym, abyœ zmajstrowa³ dla mnie pancerz ze skór orkowych psów.
	if((Npc_HasItems(other,ItAt_Wolf_02) >= 7) && (Npc_HasItems(other,ItAt_Claws_01) >= 6) && (Npc_HasItems(other,ItAt_Teeth_01) >= 4) && (Npc_HasItems(hero,ItMiNugget) >= value_non_armor_n))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_16_02");	//W porz¹dku, da siê zrobiæ.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_15_04");	//Mam tê zbrojê jeszcze na sk³adzie, tak ¿e po prostu dam ci j¹ w zamian za materia³y.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_15_05");	//Mi³ej zabawy!
		B_GiveInvItems(other,self,ItAt_Wolf_02,7);
		B_GiveInvItems(other,self,ItAt_Claws_01,6);
		B_GiveInvItems(other,self,ItAt_Teeth_01,4);
		B_GiveInvItems(hero,self,ItMiNugget,value_non_armor_n);
		CreateInvItem(hero,non_armor_n);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		AI_EquipBestArmor(hero);
		Info_ClearChoices(info_wolf_craft_which);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_15_02");	//Wróæ, kiedy zdobêdziesz dostateczn¹ iloœæ materia³ów.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which);
	};
};

func void info_wolf_craft_which_shark()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_Wolf_34_01");	//Chcia³bym, abyœ zmajstrowa³ dla mnie pancerz ze skór b³otnych wê¿y.
	if((Npc_HasItems(other,ItAt_Swampshark_01) >= 6) && (Npc_HasItems(other,ItAt_Claws_01) >= 2) && (Npc_HasItems(other,ItAt_Swampshark_02) >= 5) && (Npc_HasItems(hero,ItMiNugget) >= VALUE_NON_ARMOR_L))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Shark_16_02");	//W porz¹dku, da siê zrobiæ.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_15_04");	//Mam tê zbrojê jeszcze na sk³adzie, tak ¿e po prostu dam ci j¹ w zamian za materia³y.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_15_05");	//Mi³ej zabawy!
		B_GiveInvItems(other,self,ItAt_Swampshark_01,6);
		B_GiveInvItems(other,self,ItAt_Claws_01,2);
		B_GiveInvItems(other,self,ItAt_Swampshark_02,5);
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_NON_ARMOR_L);
		CreateInvItem(hero,non_armor_k);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		AI_EquipBestArmor(hero);
		Info_ClearChoices(info_wolf_craft_which);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_15_02");	//Wróæ, kiedy zdobêdziesz dostateczn¹ iloœæ materia³ów.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which);
	};
};

func void info_wolf_craft_which_lurker()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_Lurker_34_01");	//Chcia³bym, abyœ zmajstrowa³ dla mnie pancerz ze skór topielców.
	if((Npc_HasItems(other,ItAt_Lurker_02) >= 5) && (Npc_HasItems(other,ItAt_Claws_01) >= 2) && (Npc_HasItems(other,ItAt_Teeth_01) >= 2) && (Npc_HasItems(hero,ItMiNugget) >= value_non_armor_u))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Lurker_16_02");	//W porz¹dku, da siê zrobiæ.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Lurker_15_04");	//Mam tê zbrojê jeszcze na sk³adzie, tak ¿e po prostu dam ci j¹ w zamian za materia³y.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Lurker_15_05");	//Mi³ej zabawy!
		B_GiveInvItems(other,self,ItAt_Lurker_02,5);
		B_GiveInvItems(other,self,ItAt_Claws_01,2);
		B_GiveInvItems(other,self,ItAt_Teeth_01,2);
		B_GiveInvItems(hero,self,ItMiNugget,value_non_armor_u);
		CreateInvItem(hero,non_armor_u);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		AI_EquipBestArmor(hero);
		Info_ClearChoices(info_wolf_craft_which);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Lurker_15_02");	//Wróæ, kiedy zdobêdziesz dostateczn¹ iloœæ materia³ów.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which);
	};
};

func void info_wolf_craft_which_troll()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_Troll_34_01");	//Chcia³bym, abyœ zmajstrowa³ dla mnie pancerz ze skór trolla.
	if((Npc_HasItems(other,ItAt_Troll_01) >= 2) && (Npc_HasItems(other,ItAt_Claws_01) >= 4) && (Npc_HasItems(other,ItAt_Troll_02) >= 4) && (Npc_HasItems(hero,ItMiNugget) >= VALUE_NON_ARMOR_W))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Troll_16_02");	//W porz¹dku, da siê zrobiæ.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Troll_15_04");	//Mam tê zbrojê jeszcze na sk³adzie, tak ¿e po prostu dam ci j¹ w zamian za materia³y.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Troll_15_05");	//Mi³ej zabawy!
		B_GiveInvItems(other,self,ItAt_Troll_01,2);
		B_GiveInvItems(other,self,ItAt_Claws_01,4);
		B_GiveInvItems(other,self,ItAt_Troll_02,4);
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_NON_ARMOR_W);
		CreateInvItem(hero,non_armor_p);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		AI_EquipBestArmor(hero);
		Info_ClearChoices(info_wolf_craft_which);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Troll_15_02");	//Wróæ, kiedy zdobêdziesz dostateczn¹ iloœæ materia³ów.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which);
	};
};


instance INFO_WOLF_CRAFT_WHICH_IMPROVE(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 9;
	condition = info_wolf_craft_which_improve_condition;
	information = info_wolf_craft_which_improve_info;
	important = 0;
	permanent = 1;
	description = "Potrafisz te¿ wzmiacniaæ pancerze?";
};


func int info_wolf_craft_which_improve_condition()
{
	if(((Npc_GetTrueGuild(hero) == GIL_ORG) && Npc_KnowsInfo(hero,DIA_Wolf_Hello)) || ((Npc_GetTrueGuild(hero) == GIL_SLD) && Npc_KnowsInfo(hero,DIA_Wolf_Hello)) || ((Npc_GetTrueGuild(hero) == GIL_KDW) && Npc_KnowsInfo(hero,DIA_Wolf_Hello)))
	{
		return TRUE;
	};
};

func void info_wolf_craft_which_improve_info()
{
	AI_Output(hero,self,"Info_Wolf_CRAFT_WHICH_IMPROVE_15_01");	//Potrafisz te¿ wzmiacniaæ pancerze?
	AI_Output(self,hero,"Info_Wolf_CRAFT_WHICH_IMPROVE_09_02");	//Jasne, jednak potrzebna mi do tego bêdzie odpowiednia zbroja, jak i godziwa zap³ata w rudzie.
	Info_ClearChoices(info_wolf_craft_which_improve);
	Info_AddChoice(info_wolf_craft_which_improve,DIALOG_BACK,info_wolf_craft_which_improve_back);
	if(Npc_HasItems(other,org_armor_l) >= 1)
	{
		Info_AddChoice(info_wolf_craft_which_improve,"Wzmocniony lekki strój Szkodnika (375 bry³ek)",info_wolf_craft_which_improve_orgl);
	};
	if(Npc_HasItems(other,org_armor_m) >= 1)
	{
		Info_AddChoice(info_wolf_craft_which_improve,"Wzmocniony strój Szkodnika (525 bry³ek)",info_wolf_craft_which_improve_orgm);
	};
	if(Npc_HasItems(other,org_armor_h) >= 1)
	{
		Info_AddChoice(info_wolf_craft_which_improve,"Wzmocniony ciê¿ki strój Szkodnika (600 bry³ek)",info_wolf_craft_which_improve_orgh);
	};
	if(Npc_HasItems(other,sld_armor_l) >= 1)
	{
		Info_AddChoice(info_wolf_craft_which_improve,"Wzmocniona lekka zbroja Najemnika (675 bry³ek)",info_wolf_craft_which_improve_sldl);
	};
	if(Npc_HasItems(other,sld_armor_m) >= 1)
	{
		Info_AddChoice(info_wolf_craft_which_improve,"Wzmocniona zbroja Najemnika (825 bry³ek)",info_wolf_craft_which_improve_sldm);
	};
	if(Npc_HasItems(other,sld_armor_h) >= 1)
	{
		Info_AddChoice(info_wolf_craft_which_improve,"Wzmocniona ciê¿ka zbroja Najemnika (1050 bry³ek)",info_wolf_craft_which_improve_sldh);
	};
	if(Npc_HasItems(other,kdw_armor_l) >= 1)
	{
		Info_AddChoice(info_wolf_craft_which_improve,"Wzmocniona szata Wody (975 bry³ek)",info_wolf_craft_which_improve_kdwl);
	};
};

func void info_wolf_craft_which_improve_back()
{
	Info_ClearChoices(info_wolf_craft_which_improve);
};

func void info_wolf_craft_which_improve_orgl()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_13_01");	//Oto pancerz.
	if((Npc_HasItems(other,org_armor_l) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 375))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_16_02");	//W porz¹dku, da siê zrobiæ - tak myœlê.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_04");	//Jedn¹ chwilê.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,org_armor_l,1);
		B_GiveInvItems(hero,self,ItMiNugget,375);
		Npc_RemoveInvItem(self,org_armor_l);
		CreateInvItem(self,org_armor_l_upgrade);
		B_GiveInvItems(self,hero,org_armor_l_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_05");	//No, masz tu swój pancerz z powrotem. Niech ci s³u¿y!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_02");	//Nie masz doœæ rudy.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which_improve);
	};
};

func void info_wolf_craft_which_improve_orgm()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_13_01");	//Oto pancerz.
	if((Npc_HasItems(other,org_armor_m) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 525))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_16_02");	//W porz¹dku, da siê zrobiæ - tak myœlê.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_04");	//Jedn¹ chwilê.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,org_armor_m,1);
		B_GiveInvItems(hero,self,ItMiNugget,525);
		Npc_RemoveInvItem(self,org_armor_m);
		CreateInvItem(self,org_armor_m_upgrade);
		B_GiveInvItems(self,hero,org_armor_m_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_05");	//No, masz tu swój pancerz z powrotem. Niech ci s³u¿y!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_02");	//Nie masz doœæ rudy.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which_improve);
	};
};

func void info_wolf_craft_which_improve_orgh()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_IMPROVEWolf_13_01");	//Oto pancerz.
	if((Npc_HasItems(other,org_armor_h) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 600))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_16_02");	//W porz¹dku, da siê zrobiæ - tak myœlê.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_04");	//Jedn¹ chwilê.
		B_GiveInvItems(hero,self,ItMiNugget,600);
		Npc_RemoveInvItem(hero,org_armor_h);
		CreateInvItem(hero,org_armor_h_upgrade);
		AI_EquipBestArmor(hero);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_05");	//No, masz tu swój pancerz z powrotem. Niech ci s³u¿y!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_IMPROVE_Wolf_15_02");	//Nie masz doœæ rudy.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which_improve);
	};
};

func void info_wolf_craft_which_improve_sldl()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_13_01");	//Oto pancerz.
	if((Npc_HasItems(other,sld_armor_l) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 675))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_16_02");	//W porz¹dku, da siê zrobiæ - tak myœlê.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_04");	//Jedn¹ chwilê.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,sld_armor_l,1);
		B_GiveInvItems(hero,self,ItMiNugget,675);
		Npc_RemoveInvItem(self,sld_armor_l);
		CreateInvItem(self,sld_armor_l_upgrade);
		B_GiveInvItems(self,hero,sld_armor_l_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_05");	//No, masz tu swój pancerz z powrotem. Niech ci s³u¿y!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_02");	//Nie masz doœæ rudy.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which_improve);
	};
};

func void info_wolf_craft_which_improve_sldm()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_13_01");	//Oto pancerz.
	if((Npc_HasItems(other,sld_armor_m) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 825))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_16_02");	//W porz¹dku, da siê zrobiæ - tak myœlê.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_04");	//Jedn¹ chwilê.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,sld_armor_m,1);
		B_GiveInvItems(hero,self,ItMiNugget,825);
		Npc_RemoveInvItem(self,sld_armor_m);
		CreateInvItem(self,sld_armor_m_upgrade);
		B_GiveInvItems(self,hero,sld_armor_m_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_05");	//No, masz tu swój pancerz z powrotem. Niech ci s³u¿y!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_IMPROVE_15_02");	//Nie masz doœæ rudy.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which_improve);
	};
};

func void info_wolf_craft_which_improve_sldh()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_13_01");	//Oto pancerz.
	if((Npc_HasItems(other,sld_armor_h) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 1050))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_16_02");	//W porz¹dku, da siê zrobiæ - tak myœlê.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_04");	//Jedn¹ chwilê.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,sld_armor_h,1);
		B_GiveInvItems(hero,self,ItMiNugget,1050);
		Npc_RemoveInvItem(self,sld_armor_h);
		CreateInvItem(self,sld_armor_h_upgrade);
		B_GiveInvItems(self,hero,sld_armor_h_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_05");	//No, masz tu swój pancerz z powrotem. Niech ci s³u¿y!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_02");	//Nie masz doœæ rudy.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which_improve);
	};
};

func void info_wolf_craft_which_improve_kdwl()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_13_01");	//Oto pancerz.
	if((Npc_HasItems(other,kdw_armor_l) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 975))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_16_02");	//W porz¹dku, da siê zrobiæ - tak myœlê.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_04");	//Jedn¹ chwilê.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,kdw_armor_l,1);
		B_GiveInvItems(hero,self,ItMiNugget,975);
		Npc_RemoveInvItem(self,kdw_armor_l);
		CreateInvItem(self,kdw_armor_l_upgrade);
		B_GiveInvItems(self,hero,kdw_armor_l_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_05");	//No, masz tu swój pancerz z powrotem. Niech ci s³u¿y!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_02");	//Nie masz doœæ rudy.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which_improve);
	};
};


instance DIA_WOLF_GREETSLD(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 1;
	condition = dia_wolf_greetsld_condition;
	information = dia_wolf_greetsld_info;
	permanent = 1;
	important = 0;
	description = "Jesteœ teraz Najemnikiem?";
};


func int dia_wolf_greetsld_condition()
{
	if(Npc_GetTrueGuild(self) == GIL_SLD)
	{
		return TRUE;
	};
};

func void dia_wolf_greetsld_info()
{
	AI_Output(other,self,"DIA_Wolf_GreetSLD_09_00");	//Jesteœ teraz Najemnikiem?
	AI_Output(self,other,"DIA_Wolf_GreetSLD_09_01");	//Lee s³ysza³ o tym, jak ci¹gle skleca³em jego ch³opcom ich powgniatane zbroje.
	AI_Output(self,other,"DIA_Wolf_GreetSLD_09_02");	//Ponadto by³ pod wra¿eniem, z jakich materia³ów potrafiê sporz¹dziæ ró¿norakie pancerze.
	AI_Output(self,other,"DIA_Wolf_GreetSLD_09_03");	//I dziêki temu powiedzia³ mi, ¿e jestem ju¿ gotów zostaæ Najemnikiem w s³u¿bie magów.
};


instance DIA_WOLF_SELLFUR(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 600;
	condition = dia_wolf_sellfur_condition;
	information = dia_wolf_sellfur_info;
	permanent = 1;
	description = "Mam dla ciebie kilka skór...";
};


func int dia_wolf_sellfur_condition()
{
	if(Npc_KnowsInfo(hero,Org_855_Wolf_TRADE))
	{
		return TRUE;
	};
};

func void dia_wolf_sellfur_info()
{
	AI_Output(other,self,"DIA_wolf_SellFur_15_00");	//Mam dla ciebie kilka skór...
	if((Npc_HasItems(other,ItAt_Wolf_01) > 0) || (Npc_HasItems(other,ItAt_Wolf_02) > 0) || (Npc_HasItems(other,ItAt_Shadow_01) > 0) || (Npc_HasItems(other,ItAt_Troll_01) > 0) || (Npc_HasItems(other,ItAt_Swampshark_01) > 0) || (Npc_HasItems(other,ItAt_Lurker_02) > 0))
	{
		if(Npc_HasItems(other,ItAt_Wolf_01) > 0)
		{
			AI_Output(self,other,"DIA_wolf_SellFur_11_01");	//Wilcza skóra? Mo¿e siê przydaæ.
			CreateInvItems(other,ItMiNugget,Npc_HasItems(other,ItAt_Wolf_01) * Value_Wolfsfell);
			Npc_RemoveInvItems(other,ItAt_Wolf_01,Npc_HasItems(other,ItAt_Wolf_01));
		};
		if(Npc_HasItems(other,ItAt_Wolf_02) > 0)
		{
			AI_Output(self,other,"DIA_wolf_SellFur_11_02");	//Skóra orkowego psa? Te bestie s¹ niebezpieczne.
			CreateInvItems(other,ItMiNugget,Npc_HasItems(other,ItAt_Wolf_02) * Value_Orkhundfell);
			Npc_RemoveInvItems(other,ItAt_Wolf_02,Npc_HasItems(other,ItAt_Wolf_02));
		};
		if(Npc_HasItems(other,ItAt_Shadow_01) > 0)
		{
			AI_Output(self,other,"DIA_wolf_SellFur_11_03");	//Za³atwi³eœ cieniostwora? Nie czêsto widuje siê te bestie w tej okolicy.
			CreateInvItems(other,ItMiNugget,Npc_HasItems(other,ItAt_Shadow_01) * Value_Shadowbeastfell);
			Npc_RemoveInvItems(other,ItAt_Shadow_01,Npc_HasItems(other,ItAt_Shadow_01));
		};
		if(Npc_HasItems(other,ItAt_Lurker_02) > 0)
		{
			AI_Output(self,other,"DIA_wolf_SellFur_11_04");	//Skóra topielca, nieŸle siê takie obrabia.
			CreateInvItems(other,ItMiNugget,Npc_HasItems(other,ItAt_Lurker_02) * Value_Lurkerhaut);
			Npc_RemoveInvItems(other,ItAt_Lurker_02,Npc_HasItems(other,ItAt_Lurker_02));
		};
		if(Npc_HasItems(other,ItAt_Swampshark_01) > 0)
		{
			AI_Output(self,other,"DIA_wolf_SellFur_11_05");	//Skóra b³otnego wê¿a? Pewnie przechodzi³eœ akurat przez bagno tych œwirów z Sekty, co?
			CreateInvItems(other,ItMiNugget,Npc_HasItems(other,ItAt_Swampshark_01) * Value_Sumpfhaihaut);
			Npc_RemoveInvItems(other,ItAt_Swampshark_01,Npc_HasItems(other,ItAt_Swampshark_01));
		};
		if(Npc_HasItems(other,ItAt_Troll_01) > 0)
		{
			AI_Output(self,other,"DIA_wolf_SellFur_11_06");	//A co to za skóra?
			AI_Output(other,self,"DIA_wolf_SellFur_11_07");	//Zdar³em j¹ z trolla.
			AI_Output(self,other,"DIA_wolf_SellFur_11_08");	//Trolla? Jak dot¹d s³ysza³em jedynie opowieœci o tych stworzeniach.
			CreateInvItems(other,ItMiNugget,Npc_HasItems(other,ItAt_Troll_01) * Value_Trollfell);
			Npc_RemoveInvItems(other,ItAt_Troll_01,Npc_HasItems(other,ItAt_Troll_01));
		};
		AI_Output(self,other,"DIA_wolf_SellFur_11_09");	//Solidne zdobycze, powiem ci. Jeœli bêdziesz mia³ nastêpne, to wiesz do kogo siê zwróciæ.
	}
	else
	{
		AI_Output(self,other,"DIA_wolf_SellFur_11_10");	//Ale ja tu ¿adnych skór nie widzê. Wróæ, kiedy ju¿ bêdziesz mia³ przy sobie coœ ciekawego.
	};
};

