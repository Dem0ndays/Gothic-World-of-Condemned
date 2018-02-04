
instance DIA_GRD_5018_EXIT(C_Info)
{
	npc = grd_5018_ramon;
	nr = 999;
	condition = dia_grd_5018_exit_condition;
	information = dia_grd_5018_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_grd_5018_exit_condition()
{
	return 1;
};

func void dia_grd_5018_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GRD_5018_MACHSTHIER(C_Info)
{
	npc = grd_5018_ramon;
	nr = 2;
	condition = dia_grd_5018_machsthier_condition;
	information = dia_grd_5018_machsthier_info;
	permanent = 1;
	description = "Czym si� tutaj zajmujesz?";
};


func int dia_grd_5018_machsthier_condition()
{
	return 1;
};

func void dia_grd_5018_machsthier_info()
{
	AI_Output(other,self,"DIA_Orry_GuardGate_15_00");	//Czym si� tutaj zajmujesz?
	if((Npc_GetTrueGuild(hero) != GIL_ORG) || (Npc_GetTrueGuild(hero) != GIL_SLD))
	{
		AI_Output(self,other,"DIA_Grd_5018_MachstHier_07_01");	//Dbam o to, aby Stara Kopalnia by�a zaopatrywana w r�nego rodzaju dostawy z naszego obozu.
		AI_Output(self,other,"DIA_Grd_5018_MachstHier_07_02");	//Za ka�dym razem, kiedy ludzie z kopalni czego� potrzebuj�, my im to w�a�nie za�atwiamy.
		AI_Output(self,other,"DIA_Grd_5018_MachstHier_07_03");	//Ponadto musz� te� uwa�a� na tych czyhaj�cych wsz�dzie wieprzy z Nowego Obozu.
		AI_Output(self,other,"DIA_Grd_5018_MachstHier_07_04");	//Opr�cz tych wszystkich bestii, to w�a�nie oni s� najwi�kszym utrapieniem.
	}
	else
	{
		AI_Output(self,other,"DIA_Grd_5018_MachstHier_07_05");	//Spieprzaj!
		AI_Output(self,other,"DIA_Grd_5018_MachstHier_07_06");	//Takich ciu�mok�w z Nowego Obozu nie powinno si� tu nawet wpuszcza�!
	};
};


instance grd_5018_ramon_needhelp(C_Info)
{
	npc = grd_5018_ramon;
	nr = 1;
	condition = grd_5018_ramon_needhelp_condition;
	information = grd_5018_ramon_needhelp_info;
	important = 0;
	permanent = 0;
	description = "Dosz�y mnie s�uchy, �e przyda wam si� tutaj pomoc.";
};


func int grd_5018_ramon_needhelp_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return TRUE;
	};
};

func void grd_5018_ramon_needhelp_info()
{
	AI_Output(other,self,"GRD_5018_Ramon_NeedHelp_Info_08_01");	//Dosz�y mnie s�uchy, �e przyda wam si� tutaj pomoc.
	AI_Output(self,other,"GRD_5018_Ramon_NeedHelp_Info_08_02");	//Thorus ci� przyj�� w szeregi stra�y, co? Dobra robota.
	AI_Output(self,other,"GRD_5018_Ramon_NeedHelp_Info_08_03");	//Ale tak, przyda�by� si�. Te �ajzy z Nowego Obozu mog� znowu si� na nas czai�, tak �e dodatkowa stra� nie by�aby takim z�ym pomys�em.
	AI_Output(self,other,"GRD_5018_Ramon_NeedHelp_Info_08_04");	//A ju� zw�aszcza, je�li chodzi tu o takiego do�wiadczonego wojownika jak ty.
	AI_Output(self,other,"GRD_5018_Ramon_NeedHelp_Info_08_05");	//Trasa jest, jak zawsze, ta sama. Od Starego Obozu, a� po Star� Kopalni�.
	AI_Output(self,other,"GRD_5018_Ramon_NeedHelp_Info_08_06");	//P�ki co masz troch� czasu, tak �e mo�esz si� tam jeszcze zaopatrzy� w r�ne dobra. Daj zna�, kiedy ju� b�dziesz got�w i mo�emy rusza�.
	convoy_oc = LOG_RUNNING;
	Log_CreateTopic(CH2_KONVOIOC,LOG_MISSION);
	Log_SetTopicStatus(CH2_KONVOIOC,LOG_RUNNING);
	B_LogEntry(CH2_KONVOIOC,"Ramon, przyw�dca konwoju do Starej Kopalni, poprosi� mnie, bym mu do tej kopalni towarzyszy�. Mamy razem oczy�ci� drog�, tak �eby nie by�o �adnej zasadzki, przy kt�rej konw�j m�g�by zosta� obrabowany.");
};


instance grd_5018_ramon_letsgo(C_Info)
{
	npc = grd_5018_ramon;
	nr = 1;
	condition = grd_5018_ramon_letsgo_condition;
	information = grd_5018_ramon_letsgo_info;
	important = 0;
	permanent = 0;
	description = "Jestem gotowy, ruszajmy.";
};


func int grd_5018_ramon_letsgo_condition()
{
	if(Npc_KnowsInfo(hero,grd_5018_ramon_needhelp))
	{
		return TRUE;
	};
};

func void grd_5018_ramon_letsgo_info()
{
	AI_Output(other,self,"GRD_5018_Ramon_LetsGo_Info_08_01");	//Jestem gotowy, ruszajmy.
	AI_Output(self,other,"GRD_5018_Ramon_LetsGo_Info_08_02");	//W porz�dku, plan jest taki, �e idziemy razem we dw�ch i...
	AI_Output(other,self,"GRD_5018_Ramon_LetsGo_Info_08_03");	//Co takiego, tylko my dwaj?
	AI_Output(self,other,"GRD_5018_Ramon_LetsGo_Info_08_04");	//Tak, tylko my dwaj. Idziemy przodem i zabezpieczamy szlak do Starej Kopalni. Reszta konwoju dojdzie, jak tylko oczy�cimy drog�.
	AI_Output(other,self,"GRD_5018_Ramon_LetsGo_Info_08_05");	//No dobra, to jazda!
	Npc_ExchangeRoutine(self,"FOLLOW");
	Npc_ExchangeRoutine(Org_858_Quentin,"FIGHT");
	Npc_ExchangeRoutine(Org_865_Raeuber,"FIGHT");
	Npc_ExchangeRoutine(Org_874_Raeuber,"FIGHT");
};


instance DIA_GRD_5018_FERTIG(C_Info)
{
	npc = grd_5018_ramon;
	nr = 2;
	condition = dia_grd_5018_fertig_condition;
	information = dia_grd_5018_fertig_info;
	important = 1;
};


func int dia_grd_5018_fertig_condition()
{
	if((Npc_GetDistToWP(self,"OW_OM_ENTRANCE01") < 1000) && (convoy_oc == LOG_RUNNING))
	{
		return 1;
	};
};

func void dia_grd_5018_fertig_info()
{
	AI_Output(self,other,"DIA_Grd_5018_Fertig_07_01");	//Dobra, starczy. St�d ju� zaczyna si� ob�z przed Star� Kopalni�.
	AI_Output(self,other,"DIA_Grd_5018_Fertig_07_02");	//Dobra robota. Szcz�cie, �e mamy w naszym obozie kogo� takiego jak ty.
	AI_Output(self,other,"DIA_Grd_5018_Fertig_07_05");	//Do zobaczenia!
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"ALTERNATIVE");
	Npc_ExchangeRoutine(grd_5014_convoitraeger,"ALTERNATIVE");
	Npc_ExchangeRoutine(grd_5015_convoitraeger,"ALTERNATIVE");
	Npc_ExchangeRoutine(grd_5016_convoiwache,"ALTERNATIVE");
	Npc_ExchangeRoutine(grd_5017_convoiwache,"ALTERNATIVE");
	convoy_oc = LOG_SUCCESS;
	B_GiveXP(XP_CONVOYOC);
	Log_SetTopicStatus(CH2_KONVOIOC,LOG_SUCCESS);
	B_LogEntry(CH2_KONVOIOC,"Ramon by� zadowolony z moich poczyna� i powiedzia�, �e wy�le Stone'owi pozdrowienia, dzi�ki czemu b�d� m�g� naby� ci�k� zbroj� Stra�nika.");
};

