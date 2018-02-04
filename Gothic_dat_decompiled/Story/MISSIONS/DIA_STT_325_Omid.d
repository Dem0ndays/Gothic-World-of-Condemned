
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
	description = "Kim jeste�?";
};


func int stt_325_omid_doing_condition()
{
	return 1;
};

func void stt_325_omid_doing_info()
{
	AI_Output(other,self,"DIA_Lester_Hallo_15_00");	//Kim jeste�?
	AI_Output(self,other,"Stt_325_Omid_DOING_02_73");	//Nazywam si� Omid. Jestem jednym z kucharzy Gomeza.
	AI_Output(self,other,"Stt_325_Omid_DOING_02_72");	//Wi�kszo�� kojarzy mnie tutaj g��wnie dzi�ki mojemu gulaszowi, kt�ry cieszy si� spor� popularno�ci�.
	AI_Output(self,other,"Stt_325_Omid_DOING_04_71");	//Pewnie jeste� tu od niedawna, co?
	AI_Output(other,self,"Stt_325_Omid_DOING_05_70");	//Nie inaczej, dopiero co tu trafi�em.
};


instance STT_325_OMID_NEEDHELP(C_Info)
{
	npc = STT_325_Omid;
	condition = stt_325_omid_needhelp_condition;
	information = stt_325_omid_needhelp_info;
	important = 0;
	permanent = 0;
	description = "Masz mo�e jeszcze troch� swojego gulaszu?";
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
	AI_Output(other,self,"Stt_325_Omid_NeedHelp_01_74");	//Masz mo�e jeszcze troch� swojego gulaszu?
	AI_Output(self,other,"Stt_325_Omid_NeedHelp_02_73");	//Nie, Gomez i reszta Magnat�w zd��y�a wczoraj ju� reszt� wtran�oli�.
	AI_Output(self,other,"Stt_325_Omid_NeedHelp_02_72");	//Je�li chcesz, bym przyrz�dzi� gulasz, musisz mi najpierw dostarczy� odpowiednie sk�adniki.
	AI_Output(other,self,"Stt_325_Omid_NeedHelp_05_69");	//A czego potrzebujesz?
	AI_Output(self,other,"Stt_325_Omid_NeedHelp_05_68");	//Szynki, dw�ch ser�w, pi�� kawa�k�w pieczonego mi�sa, dw�ch twardzieni i ogniocier�.
	omid_recept = LOG_RUNNING;
	Log_CreateTopic(CH1_OMIDRECEPT,LOG_MISSION);
	Log_SetTopicStatus(CH1_OMIDRECEPT,LOG_RUNNING);
	B_LogEntry(CH1_OMIDRECEPT,"Omid, jeden z kucharzy Gomeza ze Starego Obozu, poprosi� mnie, bym poszuka� dla niego kilku sk�adnik�w potrzebnych do sporz�dzenia jego gulaszu. Potrzebne mu s� jeszcze: szynka, dwa sery, pi�� kawa�k�w pieczonego mi�sa, dwa twardzienie i ogniocier�.");
};


instance STT_325_OMID_SUCCESS(C_Info)
{
	npc = STT_325_Omid;
	condition = stt_325_omid_success_condition;
	information = stt_325_omid_success_info;
	important = 0;
	permanent = 1;
	description = "Mam przy sobie rzeczy, o kt�re prosi�e�!";
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
	AI_Output(other,self,"DIA_Snaf_ZutatenSuccess_15_00");	//Mam przy sobie rzeczy, o kt�re prosi�e�!
	if((Npc_HasItems(other,ItFoMutton) >= 5) && (Npc_HasItems(other,ItFo_mutton_01) >= 1) && (Npc_HasItems(other,ItFoCheese) >= 2) && (Npc_HasItems(other,ItFo_Plants_Stoneroot_01) >= 2) && (Npc_HasItems(other,ItFo_Plants_Flameberry_01) >= 1))
	{
		AI_Output(self,other,"Stt_325_Omid_Success_02_73");	//Ach, wybornie.
		AI_Output(self,other,"Stt_325_Omid_Success_04_71");	//No, to teraz mam ju� wszystko, czego potrzebowa�em.
		AI_Output(self,other,"Stt_325_Omid_Success_05_70");	//Dobra robota. Daj mi jeszcze chwil�, musz� tylko zmiesza� te rzeczy z reszt�.
		AI_Output(self,other,"Stt_325_Omid_Success_05_69");	//No, prosz�. Oto tw�j gulasz. Smacznego!
		omid_recept = LOG_SUCCESS;
		Log_CreateTopic(CH1_OMIDRECEPT,LOG_MISSION);
		Log_SetTopicStatus(CH1_OMIDRECEPT,LOG_SUCCESS);
		B_LogEntry(CH1_OMIDRECEPT,"Dzi�ki mojej pomocy uda�o si� Omidowi ugotowa� dla mnie gulasz. Jako nagrod� dostan� nieco jego specja�u.");
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
		AI_Output(self,other,"Stt_325_Omid_Success_02_67");	//Ale przecie� to nie s� wszystkie sk�adniki. Wr��, kiedy b�dziesz ju� mia� ca�� reszt� przy sobie.
	};
};

