
instance DIA_SCAR_EXIT(C_Info)
{
	npc = EBR_101_Scar;
	nr = 999;
	condition = DIA_SCAR_EXIT_Condition;
	information = DIA_SCAR_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_SCAR_EXIT_Condition()
{
	return 1;
};

func void DIA_SCAR_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SCAR_Hello(C_Info)
{
	npc = EBR_101_Scar;
	nr = 3;
	condition = DIA_SCAR_Hello_Condition;
	information = DIA_SCAR_Hello_Info;
	permanent = 0;
	description = "Kim jesteœ?";
};


func int DIA_SCAR_Hello_Condition()
{
	return 1;
};

func void DIA_SCAR_Hello_Info()
{
	AI_Output(other,self,"DIA_SCAR_Hello_15_00");	//Kim jesteœ?
	AI_Output(self,other,"DIA_SCAR_Hello_08_01");	//Mówi¹ na mnie Blizna.
};


instance DIA_SCAR_What(C_Info)
{
	npc = EBR_101_Scar;
	nr = 3;
	condition = DIA_SCAR_What_Condition;
	information = DIA_SCAR_What_Info;
	permanent = 0;
	description = "Czym siê zajmujesz?";
};


func int DIA_SCAR_What_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_SCAR_Hello))
	{
		return 1;
	};
};

func void DIA_SCAR_What_Info()
{
	AI_Output(other,self,"DIA_SCAR_What_15_00");	//Czym siê zajmujesz?
	AI_Output(self,other,"DIA_SCAR_What_08_01");	//Ja i Arto zapewniamy Gomezowi spokój przed nieproszonymi goœæmi.
	AI_Output(self,other,"DIA_SCAR_What_08_02");	//Oprócz tego, do moich obowi¹zków nale¿y poskramianie co zadziorniejszych kobiet.
};


instance DIA_SCAR_Frau(C_Info)
{
	npc = EBR_101_Scar;
	nr = 3;
	condition = DIA_SCAR_Frau_Condition;
	information = DIA_SCAR_Frau_Info;
	permanent = 0;
	description = "Kiedy mnie tu zrzucano, widzia³em kobietê opuszczan¹ na dó³.";
};


func int DIA_SCAR_Frau_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_SCAR_What))
	{
		return 1;
	};
};

func void DIA_SCAR_Frau_Info()
{
	AI_Output(other,self,"DIA_SCAR_Frau_15_00");	//Kiedy mnie tu zrzucano, widzia³em kobietê opuszczan¹ na dó³ wraz z ³adunkiem.
	AI_Output(self,other,"DIA_SCAR_Frau_08_01");	//I co z tego?
	AI_Output(other,self,"DIA_SCAR_Frau_15_02");	//Jest tutaj?
	AI_Output(self,other,"DIA_SCAR_Frau_08_03");	//S³uchaj, jeœli wi¹¿esz z ni¹ jakieœ nadzieje, dam ci dobr¹ radê: Zapomnij o niej.
	AI_Output(self,other,"DIA_SCAR_Frau_08_04");	//Dopiero co j¹ dostarczono i Gomez kaza³ j¹ zamkn¹æ w swojej komnacie.
	AI_Output(self,other,"DIA_SCAR_Frau_08_05");	//Jak ju¿ mu siê znudzi, mo¿e przyœle j¹ tu, na dó³. Ale póki co, ona nale¿y DO NIEGO, wiêc lepiej nie zawracaj sobie ni¹ g³owy.
};


instance DIA_SCAR_PERM(C_Info)
{
	npc = EBR_101_Scar;
	nr = 3;
	condition = DIA_SCAR_PERM_Condition;
	information = DIA_SCAR_PERM_Info;
	permanent = 1;
	description = "Co mo¿esz mi powiedzieæ o Gomezie?";
};


func int DIA_SCAR_PERM_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_SCAR_Frau))
	{
		return 1;
	};
};

func void DIA_SCAR_PERM_Info()
{
	AI_Output(other,self,"DIA_SCAR_PERM_15_00");	//Co mo¿esz mi powiedzieæ o Gomezie?
	AI_Output(self,other,"DIA_SCAR_PERM_08_01");	//To najpotê¿niejszy cz³owiek w ca³ej kolonii. To ci powinno wystarczyæ.
	AI_Output(self,other,"DIA_SCAR_PERM_08_02");	//Dostaje wszystko, czego zapragnie, choæ tak naprawdê zale¿y mu tylko na w³adzy.
};


instance DIA_SCAR_RING(C_Info)
{
	npc = EBR_101_Scar;
	nr = 3;
	condition = dia_scar_ring_condition;
	information = dia_scar_ring_info;
	permanent = 0;
	important = 1;
};


func int dia_scar_ring_condition()
{
	if(Npc_HasItems(other,scarsring) >= 1)
	{
		return 1;
	};
};

func void dia_scar_ring_info()
{
	AI_Output(self,other,"DIA_SCAR_Ring_15_00");	//Ej, ty!
	AI_Output(self,other,"DIA_SCAR_Ring_08_01");	//Sk¹d masz ten pierœcieñ?
	AI_Output(other,self,"DIA_SCAR_Ring_08_02");	//Ja, ehm...
	AI_Output(self,other,"DIA_SCAR_Ring_08_03");	//Ukrad³eœ mi go, prawda?
	AI_Output(self,other,"DIA_SCAR_Ring_08_04");	//Czekaj no, draniu, ju¿ jesteœ trupem!
	AI_StopProcessInfos(self);
	Npc_SetPermAttitude(self,ATT_HOSTILE);
	Npc_SetTarget(self,other);
};


instance DIA_SCAR_SCBARON(C_Info)
{
	npc = EBR_101_Scar;
	nr = 3;
	condition = dia_scar_scbaron_condition;
	information = dia_scar_scbaron_info;
	permanent = 0;
	important = 1;
};


func int dia_scar_scbaron_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_EBR)
	{
		return 1;
	};
};

func void dia_scar_scbaron_info()
{
	AI_Output(self,other,"DIA_SCAR_SCBARON_15_00");	//Podj¹³eœ s³uszn¹ decyzjê. Hehe.
	AI_Output(self,other,"DIA_SCAR_SCBARON_08_01");	//Wierz mi, spodoba ci siê ¿ycie Magnata.
	AI_Output(self,other,"DIA_SCAR_SCBARON_08_02");	//Jesteœmy w³adcami tej kolonii i odt¹d ten przywilej przys³uguje równie¿ i tobie.
	AI_StopProcessInfos(self);
};


instance DIA_SCAR_RAEUBER(C_Info)
{
	npc = EBR_101_Scar;
	nr = 3;
	condition = dia_scar_raeuber_condition;
	information = dia_scar_raeuber_info;
	permanent = 0;
	important = 1;
};


func int dia_scar_raeuber_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return 1;
	};
};

func void dia_scar_raeuber_info()
{
	AI_Output(self,other,"DIA_SCAR_RAEUBER_15_01");	//Dobrze, ¿e ciê widzê. Mia³bym robotê do wykonania dla kogoœ takiego jak ty.
	AI_Output(self,other,"DIA_SCAR_RAEUBER_08_02");	//Jakiœ czas temu paru Kopaczy zwinê³o siê z obozu, podwêdzaj¹c przy tym ca³y ³adunek rudy.
	AI_Output(self,other,"DIA_SCAR_RAEUBER_08_03");	//Gomezowi siê to wyj¹tkowo nie spodoba³o. Jest w plecy z rud¹, w wyniku czego jego wizerunek znacznie ucierpia³.
	AI_Output(self,other,"DIA_SCAR_RAEUBER_08_04");	//WyobraŸ sobie co by by³o, gdyby nagle pozostali Kopacze zaczêli tak samo myœleæ i migiem zmyliby siê z obozu. Nie mo¿emy do tego dopuœciæ.
	AI_Output(self,other,"DIA_SCAR_RAEUBER_08_05");	//Dlatego nadszed³ czas, ¿eby ktoœ udzieli³ lekcji tym zbuntowanym Kopaczom.
	AI_Output(self,other,"DIA_SCAR_RAEUBER_08_06");	//I to w³aœnie zrobisz TY.
	AI_Output(self,other,"DIA_SCAR_RAEUBER_08_07");	//Sporo krêcisz siê po kolonii, dlatego wczeœniej czy póŸniej siê na nich natkniesz. A wtedy dasz im lekcjê, której nie zapomn¹.
	AI_Output(self,other,"DIA_SCAR_RAEUBER_08_08");	//Ja niestety nie jestem w stanie ci powiedzieæ, gdzie dok³adnie siê ukrywaj¹, prawdopodobnie rozleŸli siê po ca³ej kolonii i robi¹ teraz za pospolitych rabusiów.
	AI_Output(self,other,"DIA_SCAR_RAEUBER_08_09");	//Zabij ich, kiedy ich znajdziesz. A skradzion¹ rudê sobie zatrzymaj, jeœli j¹ przy nich zastaniesz. Gomezowi chodzi wy³¹cznie o Kopaczy.
	AI_Output(self,other,"DIA_SCAR_RAEUBER_08_10");	//Za³atw jakiœ dowód ich œmierci i wracaj czym prêdzej do mnie. No, lepiej siê z tym szybko uwiñ. Gomez jest niecierpliwym cz³owiekiem.
	scar_quest = LOG_RUNNING;
	Log_CreateTopic(CH2_SCARQUEST,LOG_MISSION);
	Log_SetTopicStatus(CH2_SCARQUEST,LOG_RUNNING);
	B_LogEntry(CH2_SCARQUEST,"Blizna, jeden z Magnatów ze Starego Obozu, da³ mi za zadanie odnalezienie grupki Kopaczy, którzy zwiali ze Starego Obozu i okroili Gomeza. Niestety nie ma on pojêcia, gdzie teraz ci Kopacze przebywaj¹. No có¿, chyba wypada³oby samemu siê tego dowiedzieæ.");
	AI_StopProcessInfos(self);
};


instance DIA_SCAR_FIN(C_Info)
{
	npc = EBR_101_Scar;
	nr = 1;
	condition = dia_scar_fin_condition;
	information = dia_scar_fin_info;
	permanent = 0;
	important = 0;
	description = "Ju¿ po rozbójnikach.";
};


func int dia_scar_fin_condition()
{
	if((scar_quest == LOG_RUNNING) && (Npc_HasItems(other,ore_bandits_message) >= 1) && (Npc_HasItems(other,ore_bandits_message2) >= 1) && (Npc_HasItems(other,ore_bandits_message3) >= 1) && (Npc_HasItems(other,ore_bandits_message4) >= 1))
	{
		return 1;
	};
};

func void dia_scar_fin_info()
{
	AI_Output(other,self,"DIA_SCAR_FIN_15_01");	//Ju¿ po rozbójnikach.
	AI_Output(self,other,"DIA_SCAR_FIN_08_02");	//To mi³o, hehe. Wiedzia³em, ¿e jesteœ odpowiednim cz³owiekiem do tego zadania. Masz na to jakieœ dowody?
	AI_Output(other,self,"DIA_SCAR_FIN_08_03");	//Znalaz³em przy nich te wpisy do pamiêtnika. Czêsto wspominana jest w nich ucieczka ze Starego Obozu i to, co planowali zrobiæ z rud¹.
	AI_Output(self,other,"DIA_SCAR_FIN_08_04");	//Pozwól no spojrzeæ.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_SCAR_FIN_08_05");	//Wykona³eœ kawa³ solidnej roboty. Gomez bêdzie w siódmym niebie.
	AI_Output(self,other,"DIA_SCAR_FIN_08_06");	//Polecê Stone'owi, ¿eby sprzeda³ ci ciê¿k¹ zbrojê Stra¿nika. Uwa¿am, ¿e zas³ugujesz, by nale¿eæ od teraz do naszej elity.
	AI_Output(self,other,"DIA_SCAR_FIN_08_07");	//IdŸ ju¿. Nie mam na razie nic wiêcej dla ciebie do roboty.
	scar_quest = LOG_SUCCESS;
	Log_SetTopicStatus(CH2_SCARQUEST,LOG_SUCCESS);
	B_LogEntry(CH2_SCARQUEST,"Blizna by³ zadowolony, kiedy jako dowód mojej zas³ugi przynios³em mu wpisy do pamiêtnika tych rozbójników i powiedzia³, ¿e to jest dok³adnie to, o czym Gomez chcia³by us³yszeæ. Namacalnej nagrody nie dosta³em, jednak obieca³ mi, ¿e pogada ze Stonem w sprawie ciê¿kiej zbroi Stra¿nika. Mo¿e powinienem do niego zajrzeæ.");
	B_GiveXP(XP_SCARRAEUBER);
	AI_StopProcessInfos(self);
};

