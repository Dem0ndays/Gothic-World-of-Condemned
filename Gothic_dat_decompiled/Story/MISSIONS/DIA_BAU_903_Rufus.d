
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
	description = "Przysy³a mnie Lewus. Przynoszê ci wodê.";
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
	AI_Output(other,self,"Info_Rufus_Wasser_15_00");	//Przysy³a mnie Lewus. Przynoszê ci wodê.
	if(Npc_HasItems(other,ItFo_Potion_Water_01) >= 1)
	{
		AI_Output(self,other,"Info_Rufus_Wasser_02_01");	//Dziêki, stary. W gêbie mi ju¿ zasch³o.
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
		AI_Output(self,other,"Info_Rufus_Wasser_NOWATER_02_00");	//Woda?! Hej, kolego! Nic ci ju¿ nie zosta³o. Tylko mi nie mów, ¿e znowu wszyscy zd¹¿yli siê napiæ oprócz mnie!
	};
};


instance DIA_Rufus_Hello(C_Info)
{
	npc = BAU_903_Rufus;
	nr = 1;
	condition = DIA_Rufus_Hello_Condition;
	information = DIA_Rufus_Hello_Info;
	permanent = 0;
	description = "Czeœæ! Jestem tu nowy. Chcia³bym siê dowiedzieæ, co siê tu dzieje.";
};


func int DIA_Rufus_Hello_Condition()
{
	return 1;
};

func void DIA_Rufus_Hello_Info()
{
	AI_Output(other,self,"DIA_Rufus_Hello_15_00");	//Czeœæ! Jestem tu nowy. Chcia³bym siê dowiedzieæ, co siê tu dzieje.
	AI_Output(self,other,"DIA_Rufus_Hello_02_01");	//Zapytaj kogoœ innego, dobra? Ja tu tylko uprawiam ry¿. Na innych rzeczach siê nie znam.
	AI_Output(self,other,"DIA_Rufus_Hello_02_02");	//Najchêtniej powiedzia³bym Ry¿owemu Ksiêciuniowi, ¿eby sam odwala³ swoj¹ brudn¹ robotê!
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
	AI_Output(self,other,"DIA_Rufus_Why_02_01");	//To siê zdarzy³o pierwszego dnia po moim przybyciu. Lewus, jeden z oprychów pracuj¹cych dla Ry¿owego Ksiêcia, podszed³ do mnie i spyta³ czy nie móg³bym im pomóc na polu.
	AI_Output(self,other,"DIA_Rufus_Why_02_02");	//Powiedzia³em "jasne". W koñcu by³em tu nowy i zale¿a³o mi na znalezieniu sobie przyjació³.
	AI_Output(self,other,"DIA_Rufus_Why_02_03");	//Nastêpnego dnia, kiedy ucina³em sobie drzemkê, facet znowu siê zjawi³.
	AI_Output(self,other,"DIA_Rufus_Why_02_04");	//Powiedzia³: "Chyba nie chcesz, ¿eby twoi koledzy odwalali za ciebie ca³¹ robotê, co?".
	AI_Output(self,other,"DIA_Rufus_Why_02_05");	//Powiedzia³em mu, ¿e jestem wyczerpany wczorajsz¹ prac¹, i ¿e potrzebujê odpoczynku. Ale on mia³ to gdzieœ.
	AI_Output(self,other,"DIA_Rufus_Why_02_06");	//Z³apa³ mnie za ko³nierz i ZACI¥GN¥£ z powrotem na pole.
	AI_Output(self,other,"DIA_Rufus_Why_02_07");	//Od tamtej pory codziennie czeka³ na mnie na progu mojej chaty - dopóki nie nauczy³em siê sam wychodziæ w pole. Nie chcia³em, ¿eby mnie poturbowali.
	AI_Output(self,other,"DIA_Rufus_Why_02_08");	//To banda morderców. Lepiej trzymaj siê od nich z daleka.
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
	description = "Kim jest Ry¿owy Ksi¹¿e?";
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
	AI_Output(other,self,"DIA_Rufus_Ricelord_15_00");	//Kim jest Ry¿owy Ksi¹¿e?
	AI_Output(self,other,"DIA_Rufus_Ricelord_02_01");	//By³ jednym z pierwszych ludzi, którzy tutaj trafili. Pomaga³ w zak³adaniu Obozu i rozpocz¹³ uprawê ry¿u.
	AI_Output(self,other,"DIA_Rufus_Ricelord_02_02");	//Dziœ jedyne, co robi, to obnosi swoje brzuszysko po magazynie. T³usty wieprz!
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
	description = "Mogê ci jakoœ pomóc?";
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
	AI_Output(other,self,"DIA_Rufus_NeedHelp_02_01");	//Mogê ci jakoœ pomóc?
	AI_Output(self,other,"DIA_Rufus_NeedHelp_02_02");	//Nie, nie s¹dzê. Chocia¿... skoro ju¿ pytasz.
	AI_Output(self,other,"DIA_Rufus_NeedHelp_02_03");	//Mia³bym coœ dla ciebie. Chcia³bym udzieliæ porz¹dnej lekcji Ry¿owemu Ksiêciuniowi i jego bandzie zawadiaków.
	AI_Output(other,self,"DIA_Rufus_NeedHelp_02_04");	//I co niby? Mam ich wzi¹æ wszystkich na siebie?
	AI_Output(self,other,"DIA_Rufus_NeedHelp_02_05");	//Nie, nie. Nie musisz nikomu od razu dawaæ w zêby.
	AI_Output(other,self,"DIA_Rufus_NeedHelp_02_06");	//Tylko?
	AI_Output(self,other,"DIA_Rufus_NeedHelp_02_07");	//Oni sami musz¹ sobie skoczyæ do garde³. Hehe.
	AI_Output(self,other,"DIA_Rufus_NeedHelp_02_08");	//Ry¿owy Ksi¹¿e jest w³aœcicielem skrzyni, w której trzyma kilka ciekawych rzeczy, w tym pewien cenny pierœcieñ. Chcê, ¿ebyœ go wykrad³ z tej skrzyni.
	AI_Output(self,other,"DIA_Rufus_NeedHelp_02_09");	//Potem musisz zadbaæ o to, aby to Lewus wszed³ w posiadanie tego pierœcienia.
	AI_Output(self,other,"DIA_Rufus_NeedHelp_02_10");	//Po czym "wspomnisz" podczas rozmowy z Ksiêciem, ¿e dzier¿y go Lewus.
	AI_Output(self,other,"DIA_Rufus_NeedHelp_02_11");	//Nie mogê siê doczekaæ, ¿eby zobaczyæ jego têpy wyraz twarzy. Hehe.
	AI_Output(self,other,"DIA_Rufus_NeedHelp_02_12");	//Ano, i musisz sobie jeszcze jakoœ za³atwiæ klucz do skrzyni Ry¿owego Ksiêcia. Pewnie le¿y gdzieœ w jego siedzibie.
	AI_StopProcessInfos(self);
	riot_ricelord = LOG_RUNNING;
	Log_CreateTopic(CH1_RICELORD,LOG_MISSION);
	Log_SetTopicStatus(CH1_RICELORD,LOG_RUNNING);
	B_LogEntry(CH1_RICELORD,"Rufus, ch³op pracuj¹cy na polach Nowego Obozu, chce udzieliæ porz¹dnej lekcji Ry¿owemu Ksiêciu i jego paliwodom. ¯yczy sobie, abym za³atwi³ sobie klucz do skrzyni Ksiêcia, po czym zadba³ o to, aby pewien cenny pierœcieñ ze skrzyni powêdrowa³ do kieszeni Lewusa. W koñcu mam poinformowaæ o tym Ry¿owego Ksiêcia i wsypaæ Lewusa jako z³odzieja.");
};


instance DIA_RUFUS_DONE(C_Info)
{
	npc = BAU_903_Rufus;
	nr = 1;
	condition = dia_rufus_done_condition;
	information = dia_rufus_done_info;
	permanent = 0;
	description = "Zaj¹³em siê Lewusem.";
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
	AI_Output(other,self,"DIA_Rufus_Done_02_01");	//Zaj¹³em siê Lewusem.
	AI_Output(self,other,"DIA_Rufus_Done_02_02");	//Tak, widzia³em. Hehe.
	AI_Output(self,other,"DIA_Rufus_Done_02_03");	//Nareszcie ten obdartus dosta³ to, na co zas³u¿y³.
	AI_Output(self,other,"DIA_Rufus_Done_02_06");	//Trzymaj, za³atwi³em trochê ry¿ówki, chêtnie ci j¹ oddam.
	AI_Output(other,self,"DIA_Rufus_Done_02_07");	//Dziêki, trzymaj siê!
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
	B_LogEntry(CH1_RICELORD,"Rufus by³ zachwycony i uradowany tym, ¿e Lewus w koñcu dosta³ to, na co zas³u¿y³. Nawet otrzyma³em od niego nagrodê za robotê.");
	B_GiveXP(XP_LEFTYRICELORD);
};

