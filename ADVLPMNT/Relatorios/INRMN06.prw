#INCLUDE "RWMAKE.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ INRMN06  º Autor ³Bruno E. Souza      º Data ³  06/06/2014 º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Novo layout OS manutençao							      º±±
±±º          ³                                                 			  º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ MP11	                                                      º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
User Function INRMN06(cNumOrd)//UTILIZADO TAMBEM NO MOMENTO DE ABERTURA DE OS NA ROTINA INAPP47/INAMN08/INAPP24

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Declara variaveis										                ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

Private oFont08b	:= TFont():New("Arial",,08,,.T.,,,,.T.,.F.)
Private oFont11b	:= TFont():New("Arial",,11,,.T.,,,,.T.,.F.)
Private oFont12b	:= TFont():New("Arial",,12,,.T.,,,,.T.,.F.)
Private oFont15b	:= TFont():New("Arial",,15,,.T.,,,,.T.,.F.)
Private oBrshCinza	:= TBrush():New("",CLR_GRAY)
Private nLinha	    := 0
Private nLin        := 0 

Private nLinhaA     := 0 
Private nLinhaB     := 0  
Private nLinhaVa    := 0
Private nLinhaVb    := 0
Private Npag        := 0  

Private	nLibA       := 0
Private	nLinhaC 	:= 0
Private	nLinhaVc 	:= 0
Private	nLinhaVd 	:= 0

Private oPrint
Private cPerg   := "RMNT2" 
Private cNumOrdA:= cNumOrd

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Parametros																³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If EMPTY(cNumOrdA) 
	Pergunte(cPerg,.T.)
EndIf

Processa( {|lEnd| LBRIMPOS()}, 'Aguarde...','Gerando relatório...', .t. )

Return

/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Programa   ³LBRIMPOS	³ Autores ³ Bruno E. de Souza      ³ Data ³06/06/2014³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao  ³  Imprime Informações Complementares                          ³±±
±±³           ³                                                              ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß*/
Static Function LBRIMPOS()     


//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Inicializa Objeto TMSPrinter					   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
oPrint  := TMSPrinter():New("PEDIDO DE MANUTENÇÃO OS")
lPrinter:= oPrint:IsPrinterActive()
oPrint:SetPortrait()  // Marca Radio Button para impressao em paisagem
oPrint:SetpaperSize(9) // Ajuste para papel a4

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Caso nao encontre a impressora conectada localmente,³
//³abre a tela para escolha de impressora de rede      ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

If !lPrinter
	oPrint:Setup()
Endif

If !oPrint:IsPrinterActive()
	MsgInfo("Não existe nenhum impressora conectada no computador, impressão cancelada!")
	Return
Endif

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Inicia a impressao										   ³
//³ da Frente do Relatorio									   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ   

oPrint:StartPage()
LBOSMNT()
oPrint:EndPage()

oPrint:Preview()

Return

/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Programa   ³LBOSMNT	³ Autores ³ Bruno E. de Souza      ³ Data ³06/06/2014³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao  ³  Imprime Cabeçalho do Relatorio                              ³±±
±±³           ³                                                              ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß*/
Static Function LBOSMNT()

Local nLinha := 0
Local cQry   := ""
Local nBegin := 0 
Local cQryB  := ""
Local cQryC	 := ""
Local cQryD  := ""
Local cQryE	 := "" 
Local cQryF	 := ""  
Local li 	 := 0
Local cQtd   := ""  
Local cQtdA  := ""
Local cSolic := "" 
Local cOrdemTn := ""
Local nBeginb  := 0 
Private cTarefa := ""

cQry	:= "SELECT"											   													+ CRLF 
cQry	+="TJ_SITUACA,"										   												    + CRLF
cQry	+="TJ_X_HOROS,"										   												    + CRLF
cQry	+="TJ_ORDEM,"										   													+ CRLF
cQry	+="TJ_OBSERVA,"										   													+ CRLF
cQry	+="TJ_CCUSTO,"										   													+ CRLF
cQry	+="TJ_CODBEM,"																							+ CRLF
cQry	+="TJ_USUAINI,"																							+ CRLF
cQry	+="TJ_TIPMNT,"																							+ CRLF 
cQry	+="TJ_TPPARD,"																							+ CRLF
cQry	+="TQB_USUARI,"																							+ CRLF 
cQry	+="TJ_X_MAT,"																							+ CRLF  
cQry	+="TJ_X_ENTFE,"																							+ CRLF
cQry	+="TJ_X_SAIFE,"																							+ CRLF  
cQry	+="TJ_X_ENTBE,"																							+ CRLF
cQry	+="TJ_X_SAIBE,"																							+ CRLF
cQry	+="SUBSTRING(TJ_DTORIGI,7,2)+'/'+SUBSTRING(TJ_DTORIGI,5,2)+'/'+SUBSTRING(TJ_DTORIGI,1,4) AS 'DATAOS',"	+ CRLF
cQry	+="CTT_DESC01,"										   													+ CRLF
cQry	+="T9_NOME,"																							+ CRLF
cQry	+="T9_PRIORID,"																							+ CRLF
cQry	+="TD_NOME,"																							+ CRLF 
cQry	+="TJ_SEREXEC"																							+ CRLF
cQry	+="FROM"											   													+ CRLF
cQry	+="	"+RetSQLName("STJ")+" STJ"						   													+ CRLF
cQry	+="LEFT JOIN"										   													+ CRLF
cQry	+="	"+RetSQLName("CTT")+" CTT"						   													+ CRLF
cQry	+="ON"												  													+ CRLF
cQry	+="TJ_CCUSTO = CTT_CUSTO"							   													+ CRLF
cQry	+="AND"												   													+ CRLF
cQry	+="TJ_FILIAL = CTT_FILIAL"																				+ CRLF
cQry	+="AND"												   													+ CRLF
cQry	+="CTT_FILIAL = "+xfilial("CTT")+""					   													+ CRLF
cQry	+="AND"												  													+ CRLF
cQry	+="CTT.D_E_L_E_T_<>'*'"								  													+ CRLF
cQry	+="LEFT JOIN"																							+ CRLF
cQry	+="	"+RetSQLName("ST9")+" ST9"						  													+ CRLF
cQry	+="ON"												   													+ CRLF
cQry	+="TJ_CODBEM = T9_CODBEM"							  													+ CRLF
cQry	+="AND"												   													+ CRLF
cQry	+="TJ_FILIAL = T9_FILIAL"							   													+ CRLF
cQry	+="AND"   											  													+ CRLF
cQry	+="T9_FILIAL = "+xfilial("ST9")+""					   													+ CRLF
cQry	+="AND"												   													+ CRLF
cQry	+="ST9.D_E_L_E_T_ <>'*'"							   													+ CRLF
cQry	+="LEFT JOIN"																							+ CRLF
cQry	+="	"+RetSQLName("STD")+" STD"																			+ CRLF
cQry	+="ON"																									+ CRLF
cQry	+="TJ_CODAREA = TD_CODAREA"																				+ CRLF
cQry	+="AND"																									+ CRLF
cQry	+="STD.D_E_L_E_T_<>'*'"																					+ CRLF
cQry	+="LEFT JOIN"																							+ CRLF
cQry	+="TQB010 TQB"																				   			+ CRLF
cQry	+="ON"																				   					+ CRLF
cQry	+="TJ_ORDEM = TQB_ORDEM"																				+ CRLF
cQry	+="AND"																									+ CRLF
cQry	+="TJ_FILIAL = TQB_FILIAL"																				+ CRLF
cQry	+="AND"																									+ CRLF
cQry	+="TQB.D_E_L_E_T_<>'*'"																					+ CRLF
cQry	+="WHERE"											   													+ CRLF
cQry	+="STJ.D_E_L_E_T_<>'*'"								   													+ CRLF
cQry	+="AND"												   													+ CRLF 
//cQry	+="TJ_ORDEM = '"+MV_PAR01+"'" 															         		+ CRLF
If EMPTY(cNumOrdA)
	cQry	+="TJ_ORDEM BETWEEN '"+MV_PAR01+"' AND '"+MV_PAR02+"'"												+ CRLF
Else
	cQry	+="TJ_ORDEM BETWEEN '"+cNumOrd+"' AND '"+cNumOrdA+"'"												+ CRLF
EndIf
//cQry	+="AND"																								    + CRLF
//cQry	+="TJ_DTORIGI BETWEEN '"+DTOS(MV_PAR03)+"' AND '"+DTOS(MV_PAR04)+"'"									+ CRLF
cQry	+="AND"												   													+ CRLF
cQry	+="TJ_FILIAL = "+xfilial("STJ")+""					   													+ CRLF
cQry	+="ORDER BY"					   					   													+ CRLF
cQry	+="TJ_ORDEM"					   					   													+ CRLF

If Select("TEMP") > 0
	TEMP->(dbCloseArea())
EndIf

TcQuery cQry New Alias "TEMP"

TEMP->(dbGoTop())

While TEMP->(!EOF())
	If li > 55
		li:= 0
		oPrint:EndPage()
		oPrint:StartPage()
	EndIf
If TEMP->TJ_TIPMNT <> '5'
	IncProc("Aguarde !!! Processando registros reg.: "+TEMP->TJ_ORDEM)
	
	dbSelectArea("STJ")
	STJ->(dbSetOrder(1))
	STJ->(dbSeek(xFilial("STJ")+TEMP->TJ_ORDEM))
	
	dbSelectArea("STN")
	STN->(dbSetOrder(1))
	STN->(dbSeek(xFilial("STN")+TEMP->TJ_ORDEM))
	
	oPrint:Box (2950,0040,0080,2320)  //3250
	
	oPrint:FillRect( { 190 , 040 , 250 , 2320}, oBrshCinza )
	oPrint:FillRect( { 730 , 040 , 790 , 2320}, oBrshCinza )  //preenchimento fundo cinza
	oPrint:FillRect( { 1210, 040 , 1270, 2320}, oBrshCinza )
	oPrint:FillRect( { 1930, 040 , 1990, 2320}, oBrshCinza ) 
	//oPrint:FillRect( { 2770, 040 , 2830, 2320}, oBrshCinza )
	
	oPrint:Line(nLinha+0190,0040, nLinha+0190,2320) //1	    //Linha Horizontal
	oPrint:Line(nLinha+0250,0040, nLinha+0250,2320) //2
	oPrint:Line(nLinha+0310,0040, nLinha+0310,2320) //3
	oPrint:Line(nLinha+0370,0040, nLinha+0370,2320) //4
	oPrint:Line(nLinha+0430,0040, nLinha+0430,2320) //5
	oPrint:Line(nLinha+0490,0040, nLinha+0490,1640) //6
	oPrint:Line(nLinha+0550,0040, nLinha+0550,1640) //7
	oPrint:Line(nLinha+0610,0040, nLinha+0610,2320) //8
	oPrint:Line(nLinha+0670,0040, nLinha+0670,1640) //9
	oPrint:Line(nLinha+0730,0040, nLinha+0730,2320) //10
	oPrint:Line(nLinha+0790,0040, nLinha+0790,2320) //11
	oPrint:Line(nLinha+0850,0040, nLinha+0850,1640) //12
	oPrint:Line(nLinha+0910,0040, nLinha+0910,2320) //13
	oPrint:Line(nLinha+0970,0040, nLinha+0970,1640) //14	    //Linha Horizontal
	oPrint:Line(nLinha+1030,0040, nLinha+1030,2320) //15
	oPrint:Line(nLinha+1090,0040, nLinha+1090,1640) //16
	oPrint:Line(nLinha+1150,0040, nLinha+1150,1640) //17
	oPrint:Line(nLinha+1210,0040, nLinha+1210,2320) //18
	oPrint:Line(nLinha+1270,0040, nLinha+1270,2320) //19
	oPrint:Line(nLinha+1330,0040, nLinha+1330,2320) //20
	oPrint:Line(nLinha+1390,0040, nLinha+1390,2320) //21
	oPrint:Line(nLinha+1450,0040, nLinha+1450,2320) //22
	oPrint:Line(nLinha+1510,0040, nLinha+1510,2320) //23
	oPrint:Line(nLinha+1570,0040, nLinha+1570,2320) //24
	oPrint:Line(nLinha+1630,0040, nLinha+1630,2320) //25
	oPrint:Line(nLinha+1690,0040, nLinha+1690,2320) //26
	oPrint:Line(nLinha+1750,0040, nLinha+1750,2320) //27
	oPrint:Line(nLinha+1810,0040, nLinha+1810,2320) //28
	oPrint:Line(nLinha+1870,0040, nLinha+1870,2320) //29
	oPrint:Line(nLinha+1930,0040, nLinha+1930,2320) //30
	oPrint:Line(nLinha+1990,0040, nLinha+1990,2320) //31
	oPrint:Line(nLinha+2050,0040, nLinha+2050,2320) //32
	oPrint:Line(nLinha+2110,0040, nLinha+2110,2320) //33
	oPrint:Line(nLinha+2170,0040, nLinha+2170,2320) //34
	oPrint:Line(nLinha+2230,0040, nLinha+2230,2320) //35
	oPrint:Line(nLinha+2290,0040, nLinha+2290,2320) //36
	oPrint:Line(nLinha+2350,0040, nLinha+2350,2320) //37
	oPrint:Line(nLinha+2410,0040, nLinha+2410,2320) //38
	oPrint:Line(nLinha+2470,0040, nLinha+2470,2320) //39
	oPrint:Line(nLinha+2530,0040, nLinha+2530,2320) //40
	oPrint:Line(nLinha+2590,0040, nLinha+2590,2320) //41
	oPrint:Line(nLinha+2650,0040, nLinha+2650,2320) //42 
	oPrint:Line(nLinha+2710,0040, nLinha+2710,2320) //43
	oPrint:Line(nLinha+2770,0040, nLinha+2770,2320) //44
	oPrint:Line(nLinha+2830,0040, nLinha+2830,2320) //45
	oPrint:Line(nLinha+2890,0040, nLinha+2890,2320) //46
	/*oPrint:Line(nLinha+2950,0040, nLinha+2950,2320) //47
	oPrint:Line(nLinha+3010,0040, nLinha+3010,2320) //48
   	oPrint:Line(nLinha+3070,0040, nLinha+3070,2320) //49
   	oPrint:Line(nLinha+3130,0040, nLinha+3130,2320) //50
    oPrint:Line(nLinha+3190,0040, nLinha+3190,2320) //51*/
	
	oPrint:Line(nLinha+0080,0380, nLinha+0190,0380) //1     //Linhas Verticais
	oPrint:Line(nLinha+0080,1940, nLinha+0190,1940) //2
	oPrint:Line(nLinha+0310,1160, nLinha+0370,1160) //3
	oPrint:Line(nLinha+0370,0570, nLinha+0430,0570) //4
	oPrint:Line(nLinha+0370,0860, nLinha+0490,0860) //5
	oPrint:Line(nLinha+0370,1640, nLinha+0730,1640) //6
	oPrint:Line(nLinha+0430,1300, nLinha+0490,1300) //7
	oPrint:Line(nLinha+0790,1640, nLinha+1210,1640) //8
	oPrint:Line(nLinha+1270,0470, nLinha+1930,0470) //9
	oPrint:Line(nLinha+1270,1000, nLinha+1930,1000) //10
	oPrint:Line(nLinha+1990,0480, nLinha+2950,0480) //11
	oPrint:Line(nLinha+1990,0805, nLinha+2950,0805) //12
	oPrint:Line(nLinha+1990,1130, nLinha+2950,1130) //13
	oPrint:Line(nLinha+1990,1455, nLinha+2950,1455) //14
	oPrint:Line(nLinha+1990,1780, nLinha+2950,1780) //15
	oPrint:Line(nLinha+1990,2105, nLinha+2950,2105) //16 
	/*oPrint:Line(nLinha+2830,0480, nLinha+3250,0480) //17
	oPrint:Line(nLinha+2830,0710, nLinha+3250,0710) //18  
	oPrint:Line(nLinha+2830,0930, nLinha+3250,0930) //19
	oPrint:Line(nLinha+2830,1150, nLinha+3250,1150) //20
	oPrint:Line(nLinha+2830,1355, nLinha+3250,1355) //21
    oPrint:Line(nLinha+2830,1550, nLinha+3250,1550) //22 
	oPrint:Line(nLinha+2830,1700, nLinha+3250,1700) //23*/  //	oPrint:Line(nLinha+2650,1700, nLinha+3250,1700) //23
	
	oPrint:Say(0110,0100,"INYLBRA" 			     ,oFont15b,,CLR_BLUE)
	oPrint:Say(0110,0560,"PEDIDO DE MANUTENÇÃO" ,oFont15b) 
	oPrint:Say(0080,1945,"Nº" 					 ,oFont15b)
	oPrint:Say(0110,2000,TEMP->TJ_ORDEM			 ,oFont15b) //Nº ORDEM 
	MSBAR("CODE128", 1.2,11.7,TEMP->TJ_ORDEM,oPrint,.F.,,,0.03,0.8,,,"E",.F.)
	                                                                                                                                                                                                         
	oPrint:Say(0200,1050,"REQUISITANTE" 		 ,oFont12b)
  	If TEMP->TJ_TIPMNT == '1'
		oPrint:Say(0260,0050,"(X) Corretiva" 		 			 ,oFont11b)
   		oPrint:Say(0260,0400,"(__) Preventiva" 		 			 ,oFont11b)
		oPrint:Say(0260,0730,"(__) Preditiva" 		 			 ,oFont11b)
		oPrint:Say(0260,1090,"(__) Instalação/Construçao" 		 ,oFont11b)
   		oPrint:Say(0260,1600,"(__) Modificação/Reforma" 		 ,oFont11b)
	ElseIf TEMP->TJ_TIPMNT == '2'
   		oPrint:Say(0260,0050,"(__) Corretiva" 		 			 ,oFont11b)
		oPrint:Say(0260,0400,"(X) Preventiva" 		 			 ,oFont11b)
   		oPrint:Say(0260,0730,"(__) Preditiva" 		 			 ,oFont11b)
		oPrint:Say(0260,1090,"(__) Instalação/Construçao" 		 ,oFont11b)
   		oPrint:Say(0260,1600,"(__) Modificação/Reforma" 		 ,oFont11b) 
	ElseIf TEMP->TJ_TIPMNT == '3'
   		oPrint:Say(0260,0050,"(__) Corretiva" 		 			 ,oFont11b)
		oPrint:Say(0260,0400,"(__) Preventiva" 		 			 ,oFont11b)
   		oPrint:Say(0260,0730,"(X) Preditiva" 		 			 ,oFont11b)
   		oPrint:Say(0260,1090,"(__) Instalação/Construçao" 		 ,oFont11b)
   		oPrint:Say(0260,1600,"(__) Modificação/Reforma" 		 ,oFont11b)
	ElseIf TEMP->TJ_TIPMNT == '4'
   		oPrint:Say(0260,0050,"(__) Corretiva" 		 			 ,oFont11b)
   		oPrint:Say(0260,0400,"(__) Preventiva" 		 			 ,oFont11b)
   		oPrint:Say(0260,0730,"(__) Preditiva" 		 			 ,oFont11b)
   		oPrint:Say(0260,1090,"(X) Instalação/Construçao" 		 ,oFont11b)
   		oPrint:Say(0260,1600,"(__) Modificação/Reforma" 		 ,oFont11b)
	ElseIf TEMP->TJ_TIPMNT == '5'
		oPrint:Say(0260,0050,"(__) Corretiva" 		 			 ,oFont11b)
   		oPrint:Say(0260,0400,"(__) Preventiva" 		 			 ,oFont11b)
		oPrint:Say(0260,0730,"(__) Preditiva" 		 			 ,oFont11b)
   		oPrint:Say(0260,1090,"(__) Instalação/Construçao" 		 ,oFont11b)
   		oPrint:Say(0260,1600,"(X) Modificação/Reforma" 		 	 ,oFont11b)
    Else
		oPrint:Say(0260,0050,"(__) Corretiva" 		 			 ,oFont11b)
		oPrint:Say(0260,0400,"(__) Preventiva" 		 			 ,oFont11b)
		oPrint:Say(0260,0730,"(__) Preditiva" 		 			 ,oFont11b)
		oPrint:Say(0260,1090,"(__) Instalação/Construçao" 		 ,oFont11b)
		oPrint:Say(0260,1600,"(__) Modificação/Reforma" 		 ,oFont11b)
   	EndIf
	
	oPrint:Say(0315,0045,"Oficina" 		 ,oFont08b)
	oPrint:Say(0340,0045,TEMP->TD_NOME 	 ,oFont08b)
	
	oPrint:Say(0315,0730,"Situação da OS",oFont08b)
		If TEMP->TJ_SITUACA == 'C'
	oPrint:Say(0340,0730,"CANCELADA" 	 ,oFont08b)  
	
	ElseIf TEMP->TJ_SITUACA == 'P'
	oPrint:Say(0340,0730,"PENDENTE" 	 ,oFont08b)
	
	ElseIf TEMP->TJ_SITUACA == 'L'
	oPrint:Say(0340,0730,"LIBERADA" 	 ,oFont08b)
	EndIf
	
	/////////////DETERMINA PRIORIDADE//////////////////////////////
	
	oPrint:Say(0320,1170,"Prioridade" 	 ,oFont11b)
	If TEMP->T9_PRIORID == 'AAA'     
		oPrint:Say(0320,1400,"(X) Alta" 	 ,oFont11b)
		oPrint:Say(0320,1690,"(__) Média" 	 ,oFont11b)
		oPrint:Say(0320,1980,"(__) Baixa" 	 ,oFont11b)
		
	ElseIf TEMP->T9_PRIORID == 'ZZZ'  
		oPrint:Say(0320,1400,"(__) Alta" 	 ,oFont11b)
		oPrint:Say(0320,1690,"(X) Média" 	 ,oFont11b)
		oPrint:Say(0320,1980,"(__) Baixa" 	 ,oFont11b)
		
	ElseIf TEMP->T9_PRIORID == 'BBB'  
		oPrint:Say(0320,1400,"(__) Alta" 	 ,oFont11b)
		oPrint:Say(0320,1690,"(__) Média" 	 ,oFont11b)
		oPrint:Say(0320,1980,"(X) Baixa" 	 ,oFont11b)
		
	Else
		oPrint:Say(0320,1400,"(__) Alta" 	 ,oFont11b)
		oPrint:Say(0320,1690,"(__) Média" 	 ,oFont11b)
		oPrint:Say(0320,1980,"(__) Baixa" 	 ,oFont11b)
	EndIf
	
	/////////////DETERMINA PRIORIDADE FIM//////////////////////////////
	
	oPrint:Say(0375,0045,"Setor" 	 	 		 		 	,oFont08b)
	oPrint:Say(0400,0045,SUBSTR(TEMP->	CTT_DESC01,1,28) 	,oFont08b) //SETOR
	oPrint:Say(0375,0575,"C.Custo" 	 	 		 			,oFont08b)
	oPrint:Say(0400,0700,TEMP->TJ_CCUSTO 	 	 			,oFont08b) // CENTRO DE CUSTO
	oPrint:Say(0375,0865,"Maq. Equip" 	 		 			,oFont08b)
	oPrint:Say(0400,0865,TEMP->T9_NOME	 	 	 			,oFont08b)//MAQ. EQUIP
	oPrint:Say(0375,1645,"Código do Bem" 	 				,oFont08b)
	oPrint:Say(0400,1850,TEMP->TJ_CODBEM	 				,oFont08b)//CODIGO BEM
	
	cSolic := TEMP->TQB_USUARI
	If EMPTY(cSolic)
	
		dbSelectArea("SRA")
		SRA->(dbSetOrder(1))
		SRA->(dbSeek(xFilial("SRA")+TEMP->TJ_X_MAT)) 
		
		If EMPTY(TEMP->TJ_X_MAT)
			oPrint:Say(0435,0045,"Solicitante via OS" ,oFont08b)//solcitante via OS  //nesse casos se nao houver SS vinculada a OS, pega o nome de quem gerou a OS
			oPrint:Say(0460,0045,TEMP->TJ_USUAINI 	   ,oFont08b) 
		Else
			oPrint:Say(0435,0045,"Solicitante via OS" ,oFont08b)//solcitante via OS  //nesse casos se nao houver SS vinculada a OS, pega o nome de quem gerou a OS
			oPrint:Say(0460,0045,SRA->RA_NOME   	   ,oFont08b)
		EndIf		
	Else
		oPrint:Say(0435,0045,"Solicitante via SS" ,oFont08b)
		oPrint:Say(0460,0045,TEMP->TQB_USUARI     ,oFont08b) //solicitante via ss //nesse casos se houver SS vinculada a OS, pega o nome de quem gerou a SS
	EndIf
	
	oPrint:Say(0435,0865,"Data" 	 	 	 ,oFont08b)
	oPrint:Say(0460,0865,TEMP->DATAOS 	 	 ,oFont08b)
	oPrint:Say(0435,1305,"Hora" 	 		 ,oFont08b)
    oPrint:Say(0460,1305,TEMP->TJ_X_HOROS	 ,oFont08b)
	
	oPrint:Say(0495,0045,"Serviço solicitado:",oFont08b)
	
	nLi := 0510
	nCount:= MLCount(STJ->TJ_OBSERVA,80)
	For nBegin := 1 To iif(NCount > 4,4,NCount)
		if !Empty(MemoLine(STJ->TJ_OBSERVA,80,nBegin))                            //SERVICO SOLICITADO
			oPrint:Say (nLi,0295,MemoLine(STJ->TJ_OBSERVA,80,nBegin) ,oFont08b)
			nLi := nLi + 60
		endif
	Next nBegin
	
		oPrint:Say(0435,1645,"Parada:" 	 	 		 ,oFont08b) 
	If TEMP->TJ_TPPARD  == '1'
		oPrint:Say(0475,1645,"Total (X)" 	 	 	 ,oFont08b)
		oPrint:Say(0525,1645,"Parcial (__)" 	 	 ,oFont08b)
		oPrint:Say(0575,1645,"Sem Parada (__)" 	     ,oFont08b)
	ElseIf TEMP->TJ_TPPARD  == '2'
		oPrint:Say(0475,1645,"Total (__)" 	 	 	 ,oFont08b)
		oPrint:Say(0525,1645,"Parcial (X)"	 	 	 ,oFont08b)
		oPrint:Say(0575,1645,"Sem Parada (__)" 	     ,oFont08b)
	ElseIf TEMP->TJ_TPPARD  == '3'
		oPrint:Say(0475,1645,"Total (__)" 	 	 	 ,oFont08b)
		oPrint:Say(0525,1645,"Parcial (__)" 	 	 ,oFont08b)
		oPrint:Say(0575,1645,"Sem Parada (X)" 	     ,oFont08b)
	Else
		oPrint:Say(0475,1645,"Total (__)" 	 	 	 ,oFont08b)
		oPrint:Say(0525,1645,"Parcial (__)" 	 	 ,oFont08b)
		oPrint:Say(0575,1645,"Sem Parada (__)" 	     ,oFont08b)
	EndIf
	
	oPrint:Say(0615,1645,"Código Sintoma" 	 	 ,oFont08b)
	
	////////////////////////////PEGA DADOS PARA CAMPO DE SINTOMAS//////////////////////
	
	cQryC	:="SELECT							" + CRLF
	cQryC	+="TN_CODOCOR,						" + CRLF
	cQryC	+="T8_TIPO,							" + CRLF
	cQryC	+="T8_NOME,							" + CRLF
	cQryC	+="TN_ORDEM							" + CRLF
	cQryC	+="FROM								" + CRLF
	cQryC	+=""+RetSQLName("ST8")+" ST8		" + CRLF
	cQryC	+="LEFT JOIN						" + CRLF
	cQryC	+=""+RetSQLName("STN")+" STN		" + CRLF
	cQryC	+="ON								" + CRLF
	cQryC	+="T8_CODOCOR = TN_CODOCOR			" + CRLF
	cQryC	+="AND								" + CRLF
	cQryC	+="T8_FILIAL = TN_FILIAL			" + CRLF
	cQryC	+="AND								" + CRLF
	cQryC	+="STN.D_E_L_E_T_<>'*'				" + CRLF
	cQryC	+="AND       						" + CRLF
	cQryC	+="TN_FILIAL = "+xfilial("STN")+"	" + CRLF
	cQryC	+="WHERE							" + CRLF
	cQryC	+="TN_ORDEM = '"+TEMP->TJ_ORDEM+"' " + CRLF
	cQryC	+="AND								" + CRLF
	cQryC	+="ST8.D_E_L_E_T_<>'*'				" + CRLF
	cQryC	+="AND								" + CRLF
	cQryC	+="T8_FILIAL = "+xfilial("ST8")+"	" + CRLF
	
	If Select("TEMPC") > 0
		TEMPC->(dbCloseArea())
	EndIf
	
	TcQuery cQryC New Alias "TEMPC"
	
	TEMPC->(dbGoTop())
	nLid := 645
	While TEMPC->(!EOF())
		oPrint:Say(nLid,1645,TEMPC->TN_CODOCOR		 ,oFont08b)  //codigo sintoma
		oPrint:Say(nLid,1730,ALLTRIM(TEMPC->T8_NOME),oFont08b) //descriçao sintoma
		nLid := nLid + 25
		TEMPC->(dbSkip())
	EndDo
  //	TEMPC->(dbCloseArea())
	
	////////////////////////////FIM PEGA DADOS DOS SINTOMAS//////////////////////////////////////// 
	
   ////////////////////////////INICIO DADOS CAMPO SERVICO EXECUTADO///////////////////////////////
	
	oPrint:Say(0740,1050,"MANUTENÇÃO" 		     ,oFont12b)
	
	oPrint:Say(0795,0045,"Serviço executado:" 	 ,oFont08b)
	
   	dbSelectArea("STN")
	STN->(dbSetOrder(1))
	STN->(dbSeek(xFilial("STN")+TEMP->TJ_ORDEM))
	cOrdemTn := TEMP->TJ_ORDEM
   
	nLib := 0810   
	
	If Empty(STJ->TJ_SEREXEC)
		//Solicitado pelo Alexandro para Buscar do Campo Memo
	   	While STN->(!EOF()) .and. cOrdemTn == STN->TN_ORDEM
			nCountb:= MLCount(STN->TN_DESCRIC,80)
			For nBeginb := 1 To iif(NCountb > 7,7,NCountb)
				if !Empty(MemoLine(STN->TN_DESCRIC,80,nBeginb))                            //SERVICO EXECUTADO
					oPrint:Say (nLib,0295,MemoLine(STN->TN_DESCRIC,80,nBeginb) ,oFont08b)
					nLib := nLib + 60
				endif
		   	Next nBeginb 
			STN->(dbSkip())
		EndDo  
	Else
	
		nCountb:= MLCount(STJ->TJ_SEREXEC,80)
		For nBeginb := 1 To iif(NCountb > 7,7,NCountb)
			if !Empty(MemoLine(STJ->TJ_SEREXEC,80,nBeginb))                            //SERVICO EXECUTADO
				oPrint:Say (nLib,0295,MemoLine(STJ->TJ_SEREXEC,80,nBeginb) ,oFont08b)
				nLib := nLib + 60
			endif
		Next nBeginb  
		
     Endif
	
	////////////////////////////FIM DADOS CAMPO SERVICO EXECUTADO///////////////////////////////
	
	////////////////////////////PEGA DADOS CAMPO CAUSA///////////////////////////////////////////  
	
	If Empty(STJ->TJ_SEREXEC)  
	
   		oPrint:Say(0795,1645,"Causa" 	 	 		 ,oFont08b)
		
		cQryD	:="SELECT							" + CRLF
		cQryD	+="TN_CAUSA,						" + CRLF
		cQryD	+="T8_TIPO,							" + CRLF
		cQryD	+="T8_NOME,							" + CRLF
		cQryD	+="TN_ORDEM							" + CRLF
		cQryD	+="FROM								" + CRLF
		cQryD	+=""+RetSQLName("ST8")+" ST8		" + CRLF
		cQryD	+="LEFT JOIN						" + CRLF
		cQryD	+=""+RetSQLName("STN")+" STN		" + CRLF
		cQryD	+="ON								" + CRLF
		cQryD	+="T8_CODOCOR = TN_CAUSA			" + CRLF
		cQryD	+="AND								" + CRLF
		cQryD	+="T8_FILIAL = TN_FILIAL			" + CRLF
		cQryD	+="AND								" + CRLF
		cQryD	+="STN.D_E_L_E_T_<>'*'				" + CRLF
		cQryD	+="AND       						" + CRLF
		cQryD	+="TN_FILIAL = "+xfilial("STN")+"	" + CRLF
		cQryD	+="WHERE							" + CRLF
		cQryD	+="TN_ORDEM = '"+TEMP->TJ_ORDEM+"' " + CRLF
		cQryD	+="AND								" + CRLF
		cQryD	+="ST8.D_E_L_E_T_<>'*'				" + CRLF
		cQryD	+="AND								" + CRLF
		cQryD	+="T8_FILIAL = "+xfilial("ST8")+"	" + CRLF
		
		If Select("TEMPD") > 0
			TEMPD->(dbCloseArea())
		EndIf
		
		TcQuery cQryD New Alias "TEMPD"
		
		TEMPD->(dbGoTop())
		nLie := 825
		While TEMPD->(!EOF())
		   	oPrint:Say(nLie,1645,TEMPD->TN_CAUSA	 	  ,oFont08b)   //codigo CAUSA
		   	oPrint:Say(nLie,1730,ALLTRIM(TEMPD->T8_NOME) ,oFont08b)  //descriçao CAUSA
			nLie := nLie + 25
			TEMPD->(dbSkip())
		EndDo
		TEMPD->(dbCloseArea())
	
	Endif
	////////////////////////////FIM PEGA DADOS CAUSA///////////////////////////////////////////
	
   	
	
	//////////////////////////PEGA DADOS INTERVENCAO//////////////////////////////////////////
	
	If Empty(STJ->TJ_SEREXEC) 
	
  		oPrint:Say(0915,1645,"Intervenção" 	 		 ,oFont08b)
	
		cQryE	:="SELECT							" + CRLF
		cQryE	+="TN_SOLUCAO,						" + CRLF
		cQryE	+="T8_TIPO,							" + CRLF
		cQryE	+="T8_NOME,							" + CRLF
		cQryE	+="TN_ORDEM							" + CRLF
		cQryE	+="FROM								" + CRLF
		cQryE	+=""+RetSQLName("ST8")+" ST8		" + CRLF
		cQryE	+="LEFT JOIN						" + CRLF
		cQryE	+=""+RetSQLName("STN")+" STN		" + CRLF
		cQryE	+="ON								" + CRLF
		cQryE	+="T8_CODOCOR = TN_SOLUCAO			" + CRLF
		cQryE	+="AND								" + CRLF
		cQryE	+="T8_FILIAL = TN_FILIAL			" + CRLF
		cQryE	+="AND								" + CRLF
		cQryE	+="STN.D_E_L_E_T_<>'*'				" + CRLF
		cQryE	+="AND       						" + CRLF
		cQryE	+="TN_FILIAL = "+xfilial("STN")+"	" + CRLF
		cQryE	+="WHERE							" + CRLF
		cQryE	+="TN_ORDEM = '"+TEMP->TJ_ORDEM+"' " + CRLF
		cQryE	+="AND								" + CRLF
		cQryE	+="ST8.D_E_L_E_T_<>'*'				" + CRLF
		cQryE	+="AND								" + CRLF
		cQryE	+="T8_FILIAL = "+xfilial("ST8")+"	" + CRLF
		
		If Select("TEMPE") > 0
			TEMPE->(dbCloseArea())
		EndIf
		
		TcQuery cQryE New Alias "TEMPE"
		
		TEMPE->(dbGoTop())
			nLif := 940
			While TEMPE->(!EOF())
			  	oPrint:Say(nLif,1645,TEMPE->TN_SOLUCAO	 	  ,oFont08b)   //codigo INTERVENCAO
			  	oPrint:Say(nLif,1730,ALLTRIM(TEMPE->T8_NOME) ,oFont08b)  //descriçao INTERVENCAO
				nLif := nLif + 25
				TEMPE->(dbSkip())
			EndDo
		TEMPE->(dbCloseArea())
	 
	Endif
	/////////////////////////////////////PEGA DADOS INTERVENCAO//////////////////////////////////////    
	
	/////////////////////////////////////entrada e saida ferramenta///////////////////////////////// 
	
	dbSelectArea("ST9")
	ST9->(dbSetOrder(1))
	ST9->(dbSeek(xFilial("ST9")+TEMP->TJ_X_ENTFE))   
                                                                          

	oPrint:Say(1035,1645,"Entrada Ferramenta: "+Alltrim(TEMP->TJ_X_ENTFE) + "  /  " + TEMP->TJ_X_ENTBE ,oFont08b)
	oPrint:Say(1075,1645,ST9->T9_NOME	,oFont08b) 
	
	dbSelectArea("ST9")
	ST9->(dbSetOrder(1))
	ST9->(dbSeek(xFilial("ST9")+TEMP->TJ_X_SAIFE))
	
   	oPrint:Say(1115,1645,"Saida Ferramenta: "+Alltrim(TEMP->TJ_X_SAIFE) + "  /  " + TEMP->TJ_X_SAIBE ,oFont08b)
   	oPrint:Say(1155,1645,ST9->T9_NOME	,oFont08b) 
	
	/////////////////////////////////////entrada e saida ferramenta FIM//////////////////////////// 
	
	oPrint:Say(1220,1050,"MATERIAL UTILIZADO" 	 ,oFont12b)
	
	oPrint:Say(1280,0215,"Qtde" 	 	 		 ,oFont08b)
	oPrint:Say(1280,0630,"Código do Material" 	 ,oFont08b)
	oPrint:Say(1280,1500,"Descrição do material",oFont08b)
	
	oPrint:Say(1940,1050,"MÃO DE OBRA UTILIZADA",oFont12b)
	
	oPrint:Say(1995,0045,"Nome do Funcion." 	,oFont08b)
	oPrint:Say(1995,0485,"R.E. do Funcion."    ,oFont08b)
	oPrint:Say(1995,0810,"Data Início Tarefa"  ,oFont08b)
	oPrint:Say(1995,1135,"Hora Início Tarefa"  ,oFont08b)
	oPrint:Say(1995,1460,"Data Fim Tarefa" 	    ,oFont08b)
	oPrint:Say(1995,1785,"Hora Fim tarefa"  	,oFont08b)
	oPrint:Say(1995,2110,"Total Horas" 		    ,oFont08b)
	
	////////////////////////////PEGA DADOS DOS INSUMOS UTILIZADOS NA OS (MC E MAO DE OBRA)////////
	
	cQryB	:="		SELECT																				   				" + CRLF
	cQryB	+="		TL_ORDEM,																			   				" + CRLF
	cQryB	+="		TL_CODIGO,							   												   				" + CRLF
	cQryB	+="		TL_TAREFA,							   												   				" + CRLF
	cQryB	+="		TL_QUANTID,							   												   				" + CRLF
	cQryB	+="		TL_TIPOREG,																			   				" + CRLF
	cQryB	+="		SUBSTRING(TL_DTINICI,7,2)+'/'+SUBSTRING(TL_DTINICI,5,2)+'/'+SUBSTRING(TL_DTINICI,1,4) AS 'DATAINI', " + CRLF
	cQryB	+="		TL_HOINICI, 																		   				" + CRLF
	cQryB	+="		SUBSTRING(TL_DTFIM,7,2)+'/'+SUBSTRING(TL_DTFIM,5,2)+'/'+SUBSTRING(TL_DTFIM,1,4) AS 'DATAFIM',   	" + CRLF
	cQryB	+="		TL_HOFIM, 						   																	" + CRLF
	cQryB	+="		B1_DESC,																							" + CRLF
	cQryB	+="		RA_MAT,																								" + CRLF
	cQryB	+="		RA_NOME																				   				" + CRLF
	cQryB	+="		FROM								   												   				" + CRLF
	cQryB	+="		"+RetSQLName("STL")+" STL															   				" + CRLF
	cQryB	+="		LEFT JOIN																			   				" + CRLF
	cQryB	+="		"+RetSQLName("SB1")+" SB1															   				" + CRLF
	cQryB	+="		ON																									" + CRLF
	cQryB	+="		TL_CODIGO = B1_COD																	   				" + CRLF
	cQryB	+="		AND																					   				" + CRLF
	cQryB	+="		SB1.D_E_L_E_T_ <> '*'																   				" + CRLF
	cQryB	+="		LEFT JOIN																							" + CRLF
	cQryB	+="		"+RetSQLName("SRA")+" SRA															   				" + CRLF
	cQryB	+="		ON									   												   				" + CRLF
	cQryB	+="		TL_CODIGO = RA_MAT																	   				" + CRLF
	cQryB	+="		AND																					   				" + CRLF
	cQryB	+="		TL_FILIAL = RA_FILIAL																   				" + CRLF
	cQryB	+="		AND																									" + CRLF
	cQryB	+="		RA_FILIAL = "+xfilial("SRA")+"		   												   				" + CRLF
	cQryB	+="		AND																									" + CRLF
	cQryB	+="		SRA.D_E_L_E_T_ <> '*'																   				" + CRLF
	cQryB	+="		WHERE																				   				" + CRLF
	cQryB	+="		STL.D_E_L_E_T_ <> '*'																   				" + CRLF
	cQryB	+="		AND																					   				" + CRLF
	cQryB	+="		TL_FILIAL = "+xfilial("STL")+"														   				" + CRLF
	cQryB	+="		AND																					   				" + CRLF
	cQryB	+="     TL_REPFIM <>''																				        " + CRLF    //nao considera insumos previstos 02/04/2018
	cQryB	+="	    AND                                                                                                 " + CRLF
	cQryB	+="		TL_ORDEM = '"+TEMP->TJ_ORDEM+"'		   												   				" + CRLF
	cQryB	+="		ORDER BY																			   				" + CRLF
	cQryB	+="		TL_ORDEM																			   				" + CRLF
	
	If Select("TEMPB") > 0
		TEMPB->(dbCloseArea())
	EndIf
	
	TcQuery cQryB New Alias "TEMPB"
	
	TEMPB->(dbGoTop())
	nLib := 1345
	nLic := 2080
	While TEMPB->(!EOF())  
   
		_cDtIn	:= VAL(SUBSTR(TEMPB->DATAINI,7,4)+SUBSTR(TEMPB->DATAINI,4,2)+SUBSTR(TEMPB->DATAINI,1,2))
		_cDtFim	:= VAL(SUBSTR(TEMPB->DATAFIM,7,4)+SUBSTR(TEMPB->DATAFIM,4,2)+SUBSTR(TEMPB->DATAFIM,1,2))
			   
	   //	nHoraTotaB := U_CalcHoras(_cDtIn,TEMPB->TL_HOINICI,_cDtFim,TEMPB->TL_HOFIM) //calcula horas
		cQtd := CVALTOCHAR(TEMPB->TL_QUANTID)
		
		If	TEMPB->TL_TIPOREG == 'P'
			oPrint:Say(nLib,0215,cQtd	 	 		,oFont11b)//quantidade peças  //Qtde
			oPrint:Say(nLib,0630,TEMPB->TL_CODIGO	,oFont11b)//Código do Material
			oPrint:Say(nLib,1005,TEMPB->B1_DESC 	,oFont11b)//Descrição do material
			nLib := nLib + 60
		ElseIf TEMPB->TL_TIPOREG == 'M' 
		    
		    cTarefa := TEMPB->TL_TAREFA
		
			oPrint:Say(nLic,0045,SUBSTR(TEMPB->RA_NOME,1,25),oFont08b)//Nome do funcionario
			oPrint:Say(nLic,0580,TEMPB->RA_MAT     			  ,oFont08b)//Matricula
			
			oPrint:Say(nLic,0910,TEMPB->DATAINI    			  ,oFont08b)//Data Início Tarefa
			oPrint:Say(nLic,1235,TEMPB->TL_HOINICI+" HRS"    ,oFont08b)//Hora Início Tarefa
			oPrint:Say(nLic,1560,TEMPB->DATAFIM              ,oFont08b)//Data Fim Tarefa
			oPrint:Say(nLic,1885,TEMPB->TL_HOFIM+" HRS"      ,oFont08b)//Hora Fim tarefa
			oPrint:Say(nLic,2185,cQtd+" HRS"           		  ,oFont08b)//Total Horas
			
			nLic := nLic + 60
			
		EndIf
		
		TEMPB->(dbSkip())
	EndDo
	
	TEMPB->(dbCloseArea())
	
	/////////////////FIM PEGA DADOS DOS INSUMOS UTILIZADOS NA OS (MC E MAO DE OBRA)///////////   
	 
	////////////////////////////PEGA DADOS DOS MOTIVOS DE ATRASO////////retirado a pedido manutençao 02/12/2020
	/*cQryA	:="		SELECT								" + CRLF
	cQryA	+="		TPL_ORDEM AS 'OS',					" + CRLF
	cQryA	+="		TPL_DTINIC AS 'DATAINI',			" + CRLF
	cQryA	+="		TPL_HOINIC AS 'HORAINI',			" + CRLF
	cQryA	+="		TPL_DTFIM AS 'DATAFIM',				" + CRLF
	cQryA	+="		TPL_HOFIM AS 'HORAFIM',				" + CRLF
	cQryA	+="		TPJ_DESMOT AS 'DESMOTAT'			" + CRLF
	cQryA	+="		FROM								" + CRLF
	cQryA	+="		"+RetSQLName("TPL")+" TPL			" + CRLF
	cQryA	+="		JOIN								" + CRLF
	cQryA	+="		"+RetSQLName("TPJ")+" TPJ		    " + CRLF
	cQryA	+="		ON									" + CRLF
	cQryA	+="		TPL_CODMOT = TPJ_CODMOT				" + CRLF    
	cQryA	+="		AND									" + CRLF
	cQryA	+="		TPL_FILIAL = TPJ_FILIAL				" + CRLF
	cQryA	+="		WHERE								" + CRLF
	cQryA	+="		TPL.D_E_L_E_T_<>'*'					" + CRLF
	cQryA	+="		AND									" + CRLF
	cQryA	+="		TPJ.D_E_L_E_T_<>'*'					" + CRLF
	cQryA	+="		AND									" + CRLF
	cQryA	+="		TPL_ORDEM = '"+TEMP->TJ_ORDEM+"'	" + CRLF	 
	cQryA	+="		AND									" + CRLF
	cQryA	+="		TPJ_FILIAL =  "+xfilial("TPJ")+"	" + CRLF
	cQryA	+="		AND									" + CRLF
	cQryA	+="		TPL_FILIAL =  "+xfilial("TPL")+"	" + CRLF	

	If Select("TEMPA") > 0
		TEMPA->(dbCloseArea())
	EndIf
	
	TcQuery cQryA New Alias "TEMPA"
	
	oPrint:Say(2780,1050,"INTERRUPÇÕES" 	 ,oFont12b)
	
	oPrint:Say(2835,0045,"Nome do Funcion." 	,oFont08b)
	oPrint:Say(2835,0485,"R.E. do Funcion."    ,oFont08b)
	oPrint:Say(2835,0715,"Data Início Trf"  	,oFont08b)//tarefa
	oPrint:Say(2835,0935,"Hora Início Trf"  	,oFont08b)
   	oPrint:Say(2835,1155,"Data Fim Trf" 	    ,oFont08b)
	oPrint:Say(2835,1360,"Hora Fim Trf"  		,oFont08b) 
	oPrint:Say(2835,1555,"Total Hrs" 		    ,oFont08b) 
	oPrint:Say(2835,1705,"Motivo"	 		    ,oFont08b) 
	
	TEMPA->(dbGoTop())  
	nLia := 2740
	While TEMPA->(!EOF())  
	
		_cDtInA	 := VAL(SUBSTR(TEMPA->DATAINI,5,4)+SUBSTR(TEMPA->DATAINI,3,2)+SUBSTR(TEMPA->DATAINI,1,2))
		_cDtFimA := VAL(SUBSTR(TEMPA->DATAFIM,5,4)+SUBSTR(TEMPA->DATAFIM,3,2)+SUBSTR(TEMPA->DATAFIM,1,2))
			   
		nHoraTotal := U_CalcHoras(_cDtInA,TEMPA->HORAINI,_cDtFimA,TEMPA->HORAFIM) 
		
			oPrint:Say(nLia,0715,substr(TEMPA->DATAINI,7,2)+"/"+substr(TEMPA->DATAINI,5,2)+"/"+substr(TEMPA->DATAINI,1,4),oFont08b)//Data Início Tarefa
			oPrint:Say(nLia,0935,TEMPA->HORAINI+" HRS"    ,oFont08b)//Hora Início Tarefa
			oPrint:Say(nLia,1155,substr(TEMPA->DATAFIM,7,2)+"/"+substr(TEMPA->DATAFIM,5,2)+"/"+substr(TEMPA->DATAFIM,1,4),oFont08b)//Data Fim Tarefa
			oPrint:Say(nLia,1360,TEMPA->HORAFIM+" HRS"    ,oFont08b)//Hora Fim tarefa
			oPrint:Say(nLia,1555,nHoraTotal+" HRS"        ,oFont08b)//Total Horas     
	        oPrint:Say(nLia,1705,Alltrim(TEMPA->DESMOTAT) ,oFont08b)//Desc. Motivo 
		   
			nLia := nLia + 60
	
	TEMPA->(dbSkip())
	EndDo
	
	TEMPA->(dbCloseArea())
	
	oPrint:Say(3260,0715,"Assinalar somente em caso de troca de ferramentas*" 	    ,oFont11b)
	oPrint:Say(3310,0715,"As ferramentas estão em perfeita condiçoes de uso?"  	    ,oFont11b) 
	If Alltrim(cTarefa) == "01" 
		oPrint:Say(3360,0715,"Sim (X)  Não______ (Se não, abrir check list)"		,oFont11b)
	Elseif Alltrim(cTarefa) == "02" 
   		oPrint:Say(3360,0715,"Sim______ Não (X)  (Se não, abrir check list)"		,oFont11b)
	Else
 		oPrint:Say(3360,0715,"Sim______ Não______ (Se não, abrir check list)"		,oFont11b)
	Endif*/
		
	li := 56

Else  //ORDEM DE SERVIÇO REFORMA/MODIFICAÇÃO
   
		IncProc("Aguarde !!! Processando registros reg.: "+TEMP->TJ_ORDEM)
	
	dbSelectArea("STJ")
	STJ->(dbSetOrder(1))
	STJ->(dbSeek(xFilial("STJ")+TEMP->TJ_ORDEM))
	
	dbSelectArea("STN")
	STN->(dbSetOrder(1))
	STN->(dbSeek(xFilial("STN")+TEMP->TJ_ORDEM))
	
	oPrint:Box (3250,0040,0080,2320)  //3250
	
	oPrint:FillRect( { 190 , 040 , 250 , 2320}, oBrshCinza ) 
	oPrint:FillRect( { 730 , 040 , 790 , 2320}, oBrshCinza )  //preenchimento fundo cinza
 
	oPrint:Line(nLinha+0190,0040, nLinha+0190,2320) //1	    //Linha Horizontal
	oPrint:Line(nLinha+0250,0040, nLinha+0250,2320) //2
	oPrint:Line(nLinha+0310,0040, nLinha+0310,2320) //3
	oPrint:Line(nLinha+0370,0040, nLinha+0370,2320) //4
	oPrint:Line(nLinha+0430,0040, nLinha+0430,2320) //5
	oPrint:Line(nLinha+0490,0040, nLinha+0490,1640) //6
	oPrint:Line(nLinha+0550,0040, nLinha+0550,1640) //7
	oPrint:Line(nLinha+0610,0040, nLinha+0610,2320) //8
	oPrint:Line(nLinha+0670,0040, nLinha+0670,2320) //9
	oPrint:Line(nLinha+0730,0040, nLinha+0730,2320) //10
	oPrint:Line(nLinha+0790,0040, nLinha+0790,2320) //11
 
	oPrint:Line(nLinha+0080,0380, nLinha+0190,0380) //1     //Linhas Verticais
	oPrint:Line(nLinha+0080,1940, nLinha+0190,1940) //2
	oPrint:Line(nLinha+0310,1160, nLinha+0370,1160) //3
	oPrint:Line(nLinha+0370,0570, nLinha+0430,0570) //4
	oPrint:Line(nLinha+0370,0860, nLinha+0490,0860) //5
	oPrint:Line(nLinha+0370,1640, nLinha+0610,1640) //6
	oPrint:Line(nLinha+0430,1300, nLinha+0490,1300) //7

	oPrint:Say(0110,0100,"INYLBRA" 			     ,oFont15b)
	oPrint:Say(0110,0500,"ORDEM DE SERVIÇO REFORMA/MODIFICAÇÃO" ,oFont15b)
	oPrint:Say(0080,1945,"Nº" 					 ,oFont15b)
	oPrint:Say(0110,2000,TEMP->TJ_ORDEM			 ,oFont15b) //Nº ORDEM 
	                                                                                                                                                                                                         
	oPrint:Say(0200,1050,"REQUISITANTE" 		 ,oFont12b)
  	If TEMP->TJ_TIPMNT == '1'
		oPrint:Say(0260,0050,"(X) Corretiva" 		 			 ,oFont11b)
   		oPrint:Say(0260,0400,"(__) Preventiva" 		 			 ,oFont11b)
		oPrint:Say(0260,0730,"(__) Preditiva" 		 			 ,oFont11b)
		oPrint:Say(0260,1090,"(__) Instalação/Construçao" 		 ,oFont11b)
   		oPrint:Say(0260,1600,"(__) Modificação/Reforma" 		 ,oFont11b)
	ElseIf TEMP->TJ_TIPMNT == '2'
   		oPrint:Say(0260,0050,"(__) Corretiva" 		 			 ,oFont11b)
		oPrint:Say(0260,0400,"(X) Preventiva" 		 			 ,oFont11b)
   		oPrint:Say(0260,0730,"(__) Preditiva" 		 			 ,oFont11b)
		oPrint:Say(0260,1090,"(__) Instalação/Construçao" 		 ,oFont11b)
   		oPrint:Say(0260,1600,"(__) Modificação/Reforma" 		 ,oFont11b) 
	ElseIf TEMP->TJ_TIPMNT == '3'
   		oPrint:Say(0260,0050,"(__) Corretiva" 		 			 ,oFont11b)
		oPrint:Say(0260,0400,"(__) Preventiva" 		 			 ,oFont11b)
   		oPrint:Say(0260,0730,"(X) Preditiva" 		 			 ,oFont11b)
   		oPrint:Say(0260,1090,"(__) Instalação/Construçao" 		 ,oFont11b)
   		oPrint:Say(0260,1600,"(__) Modificação/Reforma" 		 ,oFont11b)
	ElseIf TEMP->TJ_TIPMNT == '4'
   		oPrint:Say(0260,0050,"(__) Corretiva" 		 			 ,oFont11b)
   		oPrint:Say(0260,0400,"(__) Preventiva" 		 			 ,oFont11b)
   		oPrint:Say(0260,0730,"(__) Preditiva" 		 			 ,oFont11b)
   		oPrint:Say(0260,1090,"(X) Instalação/Construçao" 		 ,oFont11b)
   		oPrint:Say(0260,1600,"(__) Modificação/Reforma" 		 ,oFont11b)
	ElseIf TEMP->TJ_TIPMNT == '5'
		oPrint:Say(0260,0050,"(__) Corretiva" 		 			 ,oFont11b)
   		oPrint:Say(0260,0400,"(__) Preventiva" 		 			 ,oFont11b)
		oPrint:Say(0260,0730,"(__) Preditiva" 		 			 ,oFont11b)
   		oPrint:Say(0260,1090,"(__) Instalação/Construçao" 		 ,oFont11b)
   		oPrint:Say(0260,1600,"(X) Modificação/Reforma" 		 	 ,oFont11b)
    Else
		oPrint:Say(0260,0050,"(__) Corretiva" 		 			 ,oFont11b)
		oPrint:Say(0260,0400,"(__) Preventiva" 		 			 ,oFont11b)
		oPrint:Say(0260,0730,"(__) Preditiva" 		 			 ,oFont11b)
		oPrint:Say(0260,1090,"(__) Instalação/Construçao" 		 ,oFont11b)
		oPrint:Say(0260,1600,"(__) Modificação/Reforma" 		 ,oFont11b)
   	EndIf
	
	oPrint:Say(0315,0045,"Oficina" 		 ,oFont08b)
	oPrint:Say(0340,0045,TEMP->TD_NOME 	 ,oFont08b)
	
	oPrint:Say(0315,0730,"Situação da OS",oFont08b)
		If TEMP->TJ_SITUACA == 'C'
	oPrint:Say(0340,0730,"CANCELADA" 	 ,oFont08b)  
	
	ElseIf TEMP->TJ_SITUACA == 'P'
	oPrint:Say(0340,0730,"PENDENTE" 	 ,oFont08b)
	
	ElseIf TEMP->TJ_SITUACA == 'L'
	oPrint:Say(0340,0730,"LIBERADA" 	 ,oFont08b)
	EndIf
	
	/////////////DETERMINA PRIORIDADE//////////////////////////////
	
		oPrint:Say(0320,1170,"Prioridade" 	 ,oFont11b)
	If TEMP->T9_PRIORID == 'AAA'     
		oPrint:Say(0320,1400,"(X) Alta" 	 ,oFont11b)
		oPrint:Say(0320,1690,"(__) Média" 	 ,oFont11b)
		oPrint:Say(0320,1980,"(__) Baixa" 	 ,oFont11b)
		
	ElseIf TEMP->T9_PRIORID == 'ZZZ'  
		oPrint:Say(0320,1400,"(__) Alta" 	 ,oFont11b)
		oPrint:Say(0320,1690,"(X) Média" 	 ,oFont11b)
		oPrint:Say(0320,1980,"(__) Baixa" 	 ,oFont11b)
		
	ElseIf TEMP->T9_PRIORID == 'BBB'  
		oPrint:Say(0320,1400,"(__) Alta" 	 ,oFont11b)
		oPrint:Say(0320,1690,"(__) Média" 	 ,oFont11b)
		oPrint:Say(0320,1980,"(X) Baixa" 	 ,oFont11b)
		
	Else
		oPrint:Say(0320,1400,"(__) Alta" 	 ,oFont11b)
		oPrint:Say(0320,1690,"(__) Média" 	 ,oFont11b)
		oPrint:Say(0320,1980,"(__) Baixa" 	 ,oFont11b)
	EndIf
	
	/////////////DETERMINA PRIORIDADE FIM//////////////////////////////
	
	oPrint:Say(0375,0045,"Setor" 	 	 		 		 	,oFont08b)
	oPrint:Say(0400,0045,SUBSTR(TEMP->	CTT_DESC01,1,28) 	,oFont08b) //SETOR
	oPrint:Say(0375,0575,"C.Custo" 	 	 		 			,oFont08b)
	oPrint:Say(0400,0700,TEMP->TJ_CCUSTO 	 	 			,oFont08b) // CENTRO DE CUSTO
	oPrint:Say(0375,0865,"Maq. Equip" 	 		 			,oFont08b)
	oPrint:Say(0400,0865,TEMP->T9_NOME	 	 	 			,oFont08b)//MAQ. EQUIP
	oPrint:Say(0375,1645,"Código do Bem" 	 				,oFont08b)
	oPrint:Say(0400,1850,TEMP->TJ_CODBEM	 				,oFont08b)//CODIGO BEM
	
	cSolic := TEMP->TQB_USUARI
	If EMPTY(cSolic)
		oPrint:Say(0435,0045,"Solicitante via OS" ,oFont08b)//solcitante via OS  //nesse casos se nao houver SS vinculada a OS, pega o nome de quem gerou a OS
		oPrint:Say(0460,0045,TEMP->TJ_USUAINI ,oFont08b)
	Else
		oPrint:Say(0435,0045,"Solicitante via SS" ,oFont08b)
		oPrint:Say(0460,0045,TEMP->TQB_USUARI     ,oFont08b) //solicitante via ss //nesse casos se houver SS vinculada a OS, pega o nome de quem gerou a SS
	EndIf
	
	oPrint:Say(0435,0865,"Data" 	 	 	 ,oFont08b)
	oPrint:Say(0460,0865,TEMP->DATAOS 	 	 ,oFont08b)
	oPrint:Say(0435,1305,"Hora" 	 		 ,oFont08b)
    oPrint:Say(0460,1305,TEMP->TJ_X_HOROS	 ,oFont08b)
	
	oPrint:Say(0495,0045,"Serviço solicitado:",oFont08b)
	
	nLi := 0510
	nCount:= MLCount(STJ->TJ_OBSERVA,80)
	For nBegin := 1 To iif(NCount > 4,4,NCount)
		if !Empty(MemoLine(STJ->TJ_OBSERVA,80,nBegin))                            //SERVICO SOLICITADO
			oPrint:Say (nLi,0295,MemoLine(STJ->TJ_OBSERVA,80,nBegin) ,oFont08b)
			nLi := nLi + 60
		endif
	Next nBegin
	
		oPrint:Say(0435,1645,"Parada:" 	 	 		 ,oFont08b) 
	If TEMP->TJ_TPPARD  == '1'
		oPrint:Say(0475,1645,"Total (X)" 	 	 	 ,oFont08b)
		oPrint:Say(0525,1645,"Parcial (__)" 	 	 ,oFont08b)
		oPrint:Say(0575,1645,"Sem Parada (__)" 	     ,oFont08b)
	ElseIf TEMP->TJ_TPPARD  == '2'
		oPrint:Say(0475,1645,"Total (__)" 	 	 	 ,oFont08b)
		oPrint:Say(0525,1645,"Parcial (X)"	 	 	 ,oFont08b)
		oPrint:Say(0575,1645,"Sem Parada (__)" 	     ,oFont08b)
	ElseIf TEMP->TJ_TPPARD  == '3'
		oPrint:Say(0475,1645,"Total (__)" 	 	 	 ,oFont08b)
		oPrint:Say(0525,1645,"Parcial (__)" 	 	 ,oFont08b)
		oPrint:Say(0575,1645,"Sem Parada (X)" 	     ,oFont08b)
	Else
		oPrint:Say(0475,1645,"Total (__)" 	 	 	 ,oFont08b)
		oPrint:Say(0525,1645,"Parcial (__)" 	 	 ,oFont08b)
		oPrint:Say(0575,1645,"Sem Parada (__)" 	     ,oFont08b)
	EndIf
	
	oPrint:Say(0740,1030,"RELATORIO DE MANUTENÇÃO" 		     ,oFont12b)
	
	oPrint:Say(0795,0045,"Serviço executado:" 	 ,oFont08b)
	
    cOrdem:= TEMP->TJ_ORDEM	
	nLib := 0810 
	
While STN->(!EOF()).and. TN_ORDEM == cOrdem
	nCountb:= MLCount(STN->TN_DESCRIC,150)
	For nBeginb := 1 To NCountb
		If !Empty(MemoLine(STN->TN_DESCRIC,150,nBeginb))                            //SERVICO EXECUTADO
			If Npag > 0
				nLib += 60
				nLinhaA += 60
				oPrint:Say (nLib+0030,0050,MemoLine(STN->TN_DESCRIC,150,nBeginb) ,oFont08b)      //Logica para jogar linhas e proxima pagina iniciar texto no TOPO da tela
				oPrint:Line(nLinhaA+0020,0040, nLinhaA+0020,2320)
				oPrint:Line(nLinhaA+0080,0040, nLinhaA+0080,2320)
				If nLinhaA > 3120
					oPrint:EndPage()
					oPrint:StartPage()
					nLinhaA:= 0
					nLib := 0
					Npag := 1
					oPrint:Box (3250,0040,0080,2320)
					oPrint:Say(3260,0045,"O.S Nº"+TEMP->TJ_ORDEM,oFont15b)
				EndIf
			Else
				nLib := nLib + 60
				nLinhaA += 60
				oPrint:Line(nLinhaA+0790,0040, nLinhaA+0790,2320)
				oPrint:Line(nLinhaA+0850,0040, nLinhaA+0850,2320)
				oPrint:Say (nLib,0050,MemoLine(STN->TN_DESCRIC,150,nBeginb) ,oFont08b)
				If nLinhaA > 2340
					oPrint:EndPage()
					oPrint:StartPage()
					nLinhaA:= 0
					nLib := 0
					Npag := 1
					oPrint:Box (3250,0040,0080,2320)
					oPrint:Say(3260,0045,"O.S Nº"+TEMP->TJ_ORDEM,oFont15b)
				EndIf
			EndIf
		Endif
	Next nBeginb
	STN->(dbSkip())
EndDo
//////////////////////////////MAO DE OBRA UTILIZADA E MATERIAL UTILIZADO////////////////////////////////
oPrint:EndPage()
oPrint:StartPage()
oPrint:Box (3350,0040,0080,2320)

cQryF	:="		SELECT																				   				" + CRLF
cQryF	+="		TL_ORDEM,																			   				" + CRLF
cQryF	+="		TL_CODIGO,							   												   				" + CRLF
cQryF	+="		TL_QUANTID,							   												   				" + CRLF
cQryF	+="		TL_TIPOREG,																			   				" + CRLF
cQryF	+="		SUBSTRING(TL_DTINICI,7,2)+'/'+SUBSTRING(TL_DTINICI,5,2)+'/'+SUBSTRING(TL_DTINICI,1,4) AS 'DATAINI', " + CRLF
cQryF	+="		TL_HOINICI, 																		   				" + CRLF
cQryF	+="		SUBSTRING(TL_DTFIM,7,2)+'/'+SUBSTRING(TL_DTFIM,5,2)+'/'+SUBSTRING(TL_DTFIM,1,4) AS 'DATAFIM',   	" + CRLF
cQryF	+="		TL_HOFIM, 						   																	" + CRLF
cQryF	+="		B1_DESC,																							" + CRLF
cQryF	+="		RA_MAT,																								" + CRLF
cQryF	+="		RA_NOME																				   				" + CRLF
cQryF	+="		FROM					  			   												   				" + CRLF
cQryF	+="		"+RetSQLName("STL")+" STL WITH(NOLOCK)															   	" + CRLF
cQryF	+="		LEFT JOIN																			   				" + CRLF
cQryF	+="		"+RetSQLName("SB1")+" SB1 WITH(NOLOCK)															   	" + CRLF
cQryF	+="		ON																									" + CRLF
cQryF	+="		TL_CODIGO = B1_COD																	   				" + CRLF
cQryF	+="		AND																					   				" + CRLF
cQryF	+="		SB1.D_E_L_E_T_ <> '*'																   				" + CRLF
cQryF	+="		LEFT JOIN																							" + CRLF
cQryF	+="		"+RetSQLName("SRA")+" SRA WITH(NOLOCK)															   	" + CRLF
cQryF	+="		ON									   												   				" + CRLF
cQryF	+="		TL_CODIGO = RA_MAT																	   				" + CRLF
cQryF	+="		AND																					   				" + CRLF
cQryF	+="		TL_FILIAL = RA_FILIAL																   				" + CRLF
cQryF	+="		AND																									" + CRLF
cQryF	+="		RA_FILIAL = "+xfilial("SRA")+"		   												   				" + CRLF
cQryF	+="		AND																									" + CRLF
cQryF	+="		SRA.D_E_L_E_T_ <> '*'																   				" + CRLF
cQryF	+="		WHERE																				   				" + CRLF
cQryF	+="		STL.D_E_L_E_T_ <> '*'																   				" + CRLF
cQryF	+="		AND																									" + CRLF
cQryF	+="		TL_TIPOREG = 'M'																					" + CRLF
cQryF	+="		AND																					   				" + CRLF
cQryF	+="		TL_FILIAL = "+xfilial("STL")+"														   				" + CRLF
cQryF	+="		AND																					   				" + CRLF
cQryF	+="     TL_REPFIM <>''																				        " + CRLF    //nao considera insumos previstos 02/04/2018
cQryF	+="	    AND                                                                                             	" + CRLF
cQryF	+="		TL_ORDEM = '"+TEMP->TJ_ORDEM+"'		   												   				" + CRLF
cQryF	+="		ORDER BY																			   				" + CRLF
cQryF	+="		TL_ORDEM																			   				" + CRLF


If Select("TEMPF") > 0
	TEMPF->(dbCloseArea())
EndIf

TcQuery cQryF New Alias "TEMPF"

TEMPF->(dbGoTop())
nLib := 0265
nLinhaB := 0250
nLinhaVa := 0190
nLinhaVb := 0310

oPrint:FillRect( { 0190 , 040 , 0250 , 2320}, oBrshCinza )

oPrint:Line(nLinha+0190,0040, nLinha+0190,2320) //1	    //Linha Horizontal
oPrint:Line(nLinha+0250,0040, nLinha+0250,2320) //2
oPrint:Line(nLinha+0310,0040, nLinha+0310,2320) //3

oPrint:Line(nLinha+0080,0380, nLinha+0190,0380) //1     //Linhas Verticais
oPrint:Line(nLinha+0080,1940, nLinha+0190,1940) //2

oPrint:Say(0110,0100,"INYLBRA" 			     ,oFont15b)
oPrint:Say(0110,0700,"ORDEM DE SERVIÇO REFORMA/MODIFICAÇÃO" ,oFont15b)
oPrint:Say(0080,1945,"Nº" 					 ,oFont15b)
oPrint:Say(0110,2000,TEMP->TJ_ORDEM			 ,oFont15b) //Nº ORDEM

oPrint:Say(0200,1050,"MÃO DE OBRA UTILIZADA" ,oFont12b)

oPrint:Say(0260,0045,"Nome do Funcion." 	,oFont08b)
oPrint:Say(0260,0485,"R.E. do Funcion."    ,oFont08b)
oPrint:Say(0260,0810,"Data Início Tarefa"  ,oFont08b)
oPrint:Say(0260,1135,"Hora Início Tarefa"  ,oFont08b)
oPrint:Say(0260,1460,"Data Fim Tarefa" 	    ,oFont08b)
oPrint:Say(0260,1785,"Hora Fim tarefa"  	,oFont08b)
oPrint:Say(0260,2110,"Total Horas" 		    ,oFont08b)

While TEMPF->(!EOF()) 
 
	nLib += 60
	nLinhaB += 60
	nLinhaVa += 60
	nLinhaVb += 60
	
	_cDtInB	 := VAL(SUBSTR(TEMPF->DATAINI,7,4)+SUBSTR(TEMPF->DATAINI,4,2)+SUBSTR(TEMPF->DATAINI,1,2))
	_cDtFimB := VAL(SUBSTR(TEMPF->DATAFIM,7,4)+SUBSTR(TEMPF->DATAFIM,4,2)+SUBSTR(TEMPF->DATAFIM,1,2))
			   
   //	nHoraTotaC := U_CalcHoras(_cDtInB,TEMPF->TL_HOINICI,_cDtFimB,TEMPF->TL_HOFIM)
	cQtd := CVALTOCHAR(TEMPF->TL_QUANTID)
	oPrint:Say(nLib,0045,SUBSTR(TEMPF->RA_NOME,1,25),oFont08b)//Nome do funcionario
	oPrint:Say(nLib,0580,TEMPF->RA_MAT     			  ,oFont08b)//Matricula
	oPrint:Say(nLib,0910,TEMPF->DATAINI    			  ,oFont08b)//Data Início Tarefa
	oPrint:Say(nLib,1235,TEMPF->TL_HOINICI+" HRS"    ,oFont08b)//Hora Início Tarefa
	oPrint:Say(nLib,1560,TEMPF->DATAFIM              ,oFont08b)//Data Fim Tarefa
	oPrint:Say(nLib,1885,TEMPF->TL_HOFIM+" HRS"      ,oFont08b)//Hora Fim tarefa
	oPrint:Say(nLib,2185,cQtd+" HRS"		          ,oFont08b)//Total Horas
	
	oPrint:Line(nLinhaVa,0480, nLinhaVb,0480) //1
	oPrint:Line(nLinhaVa,0805, nLinhaVb,0805) //2
	oPrint:Line(nLinhaVa,1130, nLinhaVb,1130) //3   vertical
	oPrint:Line(nLinhaVa,1455, nLinhaVb,1455) //4
	oPrint:Line(nLinhaVa,1780, nLinhaVb,1780) //5
	oPrint:Line(nLinhaVa,2105, nLinhaVb,2105) //6
	
	oPrint:Line(nLinhaB,0040, nLinhaB,2320)
	oPrint:Line(nLinhaB+0060,0040, nLinhaB+0060,2320) // horizontal
	
	If nLinhaB > 3070	//CRIA CABECALHO PROXIMA PAGINA
		oPrint:EndPage()
		oPrint:StartPage()
		nLib := 0265
		nLinhaB := 0250
		nLinhaVa := 0190
		nLinhaVb := 0310
		
		oPrint:FillRect( { 0190 , 040 , 0250 , 2320}, oBrshCinza )
		oPrint:Box (3350,0040,0080,2320)
		
		oPrint:Line(nLinha+0190,0040, nLinha+0190,2320) //1	    //Linha Horizontal
		oPrint:Line(nLinha+0250,0040, nLinha+0250,2320) //2
		oPrint:Line(nLinha+0310,0040, nLinha+0310,2320) //3
		 
		oPrint:Line(nLinha+0080,0380, nLinha+0190,0380) //1     //Linhas Verticais
		oPrint:Line(nLinha+0080,1940, nLinha+0190,1940) //2
		
		oPrint:Say(0110,0100,"INYLBRA" 			     ,oFont15b)
		oPrint:Say(0110,0700,"ORDEM DE SERVIÇO REFORMA/MODIFICAÇÃO" ,oFont15b)
		oPrint:Say(0080,1945,"Nº" 					 ,oFont15b)
		oPrint:Say(0110,2000,TEMP->TJ_ORDEM			 ,oFont15b) //Nº ORDEM
		
		oPrint:Say(0200,1050,"MÃO DE OBRA UTILIZADA" ,oFont12b)
		
		oPrint:Say(0260,0045,"Nome do Funcion." 	,oFont08b)
		oPrint:Say(0260,0485,"R.E. do Funcion."    ,oFont08b)
		oPrint:Say(0260,0810,"Data Início Tarefa"  ,oFont08b)
		oPrint:Say(0260,1135,"Hora Início Tarefa"  ,oFont08b)
		oPrint:Say(0260,1460,"Data Fim Tarefa" 	    ,oFont08b)
		oPrint:Say(0260,1785,"Hora Fim tarefa"  	,oFont08b)
		oPrint:Say(0260,2110,"Total Horas" 		    ,oFont08b)
		
	EndIf
	TEMPF->(dbSkip())
EndDo
	TEMPF->(dbCloseArea())

oPrint:EndPage()
oPrint:StartPage()
oPrint:Box (3350,0040,0080,2320)

cQryE	:="		SELECT																				   				" + CRLF
cQryE	+="		TL_ORDEM,																			   				" + CRLF
cQryE	+="		TL_CODIGO,							   												   				" + CRLF
cQryE	+="		TL_QUANTID,							   												   				" + CRLF
cQryE	+="		TL_TIPOREG,																			   				" + CRLF
cQryE	+="		SUBSTRING(TL_DTINICI,7,2)+'/'+SUBSTRING(TL_DTINICI,5,2)+'/'+SUBSTRING(TL_DTINICI,1,4) AS 'DATAINI', " + CRLF
cQryE	+="		TL_HOINICI, 																		   				" + CRLF
cQryE	+="		SUBSTRING(TL_DTFIM,7,2)+'/'+SUBSTRING(TL_DTFIM,5,2)+'/'+SUBSTRING(TL_DTFIM,1,4) AS 'DATAFIM',   	" + CRLF
cQryE	+="		TL_HOFIM, 						   																	" + CRLF
cQryE	+="		B1_DESC,																							" + CRLF
cQryE	+="		RA_MAT,																								" + CRLF
cQryE	+="		RA_NOME																				   				" + CRLF
cQryE	+="		FROM								   												   				" + CRLF
cQryE	+="		"+RetSQLName("STL")+" STL WITH(NOLOCK)															   	" + CRLF
cQryE	+="		LEFT JOIN																			   				" + CRLF
cQryE	+="		"+RetSQLName("SB1")+" SB1 WITH(NOLOCK)															   	" + CRLF
cQryE	+="		ON																									" + CRLF
cQryE	+="		TL_CODIGO = B1_COD																	   				" + CRLF
cQryE	+="		AND																					   				" + CRLF
cQryE	+="		SB1.D_E_L_E_T_ <> '*'																   				" + CRLF
cQryE	+="		LEFT JOIN																							" + CRLF
cQryE	+="		"+RetSQLName("SRA")+" SRA WITH(NOLOCK)															    " + CRLF
cQryE	+="		ON									   												   				" + CRLF
cQryE	+="		TL_CODIGO = RA_MAT																	   				" + CRLF
cQryE	+="		AND																					   				" + CRLF
cQryE	+="		TL_FILIAL = RA_FILIAL																   				" + CRLF
cQryE	+="		AND																									" + CRLF
cQryE	+="		RA_FILIAL = "+xfilial("SRA")+"		   												   				" + CRLF
cQryE	+="		AND																									" + CRLF
cQryE	+="		SRA.D_E_L_E_T_ <> '*'																   				" + CRLF
cQryE	+="		WHERE																				   				" + CRLF
cQryE	+="		STL.D_E_L_E_T_ <> '*'																   				" + CRLF
cQryE	+="		AND																									" + CRLF
cQryE	+="		TL_TIPOREG = 'P'																					" + CRLF
cQryE	+="		AND																					   				" + CRLF
cQryE	+="		TL_FILIAL = "+xfilial("STL")+"														   				" + CRLF
cQryE	+="		AND																					   				" + CRLF
cQryE	+="     TL_REPFIM <>''																				        " + CRLF    //nao considera insumos previstos 02/04/2018
cQryE	+="	    AND                                                                                                 " + CRLF
cQryE	+="		TL_ORDEM = '"+TEMP->TJ_ORDEM+"'		   												   				" + CRLF
cQryE	+="		ORDER BY																			   				" + CRLF
cQryE	+="		TL_ORDEM																			   				" + CRLF


If Select("TEMPE") > 0
	TEMPE->(dbCloseArea())
EndIf

TcQuery cQryE New Alias "TEMPE"

TEMPE->(dbGoTop())
nLibA    := 0265
nLinhaC  := 0250
nLinhaVc := 0190
nLinhaVd := 0310

oPrint:FillRect( { 0190 , 040 , 0250 , 2320}, oBrshCinza )

oPrint:Line(nLinha+0190,0040, nLinha+0190,2320) //1	    //Linha Horizontal
oPrint:Line(nLinha+0250,0040, nLinha+0250,2320) //2
oPrint:Line(nLinha+0310,0040, nLinha+0310,2320) //3

oPrint:Line(nLinha+0080,0380, nLinha+0190,0380) //1     //Linhas Verticais
oPrint:Line(nLinha+0080,1940, nLinha+0190,1940) //2

oPrint:Say(0110,0100,"INYLBRA" 			     ,oFont15b)
oPrint:Say(0110,0700,"ORDEM DE SERVIÇO REFORMA/MODIFICAÇÃO" ,oFont15b)
oPrint:Say(0080,1945,"Nº" 					 ,oFont15b)
oPrint:Say(0110,2000,TEMP->TJ_ORDEM			 ,oFont15b) //Nº ORDEM

oPrint:Say(0200,1050,"MATERIAL UTILIZADO" ,oFont12b)

oPrint:Say(0260,0215,"Qtde" 	 	 		 ,oFont08b)
oPrint:Say(0260,0630,"Código do Material" 	 ,oFont08b)
oPrint:Say(0260,1500,"Descrição do material",oFont08b)

While TEMPE->(!EOF())
	nLibA += 60
	nLinhaC += 60
	nLinhaVc += 60
	nLinhaVd += 60 
	cQtdA := CVALTOCHAR(TEMPE->TL_QUANTID)
	oPrint:Say(nLibA,0215,cQtdA	 	 		,oFont11b)//quantidade peças  //Qtde
	oPrint:Say(nLibA,0630,TEMPE->TL_CODIGO	,oFont11b)//Código do Material
	oPrint:Say(nLibA,1005,TEMPE->B1_DESC 	,oFont11b)//Descrição do material
	
	oPrint:Line(nLinhaVc,0470, nLinhaVd,0470) //1
	oPrint:Line(nLinhaVc,1000, nLinhaVd,1000) //2
	
	oPrint:Line(nLinhaC,0040, nLinhaC,2320)
	oPrint:Line(nLinhaC+0060,0040, nLinhaC+0060,2320) // horizontal
	
	If nLinhaC > 3070 //CRIA CABECALHO PROXIMA PAGINA
		oPrint:EndPage()
		oPrint:StartPage()
		nLibA    := 0265
		nLinhaC  := 0250
		nLinhaVc := 0190
		nLinhaVd := 0310
		
		oPrint:FillRect( { 0190 , 040 , 0250 , 2320}, oBrshCinza )
		oPrint:Box (3350,0040,0080,2320)
		
		oPrint:Line(nLinha+0190,0040, nLinha+0190,2320) //1	    //Linha Horizontal
		oPrint:Line(nLinha+0250,0040, nLinha+0250,2320) //2
		oPrint:Line(nLinha+0310,0040, nLinha+0310,2320) //3
		
		oPrint:Line(nLinha+0080,0380, nLinha+0190,0380) //1     //Linhas Verticais
		oPrint:Line(nLinha+0080,1940, nLinha+0190,1940) //2
		
		oPrint:Say(0110,0100,"INYLBRA" 			     ,oFont15b)
		oPrint:Say(0110,0700,"ORDEM DE SERVIÇO REFORMA/MODIFICAÇÃO" ,oFont15b)
		oPrint:Say(0080,1945,"Nº" 					 ,oFont15b)
		oPrint:Say(0110,2000,TEMP->TJ_ORDEM			 ,oFont15b) //Nº ORDEM
		
		oPrint:Say(0200,1050,"MATERIAL UTILIZADO" 	 ,oFont12b)
		
		oPrint:Say(0260,0215,"Qtde" 	 	 		 ,oFont08b)
		oPrint:Say(0260,0630,"Código do Material" 	 ,oFont08b)
		oPrint:Say(0260,1500,"Descrição do material",oFont08b)
		
	EndIf
	TEMPE->(dbSkip())
EndDo
TEMPE->(dbCloseArea())

/////////////////FIM PEGA DADOS DOS INSUMOS UTILIZADOS NA OS (MC E MAO DE OBRA)///////////

oPrint:Say(3250,0040,"NOME:________________________" 	,oFont08b)
oPrint:Say(3300,0165,"APROVAÇÃO PRODUÇÃO"   			,oFont08b)
oPrint:Say(3250,0600,"DATA: ______/______/_________" 	,oFont08b)

oPrint:Say(3100,0040,"NOME:________________________" 	,oFont08b)
oPrint:Say(3150,0165,"APROVAÇÃO ENGENHARIA"   			,oFont08b)
oPrint:Say(3100,0600,"DATA: ______/______/_________" 	,oFont08b)

oPrint:Say(3100,1300,"NOME:________________________" 	,oFont08b)
oPrint:Say(3150,1400,"APROVAÇÃO QUALIDADE"   			,oFont08b)
oPrint:Say(3100,1820,"DATA: ______/______/_________" 	,oFont08b)

oPrint:Say(3250,1300,"NOME:________________________" 	,oFont08b)
oPrint:Say(3300,1400,"APROVAÇÃO MAUNTENÇÃO "   			,oFont08b)
oPrint:Say(3250,1820,"DATA: ______/______/_________" 	,oFont08b) 

	li := 56
	EndIf
	
	TEMP->(dbSkip())
	
EndDo

	TEMP->(dbCloseArea())

Return .T.
