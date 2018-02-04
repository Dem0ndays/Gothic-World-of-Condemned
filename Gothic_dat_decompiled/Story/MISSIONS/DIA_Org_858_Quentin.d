
instance DIA_QUENTIN_EXIT(C_Info)
{
	npc = Org_858_Quentin;
	nr = 999;
	condition = dia_quentin_exit_condition;
	information = dia_quentin_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_quentin_exit_condition()
{
	return 1;
};

func void dia_quentin_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_QUENTIN_FIRST(C_Info)
{
	npc = Org_858_Quentin;
	nr = 1;
	condition = dia_quentin_first_condition;
	information = dia_quentin_first_info;
	permanent = 0;
	important = 1;
};


func int dia_quentin_first_condition()
{
	if(Npc_KnowsInfo(hero,grd_5018_ramon_letsgo))
	{
		return 1;
	};
};

func void dia_quentin_first_info()
{
	AI_Output(self,other,"DIA_Quentin_First_06_00");	//No proszê, kogo my tu mamy? Kilku popleczników Gomeza, chc¹cych dostaæ siê do Starej Kopalni?
	AI_Output(self,other,"DIA_Quentin_First_06_01");	//Trzeba by³o skorzystaæ z drogi okrê¿nej, a tak to teraz niestety zmuszeni jesteœcie zap³aciæ za ten b³¹d w³asnym ¿yciem.
	AI_Output(self,other,"DIA_Quentin_First_06_02");	//CH£OPCY! DO ATAKU!
	B_ChangeGuild(Org_865_Raeuber,GIL_ZOMBIE);
	B_ChangeGuild(Org_874_Raeuber,GIL_ZOMBIE);
	B_ChangeGuild(self,GIL_ZOMBIE);
	AI_StopProcessInfos(self);
	B_LogEntry(CH2_KONVOIOC,"Tu¿ przed naszym punktem docelowym, zostaliœmy z Ramonem napadniêci przez kilku rzezimieszków z Nowego Obozu. Przywódca tej¿e bandy nazywa³ siê Quentin.");
};


instance dia_quentin_second(C_Info)
{
	npc = Org_858_Quentin;
	nr = 1;
	condition = dia_quentin_second_condition;
	information = dia_quentin_second_info;
	permanent = 0;
	important = 1;
};


func int dia_quentin_second_condition()
{
	if(Npc_KnowsInfo(hero,dia_gorn_ueberfall))
	{
		return 1;
	};
};

func void dia_quentin_second_info()
{
	AI_Output(self,other,"DIA_Quentin_Angriff_06_01");	//Psst. Cicho!
	AI_Output(self,other,"DIA_Quentin_Angriff__06_02");	//Dobrze, ¿e jesteœcie. Tam z przodu siedz¹ w³aœnie ludzie Gomeza.
	AI_Output(self,other,"DIA_Quentin_First_06_03");	//Wygl¹da na to, ¿e zrobili sobie krótk¹ przerwê.
	AI_Output(self,other,"DIA_Quentin_First_06_04");	//Mo¿emy to wykorzystaæ.
	AI_Output(self,other,"DIA_Quentin_First_06_05");	//Jeœli jesteœ gotów, to jazda, do³¹czymy.
	AI_StopProcessInfos(self);
	B_ChangeGuild(grd_5018_ramon,GIL_ZOMBIE);
	B_ChangeGuild(grd_5014_convoitraeger,GIL_ZOMBIE);
	B_ChangeGuild(grd_5015_convoitraeger,GIL_ZOMBIE);
	B_ChangeGuild(grd_5016_convoiwache,GIL_ZOMBIE);
	B_ChangeGuild(grd_5017_convoiwache,GIL_ZOMBIE);
};


instance dia_quentin_third(C_Info)
{
	npc = Org_858_Quentin;
	nr = 1;
	condition = dia_quentin_third_condition;
	information = dia_quentin_third_info;
	permanent = 0;
	important = 1;
};


func int dia_quentin_third_condition()
{
	if((Npc_KnowsInfo(hero,dia_quentin_second) && grd_5018_ramon.aivar[AIV_WASDEFEATEDBYSC] && grd_5014_convoitraeger.aivar[AIV_WASDEFEATEDBYSC] && grd_5015_convoitraeger.aivar[AIV_WASDEFEATEDBYSC] && grd_5016_convoiwache.aivar[AIV_WASDEFEATEDBYSC] && grd_5017_convoiwache.aivar[AIV_WASDEFEATEDBYSC]) || (Npc_KnowsInfo(hero,dia_quentin_second) && Npc_IsDead(grd_5018_ramon) && Npc_IsDead(grd_5014_convoitraeger) && Npc_IsDead(grd_5015_convoitraeger) && Npc_IsDead(grd_5016_convoiwache) && Npc_IsDead(grd_5017_convoiwache)))
	{
		return 1;
	};
};

func void dia_quentin_third_info()
{
	AI_Output(self,other,"DIA_Quentin_Third_06_00");	//Dobra robota, ch³opcze. Maj¹ doœæ, hehe.
	AI_Output(self,other,"DIA_Quentin_Third_06_02");	//Dostajesz jedn¹ po³owê ³upu, a my drug¹. Tak to ju¿ u nas jest.
	AI_Output(self,other,"DIA_Quentin_Third_06_03");	//Oto twój udzia³.
	AI_Output(self,other,"DIA_Quentin_Third_06_04");	//Ach, jeszcze coœ. Witamy w bandzie!
	AI_Output(self,other,"DIA_Quentin_Third_06_05");	//Jeœli chcesz, mo¿esz nas odwiedziæ w naszym obozie w górach.
	AI_Output(self,other,"DIA_Quentin_Third_06_06");	//Do zobaczenia.
	CreateInvItems(self,ItFoApple,21);
	B_GiveInvItems(self,other,ItFoApple,21);
	Npc_RemoveInvItems(other,ItFoApple,21);
	CreateInvItems(other,ItMw_1H_LightGuardsSword_03,1);
	CreateInvItems(other,ItFoApple,5);
	CreateInvItems(other,ItFoLoaf,5);
	CreateInvItems(other,ItFoCheese,5);
	CreateInvItems(other,ItFoBeer,5);
	B_LogEntry(CH2_KONVOINC,"Quentin - dowódca oddzia³u najazdowego - by³ kontent z mojej pracy i powiedzia³ mi, jak siê dzieli ³upy wœród bandytów. Ostatecznie wróci³ on z powrotem w góry. Powinienem z³o¿yæ mu tam kiedyœ wizytê, jeœli akurat bêdê tamtêdy przechodzi³.");
	AI_StopProcessInfos(self);
};


instance dia_quentin_wer(C_Info)
{
	npc = Org_858_Quentin;
	nr = 1;
	condition = dia_quentin_wer_condition;
	information = dia_quentin_wer_info;
	permanent = 0;
	important = 0;
	description = "Kim jesteœ?";
};


func int dia_quentin_wer_condition()
{
	return 1;
};

func void dia_quentin_wer_info()
{
	AI_Output(other,self,"DIA_Quentin_Wer_06_00");	//Kim jesteœ?
	AI_Output(self,other,"DIA_Quentin_Wer_06_01");	//Jestem Quentin - szef tego obozu. Dbam tutaj o ³ad i porz¹dek, dlatego wszystko idzie g³adko i sprawnie.
};


instance DIA_QUENTIN_LAGER(C_Info)
{
	npc = Org_858_Quentin;
	nr = 1;
	condition = dia_quentin_lager_condition;
	information = dia_quentin_lager_info;
	permanent = 0;
	important = 0;
	description = "Co to za obóz?";
};


func int dia_quentin_lager_condition()
{
	if(Npc_KnowsInfo(hero,dia_quentin_wer))
	{
		return 1;
	};
};

func void dia_quentin_lager_info()
{
	AI_Output(other,self,"DIA_Quentin_Lager_06_00");	//Co to za obóz?
	AI_Output(self,other,"DIA_Quentin_Lager_06_01");	//Zbójecki. ¯yjemy tutaj z ³owów, jak i z napadów na Stary Obóz.
	AI_Output(self,other,"DIA_Quentin_Lager_06_02");	//Zawar³em niedawno sojusz z przywódc¹ Szkodników w Nowym Obozie - Laresem - ¿e bêdziemy ich wspieraæ podczas napadów.
	AI_Output(self,other,"DIA_Quentin_Lager_06_03");	//Po³owa ³upu idzie do Nowego Obozu, a reszta - do nas.
};


instance DIA_QUENTIN_RUESTUNGEN(C_Info)
{
	npc = Org_858_Quentin;
	nr = 1;
	condition = dia_quentin_ruestungen_condition;
	information = dia_quentin_ruestungen_info;
	permanent = 0;
	important = 0;
	description = "Czy to nie czasem pancerze Nowego Obozu?";
};


func int dia_quentin_ruestungen_condition()
{
	if(Npc_KnowsInfo(hero,dia_quentin_wer))
	{
		return 1;
	};
};

func void dia_quentin_ruestungen_info()
{
	AI_Output(other,self,"DIA_Quentin_Ruestungen_06_00");	//Czy to nie czasem pancerze Nowego Obozu?
	AI_Output(self,other,"DIA_Quentin_Ruestungen_06_01");	//Bystry jesteœ.
	AI_Output(self,other,"DIA_Quentin_Ruestungen_08_02");	//Bo widzisz - my, Szkodnicy, byliœmy tam jedynymi w obozie, którzy opierali siê ludziom Gomeza.
	AI_Output(other,self,"DIA_Quentin_Ruestungen_08_03");	//A Najemnicy?
	AI_Output(self,other,"DIA_Quentin_Ruestungen_06_04");	//Mo¿e i jeszcze kilka lat temu byliœmy czêœci¹ Nowego Obozu, ale wkurza³y mnie ju¿ te bol¹czki z Najemnikami. Lee ca³y czas ¿ywi³ przekonanie, ¿e to on piastuje w³adzê nad Szkodnikami.
	AI_Output(self,other,"DIA_Quentin_Ruestungen_06_05");	//Dlatego te¿ szuka³em niezale¿noœci. Chcia³em po prostu ¿yæ dla siebie, z dala od tego wszystkiego.
	AI_Output(self,other,"DIA_Quentin_Ruestungen_06_06");	//I w³aœnie tutaj, w tej dolinie, tê wolnoœæ odnalaz³em.
};


instance DIA_QUENTIN_HOEHLE(C_Info)
{
	npc = Org_858_Quentin;
	nr = 1;
	condition = dia_quentin_hoehle_condition;
	information = dia_quentin_hoehle_info;
	permanent = 0;
	important = 0;
	description = "Co to za jaskinia tutaj?";
};


func int dia_quentin_hoehle_condition()
{
	if(Npc_KnowsInfo(hero,dia_quentin_wer))
	{
		return 1;
	};
};

func void dia_quentin_hoehle_info()
{
	AI_Output(other,self,"DIA_Quentin_Hoehle_06_00");	//Co to za jaskinia tutaj?
	AI_Output(self,other,"DIA_Quentin_Hoehle_06_01");	//Tego nie wiem.
	AI_Output(self,other,"DIA_Quentin_Hoehle_06_02");	//Myœlê, ¿e chodzi tu prawdopodobnie o zawalon¹ sztolniê kopalnian¹.
	AI_Output(self,other,"DIA_Quentin_Hoehle_06_03");	//Jeœli wiêc uda³oby nam siê j¹ ods³oniæ, mielibyœmy rudê i moglibyœmy w ten sposób prowadziæ interesy z pozosta³ymi obozami.
	AI_Output(other,self,"DIA_Quentin_Hoehle_06_04");	//A czym na tê chwilê handlujecie?
	AI_Output(self,other,"DIA_Quentin_Hoehle_06_05");	//G³ównie trofeami zwierzêcymi, które uda nam siê zdobyæ podczas polowañ. Pazury, skóry, zêby, wszystko ma swoj¹ wartoœæ.
	AI_Output(self,other,"DIA_Quentin_Hoehle_06_06");	//Tyle ¿e teraz akurat niestety ledwie wi¹¿emy koniec z koñcem.
};

