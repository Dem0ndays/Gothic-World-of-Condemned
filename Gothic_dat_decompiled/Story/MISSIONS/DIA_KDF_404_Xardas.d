
instance Info_Xardas_EXIT(C_Info)
{
	npc = KDF_404_Xardas;
	nr = 999;
	condition = Info_Xardas_EXIT_Condition;
	information = Info_Xardas_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Xardas_EXIT_Condition()
{
	return 1;
};

func void Info_Xardas_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Xardas_DISTURB(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_DISTURB_Condition;
	information = Info_Xardas_DISTURB_Info;
	important = 1;
	permanent = 0;
};


func int Info_Xardas_DISTURB_Condition()
{
	if(!UrShak_SpokeOfUluMulu)
	{
		return TRUE;
	};
};

func void Info_Xardas_DISTURB_Info()
{
	B_WhirlAround(self,hero);
	AI_Output(self,hero,"Info_Xardas_DISTURB_14_01");	//KTO �MIE PRZESZKADZA� MI W MOICH STUDIACH?
	AI_Output(hero,self,"Info_Xardas_DISTURB_15_02");	//Nazywam si�...
	AI_Output(self,hero,"Info_Xardas_DISTURB_14_03");	//Nie interesuje mnie twoje imi�. To nieistotne.
	AI_Output(self,hero,"Info_Xardas_DISTURB_14_04");	//Liczy si� tylko to, �e jeste� pierwsz� osob� od wielu lat, kt�rej uda�o si� rozwi�za� zagadk� Golem�w.
};


instance Info_Xardas_OTHERS(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_OTHERS_Condition;
	information = Info_Xardas_OTHERS_Info;
	important = 0;
	permanent = 0;
	description = "Czy kto� jeszcze tu zagl�da�?";
};


func int Info_Xardas_OTHERS_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_DISTURB))
	{
		return TRUE;
	};
};

func void Info_Xardas_OTHERS_Info()
{
	AI_Output(hero,self,"Info_Xardas_OTHERS_15_01");	//Czy kto� jeszcze tu zagl�da�?
	AI_Output(self,hero,"Info_Xardas_OTHERS_14_02");	//Bardzo rzadko. Zwykle szybko zaczynali mnie irytowa� i nasy�a�em na nich kt�r�� z moich magicznych istot.
	AI_Output(hero,self,"Info_Xardas_OTHERS_15_03");	//Wolisz wie�� �ywot samotnika, czy� nie?
};


instance Info_Xardas_SATURAS(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_SATURAS_Condition;
	information = Info_Xardas_SATURAS_Info;
	important = 0;
	permanent = 0;
	description = "Przysy�a mnie Saturas. Potrzebujemy twojej pomocy!";
};


func int Info_Xardas_SATURAS_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_DISTURB))
	{
		return TRUE;
	};
};

func void Info_Xardas_SATURAS_Info()
{
	AI_Output(hero,self,"Info_Xardas_SATURAS_15_01");	//Przysy�a mnie Saturas. Potrzebujemy twojej pomocy!
	AI_Output(hero,self,"Info_Xardas_SATURAS_15_02");	//Magowie Wody zamierzaj� zrobi� u�ytek ze swojego kopca rudy.
	AI_Output(self,hero,"Info_Xardas_SATURAS_14_03");	//Detonacja wielkiej g�ry nie jest �adnym rozwi�zaniem!
	AI_Output(hero,self,"Info_Xardas_SATURAS_15_04");	//Nie jest?
	AI_Output(self,hero,"Info_Xardas_SATURAS_14_05");	//NIE!
};


instance Info_Xardas_KDW(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_KDW_Condition;
	information = Info_Xardas_KDW_Info;
	important = 0;
	permanent = 0;
	description = "Wszyscy Magowie Ognia zgin�li!";
};


func int Info_Xardas_KDW_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_DISTURB))
	{
		return TRUE;
	};
};

func void Info_Xardas_KDW_Info()
{
	AI_Output(hero,self,"Info_Xardas_KDW_15_01");	//Wszyscy Magowie Ognia zgin�li!
	AI_Output(hero,self,"Info_Xardas_KDW_15_02");	//Gomez kaza� ich zamordowa�.
	AI_Output(self,hero,"Info_Xardas_KDW_14_03");	//Nie powiem, �ebym by� szczeg�lnie zaskoczony. Tym durnym barbarzy�com z zamku - z Gomezem na czele - nigdy nie mo�na by�o ufa�.
	AI_Output(self,hero,"Info_Xardas_KDW_14_04");	//Pomagaj�c Gomezowi w obj�ciu w�adzy, Corristo i inni sami kopali sobie gr�b.
};


instance Info_Xardas_SLEEPER(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_SLEEPER_Condition;
	information = Info_Xardas_SLEEPER_Info;
	important = 0;
	permanent = 0;
	description = "Tak zwany '�ni�cy' okaza� si� pono� pot�nym demonem zag�ady.";
};


func int Info_Xardas_SLEEPER_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_DISTURB))
	{
		return TRUE;
	};
};

func void Info_Xardas_SLEEPER_Info()
{
	AI_Output(hero,self,"Info_Xardas_SLEEPER_15_01");	//Tak zwany "�ni�cy" okaza� si� pono� pot�nym demonem zag�ady.
	AI_Output(hero,self,"Info_Xardas_SLEEPER_15_02");	//Przekona�o si� o tym Bractwo z obozu na bagnie.
	AI_Output(hero,self,"Info_Xardas_SLEEPER_15_03");	//Magowie Wody uwa�aj� teraz, �e ca�a kolonia znalaz�a si� w �miertelnym niebezpiecze�stwie.
	AI_Output(self,hero,"Info_Xardas_SLEEPER_14_04");	//Stoimy przed powa�niejszym zagro�eniem ni� ktokolwiek wewn�trz Bariery jest w stanie sobie wyobrazi�...
};


instance Info_Xardas_DANGER(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_DANGER_Condition;
	information = Info_Xardas_DANGER_Info;
	important = 0;
	permanent = 0;
	description = "Je�li detonacja kopca rudy nie wystarczy, by za�egna� niebezpiecze�stwo...";
};


func int Info_Xardas_DANGER_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_SLEEPER) && Npc_KnowsInfo(hero,Info_Xardas_SATURAS))
	{
		return TRUE;
	};
};

func void Info_Xardas_DANGER_Info()
{
	AI_Output(hero,self,"Info_Xardas_DANGER_15_01");	//Je�li detonacja kopca rudy nie wystarczy, by za�egna� niebezpiecze�stwo...
	AI_Output(self,hero,"Info_Xardas_DANGER_14_02");	//...Zapomnij o tym ca�ym kopcu! Jego pot�ga nie wystarczy, by prze�ama� Barier�.
	AI_Output(self,hero,"Info_Xardas_DANGER_14_03");	//Gdyby Corristo i Saturas nie tracili cennego czasu na te swoje dziecinne spory, wiedzieliby teraz co nale�y zrobi�.
	AI_Output(hero,self,"Info_Xardas_DANGER_15_04");	//A co twoim zdaniem nale�y zrobi�?
	AI_Output(self,hero,"Info_Xardas_DANGER_14_05");	//�aden z dwunastu mag�w nie zada� sobie trudu, by zbada� z jakich przyczyn Bariera wymkn�a si� spod kontroli, ani dlaczego przybra�a tak ogromne rozmiary.
};


instance Info_Xardas_BARRIER(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_BARRIER_Condition;
	information = Info_Xardas_BARRIER_Info;
	important = 0;
	permanent = 0;
	description = "A ty wiesz, co si� sta�o, tak?";
};


func int Info_Xardas_BARRIER_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_DANGER))
	{
		return TRUE;
	};
};

func void Info_Xardas_BARRIER_Info()
{
	AI_Output(hero,self,"Info_Xardas_BARRIER_15_01");	//A ty wiesz, co si� sta�o, tak?
	AI_Output(self,hero,"Info_Xardas_BARRIER_14_02");	//C�, jedno jest pewne: odpowied� spoczywa ukryta g��boko pod miastem Ork�w.
	AI_Output(hero,self,"Info_Xardas_BARRIER_15_03");	//Miastem Ork�w?
	AI_Output(self,hero,"Info_Xardas_BARRIER_14_04");	//Orkowie to nie zwierz�ta, cho� wielu ludzi tak w�a�nie my�li. Ich kultura dor�wnuje wiekiem naszej.
	AI_Output(self,hero,"Info_Xardas_BARRIER_14_05");	//Wiele stuleci temu, pi�ciu orkowych szaman�w przywo�a�o do tego �wiata pot�nego demona, kt�ry mia� im pom�c zdominowa� pozosta�e klany.
	AI_Output(hero,self,"Info_Xardas_BARRIER_15_06");	//Ten demon... To �ni�cy, prawda?
	AI_Output(self,hero,"Info_Xardas_BARRIER_14_07");	//Orkowie nadali mu to imi� du�o p�niej. Ale nie powiem ci dlaczego wybrali t� nazw�, ani dlaczego tak bardzo si� go teraz boj�!
};


instance Info_Xardas_EVENT(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_EVENT_Condition;
	information = Info_Xardas_EVENT_Info;
	important = 0;
	permanent = 0;
	description = "Dlaczego nie?";
};


func int Info_Xardas_EVENT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_BARRIER))
	{
		return TRUE;
	};
};

func void Info_Xardas_EVENT_Info()
{
	AI_Output(hero,self,"Info_Xardas_EVENT_15_01");	//Dlaczego nie?
	AI_Output(self,hero,"Info_Xardas_EVENT_14_02");	//My�l�, �e mo�esz by�... NIE, aby mnie przekona�, musisz wykona� jeszcze jedno zadanie!
	AI_Output(hero,self,"Info_Xardas_EVENT_15_03");	//Jakie zadanie?
	AI_Output(self,hero,"Info_Xardas_EVENT_14_04");	//S�uchaj uwa�nie: Orkowie wygnali z miasta jednego ze swoich szaman�w.
};


instance Info_Xardas_EVENTWHY(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_EVENTWHY_Condition;
	information = Info_Xardas_EVENTWHY_Info;
	important = 0;
	permanent = 0;
	description = "Dlaczego?";
};


func int Info_Xardas_EVENTWHY_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_EVENT))
	{
		return TRUE;
	};
};

func void Info_Xardas_EVENTWHY_Info()
{
	AI_Output(hero,self,"Info_Xardas_EVENTWHY_15_01");	//Dlaczego?
	AI_Output(self,hero,"Info_Xardas_EVENTWHY_14_02");	//Umieraj�cy Ork, kt�rego kaza�em przes�ucha� moim demonom, nie by� w stanie odpowiedzie� mi na to pytanie.
};


instance Info_Xardas_EVENTHOW(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_EVENTHOW_Condition;
	information = Info_Xardas_EVENTHOW_Info;
	important = 0;
	permanent = 0;
	description = "Co ten szaman ma wsp�lnego z moim zadaniem?";
};


func int Info_Xardas_EVENTHOW_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_EVENT))
	{
		return TRUE;
	};
};

func void Info_Xardas_EVENTHOW_Info()
{
	AI_Output(hero,self,"Info_Xardas_EVENTHOW_15_01");	//Co ten szaman ma wsp�lnego z moim zadaniem?
	AI_Output(self,hero,"Info_Xardas_EVENTHOW_14_02");	//On opowie ci reszt� historii zwi�zanej ze �ni�cym.
	AI_Output(hero,self,"Info_Xardas_EVENTHOW_15_03");	//Obawiam si�, �e Ork nie b�dzie zbyt ch�tny do zwierze� w mojej obecno�ci!
	AI_Output(self,hero,"Info_Xardas_EVENTHOW_14_04");	//Chcesz �ebym ci pom�g�, czy nie?
	AI_Output(hero,self,"Info_Xardas_EVENTHOW_15_05");	//Tak, ale...
	AI_Output(self,hero,"Info_Xardas_EVENTHOW_14_06");	//Wi�c nigdy wi�cej nie kwestionuj tego, co m�wi�!
	AI_Output(self,hero,"Info_Xardas_EVENTHOW_14_07");	//Znajd� tego szamana. Nie pa�a mi�o�ci� do swych braci z miasta Ork�w, wi�c mo�e zgodzi si� ciebie wys�ucha� zanim zamieni ci� w �yw� pochodni�!
	AI_Output(hero,self,"Info_Xardas_EVENTHOW_15_08");	//Bardzo pocieszaj�ce!
};


instance Info_Xardas_EVENTWHERE(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_EVENTWHERE_Condition;
	information = Info_Xardas_EVENTWHERE_Info;
	important = 0;
	permanent = 0;
	description = "Gdzie znajd� tego wygnanego szamana?";
};


func int Info_Xardas_EVENTWHERE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_EVENT))
	{
		return TRUE;
	};
};

func void Info_Xardas_EVENTWHERE_Info()
{
	AI_Output(hero,self,"Info_Xardas_EVENTWHERE_15_01");	//Gdzie znajd� tego wygnanego szamana?
	AI_Output(self,hero,"Info_Xardas_EVENTWHERE_14_02");	//Id� do starej cytadeli na wschodzie. Na pewno trafisz - znajduje si� na szczycie wysokiej g�ry. Wida� j� ju� z daleka.
	AI_Output(hero,self,"Info_Xardas_EVENTWHERE_15_03");	//I mog� tak po prostu do niej wej��?
	AI_Output(self,hero,"Info_Xardas_EVENTWHERE_14_04");	//M�wi� na ni� stara cytadela, cho� tak naprawd� to tylko sterta kamieni. Od wielu dziesi�cioleci nikt tam nie zagl�da.
};


instance Info_Xardas_ACCEPT(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_ACCEPT_Condition;
	information = Info_Xardas_ACCEPT_Info;
	important = 0;
	permanent = 0;
	description = "Porozmawiam z tym szamanem!";
};


func int Info_Xardas_ACCEPT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_EVENTWHY) && Npc_KnowsInfo(hero,Info_Xardas_EVENTHOW) && Npc_KnowsInfo(hero,Info_Xardas_EVENTWHERE))
	{
		return TRUE;
	};
};

func void Info_Xardas_ACCEPT_Info()
{
	AI_Output(hero,self,"Info_Xardas_ACCEPT_15_01");	//Porozmawiam z tym szamanem!
	AI_Output(self,hero,"Info_Xardas_ACCEPT_14_02");	//M�j s�uga da� ci ju� magiczn� run� uaktywniaj�c� pentagram pi�tro ni�ej.
	AI_Output(self,hero,"Info_Xardas_ACCEPT_14_03");	//W ten spos�b b�dziesz m�g� wr�ci� do mnie natychmiast po wykonaniu zadania.
	B_Story_CordsPost();
	B_Story_FindOrcShaman();
	AI_StopProcessInfos(self);
};


var int xardas_trade;

instance Kdf_404_Xardas_SELLMAGICSTUFF(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Kdf_404_Xardas_SELLMAGICSTUFF_Condition;
	information = Kdf_404_Xardas_SELLMAGICSTUFF_Info;
	important = 0;
	permanent = 1;
	trade = 1;
	description = "Poszukuj� wiedzy magicznej.";
};


func int Kdf_404_Xardas_SELLMAGICSTUFF_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_ACCEPT))
	{
		return TRUE;
	};
};

func void Kdf_404_Xardas_SELLMAGICSTUFF_Info()
{
	AI_Output(other,self,"Kdf_404_Xardas_SELLMAGICSTUFF_Info_15_01");	//Poszukuj� wiedzy magicznej.
	if(xardas_trade == FALSE)
	{
		Log_CreateTopic(GE_TraderOW,LOG_NOTE);
		B_LogEntry(GE_TraderOW,"Nekromanta Xardas handluje magicznymi zakl�ciami, runami oraz miksturami.");
		xardas_trade = TRUE;
	};
};


instance kdf_404_xardas_teach(C_Info)
{
	npc = KDF_404_Xardas;
	condition = kdf_404_xardas_teach_condition;
	information = kdf_404_xardas_teach_info;
	important = 0;
	permanent = 0;
	description = "Mo�esz mnie czego� nauczy�?";
};


func int kdf_404_xardas_teach_condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_ACCEPT))
	{
		return TRUE;
	};
};

func void kdf_404_xardas_teach_info()
{
	AI_Output(other,self,"Kdf_404_Xardas_TEACH_Info_15_01");	//Mo�esz mnie czego� nauczy�?
	AI_Output(self,other,"Kdf_404_Xardas_TEACH_Info_15_02");	//Podstaw b�dziesz musia� si� nauczy� w kt�rym� z oboz�w.
	AI_Output(self,other,"Kdf_404_Xardas_TEACH_Info_15_03");	//B�dziesz musia� si� zdecydowa� na magi� Ognia, Wody, b�d� te� na magi� �ni�cego.
	AI_Output(self,other,"Kdf_404_Xardas_TEACH_Info_15_04");	//Bez znaczenia jak� drog� magii obierzesz, to nie gra �adnej roli.
	AI_Output(self,other,"Kdf_404_Xardas_TEACH_Info_15_05");	//Ka�da z nich zaprowadzi ci� w ko�cu do swojego ostatecznego celu - do sz�stego kr�gu magii.
	AI_Output(self,other,"Kdf_404_Xardas_TEACH_Info_15_06");	//Sz�sty kr�g zawiera wiedz� na temat mrocznej magii - magii Beliara.
	AI_Output(self,other,"Kdf_404_Xardas_TEACH_Info_15_07");	//Nab�dziesz w ten spos�b pot�ny zas�b wiedzy.
	AI_Output(self,other,"Kdf_404_Xardas_TEACH_Info_15_08");	//Nale��c do Mag�w Ognia lub Wody, sz�sty kr�g b�dzie znaczy� dla ciebie tyle, �e wst�pujesz r�wnie� w poczet Nekromant�w.
	AI_Output(self,other,"Kdf_404_Xardas_TEACH_Info_15_09");	//Jedynie jako Guru obozu na bagnie ta droga b�dzie dla ciebie zamkni�ta.
};


instance Info_Xardas_RETURN(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_RETURN_Condition;
	information = Info_Xardas_RETURN_Info;
	important = 0;
	permanent = 0;
	description = "Rozmawia�em z szamanem Ork�w.";
};


func int Info_Xardas_RETURN_Condition()
{
	if(UrShak_SpokeOfUluMulu && !EnteredTemple)
	{
		return TRUE;
	};
};

func void Info_Xardas_RETURN_Info()
{
	AI_Output(hero,self,"Info_Xardas_RETURN_15_01");	//Rozmawia�em z szamanem Ork�w.
	AI_Output(self,hero,"Info_Xardas_RETURN_14_02");	//�wietnie! Czego si� dowiedzia�e�?
	AI_Output(hero,self,"Info_Xardas_RETURN_15_03");	//Pi�ciu szaman�w, kt�rzy przywo�ali �ni�cego, wybudowa�o dla niego podziemn� �wi�tyni�. Wej�cie do niej znajduje si� w mie�cie Ork�w.
	AI_Output(self,hero,"Info_Xardas_RETURN_14_04");	//Zgadza si�!
	AI_Output(hero,self,"Info_Xardas_RETURN_15_05");	//Zamiast okaza� wdzi�czno��, �ni�cy wyrwa� ich serca i skaza� ich, oraz wszystkich, kt�rzy pracowali przy budowie na wieczne pot�pienie, zamieniaj�c ich w O�ywie�c�w!
	AI_Output(self,hero,"Info_Xardas_RETURN_14_06");	//Doskonale, doskonale!
	AI_Output(hero,self,"Info_Xardas_RETURN_15_07");	//Orkowie zapiecz�towali wej�cie do �wi�tyni i pr�bowali przeb�aga� demona sk�adaj�c mu ofiary!
	AI_Output(self,hero,"Info_Xardas_RETURN_14_08");	//Znalaz�e� spos�b na dostanie si� do �wi�tyni?
	AI_Output(hero,self,"Info_Xardas_RETURN_15_09");	//Tak, jest pewien Ork, kt�ry...
	AI_Output(self,hero,"Info_Xardas_RETURN_14_10");	//�adnych szczeg��w! Udaj si� do podziemnej �wi�tyni. Tam znajdziesz jedyny spos�b na zniszczenie Bariery!
	AI_Output(hero,self,"Info_Xardas_RETURN_15_11");	//Nic nie rozumiem!
	AI_Output(self,hero,"Info_Xardas_RETURN_14_12");	//Poprosi�e� mnie o pomoc w zniszczeniu Bariery, tak czy nie?!
	AI_Output(hero,self,"Info_Xardas_RETURN_15_13");	//Tak, ale...
	AI_Output(self,hero,"Info_Xardas_RETURN_14_14");	//WI�C ID�! Zmarnowano ju� do�� czasu! Id� do podziemnej �wi�tyni! Tam znajdziesz odpowied�!
	B_Story_ReturnedFromUrShak();
};


instance Info_Xardas_FOUNDTEMPLE(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_FOUNDTEMPLE_Condition;
	information = Info_Xardas_FOUNDTEMPLE_Info;
	important = 0;
	permanent = 0;
	description = "Znalaz�em drog� do podziemnej �wi�tyni!";
};


func int Info_Xardas_FOUNDTEMPLE_Condition()
{
	if(EnteredTemple)
	{
		return TRUE;
	};
};

func void Info_Xardas_FOUNDTEMPLE_Info()
{
	AI_Output(other,self,"Info_Xardas_FOUNDTEMPLE_15_01");	//Znalaz�em drog� do podziemnej �wi�tyni!
	AI_Output(self,other,"Info_Xardas_FOUNDTEMPLE_14_02");	//ZNALAZ�E�... To niesamowite!
	AI_Output(self,other,"Info_Xardas_FOUNDTEMPLE_14_03");	//Sta�e� si� niezwykle pot�ny! Pot�niejszy ni� ktokolwiek wewn�trz Bariery.
	AI_Output(self,other,"Info_Xardas_FOUNDTEMPLE_14_04");	//Mo�e rzeczywi�cie jeste� cz�owiekiem, o kt�rym wspomina proroctwo Ork�w!
};


instance Info_Xardas_PROPHECY(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_PROPHECY_Condition;
	information = Info_Xardas_PROPHECY_Info;
	important = 0;
	permanent = 0;
	description = "Proroctwo? Jakie proroctwo?";
};


func int Info_Xardas_PROPHECY_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_FOUNDTEMPLE))
	{
		return TRUE;
	};
};

func void Info_Xardas_PROPHECY_Info()
{
	AI_Output(other,self,"Info_Xardas_PROPHECY_15_01");	//Proroctwo? Jakie proroctwo?
	AI_Output(self,other,"Info_Xardas_PROPHECY_14_02");	//Prastare manuskrypty Ork�w, spisane tu� po zamkni�ciu �wi�tyni, wspominaj� o "�wi�tym Nieprzyjacielu".
	AI_Output(other,self,"Info_Xardas_PROPHECY_15_03");	//�wi�tym Nieprzyjacielu?
	AI_Output(self,other,"Info_Xardas_PROPHECY_14_04");	//Kogo�, kto raz na zawsze wyp�dzi �ni�cego z naszego �wiata!
	AI_Output(other,self,"Info_Xardas_PROPHECY_15_05");	//I to ja mam by� t� osob� z przepowiedni?! Mylisz si�! Na pewno si� mylisz!
	AI_Output(self,other,"Info_Xardas_PROPHECY_14_06");	//Mo�e tak... Mo�e nie!
};


instance Info_Xardas_LOADSWORD(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_LOADSWORD_Condition;
	information = Info_Xardas_LOADSWORD_Info;
	important = 0;
	permanent = 0;
	description = "Znalaz�em dziwny miecz.";
};


func int Info_Xardas_LOADSWORD_Condition()
{
	if(Npc_HasItems(hero,Mythrilklinge))
	{
		return TRUE;
	};
};

func void Info_Xardas_LOADSWORD_Info()
{
	AI_Output(other,self,"Info_Xardas_LOADSWORD_15_01");	//Znalaz�em dziwny miecz.
	AI_Output(self,other,"Info_Xardas_LOADSWORD_14_02");	//Poka� mi go.
	CreateInvItem(self,Mythrilklinge01);
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_1HSINSPECT");
	AI_RemoveWeapon(self);
	AI_UnequipWeapons(self);
	AI_Output(self,other,"Info_Xardas_LOADSWORD_14_03");	//Hmm... To ciekawe. Wyryto na nim s�owo "URIZIEL".
	AI_Output(self,other,"Info_Xardas_LOADSWORD_14_04");	//S�ysza�em o tym mieczu. To or� z dawnych lat, kiedy rasa ludzka by�a jeszcze bardzo m�oda.
	AI_Output(self,other,"Info_Xardas_LOADSWORD_14_05");	//Nie wiem z jakiego materia�u go wykuto, ani nawet KTO go wyku�.
	AI_Output(self,other,"Info_Xardas_LOADSWORD_14_06");	//Wed�ug legendy, miecz ma posiada� niezwyk�e moce, ale nie wyczuwam wok� niego magicznej aury!
	Npc_RemoveInvItem(hero,Mythrilklinge);
	CreateInvItem(hero,Mythrilklinge01);
};


instance Info_Xardas_LOADSWORD01(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_LOADSWORD01_Condition;
	information = Info_Xardas_LOADSWORD01_Info;
	important = 0;
	permanent = 0;
	description = "URIZIEL posiada� niezwyk�e moce?";
};


func int Info_Xardas_LOADSWORD01_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_LOADSWORD))
	{
		return TRUE;
	};
};

func void Info_Xardas_LOADSWORD01_Info()
{
	Npc_RemoveInvItem(self,Mythrilklinge01);
	AI_Output(other,self,"Info_Xardas_LOADSWORD01_15_01");	//URIZIEL posiada� niezwyk�e moce?
	AI_Output(self,other,"Info_Xardas_LOADSWORD01_14_02");	//Napisano, �e posiadacz tej broni by� w stanie przebi� najgrubszy pancerz i przezwyci�y� najsilniejsze zakl�cia.
	AI_Output(other,self,"Info_Xardas_LOADSWORD01_15_03");	//W jaki spos�b tak pot�ny or� trafi� w r�ce Ork�w?
	AI_Output(self,other,"Info_Xardas_LOADSWORD01_14_04");	//Pono� Orkowie odebrali go pot�nemu rycerzowi. Nie wiedzieli jak go wykorzysta�, wi�c postanowili go ukry�!
	AI_Output(other,self,"Info_Xardas_LOADSWORD01_15_05");	//Jak wida� - nie do�� dobrze!
};


instance Info_Xardas_LOADSWORD02(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_LOADSWORD02_Condition;
	information = Info_Xardas_LOADSWORD02_Info;
	important = 0;
	permanent = 0;
	description = "Czy jest jaki� spos�b na przywr�cenie tej broni dawnej �wietno�ci?";
};


func int Info_Xardas_LOADSWORD02_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_LOADSWORD01))
	{
		return TRUE;
	};
};

func void Info_Xardas_LOADSWORD02_Info()
{
	AI_Output(other,self,"Info_Xardas_LOADSWORD02_15_01");	//Czy jest jaki� spos�b na przywr�cenie tej broni dawnej �wietno�ci?
	AI_Output(self,other,"Info_Xardas_LOADSWORD02_14_02");	//Nie obejdzie si� bez odpowiednio silnego �r�d�a magii.
	AI_Output(other,self,"Info_Xardas_LOADSWORD02_15_03");	//Masz na my�li �r�d�o wystarczaj�co pot�ne, by wysadzi� w powietrze Magiczn� Barier�?
	AI_Output(self,other,"Info_Xardas_LOADSWORD02_14_04");	//Co� w tym rodzaju...
	AI_Output(self,other,"Info_Xardas_LOADSWORD02_14_05");	//Opr�cz tego potrzebna b�dzie specjalna magiczna formu�a, kt�ra przeka�e ca�� wyzwolon� energi� na miecz.
	AI_Output(self,other,"Info_Xardas_LOADSWORD02_14_06");	//Daj mi troch� czasu na przygotowanie formu�y!
	B_Story_ShowedUrizielToXardas();
};


instance Info_Xardas_BETTERARMOR(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_BETTERARMOR_Condition;
	information = Info_Xardas_BETTERARMOR_Info;
	important = 0;
	permanent = 0;
	description = "W mi�dzyczasie, jak poszukam sobie lepszej zbroi!";
};


func int Info_Xardas_BETTERARMOR_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_LOADSWORD02))
	{
		return TRUE;
	};
};

func void Info_Xardas_BETTERARMOR_Info()
{
	var C_Item armor;
	var int armorInstance;
	AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_01");	//W mi�dzyczasie, jak poszukam sobie lepszej zbroi!
	armor = Npc_GetEquippedArmor(hero);
	armorInstance = Hlp_GetInstanceID(armor);
	if(armorInstance == crw_armor_h)
	{
		AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_02");	//Te posklecane w napr�dce pancerze pe�zaczy s� zbyt g�sto podziurawione po wyprawie do podziemnej �wi�tyni!
	}
	else if((armorInstance == kdw_armor_h) || (armorInstance == kdw_armor_l))
	{
		AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_03");	//Te niebieskie szmatki nie zapewni�y mi zbyt wielkiej ochrony w podziemnej �wi�tyni!
	}
	else
	{
		AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_04");	//O�ywie�cy porz�dnie podziurawili m�j stary pancerz.
	};
	AI_Output(self,other,"Info_Xardas_BETTERARMOR_14_05");	//Powiniene� zajrze� do mojej starej wie�y.
	AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_06");	//Twojej starej wie�y?
	AI_Output(self,other,"Info_Xardas_BETTERARMOR_14_07");	//Podczas trz�sienia ziemi poch�on�o j� jedno ze wschodnich jezior. Jej szczyt powinien nadal wystawa� nad poziom wody.
	AI_Output(self,other,"Info_Xardas_BETTERARMOR_14_08");	//Wewn�trz zosta�o kilka cennych artefakt�w. Nigdy nie zada�em sobie trudu, by je odzyska�.
	AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_09");	//Jak si� tam dostan�?
	AI_Output(self,other,"Info_Xardas_BETTERARMOR_14_10");	//Nie zagl�da�em tam od trz�sienia ziemi, wi�c sam b�dziesz musia� poszuka� drogi do �rodka.
	AI_Output(self,other,"Info_Xardas_BETTERARMOR_14_11");	//We� ten klucz. Otwiera skrzyni�, w kt�rej przechowywa�em szczeg�lnie cenne artefakty.
	B_Story_ExploreSunkenTower();
};


instance Info_Xardas_OREARMOR(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_OREARMOR_Condition;
	information = Info_Xardas_OREARMOR_Info;
	important = 1;
	permanent = 0;
};


func int Info_Xardas_OREARMOR_Condition()
{
	if(Npc_HasItems(hero,ore_armor_m) || Npc_HasItems(hero,ore_armor_h))
	{
		return TRUE;
	};
};

func void Info_Xardas_OREARMOR_Info()
{
	var C_Item armor;
	var int armorInstance;
	armor = Npc_GetEquippedArmor(hero);
	armorInstance = Hlp_GetInstanceID(armor);
	if((armorInstance == ore_armor_m) || (armorInstance == ore_armor_h))
	{
		AI_Output(self,other,"Info_Xardas_OREARMOR_14_01");	//Ach, jak widz� nosisz zbroj� runiczn�, wykonan� z magicznej rudy!
	}
	else
	{
		AI_Output(self,other,"Info_Xardas_OREARMOR_14_02");	//Jak widz�, znalaz�e� zbroj� runiczn�, wykonan� z magicznej rudy!
	};
	AI_Output(other,self,"Info_Xardas_OREARMOR_15_03");	//Znalaz�em j� w zatopionej wie�y, w jednej z tych starych skrzy�.
	AI_Output(self,other,"Info_Xardas_OREARMOR_14_04");	//Nale�a�a kiedy� do tego samego genera�a, kt�ry dzier�y� URIZIEL w bitwie z Orkami.
	AI_Output(other,self,"Info_Xardas_OREARMOR_15_05");	//Mam tylko nadziej�, �e przyniesie mi troch� wi�cej szcz�cia ni� jemu!
};


instance Info_Xardas_FORMULA(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_FORMULA_Condition;
	information = Info_Xardas_FORMULA_Info;
	important = 0;
	permanent = 0;
	description = "Przygotowa�e� ju� formu��, kt�ra przywr�ci URIZIELOWI jego dawn� moc?";
};


func int Info_Xardas_FORMULA_Condition()
{
	if(Npc_HasItems(hero,ore_armor_m) || Npc_HasItems(hero,ore_armor_h) || Npc_HasItems(hero,ItArRuneTeleport1))
	{
		return TRUE;
	};
};

func void Info_Xardas_FORMULA_Info()
{
	AI_Output(other,self,"Info_Xardas_FORMULA_15_01");	//Przygotowa�e� ju� formu��, kt�ra przywr�ci URIZIELOWI jego dawn� moc?
	AI_Output(self,other,"Info_Xardas_FORMULA_14_02");	//Tak, wszystko gotowe. Ale sam nie dasz rady jej u�y�.
	AI_Output(other,self,"Info_Xardas_FORMULA_15_03");	//Dlaczego nie?
	AI_Output(self,other,"Info_Xardas_FORMULA_14_04");	//B�dziesz musia� dotkn�� mieczem �r�d�a mocy magicznej. Dok�adnie w tej samej chwili jaki� mag musi wypowiedzie� formu��.
	AI_Output(other,self,"Info_Xardas_FORMULA_15_05");	//Zatem musz� sobie poszuka� kogo� do pomocy!
	AI_Output(self,other,"Info_Xardas_FORMULA_14_06");	//We� formu�� i przywr�� URIZIEL do jego dawnej �wietno�ci. B�dzie ci wkr�tce potrzebny!
	B_Story_LoadSword();
};


instance Info_Xardas_ALTRUNE(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_ALTRUNE_Condition;
	information = Info_Xardas_ALTRUNE_Info;
	important = 0;
	permanent = 0;
	description = "Jestem magiem. Nie wiem, czy potrafi� pos�ugiwa� si� mieczem takim jak URIZIEL!";
};


func int Info_Xardas_ALTRUNE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_FORMULA) && ((Npc_GetTrueGuild(hero) == GIL_KDW) || (Npc_GetTrueGuild(hero) == GIL_DMB) || (Npc_GetTrueGuild(hero) == GIL_GUR) || (oldHeroGuild == GIL_KDF)))
	{
		return TRUE;
	};
};

func void Info_Xardas_ALTRUNE_Info()
{
	AI_Output(other,self,"Info_Xardas_ALTRUNE_15_01");	//Jestem magiem. Nie wiem, czy potrafi� pos�ugiwa� si� mieczem takim jak URIZIEL!
	AI_Output(self,other,"Info_Xardas_ALTRUNE_14_02");	//Jest na to spos�b...
	AI_Output(self,other,"Info_Xardas_ALTRUNE_14_03");	//Ale najpierw na�aduj miecz magiczn� energi�. Wr�� jak najszybciej!
};


instance Info_Xardas_SWORDLOADED(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_SWORDLOADED_Condition;
	information = Info_Xardas_SWORDLOADED_Info;
	important = 0;
	permanent = 0;
	description = "Uda�o mi si�! URIZIEL zn�w posiada magiczn� aur�!";
};


func int Info_Xardas_SWORDLOADED_Condition()
{
	if(Npc_HasItems(hero,Mythrilklinge02))
	{
		return TRUE;
	};
};

func void Info_Xardas_SWORDLOADED_Info()
{
	AI_Output(other,self,"Info_Xardas_SWORDLOADED_15_01");	//Uda�o mi si�! URIZIEL zn�w posiada magiczn� aur�!
	AI_Output(self,other,"Info_Xardas_SWORDLOADED_14_02");	//Niesamowite! Miecz odzyska� sw� dawn� moc! Dysponujesz teraz nie lada or�em!
	Wld_InsertItem(ItArScrollTeleport4,"OW_ORC_SHAMAN_ROOM2");
};


instance Info_Xardas_MAKERUNE(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_MAKERUNE_Condition;
	information = Info_Xardas_MAKERUNE_Info;
	important = 0;
	permanent = 0;
	description = "Powiedzia�e�, �e b�d� m�g� pos�ugiwa� si� tym mieczem mimo, i� jestem magiem?";
};


func int Info_Xardas_MAKERUNE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_ALTRUNE) && Npc_KnowsInfo(hero,Info_Xardas_SWORDLOADED))
	{
		return TRUE;
	};
};

func void Info_Xardas_MAKERUNE_Info()
{
	AI_Output(other,self,"Info_Xardas_MAKERUNE_15_01");	//Powiedzia�e�, �e b�d� m�g� pos�ugiwa� si� tym mieczem mimo, i� jestem magiem?
	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_02");	//Przyjrzyj si� mu uwa�nie. Zauwa�y�e� zapewne ten du�y, b��kitny klejnot zatopiony w ostrzu.
	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_03");	//Ca�a energia magiczna miecza skumulowana jest w�a�nie tutaj.
	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_04");	//Je�li usun� klejnot, b�d� m�g� stworzy� magiczn� run� posiadaj�c� wszystkie te cechy, kt�re czyni� URIZIEL tak szczeg�lnym or�em.
	AI_Output(other,self,"Info_Xardas_MAKERUNE_15_05");	//Magiczna runa stworzona z URIZIEL?
	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_06");	//W bitwie ta runa b�dzie r�wnie niebezpieczna co sam miecz!
	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_07");	//Ale nie zapominaj, �e jedynie mag Sz�stego Kr�gu mo�e zapanowa� nad tak pot�n� magi�!
};


instance Info_Xardas_MAKERUNEDOIT(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_MAKERUNEDOIT_Condition;
	information = Info_Xardas_MAKERUNEDOIT_Info;
	important = 0;
	permanent = 1;
	description = "Chc�, �eby� usun�� klejnot z URIZIEL!";
};


func int Info_Xardas_MAKERUNEDOIT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_MAKERUNE) && Npc_HasItems(hero,Mythrilklinge02))
	{
		return TRUE;
	};
};

func void Info_Xardas_MAKERUNEDOIT_Info()
{
	AI_Output(other,self,"Info_Xardas_MAKERUNEDOIT_15_01");	//Chc�, �eby� usun�� klejnot z URIZIEL!
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) < 6)
	{
		AI_Output(self,other,"Info_Xardas_MAKERUNEDOIT_14_02");	//Ale nie opanowa�e� jeszcze magii Sz�stego Kr�gu!
	};
	AI_Output(self,other,"Info_Xardas_MAKERUNEDOIT_14_03");	//Od tej decyzji nie ma odwrotu. Jeste� pewien, �e chcesz abym usun�� klejnot?
	Info_ClearChoices(Info_Xardas_MAKERUNEDOIT);
	Info_AddChoice(Info_Xardas_MAKERUNEDOIT,"TAK, zr�b to!",Info_Xardas_MAKERUNE_YES);
	Info_AddChoice(Info_Xardas_MAKERUNEDOIT,"Nie, nie chc�!",Info_Xardas_MAKERUNE_NO);
};

func void Info_Xardas_MAKERUNE_YES()
{
	Info_ClearChoices(Info_Xardas_MAKERUNEDOIT);
	AI_Output(other,self,"Info_Xardas_MAKERUNEDOIT_15_04");	//TAK, zr�b to!
	AI_Output(self,other,"Info_Xardas_MAKERUNEDOIT_14_05");	//Je�li tego w�a�nie chcesz... Prosz�, oto miecz i runa!
	Npc_RemoveInvItem(hero,Mythrilklinge02);
	CreateInvItems(self,UrizielRune,2);
	B_GiveInvItems(self,hero,UrizielRune,2);
	Npc_RemoveInvItem(hero,UrizielRune);
	CreateInvItem(hero,Mythrilklinge03);
	B_LogEntry(CH5_Uriziel,"Xardas usun�� magiczny kryszta� z Uriziela. Magiczna moc tego miecza spoczywa teraz w magicznej runie.");
	Log_SetTopicStatus(CH5_Uriziel,LOG_SUCCESS);
};

func void Info_Xardas_MAKERUNE_NO()
{
	Info_ClearChoices(Info_Xardas_MAKERUNEDOIT);
	AI_Output(other,self,"Info_Xardas_MAKERUNEDOIT_15_06");	//Nie, nie chc�!
	AI_Output(self,other,"Info_Xardas_MAKERUNEDOIT_14_07");	//Jak sobie �yczysz. Ostrze zachowa sw� magiczn� moc!
};


instance Info_Xardas_LOADSWORD09(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_LOADSWORD09_Condition;
	information = Info_Xardas_LOADSWORD09_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_LearnMage_6,LPCOST_TALENT_MAGE_6,0);
};


func int Info_Xardas_LOADSWORD09_Condition()
{
	if((EnteredTemple && Npc_KnowsInfo(hero,kdf_404_xardas_teach) && (Npc_GetTrueGuild(hero) == GIL_KDW)) || ((oldHeroGuild == GIL_KDF) && EnteredTemple && Npc_KnowsInfo(hero,kdf_404_xardas_teach) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5)))
	{
		return TRUE;
	};
};

func void Info_Xardas_LOADSWORD09_Info()
{
	AI_Output(other,self,"Info_Xardas_LOADSWORD09_15_01");	//Mo�esz mnie czego� nauczy�?
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5)
	{
		if(B_GiveSkill(other,NPC_TALENT_MAGE,6,LPCOST_TALENT_MAGE_6))
		{
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_02");	//Wprowadz� ci� w Sz�sty Kr�g Magii.
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_03");	//Pami�taj, �e to przywilej zarezerwowany wy��cznie dla najbieglejszych mag�w. Mog� do niego przyst�pi� ci, kt�rych ca�e �ycie jest znakiem.
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_04");	//Twoim znakiem jest zjednoczenie element�w.
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_05");	//Sz�sty Kr�g pozwala ci wykorzystywa� magi� dowolnej runy.
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_06");	//I nie zapomnij: twoim zadaniem jest s�u�y� pot�dze magii, a nie j� wykorzystywa�.
			CreateInvItem(hero,dmb_armor_m);
			AI_EquipBestArmor(hero);
			CreateInvItem(self,ItAmArrow);
			B_GiveInvItems(self,hero,ItAmArrow,1);
			Npc_RemoveInvItem(hero,ItAmArrow);
			Mdl_ApplyOverlayMds(hero,"Humans_Mage.mds");
			hero.guild = GIL_DMB;
			Npc_SetTrueGuild(hero,GIL_DMB);
			Info_Xardas_LOADSWORD09.permanent = 0;
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_07");	//Jeszcze nie. Jeste� zdolny, ale brak ci niezb�dnego do�wiadczenia. Niech Saturas popracuje nad tob� przez jaki� czas. Wtedy zobaczymy.
		AI_StopProcessInfos(self);
	};
};


var int learned_fivecircle;

instance INFO_XARDAS_LOADSWORDGUR(C_Info)
{
	npc = KDF_404_Xardas;
	condition = info_xardas_loadswordgur_condition;
	information = info_xardas_loadswordgur_info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_LearnMage_5,LPCOST_TALENT_MAGE_5,0);
};


var int lrn5circle;

func int info_xardas_loadswordgur_condition()
{
	if((EnteredTemple && Npc_KnowsInfo(hero,kdf_404_xardas_teach) && (lrn5circle == FALSE) && (Npc_GetTrueGuild(hero) == GIL_GUR)) || (EnteredTemple && Npc_KnowsInfo(hero,kdf_404_xardas_teach) && (oldHeroGuild == GIL_KDF)) || (EnteredTemple && Npc_KnowsInfo(hero,kdf_404_xardas_teach) && (oldHeroGuild == GIL_KDW)))
	{
		return TRUE;
	};
};

func void info_xardas_loadswordgur_info()
{
	AI_Output(other,self,"Info_Xardas_LOADSWORDGUR_15_01");	//Mo�esz mnie czego� nauczy�?
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4)
	{
		if(B_GiveSkill(other,NPC_TALENT_MAGE,5,LPCOST_TALENT_MAGE_5))
		{
			AI_Output(self,other,"Info_Xardas_LOADSWORDGUR_14_02");	//Dobrze. Wprowadz� ci� w arkana Pi�tego Kr�gu Magii.
			AI_Output(self,other,"Info_Xardas_LOADSWORDGUR_14_03");	//Od tej pory b�dziesz m�g� wykorzystywa� magiczne runy zakl�� Ognistej Burzy i Lodowej Fali oraz posi�dziesz moc niszczenia O�ywie�c�w.
			AI_Output(self,other,"Info_Xardas_LOADSWORDGUR_14_04");	//Jednak najpot�niejszym zakl�ciem Pi�tego Kr�gu Magii jest Tchnienie �mierci. Gdyby uda�o ci si� kiedy� odnale�� t� run�, dysponowa�by� niewyobra�aln� moc�.
			AI_Output(self,other,"Info_Xardas_LOADSWORDGUR_14_06");	//Poznaj granice swoich mo�liwo�ci, a poznasz samego siebie.
			learned_fivecircle = TRUE;
			lrn5circle = TRUE;
			info_xardas_loadswordgur.permanent = 0;
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other,"Info_Xardas_LOADSWORDGUR_14_07");	//Najpierw powiniene� m�c si� zapozna� z magi� czwartego kr�gu. Dopiero wtedy b�d� m�g� ci pom�c.
		AI_StopProcessInfos(self);
	};
};


instance INFO_XARDAS_LOADSWORDGUR2(C_Info)
{
	npc = KDF_404_Xardas;
	condition = info_xardas_loadswordgur2_condition;
	information = info_xardas_loadswordgur2_info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_LearnMage_6,LPCOST_TALENT_MAGE_6,0);
};


var int lrn6circle;

func int info_xardas_loadswordgur2_condition()
{
	if(EnteredTemple && (Npc_GetTrueGuild(hero) == GIL_GUR) && (LRN6CIRCLE == FALSE) && Npc_KnowsInfo(hero,kdf_404_xardas_teach) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5))
	{
		return TRUE;
	};
};

func void info_xardas_loadswordgur2_info()
{
	AI_Output(other,self,"Info_Xardas_LOADSWORD09_15_01");	//Mo�esz mnie czego� nauczy�?
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5)
	{
		if(B_GiveSkill(other,NPC_TALENT_MAGE,6,LPCOST_TALENT_MAGE_6))
		{
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_02");	//Wprowadz� ci� w Sz�sty Kr�g Magii.
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_03");	//Pami�taj, �e to przywilej zarezerwowany wy��cznie dla najbieglejszych mag�w. Mog� do niego przyst�pi� ci, kt�rych ca�e �ycie jest znakiem.
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_04");	//Twoim znakiem jest zjednoczenie element�w.
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_05");	//Sz�sty Kr�g pozwala ci wykorzystywa� magi� dowolnej runy.
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_06");	//I nie zapomnij: twoim zadaniem jest s�u�y� pot�dze magii, a nie j� wykorzystywa�.
			info_xardas_loadswordgur2.permanent = 0;
			LRN6CIRCLE = TRUE;
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other,"Info_Xardas_LOADSWORDGUR_14_87");	//Najpierw opanuj magi� pi�tego kr�gu. Dopiero wtedy b�d� m�g� dalej z tob� popracowa�.
		AI_StopProcessInfos(self);
	};
};


instance INFO_XARDAS_ARMOR(C_Info)
{
	npc = KDF_404_Xardas;
	condition = info_xardas_armor_condition;
	information = info_xardas_armor_info;
	important = 0;
	permanent = 0;
	description = "Potrafi�by� wzmocni� moje szaty?";
};


func int info_xardas_armor_condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_DISTURB))
	{
		return TRUE;
	};
};

func void info_xardas_armor_info()
{
	AI_Output(other,self,"Info_Xardas_ARMOR_15_01");	//Potrafi�by� wzmocni� moje szaty?
	AI_Output(self,other,"Info_Xardas_ARMOR_14_02");	//Po prawdzie, to tak - m�g�bym spr�bowa�. Jednak musia�by� mi przynie�� odpowiedni� szat�.
	AI_Output(self,other,"Info_Xardas_ARMOR_14_03");	//Ponadto mo�liwe b�dzie to tylko przy szatach, na kt�rych skupia si� symbol okre�lonej magii.
	AI_Output(self,other,"Info_Xardas_ARMOR_14_04");	//Jak zapewne wiesz, tyczy si� to magii Ognia, magii Wody, magii �ni�cego oraz magii Demon�w. Dlatego te� b�dziesz musia� wybra� jedn�, jedyn� s�uszn� drog� dla siebie.
	AI_Output(self,other,"Info_Xardas_ARMOR_14_05");	//Zatem przynie� mi albo zdobion� szat� Ognia, zdobion� szat� Wody, szat� Guru albo szat� Mrocznych Sztuk.
	AI_Output(self,other,"Info_Xardas_ARMOR_14_06");	//Je�li b�dziesz mia� przy sobie do�� rudy, to b�d� w stanie wzmocni� wybran� przez ciebie szat�.
};


instance INFO_XARDAS_CRAFT_WHICH(C_Info)
{
	npc = KDF_404_Xardas;
	nr = 9;
	condition = info_xardas_craft_which_condition;
	information = info_xardas_craft_which_info;
	important = 0;
	permanent = 1;
	description = "Wzmocnij me szaty.";
};


func int info_xardas_craft_which_condition()
{
	if(Npc_KnowsInfo(hero,info_xardas_armor))
	{
		return TRUE;
	};
};

func void info_xardas_craft_which_info()
{
	AI_Output(hero,self,"Info_Xardas_CRAFT_WHICH_15_01");	//Wzmocnij me szaty.
	AI_Output(self,hero,"Info_Xardas_CRAFT_WHICH_09_02");	//Kt�r� konkretnie sobie �yczysz?
	Info_ClearChoices(info_xardas_craft_which);
	Info_AddChoice(info_xardas_craft_which,DIALOG_BACK,info_xardas_craft_which_back);
	if(Npc_HasItems(other,dmb_armor_m) >= 1)
	{
		Info_AddChoice(info_xardas_craft_which,"Wzmocniona szata Mrocznych Sztuk (1300 bry�ek)",info_xardas_craft_which_dmb);
	};
	if(Npc_HasItems(other,gur_armor_m) >= 1)
	{
		Info_AddChoice(info_xardas_craft_which,"Mroczna szata Guru (1300 bry�ek)",info_xardas_craft_which_gur);
	};
	if(Npc_HasItems(other,kdf_armor_h) >= 1)
	{
		Info_AddChoice(info_xardas_craft_which,"Wzmocniona zdobiona szata Ognia (1300 bry�ek)",info_xardas_craft_which_kdf);
	};
	if(Npc_HasItems(other,kdw_armor_h) >= 1)
	{
		Info_AddChoice(info_xardas_craft_which,"Wzmocniona zdobiona szata Wody (1300 bry�ek)",info_xardas_craft_which_kdw);
	};
};

func void info_xardas_craft_which_back()
{
	Info_ClearChoices(info_xardas_craft_which);
};

func void info_xardas_craft_which_dmb()
{
	AI_Output(other,self,",	Info_Xardas_CRAFT_WHICH_Xardas_55_01");	//Chcia�bym, aby� wzmocni� moj� szat� Mrocznych Sztuk.
	if((Npc_HasItems(other,dmb_armor_m) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 1300))
	{
		AI_Output(self,other,",	Info_Xardas_CRAFT_WHICH_Xardas_55_02");	//W porz�dku, daj mi j�.
		AI_Output(self,other,",	Info_Xardas_CRAFT_WHICH_Xardas_55_04");	//I poczekaj chwil�, a� sko�cz�.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,ItMiNugget,1300);
		Npc_RemoveInvItem(hero,dmb_armor_m);
		CreateInvItem(hero,dmb_armor_m_upgrade);
		AI_EquipBestArmor(hero);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		AI_Output(self,other,",	Info_Xardas_CRAFT_WHICH_Xardas_55_05");	//I prosz�. Oto twoja wzmocniona szata Mrocznych Sztuk.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Xardas_CRAFT_WHICH_Xardas_15_02");	//Potrzeba mi b�dzie do tego wi�cej rudy, bym m�g� umocni� t� szat�.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_xardas_craft_which);
	};
};

func void info_xardas_craft_which_gur()
{
	AI_Output(other,self,",	Info_Xardas_CRAFT_GUR_Xardas_55_01");	//Chcia�bym, aby� wzmocni� moj� szat� Guru.
	if((Npc_HasItems(other,gur_armor_m) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 1300))
	{
		AI_Output(self,other,",	Info_Xardas_CRAFT_GUR_Xardas_55_02");	//W porz�dku, daj mi j�.
		AI_Output(self,other,",	Info_Xardas_CRAFT_GUR_Xardas_55_04");	//I poczekaj chwil�, a� sko�cz�.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,gur_armor_m,1);
		B_GiveInvItems(hero,self,ItMiNugget,1300);
		Npc_RemoveInvItem(self,dmb_armor_m);
		CreateInvItem(self,gur_armor_m_upgrade);
		B_GiveInvItems(self,hero,gur_armor_m_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Xardas_CRAFT_GUR_Xardas_55_05");	//I prosz�. Oto twoja wzmocniona szata Guru.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Xardas_CRAFT_WHICH_GUR_15_02");	//Potrzeba mi b�dzie do tego wi�cej rudy, bym m�g� umocni� t� szat�.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_xardas_craft_which);
	};
};

func void info_xardas_craft_which_kdf()
{
	AI_Output(other,self,",	Info_Xardas_CRAFT_KDF_Xardas_55_01");	//Chcia�bym, aby� wzmocni� moj� zdobion� szat� Ognia.
	if((Npc_HasItems(other,kdf_armor_h) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 1300))
	{
		AI_Output(self,other,",	Info_Xardas_CRAFT_KDF_Xardas_55_02");	//W porz�dku, daj mi j�.
		AI_Output(self,other,",	Info_Xardas_CRAFT_KDF_Xardas_55_04");	//I poczekaj chwil�, a� sko�cz�.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,kdf_armor_h,1);
		B_GiveInvItems(hero,self,ItMiNugget,1300);
		Npc_RemoveInvItem(self,kdf_armor_h);
		CreateInvItem(self,kdf_armor_h_upgrade);
		B_GiveInvItems(self,hero,kdf_armor_h_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Xardas_CRAFT_KDF_Xardas_55_05");	//I prosz�. Oto twoja wzmocniona zdobiona szata Ognia.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Xardas_CRAFT_WHICH_KDF_15_02");	//Potrzeba mi b�dzie do tego wi�cej rudy, bym m�g� umocni� t� szat�.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_xardas_craft_which);
	};
};

func void info_xardas_craft_which_kdw()
{
	AI_Output(other,self,",	Info_Xardas_CRAFT_KDW_Xardas_55_01");	//Chcia�bym, aby� wzmocni� moj� zdobion� szat� Wody.
	if((Npc_HasItems(other,kdw_armor_h) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 1300))
	{
		AI_Output(self,other,",	Info_Xardas_CRAFT_KDW_Xardas_55_02");	//W porz�dku, daj mi j�.
		AI_Output(self,other,",	Info_Xardas_CRAFT_KDW_Xardas_55_04");	//I poczekaj chwil�, a� sko�cz�.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,kdw_armor_h,1);
		B_GiveInvItems(hero,self,ItMiNugget,1300);
		Npc_RemoveInvItem(self,kdw_armor_h);
		CreateInvItem(self,kdw_armor_h_upgrade);
		B_GiveInvItems(self,hero,kdw_armor_h_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Xardas_CRAFT_KDW_Xardas_55_05");	//I prosz�. Oto twoja wzmocniona zdobiona szata Wody.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Xardas_CRAFT_WHICH_KDW_15_02");	//Potrzeba mi b�dzie do tego wi�cej rudy, bym m�g� umocni� t� szat�.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_xardas_craft_which);
	};
};


instance info_xardas_leavetower(C_Info)
{
	npc = KDF_404_Xardas;
	condition = info_xardas_leavetower_condition;
	information = info_xardas_leavetower_info;
	important = 0;
	permanent = 1;
	description = "Tak w�a�ciwie, to jak zejd� na d�?";
};


func int info_xardas_leavetower_condition()
{
	return TRUE;
};

func void info_xardas_leavetower_info()
{
	AI_Output(hero,self,"Info_Xardas_LeaveTower_15_01");	//Tak w�a�ciwie, to jak zejd� na d�?
	AI_Output(self,hero,"Info_Xardas_LeaveTower_14_02");	//T� sam� drog�, kt�r� przyszed�e�. Zamknij oczy.
	Info_ClearChoices(info_xardas_leavetower);
	Info_AddChoice(info_xardas_leavetower,"Jestem got�w. (Teleportacja do wej�cia)",info_xardas_leavetower_yes);
	Info_AddChoice(info_xardas_leavetower,"Czekaj, rozmy�li�em si�.",info_xardas_leavetower_no);
};

func void info_xardas_leavetower_yes()
{
	Info_ClearChoices(info_xardas_leavetower);
	AI_Output(hero,self,"Info_Xardas_LeaveTower_15_03");	//Jestem got�w.
	AI_StopProcessInfos(self);
	AI_Teleport(hero,"DT_E1_06");
	Wld_PlayEffect("SPELLFX_TELEPORT",hero,hero,0,0,0,FALSE);
};

func void info_xardas_leavetower_no()
{
	Info_ClearChoices(info_xardas_leavetower);
	AI_Output(hero,self,"Info_Xardas_LeaveTower_15_04");	//Czekaj, rozmy�li�em si�.
	AI_Output(self,hero,"Info_Xardas_LeaveTower_14_05");	//Marnujesz tylko m�j czas.
};

