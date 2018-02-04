
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
	AI_Output(self,other,"DIA_Kyle_HutRage_10_00");	//Ile razy mam wam powtarza�, sukinsyny, �eby�cie nie przebiegali przez moj� chat�!
};


instance DIA_Kyle_Problem(C_Info)
{
	npc = VLK_536_Kyle;
	nr = 2;
	condition = DIA_Kyle_Problem_Condition;
	information = DIA_Kyle_Problem_Info;
	permanent = 0;
	description = "Co ci� ugryz�o?";
};


func int DIA_Kyle_Problem_Condition()
{
	return 1;
};

func void DIA_Kyle_Problem_Info()
{
	AI_Output(other,self,"DIA_Kyle_Problem_15_00");	//Co ci� ugryz�o?
	AI_Output(self,other,"DIA_Kyle_Problem_10_01");	//Zostaw mnie w spokoju! Mam was wszystkich serdecznie do��!
	AI_Output(self,other,"DIA_Kyle_Problem_10_02");	//Wszystko zacz�o si�, gdy zbudowa�em sobie t� chat�.
	AI_Output(self,other,"DIA_Kyle_Problem_10_03");	//Wszyscy m�wili: nie buduj chaty tak blisko rowu.
	AI_Output(self,other,"DIA_Kyle_Problem_10_04");	//Ale �aden z tych sukinkot�w nie powiedzia� mi, co si� mo�e sta�, je�li j� tu jednak wybuduj�!
	AI_Output(self,other,"DIA_Kyle_Problem_10_05");	//Jak wr�ci�em z kopalni kilka dni temu, mia�em dodatkowe drzwi.
	AI_Output(self,other,"DIA_Kyle_Problem_10_06");	//Banda wieprzy! Nienawidz� ich! Nie wyobra�asz sobie, jak ja ich NIENAWIDZ�!!!
	AI_Output(self,other,"DIA_Kyle_Problem_10_07");	//Teraz wszyscy prze�a�� przez moj� chat� jakby nigdy nic. Ka�dy cholerny dupek!
	AI_Output(self,other,"DIA_Kyle_Problem_10_08");	//Najgorszy jest ten Herek.
	AI_Output(self,other,"DIA_Kyle_Problem_10_09");	//Ten patafian ubzdura� sobie, �e jest tutaj jednym z najtwardszych.
	AI_Output(self,other,"DIA_Kyle_Problem_10_10");	//Ale tak naprawd� nie r�ni si� on niczym od tych wszystkich Kopaczy.
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
	AI_Output(self,other,"DIA_Kyle_Herek_10_01");	//Go�� przebiega� sobie kilka dni temu przez moj� chat�, jak ka�dy cholerny dupek tutaj.
	AI_Output(self,other,"DIA_Kyle_Herek_10_02");	//Ale on oczywi�cie musia� si� jeszcze ze mn� pohandryczy�.
	AI_Output(self,other,"DIA_Kyle_Herek_10_03");	//Gada�, jaki to on nie by� twardy i jakie rzeczy wyczynia�, zanim tu trafi�.
	AI_Output(self,other,"DIA_Kyle_Herek_10_04");	//Ale by mi si� g�ba rozanieli�a, gdyby tylko ta �ajza dosta�a porz�dnie po pysku.
	AI_Output(other,self,"DIA_Kyle_Herek_10_05");	//M�g�bym si� zaj�� Herekiem.
	AI_Output(self,other,"DIA_Kyle_Herek_10_06");	//Ty? A to ciekawe.
	AI_Output(self,other,"DIA_Kyle_Herek_10_07");	//Powiem ci co�. Dobierz si� temu kapcanowi do rzyci, a b�dziesz m�g� ju� zawsze swobodnie przechodzi� przez moj� chat�.
	AI_Output(other,self,"DIA_Kyle_Herek_10_08");	//A nie znalaz�aby si� mo�e jaka�... namacalna nagroda?
	AI_Output(self,other,"DIA_Kyle_Herek_10_09");	//A, pal diabli, mog� ci si� jeszcze dorzuci� 10 bry�ek.
	AI_Output(other,self,"DIA_Kyle_Herek_10_10");	//Ju� lepiej.
	AI_Output(self,other,"DIA_Kyle_Herek_10_11");	//No, to zajmij si� ju� �askawie tym osobnikiem.
	herek_kickass = LOG_RUNNING;
	Log_CreateTopic(CH1_KYLE,LOG_MISSION);
	Log_SetTopicStatus(CH1_KYLE,LOG_RUNNING);
	B_LogEntry(CH1_KYLE,"Kyle, jeden z Kopaczy ze Starego Obozu, ma pewne problemy z cz�owiekiem o imieniu Herek. Herek bez pozwolenia prze�azi sobie przez chat� Kyle'a i poprosi� mnie on, abym go tego oduczy�.");
	VLK_511_Herek.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
};


instance DIA_KYLE_SUCCESS(C_Info)
{
	npc = VLK_536_Kyle;
	nr = 1;
	condition = dia_kyle_success_condition;
	information = dia_kyle_success_info;
	permanent = 0;
	description = "Zaj��em si� tym Herekiem.";
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
	AI_Output(other,self,"DIA_Kyle_SUCCESS_15_00");	//Zaj��em si� tym Herekiem.
	AI_Output(self,other,"DIA_Kyle_SUCCESS_10_01");	//Naprawd�? Mam nadziej�, �e� porz�dnie mu facjat� przerobi�.
	AI_Output(other,self,"DIA_Kyle_SUCCESS_10_02");	//Co z moj� nagrod�?
	AI_Output(self,other,"DIA_Kyle_SUCCESS_10_03");	//Ach tak, prawda. Oto twoje 10 bry�ek.
	AI_Output(self,other,"DIA_Kyle_SUCCESS_10_04");	//I oczywi�cie od teraz mo�esz sobie swobodnie przechodzi� przez moj� chat�.
	CreateInvItems(self,ItMiNugget,10);
	B_GiveInvItems(self,other,ItMiNugget,10);
	herek_kickass = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_KYLE,LOG_SUCCESS);
	B_LogEntry(CH1_KYLE,"Kyle by� wielce zadowolony, �e udzieli�em Herekowi porz�dnej lekcji. Jako nagrod� podarowa� mi 10 bry�ek oraz mo�liwo�� swobodnego przechodzenia przez jego chat�.");
	B_GiveXP(XP_KYLEPROBLEM);
};

