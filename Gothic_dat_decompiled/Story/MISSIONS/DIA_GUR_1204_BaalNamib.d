
instance DIA_BaalNamib_EXIT(C_Info)
{
	npc = GUR_1204_BaalNamib;
	nr = 999;
	condition = DIA_BaalNamib_EXIT_Condition;
	information = DIA_BaalNamib_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_BaalNamib_EXIT_Condition()
{
	return 1;
};

func void DIA_BaalNamib_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BaalNamib_NoTalk(C_Info)
{
	npc = GUR_1204_BaalNamib;
	nr = 1;
	condition = DIA_BaalNamib_NoTalk_Condition;
	information = DIA_BaalNamib_NoTalk_Info;
	permanent = 1;
	important = 1;
};


func int DIA_BaalNamib_NoTalk_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (BaalNamib_Ansprechbar == FALSE) && (Npc_GetPermAttitude(self,other) != ATT_FRIENDLY))
	{
		return 1;
	};
};

func void DIA_BaalNamib_NoTalk_Info()
{
	Info_ClearChoices(DIA_BaalNamib_NoTalk);
	Info_AddChoice(DIA_BaalNamib_NoTalk,DIALOG_ENDE,DIA_BaalNamib_NoTalk_ENDE);
	Info_AddChoice(DIA_BaalNamib_NoTalk,"Wszystko w porz¹dku, kolego?",DIA_BaalNamib_NoTalk_Imp);
	Info_AddChoice(DIA_BaalNamib_NoTalk,"Niech Œni¹cy bêdzie z tob¹!",DIA_BaalNamib_NoTalk_Sleeper);
	Info_AddChoice(DIA_BaalNamib_NoTalk,"Czeœæ! Jestem tu nowy!",DIA_BaalNamib_NoTalk_Hi);
};

func void DIA_BaalNamib_NoTalk_Hi()
{
	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Hi_15_00");	//Czeœæ! Jestem tu nowy!
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Hi_02_01");	//
	BaalNamib_Sakrileg = TRUE;
};

func void DIA_BaalNamib_NoTalk_Sleeper()
{
	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Sleeper_15_00");	//Niech Œni¹cy bêdzie z tob¹!
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Sleeper_02_01");	//
	BaalNamib_Sakrileg = TRUE;
};

func void DIA_BaalNamib_NoTalk_Imp()
{
	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Imp_15_00");	//Wszystko w porz¹dku, kolego?
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Imp_02_01");	//
	BaalNamib_Sakrileg = TRUE;
};

func void DIA_BaalNamib_NoTalk_ENDE()
{
	AI_StopProcessInfos(self);
};


var int namib_gotocalom;

instance DIA_BaalNamib_FirstTalk(C_Info)
{
	npc = GUR_1204_BaalNamib;
	nr = 1;
	condition = DIA_BaalNamib_FirstTalk_Condition;
	information = DIA_BaalNamib_FirstTalk_Info;
	permanent = 0;
	important = 1;
};


func int DIA_BaalNamib_FirstTalk_Condition()
{
	if(BaalNamib_Ansprechbar == TRUE)
	{
		return 1;
	};
};

func void DIA_BaalNamib_FirstTalk_Info()
{
	AI_Output(self,other,"DIA_BaalNamib_FirstTalk_02_00");	//
	AI_Output(self,other,"DIA_BaalNamib_FirstTalk_02_01");	//Zosta³eœ wybrany przez Œni¹cego. Czy twoim ¿yczeniem naprawdê jest do³¹czyæ do nas?
	Info_ClearChoices(DIA_BaalNamib_FirstTalk);
	Info_AddChoice(DIA_BaalNamib_FirstTalk,"Nic nie mów",DIA_BaalNamib_FirstTalk_Mute);
	Info_AddChoice(DIA_BaalNamib_FirstTalk,"Tak, chcê pod¹¿aæ drog¹ Œni¹cego!",DIA_BaalNamib_FirstTalk_Sleeper);
};

func void DIA_BaalNamib_FirstTalk_Mute()
{
	AI_Output(other,self,"DIA_BaalNamib_FirstTalk_Mute_15_00");	//
	AI_Output(self,other,"DIA_BaalNamib_FirstTalk_Mute_02_01");	//Co takiego?
};

func void DIA_BaalNamib_FirstTalk_Sleeper()
{
	AI_Output(other,self,"DIA_BaalNamib_FirstTalk_Sleeper_15_00");	//Tak, chcê pod¹¿aæ drog¹ Œni¹cego!
	AI_Output(self,other,"DIA_BaalNamib_FirstTalk_Sleeper_02_01");	//IdŸ do Cor Kaloma. Powiedz mu, ¿e przysy³am ciê do niego, bo widzê, i¿ twoja wiara jest szczera!
	Info_ClearChoices(DIA_BaalNamib_FirstTalk);
	namib_gotocalom = TRUE;
	B_LogEntry(CH1_JoinPsi,"Zaaran¿owane przez Lestera przedstawienie zdzia³a³o cuda. Baal Namib przemówi³ do mnie i da³ siê przekonaæ, ¿e jestem prawdziwym wyznawc¹ kultu Œni¹cego. Teraz mam siê udaæ do laboratorium alchemicznego Cor Kaloma!");
	B_GiveXP(XP_ImpressBaalNamib);
};


instance gur_1204_namib_betterarmor(C_Info)
{
	npc = GUR_1204_BaalNamib;
	condition = gur_1204_namib_betterarmor_condition;
	information = gur_1204_namib_betterarmor_info;
	important = 0;
	permanent = 1;
	description = "Chcia³bym otrzymaæ lepsz¹ zbrojê.";
};


func int gur_1204_namib_betterarmor_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_NOV)
	{
		return TRUE;
	};
};

func void gur_1204_namib_betterarmor_info()
{
	AI_Output(hero,self,"GUR_1204_BaalNamib_ARMOR_Info_15_01");	//Chcia³bym otrzymaæ lepsz¹ zbrojê.
	AI_Output(self,other,"GUR_1204_Namib_BETTERARMOR_Info_06_02");	//Jeœli udowodnisz, ¿e jesteœ jej godzien i uiœcisz to hojnym datkiem...
	Info_ClearChoices(gur_1204_namib_betterarmor);
	Info_AddChoice(gur_1204_namib_betterarmor,DIALOG_BACK,gur_1204_namib_betterarmor_back);
	Info_AddChoice(gur_1204_namib_betterarmor,B_BuildBuyArmorString(NAME_NAMIBHEAVYNOVICE,value_nov_armor_h),gur_1204_namib_betterarmor_h);
	Info_AddChoice(gur_1204_namib_betterarmor,B_BuildBuyArmorString(NAME_NAMIBNOVICE,value_nov_armor_m),gur_1204_namib_betterarmor_m);
};

func void gur_1204_namib_betterarmor_m()
{
	AI_Output(hero,self,"GUR_1204_Namib_BETTERARMOR_Info_M_13_02");	//Chcia³bym dostaæ lekk¹ zbrojê Nowicjusza.
	if(Kapitel < 2)
	{
		AI_Output(self,other,"GUR_1204_BaalNamib_ARMOR_Info_01_05");	//Minie jeszcze trochê czasu, zanim dane ci bêdzie nosiæ lekk¹ zbrojê Nowicjusza.
	}
	else if(Npc_HasItems(hero,ItMiNugget) < value_nov_armor_m)
	{
		AI_Output(self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_03");	//Wróæ, gdy uzbierasz trochê wiêcej rudy.
	}
	else
	{
		AI_Output(self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_04");	//Ta zbroja chroniæ bêdzie twoje cia³o, tak jak Œni¹cy chroni twoj¹ duszê!
		B_GiveInvItems(hero,self,ItMiNugget,value_nov_armor_m);
		B_GiveInvItems(self,hero,nov_armor_m,1);
		AI_EquipBestArmor(hero);
	};
	Info_ClearChoices(gur_1204_namib_betterarmor);
};

func void gur_1204_namib_betterarmor_h()
{
	AI_Output(hero,self,"GRD_219_BaalNamib_BETTERARMOR_Info_H_15_01");	//Chcia³bym dostaæ ciê¿k¹ zbrojê Nowicjusza.
	if(Kapitel < 2)
	{
		AI_Output(self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_02");	//Minie jeszcze trochê czasu, zanim dane ci bêdzie nosiæ ciê¿k¹ zbrojê Nowicjusza.
	}
	else if(Npc_HasItems(hero,ItMiNugget) < value_nov_armor_h)
	{
		AI_Output(self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_03");	//Wróæ, gdy uzbierasz trochê wiêcej rudy.
	}
	else
	{
		AI_Output(self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_04");	//Ta zbroja chroniæ bêdzie twoje cia³o, tak jak Œni¹cy chroni twoj¹ duszê!
		B_GiveInvItems(hero,self,ItMiNugget,value_nov_armor_h);
		B_GiveInvItems(self,hero,nov_armor_h,1);
		AI_EquipBestArmor(hero);
	};
	Info_ClearChoices(gur_1204_namib_betterarmor);
};

func void gur_1204_namib_betterarmor_back()
{
	AI_Output(hero,self,"GRD_219_Stone_BETTERARMOR_Info_BACK_15_01");	//Rozmyœli³em siê.
	Info_ClearChoices(gur_1204_namib_betterarmor);
};


instance Info_BaalNamib_BROTHERHOOD(C_Info)
{
	npc = GUR_1204_BaalNamib;
	condition = Info_BaalNamib_BROTHERHOOD_Condition;
	information = Info_BaalNamib_BROTHERHOOD_Info;
	important = 0;
	permanent = 0;
	description = "Czy s¹ jakieœ zadania, których móg³bym siê podj¹æ?";
};


func int Info_BaalNamib_BROTHERHOOD_Condition()
{
	if((Kapitel == 2) && Npc_KnowsInfo(hero,PC_Psionic_SEND) && (Npc_GetTrueGuild(hero) == GIL_NOV))
	{
		return TRUE;
	};
};

func void Info_BaalNamib_BROTHERHOOD_Info()
{
	AI_Output(other,self,"Info_BaalNamib_BROTHERHOOD_15_01");	//Czy s¹ jakieœ zadania, których móg³bym siê podj¹æ?
	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_02_02");	//Nasz mistrz, m¹dry Y'Berion, kaza³ sobie przys³aæ Nowicjusza. Jako ¿e jesteœ teraz jednym z nas, mo¿esz iœæ do niego i zaoferowaæ swoje us³ugi.
	Info_ClearChoices(Info_BaalNamib_BROTHERHOOD);
	Info_AddChoice(Info_BaalNamib_BROTHERHOOD,"W porz¹dku. Zajrzê do niego natychmiast.",Info_BaalNamib_BROTHERHOOD_OK);
	Info_AddChoice(Info_BaalNamib_BROTHERHOOD,"Gdzie znajdê Y'Beriona?",Info_BaalNamib_BROTHERHOOD_YBWO);
	Info_AddChoice(Info_BaalNamib_BROTHERHOOD,"Wiesz mo¿e jakie zadanie ma dla mnie Y'Berion?",Info_BaalNamib_BROTHERHOOD_YBWAS);
};

func void Info_BaalNamib_BROTHERHOOD_YBWO()
{
	AI_Output(other,self,"Info_BaalNamib_BROTHERHOOD_YBWO_15_01");	//Gdzie znajdê Y'Beriona?
	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_YBWO_02_02");	//Jego siedziba znajduje siê pod œwi¹tynnym wzgórzem.
};

func void Info_BaalNamib_BROTHERHOOD_YBWAS()
{
	AI_Output(other,self,"Info_BaalNamib_BROTHERHOOD_YBWAS_15_01");	//Wiesz mo¿e jakie zadanie ma dla mnie Y'Berion?
	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_02");	//Aby dosz³o do wielkiego przyzwania musimy najpierw zdobyæ pewien magiczny artefakt.
	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_03");	//Y'Berion poszukuje œmia³ka, który zechce siê podj¹æ tego zadania.
	AI_Output(other,self,"Info_BaalNamib_BROTHERHOOD_YBWAS_15_04");	//To nie wydaje siê zbyt trudne.
	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_05");	//Gdyby by³o ³atwe, ju¿ dawno mielibyœmy ten artefakt w naszym obozie. Porozmawiaj z Y'Berionem. On ci wszystko wyjaœni.
};

func void Info_BaalNamib_BROTHERHOOD_OK()
{
	var C_Npc YBerion;
	AI_Output(other,self,"Info_BaalNamib_BROTHERHOOD_OK_15_01");	//W porz¹dku. Zajrzê do niego natychmiast.
	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_OK_02_02");	//Niech Œni¹cy bêdzie z tob¹!
	Info_ClearChoices(Info_BaalNamib_BROTHERHOOD);
	Log_CreateTopic(CH2_Focus,LOG_MISSION);
	Log_SetTopicStatus(CH2_Focus,LOG_RUNNING);
	B_LogEntry(CH2_Focus,"Baal Namib odes³a³ mnie do Y'Beriona, bym poszuka³ pewnego artefaktu, który jest potrzebny Bractwu do wielkiego przyzwania. Stra¿nik œwi¹tyni powinien mnie bez problemów wpuœciæ, jeœli tylko mu powiem, ¿e przys³a³ mnie Baal Namib.");
	YBerion = Hlp_GetNpc(GUR_1200_YBerion);
	YBerion.aivar[AIV_FINDABLE] = TRUE;
};


instance gur_1204_baalnamib_guraufnahme(C_Info)
{
	npc = GUR_1204_BaalNamib;
	condition = gur_1204_baalnamib_guruaufnahme_condition;
	information = gur_1204_baalnamib_guruaufnahme_info;
	important = 1;
	permanent = 0;
};


func int gur_1204_baalnamib_guruaufnahme_condition()
{
	if(((Npc_HasItems(hero,ItAt_Crawlerqueen) >= 1) || (CorKalom_BringMCQBalls == LOG_SUCCESS)) && (Npc_GetTrueGuild(hero) == GIL_NOV) && (Npc_GetDistToNpc(hero,self) < 1000) && Npc_KnowsInfo(hero,DIA_BaalTondral_SendToKalom) && Npc_KnowsInfo(hero,DIA_BaalTyon_Vision) && Npc_KnowsInfo(hero,dia_baallukor_hypnoticteacher) && Npc_KnowsInfo(hero,DIA_BaalNamib_FirstTalk) && Npc_KnowsInfo(hero,DIA_BaalCadar_SleepSpell) && Npc_KnowsInfo(hero,DIA_BaalOrun_GotWeed))
	{
		return TRUE;
	};
};

func void gur_1204_baalnamib_guruaufnahme_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Gur_1204_BaalNamib_GURAUFNAHME_Info_13_01");	//Poczekaj chwilê!
	AI_Output(self,other,"Gur_1204_BaalNamib_GURAUFNAHME_Info_13_10");	//Swoimi dokonaniami w kopalni pokaza³eœ nam, ¿e Œni¹cy nam tob¹ czuwa.
	AI_Output(self,other,"Gur_1204_BaalNamib_GURAUFNAHME_Info_13_03");	//Tym samym spotyka ciê zaszczyt zajêcia szczególnego stanowiska w naszym spo³eczeñstwie.
	AI_Output(self,other,"Gur_1204_BaalNamib_GURAUFNAHME_Info_13_04");	//Udaj siê do Y'Beriona, on powie ci wiêcej na ten temat.
	Log_CreateTopic(GE_BECOMEGURU,LOG_NOTE);
	B_LogEntry(GE_BECOMEGURU,"Baal Namib powiedzia³ mi, i¿ jestem wybrañcem Œni¹cego i spotka mnie zaszczyt zajêcia szczególnego stanowiska w obozie Bractwa. Po wiêcej informacji powinienem siê zg³osiæ do Y'Beriona.");
};


instance info_baalnamib_tattoos(C_Info)
{
	npc = GUR_1204_BaalNamib;
	condition = info_baalnamib_tattoos_condition;
	information = info_baalnamib_tattoos_info;
	important = 1;
	permanent = 0;
};


func int info_baalnamib_tattoos_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_NOV)
	{
		return TRUE;
	};
};

func void info_baalnamib_tattoos_info()
{
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_15_01");	//Jak widzê przyj¹³eœ zaproszenie Cor Kaloma.
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_15_02");	//Ale o co chodzi?
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_01_01");	//O rytua³. Rytua³, dziêki któremu przypieczêtujesz swoj¹ przynale¿noœæ do Bractwa.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_01_02");	//Ka¿dy nowy zwolennik naszej spo³ecznoœci bierze udzia³ w takim rytuale.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_01_03");	//Zanim jednak zaczniemy, muszê ci jeszcze zadaæ ostatnie pytanie.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_01_04");	//Dlaczego tak w ogóle zdecydowa³eœ siê pod¹¿aæ œcie¿k¹ Œni¹cego?
	Info_ClearChoices(info_baalnamib_tattoos);
	Info_AddChoice(info_baalnamib_tattoos,"Poniewa¿...",info_baalnamib_tattoos_weil);
};

func void info_baalnamib_tattoos_weil()
{
	Info_ClearChoices(info_baalnamib_tattoos);
	Info_AddChoice(info_baalnamib_tattoos,"...wasze zio³o mnie do tego przekona³o.",info_baalnamib_tattoos_kraut);
	Info_AddChoice(info_baalnamib_tattoos,"...wiedzia³em, ¿e w pozosta³ych obozach nie bêde móg³ byæ wolny.",info_baalnamib_tattoos_frei);
	Info_AddChoice(info_baalnamib_tattoos,"...tak siê po prostu jakoœ z³o¿y³o.",info_baalnamib_tattoos_ergeben);
	Info_AddChoice(info_baalnamib_tattoos,"...dostrzeg³em Œni¹cego jako mojego prawdziwego odkupiciela.",info_baalnamib_tattoos_erlÖser);
	Info_AddChoice(info_baalnamib_tattoos,"...nie mia³em innego wyboru.",info_baalnamib_tattoos_wahl);
	Info_AddChoice(info_baalnamib_tattoos,"...prze¿y³em objawienie od Œni¹cego.",info_baalnamib_tattoos_vision);
};

func void info_baalnamib_tattoos_kraut()
{
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_24_01");	//Wasze zio³o mnie do tego przekona³o.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_24_02");	//To mam nadziejê, ¿e równie dobrze pozwoli ci ono zbli¿yæ siê do Œni¹cego.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_24_03");	//Przeprowadzimy teraz rytua³, który powi¹¿e ciê z nami wszystkimi.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_24_04");	//Oto napój z wydzieliny Œni¹cego. Wypij go, zanim przejdziemy do medytacji.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_24_05");	//Jeœli ju¿ jesteœ gotowy, zajmij miejsce przed portalem.
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_04");
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_24_06");	//Co to za portal?
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_24_07");	//To œwiêty artefakt naszego Bractwa. Pozwala on zbli¿yæ siê bardziej do Œni¹cego.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_24_08");	//Ponadto zostan¹ umieszczone na twojej g³owie jego znaki.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_24_10");	//Dziêki tym znakom bêdzie wiadomo, ¿e jesteœ oddanym s³ug¹ Œni¹cego.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_24_09");	//Zaczynajmy ju¿ ten rytua³.
	Info_ClearChoices(info_baalnamib_tattoos);
	hero_face1 = TRUE;
	CreateInvItem(self,itfo_potion_elixier_crawler);
	B_GiveInvItems(self,hero,itfo_potion_elixier_crawler,1);
	AI_UseItem(hero,itfo_potion_elixier_crawler);
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_04");
	AI_StopProcessInfos(self);
};

func void info_baalnamib_tattoos_frei()
{
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_21_01");	//Wiedzia³em, ¿e w pozosta³ych obozach nigdy nie bêde móg³ byæ prawdziwie wolny.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_21_02");	//W rzeczy samej. Œni¹cy wska¿e nam drogê do wolnoœci.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_21_03");	//Przeprowadzimy teraz rytua³, który powi¹¿e ciê z nami wszystkimi.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_21_04");	//Oto napój z wydzieliny Œni¹cego. Wypij go, zanim przejdziemy do medytacji.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_21_05");	//Jeœli ju¿ jesteœ gotowy, zajmij miejsce przed portalem.
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_04");
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_21_06");	//Co to za portal?
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_21_07");	//To œwiêty artefakt naszego Bractwa. Pozwala on zbli¿yæ siê bardziej do Œni¹cego.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_21_08");	//Ponadto zostan¹ umieszczone na twojej g³owie jego znaki.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_21_10");	//Dziêki tym znakom bêdzie wiadomo, ¿e jesteœ oddanym s³ug¹ Œni¹cego.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_21_09");	//Zaczynajmy ju¿ ten rytua³.
	Info_ClearChoices(info_baalnamib_tattoos);
	hero_face2 = TRUE;
	CreateInvItem(self,itfo_potion_elixier_crawler);
	B_GiveInvItems(self,hero,itfo_potion_elixier_crawler,1);
	AI_UseItem(hero,itfo_potion_elixier_crawler);
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_04");
	AI_StopProcessInfos(self);
};

func void info_baalnamib_tattoos_ergeben()
{
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_22_01");	//Tak siê po prostu jakoœ z³o¿y³o.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_22_02");	//To mo¿e z czasem i kontakt ze Œni¹cym ci siê... "z³o¿y".
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_22_03");	//Przeprowadzimy teraz rytua³, który powi¹¿e ciê z nami wszystkimi.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_22_04");	//Oto napój z wydzieliny Œni¹cego. Wypij go, zanim przejdziemy do medytacji.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_22_05");	//Jeœli ju¿ jesteœ gotowy, zajmij miejsce przed portalem.
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_04");
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_22_06");	//Co to za portal?
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_22_07");	//To œwiêty artefakt naszego Bractwa. Pozwala on zbli¿yæ siê bardziej do Œni¹cego.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_22_08");	//Ponadto zostan¹ umieszczone na twojej g³owie jego znaki.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_22_10");	//Dziêki tym znakom bêdzie wiadomo, ¿e jesteœ oddanym s³ug¹ Œni¹cego.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_22_09");	//Zaczynajmy ju¿ ten rytua³.
	Info_ClearChoices(info_baalnamib_tattoos);
	hero_face3 = TRUE;
	CreateInvItem(self,itfo_potion_elixier_crawler);
	B_GiveInvItems(self,hero,itfo_potion_elixier_crawler,1);
	AI_UseItem(hero,itfo_potion_elixier_crawler);
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_04");
	AI_StopProcessInfos(self);
};

func void info_baalnamib_tattoos_erlÖser()
{
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_23_01");	//Dostrzeg³em Œni¹cego jako mojego prawdziwego odkupiciela.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_23_02");	//W takim razie jesteœ prawdziwym wyznawc¹ naszej wiary i czeka na ciebie droga pe³na zrozumienia.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_23_03");	//Przeprowadzimy teraz rytua³, który powi¹¿e ciê z nami wszystkimi.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_23_04");	//Oto napój z wydzieliny Œni¹cego. Wypij go, zanim przejdziemy do medytacji.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_23_05");	//Jeœli ju¿ jesteœ gotowy, zajmij miejsce przed portalem.
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_04");
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_23_06");	//Co to za portal?
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_23_07");	//To œwiêty artefakt naszego Bractwa. Pozwala on zbli¿yæ siê bardziej do Œni¹cego.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_23_08");	//Ponadto zostan¹ umieszczone na twojej g³owie jego znaki.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_23_10");	//Dziêki tym znakom bêdzie wiadomo, ¿e jesteœ oddanym s³ug¹ Œni¹cego.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_23_09");	//Zaczynajmy ju¿ ten rytua³.
	Info_ClearChoices(info_baalnamib_tattoos);
	hero_face4 = TRUE;
	CreateInvItem(self,itfo_potion_elixier_crawler);
	B_GiveInvItems(self,hero,itfo_potion_elixier_crawler,1);
	AI_UseItem(hero,itfo_potion_elixier_crawler);
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_04");
	AI_StopProcessInfos(self);
};

func void info_baalnamib_tattoos_wahl()
{
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_25_01");	//Nie mia³em innego wyboru.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_25_02");	//Mam tylko nadziejê, ¿e odnajdziesz jeszcze zrozumienie, by prowadziæ lepsze ¿ycie jako zwolennik naszej wiary ni¿ w jakimkolwiek innym miejscu w kolonii.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_25_03");	//Przeprowadzimy teraz rytua³, który powi¹¿e ciê z nami wszystkimi.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_25_04");	//Oto napój z wydzieliny Œni¹cego. Wypij go, zanim przejdziemy do medytacji.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_25_05");	//Jeœli ju¿ jesteœ gotowy, zajmij miejsce przed portalem.
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_04");
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_25_06");	//Co to za portal?
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_25_07");	//To œwiêty artefakt naszego Bractwa. Pozwala on zbli¿yæ siê bardziej do Œni¹cego.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_25_08");	//Ponadto zostan¹ umieszczone na twojej g³owie jego znaki.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_25_10");	//Dziêki tym znakom bêdzie wiadomo, ¿e jesteœ oddanym s³ug¹ Œni¹cego.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_25_09");	//Zaczynajmy ju¿ ten rytua³.
	Info_ClearChoices(info_baalnamib_tattoos);
	hero_face5 = TRUE;
	CreateInvItem(self,itfo_potion_elixier_crawler);
	B_GiveInvItems(self,hero,itfo_potion_elixier_crawler,1);
	AI_UseItem(hero,itfo_potion_elixier_crawler);
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_04");
	AI_StopProcessInfos(self);
};

func void info_baalnamib_tattoos_vision()
{
	AI_Output(other,self,"Info_BaalNamib_VISION_25_01");	//Prze¿y³em objawienie od Œni¹cego.
	AI_Output(self,other,"Info_BaalNamib_VISION_25_02");	//W takim razie sam Œni¹cy wybra³ ciê, byœ do nas do³¹czy³. Twoje przeznaczenie ju¿ wkrótce siê ziœci.
	AI_Output(self,other,"Info_BaalNamib_VISION_25_03");	//Przeprowadzimy teraz rytua³, który powi¹¿e ciê z nami wszystkimi.
	AI_Output(self,other,"Info_BaalNamib_VISION_25_04");	//Oto napój z wydzieliny Œni¹cego. Wypij go, zanim przejdziemy do medytacji.
	AI_Output(self,other,"Info_BaalNamib_VISION_25_05");	//Jeœli ju¿ jesteœ gotowy, zajmij miejsce przed portalem.
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_04");
	AI_Output(other,self,"Info_BaalNamib_VISION_25_06");	//Co to za portal?
	AI_Output(self,other,"Info_BaalNamib_VISION_25_07");	//To œwiêty artefakt naszego Bractwa. Pozwala on zbli¿yæ siê bardziej do Œni¹cego.
	AI_Output(self,other,"Info_BaalNamib_VISION_25_08");	//Ponadto zostan¹ umieszczone na twojej g³owie jego znaki.
	AI_Output(self,other,"Info_BaalNamib_VISION_25_10");	//Dziêki tym znakom bêdzie wiadomo, ¿e jesteœ oddanym s³ug¹ Œni¹cego.
	AI_Output(self,other,"Info_BaalNamib_VISION_25_09");	//Zaczynajmy ju¿ ten rytua³.
	Info_ClearChoices(info_baalnamib_tattoos);
	hero_face6 = TRUE;
	CreateInvItem(self,itfo_potion_elixier_crawler);
	B_GiveInvItems(self,hero,itfo_potion_elixier_crawler,1);
	AI_UseItem(hero,itfo_potion_elixier_crawler);
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_04");
	AI_StopProcessInfos(self);
};


instance info_baalnamib_beginning(C_Info)
{
	npc = GUR_1204_BaalNamib;
	condition = info_baalnamib_beginning_condition;
	information = info_baalnamib_beginning_info;
	important = 1;
	permanent = 0;
};


func int info_baalnamib_beginning_condition()
{
	if(Npc_KnowsInfo(hero,info_baalnamib_tattoos))
	{
		return TRUE;
	};
};

func void info_baalnamib_beginning_info()
{
	if(hero_face1 == TRUE)
	{
		AI_PlayAniBS(self,"T_STAND_2_PRAY",BS_SIT);
		AI_PlayAniBS(hero,"T_STAND_2_PRAY",BS_SIT);
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_01");	//Œni¹cy, oddajê w twoje rêce nowego s³ugê.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_02");	//Udowodni³, ¿e jest godzien i powinien byæ gotów, by ci s³u¿yæ.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_03");	//Jest prawdziwym zwolennikiem wiary i chce siê wydostaæ z tego miejsca, tak jak my wszyscy.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_04");	//Wska¿ mu drogê i chroñ jego duszê przed wszelkimi zagro¿eniami.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_05");	//Albowiem odt¹d staje siê on czêœci¹ naszej spo³ecznoœci.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_06");	//Powtarzaj za mn¹.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_07");	//Œni¹cy, oœwiadczam niniejszym...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_08");	//Œni¹cy, oœwiadczam niniejszym...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_09");	//...¿em gotów jest s³u¿yæ ci po wsze czasy...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_10");	//...¿em gotów jest s³u¿yæ ci po wsze czasy...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_11");	//...aby ma dusza zosta³a wyzwolona dziêki twej sile...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_12");	//...aby ma dusza zosta³a wyzwolona dziêki twej sile...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_13");	//...wska¿ mi drogê do wolnoœci i zeœlij natchnienie...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_14");	//...wska¿ mi drogê do wolnoœci i zeœlij natchnienie...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_15");	//...albowiem droga twa jest kluczem do zbawienia.
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_16");	//...albowiem droga twa jest kluczem do zbawienia.
		AI_StopProcessInfos(self);
		Wld_PlayEffect("SPELLFX_TELEPORT",hero,hero,0,0,0,FALSE);
		Mdl_SetVisualBody(hero,"hum_body_Naked0",1,1,"HUM_HEAD_BALD",124,2,-1);
		AI_Standup(self);
		AI_Standup(hero);
	}
	else if(hero_face2 == TRUE)
	{
		AI_PlayAniBS(self,"T_STAND_2_PRAY",BS_SIT);
		AI_PlayAniBS(hero,"T_STAND_2_PRAY",BS_SIT);
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_01");	//Œni¹cy, oddajê w twoje rêce nowego s³ugê.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_02");	//Udowodni³, ¿e jest godzien i powinien byæ gotów, by ci s³u¿yæ.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_03");	//Jest prawdziwym zwolennikiem wiary i chce siê wydostaæ z tego miejsca, tak jak my wszyscy.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_04");	//Wska¿ mu drogê i chroñ jego duszê przed wszelkimi zagro¿eniami.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_05");	//Albowiem odt¹d staje siê on czêœci¹ naszej spo³ecznoœci.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_06");	//Powtarzaj za mn¹.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_07");	//Œni¹cy, oœwiadczam niniejszym...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_08");	//Œni¹cy, oœwiadczam niniejszym...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_09");	//...¿em gotów jest s³u¿yæ ci po wsze czasy...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_10");	//...¿em gotów jest s³u¿yæ ci po wsze czasy...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_11");	//...aby ma dusza zosta³a wyzwolona dziêki twej sile...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_12");	//...aby ma dusza zosta³a wyzwolona dziêki twej sile...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_13");	//...wska¿ mi drogê do wolnoœci i zeœlij natchnienie...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_14");	//...wska¿ mi drogê do wolnoœci i zeœlij natchnienie...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_15");	//...albowiem droga twa jest kluczem do zbawienia.
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_16");	//...albowiem droga twa jest kluczem do zbawienia.
		AI_StopProcessInfos(self);
		Wld_PlayEffect("SPELLFX_TELEPORT",hero,hero,0,0,0,FALSE);
		Mdl_SetVisualBody(hero,"hum_body_Naked0",1,1,"HUM_HEAD_BALD",118,2,-1);
		AI_Standup(self);
		AI_Standup(hero);
	}
	else if(hero_face3 == TRUE)
	{
		AI_PlayAniBS(self,"T_STAND_2_PRAY",BS_SIT);
		AI_PlayAniBS(hero,"T_STAND_2_PRAY",BS_SIT);
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_01");	//Œni¹cy, oddajê w twoje rêce nowego s³ugê.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_02");	//Udowodni³, ¿e jest godzien i powinien byæ gotów, by ci s³u¿yæ.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_03");	//Jest prawdziwym zwolennikiem wiary i chce siê wydostaæ z tego miejsca, tak jak my wszyscy.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_04");	//Wska¿ mu drogê i chroñ jego duszê przed wszelkimi zagro¿eniami.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_05");	//Albowiem odt¹d staje siê on czêœci¹ naszej spo³ecznoœci.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_06");	//Powtarzaj za mn¹.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_07");	//Œni¹cy, oœwiadczam niniejszym...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_08");	//Œni¹cy, oœwiadczam niniejszym...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_09");	//...¿em gotów jest s³u¿yæ ci po wsze czasy...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_10");	//...¿em gotów jest s³u¿yæ ci po wsze czasy...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_11");	//...aby ma dusza zosta³a wyzwolona dziêki twej sile...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_12");	//...aby ma dusza zosta³a wyzwolona dziêki twej sile...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_13");	//...wska¿ mi drogê do wolnoœci i zeœlij natchnienie...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_14");	//...wska¿ mi drogê do wolnoœci i zeœlij natchnienie...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_15");	//...albowiem droga twa jest kluczem do zbawienia.
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_16");	//...albowiem droga twa jest kluczem do zbawienia.
		AI_StopProcessInfos(self);
		Wld_PlayEffect("SPELLFX_TELEPORT",hero,hero,0,0,0,FALSE);
		Mdl_SetVisualBody(hero,"hum_body_Naked0",1,1,"HUM_HEAD_BALD",122,2,-1);
		AI_Standup(self);
		AI_Standup(hero);
	}
	else if(hero_face4 == TRUE)
	{
		AI_PlayAniBS(self,"T_STAND_2_PRAY",BS_SIT);
		AI_PlayAniBS(hero,"T_STAND_2_PRAY",BS_SIT);
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_01");	//Œni¹cy, oddajê w twoje rêce nowego s³ugê.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_02");	//Udowodni³, ¿e jest godzien i powinien byæ gotów, by ci s³u¿yæ.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_03");	//Jest prawdziwym zwolennikiem wiary i chce siê wydostaæ z tego miejsca, tak jak my wszyscy.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_04");	//Wska¿ mu drogê i chroñ jego duszê przed wszelkimi zagro¿eniami.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_05");	//Albowiem odt¹d staje siê on czêœci¹ naszej spo³ecznoœci.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_06");	//Powtarzaj za mn¹.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_07");	//Œni¹cy, oœwiadczam niniejszym...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_08");	//Œni¹cy, oœwiadczam niniejszym...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_09");	//...¿em gotów jest s³u¿yæ ci po wsze czasy...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_10");	//...¿em gotów jest s³u¿yæ ci po wsze czasy...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_11");	//...aby ma dusza zosta³a wyzwolona dziêki twej sile...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_12");	//...aby ma dusza zosta³a wyzwolona dziêki twej sile...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_13");	//...wska¿ mi drogê do wolnoœci i zeœlij natchnienie...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_14");	//...wska¿ mi drogê do wolnoœci i zeœlij natchnienie...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_15");	//...albowiem droga twa jest kluczem do zbawienia.
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_16");	//...albowiem droga twa jest kluczem do zbawienia.
		AI_StopProcessInfos(self);
		Wld_PlayEffect("SPELLFX_TELEPORT",hero,hero,0,0,0,FALSE);
		Mdl_SetVisualBody(hero,"hum_body_Naked0",1,1,"HUM_HEAD_BALD",121,2,-1);
		AI_Standup(self);
		AI_Standup(hero);
	}
	else if(hero_face5 == TRUE)
	{
		AI_PlayAniBS(self,"T_STAND_2_PRAY",BS_SIT);
		AI_PlayAniBS(hero,"T_STAND_2_PRAY",BS_SIT);
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_01");	//Œni¹cy, oddajê w twoje rêce nowego s³ugê.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_02");	//Udowodni³, ¿e jest godzien i powinien byæ gotów, by ci s³u¿yæ.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_03");	//Jest prawdziwym zwolennikiem wiary i chce siê wydostaæ z tego miejsca, tak jak my wszyscy.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_04");	//Wska¿ mu drogê i chroñ jego duszê przed wszelkimi zagro¿eniami.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_05");	//Albowiem odt¹d staje siê on czêœci¹ naszej spo³ecznoœci.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_06");	//Powtarzaj za mn¹.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_07");	//Œni¹cy, oœwiadczam niniejszym...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_08");	//Œni¹cy, oœwiadczam niniejszym...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_09");	//...¿em gotów jest s³u¿yæ ci po wsze czasy...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_10");	//...¿em gotów jest s³u¿yæ ci po wsze czasy...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_11");	//...aby ma dusza zosta³a wyzwolona dziêki twej sile...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_12");	//...aby ma dusza zosta³a wyzwolona dziêki twej sile...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_13");	//...wska¿ mi drogê do wolnoœci i zeœlij natchnienie...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_14");	//...wska¿ mi drogê do wolnoœci i zeœlij natchnienie...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_15");	//...albowiem droga twa jest kluczem do zbawienia.
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_16");	//...albowiem droga twa jest kluczem do zbawienia.
		AI_StopProcessInfos(self);
		Wld_PlayEffect("SPELLFX_TELEPORT",hero,hero,0,0,0,FALSE);
		Mdl_SetVisualBody(hero,"hum_body_Naked0",1,1,"HUM_HEAD_BALD",123,2,-1);
		AI_Standup(self);
		AI_Standup(hero);
	}
	else if(hero_face6 == TRUE)
	{
		AI_PlayAniBS(self,"T_STAND_2_PRAY",BS_SIT);
		AI_PlayAniBS(hero,"T_STAND_2_PRAY",BS_SIT);
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_01");	//Œni¹cy, oddajê w twoje rêce nowego s³ugê.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_02");	//Udowodni³, ¿e jest godzien i powinien byæ gotów, by ci s³u¿yæ.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_03");	//Jest prawdziwym zwolennikiem wiary i chce siê wydostaæ z tego miejsca, tak jak my wszyscy.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_04");	//Wska¿ mu drogê i chroñ jego duszê przed wszelkimi zagro¿eniami.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_05");	//Albowiem odt¹d staje siê on czêœci¹ naszej spo³ecznoœci.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_06");	//Powtarzaj za mn¹.
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_07");	//Œni¹cy, oœwiadczam niniejszym...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_08");	//Œni¹cy, oœwiadczam niniejszym...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_09");	//...¿em gotów jest s³u¿yæ ci po wsze czasy...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_10");	//...¿em gotów jest s³u¿yæ ci po wsze czasy...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_11");	//...aby ma dusza zosta³a wyzwolona dziêki twej sile...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_12");	//...aby ma dusza zosta³a wyzwolona dziêki twej sile...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_13");	//...wska¿ mi drogê do wolnoœci i zeœlij natchnienie...
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_14");	//...wska¿ mi drogê do wolnoœci i zeœlij natchnienie...
		AI_Output(self,other,"Info_BaalNamib_BEGINNING_01_15");	//...albowiem droga twa jest kluczem do zbawienia.
		AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_16");	//...albowiem droga twa jest kluczem do zbawienia.
		AI_StopProcessInfos(self);
		Wld_PlayEffect("SPELLFX_TELEPORT",hero,hero,0,0,0,FALSE);
		Mdl_SetVisualBody(hero,"hum_body_Naked0",1,1,"HUM_HEAD_BALD",125,2,-1);
		AI_Standup(self);
		AI_Standup(hero);
	};
};


instance INFO_BAALNAMIB_WILLKOMMEN(C_Info)
{
	npc = GUR_1204_BaalNamib;
	condition = info_baalnamib_willkommen_condition;
	information = info_baalnamib_willkommen_info;
	important = 1;
	permanent = 0;
};


func int info_baalnamib_willkommen_condition()
{
	if(Npc_KnowsInfo(hero,info_baalnamib_beginning))
	{
		return TRUE;
	};
};

func void info_baalnamib_willkommen_info()
{
	AI_Output(self,other,"Info_BaalNamib_WILLKOMMEN_15_01");	//Witam ciê w imieniu ca³ego Bractwa Œni¹cego.
	AI_Output(self,other,"Info_BaalNamib_WILLKOMMEN_15_02");	//Przed tob¹ d³uga, ale i lukratywna droga.
	AI_Output(self,other,"Info_BaalNamib_WILLKOMMEN_01_03");	//Podj¹³eœ s³uszn¹ decyzjê.
	AI_Output(self,other,"Info_BaalNamib_WILLKOMMEN_01_04");	//Czas poka¿e, jak¹ œcie¿kê wyznaczy³ dla ciebie Œni¹cy.
	AI_Output(self,other,"Info_BaalNamib_WILLKOMMEN_01_05");	//Mo¿e staniesz siê jego wybrañcem, tak jak i ja?
	AI_Output(self,other,"Info_BaalNamib_WILLKOMMEN_01_06");	//Albo zostaniesz wyznaczony do ochrony obozu jak Cor Angar.
	AI_Output(self,other,"Info_BaalNamib_WILLKOMMEN_01_07");	//Zobaczymy.
	AI_Output(self,other,"Info_BaalNamib_WILLKOMMEN_01_08");	//Niech Œni¹cy ma ciê w swojej opiece, Nowicjuszu.
	AI_Standup(self);
	AI_Standup(hero);
	namib_ritual = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_RITUAL,LOG_SUCCESS);
	B_LogEntry(CH1_RITUAL,"Baal Namib przeprowadzi³ rytua³, dziêki któremu oficjalnie zosta³em cz³onkiem obozu Bractwa.");
	B_GiveXP(XP_NAMIBRITUAL);
	Npc_ExchangeRoutine(GUR_1204_BaalNamib,"START");
	Npc_ExchangeRoutine(tpl_5051_templer,"START");
	Npc_ExchangeRoutine(tpl_5052_templer,"START");
	AI_StopProcessInfos(self);
};

