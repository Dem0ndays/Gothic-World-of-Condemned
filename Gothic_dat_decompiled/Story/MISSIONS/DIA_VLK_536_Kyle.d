
instance DIA_Kyle_Exit(C_Info)
{
	npc = VLK_536_Kyle;
	nr = 999;
	condition = DIA_Kyle_Exit_Condition;
	information = DIA_Kyle_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Kyle_Exit_Condition()
{
	return 1;
};

func void DIA_Kyle_Exit_Info()
{
	Npc_SetRefuseTalk(self,120);
	AI_StopProcessInfos(self);
};


instance DIA_Kyle_HutRage(C_Info)
{
	npc = VLK_536_Kyle;
	nr = 2;
	condition = DIA_Kyle_HutRage_Condition;
	information = DIA_Kyle_HutRage_Info;
	permanent = 1;
	important = 1;
};


func int DIA_Kyle_HutRage_Condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,other) <= ZivilAnquatschDist) && (herek_kickass != LOG_SUCCESS))
	{
		return 1;
	};
};

func void DIA_Kyle_HutRage_Info()
{
	AI_Output(self,other,"DIA_Kyle_HutRage_10_00");	//Ile razy mam wam powtarzaæ, sukinsyny, ¿ebyœcie nie przebiegali przez moj¹ chatê!
};


instance DIA_Kyle_Problem(C_Info)
{
	npc = VLK_536_Kyle;
	nr = 2;
	condition = DIA_Kyle_Problem_Condition;
	information = DIA_Kyle_Problem_Info;
	permanent = 0;
	description = "Co ciê ugryz³o?";
};


func int DIA_Kyle_Problem_Condition()
{
	return 1;
};

func void DIA_Kyle_Problem_Info()
{
	AI_Output(other,self,"DIA_Kyle_Problem_15_00");	//Co ciê ugryz³o?
	AI_Output(self,other,"DIA_Kyle_Problem_10_01");	//Zostaw mnie w spokoju! Mam was wszystkich serdecznie doœæ!
	AI_Output(self,other,"DIA_Kyle_Problem_10_02");	//Wszystko zaczê³o siê, gdy zbudowa³em sobie tê chatê.
	AI_Output(self,other,"DIA_Kyle_Problem_10_03");	//Wszyscy mówili: nie buduj chaty tak blisko rowu.
	AI_Output(self,other,"DIA_Kyle_Problem_10_04");	//Ale ¿aden z tych sukinkotów nie powiedzia³ mi, co siê mo¿e staæ, jeœli j¹ tu jednak wybudujê!
	AI_Output(self,other,"DIA_Kyle_Problem_10_05");	//Jak wróci³em z kopalni kilka dni temu, mia³em dodatkowe drzwi.
	AI_Output(self,other,"DIA_Kyle_Problem_10_06");	//Banda wieprzy! Nienawidzê ich! Nie wyobra¿asz sobie, jak ja ich NIENAWIDZÊ!!!
	AI_Output(self,other,"DIA_Kyle_Problem_10_07");	//Teraz wszyscy prze³a¿¹ przez moj¹ chatê jakby nigdy nic. Ka¿dy cholerny dupek!
	AI_Output(self,other,"DIA_Kyle_Problem_10_08");	//Najgorszy jest ten Herek.
	AI_Output(self,other,"DIA_Kyle_Problem_10_09");	//Ten patafian ubzdura³ sobie, ¿e jest tutaj jednym z najtwardszych.
	AI_Output(self,other,"DIA_Kyle_Problem_10_10");	//Ale tak naprawdê nie ró¿ni siê on niczym od tych wszystkich Kopaczy.
};


var int herek_kickass;

instance DIA_KYLE_HEREK(C_Info)
{
	npc = VLK_536_Kyle;
	nr = 2;
	condition = dia_kyle_herek_condition;
	information = dia_kyle_herek_info;
	permanent = 0;
	description = "Co jest nie tak z tym Herekiem?";
};


func int dia_kyle_herek_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Kyle_Problem))
	{
		return 1;
	};
};

func void dia_kyle_herek_info()
{
	AI_Output(other,self,"DIA_Kyle_Herek_15_00");	//Co jest nie tak z tym Herekiem?
	AI_Output(self,other,"DIA_Kyle_Herek_10_01");	//Goœæ przebiega³ sobie kilka dni temu przez moj¹ chatê, jak ka¿dy cholerny dupek tutaj.
	AI_Output(self,other,"DIA_Kyle_Herek_10_02");	//Ale on oczywiœcie musia³ siê jeszcze ze mn¹ pohandryczyæ.
	AI_Output(self,other,"DIA_Kyle_Herek_10_03");	//Gada³, jaki to on nie by³ twardy i jakie rzeczy wyczynia³, zanim tu trafi³.
	AI_Output(self,other,"DIA_Kyle_Herek_10_04");	//Ale by mi siê gêba rozanieli³a, gdyby tylko ta ³ajza dosta³a porz¹dnie po pysku.
	AI_Output(other,self,"DIA_Kyle_Herek_10_05");	//Móg³bym siê zaj¹æ Herekiem.
	AI_Output(self,other,"DIA_Kyle_Herek_10_06");	//Ty? A to ciekawe.
	AI_Output(self,other,"DIA_Kyle_Herek_10_07");	//Powiem ci coœ. Dobierz siê temu kapcanowi do rzyci, a bêdziesz móg³ ju¿ zawsze swobodnie przechodziæ przez moj¹ chatê.
	AI_Output(other,self,"DIA_Kyle_Herek_10_08");	//A nie znalaz³aby siê mo¿e jakaœ... namacalna nagroda?
	AI_Output(self,other,"DIA_Kyle_Herek_10_09");	//A, pal diabli, mogê ci siê jeszcze dorzuciæ 10 bry³ek.
	AI_Output(other,self,"DIA_Kyle_Herek_10_10");	//Ju¿ lepiej.
	AI_Output(self,other,"DIA_Kyle_Herek_10_11");	//No, to zajmij siê ju¿ ³askawie tym osobnikiem.
	herek_kickass = LOG_RUNNING;
	Log_CreateTopic(CH1_KYLE,LOG_MISSION);
	Log_SetTopicStatus(CH1_KYLE,LOG_RUNNING);
	B_LogEntry(CH1_KYLE,"Kyle, jeden z Kopaczy ze Starego Obozu, ma pewne problemy z cz³owiekiem o imieniu Herek. Herek bez pozwolenia prze³azi sobie przez chatê Kyle'a i poprosi³ mnie on, abym go tego oduczy³.");
	VLK_511_Herek.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
};


instance DIA_KYLE_SUCCESS(C_Info)
{
	npc = VLK_536_Kyle;
	nr = 1;
	condition = dia_kyle_success_condition;
	information = dia_kyle_success_info;
	permanent = 0;
	description = "Zaj¹³em siê tym Herekiem.";
};


func int dia_kyle_success_condition()
{
	if((herek_kickass == LOG_RUNNING) && (VLK_511_Herek.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && Npc_KnowsInfo(hero,dia_herek_kyle))
	{
		return 1;
	};
};

func void dia_kyle_success_info()
{
	AI_Output(other,self,"DIA_Kyle_SUCCESS_15_00");	//Zaj¹³em siê tym Herekiem.
	AI_Output(self,other,"DIA_Kyle_SUCCESS_10_01");	//Naprawdê? Mam nadziejê, ¿eœ porz¹dnie mu facjatê przerobi³.
	AI_Output(other,self,"DIA_Kyle_SUCCESS_10_02");	//Co z moj¹ nagrod¹?
	AI_Output(self,other,"DIA_Kyle_SUCCESS_10_03");	//Ach tak, prawda. Oto twoje 10 bry³ek.
	AI_Output(self,other,"DIA_Kyle_SUCCESS_10_04");	//I oczywiœcie od teraz mo¿esz sobie swobodnie przechodziæ przez moj¹ chatê.
	CreateInvItems(self,ItMiNugget,10);
	B_GiveInvItems(self,other,ItMiNugget,10);
	herek_kickass = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_KYLE,LOG_SUCCESS);
	B_LogEntry(CH1_KYLE,"Kyle by³ wielce zadowolony, ¿e udzieli³em Herekowi porz¹dnej lekcji. Jako nagrodê podarowa³ mi 10 bry³ek oraz mo¿liwoœæ swobodnego przechodzenia przez jego chatê.");
	B_GiveXP(XP_KYLEPROBLEM);
};

