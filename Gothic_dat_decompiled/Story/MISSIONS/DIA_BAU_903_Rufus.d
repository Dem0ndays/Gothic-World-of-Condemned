
instance DIA_Rufus_EXIT(C_Info)
{
	npc = BAU_903_Rufus;
	nr = 999;
	condition = DIA_Rufus_EXIT_Condition;
	information = DIA_Rufus_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Rufus_EXIT_Condition()
{
	return 1;
};

func void DIA_Rufus_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Rufus_Wasser(C_Info)
{
	npc = BAU_903_Rufus;
	nr = 800;
	condition = Info_Rufus_Wasser_Condition;
	information = Info_Rufus_Wasser_Info;
	permanent = 1;
	description = "Przysy�a mnie Lewus. Przynosz� ci wod�.";
};


func int Info_Rufus_Wasser_Condition()
{
	if((Lefty_Mission == LOG_RUNNING) && Npc_HasItems(other,ItFo_Potion_Water_01) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return 1;
	};
};

func void Info_Rufus_Wasser_Info()
{
	AI_Output(other,self,"Info_Rufus_Wasser_15_00");	//Przysy�a mnie Lewus. Przynosz� ci wod�.
	if(Npc_HasItems(other,ItFo_Potion_Water_01) >= 1)
	{
		AI_Output(self,other,"Info_Rufus_Wasser_02_01");	//Dzi�ki, stary. W g�bie mi ju� zasch�o.
		B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,ItFo_Potion_Water_01);
		An_Bauern_verteilt = An_Bauern_verteilt + 1;
		if(An_Bauern_verteilt >= DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Rufus_Wasser_NOWATER_02_00");	//Woda?! Hej, kolego! Nic ci ju� nie zosta�o. Tylko mi nie m�w, �e znowu wszyscy zd��yli si� napi� opr�cz mnie!
	};
};


instance DIA_Rufus_Hello(C_Info)
{
	npc = BAU_903_Rufus;
	nr = 1;
	condition = DIA_Rufus_Hello_Condition;
	information = DIA_Rufus_Hello_Info;
	permanent = 0;
	description = "Cze��! Jestem tu nowy. Chcia�bym si� dowiedzie�, co si� tu dzieje.";
};


func int DIA_Rufus_Hello_Condition()
{
	return 1;
};

func void DIA_Rufus_Hello_Info()
{
	AI_Output(other,self,"DIA_Rufus_Hello_15_00");	//Cze��! Jestem tu nowy. Chcia�bym si� dowiedzie�, co si� tu dzieje.
	AI_Output(self,other,"DIA_Rufus_Hello_02_01");	//Zapytaj kogo� innego, dobra? Ja tu tylko uprawiam ry�. Na innych rzeczach si� nie znam.
	AI_Output(self,other,"DIA_Rufus_Hello_02_02");	//Najch�tniej powiedzia�bym Ry�owemu Ksi�ciuniowi, �eby sam odwala� swoj� brudn� robot�!
};


instance DIA_Rufus_Why(C_Info)
{
	npc = BAU_903_Rufus;
	nr = 1;
	condition = DIA_Rufus_Why_Condition;
	information = DIA_Rufus_Why_Info;
	permanent = 0;
	description = "Skoro tak ci to nie odpowiada, dlaczego tu pracujesz?";
};


func int DIA_Rufus_Why_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Rufus_Hello))
	{
		return 1;
	};
};

func void DIA_Rufus_Why_Info()
{
	var C_Npc Ricelord;
	AI_Output(other,self,"DIA_Rufus_Why_15_00");	//Skoro tak ci to nie odpowiada, dlaczego tu pracujesz?
	AI_Output(self,other,"DIA_Rufus_Why_02_01");	//To si� zdarzy�o pierwszego dnia po moim przybyciu. Lewus, jeden z oprych�w pracuj�cych dla Ry�owego Ksi�cia, podszed� do mnie i spyta� czy nie m�g�bym im pom�c na polu.
	AI_Output(self,other,"DIA_Rufus_Why_02_02");	//Powiedzia�em "jasne". W ko�cu by�em tu nowy i zale�a�o mi na znalezieniu sobie przyjaci�.
	AI_Output(self,other,"DIA_Rufus_Why_02_03");	//Nast�pnego dnia, kiedy ucina�em sobie drzemk�, facet znowu si� zjawi�.
	AI_Output(self,other,"DIA_Rufus_Why_02_04");	//Powiedzia�: "Chyba nie chcesz, �eby twoi koledzy odwalali za ciebie ca�� robot�, co?".
	AI_Output(self,other,"DIA_Rufus_Why_02_05");	//Powiedzia�em mu, �e jestem wyczerpany wczorajsz� prac�, i �e potrzebuj� odpoczynku. Ale on mia� to gdzie�.
	AI_Output(self,other,"DIA_Rufus_Why_02_06");	//Z�apa� mnie za ko�nierz i ZACI�GN�� z powrotem na pole.
	AI_Output(self,other,"DIA_Rufus_Why_02_07");	//Od tamtej pory codziennie czeka� na mnie na progu mojej chaty - dop�ki nie nauczy�em si� sam wychodzi� w pole. Nie chcia�em, �eby mnie poturbowali.
	AI_Output(self,other,"DIA_Rufus_Why_02_08");	//To banda morderc�w. Lepiej trzymaj si� od nich z daleka.
	Ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;
};


instance DIA_Rufus_Ricelord(C_Info)
{
	npc = BAU_903_Rufus;
	nr = 2;
	condition = DIA_Rufus_Ricelord_Condition;
	information = DIA_Rufus_Ricelord_Info;
	permanent = 1;
	description = "Kim jest Ry�owy Ksi��e?";
};


func int DIA_Rufus_Ricelord_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Rufus_Hello))
	{
		return 1;
	};
};

func void DIA_Rufus_Ricelord_Info()
{
	var C_Npc Ricelord;
	AI_Output(other,self,"DIA_Rufus_Ricelord_15_00");	//Kim jest Ry�owy Ksi��e?
	AI_Output(self,other,"DIA_Rufus_Ricelord_02_01");	//By� jednym z pierwszych ludzi, kt�rzy tutaj trafili. Pomaga� w zak�adaniu Obozu i rozpocz�� upraw� ry�u.
	AI_Output(self,other,"DIA_Rufus_Ricelord_02_02");	//Dzi� jedyne, co robi, to obnosi swoje brzuszysko po magazynie. T�usty wieprz!
	Ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;
};


instance dia_rufus_needhelp(C_Info)
{
	npc = BAU_903_Rufus;
	nr = 1;
	condition = dia_rufus_needhelp_condition;
	information = dia_rufus_needhelp_info;
	permanent = 0;
	description = "Mog� ci jako� pom�c?";
};


func int dia_rufus_needhelp_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Rufus_Hello))
	{
		return 1;
	};
};

func void dia_rufus_needhelp_info()
{
	AI_Output(other,self,"DIA_Rufus_NeedHelp_02_01");	//Mog� ci jako� pom�c?
	AI_Output(self,other,"DIA_Rufus_NeedHelp_02_02");	//Nie, nie s�dz�. Chocia�... skoro ju� pytasz.
	AI_Output(self,other,"DIA_Rufus_NeedHelp_02_03");	//Mia�bym co� dla ciebie. Chcia�bym udzieli� porz�dnej lekcji Ry�owemu Ksi�ciuniowi i jego bandzie zawadiak�w.
	AI_Output(other,self,"DIA_Rufus_NeedHelp_02_04");	//I co niby? Mam ich wzi�� wszystkich na siebie?
	AI_Output(self,other,"DIA_Rufus_NeedHelp_02_05");	//Nie, nie. Nie musisz nikomu od razu dawa� w z�by.
	AI_Output(other,self,"DIA_Rufus_NeedHelp_02_06");	//Tylko?
	AI_Output(self,other,"DIA_Rufus_NeedHelp_02_07");	//Oni sami musz� sobie skoczy� do garde�. Hehe.
	AI_Output(self,other,"DIA_Rufus_NeedHelp_02_08");	//Ry�owy Ksi��e jest w�a�cicielem skrzyni, w kt�rej trzyma kilka ciekawych rzeczy, w tym pewien cenny pier�cie�. Chc�, �eby� go wykrad� z tej skrzyni.
	AI_Output(self,other,"DIA_Rufus_NeedHelp_02_09");	//Potem musisz zadba� o to, aby to Lewus wszed� w posiadanie tego pier�cienia.
	AI_Output(self,other,"DIA_Rufus_NeedHelp_02_10");	//Po czym "wspomnisz" podczas rozmowy z Ksi�ciem, �e dzier�y go Lewus.
	AI_Output(self,other,"DIA_Rufus_NeedHelp_02_11");	//Nie mog� si� doczeka�, �eby zobaczy� jego t�py wyraz twarzy. Hehe.
	AI_Output(self,other,"DIA_Rufus_NeedHelp_02_12");	//Ano, i musisz sobie jeszcze jako� za�atwi� klucz do skrzyni Ry�owego Ksi�cia. Pewnie le�y gdzie� w jego siedzibie.
	AI_StopProcessInfos(self);
	riot_ricelord = LOG_RUNNING;
	Log_CreateTopic(CH1_RICELORD,LOG_MISSION);
	Log_SetTopicStatus(CH1_RICELORD,LOG_RUNNING);
	B_LogEntry(CH1_RICELORD,"Rufus, ch�op pracuj�cy na polach Nowego Obozu, chce udzieli� porz�dnej lekcji Ry�owemu Ksi�ciu i jego paliwodom. �yczy sobie, abym za�atwi� sobie klucz do skrzyni Ksi�cia, po czym zadba� o to, aby pewien cenny pier�cie� ze skrzyni pow�drowa� do kieszeni Lewusa. W ko�cu mam poinformowa� o tym Ry�owego Ksi�cia i wsypa� Lewusa jako z�odzieja.");
};


instance DIA_RUFUS_DONE(C_Info)
{
	npc = BAU_903_Rufus;
	nr = 1;
	condition = dia_rufus_done_condition;
	information = dia_rufus_done_info;
	permanent = 0;
	description = "Zaj��em si� Lewusem.";
};


func int dia_rufus_done_condition()
{
	if(Npc_KnowsInfo(hero,dia_ricelord_lefty))
	{
		return 1;
	};
};

func void dia_rufus_done_info()
{
	var int zufallsbelohnung;
	AI_Output(other,self,"DIA_Rufus_Done_02_01");	//Zaj��em si� Lewusem.
	AI_Output(self,other,"DIA_Rufus_Done_02_02");	//Tak, widzia�em. Hehe.
	AI_Output(self,other,"DIA_Rufus_Done_02_03");	//Nareszcie ten obdartus dosta� to, na co zas�u�y�.
	AI_Output(self,other,"DIA_Rufus_Done_02_06");	//Trzymaj, za�atwi�em troch� ry��wki, ch�tnie ci j� oddam.
	AI_Output(other,self,"DIA_Rufus_Done_02_07");	//Dzi�ki, trzymaj si�!
	zufallsbelohnung = Hlp_Random(100);
	if(zufallsbelohnung >= 75)
	{
		CreateInvItems(self,ItFoMutton,1);
		B_GiveInvItems(self,other,ItFoMutton,1);
	}
	else if(zufallsbelohnung >= 60)
	{
		CreateInvItems(self,ItFoApple,2);
		B_GiveInvItems(self,other,ItFoApple,2);
	}
	else if(zufallsbelohnung >= 50)
	{
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,5);
		B_GiveInvItems(self,hero,ItMi_Stuff_OldCoin_01,5);
	}
	else if(zufallsbelohnung >= 40)
	{
		CreateInvItems(self,ItMw_1H_Scythe_01,1);
		B_GiveInvItems(self,other,ItMw_1H_Scythe_01,1);
	}
	else if(zufallsbelohnung >= 30)
	{
		CreateInvItems(self,ItMw_1H_Sword_Short_02,1);
		B_GiveInvItems(self,other,ItMw_1H_Sword_Short_02,1);
	}
	else if(zufallsbelohnung >= 20)
	{
		CreateInvItems(self,ItMiNugget,40);
		B_GiveInvItems(self,other,ItMiNugget,40);
	}
	else if(zufallsbelohnung >= 10)
	{
		CreateInvItems(self,ItFoBooze,3);
		B_GiveInvItems(self,other,ItFoBooze,3);
	};
	AI_StopProcessInfos(self);
	riot_ricelord = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_RICELORD,LOG_SUCCESS);
	B_LogEntry(CH1_RICELORD,"Rufus by� zachwycony i uradowany tym, �e Lewus w ko�cu dosta� to, na co zas�u�y�. Nawet otrzyma�em od niego nagrod� za robot�.");
	B_GiveXP(XP_LEFTYRICELORD);
};

