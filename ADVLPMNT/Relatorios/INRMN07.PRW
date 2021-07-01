#INCLUDE "RWMAKE.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ INRMN07  º Autor ³ Vitor Badam        º Data ³  14/08/2017 º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDescricao ³ Relatorio de Rastreabilidade de Ferramentas 				  º±±
±±º          ³  		                                                  º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ MP11	                                                      º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
User Function INRMN07()

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Declara variaveis										                ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Private oFont13n	:= TFont():New("Courier New",,12,,.F.,,,,.T.,.F.)
Private oFont10b	:= TFont():New("Arial",,10,,.T.,,,,.T.,.F.)
Private oFont13b	:= TFont():New("Courier New",,13,,.T.,,,,.T.,.F.)
Private oFont15b	:= TFont():New("Courier New",,13,,.T.,,,,.T.,.F.)
Private oFont20b	:= TFont():New("Arial",,20,,.T.,,,,.T.,.F.)
Private oBrshCin	:= TBrush():New("",RGB(190,190,190)) //Cinza
Private nLinha	    := 0
Private nLin        := 0
Private nPag        := 1
Private oPrint
Private cPerg       := "INRMN07PG"
Private cQuery

If Pergunte(cPerg, .T.)
	Processa( {|lEnd| PRRMN07()}, 'Aguarde...','Gerando relatório...', .t. )
EndIf

Return

/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Programa   ³PRRMN07  ³ Autores ³ Vitor Badam            ³ Data ³14/08/2017³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao  ³  Imprime Informações Complementares                          ³±±
±±³           ³                                                              ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß*/
Static Function PRRMN07()

Local   nRegs      := 0

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Inicializa Objeto TMSPrinter					   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
oPrint  := TMSPrinter():New("RASTREABILIDADE DE FERRAMENTAS")
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

cQuery := " SELECT TJ_CODBEM,TJ_X_ENTFE , TJ_X_SAIFE ,TJ_DTORIGI ,TJ_X_HOROS,TJ_TIPMNT,TJ_ORDEM   FROM " + RetSqlName("STJ") + " STJ WITH(NOLOCK) " + CRLF
cQuery += " WHERE D_E_L_E_T_ <> '*' " 	+ CRLF
cQuery += " AND TJ_DTORIGI BETWEEN  '" + Dtos(MV_PAR01)+"' AND '" + Dtos(MV_PAR02) +"'    " + CRLF
cQuery += " AND TJ_X_ENTFE = '" + MV_PAR03 +"' OR (TJ_X_SAIFE = '" + MV_PAR03 +"' )   OR (TJ_CODBEM = '" + MV_PAR03 +"'  )  " + CRLF
cQuery += " ORDER BY TJ_DTORIGI   " + CRLF

If Select("QUESSTJ") > 0
	QUESSTJ->(dbCloseArea())
EndIf

CursorWait()
dbUseArea( .t.,'TOPCONN', TcGenQry( ,, cQuery ), 'QUESSTJ',.F., .T. )
CursorArrow()
count to nRegs
ProcRegua(nRegs)
dbGoTop()

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Inicia a impressao										   ³
//³ da Frente do Relatorio								       ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
oPrint:StartPage()

LBSTJCAB() // Cabecalho
LBSTJACOR()//Corpo

nLin := 420

WHILE QUESSTJ->(!EOF())
	IncProc('Carregando Relatório!')
	
	If nLin > 3200
		nPag++
		nLin := 420
		oPrint:EndPage()
		oPrint:StartPage()
		LBSTJCAB()
		LBSTJACOR()
	EndIf
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³Tras Apenas Informação da Maquina³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		
	If Alltrim(QUESSTJ->TJ_X_ENTFE) == Alltrim(MV_PAR03)
		
		oPrint:Say(nLin,0110,Alltrim(QUESSTJ->TJ_X_ENTFE) +"-"+ QUESSTJ->TJ_ORDEM      	   		,oFont13n) //Ferramenta
		oPrint:Say(nLin,0750,Alltrim(QUESSTJ->TJ_CODBEM)      	   			   						,oFont13n) //Maquina
		oPrint:Say(nLin,1430,Transform(QUESSTJ->TJ_X_HOROS	,"@R  99:99")     	   	   				,oFont13n) //Hora
		oPrint:Say(nLin,1920,Transform(Stod(QUESSTJ->TJ_DTORIGI),"@R")     	   	   				,oFont13n) //Emissao
		
		oPrint:Line(nLin,0590,nLin+90,0590)	//Linha Vertical
		oPrint:Line(nLin,1200,nLin+90,1200)	//Linha Vertical
		oPrint:Line(nLin,1800,nLin+90,1800)	//Linha Vertical
		
		oPrint:Line( nLin-10, 0040, nLin-10, 2310 )  //Horizontal
		
		nLin += 90    
		
	Endif
	  
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³Tras Informações das Ferramentas - PREVENTIVAS³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

	If QUESSTJ->TJ_TIPMNT == "2"
		
		oPrint:Say(nLin,0110,Alltrim(QUESSTJ->TJ_CODBEM)+"-"+ QUESSTJ->TJ_ORDEM       	   	 		,oFont13n) //Ferramenta
		oPrint:Say(nLin,0750,Alltrim("FERRAMENTARIA")      	   			   					  		,oFont13n) //Maquina
		oPrint:Say(nLin,1430,Transform(QUESSTJ->TJ_X_HOROS	,"@R  99:99")     	   	   				,oFont13n) //Hora
		oPrint:Say(nLin,1920,Transform(Stod(QUESSTJ->TJ_DTORIGI),"@R")     	   	   				,oFont13n) //Emissao
		
		oPrint:Line(nLin,0590,nLin+90,0590)	//Linha Vertical
		oPrint:Line(nLin,1200,nLin+90,1200)	//Linha Vertical
		oPrint:Line(nLin,1800,nLin+90,1800)	//Linha Vertical
		
		oPrint:Line( nLin-10, 0040, nLin-10, 2310 )  //Horizontal
		
		nLin += 90   
		
	Endif
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³Tras Apenas Informaçoes da Ferramenta de Saida - Saida e sempre ESTOQUE³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	
	If Alltrim(QUESSTJ->TJ_X_SAIFE) == Alltrim(MV_PAR03)
		
		oPrint:Say(nLin,0110,Alltrim(QUESSTJ->TJ_X_SAIFE)+"-"+ QUESSTJ->TJ_ORDEM       	   		,oFont13n) //Ferramenta
		oPrint:Say(nLin,0750,Alltrim("ESTOQUE")      	   			   					  			,oFont13n) //Maquina
		oPrint:Say(nLin,1430,Transform(QUESSTJ->TJ_X_HOROS	,"@R  99:99")     	   	   				,oFont13n) //Hora
		oPrint:Say(nLin,1920,Transform(Stod(QUESSTJ->TJ_DTORIGI),"@R")     	   	   				,oFont13n) //Emissao
		
		oPrint:Line(nLin,0590,nLin+90,0590)	//Linha Vertical
		oPrint:Line(nLin,1200,nLin+90,1200)	//Linha Vertical
		oPrint:Line(nLin,1800,nLin+90,1800)	//Linha Vertical
		
		oPrint:Line( nLin-10, 0040, nLin-10, 2310 )  //Horizontal
		
		nLin += 90
		
	Endif
	
	QUESSTJ->(dbSkip())
Enddo

oPrint:Line( nLin, 0040, nLin, 2310 )  //Horizontal

oPrint:EndPage()
oPrint:Preview()

Return

/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Programa   ³LBSTJCAB ³ Autores ³ Vitor Badam            ³ Data ³14/08/2017³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao  ³  Imprime Cabeçalho do Relatorio                              ³±±
±±³           ³                                                              ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß*/
Static Function LBSTJCAB()

oPrint:Box (0040,0040,0320,2310)
oPrint:SayBitmap(0070,0055, "lgrl01.bmp",290,148)

oPrint:Say(0090,680,"RASTREABILIDADE DA FERRAMENTA ",oFont20b)

oPrint:Line(0200,0040,0200,2310)    // Linha Horizontal

oPrint:Say(0220,0900, Transform(MV_PAR01,"@E")+ " A  "+ Transform(MV_PAR02,"@E" ) ,oFont15b)

nLinha := 400

Return .T.

/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Programa   ³LBSTJACOR³ Autores ³ Vitor Badam            ³ Data ³14/08/2017³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao  ³  Imprime corpo do Relatorio                                  ³±±
±±³           ³                                                              ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß*/
Static Function LBSTJACOR()

oPrint:Box(0300,0040,3310,2310)

oPrint:Line(nLinha-80,0590,nLinha+20,0590)	//Linha Vertical
oPrint:Line(nLinha-80,1200,nLinha+20,1200)	//Linha Vertical
oPrint:Line(nLinha-80,1800,nLinha+20,1800)	//Linha Vertical

oPrint:Say(nLinha-065,0100,"FERRAMENTA/ORDEM"          ,oFont10b)
oPrint:Say(nLinha-065,0790,"MAQUINA"              		,oFont10b)
oPrint:Say(nLinha-065,1450,"HORA"            			,oFont10b)
oPrint:Say(nLinha-065,2000,"DATA"      					,oFont10b)

oPrint:Say (3315,0080,cUsername   				  		,oFont10b)
oPrint:Say (3315,2180,"Pag.  "+ Strzero(nPag,2)  		,oFont10b)

Return .T.
