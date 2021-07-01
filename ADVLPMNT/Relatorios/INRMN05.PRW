#INCLUDE "RWMAKE.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ INRMN05  บ Autor ณBruno E. Souza      บ Data ณ  20/09/2016 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ hist๓rico dos valores dos insumos     				      บฑฑ
ฑฑบ          ณ                                                 			  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ MP11	                                                      บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function INRMN05()

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Declara variaveis										                ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

Private oFont11b	:= TFont():New("Arial",,11,,.F.,,,,.F.,.F.)
Private oFont12b	:= TFont():New("Arial",,12,,.T.,,,,.T.,.F.)
Private oFont15b	:= TFont():New("Arial",,15,,.T.,,,,.T.,.F.)
Private nLinha	    := 0
Private oPrint
Private cPerg   := "INRMN05"

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Parametros																ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
Pergunte(cPerg,.T.)

Processa( {|lEnd| LBRIMPIAP()}, 'Aguarde...','Gerando relat๓rio...', .t. )

Return

/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณPrograma   ณLBRIMPIAPณ Autores ณ Bruno E. de Souza      ณ Data ณ20/09/2016ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณDescricao  ณ  Imprime Informa็๕es Complementares                          ณฑฑ
ฑฑณ           ณ                                                              ณฑฑ
ฑฑภฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤูฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿*/
Static Function LBRIMPIAP()

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Inicializa Objeto TMSPrinter					   ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
oPrint  := TMSPrinter():New("hist๓rico dos valores dos insumos/servi็os")
lPrinter:= oPrint:IsPrinterActive()
oPrint:Setlandscape()  // Marca Radio Button para impressao em paisagem
oPrint:SetpaperSize(9) // Ajuste para papel a4

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณCaso nao encontre a impressora conectada localmente,ณ
//ณabre a tela para escolha de impressora de rede      ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

If !lPrinter
	oPrint:Setup()
Endif

If !oPrint:IsPrinterActive()
	MsgInfo("Nใo existe nenhum impressora conectada no computador, impressใo cancelada!")
	Return
Endif

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Inicia a impressao										   ณ
//ณ da Frente do Relatorio									   ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

oPrint:StartPage()
REIAP()
oPrint:EndPage()

oPrint:Preview()

Return()
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณREIAP     บAutor  ณBruno E. de Souza   บ Data ณ  20/09/2016 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณFormacao dos dados para o relatorio                         บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function REIAP()

Local cQry 	  := ""
Local cQryC   := ""
Local cCodbem := ""
Local nLinha  := 0
Local nTotalH := 0
Local nTotalM := 0
Local nTotalHg:= 0
Local nTotalMg:= 0
Local nCusto  := 0
Local nCustog := 0
Local nPag    := 1
//ABAIXO op็ao servi็os 
Local nTotQtSc  := 0
Local nTotQtScG := 0
Local nTotQtPc  := 0
Local nTotQtPcG := 0
Local nTotPrPc  := 0
Local nTotPrPcG := 0

If MV_PAR07 == 1 .or.  MV_PAR07 == 2  .or. MV_PAR07 == 4 //SERVIวO COM SC
	
	cQry	:= "SELECT"																																 + CRLF
	cQry	+="TJ_ORDEM AS 'OS',"																													 + CRLF
	cQry	+="SUBSTRING(TJ_DTORIGI,7,2)+'/'+SUBSTRING(TJ_DTORIGI,5,2)+'/'+SUBSTRING(TJ_DTORIGI,1,4) AS 'DATAOS', "									 + CRLF
	cQry	+="TJ_CODBEM AS 'CODBEM',"																												 + CRLF
	cQry	+="T9_NOME AS 'DESCBEM',"																												 + CRLF
	cQry	+="CASE WHEN TJ_TERMINO = 'S' THEN 'SIM' ELSE 'NAO' END AS 'TERMINO' ,"																	 + CRLF
	cQry	+="TJ_USUAINI AS 'USUARIOINICIO',"																										 + CRLF
	cQry	+="TJ_USUAFIM AS 'USUARIOFIM',"																											 + CRLF
	cQry	+="TJ_X_HOROS AS 'HORAINC.OS',"																											 + CRLF
	cQry	+="CASE WHEN TJ_TIPMNT = '1' THEN 'CORRETIVA'"																							 + CRLF
	cQry	+="	 WHEN TJ_TIPMNT = '2' THEN 'PREVENTIVA'"																							 + CRLF
	cQry	+="	 WHEN TJ_TIPMNT = '3' THEN 'PREDITIVA'"																								 + CRLF
	cQry	+="	 WHEN TJ_TIPMNT = '4' THEN 'INSTALAวAO/CONSTRUวAO'"																					 + CRLF
	cQry	+="	 WHEN TJ_TIPMNT = '5' THEN 'MODIFICAวAO/REFORMA' ELSE 'BRANCO' END AS 'TIPOMANUT' ,"												 + CRLF
	cQry	+="CASE WHEN TJ_TPPARD = '1' THEN 'TOTAL'"																								 + CRLF
	cQry	+="	 WHEN TJ_TPPARD = '2' THEN 'PARCIAL'"																						         + CRLF
	cQry	+="	 WHEN TJ_TPPARD = '3' THEN 'SEM PARADA' ELSE 'BRANCO' END AS 'TIPOPAR',"															 + CRLF
	cQry	+="CASE WHEN TJ_TIPMNT = 'F' THEN 'FERRAMENTA'"																					         + CRLF
	cQry	+="	 WHEN TJ_TIPMNT = 'M' THEN 'MAE DE OBRA'"																	                         + CRLF
	cQry	+="	 WHEN TJ_TIPMNT = 'P' THEN 'PRODUTO'"								     															 + CRLF
	cQry	+="	 WHEN TJ_TIPMNT = 'T' THEN 'TERCEIRO'"																								 + CRLF
	cQry	+="	 WHEN TJ_TIPMNT = 'E' THEN 'ESPECIALIDADE' ELSE 'BRANCO' END AS 'TIPOINSUMO' ,"														 + CRLF
	cQry	+="TL_CODIGO AS 'CODINSUMO', "																											 + CRLF
	cQry	+="TL_QUANTID AS 'QTDINSULMO',"																									         + CRLF
	cQry	+="TL_UNIDADE AS 'UNIMEDINSUL',"																										 + CRLF 
    cQry	+="TL_TIPOREG AS 'TPREG',"																												 + CRLF 
	cQry	+="TL_CUSTO AS 'CUSTO',"																												 + CRLF
	cQry	+="TL_NOTFIS AS 'RM',"																													 + CRLF
   	cQry	+="CASE WHEN TL_TIPOREG = 'M' THEN RA_NOME "																						     + CRLF
   	cQry	+="	 WHEN TL_TIPOREG IN ('P','T') THEN B1_DESC END AS 'DESC' "																			 + CRLF
	cQry	+="FROM"																																 + CRLF
	cQry	+=""+RetSQLName("STJ")+" STJ "																									         + CRLF
	cQry	+="JOIN"																																 + CRLF
	cQry	+=""+RetSQLName("STL")+" STL "																											 + CRLF
	cQry	+="ON"																																	 + CRLF
	cQry	+="TJ_ORDEM = TL_ORDEM"																													 + CRLF
	cQry	+="AND"																																	 + CRLF
	cQry	+="TJ_FILIAL = TL_FILIAL"																											     + CRLF
	cQry	+="AND"																																	 + CRLF
	cQry	+="STL.D_E_L_E_T_<>'*'"																													 + CRLF
	cQry	+="AND"																																	 + CRLF
	cQry	+="TL_FILIAL = "+xFilial("STL")+" "																										 + CRLF
	cQry	+="AND"																																	 + CRLF
	cQry	+="TL_CODIGO BETWEEN '"+Alltrim(MV_PAR03)+"' AND '"+Alltrim(MV_PAR04)+"' "  															 + CRLF
	cQry	+="LEFT JOIN"																														     + CRLF
	cQry	+=""+RetSQLName("SB1")+" SB1"																											 + CRLF
	cQry	+="ON"																																	 + CRLF
	cQry	+="B1_COD = TL_CODIGO"																												     + CRLF
	cQry	+="LEFT JOIN"																														     + CRLF
	cQry	+=""+RetSQLName("SRA")+" SRA "																										     + CRLF
	cQry	+="ON"																																	 + CRLF
	cQry	+="RA_MAT = TL_CODIGO"																													 + CRLF
	cQry	+="AND"																																	 + CRLF
	cQry	+="RA_FILIAL = TL_FILIAL"																												 + CRLF
	cQry	+="AND"																																	 + CRLF
	cQry	+="RA_FILIAL = "+xFilial("SRA")+""																										 + CRLF
	cQry	+="JOIN"																																 + CRLF
	cQry	+=""+RetSQLName("ST9")+" ST9 "																											 + CRLF
	cQry	+="ON   "																																 + CRLF
	cQry	+="TJ_CODBEM = T9_CODBEM"																												 + CRLF
	cQry	+="AND "																																 + CRLF
	cQry	+="TJ_FILIAL = T9_FILIAL"																											     + CRLF
	cQry	+="AND"																																	 + CRLF
	cQry	+="T9_FILIAL = "+xFilial("ST9")+" "																										 + CRLF
	cQry	+="WHERE"																																 + CRLF
   	If MV_PAR07 == 1
   		cQry    +="TL_TIPOREG = 'M'" 	//bruno																											 + CRLF //tirado por seguranca
   		cQry	+="AND" 																															 + CRLF
	ElseIf MV_PAR07 == 2
		cQry	+="TL_TIPOREG = 'P'" 																												 + CRLF
		cQry	+="AND" 																															 + CRLF
	ElseIf MV_PAR07 == 3
		cQry	+="TL_TIPOREG = 'T'" 																												 + CRLF
		cQry	+="AND" 																														     + CRLF
	EndIf   
	cQry	+="TL_REPFIM <>''"																													     + CRLF    //nao considera insumos previstos 02/04/2018
	cQry	+="AND"																																     + CRLF
	cQry	+="STJ.D_E_L_E_T_<>'*'"																												     + CRLF
	cQry	+="AND"																																     + CRLF
	cQry	+="TJ_SITUACA <> 'C'"																											         + CRLF
	cQry	+="AND"																																	 + CRLF
	cQry	+="TJ_FILIAL = "+xFilial("STJ")+" "																								         + CRLF
	cQry	+="AND"																																	 + CRLF
	cQry	+="TJ_CODBEM BETWEEN '"+Alltrim(MV_PAR01)+"' AND '"+Alltrim(MV_PAR02)+"' "																 + CRLF
	cQry	+="AND"																																	 + CRLF
	cQry	+="TJ_DTORIGI BETWEEN  '"+DTOS(MV_PAR05)+"' AND  '"+DTOS(MV_PAR06)+"' "																 + CRLF
	cQry	+="ORDER BY"																															 + CRLF
	cQry	+="TJ_CODBEM,"																														     + CRLF
	cQry	+="TJ_ORDEM"																														     + CRLF
	
	If Select("TEMP") > 0
		TEMP->(dbCloseArea())
	EndIf
	
	TcQuery cQry New Alias "TEMP"
	
	dbSelectArea("TEMP")
	TEMP->(dbGoTop())
	
	cCodbem := TEMP->CODBEM
	
	oPrint:Say(0040,1270,"Periodo: "+DTOC(MV_PAR05)+" at้ "+DTOC(MV_PAR06)	,oFont11b)
	oPrint:Say(0100,0050,"INYLBRA"											,oFont15b)
	oPrint:Say(0100,1200,"Insumos Aplicados no Periodo"					    ,oFont15b)
	oPrint:Say(0100,2900,DTOC(Date())								        ,oFont11b)
	
	oPrint:Say(0250,0050,TEMP->CODBEM										,oFont12b)
	oPrint:Say(0250,0400,TEMP->DESCBEM										,oFont12b)
	
	oPrint:Say(0180,0400,"Data O.S"  	,oFont11b)
	oPrint:Say(0180,0750,"O.S" 		 	,oFont11b)
	oPrint:Say(0180,1050,"Insumo" 	 	,oFont11b)
	oPrint:Say(0180,1500,"Descri็ใo"	,oFont11b)
	oPrint:Say(0180,2300,"Custo" 		,oFont11b)
	oPrint:Say(0180,2600,"QTD" 		  	,oFont11b)
	oPrint:Say(0180,2900,"U.M" 		  	,oFont11b)  
	oPrint:Say(2100,2900,"Pแgina "+CVALTOCHAR(nPag) 		  	,oFont11b)
	
	While TEMP->(!EOF())
		If nLinha > 1640
			nLinha:= 0 
			nPag++
			oPrint:EndPage()
			oPrint:StartPage()
			
			oPrint:Say(0180,0400,"Data O.S"		,oFont11b)
			oPrint:Say(0180,0750,"O.S" 		  	,oFont11b)
			oPrint:Say(0180,1050,"Insumo" 	  	,oFont11b)
			oPrint:Say(0180,1500,"Descri็ใo" 	,oFont11b)
			oPrint:Say(0180,2300,"Custo"	  	,oFont11b)
			oPrint:Say(0180,2600,"QTD" 		  	,oFont11b)
			oPrint:Say(0180,2900,"U.M" 		  	,oFont11b)
			oPrint:Say(2100,2900,"Pแgina "+CVALTOCHAR(nPag),oFont11b)
		EndIf
		
		If TEMP->CODBEM <> cCodbem
			
			oPrint:Say(	nLinha+0320,0830,"Total Horas: "		+CVALTOCHAR(nTotalH),oFont12b)
			oPrint:Say(	nLinha+0320,1230,"Total Materiais: "	+CVALTOCHAR(nTotalM),oFont12b)
			oPrint:Say(	nLinha+0320,1630,"Total Custos: "		+CVALTOCHAR(nCusto) ,oFont12b)
			
			nLinha+= 120
			
			oPrint:Say(	nLinha+0320,0050,TEMP->CODBEM	,oFont12b)
			oPrint:Say(	nLinha+0320,0400,TEMP->DESCBEM	,oFont12b)
			
			nTotalH := 0
			nTotalM := 0
			nCusto 	:= 0
		
			nLinha+= 60
			
		EndIf 
		
			dbSelectArea("SRA")
			SRA->(dbSetOrder(1))
			SRA->(dbSeek( xFilial("SRA") + ALLTRIM(TEMP->CODINSUMO) ))   
			
			oPrint:Say(nLinha+0320,0400,TEMP->DATAOS		 			,oFont11b)
	   		oPrint:Say(nLinha+0320,0750,TEMP->OS		 				,oFont11b)
			oPrint:Say(nLinha+0320,1050,TEMP->CODINSUMO		 			,oFont11b)
	   	    oPrint:Say(nLinha+0320,1500,TEMP->DESC	 					,oFont11b)
		
		If SRA->RA_CATFUNC == 'H' .AND. Alltrim(TEMP->TPREG) == "M" 
		   	//TEMP->QTDINSULMO*SRA->RA_SALARIO
		  	oPrint:Say(nLinha+0320,2300,CVALTOCHAR(ROUND(TEMP->QTDINSULMO*SRA->RA_SALARIO,2)),oFont11b) 	   //RETIRADO POR SEGURANCA
		ElseIf	SRA->RA_CATFUNC == 'M' .AND. Alltrim(TEMP->TPREG) == "M"    
		 	oPrint:Say(nLinha+0320,2300,CVALTOCHAR(ROUND(TEMP->QTDINSULMO*(SRA->RA_SALARIO/SRA->RA_HRSMES),2)),oFont11b) //RETIRADO POR SEGURANCA
		Else	
			oPrint:Say(nLinha+0320,2300,CVALTOCHAR(TEMP->CUSTO)	 	,oFont11b)
	   	EndIf	
	   		oPrint:Say(nLinha+0320,2600,CVALTOCHAR(TEMP->QTDINSULMO)	,oFont11b)
			oPrint:Say(nLinha+0320,2900,TEMP->UNIMEDINSUL			 	,oFont11b)
		
		nLinha += 60
		
	  	If Alltrim(TEMP->TPREG) == "M"   
	  	   	nTotalH  += TEMP->QTDINSULMO
			nTotalHg += TEMP->QTDINSULMO
		ElseIf Alltrim(TEMP->TPREG) == "P"
			nTotalM += TEMP->QTDINSULMO
			nTotalMg+= TEMP->QTDINSULMO
		EndIf
		
			If SRA->RA_CATFUNC == 'H' .AND. Alltrim(TEMP->TPREG) == "M"  //pega o horario do cadastro de funcionario.
		   		nCusto += ROUND(TEMP->QTDINSULMO*SRA->RA_SALARIO,2)
		   		nCustog+= ROUND(TEMP->QTDINSULMO*SRA->RA_SALARIO,2) 
		 	ElseIf	SRA->RA_CATFUNC == 'M' .AND. Alltrim(TEMP->TPREG) == "M"    
		   		nCusto += ROUND(TEMP->QTDINSULMO*(SRA->RA_SALARIO/SRA->RA_HRSMES),2)
		   		nCustog+= ROUND(TEMP->QTDINSULMO*(SRA->RA_SALARIO/SRA->RA_HRSMES),2)
		   	Else
				nCusto += TEMP->CUSTO 
				nCustog+= TEMP->CUSTO
			EndIf
			    
		cCodbem := TEMP->CODBEM
		
		TEMP->(dbSkip())
	EndDo
	
	oPrint:Say(	nLinha+0320,0830,"Total Horas: "   	   		+CVALTOCHAR(nTotalH),oFont12b)     //ultimo registro
	oPrint:Say(	nLinha+0320,1230,"Total Materiais: "   		+CVALTOCHAR(nTotalM),oFont12b)
	oPrint:Say(	nLinha+0320,1830,"Total Custos: "			+CVALTOCHAR(nCusto) ,oFont12b)
	
	oPrint:Say(	nLinha+0400,0830,"Total Horas Geral: "		+CVALTOCHAR(nTotalHg),oFont12b)
	oPrint:Say(	nLinha+0400,1450,"Total Materiais Geral: "	+CVALTOCHAR(nTotalMg),oFont12b)
	oPrint:Say(	nLinha+0400,2130,"Total Custos Geral: "		+CVALTOCHAR(nCustog) ,oFont12b)
	
	TEMP->(dbCloseArea())
EndIf
///////////////////////////////////////////Pode ser alterada devido a integra็ao de Nota de entrada com Servi็o
If MV_PAR07 == 3 .or. MV_PAR07 == 4
	
	nLinha := 0
	cCodbem := ""
	
	cQryC	:= "SELECT"																									+ CRLF
	cQryC	+= "TJ_ORDEM AS 'OS',"																						+ CRLF
	cQryC	+= "SUBSTRING(TJ_DTORIGI,7,2)+'/'+SUBSTRING(TJ_DTORIGI,5,2)+'/'+SUBSTRING(TJ_DTORIGI,1,4) AS 'DATAOS', "	+ CRLF
	cQryC	+= "TJ_CODBEM AS 'CODBEM',"																					+ CRLF
	cQryC	+= "T9_NOME AS 'DESCBEM',"																					+ CRLF
	cQryC	+= "C1_NUM AS 'SCNUM',"																						+ CRLF
	cQryC	+= "ISNULL(C7_NUM,'SEM PC') AS 'PCNUM',"																	+ CRLF
	cQryC	+= "C1_PRODUTO AS 'CODPRO',"																				+ CRLF
	cQryC	+= "B1_DESC AS 'DESCPRO',"																					+ CRLF
	cQryC	+= "C1_QUANT AS 'QTSC',"																					+ CRLF
	cQryC	+= "ISNULL(C7_QUANT,0) AS 'QTPC',"																			+ CRLF
	cQryC	+= "ISNULL(C7_PRECO,0) AS 'PRPC',"																			+ CRLF
	cQryC	+= "ISNULL(C7_TOTAL,0) AS 'TOTALPC'"																		+ CRLF
	cQryC	+= "FROM"																									+ CRLF
	cQryC	+= ""+RetSQLName("STJ")+" STJ"																				+ CRLF
	cQryC	+= "JOIN"																									+ CRLF
	cQryC	+= ""+RetSQLName("ST9")+" ST9"																				+ CRLF
	cQryC	+= "ON   "																									+ CRLF
	cQryC	+= "TJ_CODBEM = T9_CODBEM"																					+ CRLF
	cQryC	+= "AND "																									+ CRLF
	cQryC	+= "TJ_FILIAL = T9_FILIAL"																					+ CRLF
	cQryC	+= "AND"																									+ CRLF
	cQryC	+= "T9_FILIAL = "+xfilial("ST9")+" "																		+ CRLF
	cQryC	+= "AND"																									+ CRLF
	cQryC	+= "ST9.D_E_L_E_T_<>'*'"																					+ CRLF
	cQryC	+= "JOIN"																									+ CRLF
	cQryC	+= ""+RetSQLName("SC1")+" SC1"																				+ CRLF
	cQryC	+= "ON"																										+ CRLF
	cQryC	+= "C1_OS = TJ_ORDEM"																						+ CRLF
	cQryC	+= "AND"																									+ CRLF
	cQryC	+= "TJ_FILIAL = C1_FILIAL"																					+ CRLF
	cQryC	+= "AND"																									+ CRLF
	cQryC	+= "C1_FILIAL = "+xfilial("ST9")+""																			+ CRLF
	cQryC	+= "AND"																									+ CRLF
	cQryC	+= "C1_UM = 'SV'"																							+ CRLF
	cQryC	+= "AND"																									+ CRLF
	cQryC	+= "SC1.D_E_L_E_T_<>'*'"																					+ CRLF
	cQryC	+= "JOIN"																									+ CRLF
	cQryC	+= ""+RetSQLName("SB1")+" SB1"																				+ CRLF
	cQryC	+= "ON"																										+ CRLF
	cQryC	+= "B1_COD = C1_PRODUTO"																					+ CRLF
	cQryC	+= "AND"																									+ CRLF
	cQryC	+= "SB1.D_E_L_E_T_<>'*'"																					+ CRLF
	cQryC	+= "LEFT JOIN"																								+ CRLF
	cQryC	+= ""+RetSQLName("SC7")+" SC7"																				+ CRLF
	cQryC	+= "ON"																										+ CRLF
	cQryC	+= "C1_NUM = C7_NUMSC"																						+ CRLF
	cQryC	+= "AND"																									+ CRLF
	cQryC	+= "C1_FILIAL = C7_FILIAL"																					+ CRLF
	cQryC	+= "AND"																									+ CRLF
	cQryC	+= "C1_ITEM = C7_ITEMSC"																					+ CRLF
	cQryC	+= "AND"																									+ CRLF
	cQryC	+= "C7_FILIAL = "+xfilial("SC7")+""																			+ CRLF
	cQryC	+= "AND"																									+ CRLF
	cQryC	+= "SC7.D_E_L_E_T_<>'*'"																					+ CRLF
	cQryC	+= "WHERE"																									+ CRLF
	cQryC	+= "STJ.D_E_L_E_T_<>'*'"																					+ CRLF
	cQryC	+= "AND"																									+ CRLF
	cQryC	+= "TJ_SITUACA <> 'C'"																						+ CRLF
	cQryC	+= "AND"																									+ CRLF
	cQryC	+= "TJ_FILIAL = "+xfilial("STJ")+""																			+ CRLF
	cQryC	+= "AND"																									+ CRLF
	cQryC	+= "TJ_CODBEM BETWEEN '"+ALLTRIM(MV_PAR01)+"' AND '"+ALLTRIM(MV_PAR02)+"'"									+ CRLF
	cQryC	+= "AND"																									+ CRLF
	cQryC	+= "TJ_DTORIGI BETWEEN  '"+DTOS(MV_PAR05)+"' AND '"+DTOS(MV_PAR06)+"'"										+ CRLF
	cQryC	+= "ORDER BY"																								+ CRLF
	cQryC	+= "TJ_CODBEM,"																								+ CRLF
	cQryC	+= "TJ_ORDEM  "																								+ CRLF
	
	If Select("TEMPC") > 0
		TEMPC->(dbCloseArea())
		Return()
	EndIf
	
	TcQuery cQryC New Alias "TEMPC"
	
	dbSelectArea("TEMPC")
	TEMPC->(dbGoTop())
	
	If TEMPC->(!EOF())
		If MV_PAR07 == 4
			oPrint:EndPage()
			oPrint:StartPage()
			nPag++
		Else
			oPrint:StartPage()
			nPag++
		EndIf
	Else
		Return()
	EndIf
	
	cCodbem := TEMPC->CODBEM
	
	oPrint:Say(0040,1270,"Periodo: "+DTOC(MV_PAR05)+" at้ "+DTOC(MV_PAR06)	,oFont11b)
	oPrint:Say(0100,0050,"INYLBRA" 											,oFont15b)
	oPrint:Say(0100,1450,"Servi็os"											,oFont15b)
	oPrint:Say(0100,2150,DTOC(Date())										,oFont11b)
	
	oPrint:Say(0250,0050,TEMPC->CODBEM		,oFont12b)
	oPrint:Say(0250,0400,TEMPC->DESCBEM		,oFont12b)
	
	oPrint:Say(0180,0050,"Data O.S"  	,oFont11b)
	oPrint:Say(0180,0330,"O.S" 		  	,oFont11b)
	oPrint:Say(0180,0550,"Numero SC" 	,oFont11b)
	oPrint:Say(0180,0830,"Numero PC" 	,oFont11b)
	oPrint:Say(0180,1070,"Cod. Seriv็o"	,oFont11b)
	oPrint:Say(0180,1450,"Desc." 		,oFont11b)
	oPrint:Say(0180,2300,"Quant. SC" 	,oFont11b)
	oPrint:Say(0180,2600,"Quant. PC" 	,oFont11b)
	oPrint:Say(0180,2900,"Pre็o PC" 	,oFont11b)
	oPrint:Say(0180,3200,"Total PC" 	,oFont11b) 
	oPrint:Say(2100,2900,"Pแgina "+CVALTOCHAR(nPag),oFont11b)
	
	While TEMPC->(!EOF())
		If nLinha > 1640
			nLinha:= 0
			oPrint:EndPage()
			oPrint:StartPage()
			
			oPrint:Say(0180,0050,"Data O.S"  	,oFont11b)
			oPrint:Say(0180,0330,"O.S" 		  	,oFont11b)
			oPrint:Say(0180,0550,"Numero SC" 	,oFont11b)
			oPrint:Say(0180,0830,"Numero PC" 	,oFont11b)
			oPrint:Say(0180,1070,"Cod. Seriv็o"	,oFont11b)
			oPrint:Say(0180,1450,"Desc." 		,oFont11b)
			oPrint:Say(0180,2300,"Quant. SC" 	,oFont11b)
			oPrint:Say(0180,2600,"Quant. PC" 	,oFont11b)
			oPrint:Say(0180,2900,"Pre็o PC" 	,oFont11b)
			oPrint:Say(0180,3200,"Total PC" 	,oFont11b)
			oPrint:Say(2100,2900,"Pแgina "+CVALTOCHAR(nPag),oFont11b)
		EndIf
		
		If TEMPC->CODBEM <> cCodbem
			
			oPrint:Say(	nLinha+0320,0830,"Total Quant. SC: "	+CVALTOCHAR(nTotQtSc),oFont12b)
			oPrint:Say(	nLinha+0320,1230,"Total Quant. PC: "	+CVALTOCHAR(nTotQtPc),oFont12b)
			oPrint:Say(	nLinha+0320,1630,"Total Pre็o PC: "		+CVALTOCHAR(nTotPrPc),oFont12b)
			
			nLinha+= 120
			
			oPrint:Say(	nLinha+0320,0050,TEMPC->CODBEM	 ,oFont12b)
			oPrint:Say(	nLinha+0320,0400,TEMPC->DESCBEM	 ,oFont12b)
			
			nTotQtSc := 0
			nTotQtPc := 0
			nTotPrPc := 0
			
			nLinha+= 60
			
		EndIf    
		
			oPrint:Say(nLinha+0320,0050,TEMPC->DATAOS				,oFont11b)
			oPrint:Say(nLinha+0320,0330,TEMPC->OS		 			,oFont11b)
			oPrint:Say(nLinha+0320,0550,TEMPC->SCNUM		 		,oFont11b)
			oPrint:Say(nLinha+0320,0830,TEMPC->PCNUM	 			,oFont11b)
			oPrint:Say(nLinha+0320,1070,TEMPC->CODPRO	 			,oFont11b)
			oPrint:Say(nLinha+0320,1450,TEMPC->DESCPRO		 		,oFont11b)
			oPrint:Say(nLinha+0320,2300,CVALTOCHAR(TEMPC->QTSC)	,oFont11b)
			oPrint:Say(nLinha+0320,2600,CVALTOCHAR(TEMPC->QTPC)	,oFont11b)
			oPrint:Say(nLinha+0320,2900,CVALTOCHAR(TEMPC->PRPC)	,oFont11b)
			oPrint:Say(nLinha+0320,3200,CVALTOCHAR(TEMPC->TOTALPC)	,oFont11b)
		
	   		nLinha += 60
		
			nTotQtSc  += TEMPC->QTSC
			nTotQtScG += TEMPC->QTSC
		
	   		nTotQtPc  += TEMPC->QTPC
	   		nTotQtPcG += TEMPC->QTPC
		
	   		nTotPrPc  += TEMPC->TOTALPC
	   		nTotPrPcG += TEMPC->TOTALPC
		
		cCodbem := TEMPC->CODBEM
		TEMPC->(dbSkip())
	EndDo
	
	oPrint:Say(	nLinha+0320,0830,"Total Quant. SC: "		+CVALTOCHAR(nTotQtSc),oFont12b)     //ultimo registro
	oPrint:Say(	nLinha+0320,1230,"Total Quant. PC: "  		+CVALTOCHAR(nTotQtPc),oFont12b)
	oPrint:Say(	nLinha+0320,1830,"Total Pre็o PC:  "		+CVALTOCHAR(nTotPrPc),oFont12b)
	
	oPrint:Say(	nLinha+0400,0830,"Total Quant. Geral SC: "	+CVALTOCHAR(nTotQtScG),oFont12b)
	oPrint:Say(	nLinha+0400,1450,"Total Quant. Geral PC: "	+CVALTOCHAR(nTotQtPcG),oFont12b)
	oPrint:Say(	nLinha+0400,2130,"Total Pre็o PC Geral:  "	+CVALTOCHAR(nTotPrPcG),oFont12b)
   
	TEMPC->(dbCloseArea())
EndIf

Return()
