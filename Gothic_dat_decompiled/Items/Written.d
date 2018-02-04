
instance ItWr_Book_Circle_01(C_Item)
{
	name = "Pierwszy Kr�g";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 50;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Pierwszy Kr�g Magii";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseItWr_Book_Circle_01;
};


func void UseItWr_Book_Circle_01()
{
	var int nDocID;
	var string text;
	var string Text_1;
	var string Text_2;
	text = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_LIGHT));
	Text_1 = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_THUNDERBOLT));
	Text_2 = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_FIREBOLT));
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Pierwszy Kr�g");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Gdy bogowie obdarzyli ludzko�� magicznymi mocami, nauczyli ich r�wnie� sporz�dza� runy. Wierni wyznawcy przej�li zatem od swych pan�w zaszczytne zadanie wytwarzania tych �wi�tych artefakt�w i zacz�li je wykorzystywa�. Kr�g, do kt�rego nale�y mag, okre�la, jak zaawansowanymi zakl�ciami mo�e si� on pos�ugiwa�. ");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"�wiat�o");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Pierwszy dar Innosa dla ludzko�ci. L�ni�ca kula roz�wietla bezpo�rednie otoczenie maga. ");
	Doc_PrintLine(nDocID,1,text);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Sopel lodu");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Pocisk magicznej energii.");
	Doc_PrintLine(nDocID,1,Text_1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Ognisty pocisk");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Pocisk magicznego Ognia.");
	Doc_PrintLine(nDocID,1,Text_2);
	Doc_Show(nDocID);
	if((book_circle_01 == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		book_circle_01 = TRUE;
	};
};


instance ItWr_Book_Circle_02(C_Item)
{
	name = "Drugi Kr�g";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Drugi Kr�g Magii";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseItWr_Book_Circle_02;
};


func void UseItWr_Book_Circle_02()
{
	var int nDocID;
	var string Text_1;
	Text_1 = ConcatStrings(NAME_Manakosten,IntToString(SPL_HEALING_HP_PER_MP));
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Drugi Kr�g");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Wszelka magia czerpie z magicznych zdolno�ci jej u�ytkownika, zwanego odpowiednio MAGIEM.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ka�de wykorzystanie magicznego zakl�cia kosztuje maga cz�� jego mocy. Ich zapas nazywany bywa czasem ilo�ci� mana.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Uzdrowienie");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Adanos ujrza�, �e ludzie s� �miertelni i wiedzia�, �e jest to wol� Beliara. I rzek�: Nie sprzeciwi� si� woli Beliara, ale dam za to ludziom dar uzdrawiania.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"To zakl�cie uzdrawia maga.");
	Doc_PrintLine(nDocID,1,"Zakl�cia czerpi�ce");
	Doc_PrintLine(nDocID,1,Text_1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
	if((book_circle_02 == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		book_circle_02 = TRUE;
	};
};


instance ItWr_Book_Circle_03(C_Item)
{
	name = "Trzeci Kr�g";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 150;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Trzeci Kr�g Magii";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseItWr_Book_Circle_03;
};


func void UseItWr_Book_Circle_03()
{
	var int nDocID;
	var string text;
	var string Text_1;
	var string Text_2;
	text = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_FIREBALL));
	Text_1 = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_ICECUBE));
	Text_2 = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_THUNDERBALL));
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Trzeci Kr�g");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Niekt�re zakl�cia mo�na na�adowa� pewn� dawk� energii magicznej. Nazywamy je zakl�ciami odnawialnymi.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Inne zakl�cia dzia�aj� tak d�ugo, jak mag udziela im swojej energii mana. Te z kolei nazywane s� zakl�ciami inwestycyjnymi.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Kula ognia");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Drugi dar Innosa dla dzieci Ognia. Pot�ny, magiczny pocisk, spopielaj�cy ofiary.");
	Doc_PrintLine(nDocID,1,"Zakl�cie odnawialne");
	Doc_PrintLine(nDocID,1,text);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Bry�a lodu");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Ofiara otoczona zostaje bry�� lodu. Zakl�cie pochodzi z Kr�gu Mag�w Wody.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,Text_1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Piorun kulisty");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Pot�ny pocisk magiczny.");
	Doc_PrintLine(nDocID,1,Text_2);
	Doc_Show(nDocID);
	if((book_circle_03 == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		book_circle_03 = TRUE;
	};
};


instance ItWr_Book_Circle_04(C_Item)
{
	name = "Czwarty Kr�g";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 200;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Czwarty Kr�g Magii";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseItWr_Book_Circle_04;
};


func void UseItWr_Book_Circle_04()
{
	var int nDocID;
	var string text;
	var string Text_1;
	var string Text_2;
	text = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_FIRESTORM));
	Text_1 = ConcatStrings(NAME_Manakosten,IntToString(SPL_ZAPPED_DAMAGE_PER_SEC));
	Text_2 = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_DESTROYUNDEAD));
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Czwarty Kr�g");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Magia ");
	Doc_PrintLine(nDocID,0,"Teleportacji");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Szczeg�lna natura tych zakl�� le�y w tym, i� cho� zawarte s� w runach, korzysta� z nich mo�e ka�da osoba obdarzona moc� magiczn�. Magiczne formu�y zostaj� wyzwolone w spos�b natychmiastowy, za� samo zakl�cie teleportacji nie jest w �aden spos�b ograniczone.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"Ognista burza	");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Podobnie jak w Kuli ognia, energia tego zakl�cia kierowana jest przeciwko kolejnym ofiarom.");
	Doc_PrintLine(nDocID,1,text);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Grom");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Magiczna energia przeskakuje od jednej ofiary do drugiej. Zdarza si�, �e nawet mag mo�e pa�� ofiar� tego zakl�cia!");
	Doc_PrintLine(nDocID,1,Text_1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"�mier� o�ywie�com");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"To zakl�cie przeznaczone jest do walki z piekielnymi zast�pami o�ywie�c�w.");
	Doc_PrintLine(nDocID,1,Text_2);
	Doc_Show(nDocID);
	if((book_circle_04 == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		book_circle_04 = TRUE;
	};
};


instance ItWr_Book_Circle_05(C_Item)
{
	name = "Pi�ty Kr�g";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 250;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Pi�ty Kr�g Magii";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseItWr_Book_Circle_05;
};


func void UseItWr_Book_Circle_05()
{
	var int nDocID;
	var string Text_1;
	var string Text_2;
	Text_1 = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_FIRERAIN));
	Text_2 = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_ICEWAVE));
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Pi�ty Kr�g");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Deszcz ognia");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_PrintLines(nDocID,0,"�wi�ty Ogie� niesie zag�ad� wszystkim istotom znajduj�cym si� w pobli�u maga.");
	Doc_PrintLine(nDocID,0,Text_1);
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Lodowa fala ");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Magiczna fala lodu zamra�a grup� nieprzyjaci� na kr�tki okres czasu, uniemo�liwiaj�c im ruch i zadaj�c obra�enia. ");
	Doc_PrintLines(nDocID,1,"Zakl�cie z Kr�gu Mag�w Wody.");
	Doc_PrintLine(nDocID,1,Text_2);
	Doc_Show(nDocID);
	if((book_circle_05 == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		book_circle_05 = TRUE;
	};
};


instance ItWr_Book_Circle_06(C_Item)
{
	name = "Sz�sty Kr�g";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 300;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Sz�sty Kr�g Magii";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseItWr_Book_Circle_06;
};


func void UseItWr_Book_Circle_06()
{
	var int nDocID;
	var string text;
	text = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_BREATHOFDEATH));
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Sz�sty Kr�g");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Tchnienie �mierci");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_PrintLines(nDocID,0,"Oddech Beliara. Zakl�cie to potrafi natychmiast powali� nawet najpot�niejsze istoty.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,text);
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Pier�cie� �mierci");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Nie zachowa�y si� prawie �adne zapiski o runie zawieraj�cej magiczn� moc URIZIELA.");
	Doc_PrintLines(nDocID,1,"Wiadomo tylko, �e pochodzi ona wprost od Beliara.");
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
	if((book_circle_06 == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		book_circle_06 = TRUE;
	};
};


instance Goettergabe(C_Item)
{
	name = "Dar od bog�w";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Dar od bog�w";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseGoettergabe;
};


func void UseGoettergabe()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_PrintLine(nDocID,0,"Magia");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0," ");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"Dar od bog�w");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Z dawien dawna cz�ek pr�bowa� zg��bi� natur� i genez� sztuk magicznych. Jeno gdzie rozpocz�� takie poszukiwania? Czy magi� mo�na w og�le opisa�? Pr�no szuka� r�wnie niesp�jnego zjawiska we �wiecie: wszak magia jednako leczy i zabija, tworzy i niszczy.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Gdzie zatem szuka� tej nieopisanej pot�gi? Magia jest tym, czym jest - najpot�niejszym i najwspanialszym darem, jaki cz�owiek otrzyma� od bog�w. Baczcie jeno, by dar �w rych�o nie sta� si� przekle�stwem, gdy� nieliczni b�d� w stanie zrozumie� magi� i wykorzysta� j� do w�asnych cel�w. Inni sami zostan� wykorzystani.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Barthos z Laran");
	Doc_Show(nDocID);
	if((book_goettergabe == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		book_goettergabe = TRUE;
	};
};


instance Geheimnisse_der_Zauberei(C_Item)
{
	name = "Tajniki Magii";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Tajniki Magii";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseGeheimnisse_der_Zauberei;
};


func void UseGeheimnisse_der_Zauberei()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Tajniki Magii");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Magia nie zamieszkuje w ciele samego magusa. Jest on raczej jako zmy�lny rzemie�lnik, a ona jako narz�dzie jego. Tako� pocz�tkuj�cy magus uczy si� jak on� moc okie�zna� i kierowa� ni� wedle swojej woli.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Jego duch nadaje owej mocy po��dany kszta�t, ogniskuje j� i wreszcie uwalnia. W takich chwilach dusza magusa wznosi si� ponad nasz �wiat i spoziera na Drug� Stron�, gdzie stoi pa�ac pot�gi, kt�r� on kszta�tuje i przekazuje.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Barthos z Laran");
	Doc_Show(nDocID);
	if((book_geheimnisse_der_zauberei == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		book_geheimnisse_der_zauberei = TRUE;
	};
};


instance Machtvolle_Kunst(C_Item)
{
	name = "Wszechpot�na Sztuka";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Wszechpot�na Sztuka";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseMachtvolle_Kunst;
};


func void UseMachtvolle_Kunst()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Wszechpot�na Sztuka");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ksi�ga dla tych, co w sztukach magicznych uczeni s�.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Umiej�tno�ci magusa wzrastaj� z czasem. Najpierw jest jako ziarno zbo�a, kt�re trzeba chroni�, by nie zmarnia�o. Lecz wkr�tce ziarno wypuszcza kie�ki, staj�c si� pi�kn� ro�lin�.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Z ka�dym nowym dniem ro�lina staje si� wi�ksza i silniejsza. Tak samo jest z magusem. Na pocz�tku nauki jego si�y s� w�t�e, lecz z czasem okrzepnie, staj�c si� pot�niejszym. Ci�g�e d��enie do absolutnej perfekcji powinno by� nadrz�dnym celem ka�dego adepta magii. Ziarno pot�gi dane im przez bog�w jest bowiem najcenniejszym darem, jakie �miertelnik mo�e otrzyma�.");
	Doc_Show(nDocID);
	if((book_machtvolle_kunst == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		book_machtvolle_kunst = TRUE;
	};
};


instance Elementare_Arcanei(C_Item)
{
	name = "Arcanum �ywio��w";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Arcanum �ywio��w";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseElementare_Arcanei;
};


func void UseElementare_Arcanei()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Arcanum �ywio��w");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Miejsce Magii w ziemskim porz�dku");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Wiele bada� przeprowadzono, g�owi�c si� nad zale�no�ci� magii od wszelakich �ywio��w. W rezultacie przyj�to, i� jest ona - magia - ostatecznym, najpot�niejszym �ywio�em ze wszystkich. Wszak to dzi�ki niej magus mo�e kszta�towa� pozosta�e si�y natury wedle w�asnego upodobania.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Ka�dy �ywio�, w swej najczystszej formie, ujawnia powi�zania z magi�. Oczywi�cie, naturalne manifestacje takich powi�za� nale�� do rzadko�ci i s� skrz�tnie poszukiwane. Zdolno�� magusa do kontrolowania pot�gi �ywio��w stanowi ostateczny dow�d, i� magia jest najczystszym i najwspanialszym dobrem obecnym w naszej egzystencji.");
	Doc_Show(nDocID);
	if((book_elementare_arcanei == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		book_elementare_arcanei = TRUE;
	};
};


instance Wahre_Macht(C_Item)
{
	name = "Prawdziwa Moc";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Prawdziwa Moc";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseWahre_Macht;
};


func void UseWahre_Macht()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Prawdziwa Moc");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�wi�ta powinno�� M�drca");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"To pot�ga odr�nia magusa od zwyk�ego �miertelnika. W�adny wykorzystywa� bosk� moc, magus wyj�ty jest spod tych wszystkich praw natury, kt�re dotycz� ludzi prostych i kr�l�w jednako. ");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Gdy magus osi�gnie poziom, kt�ry pozwoli mu wykroczy� poza granice ludzkiej egzystencji, wst�puje do �wiata niedost�pnego zwyk�ym �miertelnikom. Mo�e prze�amywa� bariery czasu i przestrzeni, i nawet �mier� - ostateczna bariera - nie jest mu straszna.");
	Doc_Show(nDocID);
	if((book_wahre_macht == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		book_wahre_macht = TRUE;
	};
};


instance Das_magische_Erz(C_Item)
{
	name = "Magiczna ruda";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Magiczna ruda";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseDas_magische_Erz;
};


func void UseDas_magische_Erz()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Magiczna ruda");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Najlepsz� rud� do wyrobu wszelkiego rodzaju or�a znale�� mo�na w kopalniach w dolinie Khorinis. Wykut� z niej bro� cechuje niebywa�a wytrzyma�o��. Pok�ady rudy wyst�puj� zwykle g��boko pod ziemi�, lecz g�upcem ten, kto nie podejmie trudu wydobycia jej na �wiat�o dzienne. Niewiele jest takich skarb�w na �wiecie...");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Magiczna bro� przebije ka�dy pancerz i pogruchocze ka�d� tarcz�. Zaiste, kr�lewski to or� i kr�lewsk� cen� trzeba zap�aci� za cho�by sztylet wykuty z tego szlachetnego kruszcu. Tako� surow� cen� p�ac� g�rnicy pracuj�cy w kopalniach. Rud� nie�atwo oddzieli� od skalnych pok�ad�w, tak jakby z ca�ych si� walczy�a, by pozosta� w �onie matki Ziemi.");
	Doc_Show(nDocID);
	if((book_das_magische_erz == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		book_das_magische_erz = TRUE;
	};
};


instance Schlacht_um_Varant1(C_Item)
{
	name = "Bitwa o Varrant";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Bitwa o Varrant";
	text[0] = "Tom 1";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseSchlacht_um_Varant1;
};


func void UseSchlacht_um_Varant1()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"...ale sprytny Rhobar postanowi� zaatakowa�. Zebra� swoje si�y i kaza� im n�ka� s�absz�, praw� flank� nieprzyjaciela. Nie trac�c chwili, kr�l pchn�� najlepsze swe oddzia�y na wroga, i przebi� si� przeze� niczym miecz przecinaj�cy m�a. Wojska kr�lewskie par�y zatem bez wytchnienia w stron� Varant. Rhobar wiedzia� wszak, �e jedyna szansa ocalenia le�y w rozbiciu armii nieprzyjaciela i niedopuszczeniu do po��czenia si� Gellona i Lukkora.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"  Najpierw jednak postanowi� przeci�� ich linie zaopatrzenia...");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"...Gellon poleg�, a jego armia posz�a w rozsypk�. Ale Rhobar nie zamierza� da� przeciwnikowi chwili wytchnienia i rzuci� swe si�y na pozosta�e oddzia�y wroga. Tu jednak Lukkor rzuci� si� na kr�lewskich znienacka i zada� straszliwy cios wyczerpanym wojskom Rhobara...");
	Doc_Show(nDocID);
	if((book_schlacht_um_varant1 == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		book_schlacht_um_varant1 = TRUE;
	};
};


instance Schlacht_um_Varant2(C_Item)
{
	name = "Bitwa o Varrant";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Bitwa o Varrant";
	text[0] = "Tom 2";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseSchlacht_um_Varant2;
};


func void UseSchlacht_um_Varant2()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Wojna by�a sko�czona. Varant straci�o swe morskie porty, tak potrzebne dla zaopatrywania armii. Kr�l Rhobar nie traci� wi�cej czasu na polu bitwy, lecz zostawi� swych genera��w, by ci rozprawili si� z niedobitkami nieprzyjaciela. Varrantczycy posiadali ju� tylko jedno ognisko oporu, zgromadzone wok� Lukkora, najpot�niejszego genera�a ca�ego narodu, kt�ry umiej�tnie zamieni� pora�k� w zwyci�stwo.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Ale teraz jego armia znalaz�a si� w potrzasku. Sytuacja zda�a si� by� beznadziejna, cho� jego wojska przewy�sza�y si�y kr�lewskie liczb� i wyposa�eniem. Oto jeden z Myrta�skich bohater�w, m�ny genera� imieniem Lee, zwabi� przeciwnika w pu�apk�. Na podmok�ej, bagnistej ziemi ci�ka kawaleria Lukkora nie mia�a szans w starciu ze zwinnymi �o�nierzami Lee. Zdziesi�tkowane oddzia�y Varantu wkr�tce musia�y uzna� wy�szo�� przeciwnika. Lukkor zosta� pokonany.");
	Doc_Show(nDocID);
	if((book_schlacht_um_varant2 == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		book_schlacht_um_varant2 = TRUE;
	};
};


instance Myrtanas_Lyrik(C_Item)
{
	name = "Poezja Myrta�ska";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Poezja Myrta�ska";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseMyrtanas_Lyrik;
};


func void UseMyrtanas_Lyrik()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"    Pie��");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"		  Skruchy");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Na pocz�tku by�a moc, jak jasny �nieg bia�a,");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Dzi� niewielka cz�stka dawnej chwa�y pozosta�a.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Przypomina o jedno�ci z dawnych lat,");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"jak�e r�nej od chciwo�ci, kt�r� �wiat");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"nasz zdepta� i odrzuci� po wsze czasy.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Nasz duch nie zdzier�y� ostatecznej pr�by,");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"a po��danie b�dzie �r�d�em naszej zguby.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Bo nie masz ju� jedno�ci na tym �wiecie.");
	Doc_PrintLines(nDocID,1,"");
	Doc_Show(nDocID);
	if((book_myrtanas_lyrik == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		book_myrtanas_lyrik = TRUE;
	};
};


instance Lehren_der_Goetter1(C_Item)
{
	name = "M�dro�� Bog�w, tom 1";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "M�dro�� Bog�w";
	text[0] = "Tom 1";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseLehren_der_Goetter1;
};


func void UseLehren_der_Goetter1()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Wys�uchajcie s��w bo�ych, bo pragn� oni, by�cie ich wys�uchali. Przestrzegajcie praw bo�ych, bo chc� oni, by�cie ich przestrzegali. Czcijcie kap�an�w bo�ych, bo oni s� wybra�cami �aski...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"S�owa Innosa: A gdyby�cie nie mogli ich poj��, nie odrzucajcie s��w kap�an�w, bo g�osz� oni moj� m�dro��. Gdy� ja jestem S�o�cem na niebie, �wiat�em i �yciem na Ziemi. A wszystko, co wrogiem jest S�o�ca, jest i moim wrogiem, i zostanie wygnane do krainy wiecznej ciemno�ci.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"S�owa Adanosa: �yjcie i pracujcie, bo dzie� stworzono po to, by m�� m�g� �y� i pracowa�. Szukajcie wiedzy, by�cie mogli przekaza� j� synom swoim, gdy� taka jest wola moja. Ale strze�cie si�, bo cz�ek g�upi i leniwy zostanie wygnany do krainy wiecznej ciemno�ci.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"S�owa Beliara: A ktokolwiek wyst�pi przeciw woli bo�ej, ze mn� b�dzie mia� do czynienia. Na jego cia�o b�l ze�l� okrutny, a jego duch p�jdzie ze mn� do krainy wiecznej ciemno�ci.");
	Doc_Show(nDocID);
	if((book_lehren_der_goetter1 == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		book_lehren_der_goetter1 = TRUE;
	};
};


instance Lehren_der_Goetter2(C_Item)
{
	name = "M�dro�� Bog�w, tom 2";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "M�dro�� Bog�w";
	text[0] = "Tom 2";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseLehren_der_Goetter2;
};


func void UseLehren_der_Goetter2()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLines(nDocID,0,"O zaraniu dziej�w: Na pocz�tku nie by�o dnia ani nocy, i �adne �ywe stworzenie nie przemierza�o �wiata. Wtedy pojawi� si� Innos, a jego blask pada� na Ziemi�. Innos obdarzy� �wiat darem �ycia. Ale �adne stworzenie nie �mia�o spojrze� w twarz Innosa, wi�c dobry b�g stworzy� S�o�ce. Lecz mimo to, jasno�� by�a zbyt wielka, tote� Innos podzieli� si� na dwoje i tak powsta� Beliar. Beliar stworzy� noc. Teraz cz�owiek m�g� wreszcie �y�, lecz nie wiedzia� jak. Dlatego Innos podzieli� si� po raz wt�ry i tak powsta� Adanos.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"Adanos przyni�s� ludziom pomys�owo�� i m�dro��, kt�rej tak bardzo potrzebowali.");
	Doc_PrintLine(nDocID,1,"Adanos przyni�s� ludziom pomys�owo�� i m�dro��, kt�rej tak bardzo potrzebowali.");
	Doc_PrintLines(nDocID,1,"Dlatego Innos postanowi� zostawi� ludzko�� pod opiek� Adanosa i uda� si� na spoczynek. Lecz Beliar p�on�� z zazdro�ci, gdy� ludzie bali si� go i nie oddawali mu czci. Tedy postanowi� Beliar stworzy� cz�owieka, kt�ry modli�by si� tylko do niego. Ale cz�owiek �w by� jako wszyscy inni, i ba� si� Beliara i nie oddawa� mu czci. B�g nocy rozz�o�ci� si� i zabi� cz�owieka krzycz�c: Dobrze! B�jcie si� mnie zatem, ale cze�� oddacie mi, cho�by po �mierci. Tymi s�owy ustanowi� Beliar �mier� - kres �ywota ludzkiego.");
	Doc_Show(nDocID);
	if((book_lehren_der_goetter2 == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		book_lehren_der_goetter2 = TRUE;
	};
};


instance Lehren_der_Goetter3(C_Item)
{
	name = "M�dro�� Bog�w, tom 3";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "M�dro�� Bog�w";
	text[0] = "Tom 3";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseLehren_der_Goetter3;
};


func void UseLehren_der_Goetter3()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Innos pozwoli�, by ludzie mogli go us�ysze� i przemawia� do niego. Pozwoli� im r�wnie� czyni� cuda i nazwa� je magi�. Dzi�ki magii, ludzie zacz�li zmienia� �wiat wedle swego upodobania, jedni m�drze, inni g�upio. Widz�c to, Innos zabra� dar magii ludziom g�upim i pozostawi� go w r�kach ludzi �wiat�ych. Obdarzy� ich r�wnie� innymi �askami, czyni�c swoimi kap�anami i nadaj�c im miano mag�w.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Ludzie czcili kap�an�w Innosa i oddawali im cze��, ale wielu mag�w odwr�ci�o si� od Innosa i uciek�o si� pod opiek� jego boskiego brata - Adanosa. Kasta mag�w uleg�a rozbiciu. Ci, kt�rzy pod��ali za bogiem m�dro�ci nazwali siebie magami Kr�gu Wody. Wyznawcy Innosa nazywani za� byli Magami Ognia.");
	Doc_Show(nDocID);
	if((book_lehren_der_goetter3 == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		book_lehren_der_goetter3 = TRUE;
	};
};


instance Jagd_und_Beute(C_Item)
{
	name = "�owy i zwierzyna";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "�owy i zwierzyna";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseJagd_und_Beute;
};


func void UseJagd_und_Beute()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Jego zapiski przetrwa�y ca�e wieki i po dzi� dzie� uznawane s� za najznakomitsze kompendium wiedzy o polowaniu. Po d�ugich latach star� na p�nocnym pograniczu, niemal ka�dy obywatel potrafi pos�ugiwa� si� �ukiem. Jednak sztuka polowania daleko wykracza poza podstawowe zasady strzelania z �uku! Zwierzyna jest wszak p�ocha i nieprzewidywalna!");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Polowanie z �ukiem ma swe pocz�tki w czasach staro�ytnych. W ci�gu ca�ych tysi�cleci nie zasz�y w technikach �owieckich wi�ksze zmiany i tak ju� najprawdopodobniej pozostanie. Jakie czynniki wp�ywaj� tak naprawd� na skuteczno�� pos�ugiwania si� �ukiem? To w�a�nie rozpoznanie tych czynnik�w czyni prawdziwego mistrza �ucznictwa.");
	Doc_Show(nDocID);
	if((book_jagd_und_beute == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		book_jagd_und_beute = TRUE;
	};
};


instance Kampfkunst(C_Item)
{
	name = "Sztuka walki";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Sztuka walki";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseKampfkunst;
};


func void UseKampfkunst()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Od 2000 lat nauki mistrz�w kszta�tuj� rozw�j sztuki walki.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Zr�czno��, opanowanie, szybko��, zdolno�� obserwacji i b�yskawicznego podejmowania decyzji - wszystkie te umiej�tno�ci nale�y bezustannie doskonali�. Jedynie doskona�a koordynacja ruch�w i zachowanie w�a�ciwej postawy pozwol� na prawid�owy rozw�j twych umiej�tno�ci.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Przes�anie duchowych i cielesnych nauk Mistrza przetrwa�o wiele lat.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Jego niepospolity sukces by� natchnieniem dla kolejnych pokole�. �wiat zmienia� si� bez przerwy, ale idealna harmonia si� duchowych i sprawno�ci cia�a pozosta�a niezmienn�.");
	Doc_Show(nDocID);
	if((book_kampfkunst == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		book_kampfkunst = TRUE;
	};
};


instance Die_Gruft(C_Item)
{
	name = "Krypta";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Krypta";
	text[5] = NAME_Value;
	count[5] = value;
};

instance Astronomie(C_Item)
{
	name = "Astronomia";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Astronomia";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseAstronomie;
};


func void UseAstronomie()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"W centrum wszech�wiata znajduje si� Morgrad, co zawiera cztery �ywio�y - ziemi�, wod�, ogie� i wiatr. Morgrad, co jest wiecznie niespokojnym sercem Beliara. A nad nim rozci�ga si� sfera niebios.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"W odwiecznej hierarchii kosmosu cz�owiek stoi po�rodku. Jego dusza pozwala mu do�wiadcza� �ask niebia�skich, ale jego cia�o stworzone jest z substancji Morgradu. Jest wi�c cz�owiek odzwierciedleniem ca�ego �wiata.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Orbity wszystkich planet, czyli drogi, jakie pokonuj� okr��aj�c Morgrad, zmieniaj� si� nieznacznie z up�ywem lat. Pewnym jest zatem, i� ca�y wszech�wiat zmierza powoli do jakiego� celu.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Obserwuj�c ruch ksi�yca na nocnym niebie ustalili�my d�ugo�� roku i stworzyli�my pierwszy kalendarz.");
	Doc_Show(nDocID);
	if((book_astronomie == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		book_astronomie = TRUE;
	};
};


instance Rezepturen(C_Item)
{
	name = "Przepisy";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Przepisy";
	text[0] = "Tom 1";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseRezepturen;
};


func void UseRezepturen()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Balsam widzenia:");
	Doc_PrintLine(nDocID,0,"----------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Polejcie oczy pacjenta �r�c� ��ci�. ��� zada mu b�l okrutny, przez kt�ry ca�kiem zm�drzeje i nauczy si� widzie� to, czego wcze�niej nie widzia� i cieszy� z tego, co mia� do tej pory!");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"��� i wiedza nie id� w parze i s� jako ogie� i woda. Dlatego m�drzec potrafi nad ��ci� panowa�, by nie prowadzi�a go do awanturnictwa i inszych eksces�w. Tylko ten, co w pe�ni doceni boski dar �ycia, w pe�ni to �ycie wykorzysta.");
	Doc_Show(nDocID);
	if((book_rezepturen == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		book_rezepturen = TRUE;
	};
};


instance Rezepturen2(C_Item)
{
	name = "Przepisy";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Przepisy";
	text[0] = "Tom 2";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseRezepturen2;
};


func void UseRezepturen2()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Wino zapomnienia");
	Doc_PrintLine(nDocID,0,"--------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Najzacniejsze winogrona najdziecie na wysokich zboczach Archolos. Sztuka dojrzewania winnych ki�ci le�y w niezak��caniu ich spokoju. Teraz doda� jeno w�a�ciwych zi� i czeka� na efekty.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Tak oto prawdziwy mistrz zamienia wod� ze studni w zacne wino. Ludzie raduj� si�, chwal� jego dzie�o. A mistrz dalej dzia�a w zgodzie z Natur�, czerpi�c z tego, co ona mu hojn� r�k� udziela.");
	Doc_Show(nDocID);
	if((book_rezepturen2 == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		book_rezepturen2 = TRUE;
	};
};


instance TagebuchOT(C_Item)
{
	name = "Dziennik";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Dziennik";
	text[0] = "Stara, zniszczona ksi�ga.";
	text[1] = "Brakuje kilku kartek.";
	on_state[0] = UseTagebuchOT;
};


func void UseTagebuchOT()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Dzie� 23");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLines(nDocID,0,"Zatraci�em ju� poczucie czasu.");
	Doc_PrintLines(nDocID,0,"Zdaje si�, �e min�y co najmniej 23 dni od chwili, gdy zostali�my schwytani przez ork�w i zmuszeni do pracy.");
	Doc_PrintLines(nDocID,0,"Te pod�e istoty nie znaj� lito�ci! S�absi z nas po prostu padaj� na ziemi� i ju� si� nie podnosz�!");
	Doc_PrintLines(nDocID,0,"Uciekn� st�d, niewa�ne jak!");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Dzie� 28");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLines(nDocID,0,"Kazali nam kopa� jeszcze dalej, w g��b g�ry.");
	Doc_PrintLines(nDocID,0,"Przednia cz�� jest ju� gigantyczna. Ciekawe, czemu to wszystko ma s�u�y�?");
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"Dzie� 67");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLines(nDocID,1,"Podobno ci orkowi kap�ani nie maj� serc. Je�li to prawda, jakim cudem nadal si� poruszaj�?");
	Doc_PrintLines(nDocID,1,"Widzia�em miecz, kt�rego tak bardzo si� boj�. Gdyby uda�o mi si� go zdoby�, ju� ja bym im pokaza�...");
	Doc_PrintLine(nDocID,1,"");
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"Dzie� 78");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLines(nDocID,1,"Miecz spoczywa w przedniej komorze �wi�tyni, ale bezustannie strze�e go jeden z kap�an�w.");
	Doc_PrintLines(nDocID,1,"Zamierzam st�d uciec. Zostawi� tu m�j pami�tnik, mo�e komu� si� jeszcze przyda.");
	Doc_Show(nDocID);
};


instance ItWr_Bloodfly_01(C_Item)
{
	name = "Krwiopijcy";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 150;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Krwiopijcy";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseItWr_Bloodfly_01;
};


func void UseItWr_Bloodfly_01()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Krwiopijcy");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0," ");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"O krwiopijcach");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ale w miejscu, gdzie grunt jest podmok�y a powietrze wilgotne, krwiopijcy zbieraj� si� stadami, zwabione zapachem potu �ywych istot. Swoimi ��d�ami u�miercaj� ofiary i ucztuj� na ich krwi. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"My�liwi z bagien nauczyli si� pozyskiwa� ��d�a tych drapie�c�w. W tym celu nacinaj� wn�trzno�ci krwiopijc�w i usuwaj� ostro�nie ��d�o wraz z otaczaj�c� je tkank�. Nast�pnie zeskrobuj� niejadalne mi�so...");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
	if((Knows_GetBFSting == FALSE) && (knows_getbffly == FALSE))
	{
		Knows_GetBFSting = TRUE;
		knows_getbffly = TRUE;
		Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry(GE_AnimalTrophies,"Umiej�tno�� usuwania ��de� krwiopijc�w.");
		PrintScreen("Nowa umiej�tno��: Usuwanie ��de� oraz skrzyde� krwiopijc�w",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_LogEntry(GE_AnimalTrophies,"Umiej�tno�� usuwania skrzyde� krwiopijc�w.");
	};
};


var int salmsnotiz;
var int dobraksnotiz;
var int pelensnotiz;
var int mascosnotiz;
var int janosnotiz;
var int allenotizen;

instance ITWR_SALMSNOTIZ(C_Item)
{
	name = "Wiadomo�� od Salma";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = usesalmsnotiz;
	description = name;
	text[0] = "";
	text[1] = "";
};


func void usesalmsnotiz()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"To by�o g�upie z mojej strony, �eby od razu zak�ada�, �e w tej sprawie chodzi o zwyk�e, proste zadanie. C�, nagroda by�a naprawd� kusz�ca, tylko co z tego, skoro teraz znalaz�em si� pod p�askowy�em w pu�apce, otoczony hord� brzytew. Powoli zapada noc. Je�li szcz�cie mi sprzyja, b�d� m�g� prze�lizgn�� si� obok tych bestii, kiedy b�d� spa�. Mimo wszystko lepiej zachowa� ostro�no��.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Salm");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Co potrzebne mi jest do wyprawy?");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Moja cz�� ca�o�ci:");
	Doc_PrintLine(nDocID,0,"R");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	if(salmsnotiz == FALSE)
	{
		Log_CreateTopic(MYSTERIOUSNOTICES,LOG_MISSION);
		Log_SetTopicStatus(MYSTERIOUSNOTICES,LOG_RUNNING);
		B_LogEntry(MYSTERIOUSNOTICES,"W pobli�u zatopionej wie�y znalaz�em notatk� od niejakiego Salma. Napisa� w niej, �e musi wype�ni� swoje zadanie i �e czeka go za to nagroda. Pod listem odci�ni�ta zosta�a wielka litera R.");
		salmsnotiz = TRUE;
	};
};


instance ITWR_DOBRAKSNOTIZ(C_Item)
{
	name = "Wiadomo�� od Dobraka";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = usedobraksnotiz;
	description = name;
	text[0] = "";
	text[1] = "";
};


func void usedobraksnotiz()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Do diab�a, utkn��em na tym przekl�tym kad�ubie statku. S�ysz�, jak te jaszczury kr�c� si� wsz�dzie dooko�a. Musz� co� wykombinowa�. Ciekawe czy reszta co� znalaz�a. Ech, w sumie wa�niejsze jest dla mnie teraz, jak ja si� st�d wydostan� nie zostaj�c po�artym?");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Dobrak");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Gdzie �yj� i umieraj� b�otne w�e?");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Moja cz�� ca�o�ci:");
	Doc_PrintLine(nDocID,0,"G");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	if(dobraksnotiz == FALSE)
	{
		Log_CreateTopic(MYSTERIOUSNOTICES,LOG_MISSION);
		Log_SetTopicStatus(MYSTERIOUSNOTICES,LOG_RUNNING);
		B_LogEntry(MYSTERIOUSNOTICES,"W pobli�u rozwalonego statku znalaz�em notatk� od niejakiego Dobraka. Najwyra�niej jego grupa si� rozdzieli�a, gdy� wspomina jeszcze o reszcie w swoim li�cie. Pod listem odci�ni�ta zosta�a wielka litera G.");
		dobraksnotiz = TRUE;
	};
};


instance ITWR_PELENSNOTIZ(C_Item)
{
	name = "Wiadomo�� od Pelena";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = usepelensnotiz;
	description = name;
	text[0] = "";
	text[1] = "";
};


func void usepelensnotiz()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Jestem w�a�nie na bagnie i tylko ca�y czas si� zastanawiam - po co? Nic nie znalaz�em, nawet cienia wskaz�wki. Nie mam si� nawet co pyta� tych szale�c�w, kt�rzy to zacz�li kilka tygodni temu budowa� tutaj sw�j ob�z. I tak pewnie by z tego nic nie by�o. B�otne w�e w ci�gu tych ostatnich godzin podp�yn�y niebezpiecznie blisko. Co� mi si� zdaje, �e zaczynaj� mnie wyczuwa�. Lepiej si� st�d jak najszybciej ulotni�.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Pelen");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Gdzie znajd� zniewolon� i");
	Doc_PrintLine(nDocID,0,"na wieki przekl�t� dusz�?");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Moja cz�� ca�o�ci:");
	Doc_PrintLine(nDocID,0,"O");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	if(pelensnotiz == FALSE)
	{
		Log_CreateTopic(MYSTERIOUSNOTICES,LOG_MISSION);
		Log_SetTopicStatus(MYSTERIOUSNOTICES,LOG_RUNNING);
		B_LogEntry(MYSTERIOUSNOTICES,"W pobli�u obozu na bagnie znalaz�em notatk� od niejakiego Pelena. Widocznie czego� szuka�, jednak tego nie znalaz�. Zgin�� prawdopodobnie przez b�otne w�e. Pod listem odci�ni�ta zosta�a wielka litera O.");
		pelensnotiz = TRUE;
	};
};


instance ITWR_MASCOSNOTIZ(C_Item)
{
	name = "Wiadomo�� od Masco";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = usemascosnotiz;
	description = name;
	text[0] = "";
	text[1] = "";
};


func void usemascosnotiz()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Zszed�em w�a�nie do krypty i pr�bowa�em stawi� czo�a tym nieumar�ym kanaliom. C� to by� za poroniony pomys�. Da�em si� capn�� nie�le jednemu z nich. Wycofa�em si� do tej jaskini, odpoczn� troch� i postaram si� zaj�� swoimi ranami. Dziwnie si� czuj�. Mo�e spr�buj� si� troch� zdrzemn��.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Masco");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Sk�d mam najlepszy");
	Doc_PrintLine(nDocID,0,"widok na ca�� koloni�?");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Moja cz�� ca�o�ci:");
	Doc_PrintLine(nDocID,0,"D");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	if(mascosnotiz == FALSE)
	{
		Log_CreateTopic(MYSTERIOUSNOTICES,LOG_MISSION);
		Log_SetTopicStatus(MYSTERIOUSNOTICES,LOG_RUNNING);
		B_LogEntry(MYSTERIOUSNOTICES,"Znalaz�em niejakiego Masco w jaskini, w pobli�u krypty. Widocznie zszed� do niej i zosta� tam zraniony przez jednego z nieumar�ych, skutkiem czego pewnie dlatego zosta� przemieniony w Zombie. Pod listem odci�ni�ta zosta�a wielka litera D.");
		mascosnotiz = TRUE;
	};
};


instance ITWR_JANOSNOTIZ(C_Item)
{
	name = "Wiadomo�� od Jano";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = usejanosnotiz;
	description = name;
	text[0] = "";
	text[1] = "";
};


func void usejanosnotiz()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Dotar�em do tego starego kasztelu i ju� odnosz� wra�enie, �e nie b�dzie st�d nic do zabrania. Wszystko tutaj wydaje si� takie puste i opuszczone. Za spokojnie tu dla mnie. Nie jestem przekonany, czy to by� taki dobry pomys�, �eby ca�a nasza pi�tka si� rozdzieli�a. Przecie� powinni�my szuka� razem. Gdzie teraz mog� przebywa� Salm, Pelen, Masco i Dobrak?");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Jano");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Gdzie b�d� musia� si� zanurzy�,");
	Doc_PrintLine(nDocID,0,"by dotrze� do wiedzy?");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Moja cz�� ca�o�ci:");
	Doc_PrintLine(nDocID,0,"A");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	if(janosnotiz == FALSE)
	{
		Log_CreateTopic(MYSTERIOUSNOTICES,LOG_MISSION);
		Log_SetTopicStatus(MYSTERIOUSNOTICES,LOG_RUNNING);
		B_LogEntry(MYSTERIOUSNOTICES,"W g�rach, nad star� twierdz�, znalaz�em notatk� od niejakiego Jano. Najwyra�niej wyruszy� on z grup�, kt�ra rozdzieli�a si�, �eby czego� poszuka�. Pod listem odci�ni�ta zosta�a wielka litera A.");
		janosnotiz = TRUE;
	};
};


instance ITWR_DIRTYNOTIZ1(C_Item)
{
	name = "Pobrudzony �wistek";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItAr_Scroll_16.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = usedirtynotiz;
	description = name;
	text[0] = "";
	text[1] = "";
};


func void usedirtynotiz()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Uda�o si�. Chyba �aden z nadzorc�w nie zauwa�y�, �e zwia�em. Nareszcie jestem wolnym cz�owiekiem, podczas gdy reszta skaza�c�w musi dalej zasuwa� w kopalniach. Aczkolwiek co� tu si� wyprawia. Paru mag�w przyby�o jaki� czas temu do zamku. Zdaje si�, �e co� planuj�.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Jak na razie musz� pierw postara� si�");
	Doc_PrintLine(nDocID,0,"wydosta� z tej przekl�tej doliny,");
	Doc_PrintLine(nDocID,0,"inaczej wszystko na pr�no.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_DIRTYNOTIZ2(C_Item)
{
	name = "Podarty �wistek";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItAr_Scroll_16.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = usedirtynotiz2;
	description = name;
	text[0] = "";
	text[1] = "";
};


func void usedirtynotiz2()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ma�o brakowa�o. P�yn��em kawa�ek wzd�u� rzeki, a� nagle pojawi� si� konw�j z naprzeciwka, sk�adaj�cy si� z kilku nadzorc�w oraz sporej ilo�ci skaza�c�w. N�dzne miernoty... pewnie nast�pni do harowania w kopalniach dla tego kr�la. Jestem pewien, �e jeden z nich mnie widzia�. Ale nic nie powiedzia�. Wida� mi�dzy nami, skaza�cami, ci�gle istnieje co� w rodzaju wi�zi.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Od kilku dni id� po cichu za jednym z mag�w. Nosi przy sobie jaki� niebieski kamie�. Wygl�da na warto�ciowy. Zdaje si�, �e ten mag pod��a w kierunku morza.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Zajm� si� t� spraw�. Co� si� tu nied�ugo wydarzy, czuj� to.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_DIRTYNOTIZ3(C_Item)
{
	name = "Wyblak�y �wistek";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItAr_Scroll_16.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = usedirtynotiz3;
	description = name;
	text[0] = "";
	text[1] = "";
};


func void usedirtynotiz3()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Niepoj�te! Mag zaczarowa� ten niebieski kamyk i rozci�gn�� nad dolin� nagle ogromn�, niebiesk� barier�. Nie wygl�da za bardzo, �eby by�o to zaplanowane. Ten mag wygl�da� na zszokowanego, dok�adnie tak jak ja.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"I co ja mam teraz pocz��? Nie jestem pewien, czy b�d� w stanie przej�� przez t� barier�. Wygl�da na to, �e ca�a dolina jest teraz jednym, wielkim wi�zieniem.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Czyli chyba wszystko na pr�no. Ale nie odst�pi�. P�jd� jeszcze dalej, mo�e znajd� st�d jak�� drog�. Tak, na pewno. MUSI by� st�d jakie� wyj�cie.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_DIRTYNOTIZ4(C_Item)
{
	name = "Przestarza�y �wistek";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItAr_Scroll_16.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = usedirtynotiz4;
	description = name;
	text[0] = "";
	text[1] = "";
};


func void usedirtynotiz4()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Sta�o si�! Wi�niowie wszcz�li powstanie przeciwko nadzorcom i prowadz� walk� wewn�trz zamku. Dobrze, �e ju� wcze�niej wzi��em nogi za pas. Udam si� teraz na prze��cz i postaram si� st�d ulotni�.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Temu, kto znajdzie ten list i zobaczy obok moje zw�oki, powiem na koniec jeszcze jedno. Nie pr�buj si� st�d wydosta�. Ja pr�bowa�em i widzisz jak to si� sko�czy�o. Wi�c pog�d� si� z tym, �e ju� nigdy si� st�d nie wyrwiesz.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Szukaj�cy wolno�ci skazaniec");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_BUDDLERNOTIZ(C_Item)
{
	name = "Nabazgrolona wiadomo��";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItAr_Scroll_16.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = usebuddlernotiz;
	description = name;
	text[0] = "";
	text[1] = "";
};


func void usebuddlernotiz()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"Dzie� 152");
	Doc_PrintLines(nDocID,0,"Te cholerne drzwi s� zablokowane i niestety utkn�li�my w tej jaskini. Istnia�y plotki o tym amulecie i chyba s� one prawdziwe. Dziwnie si� czuj�, odk�d go zdoby�em. Zamkn��em go w skrzyni, jednak... jestem pewien, �e zesz�ej nocy s�ysza�em jakie� szeptaj�ce g�osy. Mam nadziej�, �e to tylko takie moje urojenia.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Dzie� 154");
	Doc_PrintLines(nDocID,0,"tO co� pzremawia do mnie ju� 2 noec. m�iw�em o tmy pozst�aym ale mi nei wiezryli. rozkauzje mi bym inynch zab i�. nie. nie. dlcazego po prsotu mI nei wiezr�? cch� pomco, ael oni nei hc�c mi. te g�o sy w mjoej g�oiwe. szlae�tswo.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Dzie� 155");
	Doc_PrintLines(nDocID,0,"deafef. po rposut . fiefdsfk. za ib�. grnjvfs. �mei j� s�i.. ci � g le. fdsfd. j u�. fdsge. ni e. b �d�. fdsfoema. deaf. martwi. fdsggsd. marwti. grgfsdfegr. ze �a frf ci. fdsifksd. sma. gnsjgdf. g� o dny. fdsgd. zje � prz yaj ci�. dase. fesd.");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

