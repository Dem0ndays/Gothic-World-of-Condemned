
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
	AI_Output(self,other,"DIA_Aidan_Hello_13_01");	//Jestem my�liwym. Utrzymuj� si� ze sprzeda�y sk�r i k��w zabitych zwierz�t.
	AI_Output(other,self,"DIA_Aidan_Hello_15_02");	//Da si� z tego wy�y�?
	AI_Output(self,other,"DIA_Aidan_Hello_13_03");	//Je�li potrafi si� zr�cznie oporz�dza� zwierzyn� - tak, i to ca�kiem nie�le!
	Log_CreateTopic(GE_TeacherOW,LOG_NOTE);
	B_LogEntry(GE_TeacherOW,"Aidan, my�liwy mieszkaj�cy na drodze pomi�dzy Starym a Nowym Obozem, mo�e mnie nauczy�, jak patroszy� upolowan� zwierzyn�.");
};


instance Org_859_Aidan_Creatures(C_Info)
{
	npc = ORG_859_Aidan;
	nr = 1;
	condition = Org_859_Aidan_Creatures_Condition;
	information = Org_859_Aidan_Creatures_Info;
	permanent = 1;
	description = "Chcia�bym si� nauczy� oprawia� zwierzyn�.";
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
	AI_Output(other,self,"Org_859_Aidan_Creatures_15_00");	//Chcia�bym si� nauczy� oprawia� zwierzyn�.
	if((Knows_GetTeeth == FALSE) || (Knows_GetFur == FALSE) || (Knows_GetClaws == FALSE) || (Knows_GetHide == FALSE))
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_13_01");	//A co chcesz wiedzie�?
		Info_ClearChoices(Org_859_Aidan_Creatures);
		Info_AddChoice(Org_859_Aidan_Creatures,DIALOG_BACK,Org_859_Aidan_Creatures_BACK);
		if(Knows_GetTeeth == FALSE)
		{
			Info_AddChoice(Org_859_Aidan_Creatures,"Usuwanie k��w (koszt: 1 punkt umiej�tno�ci, 50 bry�ek rudy)",Org_859_Aidan_Creatures_Zahn);
		};
		if(Knows_GetFur == FALSE)
		{
			Info_AddChoice(Org_859_Aidan_Creatures,"�ci�ganie futer (koszt: 1 punkt umiej�tno�ci, 100 bry�ek rudy)",Org_859_Aidan_Creatures_Fell);
		};
		if(Knows_GetClaws == FALSE)
		{
			Info_AddChoice(Org_859_Aidan_Creatures,"Usuwanie pazur�w (koszt: 1 punkt umiej�tno�ci, 50 bry�ek rudy)",Org_859_Aidan_Creatures_Kralle);
		};
		if(Knows_GetHide == FALSE)
		{
			Info_AddChoice(Org_859_Aidan_Creatures,"Sk�rowanie gad�w (koszt: 1 punkt umiej�tno�ci, 100 bry�ek rudy)",Org_859_Aidan_Creatures_Haut);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_TaughtAll_13_00");	//Nauczy�em ci� ju� wszystkiego co sam wiem.
	};
};

func void Org_859_Aidan_Creatures_BACK()
{
	Info_ClearChoices(Org_859_Aidan_Creatures);
};

func void Org_859_Aidan_Creatures_Zahn()
{
	AI_Output(other,self,"Org_859_Aidan_Creatures_Zahn_15_00");	//Jak mog� zdoby� k�y upolowanej zwierzyny?
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,50);
			PrintScreen("Nowa umiej�tno��: Zdobywanie k��w",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(self,other,"Org_859_Aidan_Creatures_Zahn_13_01");	//Przede wszystkim musisz uwa�a�, �eby k�y nie pop�ka�y podczas wyci�gania. W tym celu wbij n� w pobli�u �rodka z�ba i delikatnie go podwa�aj.
			AI_Output(self,other,"Org_859_Aidan_Creatures_Zahn_13_02");	//Warto zabiera� k�y wilk�w, cieniostwor�w i z�baczy.
			Knows_GetTeeth = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Umiej�tno�� zdobywania k��w wilk�w, orkowych ps�w, z�baczy, k�saczy, ogar�w i cieniostwor�w.");
		}
		else
		{
			AI_Output(self,other,"Org_859_Aidan_Creatures_KEINE_LP_13_00");	//
			PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00");	//
	};
};

func void Org_859_Aidan_Creatures_Fell()
{
	AI_Output(other,self,"Org_859_Aidan_Creatures_Fell_15_00");	//Jak mog� zdoby� sk�ry upolowanej zwierzyny?
	if(Npc_HasItems(other,ItMiNugget) >= 100)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,100);
			PrintScreen("Nowa umiej�tno��: �ci�ganie futer",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(self,other,"Org_859_Aidan_Creatures_Fell_13_01");	//Zaczynaj sk�rowanie od zadu, przesuwaj�c si� stopniowo ku g�owie. Spr�buj kilka razy. To nie jest takie trudne, a futra potrafi� by� bardzo cenne!
			AI_Output(self,other,"Org_859_Aidan_Creatures_Fell_13_02");	//Futra wilk�w i cieniostwor�w mo�na wykorzysta� do szycia odzie�y. Badaj�c futro zabitego zwierza �atwo ocenisz, czy nadaje si� do dalszego wykorzystania.
			Knows_GetFur = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Umiej�tno�� �ci�gania futer z wilk�w, orkowych ps�w, cieniostwor�w i trolli.");
		}
		else
		{
			AI_Output(self,other,"Org_859_Aidan_Creatures_KEINE_LP_13_00");	//
			PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
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
			PrintScreen("Nowa umiej�tno��: Zdobywanie pazur�w",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(other,self,"Org_859_Aidan_Creatures_Kralle_15_00");	//Poka� mi jak zdoby� pazury upolowanej zwierzyny.
			AI_Output(self,other,"Org_859_Aidan_Creatures_Kralle_13_01");	//Prawd� m�wi�c to dziecinnie proste, trzeba tylko zna� odpowiedni� metod�. Wygnij pazury do przodu - nigdy do ty�u! I pod �adnym pozorem nie pr�buj ich wyci�ga�!
			AI_Output(self,other,"Org_859_Aidan_Creatures_Kralle_13_02");	//Najlepiej pozyskiwa� pazury jaszczur�w. Od tej pory b�dziesz wiedzia�, kt�re zwierz�ta dostarczaj� dobrych pazur�w.
			Knows_GetClaws = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Umiej�tno�� wyci�gania pazur�w jaszczur�w, z�baczy, topielc�w, k�saczy i brzytew.");
		}
		else
		{
			AI_Output(self,other,"Org_859_Aidan_Creatures_KEINE_LP_13_00");	//
			PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
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
			PrintScreen("Nowa umiej�tno��: Sk�rowanie jaszczur�w",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(other,self,"Org_859_Aidan_Creatures_Haut_15_00");	//Na co powinienem zwraca� uwag� zdzieraj�c sk�r� z gad�w?
			AI_Output(self,other,"Org_859_Aidan_Creatures_Haut_13_01");	//Sk�ry topielc�w i bagiennych w�y s� szczeg�lnie cenne.
			AI_Output(self,other,"Org_859_Aidan_Creatures_Haut_13_02");	//Je�li przetniesz sk�r� na bokach, powinna sama odej�� od mi�sa. My�l�, �e od tej pory poradzisz ju� sobie ze sk�rowaniem gad�w.
			Knows_GetHide = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Umiej�tno�� sk�rowania jaszczur�w i b�otnych w�y.");
		}
		else
		{
			AI_Output(self,other,"Org_859_Aidan_Creatures_KEINE_LP_13_00");	//
			PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
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
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_01");	//Co... co to za sk�ra?
	AI_Output(other,self,"DIA_Aidan_BlackWolf_13_02");	//Zdar�em j� z czarnego wilka.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_03");	//Z czarnego wilka? No cz�owieku, naprawd� jestem pod wra�eniem.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_04");	//Ostatni raz widzia�em to stworzenie wieki temu.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_05");	//Jakie� kilka lat temu, kiedy to Nowy Ob�z dopiero co powsta�, �y�a sobie pewna grupka my�liwych.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_06");	//Porz�dni ludzie. Mieli niema�e poj�cie o �yciu w dziczy.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_07");	//I c�, kr��y�y od d�u�szego czasu pog�oski o czarnym wilku, kt�ry to kr�ci� si� w lesie na p�nocy kolonii.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_08");	//Jak tylko szanowne grono si� o tym dowiedzia�o, migiem poszli zapolowa� na tego wilczura. Te� by�em w�wczas my�liwym, jednak nie na tyle do�wiadczonym, by i�� z nimi.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_09");	//Co - jak si� p�niej okaza�o - wcale takie z�e nie by�o...
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_10");	//Tygodnie mija�y. My�liwi wr�cili do obozu, �eby uzupe�ni� zapasy. No i... ju� wi�cej ich potem nie widziano.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_11");	//Pewnie znale�li tego wilka, ale nie uda�o im si� z nim upora�.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_12");	//Wtenczas obieca�em im za niego nagrod�. Ca�e krocie rudy...
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_13");	//Teraz jednak nie mog� ci ofiarowa� rudy, bo samemu z ni� u mnie krucho.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_14");	//Ale - mog� ci odst�pi� co� innego.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_15");	//Ten oto �uk, nale�a� do przyw�dcy grupy my�liwych. Znalaz�em go dawno temu na wschodzie kolonii, na stromym wybrze�u.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_16");	//Jestem pewien, �e nie raz ci si� przyda. Marus z pewno�ci� nie mia�by nic przeciwko, je�li odda�bym jego �uk takiemu do�wiadczonemu my�liwemu.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_17");	//Dzi�ki raz jeszcze za fatyg�.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_18");	//Do zobaczenia przy �owach!
	hunt_wolf = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_BLACKWOLF,LOG_SUCCESS);
	B_LogEntry(CH1_BLACKWOLF,"Aidan by� pod wielkim wra�eniem, �e uda�o mi si� za�atwi� czarnego wilka, na kt�rego on ju� tak d�ugo polowa�. Opowiedzia� mi ponadto, jak to przede mn� pewna grupa my�liwych w kolonii rwa�a si� do polowania na tego wilczura. Niestety, nigdy wi�cej nie wr�cili. Pewnie ma to zwi�zek z tym opuszczonym obozem my�liwych na wschodzie kolonii. Jako nagrod� dosta�em w swoje r�ce wyj�tkowy �uk, razem z kilkoma strza�ami.");
	B_GiveXP(XP_BLACKWOLF);
	CreateInvItem(self,loner_bogen);
	B_GiveInvItems(self,hero,loner_bogen,1);
	CreateInvItems(hero,ItAmArrow,30);
	Npc_RemoveInvItems(hero,itat_blackwolf_01,1);
};

