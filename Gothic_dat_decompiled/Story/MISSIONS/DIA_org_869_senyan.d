
instance DIA_SENYAN1_EXIT(C_Info)
{
	npc = org_869_senyan;
	nr = 999;
	condition = dia_senyan1_exit_condition;
	information = dia_senyan1_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_senyan1_exit_condition()
{
	return 1;
};

func void dia_senyan1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SENYAN1_HELLO(C_Info)
{
	npc = org_869_senyan;
	nr = 1;
	condition = dia_senyan1_hello_condition;
	information = dia_senyan1_hello_info;
	permanent = 0;
	important = 1;
};


func int dia_senyan1_hello_condition()
{
	return 1;
};

func void dia_senyan1_hello_info()
{
	AI_Output(self,other,"DIA_Senyan1_Hello_15_00");	//Ej, ty! Kim jeste� i dlaczego ci� tu jeszcze nigdy nie widzia�em?
	AI_Output(other,self,"DIA_Senyan1_Hello_15_01");	//Nic dziwnego, w ko�cu jestem tu nowy.
	AI_Output(self,other,"DIA_Senyan1_Hello_15_02");	//Ach, to tak! W takim razie powiniene� uwa�a�, gdzie si� wa��sasz.
	AI_Output(self,other,"DIA_Senyan1_Hello_15_03");	//S� ludzie, kt�rzy nie bardzo przepadaj� za ciekawskimi przybyszami, kt�rzy wsz�dzie wtykaj� swoje nochale.
	AI_Output(self,other,"DIA_Senyan1_Hello_15_04");	//Tak �e wiesz, pilnuj si� tutaj!
	AI_StopProcessInfos(self);
};


instance DIA_SENYAN_ORT(C_Info)
{
	npc = org_869_senyan;
	nr = 1;
	condition = dia_senyan_ort_condition;
	information = dia_senyan_ort_info;
	permanent = 1;
	important = 0;
	description = "Co to za miejsce?";
};


func int dia_senyan_ort_condition()
{
	return 1;
};

func void dia_senyan_ort_info()
{
	AI_Output(other,self,"DIA_Senyan_Ort_15_00");	//Co to za miejsce?
	AI_Output(self,other,"DIA_Senyan_Ort_15_01");	//Jedyny teren, na kt�rym czujesz si� naprawd� wolnym w ca�ej tej przekl�tej kolonii, ch�opcze!
	AI_Output(self,other,"DIA_Senyan_Ort_15_02");	//Mamy tu najbardziej niezale�n� miejsc�w�, jak� w og�le mo�esz sobie wyobrazi�. Nie ma tu �adnych Stra�nik�w �wi�tynnych, Najemnik�w ani Stra�nik�w.
	AI_Output(self,other,"DIA_Senyan_Ort_15_03");	//Wszystko, czego potrzebujemy do �ycia, albo �upimy z konwoj�w ludzi Gomeza, albo przynosimy z polowa�.
	AI_Output(self,other,"DIA_Senyan_Ort_15_04");	//Tak �e widzisz, �yjemy z dala od tych wszystkich oboz�w, a mimo to i tak znakomicie sami sobie radzimy.
};


var int senyan_esteban;

instance DIA_SENYAN_ESTEBAN(C_Info)
{
	npc = org_869_senyan;
	nr = 1;
	condition = dia_senyan_esteban_condition;
	information = dia_senyan_esteban_info;
	permanent = 0;
	important = 0;
	description = "Co s�dzisz o Estebanie?";
};


func int dia_senyan_esteban_condition()
{
	if(esteban_leader == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_senyan_esteban_info()
{
	AI_Output(other,self,"DIA_Senyan_Esteban_15_00");	//Co s�dzisz o Estebanie?
	AI_Output(self,other,"DIA_Senyan_Esteban_15_01");	//A ch�tnie ci powiem.
	AI_Output(self,other,"DIA_Senyan_Esteban_15_02");	//Esteban jest tutaj jedynym, kt�ry m�g�by zainaugurowa� porz�dne widowisko.
	AI_Output(self,other,"DIA_Senyan_Esteban_15_03");	//Jasne, jest jeszcze Quentin, ale on to d�ugo nie poci�gnie jako przyw�dca, m�wi� ci.
	B_LogEntry(CH1_ESTEBANQUENTIN,"Senyan wierzy, �e Esteban jest jedynym, kt�ry m�g�by poprowadzi� ten ob�z. Twierdzi, �e Quentin d�ugo na tym szczycie nie poci�gnie.");
	senyan_esteban = TRUE;
};

