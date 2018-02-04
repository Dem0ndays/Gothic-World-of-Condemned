
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
	AI_Output(self,other,"DIA_Quentin_First_06_00");	//No prosz�, kogo my tu mamy? Kilku poplecznik�w Gomeza, chc�cych dosta� si� do Starej Kopalni?
	AI_Output(self,other,"DIA_Quentin_First_06_01");	//Trzeba by�o skorzysta� z drogi okr�nej, a tak to teraz niestety zmuszeni jeste�cie zap�aci� za ten b��d w�asnym �yciem.
	AI_Output(self,other,"DIA_Quentin_First_06_02");	//CH�OPCY! DO ATAKU!
	B_ChangeGuild(Org_865_Raeuber,GIL_ZOMBIE);
	B_ChangeGuild(Org_874_Raeuber,GIL_ZOMBIE);
	B_ChangeGuild(self,GIL_ZOMBIE);
	AI_StopProcessInfos(self);
	B_LogEntry(CH2_KONVOIOC,"Tu� przed naszym punktem docelowym, zostali�my z Ramonem napadni�ci przez kilku rzezimieszk�w z Nowego Obozu. Przyw�dca tej�e bandy nazywa� si� Quentin.");
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
	AI_Output(self,other,"DIA_Quentin_Angriff__06_02");	//Dobrze, �e jeste�cie. Tam z przodu siedz� w�a�nie ludzie Gomeza.
	AI_Output(self,other,"DIA_Quentin_First_06_03");	//Wygl�da na to, �e zrobili sobie kr�tk� przerw�.
	AI_Output(self,other,"DIA_Quentin_First_06_04");	//Mo�emy to wykorzysta�.
	AI_Output(self,other,"DIA_Quentin_First_06_05");	//Je�li jeste� got�w, to jazda, do��czymy.
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
	AI_Output(self,other,"DIA_Quentin_Third_06_00");	//Dobra robota, ch�opcze. Maj� do��, hehe.
	AI_Output(self,other,"DIA_Quentin_Third_06_02");	//Dostajesz jedn� po�ow� �upu, a my drug�. Tak to ju� u nas jest.
	AI_Output(self,other,"DIA_Quentin_Third_06_03");	//Oto tw�j udzia�.
	AI_Output(self,other,"DIA_Quentin_Third_06_04");	//Ach, jeszcze co�. Witamy w bandzie!
	AI_Output(self,other,"DIA_Quentin_Third_06_05");	//Je�li chcesz, mo�esz nas odwiedzi� w naszym obozie w g�rach.
	AI_Output(self,other,"DIA_Quentin_Third_06_06");	//Do zobaczenia.
	CreateInvItems(self,ItFoApple,21);
	B_GiveInvItems(self,other,ItFoApple,21);
	Npc_RemoveInvItems(other,ItFoApple,21);
	CreateInvItems(other,ItMw_1H_LightGuardsSword_03,1);
	CreateInvItems(other,ItFoApple,5);
	CreateInvItems(other,ItFoLoaf,5);
	CreateInvItems(other,ItFoCheese,5);
	CreateInvItems(other,ItFoBeer,5);
	B_LogEntry(CH2_KONVOINC,"Quentin - dow�dca oddzia�u najazdowego - by� kontent z mojej pracy i powiedzia� mi, jak si� dzieli �upy w�r�d bandyt�w. Ostatecznie wr�ci� on z powrotem w g�ry. Powinienem z�o�y� mu tam kiedy� wizyt�, je�li akurat b�d� tamt�dy przechodzi�.");
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
	description = "Kim jeste�?";
};


func int dia_quentin_wer_condition()
{
	return 1;
};

func void dia_quentin_wer_info()
{
	AI_Output(other,self,"DIA_Quentin_Wer_06_00");	//Kim jeste�?
	AI_Output(self,other,"DIA_Quentin_Wer_06_01");	//Jestem Quentin - szef tego obozu. Dbam tutaj o �ad i porz�dek, dlatego wszystko idzie g�adko i sprawnie.
};


instance DIA_QUENTIN_LAGER(C_Info)
{
	npc = Org_858_Quentin;
	nr = 1;
	condition = dia_quentin_lager_condition;
	information = dia_quentin_lager_info;
	permanent = 0;
	important = 0;
	description = "Co to za ob�z?";
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
	AI_Output(other,self,"DIA_Quentin_Lager_06_00");	//Co to za ob�z?
	AI_Output(self,other,"DIA_Quentin_Lager_06_01");	//Zb�jecki. �yjemy tutaj z �ow�w, jak i z napad�w na Stary Ob�z.
	AI_Output(self,other,"DIA_Quentin_Lager_06_02");	//Zawar�em niedawno sojusz z przyw�dc� Szkodnik�w w Nowym Obozie - Laresem - �e b�dziemy ich wspiera� podczas napad�w.
	AI_Output(self,other,"DIA_Quentin_Lager_06_03");	//Po�owa �upu idzie do Nowego Obozu, a reszta - do nas.
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
	AI_Output(self,other,"DIA_Quentin_Ruestungen_06_01");	//Bystry jeste�.
	AI_Output(self,other,"DIA_Quentin_Ruestungen_08_02");	//Bo widzisz - my, Szkodnicy, byli�my tam jedynymi w obozie, kt�rzy opierali si� ludziom Gomeza.
	AI_Output(other,self,"DIA_Quentin_Ruestungen_08_03");	//A Najemnicy?
	AI_Output(self,other,"DIA_Quentin_Ruestungen_06_04");	//Mo�e i jeszcze kilka lat temu byli�my cz�ci� Nowego Obozu, ale wkurza�y mnie ju� te bol�czki z Najemnikami. Lee ca�y czas �ywi� przekonanie, �e to on piastuje w�adz� nad Szkodnikami.
	AI_Output(self,other,"DIA_Quentin_Ruestungen_06_05");	//Dlatego te� szuka�em niezale�no�ci. Chcia�em po prostu �y� dla siebie, z dala od tego wszystkiego.
	AI_Output(self,other,"DIA_Quentin_Ruestungen_06_06");	//I w�a�nie tutaj, w tej dolinie, t� wolno�� odnalaz�em.
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
	AI_Output(self,other,"DIA_Quentin_Hoehle_06_02");	//My�l�, �e chodzi tu prawdopodobnie o zawalon� sztolni� kopalnian�.
	AI_Output(self,other,"DIA_Quentin_Hoehle_06_03");	//Je�li wi�c uda�oby nam si� j� ods�oni�, mieliby�my rud� i mogliby�my w ten spos�b prowadzi� interesy z pozosta�ymi obozami.
	AI_Output(other,self,"DIA_Quentin_Hoehle_06_04");	//A czym na t� chwil� handlujecie?
	AI_Output(self,other,"DIA_Quentin_Hoehle_06_05");	//G��wnie trofeami zwierz�cymi, kt�re uda nam si� zdoby� podczas polowa�. Pazury, sk�ry, z�by, wszystko ma swoj� warto��.
	AI_Output(self,other,"DIA_Quentin_Hoehle_06_06");	//Tyle �e teraz akurat niestety ledwie wi��emy koniec z ko�cem.
};

