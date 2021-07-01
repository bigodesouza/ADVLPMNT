#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "TBICODE.CH"
#INCLUDE "AP5MAIL.CH"
#include "RWMAKE.CH" 
#INCLUDE "TbiConn.ch"
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณINSMN03   บAutor  ณBruno E. de Souza   บ Data ณ  12/04/2021 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณNotifica็ใo de Vencimento da Validade de Preventiva         บฑฑ
ฑฑบ          ณdo Equipamento                                              บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP substitui insmn01 e insmn02                             บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function INSMN03()

WfPrepEnv('01','01',,,'EST')

RodaSche()

Return()
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRodaSche  บAutor  ณMicrosiga           บ Data ณ  12/04/2021 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณNotifica็ใo de Vencimento da Validade de Preventiva         บฑฑ
ฑฑบ          ณdo Equipamento                                              บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function RodaSche()

Local dDatadia      := AnoMes(Ddatabase)
Local _lRet   		:= .T.
Local _nCor  		:= 0
Local cCrtl         := 0
Local cCrtlA        := 0
Local _nYZ			:= 0
Local Ddatasoma     := 0
Local _cEmail		:= AllTrim(GETMV("IN_MAILPR2")) //SO MNT RECEBE
Local _cEmailB      := AllTrim(GETMV("IN_MAILPRT")) //SO PCP
Local _cEmailC      := AllTrim(GETMV("IN_MAILPCP")) //TODOS RECEBEM
Local _cEmailD	    := AllTrim(GETMV("IN_MAIPCP2")) //SO PCP2
Local dDataatu  	:= ""
Local Ddatadev      := ""
Local cQry 			:= ""
Local cQuery 		:= ""
Local cQueryA 		:= ""
Local cQueryB 		:= ""
Local cEquip        := ""
Local cNewData      := ""
Private cCodBem     := ""
Private oProcess    := NIL
Private oProcess2   := NIL
Private oProcess3   := NIL
Private oProcess4   := NIL
Private oProcess5   := NIL

////////////////// INSMN02 CALCULA VALIDADE/////////////////////////////
///acompanhar para depois desativar INSMN02 DO SCHEDULE//////////
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
		ZZN->ZZN_DTNECE := STOD("  /  /  ")
		MSUNLOCK() 
	EndIf

	TEMP->(dbSkip())
EndDo
TEMP->(dbCloseArea())
//Return()

////////////////// FIM INSMN02 CALCULA VALIDADE/////////////////////////////

cQuery := "SELECT																					" +CRLF
cQuery += "ZZN_EQUIP,																				" +CRLF
cQuery += "ZZN_DESCR,																				" +CRLF
cQuery += "ZZN_LOCAL,																				" +CRLF
cQuery += "SUBSTRING(ZZN_VAL,7,2)+'/'+SUBSTRING(ZZN_VAL,5,2)+'/'+SUBSTRING(ZZN_VAL,1,4) AS 'VALD',	" +CRLF
cQuery += "ZZN_DIASNC ,																				" +CRLF
cQuery += "ZZN_DTNECE,																				" +CRLF
cQuery += "ZZN_OPCPGR																				" +CRLF
cQuery += "FROM																						" +CRLF
cQuery += ""+RetSqlName("ZZN")+" ZZN WITH(NOLOCK)													" +CRLF
cQuery += "WHERE																					" +CRLF
cQuery += "D_E_L_E_T_<>'*'																			" +CRLF
cQuery += "AND																						" +CRLF
cQuery += "ZZN_FILIAL = '" + xFilial("ZZN") + "'													" +CRLF
cQuery += "AND																						" +CRLF
cQuery += "ZZN_STATUS <> 'I'																		" +CRLF
cQuery += "ORDER BY																					" +CRLF
cQuery += "ZZN_VAL																					" +CRLF

If Select("TRB") > 0
	dbSelectArea("TRB")
	TRB->(DbCloseArea())
EndIf

TCQUERY cQuery NEW ALIAS "TRB"

dbSelectArea("TRB")
TRB->(dbGoTop())

	//EQUIPAMENTO MNT
    oProcess:= TWFProcess():New("APROVSC","***Workflow para Notifica็ใo de Vencimento da Validade de Preventiva do Equipamento MNT***")
	oProcess:NewTask("WORKFLOW PARA Vencimento da Validade de Preventiva do Equipamento","\WORKFLOW\MNTVALIDADE\INSMN03MNT.HTML")

	//informativo MNT
	oProcess2:= TWFProcess():New("APROVSC","***Workflow para Notifica็ใo de Vencimento da Validade de Preventiva do Equipamento MNT informativo ***")
	oProcess2:NewTask("WORKFLOW PARA Vencimento da Validade de Preventiva do Equipamento","\WORKFLOW\MNTVALIDADE\INSMN03MNTINFO.HTML")
	
	//EQUIPAMENTO PCP
	oProcess3:= TWFProcess():New("APROVSC","***Workflow para Notifica็ใo de Vencimento da Validade de Preventiva do Equipamento PCP ***")
	oProcess3:NewTask("WORKFLOW PARA Vencimento da Validade de Preventiva do Equipamento","\WORKFLOW\MNTVALIDADE\INSMN03PCP.HTML")

	//informativo PCP
	oProcess4:= TWFProcess():New("APROVSC","***Workflow para Notifica็ใo de Vencimento da Validade de Preventiva do Equipamento PCP informativo ***")
	oProcess4:NewTask("WORKFLOW PARA Vencimento da Validade de Preventiva do Equipamento","\WORKFLOW\MNTVALIDADE\INSMN03PCPINFO.HTML")

	//EQUIPAMENTO PCP2
	oProcess5:= TWFProcess():New("APROVSC","***Workflow para Notifica็ใo de Vencimento da Validade de Preventiva do Equipamento PCP ***")
	oProcess5:NewTask("WORKFLOW PARA Vencimento da Validade de Preventiva do Equipamento","\WORKFLOW\MNTVALIDADE\INSMN03PCP2.HTML")

While TRB->(!EOF())
	
	dbSelectArea("ZZN")
	ZZN->(dbSetOrder(1))
	ZZN->(dbSeek(xFilial("ZZN")+TRB->ZZN_EQUIP))
	
	Ddataval:= MonthSub( CTOD(TRB->VALD) , 3 )  //Data de validade menos 1 mes para mandar workflow antecipado de vencimento validade
	
	If SUBSTR(DTOS(Ddataval),1,6) <= dDatadia
		
		_lret := .T.
		
		cEquip := ""
		cCodBem := TRB->ZZN_EQUIP
		 //ja valida equipamento vencido  //verifica OS em aberto se nao, abre OS para equipamento vencido 
		If  SUBSTR(DTOS(CTOD(TRB->VALD)),1,6) < dDatadia

			cQueryB :=	"SELECT 								" +CRLF
			cQueryB += "TJ_ORDEM								" +CRLF
			cQueryB += "FROM                                    " +CRLF
			cQueryB += ""+RetSqlName("STJ")+" STJ WITH(NOLOCK)	" +CRLF
			cQueryB += "WHERE									" +CRLF
			cQueryB += "D_E_L_E_T_<>'*'							" +CRLF
			cQueryB += "AND										" +CRLF
			cQueryB += "TJ_FILIAL = '" + xFilial("ZZN") + "'	" +CRLF
			cQueryB += "AND										" +CRLF
			cQueryB += "TJ_CODBEM = '" + TRB->ZZN_EQUIP +  "'	" +CRLF
			cQueryB += "AND										" +CRLF
			cQueryB += "TJ_SITUACA <> 'C' 						" +CRLF
			cQueryB += "AND										" +CRLF
			cQueryB += "TJ_TIPMNT = '2'							" +CRLF
			cQueryB += "AND  									" +CRLF
			cQueryB += "TJ_DTMRFIM = ''							" +CRLF
			
			If Select("TRB3") > 0
				dbSelectArea("TRB3")
				TRB3->(DbCloseArea())
			EndIf
			
			TCQUERY cQueryB NEW ALIAS "TRB3"
			
			dbSelectArea("TRB3")
			TRB3->(dbGoTop())
			
			While TRB3->(!EOF())
				
				_lret := .F.
				
		   		TRB3->(dbSkip())
			EndDo
			TRB3->(dbCloseArea())
				
				If _lret == .T.
				   Processa({|| INGORDMNT(cCodBem) },"Gravando Ordem de Servico...")
				EndIf
			
		EndIf
	
		cQueryA :=	"SELECT 								" +CRLF
		cQueryA += "TJ_ORDEM								" +CRLF
		cQueryA += "FROM                                    " +CRLF
		cQueryA += ""+RetSqlName("STJ")+" STJ WITH(NOLOCK)	" +CRLF
		cQueryA += "WHERE									" +CRLF
		cQueryA += "D_E_L_E_T_<>'*'							" +CRLF
		cQueryA += "AND										" +CRLF
		cQueryA += "TJ_FILIAL = '" + xFilial("ZZN") + "'	" +CRLF     //PEGA OS em aberto
		cQueryA += "AND										" +CRLF
		cQueryA += "TJ_CODBEM = '" + TRB->ZZN_EQUIP +  "'	" +CRLF
		cQueryA += "AND										" +CRLF
		cQueryA += "TJ_SITUACA <> 'C' 						" +CRLF
		cQueryA += "AND										" +CRLF
		cQueryA += "TJ_TIPMNT = '2'							" +CRLF
		cQueryA += "AND  									" +CRLF
		cQueryA += "TJ_DTMRFIM = ''							" +CRLF
		
		If Select("TRB2") > 0
			dbSelectArea("TRB2")
			TRB2->(DbCloseArea())
		EndIf
		
		TCQUERY cQueryA NEW ALIAS "TRB2"
		
		dbSelectArea("TRB2")
		TRB2->(dbGoTop())
		
		While TRB2->(!EOF())
			
			cEquip += TRB2->TJ_ORDEM+"/"
			
			TRB2->(dbSkip())
			
		EndDo
		TRB2->(dbCloseArea())

		 If TRB->ZZN_DIASNC > 0 //Tratativa para data devolu็ao nao cair no final de semana
				Ddatadev := STOD(TRB->ZZN_DTNECE)
			For _nYZ := 1 to TRB->ZZN_DIASNC
				Ddatadev:= DaySum(Ddatadev,1)
				Ddatasoma:= DOW(Ddatadev) 
				If Ddatasoma == 7 .or. Ddatasoma == 1 
			 	   Ddatadev:=  DaySum(Ddatadev,1)
				   _nYZ -= 1
				EndIf
			Next _nYZ 
		   Else
			  Ddatadev := STOD("  /  /  ")
		 EndIf

		Ddatavalid:= SUBSTR(DTOS(CTOD(TRB->VALD)),1,6)
		
		  //joga linha de instrumento com validade a vencer
		If SUBSTR(DTOS(CTOD(TRB->VALD)),1,6)+"01" > dDatadia+"01"
			
			 //quantidade dias a vencer
		   cNewData := SUBSTR(DTOS(CTOD(TRB->VALD)),1,6)+"01"
		   dDatadia := dDatadia+"01"
		   Ddatavenc := STOD(cNewData) - STOD(dDatadia)
		   Ddatavenc := Cvaltochar(Ddatavenc)

			_nCor++
		   If TRB->ZZN_OPCPGR == "1" //EQUIPAMENTOS DA MNT a vencer
		    aadd((oProcess:oHTML:ValByName("it.cor"		)),IIF(_nCor%2 == 0,"#CCDAEA","#FFFFFF")			) //mnt  
	   	    aadd((oProcess:oHTML:ValByName("it.bem"		)),TRB->ZZN_EQUIP 			   						)
	    	aadd((oProcess:oHTML:ValByName("it.desceq"	)),TRB->ZZN_DESCR             						)
	   	    aadd((oProcess:oHTML:ValByName("it.localiz"	)),TRB->ZZN_LOCAL          	   						)
	   	    aadd((oProcess:oHTML:ValByName("it.dtval"	)),substr(Ddatavalid,5,2)+"/"+substr(Ddatavalid,1,4))
	   	    aadd((oProcess:oHTML:ValByName("it.diasven"	)), Ddatavenc +' dias ate o vencimento' 			)
		    aadd((oProcess:oHTML:ValByName("it.osaberto")),cEquip           		   						)   
			aadd((oProcess:oHTML:ValByName("it.diasn"	)),TRB->ZZN_DIASNC           		   				) 
			aadd((oProcess:oHTML:ValByName("it.diaatu"	)),STOD(TRB->ZZN_DTNECE)       		   				)
			aadd((oProcess:oHTML:ValByName("it.dtn"		)),""          		   								) 
			aadd((oProcess:oHTML:ValByName("it.dtdev"	)), Ddatadev										)
		   Elseif TRB->ZZN_OPCPGR == "2" //EQUIPAMENTOS DO PCP
		    cCrtl := 1 //controle para nao enviar WF em branco
		    aadd((oProcess3:oHTML:ValByName("it.cor"	 )),IIF(_nCor%2 == 0,"#CCDAEA","#FFFFFF")			 )  //pcp
	   	    aadd((oProcess3:oHTML:ValByName("it.bem"	 )),TRB->ZZN_EQUIP 			   						 )
	    	aadd((oProcess3:oHTML:ValByName("it.desceq"	 )),TRB->ZZN_DESCR             						 )
	   	    aadd((oProcess3:oHTML:ValByName("it.localiz" )),TRB->ZZN_LOCAL          	   					 )
	   	    aadd((oProcess3:oHTML:ValByName("it.dtval"	 )),substr(Ddatavalid,5,2)+"/"+substr(Ddatavalid,1,4))
	   	    aadd((oProcess3:oHTML:ValByName("it.diasven" )), Ddatavenc +' dias ate o vencimento' 			 )
		    aadd((oProcess3:oHTML:ValByName("it.osaberto")),cEquip           		   						 )   
			aadd((oProcess3:oHTML:ValByName("it.diasn"	 )),TRB->ZZN_DIASNC           		   				 ) 
			aadd((oProcess3:oHTML:ValByName("it.diaatu"	 )),STOD(TRB->ZZN_DTNECE)       		   			 )
			aadd((oProcess3:oHTML:ValByName("it.dtn"	 )),""          		   							 ) 
			aadd((oProcess3:oHTML:ValByName("it.dtdev"	 )), Ddatadev										 )
			aadd((oProcess3:oHTML:ValByName("it.diaspcp" )), "0"											 )
			
		   Elseif TRB->ZZN_OPCPGR == "3" //EQUIPAMENTOS DO PCP2
		    cCrtlA := 1
		   //INFORMATIVO PCP2
			aadd((oProcess5:oHTML:ValByName("it.cor"	 )),IIF(_nCor%2 == 0,"#CCDAEA","#FFFFFF")			 )  //pcp2
	   	    aadd((oProcess5:oHTML:ValByName("it.bem"	 )),TRB->ZZN_EQUIP 			   						 )
	    	aadd((oProcess5:oHTML:ValByName("it.desceq"	 )),TRB->ZZN_DESCR             						 )
	   	    aadd((oProcess5:oHTML:ValByName("it.localiz" )),TRB->ZZN_LOCAL          	   					 )
	   	    aadd((oProcess5:oHTML:ValByName("it.dtval"	 )),substr(Ddatavalid,5,2)+"/"+substr(Ddatavalid,1,4))
	   	    aadd((oProcess5:oHTML:ValByName("it.diasven" )), Ddatavenc +' dias ate o vencimento' 			 )
		    aadd((oProcess5:oHTML:ValByName("it.osaberto")),cEquip           		   						 )   
			aadd((oProcess5:oHTML:ValByName("it.diasn"	 )),TRB->ZZN_DIASNC           		   				 ) 
			aadd((oProcess5:oHTML:ValByName("it.diaatu"	 )),STOD(TRB->ZZN_DTNECE)       		   			 )
			aadd((oProcess5:oHTML:ValByName("it.dtn"	 )),""          		   							 ) 
			aadd((oProcess5:oHTML:ValByName("it.dtdev"	 )), Ddatadev										 )
			aadd((oProcess5:oHTML:ValByName("it.diaspcp" )), "0"											 )
		   Endif

		   If TRB->ZZN_OPCPGR == "3" .or. TRB->ZZN_OPCPGR == "2"
			//INFORMATIVO PCP2
			aadd((oProcess4:oHTML:ValByName("it.cor"	 )),IIF(_nCor%2 == 0,"#CCDAEA","#FFFFFF")			 )  
	   	    aadd((oProcess4:oHTML:ValByName("it.bem"	 )),TRB->ZZN_EQUIP 			   						 )
	    	aadd((oProcess4:oHTML:ValByName("it.desceq"	 )),TRB->ZZN_DESCR             						 )
	   	    aadd((oProcess4:oHTML:ValByName("it.localiz" )),TRB->ZZN_LOCAL          	   					 )
	   	    aadd((oProcess4:oHTML:ValByName("it.dtval"	 )),substr(Ddatavalid,5,2)+"/"+substr(Ddatavalid,1,4)) //informativo pcp
	   	    aadd((oProcess4:oHTML:ValByName("it.diasven" )), Ddatavenc +' dias ate o vencimento' 			 )
		    aadd((oProcess4:oHTML:ValByName("it.osaberto")),cEquip           		   						 )   
			aadd((oProcess4:oHTML:ValByName("it.diasn"   )),TRB->ZZN_DIASNC           		   				 ) 
			aadd((oProcess4:oHTML:ValByName("it.diaatu"	 )),STOD(TRB->ZZN_DTNECE)       		   			 )
			aadd((oProcess4:oHTML:ValByName("it.dtdev"   )), Ddatadev										 )
		   EndIf
			//TODOS OS EQUIPAMENTOS INFORMATIVO PARA MNT
			aadd((oProcess2:oHTML:ValByName("it.cor"	 )),IIF(_nCor%2 == 0,"#CCDAEA","#FFFFFF")			 )  
	   	    aadd((oProcess2:oHTML:ValByName("it.bem"	 )),TRB->ZZN_EQUIP 			   						 )
	    	aadd((oProcess2:oHTML:ValByName("it.desceq"	 )),TRB->ZZN_DESCR             						 )
	   	    aadd((oProcess2:oHTML:ValByName("it.localiz" )),TRB->ZZN_LOCAL          	   					 )
	   	    aadd((oProcess2:oHTML:ValByName("it.dtval"	 )),substr(Ddatavalid,5,2)+"/"+substr(Ddatavalid,1,4)) //informativo mnt
	   	    aadd((oProcess2:oHTML:ValByName("it.diasven" )), Ddatavenc +' dias ate o vencimento' 			 )
		    aadd((oProcess2:oHTML:ValByName("it.osaberto")),cEquip           		   						 )   
			aadd((oProcess2:oHTML:ValByName("it.diasn"   )),TRB->ZZN_DIASNC           		   				 ) 
			aadd((oProcess2:oHTML:ValByName("it.diaatu"	 )),STOD(TRB->ZZN_DTNECE)       		   			 )
			aadd((oProcess2:oHTML:ValByName("it.dtdev"   )), Ddatadev										 )
		Else
			
			cNewData  := SUBSTR(DTOS(CTOD(TRB->VALD)),1,6)+"01"
			dDatadia  := dDatadia+"01"
			Ddatavenc := STOD(cNewData) - STOD(dDatadia) //joga linha de instrumento com validade ja vencida
			Ddatavenc := Ddatavenc*-1          //positiva quantidade de dias ja vencidas para string nao sair negativo
			Ddatavenc := Cvaltochar(Ddatavenc)
			
            _nCor++
		   If TRB->ZZN_OPCPGR == "1" //EQUIPAMENTOS DA MNT VALIDADE VENCIDA
		    aadd((oProcess:oHTML:ValByName("it.cor"		)),IIF(_nCor%2 == 0,"#CCDAEA","#FFFFFF")			)  
	   	    aadd((oProcess:oHTML:ValByName("it.bem"		)),TRB->ZZN_EQUIP 			   						)//MNT
	   	    aadd((oProcess:oHTML:ValByName("it.desceq"	)),TRB->ZZN_DESCR             						)
	   	    aadd((oProcess:oHTML:ValByName("it.localiz"	)),TRB->ZZN_LOCAL          	   						)
	   	    aadd((oProcess:oHTML:ValByName("it.dtval"	)),substr(Ddatavalid,5,2)+"/"+substr(Ddatavalid,1,4))
	   	    aadd((oProcess:oHTML:ValByName("it.diasven"	)),Ddatavenc +' dias vencidos' 						)
		    aadd((oProcess:oHTML:ValByName("it.osaberto")),cEquip           		   						) 
			aadd((oProcess:oHTML:ValByName("it.diasn"	)),TRB->ZZN_DIASNC           		   				) 
			aadd((oProcess:oHTML:ValByName("it.diaatu"	)),STOD(TRB->ZZN_DTNECE)            		   		)
			aadd((oProcess:oHTML:ValByName("it.dtn"		)),""           		   							) 
			aadd((oProcess:oHTML:ValByName("it.dtdev"	)), Ddatadev										)  
		   Elseif TRB->ZZN_OPCPGR == "2" //EQUIPAMENTOS DA PCP
		    cCrtl := 1
			aadd((oProcess3:oHTML:ValByName("it.cor"	 )),IIF(_nCor%2 == 0,"#CCDAEA","#FFFFFF")			 )  
	   	    aadd((oProcess3:oHTML:ValByName("it.bem"	 )),TRB->ZZN_EQUIP 			   						 )//pcp
	   	    aadd((oProcess3:oHTML:ValByName("it.desceq"	 )),TRB->ZZN_DESCR             						 )
	   	    aadd((oProcess3:oHTML:ValByName("it.localiz" )),TRB->ZZN_LOCAL          	   					 )
	   	    aadd((oProcess3:oHTML:ValByName("it.dtval"	 )),substr(Ddatavalid,5,2)+"/"+substr(Ddatavalid,1,4))
	   	    aadd((oProcess3:oHTML:ValByName("it.diasven" )),Ddatavenc +' dias vencidos' 					 )
		    aadd((oProcess3:oHTML:ValByName("it.osaberto")),cEquip           		   						 ) 
			aadd((oProcess3:oHTML:ValByName("it.diasn"	 )),TRB->ZZN_DIASNC           		   				 ) 
			aadd((oProcess3:oHTML:ValByName("it.diaatu"	 )),STOD(TRB->ZZN_DTNECE)            		   		 )
			aadd((oProcess3:oHTML:ValByName("it.dtn"	 )),""           		   							 ) 
			aadd((oProcess3:oHTML:ValByName("it.dtdev"	 )), Ddatadev										 )
			aadd((oProcess3:oHTML:ValByName("it.diaspcp" )), "0"											 )
		   Elseif TRB->ZZN_OPCPGR == "3" //EQUIPAMENTOS DA PCP
		    cCrtlA := 1
			aadd((oProcess5:oHTML:ValByName("it.cor"	 )),IIF(_nCor%2 == 0,"#CCDAEA","#FFFFFF")			 )  
	   	    aadd((oProcess5:oHTML:ValByName("it.bem"	 )),TRB->ZZN_EQUIP 			   						 )//pcp2
	   	    aadd((oProcess5:oHTML:ValByName("it.desceq"	 )),TRB->ZZN_DESCR             						 )
	   	    aadd((oProcess5:oHTML:ValByName("it.localiz" )),TRB->ZZN_LOCAL          	   					 )
	   	    aadd((oProcess5:oHTML:ValByName("it.dtval"	 )),substr(Ddatavalid,5,2)+"/"+substr(Ddatavalid,1,4))
	   	    aadd((oProcess5:oHTML:ValByName("it.diasven" )),Ddatavenc +' dias vencidos' 					 )
		    aadd((oProcess5:oHTML:ValByName("it.osaberto")),cEquip           		   						 ) 
			aadd((oProcess5:oHTML:ValByName("it.diasn"	 )),TRB->ZZN_DIASNC           		   				 ) 
			aadd((oProcess5:oHTML:ValByName("it.diaatu"	 )),STOD(TRB->ZZN_DTNECE)            		   		 )
			aadd((oProcess5:oHTML:ValByName("it.dtn"	 )),""           		   							 ) 
			aadd((oProcess5:oHTML:ValByName("it.dtdev"	 )), Ddatadev										 )
			aadd((oProcess5:oHTML:ValByName("it.diaspcp" )), "0"											 )
		   EndIf

		   If TRB->ZZN_OPCPGR == "3" .or. TRB->ZZN_OPCPGR == "2"	
			//INFORMATIVO PCP
			aadd((oProcess4:oHTML:ValByName("it.cor"	 )),IIF(_nCor%2 == 0,"#CCDAEA","#FFFFFF")			 )  
	   	    aadd((oProcess4:oHTML:ValByName("it.bem"	 )),TRB->ZZN_EQUIP 			   						 )
	    	aadd((oProcess4:oHTML:ValByName("it.desceq"	 )),TRB->ZZN_DESCR             						 )
	   	    aadd((oProcess4:oHTML:ValByName("it.localiz" )),TRB->ZZN_LOCAL          	   				     )
	   	    aadd((oProcess4:oHTML:ValByName("it.dtval" 	 )),substr(Ddatavalid,5,2)+"/"+substr(Ddatavalid,1,4))
	   	    aadd((oProcess4:oHTML:ValByName("it.diasven" )), Ddatavenc +' dias ate o vencimento' 			 )
		    aadd((oProcess4:oHTML:ValByName("it.osaberto")),cEquip           		   						 )   
			aadd((oProcess4:oHTML:ValByName("it.diasn"	 )),TRB->ZZN_DIASNC           		   				 ) 
			aadd((oProcess4:oHTML:ValByName("it.diaatu"	 )),STOD(TRB->ZZN_DTNECE)       		   			 )
			aadd((oProcess4:oHTML:ValByName("it.dtdev"	 )), Ddatadev										 )
		   EndIf
			//TODOS OS EQUIPAMENTOS INFORMATIVO PARA MNT
			aadd((oProcess2:oHTML:ValByName("it.cor"	 )),IIF(_nCor%2 == 0,"#CCDAEA","#FFFFFF")			 )  
	   	    aadd((oProcess2:oHTML:ValByName("it.bem"	 )),TRB->ZZN_EQUIP 			   						 )
	    	aadd((oProcess2:oHTML:ValByName("it.desceq"	 )),TRB->ZZN_DESCR             						 )
	   	    aadd((oProcess2:oHTML:ValByName("it.localiz" )),TRB->ZZN_LOCAL          	   				     )
	   	    aadd((oProcess2:oHTML:ValByName("it.dtval" 	 )),substr(Ddatavalid,5,2)+"/"+substr(Ddatavalid,1,4))
	   	    aadd((oProcess2:oHTML:ValByName("it.diasven" )), Ddatavenc +' dias ate o vencimento' 			 )
		    aadd((oProcess2:oHTML:ValByName("it.osaberto")),cEquip           		   						 )   
			aadd((oProcess2:oHTML:ValByName("it.diasn"	 )),TRB->ZZN_DIASNC           		   				 ) 
			aadd((oProcess2:oHTML:ValByName("it.diaatu"	 )),STOD(TRB->ZZN_DTNECE)       		   			 )
			aadd((oProcess2:oHTML:ValByName("it.dtdev"	 )), Ddatadev										 )
	   	
		EndIf
	EndIf
	
	TRB->(dbSkip())
	
EndDo

	oProcess:cSubject 	:= 'Notifica็ใo'
	oProcess:cTo 		:= "APROVSC"
   	oProcess:bReturn  	:= "U_INSMNLKM()"
	_cMailId 			:= oProcess:Start()
	_cHtml				:= _cMailId + ".HTM"
	oProcess:NewTask("LINK","\WORKFLOW\MNTVALIDADE\INSMN03MNTLK.HTML")
	oProcess:oHTML:ValByName("cClique"	, "Clique Aqui" )
	oProcess:oHtml:ValByName("cLink"	,AllTrim("http://" + AllTrim(GetMv("ES_HTTPCOM")) + "/" + _cHtml))
	oProcess:cSubject	:= "*** Notifica็ใo de Vencimento da Validade de Preventiva do Equipamento Manuten็ใo ***"
	oProcess:cTo		:= _cEmail
	oProcess:Start()

	oProcess2:cSubject 	:= 'Notifica็ใo'
	oProcess2:cTo 		:= "APROVSC"
   	oProcess2:bReturn  	:= "U_INSMNLKM()"
	_cMailId 			:= oProcess2:Start()
	_cHtml				:= _cMailId + ".HTM"
	oProcess2:NewTask("LINK","\WORKFLOW\MNTVALIDADE\INSMN03MNTLK.HTML")
	oProcess2:oHTML:ValByName("cClique"	, "Clique Aqui" )
	oProcess2:oHtml:ValByName("cLink"	,AllTrim("http://" + AllTrim(GetMv("ES_HTTPCOM")) + "/" + _cHtml))
	oProcess2:cSubject	:= "*** Notifica็ใo de Vencimento da Validade de Preventiva do Equipamento Manuten็ใo Informativo ***"
	oProcess2:cTo		:= _cEmail
	oProcess2:Start()

  If cCrtl == 1	
	oProcess3:cSubject 	:= 'Notifica็ใo'
	oProcess3:cTo 		:= "APROVSC"
   	oProcess3:bReturn  	:= "U_INSMNLK()"
	_cMailId 			:= oProcess3:Start()
	_cHtml				:= _cMailId + ".HTM"
	oProcess3:NewTask("LINK","\WORKFLOW\MNTVALIDADE\INSMN03MNTLK.HTML")
	oProcess3:oHTML:ValByName("cClique"	, "Clique Aqui" )
	oProcess3:oHtml:ValByName("cLink"	,AllTrim("http://" + AllTrim(GetMv("ES_HTTPCOM")) + "/" + _cHtml))
	oProcess3:cSubject	:= "*** Notifica็ใo de Vencimento da Validade de Preventiva do Equipamento PCP ***"
	oProcess3:cTo		:= _cEmailB 
	oProcess3:Start()
  EndIf

  If cCrtlA == 1	
	oProcess5:cSubject 	:= 'Notifica็ใo'
	oProcess5:cTo 		:= "APROVSC"
   	oProcess5:bReturn  	:= "U_INSMNLKP()"
	_cMailId 			:= oProcess5:Start()
	_cHtml				:= _cMailId + ".HTM"
	oProcess5:NewTask("LINK","\WORKFLOW\MNTVALIDADE\INSMN03MNTLK.HTML")
	oProcess5:oHTML:ValByName("cClique"	, "Clique Aqui" )
	oProcess5:oHtml:ValByName("cLink"	,AllTrim("http://" + AllTrim(GetMv("ES_HTTPCOM")) + "/" + _cHtml))
	oProcess5:cSubject	:= "*** Notifica็ใo de Vencimento da Validade de Preventiva do Equipamento PCP ***"
	oProcess5:cTo		:= _cEmailD 
	oProcess5:Start()
  EndIf

  If cCrtl == 1	.or. cCrtlA == 1
	oProcess4:cSubject 	:= 'Notifica็ใo'
	oProcess4:cTo 		:= "APROVSC"
   	oProcess4:bReturn  	:= "U_INSMNLK()"
	_cMailId 			:= oProcess4:Start()
	_cHtml				:= _cMailId + ".HTM"
	oProcess4:NewTask("LINK","\WORKFLOW\MNTVALIDADE\INSMN03MNTLK.HTML")
	oProcess4:oHTML:ValByName("cClique"	, "Clique Aqui" )
	oProcess4:oHtml:ValByName("cLink"	,AllTrim("http://" + AllTrim(GetMv("ES_HTTPCOM")) + "/" + _cHtml))
	oProcess4:cSubject	:= "*** Notifica็ใo de Vencimento da Validade de Preventiva do Equipamento PCP Informativo ***"
	oProcess4:cTo		:= _cEmailC 
	oProcess4:Start()
  EndIf
  
Return()
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณINGORDMNT   บAutor  ณMicrosiga           บ Data ณ12/04/2021 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function INGORDMNT(cCodBem)

Local cObserva  := "PREVENTIVA GERAL ELETRICA/MECANICA/HIDRAULICA/FERRAMENTARIA"
Local cCelula   := ""

RecLock('STJ', .T.)

cNumOrd := GETSXENUM( "STJ","TJ_ORDEM" ) //Busca Ultima numeracao do Ordem de Servi็o

dbSelectArea("ST9")
ST9->(dbSetOrder(1))
ST9->(dbSeek(xFilial("ST9")+cCodBem))

dbSelectArea("SH1")
SH1->(dbSetOrder(1))
If SH1->(dbSeek(xFilial("SH1")+ST9->T9_RECFERR))
	
	dbSelectArea("SHB")
	SHB->(dbSetOrder(1))
	If SHB->(dbSeek(xFilial("SHB")+SH1->H1_CTRAB))
		cCelula := SHB->HB_COD //Cod. da CelULA
	Endif
	
Endif

STJ->TJ_FILIAL 		:= xFilial("STJ") 				//Filial
STJ->TJ_ORDEM 		:= cNumOrd                     	//Ordem de Servi็o
STJ->TJ_PLANO 		:= "000000"                    	//Plano
STJ->TJ_DTORIGI 	:= Date()                      	//Data Emisao
STJ->TJ_TIPOOS     	:= "B"                          //Tipo da OS
STJ->TJ_CODBEM     	:= cCodBem		               //Codigo do Bem
STJ->TJ_SERVICO    	:= "IPG"                      	//Tipo de Servico
STJ->TJ_TIPO       	:= "PRV"                       	//Tipo
STJ->TJ_CODAREA    	:= "P"                   		//Codigo Area
STJ->TJ_CCUSTO     	:= "2440"             			//Centro de Custo
STJ->TJ_HORACO1    	:= SubStr( Time(),1,5)        	//Hora Inicial da Inclusao
STJ->TJ_DTMPINI    	:= Date()                      	//Data inicial da Inclusao
STJ->TJ_HOMPINI    	:= SubStr( Time(),1,5)        	//Hora Inicial da Inclusao
STJ->TJ_DTMPFIM    	:= Date()						//Data Fim da Inclusao
STJ->TJ_HOMPFIM    	:= SubStr( Time(),1,5)         //Hora Fim da Inclusao
STJ->TJ_X_HOROS    	:= SubStr( Time(),1,5)         //Hora da OS
STJ->TJ_TERMINO    	:= "N"                          //Termino da OS
STJ->TJ_PRIORID    	:= "ZZZ"                        //Prioridade
STJ->TJ_SITUACA    	:= "L"                         	//Situacao
STJ->TJ_TIPMNT     	:= "2"                     		//Tipo de Manutencao
STJ->TJ_TPPARD     	:= "1"                          //Tipo Parada
STJ->TJ_USUAINI    	:= "TDI.MNT"                    	//Usuario Inicial
STJ->TJ_USUARIO    	:= "TDI.MNT"                    	//Usuario
STJ->TJ_SEQRELA    	:= "0"                          //Sequencia
STJ->TJ_TERCEIR    	:= "1"                        	//Terceiros
STJ->TJ_FATURA     	:= "2"                          //Fatura
STJ->TJ_APROPRI    	:= "2"                          //Apropriacao
STJ->TJ_OBSERVA    	:= cObserva                    	//Observacao
STJ->TJ_CENTRAB    	:= cCelula               //Centro de Trabalho
STJ->TJ_X_MAT    	:= ""              	   			//RE
STJ->TJ_X_ENTFE    	:= ""                   	//Ferramenta de Entrada
STJ->TJ_X_SAIFE    	:= ""                    //Ferramenta de Saida
STJ->TJ_X_ENTBE    	:= ""                   	//Ferramenta de Entrada
STJ->TJ_X_SAIBE    	:= ""                 //Ferramenta de Saida

STJ->(MsUnLock())

ConfirmSX8("STJ")

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณGera ordem de Producao para a OS                           ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

//dbSelectArea("ST9")
//dbSetOrder(1)
//dbSeek(xFilial("ST9")+Padr(cCodBem,19))

cCODPRO := If(FindFunction("NGProdMNT"), NGProdMNT("M")[1], GetMv("MV_PRODMNT")) //Ira verificar apenas o primeiro Produto Manutencao do parametro
cOP     := cNumOrd + "OS001"
cOP 	:= Alltrim(cOP)+Space(Len(SC1->C1_OP) - Len(Alltrim(cOP)))
GERAOP(cCODPRO, 1, cOP, Date(), Date(),If(FieldPos("T9_ALMOPER") > 0, ST9->T9_ALMOPER, Nil))

//-- Grava os Campos Especificos na OP
dbSelectArea('SC2')
RecLock('SC2', .F.)
SC2->C2_CC      := "2440"
SC2->C2_EMISSAO := MNT420DTOP(Date())
SC2->C2_STATUS  := 'U'
SC2->C2_OBS     := 'PLANO 000000'
SC2->(MsUnLock())

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณGera Tabela de INSUMO DE MAO DE OBRAณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

_cHrFim := HoraToInt(Time()) + 0.15   //Converte a Hora para Decimal
_cHrFim := IntToHora(_cHrFim)          //Converte Decimal para Hora

/*RecLock("STL",.T.)

STL->TL_FILIAL 		:= xFilial("STL") 				//Filial
STL->TL_ORDEM 		:= cNumOrd                     	//Ordem de Servi็o
STL->TL_PLANO 		:= "000000"                    	//Plano
STL->TL_SEQRELA 	:= "1"                         	//Sequencia
STL->TL_TAREFA  	:= "01"                      	//Tarefa
STL->TL_TIPOREG 	:= "M"                         	//Tipo Registro
STL->TL_CODIGO  	:= ""         		   			 //Matricula
STL->TL_USACALE 	:= "N"                         	//Usa Calendario
STL->TL_QUANREC 	:= 0                           	//Quantidade Recebida
STL->TL_QUANTID 	:= 0                           	//Quantidade da Mao de Obra
STL->TL_UNIDADE 	:= "H"                       	//Tipo da Unidade
STL->TL_DTINICI 	:= dDataBase                   	//Data Inicio
STL->TL_HOINICI 	:= SubStr( Time(),1,5)        	//Hora Inicial
STL->TL_DTFIM   	:= DDataBase                   	//Data Final
STL->TL_HOFIM   	:= _cHrFim                     	//Hora Final
STL->TL_GARANTI 	:= "N"                         	//Garantia
STL->TL_TIPOHOR 	:= "D"                         	//Tipo de Hora
STL->TL_HREXTRA     := "000.00"                    	//Hora Extra
STL->TL_X_TPGER     := "INSMN03"                  	//Usado pelo Sistema para filtrar

STL->(MsUnLock())*/

Return()
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณINSMNLK  บAutor  ณBruno E. de Souza   บ Data ณ  12/04/2021  บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณProcesso Retorno PCP                                        บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/ 
User Function INSMNLK(oProcess3)

Local aBem    := oProcess3:oHTML:RetByName("it.bem"     )
Local aDesceq := oProcess3:oHTML:RetByName("it.desceq"  )
Local aLocaliz:= oProcess3:oHTML:RetByName("it.localiz" )
Local aDtval  := oProcess3:oHTML:RetByName("it.dtval"   )
Local aDiasven:= oProcess3:oHTML:RetByName("it.diasven" )
Local aOsab   := oProcess3:oHTML:RetByName("it.osaberto")
Local aDiasn  := oProcess3:oHTML:RetByName("it.diasn"   )
Local aDtnec  := oProcess3:oHTML:RetByName("it.dtn"     )
Local aDiaspcp:= oProcess3:oHTML:RetByName("it.diaspcp" )
Local dDtatual  := ""
Local DdatadevR := ""
Local DdatasomaR:= 0
Local _nX		:= 0
Local _nYX      := 0
Local _nCor		:= 1
Local _cEmail2 	:= GetMv("IN_MAILPCP") 

oProcess3:NewTask("LINK","\WORKFLOW\MNTVALIDADE\INSMN03PCP_RET.HTML") 

For _nX:=1 to Len(aBem)

		dbSelectArea("ZZN")
		ZZN->(dbSetOrder(1))
 		ZZN->(dbSeek(xFilial("ZZN")+aBem[_nX]))

	If !EMPTY(aDtnec[_nX])

		dDtatual := SUBSTR(aDtnec[_nX],1,4)+SUBSTR(aDtnec[_nX],6,2)+SUBSTR(aDtnec[_nX],9,2)

		RECLOCK("ZZN", .F.) 
			ZZN->ZZN_DTNECE := STOD(dDtatual)
		MSUNLOCK() 

		If Val(aDiasn[_nX]) > 0 //calcula para data de devolu็ao caia em dia util
			DdatadevR := SUBSTR(aDtnec[_nX],1,4)+SUBSTR(aDtnec[_nX],6,2)+SUBSTR(aDtnec[_nX],9,2)
			DdatadevR := STOD(DdatadevR)
			For _nYX := 1 to Val(aDiasn[_nX])
			    DdatadevR:= DaySum(DdatadevR,1)
				DdatasomaR:= DOW(DdatadevR) 
				If DdatasomaR == 7 .or. DdatasomaR == 1 
			 	   DdatadevR:=  DaySum(DdatadevR,1)
				   _nYX -= 1
				EndIf
			Next _nYX 
		Else
			DdatadevR := STOD("  /  /  ")
		EndIf
	Else
		dDtatual := ZZN->ZZN_DTNECE

		If ZZN->ZZN_DIASNC > 0 //calcula para data de dvolu็ao caia em dia util, datas nao alteradas
				DdatadevR := ZZN->ZZN_DTNECE
			For _nYX := 1 to ZZN->ZZN_DIASNC
				DdatadevR:= DaySum(DdatadevR,1)
				DdatasomaR:= DOW(DdatadevR) 
				If DdatasomaR == 7 .or. DdatasomaR == 1 
			 	   DdatadevR:=  DaySum(DdatadevR,1)
				   _nYX -= 1
				EndIf
			Next _nYX 
		Else
			DdatadevR := STOD("  /  /  ")
		EndIf
	EndIf

        _nCor++
        aadd((oProcess3:oHTML:ValByName("it.cor"	)),IIF(_nCor%2 == 0,"#CCDAEA","#FFFFFF"))
        aadd((oProcess3:oHTML:ValByName("it.bem"	)),aBem[_nX]  			   				)
	   	aadd((oProcess3:oHTML:ValByName("it.desceq"	)),aDesceq[_nX]   				       	)
	   	aadd((oProcess3:oHTML:ValByName("it.localiz")),aLocaliz[_nX]	   					)
	   	aadd((oProcess3:oHTML:ValByName("it.dtval"	)),aDtval[_nX] 							)
	   	aadd((oProcess3:oHTML:ValByName("it.diasven")),aDiasven[_nX]				   		)
		aadd((oProcess3:oHTML:ValByName("it.osaberto")),aOsab[_nX]				   			)
		aadd((oProcess3:oHTML:ValByName("it.diasn"	)),aDiasn[_nX]				   			)
	If !EMPTY(aDtnec[_nX])
		aadd((oProcess3:oHTML:ValByName("it.dtn"   	)),SUBSTR(aDtnec[_nX],9,2)+"/"+SUBSTR(aDtnec[_nX],6,2)+"/"+SUBSTR(aDtnec[_nX],1,4))
	Else
		aadd((oProcess3:oHTML:ValByName("it.dtn"   	)),DTOC(ZZN->ZZN_DTNECE)				)	
	EndIf
		aadd((oProcess3:oHTML:ValByName("it.dtdev"	)),DdatadevR				   			)
		aadd((oProcess3:oHTML:ValByName("it.diaspcp")),aDiaspcp[_nX]			   			)

Next _nX

    oProcess3:cSubject	:= 'Notifica็ใo de Vencimento da Validade de Preventiva do Equipamento Atualizado PCP'
	oProcess3:cTo		:= _cEmail2
	oProcess3:Start()
	
Return()
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณINSMNLKM  บAutor  ณBruno E. de Souza   บ Data ณ  12/04/2021 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณProcesso Retorno manuten็ao                                 บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/ 
User Function INSMNLKM(oProcess)

Local aBemb    := oProcess:oHTML:RetByName("it.bem"     )
Local aDesceqb := oProcess:oHTML:RetByName("it.desceq"  )
Local aLocalizb:= oProcess:oHTML:RetByName("it.localiz" )
Local aDtvalb  := oProcess:oHTML:RetByName("it.dtval"   )
Local aDiasvenb:= oProcess:oHTML:RetByName("it.diasven" )
Local aOsabb   := oProcess:oHTML:RetByName("it.osaberto")
Local aDiasnb  := oProcess:oHTML:RetByName("it.diasn"   )
Local aDtnecb  := oProcess:oHTML:RetByName("it.dtn"     )
Local dDtatualb:= ""
Local DdtdevRb := ""
Local DdtsomaRb:= 0
Local _nZ	   := 0
Local _nYB     := 0
Local _nCor	   := 1
Local _cEmail3 := GetMv("IN_MAILPR2") 

oProcess:NewTask("LINK","\WORKFLOW\MNTVALIDADE\INSMN03MNT_RET.HTML") 

For _nZ:=1 to Len(aBemb)

		dbSelectArea("ZZN")
		ZZN->(dbSetOrder(1))
 		ZZN->(dbSeek(xFilial("ZZN")+aBemb[_nZ]))

	If !EMPTY(aDtnecb[_nZ])

		dDtatualb := SUBSTR(aDtnecb[_nZ],1,4)+SUBSTR(aDtnecb[_nZ],6,2)+SUBSTR(aDtnecb[_nZ],9,2)

		RECLOCK("ZZN", .F.) 
			ZZN->ZZN_DTNECE := STOD(dDtatualb)
		MSUNLOCK() 

		If Val(aDiasnb[_nZ]) > 0  //calcula para data de dvolu็ao caia em dia util
			DdtdevRb := SUBSTR(aDtnecb[_nZ],1,4)+SUBSTR(aDtnecb[_nZ],6,2)+SUBSTR(aDtnecb[_nZ],9,2)
			DdtdevRb := STOD(DdtdevRb)
			For _nYB := 1 to Val(aDiasnb[_nZ])
			    DdtdevRb:= DaySum(DdtdevRb,1)
				DdtsomaRb:= DOW(DdtdevRb) 
				If DdtsomaRb == 7 .or. DdtsomaRb == 1 
			 	   DdtdevRb:=  DaySum(DdtdevRb,1)
				   _nYB -= 1
				EndIf
			Next _nYB 
		Else
			DdtdevRb := STOD("  /  /  ")
		EndIf
	Else
		dDtatualb := ZZN->ZZN_DTNECE

		If ZZN->ZZN_DIASNC > 0  //calcula dias uteis para informa็ao nao alterada
				DdtdevRb := ZZN->ZZN_DTNECE
			For _nYB := 1 to ZZN->ZZN_DIASNC
				DdtdevRb:= DaySum(DdtdevRb,1)
				DdtsomaRb:= DOW(DdtdevRb) 
				If DdtsomaRb == 7 .or. DdtsomaRb == 1 
			 	   DdtdevRb:=  DaySum(DdtdevRb,1)
				   _nYB -= 1
				EndIf
			Next _nYB 
		Else
			DdtdevRb := STOD("  /  /  ")
		EndIf
	EndIf

        _nCor++
        aadd((oProcess:oHTML:ValByName("it.cor"		)),IIF(_nCor%2 == 0,"#CCDAEA","#FFFFFF"))
        aadd((oProcess:oHTML:ValByName("it.bem"		)),aBemb[_nZ]  			   				)
	   	aadd((oProcess:oHTML:ValByName("it.desceq"	)),aDesceqb[_nZ]   				        )
	   	aadd((oProcess:oHTML:ValByName("it.localiz"	)),aLocalizb[_nZ]	   					)
	   	aadd((oProcess:oHTML:ValByName("it.dtval"	)),aDtvalb[_nZ] 						)
	   	aadd((oProcess:oHTML:ValByName("it.diasven"	)),aDiasvenb[_nZ]				   		)
		aadd((oProcess:oHTML:ValByName("it.osaberto")),aOsabb[_nZ]				   			)
		aadd((oProcess:oHTML:ValByName("it.diasn"	)),aDiasnb[_nZ]				   			)
	If !EMPTY(aDtnecb[_nZ])
		aadd((oProcess:oHTML:ValByName("it.dtn"	   	)),SUBSTR(aDtnecb[_nZ],9,2)+"/"+SUBSTR(aDtnecb[_nZ],6,2)+"/"+SUBSTR(aDtnecb[_nZ],1,4))
	Else
		aadd((oProcess:oHTML:ValByName("it.dtn"	   	)),DTOC(ZZN->ZZN_DTNECE)				)	
	EndIf
		aadd((oProcess:oHTML:ValByName("it.dtdev"	)),DdtdevRb				   				)

Next _nZ

    oProcess:cSubject	:= 'Notifica็ใo de Vencimento da Validade de Preventiva do Equipamento Atualizado Manuten็ใo'
	oProcess:cTo		:= _cEmail3
	oProcess:Start()
	
Return()
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณINSMNLKP บAutor  ณBruno E. de Souza   บ Data ณ  12/04/2021  บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณProcesso Retorno PCP2                                       บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/ 
User Function INSMNLKP(oProcess5)

Local aBemc      := oProcess5:oHTML:RetByName("it.bem"     )
Local aDesceqc   := oProcess5:oHTML:RetByName("it.desceq"  )
Local aLocalizc  := oProcess5:oHTML:RetByName("it.localiz" )
Local aDtvalc    := oProcess5:oHTML:RetByName("it.dtval"   )
Local aDiasvenc	 := oProcess5:oHTML:RetByName("it.diasven" )
Local aOsabc     := oProcess5:oHTML:RetByName("it.osaberto")
Local aDiasnc  	 := oProcess5:oHTML:RetByName("it.diasn"   )
Local aDtnecc  	 := oProcess5:oHTML:RetByName("it.dtn"     )
Local aDiaspcp	 := oProcess5:oHTML:RetByName("it.diaspcp" )
Local dDtatualc  := ""
Local DdatadevRc := ""
Local DdtsomaRc  := 0
Local _nW		 := 0
Local _nYC       := 0
Local _nCor		 := 1
Local _cEmail4 	 := GetMv("IN_MAILPCP") 

oProcess5:NewTask("LINK","\WORKFLOW\MNTVALIDADE\INSMN03PCP2_RET.HTML") 

For _nW:=1 to Len(aBemc)

		dbSelectArea("ZZN")
		ZZN->(dbSetOrder(1))
 		ZZN->(dbSeek(xFilial("ZZN")+aBemc[_nW]))

	If !EMPTY(aDtnecc[_nW])

		dDtatualc := SUBSTR(aDtnecc[_nW],1,4)+SUBSTR(aDtnecc[_nW],6,2)+SUBSTR(aDtnecc[_nW],9,2)

		RECLOCK("ZZN", .F.) 
			ZZN->ZZN_DTNECE := STOD(dDtatualc)
		MSUNLOCK() 

		If Val(aDiasnc[_nW]) > 0 //calcula para data de dvolu็ao caia em dia util
			DdatadevRc := SUBSTR(aDtnecc[_nW],1,4)+SUBSTR(aDtnecc[_nW],6,2)+SUBSTR(aDtnecc[_nW],9,2)
			DdatadevRc := STOD(DdatadevRc)
			For _nYC := 1 to Val(aDiasnc[_nW])
			    DdatadevRc:= DaySum(DdatadevRc,1)
				DdtsomaRc := DOW(DdatadevRc) 
				If DdtsomaRc == 7 .or. DdtsomaRc == 1 
			 	   DdatadevRc:=  DaySum(DdatadevRc,1)
				   _nYC -= 1
				EndIf
			Next _nYC 
		Else
			DdatadevRc := STOD("  /  /  ")
		EndIf
	Else
		dDtatualc := ZZN->ZZN_DTNECE

		If ZZN->ZZN_DIASNC > 0 //calcula para data de dvolu็ao caia em dia util, datas nao alteradas
				DdatadevRc := ZZN->ZZN_DTNECE
			For _nYC := 1 to ZZN->ZZN_DIASNC
				DdatadevRc:= DaySum(DdatadevRc,1)
				DdtsomaR:= DOW(DdatadevRc) 
				If DdtsomaR == 7 .or. DdtsomaR == 1 
			 	   DdatadevRc:=  DaySum(DdatadevRc,1)
				   _nYC -= 1
				EndIf
			Next _nYC 
		Else
			DdatadevRc := STOD("  /  /  ")
		EndIf
	EndIf

        _nCor++
        aadd((oProcess5:oHTML:ValByName("it.cor"	)),IIF(_nCor%2 == 0,"#CCDAEA","#FFFFFF"))
        aadd((oProcess5:oHTML:ValByName("it.bem"	)),aBemc[_nW]  			   				)
	   	aadd((oProcess5:oHTML:ValByName("it.desceq"	)),aDesceqc[_nW]   				       	)
	   	aadd((oProcess5:oHTML:ValByName("it.localiz")),aLocalizc[_nW]	   					)
	   	aadd((oProcess5:oHTML:ValByName("it.dtval"	)),aDtvalc[_nW] 						)
	   	aadd((oProcess5:oHTML:ValByName("it.diasven")),aDiasvenc[_nW]				   		)
		aadd((oProcess5:oHTML:ValByName("it.osaberto")),aOsabc[_nW]				   			)
		aadd((oProcess5:oHTML:ValByName("it.diasn"	)),aDiasnc[_nW]				   			)
	If !EMPTY(aDtnecc[_nW])
		aadd((oProcess5:oHTML:ValByName("it.dtn"   	)),SUBSTR(aDtnecc[_nW],9,2)+"/"+SUBSTR(aDtnecc[_nW],6,2)+"/"+SUBSTR(aDtnecc[_nW],1,4))
	Else
		aadd((oProcess5:oHTML:ValByName("it.dtn"   	)),DTOC(ZZN->ZZN_DTNECE)			    )	
	EndIf
		aadd((oProcess5:oHTML:ValByName("it.dtdev"	)),DdatadevRc			   				)
		aadd((oProcess5:oHTML:ValByName("it.diaspcp")),aDiaspcp[_nW]		   				)
		
Next _nW

    oProcess5:cSubject	:= 'Notifica็ใo de Vencimento da Validade de Preventiva do Equipamento Atualizado PCP'
	oProcess5:cTo		:= _cEmail4
	oProcess5:Start()
	
Return()
