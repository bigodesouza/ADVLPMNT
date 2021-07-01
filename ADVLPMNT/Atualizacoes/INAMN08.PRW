#INCLUDE "Protheus.Ch"
#INCLUDE "RwMake.Ch"
#INCLUDE "TopConn.Ch"
#INCLUDE "FiveWin.Ch"
#INCLUDE "TBICONN.CH"
#INCLUDE "TBICODE.CH"
#INCLUDE "AP5MAIL.CH"
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออหอออออออัออออออออออออออหออออออัอออออออออออปฑฑ
ฑฑบPrograma  ณ INAMN08 บ Autor ณ Vitor Badam  บ Data ณ  03/02/20 บฑฑ
ฑฑฬออออออออออุอออออออออสอออออออฯออออออออออออออสออออออฯอออออออออออนฑฑ
ฑฑบDescricao ณ Tela de Check List de Manutencao Autonoma         บฑฑ
ฑฑศออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/
User Function INAMN08()

Private cCadastro := "CHECK LIST DE MANUTENวรO AUTิNOMA"
Private aRotina   := {}
Private cString   := "ZM1"
Private oDlgY     := Nil   

Aadd( aRotina , {	"Pesquisar "	,	"Axpesqui"			,0,1	})
Aadd( aRotina , {	"Visualizar"	,	"u_CADMNTCHK(2)"    ,0,2	})
Aadd( aRotina , {	"Incluir"		,	"u_CADMNTCHK(3)"    ,0,3	})
Aadd( aRotina , {	"Alterar"		,	"u_CADMNTCHK(4)"	,0,4	})
Aadd( aRotina , {	"Excluir"		,	"u_CADMNTCHK(5)"	,0,4	})

DbSelectArea(cString)
DbSetOrder(1)
Mbrowse(6,1,22,74,cString,,,,,,)

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณCADMNTCHK บ Autor ณ Vitor Badam  บ Data ณ 06/02/20    บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Tela de Cadastro de Check List                       บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

User Function CADMNTCHK(nOpcao,cProgGrv,cMatrGrv,cTurGrv)

Local aAltera     	:= {}
Local nSty1         := GD_INSERT + GD_UPDATE + GD_DELETE
Private oDlgX       := Nil
Private oNew1       := Nil
Private oNew2       := Nil
Private aSizeAut  	:= MsAdvSize(.F.,420)
Private aAlt     	:= {}
Private aHeader  	:= {}
Private aCols       := {}
Private aHeader2  	:= {}
Private aCols2      := {}
Private  i          := 0
Private oFont15B 	:= TFont():New("Courier New",,15,,.T.,,,,.T.,.F.)//FONTE 15,COURIER NEW, NEGRITO
Private oFont19B 	:= TFont():New("Courier New",,19,,.T.,,,,.T.,.F.)//FONTE 15,COURIER NEW, NEGRITO
Private oProgram    := Nil
Private oCusto      := Nil
Private oData       := Nil
Private cData       := DdataBase
Private cCusto      := Space(9)
Private cTurno      := Space(1)
Private cFieldOk    := ""
Private aItens  	:= {"","1-Turno","2-Turno","3-Turno"}
Private aRecur  	:= {}
Private cRecur  	:= SPACE(06)
Private oTurno      := Nil
Private oRecur      := Nil
Private cTitPnl01   := "Check List de Manuten็ใo Aut๔noma"
Private cSugest     := ""
Private oSugest     := Nil
Private cSugeResp	:= ""
Private oSugeResp   := Nil
Private oMatric     := Nil
Private cMatric     := Space(06)
Private nOpcTel     := nOpcao
Private cProgram    := Space(08)
Private _cTurAux    := 0
Private oProcess    := NIL

If !Empty(cProgGrv)
	cProgram := cProgGrv
	cMatric  := cMatrGrv
	cTurno   := cTurGrv
Endif


//Busca pelo Horario qual Turno Pertence conforme Regra.
_cTurAux 	:= Val(STRZERO(VAL(SUBSTR(Time(),1,2)),2) + '.' + STRZERO(VAL(SUBSTR(Time(),4,2)),2))

If (_cTurAux >= 00.00 .And. _cTurAux <= 5.55) //Terceiro Turno
	cData := Date()-1
Endif

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

Define MsDialog oDlgX TITLE "Check List de Manuten็ใo Aut๔noma" STYLE DS_MODALFRAME From aSizeAut[7],0 To aSizeAut[6],aSizeAut[5] OF oMainWnd PIXEL
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
	aAltera :=  {"ZM1_DOCPRG","ZM1_TURNO","ZM1_MATRIC","ZM1_TPMAQU","ZM1_SUGEST","ZM1_STATUS","NOUSER"}
Else
	aAltera :=  {"ZM1_SUGEST","ZM1_STATUS","ZM1_RESSG","NOUSER"}
Endif

@ 005,002 Say "Digite a Programa็ใo" 		Size (250),(008) FONT oFont15B COLOR CLR_RED PIXEL OF oPanel09
@ 005,150 Say "Data ?"   		  			Size (200),(008) FONT oFont15B COLOR CLR_RED PIXEL OF oPanel09
@ 005,274 Say "Recurso?" 		  			Size (200),(008) FONT oFont15B COLOR CLR_RED PIXEL OF oPanel09
@ 005,400 Say "Digite o RE?" 				Size (200),(008) FONT oFont15B COLOR CLR_RED PIXEL OF oPanel09
@ 005,520 Say "Selecione o Turno?" 			Size (250),(008) FONT oFont15B COLOR CLR_RED PIXEL OF oPanel09
@ 030,002 Say "Sugestao?"  					Size (250),(008) FONT oFont15B COLOR CLR_RED PIXEL OF oPanel09
If !FUNNAME() $ "INAPP47/INAPP22"
	@ 030,274 Say "Resposta Sugestao?"			Size (250),(008) FONT oFont15B COLOR CLR_RED PIXEL OF oPanel09
EndIf

If  nOpcTel == 3
	
	@ 017,002 MsGet oProgram   Var cProgram  		 		Size (100),(008) Font oFont15B Color CLR_BLUE Valid CadProg(cProgram,cTurno)				   		Pixel OF oPanel09
	@ 017,150 MsGet oData      Var cData	             	Size (080),(008) Font oFont15B Color CLR_BLUE When .F.  				   							Pixel OF oPanel09
	@ 017,400 MsGet oMatric    Var cMatric	  		 		Size (080),(008) Font oFont15B Color CLR_BLUE Valid VerRa()											Pixel OF oPanel09
	@ 017,520 ComboBox cTurno  Items aItens	         		Size (080),(008) Font oFont15B Color CLR_BLUE Valid CadProg(cProgram,cTurno)						Pixel OF oPanel09
	@ 042,002 Get oSugest      Var cSugest	   MEMO  		Size (220),(040) Font oFont15B Color CLR_BLUE 														Pixel OF oPanel09
	If !FUNNAME() $ "INAPP47/INAPP22"							 							
		@ 042,274 Get oSugeResp    Var cSugeResp   MEMO  		Size (220),(040) Font oFont15B Color CLR_BLUE 							 						Pixel OF oPanel09
	EndIf

Else
	
	cData       := ZM1->ZM1_DATA   	//Data
	cProgram    := ZM1->ZM1_DOCPRG 	//Programa็ใo
	cRecur   	:= ZM1->ZM1_TPMAQU 	//Maquina
	cMatric  	:= ZM1->ZM1_MATRIC	//Matricula
	cTurno 		:= ZM1->ZM1_TURNO  	//Turno
	cSugest  	:= ZM1->ZM1_SUGEST 	//Sugestao
	cSugeResp   := ZM1->ZM1_RESSG   //Resposta Sugestao
	
	If cTurno == "1"
		cDesTurn := "1-Turno"
	ElseIf cTurno == "2"
		cDesTurn := "2-Turno"
	ElseIf cTurno == "3"
		cDesTurn := "3-Turno"
	Endif
	
	aCols := Cols1(cRecur)
	
	@ 017,002 Say oProgram   Var cProgram  		 		Size (100),(008) Font oFont15B Color CLR_BLUE 			Pixel OF oPanel09
	@ 017,150 Say oData      Var cData	             	Size (080),(008) Font oFont15B Color CLR_BLUE  			Pixel OF oPanel09
	@ 017,274 Say oRecur  	 Var cRecur   			 	Size (080),(008) Font oFont15B Color CLR_BLUE 			Pixel OF oPanel09
	@ 017,400 Say oMatric    Var cMatric	  		 	Size (080),(008) Font oFont15B Color CLR_BLUE 			Pixel OF oPanel09
	@ 017,520 Say oTurno     Var cDesTurn	        	Size (080),(008) Font oFont15B Color CLR_BLUE    		Pixel OF oPanel09
	@ 042,002 Say oSugest    Var cSugest	   		  	Size (220),(040) Font oFont15B Color CLR_BLUE 			Pixel OF oPanel09
	If !FUNNAME() $ "INAPP47/INAPP22"
		@ 042,274 Say oSugeResp  Var cSugeResp	   		  	Size (220),(040) Font oFont15B Color CLR_BLUE 			Pixel OF oPanel09
	EndIf
Endif

oNew1 := MsNewGetDados():New( 1 , 10 ,200 ,200 , nSty1 ,  ,  ,  , aAltera , 0 , 99 ,  ,  ,  , oPanel02 , aHeader , aCols , , )
oNew1:oBrowse:Align := CONTROL_ALIGN_ALLCLIENT
oNew1:oBrowse:bAdd  := {|| .F. }

oNew1:Refresh()

ACTIVATE MSDIALOG oDlgX CENTERED ON INIT (EnchoiceBar(oDlgX,{|| MsgRun( "Incluindo/Alterando Registro: " +  ZM1->ZM1_TPMAQU,"- A G U A R D E -",{||  GravZM1()  }) },{|| oDlgX:End() },,))

Return

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


aCampos := {"ZM1_CODCHK","ZM1_STATUS","ZM1_DCHECK","ZM1_TPMAQU","ZM1_CELULA"}

For ii := 1 To Len(aCampos)
	SX3->(dbSetOrder(2))
	If SX3->(dbSeek( aCampos[ii] ))
		
		If Alltrim(SX3->X3_CAMPO)      ==  "ZM1_CODCHK"
			xDesc := "Cod.Check List"
		ElseIf Alltrim(SX3->X3_CAMPO)  ==  "ZM1_DCHECK"
			xDesc := "Desc.Check List"
		ElseIf Alltrim(SX3->X3_CAMPO)  ==  "ZM1_STATUS"
			xDesc := "Status.Check List"
		ElseIf Alltrim(SX3->X3_CAMPO)  ==  "ZM1_TPMAQU"
			xDesc := "Recurso"
		ElseIf Alltrim(SX3->X3_CAMPO)  ==  "ZM1_CELULA"
			xDesc := "Celula"
		Else
			xDesc := SX3->X3_TITULO
		Endif
		
		AAdd(aRetorno,	{	xDesc			,;
		SX3->X3_CAMPO	,;
		SX3->X3_PICTURE	,;
		SX3->X3_TAMANHO	,;
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
ฑฑบPrograma  ณ Cols1 บAutor  ณ Vitor Badam  บ Data ณ  06/02/20   บฑฑ
ฑฑฬออออออออออุอออออออสอออออออฯออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Carrega dados da GetDados de A็๕es                บฑฑ
ฑฑศออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function Cols1(cRecur)

Local i          := 0
Local aCOLS      := {}
Local nCols      := 0
Local cCelula    := ""

If nOpcTel == 3
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณBusca os Recursos conforme Programacao Informada.ณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	
	cQuery := " SELECT T9_CODBEM,T9_NOME,T9_CODFAMI,T9_RECFERR  FROM " + RetSqlName("ST9") + " WITH(NOLOCK) "
	cQuery += " WHERE ST9010.D_E_L_E_T_ <> '*' "
	cQuery += " AND T9_RECFERR = '"+ cRecur + "' "
	cQuery += " AND T9_FILIAL = '"+ xFilial("ST9") + "' "
	
	If Select("QUEZET9") > 0
		QUEZET9->(dbCloseArea())
	EndIf
	
	dbUseArea( .t.,'TOPCONN', TcGenQry( ,, cQuery ), 'QUEZET9',.F., .T. )
	
	QUEZET9->(DbGotop())
	
	If  QUEZET9->(!EOF())
		
		cQuery := " SELECT ZM0_CODIGO,ZM0_DESCRI FROM " + RetSqlName("ZM0") + " ZM0 WITH(NOLOCK) " + CRLF
		cQuery += " WHERE D_E_L_E_T_ <> '*'  "							 + CRLF
		cQuery += " AND ZM0_FILIAL  = '" + xFilial("ZM0") + "' " 		 + CRLF
		cQuery += " AND ZM0_FMROBO   = '" + QUEZET9->T9_CODFAMI + "' " 	 + CRLF
		cQuery += " OR( ZM0_FMPREF   = '" + QUEZET9->T9_CODFAMI + "' " 	 + CRLF
		cQuery += " OR  ZM0_FMDG     = '" + QUEZET9->T9_CODFAMI + "' " 	 + CRLF
		cQuery += " OR  ZM0_FMBG     = '" + QUEZET9->T9_CODFAMI + "' " 	 + CRLF
		cQuery += " OR  ZM0_FMGMC    = '" + QUEZET9->T9_CODFAMI + "' " 	 + CRLF
		cQuery += " OR  ZM0_FMMCOS   = '" + QUEZET9->T9_CODFAMI + "' " 	 + CRLF
		cQuery += " OR  ZM0_FMMQMO   = '" + QUEZET9->T9_CODFAMI + "' " 	 + CRLF
		cQuery += " OR  ZM0_FMPACP   = '" + QUEZET9->T9_CODFAMI + "' " 	 + CRLF
		cQuery += " OR  ZM0_FMPMOL   = '" + QUEZET9->T9_CODFAMI + "' " 	 + CRLF
		cQuery += " OR  ZM0_FMPTMO   = '" + QUEZET9->T9_CODFAMI + "' " 	 + CRLF
		cQuery += " OR  ZM0_FMFM     = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF
		cQuery += " OR  ZM0_FMCABC   = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF
		cQuery += " OR  ZM0_FMAPLC   = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF
		cQuery += " OR  ZM0_FMSELA   = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF
		cQuery += " OR  ZM0_FMMQCV   = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF
		cQuery += " OR  ZM0_FMCARD   = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF
		cQuery += " OR  ZM0_FMAGUL   = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF
		cQuery += " OR  ZM0_FMDESF   = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF
		cQuery += " OR  ZM0_FMCORT   = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF
		cQuery += " OR  ZM0_FMABRF   = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF   
		cQuery += " OR  ZM0_FMESTU   = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF  
		cQuery += " OR  ZM0_FMEXTR   = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF  
		cQuery += " OR  ZM0_FMDUBL   = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF   
		cQuery += " OR  ZM0_FMLARD   = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF 
		cQuery += " OR  ZM0_FMRULI   = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF 
		cQuery += " OR  ZM0_TERM     = '" + QUEZET9->T9_CODFAMI + "' "  + CRLF
		cQuery += " OR  ZM0_FMCARL   = '" + QUEZET9->T9_CODFAMI + "' )" + CRLF
		cQuery += " ORDER BY ZM0_CODIGO      "					 	     + CRLF
		
		If Select("QUESZM0" ) > 0
			QUESZM0->(dbCloseArea())
		EndIf
		
		TcQuery cQuery New Alias "QUESZM0"
		
		dbSelectArea("QUESZM0")
		
		QUESZM0->(dbGoTop())
		
		While QUESZM0->(!Eof())
			
			dbSelectArea("SH1")
			SH1->(dbSetOrder(1))
			If SH1->(dbSeek(xFilial("SH1")+cRecur))
				
				dbSelectArea("SHB")
				SHB->(dbSetOrder(1))
				If SHB->(dbSeek(xFilial("SHB")+SH1->H1_CTRAB))
					cCelula := SHB->HB_COD //Cod. da CelULA
				Endif
				
			Endif
			
			//-----------------------------------------------------------------------//
			//Criar o vetor com sua devida dimensao em relacao ao dicionario de dados//
			//-----------------------------------------------------------------------//
			aAdd(aCOLS,Array(Len(aHeader)+1))
			nCOLS++
			//-----------------------------------------//
			//Atribuir o dado para cada coluna do vetor//
			//-----------------------------------------//
			For i:=1 to Len(aHeader)
				If Alltrim(aHeader[i,2]) == "ZM1_CODCHK"
					aCOLS[nCOLS,1]:=  QUESZM0->ZM0_CODIGO
				ElseIf  Alltrim(aHeader[i,2]) == "ZM1_DCHECK"
					aCOLS[nCOLS,3]:= QUESZM0->ZM0_DESCRI
				ElseIf  Alltrim(aHeader[i,2]) == "ZM1_STATUS"
					aCOLS[nCOLS,2]:= "S"
				ElseIf  Alltrim(aHeader[i,2]) == "ZM1_TPMAQU"
					aCOLS[nCOLS,4]:= cRecur
				ElseIf  Alltrim(aHeader[i,2]) == "ZM1_CELULA"
					aCOLS[nCOLS,5] := cCelula
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
			dbSelectArea("QUESZM0")
			QUESZM0->(dbSkip())
		Enddo
	Else
		Alert('<b>Aten็ใo:</b><br>Codigo do Bem nao esta amarrado ao cadastro de ferramenta, campo T9_RECFERR !!<br><br><font color="#FF0000">Nใo Permitido.</font>')
	Endif
	
Else
	
	cQuery := " SELECT ZM1_CODCHK,ZM1_DCHECK,ZM1_STATUS,ZM1_TPMAQU,ZM1_CELULA FROM " + RetSqlName("ZM1") + " ZM1 WITH(NOLOCK) " + CRLF
	cQuery += " WHERE D_E_L_E_T_ <> '*'  "							 + CRLF
	cQuery += " AND ZM1_FILIAL  = '" + xFilial("ZM1") + "' " 		 + CRLF
	cQuery += " AND ZM1_SEQDOC  = '" + ZM1->ZM1_SEQDOC + "' " 		 + CRLF
	cQuery += " ORDER BY ZM1_CODCHK		" + CRLF
	
	If Select("QUESZM1" ) > 0
		QUESZM1->(dbCloseArea())
	EndIf
	
	TcQuery cQuery New Alias "QUESZM1"
	
	dbSelectArea("QUESZM1")
	
	QUESZM1->(dbGoTop())
	
	While QUESZM1->(!Eof())
		
		//-----------------------------------------------------------------------//
		//Criar o vetor com sua devida dimensao em relacao ao dicionario de dados//
		//-----------------------------------------------------------------------//
		aAdd(aCOLS,Array(Len(aHeader)+1))
		nCOLS++
		//-----------------------------------------//
		//Atribuir o dado para cada coluna do vetor//
		//-----------------------------------------//
		For i:=1 to Len(aHeader)
			If Alltrim(aHeader[i,2]) == "ZM1_CODCHK"
				aCOLS[nCOLS,1]:=  QUESZM1->ZM1_CODCHK
			ElseIf  Alltrim(aHeader[i,2]) == "ZM1_DCHECK"
				aCOLS[nCOLS,3]:= QUESZM1->ZM1_DCHECK
			ElseIf  Alltrim(aHeader[i,2]) == "ZM1_STATUS"
				aCOLS[nCOLS,2]:= QUESZM1->ZM1_STATUS
			ElseIf  Alltrim(aHeader[i,2]) == "ZM1_TPMAQU"
				aCOLS[nCOLS,4]:= QUESZM1->ZM1_TPMAQU
			ElseIf  Alltrim(aHeader[i,2]) == "ZM1_CELULA"
				aCOLS[nCOLS,5] := QUESZM1->ZM1_CELULA
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
		dbSelectArea("QUESZM1")
		QUESZM1->(dbSkip())
	Enddo
Endif


Return aCOLS


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณCadProg   บAutor  ณVitor Badam         บ Data ณ  06/02/20   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณRetorna os Dados dos dados no Array e Valida Check List     บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function CadProg(cProgram,cTurno)

Local Iret := .T.

aRecur 		:= {}
oNew1:aCols := {}

dbSelectArea("ZPP")
ZPP->(dBsetOrder(4))
If !ZPP->(dBseek(xFilial("ZPP") + cProgram ))


	Alert('<b>Aten็ใo:</b><br>Programa็ใo nใo Existe!!<br><br><font color="#FF0000">Programa็ใo.</font>')
	Return .F. 
Else 
	If ZPP->ZPP_STATUS == "E"
		Alert('<b>Aten็ใo:</b><br>Programa็ใo Encerrada!!<br><br><font color="#FF0000">Programa็ใo.</font>')
		Return .F.  
	Endif
Endif

If !Empty(cProgram) .And. !Empty(cTurno)
	
	cQuery := " SELECT SUBSTRING(ZPP_MAQUIN,1,6) AS MAQUINA , ISNULL(ZM1_TPMAQU,'') AS CKQMAQUI  FROM " + RetSqlName("ZPP") + " ZPP WITH(NOLOCK) " + CRLF
	cQuery += " LEFT JOIN " + RetSqlName("ZM1") + " ZM1 WITH(NOLOCK) " + CRLF
	cQuery += " ON ZPP_FILIAL = ZM1_FILIAL AND SUBSTRING(ZPP_MAQUIN,1,6) = ZM1_TPMAQU AND ZM1.D_E_L_E_T_ <> '*' AND ZM1_DATA = '" + dtos(cData)+ "'  AND ZM1_TURNO = '"+Substr(cTurno,1,1)+"' "
	cQuery += " WHERE ZPP.D_E_L_E_T_ <> '*' "
	cQuery += " AND ZPP_DOC_IN = '"+cProgram+"' "
	cQuery += " GROUP BY ZPP_MAQUIN,ZM1_TPMAQU  "
	cQuery += " ORDER BY ZPP_MAQUIN "
	
	If Select("QUESREC" ) > 0
		QUESREC->(dbCloseArea())
	EndIf
	
	TcQuery cQuery New Alias "QUESREC"
	
	dbSelectArea("QUESREC")
	
	QUESREC->(dbGoTop())
	
	Ncont := 0
	
	While QUESREC->(!Eof())
		
		If Empty(QUESREC->CKQMAQUI) //Se encontrou Ckeck Lista para maquina no Turno e Data
			
			Ncont++
			
			If Ncont == 1
				If Empty(cRecur)
					oNew1:aCols := Cols1(Substr(QUESREC->MAQUINA,1,6))
				Else
					oNew1:aCols := Cols1(cRecur)
				Endif
			Endif
			
			Aadd(aRecur,(Substr(QUESREC->MAQUINA,1,6)))
			
		Endif
		
		QUESREC->(DbSkip())
	Enddo
	
	If Len(aRecur) == 0
		Alert('<b>Aten็ใo:</b><br>Programa็ใo ja esta Totalmente com Check List Concluido!!<br><br><font color="#FF0000">Chech List ja foi Conferido.</font>')
		cRecur := Space(06)
		Iret := .F.
	Endif
	
	@ 017,274 MSCOMBOBOX	oRecur	 VAR cRecur  	ITEMS aRecur	SIZE 080,008 COLOR CLR_BLUE FONT oFont15B Valid CadRecur(cRecur) Pixel OF oPanel09
	
	oPanel09:Refresh()
Endif

oNew1:Refresh()

Return Iret


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณCadRecur  บAutor  ณVitor Badam         บ Data ณ  06/02/20   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณValida Recurso                  					          บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function CadRecur(cRecur)

Local Iret 		:= .T.

If !Empty(cProgram)
	
	dbSelectArea("ZPP")
	ZPP->(dBsetOrder(4))
	If ZPP->(dBseek(xFilial("ZPP") + cProgram ))
		
		oNew1:aCols := Cols1(cRecur)
		
		If Len(oNew1:aCols) == 0
			Iret := .F.
		Endif
	Else
		oNew1:aCols := {}
		MsgStop("Programa็ใo nใo Existe Verificar!!")
		Iret := .F.
		
	Endif
	
Endif

oNew1:Refresh()
oRecur:Refresh()


Return Iret


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณGravZM1   บAutor  ณVitor Badam         บ Data ณ  06/02/20   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณGrava dados na Tabela ZM1         						  บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function GravZM1()

Local ii        := 0
Local jj        := 0
Local cDocZM1   := "" 

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

If Empty(cTurno)
	MsgStop("Preencher o campo Turno")
	Return .F.
ElseIf Empty(cData)
	MsgStop("Preencher o campo Data")
	Return .F.
ElseIf Empty(cRecur)
	MsgStop("Preencher o campo Recurso")
	Return .F.
ElseIf Empty(cMatric)
	MsgStop("Preencher o campo RE")
	Return .F.
ElseIf Empty(cProgram)
	MsgStop("Preencher o campo Programa็ใo")
	Return .F.
Endif

If Len(oNew1:ACOLS) == 0
	Alert('<b>Aten็ใo:</b><br>E obrigatorio ter Informa็oes dos Itens !!<br><br><font color="#FF0000">Chech List Inconsistente.</font>')
	Return .F.
Endif

If MsgYesNo( cMensagem )
	
	If  nOpcTel <> 5
		
		cDocZM1 := ZM1->ZM1_SEQDOC //Guarda Documento
		
		If  nOpcTel == 4
			
			_cDocZM1 := ZM1->ZM1_SEQDOC
			//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
			//ณExcluir Registro ณ
			//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
			dbSelectArea("ZM1")
			ZM1->(dBsetOrder(1))
			If ZM1->(dBseek(xFilial("ZM1") + _cDocZM1))
				While !ZM1->(EOF()) .And. ZM1->ZM1_FILIAL + ZM1->ZM1_SEQDOC == xFilial("ZM1") + _cDocZM1
					If Reclock( "ZM1" , .F. )
						
						ZM1->(DbDelete())
						
						ZM1->(MsUnlock())
					Endif
					ZM1->(dbSkip())
				Enddo
			Endif
		Endif
		
		
		If nOpcTel == 3
			cDocuSq  := ZM1NUMDOC() //Busca Ultima Numera็ใo do Documento.
		Else
			cDocuSq  := cDocZM1
		Endif

		If cTurno == "3" .And. (_cTurAux >= 00.00 .And. _cTurAux <= 5.55)
			cData := Date() - 1 
		Endif
		
		For jj := 1 To Len(oNew1:ACOLS)
			If oNew1:ACOLS[jj][Len(oNew1:aHeader)+1] == .F.
				If !Empty(oNew1:ACOLS[jj][1])
					If Reclock( "ZM1" , .T. )
						For ii := 1 To Len(oNew1:aHeader)
							cCpo := "ZM1->" + oNew1:aHeader[ii][2]
							&(cCpo) := oNew1:ACOLS[jj][ii]
						Next ii
						
						ZM1->ZM1_FILIAL 	:= xFilial("ZM1")
						ZM1->ZM1_TURNO  	:= cTurno	//Turno
						ZM1->ZM1_MATRIC 	:= cMatric	//Matricula
						ZM1->ZM1_DATA	 	:= cData	//Data
						ZM1->ZM1_HORA       := Substr(Time(),1,5) //Hora 
						ZM1->ZM1_SUGEST 	:= cSugest 	//Sugestao
						ZM1->ZM1_SEQDOC 	:= cDocuSq 	//Documento de Controle Sequencial
						ZM1->ZM1_DOCPRG 	:= cProgram	//Numero da Programa็ใo Produ็ใo
						ZM1->ZM1_TPMAQU		:= cRecur  	//Maquina Selecionada
						
						ZM1->(MsUnlock())
					EndIf
				EndIf
			EndIf
		Next jj
	   	U_WFAUTONO(cDocuSq)
	    U_WFSUGEST(cDocuSq)
		//	DBCloseArea()
		oDlgX:End()
		
		If nOpcTel == 3
			u_CADMNTCHK(3,cProgram,cMatric,cTurno)
		Endif
		
	ElseIf  nOpcTel == 5
		
		_cDocZM1 := ZM1->ZM1_SEQDOC
		//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
		//ณExcluir Registro ณ
		//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		dbSelectArea("ZM1")
		ZM1->(dBsetOrder(1))
		If ZM1->(dBseek(xFilial("ZM1") + _cDocZM1))
			While !ZM1->(EOF()) .And. ZM1->ZM1_FILIAL + ZM1->ZM1_SEQDOC == xFilial("ZM1") + _cDocZM1
				If Reclock( "ZM1" , .F. )
					
					ZM1->(DbDelete())
					
					ZM1->(MsUnlock())
				Endif
				ZM1->(dbSkip())
			Enddo
		Endif
		
		oDlgX:End()
	Endif
	
Endif

Return

/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑฺฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฟฑฑ
ฑฑณPrograma   ณZM1NUMDOCณ Autores ณ Vitor Badam            ณ Data ณ06/02/2020ณฑฑ
ฑฑรฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤดฑฑ
ฑฑณDescricao  ณ Busca o ultimo numero da ZM1                                 ณฑฑ
ฑฑณ           ณ                                                              ณฑฑ
ฑฑภฤฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤูฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿*/
Static Function ZM1NUMDOC()

Local _cQuery := Nil
Local _nDoc   := Nil

_cQuery := " SELECT MAX(ZM1_SEQDOC)+1 DOC "   					+ CRLF
_cQuery += " FROM "+RetSqlName("ZM1")+" ZM1 " 					+ CRLF
_cQuery += " WHERE ZM1.D_E_L_E_T_ != '*' "    					+ CRLF
_cQuery += " AND   ZM1_FILIAL  = '" + xFilial("ZM1") + "' "	 	+ CRLF

dbUseArea(.T.,"TOPCONN", TCGenQry(,,_cQuery),'ZM1TMP',.F.,.T.)

_nDoc := StrZero(ZM1TMP->DOC,8)

ZM1TMP->(DbCloseArea())

Return(_nDoc)         

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณINAMN08   บAutor  ณBruno E. de Souza   บ Data ณ  26/02/2020 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณAbre OS automatico de acordo com defeito e envia workflow   บฑฑ
ฑฑบ          ณcom informa็oes.                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function WFAUTONO(cSeqDocu)  

Local _cBody 		:= ""
Local _cCor  		:= "" 
Local cQuery 		:= "" 
Local cQueryb       := ""  
Local cCelula   	:= "" 
Local nX 			:= 0
Local cCrtl 		:= 0
Local _nY    		:= 0 
Local aItem 		:= {}  
Local _cEmail		:= AllTrim(GETMV("IN_MAILPRE"))

cQuery := "SELECT				   																		" +CRLF 
cQuery += "ZM1_TPMAQU AS 'MAQUINA', 																	" +CRLF
cQuery += "ZM1_TURNO AS 'TURNO',   																		" +CRLF
cQuery += "ZM1_MATRIC AS 'MATRICULA',																	" +CRLF
cQuery += "ZM1_SEQDOC AS 'SEQDOC', 																		" +CRLF
cQuery += "ZM1_DCHECK AS 'PROBLEMA',																	" +CRLF
cQuery += "SUBSTRING(ZM1_DATA,7,2)+'/'+SUBSTRING(ZM1_DATA,5,2)+'/'+SUBSTRING(ZM1_DATA,1,4) AS 'DATAC'	" +CRLF
cQuery += "FROM																							" +CRLF
cQuery += ""+RetSqlName("ZM1")+" ZM1 WITH(NOLOCK)														" +CRLF
cQuery += "WHERE																						" +CRLF
cQuery += "D_E_L_E_T_<>'*'																				" +CRLF
cQuery += "AND																							" +CRLF
cQuery += "ZM1_STATUS = 'N'																				" +CRLF
cQuery += "AND																							" +CRLF
cQuery += "ZM1_SEQDOC = '" + cSeqDocu +  "'																" +CRLF
cQuery += "AND																							" +CRLF
cQuery += "ZM1_FILIAL = '" + xFilial("ZM1") + "'														" +CRLF

If Select("TRB") > 0
	dbSelectArea("TRB")
	TRB->(DbCloseArea())
EndIf

TCQUERY cQuery NEW ALIAS "TRB"

dbSelectArea("TRB")
TRB->(dbGoTop()) 

While TRB->(!EOF()) 

RecLock('STJ', .T.)

cQueryb := "SELECT										" +CRLF
cQueryb += "T9_FILIAL,									" +CRLF
cQueryb += "T9_CODBEM,									" +CRLF
cQueryb += "T9_RECFERR,									" +CRLF  
cQueryb += "T9_CCUSTO									" +CRLF
cQueryb += "FROM										" +CRLF
cQueryb += ""+RetSqlName("ST9")+" ST9 WITH(NOLOCK)		" +CRLF
cQueryb += "WHERE										" +CRLF //JOGA A FERRAMENTA NO CADASTRO DE BENS PARA PEGAR O BEM E ABRIR OS
cQueryb += "D_E_L_E_T_<>'*'								" +CRLF
cQueryb += "AND											" +CRLF
cQueryb += "T9_RECFERR = '" + TRB->MAQUINA +  "'  		" +CRLF 
cQueryb += "AND											" +CRLF
cQueryb += "T9_FILIAL = '" + xFilial("ST9") + "'		" +CRLF

If Select("TRB2") > 0
	dbSelectArea("TRB2")
	TRB2->(DbCloseArea())
EndIf

TCQUERY cQueryb NEW ALIAS "TRB2"

dbSelectArea("TRB2")
TRB2->(dbGoTop()) 

dbSelectArea("SH1")
SH1->(dbSetOrder(1))
If SH1->(dbSeek(xFilial("SH1")+TRB->MAQUINA))
	
	dbSelectArea("SHB")
	SHB->(dbSetOrder(1))
	If SHB->(dbSeek(xFilial("SHB")+SH1->H1_CTRAB))
		cCelula := SHB->HB_COD //Cod. da Celula
	Endif
	
Endif
RecLock('STJ', .T.)

cNumOrd := GETSXENUM( "STJ","TJ_ORDEM" ) //Busca Ultima numeracao do Ordem de Servi็o 

STJ->TJ_FILIAL 		:= xFilial("STJ") 				//Filial
STJ->TJ_ORDEM 		:= cNumOrd                     	//Ordem de Servi็o
STJ->TJ_PLANO 		:= "000000"                    	//Plano
STJ->TJ_DTORIGI 	:= Date()                      	//Data Emisao
STJ->TJ_TIPOOS     	:= "B"                          //Tipo da OS
STJ->TJ_CODBEM     	:= TRB2->T9_CODBEM		        //Codigo do Bem
STJ->TJ_SERVICO    	:= "MCAUTO"                    	//Tipo de Servico
STJ->TJ_TIPO       	:= "AUT"                       	//Tipo
STJ->TJ_CODAREA    	:= "AUTONO"                   		//Codigo Area
STJ->TJ_CCUSTO     	:= TRB2->T9_CCUSTO             	//Centro de Custo
STJ->TJ_HORACO1    	:= SubStr( Time(),1,5)        	//Hora Inicial da Inclusao
STJ->TJ_DTMPINI    	:= Date()                      	//Data inicial da Inclusao
STJ->TJ_HOMPINI    	:= SubStr( Time(),1,5)        	//Hora Inicial da Inclusao
STJ->TJ_DTMPFIM    	:= Date()						//Data Fim da Inclusao
STJ->TJ_HOMPFIM    	:= SubStr( Time(),1,5)         //Hora Fim da Inclusao
STJ->TJ_X_HOROS    	:= SubStr( Time(),1,5)         //Hora da OS
STJ->TJ_TERMINO    	:= "N"                          //Termino da OS
STJ->TJ_PRIORID    	:= "AAA"                        //Prioridade
STJ->TJ_SITUACA    	:= "L"                         	//Situacao
STJ->TJ_TIPMNT     	:= "1"                     		//Tipo de Manutencao
STJ->TJ_TPPARD     	:= "3"                          //Tipo Parada
STJ->TJ_USUAINI    	:= "TDI.MNT"                    //Usuario Inicial
STJ->TJ_USUARIO    	:= "TDI.MNT"                    //Usuario
STJ->TJ_SEQRELA    	:= "0"                          //Sequencia
STJ->TJ_TERCEIR    	:= "1"                        	//Terceiros
STJ->TJ_FATURA     	:= "2"                          //Fatura
STJ->TJ_APROPRI    	:= "2"                          //Apropriacao
STJ->TJ_OBSERVA    	:= TRB->PROBLEMA               	//Observacao
STJ->TJ_CENTRAB    	:= cCelula               		//Centro de Trabalho
STJ->TJ_X_MAT    	:= TRB->MATRICULA              	//RE
STJ->TJ_X_ENTFE    	:= ""                   		//Ferramenta de Entrada
STJ->TJ_X_SAIFE    	:= ""                    		//Ferramenta de Saida
STJ->TJ_X_ENTBE    	:= ""                   		//Ferramenta de Entrada
STJ->TJ_X_SAIBE    	:= ""                 			//Ferramenta de Saida  
STJ->TJ_X_AUTSQ     := TRB->SEQDOC                 //Seq.doc autonoma

STJ->(MsUnLock())

ConfirmSX8("STJ")

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณGera ordem de Producao para a OS                           ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

cCODPRO := If(FindFunction("NGProdMNT"), NGProdMNT("M")[1], GetMv("MV_PRODMNT")) //Ira verificar apenas o primeiro Produto Manutencao do parametro
cOP     := cNumOrd + "OS001"
cOP 	:= Alltrim(cOP)+Space(Len(SC1->C1_OP) - Len(Alltrim(cOP)))
GERAOP(cCODPRO, 1, cOP, Date(), Date(),If(FieldPos("T9_ALMOPER") > 0, ST9->T9_ALMOPER, Nil))

//-- Grava os Campos Especificos na OP
dbSelectArea('SC2')
RecLock('SC2', .F.)
SC2->C2_CC      := TRB2->T9_CCUSTO 
SC2->C2_EMISSAO := MNT420DTOP(Date())
SC2->C2_STATUS  := 'U'
SC2->C2_OBS     := 'PLANO 000000'
SC2->(MsUnLock())

aadd(aItem,{TRB2->T9_CODBEM ,;
			TRB->TURNO		 ,;
			TRB->MATRICULA	 ,;
			TRB->SEQDOC	   	 ,;
			cNumOrd 		 ,;
			TRB->PROBLEMA    ,;
			TRB->DATAC  })

TRB->(dbSkip())

U_INRMN06(cNumOrd)	
EndDo
//TRB->(dbCloseArea()) 
//TRB2->(dbCloseArea()) 

_cBody := '<html>'
_cBody += '<head>'
_cBody += '<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">'
_cBody += '<title>Inylbra</title>'
_cBody += '</head>'
_cBody += '<table width="99%" height="100%" border="0" align="center" cellpadding="0" cellspacing="20">'
_cBody += '  <tr>'
_cBody += '    <td align="center" valign="top" bgcolor="#E2E2E2"><table width="1135" height="300" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">'
_cBody += '        <tr>'
_cBody += '          <th width="1135" height="118" align="center" valign="top" scope="col"> <table width="100%" height="100" border="0" cellpadding="0" cellspacing="0">'
_cBody += '              <tr>'
_cBody += '                <th width="226" height="100" align="left" valign="top" scope="col">&nbsp;</th>'
_cBody += '                <th width="683" align="center" valign="middle" scope="col"> <font face="arial" color="#0066FF" size="5"><b>EQUIPAMENTOS COM FALHA CHECK LIST MANUTENวรO AUTONOMA</b></font><br></th>'
_cBody += '                <th width="226" align="left" valign="top" scope="col"><table width="100%" border="0" cellspacing="0" cellpadding="0">'
_cBody += '                    <tr>'
_cBody += '                      <td align="right" valign="top"><font face="arial" color="#666666" size="2">' + DTOC(dDataBase) + ' </font><br>'
_cBody += '                        <font face="arial" color="#666666" size="2">' + TIME() + '</font></td>
_cBody += '                    </tr>'
_cBody += '                    <tr>'
_cBody += '                      <td height="70" align="center" valign="middle">&nbsp;</td>'
_cBody += '                    </tr>'
_cBody += '                  </table></th>'
_cBody += '              </tr>'
_cBody += '            </table></th>'
_cBody += '        </tr>'
_cBody += '        <tr>'
_cBody += '          <th height="137" align="center" valign="top" scope="col"><table border="0" cellpadding="0" cellspacing="1" width="1200">'
_cBody += '              <tr>'
_cBody += '                <td colspan="01" width="89" bgcolor="#0066FF" height="20"><p align="center"> <font color="#FFFFFF" size="2" face="Arial"><b>MAQUINA</b></font></td>'
_cBody += '                <td width="56" bgcolor="#0066FF"><p align="center"> <font color="#FFFFFF" size="2" face="Arial"><b>TURNO</b></font></td>'
_cBody += '                <td width="71" bgcolor="#0066FF"><p align="center"> <font color="#FFFFFF" size="2" face="Arial"><b>RE</b></font></td>'
_cBody += '                <td width="127" bgcolor="#0066FF"><p align="center"> <font color="#FFFFFF" size="2" face="Arial"><b>SEQ.DOCUMENTO</b></font></td>'
_cBody += '                <td width="140" bgcolor="#0066FF"><p align="center"> <font color="#FFFFFF" size="2" face="Arial"><b>NUMERO DA OS</b></font></td>'
_cBody += '                <td width="539" bgcolor="#0066FF"><p align="center"> <font color="#FFFFFF" size="2" face="Arial"><b>DESCRI&Ccedil;AO DO PROBLEMA</b></font></td>'
_cBody += '                <td width="170" bgcolor="#0066FF"><p align="center"> <font color="#FFFFFF" size="2" face="Arial"><b>DATA</b></font></td>'
_cBody += '              </tr>' 
_cBody += '				</table>'  
_cBody += '	 <table border="0" cellpadding="0" cellspacing="1" width="1200">'

  For nX:=1 To Len (aItem) 
	cCrtl := 1
		
		_nY++
		
		If _nY%2 == 0
			_cCor := "#FFFFFF"
		Else
			_cCor := "#D8E6F5"
		EndIf  
	  	
    _cBody += '          <tr bgcolor="#FFFFFF">'
	_cBody += '            <td colspan="1" width="89" bgcolor="' + _cCor + '" height="20"><p align="left"><font color= "#000000"   size="2" face="Arial"><b>'+aItem[nX,1]+'</b></font></td>'
    _cBody += '            <td width="56"  bgcolor="' + _cCor + '"><p align="center"><font color= "#000000"   size="2" face="Arial"><b>'+aItem[nX,2]+'</b></font></td> '
    _cBody += '            <td width="71"  bgcolor="' + _cCor + '"><p align="center"><font color= "#000000"   size="2" face="Arial"><b>'+aItem[nX,3]+'</b></font></td>'
    _cBody += '            <td width="126" bgcolor="' + _cCor + '"><p align="center"><font color= "#000000"   size="2" face="Arial"><b>'+aItem[nX,4]+'</b></font></td>'
    _cBody += '            <td width="141" bgcolor="' + _cCor + '"><p align="center"><font color= "#000000"   size="2" face="Arial"><b>'+aItem[nX,5]+'</b></font></td>'
    _cBody += '            <td width="539" bgcolor="' + _cCor + '"><p align="left">	<font   color= "#000000"   size="2" face="Arial"><b>'+aItem[nX,6]+'</b></font></td>'
    _cBody += '            <td width="170" bgcolor="' + _cCor + '"><p align="center"><font color= "#000000"   size="2" face="Arial"><b>'+aItem[nX,7]+'</b></font></td>'
 	_cBody += '  </tr>'
 	
 	Next nX

_cBody += '              <tr bgcolor="#CCDAEA"> </tr>'
_cBody += '          </table></th>'
_cBody += '        </tr>' 
_cBody += '        <tr>'
_cBody += '          <th height="20" align="center" valign="middle" bgcolor="#0066FF" scope="col"> <font face="arial" size="2" color="#FFFFFF">Workflow Inylbra</font> </th>'
_cBody += '        </tr>'
_cBody += '      </table></td>'
_cBody += '  </tr>'  
_cBody += '</table> '
_cBody += '</html>' 

If cCrtl == 1
	u_GeraMail(,,,,_cEmail,"*** EQUIPAMENTOS COM FALHA CHECK LIST MANUTENวรO AUTONOMA *** ",_cBody,,.T.)
EndIf

Return()

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณWFSUGEST  บAutor  ณBruno E. de Souza   บ Data ณ  05/08/2020 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณQuando usuario preenche o campo sugestao envia workflow     บฑฑ
ฑฑบ          ณpara responsaveis                                           บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function WFSUGEST(cSeqDocu)

Local cQueryc 	:= "" 
Local cCrtlb 	:= 0
Local ctexto    := ""
Local _nCor		:= 1
Local cDocSeq   := ""
Local cEmailSg  := AllTrim(GETMV("IN_MLSUGRT")) //envia a sugestao para responsavel MNT respodender
Local _cHtml 	:= ""

cQueryc :="SELECT																							" +CRLF
cQueryc += "ZM1_SEQDOC,																						" +CRLF
cQueryc += "ZM1_TPMAQU,																						" +CRLF
cQueryc += "SUBSTRING(RA_NOME,1,14) AS 'NOME',																" +CRLF
cQueryc += "SUBSTRING(ZM1_DATA,7,2)+'/'+SUBSTRING(ZM1_DATA,5,2)+'/'+SUBSTRING(ZM1_DATA,1,4) AS 'DATACHK',	" +CRLF
cQueryc += "ZM1_HORA,																						" +CRLF
cQueryc += "ISNULL(CAST(CAST(ZM1_SUGEST AS VARBINARY(8000)) AS VARCHAR(8000)),'') AS 'SUGEST'				" +CRLF
cQueryc += "FROM																							" +CRLF
cQueryc += ""+RetSqlName("ZM1")+" ZM1 WITH(NOLOCK) 															" +CRLF
cQueryc += "JOIN																							" +CRLF
cQueryc += ""+RetSqlName("SRA")+" SRA WITH(NOLOCK)															" +CRLF
cQueryc += "ON																								" +CRLF
cQueryc += "ZM1_MATRIC = RA_MAT																				" +CRLF
cQueryc += "AND																								" +CRLF
cQueryc += "ZM1_FILIAL = RA_FILIAL																			" +CRLF
cQueryc += "WHERE																							" +CRLF
cQueryc += "ZM1.D_E_L_E_T_ <> '*'																			" +CRLF
cQueryc += "AND																								" +CRLF
cQueryc += "SRA.D_E_L_E_T_ <> '*'																			" +CRLF
cQueryc += "AND																								" +CRLF
cQueryc += "ZM1_SUGEST <> ''																				" +CRLF
cQueryc += "AND																								" +CRLF
cQueryc += "ZM1_SEQDOC = '" + cSeqDocu +  "'																" +CRLF
cQueryc += "AND																								" +CRLF
cQueryc += "ZM1_FILIAL = '" + xFilial("ZM1") + "'															" +CRLF
cQueryc += "GROUP BY																						" +CRLF
cQueryc += "ZM1_SEQDOC,																						" +CRLF
cQueryc += "ZM1_SUGEST,																						" +CRLF
cQueryc += "ZM1_TPMAQU,																						" +CRLF
cQueryc += "RA_NOME,																						" +CRLF
cQueryc += "ZM1_DATA,																						" +CRLF
cQueryc += "ZM1_HORA																						" +CRLF

If Select("TRB3") > 0
	dbSelectArea("TRB3")
	TRB3->(DbCloseArea())
EndIf

TCQUERY cQueryc NEW ALIAS "TRB3"

dbSelectArea("TRB3")
TRB3->(dbGoTop()) 

oProcess:= TWFProcess():New("APROVSC","***Workflow para Notifica็ใo de Sugestใo check List autonoma do operador***")
oProcess:NewTask("SUGESTAO CHECK LIST MANUTENวรO AUTONOMA","\WORKFLOW\MNTSUGESTAO\SUGMNT_INFO.HTML")

While TRB3->(!EOF())

	cDocSeq:= TRB3->ZM1_SEQDOC

 ctexto := alltrim(TRB3->SUGEST)
 ctexto := strtran(ctexto, chr(13) + chr(10), "")

 If !empty(ctexto)

	cCrtlb := 1

	ctexto := TRB3->SUGEST
/////////////////////////////////////////envia sugestao para MNT responder pedido Marcos 17/05/2021
  			aadd((oProcess:oHTML:ValByName("it.cor"		)),IIF(_nCor%2 == 0,"#FFFFFF","#CCDAEA"))
			aadd((oProcess:oHTML:ValByName("it.docchk"	)),TRB3->ZM1_SEQDOC) 
	   	    aadd((oProcess:oHTML:ValByName("it.maquina"	)),TRB3->ZM1_TPMAQU)
	    	aadd((oProcess:oHTML:ValByName("it.usuario"	)),TRB3->NOME      )
	   	    aadd((oProcess:oHTML:ValByName("it.dtoper"	)),TRB3->DATACHK   )
	   	    aadd((oProcess:oHTML:ValByName("it.hroper"	)),TRB3->ZM1_HORA  )
	   	    aadd((oProcess:oHTML:ValByName("it.sugest"	)), alltrim(ctexto))
		    aadd((oProcess:oHTML:ValByName("it.obs")),""          		   )  
			
	EndIf
 TRB3->(dbSkip())
EndDo
 TRB3->(dbCloseArea())

/////////////////////////////////////envia sugestao para MNT responder pedido Marcos 17/05/2021
If cCrtlb == 1
 	oProcess:cSubject 	:= 'Notifica็ใo'
	oProcess:cTo 		:= "APROVSC"
   	oProcess:bReturn  	:= "U_SUGRET()"
	_cMailId 			:= oProcess:Start()
	_cHtml				:= _cMailId + ".HTM"
	oProcess:NewTask("LINK","\WORKFLOW\MNTSUGESTAO\INAMN08_LINK.HTML")
	oProcess:oHTML:ValByName("cClique"	,cDocSeq  )
	oProcess:oHtml:ValByName("cLink"	,AllTrim("http://" + AllTrim(GetMv("ES_HTTPCOM")) + "/" + _cHtml))
	oProcess:cSubject	:= "*** Sugestใo check List autonoma do operador Nบ "+cDocSeq+"*** "
	oProcess:cTo		:= cEmailSg
	oProcess:Start()

EndIf

Return()
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณSUGRET    บAutor  ณBruno E. de Souza   บ Data ณ  17/05/2021 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณProcesso Retorno                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/ 
User Function SUGRET(oProcess)

Local aDocchk   := oProcess:oHTML:RetByName("it.docchk"	)
Local aMaquina  := oProcess:oHTML:RetByName("it.maquina")
Local aUsuario  := oProcess:oHTML:RetByName("it.usuario")
Local aDt 		:= oProcess:oHTML:RetByName("it.dtoper")
Local aHr 		:= oProcess:oHTML:RetByName("it.hroper")
Local aSugest	:= oProcess:oHTML:RetByName("it.sugest")
Local aObs 		:= oProcess:oHTML:RetByName("it.obs")    
Local _nX		:= 0
Local _nCor		:= 1
Local cDocchk 	:= ""
Local cEmailSQul:= GetMv("IN_MAILSUG") 

oProcess:NewTask("LINK","\WORKFLOW\MNTSUGESTAO\SUGMNT_RET.HTML") 
								   
For _nX:=1 to Len(aDocchk)
		cDocchk := aDocchk[_nX]
		_nCor++
		aadd((oProcess:oHTML:ValByName("it.cor"			)),IIF(_nCor%2 == 0,"#CCDAEA","#FFFFFF"))
	   	aadd((oProcess:oHTML:ValByName("it.docchk"		)),aDocchk[_nX]	)
	   	aadd((oProcess:oHTML:ValByName("it.maquina"		)),aMaquina[_nX])
	   	aadd((oProcess:oHTML:ValByName("it.usuario"		)),aUsuario[_nX])
	   	aadd((oProcess:oHTML:ValByName("it.dtoper"		)),aDt[_nX] 	)
	   	aadd((oProcess:oHTML:ValByName("it.hroper"	   	)),aHr[_nX] 	)
		aadd((oProcess:oHTML:ValByName("it.sugest"	   	)),aSugest[_nX]	)   
	   	aadd((oProcess:oHTML:ValByName("it.obs"			)),aObs[_nX] 	)

		dbSelectArea("ZM1") 
		ZM1->(dbSetOrder(1))
		If ZM1->(dbSeek(xFilial("ZM1")+aDocchk[_nX])) 
			While ZM1->(!EOF()) .And. ZM1->ZM1_SEQDOC == aDocchk[_nX]
				RecLock('ZM1', .F.)   
				ZM1->ZM1_RESSG := aObs[_nX]
				ZM1->(dbSkip())
			Enddo
				ZM1->(dbCloseArea())
				ZM1->(MsUnLock())
		Endif
	
Next _nX

	oProcess:cSubject	:= 'SUGESTAO CHECK LIST MANUTENวรO AUTONOMA '+cDocchk
	oProcess:cTo		:= cEmailSQul
	oProcess:Start()
	
Return()
