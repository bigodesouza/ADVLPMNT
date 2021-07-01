#Include "Topconn.ch"
#Include "Protheus.ch"

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³INGMN01   ºAutor  ³Adriano Luis Brandaoº Data ³  26/01/08   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³Funcao utilizada no gatilho do campo TJ_CODBEM, para verifi º±±
±±º          ³car se existe Ordem de servico em aberto para o mesmo bem.  º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ AP - PARANOA                                               º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
User Function INGMN01(_cRet)

Local _aArea	:= GetArea()
Local _aAreaTJ 	:= STJ->(GetArea())

_cQuery := "SELECT TJ.R_E_C_N_O_ "
_cQuery += "FROM " + RetSqlName("STJ") + " TJ WITH(NOLOCK) "
_cQuery += "WHERE TJ_FILIAL = '" + xFilial("STJ") + "' "
_cQuery += "      AND TJ_CODBEM = '" + M->TJ_CODBEM + "' "
_cQuery += "      AND TJ_TERMINO = 'N' "
_cQuery += "      AND TJ_SITUACA <> 'C' "
_cQuery += "      AND D_E_L_E_T_ = ' ' "

TcQuery _cQuery New Alias "QR1"
//
// Se existir ordem de servico em aberto do bem digitado chama a tela de visualizacao.
//
If ! Empty(QR1->R_E_C_N_O_)
	fVisual()
EndIf

QR1->(DbCloseArea())                              

RestArea(_aAreaTJ)
RestArea(_aArea)

Return(_cRet)


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³fVisual	ºAutor  ³Adriano Luis Brandaoº Data ³  26/01/08   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³Funcao para visualizacao da Ordem em aberto.                º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ AP - PARANOA.                                              º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function fVisual()

Local oDlgGet2                
Local _cOrdem
Local _cBem
Local _cObs
Local _dDtOri 
Local oMemo

ApMsgStop("Ja existe Ordem de servico em aberto para este bem !!!!","AVISO")

STJ->(DbGoTo(QR1->R_E_C_N_O_))

_cOrdem	:= STJ->TJ_ORDEM
_cBem	:= STJ->TJ_CODBEM
_cObs	:= STJ->TJ_OBSERVA
_dDtOri	:= STJ->TJ_DTORIGI


Define MSDialog oDlgGet2 Title "Ordem Servico em aberto" From  100,100 To 500,650 Pixel 

@ 15, 05 Say "Ordem de Servico" of oDlgGet2 Pixel
@ 15, 50 MSGet _cOrdem  Size 050, 08 Of oDlgGet2 Pixel when .f.
@ 30, 05 Say "Bem " of oDlgGet2 Pixel
@ 30, 50 MsGet _cBem  Size 050,08 of oDlgGet2 Pixel when .f.
@ 30,140 Say "Data" of oDlgGet2 Pixel
@ 30,170 MsGet _dDtOri Size 050,08 of oDlgGet2 Pixel when .f.
@ 45, 05 Say "Observacao" of oDlgGet2 Pixel
@ 45, 50 Get oMemo var _cObs Memo Size 200,100 of oDlgGet2 Pixel
  
Define SButton From 160, 210 Type 2 Action oDlgGet2:End() Enable OF oDlgGet2 

Activate MSDialog oDlgGet2 Centered

Return
