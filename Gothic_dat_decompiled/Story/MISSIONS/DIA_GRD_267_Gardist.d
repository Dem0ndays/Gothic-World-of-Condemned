
instance DIA_GRD_267_EXIT(C_Info)
{
	npc = GRD_267_Gardist;
	nr = 999;
	condition = dia_grd_267_exit_condition;
	information = dia_grd_267_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_grd_267_exit_condition()
{
	return 1;
};

func void dia_grd_267_exit_info()
{
	AI_StopProcessInfos(self);
};


instance grd_267_gardist_sittingork(C_Info)
{
	npc = GRD_267_Gardist;
	condition = grd_267_gardist_sittingork_condition;
	information = grd_267_gardist_sittingork_info;
	important = 1;
	permanent = 0;
};


func int grd_267_gardist_sittingork_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_None) && (Kapitel == 1))
	{
		return TRUE;
	};
};

func void grd_267_gardist_sittingork_info()
{
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_15_01");	//Ach, patrzcie no. Mamy goœcia.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_02");	//Nowa twarz. Od razu to po tobie zauwa¿y³em.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_03");	//Có¿, panuje tutaj taki zwyczaj, ¿e my, Stra¿nicy, objaœniamy w³aœnie takim Kopaczom sk¹d wieje wiatr.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_04");	//I oczywiœcie dbamy o to, ¿eby Kopacze tacy jak ty i twoi koledzy wydobywali tutaj rudê dla Gomeza.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_05");	//To sprawia, ¿e wszyscy tutaj dziêki temu maj¹ przyzwoite ¿ycie.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_06");	//Wy, Kopacze, op³acacie pewien rodzaj podatku - podatek od rudy.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_07");	//My dbamy o to, ¿eby wasza ruda trafi³a w dobre rêce, a wy w zamian za to macie tym samym spokojne ¿ycie w Starym Obozie.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_08");	//B¹dŸ co b¹dŸ, my, Stra¿nicy, dogl¹damy was na ka¿dym kroku, a to jest... doœæ kosztowne zajêcie, jak zapewne rozumiesz. Hehe.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_09");	//Myœlê, ¿e to najwa¿niejsze, co na tê chwilê musisz wiedzieæ.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_10");	//Masz tu swój kilof. To bêdzie twój sta³y towarzysz w przysz³oœci.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_11");	//Nie op³aci³eœ mi jeszcze swojego podatku od rudy, wiêc do roboty i postaraj siê o to, ¿ebyœ odpracowa³ swój d³ug.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_12");	//I nie martw siê, bêdziemy was pilnowaæ, tak ¿e bêdziesz móg³ pracowaæ sobie w spokoju.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_13");	//Mi³ej zabawy podczas swojego nowego zajêcia. Od teraz bêdê mia³ na ciebie oko, ch³opcze.
	CreateInvItems(self,ItMwPickaxe,1);
	B_GiveInvItems(self,other,ItMwPickaxe,1);
	ore_vlk = LOG_RUNNING;
	Log_CreateTopic(CH1_HEROVLK,LOG_MISSION);
	Log_SetTopicStatus(CH1_HEROVLK,LOG_RUNNING);
	B_LogEntry(CH1_HEROVLK,"Jeden ze Stra¿ników Starego Obozu zwróci³ mi uwagê, ¿e powinienem pracowaæ w kopalni tak jak ca³a reszta. Da³ mi kilof i pos³a³ mnie do miejsca wydobycia. Jeœli do jutra nie uda mi siê zebraæ 150 bry³ek, dostanê od niego porz¹dn¹ nauczkê.");
};


instance GRD_267_GARDIST_WORKINGORK(C_Info)
{
	npc = GRD_267_Gardist;
	condition = grd_267_gardist_workingork_condition;
	information = grd_267_gardist_workingork_info;
	important = 1;
	permanent = 0;
};


func int grd_267_gardist_workingork_condition()
{
	if(Npc_KnowsInfo(hero,grd_267_gardist_sittingork) && (ore_vlk == LOG_RUNNING) && (Npc_HasItems(other,ItMiNugget) >= 150))
	{
		return 1;
	};
};

func void grd_267_gardist_workingork_info()
{
	AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_15_01");	//No proszê, kto nas tu znowu odwiedzi³. Dobrze, ¿e jesteœ. Jestem w³aœnie w trakcie zbierania nale¿noœci od Kopaczy.
	AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_15_02");	//Poka¿ no, coœ tam zd¹¿y³ zebraæ.
	AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_06_03");	//Achh. Piêknie siê patrzy na tê rudê, nieprawda¿? Nie martw siê, dobrze siê ni¹ zaopiekujê.
	if(Npc_HasItems(other,ItMiNugget) <= 150)
	{
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_01_02");	//150 bry³ek? To piêknie, ¿e tak trzymasz siê naszej umowy i op³acasz swój nale¿ny podatek.
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_01_04");	//Masz tu jeszcze trochê rudy dla siebie. Z czegoœ w koñcu musisz ¿yæ, prawda?
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_01_05");	//Uwa¿aj na siebie, ch³opcze. Na pewno jeszcze siê kiedyœ spotkamy.
		B_GiveInvItems(other,self,ItMiNugget,150);
		B_GiveInvItems(self,other,ItMiNugget,10);
		ore_vlk = LOG_SUCCESS;
		Log_SetTopicStatus(CH1_HEROVLK,LOG_SUCCESS);
		B_LogEntry(CH1_HEROVLK,"Przekaza³em Stra¿nikowi jego 150 bry³ek rudy, z czego 10 bry³ek dosta³em jako swój udzia³.");
		B_GiveXP(XP_VLKHERO);
	}
	else if(Npc_HasItems(other,ItMiNugget) <= 200)
	{
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_02_02");	//200 bry³ek? Z pewnoœci¹ nie bêdziesz mia³ nic przeciwko, jeœli uwzglêdniê sobie tê sumkê jako ma³¹ zaliczkê.
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_02_03");	//To dla dobra sprawy. Hehe.
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_02_04");	//Masz tu jeszcze trochê rudy dla siebie. Z czegoœ w koñcu musisz ¿yæ, prawda?
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_02_05");	//Uwa¿aj na siebie, ch³opcze. Na pewno jeszcze siê kiedyœ spotkamy.
		B_GiveInvItems(other,self,ItMiNugget,200);
		B_GiveInvItems(self,other,ItMiNugget,15);
		ore_vlk = LOG_SUCCESS;
		Log_SetTopicStatus(CH1_HEROVLK,LOG_SUCCESS);
		B_LogEntry(CH1_HEROVLK,"Kiedy tylko Stra¿nik zauwa¿y³, ¿e mia³em przy sobie 200 bry³ek rudy, bez ogródek wszystko zagarn¹³ dla siebie i twierdzi³, ¿e to bêdzie dla niego tylko taka zaliczka. 15 bry³ek to wszystko co dosta³em za ca³¹ robotê.");
		B_GiveXP(XP_VLKHERO);
	}
	else if(Npc_HasItems(other,ItMiNugget) >= 250)
	{
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_04_02");	//No, zdaje siê, ¿e ca³kiem porz¹dnieœ pracowa³. Sporo tej rudy zebra³eœ.
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_04_03");	//Przechowam ca³¹ tê rudê dla ciebie. Bez obaw, jest w dobrych rêkach.
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_04_04");	//Potraktuj to jako swego rodzaju inwestycjê w przysz³oœæ. Dobrze siê twoj¹ rud¹ zaopiekujê, mo¿esz byæ tego pewien.
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_04_05");	//Uwa¿aj na siebie, ch³opcze. Na pewno jeszcze siê kiedyœ spotkamy.
		B_GiveInvItems(other,self,ItMiNugget,Npc_HasItems(other,ItMiNugget));
		ore_vlk = LOG_SUCCESS;
		Log_SetTopicStatus(CH1_HEROVLK,LOG_SUCCESS);
		B_LogEntry(CH1_HEROVLK,"Mia³em spor¹ iloœæ rudy przy sobie, kiedy spotka³em siê ze Stra¿nikiem. Przyw³aszczy³ sobie wszystko co mia³em i potraktowa³ to jako przysz³¹ inwestycjê. Nie dosta³em kompletnie nic za ca³¹ swoj¹ pracê.");
		B_GiveXP(XP_VLKHERO_TIRED);
	};
};

