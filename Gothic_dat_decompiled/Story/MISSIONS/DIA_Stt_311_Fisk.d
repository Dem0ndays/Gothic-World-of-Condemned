
instance Stt_311_Fisk_Exit(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 999;
	condition = Stt_311_Fisk_Exit_Condition;
	information = Stt_311_Fisk_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Stt_311_Fisk_Exit_Condition()
{
	return 1;
};

func void Stt_311_Fisk_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Stt_311_Fisk_First(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 1;
	condition = Stt_311_Fisk_First_Condition;
	information = Stt_311_Fisk_First_Info;
	permanent = 0;
	important = 1;
};


func int Stt_311_Fisk_First_Condition()
{
	return 1;
};

func void Stt_311_Fisk_First_Info()
{
	AI_Output(self,other,"Stt_311_Fisk_First_12_00");	//Witaj! Jestem Fisk. Handlujê najró¿niejszym towarem. Gdybyœ kiedyœ czegoœ potrzebowa³, zg³oœ siê do mnie.
	Log_CreateTopic(GE_TraderOC,LOG_NOTE);
	B_LogEntry(GE_TraderOC,"Cieñ o imieniu Fisk handluje przeró¿nymi dobrami, a szczególnie broni¹. Znajdê go na targowisku.");
};


instance Stt_311_Fisk_Trade(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 800;
	condition = Stt_311_Fisk_Trade_Condition;
	information = Stt_311_Fisk_Trade_Info;
	permanent = 1;
	description = "Poka¿ mi swoje towary.";
	trade = 1;
};


func int Stt_311_Fisk_Trade_Condition()
{
	return 1;
};

func void Stt_311_Fisk_Trade_Info()
{
	AI_Output(other,self,"Stt_311_Fisk_Trade_15_00");	//Poka¿ mi swoje towary.
};


instance Stt_311_Fisk_WhistlersSword(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 801;
	condition = Stt_311_Fisk_WhistlersSword_Condition;
	information = Stt_311_Fisk_WhistlersSword_Info;
	permanent = 1;
	description = "Chcia³bym kupiæ miecz. Coœ... bogato zdobionego.";
};


func int Stt_311_Fisk_WhistlersSword_Condition()
{
	if((Fisk_ForgetSword == FALSE) && (Whistler_BuyMySword == LOG_RUNNING) && (Fisk_SwordSold == FALSE))
	{
		return 1;
	};
};

func void Stt_311_Fisk_WhistlersSword_Info()
{
	AI_Output(other,self,"Stt_311_Fisk_WhistlersSword_15_00");	//Chcia³bym kupiæ miecz. Ale nie taki zwyk³y. Chcia³bym coœ... bogato zdobionego.
	AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_12_01");	//Mam tu coœ w sam raz dla ciebie. Cieñ, który mia³ to odebraæ wiêcej siê tu nie poka¿e.
	AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_12_02");	//Kosztuje jedyne 110 bry³ek rudy. Zainteresowany?
	Fisk_SCknows110 = TRUE;
	Info_ClearChoices(Stt_311_Fisk_WhistlersSword);
	Info_AddChoice(Stt_311_Fisk_WhistlersSword,"Mo¿e innym razem.",Stt_311_Fisk_WhistlersSword_BACK);
	Info_AddChoice(Stt_311_Fisk_WhistlersSword,"Œwistakowi chcia³eœ go sprzedaæ za 100...",Stt_311_Fisk_WhistlersSword_Fault);
	Info_AddChoice(Stt_311_Fisk_WhistlersSword,"Dobrze, wezmê go.",Stt_311_Fisk_WhistlersSword_TakeIt);
};

func void Stt_311_Fisk_WhistlersSword_BACK()
{
	AI_Output(other,self,"Org_826_Mordrag_WhistlersSword_BACK_15_00");	//Mo¿e innym razem.
	Info_ClearChoices(Stt_311_Fisk_WhistlersSword);
};

func void Stt_311_Fisk_WhistlersSword_Fault()
{
	AI_Output(other,self,"Stt_311_Fisk_WhistlersSword_Fault_15_00");	//Przecie¿ Œwistakowi chcia³eœ go sprzedaæ za 100!
	AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_Fault_12_01");	//Ach! Chwileczkê... Racja! Ma³o brakowa³o, a sprzeda³bym ci go zbyt tanio. Naturalnie mia³em na myœli 500 bry³ek.
	AI_Output(other,self,"Stt_311_Fisk_WhistlersSword_Fault_15_02");	//Piêæset?!
	AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_Fault_12_03");	//Za ma³o? Mo¿e wolisz 1000? Te¿ dobrze. Chocia¿ wiesz co? Ten miecz nie jest jednak na sprzeda¿.
	Fisk_ForgetSword = TRUE;
	Info_ClearChoices(Stt_311_Fisk_WhistlersSword);
};

func void Stt_311_Fisk_WhistlersSword_TakeIt()
{
	AI_Output(other,self,"Stt_311_Fisk_WhistlersSword_TakeIt_15_00");	//Dobrze, wezmê go.
	if(Npc_HasItems(other,ItMiNugget) >= 110)
	{
		AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_TakeIt_12_01");	//Trafi³a ci siê nie lada okazja.
		B_GiveInvItems(other,self,ItMiNugget,110);
		CreateInvItem(self,Whistlers_Schwert);
		B_GiveInvItems(self,other,Whistlers_Schwert,1);
		Info_ClearChoices(Stt_311_Fisk_WhistlersSword);
		Fisk_SwordSold = TRUE;
	}
	else
	{
		AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_TakeIt_12_02");	//Obawiam siê, ¿e masz za ma³o rudy. Zachowam ten miecz dla ciebie, ale lepiej siê pospiesz!
	};
};


instance Stt_311_Fisk_ForgetSword(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 800;
	condition = Stt_311_Fisk_ForgetSword_Condition;
	information = Stt_311_Fisk_ForgetSword_Info;
	permanent = 1;
	description = "Wracaj¹c do miecza Œwistaka...";
};


func int Stt_311_Fisk_ForgetSword_Condition()
{
	if(Fisk_ForgetSword == TRUE)
	{
		return 1;
	};
};

func void Stt_311_Fisk_ForgetSword_Info()
{
	AI_Output(other,self,"Stt_311_Fisk_ForgetSword_15_00");	//Porozmawiajmy jeszcze o mieczu Œwistaka.
	AI_Output(self,other,"Stt_311_Fisk_ForgetSword_12_01");	//Powiedz mu, ¿e nigdy nie dostanie tej broni.
};


var int Fisk_GetNewHehler;

instance Stt_311_Fisk_MordragKO(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 800;
	condition = Stt_311_Fisk_MordragKO_Condition;
	information = Stt_311_Fisk_MordragKO_Info;
	permanent = 0;
	important = 1;
};


func int Stt_311_Fisk_MordragKO_Condition()
{
	if((MordragKO_HauAb == TRUE) && (Npc_GetTrueGuild(hero) == GIL_None) && ((Thorus_MordragKo == LOG_RUNNING) || (Thorus_MordragKo == LOG_SUCCESS)))
	{
		return 1;
	};
};

func void Stt_311_Fisk_MordragKO_Info()
{
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_12_00");	//Hej, ty!
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_12_01");	//Mordrag by³ jednym z moich najlepszych dostawców, ty g³upcze!
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_12_02");	//Jeœli chcesz zostaæ cz³onkiem tego obozu, na mój g³os nie masz co liczyæ!
	Info_ClearChoices(Stt_311_Fisk_MordragKO);
	Info_AddChoice(Stt_311_Fisk_MordragKO,"Handlujesz przedmiotami Magnatów. Thorus chêtnie siê o tym dowie.",Stt_311_Fisk_MordragKO_Petze);
	Info_AddChoice(Stt_311_Fisk_MordragKO,"Uspokój siê! Mo¿e mogê ci to jakoœ wynagrodziæ?",Stt_311_Fisk_MordragKO_Relax);
	Info_AddChoice(Stt_311_Fisk_MordragKO,"To poca³uj mnie w ty³ek...",Stt_311_Fisk_MordragKO_FuckOff);
};

func void Stt_311_Fisk_MordragKO_Relax()
{
	AI_Output(other,self,"Stt_311_Fisk_MordragKO_Relax_15_00");	//Uspokój siê! Mo¿e mogê ci to jakoœ wynagrodziæ?
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_Relax_12_01");	//W¹tpiê, ¿eby ci siê uda³o. No chyba, ¿e znajdziesz dla mnie nowy kontakt w Nowym Obozie!
	AI_Output(other,self,"Stt_311_Fisk_MordragKO_Relax_15_02");	//Jak ja ci znajdê kogoœ takiego?
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_Relax_12_03");	//Przecie¿ mówi³em, ¿e nie wydaje mi siê, ¿eby uda³o ci siê tego dokonaæ.
	Log_CreateTopic(CH1_FiskNewDealer,LOG_MISSION);
	Log_SetTopicStatus(CH1_FiskNewDealer,LOG_RUNNING);
	B_LogEntry(CH1_FiskNewDealer,"Fisk, handlarz ze Starego Obozu, chce bym znalaz³ mu nowego pasera na miejsce Mordraga.");
	Fisk_GetNewHehler = LOG_RUNNING;
	AI_StopProcessInfos(self);
	Info_ClearChoices(Stt_311_Fisk_MordragKO);
};

func void Stt_311_Fisk_MordragKO_FuckOff()
{
	AI_Output(other,self,"Stt_311_Fisk_MordragKO_FuckOff_15_00");	//To poca³uj mnie w ty³ek...
	Info_ClearChoices(Stt_311_Fisk_MordragKO);
	AI_StopProcessInfos(self);
	Log_CreateTopic(CH1_FiskNewDealer,LOG_MISSION);
	Log_SetTopicStatus(CH1_FiskNewDealer,LOG_FAILED);
	B_LogEntry(CH1_FiskNewDealer,"Fisk nieŸle siê wœciek³ dowiaduj¹c siê, ¿e Mordraga wygoniono z obozu. Od teraz nie mam u niego szans na zakup porz¹dnych map.");
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Fisk_GetNewHehler = LOG_FAILED;
	Info_ClearChoices(Stt_311_Fisk_MordragKO);
};

func void Stt_311_Fisk_MordragKO_Petze()
{
	AI_Output(other,self,"Stt_311_Fisk_MordragKO_Petze_15_00");	//Handlujesz przedmiotami, które nale¿a³y do Magnatów. Za³o¿ê siê, ¿e Thorus chêtnie siê o tym dowie.
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_Petze_12_01");	//Nawet nie próbuj, kolego!
	AI_StopProcessInfos(self);
	Log_CreateTopic(CH1_FiskNewDealer,LOG_MISSION);
	Log_SetTopicStatus(CH1_FiskNewDealer,LOG_FAILED);
	B_LogEntry(CH1_FiskNewDealer,"Fisk nieŸle siê wœciek³ dowiaduj¹c siê, ¿e Mordraga wygoniono z obozu. Od teraz nie mam u niego szans na zakup porz¹dnych map.");
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Fisk_GetNewHehler = LOG_FAILED;
	Info_ClearChoices(Stt_311_Fisk_MordragKO);
};


instance Stt_311_Fisk_HehlerSuccess(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 10;
	condition = Stt_311_Fisk_HehlerSuccess_Condition;
	information = Stt_311_Fisk_HehlerSuccess_Info;
	permanent = 0;
	description = "Mam kogoœ z Nowego Obozu, kto chce nawi¹zaæ z tob¹ wspó³pracê.";
};


func int Stt_311_Fisk_HehlerSuccess_Condition()
{
	if((Fisk_GetNewHehler == LOG_RUNNING) && Npc_KnowsInfo(hero,Org_843_Sharky_Fisk))
	{
		return 1;
	};
};

func void Stt_311_Fisk_HehlerSuccess_Info()
{
	AI_Output(other,self,"Stt_311_Fisk_HehlerSuccess_15_00");	//Znalaz³em kogoœ z Nowego Obozu, kto chcia³by nawi¹zaæ z tob¹ wspó³pracê.
	AI_Output(self,other,"Stt_311_Fisk_HehlerSuccess_12_01");	//No nie! Kto by pomyœla³. Widzê, ¿e bardzo ci zale¿y na popularnoœci w naszym Obozie...
	AI_Output(self,other,"Stt_311_Fisk_HehlerSuccess_12_02");	//No i uda³o ci siê! Kogo mi tu przyprowadzi³eœ?
	AI_Output(other,self,"Stt_311_Fisk_HehlerSuccess_15_03");	//Nazywa siê Sharky.
	AI_Output(self,other,"Stt_311_Fisk_HehlerSuccess_12_04");	//Sharky? Jest jeszcze gorszy ni¿ Mordrag!
	AI_Output(self,other,"Stt_311_Fisk_HehlerSuccess_12_05");	//Jeœli chodzi o Diego... Nie musisz siê ju¿ o niego martwiæ.
	Fisk_GetNewHehler = LOG_SUCCESS;
	B_GiveXP(XP_fiskdealer);
	Log_SetTopicStatus(CH1_FiskNewDealer,LOG_SUCCESS);
	B_LogEntry(CH1_FiskNewDealer,"Sharky przejmie teraz dzia³kê Mordraga. Fisk jest zadowolony.");
};


instance Stt_311_Fisk_ARMOR(C_Info)
{
	npc = Stt_311_Fisk;
	condition = Stt_311_Fisk_ARMOR_Condition;
	information = Stt_311_Fisk_ARMOR_Info;
	important = 0;
	permanent = 1;
	description = "Masz dla mnie jeszcze jak¹œ zbrojê?";
};


func int Stt_311_Fisk_ARMOR_Condition()
{
	if((Kapitel < 2) && Npc_KnowsInfo(hero,Stt_311_Fisk_First))
	{
		return TRUE;
	};
};

func void Stt_311_Fisk_ARMOR_Info()
{
	AI_Output(other,self,"Stt_311_Fisk_ARMOR_Info_15_01");	//Masz dla mnie jeszcze jak¹œ zbrojê?
	AI_Output(self,other,"Stt_311_Fisk_ARMOR_Info_12_02");	//Có¿, myœlê, ¿e znajdê coœ, co ciê zadowoli.
	Info_ClearChoices(Stt_311_Fisk_ARMOR);
	Info_AddChoice(Stt_311_Fisk_ARMOR,DIALOG_BACK,Stt_311_Fisk_ARMOR_BACK);
	Info_AddChoice(Stt_311_Fisk_ARMOR,B_BuildBuyArmorString(NAME_FiskLightDiggers,value_vlk_armor_l),Stt_311_Fisk_ARMOR_L);
	Info_AddChoice(Stt_311_Fisk_ARMOR,B_BuildBuyArmorString(NAME_FiskDiggers,value_vlk_armor_m),Stt_311_Fisk_ARMOR_M);
};

func void Stt_311_Fisk_ARMOR_BACK()
{
	Info_ClearChoices(Stt_311_Fisk_ARMOR);
};

func void Stt_311_Fisk_ARMOR_L()
{
	AI_Output(other,self,"Stt_311_Fisk_ARMOR_L_Info_15_01");	//Potrzebujê lekkich spodni Kopacza.
	if(Npc_HasItems(hero,ItMiNugget) < value_vlk_armor_l)
	{
		AI_Output(self,other,"Stt_311_Fisk_ARMOR_L_Info_12_02");	//Wróæ, gdy bêdziesz mia³ wystarczaj¹co du¿o rudy.
	}
	else
	{
		AI_Output(self,other,"Stt_311_Fisk_ARMOR_L_Info_12_03");	//Dobry wybór!
		B_GiveInvItems(hero,self,ItMiNugget,value_vlk_armor_l);
		CreateInvItem(self,vlk_armor_l);
		B_GiveInvItems(self,hero,vlk_armor_l,1);
	};
};

func void Stt_311_Fisk_ARMOR_M()
{
	AI_Output(other,self,"Stt_311_Fisk_ARMOR_M_Info_15_01");	//Daj mi spodnie Kopacza.
	if(Npc_HasItems(hero,ItMiNugget) < value_vlk_armor_m)
	{
		AI_Output(self,other,"Stt_311_Fisk_ARMOR_M_Info_12_02");	//Wróæ, gdy bêdziesz mia³ wystarczaj¹co du¿o rudy.
	}
	else
	{
		AI_Output(self,other,"Stt_311_Fisk_ARMOR_M_Info_12_03");	//Dobry wybór!
		B_GiveInvItems(hero,self,ItMiNugget,value_vlk_armor_m);
		CreateInvItem(self,vlk_armor_m);
		B_GiveInvItems(self,hero,vlk_armor_m,1);
	};
};


instance info_fisk_gilbert(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 1;
	condition = info_fisk_gilbert_condition;
	information = info_fisk_gilbert_info;
	permanent = 0;
	description = "Mówi ci coœ imiê Gilbert?";
};


func int info_fisk_gilbert_condition()
{
	if(oc_back == LOG_RUNNING)
	{
		return 1;
	};
};

func void info_fisk_gilbert_info()
{
	AI_Output(other,self,"Info_Fisk_Gilbert_07_01");	//Mówi ci coœ imiê Gilbert?
	AI_Output(self,other,"Info_Fisk_Gilbert_07_02");	//Hmm... tak, goœæ doœæ czêsto do mnie przychodzi³ i ze mn¹ handlowa³. Ale nie widzia³em go tu ju¿ od d³u¿szego czasu, nie mam pojêcia gdzie siê podzia³.
	B_LogEntry(CH1_GILBERT,"Fisk wprawdzie pamiêta jeszcze Gilberta, ale nie ma zielonego pojêcia o jego utarczkach z ludŸmi Gomeza.");
};


var int huno_swordsold;

instance stt_311_fisk_hunossword(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 801;
	condition = stt_311_fisk_hunossword_condition;
	information = stt_311_fisk_hunossword_info;
	permanent = 1;
	description = "Wiesz coœ o skradzionym mieczu Huno?";
};


func int stt_311_fisk_hunossword_condition()
{
	if((huno_lostsword == LOG_RUNNING) && (huno_swordsold == FALSE))
	{
		return 1;
	};
};

func void stt_311_fisk_hunossword_info()
{
	AI_Output(other,self,"Stt_311_Fisk_HunosSword_15_00");	//Wiesz coœ o skradzionym mieczu Huno?
	AI_Output(self,other,"Stt_311_Fisk_HunosSword_12_01");	//Nic o tym nie wiem. Przynajmniej nic sobie nie przypominam...
	AI_Output(other,self,"Stt_311_Fisk_HunosSword_12_02");	//A gdybym tak pomóg³ ci odœwie¿yæ pamiêæ?
	AI_Output(self,other,"Stt_311_Fisk_HunosSword_12_03");	//Mów.
	Info_ClearChoices(stt_311_fisk_hunossword);
	Info_AddChoice(stt_311_fisk_hunossword,"Przyjdê póŸniej.",stt_311_fisk_hunossword_back);
	Info_AddChoice(stt_311_fisk_hunossword,"Co byœ powiedzia³ na 50 bry³ek?",stt_311_fisk_hunossword_fault);
	Info_AddChoice(stt_311_fisk_hunossword,"Co s¹dzisz o 100 bry³kach?",stt_311_fisk_hunossword_right);
};

func void stt_311_fisk_hunossword_back()
{
	AI_Output(other,self,"Org_826_Mordrag_HunosSword_BACK_15_00");	//Mo¿e póŸniej.
	Info_ClearChoices(stt_311_fisk_hunossword);
};

func void stt_311_fisk_hunossword_fault()
{
	AI_Output(other,self,"Stt_311_Fisk_HunosSword_Fault_15_00");	//Co byœ powiedzia³ na 50 bry³ek?
	AI_Output(self,other,"Stt_311_Fisk_HunosSword_Fault_12_01");	//Nie, nic o takim mieczu nie s³ysza³em.
};

func void stt_311_fisk_hunossword_right()
{
	AI_Output(other,self,"Stt_311_Fisk_HunosSword_TakeIt_15_00");	//Co s¹dzisz o 100 bry³kach?
	if(Npc_HasItems(other,ItMiNugget) >= 100)
	{
		AI_Output(self,other,"Stt_311_Fisk_HunosSword_TakeIt_12_01");	//A tak, teraz pamiêtam.
		AI_Output(self,other,"Stt_311_Fisk_HunosSword_TakeIt_11_02");	//Mogê ci jedynie powiedzieæ, byœ pogada³ na ten temat z R¹czk¹.
		AI_Output(other,self,"Stt_311_Fisk_HunosSword_TakeIt_12_03");	//I tyle?
		AI_Output(self,other,"Stt_311_Fisk_HunosSword_TakeIt_12_04");	//Tyle.
		B_GiveInvItems(other,self,ItMiNugget,100);
		Info_ClearChoices(stt_311_fisk_hunossword);
		huno_swordsold = TRUE;
		B_LogEntry(CH1_HUNOLOSTSWORD,"Fisk doradzi³ mi, ¿e powinienem pogadaæ na ten temat z Cieniem zwanym R¹czka.");
	}
	else
	{
		AI_Output(self,other,"Stt_311_Fisk_HunosSword_TakeIt_12_02");	//Obawiam siê, przyjacielu, ¿e nie masz doœæ rudy. Wróæ póŸniej.
	};
};

