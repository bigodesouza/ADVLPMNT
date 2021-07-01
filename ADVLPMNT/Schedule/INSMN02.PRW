#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "TBICODE.CH"
#INCLUDE "AP5MAIL.CH"
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณINSMT03   บAutor  ณBruno E. de Souza   บ Data ณ  07/11/2019 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณAtualiza validade e revisao do bem cadastrado de acordo com บฑฑ
ฑฑบ          ณa data da ultima OS preventiva realizada. "por schedule"    บฑฑ
ฑฑบ          ณtabela ZZN Rotina INAMN06                                   บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/ 
/*User Function INSMN02()//INATIVO, ENVIADO PARA INSMN03

WfPrepEnv('01','01',,,'EST')

RodaSche() 

Return()   */
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRodaSche  บAutor  ณBruno E. de Souza   บ Data ณ  07/11/2019 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
/*Static Function RodaSche()

Local cQry 		:= ""
Local dDataatu  := ""

cQry	:= "SELECT											"+ CRLF
cQry	+= "MAX(TJ_CODBEM) TJ_CODBEM,						"+ CRLF
cQry	+= "MAX(TJ_ORDEM) TJ_ORDEM,							"+ CRLF
cQry	+= "MAX(TJ_DTMRFIM) TJ_DTMRFIM,						"+ CRLF
cQry	+= "ZZN_FREQ										"+ CRLF
cQry	+= "FROM											"+ CRLF
cQry	+= ""+RetSQLName("STJ")+" STJ WITH(NOLOCK)			"+ CRLF
cQry	+= "JOIN											"+ CRLF
cQry	+= ""+RetSQLName("ZZN")+" ZZN WITH(NOLOCK)			"+ CRLF
cQry	+= "ON												"+ CRLF
cQry	+= "TJ_FILIAL = ZZN_FILIAL							"+ CRLF
cQry	+= "AND												"+ CRLF
cQry	+= "TJ_CODBEM = ZZN_EQUIP							"+ CRLF
cQry	+= "AND												"+ CRLF
cQry	+= "ZZN_STATUS = 'A'								"+ CRLF
cQry	+= "AND												"+ CRLF
cQry	+= "ZZN.D_E_L_E_T_<>'*'								"+ CRLF
cQry 	+= "AND 					    	   				"+ CRLF
cQry 	+= "ZZN_FILIAL = '"+xfilial("ZZN")+"' 				"+ CRLF
cQry 	+= "AND 					    	   				"+ CRLF
cQry 	+= "TJ_FILIAL = '"+xfilial("STJ")+"' 				"+ CRLF
cQry	+= "WHERE											"+ CRLF
cQry	+= "STJ.D_E_L_E_T_<>'*'								"+ CRLF
cQry	+= "AND												"+ CRLF
cQry	+= "TJ_TIPMNT = '2'									"+ CRLF
cQry	+= "AND												"+ CRLF
cQry	+= "TJ_SITUACA <> 'C'								"+ CRLF
cQry	+= "AND												"+ CRLF
cQry	+= "TJ_DTMRFIM<>''									"+ CRLF
cQry	+= "GROUP BY										"+ CRLF
cQry	+= "TJ_CODBEM,										"+ CRLF
cQry	+= "ZZN_FREQ										"+ CRLF

If Select("TEMP") > 0
	TEMP->(dbCloseArea())
EndIf

TcQuery cQry New Alias "TEMP"

TEMP->(dbGoTop())
/////Considera por mes a pedido MNT 12/11/2020
While TEMP->(!EOF())

	dbSelectArea("ZZN")
	ZZN->(dbSetOrder(1))
	ZZN->(dbSeek(xFilial("ZZN")+ALLTRIM(TEMP->TJ_CODBEM)))
	
	If ZZN->ZZN_FREQ == 'M'
		dDataatu := MonthSum(STOD(TEMP->TJ_DTMRFIM),1)
		If SUBSTR(DTOS(dDataatu),1,6) > SUBSTR(DTOS(ZZN_VAL),1,6)
			RECLOCK("ZZN", .F.)
			ZZN->ZZN_REV := SOMA1(ZZN->ZZN_REV)
		   	ZZN->ZZN_OSREAL += 1
			MSUNLOCK()
		EndIf
	ElseIf ZZN->ZZN_FREQ == 'B'
		dDataatu := MonthSum(STOD(TEMP->TJ_DTMRFIM),2)
		If SUBSTR(DTOS(dDataatu),1,6) > SUBSTR(DTOS(ZZN_VAL),1,6)
			RECLOCK("ZZN", .F.)
			ZZN->ZZN_REV := SOMA1(ZZN->ZZN_REV)  
			ZZN->ZZN_OSREAL += 1
			MSUNLOCK()
		EndIf
	ElseIf ZZN->ZZN_FREQ == 'S'
		dDataatu := MonthSum(STOD(TEMP->TJ_DTMRFIM),6)
		If SUBSTR(DTOS(dDataatu),1,6) > SUBSTR(DTOS(ZZN_VAL),1,6)
			RECLOCK("ZZN", .F.)
			ZZN->ZZN_REV := SOMA1(ZZN->ZZN_REV) 
			ZZN->ZZN_OSREAL += 1
			MSUNLOCK()
		EndIf
	ElseIf ZZN->ZZN_FREQ == 'Q'
		dDataatu := DaySum(STOD(TEMP->TJ_DTMRFIM),15)
		If dDataatu > ZZN_VAL
			RECLOCK("ZZN", .F.)
			ZZN->ZZN_REV := SOMA1(ZZN->ZZN_REV)
			ZZN->ZZN_OSREAL += 1
			MSUNLOCK()
		EndIf
	ElseIf ZZN->ZZN_FREQ == 'T'
		dDataatu := MonthSum(STOD(TEMP->TJ_DTMRFIM),3)
		If SUBSTR(DTOS(dDataatu),1,6) > SUBSTR(DTOS(ZZN_VAL),1,6)
			RECLOCK("ZZN", .F.)
			ZZN->ZZN_REV := SOMA1(ZZN->ZZN_REV)
			ZZN->ZZN_OSREAL += 1
			MSUNLOCK()
		EndIf
	ElseIf ZZN->ZZN_FREQ == 'D'
		dDataatu := MonthSum(STOD(TEMP->TJ_DTMRFIM),4)
		If SUBSTR(DTOS(dDataatu),1,6) > SUBSTR(DTOS(ZZN_VAL),1,6)
			RECLOCK("ZZN", .F.)
			ZZN->ZZN_REV := SOMA1(ZZN->ZZN_REV)
			ZZN->ZZN_OSREAL += 1
			MSUNLOCK()
		EndIf
	ElseIf ZZN->ZZN_FREQ == 'A'
		dDataatu := MonthSum(STOD(TEMP->TJ_DTMRFIM),12)
		If SUBSTR(DTOS(dDataatu),1,6) > SUBSTR(DTOS(ZZN_VAL),1,6)
			RECLOCK("ZZN", .F.)
			ZZN->ZZN_REV := SOMA1(ZZN->ZZN_REV)
			ZZN->ZZN_OSREAL += 1
			MSUNLOCK()
		EndIf
	ElseIf ZZN->ZZN_FREQ == 'P'
		dDataatu := STOD(TEMP->TJ_DTMRFIM)
		If dDataatu > ZZN_VAL
			RECLOCK("ZZN", .F.)
			ZZN->ZZN_REV := SOMA1(ZZN->ZZN_REV)
			ZZN->ZZN_OSREAL += 1
			MSUNLOCK()
		EndIf 
	ElseIf ZZN->ZZN_FREQ == 'E'
		dDataatu := MonthSum(STOD(TEMP->TJ_DTMRFIM),24)
		If SUBSTR(DTOS(dDataatu),1,6) > SUBSTR(DTOS(ZZN_VAL),1,6)
			RECLOCK("ZZN", .F.)
			ZZN->ZZN_REV := SOMA1(ZZN->ZZN_REV)  
			ZZN->ZZN_OSREAL += 1
			MSUNLOCK()
		EndIf
	EndIf  
	If SUBSTR(DTOS(dDataatu),1,6) > SUBSTR(DTOS(ZZN_VAL),1,6) .AND. ZZN->ZZN_FREQ <> 'N' //nao altera data de validade frequencia manual
		RECLOCK("ZZN", .F.)
		cUltDIa  := SUBSTR(DTOS(LastDay(dDataatu)),7,2)
		dDataatu := DTOS(dDataatu)  
		dDataatu := SUBSTR(dDataatu,1,6)+cUltDIa
		ZZN->ZZN_VAL := STOD(dDataatu) 
		MSUNLOCK() 
	EndIf*/

	
	/////antigo contagem por dia/////
	/*dbSelectArea("ZZN")
	ZZN->(dbSetOrder(1))
	ZZN->(dbSeek(xFilial("ZZN")+ALLTRIM(TEMP->TJ_CODBEM)))
	
	If ZZN->ZZN_FREQ == 'M'
		dDataatu := DaySum(STOD(TEMP->TJ_DTMRFIM),30)
		If dDataatu > ZZN_VAL
			RECLOCK("ZZN", .F.)
			ZZN->ZZN_REV := SOMA1(ZZN->ZZN_REV)
		   	ZZN->ZZN_OSREAL += 1
			MSUNLOCK()
		EndIf
	ElseIf ZZN->ZZN_FREQ == 'B'
		dDataatu := DaySum(STOD(TEMP->TJ_DTMRFIM),60)
		If dDataatu > ZZN_VAL
			RECLOCK("ZZN", .F.)
			ZZN->ZZN_REV := SOMA1(ZZN->ZZN_REV)  
			ZZN->ZZN_OSREAL += 1
			MSUNLOCK()
		EndIf
	ElseIf ZZN->ZZN_FREQ == 'S'
		dDataatu := DaySum(STOD(TEMP->TJ_DTMRFIM),180)
		If dDataatu > ZZN_VAL
			RECLOCK("ZZN", .F.)
			ZZN->ZZN_REV := SOMA1(ZZN->ZZN_REV) 
			ZZN->ZZN_OSREAL += 1
			MSUNLOCK()
		EndIf
	ElseIf ZZN->ZZN_FREQ == 'Q'
		dDataatu := DaySum(STOD(TEMP->TJ_DTMRFIM),15)
		If dDataatu > ZZN_VAL
			RECLOCK("ZZN", .F.)
			ZZN->ZZN_REV := SOMA1(ZZN->ZZN_REV)
			ZZN->ZZN_OSREAL += 1
			MSUNLOCK()
		EndIf
	ElseIf ZZN->ZZN_FREQ == 'T'
		dDataatu := DaySum(STOD(TEMP->TJ_DTMRFIM),90)
		If dDataatu > ZZN_VAL
			RECLOCK("ZZN", .F.)
			ZZN->ZZN_REV := SOMA1(ZZN->ZZN_REV)
			ZZN->ZZN_OSREAL += 1
			MSUNLOCK()
		EndIf
	ElseIf ZZN->ZZN_FREQ == 'D'
		dDataatu := DaySum(STOD(TEMP->TJ_DTMRFIM),120)
		If dDataatu > ZZN_VAL
			RECLOCK("ZZN", .F.)
			ZZN->ZZN_REV := SOMA1(ZZN->ZZN_REV)
			ZZN->ZZN_OSREAL += 1
			MSUNLOCK()
		EndIf
	ElseIf ZZN->ZZN_FREQ == 'A'
		dDataatu := DaySum(STOD(TEMP->TJ_DTMRFIM),365)
		If dDataatu > ZZN_VAL
			RECLOCK("ZZN", .F.)
			ZZN->ZZN_REV := SOMA1(ZZN->ZZN_REV)
			ZZN->ZZN_OSREAL += 1
			MSUNLOCK()
		EndIf
	ElseIf ZZN->ZZN_FREQ == 'P'
		dDataatu := STOD(TEMP->TJ_DTMRFIM)
		If dDataatu > ZZN_VAL
			RECLOCK("ZZN", .F.)
			ZZN->ZZN_REV := SOMA1(ZZN->ZZN_REV)
			ZZN->ZZN_OSREAL += 1
			MSUNLOCK()
		EndIf 
	ElseIf ZZN->ZZN_FREQ == 'E'
		dDataatu := DaySum(STOD(TEMP->TJ_DTMRFIM),730)
		If dDataatu > ZZN_VAL
			RECLOCK("ZZN", .F.)
			ZZN->ZZN_REV := SOMA1(ZZN->ZZN_REV)  
			ZZN->ZZN_OSREAL += 1
			MSUNLOCK()
		EndIf
	EndIf  
	If dDataatu > ZZN_VAL .AND. ZZN->ZZN_FREQ <> 'N' //nao altera data de validade frequencia manual
		RECLOCK("ZZN", .F.)
		ZZN->ZZN_VAL := dDataatu //BRUNO
		MSUNLOCK() 
	EndIf*/
	
/*	TEMP->(dbSkip())
EndDo
TEMP->(dbCloseArea())
Return()*/
