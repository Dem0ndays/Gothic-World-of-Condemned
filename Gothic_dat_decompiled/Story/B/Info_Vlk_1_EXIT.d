
instance Info_Vlk_1_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Vlk_1_EXIT_Condition;
	information = Info_Vlk_1_EXIT_Info;
	permanent = 1;
	description = "KONIEC";
};


func int Info_Vlk_1_EXIT_Condition()
{
	return 1;
};

func void Info_Vlk_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Vlk_1_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Vlk_1_EinerVonEuchWerden_Condition;
	information = Info_Vlk_1_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Jak mog� zosta� cz�onkiem waszego obozu?";
};


func int Info_Vlk_1_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Vlk_1_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Vlk_1_EinerVonEuchWerden_15_00");	//Jak mog� zosta� cz�onkiem waszego obozu?
	AI_Output(self,other,"Info_Vlk_1_EinerVonEuchWerden_01_01");	//To proste. Z�ap jaki� kilof i z�a� do kopalni. P� wydobytej przez ciebie rudy p�jdzie na ochron�, drugie p� powinno ci wystarczy� na przetrwanie.
	AI_Output(self,other,"Info_Vlk_1_EinerVonEuchWerden_01_02");	//Cena, kt�r� Gomez ka�e sobie p�aci� za jego dostawy to zdzierstwo, ale chyba lepsze to ni� ry�owa dieta, serwowana wszystkim w Nowym Obozie.
};


instance Info_Vlk_1_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Vlk_1_WichtigePersonen_Condition;
	information = Info_Vlk_1_WichtigePersonen_Info;
	permanent = 1;
	description = "Kto tu dowodzi?";
};


func int Info_Vlk_1_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Vlk_1_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_1_WichtigePersonen_15_00");	//Kto tu dowodzi?
	AI_Output(self,other,"Info_Vlk_1_WichtigePersonen_01_01");	//Magnaci. To oni organizuj� wymian� rudy z kr�lem. Im jeste� wa�niejszy, tym wi�ksz� dostajesz dol�.
};


instance Info_Vlk_1_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Vlk_1_DasLager_Condition;
	information = Info_Vlk_1_DasLager_Info;
	permanent = 1;
	description = "Jest tu co� ciekawszego do ogl�dania ni� te chaty?";
};


func int Info_Vlk_1_DasLager_Condition()
{
	return 1;
};

func void Info_Vlk_1_DasLager_Info()
{
	AI_Output(other,self,"Info_Vlk_1_DasLager_15_00");	//Jest tu co� ciekawszego do ogl�dania ni� te chaty?
	AI_Output(self,other,"Info_Vlk_1_DasLager_01_01");	//C�, wieczorem mo�na zajrze� na aren�, popatrze�, jak Stra�nicy gruchocz� sobie ko�ci.
	AI_Output(self,other,"Info_Vlk_1_DasLager_01_02");	//Pi�kny widok. Wart ka�dej ceny.
};


instance Info_Vlk_1_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Vlk_1_DieLage_Condition;
	information = Info_Vlk_1_DieLage_Info;
	permanent = 1;
	description = "Jak leci?";
};


func int Info_Vlk_1_DieLage_Condition()
{
	return 1;
};

func void Info_Vlk_1_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_1_DieLage_15_00");	//Jak leci?
	AI_Output(self,other,"Info_Vlk_1_DieLage_01_01");	//Sp�dzi�em ostatnie dwa tygodnie pracuj�c w kopalni. Teraz chc� wreszcie odpocz��, wi�c zejd� mi z oczu.
};


var int dzien_vlk1;

instance INFO_VLK_1_GIVEORE(C_Info)
{
	nr = 5;
	condition = info_vlk_1_giveore_condition;
	information = info_vlk_1_giveore_info;
	permanent = 1;
	description = "P�a� za ochron�!";
};


func int info_vlk_1_giveore_condition()
{
	if((hero.guild == GIL_GRD) && (dzien_vlk1 != Wld_GetDay()))
	{
		return 1;
	};
};

func void info_vlk_1_giveore_info()
{
	AI_Output(other,self,"Info_Vlk_1_GiveOre_15_00");	//P�a� za ochron�!
	AI_Output(self,other,"Info_Vlk_1_GiveOre_01_01");	//Dobra ju� dobra. Zap�ac�.
	CreateInvItems(self,ItMiNugget,10);
	B_GiveInvItems(self,other,ItMiNugget,10);
	dzien_vlk1 = Wld_GetDay();
};

func void B_AssignAmbientInfos_Vlk_1(var C_Npc slf)
{
	B_AssignFindNpc_OC(slf);
	Info_Vlk_1_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_1_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_1_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_1_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_1_DieLage.npc = Hlp_GetInstanceID(slf);
	info_vlk_1_giveore.npc = Hlp_GetInstanceID(slf);
};

