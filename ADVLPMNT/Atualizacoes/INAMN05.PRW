#INCLUDE "Protheus.Ch"
#INCLUDE "RwMake.Ch"
#INCLUDE "TopConn.Ch"
#INCLUDE "FiveWin.Ch"

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ INAMN05  บ Autor ณ Vitor Badam  บ Data ณ 21/05/19    บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Retorno da Ordem de Servico						    บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

User Function INAMN05()

	Private nLinIni      := 10
	Private nColIni      := 10
	Private nLinFin      := 590
	Private nColFin      := 520
	Private _oFont2      := Nil
	Private oDlgY        := Nil
	Private oFont14	  	 := TFont():New( "Verdana" , , 14 , , .T. , , , , , .F. , .F. )
	Private oFont18	  	 := TFont():New( "Verdana" , , 18 , , .T. , , , , , .F. , .F. )
	Private _oOrdem      := Nil
	Private _cOrdem      := Space(06)
	Private _oMotServ    := Nil
	Private _cMotServ    := Space(06)
	Private _cDesServ    := ""
	Private _oDesServ    := Nil
	Private _oMotSer2    := Nil
	Private _cMotSer2    := Space(06)
	Private _cDesSer2    := ""
	Private _oDesSer2    := Nil
	Private _oMotSer3    := Nil
	Private _cMotSer3    := Space(06)
	Private _cDesSer3    := ""
	Private _oDesSer3    := Nil
	Private _oHoraIni    := Nil
	Private _cHoraIni    := "  :  "
	Private _cEstFerr    := Space(16)
	Private _oEstFerr    := Nil
	Private _oDescFerr   := Nil
	Private _cDescFerr   := Space(40)
	Private _IBlqF       := .F.

	DEFINE FONT _oFont2  	NAME "Arial" Size 15,18 BOLD
	DEFINE FONT oFont1 		NAME "Arial" SIZE 10,020 BOLD

	DEFINE MSDIALOG oDlgY TITLE "ENCERRAR ORDEM DE SERVIวO" FROM nLinIni,nColIni TO nLinFin,nColFin PIXEL
	oDlgY:lCentered	:= .T.

	@ (nLinIni+015),(nColIni+003)  Say     "LEIA A ORDEM SERVIวO: " 	      	   		Size 100,15 FONT oFont14 PIXEL OF oDlgY
	@ (nLinIni+010),(nColIni+082)  MsGet	 _oOrdem    Var _cOrdem 	      	   		Size 090,15 FONT oFont18 PIXEL OF oDlgY Valid VldOrdem()
	@ (nLinIni+040),(nColIni+003)  Say     "SERVIวO EXECUTADO 1: " 	      	   		Size 100,15 FONT oFont14 PIXEL OF oDlgY
	@ (nLinIni+035),(nColIni+082)  MsGet 	_oMotServ   Var _cMotServ 	      F3 "ZZ"	Size 050,15 FONT oFont18 PIXEL OF oDlgY Valid ValidJus(_cMotServ,1)
	@ (nLinIni+057),(nColIni+005)  MsGet  	_oDesServ	Var _cDesServ COLOR CLR_HBLUE   Size 230,15 FONT oFont1  PIXEL OF oDlgY When .F.
	@ (nLinIni+085),(nColIni+003)  Say     "SERVIวO EXECUTADO 2: " 	      	   		Size 100,15 FONT oFont14 PIXEL OF oDlgY
	@ (nLinIni+080),(nColIni+082)  MsGet 	_oMotSer2   Var _cMotSer2 	      F3 "ZZ"	Size 050,15 FONT oFont18 PIXEL OF oDlgY Valid IIf(!Empty(_cMotSer2),ValidJus(_cMotSer2,2),.T.)
	@ (nLinIni+102),(nColIni+005)  MsGet  	_oDesSer2	Var _cDesSer2 COLOR CLR_HBLUE   Size 230,15 FONT oFont1  PIXEL OF oDlgY When .F.
	@ (nLinIni+130),(nColIni+003)  Say     "SERVIวO EXECUTADO 3: " 	      	   		Size 100,15 FONT oFont14 PIXEL OF oDlgY
	@ (nLinIni+125),(nColIni+082)  MsGet 	_oMotSer3   Var _cMotSer3 	      F3 "ZZ"	Size 050,15 FONT oFont18 PIXEL OF oDlgY Valid IIf(!Empty(_cMotSer3),ValidJus(_cMotSer3,3),.T.)
	@ (nLinIni+147),(nColIni+005)  MsGet  	_oDesSer3	Var _cDesSer3 COLOR CLR_HBLUE   Size 230,15 FONT oFont1  PIXEL OF oDlgY When .F.

	@ (nLinIni+175),(nColIni+003)  Say     "HORA INICIAL: " 	      	   				Size 100,15 FONT oFont14 PIXEL OF oDlgY
	@ (nLinIni+170),(nColIni+082)  MsGet 	_oHoraIni   Var _cHoraIni 	     			Size 050,15 FONT oFont18 PIXEL OF oDlgY PICTURE "@E 99:99" VALID IIF(!Empty(STRTRAN(_cHoraIni,':',' ')),ValHr(_cHoraIni),NIL)

	@ (nLinIni+200),(nColIni+003)  Say     "ESTOQUE FERRAM: " 	      	   	   			Size 100,15 FONT oFont14 PIXEL OF oDlgY
	@ (nLinIni+195),(nColIni+082)  MsGet 	_oEstFerr   Var _cEstFerr 	    F3 "ST9FER"	Size 090,15 FONT oFont18 PIXEL OF oDlgY When _IBlqF Valid IIf(!Empty(_cEstFerr),ValFerr(_cEstFerr),.T.)
	@ (nLinIni+217),(nColIni+005)  MsGet  	_oDescFerr	Var _cDescFerr COLOR CLR_HBLUE  Size 230,15 FONT oFont1  PIXEL OF oDlgY When .F.

	@ (nLinIni+240),(nColIni+003)  Say     "USUARIO: " 	      	   		   	   		Size 100,15 FONT oFont14 PIXEL OF oDlgY
	@ (nLinIni+240),(nColIni+082)  Say 	cUserName 	  		 COLOR CLR_HBLUE   	   	Size 200,15 FONT _oFont2 PIXEL OF oDlgY

	@ (nLinIni+260),(nColIni+030) BUTTON 	"GRAVAR" 	   								Size 70,011				 PIXEL OF oDlgY	FONT oFont1	ACTION GRVFCHORD()
	@ (nLinIni+260),(nColIni+145) BUTTON 	"CANCELAR" 									Size 70,011			     PIXEL OF oDlgY	FONT oFont1	ACTION oDlgY:End()

	ACTIVATE MSDIALOG oDlgY CENTER

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณVldOrdem  บAutor  ณVitor Badam         บ Data ณ  21/05/19   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณValida a Ordem de Servico                                   บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function VldOrdem()

	Local Iret  := .T.

	dbSelectArea("STJ")
	STJ->(dbSetOrder(1))
	If STJ->(dbSeek(xFilial("STJ")+_cOrdem))

		If STJ->TJ_TERMINO == "S"

			MsgStop("Esta Ordem de Servi็o esta Encerrada!")

			Iret := .F.
		Endif

		If !Empty(STJ->TJ_X_ENTFE)  //Desloqueia o campo de Ferramenta
			_IBlqF := .T.
		Endif

	Endif

Return Iret


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณValFerr   บAutor  ณVitor Badam         บ Data ณ  10/01/19   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณValida Ferramenta                                           บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/


Static Function ValFerr(_cEstFerr)

	Local _lRet := .T.

	dbSelectArea("ST9")
	ST9->(dbSetOrder(1))
	If ST9->(dbSeek(xFilial("ST9")+alltrim(_cEstFerr)))
		_cDescFerr := ST9->T9_NOME
	Else
		_cDescFerr := Space(50)

		MsgStop("Codigo da Ferramenta nใo Existe!")
		_lRet := .F.
	Endif

Return _lRet

/*                                            
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณValHr     บAutor  ณVitor Badam	     บ Data ณ  26/09/19   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ - Validacao da Hora 										  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Inylbra                                                    บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function ValHr(_cHoraI)

	If VAL(Substr(_cHoraI,1,2)) > 23 .OR. VAL(SubStr(_cHoraI,4,2)) > 59 .OR. LEN(AllTrim(_cHoraI)) < 5
		MsgStop("Favor digitar uma hora Valida!")
		_cHoraIni := "  :  "
		_oHoraIni:cCaption := _cHoraIni
		_oHoraIni:Refresh()
		_oHoraIni:SetFocus()
		Return .F.
	EndIf

	If _cHoraI > Substr(Time(),1,5) 

		MsgStop("Hora Digitada maior que a Hora Atual!")
		_cHoraIni := "  :  "
		_oHoraIni:cCaption := _cHoraIni
		_oHoraIni:Refresh()
		_oHoraIni:SetFocus()
		Return .F.

	Endif

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณValidJus  บAutor  ณVitor Badam         บ Data ณ  27/05/19   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Valida o Motivo                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function ValidJus(_cMotivo,cTpMot)

	Local  Iret  := .T.

	dbSelectArea("SX5")
	dbSetOrder(1)
	If !dbSeek(xFilial("SX5")+"ZZ"+_cMotivo)

		MsgStop("Este Motivo nใo Existe")

		If cTpMot == 1
			_cDesServ := ""
			_oDesServ:cCaption 	:= _cDesServ
			_oDesServ:Refresh()
		ElseIf  cTpMot == 2
			_cDesSer2 := ""
			_oDesSer2:cCaption 	:= _cDesSer2
			_oDesSer2:Refresh()
		ElseIf  cTpMot == 3
			_cDesSer3 := ""
			_oDesSer3:cCaption 	:= _cDesSer3
			_oDesSer3:Refresh()
		Endif

		Iret := .F.
	Else
		If Alltrim(STJ->TJ_CODAREA) == "M" .And. !Substr(_cMotServ,1,3) $ "SHP*SME"
			MsgStop("Este Motivo nใo e Permitido , Apenas Motivos com Inicio 'SHP' ")
			Iret := .F.

			_cDesServ := ""
			_oDesServ:cCaption 	:= _cDesServ
			_oDesServ:Refresh()

		Elseif Alltrim(STJ->TJ_CODAREA) == "E" .And. Substr(_cMotServ,1,3) <> "SEL"
			MsgStop("Este Motivo nใo e Permitido , Apenas Motivos com Inicio 'SEL' ")
			Iret := .F.

			_cDesServ := ""
			_oDesServ:cCaption 	:= _cDesServ
			_oDesServ:Refresh()

		Else

			If cTpMot == 1
				_cDesServ := SX5->X5_DESCRI
			ElseIf  cTpMot == 2
				_cDesSer2 := SX5->X5_DESCRI
			ElseIf  cTpMot == 3
				_cDesSer3 := SX5->X5_DESCRI
			Endif

		Endif
	Endif

Return Iret

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณGRVFCHORD บAutor  ณVitor Badam         บ Data ณ  21/05/19   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณEncerra a Ordem de Servi็o                                  บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿ 
*/     

Static Function GRVFCHORD()

	Local aReqSD3   := {}
	Local nX        := 0
	Local cOperador := ""
	Private lMMoeda := NGCADICBASE("TL_MOEDA","A","STL",.F.) // Multi-Moeda

	If Empty(_cOrdem) .Or. Empty(_cMotServ) .Or. Empty(_cDesServ) .Or. Empty(STRTRAN(_cHoraIni,':',' '))
		MsgStop("Todos Campos sใo Obrigatorios")
		Return .F.
	Endif

	If _IBlqF .and. Empty(_cEstFerr)
		MsgStop("Obrigatorio Preencher o Campo estoque da Ferramenta")
		Return .F.
	Endif

	PswOrder(1)
	If PswSeek(AllTrim(__CUSERID),.t.)
		cOperador := Substr(PswRet()[1][22],5,6)
	EndIf

	If Empty(cOperador)
		MsgStop("Sua Matricula nใo esta Vinculada no Protheus Verificar com Informatica!!")
		Return .F.
	Endif

	dbSelectArea("ST1")
	ST1->(dbSetOrder(1))
	If !ST1->(dbSeek(xFilial("ST1")+cOperador))
		MsgStop("Voce nao possui Cadastro na Mao de Obra de INSUMOS,Verificar com a Manuten็ใo!!")
		Return .F.
	Endif

	CHECKLSPRV(_cOrdem) //Chama checklist preventiva 15/09/2020 bruno e. Souza pedido mnt

	dbSelectArea("STJ")
	STJ->(dbSetOrder(1))
	If STJ->(dbSeek(xFilial("STJ")+_cOrdem))

		RecLock("STJ",.F.)

		STJ->TJ_X_ESTFE := _cEstFerr
		STJ->TJ_DTPRINI := STJ->TJ_DTORIGI
		STJ->TJ_HOPRINI := STJ->TJ_X_HOROS
		STJ->TJ_DTMRINI := STJ->TJ_DTORIGI
		STJ->TJ_HOMRINI := STJ->TJ_X_HOROS
		STJ->TJ_TIPORET	:= "S"
		STJ->TJ_USUAFIM	:= cUserName
		STJ->TJ_IRREGU	:= "52"
		STJ->TJ_SEREXEC := _cDesServ + " - " + _cDesSer2 + " - " + _cDesSer3

		If Empty(STL->TL_DTFIM) //verifica se foi preenchido pela produ็ใo solicitado Marcos - 28/01/2021
			STJ->TJ_DTMRFIM := Date()
			STJ->TJ_HOMRFIM := Substr(Time(),1,5)
			STJ->TJ_DTPRFIM	:= Date()
			STJ->TJ_HOPRFIM	:= Substr(Time(),1,5)
		Endif

		STJ->(MsUnLock())

		dbSelectArea("STL")
		dbSetOrder(1)
		dbSeek(xFilial("STL")+_cOrdem)

		While !EoF() .And. xFilial("STL")+_cOrdem == STL->(TL_FILIAL+TL_ORDEM)

			If Alltrim(STL->TL_X_TPGER) == "INAPP47"

				If Empty(STL->TL_DTFIM) .Or. _cHoraIni > STL->TL_HOFIM 
					nHoraReal := U_CalcHoras(STL->TL_DTINICI,_cHoraIni,Date(),Substr(Time(),1,5))
				Else
					nHoraReal := U_CalcHoras(STL->TL_DTINICI,_cHoraIni,STL->TL_DTFIM,STL->TL_HOFIM) //Calcula Sobre o Retorno da Produ็ใo
				Endif 

				nHoraReal := Round(HoraToInt(nHoraReal),2)

				RecLock("STL",.F.)

				STL->TL_HOINICI := _cHoraIni
				STL->TL_QUANTID := nHoraReal
				STL->TL_CODIGO  := cOperador

				If Empty(STL->TL_DTFIM) .Or. _cHoraIni > STL->TL_HOFIM  //verifica se foi preenchido pela produ็ใo solicitado Marcos - 28/01/2021
					STL->TL_DTFIM   := Date()
					STL->TL_HOFIM   := Substr(Time(),1,5)
				Endif

				STL->(MsUnLock())

			Endif

			If STL->TL_TIPOREG $ "M"
				aAdd( aReqSD3 , { STL->(Recno()) , .F. } ) //MNTGERAD3("RE0",.F.)
			EndIf

			STL->(dbSkip())
		EndDo


		//Executa as requisicoes de uma so vez
		For nX := 1 To Len(aReqSD3)

			dbSelectArea("STL")
			dbSetOrder(1)
			dbGoTo(aReqSD3[nX,1])
			If !EoF() .And. !Bof()
				// Posicionamento na STJ exigido, devido ao processo de gravacao da fun็ใo MNTGERAD3
				If NGIFDBSEEK("STJ",STL->TL_ORDEM + STL->TL_PLANO,1)
					cNUMSEQ := MNTGERAD3("RE0",aReqSD3[nX,2])

					dbSelectArea("STL")

					RecLock("STL",.F.)

					STL->TL_NUMSEQ := cNUMSEQ
					STL->TL_CUSTO  := ROUND(SD3->D3_CUSTO1,2)

					If lMMoeda
						STL->TL_MOEDA  := "1"
					EndIf

					STL->(MsUnLock())

					If NGPRODESP(SD3->D3_COD,.F.,"M")
						NGAtuErp("SD3","INSERT")
					EndIf
				EndIf
			EndIf

		Next nX


		STJ->(dbSetOrder(1))
		STJ->(dbSeek(xFilial("STJ")+_cOrdem))

		nINDSTJ  := IndexOrd()
		nRECSTJ  := Recno()
		nREGFIM  := Recno()

		nCONTBEM := 0
		nCONTSTJ := 0

		cBemRet   := Space( TAMSX3("TJ_CODBEM")[1] )
		cBemRet   := NGTBEMPAI( STJ->TJ_CODBEM, cBemRet)
		cBemRet   := IIf( Empty(cBEMRET), STJ->TJ_CODBEM, cBemRet )
		cTIPOCON  := NGSEEK("ST9",cBEMRET,1,"T9_TEMCONT")
		TIPOACOM  := ( cTIPOCON == "S" )

		cAORDEM   := STJ->TJ_ORDEM
		cAPLANO   := STJ->TJ_PLANO
		cACODBEM  := STJ->TJ_CODBEM
		cASERVICO := STJ->TJ_SERVICO
		nASEQUENC := STJ->TJ_SEQRELA
		nCONTSTJ  := STJ->TJ_POSCONT
		nDIFX     := nCONTSTJ - nCONTBEM
		nDIF      := IIf( nDIFX > 0, nDIFX, 0 )

		NGFINAL( STJ->TJ_ORDEM, STJ->TJ_PLANO, STJ->TJ_DTPRINI, STJ->TJ_HOPRINI,;
			STJ->TJ_DTPRFIM, STJ->TJ_HOPRFIM, STJ->TJ_POSCONT, STJ->TJ_POSCON2,;
			cBEMRET, STJ->TJ_HORACO1, STJ->TJ_HORACO2, nDIF)

		lSTJAchou := A400STJBUS(cACODBEM)
		dbSelectArea("ST9")
		dbSetOrder(1)
		If dbSeek(xFilial("ST9")+cACODBEM)
			RecLock("ST9",.F.)
			If lSTJAchou = .F.
				ST9->T9_TERCEIR := "1"
			EndIf
			ST9->(MsUnlock())
		EndIf

		lOSPOST := ( AllTrim( GetMv("MV_NGREPRO") ) == "S" )
		If STJ->TJ_DTMRFIM <> STJ->TJ_DTMPFIM .And. Val(STJ->TJ_PLANO) > 0 .And. lOSPost
			NGOSREPROG( STJ->TJ_CODBEM, STJ->TJ_SERVICO, STJ->TJ_SEQRELA, STJ->TJ_DTMRFIM, STJ->TJ_DTMPFIM )
		EndIf

		//Fechamento de solicitacao de servico
		NGFECHASS(STJ->TJ_ORDEM)

		If EMPTY(STJ->TJ_DTPRFIM) //INCLUIDO DEVIDO RELATORIO INRMN03 SEM DATA FIM 07/04/2021 BRUNO E. DE SOUZA
		   dbSelectArea("STJ")
		   STJ->(dbSetOrder(1))
		   If STJ->(dbSeek(xFilial("STJ")+_cOrdem))

			  RecLock("STJ",.F.)
			  STJ->TJ_DTPRFIM	:= STJ->TJ_DTMRFIM
			  STJ->TJ_HOPRFIM	:= STJ->TJ_HOMRFIM
		   Endif

			STJ->(MsUnLock())
		EndIf

		GRVZEEMN5(STJ->TJ_X_AUTSQ) //Reabre o controle de Apontamento da Programa็ใo

		MsgAlert("Ordem de Servi็o finalizada com Sucesso")

	Else

		MsgStop("Ordem de Servi็o nใo Existe")

	Endif

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณLimpa Variaveis do Sistemaณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

	_cOrdem   	:= Space(06)
	_cMotServ 	:= Space(06)
	_cMotSer2 	:= Space(06)
	_cMotSer3 	:= Space(06)
	_cEstFerr 	:= Space(16)
	_cDescFerr  := Space(40)

	_oOrdem:cCaption 	:= _cOrdem
	_oOrdem:Refresh()

	_oMotServ:cCaption 	:= _cMotServ
	_oMotServ:Refresh()

	_oEstFerr:cCaption 	:= _cEstFerr
	_oEstFerr:Refresh()

	_oDescFerr:cCaption := _cDescFerr
	_oDescFerr:Refresh()

	_cDesServ := ""
	_oDesServ:cCaption 	:= _cDesServ
	_oDesServ:Refresh()

	_cHoraIni := "  :  "
	_oHoraIni:cCaption 	:= _cHoraIni
	_oHoraIni:Refresh()

	_oMotSer2:cCaption 	:= _cMotSer2
	_oMotSer2:Refresh()

	_cDesSer2 := ""
	_oDesSer2:cCaption 	:= _cDesSer2
	_oDesSer2:Refresh()

	_oMotSer3:cCaption 	:= _cMotSer3
	_oMotSer3:Refresh()

	_cDesSer3 := ""
	_oDesSer3:cCaption 	:= _cDesSer3
	_oDesSer3:Refresh()


Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณCHECKLSPRVบAutor  ณBruno E. de Souza   บ Data ณ  15/09/2020 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณAbre tela check List preventiva                             บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿ 
*/  
Static Function CHECKLSPRV(_cOrdem)

	Local   nOpcao       := 3
	Private nLinIni      := 10
	Private nColIni      := 10
	Private nLinFin      := 270
	Private nColFin      := 400
	Private oDlgY	     := Nil
	Private _oFont2      := Nil
	Private oFont17	     := TFont():New( "Arial" , , 17 , , .T. , , , , , .T. , .F. )
	Private cOpcaoE      := "E"
	Private cOpcaoH      := "H"

	If STJ->TJ_TIPMNT = "2"

		DEFINE FONT _oFont2  	NAME "Arial" Size 10,10 BOLD

		DEFINE MSDIALOG oDlgY TITLE "CHECK LIST PREVENTIVA" STYLE DS_MODALFRAME FROM nLinIni,nColIni TO nLinFin,nColFin PIXEL
		oDlgY:lCentered	:= .T.

		@ (nLinIni+005),(nColIni+015)  Button "CHECK LIST ELETRICA"    Size 150,25 PIXEL OF oDlgY ACTION U_CADMNTPRE(nOpcao,cOpcaoE,_cOrdem) FONT oFont17 PIXEL OF oDlgY
		@ (nLinIni+045),(nColIni+015)  Button "CHECK LIST HIDRAULICA"  Size 150,25 PIXEL OF oDlgY ACTION U_CADMNTPRE(nOpcao,cOpcaoH,_cOrdem) FONT oFont17 PIXEL OF oDlgY
		@ (nLinIni+085),(nColIni+015)  Button "CONCLUIR"               Size 150,25 PIXEL OF oDlgY ACTION CADMNTEND(_cOrdem)                  FONT oFont17 PIXEL OF oDlgY

		ACTIVATE MSDIALOG oDlgY CENTER

	EndIf

Return()
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ CADMNTEND  บ AutorณBruno E.de SouzaData ณ 15/09/2020 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Verifica se ja tem checkLIst Preventiva             บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function CADMNTEND(_cOrdem)

	dbSelectArea("ZM3")
	ZM3->(dBsetOrder(2))
	If !ZM3->(dBseek(xFilial("ZM3")+_cOrdem+"H"))
		Alert('<b>Aten็ใo:</b><br>CheckList hidraulica nใo realizada, OS: <br><br><font color="#FF0000">'+ _cOrdem +'</font>')
		Return .F.
	ElseIf !ZM3->(dBseek(xFilial("ZM3")+_cOrdem+"E"))
		Alert('<b>Aten็ใo:</b><br>CheckList eletrica nใo realizada, OS: <br><br><font color="#FF0000">'+ _cOrdem +'</font>')
		Return .F.
	Else
		Alert('<b>Aten็ใo:</b><br>CheckList concluido, OS: <br><br><font color="#FF0000">'+ _cOrdem +'</font>')
		oDlgY:End()
		Return()
	EndIf

Return()

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณGRVZEEMN5 บ Autor ณ Vitor Badam  บ Data ณ 21/09/20    บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Grava Fim da Para caso nao foi Iniciada				บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function GRVZEEMN5(_cDocu)

Local cCelula := ""
_cDocu  := StrZero(Val(_cDocu),8)

DbSelectArea("ZPP")
ZPP->(dBsetOrder(4))
ZPP->(dBseek(xFilial("ZPP") + _cDocu))

dbSelectArea("SH1")
SH1->(dbSetOrder(1))
If SH1->(dbSeek(xFilial("SH1")+ZPP->ZPP_MAQUIN))
	
	dbSelectArea("SHB")
	SHB->(dbSetOrder(1))
	If SHB->(dbSeek(xFilial("SHB")+SH1->H1_CTRAB))
		cCelula := SHB->HB_COD //Cod. da CelULA
	Endif
	
Endif

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณBusca a Ultima Sequencia de Produ็ใoณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

cQuery := " SELECT MAX(ZEE_SEQUEN) AS ZEE_SEQUEN FROM " + RetSqlName("ZEE") + "  "
cQuery += " WHERE D_E_L_E_T_ <> '*' "
cQuery += " AND ZEE_DOC_IN = '"+ _cDocu +"' "
cQuery += " AND ZEE_FILIAL = '"+ xFilial("ZEE") +"' "

If Select("QUEZESEQ") > 0
	QUEZESEQ->(dbCloseArea())
EndIf

dbUseArea( .t.,'TOPCONN', TcGenQry( ,, cQuery ), 'QUEZESEQ',.F., .T. )

QUEZESEQ->(DbGotop())

If QUEZESEQ->(!EOF())
	cSequen := QUEZESEQ->ZEE_SEQUEN + 1
Else
	cSequen := 1
Endif   

QUEZESEQ->(dbCloseArea())

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณVerifica se a programacao esta Iniciada.ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

cQuery := " SELECT * FROM " + RetSqlName("ZEE") + " WITH(NOLOCK)	 "
cQuery += " WHERE D_E_L_E_T_ <> '*' "
cQuery += " AND ZEE_HRFIM = '' "
cQuery += " AND RTRIM(ZEE_MOTPRD) IN ('22','26','TFB','CF') "
cQuery += " AND ZEE_DOC_IN = '"+ _cDocu +"' "
cQuery += " AND ZEE_FILIAL = '"+ xFilial("ZEE") +"' "

If Select("QUESZEE") > 0
	QUESZEE->(dbCloseArea())
EndIf

dbUseArea( .t.,'TOPCONN', TcGenQry( ,, cQuery ), 'QUESZEE',.F., .T. )

QUESZEE->(DbGotop())

If QUESZEE->(!EOF())
	
	//ฺฤฤฤฤฤฤฤฤฤฤฟ
	//ณTabela ZEE Encerra Paradaณ
	//ภฤฤฤฤฤฤฤฤฤฤู
	cHora 	 := Substr(Time(),1,5)
	cDataFim := Date() 
	       
	//ฺฤฤฤฤฤฤฤฤฤฤฟ
	//ณLimpa Status
	//ภฤฤฤฤฤฤฤฤฤฤู   
	dbSelectArea("ZPP")
	ZPP->(dBsetOrder(4))
	If ZPP->(dBseek(xFilial("ZPP") + _cDocu ))
		While !ZPP->(EOF()) .And. ZPP->ZPP_FILIAL + ZPP->ZPP_DOC_IN == xFilial("ZPP") + _cDocu
			If Reclock( "ZPP" , .F. )
				
				ZPP->ZPP_STATUS  :=  "" //Limpa a Programa็ใo
				ZPP->ZPP_LOGENC  := cUserName
				
				ZPP->(MsUnlock())
			Endif
			ZPP->(dbSkip())
		Enddo
	Endif 
	
	//Posiciona Novamente na Tabela ZPP
	DbSelectArea("ZPP")
	ZPP->(dBsetOrder(4))
	ZPP->(dBseek(xFilial("ZPP") + _cDocu))
	
	cQuery :=  ""
	cQuery += "	UPDATE " + RetSqlName("ZEE") + "   SET ZEE_DTFIM  = '"+ Dtos(cDataFim)  +"' , ZEE_HRFIM = '"+ cHora +"' , ZEE_LOGINC = '"+ cUserName +"'  " + CRLF
	cQuery += "	WHERE D_E_L_E_T_ <> '*' " 				  + CRLF
	cQuery += "	AND ZEE_HRFIM = '' " 					  + CRLF
	cQuery += "	AND ZEE_DOC_IN = '"+ _cDocu +"' " 		  + CRLF
	cQuery += "	AND ZEE_FILIAL = '"+ xFilial("ZEE") +"' " + CRLF
	
	If TCSQLExec(cQuery) < 0
		cErro := TCSQLERROR()
		MsgInfo(cErro)
	Endif
	
	dDataPr := Date()
	
	If Time()  < "05:55"  //Terceiro Turno
		dDataPr := Date() - 1
	Endif
	
	If Reclock( "ZEE" , .T. )
		
		ZEE->ZEE_FILIAL  := xFilial("ZEE") 	//Filial
		ZEE->ZEE_DOC_IN  := _cDocu         	//Doc. Programacao
		ZEE->ZEE_DTINIC  := Date()        	//Data
		ZEE->ZEE_HRINIC  := Time()         	//Hora
		ZEE->ZEE_CELULA  := cCelula        	//Celula
		ZEE->ZEE_SEQUEN  := cSequen        	//Sequencia
		ZEE->ZEE_LOGINC  := cUserName      	//Nome
		ZEE->ZEE_RECURS	 := ZPP->ZPP_MAQUIN	//Recurso
		ZEE->ZEE_TPAPON  := "A"            	//P-Producao Inicia/A-Automatico Sistema
		ZEE->ZEE_MOTPRD  := "76"            //Para de inicio da OS
		ZEE->ZEE_DESCMO  := "AGUARDANDO REINICIO DE PRODUCAO"  //Descri็ใo       
		ZEE->ZEE_INDTPR  := dDataPr        //Data Producao
		
		ZEE->(MsUnlock())
		
	Endif
	
	//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
	//ณGrava a parada automaticamente no encerramento da Produ็ใoณ
	//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
	u_INGERPSH6(_cDocu)

Endif 

Return   



