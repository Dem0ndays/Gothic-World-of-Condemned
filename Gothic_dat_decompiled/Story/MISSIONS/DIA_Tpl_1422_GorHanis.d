
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
	AI_Output(self,other,"Info_GorHanis_What_08_01");	//Ja? Walcz� ku chwale wielkiego �ni�cego!
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
	AI_Output(self,other,"Info_GorHanis_Arena_08_01");	//Zosta�em wybrany przez moich mistrz�w, by broni� na arenie honoru obozu na bagnie.
	AI_Output(self,other,"Info_GorHanis_Arena_08_02");	//Przy�wieca mi wi�c wy�szy cel. Walcz�, by pokaza� niewiernym jak wielka jest pot�ga �ni�cego!
};


instance Info_GorHanis_Sleeper(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 2;
	condition = Info_GorHanis_Sleeper_Condition;
	information = Info_GorHanis_Sleeper_Info;
	permanent = 0;
	description = "Kim jest �ni�cy?";
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
	AI_Output(other,self,"Info_GorHanis_Sleeper_15_00");	//Kim jest �ni�cy?
	AI_Output(self,other,"Info_GorHanis_Sleeper_08_01");	//W naszym obozie znajdziesz �wi�tych m��w, kt�rzy odpowiedz� ci na to pytanie znacznie lepiej ni� ja.
	AI_Output(self,other,"Info_GorHanis_Sleeper_08_02");	//Powiem ci tylko tyle: �ni�cy b�dzie naszym zbawicielem. Przyprowadzi� nas tutaj i z jego pomoc� uda si� nam st�d wydosta�.
	AI_Output(other,self,"Info_GorHanis_Sleeper_15_03");	//Chcesz przez to powiedzie�, �e czekacie a� wasz b�g zwr�ci wam wolno��?
	AI_Output(self,other,"Info_GorHanis_Sleeper_08_04");	//Tak! Nasze oczekiwanie wkr�tce dobiegnie ko�ca. W tej chwili przygotowujemy si� do rytua�u wielkiego przyzwania.
};


instance Info_GorHanis_Summoning(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 2;
	condition = Info_GorHanis_Summoning_Condition;
	information = Info_GorHanis_Summoning_Info;
	permanent = 0;
	description = "Na czym polega rytua�, kt�ry planujecie?";
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
	AI_Output(other,self,"Info_GorHanis_Summoning_15_00");	//Na czym polega rytua�, kt�ry planujecie?
	AI_Output(self,other,"Info_GorHanis_Summoning_08_01");	//Nasi prorocy przewidzieli, �e wsp�lne przywo�anie �ni�cego jest jedyn� drog� do odzyskania wolno�ci!
	AI_Output(self,other,"Info_GorHanis_Summoning_08_02");	//Je�li chcesz si� jeszcze czego� dowiedzie�, powiniene� uda� si� do naszego obozu.
};


instance Info_GorHanis_WayToST(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 0;
	condition = Info_GorHanis_WayToST_Condition;
	information = Info_GorHanis_WayToST_Info;
	permanent = 1;
	description = "M�g�by� opisa� mi drog� do waszego obozu?";
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
	AI_Output(other,self,"Info_GorHanis_WayToST_15_00");	//M�g�by� opisa� mi drog� do waszego obozu?
	AI_Output(self,other,"Info_GorHanis_WayToST_08_01");	//W Starym Obozie znajdziesz kilku Nowicjuszy Bractwa, kt�rzy ch�tnie wska�� ci drog� do obozu na bagnie. Znajd� kt�rego� z nich i porozmawiaj z nim!
};


var int hanis_herausforderung;

instance Info_GorHanis_Charge(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 10;
	condition = Info_GorHanis_Charge_Condition;
	information = Info_GorHanis_Charge_Info;
	permanent = 0;
	description = "Wyzywam ci� na pojedynek na arenie!";
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
	AI_Output(other,self,"Info_GorHanis_Charge_15_00");	//Wyzywam ci� na pojedynek na arenie!
	if(hero.level < 10)
	{
		AI_Output(self,other,"Info_GorHanis_Charge_08_01");	//Zabicie kogo� takiego jak ty nie przysporzy raczej chwa�y �ni�cemu.
		AI_Output(self,other,"Info_GorHanis_Charge_08_02");	//Stan� z tob� w szranki dopiero wtedy, gdy oka�esz si� godnym rywalem.
		AI_Output(self,other,"Info_GorHanis_Charge_08_03");	//Ale jestem pewien, �e wojownicy z Nowego Obozu nie b�d� mieli takich skrupu��w...
		PrintScreen("Wymagany Poziom: 10",-1,-1,"font_old_20_white.tga",1);
	}
	else if(hero.level >= 10)
	{
		AI_Output(self,other,"Info_GorHanis_Charge_08_04");	//Tak, jeste� godzien, by konkurowa� z jednym z wybra�c�w �ni�cego.
		AI_Output(self,other,"Info_GorHanis_Charge_08_05");	//Je�li jeste� got�w, to zapraszam na aren�.
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
	description = "Czy jestem ju� do�� silny, �eby si� z tob� zmierzy�?";
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
	AI_Output(other,self,"Info_GorHanis_ChargeGood_15_00");	//Czy jestem ju� do�� silny, �eby si� z tob� zmierzy�?
	if(hero.level < 10)
	{
		AI_Output(self,other,"Info_GorHanis_ChargeGood_08_01");	//Nie! Jeste� jeszcze zbyt s�aby. Nie sprostasz mi w walce!
		PrintScreen("Wymagany Poziom: 10",-1,-1,"font_old_20_white.tga",1);
	}
	else if(hero.level >= 10)
	{
		AI_Output(self,other,"Info_GorHanis_Charge_08_04");	//Tak, jeste� godzien, by konkurowa� z jednym z wybra�c�w �ni�cego.
		AI_Output(self,other,"Info_GorHanis_Charge_08_05");	//Je�li jeste� got�w, to zapraszam na aren�.
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
		AI_Output(self,other,"Info_GorHanis_Fight_15_01");	//�ni�cy chroni me cia�o i ducha przed nieprzyjaci�mi.
		AI_Output(self,other,"Info_GorHanis_Fight_08_01");	//Przygotuj si� na solidne baty!
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"START");
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_Attack,1,"");
	}
	else
	{
		AI_Output(self,other,"SVM_8_LetsForgetOurLittleFight");	//Dobra, zapomnijmy o naszej ma�ej sprzeczce.
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
	AI_Output(self,other,"Info_GorHanis_Fight_15_01");	//�ni�cy chroni me cia�o i ducha przed nieprzyjaci�mi.
	AI_Output(self,other,"Info_GorHanis_Fight_08_01");	//Przygotuj si� na solidne baty!
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
	Info_AddChoice(info_tpl_1422_gorhanis,"Chc� pom�c w przebudzeniu �ni�cego.",info_tpl_1422_gorhanis1);
	Info_AddChoice(info_tpl_1422_gorhanis,"Nic ci do tego!",info_tpl_1422_gorhanis2);
	Info_AddChoice(info_tpl_1422_gorhanis,"Jak uda�o wam si� przej�� obok kap�ana?",info_tpl_1422_gorhanis3);
};

func void info_tpl_1422_gorhanis1()
{
	AI_Output(other,self,"Info_TPL_1422_GorHanis1_15_01");	//Chc� pom�c w przebudzeniu �ni�cego.
	AI_Output(self,other,"Info_TPL_1422_GorHanis1_08_02");	//Hmm... nie bardzo mi to wygl�da, �eby� naprawd� by� sk�onny nam pom�c. Ale prosz�, ruszaj, nie b�d� ci� powstrzymywa�, lecz je�li ��esz, Arcykap�an da ci porz�dn� nauczk�, ch�opcze.
	Info_ClearChoices(info_tpl_1422_gorhanis);
	AI_StopProcessInfos(self);
};

func void info_tpl_1422_gorhanis2()
{
	AI_Output(other,self,"Info_TPL_1422_GorHanis2_15_01");	//Nic ci do tego!
	AI_Output(self,other,"Info_TPL_1422_GorHanis2_08_02");	//Oho, bo jeszcze ci pozwol�, �eby mnie zabola�o (�miech). Tak czy siak nie przejdziesz obok Arcykap�ana, nie musz� sobie paskudzi� miecza twoj� krwi�.
	Info_ClearChoices(info_tpl_1422_gorhanis);
	AI_StopProcessInfos(self);
};

func void info_tpl_1422_gorhanis3()
{
	AI_Output(other,self,"Info_TPL_1422_GorHanis3_15_01");	//Jak uda�o wam si� przej�� obok kap�ana?
	AI_Output(self,other,"Info_TPL_1422_GorHanis3_08_02");	//Na nic ci si� ta wiedza nie zda. Kap�an pozwoli� przej�� tylko nam, bo taka by�a wola Mistrza Kaloma. Ty za� nie b�dziesz mia� tyle szcz�cia (�miech).
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
	AI_Output(self,other,"Info_GorHanis_Meditate_08_02");	//Skoro ju� tu jeste�, m�g�by� si� nauczy� nieco o medytacji od samego Stra�nika �wi�tynnego.
	AI_Output(self,other,"Info_GorHanis_Meditate_08_03");	//W walce nie liczy si� twoja si�a fizyczna. To twoja si�a duchowa tak naprawd� o wszystkim decyduje.
	AI_Output(self,other,"Info_GorHanis_Meditate_08_04");	//Je�li tw�j umys� jest czysty, wtedy �aden przeciwnik nie stanowi ju� dla ciebie zagro�enia.
	AI_Output(self,other,"Info_GorHanis_Meditate_08_05");	//Dlatego wiedz, �e tylko kto�, kto wywija ostrzem z si�� swego ducha, b�dzie mia� przewag� podczas walki.
	AI_Output(self,other,"Info_GorHanis_Meditate_08_06");	//Teraz id� i wykorzystaj t� wiedz�, aby przekona� swych wrog�w o prawdziwej pot�dze swojego wn�trza.
	AI_Output(self,other,"Info_GorHanis_Meditate_08_07");	//Niech �ni�cy broni ci� od krzywdy i z�ej przygody na �cie�kach, kt�rymi przysz�o ci kroczy�!
	if(other.attribute[ATR_MANA_MAX] <= (1000 - 5))
	{
		other.attribute[ATR_MANA_MAX] = other.attribute[ATR_MANA_MAX] + 5;
		PrintScreen("Mana + 5",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

