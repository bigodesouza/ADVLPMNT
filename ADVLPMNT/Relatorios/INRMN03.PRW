#INCLUDE "Rwmake.ch"
#INCLUDE "Protheus.ch"
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Programa  ³ INRMN03                                                     ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Relatório de detalhamento do indice de controle manutençao  ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Alteraçoes³ 															   ³±±
±±³          ³                            								   ³±±
±±³          ³                                                             ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±ÃÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Criado em ³ 16/04/2015 ³ Analista ³ Bruno E. de Souza	               ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
DIN - Desenvolvimento Inylbra              -                      Documentacao
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/

User Function INRMN03()

Local aRet		:= {}
Local cPar		:= ""
Local aParamBox := {}
Local _aCombo	:= {"1-Relatorio","2-Graf. de Disponibilidade","3-Horas Totais O.S","4-Horas Totais Local","5-Horas Totais Bem","6-Grafico P/C/S","7-Relatorio Turno","8-OS Detalhada"}
Local _cOpcoes  := "1;0;1;INRMN03"
Local _cDtIns   := ""
Local _cDtFims	:= ""
Local _cDtIn    := 0
Local _cDtFim	:= 0

aadd(aParamBox,{1,"Data de"				,dDataBase	,"","","","",50,.F.})
aadd(aParamBox,{1,"Data Ate"			,dDataBase	,"","","","",50,.F.})
aadd(aParamBox,{1,"Filial :"			,Space(2)	,"","","","",0,.F.})
aadd(aParamBox,{2,"Formato:"		    ,	  		,_aCombo,80,,.F.})
aadd(aParamBox,{1,"Cod. Bem"			,Space(16)	,"","","ST9","",0,.F.})

If ParamBox(aParamBox,"Pergunta",@aRet)
	
	_cDtIns  := dtos(aRet[1])
	_cDtFims := dtos(aRet[2])
	
	_cDtIn  := val(substr(_cDtIns,1,4))
	_cDtFim	:= val(substr(_cDtFims,1,4))
	
	If EMPTY(aRet[3])
		MSGALERT("Preencha o parametro Filial")
		U_inrmn03()
	Else  
		If SUBSTR(aRet[4],1,1) == "8" .AND. !EMPTY(aRet[5])
			cPar := ""
			cPar := dtos(aRet[1])+";"+dtos(aRet[2])+";"+aRet[3]+";"+aRet[5]
			callcrys("INRMN03OS",cPar,_cOpcoes) //PROCEDURE INRMN03B
		ElseIf SUBSTR(aRet[4],1,1) == "8" .AND. EMPTY(aRet[5])
			cPar := ""
			cPar := dtos(aRet[1])+";"+dtos(aRet[2])+";"+aRet[3]+";"+aRet[5]
			callcrys("INRMN03OS",cPar,_cOpcoes)
		ElseIf SUBSTR(aRet[4],1,1) == "1"
			cPar := ""
			cPar := dtos(aRet[1])+";"+dtos(aRet[2])+";"+aRet[3]
			callcrys("INRMN03",cPar,_cOpcoes)
		ElseIf SUBSTR(aRet[4],1,1) == "2" .AND. EMPTY(aRet[5])
			cPar := ""
			cPar := dtos(aRet[1])+";"+dtos(aRet[2])+";"+aRet[3]+";"+"ZZZ"
			callcrys("INRMN03GD",cPar,_cOpcoes)
		ElseIf SUBSTR(aRet[4],1,1) == "2".AND. !EMPTY(aRet[5])
			cPar := ""
			cPar := dtos(aRet[1])+";"+dtos(aRet[2])+";"+aRet[3]+";"+aRet[5]
			callcrys("INRMN03GD",cPar,_cOpcoes)
		ElseIf SUBSTR(aRet[4],1,1) == "3"
			If _cDtFim - _cDtIn <> 0
				MSGALERT("Não é possivel visualizar periodos de anos diferentes no relatorio Horas Totais O.S")
				U_inrmn03()
				//Return
			Else
				cPar := ""
				cPar := dtos(aRet[1])+";"+dtos(aRet[2])+";"+aRet[3]
				callcrys("INRMN03GH",cPar,_cOpcoes)
			EndIf
		ElseIf SUBSTR(aRet[4],1,1) == "6"
			If EMPTY(aRet[5])
				MSGALERT("Preencha codigo do Bem")
				U_inrmn03()
				//Return
			Else
				cPar := ""
				cPar := dtos(aRet[1])+";"+dtos(aRet[2])+";"+aRet[5]+";"+aRet[3]
				callcrys("INRMN03PCS",cPar,_cOpcoes)
			Endif
		ElseIf SUBSTR(aRet[4],1,1) == "4"
			If _cDtFim - _cDtIn <> 0
				MSGALERT("Não é possivel visualizar periodos de anos diferentes no relatorio Horas Totais Local")
				U_inrmn03()
				//Return
			Else
				cPar := ""
				cPar := dtos(aRet[1])+";"+dtos(aRet[2])+";"+aRet[3]
				callcrys("INRMN03GL",cPar,_cOpcoes)
			EndIf
		ElseIf SUBSTR(aRet[4],1,1) == "5"
			If _cDtFim - _cDtIn <> 0
				MSGALERT("Não é possivel visualizar periodos de anos diferentes no relatorio Horas Totais Bem")
				U_inrmn03()
				//Return
			ElseIf EMPTY(aRet[5])
				MSGALERT("Preencha codigo do Bem")
				U_inrmn03()
			Else
				cPar := ""
				cPar := dtos(aRet[1])+";"+dtos(aRet[2])+";"+aRet[3]+";"+aRet[5]
				callcrys("INRMN03HB",cPar,_cOpcoes)
			EndIf
		ElseIf SUBSTR(aRet[4],1,1) == "7"
			cPar := ""
			cPar := dtos(aRet[1])+";"+dtos(aRet[2])+";"+aRet[3]
			callcrys("INRMN03T",cPar,_cOpcoes)
		EndIf
	EndIf
EndIf
Return()