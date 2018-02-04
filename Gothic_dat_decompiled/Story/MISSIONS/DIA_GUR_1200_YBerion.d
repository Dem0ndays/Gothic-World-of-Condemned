
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
	AI_Output(self,other,"DIA_YBerion_Wache_12_00");	//Co tu robisz? Kto ci� tu wpu�ci�? Stra�!
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
	AI_Output(self,other,"DIA_YBerion_Kennen_12_01");	//Ach! Przypominam sobie twoj� twarz.
	AI_Output(other,self,"DIA_YBerion_Kennen_15_02");	//To niemo�liwe. Nigdy wcze�niej si� nie spotkali�my.
	AI_Output(self,other,"DIA_YBerion_Kennen_12_03");	//Ale my�la�em... Ach, czego sobie �yczysz?
};


instance Info_YBerion_BringFocus(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = Info_YBerion_BringFocus_Condition;
	information = Info_YBerion_BringFocus_Info;
	permanent = 1;
	description = "S�ysza�em, �e czego� szukasz.";
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
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_Info_15_01");	//S�ysza�em, �e czego� szukasz.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info_12_02");	//Zgadza si�. Potrzebujemy magicznego kamienia ogniskuj�cego.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info_12_03");	//Mia� go dostarczy� jeden z Nowicjuszy, niejaki Nyras, ale do tej pory nie wr�ci�.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info_12_04");	//M�g�by� dowiedzie� si� co si� z nim dzieje!
	Info_ClearChoices(Info_YBerion_BringFocus);
	Info_AddChoice(Info_YBerion_BringFocus,DIALOG_BACK,Info_YBerion_BringFocus_BACK);
	Info_AddChoice(Info_YBerion_BringFocus,"Przynios� ci ten kamie� ogniskuj�cy!",Info_YBerion_BringFocus_OK);
	Info_AddChoice(Info_YBerion_BringFocus,"Gdzie powinienem zacz�� poszukiwania?",Info_YBerion_BringFocus_WO);
	Info_AddChoice(Info_YBerion_BringFocus,"Dlaczego ten kamie� jest taki wa�ny?",Info_YBerion_BringFocus_FOKUS);
};

func void Info_YBerion_BringFocus_BACK()
{
	Info_ClearChoices(Info_YBerion_BringFocus);
};

func void Info_YBerion_BringFocus_OK()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_OK_15_01");	//Przynios� ci ten kamie� ogniskuj�cy!
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_OK_12_02");	//We� t� map�. Zaznaczono na niej po�o�enie kamienia.
	B_Story_BringFirstFocus();
	B_LogEntry(CH2_Focus,"Y'Berion wys�a� Nyrasa na poszukiwania kamienia ogniskuj�cego. Niestety, Nowicjusz jeszcze nie powr�ci�. Guru da� mi map�, kt�ra wskazuje po�o�enie artefaktu.");
};

func void Info_YBerion_BringFocus_WO()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_WO_15_01");	//Gdzie powinienem zacz�� poszukiwania?
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_WO_12_02");	//Po wyj�ciu z Obozu skr�� w prawo i wejd� na strome zbocze. Id� przez las, dop�ki nie dojdziesz nad brzeg morza. Tam znajdziesz kamie� ogniskuj�cy.
};

func void Info_YBerion_BringFocus_FOKUS()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_FOKUS_15_01");	//Dlaczego ten kamie� jest taki wa�ny?
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_02");	//Ten magiczny artefakt zogniskuje duchow� si�� naszych braci.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_03");	//To jeden z pi�ciu kamieni ogniskuj�cych, kt�re pos�u�y�y magom do utworzenia Bariery.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_04");	//Jedna z moich wizji objawi�a mi zastosowanie kamienia.
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_FOKUS_15_05");	//To musia�a by� niezwykle ciekawa wizja.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_06");	//Zes�a� mi j� sam �ni�cy! Dzi�ki kamieniowi ogniskuj�cemu b�dziemy mogli nawi�za� z nim kontakt!
};


instance Info_YBerion_BringFocus_RUNNING(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = Info_YBerion_BringFocus_RUNNING_Condition;
	information = Info_YBerion_BringFocus_RUNNING_Info;
	permanent = 0;
	description = "Jeszcze nie znalaz�em kamienia ogniskuj�cego.";
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
	AI_Output(other,self,"Info_YBerion_BringFocus_RUNNING_15_01");	//Jeszcze nie znalaz�em kamienia ogniskuj�cego.
	AI_Output(self,other,"Info_YBerion_BringFocus_RUNNING_12_02");	//Wi�c szukaj dalej. �ni�cy wska�e ci drog�.
};


instance Info_YBerion_BringFocus_Success(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = Info_YBerion_BringFocus_Success_Condition;
	information = Info_YBerion_BringFocus_Success_Info;
	permanent = 0;
	description = "Znalaz�em kamie�.";
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
	AI_Output(other,self,"Info_YBerion_BringFocus_Success_15_01");	//Znalaz�em kamie�.
	AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_02");	//�wietnie. Odda�e� nam ogromn� przys�ug�.
	AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_03");	//Teraz zanie� kamie� Cor Kalomowi. On b�dzie wiedzia�, co z nim zrobi�.
	if(Kalom_TalkedTo == FALSE)
	{
		AI_Output(other,self,"Info_YBerion_BringFocus_Success_15_04");	//Gdzie znajd� tego Cor Kaloma?
		AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_05");	//Wi�kszo�� czasu sp�dza w laboratorium alchemicznym na wy�szym poziomie Obozu
		AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_06");	//Porozmawiaj z Lesterem. Znajdziesz go przy wej�ciu do Obozu. On wska�e ci drog�.
		B_LogEntry(CH2_Focus,"Y'Berion kaza� mi zanie�� kamie� ogniskuj�cy innemu Guru, imieniem Cor Kalom. Ten Kalom sp�dza pono� ca�e dnie w swoim laboratorium alchemicznym.");
	}
	else
	{
		B_LogEntry(CH2_Focus,"Y'Berion kaza� mi zanie�� kamie� ogniskuj�cy Cor Kalomowi. C� za rado��! Zn�w spotkam tego przemi�ego cz�owieka!");
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
	description = "Nyras postrada� zmys�y!";
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
	AI_Output(other,self,"Info_YBerion_NYRAS_15_01");	//Nyras postrada� zmys�y!
	AI_Output(other,self,"Info_YBerion_NYRAS_15_02");	//Twierdzi�, �e �ni�cy objawi� si� mu w wizji i wybra� go na swojego jedynego s�ug�!
	AI_Output(other,self,"Info_YBerion_NYRAS_15_03");	//Potem rzuci� si� na mnie i pr�bowa� mnie zabi�!
	AI_Output(self,other,"Info_YBerion_NYRAS_12_04");	//Pot�ga �ni�cego jest tak ogromna, �e mo�e przywie�� nieprzygotowane dusze do szale�stwa.
	AI_Output(self,other,"Info_YBerion_NYRAS_12_05");	//Tylko my - Guru, po d�ugich latach medytacji, posiadamy wystarczaj�c� si�� duchow�, by m�c sprosta� wyzwaniu, jakim jest wys�uchanie g�osu �ni�cego!
};


instance GUR_1200_Yberion_EARN(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = GUR_1200_Yberion_EARN_Condition;
	information = GUR_1200_Yberion_EARN_Info;
	important = 0;
	permanent = 0;
	description = "Chyba nale�y mi si� jaka� nagroda?";
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
	AI_Output(other,self,"GUR_1200_Yberion_EARN_Info_15_01");	//Chyba nale�y mi si� jaka� nagroda?
	AI_Output(self,other,"GUR_1200_Yberion_EARN_Info_12_02");	//Jako �e nie nale�ysz do Bractwa, postanowi�em ci� wynagrodzi�.
	AI_Output(self,other,"GUR_1200_Yberion_EARN_Info_12_03");	//Przyjmij ten amulet jako wyraz mojej wdzi�czno�ci.
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
	description = "Chcia�e� ze mn� porozmawia�?";
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
	AI_Output(other,self,"GUR_1200_YBerion_WANNBEGURU_Info_20_01");	//Chcia�e� ze mn� porozmawia�?
	AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_20_02");	//S�ysza�em ju�, co si� sta�o w Starej Kopalni.
	AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_20_03");	//Udowodni�e� swoj� warto�� i zaszczytnie s�u�y�e� �ni�cemu.
	AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_20_04");	//Zebrali�my si� wi�c i twierdzimy, �e jeste� got�w, by otrzyma� szans� zostania jednym z nas - Guru.
	AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_20_13");	//Zwykle wymaga to lat treningu, ale swoimi obecnymi czynami i do�wiadczeniem pokaza�e� nam, �e �ni�cy jest z tob�.
	AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_21_05");	//Jednak powiniene� przed tym wiedzie�, �e jako jeden z nas b�dziesz musia� zostawi� swe dotychczasowe �ycie za sob�. Jako Guru staniesz si� prawdziwie oddanym s�ug� �ni�cego.
	AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_20_06");	//B�dziesz nawraca� ignoranckie dusze pokazuj�c im, �e istnieje tylko jeden prawdziwy b�g. Albowiem �ni�cy jest zbawicielem wszystkich naszych dusz!
	AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_20_07");	//To �ycie pe�ne wyrzecze�, ale warte podr�y. Gdy tylko us�yszysz g�os �ni�cego, b�dziesz wiedzia�, �e ka�de to po�wi�cenie warte jest swojej ceny.
	AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_20_08");	//Zanim jednak b�dziesz m�g� do nas do��czy�, musisz jeszcze podda� si� ostatniej pr�bie.
	if(hero.level < 15)
	{
		AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_20_05");	//Ale... nie jeste� jeszcze gotowy. Wr�� p�niej, kiedy uznasz, �e twa wiara si� umocni�a.
		AI_StopProcessInfos(self);
		B_PrintGuildCondition(15);
	}
	else
	{
		AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_20_10");	//Twa wiara w �ni�cego umocni�a si�, a ty udowodni�e�, �e jeste� tego godzien.
		AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_20_20");	//Jeste� ju� gotowy na pr�b�. Mo�emy zaczyna� od razu, je�li sobie tego �yczysz.
		yberion_guraufnahme = 1;
		gur_1200_yberion_wannbeguru.permanent = 0;
		Info_ClearChoices(gur_1200_yberion_wannbeguru);
		Log_CreateTopic(GE_BECOMEGURU,LOG_NOTE);
		B_LogEntry(GE_BECOMEGURU,"Zanim Y'Berion b�dzie m�g� powo�a� mnie na Guru, musz� pierw podda� si� jego pr�bie.");
	};
};


instance gur_1200_yberion_gurutest(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = gur_1200_yberion_gurutest_condition;
	information = gur_1200_yberion_gurutest_info;
	important = 0;
	permanent = 0;
	description = "Jestem got�w podda� si� ostatniej pr�bie.";
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
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_Info_15_01");	//Jestem got�w podda� si� ostatniej pr�bie.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_Info_14_02");	//Niech i tak b�dzie.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_Info_14_03");	//Dlaczego zdecydowa�e� si� akurat na Bractwo �ni�cego?
	become_guru = LOG_RUNNING;
	Log_CreateTopic(CH2_GURU,LOG_MISSION);
	Log_SetTopicStatus(CH2_GURU,LOG_RUNNING);
	B_LogEntry(CH2_GURU,"Zdecydowa�em si� przyj�� ostatni test od Y'Beriona. Je�li podo�am, zostan� awansowany na jednego z Guru.");
	Info_ClearChoices(gur_1200_yberion_gurutest);
	Info_AddChoice(gur_1200_yberion_gurutest,"Tak si� jako� z�o�y�o.",gur_1200_yberion_gurutest_nurso);
	Info_AddChoice(gur_1200_yberion_gurutest,"Poniewa� szuka�em zbawienia.",gur_1200_yberion_gurutest_erl�sung);
	Info_AddChoice(gur_1200_yberion_gurutest,"Z powodu bagiennego ziela.",gur_1200_yberion_gurutest_kraut);
};

func void gur_1200_yberion_gurutest_nurso()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_NURSO_Info_15_01");	//Tak si� jako� z�o�y�o.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_NURSO_Info_14_02");	//No, no...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_NURSO_Info_14_03");	//C�, chyba myli�em si� co do ciebie. My�la�em, �e przyst�pi�e� do nas jako prawdziwy wyznawca wiary.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_NURSO_Info_14_04");	//W takiej sytuacji, nie mog� ci� niestety przyj�� w szeregi Guru.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_NURSO_Info_14_05");	//Odejd�, nie mam ci ju� nic do powiedzenia.
	become_guru = LOG_FAILED;
	Log_SetTopicStatus(CH2_GURU,LOG_FAILED);
	B_LogEntry(CH2_GURU,"Zawiod�em. Y'Berion nie przyjmie mnie ju� w szeregi Guru.");
	AI_StopProcessInfos(self);
};

func void gur_1200_yberion_gurutest_erl�sung()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_ERL�SUNG_Info_15_01");	//Poniewa� szuka�em zbawienia.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_ERL�SUNG_Info_14_02");	//No, no...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_ERL�SUNG_Info_14_03");	//Mia�e� ju� do�� tego miejsca, tak jak my wszyscy, i przyszed�e� do naszego obozu jako prawdziwy wyznawca wiary.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_ERL�SUNG_Info_14_04");	//To si� ceni. Tutaj znajdziesz swoje odkupienie. �ni�cy jest naszym zbawicielem i to on wska�e nam drog�.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_ERL�SUNG_Info_14_05");	//Przejd�my do nast�pnego pytania. Je�li przys�uchiwa�e� si� uwa�nie s�owom Baal Cadara, nie sprawi ci ono problemu.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_ERL�SUNG_Info_14_06");	//Kiedy �ni�cy objawi� mi si� po raz pierwszy?
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
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_KRAUT_Info_14_03");	//Jak zapewne wiesz, u�ywamy bagiennego ziela, aby by� mo�liwie blisko �ni�cego. Pomaga nam w wizjach, a ponadto sprawdza si� w handlu z pozosta�ymi obozami.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_KRAUT_Info_14_04");	//Ale my mamy ju� do�� ludzi, kt�rzy s� w�r�d nas tylko z powodu tego ziela. Kandydaci na Guru musz� mie� czyst� dusz� i siln� wiar�.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_KRAUT_Info_14_05");	//W twoim przypadku niestety droga Guru pozostanie ju� dla ciebie zamkni�ta. Nie mo�emy ci� przyj�� w tych okoliczno�ciach.
	become_guru = LOG_FAILED;
	Log_SetTopicStatus(CH2_GURU,LOG_FAILED);
	B_LogEntry(CH2_GURU,"Zawiod�em. Y'Berion nie przyjmie mnie ju� w szeregi Guru.");
	AI_StopProcessInfos(self);
};

func void gur_1200_yberion_gurutest_three()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_THREE_Info_15_01");	//3 lata temu.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_THREE_Info_14_02");	//No, no...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_THREE_Info_14_03");	//Niestety, to nie jest prawda. Widz�, �e zaniedba�e� nauk�. Nie przyda nam si� tu kto�, kto nawet nie zna historii naszego Bractwa.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_THREE_Info_14_04");	//Przykro mi, ale nie mo�emy ci� przyj��.
	become_guru = LOG_FAILED;
	Log_SetTopicStatus(CH2_GURU,LOG_FAILED);
	B_LogEntry(CH2_GURU,"Zawiod�em. Y'Berion nie przyjmie mnie ju� w szeregi Guru.");
	AI_StopProcessInfos(self);
};

func void gur_1200_yberion_gurutest_five()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_FIVE_Info_15_01");	//5 lat temu.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FIVE_Info_14_02");	//No, no...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FIVE_Info_14_03");	//Zgadza si�. To wa�ne, by Nowicjusz zg��bia� wiedz� na temat Bractwa �ni�cego.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FIVE_Info_14_04");	//Do zada� Guru nale�y g�oszenie niewiernym nauk �ni�cego. Dochodzi do tego r�wnie� historia naszego Bractwa.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FIVE_Info_14_05");	//Widz�, �e znasz nasz� przesz�o��. To du�y krok dla ciebie na drodze ku �wiat�o�ci.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FIVE_Info_14_06");	//Czas wi�c na ostatnie pytanie. Ilu ludzi liczy teraz kr�g Baal�w?
	yberion_guraufnahme = 3;
	Info_ClearChoices(gur_1200_yberion_gurutest);
	Info_AddChoice(gur_1200_yberion_gurutest,"O�miu.",gur_1200_yberion_gurutest_acht);
	Info_AddChoice(gur_1200_yberion_gurutest,"Siedmiu.",gur_1200_yberion_gurutest_sieben);
	Info_AddChoice(gur_1200_yberion_gurutest,"Sze�ciu.",gur_1200_yberion_gurutest_sechs);
	Info_AddChoice(gur_1200_yberion_gurutest,"Pi�ciu.",gur_1200_yberion_gurutest_fuenf);
};

func void gur_1200_yberion_gurutest_four()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_FOUR_Info_15_01");	//4 lata temu.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FOUR_Info_14_02");	//No, no...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FOUR_Info_14_03");	//Nie, to nie jest prawda. Zawiod�em si�. Widocznie nie jeste� jeszcze got�w, by zosta� przyj�tym w poczet Baal�w.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FOUR_Info_14_04");	//Odejd� i po�wi�� si� lepiej znowu nauce.
	become_guru = LOG_FAILED;
	Log_SetTopicStatus(CH2_GURU,LOG_FAILED);
	B_LogEntry(CH2_GURU,"Zawiod�em. Y'Berion nie przyjmie mnie ju� w szeregi Guru.");
	AI_StopProcessInfos(self);
};

func void gur_1200_yberion_gurutest_dontknow()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_DONTKNOW_Info_15_01");	//Nie wiem.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_DONTKNOW_Info_14_02");	//No, no...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_DONTKNOW_Info_14_03");	//Nie mog� przyj�� takiej odpowiedzi od kogo�, kto chce do��czy� do grona Baal�w.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_DONTKNOW_Info_14_04");	//Lepiej b�dzie, je�li zajmiesz si� z powrotem swoimi codziennymi zaj�ciami.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_DONTKNOW_Info_14_05");	//�cie�ka Guru nie jest najwidoczniej dla ciebie.
	become_guru = LOG_FAILED;
	Log_SetTopicStatus(CH2_GURU,LOG_FAILED);
	B_LogEntry(CH2_GURU,"Zawiod�em. Y'Berion nie przyjmie mnie ju� w szeregi Guru.");
	AI_StopProcessInfos(self);
};

func void gur_1200_yberion_gurutest_acht()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_ACHT_Info_15_01");	//O�miu.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_ACHT_Info_14_02");	//No, no...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_ACHT_Info_14_03");	//Zgadza si�.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_ACHT_Info_14_04");	//Prawid�owo odpowiedzia�e� na ka�de moje pytanie i tym samym zaliczy�e� pr�b�.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_ACHT_Info_14_05");	//Chod� teraz ze mn� do wielkiej sali. Tam przeprowadzimy pradawny rytua�, dzi�ki kt�remu nawi��esz kontakt ze �ni�cym i poszerzysz swoj� �wiadomo��.
	yberion_guraufnahme = 4;
	b_story_guruaufnahme();
	become_guru = LOG_SUCCESS;
	B_GiveXP(XP_GETBAAL);
	Log_SetTopicStatus(CH2_GURU,LOG_SUCCESS);
	B_LogEntry(CH2_GURU,"Sprosta�em pr�bie Y'Beriona. Zostan� teraz przyj�ty w poczet Baal�w Bractwa �ni�cego.");
	AI_StopProcessInfos(self);
};

func void gur_1200_yberion_gurutest_sieben()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_SIEBEN_Info_15_01");	//Siedmiu.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_SIEBEN_Info_14_02");	//No, no...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_SIEBEN_Info_14_03");	//Niestety, nie jest to prawda. Podczas pobytu w obozie chyba powiniene� pozna� ju� wszystkich Baal�w.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_SIEBEN_Info_14_04");	//Ale najwyra�niej myli�em si� co do ciebie...
	become_guru = LOG_FAILED;
	Log_SetTopicStatus(CH2_GURU,LOG_FAILED);
	B_LogEntry(CH2_GURU,"Zawiod�em. Y'Berion nie przyjmie mnie ju� w szeregi Guru.");
	AI_StopProcessInfos(self);
};

func void gur_1200_yberion_gurutest_sechs()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_SECHS_Info_15_01");	//Sze�ciu.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_SECHS_Info_14_02");	//No, no...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_SECHS_Info_14_03");	//Aspirant na Baala, kt�ry nawet nie wie ilu tych Baal�w mamy, nie jest nam do niczego potrzebny.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_SECHS_Info_14_04");	//Powiniene� lepiej wr�ci� do pozosta�ych obowi�zk�w.
	become_guru = LOG_FAILED;
	Log_SetTopicStatus(CH2_GURU,LOG_FAILED);
	B_LogEntry(CH2_GURU,"Zawiod�em. Y'Berion nie przyjmie mnie ju� w szeregi Guru.");
	AI_StopProcessInfos(self);
};

func void gur_1200_yberion_gurutest_fuenf()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_FUENF_Info_15_01");	//Pi�ciu.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FUENF_Info_14_02");	//No, no...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FUENF_Info_14_03");	//Bynajmniej. Wydaje mi si�, �e zapomnia�e� o kilku najwy�szych rang� cz�onk�w naszego Bractwa.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FUENF_Info_14_04");	//To smutne. Ju� chyba lepiej dla ciebie, by� da� sobie spok�j z byciem Guru.
	become_guru = LOG_FAILED;
	Log_SetTopicStatus(CH2_GURU,LOG_FAILED);
	B_LogEntry(CH2_GURU,"Zawiod�em. Y'Berion nie przyjmie mnie ju� w szeregi Guru.");
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
	AI_Output(self,other,"GUR_1200_Yberion_RITUAL_Info_12_01");	//Pod czujnym okiem �ni�cego, spotkali�my si� tutaj, by przyj�� tego pobratymca w nasze szeregi.
	AI_Output(self,other,"GUR_1200_Yberion_RITUAL_Info_12_02");	//Ten jegomo�� dokona� w imieniu �ni�cego rzeczy wielkich. Pokaza� drog� wielu niewiernym. Pokaza� im, jak� moc� obdarowa� go �ni�cy.
	Snd_Play("howling_01");
	AI_Output(self,other,"GUR_1200_Yberion_RITUAL_Info_12_03");	//�ni�cy! Przyjmij tego cz�owieka za swojego s�ug�!
	AI_Output(self,other,"GUR_1200_Yberion_RITUAL_Info_12_04");	//Strze� go podczas jego przysz�ych w�dr�wek i sta� si� jedno�ci� z jego duchem!
	AI_Output(self,other,"GUR_1200_Yberion_RITUAL_Info_12_05");	//Daj mu moc, by widzia�!
	AI_Output(self,other,"GUR_1200_Yberion_RITUAL_Info_12_06");	//Pozw�l mu r�wnie� zobaczy� drog� do wolno�ci, kt�r� i nam wska�esz!
	AI_Output(self,other,"GUR_1200_Yberion_RITUAL_Info_12_07");	//O�wie� jego dusz� i prowad� go na twej �cie�ce ku �wiat�o�ci!
	AI_Output(self,other,"GUR_1200_Yberion_RITUAL_Info_12_08");	//�ni�cy, wys�uchaj mnie!
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
	AI_Output(self,other,"GUR_1200_YBerion_ROBE_Info_14_07");	//Od teraz jeste� godzien nosi� szat� Baala.
	AI_Output(self,other,"GUR_1200_YBerion_ROBE_Info_14_08");	//We� j� i no� z dum�, by pokaza� tym samym swoj� wi� ze �ni�cym.
	AI_Output(self,other,"GUR_1200_YBerion_ROBE_Info_14_09");	//Teraz, kiedy ju� jeste� Baalem, zyska�e� prawo do opanowania magii �ni�cego.
	AI_Output(self,other,"GUR_1200_YBerion_ROBE_Info_14_10");	//Je�li jeste� g�odny wiedzy, powiniene� pom�wi� z Baal Cadarem. On b�dzie twoim nauczycielem.
	AI_Output(self,other,"GUR_1200_YBerion_ROBE_Info_14_11");	//Nadszed� ten czas.
	AI_Output(self,other,"GUR_1200_YBerion_ROBE_Info_14_12");	//G�o� wszem i wobec prawd� ignorantom z zewn�trz.
	AI_Output(self,other,"GUR_1200_YBerion_ROBE_Info_14_13");	//Opowiedz im o drodze �ni�cego. Powiedz im, jak b�dzie wygl�da� droga do wolno�ci.
	AI_Output(self,other,"GUR_1200_YBerion_ROBE_Info_14_14");	//Poprowad� naszych braci ku wolno�ci i poka� im, �e ka�da ofiara, kt�r� do tej pory przynosz�, jest ofiar� dla samego �ni�cego.
	AI_Output(self,other,"GUR_1200_YBerion_ROBE_Info_14_15");	//Albowiem twoja si�a tkwi w wierze w �ni�cego.
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
	Wld_AssignRoomToGuild("h�tte26",GIL_VLK);
	Wld_AssignRoomToGuild("NLHU25",GIL_SLD);
	B_LogEntry(GE_BECOMEGURU,"Zaliczy�em ostatni� pr�b�, by zosta� Guru. Tym samym osi�gn��em najwy�szy stopie� w Bractwie i od teraz mog� trudni� si� magi� �ni�cego. Baal Cadar b�dzie moim nauczycielem.");
	B_LogEntry(GE_BecomeTemplar,"Teraz, kiedy obra�em �cie�k� jednego z Guru, droga �wi�tynnego Stra�nika b�dzie ju� dla mnie zamkni�ta.");
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
	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_01");	//To koniec... �ni�cy... ja... ja go widzia�em!
	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_02");	//Kto...? ...to ty, dobrze. Pos�uchaj mnie...
	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_03");	//Nie wolno zbudzi� �ni�cego... Magowie Wody...
	AI_Output(other,self,"GUR_1200_Yberion_LASTWORDS_Info_15_04");	//Co z nimi?
	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_05");	//Musisz si� uda� do Mag�w Wody. Oni znajd� drog� do wolno�ci.
	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_06");	//�ni�cy... Widzia�em go. To... to... to demon!
	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_07");	//Je�li dalej zale�y ci na zniszczeniu Bariery... ruszaj do Nowego Obozu. Powiadom ich o kamieniu. Przeka� im...
	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_08");	//...przeka� im, �e dowiedzieli�my si�, jak na�adowa� te kamienie, one... one powinny m�c wysadzi� Barier�... musicie...
	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_09");	//...nie da�... rozbudzi�... ca�e to z�o...
	AI_StopProcessInfos(self);
};

