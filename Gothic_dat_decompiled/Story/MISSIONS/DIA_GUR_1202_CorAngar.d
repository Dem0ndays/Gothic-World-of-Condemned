
instance DIA_GUR_1202_CorAngar_Exit(C_Info)
{
	npc = GUR_1202_CorAngar;
	nr = 999;
	condition = DIA_GUR_1202_CorAngar_Exit_Condition;
	information = DIA_GUR_1202_CorAngar_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_GUR_1202_CorAngar_Exit_Condition()
{
	return TRUE;
};

func void DIA_GUR_1202_CorAngar_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CorAngar_LaterTrainer(C_Info)
{
	npc = GUR_1202_CorAngar;
	nr = 1;
	condition = DIA_CorAngar_LaterTrainer_Condition;
	information = DIA_CorAngar_LaterTrainer_Info;
	permanent = 0;
	description = "Mo�esz mnie czego� nauczy�?";
};


func int DIA_CorAngar_LaterTrainer_Condition()
{
	return 1;
};

func void DIA_CorAngar_LaterTrainer_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_LaterTrainer_15_00");	//Mo�esz mnie czego� nauczy�?
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_01");	//Chcesz zosta� silnym wojownikiem, wi�c szukasz mistrza, kt�ry wska�e ci drog�.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_02");	//To chwalebne, ale ja nie mog� ci pom�c.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_03");	//Po�wi�cam m�j czas tylko cz�onkom Wielkiego Kr�gu Stra�y �wi�tynnej.
};


instance DIA_CorAngar_WieTempler(C_Info)
{
	npc = GUR_1202_CorAngar;
	nr = 1;
	condition = DIA_CorAngar_WieTempler_Condition;
	information = DIA_CorAngar_WieTempler_Info;
	permanent = 1;
	description = "Co mam zrobi�, �eby zosta� �wi�tynnym Stra�nikiem?";
};


func int DIA_CorAngar_WieTempler_Condition()
{
	if((Npc_KnowsInfo(hero,DIA_CorAngar_LaterTrainer) && (Npc_GetTrueGuild(other) != GIL_TPL) && (Npc_GetTrueGuild(hero) == GIL_None)) || (Npc_GetTrueGuild(hero) == GIL_NOV))
	{
		return 1;
	};
};

func void DIA_CorAngar_WieTempler_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_WieTempler_15_00");	//Co mam zrobi�, �eby zosta� �wi�tynnym Stra�nikiem?
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_01");	//Najpierw musisz ods�u�y� swoje jako Nowicjusz, dop�ki nie przekonamy si�, �e jeste� oddanym s�ug� �ni�cego.
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_02");	//Dopiero wtedy mo�esz do mnie wr�ci�, a ja udziel� ci lekcji.
	AI_StopProcessInfos(self);
};


instance GUR_1202_CorAngar_Teach(C_Info)
{
	npc = GUR_1202_CorAngar;
	nr = 10;
	condition = GUR_1202_CorAngar_Teach_Condition;
	information = GUR_1202_CorAngar_Teach_Info;
	permanent = 1;
	description = "Poka�esz mi, jak poprawi� moj� si�� i zr�czno��?";
};


func int GUR_1202_CorAngar_Teach_Condition()
{
	if(C_NpcBelongsToPsiCamp(hero))
	{
		return TRUE;
	};
};

func void GUR_1202_CorAngar_Teach_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_Teach_15_00");	//Poka�esz mi, jak poprawi� moj� si�� i zr�czno��?
	AI_Output(self,other,"GUR_1202_CorAngar_Teach_08_01");	//Si�a i zr�czno�� to cechy wielkiego wojownika.
	Info_ClearChoices(GUR_1202_CorAngar_Teach);
	Info_AddChoice(GUR_1202_CorAngar_Teach,DIALOG_BACK,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_BACK()
{
	Info_ClearChoices(GUR_1202_CorAngar_Teach);
};

func void GUR_1202_CorAngar_Teach_STR_1()
{
	B_BuyAttributePoints(other,ATR_STRENGTH,LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(GUR_1202_CorAngar_Teach);
	Info_AddChoice(GUR_1202_CorAngar_Teach,DIALOG_BACK,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_STR_5()
{
	B_BuyAttributePoints(other,ATR_STRENGTH,5 * LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(GUR_1202_CorAngar_Teach);
	Info_AddChoice(GUR_1202_CorAngar_Teach,DIALOG_BACK,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_DEX_1()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(GUR_1202_CorAngar_Teach);
	Info_AddChoice(GUR_1202_CorAngar_Teach,DIALOG_BACK,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_DEX_5()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(GUR_1202_CorAngar_Teach);
	Info_AddChoice(GUR_1202_CorAngar_Teach,DIALOG_BACK,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),GUR_1202_CorAngar_Teach_DEX_1);
};


instance GUR_1202_CorAngar_WANNABETPL(C_Info)
{
	npc = GUR_1202_CorAngar;
	condition = GUR_1202_CorAngar_WANNABETPL_Condition;
	information = GUR_1202_CorAngar_WANNABETPL_Info;
	important = 0;
	permanent = 1;
	description = "Chc� zosta� �wi�tynnym Stra�nikiem!";
};


func int GUR_1202_CorAngar_WANNABETPL_Condition()
{
	if((CorKalom_BringMCQBalls == LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_NOV))
	{
		return TRUE;
	};
};

func void GUR_1202_CorAngar_WANNABETPL_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_WANNABETPL_Info_15_01");	//Chc� zosta� �wi�tynnym Stra�nikiem!
	if(hero.level < 10)
	{
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_02");	//Nie jeste� jeszcze gotowy. Mo�esz do nas do��czy�, kiedy zdob�dziesz nieco wi�cej do�wiadczenia.
		GUR_1202_CorAngar_WANNABETPL.permanent = 1;
	}
	else if(hero.level >= 10)
	{
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_03");	//Nadszed� dzie�, w kt�rym dane ci b�dzie do nas do��czy�.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_04");	//Pami�taj, �e �wi�tynny Stra�nik to co� wi�cej ni� wojownik strzeg�cy obozu Bractwa. Jeste�my wybranymi stra�nikami wyznawc�w �ni�cego. Bronimy duchowej aury tego miejsca.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_05");	//Wykorzystujemy zar�wno nasz� si�� fizyczn� jak i duchow�. Prawdziwym Stra�nikiem �wi�tynnym mo�e zosta� tylko ten, kt�rego cia�o i duch funkcjonuj� w idealnej harmonii.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_06");	//Ciesz� si�, �e uda�o ci si� osi�gn�� tak wiele w tak kr�tkim czasie.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_07");	//Pami�taj: Duchowa koncentracja i zdrowe cia�o sprostaj� ka�demu wyzwaniu.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_08");	//Id� teraz do Gor Na Totha. Znajdziesz go na placu treningowym. On da ci nowy pancerz.
		GUR_1202_CorAngar_WANNABETPL.permanent = 0;
		Npc_SetTrueGuild(hero,GIL_TPL);
		hero.guild = GIL_TPL;
		Mdl_ApplyOverlayMds(hero,"Humans_Mage.mds");
		Log_CreateTopic(GE_BecomeTemplar,LOG_NOTE);
		B_LogEntry(GE_BECOMEGURU,"Skoro do��czy�em do Stra�nik�w �wi�tynnych, �cie�ka Guru jest ju� dla mnie zamkni�ta.");
		B_LogEntry(GE_BecomeTemplar,"Dzi� Cor Angar przyj�� mnie w poczet Stra�y �wi�tynnej. Gor Na Toth ma mi wr�czy� moj� now� zbroj�. Znajd� go przy placu treningowym.");
		Log_CreateTopic(GE_TeacherPSI,LOG_NOTE);
		B_LogEntry(GE_TeacherPSI,"Cor Angar pomo�e mi rozwin�� moj� si��, zr�czno�� i walk� dwur�cznym or�em - to ostatnie dopiero, gdy naucz� si� pos�ugiwa� broni� jednor�czn�. Zwykle przebywa na placu treningowym �wi�tynnej Stra�y, na g�rnym poziomie obozu.");
	};
};


instance GUR_1202_CORANGAR_ZWEIHAND1(C_Info)
{
	npc = GUR_1202_CorAngar;
	condition = gur_1202_corangar_zweihand1_condition;
	information = gur_1202_corangar_zweihand1_info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_Learn2h_1,LPCOST_TALENT_2H_1,0);
};


func int gur_1202_corangar_zweihand1_condition()
{
	if(((Npc_GetTalentSkill(hero,NPC_TALENT_2H) < 1) && (Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 2) && (Npc_GetTrueGuild(hero) == GIL_TPL)) || ((Npc_GetTalentSkill(hero,NPC_TALENT_2H) < 1) && (Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 2) && (Npc_GetTrueGuild(hero) == GIL_GUR)))
	{
		return TRUE;
	};
};

func void gur_1202_corangar_zweihand1_info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_ZWEIHAND1_Info_15_01");	//Chcia�bym potrafi� pos�ugiwa� si� dwur�cznym mieczem.
	if(B_GiveSkill(other,NPC_TALENT_2H,1,LPCOST_TALENT_2H_1))
	{
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_02");	//Walka dwur�cznym or�em stanowi powa�ne wyzwanie dla twojej si�y i zr�czno�ci.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_03");	//Aby m�c sprawnie pos�ugiwa� si� dwur�czna broni� musisz nie tylko rozwija� swoje cia�o, ale r�wnie� i umys�.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_04");	//Tylko pe�na kontrola nad cia�em i umys�em pozwoli ci rozwija� swoje umiej�tno�ci.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_05");	//Koncentracja to podstawa. To ona jednoczy cia�o i umys�.
		gur_1202_corangar_zweihand1.permanent = 0;
		AI_StopProcessInfos(self);
	};
};


instance GUR_1202_CORANGAR_ZWEIHAND2(C_Info)
{
	npc = GUR_1202_CorAngar;
	condition = gur_1202_corangar_zweihand2_condition;
	information = gur_1202_corangar_zweihand2_info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_Learn2h_2,LPCOST_TALENT_2H_2,0);
};


func int gur_1202_corangar_zweihand2_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_2H) == 1) && (Npc_GetTrueGuild(hero) == GIL_TPL))
	{
		return TRUE;
	};
};

func void gur_1202_corangar_zweihand2_info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_ZWEIHAND2_Info_15_01");	//Chcia�bym dowiedzie� si� czego� wi�cej o walce dwur�cznym or�em.
	if(B_GiveSkill(other,NPC_TALENT_2H,2,LPCOST_TALENT_2H_2))
	{
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_02");	//Wiesz ju� jak zmusi� ostrze swego miecza do ta�ca �mierci. Teraz poka�� ci jak wykorzysta� twoje umiej�tno�ci w walce.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_03");	//Oczyma duszy spr�buj przewidzie� nast�pny ruch twojego przeciwnika.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_04");	//Poznanie sposobu walki nieprzyjaciela to ju� po�owa sukcesu.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_05");	//B�d� szybki, twoja ruchliwo�� i p�ynno�� twoich ruch�w powinny i�� w parze z si�� i precyzj� twoich cios�w.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_06");	//Naucz si� ignorowa� b�l. To twoja si�a ducha zadecyduje o ostatecznym wyniku starcia.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_07");	//Zachowaj spok�j. Zachowanie czysto�ci umys�u i niezachwianej koncentracji przypiecz�tuje twoje zwyci�stwo.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_08");	//Rozs�dnie wykorzystuj swoje umiej�tno�ci, i pami�taj: kto prowokuje walk� - ginie w walce.
		gur_1202_corangar_zweihand2.permanent = 0;
		AI_StopProcessInfos(self);
	};
};


instance GUR_1202_CorAngar_SENDS(C_Info)
{
	npc = GUR_1202_CorAngar;
	condition = GUR_1202_CorAngar_SENDS_Condition;
	information = GUR_1202_CorAngar_SENDS_Info;
	important = 0;
	permanent = 0;
	description = "Co si� stanie teraz?";
};


func int GUR_1202_CorAngar_SENDS_Condition()
{
	if((Kapitel == 3) && (CorAngar_GotoOGY == FALSE))
	{
		return 1;
	};
};

func void GUR_1202_CorAngar_SENDS_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_SENDS_Info_15_01");	//Co si� stanie teraz?
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_02");	//Wizja by�a bardzo mglista. Zamiast odpowiedzi da�a nam jeszcze wi�cej pyta�.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_03");	//Ale jedna rzecz nie ulega w�tpliwo�ci: widzia�em Orka w jaskini. W pobli�u znajduje si� opuszczone miejsce orkowego kultu.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_04");	//Orkowie chowali tam swoich zmar�ych, dlatego nazywamy ten labirynt jaski� Cmentarzyskiem Ork�w.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_05");	//Nasz Guru, Baal Lukor uda� si� tam z oddzia�em Stra�nik�w �wi�tynnych. Mo�e znajd� co�, co pozwoli nam wyja�ni� znaczenie wizji.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_06");	//Przyda�by mi si� kto�, kto rozejrzy si� tam troch� i zda mi raport z sytuacji.
	AI_Output(other,self,"GUR_1202_CorAngar_SENDS_Info_15_07");	//Dlaczego nie p�jdziesz tam sam? W ko�cu jeste� przyw�dc� Stra�y �wi�tynnej!
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_08");	//Moim zadaniem jest ochrona Ja�nie O�wieconego. Musz� zosta� na miejscu, �eby strzec Y'Beriona.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_09");	//Odda�e� Obozowi nieocenione us�ugi. Tylko na tobie mog� polega�.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_10");	//Prosz�, udaj si� na Cmentarzysko Ork�w i dostarcz mi informacji na temat odkry� poczynionych przez Stra�nik�w.
	Info_ClearChoices(GUR_1202_CorAngar_SENDS);
	Info_AddChoice(GUR_1202_CorAngar_SENDS,"A co dostan� w zamian?",GUR_1202_CorAngar_SENDS_EARN);
	Info_AddChoice(GUR_1202_CorAngar_SENDS,"Natychmiast rusz� w drog�!",GUR_1202_CorAngar_SENDS_KNOW);
};

func void GUR_1202_CorAngar_SENDS_EARN()
{
	AI_Output(other,self,"GUR_1202_CorAngar_SENDS_EARN_Info_15_01");	//A co dostan� w zamian?
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_EARN_Info_08_02");	//Chcesz rudy? Chyba jednak �le ci� oceni�em. Ale potrzebuj� twojej pomocy. Prosz�, oto 100 bry�ek rudy. Wi�cej ode mnie nie dostaniesz!
	CreateInvItems(self,ItMiNugget,100);
	B_GiveInvItems(self,hero,ItMiNugget,100);
};

func void GUR_1202_CorAngar_SENDS_KNOW()
{
	AI_Output(other,self,"GUR_1202_CorAngar_SENDS_KNOW_Info_15_01");	//Natychmiast rusz� w drog�!
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_KNOW_Info_08_02");	//Zanim p�jdziesz, we� ten pier�cie�. Niech ci� chroni w walce.
	B_Story_GotoOrcGraveyard();
	CreateInvItem(self,Schutzring_Geschosse1);
	B_GiveInvItems(self,hero,Schutzring_Geschosse1,1);
	Info_ClearChoices(GUR_1202_CorAngar_SENDS);
};


instance GUR_1202_CorAngar_WHERE(C_Info)
{
	npc = GUR_1202_CorAngar;
	condition = GUR_1202_CorAngar_WHERE_Condition;
	information = GUR_1202_CorAngar_WHERE_Info;
	important = 0;
	permanent = 0;
	description = "Gdzie jest to Cmentarzysko Ork�w?";
};


func int GUR_1202_CorAngar_WHERE_Condition()
{
	if(Npc_KnowsInfo(hero,GUR_1202_CorAngar_SENDS))
	{
		return 1;
	};
};

func void GUR_1202_CorAngar_WHERE_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_WHERE_Info_15_01");	//Gdzie jest to Cmentarzysko Ork�w?
	AI_Output(self,other,"GUR_1202_CorAngar_WHERE_Info_08_02");	//Niedaleko st�d. Nowicjusz Talas wska�e ci drog�. Znajdziesz go na �wi�tynnym dziedzi�cu. On b�dzie twoim przewodnikiem.
	B_LogEntry(CH3_OrcGraveyard,"Nowicjusz Talas wska�e mi drog� do cmentarzyska ork�w. Czeka na mnie na �wi�tynnym dziedzi�cu.");
};


instance GUR_1202_CorAngar_AFTER(C_Info)
{
	npc = GUR_1202_CorAngar;
	condition = GUR_1202_CorAngar_AFTER_Condition;
	information = GUR_1202_CorAngar_AFTER_Info;
	important = 0;
	permanent = 0;
	description = "By�em na Cmentarzysku Ork�w.";
};


func int GUR_1202_CorAngar_AFTER_Condition()
{
	if(BaalLukor_BringParchment == 4)
	{
		return 1;
	};
};

func void GUR_1202_CorAngar_AFTER_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_01");	//By�em na Cmentarzysku Ork�w. Tam NIC NIE MA. Ani �ni�cego, ani znaku... Nic!
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_02");	//A co z Baalem Lukorem i Stra�nikami?
	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_03");	//Wszyscy zgin�li.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_04");	//Zgin�li? Ale dlaczego, co si� sta�o?
	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_05");	//W jaskiniach a� roi�o si� od Ork�w. Wybili Stra� �wi�tynn� do nogi.
	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_06");	//Tylko ja i Baal Lukor wyszli�my z tego ca�o, ale nagle Baal postrada� zmys�y.
	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_07");	//Wrzeszcza�, �e �ni�cy kaza� mu mnie zabi� i zamierza� wykona� to polecenie.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_08");	//Najwyra�niej nie m�g� si� pogodzi� z niepowodzeniem swojej misji.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_09");	//Nie wierz�, �eby b�ogos�awiony wp�yw �ni�cego m�g� go popchn�� do tak brutalnego dzia�ania.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_10");	//To nie mo�e... Nie mo�e... NIEWA�NE!!!
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_11");	//Najwa�niejsze, �e zamiar Baala Lukora si� nie powi�d�.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_12");	//Teraz nasz� jedyn� nadziej� jest Y'Berion.
	B_GiveXP(XP_ReportToCorAngar);
	B_Story_BackFromOrcGraveyard();
};


instance Info_CorAngar_FindHerb(C_Info)
{
	npc = GUR_1202_CorAngar;
	condition = Info_CorAngar_FindHerb_Condition;
	information = Info_CorAngar_FindHerb_Info;
	permanent = 0;
	important = 0;
	description = "Co s�ycha� u Ja�nie O�wieconego?";
};


func int Info_CorAngar_FindHerb_Condition()
{
	if(Npc_KnowsInfo(hero,GUR_1202_CorAngar_AFTER))
	{
		return 1;
	};
};

func void Info_CorAngar_FindHerb_Info()
{
	AI_Output(other,self,"Mis_3_NC_CorAngar_FindHerb_15_01");	//Co s�ycha� u Ja�nie O�wieconego?
	AI_Output(self,other,"Mis_3_NC_CorAngar_FindHerb_08_02");	//Nie budzi si�. I z godziny na godzin� jest co raz s�abszy. Wiem, jak mo�na go zbudzi�, ale potrzebuj� twojej pomocy.
	AI_Output(other,self,"Mis_3_NC_CorAngar_FindHerb_15_03");	//Co mam zrobi�?
	AI_Output(self,other,"Mis_3_NC_CorAngar_FindHerb_08_04");	//Za�atw pi�� najmocniejszych zi� uzdrawiaj�cych jakie mo�na znale�� na bagnach!
	AI_Output(self,other,"Mis_3_NC_CorAngar_FindHerb_08_06");	//Potem udaj si� do Caine'a, jak ju� tylko je zdob�dziesz. On b�dzie w stanie uwarzy� ci z nich eliksir.
	AI_Output(self,other,"Mis_3_NC_CorAngar_FindHerb_08_05");	//Spiesz si�!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(NOV_1301_Caine,"HERBS");
	CorAngar_FindHerb = LOG_RUNNING;
	Log_CreateTopic(CH3_FindHerbs,LOG_MISSION);
	Log_SetTopicStatus(CH3_FindHerbs,LOG_RUNNING);
	B_LogEntry(CH3_FindHerbs,"Y'Berion nadal nie odzyska� przytomno�ci. Cor Angar nakaza� mi znale�� pi�� leczniczych zi� o silnym dzia�aniu. Jak ju� je tylko zdob�d�, mam je przekaza� Caine'owi, kt�ry uwarzy z nich silny eliksir leczniczy.");
};


instance Info_CorAngar_FindHerb_WHERE(C_Info)
{
	npc = GUR_1202_CorAngar;
	nr = 1;
	condition = Info_CorAngar_FindHerb_WHERE_Condition;
	information = Info_CorAngar_FindHerb_WHERE_Info;
	permanent = 0;
	important = 0;
	description = "Gdzie mog� znale�� te zio�a?";
};


func int Info_CorAngar_FindHerb_WHERE_Condition()
{
	if((CorAngar_FindHerb == LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Herb_03) < 5))
	{
		return 1;
	};
};

func void Info_CorAngar_FindHerb_WHERE_Info()
{
	AI_Output(other,self,"Info_CorAngar_FindHerb_WHERE_15_01");	//Gdzie mog� znale�� te zio�a?
	AI_Output(self,other,"Info_CorAngar_FindHerb_WHERE_08_02");	//Poszukaj na bagnach za Obozem. Musisz si� zapu�ci� do�� daleko, wi�c uwa�aj na b�otne w�e!
	AI_Output(self,other,"Info_CorAngar_FindHerb_WHERE_08_03");	//I nie tra� ani chwili. Id� ju�!
	AI_StopProcessInfos(self);
	B_LogEntry(CH3_FindHerbs,"Potrzebne Angarowi zio�a rosn� daleko na bagnach, za obozem Bractwa. Musz� mie� oczy szeroko otwarte - tamta okolica roi si� od b�otnych w�y.");
};


instance Info_CorAngar_FindHerb_LOOK(C_Info)
{
	npc = GUR_1202_CorAngar;
	nr = 1;
	condition = Info_CorAngar_FindHerb_LOOK_Condition;
	information = Info_CorAngar_FindHerb_LOOK_Info;
	permanent = 0;
	important = 0;
	description = "Jak rozpoznam te zio�a?";
};


func int Info_CorAngar_FindHerb_LOOK_Condition()
{
	if((CorAngar_FindHerb == LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Herb_03) < 5))
	{
		return 1;
	};
};

func void Info_CorAngar_FindHerb_LOOK_Info()
{
	AI_Output(other,self,"Info_CorAngar_FindHerb_LOOK_15_01");	//Jak rozpoznam te zio�a?
	AI_Output(self,other,"Info_CorAngar_FindHerb_LOOK_08_02");	//Przypominaj� gwiazd� z o�mioma zielonymi i pomara�czowymi li��mi.
	AI_Output(self,other,"Info_CorAngar_FindHerb_LOOK_08_03");	//Ruszaj w drog�.
	AI_StopProcessInfos(self);
	B_LogEntry(CH3_FindHerbs,"Lecznicze zio�a przypominaj� gwiazdy. Maj� cztery zielone i cztery pomara�czowe li�cie.");
};


instance Info_CorAngar_FindHerb_Running(C_Info)
{
	npc = GUR_1202_CorAngar;
	nr = 1;
	condition = Info_CorAngar_FindHerb_Running_Condition;
	information = Info_CorAngar_FindHerb_Running_Info;
	permanent = 1;
	important = 0;
	description = "Nie znalaz�em jeszcze potrzebnej ilo�ci zi�.";
};


func int Info_CorAngar_FindHerb_Running_Condition()
{
	if((CorAngar_FindHerb == LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Herb_03) < 5) && Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_WHERE) && Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_LOOK))
	{
		return 1;
	};
};

func void Info_CorAngar_FindHerb_Running_Info()
{
	var C_Npc fortuno;
	AI_Output(other,self,"Info_CorAngar_FindHerb_Running_15_01");	//Nie znalaz�em jeszcze potrzebnej ilo�ci zi�.
	AI_Output(self,other,"Info_CorAngar_FindHerb_Running_08_02");	//Mo�e Fortuno, handlarz zio�ami, ma troch� w swoich zapasach.
	AI_Output(self,other,"Info_CorAngar_FindHerb_Running_08_03");	//Pospiesz si�. Potrzebuj� pi�ciu zi�. Y'Berionowi nie zosta�o ju� zbyt wiele czasu.
	AI_StopProcessInfos(self);
	if(!Fortuno_HasYBerionHerbs)
	{
		fortuno = Hlp_GetNpc(NOV_1357_Fortuno);
		CreateInvItems(fortuno,ItFo_Plants_Herb_03,5);
		Fortuno_HasYBerionHerbs = TRUE;
		B_LogEntry(CH3_FindHerbs,"Fortuno, handlarz zielem, mo�e mie� takie zio�a na sk�adzie.");
	};
};


instance Info_CorAngar_FindHerb_Success(C_Info)
{
	npc = GUR_1202_CorAngar;
	condition = Info_CorAngar_FindHerb_Success_Condition;
	information = Info_CorAngar_FindHerb_Success_Info;
	permanent = 0;
	description = "Mam tu eliksir uzdrawiaj�cy dla Y'Beriona.";
};


func int Info_CorAngar_FindHerb_Success_Condition()
{
	if((Npc_HasItems(other,HealthWater) >= 1) && (CorAngar_FindHerb == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void Info_CorAngar_FindHerb_Success_Info()
{
	var C_Npc YBerion;
	AI_Output(other,self,"Info_CorAngar_Find_Success_15_01");	//Mam tu eliksir uzdrawiaj�cy dla Y'Beriona.
	AI_Output(self,other,"Info_CorAngar_FindHerb_Success_08_05");	//Pozostaje nam tylko mie� nadziej�, �e dla biednego Y'Beriona nie jest jeszcze za p�no.
	Yberion_dead = LOG_RUNNING;
	Npc_ExchangeRoutine(NOV_1301_Caine,"START");
	CorAngar_FindHerb = LOG_SUCCESS;
	B_LogEntry(CH3_FindHerbs,"Za�atwi�em Cor Angarowi obiecany eliksir. Miejmy tylko nadziej�, �e nie jest jeszcze za p�no...");
	Log_SetTopicStatus(CH3_FindHerbs,LOG_SUCCESS);
	B_GiveInvItems(other,self,HealthWater,1);
	Npc_RemoveInvItems(self,HealthWater,1);
	B_GiveXP(XP_FindHerbs);
	AI_StopProcessInfos(self);
	YBerion = Hlp_GetNpc(GUR_1200_YBerion);
	Npc_ExchangeRoutine(YBerion,"CALLSLEEPER");
	AI_ContinueRoutine(YBerion);
	AI_Wait(self,1);
	AI_GotoNpc(self,YBerion);
	AI_TurnToNPC(self,YBerion);
	AI_PlayAni(self,"T_PLUNDER");
	AI_WaitTillEnd(self,YBerion);
};


instance Info_CorAngar_TELEPORT(C_Info)
{
	npc = GUR_1202_CorAngar;
	condition = Info_CorAngar_TELEPORT_Condition;
	information = Info_CorAngar_TELEPORT_Info;
	permanent = 0;
	important = 1;
};


func int Info_CorAngar_TELEPORT_Condition()
{
	if(Npc_KnowsInfo(hero,dia_corangar_wokeup))
	{
		return TRUE;
	};
};

func void Info_CorAngar_TELEPORT_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_01");	//Jeszcze co�!
	AI_Output(hero,self,"Info_CorAngar_TELEPORT_15_02");	//Tak?
	AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_03");	//We� t� magiczn� run� jako symbol naszej wdzi�czno�ci za twoje dokonania.
	AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_04");	//Pozwoli ci ona w dogodnej chwili przeteleportowa� si� na �wi�tynny dziedziniec.
	AI_Output(hero,self,"Info_CorAngar_TELEPORT_15_05");	//Dzi�kuj�!
	B_Story_SentToNC();
	AI_StopProcessInfos(self);
};


instance dia_corangar_wokeup(C_Info)
{
	npc = GUR_1202_CorAngar;
	nr = 1;
	condition = dia_corangar_wokeup_condition;
	information = dia_corangar_wokeup_info;
	permanent = 0;
	important = 1;
};


func int dia_corangar_wokeup_condition()
{
	if(Npc_KnowsInfo(hero,gur_1200_yberion_lastwords))
	{
		return TRUE;
	};
};

func void dia_corangar_wokeup_info()
{
	var C_Npc YBerion;
	Npc_ExchangeRoutine(YBerion,"CALLSLEEPER");
	AI_ContinueRoutine(YBerion);
	YBerion = Hlp_GetNpc(GUR_1200_YBerion);
	Npc_ExchangeRoutine(YBerion,"DRAINED");
	AI_ContinueRoutine(YBerion);
	AI_Wait(self,1);
	AI_GotoNpc(self,YBerion);
	AI_TurnToNPC(self,YBerion);
	AI_PlayAni(self,"T_PLUNDER");
	AI_WaitTillEnd(self,YBerion);
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_00");	//Y'BERION NIE �YJE. Nasz duchowy przyw�dca odszed� w za�wiaty!
	AI_TurnToNPC(self,other);
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_01");	//Nawet twoja b�yskawiczna pomoc nie mog�a zapobiec jego �mierci.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_02");	//I co teraz b�dzie?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_03");	//Zawsze ufa�em Y'Berionowi. Tu� przed �mierci� kaza� nam upatrywa� nadziei ocalenia w planie ucieczki opracowanym przez Mag�w Wody.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_04");	//Dlatego powinni�my wesprze� Mag�w Wody w ich d��eniach.
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_05");	//Przyda si� im kamie� ogniskuj�cy i almanach. Ale te s� wci�� w r�kach Cor Kaloma.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_06");	//A gdzie jest Cor Kalom?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_07");	//W gniewie zebra� oddzia� Stra�nik�w �wi�tynnych i wyruszy� na poszukiwanie �ni�cego.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_08");	//Niech to szlag! I jak teraz odzyskamy kamie� ogniskuj�cy?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_09");	//Zdaj� si�, �e kamie� i ksi�ga s� wci�� w jego laboratorium. Masz tu klucz do skrzyni.
	CreateInvItem(self,itke_psi_kalom_01);
	B_GiveInvItems(self,other,itke_psi_kalom_01,1);
	AI_StopProcessInfos(self);
};

