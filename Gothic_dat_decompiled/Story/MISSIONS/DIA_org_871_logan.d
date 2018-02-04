
instance DIA_LOGAN_EXIT(C_Info)
{
	npc = org_871_logan;
	nr = 999;
	condition = dia_logan_exit_condition;
	information = dia_logan_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_logan_exit_condition()
{
	return 1;
};

func void dia_logan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance dia_logan_hello(C_Info)
{
	npc = org_871_logan;
	nr = 1;
	condition = dia_logan_hello_condition;
	information = dia_logan_hello_info;
	permanent = 0;
	description = "Czym si� tu zajmujesz?";
};


func int dia_logan_hello_condition()
{
	return 1;
};

func void dia_logan_hello_info()
{
	AI_Output(other,self,"DIA_Org_5033_Logan_Hello_15_00");	//Czym si� tu zajmujesz?
	AI_Output(self,other,"DIA_Org_5033_Logan_Hello_13_01");	//Ja? Jestem tutaj my�liwym.
	AI_Output(self,other,"DIA_Org_5033_Logan_Hello_13_02");	//Dbam o to, aby �aden z nas nie musia� g�odowa�.
	AI_Output(self,other,"DIA_Org_5033_Logan_Hello_13_03");	//Mo�e i mi�so z�bacza nie jest wysokiej klasy, ale przecie� lepszy rydz ni� nic.
	Log_CreateTopic(GE_TeacherOW,LOG_NOTE);
	B_LogEntry(GE_TeacherOW,"Logan - my�liwy �yj�cy w g�rach w obozie bandyt�w - mo�e mnie nauczy� nieco o polowaniu.");
};


instance org_859_logan_creatures(C_Info)
{
	npc = org_871_logan;
	nr = 1;
	condition = org_859_logan_creatures_condition;
	information = org_859_logan_creatures_info;
	permanent = 1;
	description = "Chcia�bym nauczy� si� oprawia� zwierz�ta.";
};


func int org_859_logan_creatures_condition()
{
	if(Npc_KnowsInfo(hero,dia_logan_hello) && ((Knows_GetTeeth == FALSE) || (Knows_GetFur == FALSE) || (Knows_GetClaws == FALSE) || (Knows_GetHide == FALSE)))
	{
		return 1;
	};
};

func void org_859_logan_creatures_info()
{
	AI_Output(other,self,"Org_859_Logan_Creatures_15_00");	//Chcia�bym nauczy� si� oprawia� zwierz�ta.
	if((Knows_GetTeeth == FALSE) || (Knows_GetFur == FALSE) || (Knows_GetClaws == FALSE) || (Knows_GetHide == FALSE))
	{
		AI_Output(self,other,"Org_859_Logan_Creatures_13_01");	//Co chcesz wiedzie�?
		Info_ClearChoices(org_859_logan_creatures);
		Info_AddChoice(org_859_logan_creatures,DIALOG_BACK,org_859_logan_creatures_back);
		if(Knows_GetTeeth == FALSE)
		{
			Info_AddChoice(org_859_logan_creatures,"Usuwanie k��w (koszt: 1 punkt umiej�tno�ci, 50 bry�ek rudy)",org_859_logan_creatures_zahn);
		};
		if(Knows_GetFur == FALSE)
		{
			Info_AddChoice(org_859_logan_creatures,"�ci�ganie futer (koszt: 1 punkt umiej�tno�ci, 100 bry�ek rudy)",org_859_logan_creatures_fell);
		};
		if(Knows_GetClaws == FALSE)
		{
			Info_AddChoice(org_859_logan_creatures,"Usuwanie pazur�w (koszt: 1 punkt umiej�tno�ci, 50 bry�ek rudy)",org_859_logan_creatures_kralle);
		};
		if(Knows_GetHide == FALSE)
		{
			Info_AddChoice(org_859_logan_creatures,"Sk�rowanie gad�w (koszt: 1 punkt umiej�tno�ci, 100 bry�ek rudy)",org_859_logan_creatures_haut);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Logan_Creatures_TaughtAll_13_00");	//Powiedzia�em ci ju� wszystko co wiem.
	};
};

func void org_859_logan_creatures_back()
{
	Info_ClearChoices(org_859_logan_creatures);
};

func void org_859_logan_creatures_zahn()
{
	AI_Output(other,self,"Org_859_Logan_Creatures_Zahn_15_00");	//Jak mog� zdoby� k�y upolowanej zwierzyny?
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,50);
			PrintScreen("Nowa umiej�tno��: Zdobywanie k��w",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(self,other,"Org_859_Logan_Creatures_Zahn_13_01");	//Przede wszystkim musisz uwa�a�, �eby k�y nie pop�ka�y podczas wyci�gania. W tym celu wbij n� w pobli�u �rodka z�ba i delikatnie go podwa�aj.
			AI_Output(self,other,"Org_859_Logan_Creatures_Zahn_13_02");	//Warto zabiera� k�y wilk�w, cieniostwor�w i z�baczy.
			Knows_GetTeeth = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Umiej�tno�� zdobywania k��w wilk�w, orkowych ps�w, z�baczy, k�saczy, ogar�w i cieniostwor�w.");
		}
		else
		{
			AI_Output(self,other,"Org_859_Logan_Creatures_KEINE_LP_13_00");	//
			PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Logan_Creatures_KEIN_ERZ_13_00");	//
	};
};

func void org_859_logan_creatures_fell()
{
	AI_Output(other,self,"Org_859_Logan_Creatures_Fell_15_00");	//Jak mog� zdoby� sk�ry upolowanej zwierzyny?
	if(Npc_HasItems(other,ItMiNugget) >= 100)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,100);
			PrintScreen("Nowa umiej�tno��: �ci�ganie futer",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(self,other,"Org_859_Logan_Creatures_Fell_13_01");	//Zaczynaj sk�rowanie od zadu, przesuwaj�c si� stopniowo ku g�owie. Spr�buj kilka razy. To nie jest takie trudne, a futra potrafi� by� bardzo cenne!
			AI_Output(self,other,"Org_859_Logan_Creatures_Fell_13_02");	//Futra wilk�w i cieniostwor�w mo�na wykorzysta� do szycia odzie�y. Badaj�c futro zabitego zwierza �atwo ocenisz, czy nadaje si� do dalszego wykorzystania.
			Knows_GetFur = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Umiej�tno�� �ci�gania futer z wilk�w, orkowych ps�w, cieniostwor�w i trolli.");
		}
		else
		{
			AI_Output(self,other,"Org_859_Logan_Creatures_KEINE_LP_13_00");	//
			PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Logan_Creatures_KEIN_ERZ_13_00");	//
	};
};

func void org_859_logan_creatures_kralle()
{
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,50);
			PrintScreen("Nowa umiej�tno��: Zdobywanie pazur�w",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(other,self,"Org_859_Logan_Creatures_Kralle_15_00");	//Poka� mi jak zdoby� pazury upolowanej zwierzyny.
			AI_Output(self,other,"Org_859_Logan_Creatures_Kralle_13_01");	//Prawd� m�wi�c to dziecinnie proste, trzeba tylko zna� odpowiedni� metod�. Wygnij pazury do przodu - nigdy do ty�u! I pod �adnym pozorem nie pr�buj ich wyci�ga�!
			AI_Output(self,other,"Org_859_Logan_Creatures_Kralle_13_02");	//Najlepiej pozyskiwa� pazury jaszczur�w. Od tej pory b�dziesz wiedzia�, kt�re zwierz�ta dostarczaj� dobrych pazur�w.
			Knows_GetClaws = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Umiej�tno�� wyci�gania pazur�w jaszczur�w, z�baczy, topielc�w, k�saczy i brzytew.");
		}
		else
		{
			AI_Output(self,other,"Org_859_Logan_Creatures_KEINE_LP_13_00");	//
			PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Logan_Creatures_KEIN_ERZ_13_00");	//
	};
};

func void org_859_logan_creatures_haut()
{
	if(Npc_HasItems(other,ItMiNugget) >= 100)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,100);
			PrintScreen("Nowa umiej�tno��: Sk�rowanie jaszczur�w",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(other,self,"Org_859_Logan_Creatures_Haut_15_00");	//Na co powinienem zwraca� uwag� zdzieraj�c sk�r� z gad�w?
			AI_Output(self,other,"Org_859_Logan_Creatures_Haut_13_01");	//Sk�ry topielc�w i bagiennych w�y s� szczeg�lnie cenne.
			AI_Output(self,other,"Org_859_Logan_Creatures_Haut_13_02");	//Je�li przetniesz sk�r� na bokach, powinna sama odej�� od mi�sa. My�l�, �e od tej pory poradzisz ju� sobie ze sk�rowaniem gad�w.
			Knows_GetHide = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Umiej�tno�� sk�rowania jaszczur�w i b�otnych w�y.");
		}
		else
		{
			AI_Output(self,other,"Org_859_Logan_Creatures_KEINE_LP_13_00");	//
			PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Logan_Creatures_KEIN_ERZ_13_00");	//
	};
};


var int logan_trade;

instance DIA_LOGAN_TRADE(C_Info)
{
	npc = org_871_logan;
	nr = 800;
	condition = dia_logan_trade_condition;
	information = dia_logan_trade_info;
	permanent = 1;
	description = "Pohandlujemy?";
	trade = 1;
};


func int dia_logan_trade_condition()
{
	if(Npc_KnowsInfo(hero,dia_logan_hello))
	{
		return 1;
	};
};

func void dia_logan_trade_info()
{
	AI_Output(other,self,"DIA_Logan_TRADE_15_00");	//Pohandlujemy?
	AI_Output(self,other,"DIA_Logan_TRADE_12_01");	//Zale�y co masz do zaoferowania.
	if(logan_trade == FALSE)
	{
		Log_CreateTopic(GE_TraderOW,LOG_NOTE);
		B_LogEntry(GE_TraderOW,"Logan z obozu bandyt�w w g�rach skupuje sk�ry, z�by i inne trofea zwierz�ce.");
		logan_trade = TRUE;
	};
};


instance dia_logan_what(C_Info)
{
	npc = org_871_logan;
	nr = 1;
	condition = dia_logan_what_condition;
	information = dia_logan_what_info;
	permanent = 0;
	description = "Co s�dzisz o Estebanie?";
};


func int dia_logan_what_condition()
{
	if(esteban_leader == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_logan_what_info()
{
	AI_Output(other,self,"DIA_Org_5033_Logan_What_15_00");	//Co s�dzisz o Estebanie?
	AI_Output(self,other,"DIA_Org_5033_Logan_What_13_01");	//A czemu niby mia�bym ci cokolwiek o nim m�wi�?
	AI_Output(self,other,"DIA_Org_5033_Logan_What_13_02");	//Nie jeste� jednym z nas. Nie mam poj�cia, czy mo�na ci zaufa�.
	AI_Output(self,other,"DIA_Org_5033_Logan_What_13_03");	//Dam ci pewn� propozycj�.
	AI_Output(self,other,"DIA_Org_5033_Logan_What_13_04");	//Udasz si� razem ze mn� na polowanie, i je�li oka�esz si� godny zaufania, opowiem ci wszystko, czego b�dziesz chcia� si� dowiedzie�.
};


instance DIA_LOGAN_HUNT(C_Info)
{
	npc = org_871_logan;
	nr = 1;
	condition = dia_logan_hunt_condition;
	information = dia_logan_hunt_info;
	permanent = 0;
	description = "Dobra. Chod�my na polowanie.";
};


func int dia_logan_hunt_condition()
{
	if((esteban_leader == LOG_RUNNING) && Npc_KnowsInfo(hero,dia_logan_what))
	{
		return 1;
	};
};

func void dia_logan_hunt_info()
{
	AI_Output(other,self,"DIA_Org_5033_Logan_Hunt_15_00");	//Dobra. Chod�my na polowanie.
	AI_Output(self,other,"DIA_Org_5033_Logan_Hunt_13_01");	//�wietnie. Tylko musz� ci co� jeszcze powiedzie�.
	AI_Output(self,other,"DIA_Org_5033_Logan_Hunt_13_02");	//Kiedy by�em tam ostatni raz na dole, natkn��em si� na niezwyk�ego z�bacza. Widzia�em ju� wiele z tych bestii, ale ten...
	AI_Output(self,other,"DIA_Org_5033_Logan_Hunt_13_03");	//Ten potw�r mia� takie lodowate spojrzenie. Takie, jakby w jednej chwili mia�o ci� rozerwa� bez wahania na tysi�c strz�p�w.
	AI_Output(self,other,"DIA_Org_5033_Logan_Hunt_13_04");	//Je�li pomo�esz mi za�atwi� to bydl�, b�d� twoim d�u�nikiem.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	snapper_hunt = LOG_RUNNING;
	Log_CreateTopic(CH1_SNAPPER,LOG_MISSION);
	Log_SetTopicStatus(CH1_SNAPPER,LOG_RUNNING);
	B_LogEntry(CH1_SNAPPER,"Je�li Logan ma mi pom�c, powinienem pierw towarzyszy� mu podczas polowania. Opowiada� mi, �e spotka� ostatnio wyj�tkowo paskudnego z�bacza. Je�li pomog� mu si� z nim upora�, powie wszystko, czego mi b�dzie potrzeba.");
	Wld_InsertNpc(badsnapper,"FP_ROAM_OW_SCA_01_BADITS2");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Polowanie");
};


var int logan_esteban;

instance DIA_LOGAN_SUCCESS(C_Info)
{
	npc = org_871_logan;
	nr = 1;
	condition = dia_logan_success_condition;
	information = dia_logan_success_info;
	permanent = 0;
	important = 1;
};


func int dia_logan_success_condition()
{
	if((snapper_hunt == LOG_RUNNING) && Npc_HasItems(hero,itat_claws_snapper))
	{
		return 1;
	};
};

func void dia_logan_success_info()
{
	AI_Output(self,other,"DIA_Org_5033_Logan_SUCCESS_15_00");	//Bestia ubita.
	AI_Output(self,other,"DIA_Org_5033_Logan_SUCCESS_13_01");	//Dobra robota, jednak na co� si� przydajesz.
	AI_Output(self,other,"DIA_Org_5033_Logan_SUCCESS_13_02");	//Teraz ch�tnie ci pomog�, tak jak obieca�em.
	AI_Output(self,other,"DIA_Org_5033_Logan_SUCCESS_13_03");	//Uwa�am, �e Esteban ju� wkr�tce stanie si� naszym nowym g��wnodowodz�cym.
	AI_Output(self,other,"DIA_Org_5033_Logan_SUCCESS_13_04");	//Wnet sprzeciwi si� Quentinowi i nie b�dzie mia� nic do powiedzenia.
	AI_Output(self,other,"DIA_Org_5033_Logan_SUCCESS_13_05");	//Nawet je�li Quentin od zawsze dobrze si� nami zajmowa�, to jednak czasy si� zmieniaj�.
	AI_Output(self,other,"DIA_Org_5033_Logan_SUCCESS_13_06");	//Wi�cej ci nie trzeba wiedzie�, co? W takim razie widzimy si� w obozie.
	B_GiveInvItems(other,self,itat_claws_snapper,1);
	Npc_RemoveInvItems(self,itat_claws_snapper,1);
	snapper_hunt = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_SNAPPER,LOG_SUCCESS);
	B_LogEntry(CH1_SNAPPER,"Logan jest ze mnie bardzo zadowolony. Od teraz mam jego zaufanie i pomo�e mi, kiedy zajdzie taka potrzeba.");
	B_GiveXP(XP_SNAPPER);
	B_LogEntry(CH1_ESTEBANQUENTIN,"Logan uwa�a, �e Quentin ju� nied�ugo przestanie by� przyw�dc�. Sam twierdzi, �e nic nie ma do Quentina, jednak czasy si� zmieniaj�.");
	Npc_ExchangeRoutine(self,"START");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	logan_esteban = TRUE;
	AI_StopProcessInfos(self);
};

