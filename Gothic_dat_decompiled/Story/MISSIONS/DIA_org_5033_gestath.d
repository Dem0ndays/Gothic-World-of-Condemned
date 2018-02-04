
instance DIA_GESTATH_EXIT(C_Info)
{
	npc = org_5033_gestath;
	nr = 999;
	condition = dia_gestath_exit_condition;
	information = dia_gestath_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_gestath_exit_condition()
{
	return 1;
};

func void dia_gestath_exit_info()
{
	AI_StopProcessInfos(self);
};


instance dia_gestath_hello(C_Info)
{
	npc = org_5033_gestath;
	nr = 1;
	condition = dia_gestath_hello_condition;
	information = dia_gestath_hello_info;
	permanent = 0;
	description = "Czym siê tutaj zajmujesz?";
};


func int dia_gestath_hello_condition()
{
	return 1;
};

func void dia_gestath_hello_info()
{
	AI_Output(other,self,"DIA_Org_5033_Gestath_Hello_15_00");	//Czym siê tutaj zajmujesz?
	AI_Output(self,other,"DIA_Org_5033_Gestath_Hello_13_01");	//Jestem myœliwym. Przemierzam koloniê wzd³u¿ i wszerz przy okazji poluj¹c.
	AI_Output(other,self,"DIA_Org_5033_Gestath_Hello_13_02");	//Mo¿esz mnie czegoœ nauczyæ?
	AI_Output(self,other,"DIA_Org_5033_Gestath_Hello_13_03");	//Pewnie, ale to ciê bêdzie nieco kosztowaæ.
	Log_CreateTopic(GE_TeacherOW,LOG_NOTE);
	B_LogEntry(GE_TeacherOW,"Gestath, myœliwy ¿yj¹cy miêdzy Woln¹ Kopalni¹ a Nowym Obozem, mo¿e mnie nauczyæ patroszyæ zwierzynê.");
};


instance dia_gestath_armor(C_Info)
{
	npc = org_5033_gestath;
	nr = 1;
	condition = dia_gestath_armor_condition;
	information = dia_gestath_armor_info;
	permanent = 0;
	description = "Masz na sobie interesuj¹cy pancerz.";
};


func int dia_gestath_armor_condition()
{
	if(Npc_KnowsInfo(hero,dia_gestath_hello))
	{
		return 1;
	};
};

func void dia_gestath_armor_info()
{
	AI_Output(other,self,"DIA_Org_5033_Gestath_Armor_15_00");	//Masz na sobie interesuj¹cy pancerz.
	AI_Output(self,other,"DIA_Org_5033_Gestath_Armor_13_01");	//Ciê¿ko siê z tym nie zgodziæ. Zrobi³ go dla mnie cz³owiek imieniem Wilk.
	AI_Output(self,other,"DIA_Org_5033_Gestath_Armor_13_02");	//Przynios³em mu tylko niezbêdne materia³y, a nastêpnego dnia zbroja by³a ju¿ gotowa. W porz¹dku facet.
};


instance org_859_gestath_creatures(C_Info)
{
	npc = org_5033_gestath;
	nr = 1;
	condition = org_859_gestath_creatures_condition;
	information = org_859_gestath_creatures_info;
	permanent = 1;
	description = "Chcia³bym siê nauczyæ oprawiaæ zwierzynê.";
};


func int org_859_gestath_creatures_condition()
{
	if(Npc_KnowsInfo(hero,dia_gestath_hello) && ((Knows_GetTeeth == FALSE) || (Knows_GetFur == FALSE) || (Knows_GetClaws == FALSE) || (Knows_GetHide == FALSE)))
	{
		return 1;
	};
};

func void org_859_gestath_creatures_info()
{
	AI_Output(other,self,"Org_859_Gestath_Creatures_15_00");	//Chcia³bym siê nauczyæ oprawiaæ zwierzynê.
	if((Knows_GetTeeth == FALSE) || (Knows_GetFur == FALSE) || (Knows_GetClaws == FALSE) || (Knows_GetHide == FALSE))
	{
		AI_Output(self,other,"Org_859_Gestath_Creatures_13_01");	//Co chcesz wiedzieæ?
		Info_ClearChoices(org_859_gestath_creatures);
		Info_AddChoice(org_859_gestath_creatures,DIALOG_BACK,org_859_gestath_creatures_back);
		if(Knows_GetTeeth == FALSE)
		{
			Info_AddChoice(org_859_gestath_creatures,"Usuwanie k³ów (koszt: 1 punkt umiejêtnoœci, 50 bry³ek rudy)",org_859_gestath_creatures_zahn);
		};
		if(Knows_GetFur == FALSE)
		{
			Info_AddChoice(org_859_gestath_creatures,"Œci¹ganie futer (koszt: 1 punkt umiejêtnoœci, 100 bry³ek rudy)",org_859_gestath_creatures_fell);
		};
		if(Knows_GetClaws == FALSE)
		{
			Info_AddChoice(org_859_gestath_creatures,"Usuwanie pazurów (koszt: 1 punkt umiejêtnoœci, 50 bry³ek rudy)",org_859_gestath_creatures_kralle);
		};
		if(Knows_GetHide == FALSE)
		{
			Info_AddChoice(org_859_gestath_creatures,"Skórowanie gadów (koszt: 1 punkt umiejêtnoœci, 100 bry³ek rudy)",org_859_gestath_creatures_haut);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Gestath_Creatures_TaughtAll_13_00");	//Powiedzia³em ci ju¿ wszystko co wiem.
	};
};

func void org_859_gestath_creatures_back()
{
	Info_ClearChoices(org_859_gestath_creatures);
};

func void org_859_gestath_creatures_zahn()
{
	AI_Output(other,self,"Org_859_Gestath_Creatures_Zahn_15_00");	//Jak mogê zdobyæ k³y upolowanej zwierzyny?
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,50);
			PrintScreen("Nowa umiejêtnoœæ: Zdobywanie k³ów",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(self,other,"Org_859_Gestath_Creatures_Zahn_13_01");	//Przede wszystkim musisz uwa¿aæ, ¿eby k³y nie popêka³y podczas wyci¹gania. W tym celu wbij nó¿ w pobli¿u œrodka zêba i delikatnie go podwa¿aj.
			AI_Output(self,other,"Org_859_Gestath_Creatures_Zahn_13_02");	//Warto zabieraæ k³y wilków, cieniostworów i zêbaczy.
			Knows_GetTeeth = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Umiejêtnoœæ zdobywania k³ów wilków, orkowych psów, zêbaczy, k¹saczy, ogarów i cieniostworów.");
		}
		else
		{
			AI_Output(self,other,"Org_859_Gestath_Creatures_KEINE_LP_13_00");	//
			PrintScreen("Za ma³o punktów umiejêtnoœci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Gestath_Creatures_KEIN_ERZ_13_00");	//
	};
};

func void org_859_gestath_creatures_fell()
{
	AI_Output(other,self,"Org_859_Gestath_Creatures_Fell_15_00");	//Jak mogê zdobyæ skóry upolowanej zwierzyny?
	if(Npc_HasItems(other,ItMiNugget) >= 100)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,100);
			PrintScreen("Nowa umiejêtnoœæ: Œci¹ganie futer",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(self,other,"Org_859_Gestath_Creatures_Fell_13_01");	//Zaczynaj skórowanie od zadu, przesuwaj¹c siê stopniowo ku g³owie. Spróbuj kilka razy. To nie jest takie trudne, a futra potrafi¹ byæ bardzo cenne!
			AI_Output(self,other,"Org_859_Gestath_Creatures_Fell_13_02");	//Futra wilków i cieniostworów mo¿na wykorzystaæ do szycia odzie¿y. Badaj¹c futro zabitego zwierza ³atwo ocenisz, czy nadaje siê do dalszego wykorzystania.
			Knows_GetFur = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Umiejêtnoœæ œci¹gania futer z wilków, orkowych psów, cieniostworów i trolli.");
		}
		else
		{
			AI_Output(self,other,"Org_859_Gestath_Creatures_KEINE_LP_13_00");	//
			PrintScreen("Za ma³o punktów umiejêtnoœci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Gestath_Creatures_KEIN_ERZ_13_00");	//
	};
};

func void org_859_gestath_creatures_kralle()
{
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,50);
			PrintScreen("Nowa umiejêtnoœæ: Zdobywanie pazurów",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(other,self,"Org_859_Gestath_Creatures_Kralle_15_00");	//Poka¿ mi jak zdobyæ pazury upolowanej zwierzyny.
			AI_Output(self,other,"Org_859_Gestath_Creatures_Kralle_13_01");	//Prawdê mówi¹c to dziecinnie proste, trzeba tylko znaæ odpowiedni¹ metodê. Wygnij pazury do przodu - nigdy do ty³u! I pod ¿adnym pozorem nie próbuj ich wyci¹gaæ!
			AI_Output(self,other,"Org_859_Gestath_Creatures_Kralle_13_02");	//Najlepiej pozyskiwaæ pazury jaszczurów. Od tej pory bêdziesz wiedzia³, które zwierzêta dostarczaj¹ dobrych pazurów.
			Knows_GetClaws = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Umiejêtnoœæ wyci¹gania pazurów jaszczurów, zêbaczy, topielców, k¹saczy i brzytew.");
		}
		else
		{
			AI_Output(self,other,"Org_859_Gestath_Creatures_KEINE_LP_13_00");	//
			PrintScreen("Za ma³o punktów umiejêtnoœci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Gestath_Creatures_KEIN_ERZ_13_00");	//
	};
};

func void org_859_gestath_creatures_haut()
{
	if(Npc_HasItems(other,ItMiNugget) >= 100)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,100);
			PrintScreen("Nowa umiejêtnoœæ: Skórowanie jaszczurów",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(other,self,"Org_859_Gestath_Creatures_Haut_15_00");	//Na co powinienem zwracaæ uwagê zdzieraj¹c skórê z gadów?
			AI_Output(self,other,"Org_859_Gestath_Creatures_Haut_13_01");	//Skóry topielców i bagiennych wê¿y s¹ szczególnie cenne.
			AI_Output(self,other,"Org_859_Gestath_Creatures_Haut_13_02");	//Jeœli przetniesz skórê na bokach, powinna sama odejœæ od miêsa. Myœlê, ¿e od tej pory poradzisz ju¿ sobie ze skórowaniem gadów.
			Knows_GetHide = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Umiejêtnoœæ skórowania jaszczurów i b³otnych wê¿y.");
		}
		else
		{
			AI_Output(self,other,"Org_859_Gestath_Creatures_KEINE_LP_13_00");	//
			PrintScreen("Za ma³o punktów umiejêtnoœci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Gestath_Creatures_KEIN_ERZ_13_00");	//
	};
};

