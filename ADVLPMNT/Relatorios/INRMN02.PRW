#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "RWMAKE.CH"   
#INCLUDE "MSGRAPHI.CH"

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณINRMN02   บAutor  ณBruno E. de Souza   บ Data ณ  02/10/15   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Grafico de manuten็ao problema/Causa/Solu็ao               บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function INRMN02()

Local _cQry 	:= ""
Local _cQryA 	:= "" 
Local _cQryB 	:= ""
Local _aAux 	:= {}  
Local _aAuxA 	:= {}
Local _aAuxB 	:= {}
Local _nRegis 	:= 0 
Local _nRegisA 	:= 0 
Local _nRegisB 	:= 0 
Local nColorl 	:= 0 
Local nColorlA 	:= 0  
Local nColorlB 	:= 0  
Local nColorq 	:= 0 
Local nColorqA 	:= 0
Local nColorqB 	:= 0
Local _cperg  	:= "INRMN02" 
Local cCodbem 	:= ""
Local cDatade 	:= ""
Local cDataate 	:= ""
Local nX        := 0
Local nXA       := 0  
Local nXB       := 0

Pergunte(_cperg,.T.,"Grafico P/C/S")  

cDatade  := DTOS(MV_PAR01)
cDataate := DTOS(MV_PAR02)

/////////////////////Problemas////////////////////////////

_cQry := " SELECT											" + CRLF
_cQry += " TJ_ORDEM	,				   						" + CRLF
_cQry += " TJ_CODBEM,				   						" + CRLF
_cQry += " TJ_SERVICO,				   						" + CRLF
_cQry += " TN_CODOCOR,				   						" + CRLF
_cQry += " TN_CAUSA,				   						" + CRLF
_cQry += " TN_SOLUCAO				   						" + CRLF
_cQry += " FROM						   						" + CRLF
_cQry += ""+RetSqlName("STJ")+ " STJ   						" + CRLF
_cQry += " JOIN						   						" + CRLF
_cQry += ""+RetSqlName("STN")+ " STN   						" + CRLF
_cQry += " ON												" + CRLF
_cQry += " TJ_FILIAL = TN_FILIAL 	   						" + CRLF
_cQry += " AND						   						" + CRLF
_cQry += " TJ_ORDEM = TN_ORDEM 								" + CRLF
_cQry += " AND												" + CRLF
_cQry += " TJ_PLANO = TN_PLANO		   						" + CRLF
_cQry += " AND						   						" + CRLF
_cQry += " STN.D_E_L_E_T_<>'*'		   						" + CRLF
_cQry += " WHERE					   						" + CRLF
_cQry += " STJ.D_E_L_E_T_<>'*'		   						" + CRLF
_cQry += " AND												" + CRLF
_cQry += " TJ_CODBEM = '"+MV_PAR03+"' 						" + CRLF 
_cQry += " AND												" + CRLF 
_cQry += " TJ_DTORIGI BETWEEN "+cDatade+" AND "+cDataate+"	" + CRLF
_cQry += " AND												" + CRLF
_cQry += " TJ_FILIAL = '"+xFilial("STJ")+"'					" + CRLF
_cQry += " AND												" + CRLF
_cQry += " TN_FILIAL = '"+xFilial("STN")+"'					" + CRLF
_cQry += " ORDER BY											" + CRLF
_cQry += " TN_CODOCOR,										" + CRLF
_cQry += " TN_CAUSA,										" + CRLF
_cQry += " TN_SOLUCAO										" + CRLF

If Select("TRB") > 0
	TRB->(dbCloseArea())
EndIf

TcQuery _cQry New Alias "TRB"

TRB->(dbGoTop())

cCodbem := TRB->TJ_CODBEM

While	TRB->(!EOF())
	
	Npos := Ascan(_aAux, {|x| Alltrim(x[1])+Alltrim(x[2]) == Alltrim(TRB->TJ_CODBEM)+Alltrim(TRB->TN_CODOCOR)})
	_nRegis := 1
	
	If Npos == 0
		aAdd(_aAux,{	TRB->TJ_CODBEM	,;
		TRB->TN_CODOCOR	,;
		_nRegis			})
	Else
		_aAux[Npos][3] += _nRegis
	EndIf
	
	TRB->(dbSkip())
End  
   
/////////////////////////////Causas////////////////////////////
_cQryA := " SELECT											" + CRLF
_cQryA += "	TJ_ORDEM,										" + CRLF
_cQryA += "	TJ_CODBEM,										" + CRLF
_cQryA += " TJ_SERVICO,										" + CRLF
_cQryA += " TN_CODOCOR,										" + CRLF
_cQryA += " TN_CAUSA,										" + CRLF
_cQryA += " TN_SOLUCAO										" + CRLF
_cQryA += " FROM											" + CRLF
_cQryA += ""+RetSqlName("STJ")+ " STJ						" + CRLF
_cQryA += " JOIN											" + CRLF
_cQryA += ""+RetSqlName("STN")+ " STN						" + CRLF
_cQryA += " ON												" + CRLF
_cQryA += " TJ_FILIAL = TN_FILIAL 							" + CRLF
_cQryA += " AND												" + CRLF
_cQryA += " TJ_ORDEM = TN_ORDEM 							" + CRLF
_cQryA += " AND												" + CRLF
_cQryA += " TJ_PLANO = TN_PLANO								" + CRLF
_cQryA += " AND												" + CRLF
_cQryA += " STN.D_E_L_E_T_<>'*'								" + CRLF
_cQryA += " WHERE											" + CRLF
_cQryA += " STJ.D_E_L_E_T_<>'*'								" + CRLF
_cQryA += " AND												" + CRLF
_cQryA += " TJ_CODBEM = '"+MV_PAR03+"'						" + CRLF 
_cQryA += " AND												" + CRLF 
_cQryA += " TJ_DTORIGI BETWEEN "+cDatade+" AND "+cDataate+"" + CRLF
_cQryA += " AND												" + CRLF
_cQryA += " TJ_FILIAL = '"+xFilial("STJ")+"'				" + CRLF
_cQryA += " AND												" + CRLF
_cQryA += " TN_FILIAL = '"+xFilial("STN")+"'				" + CRLF
_cQryA += " ORDER BY										" + CRLF
_cQryA += " TN_CAUSA,										" + CRLF
_cQryA += " TN_CODOCOR,										" + CRLF
_cQryA += " TN_SOLUCAO										" + CRLF

If Select("TRB2") > 0
	TRB2->(dbCloseArea())
EndIf

TcQuery _cQryA New Alias "TRB2"

TRB2->(dbGoTop())

While	TRB2->(!EOF())
	
	NposA := Ascan(_aAuxA, {|x| Alltrim(x[1])+Alltrim(x[2]) == Alltrim(TRB2->TJ_CODBEM)+Alltrim(TRB2->TN_CAUSA)})
	_nRegisA := 1
	
	If NposA == 0
		aAdd(_aAuxA,{	TRB2->TJ_CODBEM	,;
		TRB2->TN_CAUSA	,;
		_nRegisA		})
	Else
		_aAuxA[NposA][3] += _nRegisA
	EndIf
	
	TRB2->(dbSkip())
End 

/////////////////////////////Solu็ao//////////////////////////////////////// 
_cQryB := " SELECT											" + CRLF
_cQryB += " TJ_ORDEM,										" + CRLF
_cQryB += " TJ_CODBEM,										" + CRLF
_cQryB += " TJ_SERVICO,										" + CRLF
_cQryB += " TN_CODOCOR,										" + CRLF
_cQryB += " TN_CAUSA,										" + CRLF
_cQryB += " TN_SOLUCAO										" + CRLF
_cQryB += " FROM											" + CRLF
_cQryB += ""+RetSqlName("STJ")+ " STJ						" + CRLF
_cQryB += " JOIN											" + CRLF
_cQryB += ""+RetSqlName("STN")+ " STN						" + CRLF
_cQryB += " ON												" + CRLF
_cQryB += " TJ_FILIAL = TN_FILIAL						    " + CRLF
_cQryB += " AND												" + CRLF
_cQryB += " TJ_ORDEM = TN_ORDEM 							" + CRLF
_cQryB += " AND												" + CRLF
_cQryB += " TJ_PLANO = TN_PLANO								" + CRLF
_cQryB += " AND												" + CRLF
_cQryB += " STN.D_E_L_E_T_<>'*'								" + CRLF
_cQryB += " WHERE											" + CRLF
_cQryB += "	STJ.D_E_L_E_T_<>'*'								" + CRLF
_cQryB += "	AND												" + CRLF
_cQryB += "	TJ_CODBEM = '"+MV_PAR03+"'						" + CRLF 
_cQryB += "	AND												" + CRLF 
_cQryB += "	TJ_DTORIGI BETWEEN "+cDatade+" AND "+cDataate+"" + CRLF
_cQryB += "	AND												" + CRLF
_cQryB += "	TJ_FILIAL = '"+xFilial("STJ")+"'				" + CRLF
_cQryB += "	AND												" + CRLF
_cQryB += "	TN_FILIAL = '"+xFilial("STN")+"'				" + CRLF
_cQryB += "	ORDER BY										" + CRLF 
_cQryB += "	TN_SOLUCAO,										" + CRLF
_cQryB += "	TN_CAUSA,										" + CRLF
_cQryB += "	TN_CODOCOR										" + CRLF

If Select("TRB3") > 0
	TRB3->(dbCloseArea())
EndIf

TcQuery _cQryB New Alias "TRB3"

TRB3->(dbGoTop())

While	TRB3->(!EOF())
	
	NposB := Ascan(_aAuxB, {|x| Alltrim(x[1])+Alltrim(x[2]) == Alltrim(TRB3->TJ_CODBEM)+Alltrim(TRB3->TN_SOLUCAO)})
	_nRegisB := 1
	
	If NposB == 0
		aAdd(_aAuxB,{	TRB3->TJ_CODBEM	,;
		TRB3->TN_SOLUCAO,;
		_nRegisB		})
	Else
		_aAuxB[NposB][3] += _nRegisB
	EndIf
	
	TRB3->(dbSkip())
End 

/////////////////////Problemas////////////////////////////

DEFINE MSDIALOG oDlg TITLE "Grafico P/C/S" FROM 10,10 TO 700,1050 PIXEL 

oGraphic := TMSGraphic():New( 35,10,oDlg,,,RGB(239,239,239),230,150) 
oGraphic:SetMargins(2,6,6,6)
oGraphic:SetLegenProp(GRP_SCRRIGHT, CLR_LIGHTGRAY, GRP_AUTO,.T.)

nSerie := oGraphic:CreateSerie( GRP_PIE  ) 
For nX:=1 To Len (_aAux) 
	dbSelectArea("ST8")
	ST8->(dbSetOrder(1))
	ST8->(dbSeek(xFilial("ST8")+_aAux[nX,2]))
nColorq += 1
nColorl := Mudacor(nColorq)   

oGraphic:Add(nSerie, _aAux[nX,3] ,_aAux[nX,2]+" "+alltrim(T8_NOME),nColorl)    
Next nX

/////////////////////////////Causas////////////////////////////

oGraphicA := TMSGraphic():New( 35,270,oDlg,,,RGB(239,239,239),230,150) 
oGraphicA:SetMargins(2,6,6,6)
oGraphicA:SetLegenProp(GRP_SCRRIGHT, CLR_LIGHTGRAY, GRP_AUTO,.T.)

nSerieA := oGraphicA:CreateSerie( GRP_PIE  ) 
For nXA:=1 To Len (_aAuxA) 
	dbSelectArea("ST8")
	ST8->(dbSetOrder(1))
	ST8->(dbSeek(xFilial("ST8")+_aAuxA[nXA,2]))
nColorqA += 1
nColorlA := Mudacor(nColorqA)   

oGraphicA:Add(nSerieA, _aAuxA[nXA,3] ,_aAuxA[nXA,2]+" "+alltrim(T8_NOME),nColorlA)    
Next nXA  

/////////////////////////////Solu็ao//////////////////////////////////////// 
oGraphicB := TMSGraphic():New( 195,140,oDlg,,,RGB(239,239,239),230,150) 
oGraphicB:SetMargins(2,6,6,6)
oGraphicB:SetLegenProp(GRP_SCRRIGHT, CLR_LIGHTGRAY, GRP_AUTO,.T.)

nSerieB := oGraphicB:CreateSerie ( GRP_PIE  )
For nXB:=1 To Len (_aAuxB) 
	dbSelectArea("ST8")
	ST8->(dbSetOrder(1))
	ST8->(dbSeek(xFilial("ST8")+_aAuxB[nXB,2]))
nColorqB += 1
nColorlB := Mudacor(nColorqB)   

oGraphicB:Add(nSerieB, _aAuxB[nXB,3] ,_aAuxB[nXB,2]+" "+alltrim(T8_NOME),nColorlB)    
Next nXB

	dbSelectArea("ST9")
	ST9->(dbSetOrder(1))
	ST9->(dbSeek(xFilial("ST9")+alltrim(cCodbem)))

@ 30, 70 SAY "Problemas "+alltrim(_aAux[1,1])+"-"+alltrim(T9_NOME) OF oDlg PIXEL
@ 30, 330 SAY "Causas "+alltrim(_aAuxA[1,1])+"-"+alltrim(T9_NOME) OF oDlg PIXEL 
@ 190,200 SAY "Solu็oes "+alltrim(_aAuxB[1,1])+"-"+alltrim(T9_NOME) OF oDlg PIXEL

ACTIVATE MSDIALOG oDlg CENTERED

Return 

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณMudacor	บAutor  ณBruno E. de Souza   บ Data ณ  02/11/15   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณFun็ao faz rodeio das cores para mundan็a no grafico        บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function Mudacor(nColor)

Local nColorl2 := 0

If nColor == 1 ; nColorl2 := CLR_GREEN
ElseIf nColor == 2 ; nColorl2 := CLR_CYAN
ElseIf nColor == 3 ; nColorl2 := CLR_MAGENTA
ElseIf nColor == 4 ; nColorl2 := CLR_BROWN
ElseIf nColor == 5 ; nColorl2 := CLR_GRAY
ElseIf nColor == 6 ; nColorl2 := CLR_RED
ElseIf nColor == 7 ; nColorl2 := CLR_BLUE
ElseIf nColor == 8 ; nColorl2 := CLR_GREEN
ElseIf nColor == 9 ; nColorl2 := CLR_CYAN
ElseIf nColor == 10 ; nColorl2 := CLR_MAGENTA
ElseIf nColor == 11 ; nColorl2 := CLR_YELLOW
ElseIf nColor == 12 ; nColorl2 := CLR_GRAY
ElseIf nColor == 13 ; nColorl2 := CLR_WHITE
ElseIf nColor == 14 ; nColorl2 := CLR_GREEN
EndIf 

Return(nColorl2)