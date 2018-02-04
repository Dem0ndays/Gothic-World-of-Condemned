
instance DIA_Jeremiah_EXIT(C_Info)
{
	npc = BAU_912_Jeremiah;
	nr = 999;
	condition = DIA_Jeremiah_EXIT_Condition;
	information = DIA_Jeremiah_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Jeremiah_EXIT_Condition()
{
	return 1;
};

func void DIA_Jeremiah_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jeremiah_Hallo(C_Info)
{
	npc = BAU_912_Jeremiah;
	nr = 1;
	condition = DIA_Jeremiah_Hallo_Condition;
	information = DIA_Jeremiah_Hallo_Info;
	permanent = 0;
	description = "Co robisz?";
};


func int DIA_Jeremiah_Hallo_Condition()
{
	return 1;
};

func void DIA_Jeremiah_Hallo_Info()
{
	AI_Output(other,self,"DIA_Jeremiah_Hallo_15_00");	//Co robisz?
	AI_Output(self,other,"DIA_Jeremiah_Hallo_04_01");	//Przygotowujê ry¿ówkê, ch³opcze.
	AI_Output(self,other,"DIA_Jeremiah_Hallo_04_02");	//Proszê - weŸ sobie jedn¹ butelkê. Tylko nie mów Silasowi.
	CreateInvItems(self,ItFoBooze,1);
	B_GiveInvItems(self,other,ItFoBooze,1);
};


var int Jeremiah_Bauer;

instance DIA_Jeremiah_PERM(C_Info)
{
	npc = BAU_912_Jeremiah;
	nr = 1;
	condition = DIA_Jeremiah_PERM_Condition;
	information = DIA_Jeremiah_PERM_Info;
	permanent = 1;
	description = "Jak idzie destylacja?";
};


func int DIA_Jeremiah_PERM_Condition()
{
	return 1;
};

func void DIA_Jeremiah_PERM_Info()
{
	AI_Output(other,self,"DIA_Jeremiah_PERM_15_00");	//Jak idzie destylacja?
	AI_Output(self,other,"DIA_Jeremiah_PERM_04_01");	//Przy tych facetach ledwie nad¹¿am z zamówieniami. Ci to potrafi¹ wypiæ!
	AI_Output(self,other,"DIA_Jeremiah_PERM_04_02");	//I nawet mi to na rêkê. Przynajmniej psy Ry¿owego Ksiêcia zostawiaj¹ mnie w spokoju.
	Jeremiah_Bauer = TRUE;
};


instance DIA_Jeremiah_Horatio(C_Info)
{
	npc = BAU_912_Jeremiah;
	nr = 2;
	condition = DIA_Jeremiah_Horatio_Condition;
	information = DIA_Jeremiah_Horatio_Info;
	permanent = 0;
	description = "Co mo¿esz mi powiedzieæ o Ry¿owym Ksiêciu?";
};


func int DIA_Jeremiah_Horatio_Condition()
{
	if(Jeremiah_Bauer == TRUE)
	{
		return 1;
	};
};

func void DIA_Jeremiah_Horatio_Info()
{
	AI_Output(other,self,"DIA_Jeremiah_Horatio_15_00");	//Co mo¿esz mi powiedzieæ o Ry¿owym Ksiêciu?
	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_01");	//To zapchlony wieprz! Jego siepacze zmuszaj¹ s³abszych do pracy na polach.
	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_02");	//Jedyna osoba, która mog³aby siê mu przeciwstawiæ to Horacy. Ale on nie lubi przemocy.
	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_03");	//S³ysza³em, jak kiedyœ powiedzia³, ¿e ma ochotê pogruchotaæ Ksiêciu koœci, ale tak naprawdê nigdy by tego nie zrobi³.
	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_04");	//To by by³o wbrew jego zasadom.
};


instance dia_jeremiah_learn(C_Info)
{
	npc = BAU_912_Jeremiah;
	nr = 1;
	condition = dia_jeremiah_learn_condition;
	information = dia_jeremiah_learn_info;
	permanent = 0;
	description = "Móg³byœ mnie nauczyæ przygotowywaæ ry¿ówkê?";
};


func int dia_jeremiah_learn_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Jeremiah_Hallo))
	{
		return 1;
	};
};

func void dia_jeremiah_learn_info()
{
	AI_Output(other,self,"DIA_Jeremiah_Learn_15_00");	//Móg³byœ mnie nauczyæ przygotowywaæ ry¿ówkê?
	AI_Output(self,other,"DIA_Jeremiah_Learn_04_01");	//Pewnie, ¿e mogê. Musisz posiadaæ do tego jedynie niezbêdne doœwiadczenie, ch³opcze.
	Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
	B_LogEntry(GE_TeacherNC,"Jeremiasz mo¿e mnie nauczyæ przygotowywaæ ry¿ówkê.");
};


instance DIA_JEREMIAH_BOOZE(C_Info)
{
	npc = BAU_912_Jeremiah;
	nr = 1;
	condition = dia_jeremiah_booze_condition;
	information = dia_jeremiah_booze_info;
	permanent = 1;
	description = "Chcê siê nauczyæ pêdziæ ry¿ówkê. (1 PN)";
};


func int dia_jeremiah_booze_condition()
{
	if(Npc_KnowsInfo(hero,dia_jeremiah_learn) && (knows_booze == FALSE))
	{
		return 1;
	};
};

func void dia_jeremiah_booze_info()
{
	AI_Output(other,self,"DIA_Jeremiah_Booze_15_00");	//Chcê siê nauczyæ pêdziæ ry¿ówkê.
	if(hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output(self,other,"DIA_Jeremiah_Booze_15_01");	//No dobrze. Zaczynasz od zmieszania wody z alkoholem.
		AI_Output(self,other,"DIA_Jeremiah_Booze_15_02");	//A nastêpnie dodajesz do swojej mieszanki trochê ry¿u siewnego.
		AI_Output(self,other,"DIA_Jeremiah_Booze_15_03");	//Tylko uwa¿aj, ¿ebyœ czasem tego bimbru za bardzo nie przypali³, bo mo¿e to ca³kiem zepsuæ smak twojej ry¿ówki.
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Ry¿ówka - butelka wody, alkohol i ry¿ siewny.");
		knows_booze = TRUE;
		B_GiveSkill(other,NPC_TALENT_REGENERATE,1,0);
	}
	else
	{
		PrintScreen("Za ma³o punktów umiejêtnoœci!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

