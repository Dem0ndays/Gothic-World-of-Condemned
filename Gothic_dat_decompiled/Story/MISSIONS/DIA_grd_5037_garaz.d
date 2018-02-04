
instance INFO_GRD_5037_GARAZ_EXIT(C_Info)
{
	npc = grd_5037_garaz;
	nr = 999;
	condition = info_grd_5037_garaz_exit_condition;
	information = info_grd_5037_garaz_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_grd_5037_garaz_exit_condition()
{
	return 1;
};

func void info_grd_5037_garaz_exit_info()
{
	AI_StopProcessInfos(self);
};


instance info_grd_5037_garaz_siehtsaus(C_Info)
{
	npc = grd_5037_garaz;
	nr = 1;
	condition = info_grd_5037_garaz_siehtsaus_condition;
	information = info_grd_5037_garaz_siehtsaus_info;
	permanent = 0;
	description = "Jak siê maj¹ sprawy?";
};


func int info_grd_5037_garaz_siehtsaus_condition()
{
	return 1;
};

func void info_grd_5037_garaz_siehtsaus_info()
{
	AI_Output(other,self,"Info_Grd_5037_Garaz_SiehtsAus_15_00");	//Jak siê maj¹ sprawy?
	AI_Output(self,other,"Info_Grd_5037_Garaz_SiehtsAus_06_01");	//A nie widaæ? Sterczê tutaj ca³ymi dniami, podczas gdy reszta ch³opaków rozkoszuje siê ¿yciem w zamku!
	AI_Output(self,other,"Info_Grd_5037_Garaz_SiehtsAus_05_02");	//Potrzebny jest ktoœ, kto zatroszczy siê o zapasy Starej Kopalni, mówili. Garaz, jesteœ naszym druhem, mówili.
	AI_Output(self,other,"Info_Grd_5037_Garaz_SiehtsAus_07_02");	//Za ka¿dym razem brudna robota spada na mnie.
	AI_Output(self,other,"Info_Grd_5037_Garaz_SiehtsAus_06_03");	//TAK to w³aœnie wygl¹da.
};


instance info_grd_5037_garaz_truhe(C_Info)
{
	npc = grd_5037_garaz;
	nr = 1;
	condition = info_grd_5037_garaz_truhe_condition;
	information = info_grd_5037_garaz_truhe_info;
	permanent = 0;
	description = "Co to za skrzynie za tob¹?";
};


func int info_grd_5037_garaz_truhe_condition()
{
	if(Npc_KnowsInfo(hero,info_grd_5037_garaz_siehtsaus))
	{
		return 1;
	};
};

func void info_grd_5037_garaz_truhe_info()
{
	AI_Output(other,self,"Info_Grd_5037_Garaz_Truhe_15_00");	//Co to za skrzynie za tob¹?
	AI_Output(self,other,"Info_Grd_5037_Garaz_Truhe_06_01");	//O co ci zaœ chodzi?
	AI_Output(other,self,"Info_Grd_5037_Garaz_Truhe_06_02");	//No... co jest w œrodku?
	AI_Output(self,other,"Info_Grd_5037_Garaz_Truhe_06_03");	//Nawet o tym nie myœl, ch³opcze!
};


var int garaz_bier;

instance INFO_GRD_5037_GARAZ_AUSGEBEN(C_Info)
{
	npc = grd_5037_garaz;
	nr = 1;
	condition = info_grd_5037_garaz_ausgeben_condition;
	information = info_grd_5037_garaz_ausgeben_info;
	permanent = 1;
	description = "Proszê, strzel sobie browara, ja stawiam.";
};


func int info_grd_5037_garaz_ausgeben_condition()
{
	if(Npc_KnowsInfo(hero,info_grd_5037_garaz_truhe) && (garaz_bier == FALSE))
	{
		return 1;
	};
};

func void info_grd_5037_garaz_ausgeben_info()
{
	if(Npc_HasItems(other,ItFoBeer) > 0)
	{
		B_GiveInvItems(other,self,ItFoBeer,1);
		AI_Output(other,self,"Grd_5037_Garaz_ausgeben_15_00");	//Proszê, strzel sobie browara, ja stawiam.
		AI_UseItem(self,ItFoBeer);
		AI_Output(self,other,"Grd_5037_Garaz_ausgeben_06_01");	//Tego w³aœnie by³o mi trzeba. Takie ci¹g³e stanie potrafi nieŸle zasuszyæ gard³o, mówiê ci.
		AI_Output(other,self,"Grd_5037_Garaz_ausgeben_06_02");	//Chcia³eœ mi powiedzieæ, co jest w skrzyniach.
		AI_Output(self,other,"Grd_5037_Garaz_ausgeben_06_03");	//A tak, to tylko zapasy, które dotar³y tu razem z konwojem i s¹ przeznaczone dla Stra¿ników w obozie, jak i w kopalni.
		AI_Output(self,other,"Grd_5037_Garaz_ausgeben_06_04");	//To wszystko, co mam ci do powiedzenia.
		garaz_bier = TRUE;
	}
	else
	{
		AI_Output(other,self,"Grd_5037_Garaz_ausgeben_KEIN_BIER_15_00");	//Proszê, strzel sobie browara, ja stawiam.
		AI_Output(self,other,"Grd_5037_Garaz_ausgeben_KEIN_BIER_06_01");	//¯e co? Nie widzê tu ¿adnego browara.
		AI_Output(self,other,"Grd_5037_Garaz_ausgeben_KEIN_BIER_06_02");	//Postaraj siê o nie, to potem siê zobaczy.
	};
};


instance info_grd_5037_garaz_tax(C_Info)
{
	npc = grd_5037_garaz;
	nr = 1;
	condition = info_grd_5037_garaz_tax_condition;
	information = info_grd_5037_garaz_tax_info;
	permanent = 0;
	description = "Zbierasz myto od Kopaczy?";
};


func int info_grd_5037_garaz_tax_condition()
{
	if((erz_schulden == LOG_RUNNING) && Npc_KnowsInfo(hero,vlk_587_garp_typ))
	{
		return 1;
	};
};

func void info_grd_5037_garaz_tax_info()
{
	AI_Output(other,self,"Info_Grd_5037_Garaz_Tax_15_00");	//S³ysza³em, ¿e zbierasz op³atê za przejœcie od Kopaczy.
	AI_Output(self,other,"Info_Grd_5037_Garaz_Tax_06_01");	//Mo¿e, tylko nie bardzo wiem co ciê to obchodzi.
	AI_Output(self,other,"Info_Grd_5037_Garaz_Tax_07_02");	//Nie rób sobie ¿adnych nadziei. I tak tej rudy nie mam przy sobie. Le¿y w mojej skrzyni, a bez klucza nic nie wskórasz.
	AI_Output(self,other,"Info_Grd_5037_Garaz_Tax_06_03");	//Zawsze trzymam go ze sob¹, hehe.
	B_LogEntry(CH1_SCHULDEN,"Wygl¹da na to, ¿e bêdê musia³ nieco pog³ówkowaæ jak tu zdobyæ klucz od Garaza, ¿eby móc otworzyæ jego skrzyniê. Mo¿e powinienem uci¹æ sobie pogawêdkê z Miguelem, tak jak wspomina³ Garp.");
};


var int garaz_wein;

instance INFO_GRD_5037_GARAZ_WEINAUSGEBEN(C_Info)
{
	npc = grd_5037_garaz;
	nr = 1;
	condition = info_grd_5037_garaz_weinausgeben_condition;
	information = info_grd_5037_garaz_weinausgeben_info;
	permanent = 1;
	description = "Co byœ powiedzia³ na trochê winka?";
};


func int info_grd_5037_garaz_weinausgeben_condition()
{
	if(Npc_KnowsInfo(hero,stt_5036_miguel_garaz) && (garaz_wein == FALSE))
	{
		return 1;
	};
};

func void info_grd_5037_garaz_weinausgeben_info()
{
	if(Npc_HasItems(other,ItFoWine) > 0)
	{
		B_GiveInvItems(other,self,ItFoWine,1);
		AI_Output(other,self,"Grd_5037_Garaz_WeinAusgeben_15_00");	//Co byœ powiedzia³ na trochê winka?
		AI_UseItem(self,ItFoWine);
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_DRUNKEN.MDS",Time_Haste3);
		AI_Output(self,other,"Grd_5037_Garaz_WeinAusgeben_06_01");	//Niess³a rzeszz, braacie.
		AI_Output(self,other,"Grd_5037_Garaz_WeinAusgeben_06_02");	//Chyyba jestem sii soœ winien.
		AI_Output(other,self,"Grd_5037_Garaz_WeinAusgeben_06_03");	//Chcia³bym sobie na chwilê po¿yczyæ twój klucz.
		AI_Output(self,other,"Grd_5037_Garaz_WeinAusgeben_06_04");	//Alesz oczywiiœcie. Proszê, bier go spokojnie. Mii tam on niee jess potrzebnyy.
		B_GiveInvItems(self,other,itke_omcamp_01,1);
		B_LogEntry(CH1_SCHULDEN,"Podzia³a³o - Garaz da³ mi swój klucz, którego potrzebujê do otwarcia jego skrzyni. Nareszcie bêdê mia³ rudê dla tego Kopacza.");
		garaz_wein = TRUE;
	}
	else
	{
		AI_Output(other,self,"Grd_5037_Garaz_ausgeben_KEIN_WeinAusgeben_15_00");	//Co byœ powiedzia³ na trochê winka?
		AI_Output(self,other,"Grd_5037_Garaz_ausgeben_KEIN_WeinAusgeben_06_01");	//To mo¿e pierw jakieœ za³atw, zanim usi³ujesz siê ze mnie podkpiwaæ.
	};
};

