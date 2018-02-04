
instance DIA_BRAGO_EXIT(C_Info)
{
	npc = stt_5027_brago;
	nr = 999;
	condition = dia_brago_exit_condition;
	information = dia_brago_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_brago_exit_condition()
{
	return 1;
};

func void dia_brago_exit_info()
{
	AI_StopProcessInfos(self);
};


instance dia_brago_first(C_Info)
{
	npc = stt_5027_brago;
	nr = 1;
	condition = dia_brago_first_condition;
	information = dia_brago_first_info;
	permanent = 0;
	important = 0;
	description = "Czeœæ! Jestem tu nowy.";
};


func int dia_brago_first_condition()
{
	return 1;
};

func void dia_brago_first_info()
{
	AI_Output(other,self,"Info_GRD_276_Tips_15_00");	//Czeœæ! Jestem tu nowy.
	AI_Output(self,other,"DIA_Brago_First_10_01");	//Aha... i czego oczekujesz ode mnie?
};


instance DIA_BRAGO_WASGIBT(C_Info)
{
	npc = stt_5027_brago;
	nr = 2;
	condition = dia_brago_wasgibt_condition;
	information = dia_brago_wasgibt_info;
	permanent = 0;
	description = "Chcia³bym siê dowiedzieæ, jak siê tu ¿yje.";
};


func int dia_brago_wasgibt_condition()
{
	if(Npc_KnowsInfo(hero,dia_brago_first))
	{
		return 1;
	};
};

func void dia_brago_wasgibt_info()
{
	AI_Output(other,self,"DIA_Brago_WasGibt_15_00");	//Chcia³bym siê dowiedzieæ, jak siê tu ¿yje.
	AI_Output(self,other,"DIA_Brago_WasGibt_10_01");	//¯ó³todziobom? Nijak, poza tym, ¿e co krok natrafiaj¹ na jakieœ problemy.
	AI_Output(self,other,"DIA_Brago_WasGibt_10_02");	//Ale jeœli ju¿ mia³bym ci s³u¿yæ jak¹œ rad¹, to przede wszystkim uwa¿aj z kim masz do czynienia.
	AI_Output(self,other,"DIA_Brago_WasGibt_10_03");	//Wiesz, garstka ludzi, których tu widzisz, zosta³a wrzucona tutaj za czyn niewiele gorszy od zwêdzenia jab³ka...
};


instance dia_brago_name(C_Info)
{
	npc = stt_5027_brago;
	nr = 1;
	condition = dia_brago_name_condition;
	information = dia_brago_name_info;
	permanent = 0;
	description = "Kim jesteœ?";
};


func int dia_brago_name_condition()
{
	if(Npc_KnowsInfo(hero,dia_brago_first))
	{
		return 1;
	};
};

func void dia_brago_name_info()
{
	AI_Output(other,self,"DIA_Lester_Hallo_15_00");	//Kim jesteœ?
	AI_Output(self,other,"DIA_Brago_Name_10_01");	//Nazywam siê Brago, jestem jednym z Cieni.
	AI_Output(other,self,"DIA_Brago_Name_10_02");	//Cieni?
	AI_Output(self,other,"DIA_Brago_Name_10_03");	//Ano Cieni. Tak samo jak i Stra¿nicy, nale¿ymy do ludzi Gomeza.
	AI_Output(self,other,"DIA_Brago_Name_10_04");	//Do³¹cz tylko do naszej bandy, a przekonasz siê, ¿e ¿ycie w kolonii wcale nie musi wygl¹daæ tak paskudnie.
};


instance dia_brago_hilfe(C_Info)
{
	npc = stt_5027_brago;
	nr = 1;
	condition = dia_brago_hilfe_condition;
	information = dia_brago_hilfe_info;
	permanent = 0;
	description = "Móg³byœ mi pomóc dostaæ siê do zamku?";
};


func int dia_brago_hilfe_condition()
{
	if(Npc_KnowsInfo(hero,dia_brago_name))
	{
		return 1;
	};
};

func void dia_brago_hilfe_info()
{
	AI_Output(other,self,"DIA_Brago_Hilfe__15_00");	//Jesteœ jednym z ludzi Gomeza? Móg³byœ mi pomóc dostaæ siê do zamku?
	AI_Output(self,other,"DIA_Brago_Hilfe__10_01");	//A po có¿ chcesz siê tam dostaæ?
	Info_ClearChoices(dia_brago_hilfe);
	Info_AddChoice(dia_brago_hilfe,"Mam list do Arcymistrza Magów Ognia.",dia_brago_hilfe_brief);
	Info_AddChoice(dia_brago_hilfe,"Chcia³bym zostaæ dopuszczony przed oblicze Gomeza.",dia_brago_hilfe_gomez);
};

func void dia_brago_hilfe_brief()
{
	AI_Output(other,self,"DIA_Brago_Hilfe_Brief_15_00");	//Mam list do Arcymistrza Magów Ognia.
	AI_Output(self,other,"DIA_Brago_Hilfe_Brief_05_01");	//A wiêc to tak. Pewnie dosta³eœ go, zanim ciê tu w ogóle zrzucono, co?
	AI_Output(other,self,"DIA_Brago_Hilfe_Brief_15_01");	//Otó¿ to.
	AI_Output(self,other,"DIA_Brago_Hilfe_Brief_15_02");	//W porz¹dku, chyba mogê ci pomóc.
	AI_Output(other,self,"DIA_Brago_Hilfe_Brief_15_03");	//A w jaki sposób?
	AI_Output(self,other,"DIA_Brago_Hilfe_Brief_15_04");	//Istnieje takie ukryte tylne wejœcie do zamku. Niewiele osób wie o jego istnieniu, a jeœli ju¿, to nie maj¹ oni klucza do tamtejszych drzwi.
	AI_Output(other,self,"DIA_Brago_Hilfe_Brief_15_05");	//A ty go masz?
	AI_Output(self,other,"DIA_Brago_Hilfe_Brief_15_06");	//Pewnie. Ale jeœli ju¿ mam ci pomóc, musisz mi obiecaæ, ¿e nikomu nie wypaplasz naszego planu, rozumiemy siê?
	AI_Output(other,self,"DIA_Brago_Hilfe_Brief_15_07");	//Oczywiœcie. To gdzie jest ta kryjówka?
	AI_Output(self,other,"DIA_Brago_Hilfe_Brief_15_08");	//Jeœli chcesz, mo¿emy ruszaæ od razu. Daj znaæ, gdy bêdziesz gotów.
	Info_ClearChoices(dia_brago_hilfe);
	Info_AddChoice(dia_brago_hilfe,"ChodŸmy.",dia_brago_hilfe_go);
	Info_AddChoice(dia_brago_hilfe,"Sam znajdê drogê.",dia_brago_hilfe_walkalone);
};

func void dia_brago_hilfe_gomez()
{
	AI_Output(other,self,"DIA_Brago_Hilfe_Gomez_15_00");	//Chcia³bym zostaæ dopuszczony przed oblicze Gomeza.
	AI_Output(self,other,"DIA_Brago_Hilfe_Gomez_05_01");	//Hehe... zapomnij.
	AI_Output(self,other,"DIA_Brago_Hilfe_Gomez_05_02");	//Nawet jeœli uda³oby ci siê jakoœ wtargn¹æ do zamku, to ze stra¿nikami siedziby Magnatów nie masz ju¿ najmniejszych szans.
	AI_Output(self,other,"DIA_Brago_Hilfe_Gomez_05_03");	//Jedynie z rozkazu samego Thorusa coœ by z tego by³o.
	Info_ClearChoices(dia_brago_hilfe);
};

func void dia_brago_hilfe_go()
{
	AI_Output(other,self,"DIA_Brago_Hilfe_Go_15_00");	//ChodŸmy.
	AI_Output(self,other,"DIA_Brago_Hilfe_Go_05_01");	//No to w drogê!
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"GUIDE");
	AI_StopProcessInfos(self);
};

func void dia_brago_hilfe_walkalone()
{
	AI_Output(other,self,"DIA_Brago_Hilfe_WalkAlone_15_00");	//Sam znajdê drogê.
	AI_Output(self,other,"DIA_Brago_Hilfe_WalkAlone_05_01");	//W porz¹dku. Jeœli twierdzisz, ¿e samemu ci siê to uda...
	Info_ClearChoices(dia_brago_hilfe);
};


instance DIA_BRAGO_TRAP(C_Info)
{
	npc = stt_5027_brago;
	nr = 1;
	condition = dia_brago_trap_condition;
	information = dia_brago_trap_info;
	permanent = 0;
	important = 1;
	description = "No, to jesteœmy.";
};


func int dia_brago_trap_condition()
{
	if(Npc_KnowsInfo(hero,dia_brago_hilfe) && Hlp_StrCmp(Npc_GetNearestWP(self),"OW_PATH_297"))
	{
		return 1;
	};
};

func void dia_brago_trap_info()
{
	AI_Output(self,other,"DIA_Brago_Trap_15_00");	//No, to jesteœmy.
	AI_Output(other,self,"DIA_Brago_Trap_10_01");	//I gdzie to tajne wejœcie?
	AI_Output(self,other,"DIA_Brago_Trap_10_02");	//Hehe... nie ma ¿adnego tajnego wejœcia.
	AI_Output(other,self,"DIA_Brago_Trap_10_03");	//Co?!
	AI_Output(self,other,"DIA_Brago_Trap_10_04");	//Trochê to nierozwa¿ne z twojej strony, tak po prostu mówiæ mi o liœcie do Magów...
	AI_Output(self,other,"DIA_Brago_Trap_10_05");	//Ale spokojna g³owa, jestem pewien, ¿e ju¿ nigdy takiego b³êdu nie pope³nisz.
	AI_Output(self,other,"DIA_Brago_Trap_10_06");	//Ju¿ ja o to zadbam...
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
	Npc_SetPermAttitude(self,ATT_HOSTILE);
	Npc_SetTarget(self,other);
	Npc_ExchangeRoutine(self,"START");
};

