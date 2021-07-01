#Include "Protheus.Ch"
#Include "TopConn.Ch"
#Include "FileIO.ch"
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³INAMN03   º Autor ³ Bruno Souza  º Data ³  27/10/14   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³Solicitaçao de Serviço Manutençao APENAS ENCERRADAS	º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
User Function INAMN03()

Local cFiltraADM    := "ZMS->ZMS_STATUS == '2' .OR. ZMS->ZMS_STATUS == '5'"
Private cCadastro   := "HISTORICO S.S ATENDIDAS"
Private aRotina     := {}
Private cString     := "ZMS"
Private aIndexZMS   := {}
Private bFiltraADM  := { || FilBrowse(cString,@aIndexZMS,@cFiltraADM) }
 
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Quebra do aRotina, caso haja necessidade de configurar³
//³vizualição para determinados usuários.                ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

	Aadd( aRotina , {"Pesquisar " 	 	,"PesqBrw"					,0,1 })
	Aadd( aRotina , {"Visualizar" 	 	,"AxVisual"			   		,0,2 })
   	Aadd( aRotina , {"Legenda"	  	 	,"u_ZMSLEGH(cString,6)" 	,0,6 })
 	Aadd( aRotina , {"Associar O.S"   	,"u_INCLHIS(cString,3)" 	,0,4 })
   	Aadd( aRotina , {"Reeprimir S.S"  	,"u_IMPSSH(cString,9)" 	    ,0,2 })

Private aCores :={{' Alltrim(ZMS->ZMS_STATUS) == "5" '  ,'BR_LARANJA' },;
                  {' Alltrim(ZMS->ZMS_STATUS) == "2" '   ,'BR_VERDE'   }}

	Eval(bFiltraADM)
	DbSelectArea(cString)
	dbSetOrder(1)                             
 	Mbrowse(6,1,22,74,cString,,,,,,aCores)
   
Return
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ ZMSLEGH  ºAutor  ³Bruno Souza         º Data ³27/10/2014   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³Legenda do browse.                                          º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³Paranoa - Tapetes                                           º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
User Function ZMSLEGH()

Local cCadastro:= "Status da Solicitação de Serviço"

Local aCores	:= {{	 'BR_LARANJA'  	,'CANCELADO'},;
					{    'BR_VERDE' 	,'ATENDIDO'	} }

BrwLegenda(cCadastro,"Legenda",aCores)

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³INCLHIS   º Autor ³ BRUNO SOUZA  º Data ³  27/10/14   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Altera Campo do cadastro					            º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
User Function INCLHIS(cAlias,nOpcao)

Local cTituloTela := "SOLICITAÇÃO SERVIÇO MANUTENÇÃO "
Local aAltera     := {}
Local aExibir     := {}
Private oDlgX     := Nil
Private aAdvSize  := MsAdvSize()
Private oFont16N  := TFont():New( "Arial" , , 16 , , .T. , , , , , .F. , .F. )

aAdvSize[6] -= (1/100) * aAdvSize[6]
aAdvSize[5] -= (1/100) * aAdvSize[5]  

If nOpcao == 3 .AND. ZMS->ZMS_STATUS == "5"  
	
	MSGALERT("Não é possivel associar O.S ou alterar SS cancelada")
	Return
EndIf  

If nOpcao == 3  
	RegToMemory( cAlias, .F.)
	aAltera :=  {"ZMS_OS","NOUSER"}
EndIf

aExibir :=  {"ZMS_NUM","ZMS_DATA","ZMS_HORA","ZMS_PRIOD","ZMS_USER","ZMS_SETOR","ZMS_RAMAL","ZMS_AREA","ZMS_PARADA","ZMS_MAQ","ZMS_CODMAQ","ZMS_SOLDES","ZMS_OS","ZMS_CANCEL","ZMS_ANDAME","NOUSER" }

oDlgX := MSDialog():New(0,0,aAdvSize[6],aAdvSize[5],cTituloTela,,,,,,,,,.T.)
oDlgX:LCENTERED   := .T.
oDlgX:LMAXIMIZED  := .T.

oPanel01 := TPanel():New(0,0,cTituloTela,oDlgX,oFont16N,.T.,.T.,NIL,NIL,aAdvSize[5],10,.F.,.T. )
oPanel01:nClrPane := 16776960
oPanel01:Align    := CONTROL_ALIGN_TOP

oPanel02 := TPanel():New(0,0, ,oDlgX,oFont16N,.F.,.F.,NIL,NIL,aAdvSize[5],45,.F.,.T. )
oPanel02:Align := CONTROL_ALIGN_ALLCLIENT

oMsMGet := MsmGet():New( cAlias , , nOpcao , , , ,aExibir , {5,5,aAdvSize[6],500} , aAltera , , , , , oPanel02 , , , , , , , , , , , )
oMsMGet:oBox:Align := CONTROL_ALIGN_ALLCLIENT

ACTIVATE MSDIALOG oDlgX CENTERED ON INIT EnchoiceBar(oDlgX, {|| ProcZMS(nOpcao)},{|| oDlgX:End() } )

Return 

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ ProcZMS º Autor ³ BRUNO SOUZA  º Data ³  30/04/14   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Funcao executada para gravacao dos dados.           º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function ProcZMS(nOpcao)

dbSelectArea("ZMS")
dbSetOrder(1)

If empty(M->ZMS_PRIOD) .or. empty(M->ZMS_SETOR) .or. empty(M->ZMS_RAMAL) .or. empty(M->ZMS_AREA) .or. empty(M->ZMS_PARADA).or. empty(M->ZMS_MAQ).or. empty(M->ZMS_SOLDES)
	
	MSGSTOP("Preencha os campos obrigatorios!!")
	Return
	
Endif

If  nOpcao == 3
	
	dbSelectArea("ZMS")
	dbSetOrder(1)
	If ZMS->(dbSeek(xFilial("ZMS")+ M->ZMS_NUM))
		
		SX3->(dbSetOrder(1))
		SX3->(dbSeek( "ZMS" ))
		If RecLock( "ZMS" , .F. )
			While SX3->(!EOF()) .AND. Alltrim(SX3->X3_ARQUIVO) == "ZMS"
				
				cCpoR := "ZMS->" + Alltrim(SX3->X3_CAMPO)
				cCpoM := "M->" + Alltrim(SX3->X3_CAMPO)
				&(cCpoR) := &(cCpoM)
				
				SX3->(dbSkip())
			EndDo
			MsUnlock()
		EndIf
	Endif
Endif

oDlgX:End()

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³IMPSS     ºAutor  ³Bruno e. de Souza   º Data ³  07/24/14   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ IMPRIME SOLICITAÇAO DE SERVIÇO                             º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ AP                                                         º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/

User Function IMPSSH()

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Declara variaveis										                ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

Private oFont08b	:= TFont():New("Arial",,08,,.T.,,,,.T.,.F.)
Private oFont11b	:= TFont():New("Arial",,11,,.T.,,,,.T.,.F.)
Private oFont12b	:= TFont():New("Arial",,12,,.T.,,,,.T.,.F.)
Private oFont15b	:= TFont():New("Arial",,15,,.T.,,,,.T.,.F.)
Private oBrshCinza	:= TBrush():New("",CLR_GRAY)
Private nLinha	    := 0
Private oPrint
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Parametros																³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
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
oPrint  := TMSPrinter():New("SOLICITAÇÃO DE SERVIÇO")
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
 
Local nBegin  := 0
Local nLinha  := 0
Local _dDatar := ZMS->ZMS_DATA    
Local nCount  := 0

_dDatar := DTOS(_dDatar)

dbSelectArea("ZMS")
ZMS->(dbSetOrder(1))
If ZMS->(dbSeek(xFilial("ZMS")+ZMS->ZMS_NUM))
EndIf

oPrint:Box (3250,0040,0080,2320)

oPrint:FillRect( { 190 , 040 , 250 , 2320}, oBrshCinza )
oPrint:FillRect( { 730 , 040 , 790 , 2320}, oBrshCinza )  //preenchimento fundo cinza
oPrint:FillRect( { 1210, 040 , 1270, 2320}, oBrshCinza )
oPrint:FillRect( { 1930, 040 , 1990, 2320}, oBrshCinza )
oPrint:FillRect( { 2590, 040 , 2650, 2320}, oBrshCinza )

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
oPrint:Line(nLinha+0850,0040, nLinha+0850,2320) //12
oPrint:Line(nLinha+0910,0040, nLinha+0910,2320) //13
oPrint:Line(nLinha+0970,0040, nLinha+0970,2320) //14	    //Linha Horizontal
oPrint:Line(nLinha+1030,0040, nLinha+1030,2320) //15
oPrint:Line(nLinha+1090,0040, nLinha+1090,2320) //16
oPrint:Line(nLinha+1150,0040, nLinha+1150,2320) //17
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
oPrint:Line(nLinha+2950,0040, nLinha+2950,2320) //47
oPrint:Line(nLinha+3010,0040, nLinha+3010,2320) //48
oPrint:Line(nLinha+3070,0040, nLinha+3070,2320) //49
oPrint:Line(nLinha+3130,0040, nLinha+3130,2320) //50
oPrint:Line(nLinha+3190,0040, nLinha+3190,2320) //51

oPrint:Line(nLinha+0080,0380, nLinha+0190,0380) //1     //Linhas Verticais
oPrint:Line(nLinha+0080,1940, nLinha+0190,1940) //2
oPrint:Line(nLinha+0310,1160, nLinha+0370,1160) //3
oPrint:Line(nLinha+0370,1640, nLinha+0610,1640) //4
oPrint:Line(nLinha+1270,0470, nLinha+1930,0470) //5
oPrint:Line(nLinha+1270,1000, nLinha+1930,1000) //6
oPrint:Line(nLinha+1990,0480, nLinha+2590,0480) //7
oPrint:Line(nLinha+1990,0805, nLinha+2590,0805) //8
oPrint:Line(nLinha+1990,1130, nLinha+2590,1130) //9
oPrint:Line(nLinha+1990,1455, nLinha+2590,1455) //10
oPrint:Line(nLinha+1990,1780, nLinha+2590,1780) //11
oPrint:Line(nLinha+1990,2105, nLinha+2590,2105) //12 
oPrint:Line(nLinha+1990,1130, nLinha+2590,1130) //13
oPrint:Line(nLinha+1990,1455, nLinha+2590,1455) //14
oPrint:Line(nLinha+1990,1780, nLinha+2590,1780) //15
oPrint:Line(nLinha+1990,2105, nLinha+2590,2105) //16 
oPrint:Line(nLinha+2650,0480, nLinha+3250,0480) //17
oPrint:Line(nLinha+2650,0710, nLinha+3250,0710) //18  
oPrint:Line(nLinha+2650,0970, nLinha+3250,0970) //19
oPrint:Line(nLinha+2650,1230, nLinha+3250,1230) //20
oPrint:Line(nLinha+2650,1455, nLinha+3250,1455) //21
oPrint:Line(nLinha+2650,1680, nLinha+3250,1680) //22 
oPrint:Line(nLinha+2650,1900, nLinha+3250,1900) //23

oPrint:Say(0110,0100,"INYLBRA" 			      				,oFont15b)
oPrint:Say(0110,0860,"SOLICITAÇÃO DE SERVIÇO"  				,oFont15b)
oPrint:Say(0080,1945,"Nº S.S" 				  				,oFont15b)
oPrint:Say(0120,2000,ZMS->ZMS_NUM			 				,oFont15b)

oPrint:Say(0200,1050,"REQUISITANTE" 		 				,oFont12b)

oPrint:Say(0255,0050,"Solicitante" 			 			 	,oFont08b)
oPrint:Say(0280,0050,SUBSTRING(ZMS->ZMS_USER,1,24)		 	,oFont08b)

oPrint:Say(0255,0470,"Data" 		 			 															 ,oFont08b)
oPrint:Say(0280,0470,SUBSTRING(_dDatar,7,2)+"/"+SUBSTRING(_dDatar,5,2)+"/"+SUBSTRING(_dDatar,1,4)			 ,oFont08b)

oPrint:Say(0255,0650,"Hora" 		 	     				,oFont08b)
oPrint:Say(0280,0650,ZMS->ZMS_HORA			 				,oFont08b)

oPrint:Say(0255,0770,"Ramal" 		 		 				,oFont08b)
oPrint:Say(0280,0770,ZMS->ZMS_RAMAL			 				,oFont08b)

oPrint:Say(0255,0935,"Status" 		                     	,oFont08b)
If ZMS->ZMS_STATUS == "1"
	oPrint:Say(0280,0935,"NAO ATENDIDO" 				 	,oFont08b)
Elseif ZMS->ZMS_STATUS == "2"
	oPrint:Say(0280,0935,"ATENDIDO" 	 				 	,oFont08b)
Elseif ZMS->ZMS_STATUS == "3"
	oPrint:Say(0280,0935,"EM APROVAÇÃO PELO USUARIO" 	 	,oFont08b)
Elseif ZMS->ZMS_STATUS == "4"
	oPrint:Say(0280,0935,"REJEITADO" 	 				 	,oFont08b)
Elseif ZMS->ZMS_STATUS == "5"
	oPrint:Say(0280,0935,"CANCELADA" 	 				 	,oFont08b) 
Elseif ZMS->ZMS_STATUS == "6"
	oPrint:Say(0280,0935,"EM ANDAMENTO" 	 			 	,oFont08b)
EndIf

oPrint:Say(0255,1170,"Nº OS" 		 						,oFont08b)
oPrint:Say(0280,1170,ZMS->ZMS_OS	 						,oFont08b)

oPrint:Say(0315,0045,"Area" 		 						,oFont08b)
oPrint:Say(0340,0045,ZMS->ZMS_AREA	 						,oFont08b)

oPrint:Say(0315,0400,"Setor" 		 						,oFont08b)
oPrint:Say(0340,0400,ZMS->ZMS_SETOR	 						,oFont08b)

oPrint:Say(0320,1170,"Prioridade" 	 						,oFont11b)
If ZMS->ZMS_PRIOD == 'A'
	oPrint:Say(0320,1400,"(X) Alta" 	 ,oFont11b)
	oPrint:Say(0320,1690,"(__) Média" 	 ,oFont11b)
	oPrint:Say(0320,1980,"(__) Baixa" 	 ,oFont11b)
	
ElseIf ZMS->ZMS_PRIOD == 'M'
	oPrint:Say(0320,1400,"(__) Alta" 	 ,oFont11b)
	oPrint:Say(0320,1690,"(X) Média" 	 ,oFont11b)
	oPrint:Say(0320,1980,"(__) Baixa" 	 ,oFont11b)
	
ElseIf ZMS->ZMS_PRIOD == 'B'
	oPrint:Say(0320,1400,"(__) Alta" 	 ,oFont11b)
	oPrint:Say(0320,1690,"(__) Média" 	 ,oFont11b)
	oPrint:Say(0320,1980,"(X) Baixa" 	 ,oFont11b)
	
Else
	oPrint:Say(0320,1400,"(__) Alta" 	 ,oFont11b)
	oPrint:Say(0320,1690,"(__) Média" 	 ,oFont11b)
	oPrint:Say(0320,1980,"(__) Baixa" 	 ,oFont11b)
EndIf

oPrint:Say(0375,0045,"Serviço Solicitado:" 	 ,oFont08b)

nLi := 0390
nCount:= MLCount(ZMS->ZMS_SOLDES,80)
For nBegin := 1 To iif(NCount > 6,6,NCount)
	if !Empty(MemoLine(ZMS->ZMS_SOLDES,80,nBegin))
		oPrint:Say (nLi,0295,MemoLine(ZMS->ZMS_SOLDES,80,nBegin) ,oFont08b)
		nLi := nLi + 60
	endif
Next nBegin

oPrint:Say(0375,1645,"Cód. Maq\Bem" 	,oFont08b)
oPrint:Say(0400,1645,ZMS->ZMS_CODMAQ	,oFont08b)

oPrint:Say(0375,1900,"Maquina\Bem" 	 	,oFont08b)
oPrint:Say(0400,1900,ZMS->ZMS_MAQ	 	,oFont08b)

oPrint:Say(0435,1645,"Parada:" 	 	 		     ,oFont08b)
If ZMS->ZMS_PARADA == 'T'
	oPrint:Say(0475,1645,"Total (X)" 	 	 	 ,oFont08b)
	oPrint:Say(0525,1645,"Parcial (__)" 	 	 ,oFont08b)
	oPrint:Say(0575,1645,"Sem Parada (__)" 	     ,oFont08b)
ElseIf ZMS->ZMS_PARADA == 'P'
	oPrint:Say(0475,1645,"Total (__)" 	 	 	 ,oFont08b)
	oPrint:Say(0525,1645,"Parcial (X)" 	 	     ,oFont08b)
	oPrint:Say(0575,1645,"Sem Parada (__)" 	     ,oFont08b)
ElseIf ZMS->ZMS_PARADA == 'S'
	oPrint:Say(0475,1645,"Total (__)" 	 	 	 ,oFont08b)
	oPrint:Say(0525,1645,"Parcial (__)" 	 	 ,oFont08b)
	oPrint:Say(0575,1645,"Sem Parada (X)" 	     ,oFont08b)
Else
	oPrint:Say(0475,1645,"Total (__)" 	 	 	 ,oFont08b)
	oPrint:Say(0525,1645,"Parcial (__)" 	 	 ,oFont08b)
	oPrint:Say(0575,1645,"Sem Parada (__)" 	     ,oFont08b)
EndIf

oPrint:Say(0740,1050,"MANUTENÇÃO" 		     ,oFont12b)

oPrint:Say(0795,0045,"Serviço executado:" 	 ,oFont08b)

oPrint:Say(1220,1050,"MATERIAL UTILIZADO" 	 ,oFont12b)

oPrint:Say(1280,0215,"Qtde" 	 	 		 ,oFont08b)
oPrint:Say(1280,0630,"Código do Material" 	 ,oFont08b)
oPrint:Say(1280,1500,"Descrição do material" ,oFont08b)

oPrint:Say(1940,1050,"MÃO DE OBRA UTILIZADA",oFont12b)

oPrint:Say(1995,0045,"Nome do Funcion." 	,oFont08b)
oPrint:Say(1995,0485,"R.E. do Funcion."    ,oFont08b)
oPrint:Say(1995,0810,"Data Início Tarefa"  ,oFont08b)
oPrint:Say(1995,1135,"Hora Início Tarefa"  ,oFont08b)
oPrint:Say(1995,1460,"Data Fim Tarefa" 	    ,oFont08b)
oPrint:Say(1995,1785,"Hora Fim tarefa"  	,oFont08b)
oPrint:Say(1995,2110,"Total Horas" 		    ,oFont08b)

oPrint:Say(2600,1050,"INTERRUPÇÕES" 	 ,oFont12b)
	
oPrint:Say(2655,0045,"Nome do Funcion." 	,oFont08b)
oPrint:Say(2655,0485,"R.E. do Funcion."    ,oFont08b)
oPrint:Say(2655,0715,"Data Início Tarefa"  ,oFont08b)
oPrint:Say(2655,0975,"Hora Início Tarefa"  ,oFont08b)
oPrint:Say(2655,1235,"Data Fim Tarefa" 	    ,oFont08b)
oPrint:Say(2655,1460,"Hora Fim tarefa"  	,oFont08b) 
oPrint:Say(2655,1685,"Total Horas" 		    ,oFont08b) 
oPrint:Say(2655,1905,"Motivo"	 		    ,oFont08b)

Return

