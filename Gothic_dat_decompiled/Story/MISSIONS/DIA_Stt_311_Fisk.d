
instance Stt_311_Fisk_Exit(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 999;
	condition = Stt_311_Fisk_Exit_Condition;
	information = Stt_311_Fisk_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Stt_311_Fisk_Exit_Condition()
{
	return 1;
};

func void Stt_311_Fisk_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Stt_311_Fisk_First(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 1;
	condition = Stt_311_Fisk_First_Condition;
	information = Stt_311_Fisk_First_Info;
	permanent = 0;
	important = 1;
};


func int Stt_311_Fisk_First_Condition()
{
	return 1;
};

func void Stt_311_Fisk_First_Info()
{
	AI_Output(self,other,"Stt_311_Fisk_First_12_00");	//Witaj! Jestem Fisk. Handluj� najr�niejszym towarem. Gdyby� kiedy� czego� potrzebowa�, zg�o� si� do mnie.
	Log_CreateTopic(GE_TraderOC,LOG_NOTE);
	B_LogEntry(GE_TraderOC,"Cie� o imieniu Fisk handluje przer�nymi dobrami, a szczeg�lnie broni�. Znajd� go na targowisku.");
};


instance Stt_311_Fisk_Trade(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 800;
	condition = Stt_311_Fisk_Trade_Condition;
	information = Stt_311_Fisk_Trade_Info;
	permanent = 1;
	description = "Poka� mi swoje towary.";
	trade = 1;
};


func int Stt_311_Fisk_Trade_Condition()
{
	return 1;
};

func void Stt_311_Fisk_Trade_Info()
{
	AI_Output(other,self,"Stt_311_Fisk_Trade_15_00");	//Poka� mi swoje towary.
};


instance Stt_311_Fisk_WhistlersSword(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 801;
	condition = Stt_311_Fisk_WhistlersSword_Condition;
	information = Stt_311_Fisk_WhistlersSword_Info;
	permanent = 1;
	description = "Chcia�bym kupi� miecz. Co�... bogato zdobionego.";
};


func int Stt_311_Fisk_WhistlersSword_Condition()
{
	if((Fisk_ForgetSword == FALSE) && (Whistler_BuyMySword == LOG_RUNNING) && (Fisk_SwordSold == FALSE))
	{
		return 1;
	};
};

func void Stt_311_Fisk_WhistlersSword_Info()
{
	AI_Output(other,self,"Stt_311_Fisk_WhistlersSword_15_00");	//Chcia�bym kupi� miecz. Ale nie taki zwyk�y. Chcia�bym co�... bogato zdobionego.
	AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_12_01");	//Mam tu co� w sam raz dla ciebie. Cie�, kt�ry mia� to odebra� wi�cej si� tu nie poka�e.
	AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_12_02");	//Kosztuje jedyne 110 bry�ek rudy. Zainteresowany?
	Fisk_SCknows110 = TRUE;
	Info_ClearChoices(Stt_311_Fisk_WhistlersSword);
	Info_AddChoice(Stt_311_Fisk_WhistlersSword,"Mo�e innym razem.",Stt_311_Fisk_WhistlersSword_BACK);
	Info_AddChoice(Stt_311_Fisk_WhistlersSword,"�wistakowi chcia�e� go sprzeda� za 100...",Stt_311_Fisk_WhistlersSword_Fault);
	Info_AddChoice(Stt_311_Fisk_WhistlersSword,"Dobrze, wezm� go.",Stt_311_Fisk_WhistlersSword_TakeIt);
};

func void Stt_311_Fisk_WhistlersSword_BACK()
{
	AI_Output(other,self,"Org_826_Mordrag_WhistlersSword_BACK_15_00");	//Mo�e innym razem.
	Info_ClearChoices(Stt_311_Fisk_WhistlersSword);
};

func void Stt_311_Fisk_WhistlersSword_Fault()
{
	AI_Output(other,self,"Stt_311_Fisk_WhistlersSword_Fault_15_00");	//Przecie� �wistakowi chcia�e� go sprzeda� za 100!
	AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_Fault_12_01");	//Ach! Chwileczk�... Racja! Ma�o brakowa�o, a sprzeda�bym ci go zbyt tanio. Naturalnie mia�em na my�li 500 bry�ek.
	AI_Output(other,self,"Stt_311_Fisk_WhistlersSword_Fault_15_02");	//Pi��set?!
	AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_Fault_12_03");	//Za ma�o? Mo�e wolisz 1000? Te� dobrze. Chocia� wiesz co? Ten miecz nie jest jednak na sprzeda�.
	Fisk_ForgetSword = TRUE;
	Info_ClearChoices(Stt_311_Fisk_WhistlersSword);
};

func void Stt_311_Fisk_WhistlersSword_TakeIt()
{
	AI_Output(other,self,"Stt_311_Fisk_WhistlersSword_TakeIt_15_00");	//Dobrze, wezm� go.
	if(Npc_HasItems(other,ItMiNugget) >= 110)
	{
		AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_TakeIt_12_01");	//Trafi�a ci si� nie lada okazja.
		B_GiveInvItems(other,self,ItMiNugget,110);
		CreateInvItem(self,Whistlers_Schwert);
		B_GiveInvItems(self,other,Whistlers_Schwert,1);
		Info_ClearChoices(Stt_311_Fisk_WhistlersSword);
		Fisk_SwordSold = TRUE;
	}
	else
	{
		AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_TakeIt_12_02");	//Obawiam si�, �e masz za ma�o rudy. Zachowam ten miecz dla ciebie, ale lepiej si� pospiesz!
	};
};


instance Stt_311_Fisk_ForgetSword(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 800;
	condition = Stt_311_Fisk_ForgetSword_Condition;
	information = Stt_311_Fisk_ForgetSword_Info;
	permanent = 1;
	description = "Wracaj�c do miecza �wistaka...";
};


func int Stt_311_Fisk_ForgetSword_Condition()
{
	if(Fisk_ForgetSword == TRUE)
	{
		return 1;
	};
};

func void Stt_311_Fisk_ForgetSword_Info()
{
	AI_Output(other,self,"Stt_311_Fisk_ForgetSword_15_00");	//Porozmawiajmy jeszcze o mieczu �wistaka.
	AI_Output(self,other,"Stt_311_Fisk_ForgetSword_12_01");	//Powiedz mu, �e nigdy nie dostanie tej broni.
};


var int Fisk_GetNewHehler;

instance Stt_311_Fisk_MordragKO(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 800;
	condition = Stt_311_Fisk_MordragKO_Condition;
	information = Stt_311_Fisk_MordragKO_Info;
	permanent = 0;
	important = 1;
};


func int Stt_311_Fisk_MordragKO_Condition()
{
	if((MordragKO_HauAb == TRUE) && (Npc_GetTrueGuild(hero) == GIL_None) && ((Thorus_MordragKo == LOG_RUNNING) || (Thorus_MordragKo == LOG_SUCCESS)))
	{
		return 1;
	};
};

func void Stt_311_Fisk_MordragKO_Info()
{
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_12_00");	//Hej, ty!
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_12_01");	//Mordrag by� jednym z moich najlepszych dostawc�w, ty g�upcze!
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_12_02");	//Je�li chcesz zosta� cz�onkiem tego obozu, na m�j g�os nie masz co liczy�!
	Info_ClearChoices(Stt_311_Fisk_MordragKO);
	Info_AddChoice(Stt_311_Fisk_MordragKO,"Handlujesz przedmiotami Magnat�w. Thorus ch�tnie si� o tym dowie.",Stt_311_Fisk_MordragKO_Petze);
	Info_AddChoice(Stt_311_Fisk_MordragKO,"Uspok�j si�! Mo�e mog� ci to jako� wynagrodzi�?",Stt_311_Fisk_MordragKO_Relax);
	Info_AddChoice(Stt_311_Fisk_MordragKO,"To poca�uj mnie w ty�ek...",Stt_311_Fisk_MordragKO_FuckOff);
};

func void Stt_311_Fisk_MordragKO_Relax()
{
	AI_Output(other,self,"Stt_311_Fisk_MordragKO_Relax_15_00");	//Uspok�j si�! Mo�e mog� ci to jako� wynagrodzi�?
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_Relax_12_01");	//W�tpi�, �eby ci si� uda�o. No chyba, �e znajdziesz dla mnie nowy kontakt w Nowym Obozie!
	AI_Output(other,self,"Stt_311_Fisk_MordragKO_Relax_15_02");	//Jak ja ci znajd� kogo� takiego?
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_Relax_12_03");	//Przecie� m�wi�em, �e nie wydaje mi si�, �eby uda�o ci si� tego dokona�.
	Log_CreateTopic(CH1_FiskNewDealer,LOG_MISSION);
	Log_SetTopicStatus(CH1_FiskNewDealer,LOG_RUNNING);
	B_LogEntry(CH1_FiskNewDealer,"Fisk, handlarz ze Starego Obozu, chce bym znalaz� mu nowego pasera na miejsce Mordraga.");
	Fisk_GetNewHehler = LOG_RUNNING;
	AI_StopProcessInfos(self);
	Info_ClearChoices(Stt_311_Fisk_MordragKO);
};

func void Stt_311_Fisk_MordragKO_FuckOff()
{
	AI_Output(other,self,"Stt_311_Fisk_MordragKO_FuckOff_15_00");	//To poca�uj mnie w ty�ek...
	Info_ClearChoices(Stt_311_Fisk_MordragKO);
	AI_StopProcessInfos(self);
	Log_CreateTopic(CH1_FiskNewDealer,LOG_MISSION);
	Log_SetTopicStatus(CH1_FiskNewDealer,LOG_FAILED);
	B_LogEntry(CH1_FiskNewDealer,"Fisk nie�le si� w�ciek� dowiaduj�c si�, �e Mordraga wygoniono z obozu. Od teraz nie mam u niego szans na zakup porz�dnych map.");
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Fisk_GetNewHehler = LOG_FAILED;
	Info_ClearChoices(Stt_311_Fisk_MordragKO);
};

func void Stt_311_Fisk_MordragKO_Petze()
{
	AI_Output(other,self,"Stt_311_Fisk_MordragKO_Petze_15_00");	//Handlujesz przedmiotami, kt�re nale�a�y do Magnat�w. Za�o�� si�, �e Thorus ch�tnie si� o tym dowie.
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_Petze_12_01");	//Nawet nie pr�buj, kolego!
	AI_StopProcessInfos(self);
	Log_CreateTopic(CH1_FiskNewDealer,LOG_MISSION);
	Log_SetTopicStatus(CH1_FiskNewDealer,LOG_FAILED);
	B_LogEntry(CH1_FiskNewDealer,"Fisk nie�le si� w�ciek� dowiaduj�c si�, �e Mordraga wygoniono z obozu. Od teraz nie mam u niego szans na zakup porz�dnych map.");
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Fisk_GetNewHehler = LOG_FAILED;
	Info_ClearChoices(Stt_311_Fisk_MordragKO);
};


instance Stt_311_Fisk_HehlerSuccess(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 10;
	condition = Stt_311_Fisk_HehlerSuccess_Condition;
	information = Stt_311_Fisk_HehlerSuccess_Info;
	permanent = 0;
	description = "Mam kogo� z Nowego Obozu, kto chce nawi�za� z tob� wsp�prac�.";
};


func int Stt_311_Fisk_HehlerSuccess_Condition()
{
	if((Fisk_GetNewHehler == LOG_RUNNING) && Npc_KnowsInfo(hero,Org_843_Sharky_Fisk))
	{
		return 1;
	};
};

func void Stt_311_Fisk_HehlerSuccess_Info()
{
	AI_Output(other,self,"Stt_311_Fisk_HehlerSuccess_15_00");	//Znalaz�em kogo� z Nowego Obozu, kto chcia�by nawi�za� z tob� wsp�prac�.
	AI_Output(self,other,"Stt_311_Fisk_HehlerSuccess_12_01");	//No nie! Kto by pomy�la�. Widz�, �e bardzo ci zale�y na popularno�ci w naszym Obozie...
	AI_Output(self,other,"Stt_311_Fisk_HehlerSuccess_12_02");	//No i uda�o ci si�! Kogo mi tu przyprowadzi�e�?
	AI_Output(other,self,"Stt_311_Fisk_HehlerSuccess_15_03");	//Nazywa si� Sharky.
	AI_Output(self,other,"Stt_311_Fisk_HehlerSuccess_12_04");	//Sharky? Jest jeszcze gorszy ni� Mordrag!
	AI_Output(self,other,"Stt_311_Fisk_HehlerSuccess_12_05");	//Je�li chodzi o Diego... Nie musisz si� ju� o niego martwi�.
	Fisk_GetNewHehler = LOG_SUCCESS;
	B_GiveXP(XP_fiskdealer);
	Log_SetTopicStatus(CH1_FiskNewDealer,LOG_SUCCESS);
	B_LogEntry(CH1_FiskNewDealer,"Sharky przejmie teraz dzia�k� Mordraga. Fisk jest zadowolony.");
};


instance Stt_311_Fisk_ARMOR(C_Info)
{
	npc = Stt_311_Fisk;
	condition = Stt_311_Fisk_ARMOR_Condition;
	information = Stt_311_Fisk_ARMOR_Info;
	important = 0;
	permanent = 1;
	description = "Masz dla mnie jeszcze jak�� zbroj�?";
};


func int Stt_311_Fisk_ARMOR_Condition()
{
	if((Kapitel < 2) && Npc_KnowsInfo(hero,Stt_311_Fisk_First))
	{
		return TRUE;
	};
};

func void Stt_311_Fisk_ARMOR_Info()
{
	AI_Output(other,self,"Stt_311_Fisk_ARMOR_Info_15_01");	//Masz dla mnie jeszcze jak�� zbroj�?
	AI_Output(self,other,"Stt_311_Fisk_ARMOR_Info_12_02");	//C�, my�l�, �e znajd� co�, co ci� zadowoli.
	Info_ClearChoices(Stt_311_Fisk_ARMOR);
	Info_AddChoice(Stt_311_Fisk_ARMOR,DIALOG_BACK,Stt_311_Fisk_ARMOR_BACK);
	Info_AddChoice(Stt_311_Fisk_ARMOR,B_BuildBuyArmorString(NAME_FiskLightDiggers,value_vlk_armor_l),Stt_311_Fisk_ARMOR_L);
	Info_AddChoice(Stt_311_Fisk_ARMOR,B_BuildBuyArmorString(NAME_FiskDiggers,value_vlk_armor_m),Stt_311_Fisk_ARMOR_M);
};

func void Stt_311_Fisk_ARMOR_BACK()
{
	Info_ClearChoices(Stt_311_Fisk_ARMOR);
};

func void Stt_311_Fisk_ARMOR_L()
{
	AI_Output(other,self,"Stt_311_Fisk_ARMOR_L_Info_15_01");	//Potrzebuj� lekkich spodni Kopacza.
	if(Npc_HasItems(hero,ItMiNugget) < value_vlk_armor_l)
	{
		AI_Output(self,other,"Stt_311_Fisk_ARMOR_L_Info_12_02");	//Wr��, gdy b�dziesz mia� wystarczaj�co du�o rudy.
	}
	else
	{
		AI_Output(self,other,"Stt_311_Fisk_ARMOR_L_Info_12_03");	//Dobry wyb�r!
		B_GiveInvItems(hero,self,ItMiNugget,value_vlk_armor_l);
		CreateInvItem(self,vlk_armor_l);
		B_GiveInvItems(self,hero,vlk_armor_l,1);
	};
};

func void Stt_311_Fisk_ARMOR_M()
{
	AI_Output(other,self,"Stt_311_Fisk_ARMOR_M_Info_15_01");	//Daj mi spodnie Kopacza.
	if(Npc_HasItems(hero,ItMiNugget) < value_vlk_armor_m)
	{
		AI_Output(self,other,"Stt_311_Fisk_ARMOR_M_Info_12_02");	//Wr��, gdy b�dziesz mia� wystarczaj�co du�o rudy.
	}
	else
	{
		AI_Output(self,other,"Stt_311_Fisk_ARMOR_M_Info_12_03");	//Dobry wyb�r!
		B_GiveInvItems(hero,self,ItMiNugget,value_vlk_armor_m);
		CreateInvItem(self,vlk_armor_m);
		B_GiveInvItems(self,hero,vlk_armor_m,1);
	};
};


instance info_fisk_gilbert(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 1;
	condition = info_fisk_gilbert_condition;
	information = info_fisk_gilbert_info;
	permanent = 0;
	description = "M�wi ci co� imi� Gilbert?";
};


func int info_fisk_gilbert_condition()
{
	if(oc_back == LOG_RUNNING)
	{
		return 1;
	};
};

func void info_fisk_gilbert_info()
{
	AI_Output(other,self,"Info_Fisk_Gilbert_07_01");	//M�wi ci co� imi� Gilbert?
	AI_Output(self,other,"Info_Fisk_Gilbert_07_02");	//Hmm... tak, go�� do�� cz�sto do mnie przychodzi� i ze mn� handlowa�. Ale nie widzia�em go tu ju� od d�u�szego czasu, nie mam poj�cia gdzie si� podzia�.
	B_LogEntry(CH1_GILBERT,"Fisk wprawdzie pami�ta jeszcze Gilberta, ale nie ma zielonego poj�cia o jego utarczkach z lud�mi Gomeza.");
};


var int huno_swordsold;

instance stt_311_fisk_hunossword(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 801;
	condition = stt_311_fisk_hunossword_condition;
	information = stt_311_fisk_hunossword_info;
	permanent = 1;
	description = "Wiesz co� o skradzionym mieczu Huno?";
};


func int stt_311_fisk_hunossword_condition()
{
	if((huno_lostsword == LOG_RUNNING) && (huno_swordsold == FALSE))
	{
		return 1;
	};
};

func void stt_311_fisk_hunossword_info()
{
	AI_Output(other,self,"Stt_311_Fisk_HunosSword_15_00");	//Wiesz co� o skradzionym mieczu Huno?
	AI_Output(self,other,"Stt_311_Fisk_HunosSword_12_01");	//Nic o tym nie wiem. Przynajmniej nic sobie nie przypominam...
	AI_Output(other,self,"Stt_311_Fisk_HunosSword_12_02");	//A gdybym tak pom�g� ci od�wie�y� pami��?
	AI_Output(self,other,"Stt_311_Fisk_HunosSword_12_03");	//M�w.
	Info_ClearChoices(stt_311_fisk_hunossword);
	Info_AddChoice(stt_311_fisk_hunossword,"Przyjd� p�niej.",stt_311_fisk_hunossword_back);
	Info_AddChoice(stt_311_fisk_hunossword,"Co by� powiedzia� na 50 bry�ek?",stt_311_fisk_hunossword_fault);
	Info_AddChoice(stt_311_fisk_hunossword,"Co s�dzisz o 100 bry�kach?",stt_311_fisk_hunossword_right);
};

func void stt_311_fisk_hunossword_back()
{
	AI_Output(other,self,"Org_826_Mordrag_HunosSword_BACK_15_00");	//Mo�e p�niej.
	Info_ClearChoices(stt_311_fisk_hunossword);
};

func void stt_311_fisk_hunossword_fault()
{
	AI_Output(other,self,"Stt_311_Fisk_HunosSword_Fault_15_00");	//Co by� powiedzia� na 50 bry�ek?
	AI_Output(self,other,"Stt_311_Fisk_HunosSword_Fault_12_01");	//Nie, nic o takim mieczu nie s�ysza�em.
};

func void stt_311_fisk_hunossword_right()
{
	AI_Output(other,self,"Stt_311_Fisk_HunosSword_TakeIt_15_00");	//Co s�dzisz o 100 bry�kach?
	if(Npc_HasItems(other,ItMiNugget) >= 100)
	{
		AI_Output(self,other,"Stt_311_Fisk_HunosSword_TakeIt_12_01");	//A tak, teraz pami�tam.
		AI_Output(self,other,"Stt_311_Fisk_HunosSword_TakeIt_11_02");	//Mog� ci jedynie powiedzie�, by� pogada� na ten temat z R�czk�.
		AI_Output(other,self,"Stt_311_Fisk_HunosSword_TakeIt_12_03");	//I tyle?
		AI_Output(self,other,"Stt_311_Fisk_HunosSword_TakeIt_12_04");	//Tyle.
		B_GiveInvItems(other,self,ItMiNugget,100);
		Info_ClearChoices(stt_311_fisk_hunossword);
		huno_swordsold = TRUE;
		B_LogEntry(CH1_HUNOLOSTSWORD,"Fisk doradzi� mi, �e powinienem pogada� na ten temat z Cieniem zwanym R�czka.");
	}
	else
	{
		AI_Output(self,other,"Stt_311_Fisk_HunosSword_TakeIt_12_02");	//Obawiam si�, przyjacielu, �e nie masz do�� rudy. Wr�� p�niej.
	};
};

