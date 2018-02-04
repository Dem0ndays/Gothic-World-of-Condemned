
instance DIA_Cutter_Exit(C_Info)
{
	npc = GRD_208_Cutter;
	nr = 999;
	condition = DIA_Cutter_Exit_Condition;
	information = DIA_Cutter_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Cutter_Exit_Condition()
{
	return 1;
};

func void DIA_Cutter_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Cutter_Hello(C_Info)
{
	npc = GRD_208_Cutter;
	nr = 1;
	condition = DIA_Cutter_Hello_Condition;
	information = DIA_Cutter_Hello_Info;
	permanent = 0;
	description = "Wasz zamek jest bardzo du¿y.";
};


func int DIA_Cutter_Hello_Condition()
{
	if(!C_NpcBelongsToOldCamp(other))
	{
		return 1;
	};
};

func void DIA_Cutter_Hello_Info()
{
	AI_Output(other,self,"DIA_Cutter_Hello_15_00");	//Wasz zamek jest bardzo du¿y.
	AI_Output(self,other,"DIA_Cutter_Hello_08_01");	//Chyba ciê jeszcze tutaj nie widzia³em. Kim jesteœ?
	AI_Output(other,self,"DIA_Cutter_Hello_15_02");	//Jestem tu nowy. Chcia³em siê trochê rozejrzeæ.
};


instance DIA_Cutter_Burg(C_Info)
{
	npc = GRD_208_Cutter;
	nr = 1;
	condition = DIA_Cutter_Burg_Condition;
	information = DIA_Cutter_Burg_Info;
	permanent = 0;
	description = "Mo¿esz mi opowiedzieæ o tym zamku?";
};


func int DIA_Cutter_Burg_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Cutter_Hello))
	{
		return 1;
	};
};

func void DIA_Cutter_Burg_Info()
{
	AI_Output(other,self,"DIA_Cutter_Burg_15_00");	//Mo¿esz mi opowiedzieæ o tym zamku?
	AI_Output(self,other,"DIA_Cutter_Burg_08_01");	//Co tu du¿o mówiæ: Gomez i jego ludzie zajêli go po wielkim buncie.
	AI_Output(self,other,"DIA_Cutter_Burg_08_02");	//Od pocz¹tku wiedzia³em, ¿e warto bêdzie stan¹æ po jego stronie.
	AI_Output(self,other,"DIA_Cutter_Burg_08_03");	//Wielu z nas, jeszcze jako wiêŸniowie zamkniêci w lochach lub zmuszani do pracy w kopalni, uznawa³o zwierzchnictwo Gomeza.
	AI_Output(other,self,"DIA_Cutter_Burg_15_04");	//Czy te lochy znajduj¹ siê pod zamkiem?
	AI_Output(self,other,"DIA_Cutter_Burg_08_05");	//Tak, ale teraz œwiec¹ pustk¹. Nikt tam nie schodzi³ od czasu wielkiego buntu.
};


instance DIA_Cutter_PERM(C_Info)
{
	npc = GRD_208_Cutter;
	nr = 1;
	condition = DIA_Cutter_PERM_Condition;
	information = DIA_Cutter_PERM_Info;
	permanent = 1;
	description = "Jak wygl¹da ¿ycie stra¿nika?";
};


func int DIA_Cutter_PERM_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Cutter_Burg))
	{
		return 1;
	};
};

func void DIA_Cutter_PERM_Info()
{
	AI_Output(other,self,"DIA_Cutter_PERM_15_00");	//Jak wygl¹da ¿ycie stra¿nika?
	AI_Output(self,other,"DIA_Cutter_PERM_08_01");	//Jest spokojne. Jesteœmy najwiêkszym i najsilniejszym obozem w kolonii. Nikt nie œmie nas zaczepiaæ.
	AI_Output(other,self,"DIA_Cutter_PERM_15_02");	//Rozumiem.
};


instance GRD_208_Cutter_WELCOME(C_Info)
{
	npc = GRD_208_Cutter;
	condition = GRD_208_Cutter_WELCOME_Condition;
	information = GRD_208_Cutter_WELCOME_Info;
	important = 1;
	permanent = 0;
};


func int GRD_208_Cutter_WELCOME_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return TRUE;
	};
};

func void GRD_208_Cutter_WELCOME_Info()
{
	AI_Output(self,other,"GRD_208_Cutter_WELCOME_Info_08_01");	//Dokona³eœ w³aœciwego wyboru. Spodoba ci siê bycie Stra¿nikiem!
	AI_StopProcessInfos(self);
};


instance DIA_CUTTER_GUY(C_Info)
{
	npc = GRD_208_Cutter;
	nr = 1;
	condition = dia_cutter_guy_condition;
	information = dia_cutter_guy_info;
	permanent = 0;
	important = 1;
};


func int dia_cutter_guy_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_STT)
	{
		return 1;
	};
};

func void dia_cutter_guy_info()
{
	AI_Output(self,other,"DIA_Cutter_GUY_15_00");	//Ej, ty! PodejdŸ no tu.
	AI_Output(other,self,"DIA_Cutter_GUY_08_01");	//Czego chcesz?
	AI_Output(self,other,"DIA_Cutter_GUY_15_02");	//A wiêc Gomez ciê przyj¹³? Dobra robota.
	AI_Output(self,other,"DIA_Cutter_GUY_08_02");	//Skoro ju¿ tu jesteœ, mogê ci te¿ daæ robotê od rêki.
	AI_Output(self,other,"DIA_Cutter_GUY_08_03");	//Niedawno dotar³a w³aœnie dostawa z zewnêtrznego œwiata, a wœród niej znalaz³a siê te¿ nowa twarz.
	AI_Output(self,other,"DIA_Cutter_GUY_08_04");	//Bez obaw, Bullit i jego ch³opcy ju¿ go ochrzcili. Hehe.
	AI_Output(self,other,"DIA_Cutter_GUY_08_05");	//Ale widocznie typek sam do tego miejsca drogi nie znajdzie. W ka¿dym razie jeszcze siê tu nie pojawi³.
	AI_Output(self,other,"DIA_Cutter_GUY_08_06");	//Dlatego przejdŸ siê na plac wymian i przekonaj jegomoœcia, ¿e najlepszym miejscem dla niego bêdzie Stary Obóz.
	AI_Output(self,other,"DIA_Cutter_GUY_08_07");	//Jak to zrobisz to ju¿ twoja sprawa, ale nie powinno ci to sprawiæ wiêkszych problemów. Bullit mówi³, ¿e ten goœæ ma jeszcze mleko pod nosem.
	AI_Output(self,other,"DIA_Cutter_GUY_08_08");	//Poœlij go bezpoœrednio do naszego obozu, przyda nam siê ka¿dy Kopacz do roboty w kopalni. Hehe.
	Wld_InsertNpc(non_5054_paul,"OC_1");
	paul_oc = LOG_RUNNING;
	Log_CreateTopic(CH1_PAULOC,LOG_MISSION);
	Log_SetTopicStatus(CH1_PAULOC,LOG_RUNNING);
	B_LogEntry(CH1_PAULOC,"Siekacz, jeden ze Stra¿ników Gomeza, rozkaza³ mi udaæ siê na plac wymian. Powiedzia³, ¿e przyby³a w³aœnie nowa dostawa z zewnêtrznego œwiata i do tego nowa twarz. Zdaje siê jednak, ¿e nie dotar³ jeszcze do Starego Obozu, dlatego te¿ mam siê przejœæ na plac wymian i sprawdziæ co jest grane.");
};


instance dia_cutter_success(C_Info)
{
	npc = GRD_208_Cutter;
	nr = 1;
	condition = dia_cutter_success_condition;
	information = dia_cutter_success_info;
	permanent = 0;
	important = 0;
	description = "Paul jest teraz w obozie.";
};


func int dia_cutter_success_condition()
{
	if(paul_oc == LOG_SUCCESS)
	{
		return 1;
	};
};

func void dia_cutter_success_info()
{
	AI_Output(other,self,"DIA_Cutter_SUCCESS_15_00");	//Paul jest teraz w obozie.
	AI_Output(self,other,"DIA_Cutter_SUCCESS_08_01");	//Ten nowy? Dobra robota. Gomez bêdzie zachwycony.
	AI_Output(self,other,"DIA_Cutter_SUCCESS_15_02");	//Trzymaj, zas³u¿y³eœ sobie.
	CreateInvItems(self,ItMiNugget,75);
	B_GiveInvItems(self,other,ItMiNugget,75);
	AI_StopProcessInfos(self);
};


instance DIA_CUTTER_FAIL(C_Info)
{
	npc = GRD_208_Cutter;
	nr = 1;
	condition = dia_cutter_fail_condition;
	information = dia_cutter_fail_info;
	permanent = 0;
	important = 0;
	description = "Paul nie poka¿e siê ju¿ wiêcej w obozie.";
};


func int dia_cutter_fail_condition()
{
	if(paul_oc == LOG_FAILED)
	{
		return 1;
	};
};

func void dia_cutter_fail_info()
{
	AI_Output(other,self,"DIA_Cutter_FAIL_15_00");	//Paul nie poka¿e siê ju¿ wiêcej w obozie.
	AI_Output(self,other,"DIA_Cutter_FAIL_08_01");	//Jak ¿eœ to móg³ têpaku tak spartoliæ? Przecie¿ to jest niemo¿liwe!
	AI_Output(self,other,"DIA_Cutter_FAIL_15_02");	//Ech, szkoda gadaæ, zejdŸ mi z oczu, padalcu!
	AI_StopProcessInfos(self);
};

