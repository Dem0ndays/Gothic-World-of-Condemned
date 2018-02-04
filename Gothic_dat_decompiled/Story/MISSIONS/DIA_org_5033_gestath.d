
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
	description = "Czym si� tutaj zajmujesz?";
};


func int dia_gestath_hello_condition()
{
	return 1;
};

func void dia_gestath_hello_info()
{
	AI_Output(other,self,"DIA_Org_5033_Gestath_Hello_15_00");	//Czym si� tutaj zajmujesz?
	AI_Output(self,other,"DIA_Org_5033_Gestath_Hello_13_01");	//Jestem my�liwym. Przemierzam koloni� wzd�u� i wszerz przy okazji poluj�c.
	AI_Output(other,self,"DIA_Org_5033_Gestath_Hello_13_02");	//Mo�esz mnie czego� nauczy�?
	AI_Output(self,other,"DIA_Org_5033_Gestath_Hello_13_03");	//Pewnie, ale to ci� b�dzie nieco kosztowa�.
	Log_CreateTopic(GE_TeacherOW,LOG_NOTE);
	B_LogEntry(GE_TeacherOW,"Gestath, my�liwy �yj�cy mi�dzy Woln� Kopalni� a Nowym Obozem, mo�e mnie nauczy� patroszy� zwierzyn�.");
};


instance dia_gestath_armor(C_Info)
{
	npc = org_5033_gestath;
	nr = 1;
	condition = dia_gestath_armor_condition;
	information = dia_gestath_armor_info;
	permanent = 0;
	description = "Masz na sobie interesuj�cy pancerz.";
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
	AI_Output(other,self,"DIA_Org_5033_Gestath_Armor_15_00");	//Masz na sobie interesuj�cy pancerz.
	AI_Output(self,other,"DIA_Org_5033_Gestath_Armor_13_01");	//Ci�ko si� z tym nie zgodzi�. Zrobi� go dla mnie cz�owiek imieniem Wilk.
	AI_Output(self,other,"DIA_Org_5033_Gestath_Armor_13_02");	//Przynios�em mu tylko niezb�dne materia�y, a nast�pnego dnia zbroja by�a ju� gotowa. W porz�dku facet.
};


instance org_859_gestath_creatures(C_Info)
{
	npc = org_5033_gestath;
	nr = 1;
	condition = org_859_gestath_creatures_condition;
	information = org_859_gestath_creatures_info;
	permanent = 1;
	description = "Chcia�bym si� nauczy� oprawia� zwierzyn�.";
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
	AI_Output(other,self,"Org_859_Gestath_Creatures_15_00");	//Chcia�bym si� nauczy� oprawia� zwierzyn�.
	if((Knows_GetTeeth == FALSE) || (Knows_GetFur == FALSE) || (Knows_GetClaws == FALSE) || (Knows_GetHide == FALSE))
	{
		AI_Output(self,other,"Org_859_Gestath_Creatures_13_01");	//Co chcesz wiedzie�?
		Info_ClearChoices(org_859_gestath_creatures);
		Info_AddChoice(org_859_gestath_creatures,DIALOG_BACK,org_859_gestath_creatures_back);
		if(Knows_GetTeeth == FALSE)
		{
			Info_AddChoice(org_859_gestath_creatures,"Usuwanie k��w (koszt: 1 punkt umiej�tno�ci, 50 bry�ek rudy)",org_859_gestath_creatures_zahn);
		};
		if(Knows_GetFur == FALSE)
		{
			Info_AddChoice(org_859_gestath_creatures,"�ci�ganie futer (koszt: 1 punkt umiej�tno�ci, 100 bry�ek rudy)",org_859_gestath_creatures_fell);
		};
		if(Knows_GetClaws == FALSE)
		{
			Info_AddChoice(org_859_gestath_creatures,"Usuwanie pazur�w (koszt: 1 punkt umiej�tno�ci, 50 bry�ek rudy)",org_859_gestath_creatures_kralle);
		};
		if(Knows_GetHide == FALSE)
		{
			Info_AddChoice(org_859_gestath_creatures,"Sk�rowanie gad�w (koszt: 1 punkt umiej�tno�ci, 100 bry�ek rudy)",org_859_gestath_creatures_haut);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Gestath_Creatures_TaughtAll_13_00");	//Powiedzia�em ci ju� wszystko co wiem.
	};
};

func void org_859_gestath_creatures_back()
{
	Info_ClearChoices(org_859_gestath_creatures);
};

func void org_859_gestath_creatures_zahn()
{
	AI_Output(other,self,"Org_859_Gestath_Creatures_Zahn_15_00");	//Jak mog� zdoby� k�y upolowanej zwierzyny?
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,50);
			PrintScreen("Nowa umiej�tno��: Zdobywanie k��w",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(self,other,"Org_859_Gestath_Creatures_Zahn_13_01");	//Przede wszystkim musisz uwa�a�, �eby k�y nie pop�ka�y podczas wyci�gania. W tym celu wbij n� w pobli�u �rodka z�ba i delikatnie go podwa�aj.
			AI_Output(self,other,"Org_859_Gestath_Creatures_Zahn_13_02");	//Warto zabiera� k�y wilk�w, cieniostwor�w i z�baczy.
			Knows_GetTeeth = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Umiej�tno�� zdobywania k��w wilk�w, orkowych ps�w, z�baczy, k�saczy, ogar�w i cieniostwor�w.");
		}
		else
		{
			AI_Output(self,other,"Org_859_Gestath_Creatures_KEINE_LP_13_00");	//
			PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Gestath_Creatures_KEIN_ERZ_13_00");	//
	};
};

func void org_859_gestath_creatures_fell()
{
	AI_Output(other,self,"Org_859_Gestath_Creatures_Fell_15_00");	//Jak mog� zdoby� sk�ry upolowanej zwierzyny?
	if(Npc_HasItems(other,ItMiNugget) >= 100)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,100);
			PrintScreen("Nowa umiej�tno��: �ci�ganie futer",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(self,other,"Org_859_Gestath_Creatures_Fell_13_01");	//Zaczynaj sk�rowanie od zadu, przesuwaj�c si� stopniowo ku g�owie. Spr�buj kilka razy. To nie jest takie trudne, a futra potrafi� by� bardzo cenne!
			AI_Output(self,other,"Org_859_Gestath_Creatures_Fell_13_02");	//Futra wilk�w i cieniostwor�w mo�na wykorzysta� do szycia odzie�y. Badaj�c futro zabitego zwierza �atwo ocenisz, czy nadaje si� do dalszego wykorzystania.
			Knows_GetFur = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Umiej�tno�� �ci�gania futer z wilk�w, orkowych ps�w, cieniostwor�w i trolli.");
		}
		else
		{
			AI_Output(self,other,"Org_859_Gestath_Creatures_KEINE_LP_13_00");	//
			PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
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
			PrintScreen("Nowa umiej�tno��: Zdobywanie pazur�w",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(other,self,"Org_859_Gestath_Creatures_Kralle_15_00");	//Poka� mi jak zdoby� pazury upolowanej zwierzyny.
			AI_Output(self,other,"Org_859_Gestath_Creatures_Kralle_13_01");	//Prawd� m�wi�c to dziecinnie proste, trzeba tylko zna� odpowiedni� metod�. Wygnij pazury do przodu - nigdy do ty�u! I pod �adnym pozorem nie pr�buj ich wyci�ga�!
			AI_Output(self,other,"Org_859_Gestath_Creatures_Kralle_13_02");	//Najlepiej pozyskiwa� pazury jaszczur�w. Od tej pory b�dziesz wiedzia�, kt�re zwierz�ta dostarczaj� dobrych pazur�w.
			Knows_GetClaws = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Umiej�tno�� wyci�gania pazur�w jaszczur�w, z�baczy, topielc�w, k�saczy i brzytew.");
		}
		else
		{
			AI_Output(self,other,"Org_859_Gestath_Creatures_KEINE_LP_13_00");	//
			PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
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
			PrintScreen("Nowa umiej�tno��: Sk�rowanie jaszczur�w",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(other,self,"Org_859_Gestath_Creatures_Haut_15_00");	//Na co powinienem zwraca� uwag� zdzieraj�c sk�r� z gad�w?
			AI_Output(self,other,"Org_859_Gestath_Creatures_Haut_13_01");	//Sk�ry topielc�w i bagiennych w�y s� szczeg�lnie cenne.
			AI_Output(self,other,"Org_859_Gestath_Creatures_Haut_13_02");	//Je�li przetniesz sk�r� na bokach, powinna sama odej�� od mi�sa. My�l�, �e od tej pory poradzisz ju� sobie ze sk�rowaniem gad�w.
			Knows_GetHide = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Umiej�tno�� sk�rowania jaszczur�w i b�otnych w�y.");
		}
		else
		{
			AI_Output(self,other,"Org_859_Gestath_Creatures_KEINE_LP_13_00");	//
			PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Gestath_Creatures_KEIN_ERZ_13_00");	//
	};
};

