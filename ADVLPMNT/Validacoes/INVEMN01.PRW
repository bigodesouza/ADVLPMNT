#INCLUDE "PROTHEUS.CH"
#INCLUDE "RWMAKE.CH"
#INCLUDE "TOPCONN.CH"
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณINVEMN01  บAutor  ณBruno E. de Souza 	 บ Data ณ  07/11/2019 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณConsulta padrao para o campo ZZN_HISTOS                     บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function INVEMN01()

Local _cQry 	:= ""
Local oDlgCons	:= nil
Local cEquip    := Alltrim(ZZN->ZZN_EQUIP)
Local cEquipM   := Alltrim(M->ZZN_EQUIP)
Private aList	:= {}
Private oListBox:= nil
Private cNumOrd := ""

If INCLUI
	_cQry := "SELECT																							  " + CRLF
	_cQry += "TJ_FILIAL AS 'FILIAL',																			  " + CRLF
	_cQry += "TJ_ORDEM AS 'ORDEM',																				  " + CRLF
	_cQry += "SUBSTRING(TJ_DTORIGI,7,2)+'/'+SUBSTRING(TJ_DTORIGI,5,2)+'/'+SUBSTRING(TJ_DTORIGI,1,4)  AS 'DTORIGI'," + CRLF
	_cQry += "TJ_USUAINI AS 'INICIAL'																			  " + CRLF
	_cQry += "FROM																								  " + CRLF
	_cQry += ""+RetSqlName("STJ")+" AS STJ 	"																	    + CRLF
	_cQry += "WHERE																								  " + CRLF
	_cQry += "TJ_FILIAL = '"+xFilial("STJ")+"'																	  " + CRLF
	_cQry += "AND																								  " + CRLF
	_cQry += "TJ_CODBEM = '" + cEquipM +  "'"																	    + CRLF
	_cQry += "AND																								  " + CRLF
	_cQry += "TJ_SITUACA <> 'C' "   																				+ CRLF
	_cQry += "AND																								  " + CRLF
	_cQry += "TJ_TIPMNT = '2' 	"																					+ CRLF
Else
	_cQry := "SELECT																							  " + CRLF
	_cQry += "TJ_FILIAL AS 'FILIAL',																			  " + CRLF
	_cQry += "TJ_ORDEM AS 'ORDEM',																				  " + CRLF
	_cQry += "SUBSTRING(TJ_DTORIGI,7,2)+'/'+SUBSTRING(TJ_DTORIGI,5,2)+'/'+SUBSTRING(TJ_DTORIGI,1,4)  AS 'DTORIGI'," + CRLF
	_cQry += "TJ_USUAINI AS 'INICIAL'																			  " + CRLF
	_cQry += "FROM																								  " + CRLF
	_cQry += ""+RetSqlName("STJ")+" AS STJ 	"																		+ CRLF
	_cQry += "WHERE																								  " + CRLF
	_cQry += "TJ_FILIAL = '"+xFilial("STJ")+"'																	  " + CRLF
	_cQry += "AND																								  " + CRLF
	_cQry += "TJ_CODBEM = '" + cEquip +  "'																		  " + CRLF
	_cQry += "AND																								  " + CRLF 
	_cQry += "TJ_SITUACA <> 'C' "   																				+ CRLF
	_cQry += "AND																								  " + CRLF
	_cQry += "TJ_TIPMNT = '2' 	"  																					+ CRLF
	
EndIf

If Select("TEMP") > 0
	TEMP->(dbCloseArea())
EndIf

TCQUERY _cQry NEW ALIAS "TEMP"

dbSelectArea("TEMP")
TEMP->(dbGoTop())

While TEMP->(!EOF())
	aAdd(aList,{TEMP->FILIAL,TEMP->ORDEM,TEMP->DTORIGI,TEMP->INICIAL})
	TEMP->(dbSkip())
EndDo

TEMP->(dbclosearea())

If !Empty(aList)
	
	aSort(aList,,,{|x,y| x[2] < y[2]})
	DEFINE MSDIALOG oDlgCons TITLE "Consulta OS" FROM 000,000 TO 350,600 PIXEL OF oMainWnd
	
	@ 000,000 ListBox oListBox Fields ;
	HEADER "Filial","Ordem Servi็o","Data origem OS","Usuario Inicio da O.S.";
	Size 300,150 Of oDlgCons Pixel
	
	oListBox:SetArray(aList)
	oListBox:bLine := {|| {;
	aList[oListBox:nAT,01],;
	aList[oListBox:nAT,02],;
	aList[oListBox:nAT,03],;
	aList[oListBox:nAT,04]}}
	
	//Acao com duplo click do mouse
	oListBox:BLDBLClick := {||GetPed(aList,oListBox),oDlgCons:End()}
	
	@ 160,100 BUTTON "Imp. OS." 	size 50,13 ACTION {||ImpOs(aList,oListBox),oDlgCons:End()} Pixel of oDlgCons
	@ 160,155 BUTTON "Imp.ChkList." size 50,13 ACTION {||Impchk(aList,oListBox),oDlgCons:End()} Pixel of oDlgCons
	@ 160,215 BUTTON "OK" 			size 38,13 ACTION {||GetPed(aList,oListBox),oDlgCons:End()} Pixel of oDlgCons
	@ 160,255 BUTTON "Cancelar" 	size 38,13 ACTION oDlgCons:End() Pixel of oDlgCons
	
	ACTIVATE MSDIALOG oDlgCons CENTERED
	
	Return(.T.)
Else
	Msgstop("Nใo existe OS vinculado a esse equipamento")
	Return(.F.)
EndIf  

	Return()

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณImpOs    บAutor  ณMicrosiga           บ Data ณ  28/10/2020  บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function ImpOs(aList,oListBox)

STJ->(dbsetorder(1))
STJ->(Dbseek(xfilial("STJ")+aList[oListBox:nAt,2]))

cNumOrd := STJ->TJ_ORDEM

U_INRMN06(cNumOrd)

Return()
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณGetPed    บAutor  ณMicrosiga           บ Data ณ  07/11/2019 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function GetPed(aList,oListBox)

STJ->(dbsetorder(1))
STJ->(Dbseek(xfilial("STJ")+aList[oListBox:nAt,2]))

Return()
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณImpchk    บAutor  ณBruno E. de Souza   บ Data ณ  23/10/2020 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณRelatorio Check List Preventiva                             บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function Impchk(aList,oListBox)

Private oFont10b	:= TFont():New("Calibri",,10,,.F.,,,,.F.,.F.)
Private oFont11b	:= TFont():New("Arial",,11,,.F.,,,,.F.,.F.)
Private oFont12b	:= TFont():New("Arial",,12,,.T.,,,,.T.,.F.)
Private oFont15b	:= TFont():New("Arial",,15,,.T.,,,,.T.,.F.)
Private nLinha	    := 0
Private oPrint

ZM3->(dbsetorder(1))
If ZM3->(Dbseek(xfilial("ZM3")+aList[oListBox:nAt,2]))
	Processa( {|lEnd| IMPCHKA()}, 'Aguarde...','Gerando relat๓rio...', .t. )
Else
   MsgStop("Nใo Existe CheckList para essa OS")
   Return()
EndIf

Return()
/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณPrograma   ณIMPCHKAณ Autores   ณ Bruno E. de Souza      ณ Data ณ23/10/2020ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณDescricao  ณ  Imprime Informa็๕es Complementares                          ณฑฑ
ฑฑณ           ณ                                                              ณฑฑ
ฑฑภฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤูฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿*/
Static Function IMPCHKA()

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Inicializa Objeto TMSPrinter					   ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
oPrint  := TMSPrinter():New("Relatorio Check List Preventiva")
lPrinter:= oPrint:IsPrinterActive()
oPrint:SetLandscape()  // Marca Radio Button para impressao em paisagem
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
IMPCHKB()
oPrint:EndPage()

oPrint:Preview()

Return()
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณIMPCHKB   บAutor  ณBruno E. de Souza   บ Data ณ  23/10/2020 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณFormacao dos dados para o relatorio                         บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function IMPCHKB()

Local cQry 	  := ""
Local nPag    := 1
Local nLinha  := 0
Local cCtrl   := 0
Local cCtrlA  := 0

cQry := "SELECT																							"+ CRLF
cQry += "ZM3_SEQDOC AS 'CODDOC',																		"+ CRLF
//cQry += "ZM3_MATRIC AS 'MATRIC',																		"+ CRLF
cQry += "ZM3_CODCHK AS 'CODCHK',																		"+ CRLF
cQry += "ZM3_DCHECK AS 'DESCCHK',																		"+ CRLF
cQry += "ZM3_BEM    AS 'CODBEM',																		"+ CRLF
cQry += "T9_NOME    AS 'DESCBEM',																		"+ CRLF
//cQry += "SUBSTRING(ZM3_DATA,7,2)+'/'+SUBSTRING(ZM3_DATA,5,2)+'/'+SUBSTRING(ZM3_DATA,1,4)   AS 'DATACHK',"+ CRLF //tirar data a pedido manuten็ao 02/12/2020
//cQry += "ZM3_HORA   AS 'HORACHK',																		"+ CRLF
cQry += "CASE WHEN ZM3_TIPMNT = 'E' THEN 'ELETRICA'														"+ CRLF
cQry += "WHEN ZM3_TIPMNT = 'H' THEN 'HIDRAULICA' ELSE '' END 'TIPMNT',									"+ CRLF
cQry += "ZM3_SUGET AS 'SUGESTAO',																		"+ CRLF
cQry += "CASE WHEN ZM3_STATUS = 'O' THEN 'OK'															"+ CRLF
cQry += "WHEN ZM3_STATUS = 'N' THEN 'NOK'																"+ CRLF
cQry += "WHEN ZM3_STATUS = 'A' THEN 'NA' ELSE '' END 'STATUS',											"+ CRLF
cQry += "ZM3_OCORRE AS 'OCORRE',																		"+ CRLF
cQry += "ZM3_SEVERI AS 'SV',																			"+ CRLF
cQry += "CASE WHEN ZM3_MOTVAL = 'C' THEN 'CORRETIVA'													"+ CRLF
cQry += "WHEN ZM3_MOTVAL = 'A' THEN 'AUTONOMA'															"+ CRLF
cQry += "WHEN ZM3_MOTVAL = 'R' THEN 'PREDITIVA'															"+ CRLF
cQry += "WHEN ZM3_MOTVAL = 'P' THEN 'PREVENTIVA'														"+ CRLF
cQry += "WHEN ZM3_MOTVAL = 'M' THEN 'MFMEA' ELSE '' END 'MOTVALT' ,										"+ CRLF
cQry += "ZM3_REVIS AS 'REVISAO'																			"+ CRLF
cQry += "FROM																							"+ CRLF
cQry +=""+RetSQLName("ZM3")+" ZM3																		"+ CRLF
cQry += "JOIN																							"+ CRLF
cQry +=""+RetSQLName("ST9")+" ST9																		"+ CRLF
cQry += "ON 																							"+ CRLF
cQry += "ZM3_BEM = T9_CODBEM																			"+ CRLF
cQry += "AND																							"+ CRLF
cQry += "ZM3_FILIAL = T9_FILIAL																			"+ CRLF
cQry += "AND																							"+ CRLF
cQry += "ST9.D_E_L_E_T_<>'*'																			"+ CRLF
cQry += "WHERE																							"+ CRLF
cQry += "ZM3.D_E_L_E_T_<> '*'																			"+ CRLF
cQry += "AND																							"+ CRLF
cQry += "ZM3_FILIAL = '"+xFilial("ZM3")+"'																"+ CRLF
cQry += "AND																							"+ CRLF
cQry += "ZM3_SEQDOC = '"+aList[oListBox:nAt,2]+"'														"+ CRLF

	If Select("TEMP") > 0
		TEMP->(dbCloseArea())
	EndIf
	
	TcQuery cQry New Alias "TEMP"
	
	dbSelectArea("TEMP")
	TEMP->(dbGoTop())

	oPrint:Say(0100,0050,"INYLBRA"						   ,oFont15b)
	oPrint:Say(0100,0800,"Relatorio Check List Preventiva" ,oFont15b)
	oPrint:Say(0100,2900,DTOC(Date())					   ,oFont11b)
	oPrint:Say(0100,3120,"Pแgina "+CVALTOCHAR(nPag) 	   ,oFont11b)

	oPrint:Say(0200,0050,"Cod. Bem:"  ,oFont15b)
	oPrint:Say(0200,0670,"Descri็ใo:" ,oFont15b)
	oPrint:Say(0200,1970,"Sequencia:" ,oFont15b)
	
	oPrint:Say(0210,0320,TEMP->CODBEM  ,oFont12b)
	oPrint:Say(0210,0950,TEMP->DESCBEM ,oFont12b)
	oPrint:Say(0210,2300,TEMP->CODDOC  ,oFont12b)

	//oPrint:Say(0270,0030,"Matricula" ,oFont11b)
	oPrint:Say(0270,0030,"Rev." 	   ,oFont11b)
	oPrint:Say(0270,0130,"Cod.Chk."    ,oFont11b)
	oPrint:Say(0270,0370,"OC."    	   ,oFont11b)
	oPrint:Say(0270,0520,"SV." 		   ,oFont11b)
	oPrint:Say(0270,0670,"Mot.Alt."	   ,oFont11b)
	oPrint:Say(0270,0920,"Desc.Chk."   ,oFont11b)
	//oPrint:Say(0270,1200,"Data Chk." ,oFont11b)
	//oPrint:Say(0270,1420,"Hora Chk." ,oFont11b)
	oPrint:Say(0270,1800,"Tip.Mnt."    ,oFont11b)
	oPrint:Say(0270,2000,"Status" 	   ,oFont11b)
	oPrint:Say(0270,2170,"Servi็o executado",oFont11b)
	
	nLinha+=320

	While TEMP->(!EOF())

		If nLinha > 2100
		   nLinha:= 320
		   nPag++
		   oPrint:EndPage()
		   oPrint:StartPage()
		   oPrint:Say(0100,0050,"INYLBRA"						  ,oFont15b)
		   oPrint:Say(0100,0800,"Relatorio Check List Preventiva" ,oFont15b)
		   oPrint:Say(0100,2900,DTOC(Date())					  ,oFont11b)
		   oPrint:Say(0100,3120,"Pแgina "+CVALTOCHAR(nPag) 		  ,oFont11b)

			oPrint:Say(0200,0050,"Cod. Bem:"  ,oFont15b)
			oPrint:Say(0200,0670,"Descri็ใo:" ,oFont15b)
			oPrint:Say(0200,1970,"Sequencia:" ,oFont15b)
	
			oPrint:Say(0210,0320,TEMP->CODBEM  ,oFont12b)
			oPrint:Say(0210,0950,TEMP->DESCBEM ,oFont12b)
			oPrint:Say(0210,2300,TEMP->CODDOC  ,oFont12b)

			//oPrint:Say(0270,0030,"Matricula" ,oFont11b)
			oPrint:Say(0270,0030,"Rev." 	   ,oFont11b)
			oPrint:Say(0270,0130,"Cod.Chk."    ,oFont11b)
			oPrint:Say(0270,0370,"OC."    	   ,oFont11b)
			oPrint:Say(0270,0520,"SV." 		   ,oFont11b)
			oPrint:Say(0270,0670,"Mot.Alt."	   ,oFont11b)
			oPrint:Say(0270,0920,"Desc.Chk."   ,oFont11b)
			//oPrint:Say(0270,1200,"Data Chk." ,oFont11b)
			//oPrint:Say(0270,1420,"Hora Chk." ,oFont11b)
			oPrint:Say(0270,1800,"Tip.Mnt."    ,oFont11b)
			oPrint:Say(0270,2000,"Status" 	   ,oFont11b)
			oPrint:Say(0270,2170,"Servi็o executado",oFont11b)
		EndIf

			oPrint:Say(nLinha,0030,CVALTOCHAR(TEMP->REVISAO),oFont11b)
			//oPrint:Say(nLinha,0030,TEMP->MATRIC			    ,oFont11b)
	   		oPrint:Say(nLinha,0130,TEMP->CODCHK	 		    ,oFont11b)
			oPrint:Say(nLinha,0370,CVALTOCHAR(TEMP->OCORRE) ,oFont11b)
			oPrint:Say(nLinha,0520,CVALTOCHAR(TEMP->SV)	    ,oFont11b)
  			oPrint:Say(nLinha,0670,TEMP->MOTVALT		    ,oFont10b)
			//oPrint:Say(nLinha,1200,TEMP->DATACHK	 	    ,oFont11b)
			//oPrint:Say(nLinha,1420,TEMP->HORACHK		    ,oFont11b)
	   		oPrint:Say(nLinha,1800,TEMP->TIPMNT			    ,oFont10b)
			oPrint:Say(nLinha,2000,TEMP->STATUS	 		    ,oFont11b)
			oPrint:Say(nLinha,2170,SUBSTR(ALLTRIM(TEMP->SUGESTAO),1,55),oFont10b)
	   	    
			///////////Descri็ใo do tipo checklist/////////
			oPrint:Say(nLinha,0920,SUBSTR(ALLTRIM(TEMP->DESCCHK),1,45),oFont10b)
			If LEN(ALLTRIM(TEMP->DESCCHK)) > 45
				cCtrl := 1
			 	nLinha += 50
			 	oPrint:Say(nLinha,0920,SUBSTR(ALLTRIM(TEMP->DESCCHK),46,45),oFont10b)
			EndIf
			If LEN(ALLTRIM(TEMP->DESCCHK)) > 90
			    cCtrlA := 2
				nLinha += 50
			 	oPrint:Say(nLinha,0920,SUBSTR(ALLTRIM(TEMP->DESCCHK),91,45),oFont10b)
			EndIf
            ///////////Descri็ใo da sugestao/////////
			If LEN(ALLTRIM(TEMP->SUGESTAO)) > 55
				if cCtrl == 1    //tratativa para caso tenha mais de 1 linha de caracteres e nao tirar da posi็ao no layout
			 	   nLinha += 0
				Else 
				   nLinha += 50
				EndIf

				If cCtrlA == 2
					nLinha -= 50
				EndIf
			 	oPrint:Say(nLinha,2170,SUBSTR(ALLTRIM(TEMP->SUGESTAO),51,55),oFont10b)
				If cCtrlA == 2
				   nLinha += 50
				EndIf
			EndIf
				cCtrl := 0
				cCtrlA:= 0

			nLinha+=50
			
		TEMP->(dbSkip())
	EndDo

	TEMP->(dbCloseArea())
   
Return()
