
instance DIA_Aidan_Exit(C_Info)
{
	npc = ORG_859_Aidan;
	nr = 999;
	condition = DIA_Aidan_Exit_Condition;
	information = DIA_Aidan_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Aidan_Exit_Condition()
{
	return 1;
};

func void DIA_Aidan_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Aidan_Hello(C_Info)
{
	npc = ORG_859_Aidan;
	nr = 1;
	condition = DIA_Aidan_Hello_Condition;
	information = DIA_Aidan_Hello_Info;
	permanent = 0;
	description = "Co tu robisz?";
};


func int DIA_Aidan_Hello_Condition()
{
	return 1;
};

func void DIA_Aidan_Hello_Info()
{
	AI_Output(other,self,"DIA_Aidan_Hello_15_00");	//Co tu robisz?
	AI_Output(self,other,"DIA_Aidan_Hello_13_01");	//Jestem myœliwym. Utrzymujê siê ze sprzeda¿y skór i k³ów zabitych zwierz¹t.
	AI_Output(other,self,"DIA_Aidan_Hello_15_02");	//Da siê z tego wy¿yæ?
	AI_Output(self,other,"DIA_Aidan_Hello_13_03");	//Jeœli potrafi siê zrêcznie oporz¹dzaæ zwierzynê - tak, i to ca³kiem nieŸle!
	Log_CreateTopic(GE_TeacherOW,LOG_NOTE);
	B_LogEntry(GE_TeacherOW,"Aidan, myœliwy mieszkaj¹cy na drodze pomiêdzy Starym a Nowym Obozem, mo¿e mnie nauczyæ, jak patroszyæ upolowan¹ zwierzynê.");
};


instance Org_859_Aidan_Creatures(C_Info)
{
	npc = ORG_859_Aidan;
	nr = 1;
	condition = Org_859_Aidan_Creatures_Condition;
	information = Org_859_Aidan_Creatures_Info;
	permanent = 1;
	description = "Chcia³bym siê nauczyæ oprawiaæ zwierzynê.";
};


func int Org_859_Aidan_Creatures_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Aidan_Hello) && ((Knows_GetTeeth == FALSE) || (Knows_GetFur == FALSE) || (Knows_GetClaws == FALSE) || (Knows_GetHide == FALSE)))
	{
		return 1;
	};
};

func void Org_859_Aidan_Creatures_Info()
{
	AI_Output(other,self,"Org_859_Aidan_Creatures_15_00");	//Chcia³bym siê nauczyæ oprawiaæ zwierzynê.
	if((Knows_GetTeeth == FALSE) || (Knows_GetFur == FALSE) || (Knows_GetClaws == FALSE) || (Knows_GetHide == FALSE))
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_13_01");	//A co chcesz wiedzieæ?
		Info_ClearChoices(Org_859_Aidan_Creatures);
		Info_AddChoice(Org_859_Aidan_Creatures,DIALOG_BACK,Org_859_Aidan_Creatures_BACK);
		if(Knows_GetTeeth == FALSE)
		{
			Info_AddChoice(Org_859_Aidan_Creatures,"Usuwanie k³ów (koszt: 1 punkt umiejêtnoœci, 50 bry³ek rudy)",Org_859_Aidan_Creatures_Zahn);
		};
		if(Knows_GetFur == FALSE)
		{
			Info_AddChoice(Org_859_Aidan_Creatures,"Œci¹ganie futer (koszt: 1 punkt umiejêtnoœci, 100 bry³ek rudy)",Org_859_Aidan_Creatures_Fell);
		};
		if(Knows_GetClaws == FALSE)
		{
			Info_AddChoice(Org_859_Aidan_Creatures,"Usuwanie pazurów (koszt: 1 punkt umiejêtnoœci, 50 bry³ek rudy)",Org_859_Aidan_Creatures_Kralle);
		};
		if(Knows_GetHide == FALSE)
		{
			Info_AddChoice(Org_859_Aidan_Creatures,"Skórowanie gadów (koszt: 1 punkt umiejêtnoœci, 100 bry³ek rudy)",Org_859_Aidan_Creatures_Haut);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_TaughtAll_13_00");	//Nauczy³em ciê ju¿ wszystkiego co sam wiem.
	};
};

func void Org_859_Aidan_Creatures_BACK()
{
	Info_ClearChoices(Org_859_Aidan_Creatures);
};

func void Org_859_Aidan_Creatures_Zahn()
{
	AI_Output(other,self,"Org_859_Aidan_Creatures_Zahn_15_00");	//Jak mogê zdobyæ k³y upolowanej zwierzyny?
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,50);
			PrintScreen("Nowa umiejêtnoœæ: Zdobywanie k³ów",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(self,other,"Org_859_Aidan_Creatures_Zahn_13_01");	//Przede wszystkim musisz uwa¿aæ, ¿eby k³y nie popêka³y podczas wyci¹gania. W tym celu wbij nó¿ w pobli¿u œrodka zêba i delikatnie go podwa¿aj.
			AI_Output(self,other,"Org_859_Aidan_Creatures_Zahn_13_02");	//Warto zabieraæ k³y wilków, cieniostworów i zêbaczy.
			Knows_GetTeeth = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Umiejêtnoœæ zdobywania k³ów wilków, orkowych psów, zêbaczy, k¹saczy, ogarów i cieniostworów.");
		}
		else
		{
			AI_Output(self,other,"Org_859_Aidan_Creatures_KEINE_LP_13_00");	//
			PrintScreen("Za ma³o punktów umiejêtnoœci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00");	//
	};
};

func void Org_859_Aidan_Creatures_Fell()
{
	AI_Output(other,self,"Org_859_Aidan_Creatures_Fell_15_00");	//Jak mogê zdobyæ skóry upolowanej zwierzyny?
	if(Npc_HasItems(other,ItMiNugget) >= 100)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,100);
			PrintScreen("Nowa umiejêtnoœæ: Œci¹ganie futer",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(self,other,"Org_859_Aidan_Creatures_Fell_13_01");	//Zaczynaj skórowanie od zadu, przesuwaj¹c siê stopniowo ku g³owie. Spróbuj kilka razy. To nie jest takie trudne, a futra potrafi¹ byæ bardzo cenne!
			AI_Output(self,other,"Org_859_Aidan_Creatures_Fell_13_02");	//Futra wilków i cieniostworów mo¿na wykorzystaæ do szycia odzie¿y. Badaj¹c futro zabitego zwierza ³atwo ocenisz, czy nadaje siê do dalszego wykorzystania.
			Knows_GetFur = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Umiejêtnoœæ œci¹gania futer z wilków, orkowych psów, cieniostworów i trolli.");
		}
		else
		{
			AI_Output(self,other,"Org_859_Aidan_Creatures_KEINE_LP_13_00");	//
			PrintScreen("Za ma³o punktów umiejêtnoœci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00");	//
	};
};

func void Org_859_Aidan_Creatures_Kralle()
{
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,50);
			PrintScreen("Nowa umiejêtnoœæ: Zdobywanie pazurów",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(other,self,"Org_859_Aidan_Creatures_Kralle_15_00");	//Poka¿ mi jak zdobyæ pazury upolowanej zwierzyny.
			AI_Output(self,other,"Org_859_Aidan_Creatures_Kralle_13_01");	//Prawdê mówi¹c to dziecinnie proste, trzeba tylko znaæ odpowiedni¹ metodê. Wygnij pazury do przodu - nigdy do ty³u! I pod ¿adnym pozorem nie próbuj ich wyci¹gaæ!
			AI_Output(self,other,"Org_859_Aidan_Creatures_Kralle_13_02");	//Najlepiej pozyskiwaæ pazury jaszczurów. Od tej pory bêdziesz wiedzia³, które zwierzêta dostarczaj¹ dobrych pazurów.
			Knows_GetClaws = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Umiejêtnoœæ wyci¹gania pazurów jaszczurów, zêbaczy, topielców, k¹saczy i brzytew.");
		}
		else
		{
			AI_Output(self,other,"Org_859_Aidan_Creatures_KEINE_LP_13_00");	//
			PrintScreen("Za ma³o punktów umiejêtnoœci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00");	//
	};
};

func void Org_859_Aidan_Creatures_Haut()
{
	if(Npc_HasItems(other,ItMiNugget) >= 100)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,100);
			PrintScreen("Nowa umiejêtnoœæ: Skórowanie jaszczurów",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(other,self,"Org_859_Aidan_Creatures_Haut_15_00");	//Na co powinienem zwracaæ uwagê zdzieraj¹c skórê z gadów?
			AI_Output(self,other,"Org_859_Aidan_Creatures_Haut_13_01");	//Skóry topielców i bagiennych wê¿y s¹ szczególnie cenne.
			AI_Output(self,other,"Org_859_Aidan_Creatures_Haut_13_02");	//Jeœli przetniesz skórê na bokach, powinna sama odejœæ od miêsa. Myœlê, ¿e od tej pory poradzisz ju¿ sobie ze skórowaniem gadów.
			Knows_GetHide = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Umiejêtnoœæ skórowania jaszczurów i b³otnych wê¿y.");
		}
		else
		{
			AI_Output(self,other,"Org_859_Aidan_Creatures_KEINE_LP_13_00");	//
			PrintScreen("Za ma³o punktów umiejêtnoœci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00");	//
	};
};


instance DIA_AIDAN_BLACKWOLF(C_Info)
{
	npc = ORG_859_Aidan;
	nr = 1;
	condition = dia_aidan_blackwolf_condition;
	information = dia_aidan_blackwolf_info;
	permanent = 0;
	description = "Zobacz, co ja tu mam.";
};


func int dia_aidan_blackwolf_condition()
{
	if((hunt_wolf == LOG_RUNNING) && Npc_HasItems(hero,itat_blackwolf_01))
	{
		return TRUE;
	};
};

func void dia_aidan_blackwolf_info()
{
	AI_Output(other,self,"DIA_Aidan_BlackWolf_15_00");	//Zobacz, co ja tu mam.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_01");	//Co... co to za skóra?
	AI_Output(other,self,"DIA_Aidan_BlackWolf_13_02");	//Zdar³em j¹ z czarnego wilka.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_03");	//Z czarnego wilka? No cz³owieku, naprawdê jestem pod wra¿eniem.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_04");	//Ostatni raz widzia³em to stworzenie wieki temu.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_05");	//Jakieœ kilka lat temu, kiedy to Nowy Obóz dopiero co powsta³, ¿y³a sobie pewna grupka myœliwych.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_06");	//Porz¹dni ludzie. Mieli niema³e pojêcie o ¿yciu w dziczy.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_07");	//I có¿, kr¹¿y³y od d³u¿szego czasu pog³oski o czarnym wilku, który to krêci³ siê w lesie na pó³nocy kolonii.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_08");	//Jak tylko szanowne grono siê o tym dowiedzia³o, migiem poszli zapolowaæ na tego wilczura. Te¿ by³em wówczas myœliwym, jednak nie na tyle doœwiadczonym, by iœæ z nimi.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_09");	//Co - jak siê póŸniej okaza³o - wcale takie z³e nie by³o...
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_10");	//Tygodnie mija³y. Myœliwi wrócili do obozu, ¿eby uzupe³niæ zapasy. No i... ju¿ wiêcej ich potem nie widziano.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_11");	//Pewnie znaleŸli tego wilka, ale nie uda³o im siê z nim uporaæ.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_12");	//Wtenczas obieca³em im za niego nagrodê. Ca³e krocie rudy...
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_13");	//Teraz jednak nie mogê ci ofiarowaæ rudy, bo samemu z ni¹ u mnie krucho.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_14");	//Ale - mogê ci odst¹piæ coœ innego.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_15");	//Ten oto ³uk, nale¿a³ do przywódcy grupy myœliwych. Znalaz³em go dawno temu na wschodzie kolonii, na stromym wybrze¿u.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_16");	//Jestem pewien, ¿e nie raz ci siê przyda. Marus z pewnoœci¹ nie mia³by nic przeciwko, jeœli odda³bym jego ³uk takiemu doœwiadczonemu myœliwemu.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_17");	//Dziêki raz jeszcze za fatygê.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_18");	//Do zobaczenia przy ³owach!
	hunt_wolf = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_BLACKWOLF,LOG_SUCCESS);
	B_LogEntry(CH1_BLACKWOLF,"Aidan by³ pod wielkim wra¿eniem, ¿e uda³o mi siê za³atwiæ czarnego wilka, na którego on ju¿ tak d³ugo polowa³. Opowiedzia³ mi ponadto, jak to przede mn¹ pewna grupa myœliwych w kolonii rwa³a siê do polowania na tego wilczura. Niestety, nigdy wiêcej nie wrócili. Pewnie ma to zwi¹zek z tym opuszczonym obozem myœliwych na wschodzie kolonii. Jako nagrodê dosta³em w swoje rêce wyj¹tkowy ³uk, razem z kilkoma strza³ami.");
	B_GiveXP(XP_BLACKWOLF);
	CreateInvItem(self,loner_bogen);
	B_GiveInvItems(self,hero,loner_bogen,1);
	CreateInvItems(hero,ItAmArrow,30);
	Npc_RemoveInvItems(hero,itat_blackwolf_01,1);
};

