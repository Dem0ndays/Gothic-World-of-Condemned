
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
	Doc_PrintLines(nDocID,0,"Wys³uchajcie s³ów bo¿ych, bo pragn¹ oni, byœcie ich wys³uchali. Przestrzegajcie praw bo¿ych, bo chc¹ oni, byœcie ich przestrzegali. Czcijcie kap³anów bo¿ych, bo oni s¹ wybrañcami ³aski...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"S³owa Innosa: A gdybyœcie nie mogli ich poj¹æ, nie odrzucajcie s³ów kap³anów, bo g³osz¹ oni moj¹ m¹droœæ. Gdy¿ ja jestem S³oñcem na niebie, œwiat³em i ¿yciem na Ziemi. A wszystko, co wrogiem jest S³oñca, jest i moim wrogiem, i zostanie wygnane do krainy wiecznej ciemnoœci.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"S³owa Adanosa: ¯yjcie i pracujcie, bo dzieñ stworzono po to, by m¹¿ móg³ ¿yæ i pracowaæ. Szukajcie wiedzy, byœcie mogli przekazaæ j¹ synom swoim, gdy¿ taka jest wola moja. Ale strze¿cie siê, bo cz³ek g³upi i leniwy zostanie wygnany do krainy wiecznej ciemnoœci.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"S³owa Beliara: A ktokolwiek wyst¹pi przeciw woli bo¿ej, ze mn¹ bêdzie mia³ do czynienia. Na jego cia³o ból zeœlê okrutny, a jego duch pójdzie ze mn¹ do krainy wiecznej ciemnoœci.");
	Doc_Show(nDocID);
};

