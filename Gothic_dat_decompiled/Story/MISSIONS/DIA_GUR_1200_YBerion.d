
instance Info_Yberion_EXIT(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 999;
	condition = Info_Yberion_EXIT_Condition;
	information = Info_Yberion_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Yberion_EXIT_Condition()
{
	return 1;
};

func void Info_Yberion_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_YBerion_Wache(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = DIA_YBerion_Wache_Condition;
	information = DIA_YBerion_Wache_Info;
	permanent = 0;
	important = 1;
};


func int DIA_YBerion_Wache_Condition()
{
	if(Kapitel == 1)
	{
		return 1;
	};
};

func void DIA_YBerion_Wache_Info()
{
	AI_Output(self,other,"DIA_YBerion_Wache_12_00");	//Co tu robisz? Kto ciê tu wpuœci³? Stra¿!
	B_IntruderAlert(self,other);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};


instance DIA_YBerion_Kennen(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = DIA_YBerion_Kennen_Condition;
	information = DIA_YBerion_Kennen_Info;
	permanent = 0;
	description = "Witaj, Mistrzu Y'Berionie.";
};


func int DIA_YBerion_Kennen_Condition()
{
	if(Kapitel == 2)
	{
		return 1;
	};
};

func void DIA_YBerion_Kennen_Info()
{
	AI_Output(other,self,"DIA_YBerion_Kennen_15_00");	//Witaj, Mistrzu Y'Berionie.
	AI_Output(self,other,"DIA_YBerion_Kennen_12_01");	//Ach! Przypominam sobie twoj¹ twarz.
	AI_Output(other,self,"DIA_YBerion_Kennen_15_02");	//To niemo¿liwe. Nigdy wczeœniej siê nie spotkaliœmy.
	AI_Output(self,other,"DIA_YBerion_Kennen_12_03");	//Ale myœla³em... Ach, czego sobie ¿yczysz?
};


instance Info_YBerion_BringFocus(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = Info_YBerion_BringFocus_Condition;
	information = Info_YBerion_BringFocus_Info;
	permanent = 1;
	description = "S³ysza³em, ¿e czegoœ szukasz.";
};


func int Info_YBerion_BringFocus_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_YBerion_Kennen) && (Npc_GetTrueGuild(hero) != GIL_None) && (YBerion_BringFocus != LOG_RUNNING) && (YBerion_BringFocus != LOG_SUCCESS))
	{
		return 1;
	};
};

func void Info_YBerion_BringFocus_Info()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_Info_15_01");	//S³ysza³em, ¿e czegoœ szukasz.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info_12_02");	//Zgadza siê. Potrzebujemy magicznego kamienia ogniskuj¹cego.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info_12_03");	//Mia³ go dostarczyæ jeden z Nowicjuszy, niejaki Nyras, ale do tej pory nie wróci³.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info_12_04");	//Móg³byœ dowiedzieæ siê co siê z nim dzieje!
	Info_ClearChoices(Info_YBerion_BringFocus);
	Info_AddChoice(Info_YBerion_BringFocus,DIALOG_BACK,Info_YBerion_BringFocus_BACK);
	Info_AddChoice(Info_YBerion_BringFocus,"Przyniosê ci ten kamieñ ogniskuj¹cy!",Info_YBerion_BringFocus_OK);
	Info_AddChoice(Info_YBerion_BringFocus,"Gdzie powinienem zacz¹æ poszukiwania?",Info_YBerion_BringFocus_WO);
	Info_AddChoice(Info_YBerion_BringFocus,"Dlaczego ten kamieñ jest taki wa¿ny?",Info_YBerion_BringFocus_FOKUS);
};

func void Info_YBerion_BringFocus_BACK()
{
	Info_ClearChoices(Info_YBerion_BringFocus);
};

func void Info_YBerion_BringFocus_OK()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_OK_15_01");	//Przyniosê ci ten kamieñ ogniskuj¹cy!
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_OK_12_02");	//WeŸ tê mapê. Zaznaczono na niej po³o¿enie kamienia.
	B_Story_BringFirstFocus();
	B_LogEntry(CH2_Focus,"Y'Berion wys³a³ Nyrasa na poszukiwania kamienia ogniskuj¹cego. Niestety, Nowicjusz jeszcze nie powróci³. Guru da³ mi mapê, która wskazuje po³o¿enie artefaktu.");
};

func void Info_YBerion_BringFocus_WO()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_WO_15_01");	//Gdzie powinienem zacz¹æ poszukiwania?
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_WO_12_02");	//Po wyjœciu z Obozu skrêæ w prawo i wejdŸ na strome zbocze. IdŸ przez las, dopóki nie dojdziesz nad brzeg morza. Tam znajdziesz kamieñ ogniskuj¹cy.
};

func void Info_YBerion_BringFocus_FOKUS()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_FOKUS_15_01");	//Dlaczego ten kamieñ jest taki wa¿ny?
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_02");	//Ten magiczny artefakt zogniskuje duchow¹ si³ê naszych braci.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_03");	//To jeden z piêciu kamieni ogniskuj¹cych, które pos³u¿y³y magom do utworzenia Bariery.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_04");	//Jedna z moich wizji objawi³a mi zastosowanie kamienia.
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_FOKUS_15_05");	//To musia³a byæ niezwykle ciekawa wizja.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_06");	//Zes³a³ mi j¹ sam Œni¹cy! Dziêki kamieniowi ogniskuj¹cemu bêdziemy mogli nawi¹zaæ z nim kontakt!
};


instance Info_YBerion_BringFocus_RUNNING(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = Info_YBerion_BringFocus_RUNNING_Condition;
	information = Info_YBerion_BringFocus_RUNNING_Info;
	permanent = 0;
	description = "Jeszcze nie znalaz³em kamienia ogniskuj¹cego.";
};


func int Info_YBerion_BringFocus_RUNNING_Condition()
{
	if((YBerion_BringFocus == LOG_RUNNING) && !Npc_HasItems(hero,Focus_1))
	{
		return TRUE;
	};
};

func void Info_YBerion_BringFocus_RUNNING_Info()
{
	AI_Output(other,self,"Info_YBerion_BringFocus_RUNNING_15_01");	//Jeszcze nie znalaz³em kamienia ogniskuj¹cego.
	AI_Output(self,other,"Info_YBerion_BringFocus_RUNNING_12_02");	//Wiêc szukaj dalej. Œni¹cy wska¿e ci drogê.
};


instance Info_YBerion_BringFocus_Success(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = Info_YBerion_BringFocus_Success_Condition;
	information = Info_YBerion_BringFocus_Success_Info;
	permanent = 0;
	description = "Znalaz³em kamieñ.";
};


func int Info_YBerion_BringFocus_Success_Condition()
{
	if((YBerion_BringFocus == LOG_RUNNING) && Npc_HasItems(hero,Focus_1))
	{
		return 1;
	};
};

func void Info_YBerion_BringFocus_Success_Info()
{
	AI_Output(other,self,"Info_YBerion_BringFocus_Success_15_01");	//Znalaz³em kamieñ.
	AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_02");	//Œwietnie. Odda³eœ nam ogromn¹ przys³ugê.
	AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_03");	//Teraz zanieœ kamieñ Cor Kalomowi. On bêdzie wiedzia³, co z nim zrobiæ.
	if(Kalom_TalkedTo == FALSE)
	{
		AI_Output(other,self,"Info_YBerion_BringFocus_Success_15_04");	//Gdzie znajdê tego Cor Kaloma?
		AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_05");	//Wiêkszoœæ czasu spêdza w laboratorium alchemicznym na wy¿szym poziomie Obozu
		AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_06");	//Porozmawiaj z Lesterem. Znajdziesz go przy wejœciu do Obozu. On wska¿e ci drogê.
		B_LogEntry(CH2_Focus,"Y'Berion kaza³ mi zanieœæ kamieñ ogniskuj¹cy innemu Guru, imieniem Cor Kalom. Ten Kalom spêdza ponoæ ca³e dnie w swoim laboratorium alchemicznym.");
	}
	else
	{
		B_LogEntry(CH2_Focus,"Y'Berion kaza³ mi zanieœæ kamieñ ogniskuj¹cy Cor Kalomowi. Có¿ za radoœæ! Znów spotkam tego przemi³ego cz³owieka!");
	};
	TPL_1406_Templer.aivar[AIV_PASSGATE] = TRUE;
	YBerion_BringFocus = LOG_SUCCESS;
	B_GiveXP(XP_BringFocusToYBerion);
};


instance Info_YBerion_NYRAS(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = Info_YBerion_NYRAS_Condition;
	information = Info_YBerion_NYRAS_Info;
	permanent = 0;
	description = "Nyras postrada³ zmys³y!";
};


func int Info_YBerion_NYRAS_Condition()
{
	if(Npc_HasItems(hero,Focus_1))
	{
		return 1;
	};
};

func void Info_YBerion_NYRAS_Info()
{
	AI_Output(other,self,"Info_YBerion_NYRAS_15_01");	//Nyras postrada³ zmys³y!
	AI_Output(other,self,"Info_YBerion_NYRAS_15_02");	//Twierdzi³, ¿e Œni¹cy objawi³ siê mu w wizji i wybra³ go na swojego jedynego s³ugê!
	AI_Output(other,self,"Info_YBerion_NYRAS_15_03");	//Potem rzuci³ siê na mnie i próbowa³ mnie zabiæ!
	AI_Output(self,other,"Info_YBerion_NYRAS_12_04");	//Potêga Œni¹cego jest tak ogromna, ¿e mo¿e przywieœæ nieprzygotowane dusze do szaleñstwa.
	AI_Output(self,other,"Info_YBerion_NYRAS_12_05");	//Tylko my - Guru, po d³ugich latach medytacji, posiadamy wystarczaj¹c¹ si³ê duchow¹, by móc sprostaæ wyzwaniu, jakim jest wys³uchanie g³osu Œni¹cego!
};


instance GUR_1200_Yberion_EARN(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = GUR_1200_Yberion_EARN_Condition;
	information = GUR_1200_Yberion_EARN_Info;
	important = 0;
	permanent = 0;
	description = "Chyba nale¿y mi siê jakaœ nagroda?";
};


func int GUR_1200_Yberion_EARN_Condition()
{
	if((YBerion_BringFocus == LOG_SUCCESS) && C_IsChapter(2) && ((Npc_GetTrueGuild(hero) != GIL_NOV) || (Npc_GetTrueGuild(hero) != GIL_GUR) || (Npc_GetTrueGuild(hero) != GIL_TPL)))
	{
		return 1;
	};
};

func void GUR_1200_Yberion_EARN_Info()
{
	AI_Output(other,self,"GUR_1200_Yberion_EARN_Info_15_01");	//Chyba nale¿y mi siê jakaœ nagroda?
	AI_Output(self,other,"GUR_1200_Yberion_EARN_Info_12_02");	//Jako ¿e nie nale¿ysz do Bractwa, postanowi³em ciê wynagrodziæ.
	AI_Output(self,other,"GUR_1200_Yberion_EARN_Info_12_03");	//Przyjmij ten amulet jako wyraz mojej wdziêcznoœci.
	CreateInvItem(self,Schutzamulett_Feuer);
	B_GiveInvItems(self,hero,Schutzamulett_Feuer,1);
};


instance gur_1200_yberion_wannbeguru(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = gur_1200_yberion_wannbeguru_condition;
	information = gur_1200_yberion_wannbeguru_info;
	important = 0;
	permanent = 1;
	description = "Chcia³eœ ze mn¹ porozmawiaæ?";
};


func int gur_1200_yberion_wannbeguru_condition()
{
	if(Npc_KnowsInfo(hero,gur_1204_baalnamib_guraufnahme) && (yberion_guraufnahme != 1) && (Npc_GetTrueGuild(hero) == GIL_NOV))
	{
		return TRUE;
	};
};

func void gur_1200_yberion_wannbeguru_info()
{
	AI_Output(other,self,"GUR_1200_YBerion_WANNBEGURU_Info_20_01");	//Chcia³eœ ze mn¹ porozmawiaæ?
	AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_20_02");	//S³ysza³em ju¿, co siê sta³o w Starej Kopalni.
	AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_20_03");	//Udowodni³eœ swoj¹ wartoœæ i zaszczytnie s³u¿y³eœ Œni¹cemu.
	AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_20_04");	//Zebraliœmy siê wiêc i twierdzimy, ¿e jesteœ gotów, by otrzymaæ szansê zostania jednym z nas - Guru.
	AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_20_13");	//Zwykle wymaga to lat treningu, ale swoimi obecnymi czynami i doœwiadczeniem pokaza³eœ nam, ¿e Œni¹cy jest z tob¹.
	AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_21_05");	//Jednak powinieneœ przed tym wiedzieæ, ¿e jako jeden z nas bêdziesz musia³ zostawiæ swe dotychczasowe ¿ycie za sob¹. Jako Guru staniesz siê prawdziwie oddanym s³ug¹ Œni¹cego.
	AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_20_06");	//Bêdziesz nawraca³ ignoranckie dusze pokazuj¹c im, ¿e istnieje tylko jeden prawdziwy bóg. Albowiem Œni¹cy jest zbawicielem wszystkich naszych dusz!
	AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_20_07");	//To ¿ycie pe³ne wyrzeczeñ, ale warte podró¿y. Gdy tylko us³yszysz g³os Œni¹cego, bêdziesz wiedzia³, ¿e ka¿de to poœwiêcenie warte jest swojej ceny.
	AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_20_08");	//Zanim jednak bêdziesz móg³ do nas do³¹czyæ, musisz jeszcze poddaæ siê ostatniej próbie.
	if(hero.level < 15)
	{
		AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_20_05");	//Ale... nie jesteœ jeszcze gotowy. Wróæ póŸniej, kiedy uznasz, ¿e twa wiara siê umocni³a.
		AI_StopProcessInfos(self);
		B_PrintGuildCondition(15);
	}
	else
	{
		AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_20_10");	//Twa wiara w Œni¹cego umocni³a siê, a ty udowodni³eœ, ¿e jesteœ tego godzien.
		AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_20_20");	//Jesteœ ju¿ gotowy na próbê. Mo¿emy zaczynaæ od razu, jeœli sobie tego ¿yczysz.
		yberion_guraufnahme = 1;
		gur_1200_yberion_wannbeguru.permanent = 0;
		Info_ClearChoices(gur_1200_yberion_wannbeguru);
		Log_CreateTopic(GE_BECOMEGURU,LOG_NOTE);
		B_LogEntry(GE_BECOMEGURU,"Zanim Y'Berion bêdzie móg³ powo³aæ mnie na Guru, muszê pierw poddaæ siê jego próbie.");
	};
};


instance gur_1200_yberion_gurutest(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = gur_1200_yberion_gurutest_condition;
	information = gur_1200_yberion_gurutest_info;
	important = 0;
	permanent = 0;
	description = "Jestem gotów poddaæ siê ostatniej próbie.";
};


func int gur_1200_yberion_gurutest_condition()
{
	if(yberion_guraufnahme == 1)
	{
		return TRUE;
	};
};

func void gur_1200_yberion_gurutest_info()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_Info_15_01");	//Jestem gotów poddaæ siê ostatniej próbie.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_Info_14_02");	//Niech i tak bêdzie.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_Info_14_03");	//Dlaczego zdecydowa³eœ siê akurat na Bractwo Œni¹cego?
	become_guru = LOG_RUNNING;
	Log_CreateTopic(CH2_GURU,LOG_MISSION);
	Log_SetTopicStatus(CH2_GURU,LOG_RUNNING);
	B_LogEntry(CH2_GURU,"Zdecydowa³em siê przyj¹æ ostatni test od Y'Beriona. Jeœli podo³am, zostanê awansowany na jednego z Guru.");
	Info_ClearChoices(gur_1200_yberion_gurutest);
	Info_AddChoice(gur_1200_yberion_gurutest,"Tak siê jakoœ z³o¿y³o.",gur_1200_yberion_gurutest_nurso);
	Info_AddChoice(gur_1200_yberion_gurutest,"Poniewa¿ szuka³em zbawienia.",gur_1200_yberion_gurutest_erlÖsung);
	Info_AddChoice(gur_1200_yberion_gurutest,"Z powodu bagiennego ziela.",gur_1200_yberion_gurutest_kraut);
};

func void gur_1200_yberion_gurutest_nurso()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_NURSO_Info_15_01");	//Tak siê jakoœ z³o¿y³o.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_NURSO_Info_14_02");	//No, no...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_NURSO_Info_14_03");	//Có¿, chyba myli³em siê co do ciebie. Myœla³em, ¿e przyst¹pi³eœ do nas jako prawdziwy wyznawca wiary.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_NURSO_Info_14_04");	//W takiej sytuacji, nie mogê ciê niestety przyj¹æ w szeregi Guru.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_NURSO_Info_14_05");	//OdejdŸ, nie mam ci ju¿ nic do powiedzenia.
	become_guru = LOG_FAILED;
	Log_SetTopicStatus(CH2_GURU,LOG_FAILED);
	B_LogEntry(CH2_GURU,"Zawiod³em. Y'Berion nie przyjmie mnie ju¿ w szeregi Guru.");
	AI_StopProcessInfos(self);
};

func void gur_1200_yberion_gurutest_erlÖsung()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_ERLÖSUNG_Info_15_01");	//Poniewa¿ szuka³em zbawienia.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_ERLÖSUNG_Info_14_02");	//No, no...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_ERLÖSUNG_Info_14_03");	//Mia³eœ ju¿ doœæ tego miejsca, tak jak my wszyscy, i przyszed³eœ do naszego obozu jako prawdziwy wyznawca wiary.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_ERLÖSUNG_Info_14_04");	//To siê ceni. Tutaj znajdziesz swoje odkupienie. Œni¹cy jest naszym zbawicielem i to on wska¿e nam drogê.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_ERLÖSUNG_Info_14_05");	//PrzejdŸmy do nastêpnego pytania. Jeœli przys³uchiwa³eœ siê uwa¿nie s³owom Baal Cadara, nie sprawi ci ono problemu.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_ERLÖSUNG_Info_14_06");	//Kiedy Œni¹cy objawi³ mi siê po raz pierwszy?
	yberion_guraufnahme = 2;
	Info_ClearChoices(gur_1200_yberion_gurutest);
	Info_AddChoice(gur_1200_yberion_gurutest,"3 lata temu.",gur_1200_yberion_gurutest_three);
	Info_AddChoice(gur_1200_yberion_gurutest,"5 lat temu.",gur_1200_yberion_gurutest_five);
	Info_AddChoice(gur_1200_yberion_gurutest,"4 lata temu.",gur_1200_yberion_gurutest_four);
	Info_AddChoice(gur_1200_yberion_gurutest,"Nie wiem.",gur_1200_yberion_gurutest_dontknow);
};

func void gur_1200_yberion_gurutest_kraut()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_KRAUT_Info_15_01");	//Z powodu bagiennego ziela.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_KRAUT_Info_14_02");	//No, no...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_KRAUT_Info_14_03");	//Jak zapewne wiesz, u¿ywamy bagiennego ziela, aby byæ mo¿liwie blisko Œni¹cego. Pomaga nam w wizjach, a ponadto sprawdza siê w handlu z pozosta³ymi obozami.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_KRAUT_Info_14_04");	//Ale my mamy ju¿ doœæ ludzi, którzy s¹ wœród nas tylko z powodu tego ziela. Kandydaci na Guru musz¹ mieæ czyst¹ duszê i siln¹ wiarê.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_KRAUT_Info_14_05");	//W twoim przypadku niestety droga Guru pozostanie ju¿ dla ciebie zamkniêta. Nie mo¿emy ciê przyj¹æ w tych okolicznoœciach.
	become_guru = LOG_FAILED;
	Log_SetTopicStatus(CH2_GURU,LOG_FAILED);
	B_LogEntry(CH2_GURU,"Zawiod³em. Y'Berion nie przyjmie mnie ju¿ w szeregi Guru.");
	AI_StopProcessInfos(self);
};

func void gur_1200_yberion_gurutest_three()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_THREE_Info_15_01");	//3 lata temu.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_THREE_Info_14_02");	//No, no...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_THREE_Info_14_03");	//Niestety, to nie jest prawda. Widzê, ¿e zaniedba³eœ naukê. Nie przyda nam siê tu ktoœ, kto nawet nie zna historii naszego Bractwa.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_THREE_Info_14_04");	//Przykro mi, ale nie mo¿emy ciê przyj¹æ.
	become_guru = LOG_FAILED;
	Log_SetTopicStatus(CH2_GURU,LOG_FAILED);
	B_LogEntry(CH2_GURU,"Zawiod³em. Y'Berion nie przyjmie mnie ju¿ w szeregi Guru.");
	AI_StopProcessInfos(self);
};

func void gur_1200_yberion_gurutest_five()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_FIVE_Info_15_01");	//5 lat temu.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FIVE_Info_14_02");	//No, no...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FIVE_Info_14_03");	//Zgadza siê. To wa¿ne, by Nowicjusz zg³êbia³ wiedzê na temat Bractwa Œni¹cego.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FIVE_Info_14_04");	//Do zadañ Guru nale¿y g³oszenie niewiernym nauk Œni¹cego. Dochodzi do tego równie¿ historia naszego Bractwa.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FIVE_Info_14_05");	//Widzê, ¿e znasz nasz¹ przesz³oœæ. To du¿y krok dla ciebie na drodze ku œwiat³oœci.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FIVE_Info_14_06");	//Czas wiêc na ostatnie pytanie. Ilu ludzi liczy teraz kr¹g Baalów?
	yberion_guraufnahme = 3;
	Info_ClearChoices(gur_1200_yberion_gurutest);
	Info_AddChoice(gur_1200_yberion_gurutest,"Oœmiu.",gur_1200_yberion_gurutest_acht);
	Info_AddChoice(gur_1200_yberion_gurutest,"Siedmiu.",gur_1200_yberion_gurutest_sieben);
	Info_AddChoice(gur_1200_yberion_gurutest,"Szeœciu.",gur_1200_yberion_gurutest_sechs);
	Info_AddChoice(gur_1200_yberion_gurutest,"Piêciu.",gur_1200_yberion_gurutest_fuenf);
};

func void gur_1200_yberion_gurutest_four()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_FOUR_Info_15_01");	//4 lata temu.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FOUR_Info_14_02");	//No, no...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FOUR_Info_14_03");	//Nie, to nie jest prawda. Zawiod³em siê. Widocznie nie jesteœ jeszcze gotów, by zostaæ przyjêtym w poczet Baalów.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FOUR_Info_14_04");	//OdejdŸ i poœwiêæ siê lepiej znowu nauce.
	become_guru = LOG_FAILED;
	Log_SetTopicStatus(CH2_GURU,LOG_FAILED);
	B_LogEntry(CH2_GURU,"Zawiod³em. Y'Berion nie przyjmie mnie ju¿ w szeregi Guru.");
	AI_StopProcessInfos(self);
};

func void gur_1200_yberion_gurutest_dontknow()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_DONTKNOW_Info_15_01");	//Nie wiem.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_DONTKNOW_Info_14_02");	//No, no...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_DONTKNOW_Info_14_03");	//Nie mogê przyj¹æ takiej odpowiedzi od kogoœ, kto chce do³¹czyæ do grona Baalów.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_DONTKNOW_Info_14_04");	//Lepiej bêdzie, jeœli zajmiesz siê z powrotem swoimi codziennymi zajêciami.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_DONTKNOW_Info_14_05");	//Œcie¿ka Guru nie jest najwidoczniej dla ciebie.
	become_guru = LOG_FAILED;
	Log_SetTopicStatus(CH2_GURU,LOG_FAILED);
	B_LogEntry(CH2_GURU,"Zawiod³em. Y'Berion nie przyjmie mnie ju¿ w szeregi Guru.");
	AI_StopProcessInfos(self);
};

func void gur_1200_yberion_gurutest_acht()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_ACHT_Info_15_01");	//Oœmiu.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_ACHT_Info_14_02");	//No, no...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_ACHT_Info_14_03");	//Zgadza siê.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_ACHT_Info_14_04");	//Prawid³owo odpowiedzia³eœ na ka¿de moje pytanie i tym samym zaliczy³eœ próbê.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_ACHT_Info_14_05");	//ChodŸ teraz ze mn¹ do wielkiej sali. Tam przeprowadzimy pradawny rytua³, dziêki któremu nawi¹¿esz kontakt ze Œni¹cym i poszerzysz swoj¹ œwiadomoœæ.
	yberion_guraufnahme = 4;
	b_story_guruaufnahme();
	become_guru = LOG_SUCCESS;
	B_GiveXP(XP_GETBAAL);
	Log_SetTopicStatus(CH2_GURU,LOG_SUCCESS);
	B_LogEntry(CH2_GURU,"Sprosta³em próbie Y'Beriona. Zostanê teraz przyjêty w poczet Baalów Bractwa Œni¹cego.");
	AI_StopProcessInfos(self);
};

func void gur_1200_yberion_gurutest_sieben()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_SIEBEN_Info_15_01");	//Siedmiu.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_SIEBEN_Info_14_02");	//No, no...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_SIEBEN_Info_14_03");	//Niestety, nie jest to prawda. Podczas pobytu w obozie chyba powinieneœ poznaæ ju¿ wszystkich Baalów.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_SIEBEN_Info_14_04");	//Ale najwyraŸniej myli³em siê co do ciebie...
	become_guru = LOG_FAILED;
	Log_SetTopicStatus(CH2_GURU,LOG_FAILED);
	B_LogEntry(CH2_GURU,"Zawiod³em. Y'Berion nie przyjmie mnie ju¿ w szeregi Guru.");
	AI_StopProcessInfos(self);
};

func void gur_1200_yberion_gurutest_sechs()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_SECHS_Info_15_01");	//Szeœciu.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_SECHS_Info_14_02");	//No, no...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_SECHS_Info_14_03");	//Aspirant na Baala, który nawet nie wie ilu tych Baalów mamy, nie jest nam do niczego potrzebny.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_SECHS_Info_14_04");	//Powinieneœ lepiej wróciæ do pozosta³ych obowi¹zków.
	become_guru = LOG_FAILED;
	Log_SetTopicStatus(CH2_GURU,LOG_FAILED);
	B_LogEntry(CH2_GURU,"Zawiod³em. Y'Berion nie przyjmie mnie ju¿ w szeregi Guru.");
	AI_StopProcessInfos(self);
};

func void gur_1200_yberion_gurutest_fuenf()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_FUENF_Info_15_01");	//Piêciu.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FUENF_Info_14_02");	//No, no...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FUENF_Info_14_03");	//Bynajmniej. Wydaje mi siê, ¿e zapomnia³eœ o kilku najwy¿szych rang¹ cz³onków naszego Bractwa.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FUENF_Info_14_04");	//To smutne. Ju¿ chyba lepiej dla ciebie, byœ da³ sobie spokój z byciem Guru.
	become_guru = LOG_FAILED;
	Log_SetTopicStatus(CH2_GURU,LOG_FAILED);
	B_LogEntry(CH2_GURU,"Zawiod³em. Y'Berion nie przyjmie mnie ju¿ w szeregi Guru.");
	AI_StopProcessInfos(self);
};


instance GUR_1200_YBERION_RITUAL(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = gur_1200_yberion_ritual_condition;
	information = gur_1200_yberion_ritual_info;
	important = 1;
	permanent = 0;
};


func int gur_1200_yberion_ritual_condition()
{
	if((yberion_guraufnahme == 4) && (Npc_GetDistToWP(hero,"PSI_TEMPLE_IN_05") < 1000))
	{
		return 1;
	};
};

func void gur_1200_yberion_ritual_info()
{
	yberion_guraufnahme = 5;
	AI_UnequipWeapons(hero);
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoNpc(hero,self);
	b_story_guruaufnahme();
	AI_Output(self,other,"GUR_1200_Yberion_RITUAL_Info_12_01");	//Pod czujnym okiem Œni¹cego, spotkaliœmy siê tutaj, by przyj¹æ tego pobratymca w nasze szeregi.
	AI_Output(self,other,"GUR_1200_Yberion_RITUAL_Info_12_02");	//Ten jegomoœæ dokona³ w imieniu Œni¹cego rzeczy wielkich. Pokaza³ drogê wielu niewiernym. Pokaza³ im, jak¹ moc¹ obdarowa³ go Œni¹cy.
	Snd_Play("howling_01");
	AI_Output(self,other,"GUR_1200_Yberion_RITUAL_Info_12_03");	//Œni¹cy! Przyjmij tego cz³owieka za swojego s³ugê!
	AI_Output(self,other,"GUR_1200_Yberion_RITUAL_Info_12_04");	//Strze¿ go podczas jego przysz³ych wêdrówek i stañ siê jednoœci¹ z jego duchem!
	AI_Output(self,other,"GUR_1200_Yberion_RITUAL_Info_12_05");	//Daj mu moc, by widzia³!
	AI_Output(self,other,"GUR_1200_Yberion_RITUAL_Info_12_06");	//Pozwól mu równie¿ zobaczyæ drogê do wolnoœci, któr¹ i nam wska¿esz!
	AI_Output(self,other,"GUR_1200_Yberion_RITUAL_Info_12_07");	//Oœwieæ jego duszê i prowadŸ go na twej œcie¿ce ku œwiat³oœci!
	AI_Output(self,other,"GUR_1200_Yberion_RITUAL_Info_12_08");	//Œni¹cy, wys³uchaj mnie!
	AI_StopProcessInfos(self);
};


instance GUR_1200_YBERION_ROBE(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = gur_1200_yberion_robe_condition;
	information = gur_1200_yberion_robe_info;
	important = 1;
	permanent = 0;
};


func int gur_1200_yberion_robe_condition()
{
	if(yberion_guraufnahme == 5)
	{
		return 1;
	};
};

func void gur_1200_yberion_robe_info()
{
	AI_Output(self,other,"GUR_1200_YBerion_ROBE_Info_14_07");	//Od teraz jesteœ godzien nosiæ szatê Baala.
	AI_Output(self,other,"GUR_1200_YBerion_ROBE_Info_14_08");	//WeŸ j¹ i noœ z dum¹, by pokazaæ tym samym swoj¹ wiêŸ ze Œni¹cym.
	AI_Output(self,other,"GUR_1200_YBerion_ROBE_Info_14_09");	//Teraz, kiedy ju¿ jesteœ Baalem, zyska³eœ prawo do opanowania magii Œni¹cego.
	AI_Output(self,other,"GUR_1200_YBerion_ROBE_Info_14_10");	//Jeœli jesteœ g³odny wiedzy, powinieneœ pomówiæ z Baal Cadarem. On bêdzie twoim nauczycielem.
	AI_Output(self,other,"GUR_1200_YBerion_ROBE_Info_14_11");	//Nadszed³ ten czas.
	AI_Output(self,other,"GUR_1200_YBerion_ROBE_Info_14_12");	//G³oœ wszem i wobec prawdê ignorantom z zewn¹trz.
	AI_Output(self,other,"GUR_1200_YBerion_ROBE_Info_14_13");	//Opowiedz im o drodze Œni¹cego. Powiedz im, jak bêdzie wygl¹daæ droga do wolnoœci.
	AI_Output(self,other,"GUR_1200_YBerion_ROBE_Info_14_14");	//PoprowadŸ naszych braci ku wolnoœci i poka¿ im, ¿e ka¿da ofiara, któr¹ do tej pory przynosz¹, jest ofiar¹ dla samego Œni¹cego.
	AI_Output(self,other,"GUR_1200_YBerion_ROBE_Info_14_15");	//Albowiem twoja si³a tkwi w wierze w Œni¹cego.
	yberion_guraufnahme = 6;
	b_story_guruaufnahme();
	Snd_Play("MFX_Heal_Cast");
	CreateInvItem(hero,gur_armor_m);
	CreateInvItem(self,ItAmArrow);
	B_GiveInvItems(self,hero,ItAmArrow,1);
	Npc_RemoveInvItem(hero,ItAmArrow);
	Npc_SetTrueGuild(hero,GIL_GUR);
	hero.guild = GIL_GUR;
	Mdl_ApplyOverlayMds(hero,"Humans_Mage.mds");
	AI_EquipBestArmor(hero);
	AI_UnequipWeapons(hero);
	Wld_AssignRoomToGuild("hütte26",GIL_VLK);
	Wld_AssignRoomToGuild("NLHU25",GIL_SLD);
	B_LogEntry(GE_BECOMEGURU,"Zaliczy³em ostatni¹ próbê, by zostaæ Guru. Tym samym osi¹gn¹³em najwy¿szy stopieñ w Bractwie i od teraz mogê trudniæ siê magi¹ Œni¹cego. Baal Cadar bêdzie moim nauczycielem.");
	B_LogEntry(GE_BecomeTemplar,"Teraz, kiedy obra³em œcie¿kê jednego z Guru, droga Œwi¹tynnego Stra¿nika bêdzie ju¿ dla mnie zamkniêta.");
	AI_StopProcessInfos(self);
};


instance gur_1200_yberion_lastwords(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = gur_1200_yberion_lastwords_condition;
	information = gur_1200_yberion_lastwords_info;
	important = 1;
	permanent = 0;
};


func int gur_1200_yberion_lastwords_condition()
{
	if(Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_Success))
	{
		return 1;
	};
};

func void gur_1200_yberion_lastwords_info()
{
	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_01");	//To koniec... Œni¹cy... ja... ja go widzia³em!
	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_02");	//Kto...? ...to ty, dobrze. Pos³uchaj mnie...
	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_03");	//Nie wolno zbudziæ Œni¹cego... Magowie Wody...
	AI_Output(other,self,"GUR_1200_Yberion_LASTWORDS_Info_15_04");	//Co z nimi?
	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_05");	//Musisz siê udaæ do Magów Wody. Oni znajd¹ drogê do wolnoœci.
	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_06");	//Œni¹cy... Widzia³em go. To... to... to demon!
	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_07");	//Jeœli dalej zale¿y ci na zniszczeniu Bariery... ruszaj do Nowego Obozu. Powiadom ich o kamieniu. Przeka¿ im...
	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_08");	//...przeka¿ im, ¿e dowiedzieliœmy siê, jak na³adowaæ te kamienie, one... one powinny móc wysadziæ Barierê... musicie...
	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_09");	//...nie daæ... rozbudziæ... ca³e to z³o...
	AI_StopProcessInfos(self);
};

