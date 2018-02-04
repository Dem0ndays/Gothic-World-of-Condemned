
instance DIA_Gilbert_EXIT(C_Info)
{
	npc = Non_1500_Gilbert;
	nr = 999;
	condition = DIA_Gilbert_EXIT_Condition;
	information = DIA_Gilbert_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Gilbert_EXIT_Condition()
{
	return 1;
};

func void DIA_Gilbert_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gilbert_First(C_Info)
{
	npc = Non_1500_Gilbert;
	nr = 1;
	condition = DIA_Gilbert_First_Condition;
	information = DIA_Gilbert_First_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Gilbert_First_Condition()
{
	if(Npc_GetDistToNpc(self,other) <= ZivilAnquatschDist)
	{
		return 1;
	};
};

func void DIA_Gilbert_First_Info()
{
	AI_Output(self,other,"DIA_Gilbert_First_04_00");	//Co tu robisz? Nie miewam tu zbyt czêsto goœci, he he!
	AI_Output(self,other,"DIA_Gilbert_First_04_01");	//Widzê, ¿e niez³y cwaniak z ciebie. Tak znaleŸæ moj¹ kryjówkê, no no!
	B_GiveXP(XP_GilbertFound);
};


instance DIA_Gilbert_Hallo(C_Info)
{
	npc = Non_1500_Gilbert;
	nr = 1;
	condition = DIA_Gilbert_Hallo_Condition;
	information = DIA_Gilbert_Hallo_Info;
	permanent = 0;
	description = "Co tu robisz?";
};


func int DIA_Gilbert_Hallo_Condition()
{
	return 1;
};

func void DIA_Gilbert_Hallo_Info()
{
	AI_Output(other,self,"DIA_Gilbert_Hallo_15_00");	//Co tu robisz?
	AI_Output(self,other,"DIA_Gilbert_Hallo_04_01");	//Mia³em ju¿ doœæ Starego Obozu. Podpad³em paru ludziom Gomeza. To by³o dawno temu.
};


instance dia_gilbert_help(C_Info)
{
	npc = Non_1500_Gilbert;
	nr = 2;
	condition = dia_gilbert_help_condition;
	information = dia_gilbert_help_info;
	permanent = 0;
	important = 0;
	description = "Mogê ci jakoœ pomóc?";
};


func int dia_gilbert_help_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Gilbert_Hallo))
	{
		return 1;
	};
};

func void dia_gilbert_help_info()
{
	AI_Output(other,self,"DIA_Gilbert_Help_04_00");	//Mogê ci jakoœ pomóc?
	AI_Output(self,other,"DIA_Gilbert_Help_04_01");	//No, skoro ju¿ pytasz, to w rzeczy samej.
	AI_Output(self,other,"DIA_Gilbert_Help_04_02");	//Móg³byœ siê przejœæ za mnie do Starego Obozu i popytaæ ludzi Gomeza, czy czasem mnie ktoœ jeszcze nie pamiêta.
	AI_Output(other,self,"DIA_Gilbert_Help_04_03");	//A co, jeœli ju¿ tak bêdzie?
	AI_Output(self,other,"DIA_Gilbert_Help_04_04");	//Chcê po prostu wiedzieæ czy móg³bym znowu zaryzykowaæ wycieczkê do Starego Obozu, nie dostaj¹c przy tym od nikogo w gêbê.
	AI_Output(self,other,"DIA_Gilbert_Help_04_05");	//Jeœli tylko czegoœ siê dowiesz, przyjdŸ co rychlej do mnie i podziel siê opowiastkami.
	Info_ClearChoices(dia_gilbert_help);
	Info_AddChoice(dia_gilbert_help,"Zajmê siê tym.",dia_gilbert_help_back);
	Info_AddChoice(dia_gilbert_help,"Co tam tak w³aœciwie przeskroba³eœ?",dia_gilbert_help_done);
	Info_AddChoice(dia_gilbert_help,"Gdzie mam zacz¹æ?",dia_gilbert_help_where);
	oc_back = LOG_RUNNING;
	Log_CreateTopic(CH1_GILBERT,LOG_MISSION);
	B_LogEntry(CH1_GILBERT,"Gilbert - samotnik, który mia³ ju¿ doœæ ¿ycia w Starym Obozie - zleci³ mi, abym rozejrza³ siê trochê po Starym Obozie i popyta³, czy czasem ktoœ go jeszcze nie pamiêta.");
	Log_SetTopicStatus(CH1_GILBERT,LOG_RUNNING);
};

func void dia_gilbert_help_back()
{
	AI_Output(other,self,"DIA_Gilbert_Help_BACK_15_00");	//Zajmê siê tym.
	Info_ClearChoices(dia_gilbert_help);
};

func void dia_gilbert_help_done()
{
	AI_Output(other,self,"DIA_Gilbert_Help_Done_15_00");	//Co tam tak w³aœciwie przeskroba³eœ?
	AI_Output(self,other,"DIA_Gilbert_Help_Done_09_01");	//Ach, to ju¿ jest bez znaczenia. Teraz wa¿ny jest tylko mój powrót do Starego Obozu.
};

func void dia_gilbert_help_where()
{
	AI_Output(other,self,"DIA_Gilbert_Help_Where_15_00");	//Gdzie mam zacz¹æ?
	AI_Output(self,other,"DIA_Gilbert_Help_Where_09_01");	//Mia³em chatê w dzielnicy handlowej Zewnêtrznego Pierœcienia. I tam te¿ przysporzy³em sobie k³opotów. Tam w³aœnie powinieneœ zacz¹æ.
	B_LogEntry(CH1_GILBERT,"Powinienem zacz¹æ swoje dochodzenie w dzielnicy handlowej Zewnêtrznego Pierœcienia, w Starym Obozie.");
};


instance dia_gilbert_und(C_Info)
{
	npc = Non_1500_Gilbert;
	nr = 1;
	condition = dia_gilbert_und_condition;
	information = dia_gilbert_und_info;
	permanent = 0;
	description = "Rozmawia³em z kilkoma ludŸmi.";
};


func int dia_gilbert_und_condition()
{
	if(Npc_KnowsInfo(hero,info_jackal_gilbert) && Npc_KnowsInfo(hero,info_fisk_gilbert) && Npc_KnowsInfo(hero,info_dexter_gilbert))
	{
		return 1;
	};
};

func void dia_gilbert_und_info()
{
	AI_Output(other,self,"DIA_Gilbert_Und_15_00");	//Rozmawia³em z kilkoma ludŸmi.
	AI_Output(self,other,"DIA_Gilbert_Und_04_01");	//I?
	AI_Output(other,self,"DIA_Gilbert_Und_04_02");	//Szakal doœæ dobrze jeszcze pamiêta ciebie i twoje przygody.
	AI_Output(other,self,"DIA_Gilbert_Und_04_03");	//Fisk wprawdzie te¿ ciê kojarzy, ale nie wie nic o ¿adnych problemach.
	AI_Output(other,self,"DIA_Gilbert_Und_04_04");	//A Dexter ciê nie zna.
	AI_Output(self,other,"DIA_Gilbert_Und_04_05");	//To ju¿ coœ. Muszê jednak mieæ pewnoœæ, ¿e sprawa siê ju¿ wyjaœni³a.
	AI_Output(self,other,"DIA_Gilbert_Und_04_06");	//IdŸ do Gravo. Wprawdzie te¿ jest jedynie Kopaczem, ale ma spore wp³ywy u Magnatów.
	AI_Output(self,other,"DIA_Gilbert_Und_04_07");	//Jeœli ktoœ jest w stanie to wyjaœniæ, to tylko on.
	AI_Output(self,other,"DIA_Gilbert_Und_04_08");	//Znajdziesz go przy wodopoju, ko³o bramy do zamku.
	B_LogEntry(CH1_GILBERT,"Gilbert poprosi³ mnie, abym zamieni³ parê s³ów z tym Gravo. Jeœli ktoœ jest w stanie pomóc Gilbertowi, to tylko on. Ponoæ krêci siê gdzieœ zawsze przy wodopoju, ko³o bramy do zamku.");
};


instance DIA_GILBERT_ORE(C_Info)
{
	npc = Non_1500_Gilbert;
	nr = 1;
	condition = dia_gilbert_ore_condition;
	information = dia_gilbert_ore_info;
	permanent = 0;
	description = "Rozmawia³em z Gravo.";
};


func int dia_gilbert_ore_condition()
{
	if(Npc_KnowsInfo(hero,dia_gravo_helpgilbert))
	{
		return 1;
	};
};

func void dia_gilbert_ore_info()
{
	AI_Output(other,self,"DIA_Gilbert_Ore_15_00");	//Rozmawia³em z Gravo.
	AI_Output(self,other,"DIA_Gilbert_Ore_04_01");	//I?
	AI_Output(other,self,"DIA_Gilbert_Ore_04_02");	//Liczy sobie 500 bry³ek za swoj¹ pomoc.
	AI_Output(self,other,"DIA_Gilbert_Ore_04_03");	//500 bry³ek? Mo¿na siê by³o spodziewaæ, ¿e trochê drogo to wyjdzie.
	AI_Output(other,self,"DIA_Gilbert_Ore_04_04");	//Tylko mi teraz nie mów, ¿e nie masz tej rudy.
	AI_Output(self,other,"DIA_Gilbert_Ore_04_05");	//Pewnie, ¿e mam, ale nie tutaj.
	AI_Output(self,other,"DIA_Gilbert_Ore_04_06");	//Le¿y dalej w mojej starej chacie na targowisku.
	AI_Output(self,other,"DIA_Gilbert_Ore_04_07");	//Tylko problem w tym, ¿e jakiœ czas temu zapodzia³ mi siê gdzieœ klucz.
	AI_Output(self,other,"DIA_Gilbert_Ore_04_08");	//Chocia¿ mo¿esz spokojnie z³amaæ mechanizm skrzyni, jeœli tylko nauczysz siê otwierania zamków.
	AI_Output(self,other,"DIA_Gilbert_Ore_04_09");	//Przez ten czas z pewnoœci¹ ju¿ ktoœ inny zd¹¿y³ przej¹æ sobie moj¹ chatê.
	AI_Output(self,other,"DIA_Gilbert_Ore_04_10");	//Dlatego umiejêtnoœæ skradania równie¿ by ci siê przyda³a.
	AI_Output(self,other,"DIA_Gilbert_Ore_04_11");	//Moja chata stoi na prawo od cha³upy pewnego kopacza imieniem Dusty.
	B_LogEntry(CH1_GILBERT,"Gilbert wskaza³ mi miejsce, w którym trzyma swoj¹ rudê. Le¿y ona w skrzyni, w chacie na prawo od cha³upy Kopacza o imieniu Dusty.");
};


instance DIA_GILBERT_FINISHED(C_Info)
{
	npc = Non_1500_Gilbert;
	nr = 1;
	condition = dia_gilbert_finished_condition;
	information = dia_gilbert_finished_info;
	permanent = 0;
	description = "Mo¿esz uznaæ sprawê za za³atwion¹.";
};


func int dia_gilbert_finished_condition()
{
	if(erz_gegeben == TRUE)
	{
		return 1;
	};
};

func void dia_gilbert_finished_info()
{
	var int zufallsbelohnung;
	AI_Output(other,self,"DIA_Gilbert_Finished_15_00");	//Mo¿esz uznaæ sprawê za za³atwion¹.
	AI_Output(self,other,"DIA_Gilbert_Finished_04_01");	//Czy to znaczy, ¿e mogê ju¿ wróciæ do obozu?
	AI_Output(other,self,"DIA_Gilbert_Finished_04_02");	//Otó¿ to.
	AI_Output(self,other,"DIA_Gilbert_Finished_04_03");	//Znakomicie. Dziêki ch³opie. Jestem ci coœ winien.
	AI_Output(other,self,"DIA_Gilbert_Finished_04_04");	//To mo¿e jakaœ konkretna nagroda?
	AI_Output(self,other,"DIA_Gilbert_Finished_04_05");	//Tak, trzymaj. Zas³u¿y³eœ sobie.
	AI_Output(self,other,"DIA_Gilbert_Finished_04_06");	//Wrócê niebawem znowu do obozu, ale to mo¿e jeszcze poczekaæ.
	AI_Output(self,other,"DIA_Gilbert_Finished_04_07");	//Na pewno jeszcze siê kiedyœ spotkamy. Hehe.
	AI_StopProcessInfos(self);
	zufallsbelohnung = Hlp_Random(100);
	if(zufallsbelohnung >= 75)
	{
		CreateInvItems(self,ItAt_Wolf_01,2);
		B_GiveInvItems(self,other,ItAt_Wolf_01,2);
	}
	else if(zufallsbelohnung >= 60)
	{
		CreateInvItems(self,ItFo_Potion_Health_Perma_01,1);
		B_GiveInvItems(self,other,ItFo_Potion_Health_Perma_01,1);
	}
	else if(zufallsbelohnung >= 50)
	{
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,5);
		B_GiveInvItems(self,hero,ItMi_Stuff_OldCoin_01,5);
	}
	else if(zufallsbelohnung >= 40)
	{
		CreateInvItems(self,ItFoBeer,2);
		B_GiveInvItems(self,other,ItFoBeer,2);
	}
	else if(zufallsbelohnung >= 30)
	{
		CreateInvItems(self,Schutzring_Feuer2,1);
		B_GiveInvItems(self,other,Schutzring_Feuer2,1);
	}
	else if(zufallsbelohnung >= 20)
	{
		CreateInvItems(self,ItMw_1H_Axe_Old_01,1);
		B_GiveInvItems(self,other,ItMw_1H_Axe_Old_01,1);
	}
	else if(zufallsbelohnung >= 10)
	{
		CreateInvItems(self,ItMw_1H_Sword_01,1);
		B_GiveInvItems(self,other,ItMw_1H_Sword_01,1);
	};
	oc_back = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_GILBERT,LOG_SUCCESS);
	B_LogEntry(CH1_GILBERT,"Gilbert by³ zadowolony z moich poczynañ i ofiarowa³ mi w ramach nagrody doœæ u¿yteczny przedmiot. Niebawem znowu bêdzie mo¿na go spotkaæ w Starym Obozie.");
	B_GiveXP(XP_GILBERT);
};

