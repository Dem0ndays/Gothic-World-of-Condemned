
instance DIA_Vlk_534_Exit(C_Info)
{
	npc = VLK_534_Buddler;
	nr = 999;
	condition = DIA_Vlk_534_Exit_Condition;
	information = DIA_Vlk_534_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Vlk_534_Exit_Condition()
{
	return 1;
};

func void DIA_Vlk_534_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Vlk_534_LeaveMe(C_Info)
{
	npc = VLK_534_Buddler;
	nr = 1;
	condition = DIA_Vlk_534_LeaveMe_Condition;
	information = DIA_Vlk_534_LeaveMe_Info;
	permanent = 0;
	description = "Dlaczego siedzisz tutaj, a nie w obozie?";
};


func int DIA_Vlk_534_LeaveMe_Condition()
{
	return 1;
};

func void DIA_Vlk_534_LeaveMe_Info()
{
	AI_Output(other,self,"DIA_Vlk_534_LeaveMe_15_00");	//Dlaczego siedzisz tutaj, a nie w obozie?
	AI_Output(self,other,"DIA_Vlk_534_LeaveMe_02_01");	//Czekam, a¿ mój przyjaciel wróci z kopalni. Jest mi winien parê bry³ek rudy.
	AI_Output(self,other,"DIA_Vlk_534_LeaveMe_02_02");	//Nie mogê siê pokazaæ w obozie bez rudy - nie staæ mnie na zap³acenie za ochronê, a wolê nie ryzykowaæ ¿yciem.
};


var int erz_schulden_day;

instance DIA_VLK_534_HELP(C_Info)
{
	npc = VLK_534_Buddler;
	nr = 1;
	condition = dia_vlk_534_help_condition;
	information = dia_vlk_534_help_info;
	permanent = 0;
	description = "Mogê ci pomóc?";
};


func int dia_vlk_534_help_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Vlk_534_LeaveMe))
	{
		return 1;
	};
};

func void dia_vlk_534_help_info()
{
	AI_Output(other,self,"DIA_Vlk_534_Help_15_00");	//Twój kumpel wisi ci rudê? Mogê ci pomóc w tej sprawie?
	AI_Output(self,other,"DIA_Vlk_534_Help_02_01");	//Mo¿esz. Jeœli bêdziesz kiedy szed³ do Starej Kopalni, rozejrzyj siê tam za Kopaczem imieniem Garp. Jest mi winien 30 bry³ek rudy.
	AI_Output(self,other,"DIA_Vlk_534_Help_02_02");	//Powiedz mu, ¿e to ja ciê przysy³am i ¿e chcia³bym zobaczyæ swoj¹ rudê z powrotem. Powinien ci j¹ daæ bez problemów.
	AI_Output(self,other,"DIA_Vlk_534_Help_02_03");	//Jeœli zwiejesz razem z moj¹ rud¹, a my znowu siê spotkamy, to ju¿ jesteœ trupem, wiêc lepiej nawet o tym nie myœl.
	AI_StopProcessInfos(self);
	erz_schulden = LOG_RUNNING;
	Log_CreateTopic(CH1_SCHULDEN,LOG_MISSION);
	Log_SetTopicStatus(CH1_SCHULDEN,LOG_RUNNING);
	B_LogEntry(CH1_SCHULDEN,"Jeden z Kopaczy, przesiaduj¹cy niedaleko bramy Starego Obozu, poprosi³ mnie o za³atwienie mu jego rudy. Kopacz imieniem Garp, który pracuje w kopalni, jest mu winien 30 bry³ek. Jak tylko za³atwiê sprawê, powinienem bezzw³ocznie oddaæ mu jego nale¿noœæ.");
	erz_schulden_day = Wld_GetDay();
};


instance DIA_VLK_534_BETRAYED(C_Info)
{
	npc = VLK_534_Buddler;
	nr = 1;
	condition = dia_vlk_534_betrayed_condition;
	information = dia_vlk_534_betrayed_info;
	permanent = 0;
	important = 1;
};


func int dia_vlk_534_betrayed_condition()
{
	if((erz_schulden == LOG_RUNNING) && (erz_schulden_day <= (Wld_GetDay() - 7)))
	{
		return 1;
	};
};

func void dia_vlk_534_betrayed_info()
{
	AI_Output(self,other,"DIA_Vlk_534_Betrayed_15_00");	//Tu jesteœ, ³ajdaku!
	AI_Output(self,other,"DIA_Vlk_534_Betrayed_02_01");	//Minê³o ju¿ doœæ sporo czasu od kiedy ci powiedzia³em, ¿e masz mi za³atwiæ moj¹ rudê.
	AI_Output(self,other,"DIA_Vlk_534_Betrayed_02_02");	//Pewno myœla³eœ, ¿e mo¿esz siê tak po prostu z ni¹ ulotniæ, co? Czekaj no, ju¿ po tobie!
	erz_schulden = LOG_FAILED;
	Log_SetTopicStatus(CH1_SCHULDEN,LOG_FAILED);
	B_LogEntry(CH1_SCHULDEN,"Kopacz, który chcia³, ¿ebym za³atwi³ mu jego rudê z powrotem, nie by³ specjalnie zachwycony tym, ¿e siê z ni¹ zmy³em.");
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};


instance DIA_VLK_534_ERZ(C_Info)
{
	npc = VLK_534_Buddler;
	nr = 1;
	condition = dia_vlk_534_erz_condition;
	information = dia_vlk_534_erz_info;
	permanent = 1;
	description = "Mam twoj¹ rudê.";
};


func int dia_vlk_534_erz_condition()
{
	if(erz_schulden == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_vlk_534_erz_info()
{
	var int zufallsbelohnung;
	if(Npc_HasItems(other,ItMiNugget) >= 30)
	{
		AI_Output(other,self,"DIA_Vlk_534_Erz_15_00");	//Mam twoj¹ rudê.
		AI_Output(self,other,"DIA_Vlk_534_Erz_02_01");	//Dziêkujê ci za tw¹ dobrodusznoœæ.
		AI_Output(self,other,"DIA_Vlk_534_Erz_02_02");	//Proszê, dostaniesz nawet nagrodê za pomoc.
		B_GiveInvItems(other,self,ItMiNugget,30);
		zufallsbelohnung = Hlp_Random(100);
		if(zufallsbelohnung >= 75)
		{
			CreateInvItems(self,ItAt_Claws_01,2);
			B_GiveInvItems(self,other,ItAt_Claws_01,2);
		}
		else if(zufallsbelohnung >= 60)
		{
			CreateInvItems(self,ItMw_1H_Poker_01,1);
			B_GiveInvItems(self,other,ItMw_1H_Poker_01,1);
		}
		else if(zufallsbelohnung >= 50)
		{
			CreateInvItem(self,ItMi_Stuff_OldCoin_01);
			B_GiveInvItems(self,hero,ItMi_Stuff_OldCoin_01,2);
		}
		else if(zufallsbelohnung >= 40)
		{
			CreateInvItems(self,ItFoBeer,3);
			B_GiveInvItems(self,other,ItFoBeer,3);
		}
		else if(zufallsbelohnung >= 30)
		{
			CreateInvItems(self,ItFoLoaf,2);
			B_GiveInvItems(self,other,ItFoLoaf,2);
		}
		else if(zufallsbelohnung >= 20)
		{
			CreateInvItems(self,ItMiNugget,10);
			B_GiveInvItems(self,other,ItMiNugget,10);
		}
		else if(zufallsbelohnung >= 10)
		{
			CreateInvItems(self,ItMiSwordraw,1);
			B_GiveInvItems(self,other,ItMiSwordraw,1);
		};
		erz_schulden = LOG_SUCCESS;
		Log_SetTopicStatus(CH1_SCHULDEN,LOG_SUCCESS);
		B_LogEntry(CH1_SCHULDEN,"Uda³o mi siê za³atwiæ Kopaczowi jego rudê z powrotem, dziêki czemu dosta³em od niego w zamian za pomoc coœ przydatnego.");
		B_GiveXP(XP_ERZSCHULDEN);
		dia_vlk_534_erz.permanent = 0;
		Npc_ExchangeRoutine(self,"ALTERNATIVE");
	}
	else
	{
		AI_Output(other,self,"DIA_Vlk_534_Erz_15_00");	//Mam twoj¹ rudê.
		AI_Output(self,other,"DIA_Vlk_534_Erz_15_01");	//Ale tu nie ma 30 bry³ek. Mam nadziejê, ¿eœ reszty nie przepi³.
		AI_StopProcessInfos(self);
	};
};

