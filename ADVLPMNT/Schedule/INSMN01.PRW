#include "RWMAKE.CH"
#include "PROTHEUS.CH"
#Include "TopConn.Ch"
#Include "TbiConn.Ch"

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณINSMN01   บAutor  ณBruno E. de Souza   บ Data ณ  27/11/2019 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณNotifica็ใo de Vencimento da Validade de Preventiva         บฑฑ
ฑฑบ          ณdo Equipamento                                              บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
/*User Function INSMN01()//INATIVO, ENVIADO PARA INSMN03

WfPrepEnv('01','01',,,'EST')

RodaSche()

Return()


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRodaSche  บAutor  ณMicrosiga           บ Data ณ  27/11/19   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณNotifica็ใo de Vencimento da Validade de Preventiva         บฑฑ
ฑฑบ          ณdo Equipamento                                              บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
/*Static Function RodaSche()

//Local dDatadia      := Ddatabase
Local dDatadia      := AnoMes(Ddatabase)
Local cNewData      := ""
Local _cBody 		:= ""
Local _cCor  		:= ""
Local _cEmail		:= AllTrim(GETMV("IN_MAILPRE"))
Local dDataatu  	:= ""
Local cQry 			:= ""
Local cQuery 		:= ""
Local cQueryA 		:= ""
Local cQueryB 		:= ""
Local cEquip        := ""
Local _nY    		:= 0
Local cCrtl 		:= 0
Local _lRet   		:= .T.   
Private cCodBem     := ""
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
cQuery += "SUBSTRING(ZZN_VAL,7,2)+'/'+SUBSTRING(ZZN_VAL,5,2)+'/'+SUBSTRING(ZZN_VAL,1,4) AS 'VALD'	" +CRLF
cQuery += "FROM																						" +CRLF
cQuery += ""+RetSqlName("ZZN")+" ZZN WITH(NOLOCK)													" +CRLF
cQuery += "WHERE																					" +CRLF
cQuery += "D_E_L_E_T_<>'*'																			" +CRLF
cQuery += "AND																						" +CRLF
cQuery += "ZZN_FILIAL = '" + xFilial("ZZN") + "'													" +CRLF
cQuery += "AND																						" +CRLF
cQuery += "ZZN_STATUS <> 'I'																		" +CRLF

If Select("TRB") > 0
	dbSelectArea("TRB")
	TRB->(DbCloseArea())
EndIf

TCQUERY cQuery NEW ALIAS "TRB"

dbSelectArea("TRB")
TRB->(dbGoTop())

_cBody := '<html>'
_cBody += '<head>'
_cBody += '<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">'
_cBody += '</head>'
_cBody += '<html>'
_cBody += '<head></head>'
_cBody += '<html>'
_cBody += '<head>'
_cBody += '<title>Notifica็ใo de Vencimento da Validade de Preventiva do Equipamento</title>'
_cBody += '</head>'
_cBody += '<body>'
_cBody += '<center>'
_cBody += '<table width="919" border="0" cellspacing="0" cellpadding="0">'
_cBody += '    <tr>'
_cBody += '      <td colspan="6" bgcolor="#0066CC" align="center"><font color="#FFFFFF" size="2" face="Arial, Helvetica, sans-serif"><b>Notifica็ใo de Vencimento da Validade de Preventiva do Equipamento </b></font></td>'
_cBody += '    </tr>'
_cBody += '    <tr>'
_cBody += '      <td width="165" bgcolor="#FF9933" align="left" valign="baseline"><b><font size="2" face="Arial, Helvetica, sans-serif">Codigo Equipamento </font></b></td>'
_cBody += '      <td width="256" bgcolor="#FF9933" align="left" valign="baseline"><b><font size="2" face="Arial, Helvetica, sans-serif">Descri็ใo</font></b></td>'
_cBody += '      <td width="119" bgcolor="#FF9933" align="left" valign="baseline"><b><font size="2" face="Arial, Helvetica, sans-serif">Localiza็ใo </font></b></td>'
_cBody += '      <td width="137" bgcolor="#FF9933" align="left" valign="baseline"><b><font size="2" face="Arial, Helvetica, sans-serif">Data Validade </font></b></td>'
_cBody += '      <td width="242" bgcolor="#FF9933" align="left" valign="baseline"><b><font size="2" face="Arial, Helvetica, sans-serif">Dias  Vencimento </font></b></td>'
_cBody += '      <td width="113" bgcolor="#FF9933" align="left" valign="baseline"><b><font size="2" face="Arial, Helvetica, sans-serif">OS em Aberto </font></b></td>'
_cBody += '    </tr>'


While TRB->(!EOF())
	
	dbSelectArea("ZZN")
	ZZN->(dbSetOrder(1))
	ZZN->(dbSeek(xFilial("ZZN")+TRB->ZZN_EQUIP))
	
	Ddataval:= MonthSub( CTOD(TRB->VALD) , 1 )  //Data de validade menos 1 mes para mandar workflow antecipado de vencimento validade
	
	//If Ddataval <= dDatadia
	If SUBSTR(DTOS(Ddataval),1,6) <= dDatadia
		
		_lret := .T.
		
		cEquip := ""
		cCodBem := TRB->ZZN_EQUIP
		
		//If CTOD(TRB->VALD) < dDatadia //ja valida equipamento vencido  //verifica OS em aberto se nao, abre OS para equipamento vencido 
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
		
		cCrtl := 1
		
		_nY++
		
		If _nY%2 == 0
			_cCor := "#FFFFFF"
		Else
			_cCor := "#D8E6F5"
		EndIf
		
		//Ddatavalid:= CTOD(TRB->VALD)
		Ddatavalid:= SUBSTR(DTOS(CTOD(TRB->VALD)),1,6)
		
		//If CTOD(TRB->VALD) > dDatadia  //joga linha de instrumento com validade a vencer
		If SUBSTR(DTOS(CTOD(TRB->VALD)),1,6)+"01" > dDatadia+"01"
			
			//Ddatavenc := CTOD(TRB->VALD) - dDatadia  //quantidade dias a vencer
			cNewData := SUBSTR(DTOS(CTOD(TRB->VALD)),1,6)+"01"
			dDatadia := dDatadia+"01"
			Ddatavenc := STOD(cNewData) - STOD(dDatadia)
			Ddatavenc := Cvaltochar(Ddatavenc)
			
			_cBody += ' <tr><td width="165" bgcolor="' + _cCor + '" align="left" valign="baseline"><b><font size="2" face="Arial, Helvetica, sans-serif" color="#666666">'+TRB->ZZN_EQUIP+	' </font></b></td>'
			_cBody += ' 	<td width="256" bgcolor="' + _cCor + '" align="left" valign="baseline"><b><font size="2" face="Arial, Helvetica, sans-serif" color="#666666">'+TRB->ZZN_DESCR+	'</font></b></td>'
			_cBody += '		<td width="119" bgcolor="' + _cCor + '" align="left" valign="baseline"><b><font size="2" face="Arial, Helvetica, sans-serif" color="#666666">'+TRB->ZZN_LOCAL+	' </font></b></td>'
			//_cBody += ' 	<td width="137" bgcolor="' + _cCor + '" align="left" valign="baseline"><b><font size="2" face="Arial, Helvetica, sans-serif" color="#666666">'+DTOC(Ddatavalid)+'</font></b></td>'
			_cBody += ' 	<td width="137" bgcolor="' + _cCor + '" align="left" valign="baseline"><b><font size="2" face="Arial, Helvetica, sans-serif" color="#666666">'+substr(Ddatavalid,5,2)+"/"+substr(Ddatavalid,1,4)+'</font></b></td>'
			_cBody += '		<td width="242" bgcolor="' + _cCor + '" align="left" valign="baseline"><b><font size="2" face="Arial, Helvetica, sans-serif" color="#666666">'+ Ddatavenc +' dias ate o vencimento</font></td>
			_cBody += '		<td width="113" bgcolor="' + _cCor + '" align="left" valign="baseline"><b><font size="2" face="Arial, Helvetica, sans-serif" color="#666666">'+cEquip+'</font></td>
		Else
			
			cNewData := SUBSTR(DTOS(CTOD(TRB->VALD)),1,6)+"01"
			dDatadia := dDatadia+"01"
			Ddatavenc := STOD(cNewData) - STOD(dDatadia) //joga linha de instrumento com validade ja vencida
			Ddatavenc := Ddatavenc*-1          //positiva quantidade de dias ja vencidas para string nao sair negativo
			Ddatavenc := Cvaltochar(Ddatavenc)
			
			_cBody += ' <tr><td width="165" bgcolor="' + _cCor + '" align="left" valign="baseline"><b><font size="2" face="Arial, Helvetica, sans-serif" color="#666666">'+TRB->ZZN_EQUIP+	' </font></b></td>'
			_cBody += ' 	<td width="256" bgcolor="' + _cCor + '" align="left" valign="baseline"><b><font size="2" face="Arial, Helvetica, sans-serif" color="#666666">'+TRB->ZZN_DESCR+	'</font></b></td>'
			_cBody += '	  	<td width="119" bgcolor="' + _cCor + '" align="left" valign="baseline"><b><font size="2" face="Arial, Helvetica, sans-serif" color="#666666">'+TRB->ZZN_LOCAL+	' </font></b></td>'
			//_cBody += ' 	<td width="137" bgcolor="' + _cCor + '" align="left" valign="baseline"><b><font size="2" face="Arial, Helvetica, sans-serif" color="#666666">'+DTOC(Ddatavalid)+'</font></b></td>'
			_cBody += ' 	<td width="137" bgcolor="' + _cCor + '" align="left" valign="baseline"><b><font size="2" face="Arial, Helvetica, sans-serif" color="#666666">'+substr(Ddatavalid,5,2)+"/"+substr(Ddatavalid,1,4)+'</font></b></td>'
			_cBody += '	  	<td width="242" bgcolor="' + _cCor + '" align="left" valign="baseline"><b><font size="2" face="Arial, Helvetica, sans-serif" color="#666666">'+ Ddatavenc +' dias vencidos</font></td>
			_cBody += '		<td width="113" bgcolor="' + _cCor + '" align="left" valign="baseline"><b><font size="2" face="Arial, Helvetica, sans-serif" color="#666666">'+cEquip+'</font></td>
			
		EndIf
	EndIf
	
	TRB->(dbSkip())
	
EndDo
TRB->(dbCloseArea())

_cBody += '  </table>
_cBody += '</center>
_cBody += '</body>
_cBody += '</html>

If cCrtl == 1
	u_GeraMail(,,,,_cEmail,"*** Notifica็ใo de Vencimento da Validade de Preventiva do Equipamento ***",_cBody,,.T.)
EndIf

Return()


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณINSMN01   บAutor  ณMicrosiga           บ Data ณ  01/29/20   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
/*Static Function INGORDMNT(cCodBem)

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

RecLock("STL",.T.)

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
STL->TL_X_TPGER     := "INSMN01"                  	//Usado pelo Sistema para filtrar

STL->(MsUnLock())

Return()*/
