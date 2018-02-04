
instance Info_Swiney_EXIT(C_Info)
{
	npc = SFB_1037_Swiney;
	nr = 999;
	condition = Info_Swiney_EXIT_Condition;
	information = Info_Swiney_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Swiney_EXIT_Condition()
{
	return 1;
};

func void Info_Swiney_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Swiney_Hello(C_Info)
{
	npc = SFB_1037_Swiney;
	nr = 1;
	condition = Info_Swiney_Hello_Condition;
	information = Info_Swiney_Hello_Info;
	permanent = 0;
	description = "Kim jesteœ?";
};


func int Info_Swiney_Hello_Condition()
{
	return 1;
};

func void Info_Swiney_Hello_Info()
{
	AI_Output(other,self,"Info_Swiney_Hello_15_00");	//Kim jesteœ?
	AI_Output(self,other,"Info_Swiney_Hello_09_01");	//Jestem najlepszym in¿ynierem, jakiego ta przeklêta kolonia kiedykolwiek widzia³a, ch³opcze.
	AI_Output(self,other,"Info_Swiney_Hello_09_02");	//Pilnujê, ¿eby nasi ch³opcy nie œci¹gnêli sobie na g³owy sterty kamieni kopi¹c w niew³aœciwym miejscu.
};


instance Info_Swiney_Schuerfer(C_Info)
{
	npc = SFB_1037_Swiney;
	nr = 1;
	condition = Info_Swiney_Schuerfer_Condition;
	information = Info_Swiney_Schuerfer_Info;
	permanent = 0;
	description = "Chcia³bym do was do³¹czyæ, jako Kret.";
};


func int Info_Swiney_Schuerfer_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Swiney_Hello) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void Info_Swiney_Schuerfer_Info()
{
	AI_Output(other,self,"Info_Swiney_Schuerfer_15_00");	//Chcia³bym do was do³¹czyæ, jako Kret.
	AI_Output(self,other,"Info_Swiney_Schuerfer_09_01");	//Czy¿by? Tylko nie oczekuj zbyt wiele po tej robocie. Trzy porcje ry¿u na dzieñ. Resztê musisz sobie sam za³atwiæ.
	AI_Output(self,other,"Info_Swiney_Schuerfer_09_02");	//Wiesz dlaczego odwalamy ca³¹ tê brudn¹ robotê? ¯eby pewnego dnia móc wyjœæ na wolnoœæ z tego przeklêtego wiêzienia.
	AI_Output(self,other,"Info_Swiney_Schuerfer_09_03");	//Ca³y nasz urobek jest sk³adowany na wielkim kopcu. Raz w miesi¹cu ka¿dy z nas dostaje 50 bry³ek, ¿eby móc siê porz¹dnie upiæ.
	AI_Output(self,other,"Info_Swiney_Schuerfer_09_04");	//To najwa¿niejsze rzeczy, które powinieneœ wiedzieæ.
	AI_Output(self,other,"Info_Swiney_Schuerfer_09_05");	//Masz chocia¿ jakieœ doœwiadczenie w tej robocie?
	Info_ClearChoices(Info_Swiney_Schuerfer);
	Info_AddChoice(Info_Swiney_Schuerfer,"Nie.",Info_Swiney_Schuerfer_Nein);
	Info_AddChoice(Info_Swiney_Schuerfer,"Tak.",Info_Swiney_Schuerfer_Ja);
};

func void Info_Swiney_Schuerfer_Ja()
{
	AI_Output(other,self,"Info_Swiney_Schuerfer_Ja_15_00");	//Tak.
	AI_Output(self,other,"Info_Swiney_Schuerfer_Ja_09_01");	//To œwietnie! Zatem wiesz, na co nale¿y uwa¿aæ. Masz tu swój strój roboczy. Kilof musisz znaleŸæ sobie sam. Mi³ej zabawy.
	AI_Output(self,other,"Info_Swiney_Schuerfer_Ja_09_02");	//A tu masz jeszcze swoje pierwsze 3 porcje ry¿u. Tylko nie spa³aszuj od razu wszystkiego naraz!
	hero.guild = GIL_SFB;
	CreateInvItem(other,sfb_armor_l);
	AI_EquipBestArmor(hero);
	Mdl_ApplyOverlayMds(hero,"Humans_Tired.mds");
	Log_CreateTopic(GE_BECOMESCHUERFER,LOG_NOTE);
	B_LogEntry(GE_BECOMESCHUERFER,"Swiney przyj¹³ mnie do grona Kretów. Mogê od teraz odbieraæ codziennie od niego po 3 porcje ry¿u.");
	CreateInvItem(self,ItAmArrow);
	B_GiveInvItems(self,hero,ItAmArrow,1);
	Npc_RemoveInvItem(hero,ItAmArrow);
	CreateInvItems(other,ItFoRice,3);
	Info_ClearChoices(Info_Swiney_Schuerfer);
};

func void Info_Swiney_Schuerfer_Nein()
{
	AI_Output(other,self,"Info_Swiney_Schuerfer_Nein_15_00");	//Nie.
	AI_Output(self,other,"Info_Swiney_Schuerfer_Nein_09_01");	//No jasne! Dlaczego to zawsze ja muszê was uœwiadamiaæ. S³uchaj uwa¿nie: weŸ te ciuchy i za³ó¿ je na siebie - tutaj.
	AI_Output(self,other,"Info_Swiney_Schuerfer_Nein_09_02");	//Gdyby kawa³ek rudy spad³ ci na bos¹ stopê, zosta³byœ kalek¹ do koñca ¿ycia. Oczywiœcie wtedy by³byœ dla nas znacznie mniej przydatny.
	AI_Output(self,other,"Info_Swiney_Schuerfer_Nein_09_03");	//Gdzieœ w pobli¿u powinien le¿eæ jakiœ kilof.
	AI_Output(self,other,"Info_Swiney_Schuerfer_Nein_09_04");	//Oczywiœcie wiele z nim nie zdzia³asz... Mówi siê trudno...
	AI_Output(self,other,"Info_Swiney_Schuerfer_Nein_09_05");	//...a tak przy okazji: tutaj masz swoje pierwsze 3 porcje ry¿u. Pamiêtaj jednak, ¿e jedzenie bêdziesz dostawa³ tylko raz na dzieñ.
	hero.guild = GIL_SFB;
	CreateInvItem(other,sfb_armor_l);
	AI_EquipBestArmor(hero);
	Mdl_ApplyOverlayMds(hero,"Humans_Tired.mds");
	Log_CreateTopic(GE_BECOMESCHUERFER,LOG_NOTE);
	B_LogEntry(GE_BECOMESCHUERFER,"Swiney przyj¹³ mnie do grona Kretów. Mogê od teraz odbieraæ codziennie od niego po 3 porcje ry¿u.");
	CreateInvItem(self,ItAmArrow);
	B_GiveInvItems(self,hero,ItAmArrow,1);
	Npc_RemoveInvItem(hero,ItAmArrow);
	CreateInvItems(other,ItFoRice,3);
	Info_ClearChoices(Info_Swiney_Schuerfer);
};


instance Info_Swiney_PERM(C_Info)
{
	npc = SFB_1037_Swiney;
	nr = 1;
	condition = Info_Swiney_PERM_Condition;
	information = Info_Swiney_PERM_Info;
	permanent = 1;
	description = "Jak du¿o rudy uda³o siê wam uzbieraæ do tej pory?";
};


func int Info_Swiney_PERM_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Swiney_Schuerfer))
	{
		return 1;
	};
};

func void Info_Swiney_PERM_Info()
{
	AI_Output(other,self,"Info_Swiney_PERM_15_00");	//Jak du¿o rudy uda³o siê wam uzbieraæ do tej pory?
	AI_Output(self,other,"Info_Swiney_PERM_09_01");	//Magowie mówi¹, ¿e mamy ju¿ niemal ca³¹ potrzebn¹ iloœæ. Kiedy bêdziesz w Nowym Obozie rzuæ okiem na kopiec.
	AI_StopProcessInfos(self);
};


var int swiney_riceday;

instance DIA_SWINEY_DAILYRICE(C_Info)
{
	npc = SFB_1037_Swiney;
	nr = 3;
	condition = dia_swiney_dailyrice_condition;
	information = dia_swiney_dailyrice_info;
	permanent = 1;
	description = "Chcia³bym odebraæ moj¹ codzienn¹ porcjê ry¿u.";
};


func int dia_swiney_dailyrice_condition()
{
	if(Npc_KnowsInfo(hero,Info_Swiney_Schuerfer) && (hero.guild == GIL_SFB))
	{
		return 1;
	};
};

func void dia_swiney_dailyrice_info()
{
	AI_Output(other,self,"DIA_Swiney_DailyRice_15_00");	//Chcia³bym odebraæ moj¹ codzienn¹ porcjê ry¿u.
	if(swiney_riceday != Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Swiney_DailyRice_05_01");	//Proszê, trzy porcje dla ciebie. Tylko nie wtrz¹chnij wszystkiego naraz, bo musi ci to wystarczyæ na ca³y dzieñ.
		CreateInvItems(self,ItFoRice,3);
		B_GiveInvItems(self,other,ItFoRice,3);
		swiney_riceday = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Swiney_DailyRice_05_02");	//Przecie¿ dosta³eœ ju¿ swoj¹ racjê. PrzyjdŸ jutro albo przejdŸ siê do obozu i sobie coœ zakup, jeœli ciê staæ.
	};
};

