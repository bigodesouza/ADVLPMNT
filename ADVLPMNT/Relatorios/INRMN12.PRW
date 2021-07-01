#INCLUDE "RWMAKE.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ INRMN12  บ Autor ณBruno E. Souza      บ Data ณ  09/10/2020 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Diferen็a de tempo entre abertura OS e inicio da Tarefa    บฑฑ
ฑฑบ          ณ                                                 			  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ MP11	                                                      บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function INRMN12()

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Declara variaveis										                ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

Private oFont11b   := TFont():New("Arial",,11,,.F.,,,,.F.,.F.)
Private oFont12b   := TFont():New("Arial",,12,,.T.,,,,.T.,.F.)
Private oFont15b   := TFont():New("Arial",,15,,.T.,,,,.T.,.F.)
Private oPrint
Private cPerg      := "INRMN12"
Private cQry       := ""
Private cCodbem    := ""
Private cLocaliz   :=""
Private ctipomnt   :=""
Private nTotal     := "00:00"
Private nHoraTotal := "00:00"
Private nTotalGr   := "00:00"
Private nHoraTaf   := "00:00"

Private nToTaref   := "00:00"
Private nToTareG   := "00:00"

Private _aCabExcel	:= {}
Private _aIteExcel	:= {}

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Parametros																ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
Pergunte(cPerg,.T.)

If MV_PAR05 == 2
	Processa( {|lEnd| INYLIMP()}, 'Aguarde...','Gerando relat๓rio...', .t. )
Else
	Processa({|| Exp2Excel()}, "Processando...", "Exportando para o Excel...")
EndIf

Return
/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณPrograma   ณINYLIMPณ Autores ณ Bruno E. de Souza      ณ Data   ณ09/10/2020ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณDescricao  ณ  Imprime Informa็๕es Complementares                          ณฑฑ
ฑฑณ           ณ                                                              ณฑฑ
ฑฑภฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤูฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿*/
Static Function INYLIMP()

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Inicializa Objeto TMSPrinter					   ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
oPrint  := TMSPrinter():New("Diferen็a de tempo entre abertura OS e inicio da Tarefa")
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
INYLIMP12()
oPrint:EndPage()

oPrint:Preview()

Return()
/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณPrograma   ณINYLIMP12ณ Autores ณ Bruno E. de Souza      ณ Data ณ09/10/2020ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณDescricao  ณ  Imprime Informa็๕es Complementares                          ณฑฑ
ฑฑณ           ณ                                                              ณฑฑ
ฑฑภฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤูฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿*/
Static Function INYLIMP12()

Local nPag   := 1
Local nLinha := 0

cQry	:= "SELECT																			"+ CRLF
cQry	+="TJ_CODBEM AS 'CODBEM',															"+ CRLF
cQry	+="T9_NOME AS 'NOMEBEM',															"+ CRLF
cQry	+="CTT_DESC01 AS 'LOCALIZ',															"+ CRLF
cQry	+="TD_NOME AS 'TIPOMANUT',															"+ CRLF
cQry	+="TJ_ORDEM AS 'OS',																"+ CRLF
cQry	+="TJ_DTORIGI AS 'DTINIOS',															"+ CRLF
cQry	+="TJ_X_HOROS AS 'HRINIOS',															"+ CRLF
cQry	+="MIN(TL_DTINICI) AS 'DTINITF',													"+ CRLF
cQry	+="TL_HOINICI AS 'HRINITF',															"+ CRLF
cQry	+="TL_DTFIM AS DTFIMTF,																"+ CRLF
cQry	+="TL_HOFIM AS HRFIMTF, 															"+ CRLF
cQry	+="ISNULL(CAST(CAST(TJ_SEREXEC AS VARBINARY(8000)) AS VARCHAR(8000)),'') AS 'SEREEX'"+ CRLF
cQry	+="FROM																				"+ CRLF
cQry	+=""+RetSQLName("STJ")+" STJ 														"+ CRLF
cQry	+="JOIN																				"+ CRLF
cQry	+=""+RetSQLName("STL")+" STL														"+ CRLF
cQry	+="ON																				"+ CRLF
cQry	+="TJ_FILIAL = TL_FILIAL															"+ CRLF
cQry	+="AND																				"+ CRLF
cQry	+="TJ_ORDEM = TL_ORDEM																"+ CRLF
cQry	+="AND																				"+ CRLF
cQry	+="STJ.D_E_L_E_T_<>'*'																"+ CRLF
cQry	+="JOIN																				"+ CRLF
cQry	+=""+RetSQLName("ST9")+" ST9 														"+ CRLF
cQry	+="ON																				"+ CRLF
cQry	+="TJ_CODBEM = T9_CODBEM															"+ CRLF
cQry	+="JOIN																				"+ CRLF
cQry	+=""+RetSQLName("CTT")+" CTT 														"+ CRLF
cQry	+="ON																				"+ CRLF
cQry	+="TJ_CCUSTO = CTT_CUSTO															"+ CRLF
cQry	+="AND																				"+ CRLF
cQry	+="TJ_FILIAL = CTT_FILIAL															"+ CRLF
cQry	+="AND																				"+ CRLF
cQry	+="CTT_FILIAL = "+xFilial("CTT")+" 													"+ CRLF	
cQry	+="JOIN																				"+ CRLF
cQry	+=""+RetSQLName("STD")+" STD 														"+ CRLF
cQry	+="ON																				"+ CRLF
cQry	+="TJ_CODAREA = TD_CODAREA															"+ CRLF
cQry	+="WHERE																			"+ CRLF
cQry	+="STL.D_E_L_E_T_<>'*'																"+ CRLF
cQry	+="AND																				"+ CRLF
cQry	+="TL_TIPOREG = 'M'																	"+ CRLF
cQry	+="AND																				"+ CRLF
cQry	+="TJ_SITUACA <> 'C'																"+ CRLF
cQry	+="AND																				"+ CRLF
cQry	+="TL_FILIAL = "+xFilial("STL")+" 													"+ CRLF
cQry	+="AND																				"+ CRLF
cQry	+="TJ_FILIAL = "+xFilial("STJ")+" 													"+ CRLF
cQry	+="AND																				"+ CRLF
cQry 	+="TJ_DTORIGI BETWEEN  '"+DTOS(MV_PAR01)+"' AND  '"+DTOS(MV_PAR02)+"' 				"+ CRLF	
cQry 	+="AND																				"+ CRLF
cQry 	+="TJ_CODBEM BETWEEN  '"+ALLTRIM(MV_PAR03)+"' AND  '"+ALLTRIM(MV_PAR04)+"' 			"+ CRLF	
cQry	+="AND																				"+ CRLF
cQry	+="TJ_TIPMNT = '1'																	"+ CRLF
cQry	+="AND																				"+ CRLF
cQry	+="TJ_TPPARD = '1'																	"+ CRLF
cQry	+="AND																				"+ CRLF
cQry	+="TL_DTFIM <> ''																	"+ CRLF
cQry	+="GROUP BY																			"+ CRLF
cQry	+="TJ_ORDEM,																		"+ CRLF
cQry	+="TJ_CODBEM,																		"+ CRLF
cQry	+="TL_HOINICI,																		"+ CRLF
cQry	+="TL_DTFIM,																		"+ CRLF
cQry	+="TL_HOFIM,																		"+ CRLF
cQry	+="T9_NOME,																			"+ CRLF
cQry	+="CTT_DESC01,																		"+ CRLF
cQry	+="TD_NOME,																			"+ CRLF
cQry	+="TJ_DTORIGI,																		"+ CRLF
cQry	+="TJ_X_HOROS,																		"+ CRLF
cQry	+="TJ_SEREXEC,																		"+ CRLF
cQry	+="TJ_TIPMNT,																		"+ CRLF
cQry	+="TJ_TPPARD																		"+ CRLF
cQry	+="ORDER BY																			"+ CRLF
cQry	+="TJ_CODBEM,																		"+ CRLF
cQry	+="CTT_DESC01,																		"+ CRLF
cQry	+="TD_NOME,																			"+ CRLF
cQry	+="TJ_ORDEM																			"+ CRLF

If Select("TEMP") > 0
		TEMP->(dbCloseArea())
	EndIf
	
	TcQuery cQry New Alias "TEMP"
	
	dbSelectArea("TEMP")
	TEMP->(dbGoTop())
///////////////////primeira parte cabe็alho primeiro registro////////////////////
    cCodbem := TEMP->CODBEM
    cLocaliz := TEMP->LOCALIZ
    ctipomnt := TEMP->TIPOMANUT

    oPrint:Say(0040,1270,"Periodo: "+DTOC(MV_PAR01)+" at้ "+DTOC(MV_PAR02)		   ,oFont11b)
	oPrint:Say(0100,0050,"INYLBRA"												   ,oFont15b)
	oPrint:Say(0100,1000,"Diferen็a de tempo entre abertura OS e inicio da Tarefa" ,oFont15b)
	oPrint:Say(0100,2700,"Pแgina "+CVALTOCHAR(nPag) 		  					   ,oFont11b)
	oPrint:Say(0100,2900,DTOC(Date())								        	   ,oFont11b)
	
	oPrint:Say(0200,0050,"Cod. Bem:"	,oFont15b)
	oPrint:Say(0200,0570,"Descri็ใo:"	,oFont15b)
	oPrint:Say(0200,1700,"Localiza็ใo:" ,oFont15b)

    oPrint:Say(0200,0320,alltrim(TEMP->CODBEM)	,oFont12b)
	oPrint:Say(0200,0870,alltrim(TEMP->NOMEBEM)	,oFont12b)
    oPrint:Say(0200,2030,alltrim(TEMP->LOCALIZ)	,oFont12b)

	oPrint:Say(0300,0050,"Tipo Manut.:"			 ,oFont15b)
	oPrint:Say(0300,0400,alltrim(TEMP->TIPOMANUT),oFont15b)

    oPrint:Say(0400,0050,"Num.O.S"  		,oFont11b)
	oPrint:Say(0400,0250,"Data ini. Os" 	,oFont11b)
	oPrint:Say(0400,0500,"Hr Ini Os" 	 	,oFont11b)
	oPrint:Say(0400,0700,"Data Ini Taf."	,oFont11b)
	oPrint:Say(0400,0950,"Hr Ini Taf." 		,oFont11b)
	oPrint:Say(0400,1150,"Data Fim Taf."	,oFont11b)
	oPrint:Say(0400,1400,"Hr Fim Taf." 		,oFont11b)
	oPrint:Say(0400,1600,"Servi็o Exec."    ,oFont11b)
	oPrint:Say(0400,2840,"Tempo Espera" 	,oFont11b) 
	oPrint:Say(0400,3120,"Tempo Tarefa" 	,oFont11b) 
	
	nLinha += 440

	/////////////////////fim primeira parte////////////////////////////

    While TEMP->(!EOF())

		If nLinha > 1760
			nLinha:= 250
			nPag++
			oPrint:EndPage()
			oPrint:StartPage()
			oPrint:Say(0040,1270,"Periodo: "+DTOC(MV_PAR01)+" at้ "+DTOC(MV_PAR02)			,oFont11b)
			oPrint:Say(0100,0050,"INYLBRA"													,oFont15b)
			oPrint:Say(0100,1000,"Diferen็a de tempo entre abertura OS e inicio da Tarefa"	,oFont15b)
			oPrint:Say(0100,2900,DTOC(Date())								       			,oFont11b)
			oPrint:Say(0100,2700,"Pแgina "+CVALTOCHAR(nPag) 		  					    ,oFont11b)
		EndIf

		_cDtInA	 := VAL(SUBSTR(TEMP->DTINIOS,1,4)+SUBSTR(TEMP->DTINIOS,5,2)+SUBSTR(TEMP->DTINIOS,7,2))
		_cDtFimA := VAL(SUBSTR(TEMP->DTINITF,1,4)+SUBSTR(TEMP->DTINITF,5,2)+SUBSTR(TEMP->DTINITF,7,2))

		cDtiniTf := VAL(SUBSTR(TEMP->DTINITF,1,4)+SUBSTR(TEMP->DTINITF,5,2)+SUBSTR(TEMP->DTINITF,7,2))
		cDtfimTf := VAL(SUBSTR(TEMP->DTFIMTF,1,4)+SUBSTR(TEMP->DTFIMTF,5,2)+SUBSTR(TEMP->DTFIMTF,7,2))

    	If alltrim(TEMP->LOCALIZ) <> alltrim(cLocaliz) .OR.  alltrim(TEMP->CODBEM) <> alltrim(cCodbem) //troca de "bloco de informa็oes" quando ้ outro localiza็ao ou maquina
			oPrint:Say(nLinha,3120,"Total:"+cValtoChar(nToTaref)+"Hrs"	,oFont11b) //TOTAL TAREFA
			nToTareG:= cValtoChar( SomaHoras( nToTareG, nToTaref ) )
			nToTaref:="00:00"

			oPrint:Say(nLinha,2840,"Total: "+cValtoChar(nTotal)+"Hrs"	,oFont11b) //TOTAL ESPERA
			nTotalGr:= cValtoChar( SomaHoras( nTotalGr, nTotal ) )
			nTotal:="00:00"
			nLinha+=50
	
			oPrint:Say(nLinha,0050,"Cod. Bem:"	 ,oFont15b)
			oPrint:Say(nLinha,0570,"Descri็ใo:"	 ,oFont15b)
			oPrint:Say(nLinha,1700,"Localiza็ใo:",oFont15b)

			oPrint:Say(nLinha,0320,alltrim(TEMP->CODBEM) ,oFont12b)
			oPrint:Say(nLinha,0870,alltrim(TEMP->NOMEBEM),oFont12b)
    		oPrint:Say(nLinha,2030,alltrim(TEMP->LOCALIZ),oFont12b)
			nLinha+=100
			oPrint:Say(nLinha,0050,"Tipo Manut.:"			,oFont15b)
			oPrint:Say(nLinha,0400,alltrim(TEMP->TIPOMANUT) ,oFont15b)
			nLinha+=100
  			oPrint:Say(nLinha,0050,"Num.O.S"  		,oFont11b)
			oPrint:Say(nLinha,0250,"Data ini. Os" 	,oFont11b)
			oPrint:Say(nLinha,0500,"Hr Ini Os" 	 	,oFont11b)
			oPrint:Say(nLinha,0700,"Data Ini Taf."	,oFont11b)
			oPrint:Say(nLinha,0950,"Hr Ini Taf." 	,oFont11b)
			oPrint:Say(nLinha,1150,"Data Fim Taf."	,oFont11b)
			oPrint:Say(nLinha,1400,"Hr Fim Taf." 	,oFont11b)
			oPrint:Say(nLinha,1600,"Servi็o Exec."  ,oFont11b)
			oPrint:Say(nLinha,2840,"Tempo Espera" 	,oFont11b)
			oPrint:Say(nLinha,3120,"Tempo Tarefa" 	,oFont11b)

			If _cDtInA == _cDtFimA .AND. TEMP->HRINIOS > TEMP->HRINITF .OR. _cDtInA > _cDtFimA //QUANDO O INICIO DA TAREFA FOR MENOR QUE A INCLUSAO DA OS PEDIDO MNT 13/10/2020
				nHoraTotal := U_CalcHr(_cDtInA,"00:00",_cDtFimA,"00:00")
			Else
				nHoraTotal := U_CalcHr(_cDtInA,TEMP->HRINIOS,_cDtFimA,TEMP->HRINITF) 
			EndIf
			nLinha+=50
			oPrint:Say(nLinha,0050,TEMP->OS  	    ,oFont11b)
			oPrint:Say(nLinha,0250,substr(TEMP->DTINIOS,7,2)+"/"+substr(TEMP->DTINIOS,5,2)+"/"+substr(TEMP->DTINIOS,1,4),oFont11b) 	
			oPrint:Say(nLinha,0500,TEMP->HRINIOS 	 	,oFont11b)
			oPrint:Say(nLinha,0700,substr(TEMP->DTINITF,7,2)+"/"+substr(TEMP->DTINITF,5,2)+"/"+substr(TEMP->DTINITF,1,4),oFont11b)
			oPrint:Say(nLinha,0950,TEMP->HRINITF		,oFont11b)
			oPrint:Say(nLinha,1150,substr(TEMP->DTFIMTF,7,2)+"/"+substr(TEMP->DTFIMTF,5,2)+"/"+substr(TEMP->DTFIMTF,1,4),oFont11b)
			oPrint:Say(nLinha,1400,TEMP->HRFIMTF		,oFont11b)
		
			oPrint:Say(nLinha,1600,SUBSTR(ALLTRIM(TEMP->SEREEX),1,50),oFont11b) //para caber toda observa็ao
			If LEN(ALLTRIM(TEMP->SEREEX)) > 51
			 nLinha += 50
			 oPrint:Say(nLinha,1600,SUBSTR(ALLTRIM(TEMP->SEREEX),51,80),oFont11b)
			EndIf

			oPrint:Say(nLinha,2840,nHoraTotal+" Hrs"	,oFont11b)//tempo espera
			nTotal := nHoraTotal

			nHoraTaf := U_CalcHr(cDtiniTf,TEMP->HRINITF,cDtfimTf,TEMP->HRFIMTF) 
			oPrint:Say(nLinha,3120,nHoraTaf+" Hrs"	,oFont11b)//tempo tarefa
			nToTaref := nHoraTaf
	
			nLinha+=60

			cCodbem := TEMP->CODBEM
    		cLocaliz := TEMP->LOCALIZ
    		ctipomnt := TEMP->TIPOMANUT
		 TEMP->(dbSkip())
		//////////////////////////////////////////////////////////
   		ElseIf alltrim(TEMP->TIPOMANUT) <> alltrim(ctipomnt) //troca de "bloco de informa็oes" quando muda tipo manuten็ao
   			nLinha+=50

			oPrint:Say(nLinha,3120,"Total:"+cValtoChar(nToTaref)+"Hrs"	,oFont11b)
			nToTareG:= cValtoChar( SomaHoras( nToTareG, nToTaref ) )
			nToTaref:="00:00"

			oPrint:Say(nLinha,2840,"Total: "+cValtoChar(nTotal)+"Hrs"	,oFont11b) 
			nTotalGr:= cValtoChar( SomaHoras( nTotalGr, nTotal ) )
			nTotal:="00:00"

			nLinha+=100
			oPrint:Say(nLinha,0050,"Tipo Manut.:"		   ,oFont15b)
			oPrint:Say(nLinha,0400,alltrim(TEMP->TIPOMANUT),oFont15b)
			nLinha+=100
  			oPrint:Say(nLinha,0050,"Num.O.S"  		,oFont11b)
			oPrint:Say(nLinha,0250,"Data ini. Os" 	,oFont11b)
			oPrint:Say(nLinha,0500,"Hr Ini Os" 	 	,oFont11b)
			oPrint:Say(nLinha,0700,"Data Ini Taf."	,oFont11b)
			oPrint:Say(nLinha,0950,"Hr Ini Taf." 	,oFont11b)
			oPrint:Say(nLinha,1150,"Data Fim Taf."	,oFont11b)
			oPrint:Say(nLinha,1400,"Hr Fim Taf." 	,oFont11b)
			oPrint:Say(nLinha,1600,"Servi็o Exec."  ,oFont11b)
			oPrint:Say(nLinha,2840,"Tempo Espera" 	,oFont11b)
			oPrint:Say(nLinha,3120,"Tempo Tarefa" 	,oFont11b)

			If _cDtInA == _cDtFimA .AND. TEMP->HRINIOS > TEMP->HRINITF .OR. _cDtInA > _cDtFimA //QUANDO O INICIO DA TAREFA FOR MAIOR QUE A INCLUSAO DA OS PEDIDO MNT 13/10/2020
				nHoraTotal := U_CalcHr(_cDtInA,"00:00",_cDtFimA,"00:00")
			Else
				nHoraTotal := U_CalcHr(_cDtInA,TEMP->HRINIOS,_cDtFimA,TEMP->HRINITF) 
			EndIf

			nLinha+=50
			oPrint:Say(nLinha,0050,TEMP->OS  	,oFont11b)
			oPrint:Say(nLinha,0250,substr(TEMP->DTINIOS,7,2)+"/"+substr(TEMP->DTINIOS,5,2)+"/"+substr(TEMP->DTINIOS,1,4),oFont11b) 
			oPrint:Say(nLinha,0500,TEMP->HRINIOS,oFont11b)
			oPrint:Say(nLinha,0700,substr(TEMP->DTINITF,7,2)+"/"+substr(TEMP->DTINITF,5,2)+"/"+substr(TEMP->DTINITF,1,4),oFont11b)
			oPrint:Say(nLinha,0950,TEMP->HRINITF		,oFont11b)
			oPrint:Say(nLinha,1150,substr(TEMP->DTFIMTF,7,2)+"/"+substr(TEMP->DTFIMTF,5,2)+"/"+substr(TEMP->DTFIMTF,1,4),oFont11b)
			oPrint:Say(nLinha,1400,TEMP->HRFIMTF		,oFont11b)

			oPrint:Say(nLinha,1600,SUBSTR(ALLTRIM(TEMP->SEREEX),1,50),oFont11b)
			If LEN(ALLTRIM(TEMP->SEREEX)) > 51
			 nLinha += 50
			 oPrint:Say(nLinha,1600,SUBSTR(ALLTRIM(TEMP->SEREEX),51,80),oFont11b)
			EndIf

			oPrint:Say(nLinha,2840,nHoraTotal+" Hrs"	,oFont11b)
			nTotal := nHoraTotal

			nHoraTaf := U_CalcHr(cDtiniTf,TEMP->HRINITF,cDtfimTf,TEMP->HRFIMTF) 
			oPrint:Say(nLinha,3120,nHoraTaf+" Hrs"	,oFont11b)//tempo tarefa
			nToTaref := nHoraTaf

			nLinha+=60
			cCodbem := TEMP->CODBEM
    		cLocaliz := TEMP->LOCALIZ
    		ctipomnt := TEMP->TIPOMANUT

		 TEMP->(dbSkip())

		Else
	
			If _cDtInA == _cDtFimA .AND. TEMP->HRINIOS > TEMP->HRINITF .OR. _cDtInA > _cDtFimA //QUANDO O INICIO DA TAREFA FOR MAIOR QUE A INCLUSAO DA OS PEDIDO MNT 13/10/2020
				nHoraTotal := U_CalcHr(_cDtInA,"00:00",_cDtFimA,"00:00")
			Else
				nHoraTotal := U_CalcHr(_cDtInA,TEMP->HRINIOS,_cDtFimA,TEMP->HRINITF) 
			EndIf
    		//nLinha += 60

			oPrint:Say(nLinha,0050,TEMP->OS 	,oFont11b)
			oPrint:Say(nLinha,0250,substr(TEMP->DTINIOS,7,2)+"/"+substr(TEMP->DTINIOS,5,2)+"/"+substr(TEMP->DTINIOS,1,4),oFont11b) 
			oPrint:Say(nLinha,0500,TEMP->HRINIOS,oFont11b)
			oPrint:Say(nLinha,0700,substr(TEMP->DTINITF,7,2)+"/"+substr(TEMP->DTINITF,5,2)+"/"+substr(TEMP->DTINITF,1,4),oFont11b)
			oPrint:Say(nLinha,0950,TEMP->HRINITF,oFont11b)
			oPrint:Say(nLinha,1150,substr(TEMP->DTFIMTF,7,2)+"/"+substr(TEMP->DTFIMTF,5,2)+"/"+substr(TEMP->DTFIMTF,1,4),oFont11b)
			oPrint:Say(nLinha,1400,TEMP->HRFIMTF,oFont11b)
			
			oPrint:Say(nLinha,1600,SUBSTR(ALLTRIM(TEMP->SEREEX),1,50),oFont11b)
			If LEN(ALLTRIM(TEMP->SEREEX)) > 51
			 nLinha += 50
			 oPrint:Say(nLinha,1600,SUBSTR(ALLTRIM(TEMP->SEREEX),51,80),oFont11b)
			EndIf
			
			oPrint:Say(nLinha,2840,nHoraTotal+" Hrs"	,oFont11b)

			nHoraTaf := U_CalcHr(cDtiniTf,TEMP->HRINITF,cDtfimTf,TEMP->HRFIMTF) 
			oPrint:Say(nLinha,3120,nHoraTaf+" Hrs"	,oFont11b)//tempo tarefa
			nToTaref := cValtoChar( SomaHoras( nToTaref, nHoraTaf ) )

			nTotal := cValtoChar( SomaHoras( nTotal, nHoraTotal ) )

			nLinha += 60
			cCodbem := TEMP->CODBEM
    		cLocaliz := TEMP->LOCALIZ
    		ctipomnt := TEMP->TIPOMANUT
		 TEMP->(dbSkip())
		EndIf
	EndDo
	
	oPrint:Say(nLinha,3120,"Total:"+CVALTOCHAR(nToTaref)+"Hrs",oFont11b)
	oPrint:Say(nLinha,2840,"Total: "+CVALTOCHAR(nTotal)+"Hrs",oFont11b) 
	nLinha += 60
	nTotalGr:= cValtoChar( SomaHoras( nTotalGr, nTotal ) )
	oPrint:Say(nLinha,2840,"Total Geral: "+CVALTOCHAR(nTotalGr)+"Hrs",oFont11b) 
	nLinha += 60
	nToTareG:= cValtoChar( SomaHoras( nToTareG, nToTaref ) )
	oPrint:Say(nLinha,2840,"Total Geral Tarefa: "+cValtoChar(nToTareG)+" Hrs"	,oFont11b)
			
	TEMP->(dbCloseArea())
    Return()
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัอออออออออออออออออออออหออออออัออออออออออออปฑฑ
ฑฑบPrograma  ณExp2Excel บAutor  ณ Bruno E.de Souza	 บ Data ณ03/12/2020   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯอออออออออออออออออออออสออออออฯออออออออออออนฑฑ
ฑฑบDesc.     ณ Exporta relatorio para o Excel.							  บฑฑ
ฑฑบ          ณ Diferen็a de tempo entre abertura OS e inicio da Tarefa    บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Inylbra 													  บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function Exp2Excel()

// AADD(aCabExcel, {"TITULO DO CAMPO"	, "TIPO", NTAMANHO, NDECIMAIS})
AADD(_aCabExcel, 	{"","C"	, 40, 0})
AADD(_aCabExcel, 	{"","C"	, 40, 0})
AADD(_aCabExcel, 	{"","C"	, 40, 0})
AADD(_aCabExcel, 	{"","C"	, 40, 0})
AADD(_aCabExcel, 	{"","C"	, 40, 0})
AADD(_aCabExcel, 	{"","C"	, 40, 0})
AADD(_aCabExcel, 	{"","C"	, 40, 0})
AADD(_aCabExcel, 	{"","C"	, 40, 0})
AADD(_aCabExcel, 	{"","C"	, 40, 0})
AADD(_aCabExcel, 	{"","C"	, 40, 0})

MsgRun("Selecionando os Registros...", "Aguarde...", {|| GProcItens(_aCabExcel, _aIteExcel)})

MsgRun("Exportando os Registros para o Excel...", "Aguarde...",{||DlgToExcel({{"GETDADOS","Diferen็a de tempo entre abertura OS e inicio da Tarefa",_aCabExcel,_aIteExcel}})})

Return()
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณGProcIten บAutor  ณBruno E. deSouza    บ Data ณ  03/12/2020 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณColeta dados para a gera็ao da planilha		              บฑฑ
ฑฑบ          ณ                                      					  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function GProcItens(_aCabExcel, _aIteExcel)

cQry	:= "SELECT																			"+ CRLF
cQry	+="TJ_CODBEM AS 'CODBEM',															"+ CRLF
cQry	+="T9_NOME AS 'NOMEBEM',															"+ CRLF
cQry	+="CTT_DESC01 AS 'LOCALIZ',															"+ CRLF
cQry	+="TD_NOME AS 'TIPOMANUT',															"+ CRLF
cQry	+="TJ_ORDEM AS 'OS',																"+ CRLF
cQry	+="TJ_DTORIGI AS 'DTINIOS',															"+ CRLF
cQry	+="TJ_X_HOROS AS 'HRINIOS',															"+ CRLF
cQry	+="MIN(TL_DTINICI) AS 'DTINITF',													"+ CRLF
cQry	+="TL_HOINICI AS 'HRINITF',															"+ CRLF
cQry	+="TL_DTFIM AS DTFIMTF,																"+ CRLF
cQry	+="TL_HOFIM AS HRFIMTF, 															"+ CRLF
cQry	+="ISNULL(CAST(CAST(TJ_SEREXEC AS VARBINARY(8000)) AS VARCHAR(8000)),'') AS 'SEREEX'"+ CRLF
cQry	+="FROM																				"+ CRLF
cQry	+=""+RetSQLName("STJ")+" STJ 														"+ CRLF
cQry	+="JOIN																				"+ CRLF
cQry	+=""+RetSQLName("STL")+" STL														"+ CRLF
cQry	+="ON																				"+ CRLF
cQry	+="TJ_FILIAL = TL_FILIAL															"+ CRLF
cQry	+="AND																				"+ CRLF
cQry	+="TJ_ORDEM = TL_ORDEM																"+ CRLF
cQry	+="AND																				"+ CRLF
cQry	+="STJ.D_E_L_E_T_<>'*'																"+ CRLF
cQry	+="JOIN																				"+ CRLF
cQry	+=""+RetSQLName("ST9")+" ST9 														"+ CRLF
cQry	+="ON																				"+ CRLF
cQry	+="TJ_CODBEM = T9_CODBEM															"+ CRLF
cQry	+="JOIN																				"+ CRLF
cQry	+=""+RetSQLName("CTT")+" CTT 														"+ CRLF
cQry	+="ON																				"+ CRLF
cQry	+="TJ_CCUSTO = CTT_CUSTO															"+ CRLF
cQry	+="AND																				"+ CRLF
cQry	+="TJ_FILIAL = CTT_FILIAL															"+ CRLF
cQry	+="AND																				"+ CRLF
cQry	+="CTT_FILIAL = "+xFilial("CTT")+" 													"+ CRLF	
cQry	+="JOIN																				"+ CRLF
cQry	+=""+RetSQLName("STD")+" STD 														"+ CRLF
cQry	+="ON																				"+ CRLF
cQry	+="TJ_CODAREA = TD_CODAREA															"+ CRLF
cQry	+="WHERE																			"+ CRLF
cQry	+="STL.D_E_L_E_T_<>'*'																"+ CRLF
cQry	+="AND																				"+ CRLF
cQry	+="TL_TIPOREG = 'M'																	"+ CRLF
cQry	+="AND																				"+ CRLF
cQry	+="TJ_SITUACA <> 'C'																"+ CRLF
cQry	+="AND																				"+ CRLF
cQry	+="TL_FILIAL = "+xFilial("STL")+" 													"+ CRLF
cQry	+="AND																				"+ CRLF
cQry	+="TJ_FILIAL = "+xFilial("STJ")+" 													"+ CRLF
cQry	+="AND																				"+ CRLF
cQry 	+="TJ_DTORIGI BETWEEN  '"+DTOS(MV_PAR01)+"' AND  '"+DTOS(MV_PAR02)+"' 				"+ CRLF	
cQry 	+="AND																				"+ CRLF
cQry 	+="TJ_CODBEM BETWEEN  '"+ALLTRIM(MV_PAR03)+"' AND  '"+ALLTRIM(MV_PAR04)+"' 			"+ CRLF	
cQry	+="AND																				"+ CRLF
cQry	+="TJ_TIPMNT = '1'																	"+ CRLF
cQry	+="AND																				"+ CRLF
cQry	+="TJ_TPPARD = '1'																	"+ CRLF
cQry	+="AND																				"+ CRLF
cQry	+="TL_DTFIM <> ''																	"+ CRLF
cQry	+="GROUP BY																			"+ CRLF
cQry	+="TJ_ORDEM,																		"+ CRLF
cQry	+="TJ_CODBEM,																		"+ CRLF
cQry	+="TL_HOINICI,																		"+ CRLF
cQry	+="TL_DTFIM,																		"+ CRLF
cQry	+="TL_HOFIM,																		"+ CRLF
cQry	+="T9_NOME,																			"+ CRLF
cQry	+="CTT_DESC01,																		"+ CRLF
cQry	+="TD_NOME,																			"+ CRLF
cQry	+="TJ_DTORIGI,																		"+ CRLF
cQry	+="TJ_X_HOROS,																		"+ CRLF
cQry	+="TJ_SEREXEC,																		"+ CRLF
cQry	+="TJ_TIPMNT,																		"+ CRLF
cQry	+="TJ_TPPARD																		"+ CRLF
cQry	+="ORDER BY																			"+ CRLF
cQry	+="TJ_CODBEM,																		"+ CRLF
cQry	+="CTT_DESC01,																		"+ CRLF
cQry	+="TD_NOME,																			"+ CRLF
cQry	+="TJ_ORDEM																			"+ CRLF

	If Select("TEMP") > 0
		TEMP->(dbCloseArea())
	EndIf
	
	TcQuery cQry New Alias "TEMP"
	
	dbSelectArea("TEMP")
	TEMP->(dbGoTop())

	cCodbem  := TEMP->CODBEM
    cLocaliz := TEMP->LOCALIZ
    ctipomnt := TEMP->TIPOMANUT
     /////CABEวALHO/////////////
		AADD(_aIteExcel,{"Periodo: "+DTOC(MV_PAR01)+" at้ "+DTOC(MV_PAR02)	,;
		"INYLBRA"															,;
		"Diferen็a de tempo entre abertura OS e inicio da Tarefa"			,;
		DTOC(Date())														,;
		""																	,;
		""																	,;
		""																	,;
		""																	,;
		""																	,;
		""																	,})
		/////////////////////primeiro registro////////////
		AADD(_aIteExcel,{"Cod. Bem:"+alltrim(TEMP->CODBEM)	,;
		"Descri็ใo: "+alltrim(TEMP->NOMEBEM)				,;
		"Localiza็ใo: "+alltrim(TEMP->LOCALIZ)				,;
		""													,;
		""													,;
		""													,;
		""													,;
		""													,;
		""													,;
		""													,})
		///////////////////////////////////
		AADD(_aIteExcel,{"Tipo Manut.: "+alltrim(TEMP->TIPOMANUT)	,;
		""															,;
		""															,;
		""															,;
		""															,;
		""															,;
		""															,;
		""															,;
		""															,;
		""															,})
		////////cabe็alho itens////////////
		AADD(_aIteExcel,{"Num.O.S" ,;
		"Data ini. Os"			   ,;
		"Hr Ini Os" 			   ,;
		"Data Ini Taf."			   ,;
		"Hr Ini Taf." 			   ,;
		"Data Fim Taf."			   ,;
		"Hr Fim Taf."			   ,;
		"Servi็o Exec." 		   ,;
		"Tempo Espera" 			   ,;
		"Tempo Tarefa" 			   ,})
		
		///////////Coleta os demais registros//////////

	While TEMP->(!EOF())

		_cDtInA	 := VAL(SUBSTR(TEMP->DTINIOS,1,4)+SUBSTR(TEMP->DTINIOS,5,2)+SUBSTR(TEMP->DTINIOS,7,2))
		_cDtFimA := VAL(SUBSTR(TEMP->DTINITF,1,4)+SUBSTR(TEMP->DTINITF,5,2)+SUBSTR(TEMP->DTINITF,7,2))

		cDtiniTf := VAL(SUBSTR(TEMP->DTINITF,1,4)+SUBSTR(TEMP->DTINITF,5,2)+SUBSTR(TEMP->DTINITF,7,2))
		cDtfimTf := VAL(SUBSTR(TEMP->DTFIMTF,1,4)+SUBSTR(TEMP->DTFIMTF,5,2)+SUBSTR(TEMP->DTFIMTF,7,2))

    	If alltrim(TEMP->LOCALIZ) <> alltrim(cLocaliz) .OR.  alltrim(TEMP->CODBEM) <> alltrim(cCodbem) //troca de "bloco de informa็oes" quando ้ outro localiza็ao ou maquina

			AADD(_aIteExcel,{""					,;
			""									,;
			""									,;
			""									,;
			""									,;
			""									,;
			""									,;
			""									,;
			"Total: "+cValtoChar(nTotal)+" Hrs"	,;
			"Total: "+cValtoChar(nToTaref)+" Hrs",})

			nTotalGr:= cValtoChar( SomaHoras( nTotalGr, nTotal ) )
			nTotal:="00:00"

			nToTareG:= cValtoChar( SomaHoras( nToTareG, nToTaref ) )
			nToTaref:="00:00"
			
			AADD(_aIteExcel,{"Cod. Bem:"+alltrim(TEMP->CODBEM)	,;
			"Descri็ใo: "+alltrim(TEMP->NOMEBEM)				,;
			"Localiza็ใo: "+alltrim(TEMP->LOCALIZ)				,;
			""													,;
			""													,;
			""													,;
			""													,;
			""													,;
			""													,;
			""													,})
			///////////////////////////////////
			AADD(_aIteExcel,{"Tipo Manut.: "+alltrim(TEMP->TIPOMANUT) ,;
			""														  ,;
			""														  ,;
			""														  ,;
			""														  ,;
			""														  ,;
			""														  ,;
			""                                                        ,;
			""														  ,;
			""														  ,})
			////////////////////////////////////
			AADD(_aIteExcel,{"Num.O.S" ,;
			"Data ini. Os"			   ,;
			"Hr Ini Os" 			   ,;
			"Data Ini Taf."			   ,;
			"Hr Ini Taf." 		       ,;
			"Data Fim Taf."			   ,;
			"Hr Fim Taf."			   ,;
			"Servi็o Exec." 		   ,;
			"Tempo Espera" 			   ,;
			"Tempo Tarefa" 			   ,})

			If _cDtInA == _cDtFimA .AND. TEMP->HRINIOS > TEMP->HRINITF .OR. _cDtInA > _cDtFimA//QUANDO O INICIO DA TAREFA FOR MAIOR QUE A INCLUSAO DA OS PEDIDO MNT 13/10/2020
				nHoraTotal := U_CalcHr(_cDtInA,"00:00",_cDtFimA,"00:00")
			Else
				nHoraTotal := U_CalcHr(_cDtInA,TEMP->HRINIOS,_cDtFimA,TEMP->HRINITF) 
			EndIf
			
				nHoraTaf := U_CalcHr(cDtiniTf,TEMP->HRINITF,cDtfimTf,TEMP->HRFIMTF)
				nTotal := nHoraTotal
				nToTaref := nHoraTaf

			AADD(_aIteExcel,{TEMP->OS 															 ,;
			substr(TEMP->DTINIOS,7,2)+"/"+substr(TEMP->DTINIOS,5,2)+"/"+substr(TEMP->DTINIOS,1,4),;
			TEMP->HRINIOS 																		 ,;
			substr(TEMP->DTINITF,7,2)+"/"+substr(TEMP->DTINITF,5,2)+"/"+substr(TEMP->DTINITF,1,4),;
			TEMP->HRINITF																		 ,;
			substr(TEMP->DTFIMTF,7,2)+"/"+substr(TEMP->DTFIMTF,5,2)+"/"+substr(TEMP->DTFIMTF,1,4),;
			TEMP->HRFIMTF																		 ,;
			ALLTRIM(TEMP->SEREEX)																 ,;
			nHoraTotal+" Hrs"																	 ,;
			nHoraTaf+" Hrs"																		 ,})
				
			cCodbem := TEMP->CODBEM
    		cLocaliz := TEMP->LOCALIZ
    		ctipomnt := TEMP->TIPOMANUT

			TEMP->(dbSkip())
			
   		ElseIf alltrim(TEMP->TIPOMANUT) <> alltrim(ctipomnt) //troca de "bloco de informa็oes" quando muda tipo manuten็ao
   			
			AADD(_aIteExcel,{"" 				,;
			""									,;
			""									,;
			""									,;
			""									,;
			""									,;
			""									,;
			""									,;
			"Total: "+cValtoChar(nTotal)+" Hrs" ,;
			"Total: "+cValtoChar(nToTaref)+" Hrs",})
			
			nTotalGr:= cValtoChar( SomaHoras( nTotalGr, nTotal ) )
			nTotal:="00:00"

			nToTareG:= cValtoChar( SomaHoras( nToTareG, nToTaref ) )
			nToTaref:="00:00"

			AADD(_aIteExcel,{"Tipo Manut.: "+alltrim(TEMP->TIPOMANUT) ,;
			""													  	  ,;
			""													 	  ,;
			""													  	  ,;
			""													  	  ,;
			""													  	  ,;
			""													  	  ,;
			""													  	  ,;
			""													  	  ,;
			""													  	  ,})
			/////////////////////////////////////
  			AADD(_aIteExcel,{"Num.O.S" ,;
			"Data ini. Os"			   ,;
			"Hr Ini Os" 			   ,;
			"Data Ini Taf."			   ,;
			"Hr Ini Taf." 			   ,;
			"Data Fim Taf."			   ,;
			"Hr Fim Taf."			   ,;
			"Servi็o Exec." 		   ,;
			"Tempo Espera" 		       ,;
			"Tempo Tarefa" 			   ,})

			If _cDtInA == _cDtFimA .AND. TEMP->HRINIOS > TEMP->HRINITF .OR. _cDtInA > _cDtFimA //QUANDO O INICIO DA TAREFA FOR MAIOR QUE A INCLUSAO DA OS PEDIDO MNT 13/10/2020
				nHoraTotal := U_CalcHr(_cDtInA,"00:00",_cDtFimA,"00:00")
			Else
				nHoraTotal := U_CalcHr(_cDtInA,TEMP->HRINIOS,_cDtFimA,TEMP->HRINITF) 
			EndIf

				nHoraTaf := U_CalcHr(cDtiniTf,TEMP->HRINITF,cDtfimTf,TEMP->HRFIMTF)
				nTotal := nHoraTotal
				nToTaref := nHoraTaf

			AADD(_aIteExcel,{TEMP->OS 															 ,;
			substr(TEMP->DTINIOS,7,2)+"/"+substr(TEMP->DTINIOS,5,2)+"/"+substr(TEMP->DTINIOS,1,4),;
			TEMP->HRINIOS 																		 ,;
			substr(TEMP->DTINITF,7,2)+"/"+substr(TEMP->DTINITF,5,2)+"/"+substr(TEMP->DTINITF,1,4),;
			TEMP->HRINITF																		 ,;
			substr(TEMP->DTFIMTF,7,2)+"/"+substr(TEMP->DTFIMTF,5,2)+"/"+substr(TEMP->DTFIMTF,1,4),;
			TEMP->HRFIMTF																		 ,;
			ALLTRIM(TEMP->SEREEX)																 ,;
			nHoraTotal+" Hrs"																	 ,;
			nHoraTaf+" Hrs"																		 ,})

			cCodbem := TEMP->CODBEM
    		cLocaliz := TEMP->LOCALIZ
    		ctipomnt := TEMP->TIPOMANUT

		 	TEMP->(dbSkip())

		Else
	
			If _cDtInA == _cDtFimA .AND. TEMP->HRINIOS > TEMP->HRINITF .OR. _cDtInA > _cDtFimA//QUANDO O INICIO DA TAREFA FOR MAIOR QUE A INCLUSAO DA OS PEDIDO MNT 13/10/2020
				nHoraTotal := U_CalcHr(_cDtInA,"00:00",_cDtFimA,"00:00")
			Else
				nHoraTotal := U_CalcHr(_cDtInA,TEMP->HRINIOS,_cDtFimA,TEMP->HRINITF) 
			EndIf
    		
			nHoraTaf := U_CalcHr(cDtiniTf,TEMP->HRINITF,cDtfimTf,TEMP->HRFIMTF) 
			nTotal := cValtoChar( SomaHoras( nTotal, nHoraTotal ) )
			nToTaref := cValtoChar( SomaHoras( nToTaref, nHoraTaf ) )

			AADD(_aIteExcel,{TEMP->OS 															 ,;
			substr(TEMP->DTINIOS,7,2)+"/"+substr(TEMP->DTINIOS,5,2)+"/"+substr(TEMP->DTINIOS,1,4),;
			TEMP->HRINIOS 																		 ,;
			substr(TEMP->DTINITF,7,2)+"/"+substr(TEMP->DTINITF,5,2)+"/"+substr(TEMP->DTINITF,1,4),;
			TEMP->HRINITF																		 ,;
			substr(TEMP->DTFIMTF,7,2)+"/"+substr(TEMP->DTFIMTF,5,2)+"/"+substr(TEMP->DTFIMTF,1,4),;
			TEMP->HRFIMTF																		 ,;
			ALLTRIM(TEMP->SEREEX)																 ,;
			nHoraTotal+" Hrs"																	 ,;
			nHoraTaf+" Hrs"																	     ,})

			cCodbem := TEMP->CODBEM
    		cLocaliz := TEMP->LOCALIZ
    		ctipomnt := TEMP->TIPOMANUT

		 TEMP->(dbSkip())

		EndIf
	EndDo
			AADD(_aIteExcel,{""					,;
			""									,;
			""									,;
			""									,;
			""									,;
			""									,;
			""									,;
			""									,;
			"Total: "+cValtoChar(nTotal)+" Hrs" ,;
			"Total: "+cValtoChar(nToTaref)+" Hrs",})
	
			nTotalGr:= cValtoChar(SomaHoras(nTotalGr,nTotal))

			AADD(_aIteExcel,{""						  ,;
			""										  ,;
			""										  ,;
			""										  ,;
			""										  ,;
			""										  ,;
			""										  ,;
			""										  ,;
			"Total Geral: "+CVALTOCHAR(nTotalGr)+"Hrs",;
			"Total Geral Tarefa: "+cValtoChar(nToTareG)+" Hrs",})

			TEMP->(dbCloseArea())

    Return()
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบFuncao    ณGeraMail  บAutor  ณVictor Dessunte     บ Data ณ  26/04/2010 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Calcula quantidade de horas                                บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบParametrosณ<ExpD1>: Data Inicial                                       บฑฑ
ฑฑบ          ณ<ExpC2>: Hora Inicial	 xx:xx						          บฑฑ
ฑฑบ          ณ<ExpD3>: Data Final										  บฑฑ
ฑฑบ          ณ<ExpC4>: Hora Final xx:xx                                   บฑฑ
ฑฑบ          ณRetorno: Caracter - quantidade de horas e minutos xx:xx	  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณGenerico.alterado com DateDiffDay 04/12/2020                บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

	User Function CalcHr(_cDtIn,_cHrIn,_cDtFim,_cHrFim)

	Local _nTotDat,_nNum,_nPonto1,_nHora1,_nMinuto1 		:= 0
	Local _nPonto2,_nHora2,_nMinuto2,_nTotMin2,_nTotHora2	:= 0
	Local _nTempo,_nHoras,_cTotHoras,_nMinutos,_cTotHr		:= 0
	Local _nHrC,_nHrS										:= 0

	//_nTotDat := (_cDtFim - _cDtIn)

	_nTotDat := DateDiffDay( sTOD(ALLTRIM(STR((_cDtIn)))),sTOD(ALLTRIM(STR((_cDtFim)))) )

	If _cDtIn > _cDtFim //toda a tarefa que inicia antes do inicio da abertura da OS, validar como sem atraso 00:00
		_nTotDat := 0
	EndIf

	If _nTotDat > 0
		_nNum := _nTotDat * 24

		// Hora Final
		_nPonto1  := At(":",_cHrFim)
		_nHora1	  := VAL(Substr(_cHrFim,1,_nPonto1-1))
		_nMinuto1 := VAL(Substr(_cHrFim,_nPonto1+1,Len(_cHrFim)))

		// Hora Inicial
		_nPonto2  := At(":",_cHrIn)
		_nHora2	  := VAL(Substr(_cHrIn,1,_nPonto2-1))
		_nMinuto2 := VAL(Substr(_cHrIn,_nPonto2+1,Len(_cHrIn)))
		_nTotMin2 := (60 - _nMinuto2)
		_nTotHora2 := ((_nNum - _nHora2)-1)

		_nTempo    := _nMinuto1 + _nTotMin2
		_nHoras    := Int(_nTempo/60)
		_cTotHoras := _nHora1 + _nTotHora2 + _nHoras
		_nMinutos  := Int(Round(60*((_nTempo/60) - _nHoras),0))
		_cTotHr    := AllTrim(StrZero(_cTotHoras,LEN(AllTrim(STR(_cTotHoras)))))  + ":" + AllTrim(StrZero(_nMinutos,2))
	Else
		_nHrS := VAL(SubStr(_cHrIn ,1,2)+SubStr(_cHrIn ,4,5))
		_nHrC := VAL(SubStr(_cHrFim,1,2)+SubStr(_cHrFim,4,5))
		_nHoras := ElapTime(AllTrim(_cHrIn)+":00",AllTrim(_cHrFim)+":00")
		_cTotHr := AllTrim(SubStr(_nHoras,1,5))
	EndIf

Return(_cTotHr)
	

  
