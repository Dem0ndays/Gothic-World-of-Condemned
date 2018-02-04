
instance STT_325_OMID_EXIT(C_Info)
{
	npc = STT_325_Omid;
	condition = stt_325_omid_exit_condition;
	information = stt_325_omid_exit_info;
	important = 0;
	permanent = 1;
	nr = 999;
	description = DIALOG_ENDE;
};


func int stt_325_omid_exit_condition()
{
	return 1;
};

func void stt_325_omid_exit_info()
{
	AI_StopProcessInfos(self);
};


instance stt_325_omid_doing(C_Info)
{
	npc = STT_325_Omid;
	condition = stt_325_omid_doing_condition;
	information = stt_325_omid_doing_info;
	important = 0;
	permanent = 0;
	description = "Kim jesteœ?";
};


func int stt_325_omid_doing_condition()
{
	return 1;
};

func void stt_325_omid_doing_info()
{
	AI_Output(other,self,"DIA_Lester_Hallo_15_00");	//Kim jesteœ?
	AI_Output(self,other,"Stt_325_Omid_DOING_02_73");	//Nazywam siê Omid. Jestem jednym z kucharzy Gomeza.
	AI_Output(self,other,"Stt_325_Omid_DOING_02_72");	//Wiêkszoœæ kojarzy mnie tutaj g³ównie dziêki mojemu gulaszowi, który cieszy siê spor¹ popularnoœci¹.
	AI_Output(self,other,"Stt_325_Omid_DOING_04_71");	//Pewnie jesteœ tu od niedawna, co?
	AI_Output(other,self,"Stt_325_Omid_DOING_05_70");	//Nie inaczej, dopiero co tu trafi³em.
};


instance STT_325_OMID_NEEDHELP(C_Info)
{
	npc = STT_325_Omid;
	condition = stt_325_omid_needhelp_condition;
	information = stt_325_omid_needhelp_info;
	important = 0;
	permanent = 0;
	description = "Masz mo¿e jeszcze trochê swojego gulaszu?";
};


func int stt_325_omid_needhelp_condition()
{
	if(Npc_KnowsInfo(hero,stt_325_omid_doing))
	{
		return 1;
	};
};

func void stt_325_omid_needhelp_info()
{
	AI_Output(other,self,"Stt_325_Omid_NeedHelp_01_74");	//Masz mo¿e jeszcze trochê swojego gulaszu?
	AI_Output(self,other,"Stt_325_Omid_NeedHelp_02_73");	//Nie, Gomez i reszta Magnatów zd¹¿y³a wczoraj ju¿ resztê wtran¿oliæ.
	AI_Output(self,other,"Stt_325_Omid_NeedHelp_02_72");	//Jeœli chcesz, bym przyrz¹dzi³ gulasz, musisz mi najpierw dostarczyæ odpowiednie sk³adniki.
	AI_Output(other,self,"Stt_325_Omid_NeedHelp_05_69");	//A czego potrzebujesz?
	AI_Output(self,other,"Stt_325_Omid_NeedHelp_05_68");	//Szynki, dwóch serów, piêæ kawa³ków pieczonego miêsa, dwóch twardzieni i ogniocierñ.
	omid_recept = LOG_RUNNING;
	Log_CreateTopic(CH1_OMIDRECEPT,LOG_MISSION);
	Log_SetTopicStatus(CH1_OMIDRECEPT,LOG_RUNNING);
	B_LogEntry(CH1_OMIDRECEPT,"Omid, jeden z kucharzy Gomeza ze Starego Obozu, poprosi³ mnie, bym poszuka³ dla niego kilku sk³adników potrzebnych do sporz¹dzenia jego gulaszu. Potrzebne mu s¹ jeszcze: szynka, dwa sery, piêæ kawa³ków pieczonego miêsa, dwa twardzienie i ogniocierñ.");
};


instance STT_325_OMID_SUCCESS(C_Info)
{
	npc = STT_325_Omid;
	condition = stt_325_omid_success_condition;
	information = stt_325_omid_success_info;
	important = 0;
	permanent = 1;
	description = "Mam przy sobie rzeczy, o które prosi³eœ!";
};


func int stt_325_omid_success_condition()
{
	if(omid_recept == LOG_RUNNING)
	{
		return 1;
	};
};

func void stt_325_omid_success_info()
{
	AI_Output(other,self,"DIA_Snaf_ZutatenSuccess_15_00");	//Mam przy sobie rzeczy, o które prosi³eœ!
	if((Npc_HasItems(other,ItFoMutton) >= 5) && (Npc_HasItems(other,ItFo_mutton_01) >= 1) && (Npc_HasItems(other,ItFoCheese) >= 2) && (Npc_HasItems(other,ItFo_Plants_Stoneroot_01) >= 2) && (Npc_HasItems(other,ItFo_Plants_Flameberry_01) >= 1))
	{
		AI_Output(self,other,"Stt_325_Omid_Success_02_73");	//Ach, wybornie.
		AI_Output(self,other,"Stt_325_Omid_Success_04_71");	//No, to teraz mam ju¿ wszystko, czego potrzebowa³em.
		AI_Output(self,other,"Stt_325_Omid_Success_05_70");	//Dobra robota. Daj mi jeszcze chwilê, muszê tylko zmieszaæ te rzeczy z reszt¹.
		AI_Output(self,other,"Stt_325_Omid_Success_05_69");	//No, proszê. Oto twój gulasz. Smacznego!
		omid_recept = LOG_SUCCESS;
		Log_CreateTopic(CH1_OMIDRECEPT,LOG_MISSION);
		Log_SetTopicStatus(CH1_OMIDRECEPT,LOG_SUCCESS);
		B_LogEntry(CH1_OMIDRECEPT,"Dziêki mojej pomocy uda³o siê Omidowi ugotowaæ dla mnie gulasz. Jako nagrodê dostanê nieco jego specja³u.");
		B_GiveXP(XP_OMIDRECEPT);
		CreateInvItems(self,itfofleischeintopf,1);
		B_GiveInvItems(self,other,itfofleischeintopf,1);
		Npc_RemoveInvItems(other,ItFoMutton,5);
		Npc_RemoveInvItems(other,ItFo_mutton_01,1);
		Npc_RemoveInvItems(other,ItFoCheese,2);
		Npc_RemoveInvItems(other,ItFo_Plants_Stoneroot_01,2);
		Npc_RemoveInvItems(other,ItFo_Plants_Flameberry_01,1);
	}
	else
	{
		AI_Output(self,other,"Stt_325_Omid_Success_02_67");	//Ale przecie¿ to nie s¹ wszystkie sk³adniki. Wróæ, kiedy bêdziesz ju¿ mia³ ca³¹ resztê przy sobie.
	};
};

