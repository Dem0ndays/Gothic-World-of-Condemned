
instance DIA_Balor_Exit(C_Info)
{
	npc = NOV_1304_Balor;
	nr = 999;
	condition = DIA_Viran_Exit_Condition;
	information = DIA_Viran_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Balor_Exit_Condition()
{
	return TRUE;
};

func void DIA_Balor_Exit_Info()
{
	AI_StopProcessInfos(self);
};


var int Balor_BotenDay;

instance DIA_Balor_FetchWeed(C_Info)
{
	npc = NOV_1304_Balor;
	nr = 1;
	condition = DIA_Balor_FetchWeed_Condition;
	information = DIA_Balor_FetchWeed_Info;
	permanent = 0;
	description = "Przysy³a mnie Baal Orun. Mam dostarczyæ do obozu zebrane przez was ziele.";
};


func int DIA_Balor_FetchWeed_Condition()
{
	if(BaalOrun_FetchWeed == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Balor_FetchWeed_Info()
{
	AI_Output(other,self,"DIA_Balor_FetchWeed_15_00");	//Przysy³a mnie Baal Orun. Mam dostarczyæ do obozu zebrane przez was ziele.
	AI_Output(self,other,"DIA_Balor_FetchWeed_01_01");	//Œwietnie. Nie bêdê musia³ sam tego dŸwigaæ.
	AI_Output(self,other,"DIA_Balor_FetchWeed_01_02");	//Nie zapomnij zajrzeæ do Virana, po drugiej stronie bagna, jeœli jeszcze ciê tam nie by³o.
	AI_Output(self,other,"DIA_Balor_FetchWeed_01_03");	//W przeciwnym razie dostawa bêdzie zbyt ma³a i ktoœ móg³by pomyœleæ, ¿e sprzeda³eœ czêœæ towaru komuœ innemu, he he.
	B_GiveInvItems(self,other,ItMi_Plants_Swampherb_01,50);
	B_LogEntry(CH1_DeliverWeed,"Balor da³ mi dzisiejszy zbiór ziela dla Cor Kaloma.");
	B_GiveXP(XP_WeedFromBalor);
	if(!Npc_KnowsInfo(hero,DIA_Viran_What) && !Npc_KnowsInfo(hero,DIA_Viran_FetchWeed))
	{
		B_LogEntry(CH1_DeliverWeed,"Wed³ug Balora, po przeciwnej stronie bagna znajduje siê druga grupa zbieraczy ziela. Jako, ¿e nie dane mi by³o zapytaæ o nic Baal Oruna, muszê ich odnaleŸæ, czy mi siê to podoba czy nie.");
	};
	Balor_BotenDay = Wld_GetDay();
};


var int Balor_PlayerCheating;

instance DIA_Balor_SellUnder(C_Info)
{
	npc = NOV_1304_Balor;
	nr = 1;
	condition = DIA_Balor_SellUnder_Condition;
	information = DIA_Balor_SellUnder_Info;
	permanent = 0;
	description = "Komu niby mia³bym sprzedaæ to ziele?";
};


func int DIA_Balor_SellUnder_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Balor_FetchWeed))
	{
		return TRUE;
	};
};

func void DIA_Balor_SellUnder_Info()
{
	AI_Output(other,self,"DIA_Balor_SellUnder_15_00");	//Komu niby mia³bym sprzedaæ to ziele?
	AI_Output(self,other,"DIA_Balor_SellUnder_01_01");	//Oho! Podsun¹³em ci niez³y pomys³, co?
	Info_ClearChoices(DIA_Balor_SellUnder);
	Info_AddChoice(DIA_Balor_SellUnder,"Niewa¿ne, tak tylko pomyœla³em.",DIA_Balor_SellUnder_ForgetIt);
	Info_AddChoice(DIA_Balor_SellUnder,"Gdybyœ kogoœ zna³, moglibyœmy podzieliæ siê po po³owie.",DIA_Balor_SellUnder_HalfHalf);
	Info_AddChoice(DIA_Balor_SellUnder,"Nie, powiedz mi - komu?",DIA_Balor_SellUnder_ComeOn);
};

func void DIA_Balor_SellUnder_ForgetIt()
{
	AI_Output(other,self,"DIA_Balor_SellUnder_ForgetIt_15_00");	//Niewa¿ne, tak tylko pomyœla³em.
	Info_ClearChoices(DIA_Balor_SellUnder);
};

func void DIA_Balor_SellUnder_HalfHalf()
{
	AI_Output(other,self,"DIA_Balor_SellUnder_HalfHalf_15_00");	//Gdybyœ kogoœ zna³, moglibyœmy podzieliæ siê po po³owie.
	AI_Output(self,other,"DIA_Balor_SellUnder_HalfHalf_01_01");	//Có¿, znam pewnego cz³owieka w Nowym Obozie. Pewnie zainteresowa³oby go nasze ziele...
	AI_Output(self,other,"DIA_Balor_SellUnder_HalfHalf_01_02");	//Ale gdyby Guru z³apali ciê na gor¹cym uczynku, rzuciliby ciê na po¿arcie wê¿om! Ja o niczym nie wiem, jasne?
	Balor_PlayerCheating = TRUE;
	Info_ClearChoices(DIA_Balor_SellUnder);
};

func void DIA_Balor_SellUnder_ComeOn()
{
	AI_Output(other,self,"DIA_Balor_SellUnder_ComeOn_15_00");	//Nie, powiedz mi - komu?
	AI_Output(self,other,"DIA_Balor_SellUnder_ComeOn_01_01");	//Widzê, ¿e coœ knujesz. Pos³uchaj: jeœli ten towar nie dotrze do Cor Kaloma, obydwaj wpadniemy w nie lada k³opoty!
};


var int Balor_TellsNCDealer;

instance DIA_Balor_TellDealer(C_Info)
{
	npc = NOV_1304_Balor;
	nr = 1;
	condition = DIA_Balor_TellDealer_Condition;
	information = DIA_Balor_TellDealer_Info;
	permanent = 1;
	description = "Dobra. Kto bêdzie odbiorc¹ w Nowym Obozie?";
};


func int DIA_Balor_TellDealer_Condition()
{
	if((Balor_PlayerCheating == TRUE) && (Balor_TellsNCDealer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Balor_TellDealer_Info()
{
	AI_Output(other,self,"DIA_Balor_TellDealer_15_00");	//Dobra. Kto bêdzie odbiorc¹ w Nowym Obozie?
	AI_Output(self,other,"DIA_Balor_TellDealer_01_01");	//Myœlisz, ¿e podam ci imiê, a ty ulotnisz siê z ca³ym towarem? Tak ³atwo ci nie pójdzie!
	AI_Output(self,other,"DIA_Balor_TellDealer_01_02");	//Chcê 50 bry³ek rudy zaliczki. Wtedy pogadamy.
	Info_ClearChoices(DIA_Balor_TellDealer);
	Info_AddChoice(DIA_Balor_TellDealer,"Zapomnij o tym.",DIA_Balor_TellDealer_ForgetIt);
	Info_AddChoice(DIA_Balor_TellDealer,"50 bry³ek to uczciwa cena. Proszê bardzo.",DIA_Balor_TellDealer_Pay);
};

func void DIA_Balor_TellDealer_Pay()
{
	AI_Output(other,self,"DIA_Balor_TellDealer_Pay_15_00");	//50 bry³ek to uczciwa cena. Proszê bardzo.
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		AI_Output(self,other,"DIA_Balor_TellDealer_Pay_01_01");	//Dobra, s³uchaj. Facet nazywa siê Cipher. Znajdziesz go pewnie w karczmie na jeziorze,
		AI_Output(self,other,"DIA_Balor_TellDealer_Pay_01_02");	//B¹dŸ ostro¿ny i nie daj siê zrobiæ w konia.
		Info_ClearChoices(DIA_Balor_TellDealer);
		B_GiveInvItems(other,self,ItMiNugget,50);
		Balor_TellsNCDealer = TRUE;
		B_LogEntry(CH1_DeliverWeed,"Balor wspomnia³ coœ o mê¿czyŸnie imieniem Cipher, który móg³by kupiæ ode mnie trochê ziela. Znajdê go w karczmie na jeziorze, w Nowym Obozie. W ten sposób powa¿nie nara¿ê siê wszystkim Guru. Co robiæ?");
		B_GiveXP(XP_BalorNamedCipher);
		Log_CreateTopic(GE_TraderNC,LOG_NOTE);
		B_LogEntry(GE_TraderNC,"Cipher kupuje i sprzedaje wszelkiego rodzaju towary w karczmie na jeziorze. Szczególnie interesuj¹ go porz¹dne dostawy bagiennego ziela.");
	}
	else
	{
		AI_Output(self,other,"DIA_Balor_TellDealer_Pay_NoOre_01_00");	//Nie widzê tu ¿adnych 50 bry³ek. Chcê 50 i ani sztuki mniej, jasne?
		Info_ClearChoices(DIA_Balor_TellDealer);
	};
};

func void DIA_Balor_TellDealer_ForgetIt()
{
	AI_Output(other,self,"DIA_Balor_TellDealer_ForgetIt_15_00");	//Zapomnij o tym.
	AI_Output(self,other,"DIA_Balor_TellDealer_ForgetIt_01_01");	//Tylko nie wyobra¿aj sobie, ¿e mo¿esz tak po prostu pójœæ do Nowego Obozu i sprzedaæ towar byle komu! Jeœli nie trafisz na w³aœciwego cz³owieka, nigdy siê go nie pozbêdziesz.
	AI_Output(self,other,"DIA_Balor_TellDealer_ForgetIt_01_02");	//No chyba, ¿e jakiœ Szkodnik ci go zabierze.
	Info_ClearChoices(DIA_Balor_TellDealer);
};


instance DIA_Balor_RipOff(C_Info)
{
	npc = NOV_1304_Balor;
	nr = 5;
	condition = DIA_Balor_RipOff_Condition;
	information = DIA_Balor_RipOff_Info;
	permanent = 0;
	description = "To ja, wróci³em. Przychodzê po nastêpn¹ dostawê.";
};


func int DIA_Balor_RipOff_Condition()
{
	if((Balor_BotenDay <= (Wld_GetDay() - 6)) && Npc_KnowsInfo(hero,DIA_Balor_FetchWeed))
	{
		return TRUE;
	};
};

func void DIA_Balor_RipOff_Info()
{
	AI_Output(other,self,"DIA_Balor_RipOff_15_00");	//To ja, wróci³em. Przychodzê po nastêpn¹ dostawê.
	if(Balor_PlayerCheating == TRUE)
	{
		AI_Output(self,other,"DIA_Balor_RipOff_01_01");	//Jasne! ¯eby sprzedaæ j¹ znowu w Nowym Obozie!
		AI_Output(self,other,"DIA_Balor_RipOff_01_02");	//Najpierw moje 50 bry³ek zaliczki!
	}
	else
	{
		AI_Output(self,other,"DIA_Balor_RipOff_01_03");	//Znowu ty? No dobra, bierz. Tylko nie próbuj wywin¹æ jakiegoœ numeru, jasne?
		AI_Output(other,self,"DIA_Balor_RipOff_15_04");	//Gdzie¿bym œmia³!
		CreateInvItems(self,ItMi_Plants_Swampherb_01,50);
		B_GiveInvItems(self,hero,ItMi_Plants_Swampherb_01,50);
	};
};


instance DIA_Balor_Perm(C_Info)
{
	npc = NOV_1304_Balor;
	nr = 1;
	condition = DIA_Balor_Perm_Condition;
	information = DIA_Balor_Perm_Info;
	permanent = 1;
	description = "Nie przeszkadzaj sobie w pracy!";
};


func int DIA_Balor_Perm_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Balor_FetchWeed))
	{
		return TRUE;
	};
};

func void DIA_Balor_Perm_Info()
{
	AI_Output(other,self,"DIA_Balor_Perm_15_00");	//Nie przeszkadzaj sobie w pracy!
	AI_Output(self,other,"DIA_Balor_Perm_01_01");	//A myœlisz, ¿e co ja robiê? Grzebiê sobie w jajach?
};


instance dia_balor_help(C_Info)
{
	npc = NOV_1304_Balor;
	nr = 2;
	condition = dia_balor_help_condition;
	information = dia_balor_help_info;
	permanent = 0;
	description = "Mogê ci jakoœ pomóc?";
};


func int dia_balor_help_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_balor_help_info()
{
	AI_Output(other,self,"DIA_Balor_Help_15_00");	//Mogê ci jakoœ pomóc?
	AI_Output(self,other,"DIA_Balor_Help_01_01");	//No, skoro ju¿ pytasz... to tak, mo¿esz.
	AI_Output(self,other,"DIA_Balor_Help_01_02");	//Ch³opcom przyda³aby siê ma³a pomoc na polach przy zbieraniu bagiennego ziela.
	Info_ClearChoices(dia_balor_help);
	Info_AddChoice(dia_balor_help,"Zapomnij.",dia_balor_help_forget);
	Info_AddChoice(dia_balor_help,"To biorê siê do roboty.",dia_balor_help_okay);
};

func void dia_balor_help_forget()
{
	AI_Output(other,self,"DIA_Balor_Forget_15_00");	//Zapomnij.
	AI_Output(self,other,"DIA_Balor_Forget_01_01");	//No to mnie nie denerwuj i pozwól pracowaæ w spokoju.
	AI_StopProcessInfos(self);
};

func void dia_balor_help_okay()
{
	AI_Output(other,self,"DIA_Balor_Okay_15_00");	//To biorê siê do roboty.
	AI_Output(self,other,"DIA_Balor_Okay_01_01");	//Œwietnie. Potrzebujemy jeszcze 10 roœlin, aby móc wys³aæ ca³y towar Cor Kalomowi.
	AI_Output(self,other,"DIA_Balor_Okay_01_02");	//No, to jazda na pola, zbierania jest doœæ.
	balor_weed = LOG_RUNNING;
	Log_CreateTopic(CH2_BALORWEED,LOG_MISSION);
	Log_SetTopicStatus(CH2_BALORWEED,LOG_RUNNING);
	B_LogEntry(CH2_BALORWEED,"Balor poprosi³ mnie, bym pomóg³ jemu, jak i pozosta³ym zbieraczom. Mo¿e odpali mi coœ za robótkê...");
	AI_StopProcessInfos(self);
};


instance DIA_BALOR_GOTWEED(C_Info)
{
	npc = NOV_1304_Balor;
	nr = 3;
	condition = dia_balor_gotweed_condition;
	information = dia_balor_gotweed_info;
	permanent = 1;
	description = "Mam resztê zió³.";
};


func int dia_balor_gotweed_condition()
{
	if(Npc_KnowsInfo(hero,dia_balor_help) && (balor_weed == LOG_RUNNING) && (Npc_GetTrueGuild(hero) == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_balor_gotweed_info()
{
	if(Npc_HasItems(hero,ItMi_Plants_Swampherb_01) >= 10)
	{
		AI_Output(other,self,"DIA_Balor_GotWeed_15_00");	//Mam resztê zió³.
		AI_Output(self,other,"DIA_Balor_GotWeed_01_01");	//Œwietnie, daj je tutaj.
		AI_Output(self,other,"DIA_Balor_GotWeed_01_02");	//Myœlê, ¿e od teraz ju¿ sami damy sobie radê.
		AI_Output(self,other,"DIA_Balor_GotWeed_01_03");	//Masz tu 10 bry³ek. Bêdziesz móg³ sobie kupiæ skrêta za to.
		B_GiveInvItems(hero,self,ItMi_Plants_Swampherb_01,10);
		balor_weed = LOG_SUCCESS;
		Log_SetTopicStatus(CH2_BALORWEED,LOG_SUCCESS);
		B_LogEntry(CH2_BALORWEED,"Balor da³ mi 10 bry³ek jako nagrodê za pomoc na polach. No có¿, lepszy rydz ni¿ nic.");
		B_GiveXP(XP_BALORWEED);
		B_GiveInvItems(self,other,ItMiNugget,10);
	}
	else
	{
		AI_Output(other,self,"DIA_Balor_GotWeed_15_01");	//Mam resztê zió³.
		AI_Output(self,other,"DIA_Balor_GotWeed_01_04");	//Nawet ciê liczyæ nie nauczyli? Tu nie ma 10 roœlin.
	};
};


instance DIA_BALOR_PAYMENT(C_Info)
{
	npc = NOV_1304_Balor;
	nr = 1;
	condition = dia_balor_payment_condition;
	information = dia_balor_payment_info;
	permanent = 1;
	description = "Mam zap³atê dla ciebie.";
};


func int dia_balor_payment_condition()
{
	if(cipher_payment == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_balor_payment_info()
{
	if(Npc_HasItems(hero,ItMiNugget) >= 50)
	{
		AI_Output(other,self,"DIA_Balor_Payment_15_00");	//Cipher da³ mi zap³atê dla ciebie.
		AI_Output(self,other,"DIA_Balor_Payment_01_01");	//Stary, nie tak g³oœno.
		AI_Output(self,other,"DIA_Balor_Payment_01_02");	//Dawaj. No, a teraz zachowujemy siê tak, jakby ta rozmowa nigdy nie mia³a miejsca.
		B_GiveInvItems(hero,self,ItMiNugget,50);
		cipher_payment = LOG_SUCCESS;
		Log_SetTopicStatus(CH1_CIPHERDELIEVERED,LOG_SUCCESS);
		B_LogEntry(CH1_CIPHERDELIEVERED,"Balor dosta³ zap³atê w swoje rêce i chcia³, bym zapomnia³ o tym, ¿e kiedykolwiek z nim o tym rozmawia³em.");
		B_GiveXP(XP_CIPHERPAYED);
	}
	else
	{
		AI_Output(other,self,"DIA_Balor_Payment_15_01");	//Cipher da³ mi zap³atê dla ciebie.
		AI_Output(self,other,"DIA_Balor_Payment_01_04");	//No dobra, a gdzie reszta? Nie ma 50 bry³ek? Wróæ wiêc, kiedy bêdziesz mia³ resztê przy sobie.
	};
};

