
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
	AI_Output(self,hero,"Info_Xardas_DISTURB_14_01");	//KTO åMIE PRZESZKADZA∆ MI W MOICH STUDIACH?
	AI_Output(hero,self,"Info_Xardas_DISTURB_15_02");	//Nazywam siÍ...
	AI_Output(self,hero,"Info_Xardas_DISTURB_14_03");	//Nie interesuje mnie twoje imiÍ. To nieistotne.
	AI_Output(self,hero,"Info_Xardas_DISTURB_14_04");	//Liczy siÍ tylko to, øe jesteú pierwszπ osobπ od wielu lat, ktÛrej uda≥o siÍ rozwiπzaÊ zagadkÍ GolemÛw.
};


instance Info_Xardas_OTHERS(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_OTHERS_Condition;
	information = Info_Xardas_OTHERS_Info;
	important = 0;
	permanent = 0;
	description = "Czy ktoú jeszcze tu zaglπda≥?";
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
	AI_Output(hero,self,"Info_Xardas_OTHERS_15_01");	//Czy ktoú jeszcze tu zaglπda≥?
	AI_Output(self,hero,"Info_Xardas_OTHERS_14_02");	//Bardzo rzadko. Zwykle szybko zaczynali mnie irytowaÊ i nasy≥a≥em na nich ktÛrπú z moich magicznych istot.
	AI_Output(hero,self,"Info_Xardas_OTHERS_15_03");	//Wolisz wieúÊ øywot samotnika, czyø nie?
};


instance Info_Xardas_SATURAS(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_SATURAS_Condition;
	information = Info_Xardas_SATURAS_Info;
	important = 0;
	permanent = 0;
	description = "Przysy≥a mnie Saturas. Potrzebujemy twojej pomocy!";
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
	AI_Output(hero,self,"Info_Xardas_SATURAS_15_01");	//Przysy≥a mnie Saturas. Potrzebujemy twojej pomocy!
	AI_Output(hero,self,"Info_Xardas_SATURAS_15_02");	//Magowie Wody zamierzajπ zrobiÊ uøytek ze swojego kopca rudy.
	AI_Output(self,hero,"Info_Xardas_SATURAS_14_03");	//Detonacja wielkiej gÛry nie jest øadnym rozwiπzaniem!
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
	description = "Wszyscy Magowie Ognia zginÍli!";
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
	AI_Output(hero,self,"Info_Xardas_KDW_15_01");	//Wszyscy Magowie Ognia zginÍli!
	AI_Output(hero,self,"Info_Xardas_KDW_15_02");	//Gomez kaza≥ ich zamordowaÊ.
	AI_Output(self,hero,"Info_Xardas_KDW_14_03");	//Nie powiem, øebym by≥ szczegÛlnie zaskoczony. Tym durnym barbarzyÒcom z zamku - z Gomezem na czele - nigdy nie moøna by≥o ufaÊ.
	AI_Output(self,hero,"Info_Xardas_KDW_14_04");	//Pomagajπc Gomezowi w objÍciu w≥adzy, Corristo i inni sami kopali sobie grÛb.
};


instance Info_Xardas_SLEEPER(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_SLEEPER_Condition;
	information = Info_Xardas_SLEEPER_Info;
	important = 0;
	permanent = 0;
	description = "Tak zwany 'åniπcy' okaza≥ siÍ ponoÊ potÍønym demonem zag≥ady.";
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
	AI_Output(hero,self,"Info_Xardas_SLEEPER_15_01");	//Tak zwany "åniπcy" okaza≥ siÍ ponoÊ potÍønym demonem zag≥ady.
	AI_Output(hero,self,"Info_Xardas_SLEEPER_15_02");	//Przekona≥o siÍ o tym Bractwo z obozu na bagnie.
	AI_Output(hero,self,"Info_Xardas_SLEEPER_15_03");	//Magowie Wody uwaøajπ teraz, øe ca≥a kolonia znalaz≥a siÍ w úmiertelnym niebezpieczeÒstwie.
	AI_Output(self,hero,"Info_Xardas_SLEEPER_14_04");	//Stoimy przed powaøniejszym zagroøeniem niø ktokolwiek wewnπtrz Bariery jest w stanie sobie wyobraziÊ...
};


instance Info_Xardas_DANGER(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_DANGER_Condition;
	information = Info_Xardas_DANGER_Info;
	important = 0;
	permanent = 0;
	description = "Jeúli detonacja kopca rudy nie wystarczy, by zaøegnaÊ niebezpieczeÒstwo...";
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
	AI_Output(hero,self,"Info_Xardas_DANGER_15_01");	//Jeúli detonacja kopca rudy nie wystarczy, by zaøegnaÊ niebezpieczeÒstwo...
	AI_Output(self,hero,"Info_Xardas_DANGER_14_02");	//...Zapomnij o tym ca≥ym kopcu! Jego potÍga nie wystarczy, by prze≥amaÊ BarierÍ.
	AI_Output(self,hero,"Info_Xardas_DANGER_14_03");	//Gdyby Corristo i Saturas nie tracili cennego czasu na te swoje dziecinne spory, wiedzieliby teraz co naleøy zrobiÊ.
	AI_Output(hero,self,"Info_Xardas_DANGER_15_04");	//A co twoim zdaniem naleøy zrobiÊ?
	AI_Output(self,hero,"Info_Xardas_DANGER_14_05");	//Øaden z dwunastu magÛw nie zada≥ sobie trudu, by zbadaÊ z jakich przyczyn Bariera wymknÍ≥a siÍ spod kontroli, ani dlaczego przybra≥a tak ogromne rozmiary.
};


instance Info_Xardas_BARRIER(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_BARRIER_Condition;
	information = Info_Xardas_BARRIER_Info;
	important = 0;
	permanent = 0;
	description = "A ty wiesz, co siÍ sta≥o, tak?";
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
	AI_Output(hero,self,"Info_Xardas_BARRIER_15_01");	//A ty wiesz, co siÍ sta≥o, tak?
	AI_Output(self,hero,"Info_Xardas_BARRIER_14_02");	//CÛø, jedno jest pewne: odpowiedü spoczywa ukryta g≥Íboko pod miastem OrkÛw.
	AI_Output(hero,self,"Info_Xardas_BARRIER_15_03");	//Miastem OrkÛw?
	AI_Output(self,hero,"Info_Xardas_BARRIER_14_04");	//Orkowie to nie zwierzÍta, choÊ wielu ludzi tak w≥aúnie myúli. Ich kultura dorÛwnuje wiekiem naszej.
	AI_Output(self,hero,"Info_Xardas_BARRIER_14_05");	//Wiele stuleci temu, piÍciu orkowych szamanÛw przywo≥a≥o do tego úwiata potÍønego demona, ktÛry mia≥ im pomÛc zdominowaÊ pozosta≥e klany.
	AI_Output(hero,self,"Info_Xardas_BARRIER_15_06");	//Ten demon... To åniπcy, prawda?
	AI_Output(self,hero,"Info_Xardas_BARRIER_14_07");	//Orkowie nadali mu to imiÍ duøo pÛüniej. Ale nie powiem ci dlaczego wybrali tÍ nazwÍ, ani dlaczego tak bardzo siÍ go teraz bojπ!
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
	AI_Output(self,hero,"Info_Xardas_EVENT_14_02");	//MyúlÍ, øe moøesz byÊ... NIE, aby mnie przekonaÊ, musisz wykonaÊ jeszcze jedno zadanie!
	AI_Output(hero,self,"Info_Xardas_EVENT_15_03");	//Jakie zadanie?
	AI_Output(self,hero,"Info_Xardas_EVENT_14_04");	//S≥uchaj uwaønie: Orkowie wygnali z miasta jednego ze swoich szamanÛw.
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
	AI_Output(self,hero,"Info_Xardas_EVENTWHY_14_02");	//Umierajπcy Ork, ktÛrego kaza≥em przes≥uchaÊ moim demonom, nie by≥ w stanie odpowiedzieÊ mi na to pytanie.
};


instance Info_Xardas_EVENTHOW(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_EVENTHOW_Condition;
	information = Info_Xardas_EVENTHOW_Info;
	important = 0;
	permanent = 0;
	description = "Co ten szaman ma wspÛlnego z moim zadaniem?";
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
	AI_Output(hero,self,"Info_Xardas_EVENTHOW_15_01");	//Co ten szaman ma wspÛlnego z moim zadaniem?
	AI_Output(self,hero,"Info_Xardas_EVENTHOW_14_02");	//On opowie ci resztÍ historii zwiπzanej ze åniπcym.
	AI_Output(hero,self,"Info_Xardas_EVENTHOW_15_03");	//Obawiam siÍ, øe Ork nie bÍdzie zbyt chÍtny do zwierzeÒ w mojej obecnoúci!
	AI_Output(self,hero,"Info_Xardas_EVENTHOW_14_04");	//Chcesz øebym ci pomÛg≥, czy nie?
	AI_Output(hero,self,"Info_Xardas_EVENTHOW_15_05");	//Tak, ale...
	AI_Output(self,hero,"Info_Xardas_EVENTHOW_14_06");	//WiÍc nigdy wiÍcej nie kwestionuj tego, co mÛwiÍ!
	AI_Output(self,hero,"Info_Xardas_EVENTHOW_14_07");	//Znajdü tego szamana. Nie pa≥a mi≥oúciπ do swych braci z miasta OrkÛw, wiÍc moøe zgodzi siÍ ciebie wys≥uchaÊ zanim zamieni ciÍ w øywπ pochodniÍ!
	AI_Output(hero,self,"Info_Xardas_EVENTHOW_15_08");	//Bardzo pocieszajπce!
};


instance Info_Xardas_EVENTWHERE(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_EVENTWHERE_Condition;
	information = Info_Xardas_EVENTWHERE_Info;
	important = 0;
	permanent = 0;
	description = "Gdzie znajdÍ tego wygnanego szamana?";
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
	AI_Output(hero,self,"Info_Xardas_EVENTWHERE_15_01");	//Gdzie znajdÍ tego wygnanego szamana?
	AI_Output(self,hero,"Info_Xardas_EVENTWHERE_14_02");	//Idü do starej cytadeli na wschodzie. Na pewno trafisz - znajduje siÍ na szczycie wysokiej gÛry. WidaÊ jπ juø z daleka.
	AI_Output(hero,self,"Info_Xardas_EVENTWHERE_15_03");	//I mogÍ tak po prostu do niej wejúÊ?
	AI_Output(self,hero,"Info_Xardas_EVENTWHERE_14_04");	//MÛwiπ na niπ stara cytadela, choÊ tak naprawdÍ to tylko sterta kamieni. Od wielu dziesiÍcioleci nikt tam nie zaglπda.
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
	AI_Output(self,hero,"Info_Xardas_ACCEPT_14_02");	//MÛj s≥uga da≥ ci juø magicznπ runÍ uaktywniajπcπ pentagram piÍtro niøej.
	AI_Output(self,hero,"Info_Xardas_ACCEPT_14_03");	//W ten sposÛb bÍdziesz mÛg≥ wrÛciÊ do mnie natychmiast po wykonaniu zadania.
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
	description = "PoszukujÍ wiedzy magicznej.";
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
	AI_Output(other,self,"Kdf_404_Xardas_SELLMAGICSTUFF_Info_15_01");	//PoszukujÍ wiedzy magicznej.
	if(xardas_trade == FALSE)
	{
		Log_CreateTopic(GE_TraderOW,LOG_NOTE);
		B_LogEntry(GE_TraderOW,"Nekromanta Xardas handluje magicznymi zaklÍciami, runami oraz miksturami.");
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
	description = "Moøesz mnie czegoú nauczyÊ?";
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
	AI_Output(other,self,"Kdf_404_Xardas_TEACH_Info_15_01");	//Moøesz mnie czegoú nauczyÊ?
	AI_Output(self,other,"Kdf_404_Xardas_TEACH_Info_15_02");	//Podstaw bÍdziesz musia≥ siÍ nauczyÊ w ktÛrymú z obozÛw.
	AI_Output(self,other,"Kdf_404_Xardas_TEACH_Info_15_03");	//BÍdziesz musia≥ siÍ zdecydowaÊ na magiÍ Ognia, Wody, bπdü teø na magiÍ åniπcego.
	AI_Output(self,other,"Kdf_404_Xardas_TEACH_Info_15_04");	//Bez znaczenia jakπ drogÍ magii obierzesz, to nie gra øadnej roli.
	AI_Output(self,other,"Kdf_404_Xardas_TEACH_Info_15_05");	//Kaøda z nich zaprowadzi ciÍ w koÒcu do swojego ostatecznego celu - do szÛstego krÍgu magii.
	AI_Output(self,other,"Kdf_404_Xardas_TEACH_Info_15_06");	//SzÛsty krπg zawiera wiedzÍ na temat mrocznej magii - magii Beliara.
	AI_Output(self,other,"Kdf_404_Xardas_TEACH_Info_15_07");	//NabÍdziesz w ten sposÛb potÍøny zasÛb wiedzy.
	AI_Output(self,other,"Kdf_404_Xardas_TEACH_Info_15_08");	//Naleøπc do MagÛw Ognia lub Wody, szÛsty krπg bÍdzie znaczy≥ dla ciebie tyle, øe wstÍpujesz rÛwnieø w poczet NekromantÛw.
	AI_Output(self,other,"Kdf_404_Xardas_TEACH_Info_15_09");	//Jedynie jako Guru obozu na bagnie ta droga bÍdzie dla ciebie zamkniÍta.
};


instance Info_Xardas_RETURN(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_RETURN_Condition;
	information = Info_Xardas_RETURN_Info;
	important = 0;
	permanent = 0;
	description = "Rozmawia≥em z szamanem OrkÛw.";
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
	AI_Output(hero,self,"Info_Xardas_RETURN_15_01");	//Rozmawia≥em z szamanem OrkÛw.
	AI_Output(self,hero,"Info_Xardas_RETURN_14_02");	//åwietnie! Czego siÍ dowiedzia≥eú?
	AI_Output(hero,self,"Info_Xardas_RETURN_15_03");	//PiÍciu szamanÛw, ktÛrzy przywo≥ali åniπcego, wybudowa≥o dla niego podziemnπ úwiπtyniÍ. Wejúcie do niej znajduje siÍ w mieúcie OrkÛw.
	AI_Output(self,hero,"Info_Xardas_RETURN_14_04");	//Zgadza siÍ!
	AI_Output(hero,self,"Info_Xardas_RETURN_15_05");	//Zamiast okazaÊ wdziÍcznoúÊ, åniπcy wyrwa≥ ich serca i skaza≥ ich, oraz wszystkich, ktÛrzy pracowali przy budowie na wieczne potÍpienie, zamieniajπc ich w OøywieÒcÛw!
	AI_Output(self,hero,"Info_Xardas_RETURN_14_06");	//Doskonale, doskonale!
	AI_Output(hero,self,"Info_Xardas_RETURN_15_07");	//Orkowie zapieczÍtowali wejúcie do úwiπtyni i prÛbowali przeb≥agaÊ demona sk≥adajπc mu ofiary!
	AI_Output(self,hero,"Info_Xardas_RETURN_14_08");	//Znalaz≥eú sposÛb na dostanie siÍ do úwiπtyni?
	AI_Output(hero,self,"Info_Xardas_RETURN_15_09");	//Tak, jest pewien Ork, ktÛry...
	AI_Output(self,hero,"Info_Xardas_RETURN_14_10");	//Øadnych szczegÛ≥Ûw! Udaj siÍ do podziemnej úwiπtyni. Tam znajdziesz jedyny sposÛb na zniszczenie Bariery!
	AI_Output(hero,self,"Info_Xardas_RETURN_15_11");	//Nic nie rozumiem!
	AI_Output(self,hero,"Info_Xardas_RETURN_14_12");	//Poprosi≥eú mnie o pomoc w zniszczeniu Bariery, tak czy nie?!
	AI_Output(hero,self,"Info_Xardas_RETURN_15_13");	//Tak, ale...
	AI_Output(self,hero,"Info_Xardas_RETURN_14_14");	//WI C IDè! Zmarnowano juø doúÊ czasu! Idü do podziemnej úwiπtyni! Tam znajdziesz odpowiedü!
	B_Story_ReturnedFromUrShak();
};


instance Info_Xardas_FOUNDTEMPLE(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_FOUNDTEMPLE_Condition;
	information = Info_Xardas_FOUNDTEMPLE_Info;
	important = 0;
	permanent = 0;
	description = "Znalaz≥em drogÍ do podziemnej úwiπtyni!";
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
	AI_Output(other,self,"Info_Xardas_FOUNDTEMPLE_15_01");	//Znalaz≥em drogÍ do podziemnej úwiπtyni!
	AI_Output(self,other,"Info_Xardas_FOUNDTEMPLE_14_02");	//ZNALAZ£Eå... To niesamowite!
	AI_Output(self,other,"Info_Xardas_FOUNDTEMPLE_14_03");	//Sta≥eú siÍ niezwykle potÍøny! PotÍøniejszy niø ktokolwiek wewnπtrz Bariery.
	AI_Output(self,other,"Info_Xardas_FOUNDTEMPLE_14_04");	//Moøe rzeczywiúcie jesteú cz≥owiekiem, o ktÛrym wspomina proroctwo OrkÛw!
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
	AI_Output(self,other,"Info_Xardas_PROPHECY_14_02");	//Prastare manuskrypty OrkÛw, spisane tuø po zamkniÍciu úwiπtyni, wspominajπ o "åwiÍtym Nieprzyjacielu".
	AI_Output(other,self,"Info_Xardas_PROPHECY_15_03");	//åwiÍtym Nieprzyjacielu?
	AI_Output(self,other,"Info_Xardas_PROPHECY_14_04");	//Kogoú, kto raz na zawsze wypÍdzi åniπcego z naszego úwiata!
	AI_Output(other,self,"Info_Xardas_PROPHECY_15_05");	//I to ja mam byÊ tπ osobπ z przepowiedni?! Mylisz siÍ! Na pewno siÍ mylisz!
	AI_Output(self,other,"Info_Xardas_PROPHECY_14_06");	//Moøe tak... Moøe nie!
};


instance Info_Xardas_LOADSWORD(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_LOADSWORD_Condition;
	information = Info_Xardas_LOADSWORD_Info;
	important = 0;
	permanent = 0;
	description = "Znalaz≥em dziwny miecz.";
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
	AI_Output(other,self,"Info_Xardas_LOADSWORD_15_01");	//Znalaz≥em dziwny miecz.
	AI_Output(self,other,"Info_Xardas_LOADSWORD_14_02");	//Pokaø mi go.
	CreateInvItem(self,Mythrilklinge01);
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_1HSINSPECT");
	AI_RemoveWeapon(self);
	AI_UnequipWeapons(self);
	AI_Output(self,other,"Info_Xardas_LOADSWORD_14_03");	//Hmm... To ciekawe. Wyryto na nim s≥owo "URIZIEL".
	AI_Output(self,other,"Info_Xardas_LOADSWORD_14_04");	//S≥ysza≥em o tym mieczu. To orÍø z dawnych lat, kiedy rasa ludzka by≥a jeszcze bardzo m≥oda.
	AI_Output(self,other,"Info_Xardas_LOADSWORD_14_05");	//Nie wiem z jakiego materia≥u go wykuto, ani nawet KTO go wyku≥.
	AI_Output(self,other,"Info_Xardas_LOADSWORD_14_06");	//Wed≥ug legendy, miecz ma posiadaÊ niezwyk≥e moce, ale nie wyczuwam wokÛ≥ niego magicznej aury!
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
	description = "URIZIEL posiada≥ niezwyk≥e moce?";
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
	AI_Output(other,self,"Info_Xardas_LOADSWORD01_15_01");	//URIZIEL posiada≥ niezwyk≥e moce?
	AI_Output(self,other,"Info_Xardas_LOADSWORD01_14_02");	//Napisano, øe posiadacz tej broni by≥ w stanie przebiÊ najgrubszy pancerz i przezwyciÍøyÊ najsilniejsze zaklÍcia.
	AI_Output(other,self,"Info_Xardas_LOADSWORD01_15_03");	//W jaki sposÛb tak potÍøny orÍø trafi≥ w rÍce OrkÛw?
	AI_Output(self,other,"Info_Xardas_LOADSWORD01_14_04");	//PonoÊ Orkowie odebrali go potÍønemu rycerzowi. Nie wiedzieli jak go wykorzystaÊ, wiÍc postanowili go ukryÊ!
	AI_Output(other,self,"Info_Xardas_LOADSWORD01_15_05");	//Jak widaÊ - nie doúÊ dobrze!
};


instance Info_Xardas_LOADSWORD02(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_LOADSWORD02_Condition;
	information = Info_Xardas_LOADSWORD02_Info;
	important = 0;
	permanent = 0;
	description = "Czy jest jakiú sposÛb na przywrÛcenie tej broni dawnej úwietnoúci?";
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
	AI_Output(other,self,"Info_Xardas_LOADSWORD02_15_01");	//Czy jest jakiú sposÛb na przywrÛcenie tej broni dawnej úwietnoúci?
	AI_Output(self,other,"Info_Xardas_LOADSWORD02_14_02");	//Nie obejdzie siÍ bez odpowiednio silnego ürÛd≥a magii.
	AI_Output(other,self,"Info_Xardas_LOADSWORD02_15_03");	//Masz na myúli ürÛd≥o wystarczajπco potÍøne, by wysadziÊ w powietrze Magicznπ BarierÍ?
	AI_Output(self,other,"Info_Xardas_LOADSWORD02_14_04");	//Coú w tym rodzaju...
	AI_Output(self,other,"Info_Xardas_LOADSWORD02_14_05");	//OprÛcz tego potrzebna bÍdzie specjalna magiczna formu≥a, ktÛra przekaøe ca≥π wyzwolonπ energiÍ na miecz.
	AI_Output(self,other,"Info_Xardas_LOADSWORD02_14_06");	//Daj mi trochÍ czasu na przygotowanie formu≥y!
	B_Story_ShowedUrizielToXardas();
};


instance Info_Xardas_BETTERARMOR(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_BETTERARMOR_Condition;
	information = Info_Xardas_BETTERARMOR_Info;
	important = 0;
	permanent = 0;
	description = "W miÍdzyczasie, jak poszukam sobie lepszej zbroi!";
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
	AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_01");	//W miÍdzyczasie, jak poszukam sobie lepszej zbroi!
	armor = Npc_GetEquippedArmor(hero);
	armorInstance = Hlp_GetInstanceID(armor);
	if(armorInstance == crw_armor_h)
	{
		AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_02");	//Te posklecane w naprÍdce pancerze pe≥zaczy sπ zbyt gÍsto podziurawione po wyprawie do podziemnej úwiπtyni!
	}
	else if((armorInstance == kdw_armor_h) || (armorInstance == kdw_armor_l))
	{
		AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_03");	//Te niebieskie szmatki nie zapewni≥y mi zbyt wielkiej ochrony w podziemnej úwiπtyni!
	}
	else
	{
		AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_04");	//OøywieÒcy porzπdnie podziurawili mÛj stary pancerz.
	};
	AI_Output(self,other,"Info_Xardas_BETTERARMOR_14_05");	//Powinieneú zajrzeÊ do mojej starej wieøy.
	AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_06");	//Twojej starej wieøy?
	AI_Output(self,other,"Info_Xardas_BETTERARMOR_14_07");	//Podczas trzÍsienia ziemi poch≥onÍ≥o jπ jedno ze wschodnich jezior. Jej szczyt powinien nadal wystawaÊ nad poziom wody.
	AI_Output(self,other,"Info_Xardas_BETTERARMOR_14_08");	//Wewnπtrz zosta≥o kilka cennych artefaktÛw. Nigdy nie zada≥em sobie trudu, by je odzyskaÊ.
	AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_09");	//Jak siÍ tam dostanÍ?
	AI_Output(self,other,"Info_Xardas_BETTERARMOR_14_10");	//Nie zaglπda≥em tam od trzÍsienia ziemi, wiÍc sam bÍdziesz musia≥ poszukaÊ drogi do úrodka.
	AI_Output(self,other,"Info_Xardas_BETTERARMOR_14_11");	//Weü ten klucz. Otwiera skrzyniÍ, w ktÛrej przechowywa≥em szczegÛlnie cenne artefakty.
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
		AI_Output(self,other,"Info_Xardas_OREARMOR_14_01");	//Ach, jak widzÍ nosisz zbrojÍ runicznπ, wykonanπ z magicznej rudy!
	}
	else
	{
		AI_Output(self,other,"Info_Xardas_OREARMOR_14_02");	//Jak widzÍ, znalaz≥eú zbrojÍ runicznπ, wykonanπ z magicznej rudy!
	};
	AI_Output(other,self,"Info_Xardas_OREARMOR_15_03");	//Znalaz≥em jπ w zatopionej wieøy, w jednej z tych starych skrzyÒ.
	AI_Output(self,other,"Info_Xardas_OREARMOR_14_04");	//Naleøa≥a kiedyú do tego samego genera≥a, ktÛry dzierøy≥ URIZIEL w bitwie z Orkami.
	AI_Output(other,self,"Info_Xardas_OREARMOR_15_05");	//Mam tylko nadziejÍ, øe przyniesie mi trochÍ wiÍcej szczÍúcia niø jemu!
};


instance Info_Xardas_FORMULA(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_FORMULA_Condition;
	information = Info_Xardas_FORMULA_Info;
	important = 0;
	permanent = 0;
	description = "Przygotowa≥eú juø formu≥Í, ktÛra przywrÛci URIZIELOWI jego dawnπ moc?";
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
	AI_Output(other,self,"Info_Xardas_FORMULA_15_01");	//Przygotowa≥eú juø formu≥Í, ktÛra przywrÛci URIZIELOWI jego dawnπ moc?
	AI_Output(self,other,"Info_Xardas_FORMULA_14_02");	//Tak, wszystko gotowe. Ale sam nie dasz rady jej uøyÊ.
	AI_Output(other,self,"Info_Xardas_FORMULA_15_03");	//Dlaczego nie?
	AI_Output(self,other,"Info_Xardas_FORMULA_14_04");	//BÍdziesz musia≥ dotknπÊ mieczem ürÛd≥a mocy magicznej. Dok≥adnie w tej samej chwili jakiú mag musi wypowiedzieÊ formu≥Í.
	AI_Output(other,self,"Info_Xardas_FORMULA_15_05");	//Zatem muszÍ sobie poszukaÊ kogoú do pomocy!
	AI_Output(self,other,"Info_Xardas_FORMULA_14_06");	//Weü formu≥Í i przywrÛÊ URIZIEL do jego dawnej úwietnoúci. BÍdzie ci wkrÛtce potrzebny!
	B_Story_LoadSword();
};


instance Info_Xardas_ALTRUNE(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_ALTRUNE_Condition;
	information = Info_Xardas_ALTRUNE_Info;
	important = 0;
	permanent = 0;
	description = "Jestem magiem. Nie wiem, czy potrafiÍ pos≥ugiwaÊ siÍ mieczem takim jak URIZIEL!";
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
	AI_Output(other,self,"Info_Xardas_ALTRUNE_15_01");	//Jestem magiem. Nie wiem, czy potrafiÍ pos≥ugiwaÊ siÍ mieczem takim jak URIZIEL!
	AI_Output(self,other,"Info_Xardas_ALTRUNE_14_02");	//Jest na to sposÛb...
	AI_Output(self,other,"Info_Xardas_ALTRUNE_14_03");	//Ale najpierw na≥aduj miecz magicznπ energiπ. WrÛÊ jak najszybciej!
};


instance Info_Xardas_SWORDLOADED(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_SWORDLOADED_Condition;
	information = Info_Xardas_SWORDLOADED_Info;
	important = 0;
	permanent = 0;
	description = "Uda≥o mi siÍ! URIZIEL znÛw posiada magicznπ aurÍ!";
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
	AI_Output(other,self,"Info_Xardas_SWORDLOADED_15_01");	//Uda≥o mi siÍ! URIZIEL znÛw posiada magicznπ aurÍ!
	AI_Output(self,other,"Info_Xardas_SWORDLOADED_14_02");	//Niesamowite! Miecz odzyska≥ swπ dawnπ moc! Dysponujesz teraz nie lada orÍøem!
	Wld_InsertItem(ItArScrollTeleport4,"OW_ORC_SHAMAN_ROOM2");
};


instance Info_Xardas_MAKERUNE(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_MAKERUNE_Condition;
	information = Info_Xardas_MAKERUNE_Info;
	important = 0;
	permanent = 0;
	description = "Powiedzia≥eú, øe bÍdÍ mÛg≥ pos≥ugiwaÊ siÍ tym mieczem mimo, iø jestem magiem?";
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
	AI_Output(other,self,"Info_Xardas_MAKERUNE_15_01");	//Powiedzia≥eú, øe bÍdÍ mÛg≥ pos≥ugiwaÊ siÍ tym mieczem mimo, iø jestem magiem?
	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_02");	//Przyjrzyj siÍ mu uwaønie. Zauwaøy≥eú zapewne ten duøy, b≥Íkitny klejnot zatopiony w ostrzu.
	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_03");	//Ca≥a energia magiczna miecza skumulowana jest w≥aúnie tutaj.
	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_04");	//Jeúli usunÍ klejnot, bÍdÍ mÛg≥ stworzyÊ magicznπ runÍ posiadajπcπ wszystkie te cechy, ktÛre czyniπ URIZIEL tak szczegÛlnym orÍøem.
	AI_Output(other,self,"Info_Xardas_MAKERUNE_15_05");	//Magiczna runa stworzona z URIZIEL?
	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_06");	//W bitwie ta runa bÍdzie rÛwnie niebezpieczna co sam miecz!
	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_07");	//Ale nie zapominaj, øe jedynie mag SzÛstego KrÍgu moøe zapanowaÊ nad tak potÍønπ magiπ!
};


instance Info_Xardas_MAKERUNEDOIT(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_MAKERUNEDOIT_Condition;
	information = Info_Xardas_MAKERUNEDOIT_Info;
	important = 0;
	permanent = 1;
	description = "ChcÍ, øebyú usunπ≥ klejnot z URIZIEL!";
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
	AI_Output(other,self,"Info_Xardas_MAKERUNEDOIT_15_01");	//ChcÍ, øebyú usunπ≥ klejnot z URIZIEL!
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) < 6)
	{
		AI_Output(self,other,"Info_Xardas_MAKERUNEDOIT_14_02");	//Ale nie opanowa≥eú jeszcze magii SzÛstego KrÍgu!
	};
	AI_Output(self,other,"Info_Xardas_MAKERUNEDOIT_14_03");	//Od tej decyzji nie ma odwrotu. Jesteú pewien, øe chcesz abym usunπ≥ klejnot?
	Info_ClearChoices(Info_Xardas_MAKERUNEDOIT);
	Info_AddChoice(Info_Xardas_MAKERUNEDOIT,"TAK, zrÛb to!",Info_Xardas_MAKERUNE_YES);
	Info_AddChoice(Info_Xardas_MAKERUNEDOIT,"Nie, nie chcÍ!",Info_Xardas_MAKERUNE_NO);
};

func void Info_Xardas_MAKERUNE_YES()
{
	Info_ClearChoices(Info_Xardas_MAKERUNEDOIT);
	AI_Output(other,self,"Info_Xardas_MAKERUNEDOIT_15_04");	//TAK, zrÛb to!
	AI_Output(self,other,"Info_Xardas_MAKERUNEDOIT_14_05");	//Jeúli tego w≥aúnie chcesz... ProszÍ, oto miecz i runa!
	Npc_RemoveInvItem(hero,Mythrilklinge02);
	CreateInvItems(self,UrizielRune,2);
	B_GiveInvItems(self,hero,UrizielRune,2);
	Npc_RemoveInvItem(hero,UrizielRune);
	CreateInvItem(hero,Mythrilklinge03);
	B_LogEntry(CH5_Uriziel,"Xardas usunπ≥ magiczny kryszta≥ z Uriziela. Magiczna moc tego miecza spoczywa teraz w magicznej runie.");
	Log_SetTopicStatus(CH5_Uriziel,LOG_SUCCESS);
};

func void Info_Xardas_MAKERUNE_NO()
{
	Info_ClearChoices(Info_Xardas_MAKERUNEDOIT);
	AI_Output(other,self,"Info_Xardas_MAKERUNEDOIT_15_06");	//Nie, nie chcÍ!
	AI_Output(self,other,"Info_Xardas_MAKERUNEDOIT_14_07");	//Jak sobie øyczysz. Ostrze zachowa swπ magicznπ moc!
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
	AI_Output(other,self,"Info_Xardas_LOADSWORD09_15_01");	//Moøesz mnie czegoú nauczyÊ?
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5)
	{
		if(B_GiveSkill(other,NPC_TALENT_MAGE,6,LPCOST_TALENT_MAGE_6))
		{
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_02");	//WprowadzÍ ciÍ w SzÛsty Krπg Magii.
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_03");	//PamiÍtaj, øe to przywilej zarezerwowany wy≥πcznie dla najbieglejszych magÛw. Mogπ do niego przystπpiÊ ci, ktÛrych ca≥e øycie jest znakiem.
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_04");	//Twoim znakiem jest zjednoczenie elementÛw.
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_05");	//SzÛsty Krπg pozwala ci wykorzystywaÊ magiÍ dowolnej runy.
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_06");	//I nie zapomnij: twoim zadaniem jest s≥uøyÊ potÍdze magii, a nie jπ wykorzystywaÊ.
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
		AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_07");	//Jeszcze nie. Jesteú zdolny, ale brak ci niezbÍdnego doúwiadczenia. Niech Saturas popracuje nad tobπ przez jakiú czas. Wtedy zobaczymy.
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
	AI_Output(other,self,"Info_Xardas_LOADSWORDGUR_15_01");	//Moøesz mnie czegoú nauczyÊ?
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4)
	{
		if(B_GiveSkill(other,NPC_TALENT_MAGE,5,LPCOST_TALENT_MAGE_5))
		{
			AI_Output(self,other,"Info_Xardas_LOADSWORDGUR_14_02");	//Dobrze. WprowadzÍ ciÍ w arkana Piπtego KrÍgu Magii.
			AI_Output(self,other,"Info_Xardas_LOADSWORDGUR_14_03");	//Od tej pory bÍdziesz mÛg≥ wykorzystywaÊ magiczne runy zaklÍÊ Ognistej Burzy i Lodowej Fali oraz posiπdziesz moc niszczenia OøywieÒcÛw.
			AI_Output(self,other,"Info_Xardas_LOADSWORDGUR_14_04");	//Jednak najpotÍøniejszym zaklÍciem Piπtego KrÍgu Magii jest Tchnienie åmierci. Gdyby uda≥o ci siÍ kiedyú odnaleüÊ tÍ runÍ, dysponowa≥byú niewyobraøalnπ mocπ.
			AI_Output(self,other,"Info_Xardas_LOADSWORDGUR_14_06");	//Poznaj granice swoich moøliwoúci, a poznasz samego siebie.
			learned_fivecircle = TRUE;
			lrn5circle = TRUE;
			info_xardas_loadswordgur.permanent = 0;
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other,"Info_Xardas_LOADSWORDGUR_14_07");	//Najpierw powinieneú mÛc siÍ zapoznaÊ z magiπ czwartego krÍgu. Dopiero wtedy bÍdÍ mÛg≥ ci pomÛc.
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
	AI_Output(other,self,"Info_Xardas_LOADSWORD09_15_01");	//Moøesz mnie czegoú nauczyÊ?
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5)
	{
		if(B_GiveSkill(other,NPC_TALENT_MAGE,6,LPCOST_TALENT_MAGE_6))
		{
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_02");	//WprowadzÍ ciÍ w SzÛsty Krπg Magii.
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_03");	//PamiÍtaj, øe to przywilej zarezerwowany wy≥πcznie dla najbieglejszych magÛw. Mogπ do niego przystπpiÊ ci, ktÛrych ca≥e øycie jest znakiem.
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_04");	//Twoim znakiem jest zjednoczenie elementÛw.
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_05");	//SzÛsty Krπg pozwala ci wykorzystywaÊ magiÍ dowolnej runy.
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_06");	//I nie zapomnij: twoim zadaniem jest s≥uøyÊ potÍdze magii, a nie jπ wykorzystywaÊ.
			info_xardas_loadswordgur2.permanent = 0;
			LRN6CIRCLE = TRUE;
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other,"Info_Xardas_LOADSWORDGUR_14_87");	//Najpierw opanuj magiÍ piπtego krÍgu. Dopiero wtedy bÍdÍ mÛg≥ dalej z tobπ popracowaÊ.
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
	description = "Potrafi≥byú wzmocniÊ moje szaty?";
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
	AI_Output(other,self,"Info_Xardas_ARMOR_15_01");	//Potrafi≥byú wzmocniÊ moje szaty?
	AI_Output(self,other,"Info_Xardas_ARMOR_14_02");	//Po prawdzie, to tak - mÛg≥bym sprÛbowaÊ. Jednak musia≥byú mi przynieúÊ odpowiedniπ szatÍ.
	AI_Output(self,other,"Info_Xardas_ARMOR_14_03");	//Ponadto moøliwe bÍdzie to tylko przy szatach, na ktÛrych skupia siÍ symbol okreúlonej magii.
	AI_Output(self,other,"Info_Xardas_ARMOR_14_04");	//Jak zapewne wiesz, tyczy siÍ to magii Ognia, magii Wody, magii åniπcego oraz magii DemonÛw. Dlatego teø bÍdziesz musia≥ wybraÊ jednπ, jedynπ s≥usznπ drogÍ dla siebie.
	AI_Output(self,other,"Info_Xardas_ARMOR_14_05");	//Zatem przynieú mi albo zdobionπ szatÍ Ognia, zdobionπ szatÍ Wody, szatÍ Guru albo szatÍ Mrocznych Sztuk.
	AI_Output(self,other,"Info_Xardas_ARMOR_14_06");	//Jeúli bÍdziesz mia≥ przy sobie doúÊ rudy, to bÍdÍ w stanie wzmocniÊ wybranπ przez ciebie szatÍ.
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
	AI_Output(self,hero,"Info_Xardas_CRAFT_WHICH_09_02");	//KtÛrπ konkretnie sobie øyczysz?
	Info_ClearChoices(info_xardas_craft_which);
	Info_AddChoice(info_xardas_craft_which,DIALOG_BACK,info_xardas_craft_which_back);
	if(Npc_HasItems(other,dmb_armor_m) >= 1)
	{
		Info_AddChoice(info_xardas_craft_which,"Wzmocniona szata Mrocznych Sztuk (1300 bry≥ek)",info_xardas_craft_which_dmb);
	};
	if(Npc_HasItems(other,gur_armor_m) >= 1)
	{
		Info_AddChoice(info_xardas_craft_which,"Mroczna szata Guru (1300 bry≥ek)",info_xardas_craft_which_gur);
	};
	if(Npc_HasItems(other,kdf_armor_h) >= 1)
	{
		Info_AddChoice(info_xardas_craft_which,"Wzmocniona zdobiona szata Ognia (1300 bry≥ek)",info_xardas_craft_which_kdf);
	};
	if(Npc_HasItems(other,kdw_armor_h) >= 1)
	{
		Info_AddChoice(info_xardas_craft_which,"Wzmocniona zdobiona szata Wody (1300 bry≥ek)",info_xardas_craft_which_kdw);
	};
};

func void info_xardas_craft_which_back()
{
	Info_ClearChoices(info_xardas_craft_which);
};

func void info_xardas_craft_which_dmb()
{
	AI_Output(other,self,",	Info_Xardas_CRAFT_WHICH_Xardas_55_01");	//Chcia≥bym, abyú wzmocni≥ mojπ szatÍ Mrocznych Sztuk.
	if((Npc_HasItems(other,dmb_armor_m) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 1300))
	{
		AI_Output(self,other,",	Info_Xardas_CRAFT_WHICH_Xardas_55_02");	//W porzπdku, daj mi jπ.
		AI_Output(self,other,",	Info_Xardas_CRAFT_WHICH_Xardas_55_04");	//I poczekaj chwilÍ, aø skoÒczÍ.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,ItMiNugget,1300);
		Npc_RemoveInvItem(hero,dmb_armor_m);
		CreateInvItem(hero,dmb_armor_m_upgrade);
		AI_EquipBestArmor(hero);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		AI_Output(self,other,",	Info_Xardas_CRAFT_WHICH_Xardas_55_05");	//I proszÍ. Oto twoja wzmocniona szata Mrocznych Sztuk.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Xardas_CRAFT_WHICH_Xardas_15_02");	//Potrzeba mi bÍdzie do tego wiÍcej rudy, bym mÛg≥ umocniÊ tÍ szatÍ.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_xardas_craft_which);
	};
};

func void info_xardas_craft_which_gur()
{
	AI_Output(other,self,",	Info_Xardas_CRAFT_GUR_Xardas_55_01");	//Chcia≥bym, abyú wzmocni≥ mojπ szatÍ Guru.
	if((Npc_HasItems(other,gur_armor_m) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 1300))
	{
		AI_Output(self,other,",	Info_Xardas_CRAFT_GUR_Xardas_55_02");	//W porzπdku, daj mi jπ.
		AI_Output(self,other,",	Info_Xardas_CRAFT_GUR_Xardas_55_04");	//I poczekaj chwilÍ, aø skoÒczÍ.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,gur_armor_m,1);
		B_GiveInvItems(hero,self,ItMiNugget,1300);
		Npc_RemoveInvItem(self,dmb_armor_m);
		CreateInvItem(self,gur_armor_m_upgrade);
		B_GiveInvItems(self,hero,gur_armor_m_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Xardas_CRAFT_GUR_Xardas_55_05");	//I proszÍ. Oto twoja wzmocniona szata Guru.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Xardas_CRAFT_WHICH_GUR_15_02");	//Potrzeba mi bÍdzie do tego wiÍcej rudy, bym mÛg≥ umocniÊ tÍ szatÍ.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_xardas_craft_which);
	};
};

func void info_xardas_craft_which_kdf()
{
	AI_Output(other,self,",	Info_Xardas_CRAFT_KDF_Xardas_55_01");	//Chcia≥bym, abyú wzmocni≥ mojπ zdobionπ szatÍ Ognia.
	if((Npc_HasItems(other,kdf_armor_h) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 1300))
	{
		AI_Output(self,other,",	Info_Xardas_CRAFT_KDF_Xardas_55_02");	//W porzπdku, daj mi jπ.
		AI_Output(self,other,",	Info_Xardas_CRAFT_KDF_Xardas_55_04");	//I poczekaj chwilÍ, aø skoÒczÍ.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,kdf_armor_h,1);
		B_GiveInvItems(hero,self,ItMiNugget,1300);
		Npc_RemoveInvItem(self,kdf_armor_h);
		CreateInvItem(self,kdf_armor_h_upgrade);
		B_GiveInvItems(self,hero,kdf_armor_h_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Xardas_CRAFT_KDF_Xardas_55_05");	//I proszÍ. Oto twoja wzmocniona zdobiona szata Ognia.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Xardas_CRAFT_WHICH_KDF_15_02");	//Potrzeba mi bÍdzie do tego wiÍcej rudy, bym mÛg≥ umocniÊ tÍ szatÍ.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_xardas_craft_which);
	};
};

func void info_xardas_craft_which_kdw()
{
	AI_Output(other,self,",	Info_Xardas_CRAFT_KDW_Xardas_55_01");	//Chcia≥bym, abyú wzmocni≥ mojπ zdobionπ szatÍ Wody.
	if((Npc_HasItems(other,kdw_armor_h) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 1300))
	{
		AI_Output(self,other,",	Info_Xardas_CRAFT_KDW_Xardas_55_02");	//W porzπdku, daj mi jπ.
		AI_Output(self,other,",	Info_Xardas_CRAFT_KDW_Xardas_55_04");	//I poczekaj chwilÍ, aø skoÒczÍ.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,kdw_armor_h,1);
		B_GiveInvItems(hero,self,ItMiNugget,1300);
		Npc_RemoveInvItem(self,kdw_armor_h);
		CreateInvItem(self,kdw_armor_h_upgrade);
		B_GiveInvItems(self,hero,kdw_armor_h_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Xardas_CRAFT_KDW_Xardas_55_05");	//I proszÍ. Oto twoja wzmocniona zdobiona szata Wody.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Xardas_CRAFT_WHICH_KDW_15_02");	//Potrzeba mi bÍdzie do tego wiÍcej rudy, bym mÛg≥ umocniÊ tÍ szatÍ.
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
	description = "Tak w≥aúciwie, to jak zejdÍ na dÛ≥?";
};


func int info_xardas_leavetower_condition()
{
	return TRUE;
};

func void info_xardas_leavetower_info()
{
	AI_Output(hero,self,"Info_Xardas_LeaveTower_15_01");	//Tak w≥aúciwie, to jak zejdÍ na dÛ≥?
	AI_Output(self,hero,"Info_Xardas_LeaveTower_14_02");	//Tπ samπ drogπ, ktÛrπ przyszed≥eú. Zamknij oczy.
	Info_ClearChoices(info_xardas_leavetower);
	Info_AddChoice(info_xardas_leavetower,"Jestem gotÛw. (Teleportacja do wejúcia)",info_xardas_leavetower_yes);
	Info_AddChoice(info_xardas_leavetower,"Czekaj, rozmyúli≥em siÍ.",info_xardas_leavetower_no);
};

func void info_xardas_leavetower_yes()
{
	Info_ClearChoices(info_xardas_leavetower);
	AI_Output(hero,self,"Info_Xardas_LeaveTower_15_03");	//Jestem gotÛw.
	AI_StopProcessInfos(self);
	AI_Teleport(hero,"DT_E1_06");
	Wld_PlayEffect("SPELLFX_TELEPORT",hero,hero,0,0,0,FALSE);
};

func void info_xardas_leavetower_no()
{
	Info_ClearChoices(info_xardas_leavetower);
	AI_Output(hero,self,"Info_Xardas_LeaveTower_15_04");	//Czekaj, rozmyúli≥em siÍ.
	AI_Output(self,hero,"Info_Xardas_LeaveTower_14_05");	//Marnujesz tylko mÛj czas.
};

