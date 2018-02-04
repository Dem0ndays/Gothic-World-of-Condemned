
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
	AI_Output(self,other,"DIA_Senyan1_Hello_15_00");	//Ej, ty! Kim jesteœ i dlaczego ciê tu jeszcze nigdy nie widzia³em?
	AI_Output(other,self,"DIA_Senyan1_Hello_15_01");	//Nic dziwnego, w koñcu jestem tu nowy.
	AI_Output(self,other,"DIA_Senyan1_Hello_15_02");	//Ach, to tak! W takim razie powinieneœ uwa¿aæ, gdzie siê wa³êsasz.
	AI_Output(self,other,"DIA_Senyan1_Hello_15_03");	//S¹ ludzie, którzy nie bardzo przepadaj¹ za ciekawskimi przybyszami, którzy wszêdzie wtykaj¹ swoje nochale.
	AI_Output(self,other,"DIA_Senyan1_Hello_15_04");	//Tak ¿e wiesz, pilnuj siê tutaj!
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
	AI_Output(self,other,"DIA_Senyan_Ort_15_01");	//Jedyny teren, na którym czujesz siê naprawdê wolnym w ca³ej tej przeklêtej kolonii, ch³opcze!
	AI_Output(self,other,"DIA_Senyan_Ort_15_02");	//Mamy tu najbardziej niezale¿n¹ miejscówê, jak¹ w ogóle mo¿esz sobie wyobraziæ. Nie ma tu ¿adnych Stra¿ników Œwi¹tynnych, Najemników ani Stra¿ników.
	AI_Output(self,other,"DIA_Senyan_Ort_15_03");	//Wszystko, czego potrzebujemy do ¿ycia, albo ³upimy z konwojów ludzi Gomeza, albo przynosimy z polowañ.
	AI_Output(self,other,"DIA_Senyan_Ort_15_04");	//Tak ¿e widzisz, ¿yjemy z dala od tych wszystkich obozów, a mimo to i tak znakomicie sami sobie radzimy.
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
	description = "Co s¹dzisz o Estebanie?";
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
	AI_Output(other,self,"DIA_Senyan_Esteban_15_00");	//Co s¹dzisz o Estebanie?
	AI_Output(self,other,"DIA_Senyan_Esteban_15_01");	//A chêtnie ci powiem.
	AI_Output(self,other,"DIA_Senyan_Esteban_15_02");	//Esteban jest tutaj jedynym, który móg³by zainaugurowaæ porz¹dne widowisko.
	AI_Output(self,other,"DIA_Senyan_Esteban_15_03");	//Jasne, jest jeszcze Quentin, ale on to d³ugo nie poci¹gnie jako przywódca, mówiê ci.
	B_LogEntry(CH1_ESTEBANQUENTIN,"Senyan wierzy, ¿e Esteban jest jedynym, który móg³by poprowadziæ ten obóz. Twierdzi, ¿e Quentin d³ugo na tym szczycie nie poci¹gnie.");
	senyan_esteban = TRUE;
};

