
instance Info_GorHanis_Exit(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 999;
	condition = Info_GorHanis_Exit_Condition;
	information = Info_GorHanis_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_GorHanis_Exit_Condition()
{
	return 1;
};

func void Info_GorHanis_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_GorHanis_What(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 1;
	condition = Info_GorHanis_What_Condition;
	information = Info_GorHanis_What_Info;
	permanent = 0;
	description = "Co tu robisz?";
};


func int Info_GorHanis_What_Condition()
{
	return 1;
};

func void Info_GorHanis_What_Info()
{
	AI_Output(other,self,"Info_GorHanis_What_15_00");	//Co tu robisz?
	AI_Output(self,other,"Info_GorHanis_What_08_01");	//Ja? Walczê ku chwale wielkiego Œni¹cego!
};


instance Info_GorHanis_Arena(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 1;
	condition = Info_GorHanis_Arena_Condition;
	information = Info_GorHanis_Arena_Info;
	permanent = 1;
	description = "Walczysz na arenie?";
};


func int Info_GorHanis_Arena_Condition()
{
	if(Npc_KnowsInfo(self,Info_GorHanis_What))
	{
		return 1;
	};
};

func void Info_GorHanis_Arena_Info()
{
	AI_Output(other,self,"Info_GorHanis_Arena_15_00");	//Walczysz na arenie?
	AI_Output(self,other,"Info_GorHanis_Arena_08_01");	//Zosta³em wybrany przez moich mistrzów, by broniæ na arenie honoru obozu na bagnie.
	AI_Output(self,other,"Info_GorHanis_Arena_08_02");	//Przyœwieca mi wiêc wy¿szy cel. Walczê, by pokazaæ niewiernym jak wielka jest potêga Œni¹cego!
};


instance Info_GorHanis_Sleeper(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 2;
	condition = Info_GorHanis_Sleeper_Condition;
	information = Info_GorHanis_Sleeper_Info;
	permanent = 0;
	description = "Kim jest Œni¹cy?";
};


func int Info_GorHanis_Sleeper_Condition()
{
	if(Npc_KnowsInfo(self,Info_GorHanis_What))
	{
		return 1;
	};
};

func void Info_GorHanis_Sleeper_Info()
{
	AI_Output(other,self,"Info_GorHanis_Sleeper_15_00");	//Kim jest Œni¹cy?
	AI_Output(self,other,"Info_GorHanis_Sleeper_08_01");	//W naszym obozie znajdziesz œwiêtych mê¿ów, którzy odpowiedz¹ ci na to pytanie znacznie lepiej ni¿ ja.
	AI_Output(self,other,"Info_GorHanis_Sleeper_08_02");	//Powiem ci tylko tyle: Œni¹cy bêdzie naszym zbawicielem. Przyprowadzi³ nas tutaj i z jego pomoc¹ uda siê nam st¹d wydostaæ.
	AI_Output(other,self,"Info_GorHanis_Sleeper_15_03");	//Chcesz przez to powiedzieæ, ¿e czekacie a¿ wasz bóg zwróci wam wolnoœæ?
	AI_Output(self,other,"Info_GorHanis_Sleeper_08_04");	//Tak! Nasze oczekiwanie wkrótce dobiegnie koñca. W tej chwili przygotowujemy siê do rytua³u wielkiego przyzwania.
};


instance Info_GorHanis_Summoning(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 2;
	condition = Info_GorHanis_Summoning_Condition;
	information = Info_GorHanis_Summoning_Info;
	permanent = 0;
	description = "Na czym polega rytua³, który planujecie?";
};


func int Info_GorHanis_Summoning_Condition()
{
	if(Npc_KnowsInfo(self,Info_GorHanis_Sleeper))
	{
		return 1;
	};
};

func void Info_GorHanis_Summoning_Info()
{
	AI_Output(other,self,"Info_GorHanis_Summoning_15_00");	//Na czym polega rytua³, który planujecie?
	AI_Output(self,other,"Info_GorHanis_Summoning_08_01");	//Nasi prorocy przewidzieli, ¿e wspólne przywo³anie Œni¹cego jest jedyn¹ drog¹ do odzyskania wolnoœci!
	AI_Output(self,other,"Info_GorHanis_Summoning_08_02");	//Jeœli chcesz siê jeszcze czegoœ dowiedzieæ, powinieneœ udaæ siê do naszego obozu.
};


instance Info_GorHanis_WayToST(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 0;
	condition = Info_GorHanis_WayToST_Condition;
	information = Info_GorHanis_WayToST_Info;
	permanent = 1;
	description = "Móg³byœ opisaæ mi drogê do waszego obozu?";
};


func int Info_GorHanis_WayToST_Condition()
{
	if(Npc_KnowsInfo(hero,Info_GorHanis_Sleeper) || Npc_KnowsInfo(hero,Info_GorHanis_Summoning))
	{
		return 1;
	};
};

func void Info_GorHanis_WayToST_Info()
{
	AI_Output(other,self,"Info_GorHanis_WayToST_15_00");	//Móg³byœ opisaæ mi drogê do waszego obozu?
	AI_Output(self,other,"Info_GorHanis_WayToST_08_01");	//W Starym Obozie znajdziesz kilku Nowicjuszy Bractwa, którzy chêtnie wska¿¹ ci drogê do obozu na bagnie. ZnajdŸ któregoœ z nich i porozmawiaj z nim!
};


var int hanis_herausforderung;

instance Info_GorHanis_Charge(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 10;
	condition = Info_GorHanis_Charge_Condition;
	information = Info_GorHanis_Charge_Info;
	permanent = 0;
	description = "Wyzywam ciê na pojedynek na arenie!";
};


func int Info_GorHanis_Charge_Condition()
{
	if(Npc_KnowsInfo(hero,dia_fletcher_gottofight))
	{
		return 1;
	};
};

func void Info_GorHanis_Charge_Info()
{
	AI_Output(other,self,"Info_GorHanis_Charge_15_00");	//Wyzywam ciê na pojedynek na arenie!
	if(hero.level < 10)
	{
		AI_Output(self,other,"Info_GorHanis_Charge_08_01");	//Zabicie kogoœ takiego jak ty nie przysporzy raczej chwa³y Œni¹cemu.
		AI_Output(self,other,"Info_GorHanis_Charge_08_02");	//Stanê z tob¹ w szranki dopiero wtedy, gdy oka¿esz siê godnym rywalem.
		AI_Output(self,other,"Info_GorHanis_Charge_08_03");	//Ale jestem pewien, ¿e wojownicy z Nowego Obozu nie bêd¹ mieli takich skrupu³ów...
		PrintScreen("Wymagany Poziom: 10",-1,-1,"font_old_20_white.tga",1);
	}
	else if(hero.level >= 10)
	{
		AI_Output(self,other,"Info_GorHanis_Charge_08_04");	//Tak, jesteœ godzien, by konkurowaæ z jednym z wybrañców Œni¹cego.
		AI_Output(self,other,"Info_GorHanis_Charge_08_05");	//Jeœli jesteœ gotów, to zapraszam na arenê.
		hanis_herausforderung = TRUE;
		Npc_ExchangeRoutine(self,"GUIDE");
		AI_StopProcessInfos(self);
	};
};


instance Info_GorHanis_ChargeGood(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 10;
	condition = Info_GorHanis_ChargeGood_Condition;
	information = Info_GorHanis_ChargeGood_Info;
	permanent = 1;
	description = "Czy jestem ju¿ doœæ silny, ¿eby siê z tob¹ zmierzyæ?";
};


func int Info_GorHanis_ChargeGood_Condition()
{
	if((hanis_herausforderung == FALSE) && Npc_KnowsInfo(hero,Info_GorHanis_Charge))
	{
		return 1;
	};
};

func void Info_GorHanis_ChargeGood_Info()
{
	AI_Output(other,self,"Info_GorHanis_ChargeGood_15_00");	//Czy jestem ju¿ doœæ silny, ¿eby siê z tob¹ zmierzyæ?
	if(hero.level < 10)
	{
		AI_Output(self,other,"Info_GorHanis_ChargeGood_08_01");	//Nie! Jesteœ jeszcze zbyt s³aby. Nie sprostasz mi w walce!
		PrintScreen("Wymagany Poziom: 10",-1,-1,"font_old_20_white.tga",1);
	}
	else if(hero.level >= 10)
	{
		AI_Output(self,other,"Info_GorHanis_Charge_08_04");	//Tak, jesteœ godzien, by konkurowaæ z jednym z wybrañców Œni¹cego.
		AI_Output(self,other,"Info_GorHanis_Charge_08_05");	//Jeœli jesteœ gotów, to zapraszam na arenê.
		hanis_herausforderung = TRUE;
		Npc_ExchangeRoutine(self,"GUIDE");
		AI_StopProcessInfos(self);
		CreateInvItems(self,itfo_fullhealth,1);
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,itfo_fullhealth);
	};
};


instance INFO_GORHANIS_FIGHT(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 0;
	condition = info_gorhanis_fight_condition;
	information = info_gorhanis_fight_info;
	important = 1;
};


func int info_gorhanis_fight_condition()
{
	if((hanis_herausforderung == TRUE) && (Npc_GetDistToWP(hero,"OCR_ARENABATTLE_TRAIN") < 500))
	{
		return 1;
	};
};

func void info_gorhanis_fight_info()
{
	if(hanis_herausforderung == TRUE)
	{
		AI_Output(self,other,"Info_GorHanis_Fight_15_01");	//Œni¹cy chroni me cia³o i ducha przed nieprzyjació³mi.
		AI_Output(self,other,"Info_GorHanis_Fight_08_01");	//Przygotuj siê na solidne baty!
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"START");
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_Attack,1,"");
	}
	else
	{
		AI_Output(self,other,"SVM_8_LetsForgetOurLittleFight");	//Dobra, zapomnijmy o naszej ma³ej sprzeczce.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"START");
	};
};


instance INFO_GORHANIS_ARENAFIGHT(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 0;
	condition = info_gorhanis_arenafight_condition;
	information = info_gorhanis_arenafight_info;
	important = 1;
	permanent = 1;
};


func int info_gorhanis_arenafight_condition()
{
	var C_Npc hanis;
	hanis = Hlp_GetNpc(Tpl_1422_GorHanis);
	if((hanis_fight == TRUE) && (Npc_GetDistToWP(hero,"OCR_ARENABATTLE_TRAIN") < 500) && ((hanis.aivar[AIV_HASDEFEATEDSC] == FALSE) || (hanis.aivar[AIV_WASDEFEATEDBYSC] == FALSE)))
	{
		return 1;
	};
};

func void info_gorhanis_arenafight_info()
{
	AI_Output(self,other,"Info_GorHanis_Fight_15_01");	//Œni¹cy chroni me cia³o i ducha przed nieprzyjació³mi.
	AI_Output(self,other,"Info_GorHanis_Fight_08_01");	//Przygotuj siê na solidne baty!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	CreateInvItems(self,itfo_fullhealth,1);
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,hero);
	};
	AI_UseItem(self,itfo_fullhealth);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};


instance INFO_GORHANIS2_EXIT(C_Info)
{
	npc = tpl_5055_gorhanis;
	nr = 999;
	condition = info_gorhanis2_exit_condition;
	information = info_gorhanis2_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_gorhanis2_exit_condition()
{
	return 1;
};

func void info_gorhanis2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance info_tpl_1422_gorhanis(C_Info)
{
	npc = tpl_5055_gorhanis;
	condition = info_tpl_1422_gorhanis_condition;
	information = info_tpl_1422_gorhanis_info;
	important = 1;
	permanent = 0;
};


func int info_tpl_1422_gorhanis_condition()
{
	return 1;
};

func void info_tpl_1422_gorhanis_info()
{
	AI_Output(self,other,"Info_TPL_1422_GorHanis_08_01");	//Co ty tu robisz?
	Info_ClearChoices(info_tpl_1422_gorhanis);
	Info_AddChoice(info_tpl_1422_gorhanis,"Chcê pomóc w przebudzeniu Œni¹cego.",info_tpl_1422_gorhanis1);
	Info_AddChoice(info_tpl_1422_gorhanis,"Nic ci do tego!",info_tpl_1422_gorhanis2);
	Info_AddChoice(info_tpl_1422_gorhanis,"Jak uda³o wam siê przejœæ obok kap³ana?",info_tpl_1422_gorhanis3);
};

func void info_tpl_1422_gorhanis1()
{
	AI_Output(other,self,"Info_TPL_1422_GorHanis1_15_01");	//Chcê pomóc w przebudzeniu Œni¹cego.
	AI_Output(self,other,"Info_TPL_1422_GorHanis1_08_02");	//Hmm... nie bardzo mi to wygl¹da, ¿ebyœ naprawdê by³ sk³onny nam pomóc. Ale proszê, ruszaj, nie bêdê ciê powstrzymywa³, lecz jeœli ³¿esz, Arcykap³an da ci porz¹dn¹ nauczkê, ch³opcze.
	Info_ClearChoices(info_tpl_1422_gorhanis);
	AI_StopProcessInfos(self);
};

func void info_tpl_1422_gorhanis2()
{
	AI_Output(other,self,"Info_TPL_1422_GorHanis2_15_01");	//Nic ci do tego!
	AI_Output(self,other,"Info_TPL_1422_GorHanis2_08_02");	//Oho, bo jeszcze ci pozwolê, ¿eby mnie zabola³o (œmiech). Tak czy siak nie przejdziesz obok Arcykap³ana, nie muszê sobie paskudziæ miecza twoj¹ krwi¹.
	Info_ClearChoices(info_tpl_1422_gorhanis);
	AI_StopProcessInfos(self);
};

func void info_tpl_1422_gorhanis3()
{
	AI_Output(other,self,"Info_TPL_1422_GorHanis3_15_01");	//Jak uda³o wam siê przejœæ obok kap³ana?
	AI_Output(self,other,"Info_TPL_1422_GorHanis3_08_02");	//Na nic ci siê ta wiedza nie zda. Kap³an pozwoli³ przejœæ tylko nam, bo taka by³a wola Mistrza Kaloma. Ty zaœ nie bêdziesz mia³ tyle szczêœcia (œmiech).
	Info_ClearChoices(info_tpl_1422_gorhanis);
	AI_StopProcessInfos(self);
};


instance INFO_GORHANIS_MEDITATE(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 1;
	condition = info_gorhanis_meditate_condition;
	information = info_gorhanis_meditate_info;
	permanent = 0;
	important = 1;
};


func int info_gorhanis_meditate_condition()
{
	if(Wld_IsTime(4,0,4,45))
	{
		return 1;
	};
};

func void info_gorhanis_meditate_info()
{
	AI_OutputSVM(self,other,"$Om");
	AI_Output(self,other,"Info_GorHanis_Meditate_08_02");	//Skoro ju¿ tu jesteœ, móg³byœ siê nauczyæ nieco o medytacji od samego Stra¿nika Œwi¹tynnego.
	AI_Output(self,other,"Info_GorHanis_Meditate_08_03");	//W walce nie liczy siê twoja si³a fizyczna. To twoja si³a duchowa tak naprawdê o wszystkim decyduje.
	AI_Output(self,other,"Info_GorHanis_Meditate_08_04");	//Jeœli twój umys³ jest czysty, wtedy ¿aden przeciwnik nie stanowi ju¿ dla ciebie zagro¿enia.
	AI_Output(self,other,"Info_GorHanis_Meditate_08_05");	//Dlatego wiedz, ¿e tylko ktoœ, kto wywija ostrzem z si³¹ swego ducha, bêdzie mia³ przewagê podczas walki.
	AI_Output(self,other,"Info_GorHanis_Meditate_08_06");	//Teraz idŸ i wykorzystaj tê wiedzê, aby przekonaæ swych wrogów o prawdziwej potêdze swojego wnêtrza.
	AI_Output(self,other,"Info_GorHanis_Meditate_08_07");	//Niech Œni¹cy broni ciê od krzywdy i z³ej przygody na œcie¿kach, którymi przysz³o ci kroczyæ!
	if(other.attribute[ATR_MANA_MAX] <= (1000 - 5))
	{
		other.attribute[ATR_MANA_MAX] = other.attribute[ATR_MANA_MAX] + 5;
		PrintScreen("Mana + 5",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

