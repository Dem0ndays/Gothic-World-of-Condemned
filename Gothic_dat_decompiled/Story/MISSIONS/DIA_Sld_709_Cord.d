
instance DIA_SLD_709_Cord_Exit(C_Info)
{
	npc = Sld_709_Cord;
	nr = 999;
	condition = DIA_SLD_709_Cord_Exit_Condition;
	information = DIA_SLD_709_Cord_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_SLD_709_Cord_Exit_Condition()
{
	return 1;
};

func void DIA_SLD_709_Cord_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance SLD_709_Cord_TRAINOFFER(C_Info)
{
	npc = Sld_709_Cord;
	condition = SLD_709_Cord_TRAINOFFER_Condition;
	information = SLD_709_Cord_TRAINOFFER_Info;
	important = 0;
	permanent = 0;
	description = "Chcia�bym nauczy� si� walki jednor�cznym or�em.";
};


func int SLD_709_Cord_TRAINOFFER_Condition()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_1H) < 2)
	{
		return TRUE;
	};
};

func void SLD_709_Cord_TRAINOFFER_Info()
{
	AI_Output(other,self,"SLD_709_Cord_TRAINOFFER_Info_15_01");	//Chcia�bym nauczy� si� walki jednor�cznym or�em.
	AI_Output(self,other,"SLD_709_Cord_TRAINOFFER_Info_14_02");	//Nie ma sprawy. Ale to ci� b�dzie kosztowa�o 30 bry�ek rudy. Mo�e by�?
	AI_Output(self,other,"SLD_709_Cord_TRAINOFFER_Info_14_03");	//A je�li jeste� ju� do�� do�wiadczony, b�dzie to wymaga�o od ciebie nieco wi�kszych nak�ad�w. Mowa tu o 50 bry�kach.
	Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
	B_LogEntry(GE_TeacherNC,"Najemnik Cord mo�e mnie nauczy� walki jednor�cznym or�em. Za dnia mo�na go znale�� na kamienistej r�wninie, przy jeziorze.");
};


instance SLD_709_Cord_TRAIN(C_Info)
{
	npc = Sld_709_Cord;
	condition = SLD_709_Cord_TRAIN_Condition;
	information = SLD_709_Cord_TRAIN_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_Learn1h_1,LPCOST_TALENT_1H_1,30);
};


func int SLD_709_Cord_TRAIN_Condition()
{
	if(Npc_KnowsInfo(hero,SLD_709_Cord_TRAINOFFER) && (Npc_GetTalentSkill(hero,NPC_TALENT_1H) < 1))
	{
		return TRUE;
	};
};

func void SLD_709_Cord_TRAIN_Info()
{
	AI_Output(other,self,"SLD_709_Cord_TRAIN_Info_15_00");	//Chcia�bym nauczy� si� walki jednor�cznym or�em.
	if(Npc_HasItems(hero,ItMiNugget) >= 30)
	{
		if(B_GiveSkill(hero,NPC_TALENT_1H,1,LPCOST_TALENT_1H_1))
		{
			AI_Output(self,other,"SLD_709_Cord_TRAIN_14_01");	//M�dra decyzja. Jednak zanim poznasz bardziej zaawansowane techniki, powiniene� nauczy� si� prawid�owo trzyma� or� w r�ku.
			AI_Output(self,other,"SLD_709_Cord_TRAIN_14_02");	//Pocz�tkuj�cy cz�sto �api� zwyk�y miecz obydwoma r�kami. Radzi�bym ci si� do tego nie przyzwyczaja�, to fatalny nawyk.
			AI_Output(self,other,"SLD_709_Cord_TRAIN_14_03");	//Trzymaj bro� jedn� r�k�, ostrzem do g�ry, i zacznij ni� macha�.
			AI_Output(self,other,"SLD_709_Cord_TRAIN_14_04");	//Musisz si� nauczy�, jak zgra� twoje ruchy z bezw�adno�ci� or�a. Dzi�ki temu twoje ataki b�d� szybsze i bardziej zaskakuj�ce.
			AI_Output(self,other,"SLD_709_Cord_TRAIN_14_05");	//Zapami�taj sobie dobrze, co ci powiedzia�em, a tw�j styl walki stanie si� o wiele bardziej elegancki i skuteczny.
			AI_Output(self,other,"SLD_709_Cord_TRAIN_14_06");	//A, i jeszcze co�! Niekt�re ciosy powoduj� wi�ksze obra�enia ni� zwykle. Oczywi�cie, jako pocz�tkuj�cy masz raczej niewielkie szanse na zadanie krytycznego uderzenia.
			AI_Output(self,other,"SLD_709_Cord_TRAIN_14_07");	//Ale to si� zmieni w miar� czynienia przez ciebie post�p�w.
			B_GiveInvItems(hero,self,ItMiNugget,30);
			SLD_709_Cord_TRAIN.permanent = 0;
		};
	}
	else
	{
		AI_Output(self,other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03");	//Nie masz wystarczaj�cej ilo�ci rudy!
	};
};


instance SLD_709_CORD_TRAINAGAIN(C_Info)
{
	npc = Sld_709_Cord;
	condition = sld_709_cord_trainagain_condition;
	information = sld_709_cord_trainagain_info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_Learn1h_2,LPCOST_TALENT_1H_2,50);
};


func int sld_709_cord_trainagain_condition()
{
	if(Npc_KnowsInfo(hero,SLD_709_Cord_TRAINOFFER) && (Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 1))
	{
		return TRUE;
	};
};

func void sld_709_cord_trainagain_info()
{
	AI_Output(other,self,"SLD_709_Cord_TRAINAGAIN_Info_15_01");	//Naucz mnie, jak sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if(Npc_HasItems(hero,ItMiNugget) >= 50)
	{
		if(B_GiveSkill(hero,NPC_TALENT_1H,2,LPCOST_TALENT_1H_2))
		{
			AI_Output(self,other,"SLD_709_Cord_TRAINAGAIN_Info_14_02");	//Dobrze, podstawy ju� znasz. Nieznaczne opuszczenie broni zwi�kszy si�� twojego pierwszego ciosu.
			AI_Output(self,other,"SLD_709_Cord_TRAINAGAIN_Info_14_03");	//Musisz wykorzysta� si�� bezw�adno�ci, pami�tasz? �wietnie. Teraz nauczysz si� lepiej balansowa� cia�em. Po zadaniu dw�ch cios�w wykonaj obr�t. To powinno zmyli� twojego przeciwnika i pozwoli� ci wyj�� na dobr� pozycj� do nast�pnego ataku.
			AI_Output(self,other,"SLD_709_Cord_TRAINAGAIN_Info_14_04");	//Wtedy wyprowad� nast�pne ci�cie z prawej strony...
			AI_Output(self,other,"SLD_709_Cord_TRAINAGAIN_Info_14_05");	//I znowu do przodu. Pami�taj - trening czyni mistrza, wi�c najlepiej we� si� od razu do roboty!
			B_GiveInvItems(hero,self,ItMiNugget,50);
			sld_709_cord_trainagain.permanent = 0;
		};
	}
	else
	{
		AI_Output(self,other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03");	//Nie masz wystarczaj�cej ilo�ci rudy!
	};
};

