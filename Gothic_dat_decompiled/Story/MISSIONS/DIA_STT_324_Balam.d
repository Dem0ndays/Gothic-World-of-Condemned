
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
	description = "Czym siê tutaj zajmujesz?";
};


func int stt_324_balam_doing_condition()
{
	return 1;
};

func void stt_324_balam_doing_info()
{
	AI_Output(other,self,"DIA_Orry_GuardGate_15_00");	//Czym siê tutaj zajmujesz?
	AI_Output(self,other,"Stt_324_Balam_DOING_02_73");	//Przygotowujê razem z Omidem posi³ek dla Gomeza. Cholernie niebezpieczna praca.
	AI_Output(other,self,"Stt_324_Balam_DOING_03_72");	//Dlaczego?
	AI_Output(self,other,"Stt_324_Balam_DOING_04_71");	//Powiedzmy, ¿e jeœli Gomezowi akurat nie zasmakuje ¿arcie, to z ca³¹ pewnoœci¹ bêdzie to ju¿ ostatni posi³ek, jaki kiedykolwiek przyrz¹dzimy.
	AI_Output(other,self,"Stt_324_Balam_DOING_05_70");	//Rozumiem.
};


instance dia_balam_can(C_Info)
{
	npc = STT_324_Balam;
	nr = 3;
	condition = dia_balam_can_condition;
	information = dia_balam_can_info;
	permanent = 0;
	description = "Mo¿esz mnie czegoœ nauczyæ?";
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
	AI_Output(other,self,"DIA_Balam_Can_12_01");	//Mo¿esz mnie czegoœ nauczyæ?
	AI_Output(self,other,"DIA_Balam_Can_12_02");	//Mogê ciê nauczyæ przepisu na zupê robion¹ z korzeni.
	AI_Output(self,other,"DIA_Balam_Can_12_03");	//Za moich czasów w kolonii doœæ czêsto bywa³em po drodze na ró¿nych pustkowiach, zbiera³em zio³a i wykorzystywa³em je do nowych przepisów.
	AI_Output(self,other,"DIA_Balam_Can_12_04");	//Mogê ciê nauczyæ receptury, jeœli sobie tego ¿yczysz.
	Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
	B_LogEntry(GE_TeacherOC,"Kucharz ze Starego Obozu, niejaki Balam, mo¿e mi pokazaæ jak ugotowaæ zupê korzenn¹.");
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
	AI_Output(other,self,"DIA_Balam_Learn_15_00");	//Naucz mnie gotowaæ zupê korzenn¹.
	if(hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output(self,other,"DIA_Balam_Learn_12_01");	//Dobra, zacznijmy od tego, ¿e musisz pierw zagotowaæ wodê.
		AI_Output(self,other,"DIA_Balam_Learn_12_02");	//Potem wrzucasz korzenie do garnka.
		AI_Output(self,other,"DIA_Balam_Learn_12_03");	//Nie zapominaj o ci¹g³ym mieszaniu zupy.
		AI_Output(self,other,"DIA_Balam_Learn_12_04");	//Na koniec dorzucasz jeszcze orkowe ziele.
		AI_Output(self,other,"DIA_Balam_Learn_12_05");	//To taka poufna wskazówka ode mnie, dziêki niemu zupa bêdzie mia³a jeszcze intensywniejszy aromat.
		Log_CreateTopic(GE_COOK,LOG_NOTE);
		B_LogEntry(GE_COOK,"Od teraz mogê sobie sam ugotowaæ zupê korzenn¹.");
		B_LogEntry(GE_COOK,"Sk³adniki: 2x twardzieñ i 1x orkowe ziele.");
		knows_soup = TRUE;
		PrintScreen("Nauka umiejêtnoœci: Zupa korzenna",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Za ma³o punktów umiejêtnoœci!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

