
instance STT_324_BALAM_EXIT(C_Info)
{
	npc = STT_324_Balam;
	condition = stt_324_balam_exit_condition;
	information = stt_324_balam_exit_info;
	important = 0;
	permanent = 1;
	nr = 999;
	description = DIALOG_ENDE;
};


func int stt_324_balam_exit_condition()
{
	return 1;
};

func void stt_324_balam_exit_info()
{
	AI_StopProcessInfos(self);
};


instance stt_324_balam_doing(C_Info)
{
	npc = STT_324_Balam;
	condition = stt_324_balam_doing_condition;
	information = stt_324_balam_doing_info;
	important = 0;
	permanent = 0;
	description = "Czym si� tutaj zajmujesz?";
};


func int stt_324_balam_doing_condition()
{
	return 1;
};

func void stt_324_balam_doing_info()
{
	AI_Output(other,self,"DIA_Orry_GuardGate_15_00");	//Czym si� tutaj zajmujesz?
	AI_Output(self,other,"Stt_324_Balam_DOING_02_73");	//Przygotowuj� razem z Omidem posi�ek dla Gomeza. Cholernie niebezpieczna praca.
	AI_Output(other,self,"Stt_324_Balam_DOING_03_72");	//Dlaczego?
	AI_Output(self,other,"Stt_324_Balam_DOING_04_71");	//Powiedzmy, �e je�li Gomezowi akurat nie zasmakuje �arcie, to z ca�� pewno�ci� b�dzie to ju� ostatni posi�ek, jaki kiedykolwiek przyrz�dzimy.
	AI_Output(other,self,"Stt_324_Balam_DOING_05_70");	//Rozumiem.
};


instance dia_balam_can(C_Info)
{
	npc = STT_324_Balam;
	nr = 3;
	condition = dia_balam_can_condition;
	information = dia_balam_can_info;
	permanent = 0;
	description = "Mo�esz mnie czego� nauczy�?";
};


func int dia_balam_can_condition()
{
	if(Npc_KnowsInfo(hero,stt_324_balam_doing))
	{
		return 1;
	};
};

func void dia_balam_can_info()
{
	AI_Output(other,self,"DIA_Balam_Can_12_01");	//Mo�esz mnie czego� nauczy�?
	AI_Output(self,other,"DIA_Balam_Can_12_02");	//Mog� ci� nauczy� przepisu na zup� robion� z korzeni.
	AI_Output(self,other,"DIA_Balam_Can_12_03");	//Za moich czas�w w kolonii do�� cz�sto bywa�em po drodze na r�nych pustkowiach, zbiera�em zio�a i wykorzystywa�em je do nowych przepis�w.
	AI_Output(self,other,"DIA_Balam_Can_12_04");	//Mog� ci� nauczy� receptury, je�li sobie tego �yczysz.
	Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
	B_LogEntry(GE_TeacherOC,"Kucharz ze Starego Obozu, niejaki Balam, mo�e mi pokaza� jak ugotowa� zup� korzenn�.");
};


instance DIA_BALAM_LEARN(C_Info)
{
	npc = STT_324_Balam;
	nr = 4;
	condition = dia_balam_learn_condition;
	information = dia_balam_learn_info;
	permanent = 1;
	description = "Zupa korzenna (Koszt: 1 PN)";
};


func int dia_balam_learn_condition()
{
	if(Npc_KnowsInfo(hero,dia_balam_can) && (knows_soup == FALSE))
	{
		return 1;
	};
};

func void dia_balam_learn_info()
{
	AI_Output(other,self,"DIA_Balam_Learn_15_00");	//Naucz mnie gotowa� zup� korzenn�.
	if(hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output(self,other,"DIA_Balam_Learn_12_01");	//Dobra, zacznijmy od tego, �e musisz pierw zagotowa� wod�.
		AI_Output(self,other,"DIA_Balam_Learn_12_02");	//Potem wrzucasz korzenie do garnka.
		AI_Output(self,other,"DIA_Balam_Learn_12_03");	//Nie zapominaj o ci�g�ym mieszaniu zupy.
		AI_Output(self,other,"DIA_Balam_Learn_12_04");	//Na koniec dorzucasz jeszcze orkowe ziele.
		AI_Output(self,other,"DIA_Balam_Learn_12_05");	//To taka poufna wskaz�wka ode mnie, dzi�ki niemu zupa b�dzie mia�a jeszcze intensywniejszy aromat.
		Log_CreateTopic(GE_COOK,LOG_NOTE);
		B_LogEntry(GE_COOK,"Od teraz mog� sobie sam ugotowa� zup� korzenn�.");
		B_LogEntry(GE_COOK,"Sk�adniki: 2x twardzie� i 1x orkowe ziele.");
		knows_soup = TRUE;
		PrintScreen("Nauka umiej�tno�ci: Zupa korzenna",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

