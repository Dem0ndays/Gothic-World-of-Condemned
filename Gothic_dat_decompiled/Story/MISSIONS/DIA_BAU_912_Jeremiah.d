
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
	AI_Output(self,other,"DIA_Jeremiah_Hallo_04_01");	//Przygotowuj� ry��wk�, ch�opcze.
	AI_Output(self,other,"DIA_Jeremiah_Hallo_04_02");	//Prosz� - we� sobie jedn� butelk�. Tylko nie m�w Silasowi.
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
	AI_Output(self,other,"DIA_Jeremiah_PERM_04_01");	//Przy tych facetach ledwie nad��am z zam�wieniami. Ci to potrafi� wypi�!
	AI_Output(self,other,"DIA_Jeremiah_PERM_04_02");	//I nawet mi to na r�k�. Przynajmniej psy Ry�owego Ksi�cia zostawiaj� mnie w spokoju.
	Jeremiah_Bauer = TRUE;
};


instance DIA_Jeremiah_Horatio(C_Info)
{
	npc = BAU_912_Jeremiah;
	nr = 2;
	condition = DIA_Jeremiah_Horatio_Condition;
	information = DIA_Jeremiah_Horatio_Info;
	permanent = 0;
	description = "Co mo�esz mi powiedzie� o Ry�owym Ksi�ciu?";
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
	AI_Output(other,self,"DIA_Jeremiah_Horatio_15_00");	//Co mo�esz mi powiedzie� o Ry�owym Ksi�ciu?
	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_01");	//To zapchlony wieprz! Jego siepacze zmuszaj� s�abszych do pracy na polach.
	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_02");	//Jedyna osoba, kt�ra mog�aby si� mu przeciwstawi� to Horacy. Ale on nie lubi przemocy.
	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_03");	//S�ysza�em, jak kiedy� powiedzia�, �e ma ochot� pogruchota� Ksi�ciu ko�ci, ale tak naprawd� nigdy by tego nie zrobi�.
	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_04");	//To by by�o wbrew jego zasadom.
};


instance dia_jeremiah_learn(C_Info)
{
	npc = BAU_912_Jeremiah;
	nr = 1;
	condition = dia_jeremiah_learn_condition;
	information = dia_jeremiah_learn_info;
	permanent = 0;
	description = "M�g�by� mnie nauczy� przygotowywa� ry��wk�?";
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
	AI_Output(other,self,"DIA_Jeremiah_Learn_15_00");	//M�g�by� mnie nauczy� przygotowywa� ry��wk�?
	AI_Output(self,other,"DIA_Jeremiah_Learn_04_01");	//Pewnie, �e mog�. Musisz posiada� do tego jedynie niezb�dne do�wiadczenie, ch�opcze.
	Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
	B_LogEntry(GE_TeacherNC,"Jeremiasz mo�e mnie nauczy� przygotowywa� ry��wk�.");
};


instance DIA_JEREMIAH_BOOZE(C_Info)
{
	npc = BAU_912_Jeremiah;
	nr = 1;
	condition = dia_jeremiah_booze_condition;
	information = dia_jeremiah_booze_info;
	permanent = 1;
	description = "Chc� si� nauczy� p�dzi� ry��wk�. (1 PN)";
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
	AI_Output(other,self,"DIA_Jeremiah_Booze_15_00");	//Chc� si� nauczy� p�dzi� ry��wk�.
	if(hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output(self,other,"DIA_Jeremiah_Booze_15_01");	//No dobrze. Zaczynasz od zmieszania wody z alkoholem.
		AI_Output(self,other,"DIA_Jeremiah_Booze_15_02");	//A nast�pnie dodajesz do swojej mieszanki troch� ry�u siewnego.
		AI_Output(self,other,"DIA_Jeremiah_Booze_15_03");	//Tylko uwa�aj, �eby� czasem tego bimbru za bardzo nie przypali�, bo mo�e to ca�kiem zepsu� smak twojej ry��wki.
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Ry��wka - butelka wody, alkohol i ry� siewny.");
		knows_booze = TRUE;
		B_GiveSkill(other,NPC_TALENT_REGENERATE,1,0);
	}
	else
	{
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

