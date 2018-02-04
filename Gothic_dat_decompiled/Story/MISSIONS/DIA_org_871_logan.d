
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
	description = "Czym siê tu zajmujesz?";
};


func int dia_logan_hello_condition()
{
	return 1;
};

func void dia_logan_hello_info()
{
	AI_Output(other,self,"DIA_Org_5033_Logan_Hello_15_00");	//Czym siê tu zajmujesz?
	AI_Output(self,other,"DIA_Org_5033_Logan_Hello_13_01");	//Ja? Jestem tutaj myœliwym.
	AI_Output(self,other,"DIA_Org_5033_Logan_Hello_13_02");	//Dbam o to, aby ¿aden z nas nie musia³ g³odowaæ.
	AI_Output(self,other,"DIA_Org_5033_Logan_Hello_13_03");	//Mo¿e i miêso zêbacza nie jest wysokiej klasy, ale przecie¿ lepszy rydz ni¿ nic.
	Log_CreateTopic(GE_TeacherOW,LOG_NOTE);
	B_LogEntry(GE_TeacherOW,"Logan - myœliwy ¿yj¹cy w górach w obozie bandytów - mo¿e mnie nauczyæ nieco o polowaniu.");
};


instance org_859_logan_creatures(C_Info)
{
	npc = org_871_logan;
	nr = 1;
	condition = org_859_logan_creatures_condition;
	information = org_859_logan_creatures_info;
	permanent = 1;
	description = "Chcia³bym nauczyæ siê oprawiaæ zwierzêta.";
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
	AI_Output(other,self,"Org_859_Logan_Creatures_15_00");	//Chcia³bym nauczyæ siê oprawiaæ zwierzêta.
	if((Knows_GetTeeth == FALSE) || (Knows_GetFur == FALSE) || (Knows_GetClaws == FALSE) || (Knows_GetHide == FALSE))
	{
		AI_Output(self,other,"Org_859_Logan_Creatures_13_01");	//Co chcesz wiedzieæ?
		Info_ClearChoices(org_859_logan_creatures);
		Info_AddChoice(org_859_logan_creatures,DIALOG_BACK,org_859_logan_creatures_back);
		if(Knows_GetTeeth == FALSE)
		{
			Info_AddChoice(org_859_logan_creatures,"Usuwanie k³ów (koszt: 1 punkt umiejêtnoœci, 50 bry³ek rudy)",org_859_logan_creatures_zahn);
		};
		if(Knows_GetFur == FALSE)
		{
			Info_AddChoice(org_859_logan_creatures,"Œci¹ganie futer (koszt: 1 punkt umiejêtnoœci, 100 bry³ek rudy)",org_859_logan_creatures_fell);
		};
		if(Knows_GetClaws == FALSE)
		{
			Info_AddChoice(org_859_logan_creatures,"Usuwanie pazurów (koszt: 1 punkt umiejêtnoœci, 50 bry³ek rudy)",org_859_logan_creatures_kralle);
		};
		if(Knows_GetHide == FALSE)
		{
			Info_AddChoice(org_859_logan_creatures,"Skórowanie gadów (koszt: 1 punkt umiejêtnoœci, 100 bry³ek rudy)",org_859_logan_creatures_haut);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Logan_Creatures_TaughtAll_13_00");	//Powiedzia³em ci ju¿ wszystko co wiem.
	};
};

func void org_859_logan_creatures_back()
{
	Info_ClearChoices(org_859_logan_creatures);
};

func void org_859_logan_creatures_zahn()
{
	AI_Output(other,self,"Org_859_Logan_Creatures_Zahn_15_00");	//Jak mogê zdobyæ k³y upolowanej zwierzyny?
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,50);
			PrintScreen("Nowa umiejêtnoœæ: Zdobywanie k³ów",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(self,other,"Org_859_Logan_Creatures_Zahn_13_01");	//Przede wszystkim musisz uwa¿aæ, ¿eby k³y nie popêka³y podczas wyci¹gania. W tym celu wbij nó¿ w pobli¿u œrodka zêba i delikatnie go podwa¿aj.
			AI_Output(self,other,"Org_859_Logan_Creatures_Zahn_13_02");	//Warto zabieraæ k³y wilków, cieniostworów i zêbaczy.
			Knows_GetTeeth = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Umiejêtnoœæ zdobywania k³ów wilków, orkowych psów, zêbaczy, k¹saczy, ogarów i cieniostworów.");
		}
		else
		{
			AI_Output(self,other,"Org_859_Logan_Creatures_KEINE_LP_13_00");	//
			PrintScreen("Za ma³o punktów umiejêtnoœci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Logan_Creatures_KEIN_ERZ_13_00");	//
	};
};

func void org_859_logan_creatures_fell()
{
	AI_Output(other,self,"Org_859_Logan_Creatures_Fell_15_00");	//Jak mogê zdobyæ skóry upolowanej zwierzyny?
	if(Npc_HasItems(other,ItMiNugget) >= 100)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,100);
			PrintScreen("Nowa umiejêtnoœæ: Œci¹ganie futer",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(self,other,"Org_859_Logan_Creatures_Fell_13_01");	//Zaczynaj skórowanie od zadu, przesuwaj¹c siê stopniowo ku g³owie. Spróbuj kilka razy. To nie jest takie trudne, a futra potrafi¹ byæ bardzo cenne!
			AI_Output(self,other,"Org_859_Logan_Creatures_Fell_13_02");	//Futra wilków i cieniostworów mo¿na wykorzystaæ do szycia odzie¿y. Badaj¹c futro zabitego zwierza ³atwo ocenisz, czy nadaje siê do dalszego wykorzystania.
			Knows_GetFur = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Umiejêtnoœæ œci¹gania futer z wilków, orkowych psów, cieniostworów i trolli.");
		}
		else
		{
			AI_Output(self,other,"Org_859_Logan_Creatures_KEINE_LP_13_00");	//
			PrintScreen("Za ma³o punktów umiejêtnoœci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
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
			PrintScreen("Nowa umiejêtnoœæ: Zdobywanie pazurów",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(other,self,"Org_859_Logan_Creatures_Kralle_15_00");	//Poka¿ mi jak zdobyæ pazury upolowanej zwierzyny.
			AI_Output(self,other,"Org_859_Logan_Creatures_Kralle_13_01");	//Prawdê mówi¹c to dziecinnie proste, trzeba tylko znaæ odpowiedni¹ metodê. Wygnij pazury do przodu - nigdy do ty³u! I pod ¿adnym pozorem nie próbuj ich wyci¹gaæ!
			AI_Output(self,other,"Org_859_Logan_Creatures_Kralle_13_02");	//Najlepiej pozyskiwaæ pazury jaszczurów. Od tej pory bêdziesz wiedzia³, które zwierzêta dostarczaj¹ dobrych pazurów.
			Knows_GetClaws = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Umiejêtnoœæ wyci¹gania pazurów jaszczurów, zêbaczy, topielców, k¹saczy i brzytew.");
		}
		else
		{
			AI_Output(self,other,"Org_859_Logan_Creatures_KEINE_LP_13_00");	//
			PrintScreen("Za ma³o punktów umiejêtnoœci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
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
			PrintScreen("Nowa umiejêtnoœæ: Skórowanie jaszczurów",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(other,self,"Org_859_Logan_Creatures_Haut_15_00");	//Na co powinienem zwracaæ uwagê zdzieraj¹c skórê z gadów?
			AI_Output(self,other,"Org_859_Logan_Creatures_Haut_13_01");	//Skóry topielców i bagiennych wê¿y s¹ szczególnie cenne.
			AI_Output(self,other,"Org_859_Logan_Creatures_Haut_13_02");	//Jeœli przetniesz skórê na bokach, powinna sama odejœæ od miêsa. Myœlê, ¿e od tej pory poradzisz ju¿ sobie ze skórowaniem gadów.
			Knows_GetHide = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Umiejêtnoœæ skórowania jaszczurów i b³otnych wê¿y.");
		}
		else
		{
			AI_Output(self,other,"Org_859_Logan_Creatures_KEINE_LP_13_00");	//
			PrintScreen("Za ma³o punktów umiejêtnoœci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
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
	AI_Output(self,other,"DIA_Logan_TRADE_12_01");	//Zale¿y co masz do zaoferowania.
	if(logan_trade == FALSE)
	{
		Log_CreateTopic(GE_TraderOW,LOG_NOTE);
		B_LogEntry(GE_TraderOW,"Logan z obozu bandytów w górach skupuje skóry, zêby i inne trofea zwierzêce.");
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
	description = "Co s¹dzisz o Estebanie?";
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
	AI_Output(other,self,"DIA_Org_5033_Logan_What_15_00");	//Co s¹dzisz o Estebanie?
	AI_Output(self,other,"DIA_Org_5033_Logan_What_13_01");	//A czemu niby mia³bym ci cokolwiek o nim mówiæ?
	AI_Output(self,other,"DIA_Org_5033_Logan_What_13_02");	//Nie jesteœ jednym z nas. Nie mam pojêcia, czy mo¿na ci zaufaæ.
	AI_Output(self,other,"DIA_Org_5033_Logan_What_13_03");	//Dam ci pewn¹ propozycjê.
	AI_Output(self,other,"DIA_Org_5033_Logan_What_13_04");	//Udasz siê razem ze mn¹ na polowanie, i jeœli oka¿esz siê godny zaufania, opowiem ci wszystko, czego bêdziesz chcia³ siê dowiedzieæ.
};


instance DIA_LOGAN_HUNT(C_Info)
{
	npc = org_871_logan;
	nr = 1;
	condition = dia_logan_hunt_condition;
	information = dia_logan_hunt_info;
	permanent = 0;
	description = "Dobra. ChodŸmy na polowanie.";
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
	AI_Output(other,self,"DIA_Org_5033_Logan_Hunt_15_00");	//Dobra. ChodŸmy na polowanie.
	AI_Output(self,other,"DIA_Org_5033_Logan_Hunt_13_01");	//Œwietnie. Tylko muszê ci coœ jeszcze powiedzieæ.
	AI_Output(self,other,"DIA_Org_5033_Logan_Hunt_13_02");	//Kiedy by³em tam ostatni raz na dole, natkn¹³em siê na niezwyk³ego zêbacza. Widzia³em ju¿ wiele z tych bestii, ale ten...
	AI_Output(self,other,"DIA_Org_5033_Logan_Hunt_13_03");	//Ten potwór mia³ takie lodowate spojrzenie. Takie, jakby w jednej chwili mia³o ciê rozerwaæ bez wahania na tysi¹c strzêpów.
	AI_Output(self,other,"DIA_Org_5033_Logan_Hunt_13_04");	//Jeœli pomo¿esz mi za³atwiæ to bydlê, bêdê twoim d³u¿nikiem.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	snapper_hunt = LOG_RUNNING;
	Log_CreateTopic(CH1_SNAPPER,LOG_MISSION);
	Log_SetTopicStatus(CH1_SNAPPER,LOG_RUNNING);
	B_LogEntry(CH1_SNAPPER,"Jeœli Logan ma mi pomóc, powinienem pierw towarzyszyæ mu podczas polowania. Opowiada³ mi, ¿e spotka³ ostatnio wyj¹tkowo paskudnego zêbacza. Jeœli pomogê mu siê z nim uporaæ, powie wszystko, czego mi bêdzie potrzeba.");
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
	AI_Output(self,other,"DIA_Org_5033_Logan_SUCCESS_13_01");	//Dobra robota, jednak na coœ siê przydajesz.
	AI_Output(self,other,"DIA_Org_5033_Logan_SUCCESS_13_02");	//Teraz chêtnie ci pomogê, tak jak obieca³em.
	AI_Output(self,other,"DIA_Org_5033_Logan_SUCCESS_13_03");	//Uwa¿am, ¿e Esteban ju¿ wkrótce stanie siê naszym nowym g³ównodowodz¹cym.
	AI_Output(self,other,"DIA_Org_5033_Logan_SUCCESS_13_04");	//Wnet sprzeciwi siê Quentinowi i nie bêdzie mia³ nic do powiedzenia.
	AI_Output(self,other,"DIA_Org_5033_Logan_SUCCESS_13_05");	//Nawet jeœli Quentin od zawsze dobrze siê nami zajmowa³, to jednak czasy siê zmieniaj¹.
	AI_Output(self,other,"DIA_Org_5033_Logan_SUCCESS_13_06");	//Wiêcej ci nie trzeba wiedzieæ, co? W takim razie widzimy siê w obozie.
	B_GiveInvItems(other,self,itat_claws_snapper,1);
	Npc_RemoveInvItems(self,itat_claws_snapper,1);
	snapper_hunt = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_SNAPPER,LOG_SUCCESS);
	B_LogEntry(CH1_SNAPPER,"Logan jest ze mnie bardzo zadowolony. Od teraz mam jego zaufanie i pomo¿e mi, kiedy zajdzie taka potrzeba.");
	B_GiveXP(XP_SNAPPER);
	B_LogEntry(CH1_ESTEBANQUENTIN,"Logan uwa¿a, ¿e Quentin ju¿ nied³ugo przestanie byæ przywódc¹. Sam twierdzi, ¿e nic nie ma do Quentina, jednak czasy siê zmieniaj¹.");
	Npc_ExchangeRoutine(self,"START");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	logan_esteban = TRUE;
	AI_StopProcessInfos(self);
};

