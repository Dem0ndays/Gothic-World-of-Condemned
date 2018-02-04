
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
	AI_Output(self,other,"DIA_Gilbert_First_04_00");	//Co tu robisz? Nie miewam tu zbyt cz�sto go�ci, he he!
	AI_Output(self,other,"DIA_Gilbert_First_04_01");	//Widz�, �e niez�y cwaniak z ciebie. Tak znale�� moj� kryj�wk�, no no!
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
	AI_Output(self,other,"DIA_Gilbert_Hallo_04_01");	//Mia�em ju� do�� Starego Obozu. Podpad�em paru ludziom Gomeza. To by�o dawno temu.
};


instance dia_gilbert_help(C_Info)
{
	npc = Non_1500_Gilbert;
	nr = 2;
	condition = dia_gilbert_help_condition;
	information = dia_gilbert_help_info;
	permanent = 0;
	important = 0;
	description = "Mog� ci jako� pom�c?";
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
	AI_Output(other,self,"DIA_Gilbert_Help_04_00");	//Mog� ci jako� pom�c?
	AI_Output(self,other,"DIA_Gilbert_Help_04_01");	//No, skoro ju� pytasz, to w rzeczy samej.
	AI_Output(self,other,"DIA_Gilbert_Help_04_02");	//M�g�by� si� przej�� za mnie do Starego Obozu i popyta� ludzi Gomeza, czy czasem mnie kto� jeszcze nie pami�ta.
	AI_Output(other,self,"DIA_Gilbert_Help_04_03");	//A co, je�li ju� tak b�dzie?
	AI_Output(self,other,"DIA_Gilbert_Help_04_04");	//Chc� po prostu wiedzie� czy m�g�bym znowu zaryzykowa� wycieczk� do Starego Obozu, nie dostaj�c przy tym od nikogo w g�b�.
	AI_Output(self,other,"DIA_Gilbert_Help_04_05");	//Je�li tylko czego� si� dowiesz, przyjd� co rychlej do mnie i podziel si� opowiastkami.
	Info_ClearChoices(dia_gilbert_help);
	Info_AddChoice(dia_gilbert_help,"Zajm� si� tym.",dia_gilbert_help_back);
	Info_AddChoice(dia_gilbert_help,"Co tam tak w�a�ciwie przeskroba�e�?",dia_gilbert_help_done);
	Info_AddChoice(dia_gilbert_help,"Gdzie mam zacz��?",dia_gilbert_help_where);
	oc_back = LOG_RUNNING;
	Log_CreateTopic(CH1_GILBERT,LOG_MISSION);
	B_LogEntry(CH1_GILBERT,"Gilbert - samotnik, kt�ry mia� ju� do�� �ycia w Starym Obozie - zleci� mi, abym rozejrza� si� troch� po Starym Obozie i popyta�, czy czasem kto� go jeszcze nie pami�ta.");
	Log_SetTopicStatus(CH1_GILBERT,LOG_RUNNING);
};

func void dia_gilbert_help_back()
{
	AI_Output(other,self,"DIA_Gilbert_Help_BACK_15_00");	//Zajm� si� tym.
	Info_ClearChoices(dia_gilbert_help);
};

func void dia_gilbert_help_done()
{
	AI_Output(other,self,"DIA_Gilbert_Help_Done_15_00");	//Co tam tak w�a�ciwie przeskroba�e�?
	AI_Output(self,other,"DIA_Gilbert_Help_Done_09_01");	//Ach, to ju� jest bez znaczenia. Teraz wa�ny jest tylko m�j powr�t do Starego Obozu.
};

func void dia_gilbert_help_where()
{
	AI_Output(other,self,"DIA_Gilbert_Help_Where_15_00");	//Gdzie mam zacz��?
	AI_Output(self,other,"DIA_Gilbert_Help_Where_09_01");	//Mia�em chat� w dzielnicy handlowej Zewn�trznego Pier�cienia. I tam te� przysporzy�em sobie k�opot�w. Tam w�a�nie powiniene� zacz��.
	B_LogEntry(CH1_GILBERT,"Powinienem zacz�� swoje dochodzenie w dzielnicy handlowej Zewn�trznego Pier�cienia, w Starym Obozie.");
};


instance dia_gilbert_und(C_Info)
{
	npc = Non_1500_Gilbert;
	nr = 1;
	condition = dia_gilbert_und_condition;
	information = dia_gilbert_und_info;
	permanent = 0;
	description = "Rozmawia�em z kilkoma lud�mi.";
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
	AI_Output(other,self,"DIA_Gilbert_Und_15_00");	//Rozmawia�em z kilkoma lud�mi.
	AI_Output(self,other,"DIA_Gilbert_Und_04_01");	//I?
	AI_Output(other,self,"DIA_Gilbert_Und_04_02");	//Szakal do�� dobrze jeszcze pami�ta ciebie i twoje przygody.
	AI_Output(other,self,"DIA_Gilbert_Und_04_03");	//Fisk wprawdzie te� ci� kojarzy, ale nie wie nic o �adnych problemach.
	AI_Output(other,self,"DIA_Gilbert_Und_04_04");	//A Dexter ci� nie zna.
	AI_Output(self,other,"DIA_Gilbert_Und_04_05");	//To ju� co�. Musz� jednak mie� pewno��, �e sprawa si� ju� wyja�ni�a.
	AI_Output(self,other,"DIA_Gilbert_Und_04_06");	//Id� do Gravo. Wprawdzie te� jest jedynie Kopaczem, ale ma spore wp�ywy u Magnat�w.
	AI_Output(self,other,"DIA_Gilbert_Und_04_07");	//Je�li kto� jest w stanie to wyja�ni�, to tylko on.
	AI_Output(self,other,"DIA_Gilbert_Und_04_08");	//Znajdziesz go przy wodopoju, ko�o bramy do zamku.
	B_LogEntry(CH1_GILBERT,"Gilbert poprosi� mnie, abym zamieni� par� s��w z tym Gravo. Je�li kto� jest w stanie pom�c Gilbertowi, to tylko on. Pono� kr�ci si� gdzie� zawsze przy wodopoju, ko�o bramy do zamku.");
};


instance DIA_GILBERT_ORE(C_Info)
{
	npc = Non_1500_Gilbert;
	nr = 1;
	condition = dia_gilbert_ore_condition;
	information = dia_gilbert_ore_info;
	permanent = 0;
	description = "Rozmawia�em z Gravo.";
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
	AI_Output(other,self,"DIA_Gilbert_Ore_15_00");	//Rozmawia�em z Gravo.
	AI_Output(self,other,"DIA_Gilbert_Ore_04_01");	//I?
	AI_Output(other,self,"DIA_Gilbert_Ore_04_02");	//Liczy sobie 500 bry�ek za swoj� pomoc.
	AI_Output(self,other,"DIA_Gilbert_Ore_04_03");	//500 bry�ek? Mo�na si� by�o spodziewa�, �e troch� drogo to wyjdzie.
	AI_Output(other,self,"DIA_Gilbert_Ore_04_04");	//Tylko mi teraz nie m�w, �e nie masz tej rudy.
	AI_Output(self,other,"DIA_Gilbert_Ore_04_05");	//Pewnie, �e mam, ale nie tutaj.
	AI_Output(self,other,"DIA_Gilbert_Ore_04_06");	//Le�y dalej w mojej starej chacie na targowisku.
	AI_Output(self,other,"DIA_Gilbert_Ore_04_07");	//Tylko problem w tym, �e jaki� czas temu zapodzia� mi si� gdzie� klucz.
	AI_Output(self,other,"DIA_Gilbert_Ore_04_08");	//Chocia� mo�esz spokojnie z�ama� mechanizm skrzyni, je�li tylko nauczysz si� otwierania zamk�w.
	AI_Output(self,other,"DIA_Gilbert_Ore_04_09");	//Przez ten czas z pewno�ci� ju� kto� inny zd��y� przej�� sobie moj� chat�.
	AI_Output(self,other,"DIA_Gilbert_Ore_04_10");	//Dlatego umiej�tno�� skradania r�wnie� by ci si� przyda�a.
	AI_Output(self,other,"DIA_Gilbert_Ore_04_11");	//Moja chata stoi na prawo od cha�upy pewnego kopacza imieniem Dusty.
	B_LogEntry(CH1_GILBERT,"Gilbert wskaza� mi miejsce, w kt�rym trzyma swoj� rud�. Le�y ona w skrzyni, w chacie na prawo od cha�upy Kopacza o imieniu Dusty.");
};


instance DIA_GILBERT_FINISHED(C_Info)
{
	npc = Non_1500_Gilbert;
	nr = 1;
	condition = dia_gilbert_finished_condition;
	information = dia_gilbert_finished_info;
	permanent = 0;
	description = "Mo�esz uzna� spraw� za za�atwion�.";
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
	AI_Output(other,self,"DIA_Gilbert_Finished_15_00");	//Mo�esz uzna� spraw� za za�atwion�.
	AI_Output(self,other,"DIA_Gilbert_Finished_04_01");	//Czy to znaczy, �e mog� ju� wr�ci� do obozu?
	AI_Output(other,self,"DIA_Gilbert_Finished_04_02");	//Ot� to.
	AI_Output(self,other,"DIA_Gilbert_Finished_04_03");	//Znakomicie. Dzi�ki ch�opie. Jestem ci co� winien.
	AI_Output(other,self,"DIA_Gilbert_Finished_04_04");	//To mo�e jaka� konkretna nagroda?
	AI_Output(self,other,"DIA_Gilbert_Finished_04_05");	//Tak, trzymaj. Zas�u�y�e� sobie.
	AI_Output(self,other,"DIA_Gilbert_Finished_04_06");	//Wr�c� niebawem znowu do obozu, ale to mo�e jeszcze poczeka�.
	AI_Output(self,other,"DIA_Gilbert_Finished_04_07");	//Na pewno jeszcze si� kiedy� spotkamy. Hehe.
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
	B_LogEntry(CH1_GILBERT,"Gilbert by� zadowolony z moich poczyna� i ofiarowa� mi w ramach nagrody do�� u�yteczny przedmiot. Niebawem znowu b�dzie mo�na go spotka� w Starym Obozie.");
	B_GiveXP(XP_GILBERT);
};

