
func void uselehren_der_goetter1_bookstand()
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
};

