
instance DIA_STT_331_Fingers_Exit(C_Info)
{
	npc = STT_331_Fingers;
	nr = 999;
	condition = DIA_STT_331_Fingers_Exit_Condition;
	information = DIA_STT_331_Fingers_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_STT_331_Fingers_Exit_Condition()
{
	return 1;
};

func void DIA_STT_331_Fingers_Exit_Info()
{
	AI_StopProcessInfos(self);
};


var int Fingers_CanTeach;

instance DIA_Fingers_BecomeShadow(C_Info)
{
	npc = STT_331_Fingers;
	nr = 2;
	condition = DIA_Fingers_BecomeShadow_Condition;
	information = DIA_Fingers_BecomeShadow_Info;
	permanent = 1;
	description = "Chcê zostaæ Cieniem.";
};


func int DIA_Fingers_BecomeShadow_Condition()
{
	if((Fingers_CanTeach == FALSE) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void DIA_Fingers_BecomeShadow_Info()
{
	AI_Output(other,self,"DIA_Fingers_BecomeShadow_15_00");	//Chcê zostaæ Cieniem.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_05_01");	//I co z tego?
	Info_ClearChoices(DIA_Fingers_BecomeShadow);
	Info_AddChoice(DIA_Fingers_BecomeShadow,DIALOG_BACK,DIA_Fingers_BecomeShadow_BACK);
	if(Npc_KnowsInfo(hero,Info_Diego_Teachers))
	{
		Info_AddChoice(DIA_Fingers_BecomeShadow,"Szukam kogoœ, kto móg³by mnie czegoœ nauczyæ.",DIA_Fingers_BecomeShadow_TeachMe);
	};
	Info_AddChoice(DIA_Fingers_BecomeShadow,"Mo¿esz mi pomóc?",DIA_Fingers_BecomeShadow_AnyTips);
};

func void DIA_Fingers_BecomeShadow_BACK()
{
	Info_ClearChoices(DIA_Fingers_BecomeShadow);
};

func void DIA_Fingers_BecomeShadow_AnyTips()
{
	AI_Output(other,self,"DIA_Fingers_BecomeShadow_AnyTips_15_00");	//Mo¿esz mi pomóc?
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_AnyTips_05_01");	//Nie mam pojêcia jak to zrobiæ...
};

func void DIA_Fingers_BecomeShadow_TeachMe()
{
	AI_Output(other,self,"DIA_Fingers_BecomeShadow_TeachMe_15_00");	//Szukam kogoœ, kto móg³by mnie czegoœ nauczyæ.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_01");	//To dlaczego przyszed³eœ do mnie?
	AI_Output(other,self,"DIA_Fingers_BecomeShadow_TeachMe_15_02");	//Przys³a³ mnie Diego.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_03");	//Trzeba by³o mówiæ tak od razu.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_04");	//Jeœli chcesz do³¹czyæ do naszego obozu, powinieneœ byæ dobrym wojownikiem albo zrêcznym z³odziejem.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_05");	//Wp³ywowi ludzie z Obozu bêd¹ mieli dla ciebie ró¿ne zlecenia, podczas wykonywania których lepiej nie daæ siê z³apaæ.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_06");	//Dlatego na pocz¹tek proponowa³bym ci szkolenie siê w fachu z³odziejskim.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_07");	//Zupe³nym przypadkiem, tak siê sk³ada, ¿e jestem najlepszym z³odziejem w ca³ym Starym Obozie.
	Fingers_CanTeach = TRUE;
	Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
	B_LogEntry(GE_TeacherOC,"R¹czka mo¿e mnie nauczyæ otwierania zamków i kradzie¿y kieszonkowej.");
	Info_ClearChoices(DIA_Fingers_BecomeShadow);
};


var int Fingers_Wherecavalorn;

instance DIA_Fingers_Lehrer(C_Info)
{
	npc = STT_331_Fingers;
	nr = 2;
	condition = DIA_Fingers_Lehrer_Condition;
	information = DIA_Fingers_Lehrer_Info;
	permanent = 1;
	description = "Czego mo¿esz mnie nauczyæ?";
};


func int DIA_Fingers_Lehrer_Condition()
{
	if(Fingers_CanTeach == TRUE)
	{
		return 1;
	};
};

func void DIA_Fingers_Lehrer_Info()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_15_00");	//Czego mo¿esz mnie nauczyæ?
	AI_Output(self,other,"DIA_Fingers_Lehrer_05_02");	//To zale¿y tylko od tego, co chcia³byœ wiedzieæ.
	Info_ClearChoices(DIA_Fingers_Lehrer);
	Info_AddChoice(DIA_Fingers_Lehrer,DIALOG_BACK,DIA_Fingers_Lehrer_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 1)
	{
		Info_AddChoice(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2,LPCOST_TALENT_PICKPOCKET_2,0),DIA_Fingers_Lehrer_Pickpocket2);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 0)
	{
		Info_AddChoice(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1,LPCOST_TALENT_PICKPOCKET_1,0),DIA_Fingers_Lehrer_Pickpocket);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == 1)
	{
		Info_AddChoice(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2,LPCOST_TALENT_PICKLOCK_2,0),DIA_Fingers_Lehrer_Lockpick2);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == 0)
	{
		Info_AddChoice(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1,LPCOST_TALENT_PICKLOCK_1,0),DIA_Fingers_Lehrer_Lockpick);
	};
	Info_AddChoice(DIA_Fingers_Lehrer,"Chcia³bym umieæ poruszaæ siê niepostrze¿enie.",DIA_Fingers_Lehrer_Schleichen);
};

func void DIA_Fingers_Lehrer_Schleichen()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_Schleichen_15_00");	//Chcia³bym umieæ poruszaæ siê niepostrze¿enie.
	AI_Output(self,other,"DIA_Fingers_Lehrer_Schleichen_05_01");	//Myœlê - bez ¿adnej fa³szywej skromnoœci - ¿e jestem jednym z najlepszych z³odziei zrzuconych do tej przeklêtej kolonii.
	AI_Output(self,other,"DIA_Fingers_Lehrer_Schleichen_05_02");	//Ale jeœli chodzi o skradanie siê, powinieneœ porozmawiaæ z Cavalornem.
	Fingers_Wherecavalorn = TRUE;
};

func void DIA_Fingers_Lehrer_Lockpick()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_Lockpick_15_00");	//Chcia³bym nauczyæ siê otwieraæ zamki.
	if(B_GiveSkill(other,NPC_TALENT_PICKLOCK,1,LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick_05_01");	//Nie w¹tpiê! Có¿... Pocz¹tki nie s¹ zbyt trudne.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick_05_02");	//Przede wszystkim musisz uwa¿aæ, ¿eby nie z³amaæ wytrycha.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick_05_03");	//Musisz byæ bardzo cierpliwy. Wtedy nie bêdziesz potrzebowa³ tylu wytrychów, he he!
	};
};

func void DIA_Fingers_Lehrer_Lockpick2()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_Lockpick2_15_00");	//Chcia³bym zostaæ ekspertem w otwieraniu zamków.
	if(B_GiveSkill(other,NPC_TALENT_PICKLOCK,2,LPCOST_TALENT_PICKLOCK_2))
	{
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick2_05_01");	//Gdy nabierzesz ju¿ trochê doœwiadczenia, nauczysz siê rozpoznawaæ dŸwiêk, jaki wydaje wytrych zanim pêknie.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick2_05_02");	//Myœlê, ¿e powinieneœ sobie z tym poradziæ. Ws³uchaj siê uwa¿nie w dŸwiêki jakie wydaje otwierany zamek, a nie bêdziesz potrzebowa³ tylu wytrychów, he, he!
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick2_05_03");	//Prawdziwy mistrz w tym fachu potrafi otworzyæ ka¿d¹ skrzyniê nie ³ami¹c ani jednego wytrycha.
	};
};

func void DIA_Fingers_Lehrer_Pickpocket()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_PICKPOCKET_15_00");	//Chcia³bym zostaæ zrêcznym kieszonkowcem!
	if(Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == 1)
	{
		if(B_GiveSkill(other,NPC_TALENT_PICKPOCKET,1,LPCOST_TALENT_PICKPOCKET_1))
		{
			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_01");	//Chcia³byœ odci¹¿yæ parê osób z ich dobytku, co? No dobra.
			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_02");	//Poka¿ê ci na czym powinieneœ siê skoncentrowaæ, ale szanse, ¿e zostaniesz z³apany bêd¹ nadal znaczne.
			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_03");	//Podejmuj ryzyko wy³¹cznie jeœli w pobli¿u ofiary nie ma osób trzecich.
			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_04");	//Tylko prawdziwy mistrz potrafi ukraœæ coœ pozostaj¹c ca³kowicie niezauwa¿onym!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Fingers_lehrer_Pickpocket_05_05");	//Nie ma o czym mówiæ! Nie bêdzie z ciebie z³odzieja, dopóki nie nauczysz siê skradaæ!
	};
};

func void DIA_Fingers_Lehrer_Pickpocket2()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_Pickpocket2_15_00");	//Chcia³bym zostaæ mistrzem kieszonkowców!
	if(B_GiveSkill(other,NPC_TALENT_PICKPOCKET,2,LPCOST_TALENT_PICKPOCKET_2))
	{
		AI_Output(self,other,"DIA_Fingers_Lehrer_Pickpocket2_05_01");	//Có¿, chyba rzeczywiœcie potrafisz ju¿ wystarczaj¹co du¿o, ¿eby opanowaæ zaawansowane sztuczki.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Pickpocket2_05_02");	//Ale musisz pamiêtaæ, ¿e nawet mistrzowie z³odziejscy od czasu do czasu zostaj¹ z³apani.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Pickpocket2_05_03");	//Uwa¿aj na siebie.
	};
};

func void DIA_Fingers_Lehrer_BACK()
{
	Info_ClearChoices(DIA_Fingers_Lehrer);
};


instance DIA_Fingers_WhereCavalorn(C_Info)
{
	npc = STT_331_Fingers;
	nr = 2;
	condition = DIA_Fingers_WhereCavalorn_Condition;
	information = DIA_Fingers_WhereCavalorn_Info;
	permanent = 1;
	description = "Gdzie znajdê Cavalorna?";
};


func int DIA_Fingers_WhereCavalorn_Condition()
{
	if(Fingers_Wherecavalorn == TRUE)
	{
		return 1;
	};
};

func void DIA_Fingers_WhereCavalorn_Info()
{
	AI_Output(other,self,"DIA_Fingers_WhereCavalorn_15_00");	//Gdzie znajdê Cavalorna?
	AI_Output(self,other,"DIA_Fingers_WhereCavalorn_05_01");	//Poluje gdzieœ poza Obozem. Pewnie znajdziesz go na drodze do Nowego Obozu. Na zachód st¹d jest taki kanion.
	AI_Output(self,other,"DIA_Fingers_WhereCavalorn_05_02");	//Tam znajdziesz opuszczon¹ chatê drwala. Cavalorn powinien krêciæ siê w jej pobli¿u.
	B_LogEntry(GE_TeacherOW,"Cavalorn mo¿e mi pokazaæ, jak nale¿y siê skradaæ. Jego chata znajduje siê w kanionie, na zachód od Starego Obozu.");
};


var int Fingers_Learnt;

instance DIA_Fingers_Learnt(C_Info)
{
	npc = STT_331_Fingers;
	nr = 2;
	condition = DIA_Fingers_Learnt_Condition;
	information = DIA_Fingers_Learnt_Info;
	permanent = 1;
	description = "Nie móg³byœ wstawiæ siê za mn¹ u Diego?";
};


func int DIA_Fingers_Learnt_Condition()
{
	if((Fingers_Learnt != LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void DIA_Fingers_Learnt_Info()
{
	AI_Output(other,self,"DIA_Fingers_Learnt_15_00");	//Nie móg³byœ wstawiæ siê za mn¹ u Diego?
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) + Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) + Npc_GetTalentSkill(other,NPC_TALENT_SNEAK)) > 0)
	{
		AI_Output(self,other,"DIA_Fingers_Learnt_05_01");	//Czemu nie. Nauczy³eœ siê czegoœ, co czyni ciê przydatnym dla Starego Obozu.
		AI_Output(self,other,"DIA_Fingers_Learnt_05_02");	//Zrêcznych z³odziei nigdy nie za wiele. Mo¿esz na mnie liczyæ.
		Fingers_Learnt = LOG_SUCCESS;
		B_GiveXP(XP_Fingerstrain);
		B_LogEntry(CH1_JoinOC,"R¹czka jest bardzo zadowolony z postêpów, które poczyni³em.");
	}
	else
	{
		AI_Output(self,other,"DIA_Fingers_Learnt_05_03");	//To zale¿y...
		AI_Output(self,other,"DIA_Fingers_Learnt_05_04");	//Jeœli udowodnisz, ¿e nauczy³eœ siê czegoœ w z³odziejskim fachu, uznam, ¿e bêdzie z ciebie jakiœ po¿ytek.
		AI_Output(other,self,"DIA_Fingers_Learnt_15_05");	//Jak mam to niby zrobiæ?
		AI_Output(self,other,"DIA_Fingers_Learnt_05_06");	//Wyucz siê którejœ ze z³odziejskich umiejêtnoœci. Naucz siê skradaæ niepostrze¿enie, okradaæ ludzi albo otwieraæ zamki. Wtedy bêdziesz móg³ liczyæ na mój g³os.
		Fingers_Learnt = LOG_RUNNING;
		B_LogEntry(CH1_JoinOC,"R¹czka wstawi siê za mn¹, jeœli wyuczê siê jakiejœ z³odziejskiej umiejêtnoœci.");
	};
};


instance dia_fingers_hunosschwert(C_Info)
{
	npc = STT_331_Fingers;
	nr = 2;
	condition = dia_fingers_hunosschwert_condition;
	information = dia_fingers_hunosschwert_info;
	permanent = 0;
	description = "Co wiesz o mieczu Huno?";
};


func int dia_fingers_hunosschwert_condition()
{
	if(huno_swordsold == TRUE)
	{
		return 1;
	};
};

func void dia_fingers_hunosschwert_info()
{
	AI_Output(other,self,"DIA_Fingers_HunosSchwert_15_00");	//Co wiesz o mieczu Huno?
	AI_Output(self,other,"DIA_Fingers_HunosSchwert_05_01");	//A czemu w ogóle mia³bym coœ wiedzieæ?
	AI_Output(other,self,"DIA_Fingers_HunosSchwert_05_02");	//Fisk mi o tobie wspomina³.
	AI_Output(self,other,"DIA_Fingers_HunosSchwert_05_03");	//No, skoro tak...
	AI_Output(self,other,"DIA_Fingers_HunosSchwert_05_04");	//Nie tak dawno obznajomi³em takiego jednego w otwieraniu zamków.
	AI_Output(self,other,"DIA_Fingers_HunosSchwert_05_05");	//Wnioskujê, ¿e w³aœnie u niego móg³byœ znaleŸæ to czego szukasz.
	AI_Output(self,other,"DIA_Fingers_HunosSchwert_05_06");	//Nazywa siê Jesse.
	AI_Output(other,self,"DIA_Fingers_HunosSchwert_05_07");	//Dziêki, trzymaj siê.
	B_LogEntry(CH1_HUNOLOSTSWORD,"R¹czka powiedzia³ mi, ¿e powinienem pogadaæ z Kopaczem imieniem Jesse. Ponoæ wie wiêcej na temat tego miecza.");
};


instance DIA_FINGERS_QUEST(C_Info)
{
	npc = STT_331_Fingers;
	nr = 2;
	condition = dia_fingers_quest_condition;
	information = dia_fingers_quest_info;
	permanent = 0;
	important = 1;
};


func int dia_fingers_quest_condition()
{
	if((Fingers_Learnt == LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_STT))
	{
		return 1;
	};
};

func void dia_fingers_quest_info()
{
	AI_Output(self,other,"DIA_Fingers_Quest_15_00");	//Widzê, ¿e ci siê uda³o i teraz jesteœ jednym z Cieni. Dobra robota. Nie myli³em siê co do ciebie.
	AI_Output(self,other,"DIA_Fingers_Quest_15_01");	//I có¿, w takim wypadku mia³bym nawet robótkê dla takiego dobrego z³odzieja.
	AI_Output(other,self,"DIA_Fingers_Quest_15_02");	//Mia³byœ coœ dla mnie? W czym rzecz?
	AI_Output(self,other,"DIA_Fingers_Quest_15_03");	//Chcê, byœ uda³ siê do Nowego Obozu. Znajdziesz tam cz³owieka, którego zowi¹ Lares. To przywódca tamtejszych Szkodników.
	AI_Output(self,other,"DIA_Fingers_Quest_15_04");	//Wiem, ¿e jest on w posiadaniu magicznego pierœcienia, który dodaje mu si³.
	AI_Output(self,other,"DIA_Fingers_Quest_15_05");	//W³aœnie z tego powodu chcia³bym, ¿ebyœ mu podiwani³ ten pierœcieñ. U mnie sprawdzi siê on zdecydowanie lepiej.
	AI_Output(self,other,"DIA_Fingers_Quest_15_06");	//Tylko pod ¯ADNYM pozorem nie daj siê z³apaæ. Jeœli Lares nakryje ciê na kradzie¿y, pewnie zaraz podburzy przeciw tobie po³owê obozu.
	AI_Output(self,other,"DIA_Fingers_Quest_15_07");	//Tak wiêc uwa¿aj na siebie. Aczkolwiek jestem pewny, ¿e nie mylê siê co do twoich umiejêtnoœci. Zale¿nie od tego, jak dobrze poradzisz sobie z t¹ spraw¹, mo¿e znajdê jeszcze dla ciebie coœ do zrobienia.
	AI_Output(self,other,"DIA_Fingers_Quest_15_08");	//Ale póki co wypraw siê do Nowego Obozu. Twoje zadanie ju¿ na ciebie czeka.
	fingers_ring = LOG_RUNNING;
	Log_CreateTopic(CH1_FINGERSTHIEF,LOG_MISSION);
	Log_SetTopicStatus(CH1_FINGERSTHIEF,LOG_RUNNING);
	B_LogEntry(CH1_FINGERSTHIEF,"R¹czka poprosi³ mnie, bym odwiedzi³ przywódcê Szkodników z Nowego Obozu, niejakiego Laresa. Ponoæ jest w posiadaniu magicznego pierœcienia, który dodaje mu si³. R¹czka chce, bym go sobie przyw³aszczy³.");
};


instance DIA_FINGERS_SUCCESS(C_Info)
{
	npc = STT_331_Fingers;
	nr = 1;
	condition = dia_fingers_success_condition;
	information = dia_fingers_success_info;
	permanent = 0;
	important = 0;
	description = "Mam przy sobie pierœcieñ Laresa.";
};


func int dia_fingers_success_condition()
{
	if((fingers_ring == LOG_RUNNING) && (Npc_HasItems(other,Lares_Ring) >= 1))
	{
		return 1;
	};
};

func void dia_fingers_success_info()
{
	AI_Output(other,self,"DIA_Fingers_SUCCESS_15_00");	//Mam przy sobie pierœcieñ Laresa.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_10");	//Naprawdê? Wiedzia³em, ¿e zwróci³em siê do w³aœciwego cz³owieka!
	AI_Output(other,self,"DIA_Fingers_SUCCESS_15_20");	//Mianowicie?
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_30");	//Znowu chodzi o Szkodnika z Nowego Obozu.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_40");	//Facet nazywa siê Klin i jest jednym z najlepszych z³odziei w obozie.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_50");	//No, przynajmniej za takiego siê podaje.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_60");	//I có¿, mogê nieco straciæ swoj¹ reputacjê, dlatego dobrze by by³o, gdyby ktoœ zadba³ o to, ¿eby Klin straci³ swoj¹.
	AI_Output(other,self,"DIA_Fingers_SUCCESS_15_70");	//I tutaj do gry wkraczam ja.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_80");	//Otó¿ to. W Nowym Obozie jest pewien cz³owiek, którego wo³aj¹ Butch. Mówi siê, ¿e jest jednym z najpodlejszych Szkodników.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_90");	//Wiem, ¿e jest w posiadaniu amuletu, na którym widnieje jego imiê.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_11");	//Masz mu ten amulet zwêdziæ, a potem przemyciæ do kieszeni Klina.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_12");	//Jak tylko Klin wejdzie w posiadanie tego amuletu, mówisz o tym Butchowi.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_13");	//Ca³a reszta za³atwi siê sama.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_14");	//Z³odziej, który okrada swoich w³asnych sojuszników, nie ma co liczyæ w przysz³oœci na dobre imiê.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_15");	//Wróæ do mnie, kiedy tylko wykonasz zadanie.
	AI_StopProcessInfos(self);
	fingers_ring = LOG_SUCCESS;
	B_GiveXP(XP_FINGERSQUESTONE);
	Log_SetTopicStatus(CH1_FINGERSTHIEF,LOG_SUCCESS);
	B_LogEntry(CH1_FINGERSTHIEF,"Przynios³em R¹czce jego po¿¹dany pierœcieñ. Wydawa³ siê byæ bardzo zadowolony i wynagrodzi³ mnie w postaci kilku bry³ek rudy.");
	CreateInvItems(self,ItMiNugget,30);
	B_GiveInvItems(self,other,ItMiNugget,30);
	fingers_thief = LOG_RUNNING;
	Log_CreateTopic(CH1_THIEFS,LOG_MISSION);
	Log_SetTopicStatus(CH1_THIEFS,LOG_RUNNING);
	B_LogEntry(CH1_THIEFS,"R¹czka poprosi³ mnie, bym uda³ siê do Nowego Obozu i odszuka³ tam Szkodnika imieniem Klin. Mam za zadanie przemyciæ amulet do jego kieszeni od niejakiego Butcha. Na koniec mam poinformowaæ Butcha o tym w taki sposób, by Klin dosta³ porz¹dn¹ nauczkê, a R¹czka zachowa³ swoj¹ reputacjê.");
};


instance DIA_FINGERS_BUTCH(C_Info)
{
	npc = STT_331_Fingers;
	nr = 1;
	condition = dia_fingers_butch_condition;
	information = dia_fingers_butch_info;
	permanent = 0;
	important = 0;
	description = "Klin ju¿ nigdy nie bêdzie okreœlany mistrzem...";
};


func int dia_fingers_butch_condition()
{
	if(Npc_KnowsInfo(hero,dia_butch_hey))
	{
		return 1;
	};
};

func void dia_fingers_butch_info()
{
	var int zufallsbelohnung;
	AI_Output(other,self,"DIA_Fingers_Butch_15_01");	//Coœ mi siê zdaje, ¿e Klin ju¿ nigdy nie bêdzie okreœlany mistrzem z³odziejskiego fachu.
	AI_Output(self,other,"DIA_Fingers_Butch_15_02");	//Czyli podzia³a³o? Dobra robota. Myœlê, ¿e tym razem zas³u¿y³eœ sobie na nieco pokaŸniejsz¹ nagrodê.
	AI_Output(self,other,"DIA_Fingers_Butch_15_03");	//Niemniej jednak nasza wspó³praca skoñczy siê dopiero, gdy Nowy Obóz baczniej zwróci na nas uwagê.
	AI_Output(self,other,"DIA_Fingers_Butch_15_04");	//Kto wie, mo¿e w przysz³oœci znowu bêdê potrzebowa³ twojej pomocy. Czas poka¿e.
	AI_Output(other,self,"DIA_Fingers_Butch_15_05");	//Dziêki.
	AI_Output(self,other,"DIA_Fingers_Butch_15_06");	//I nie zapominaj - najlepsi Cienie wype³niaj¹ swoje zadania bez wzbudzania podejrzeñ, jak gdyby coœ siê zmieni³o. Ukradkiem, cicho i w tajemnicy...
	AI_StopProcessInfos(self);
	B_GiveXP(XP_FINGERSQUESTTWO);
	zufallsbelohnung = Hlp_Random(100);
	if(zufallsbelohnung >= 75)
	{
		CreateInvItems(self,Schutzring_Waffen1,1);
		B_GiveInvItems(self,other,Schutzring_Waffen1,1);
	}
	else if(zufallsbelohnung >= 60)
	{
		CreateInvItems(self,Schutzring_Geschosse2,1);
		B_GiveInvItems(self,other,Schutzring_Geschosse2,1);
	}
	else if(zufallsbelohnung >= 50)
	{
		CreateInvItem(self,ItMi_Alchemy_Syrianoil_01);
		B_GiveInvItems(self,hero,ItMi_Alchemy_Syrianoil_01,1);
	}
	else if(zufallsbelohnung >= 40)
	{
		CreateInvItems(self,ItRw_Bow_Small_05,1);
		B_GiveInvItems(self,other,ItRw_Bow_Small_05,1);
	}
	else if(zufallsbelohnung >= 30)
	{
		CreateInvItems(self,ItMw_1H_Sword_04,1);
		B_GiveInvItems(self,other,ItMw_1H_Sword_04,1);
	}
	else if(zufallsbelohnung >= 20)
	{
		CreateInvItems(self,ItMiNugget,150);
		B_GiveInvItems(self,other,ItMiNugget,150);
	}
	else if(zufallsbelohnung >= 10)
	{
		CreateInvItem(self,ItFo_Potion_Dex_01);
		B_GiveInvItems(self,hero,ItFo_Potion_Dex_01,1);
	};
	fingers_thief = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_THIEFS,LOG_SUCCESS);
	B_LogEntry(CH1_THIEFS,"R¹czka by³ zachwycony z moich poczynañ i wrêczy³ mi przyzwoit¹ nagrodê. Na koniec doda³, ¿e nasza wspó³praca zakoñczy siê dopiero, kiedy Nowy Obóz nabierze jakichœ podejrzeñ.");
};

