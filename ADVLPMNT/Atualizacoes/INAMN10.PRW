#INCLUDE "Protheus.Ch"
#INCLUDE "RwMake.Ch"
#INCLUDE "TopConn.Ch"
#INCLUDE "FiveWin.Ch"
#INCLUDE "TBICONN.CH"
#INCLUDE "TBICODE.CH"
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออหอออออออัออออออออออออออหออออออัอออออออออออปฑฑ
ฑฑบPrograma ณ INAMN10 บ Autor ณBruno E. de Souzaบ Data ณ03/02/20 บฑฑ
ฑฑฬออออออออออุอออออออออสอออออออฯออออออออออออออสออออออฯอออออออออออนฑฑ
ฑฑบDescricao ณ Tela de Check List de Manutencao Preventiva       บฑฑ
ฑฑศออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
User Function INAMN10()

	Private cCadastro := "CHECK LIST DE MANUTENวรO PREVENTIVA"
	Private aRotina   := {}
	Private cString   := "ZM3"
	
	Aadd( aRotina , {	"Pesquisar "	,	"Axpesqui"			,0,1	})
	Aadd( aRotina , {	"Visualizar"	,	"u_CADMNTPRE(2)"    ,0,2	})
	Aadd( aRotina , {	"Incluir"		,	"u_CADMNTPRE(3)"    ,0,3	})
	Aadd( aRotina , {	"Alterar"		,	"u_CADMNTPRE(4)"	,0,4	})
	Aadd( aRotina , {	"Excluir"		,	"u_CADMNTPRE(5)"	,0,4	})
	
	DbSelectArea(cString)
	DbSetOrder(1)
	Mbrowse(6,1,22,74,cString,,,,,,)

Return()
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณCADMNTPRE บ Autor ณBruno E.Souza  บ Data ณ 06/02/20   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Tela de Cadastro de Check List                       บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function CADMNTPRE(nOpcao,cOpcaoTm,cNumOs)

Local aAltera     	:= {}
Local nSty1         := GD_INSERT + GD_UPDATE + GD_DELETE
Local cPerg			:= "INAMN10"
Private nLinIni      := 10
Private nColIni      := 10
Private nLinFin      := 250
Private nColFin      := 400
Private oDlgY	     := Nil
Private _oFont2      := Nil
Private oFont17	     := TFont():New( "Arial" , , 17 , , .T. , , , , , .T. , .F. )
Private cOpcaoE      := "E"
Private cOpcaoH      := "H"
Private oDlgX       := Nil
Private oNew1       := Nil
Private oNew2       := Nil
Private aSizeAut  	:= MsAdvSize(.F.,420)
Private aAlt     	:= {}
Private aHeader  	:= {}
Private aCols       := {}
Private  i          := 0
Private oFont15B 	:= TFont():New("Courier New",,15,,.T.,,,,.T.,.F.)//FONTE 15,COURIER NEW, NEGRITO
Private oFont19B 	:= TFont():New("Courier New",,19,,.T.,,,,.T.,.F.)//FONTE 15,COURIER NEW, NEGRITO
//Private oData       := Nil
//Private cData       := DdataBase //retirado data a pedido da manuten็ao 02/10/2020
Private cCusto      := Space(9)
Private cFieldOk    := ""
Private aRecur  	:= {}
Private cRecur  	:= SPACE(06)
Private oRecur      := Nil
Private cTitPnl01   := ""
Private cSugest     := SPACE(110)
Private oMatric     := Nil
Private cMatric     := Space(06)
Private nOpcTel     := nOpcao
Private cOpcaoTp    := Space(01)
Private cNumOsM     := Space(06)
Private cUltos      := Space(06)
Private oCultos     := Nil
Private cDescbem    := ""
Private oDescbem	:= Nil
Private oBitmap1    := Nil

If nOpcao == 2 .or. nOpcao == 4
	If ZM3->ZM3_TIPMNT == "E"
		cTitPnl01 := "Check List de Manuten็ใo Preventiva Eletrica"
	Else
		cTitPnl01 := "Check List de Manuten็ใo Preventiva Hidraulica"
	EndIf	
Else
	If cOpcaoTm == "E" 
		cTitPnl01 := "Check List de Manuten็ใo Preventiva Eletrica"
	Else
		cTitPnl01 := "Check List de Manuten็ใo Preventiva Hidraulica"
	EndIf
EndIf
////////////tratativa quando inclui direto na Tela
	If !Empty(cNumOs)
		cNumOsM  := cNumOs
		cOpcaoTp := cOpcaoTm
	Else
		If nOpcTel == 3
			Pergunte(cPerg,.T.)

			If EMPTY(MV_PAR01)
				MsgAlert("Parametro em branco, Preencha o parametro")
				Return .F.
			Else

				dbSelectArea("STJ")
				STJ->(dBsetOrder(1))
				If STJ->(dBseek(xFilial("STJ")+MV_PAR01))

					If STJ->TJ_TIPMNT == "2"

						DEFINE FONT _oFont2  	NAME "Arial" Size 10,10 BOLD

						DEFINE MSDIALOG oDlgY TITLE "CHECK LIST PREVENTIVA" FROM nLinIni,nColIni TO nLinFin,nColFin PIXEL
						oDlgY:lCentered	:= .T.

						@ (nLinIni+005),(nColIni+015)  Button "CHECK LIST ELETRICA"    Size 150,25 PIXEL OF oDlgY ACTION U_CADMNTPRE(3,"E",MV_PAR01)	FONT oFont17 PIXEL OF oDlgY
						@ (nLinIni+045),(nColIni+015)  Button "CHECK LIST HIDRAULICA"  Size 150,25 PIXEL OF oDlgY ACTION U_CADMNTPRE(3,"H",MV_PAR01) FONT oFont17 PIXEL OF oDlgY

						ACTIVATE MSDIALOG oDlgY CENTER
					Else
						MsgAlert("Essa OS nao ้ do tipo preventiva")
						Return .F.
					EndIf
				Else
					MsgAlert("Essa OS nao existe")
					Return .F.
				EndIf
			EndIf
		EndIf
	EndIf
////////////////////////////
	If !Empty(cNumOsM)
		dbSelectArea("ZM3")
		ZM3->(dBsetOrder(2))
		If ZM3->(dBseek(xFilial("ZM3")+cNumOsM+cOpcaoTp))
			If cOpcaoTp == 'H'
				Alert('<b>Aten็ใo:</b><br>CheckList hidraulica ja realizada, OS: <br><br><font color="#FF0000">'+ cNumOsM +'</font>')
				Return .F.
			Else
				Alert('<b>Aten็ใo:</b><br>CheckList eletrica ja realizada, OS: <br><br><font color="#FF0000">'+ cNumOsM +'</font>')
				Return .F.
			EndIf
		EndIf
	EndIf

	If nOpcTel == 2
		nSty1 := 0
	Else
		nSty1 := GD_INSERT + GD_UPDATE + GD_DELETE
	Endif

	nPorcVert := 1 //% em rela็ใo a resolucao maxima
//Verifica resolu็ใo Vertical
	If aSizeAut[6] >= 934
		nPorcVert := 1
	ElseIf aSizeAut[6] >= 870
		nPorcVert := 0.89
	ElseIf aSizeAut[6] >= 774
		nPorcVert := 0.72
	ElseIf aSizeAut[6] >= 678
		nPorcVert := 0.65 //678/934
	ElseIf aSizeAut[6] >= 630
		nPorcVert := 0.60
	ElseIf aSizeAut[6] >= 510
		nPorcVert := 0.47
	Else
		nPorcVert := 0.28
	EndIf

// ------------- Folder -----------------
	nFolAltu := 320 * nPorcVert //Altura

	DEFINE FONT oMaFnt02	NAME "Verdana"		SIZE 0 , -09 BOLD
	DEFINE FONT oMaFnt01	NAME "Verdana"		SIZE 0 , -11 BOLD

	Define MsDialog oDlgX TITLE cTitPnl01 STYLE DS_MODALFRAME From aSizeAut[7],0 To aSizeAut[6],aSizeAut[5] OF oMainWnd PIXEL
	oDlgX:lCentered		:= .T.
	oDlgX:lMaximized	:= .T.

	oPanel01 := TPanel():New(01,01, cTitPnl01 ,oDlgX, oMaFnt01, .T., .F., NIL, NIL, aSizeAut[5], 10, .F., .T. )
	oPanel01:nClrPane	:= RGB(176,226,255)
	oPanel01:Align := CONTROL_ALIGN_TOP

	oPanel09 := TPanel():New( 1,1,  ,oDlgX,oMaFnt02, .F., .F., NIL, NIL,50, 100, .F., .T. )
	oPanel09:Align := CONTROL_ALIGN_ALLCLIENT

	oPanel02 := TPanel():New( 1,nFolAltu,  ,oDlgX,oMaFnt02, .F., .F., NIL, NIL,30, nFolAltu, .F., .T. )
	oPanel02:Align := CONTROL_ALIGN_BOTTOM

	aHeader  := _Header()

	If  nOpcTel == 3
		aAltera :=  {"ZM3_SUGET","ZM3_STATUS","NOUSER"} 
	ElseIf nOpcTel == 2
		aAltera :=  {"ZM3_SUGET","ZM3_STATUS","NOUSER"}
	ElseIf nOpcTel == 4
		aAltera :=  {"ZM3_STATUS","ZM3_SUGET","ZM3->ZM3_MATRIC","ZM3->ZM3_DATA" ,"NOUSER"}
	Else
		aAltera :=  {"NOUSER"}
	Endif

	@ 005,002 Say   "OS :" 		  	Size (200),(008) FONT oFont15B COLOR CLR_RED PIXEL OF oPanel09
	@ 005,150 Say "Maquina?" 		Size (200),(008) FONT oFont15B COLOR CLR_RED PIXEL OF oPanel09
	@ 005,274 Say "Digite o RE?" 	Size (200),(008) FONT oFont15B COLOR CLR_RED PIXEL OF oPanel09
	//@ 005,400 Say "Data ?"			Size (250),(008) FONT oFont15B COLOR CLR_RED PIXEL OF oPanel09
	@ 030,002 Say "Descr. Maq.:"	Size (250),(008) FONT oFont15B COLOR CLR_RED PIXEL OF oPanel09

	If  nOpcTel == 3
		@ 017,002 MsGet oCultos Var cNumOsM  Size (080),(008) Font oFont15B Color CLR_BLUE F3 "STJ" Valid StjOs()  Pixel OF oPanel09
		@ 017,150 MsGet oRecur  Var cRecur	 Size (080),(008) Font oFont15B Color CLR_BLUE F3 "ST9" Valid St9Bem() Pixel OF oPanel09
		@ 017,274 MsGet oMatric Var cMatric	 Size (080),(008) Font oFont15B Color CLR_BLUE Valid VerRa()		   Pixel OF oPanel09
		//@ 017,400 MsGet	oData   Var cData    Size (080),(008) Font oFont15B Color CLR_BLUE Valid VerDt()		   Pixel OF oPanel09
		@ 030,050 Say oDescbem 	Var cDescbem Size (170),(008) Font oFont15B Color CLR_BLUE 						   Pixel OF oPanel09
		
	Else

		dbSelectArea("ST9")
		ST9->(dBsetOrder(1))
		ST9->(dBseek(xFilial("ST9")+ZM3->ZM3_BEM))

		cNumOsM		:= ZM3->ZM3_SEQDOC   //Seq OS
		cRecur   	:= ZM3->ZM3_BEM 	//Maquina
		cMatric  	:= ZM3->ZM3_MATRIC	//Matricula
		//cData       := ZM3->ZM3_DATA   	//Data
		cDescbem    := ST9->T9_NOME     //Descri็ao bem
		
	aCols := Cols1(cRecur)
	
	@ 017,002 Say oCultos 	Var cNumOsM Size (080),(008) Font oFont15B Color CLR_BLUE Pixel OF oPanel09
	@ 017,150 Say oRecur  	Var cRecur  Size (080),(008) Font oFont15B Color CLR_BLUE Pixel OF oPanel09
	@ 017,274 MsGet oMatric Var cMatric Size (080),(008) Font oFont15B Color CLR_BLUE Pixel OF oPanel09
	//@ 017,400 MsGet oData   Var cData	Size (080),(008) Font oFont15B Color CLR_BLUE Pixel OF oPanel09
	@ 030,050 Say oDescbem 	Var cDescbem Size (170),(008) Font oFont15B Color CLR_BLUE Pixel OF oPanel09
	@ 045,002 Bitmap oBitmap1 size (150),(0130) NOBORDER FILENAME "\system\mnt\"+ALLTRIM(cRecur)+".jpg" PIXEL OF oPanel09
	
Endif

oNew1 := MsNewGetDados():New( 1 , 10 ,200 ,200 , nSty1 ,  ,  ,  , aAltera , 0 , 99 ,  ,  ,  , oPanel02 , aHeader , aCols , , )
oNew1:oBrowse:Align := CONTROL_ALIGN_ALLCLIENT
oNew1:oBrowse:bAdd  := {|| .F. }

oNew1:Refresh()

ACTIVATE MSDIALOG oDlgX CENTERED ON INIT (EnchoiceBar(oDlgX,{|| MsgRun( "Incluindo/Alterando Registro: " +  ZM3->ZM3_BEM,"- A G U A R D E -",{||  GravZM3()  }) },{|| oDlgX:End() },,))

Return()

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณVerRa     บAutor  ณVitor Badam         บ Data ณ 06/02/20    บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ - Verifica se RE digitado esta correto                     บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Inylbra                                                    บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function VerRa()

	Local _lRet := .T.

	dbSelectArea("SRA")
	SRA->(dbSetOrder(1))
	If SRA->(dbSeek(xFilial("SRA")+cMatric))
		If SRA->RA_SITFOLH $ "D"
			MsgStop("RE invalido")
			_lRet := .F.
		EndIf
	Else
		MsgStop("RE invalido")
		_lRet := .F.
	EndIf

Return _lRet

/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออหอออออออัออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ _Header บ Autor ณ Vitor Badam  บ Data ณ  06/02/20   บฑฑ
ฑฑฬออออออออออุอออออออออสอออออออฯออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Cria cabe็alho das MsNewGetDados,conforme parametro บฑฑ
ฑฑศออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function _Header()

	Local ii        := 0
	Local aRetorno	:= {}


	aCampos := {"ZM3_OCORRE","ZM3_SEVERI","ZM3_MOTVAL","ZM3_REVIS","ZM3_CODCHK","ZM3_DCHECK","ZM3_STATUS","ZM3_SUGET"}

	For ii := 1 To Len(aCampos)
		SX3->(dbSetOrder(2))
		If SX3->(dbSeek( aCampos[ii] ))
			
			If Alltrim(SX3->X3_CAMPO)  ==  "ZM3_OCORRE"
				xDesc := "OC"
				_cTam := SX3->X3_TAMANHO
			ElseIf Alltrim(SX3->X3_CAMPO)  ==  "ZM3_SEVERI"
				xDesc := "SV"
				_cTam := SX3->X3_TAMANHO
			ElseIf Alltrim(SX3->X3_CAMPO)  ==  "ZM3_MOTVAL"
				xDesc := "MA"
				_cTam := SX3->X3_TAMANHO
			ElseIf Alltrim(SX3->X3_CAMPO)  ==  "ZM3_REVIS"
				xDesc := "Rev"
				_cTam := SX3->X3_TAMANHO
			ElseIf Alltrim(SX3->X3_CAMPO)  ==  "ZM3_CODCHK"
				xDesc := "Cod.CL"
				_cTam := SX3->X3_TAMANHO
			ElseIf Alltrim(SX3->X3_CAMPO)  ==  "ZM3_DCHECK"
				xDesc := "Desc.Check List"
				_cTam := 140
			ElseIf Alltrim(SX3->X3_CAMPO)  ==  "ZM3_STATUS"
				xDesc := "Status"
				_cTam := SX3->X3_TAMANHO
			ElseIf Alltrim(SX3->X3_CAMPO)  ==  "ZM3_SUGET"
				xDesc := "Observa็ใo"
				_cTam := SX3->X3_TAMANHO
			Else
				xDesc := SX3->X3_TITULO
				_cTam := SX3->X3_TAMANHO
			Endif

			AAdd(aRetorno,{xDesc,;
				SX3->X3_CAMPO	,;
				SX3->X3_PICTURE	,;
				_cTam			,;
				SX3->X3_DECIMAL	,;
				SX3->X3_VALID	,;
				SX3->X3_USADO	,;
				SX3->X3_TIPO	,;
				SX3->X3_F3		,;
				SX3->X3_CONTEXT	})

		EndIf
	Next ii

Return aRetorno
/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออหอออออออัออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ Cols1 บAutor  ณ Bruno E. Souzaบ Data ณ  06/02/20  บฑฑ
ฑฑฬออออออออออุอออออออสอออออออฯออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Carrega dados da GetDados de A็๕es                บฑฑ
ฑฑศออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function Cols1(cRecur,cOpcaoTp)

	Local i          := 0
	Local aCOLS      := {}
	Local nCols      := 0

	If nOpcTel == 3

		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณBusca os Recursos conforme Programacao Informada.ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

		cQuery := " SELECT T9_CODBEM,T9_NOME,T9_CODFAMI,T9_RECFERR  FROM " + RetSqlName("ST9") + " WITH(NOLOCK) "
		cQuery += " WHERE ST9010.D_E_L_E_T_ <> '*' "
		cQuery += "AND T9_CODBEM = '"+ ALLTRIM(cRecur) + "' "
		cQuery += " AND T9_FILIAL = '"+ xFilial("ST9") + "' "

		If Select("QUEZET9") > 0
			QUEZET9->(dbCloseArea())
		EndIf

		dbUseArea( .t.,'TOPCONN', TcGenQry( ,, cQuery ), 'QUEZET9',.F., .T. )

		QUEZET9->(DbGotop())

		If  QUEZET9->(!EOF())

			cQuery := " SELECT ZM2_CODIGO,ZM2_DESCR,ZM2_OCORRE,ZM2_SEVERI,ZM2_MOTVAL,ZM2_REVIS FROM " + RetSqlName("ZM2") + " ZM2 WITH(NOLOCK) " + CRLF
			cQuery += " WHERE 											 "   + CRLF
			cQuery += " ZM2_TIPMNT  = '" + cOpcaoTp + "' " 		 	   		 + CRLF
			cQuery += " AND D_E_L_E_T_ <> '*'  "						     + CRLF
			cQuery += " AND(ZM2_FMROBO   = '" + QUEZET9->T9_CODFAMI + "' " 	 + CRLF
			cQuery += " OR ZM2_FMPREF    = '" + QUEZET9->T9_CODFAMI + "' " 	 + CRLF
			cQuery += " OR  ZM2_FMDG     = '" + QUEZET9->T9_CODFAMI + "' " 	 + CRLF
			cQuery += " OR  ZM2_FMBG     = '" + QUEZET9->T9_CODFAMI + "' " 	 + CRLF
			cQuery += " OR  ZM2_FMGMC    = '" + QUEZET9->T9_CODFAMI + "' " 	 + CRLF
			cQuery += " OR  ZM2_FMMCOS   = '" + QUEZET9->T9_CODFAMI + "' " 	 + CRLF
			cQuery += " OR  ZM2_FMMQMO   = '" + QUEZET9->T9_CODFAMI + "' " 	 + CRLF
			cQuery += " OR  ZM2_FMPACP   = '" + QUEZET9->T9_CODFAMI + "' " 	 + CRLF
			cQuery += " OR  ZM2_FMPMOL   = '" + QUEZET9->T9_CODFAMI + "' " 	 + CRLF
			cQuery += " OR  ZM2_FMPTMO   = '" + QUEZET9->T9_CODFAMI + "' " 	 + CRLF
			cQuery += " OR  ZM2_FMFM     = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF
			cQuery += " OR  ZM2_FMCABC   = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF
			cQuery += " OR  ZM2_FMAPLC   = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF
			cQuery += " OR  ZM2_FMSELA   = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF
			cQuery += " OR  ZM2_FMMQCV   = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF
			cQuery += " OR  ZM2_CARD   	 = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF
			cQuery += " OR  ZM2_FMAGUL   = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF
			cQuery += " OR  ZM2_FMDESF   = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF
			cQuery += " OR  ZM2_FMCORT   = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF
			cQuery += " OR  ZM2_FMABRF   = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF
			cQuery += " OR  ZM2_FMESTU   = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF
			cQuery += " OR  ZM2_FMEXTR   = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF
			cQuery += " OR  ZM2_FMDUBL   = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF
			cQuery += " OR  ZM2_FMLARD   = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF
			cQuery += " OR  ZM2_FMRULI   = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF
			cQuery += " OR  ZM2_FMBR     = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF
			cQuery += " OR  ZM2_FMINJE   = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF
			cQuery += " OR  ZM2_PFAR     = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF
			cQuery += " OR  ZM2_INTE     = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF
			cQuery += " OR  ZM2_GERA     = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF
			cQuery += " OR  ZM2_VAPR     = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF
			cQuery += " OR  ZM2_CALD     = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF
			cQuery += " OR  ZM2_TRES     = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF
			cQuery += " OR  ZM2_TREF     = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF
			cQuery += " OR  ZM2_BOMB     = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF
			cQuery += " OR  ZM2_TERM     = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF
			cQuery += " OR  ZM2_COMP     = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF
			cQuery += " OR  ZM2_QUEI     = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF
			cQuery += " OR  ZM2_ARCO     = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF
			cQuery += " OR  ZM2_REFR     = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF
			cQuery += " OR  ZM2_FMCARL   = '" + QUEZET9->T9_CODFAMI + "' )" + CRLF
			cQuery += " AND ZM2_FILIAL  = '" + xFilial("ZM2") + "' " 	    + CRLF
			cQuery += " AND ZM2_TIPMNT  = '" + cOpcaoTp + "' "			    + CRLF
			cQuery += " ORDER BY ZM2_CODIGO      "					 	    + CRLF

			If Select("QUESZM2" ) > 0
				QUESZM2->(dbCloseArea())
			EndIf

			TcQuery cQuery New Alias "QUESZM2"

			dbSelectArea("QUESZM2")

			QUESZM2->(dbGoTop())

			While QUESZM2->(!Eof())

			//-----------------------------------------------------------------------//
			//Criar o vetor com sua devida dimensao em relacao ao dicionario de dados//
			//-----------------------------------------------------------------------//
			aAdd(aCOLS,Array(Len(aHeader)+1))
			nCOLS++

			//-----------------------------------------//
			//Atribuir o dado para cada coluna do vetor//
			//-----------------------------------------//
				For i:=1 to Len(aHeader)
					If Alltrim(aHeader[i,2]) == "ZM3_OCORRE"
					aCOLS[nCOLS,1]:=  QUESZM2->ZM2_OCORRE
					ElseIf Alltrim(aHeader[i,2]) == "ZM3_SEVERI"
					aCOLS[nCOLS,2]:=  QUESZM2->ZM2_SEVERI
					ElseIf Alltrim(aHeader[i,2]) == "ZM3_MOTVAL"
					aCOLS[nCOLS,3]:=  QUESZM2->ZM2_MOTVAL
					ElseIf Alltrim(aHeader[i,2]) == "ZM3_REVIS"
					aCOLS[nCOLS,4]:=  QUESZM2->ZM2_REVIS
					ElseIf Alltrim(aHeader[i,2]) == "ZM3_CODCHK"
					aCOLS[nCOLS,5]:=  QUESZM2->ZM2_CODIGO
					ElseIf  Alltrim(aHeader[i,2]) == "ZM3_DCHECK"
					aCOLS[nCOLS,6]:= alltrim(QUESZM2->ZM2_DESCR)
					ElseIf  Alltrim(aHeader[i,2]) == "ZM3_STATUS"
					aCOLS[nCOLS,7]:= "O"
					ElseIf  Alltrim(aHeader[i,2]) == "ZM3_SUGET"
					aCOLS[nCOLS,8]:= cSugest
					Else
					aCOLS[nCOLS,i]:=FieldGet(FieldPos(aHeader[i,2]))
					EndIf
				Next i
			
			//-----------------------------------------------------------------------//
			//Criar uma ultima coluna para o controle da Getdados, se deletado ou nao//
			//-----------------------------------------------------------------------//
			aCOLS[nCOLS,Len(aHeader)+1]:=.F.
			//---------------------------------------------------------------------//
			//Atribuir o numero do registro neste vetor para o controle na gravacao//
			//---------------------------------------------------------------------//
			aAdd(aAlt,RecNo())
			dbSelectArea("QUESZM2")
			QUESZM2->(dbSkip())
			Enddo
		Else
		Alert('<b>Aten็ใo:</b><br>Codigo do Bem nao existe no cadastro de bens.<br><br><font color="#FF0000">Nใo Permitido.</font>')
		Endif
	
	Else
	
	cQuery := " SELECT ZM3_CODCHK,ZM3_DCHECK,ZM3_SUGET AS 'SUGEST',ZM3_OCORRE,ZM3_SEVERI,ZM3_MOTVAL,ZM3_REVIS,ZM3_STATUS FROM " + RetSqlName("ZM3") + " ZM3 WITH(NOLOCK) " + CRLF
	cQuery += " WHERE D_E_L_E_T_ <> '*'  "							 + CRLF
	cQuery += " AND ZM3_FILIAL  = '" + xFilial("ZM3") + "' " 		 + CRLF
	cQuery += " AND ZM3_SEQDOC  = '" + ZM3->ZM3_SEQDOC + "' " 		 + CRLF
	cQuery += " ORDER BY ZM3_CODCHK		" + CRLF
	
		If Select("QUESZM3" ) > 0
		QUESZM3->(dbCloseArea())
		EndIf
	
	TcQuery cQuery New Alias "QUESZM3"
	
	dbSelectArea("QUESZM3")
	
	QUESZM3->(dbGoTop())
	
		While QUESZM3->(!Eof())
		
		//-----------------------------------------------------------------------//
		//Criar o vetor com sua devida dimensao em relacao ao dicionario de dados//
		//-----------------------------------------------------------------------//
		aAdd(aCOLS,Array(Len(aHeader)+1))
		nCOLS++
		//-----------------------------------------//
		//Atribuir o dado para cada coluna do vetor//
		//-----------------------------------------//
		    For i:=1 to Len(aHeader)
				If Alltrim(aHeader[i,2]) == "ZM3_OCORRE"
				aCOLS[nCOLS,1]:=  QUESZM3->ZM3_OCORRE
				ElseIf Alltrim(aHeader[i,2]) == "ZM3_SEVERI"
				aCOLS[nCOLS,2]:=  QUESZM3->ZM3_SEVERI
				ElseIf Alltrim(aHeader[i,2]) == "ZM3_MOTVAL"
				aCOLS[nCOLS,3]:=  QUESZM3->ZM3_MOTVAL
				ElseIf Alltrim(aHeader[i,2]) == "ZM3_REVIS"
				aCOLS[nCOLS,4]:=  QUESZM3->ZM3_REVIS
				ElseIf Alltrim(aHeader[i,2]) == "ZM3_CODCHK"
				aCOLS[nCOLS,5]:=  QUESZM3->ZM3_CODCHK
				ElseIf  Alltrim(aHeader[i,2]) == "ZM3_DCHECK"
				aCOLS[nCOLS,6]:= ALLTRIM(QUESZM3->ZM3_DCHECK)
				ElseIf  Alltrim(aHeader[i,2]) == "ZM3_STATUS"
				aCOLS[nCOLS,7]:= QUESZM3->ZM3_STATUS
				ElseIf  Alltrim(aHeader[i,2]) == "ZM3_SUGET"
				aCOLS[nCOLS,8]:= ALLTRIM(QUESZM3->SUGEST)
				Else
				aCOLS[nCOLS,i]:=FieldGet(FieldPos(aHeader[i,2]))
				EndIf
			Next i
		
		//-----------------------------------------------------------------------//
		//Criar uma ultima coluna para o controle da Getdados, se deletado ou nao//
		//-----------------------------------------------------------------------//
		aCOLS[nCOLS,Len(aHeader)+1]:=.F.
		//---------------------------------------------------------------------//
		//Atribuir o numero do registro neste vetor para o controle na gravacao//
		//---------------------------------------------------------------------//
		aAdd(aAlt,RecNo())
		dbSelectArea("QUESZM3")
		QUESZM3->(dbSkip())
		Enddo
	Endif

Return aCOLS
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณGravZM3   บAutor  ณBruno E. de Souza   บ Data ณ  06/02/20   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณGrava dados na Tabela ZM3         						  บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function GravZM3()

Local ii        := 0
Local jj        := 0
Local cDocZM3   := ""

	If nOpcTel == 3
		cMensagem := "Deseja [INCLUIR] esse registro ?"
	ElseIf nOpcTel == 4
		cMensagem := "Deseja [ALTERAR] esse registro ?"
	ElseIf nOpcTel == 5
		cMensagem := "Deseja [EXCLUIR] esse registro ?"
	EndIf

	If nOpcTel == 2
		oDlgX:End()
		Return()
	Endif

	If Len(oNew1:ACOLS) == 0
		Alert('<b>Aten็ใo:</b><br>E obrigatorio ter Informa็oes dos Itens !!<br><br><font color="#FF0000">Chech List Inconsistente.</font>')
		Return .F.
	Endif

	If MsgYesNo( cMensagem )

		If  nOpcTel <> 5

			cDocZM3 := ZM3->ZM3_SEQDOC //Guarda Documento

			If  nOpcTel == 4

				_cDocZM3 := ZM3->ZM3_SEQDOC
				//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
				//ณExcluir Registro ณ
				//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
				dbSelectArea("ZM3")
				ZM3->(dBsetOrder(1))
				If ZM3->(dBseek(xFilial("ZM3") + _cDocZM3))
					While !ZM3->(EOF()) .And. ZM3->ZM3_FILIAL + ZM3->ZM3_SEQDOC == xFilial("ZM3") + _cDocZM3
						If Reclock( "ZM3" , .F. )

							ZM3->(DbDelete())

							ZM3->(MsUnlock())
						Endif
						ZM3->(dbSkip())
					Enddo
				Endif

			Endif

			If nOpcTel == 3
				cDocuSq  := cNumOsM
			Else
				cDocuSq  := cDocZM3
			Endif

			For jj := 1 To Len(oNew1:ACOLS)
				If oNew1:ACOLS[jj][Len(oNew1:aHeader)+1] == .F.
					If !Empty(oNew1:ACOLS[jj][5]) //posi็ao 5 porque posi็ao 1 tras como falso
						If Reclock( "ZM3" , .T. )
							For ii := 1 To Len(oNew1:aHeader)
								cCpo := "ZM3->" + oNew1:aHeader[ii][2]
								&(cCpo) := oNew1:ACOLS[jj][ii]
							Next ii

							ZM3->ZM3_FILIAL 	:= xFilial("ZM3")
							ZM3->ZM3_MATRIC 	:= cMatric	//Matricula
							//ZM3->ZM3_DATA	 	:= cData	//Data
							ZM3->ZM3_HORA       := Substr(Time(),1,5) //Hora
							ZM3->ZM3_SUGET	 	:= M->ZM3_SUGET 	//Sugestao
							ZM3->ZM3_SEQDOC 	:= cDocuSq 	//Documento de Controle Sequencial
							ZM3->ZM3_BEM		:= cRecur  	//Maquina Selecionada
							ZM3->ZM3_TIPMNT     := cOpcaoTp
							ZM3_OCORRE			:= M->ZM3_OCORRE
							ZM3_SEVERI			:= M->ZM3_SEVERI
							ZM3_MOTVAL			:= M->ZM3_MOTVAL
							ZM3_REVIS			:= M->ZM3_REVIS
							ZM3_STATUS			:= M->ZM3_STATUS

							ZM3->(MsUnlock())
						EndIf
					EndIf
				EndIf
			Next jj
	
			oDlgX:End()

		ElseIf  nOpcTel == 5

			_cDocZM3 := ZM3->ZM3_SEQDOC
			//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
			//ณExcluir Registro ณ
			//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
			dbSelectArea("ZM3")
			ZM3->(dBsetOrder(1))
			If ZM3->(dBseek(xFilial("ZM3") + _cDocZM3))
				While !ZM3->(EOF()) .And. ZM3->ZM3_FILIAL + ZM3->ZM3_SEQDOC == xFilial("ZM3") + _cDocZM3
					If Reclock( "ZM3" , .F. )

						ZM3->(DbDelete())

						ZM3->(MsUnlock())
					Endif
					ZM3->(dbSkip())
				Enddo
			Endif
			oDlgX:End()
		Endif

	Endif

Return()
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณSt9Bem    บAutor  ณBruno E. de Souza   บ Data ณ 06/02/20    บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ - Verifica bEM						                      บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Inylbra                                                    บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function St9Bem()

	Local _lRet := .T.

	oNew1:aCols := Cols1(cRecur,cOpcaoTp)
	oNew1:Refresh()
	
Return _lRet

  /*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณStjOs     บAutor  ณBruno E. de Souza   บ Data ณ 06/02/20    บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ - Verifica OS						                      บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Inylbra                                                    บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function StjOs()

	Local _lRet := .T.

	dbSelectArea("STJ")
	STJ->(dbSetOrder(1))
	If STJ->(dbSeek(xFilial("STJ")+cNumOsM))
		cRecur:= STJ->TJ_CODBEM
	    //aparece imagem no momento da inclusao
		@ 045,002 Bitmap oBitmap1 size (150),(130) NOBORDER FILENAME "\system\mnt\"+ALLTRIM(cRecur)+".jpg" PIXEL OF oPanel09

		dbSelectArea("ST9")
		ST9->(dBsetOrder(1))
		ST9->(dBseek(xFilial("ST9")+STJ->TJ_CODBEM))
		cDescbem := ST9->T9_NOME //Descri็ao bem
	Else
		Msgalert('OS nao existe')
		_lRet := .F.
	EndIf

	oNew1:aCols := Cols1(cRecur,cOpcaoTp)
	oNew1:Refresh()
	
Return _lRet

  /*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณVerDt     บAutor  ณBruno E. de Souza   บ Data ณ 06/02/20    บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ - Verifica Data						                      บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Inylbra                                                    บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
/*Static Function VerDt() //Nao ้ mais utilizado 02/12/2020

Local _lRet := .T.

If cData > DdataBase
   Msgalert('Nใo ้ permitido data maior que a data atual')
		_lRet := .F.
EndIf

Return _lRet*/




