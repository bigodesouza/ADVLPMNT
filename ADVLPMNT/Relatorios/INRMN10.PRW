#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "TBICONN.CH"
#INCLUDE "RWMAKE.CH"
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณINRMN10   บAutor  ณBruno E. de Souza   บ Data ณ  13/08/2020 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณRelatorio DE MANUTENวAO AUTONOMA                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function INRMN10()

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Declara variaveis										                ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
Private oFont10b	:= TFont():New("Arial",,10,,.F.,,,,.F.,.F.)
Private oFont11b	:= TFont():New("Arial",,11,,.F.,,,,.F.,.F.)
Private oFont12b	:= TFont():New("Arial",,12,,.T.,,,,.T.,.F.)
Private oFont15b	:= TFont():New("Arial",,15,,.T.,,,,.T.,.F.)
Private nLinha	    := 0
Private oPrint
Private cPerg   	:= "INRMN10"

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Parametros																ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
Pergunte(cPerg,.T.)

Processa( {|lEnd| INRMN10F()}, 'Aguarde...','Gerando Relatorio...', .t. )

Return()
/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณPrograma   ณINRMN10F	ณ Autores ณ Bruno E. de Souza      ณ Data ณ13/08/2020ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณDescricao  ณ  Imprime Informa็๕es Complementares                          ณฑฑ
ฑฑณ           ณ                                                              ณฑฑ
ฑฑภฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤูฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿*/
Static Function INRMN10F()

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Inicializa Objeto TMSPrinter					   ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
oPrint	:= TMSPrinter():New("RELATORIO DE MANUTENวAO AUTONOMA")
lPrinter:= oPrint:IsPrinterActive()
oPrint:SetLandscape()  // Marca Radio Button para impressao em paisagem
oPrint:SetpaperSize(9) // Ajuste para papel a4

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณCaso nao encontre a impressora conectada localmente,ณ
//ณabre a tela para escolha de impressora de rede      ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Inicia a impressao										   ณ
//ณ da Frente do Relatorio									   ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

If !lPrinter
	oPrint:Setup()
Endif

If !oPrint:IsPrinterActive()
	MsgInfo("Nใo existe nenhum impressora conectada no computador, impressใo cancelada!")
	Return
Endif

oPrint:StartPage()

Processa({|| INRMN10I() },"Processando Dados para Impressใo...")

oPrint:EndPage()

oPrint:Preview()

Return()
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณINRMN09I  บAutor  ณMicrosiga           บ Data ณ  13/08/2020 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณProcessa dados do relatorio                                 บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function INRMN10I()

Local nPag      := 1
Local cQry      := ""

cQry := "SELECT																								" + CRLF
cQry += "ZM1_SEQDOC AS 'DOCCHK',																			" + CRLF
cQry += "ZM1_DCHECK AS 'DESCPROL',																			" + CRLF
cQry += "ZM1_CELULA AS 'CELULA',																			" + CRLF
cQry += "ZM1_TPMAQU AS 'RECURSO',																			" + CRLF
cQry += "SUBSTRING(ZM1_DATA,7,2)+'/'+SUBSTRING(ZM1_DATA,5,2)+'/'+SUBSTRING(ZM1_DATA,1,4) AS  'DATACHK',	 	" + CRLF
cQry += "TJ_ORDEM AS 'OSMNT',																				" + CRLF
cQry += "TJ_CODBEM AS 'CODBEM',																				" + CRLF
cQry += "SUBSTRING(TJ_DTMRFIM,7,2)+'/'+SUBSTRING(TJ_DTMRFIM,5,2)+'/'+SUBSTRING(TJ_DTMRFIM,1,4) AS 'DTFIMOS'," + CRLF
cQry += "TJ_HOMRFIM AS 'HOFIMOS'																			" + CRLF
cQry += "FROM																								" + CRLF
cQry += "	" + RetSqlName("ZM1") + " ZM1 WITH(NOLOCK)														" + CRLF
cQry += "JOIN																								" + CRLF
cQry +=  "	" + RetSqlName("STJ") + " STJ WITH(NOLOCK)														" + CRLF
cQry += "ON																									" + CRLF
cQry += "ZM1_FILIAL = TJ_FILIAL																				" + CRLF
cQry += "AND																								" + CRLF
cQry += "ZM1_SEQDOC = TJ_X_AUTSQ OR ZM1_DOCPRG = TJ_X_AUTSQ													" + CRLF
cQry += "AND																								" + CRLF
cQry += "STJ.D_E_L_E_T_ <> '*'																				" + CRLF
cQry += "AND																								" + CRLF
cQry += "ZM1_FILIAL = '"+xFilial("ZM1")+"'																	" + CRLF
cQry += "WHERE																								" + CRLF
//cQry += "TJ_DTMRFIM <> ''" + CRLF
//cQry += "AND" + CRLF
cQry += "TJ_FILIAL = '"+xFilial("STJ")+"'																	" + CRLF
cQry += "AND																								" + CRLF
cQry += "TJ_SITUACA <> 'C'																					" + CRLF
cQry += "AND																								" + CRLF
cQry += "ZM1.D_E_L_E_T_<> '*'																				" + CRLF
cQry += "AND																								" + CRLF
cQry += "ZM1_STATUS = 'N'																					" + CRLF
cQry += "AND																								" + CRLF 
cQry += "ZM1_SEQDOC BETWEEN '"+ALLTRIM(MV_PAR01)+"' AND '"+ALLTRIM(MV_PAR02)+"'								" + CRLF
cQry += "AND																								" + CRLF
cQry += "ZM1_DATA BETWEEN  '"+DTOS(MV_PAR03)+"' AND '"+DTOS(MV_PAR04)+"'									" + CRLF
cQry += "ORDER BY																							" + CRLF
cQry += "ZM1_SEQDOC																							" + CRLF

	If Select("QUESZM1" ) > 0
		QUESZM1->(dbCloseArea())
	EndIf
		
		TcQuery cQry New Alias "QUESZM1"
		
		dbSelectArea("QUESZM1")
		
		QUESZM1->(dbGoTop())

	oPrint:Say(0100,1500,"Periodo: "+DTOC(MV_PAR03)+" at้ "+DTOC(MV_PAR04)	,oFont11b)
	oPrint:Say(0200,0150,"INYLBRA"											,oFont15b)
	oPrint:Say(0200,1330,"RELATORIO DE MANUTENวAO AUTONOMA"				    ,oFont15b)
	oPrint:Say(0100,3100,DTOC(Date())								        ,oFont11b)
	
	oPrint:Say(0300,0050,"Doc.Autonoma"				,oFont11b)
	oPrint:Say(0300,0340,"Desc. Problema"			,oFont11b)
	oPrint:Say(0300,1530,"Celula" 					,oFont11b)
	oPrint:Say(0300,1780,"Recurso"					,oFont11b)
	oPrint:Say(0300,2050,"Data Chk. List."			,oFont11b)
	oPrint:Say(0300,2350,"OS"						,oFont11b)
	oPrint:Say(0300,2600,"Cod. Bem"					,oFont11b)
	oPrint:Say(0300,2900,"Data fim OS"				,oFont11b)
	oPrint:Say(0300,3200,"Hora Fim OS"				,oFont11b)
	oPrint:Say(1900,3250,"Pแgina "+CVALTOCHAR(nPag) ,oFont11b)

		While QUESZM1->(!Eof())

		If nLinha > 1440
			nLinha:= 0
			nPag++
			oPrint:EndPage()
			oPrint:StartPage()

			oPrint:Say(0100,1500,"Periodo: "+DTOC(MV_PAR03)+" at้ "+DTOC(MV_PAR04)	,oFont11b)
			oPrint:Say(0200,0150,"INYLBRA"											,oFont15b)
			oPrint:Say(0200,1330,"RELATORIO DE MANUTENวAO AUTONOMA"				    ,oFont15b)
			oPrint:Say(0100,3100,DTOC(Date())								        ,oFont11b)
	
			oPrint:Say(0300,0050,"Doc.Autonoma"				,oFont11b)
			oPrint:Say(0300,0340,"Desc. Problema"			,oFont11b)
			oPrint:Say(0300,1530,"Celula" 					,oFont11b)
			oPrint:Say(0300,1780,"Recurso"					,oFont11b)
			oPrint:Say(0300,2050,"Data Chk. List."			,oFont11b)
			oPrint:Say(0300,2350,"OS"						,oFont11b)
			oPrint:Say(0300,2600,"Cod. Bem"					,oFont11b)
			oPrint:Say(0300,2900,"Data fim OS"				,oFont11b)
			oPrint:Say(0300,3200,"Hora Fim OS"				,oFont11b)
			oPrint:Say(1900,3250,"Pแgina "+CVALTOCHAR(nPag)	,oFont11b)
		EndIf

		oPrint:Say(	nLinha+0400,0050,QUESZM1->DOCCHK				,oFont11b)
		oPrint:Say(	nLinha+0400,0340,QUESZM1->DESCPROL				,oFont10b)
		oPrint:Say(	nLinha+0400,1530,QUESZM1->CELULA				,oFont11b)
		oPrint:Say(	nLinha+0400,1780,QUESZM1->RECURSO				,oFont11b)
		oPrint:Say(	nLinha+0400,2050,QUESZM1->DATACHK				,oFont11b)
		oPrint:Say(	nLinha+0400,2350,QUESZM1->OSMNT					,oFont11b)
		oPrint:Say(	nLinha+0400,2600,QUESZM1->CODBEM				,oFont11b)
		oPrint:Say(	nLinha+0400,2900,QUESZM1->DTFIMOS				,oFont11b)
		oPrint:Say(	nLinha+0400,3200,QUESZM1->HOFIMOS				,oFont11b)
		
		
		nLinha += 60

		QUESZM1->(dbSkip())
	EndDo

Return()
