
instance DIA_Stone_Hello(C_Info)
{
	npc = GRD_219_Stone;
	nr = 1;
	condition = DIA_Stone_Hello_Condition;
	information = DIA_Stone_Hello_Info;
	permanent = 0;
	description = "Jesteœ kowalem, czy¿ nie?";
};


func int DIA_Stone_Hello_Condition()
{
	if(Kapitel < 4)
	{
		return TRUE;
	};
};

func void DIA_Stone_Hello_Info()
{
	AI_Output(other,self,"DIA_Stone_Hello_15_00");	//Jesteœ kowalem, czy¿ nie?
	AI_Output(self,other,"DIA_Stone_Hello_06_01");	//Racja.
};


instance DIA_Stone_NotSelling(C_Info)
{
	npc = GRD_219_Stone;
	nr = 1;
	condition = DIA_Stone_NotSelling_Condition;
	information = DIA_Stone_NotSelling_Info;
	permanent = 1;
	description = "Sprzedajesz orê¿ i zbroje?";
};


func int DIA_Stone_NotSelling_Condition()
{
	if((Npc_GetTrueGuild(hero) != GIL_GRD) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Stone_NotSelling_Info()
{
	AI_Output(other,self,"DIA_Stone_NotSelling_15_00");	//Sprzedajesz orê¿ i zbroje?
	AI_Output(self,other,"DIA_Stone_NotSelling_06_01");	//Handlem broni¹ para siê Skip. Ja zajmujê siê tylko pancerzami.
	AI_Output(other,self,"DIA_Stone_NotSelling_15_02");	//Masz mo¿e coœ ciekawego na sprzeda¿?
	AI_Output(self,other,"DIA_Stone_NotSelling_06_03");	//Tylko pancerze dla Stra¿ników, a ty nie jesteœ jednym z nich. Dlatego bêdziesz musia³ poszukaæ gdzie indziej.
	AI_StopProcessInfos(self);
};


instance GRD_219_Stone_GETSTUFF(C_Info)
{
	npc = GRD_219_Stone;
	condition = GRD_219_Stone_GETSTUFF_Condition;
	information = GRD_219_Stone_GETSTUFF_Info;
	important = 0;
	permanent = 0;
	description = "Potrzebujê zbroi.";
};


func int GRD_219_Stone_GETSTUFF_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return TRUE;
	};
};

func void GRD_219_Stone_GETSTUFF_Info()
{
	AI_Output(other,self,"GRD_219_Stone_GETSTUFF_Info_15_01");	//Potrzebujê zbroi.
	AI_Output(self,other,"GRD_219_Stone_GETSTUFF_Info_06_02");	//A wiêc Thorus jednak ciê przyj¹³, co? Gratulujê!
	AI_Output(self,other,"GRD_219_Stone_GETSTUFF_Info_06_03");	//Jeszcze jeden, któremu spieszno przelaæ krew za Gomeza. A zreszt¹ - co mnie to obchodzi?
	AI_Output(self,other,"GRD_219_Stone_GETSTUFF_Info_06_04");	//Masz - weŸ tê zbrojê i miecz. Witamy w stra¿y.
	CreateInvItems(self,ItMw_1H_Sword_03,1);
	B_GiveInvItems(self,other,ItMw_1H_Sword_03,1);
	Npc_RemoveInvItem(other,ItMw_1H_Sword_03);
	CreateInvItem(other,grd_armor_l);
	AI_EquipBestArmor(hero);
	AI_EquipBestMeleeWeapon(hero);
	B_LogEntry(GE_BecomeGuard,"Odebra³em z kuŸni moj¹ pierwsz¹ zbrojê Stra¿nika. Lepsze pancerze s¹ niestety du¿o dro¿sze.");
	AI_StopProcessInfos(self);
};


instance GRD_219_Stone_BETTERARMOR(C_Info)
{
	npc = GRD_219_Stone;
	condition = GRD_219_Stone_BETTERARMOR_Condition;
	information = GRD_219_Stone_BETTERARMOR_Info;
	important = 0;
	permanent = 1;
	description = "Chcia³bym dostaæ lepszy pancerz.";
};


func int GRD_219_Stone_BETTERARMOR_Condition()
{
	if(Npc_KnowsInfo(hero,GRD_219_Stone_GETSTUFF) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void GRD_219_Stone_BETTERARMOR_Info()
{
	AI_Output(other,self,"GRD_219_Stone_BETTERARMOR_Info_15_01");	//Chcia³bym dostaæ lepszy pancerz.
	AI_Output(self,other,"GRD_219_Stone_BETTERARMOR_Info_06_02");	//Dostaniesz go, jak przyjdzie czas, i bêdziesz mia³ wystarczaj¹c¹ iloœæ rudy...
	Info_ClearChoices(GRD_219_Stone_BETTERARMOR);
	Info_AddChoice(GRD_219_Stone_BETTERARMOR,DIALOG_BACK,GRD_219_Stone_BETTERARMOR_BACK);
	Info_AddChoice(GRD_219_Stone_BETTERARMOR,B_BuildBuyArmorString(NAME_StoneHeavyGuards,value_grd_armor_h),GRD_219_Stone_BETTERARMOR_H);
	Info_AddChoice(GRD_219_Stone_BETTERARMOR,B_BuildBuyArmorString(NAME_StoneGuards,value_grd_armor_m),GRD_219_Stone_BETTERARMOR_M);
};

func void GRD_219_Stone_BETTERARMOR_M()
{
	AI_Output(hero,self,"GRD_219_Stone_BETTERARMOR_Info_M_15_01");	//Chcia³bym dostaæ zwyk³y pancerz stra¿nika.
	if(Kapitel < 3)
	{
		AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_02");	//Thorus powiedzia³, ¿e musisz siê sprawdziæ jako Stra¿nik zanim dostaniesz lepszy pancerz!
	}
	else if(Npc_HasItems(hero,ItMiNugget) < value_grd_armor_m)
	{
		AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_03");	//Mam na sk³adzie odpowiedni¹ zbrojê, ale nie masz doœæ rudy. Wróæ, kiedy bêdzie ciê na ni¹ staæ!
	}
	else
	{
		AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_04");	//Dobra, masz tu swoj¹ now¹ zbrojê. Tylko nie pozwól, ¿eby Najemnicy j¹ porysowali. Ha ha ha!
		B_GiveInvItems(hero,self,ItMiNugget,value_grd_armor_m);
		B_GiveInvItems(self,hero,grd_armor_m,1);
		AI_EquipBestArmor(hero);
	};
	Info_ClearChoices(GRD_219_Stone_BETTERARMOR);
};

func void GRD_219_Stone_BETTERARMOR_H()
{
	AI_Output(hero,self,"GRD_219_Stone_BETTERARMOR_Info_H_15_01");	//Chcia³bym dostaæ ciê¿k¹ zbrojê Stra¿nika.
	if((Kapitel < 3) && (scar_quest != LOG_SUCCESS))
	{
		AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_02");	//Thorus powiedzia³, ¿e musisz siê sprawdziæ jako Stra¿nik zanim dostaniesz lepszy pancerz!
	}
	else if(Npc_HasItems(hero,ItMiNugget) < value_grd_armor_h)
	{
		AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_03");	//Mam na sk³adzie odpowiedni¹ zbrojê, ale nie masz doœæ rudy. Wróæ, kiedy bêdzie ciê na ni¹ staæ!
	}
	else
	{
		AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_04");	//Dobra, masz tu swoj¹ now¹ zbrojê. Tylko nie pozwól, ¿eby Najemnicy j¹ porysowali. Ha ha ha!
		B_GiveInvItems(hero,self,ItMiNugget,value_grd_armor_h);
		B_GiveInvItems(self,hero,grd_armor_h,1);
		AI_EquipBestArmor(hero);
	};
	Info_ClearChoices(GRD_219_Stone_BETTERARMOR);
};

func void GRD_219_Stone_BETTERARMOR_BACK()
{
	AI_Output(hero,self,"GRD_219_Stone_BETTERARMOR_Info_BACK_15_01");	//Rozmyœli³em siê.
	AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_BACK_06_02");	//Jak uwa¿asz. Wiesz, gdzie mnie znaleŸæ!
	Info_ClearChoices(GRD_219_Stone_BETTERARMOR);
};


instance DIA_GRD_219_Stone_Exit(C_Info)
{
	npc = GRD_219_Stone;
	nr = 999;
	condition = DIA_GRD_219_Stone_Exit_Condition;
	information = DIA_GRD_219_Stone_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_GRD_219_Stone_Exit_Condition()
{
	return 1;
};

func void DIA_GRD_219_Stone_Exit_Info()
{
	var C_Npc Stone;
	if(Npc_KnowsInfo(hero,DIA_GRD_219_Stone4))
	{
		AI_StopProcessInfos(self);
		Stone = Hlp_GetNpc(GRD_219_Stone);
		TA_BeginOverlay(Stone);
		TA_Min(Stone,0,0,0,5,ZS_Position,"OCC_MERCS_HALLWAY_BACK");
		TA_Min(Stone,0,5,0,10,ZS_Position,"OCC_MERCS_ENTRANCE");
		TA_Min(Stone,0,10,0,15,ZS_Position,"OCC_SHADOWS_CORNER");
		TA_Min(Stone,0,15,0,20,ZS_Position,"OCC_STABLE_ENTRANCE");
		TA_Min(Stone,0,20,72,0,ZS_Position,"OCC_STABLE_LEFT_FRONT");
		TA_EndOverlay(Stone);
		AI_Output(self,other,"Info_EXIT_06_02");	//Do zobaczenia.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"Info_EXIT_06_03");	//Do zobaczenia.
		AI_StopProcessInfos(self);
	};
};


instance DIA_GRD_219_Stone(C_Info)
{
	npc = GRD_219_Stone;
	condition = DIA_GRD_219_Stone_Condition;
	information = DIA_GRD_219_Stone_Info;
	important = 1;
	permanent = 0;
};


func int DIA_GRD_219_Stone_Condition()
{
	if(Kapitel >= 5)
	{
		return 1;
	};
};

func void DIA_GRD_219_Stone_Info()
{
	AI_Output(self,other,"DIA_GRD_219_Stone_06_01");	//Czego chcesz? Nie wygl¹dasz mi na jednego z siepaczy Gomeza.
};


instance DIA_GRD_219_Stone1(C_Info)
{
	npc = GRD_219_Stone;
	condition = DIA_GRD_219_Stone1_Condition;
	information = DIA_GRD_219_Stone1_Info;
	important = 0;
	permanent = 0;
	description = "Masz racjê, nie pracujê dla Gomeza.";
};


func int DIA_GRD_219_Stone1_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_GRD_219_Stone))
	{
		return 1;
	};
};

func void DIA_GRD_219_Stone1_Info()
{
	AI_Output(other,self,"DIA_GRD_219_Stone1_15_01");	//Masz racjê, nie pracujê dla Gomeza.
	AI_Output(self,other,"DIA_GRD_219_Stone1_06_02");	//Wiêc jak siê tutaj dosta³eœ? Tylko Gomez ma klucz do lochów...
	AI_Output(other,self,"DIA_GRD_219_Stone1_15_03");	//Dosta³em go od niego.
	AI_Output(self,other,"DIA_GRD_219_Stone1_06_04");	//Chcesz powiedzieæ, ¿e to ty za³atwi³eœ Gomeza?
	AI_Output(other,self,"DIA_GRD_219_Stone1_15_05");	//Dok³adnie.
	AI_Output(self,other,"DIA_GRD_219_Stone1_06_06");	//Stary, nie wiedzia³em, ¿e staæ ciê na coœ takiego. Ale cieszê siê, ¿e ten przeklêty bandzior dosta³ wreszcie co mu siê nale¿a³o.
	AI_Output(self,other,"DIA_GRD_219_Stone1_06_07");	//Ale dlaczego mnie uwolni³eœ?
	AI_Output(other,self,"DIA_GRD_219_Stone1_15_08");	//Us³ysza³em, ¿e siedzisz tu zamkniêty i pomyœla³em, ¿e móg³bym za³atwiæ Gomeza i zwróciæ ci wolnoœæ.
	AI_Output(self,other,"DIA_GRD_219_Stone1_06_09");	//Có¿, wielkie dziêki...
	AI_Output(self,other,"DIA_GRD_219_Stone1_06_10");	//... Jestem ci niezmiernie wdziêczny. Wpadnij kiedyœ do mojej kuŸni, to pogadamy.
	Npc_SetPermAttitude(self,ATT_FRIENDLY);
	Npc_ExchangeRoutine(self,"OTNEW");
};


instance DIA_GRD_219_Stone3(C_Info)
{
	npc = GRD_219_Stone;
	condition = DIA_GRD_219_Stone3_Condition;
	information = DIA_GRD_219_Stone3_Info;
	important = 1;
	permanent = 0;
};


func int DIA_GRD_219_Stone3_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_GRD_219_Stone1) && Hlp_StrCmp(Npc_GetNearestWP(self),"OCC_STABLE_LEFT_FRONT"))
	{
		return 1;
	};
};

func void DIA_GRD_219_Stone3_Info()
{
	AI_Output(self,other,"DIA_GRD_219_Stone3_06_01");	//Ach, jesteœ. Mam u ciebie d³ug wdziêcznoœci za wypuszczenie mnie z lochu!
	AI_Output(self,other,"DIA_GRD_219_Stone3_06_02");	//Wiesz, tak sobie myœlê: nie mam nic cennego, co móg³bym ci daæ, wiêc mo¿e zamiast tego wykujê dla ciebie coœ specjalnego.
	AI_Output(self,other,"DIA_GRD_219_Stone3_06_03");	//Mo¿e jakiœ pierœcieñ, albo coœ w tym stylu...
};


instance DIA_GRD_219_Stone2(C_Info)
{
	npc = GRD_219_Stone;
	condition = DIA_GRD_219_Stone2_Condition;
	information = DIA_GRD_219_Stone2_Info;
	important = 0;
	permanent = 0;
	description = "Dlaczego Gomez kaza³ zamkn¹æ ciê w lochu?";
};


func int DIA_GRD_219_Stone2_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_GRD_219_Stone3))
	{
		return 1;
	};
};

func void DIA_GRD_219_Stone2_Info()
{
	AI_Output(other,self,"DIA_GRD_219_Stone2_15_01");	//Dlaczego Gomez kaza³ zamkn¹æ ciê w lochu?
	AI_Output(self,other,"DIA_GRD_219_Stone2_06_02");	//Ten sukinsyn ubzdura³ sobie, ¿e spiskuje potajemnie z Magami Ognia. Nie zabi³ mnie tylko dlatego, ¿e jestem najlepszym kowalem w ca³ym Starym Obozie.
	AI_Output(self,other,"DIA_GRD_219_Stone2_06_03");	//No i wrzuci³ mnie do tej zapluskwionej celi i wypuszcza³ tylko wtedy, gdy by³a dla mnie jakaœ robota.
};


instance DIA_GRD_219_Stone4(C_Info)
{
	npc = GRD_219_Stone;
	condition = DIA_GRD_219_Stone4_Condition;
	information = DIA_GRD_219_Stone4_Info;
	important = 0;
	permanent = 0;
	description = "Mo¿esz dla mnie wzmocniæ tê magiczn¹ zbrojê?";
};


func int DIA_GRD_219_Stone4_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_GRD_219_Stone3) && Npc_HasItems(hero,ore_armor_m) && (KnowStone == 0))
	{
		return 1;
	};
};

func void DIA_GRD_219_Stone4_Info()
{
	AI_Output(other,self,"DIA_GRD_219_Stone4_15_01");	//Mo¿esz dla mnie wzmocniæ tê magiczn¹ zbrojê?
	AI_Output(self,other,"DIA_GRD_219_Stone4_06_02");	//Jasne! Daj mi j¹ i zaczekaj chwilê.
	AI_UnequipArmor(hero);
	B_GiveInvItems(hero,self,ore_armor_m,1);
	Npc_RemoveInvItem(self,ore_armor_m);
	B_StartUseMob(self,"BSFIRE");
	AI_Wait(self,1);
	B_StopUseMob(self,"BSFIRE");
	AI_Wait(self,1);
	B_StartUseMob(self,"BSANVIL");
	AI_Wait(self,1);
	B_StopUseMob(self,"BSANVIL");
	AI_Wait(self,1);
	AI_GotoNpc(self,hero);
	CreateInvItem(self,ore_armor_h);
	B_GiveInvItems(self,hero,ore_armor_h,1);
	AI_Output(self,other,"DIA_GRD_219_Stone4_06_03");	//Oto twoja wzmocniona zbroja. Teraz jesteœmy kwita.
	KnowStone = 1;
};


instance DIA_GRD_219_Stone5(C_Info)
{
	npc = GRD_219_Stone;
	condition = DIA_GRD_219_Stone5_Condition;
	information = DIA_GRD_219_Stone5_Info;
	important = 0;
	permanent = 0;
	description = "Przyda³ by mi siê pierœcieñ wzmacniaj¹cy witalnoœæ.";
};


func int DIA_GRD_219_Stone5_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_GRD_219_Stone3) && (KnowStone == 0))
	{
		return 1;
	};
};

func void DIA_GRD_219_Stone5_Info()
{
	AI_Output(other,self,"DIA_GRD_219_Stone5_15_01");	//Przyda³ by mi siê pierœcieñ wzmacniaj¹cy witalnoœæ.
	AI_Output(self,other,"DIA_GRD_219_Stone5_06_02");	//To nie powinno byæ zbyt trudne. Zaczekaj.
	B_StartUseMob(self,"BSFIRE");
	AI_Wait(self,1);
	B_StopUseMob(self,"BSFIRE");
	AI_Wait(self,1);
	B_StartUseMob(self,"BSANVIL");
	AI_Wait(self,1);
	B_StopUseMob(self,"BSANVIL");
	AI_Wait(self,1);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"DIA_GRD_219_Stone5_06_03");	//Ten pierœcieñ zwiêkszy twoje si³y witalne. Myœlê, ¿e po takim prezencie jesteœmy kwita.
	CreateInvItem(self,Ring_des_Lebens2);
	B_GiveInvItems(self,other,Ring_des_Lebens2,1);
	KnowStone = 1;
};


instance DIA_GRD_219_Stone6(C_Info)
{
	npc = GRD_219_Stone;
	condition = DIA_GRD_219_Stone6_Condition;
	information = DIA_GRD_219_Stone6_Info;
	important = 0;
	permanent = 0;
	description = "Chcia³bym, ¿ebyœ wyku³ dla mnie pierœcieñ ochronny.";
};


func int DIA_GRD_219_Stone6_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_GRD_219_Stone3) && (KnowStone == 0))
	{
		return 1;
	};
};

func void DIA_GRD_219_Stone6_Info()
{
	AI_Output(other,self,"DIA_GRD_219_Stone6_15_01");	//Chcia³bym, ¿ebyœ wyku³ dla mnie pierœcieñ ochronny.
	AI_Output(self,other,"DIA_GRD_219_Stone6_06_02");	//Pierœcieñ ochronny? Nie ma sprawy! Od razu wezmê siê do roboty. Zaczekaj chwilê.
	B_StartUseMob(self,"BSFIRE");
	AI_Wait(self,1);
	B_StopUseMob(self,"BSFIRE");
	AI_Wait(self,1);
	B_StartUseMob(self,"BSANVIL");
	AI_Wait(self,1);
	B_StopUseMob(self,"BSANVIL");
	AI_Wait(self,1);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"DIA_GRD_219_Stone6_06_03");	//Chcia³eœ pierœcieñ ochronny? Oto on! Teraz jesteœmy kwita.
	CreateInvItem(self,Schutzring_Total2);
	B_GiveInvItems(self,other,Schutzring_Total2,1);
	KnowStone = 1;
};


instance DIA_GRD_219_Stone7(C_Info)
{
	npc = GRD_219_Stone;
	condition = DIA_GRD_219_Stone7_Condition;
	information = DIA_GRD_219_Stone7_Info;
	important = 0;
	permanent = 0;
	description = "Potrzebujê czegoœ, co zwiêkszy moje umiejêtnoœci magiczne.";
};


func int DIA_GRD_219_Stone7_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_GRD_219_Stone3) && (KnowStone == 0))
	{
		return 1;
	};
};

func void DIA_GRD_219_Stone7_Info()
{
	AI_Output(other,self,"DIA_GRD_219_Stone7_15_01");	//Potrzebujê czegoœ, co zwiêkszy moje umiejêtnoœci magiczne.
	AI_Output(self,other,"DIA_GRD_219_Stone7_06_02");	//...Zwiêkszy umiejêtnoœci magiczne, powiadasz? Mo¿e jakiœ amulet! Tak, zrobiê dla ciebie magiczny amulet. To nie potrwa d³ugo.
	B_StartUseMob(self,"BSFIRE");
	AI_Wait(self,1);
	B_StopUseMob(self,"BSFIRE");
	AI_Wait(self,1);
	B_StartUseMob(self,"BSANVIL");
	AI_Wait(self,1);
	B_StopUseMob(self,"BSANVIL");
	AI_Wait(self,1);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"DIA_GRD_219_Stone7_06_03");	//Dobra, amulet gotowy. Muszê przyznaæ, ¿e wyszed³ ca³kiem nieŸle. Proszê, teraz jesteœmy kwita.
	CreateInvItem(self,Amulett_der_Magie);
	B_GiveInvItems(self,other,Amulett_der_Magie,1);
	KnowStone = 1;
};


instance INFO_STONE_CRAFT_WHICH(C_Info)
{
	npc = GRD_219_Stone;
	nr = 9;
	condition = info_stone_craft_which_condition;
	information = info_stone_craft_which_info;
	important = 0;
	permanent = 1;
	description = "Potrafi³byœ wzmocniæ nieco moje pancerze?";
};


func int info_stone_craft_which_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_STT) || (Npc_GetTrueGuild(hero) == GIL_GRD) || (Npc_GetTrueGuild(hero) == GIL_KDF) || (Npc_GetTrueGuild(hero) == GIL_EBR))
	{
		return TRUE;
	};
};

func void info_stone_craft_which_info()
{
	AI_Output(hero,self,"Info_Stone_CRAFT_WHICH_15_01");	//Potrafi³byœ wzmocniæ nieco moje pancerze?
	AI_Output(self,hero,"Info_Stone_CRAFT_WHICH_09_02");	//Pewnie. Przynieœ mi tylko stosown¹ zbrojê, a zobaczê co da siê zrobiæ.
	Info_ClearChoices(info_stone_craft_which);
	Info_AddChoice(info_stone_craft_which,DIALOG_BACK,info_stone_craft_which_back);
	if(Npc_HasItems(other,stt_armor_m) >= 1)
	{
		Info_AddChoice(info_stone_craft_which,"Wzmocniony strój Cienia (375 bry³ek rudy)",info_stone_craft_which_stt);
	};
	if(Npc_HasItems(other,stt_armor_h) >= 1)
	{
		Info_AddChoice(info_stone_craft_which,"Wzmocniona zbroja Cienia (600 bry³ek rudy)",info_stone_craft_which_stth);
	};
	if(Npc_HasItems(other,kdf_armor_l) >= 1)
	{
		Info_AddChoice(info_stone_craft_which,"Wzmocniona szata ognia (600 bry³ek rudy)",info_stone_craft_which_kdfl);
	};
	if(Npc_HasItems(other,grd_armor_l) >= 1)
	{
		Info_AddChoice(info_stone_craft_which,"Wzmocniona lekka zbroja Stra¿nika (675 bry³ek rudy)",info_stone_craft_which_grdl);
	};
	if(Npc_HasItems(other,grd_armor_m) >= 1)
	{
		Info_AddChoice(info_stone_craft_which,"Wzmocniona zbroja Stra¿nika (825 bry³ek rudy)",info_stone_craft_which_grdm);
	};
	if(Npc_HasItems(other,grd_armor_h) >= 1)
	{
		Info_AddChoice(info_stone_craft_which,"Wzmocniona ciê¿ka zbroja Stra¿nika (1050 bry³ek rudy)",info_stone_craft_which_grdh);
	};
};

func void info_stone_craft_which_back()
{
	Info_ClearChoices(info_stone_craft_which);
};

func void info_stone_craft_which_stt()
{
	AI_Output(other,self,",	Info_Stone_CRAFT_WHICH_Stone_13_01");	//Oto pancerz.
	if((Npc_HasItems(other,stt_armor_m) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 375))
	{
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_16_02");	//W porz¹dku, da siê zrobiæ.
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_15_04");	//Zaczekaj chwilkê.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,stt_armor_m,1);
		B_GiveInvItems(hero,self,ItMiNugget,375);
		Npc_RemoveInvItem(self,stt_armor_m);
		B_StartUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StartUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		AI_GotoNpc(self,hero);
		CreateInvItem(self,stt_armor_m_upgrade);
		B_GiveInvItems(self,hero,stt_armor_m_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_15_05");	//Dobra, masz tu swoj¹ now¹ zbrojê. Tylko dbaj o ni¹, ¿ebyœ czasem zrazu jutro nie przychodzi³ do mnie z pretensjami.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_15_02");	//Wróæ, gdy bêdziesz mia³ doœæ rudy!
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_stone_craft_which);
	};
};

func void info_stone_craft_which_stth()
{
	AI_Output(other,self,",	Info_Stone_CRAFT_WHICH_Stone_13_01");	//Oto pancerz.
	if((Npc_HasItems(other,stt_armor_h) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 600))
	{
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_16_02");	//W porz¹dku, da siê zrobiæ.
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_15_04");	//Zaczekaj chwilkê.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,stt_armor_h,1);
		B_GiveInvItems(hero,self,ItMiNugget,600);
		Npc_RemoveInvItem(self,stt_armor_h);
		B_StartUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StartUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		AI_GotoNpc(self,hero);
		CreateInvItem(self,stt_armor_h_upgrade);
		B_GiveInvItems(self,hero,stt_armor_h_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_15_05");	//Dobra, masz tu swoj¹ now¹ zbrojê. Tylko dbaj o ni¹, ¿ebyœ czasem zrazu jutro nie przychodzi³ do mnie z pretensjami.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_15_02");	//Wróæ, gdy bêdziesz mia³ doœæ rudy!
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_stone_craft_which);
	};
};

func void info_stone_craft_which_kdfl()
{
	AI_Output(other,self,",	Info_Stone_CRAFT_WHICH_Stone_13_01");	//Oto pancerz.
	if((Npc_HasItems(other,kdf_armor_l) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 600))
	{
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_16_02");	//W porz¹dku, da siê zrobiæ.
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_15_04");	//Zaczekaj chwilkê.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,kdf_armor_l,1);
		B_GiveInvItems(hero,self,ItMiNugget,600);
		Npc_RemoveInvItem(self,kdf_armor_l);
		B_StartUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StartUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		AI_GotoNpc(self,hero);
		CreateInvItem(self,kdf_armor_l_upgrade);
		B_GiveInvItems(self,hero,kdf_armor_l_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_15_05");	//Dobra, masz tu swoj¹ now¹ zbrojê. Tylko dbaj o ni¹, ¿ebyœ czasem zrazu jutro nie przychodzi³ do mnie z pretensjami.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_15_02");	//Wróæ, gdy bêdziesz mia³ doœæ rudy!
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_stone_craft_which);
	};
};

func void info_stone_craft_which_grdl()
{
	AI_Output(other,self,",	Info_Stone_CRAFT_WHICH_Stone_13_01");	//Oto pancerz.
	if((Npc_HasItems(other,grd_armor_l) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 675))
	{
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_16_02");	//W porz¹dku, da siê zrobiæ.
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_15_04");	//Zaczekaj chwilkê.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,grd_armor_l,1);
		B_GiveInvItems(hero,self,ItMiNugget,675);
		Npc_RemoveInvItem(self,grd_armor_l);
		B_StartUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StartUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		AI_GotoNpc(self,hero);
		CreateInvItem(self,grd_armor_l_upgrade);
		B_GiveInvItems(self,hero,grd_armor_l_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_15_05");	//Dobra, masz tu swoj¹ now¹ zbrojê. Tylko dbaj o ni¹, ¿ebyœ czasem zrazu jutro nie przychodzi³ do mnie z pretensjami.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_15_02");	//Wróæ, gdy bêdziesz mia³ doœæ rudy!
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_stone_craft_which);
	};
};

func void info_stone_craft_which_grdm()
{
	AI_Output(other,self,",	Info_Stone_CRAFT_WHICH_Stone_13_01");	//Oto pancerz.
	if((Npc_HasItems(other,grd_armor_m) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 825))
	{
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_16_02");	//W porz¹dku, da siê zrobiæ.
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_15_04");	//Zaczekaj chwilkê.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,grd_armor_m,1);
		B_GiveInvItems(hero,self,ItMiNugget,825);
		Npc_RemoveInvItem(self,grd_armor_m);
		B_StartUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StartUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		AI_GotoNpc(self,hero);
		CreateInvItem(self,grd_armor_m_upgrade);
		B_GiveInvItems(self,hero,grd_armor_m_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_15_05");	//Dobra, masz tu swoj¹ now¹ zbrojê. Tylko dbaj o ni¹, ¿ebyœ czasem zrazu jutro nie przychodzi³ do mnie z pretensjami.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_15_02");	//Wróæ, gdy bêdziesz mia³ doœæ rudy!
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_stone_craft_which);
	};
};

func void info_stone_craft_which_grdh()
{
	AI_Output(other,self,",	Info_Stone_CRAFT_WHICH_Stone_13_01");	//Oto pancerz.
	if((Npc_HasItems(other,grd_armor_h) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 1050))
	{
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_16_02");	//W porz¹dku, da siê zrobiæ.
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_15_04");	//Zaczekaj chwilkê.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,grd_armor_h,1);
		B_GiveInvItems(hero,self,ItMiNugget,1050);
		Npc_RemoveInvItem(self,grd_armor_h);
		B_StartUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StartUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		AI_GotoNpc(self,hero);
		CreateInvItem(self,grd_armor_h_upgrade);
		B_GiveInvItems(self,hero,grd_armor_h_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_15_05");	//Dobra, masz tu swoj¹ now¹ zbrojê. Tylko dbaj o ni¹, ¿ebyœ czasem zrazu jutro nie przychodzi³ do mnie z pretensjami.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_15_02");	//Wróæ, gdy bêdziesz mia³ doœæ rudy!
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_stone_craft_which);
	};
};

