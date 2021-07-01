#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "RWMAKE.CH" 
#Include "FileIO.ch" 
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณINAMN06   บ Autor ณ Bruno Souza  บ Data ณ  07/11/2019 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณControle CADASTRO DE PREVENTIVAS, controla preventivasบฑฑ
ฑฑบ			 ณde equipamentos manuten็ao  				            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function INAMN06()                           

Local cFiltra       := ""
Private cCadastro   := "CONTROLE CADASTRO DE PREVENTIVAS MAQUINAS EM GERAL"
Private aRotina     := {}
Private cString     := "ZZN"
Private aIndexZZN  := {}
Private bFiltraBrw  := { || FilBrowse(cString,@aIndexZZN,@cFiltra) }
  
//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณQuebra do aRotina, caso haja necessidade de configurarณ
//ณvizuali็ใo para determinados usuแrios.                ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
 
	Aadd( aRotina , {"Pesquisar " 	 	,"Axpesqui"					,0,1 })
	Aadd( aRotina , {"Visualizar" 	 	,"AxVisual"			   		,0,2 })
	Aadd( aRotina , {"Legenda"	  	 	,"u_ZZNLEG(cString,6)" 		,0,6 })
	Aadd( aRotina , {"Alterar"	  	 	,"u_INCLUIZZN(cString,4)"  	,0,4 })
	Aadd( aRotina , {"Incluir"	  	 	,"u_INCLUIZZN(cString,3)" 	,0,3 })
	Aadd( aRotina , {"Excluir"	   		,"u_DeleteZZN(cString,5)"   ,0,5 })  
	Aadd( aRotina , {"Atualiza Vald."	,"u_AtuvZZN(cString,4)"   	,0,7 }) 
	Aadd( aRotina , {"Envia Notifica็ใo.","u_INSMN03()"  		 	,0,7 })
	Aadd( aRotina , {"Imprimir Equip.Prev","u_INRMN13()"			,0,1 })
	
	                      
	               	Private aCores := { {'((ZZN->ZZN_OSREAL/ZZN_OSPROG)*100) >= 0 .AND. ((ZZN->ZZN_OSREAL/ZZN_OSPROG)*100) <= 5'    ,'BR_VIOLETA'},;
   	   			   						{'((ZZN->ZZN_OSREAL/ZZN_OSPROG)*100) >= 6 .AND. ((ZZN->ZZN_OSREAL/ZZN_OSPROG)*100) <= 25'   ,'BR_CINZA'	  },; 
   	   			   						{'((ZZN->ZZN_OSREAL/ZZN_OSPROG)*100) >= 26 .AND. ((ZZN->ZZN_OSREAL/ZZN_OSPROG)*100) <= 50'  ,'BR_AMARELO' },;
   	   			   						{'((ZZN->ZZN_OSREAL/ZZN_OSPROG)*100) >= 51 .AND. ((ZZN->ZZN_OSREAL/ZZN_OSPROG)*100) <= 75'  ,'BR_LARANJA' },; 
   	   			   						{'((ZZN->ZZN_OSREAL/ZZN_OSPROG)*100) >= 76 .AND. ((ZZN->ZZN_OSREAL/ZZN_OSPROG)*100) <= 100' ,'BR_VERDE'   },; 
   	   			   						{'((ZZN->ZZN_OSREAL/ZZN_OSPROG)*100) >= 101 .AND. ((ZZN->ZZN_OSREAL/ZZN_OSPROG)*100) <= 999','BR_VERMELHO'}}   
   	   			   						
	Eval(bFiltraBrw)
	DbSelectArea(cString)
	dbSetOrder(1)                                   
	Mbrowse(6,1,22,74,cString,,,,,,aCores)

Return()
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ 	ZZNLEG  บAutor  ณBruno Souza         บ Data ณ07/11/2019	  บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณLegenda do browse.                                          บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ				                                              บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function ZZNLEG()

Local cCadastro:= "Status da Solicita็ใo de Servi็o"

Local aCores:=	{	{	 'BR_VIOLETA' 	,'De 0% ate 5% de OS Concluidas do total programado'  	},;
   					{	 'BR_CINZA'  	,'De 6% ate 25% de OS Concluidas do total programado' 	},;
					{	 'BR_AMARELO'	,'De 26% ate 50% de OS Concluidas do total programado'	},;
					{	 'BR_LARANJA'	,'De 51% ate 75% de OS Concluidas do total programado'	},;
			   		{	 'BR_VERDE'  	,'De 76% ate 100% de OS Concluidas do total programado' },;
					{	 'BR_VERMELHO'  ,'OS Concluidas acima do programado'  }}
					
					
BrwLegenda(cCadastro,"Legenda",aCores)

Return()
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณINCLUIZZN บ Autor ณ BRUNO SOUZA  บ Data ณ  07/11/2019 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Altera Campo do cadastro					            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function INCLUIZZN(cAlias,nOpcao)

Local cTituloTela := "CADASTRO DE PREVENTIVAS"
Local aAltera     := {}
Local aExibir     := {}
Private oDlgX     := Nil
Private aAdvSize  := MsAdvSize()
Private oFont16N  := TFont():New( "Arial" , , 16 , , .T. , , , , , .F. , .F. )   


/* oSize := FwDefSize():New(.F.)
 oSize:AddObject( "PREVENTIVA" , 100, 100, .T., .T. )
 oSize:Process()
 nT := oSize:GetDimension("PREVENTIVA","LININI")
 nL := oSize:GetDimension("PREVENTIVA","COLINI")
 nB := oSize:GetDimension("PREVENTIVA","LINEND")    //bruno
 nR := oSize:GetDimension("PREVENTIVA","COLEND")  */

aAdvSize[6] -= (1/100) * aAdvSize[6]
aAdvSize[5] -= (1/100) * aAdvSize[5]

If nOpcao == 4
	RegToMemory( cAlias, .F.)
	aAltera :=  {"ZZN_FAMILI","ZZN_DATREV","ZZN_RESP","ZZN_USOINI","ZZN_FREQ","ZZN_VAL","ZZN_HISTOS","ZZN_DEPTO","ZZN_LOCAL","ZZN_STATUS","ZZN_OSPROG","ZZN_OSREAL","ZZN_DIASNC","ZZN_DTNECE","ZZN_OPCPGR","NOUSER" }
ElseIf nOpcao == 3
	RegToMemory( cAlias, .T.)
	aAltera :=  {"ZZN_FILIAL","ZZN_EQUIP","ZZN_FAMILI","ZZN_DATREV","ZZN_RESP","ZZN_USOINI","ZZN_FREQ","ZZN_VAL","ZZN_HISTOS","ZZN_DEPTO","ZZN_LOCAL","ZZN_STATUS","ZZN_OSPROG","ZZN_OSREAL","ZZN_DIASNC","ZZN_DTNECE","ZZN_OPCPGR","NOUSER" }
EndIf

aExibir :=   {"ZZN_EQUIP","ZZN_REV","ZZN_FAMILI","ZZN_DATREV","ZZN_RESP","ZZN_USOINI","ZZN_FREQ","ZZN_VAL","ZZN_HISTOS","ZZN_DEPTO","ZZN_DSCDPT","ZZN_LOCAL","ZZN_DESCR","ZZN_STATUS","ZZN_OSPROG","ZZN_OSREAL","ZZN_DIASNC","ZZN_DTNECE","ZZN_OPCPGR","NOUSER" }

oDlgX := MSDialog():New(0,0,aAdvSize[6],aAdvSize[5],cTituloTela,,,,,,,,,.T.)
//oDlgX := MSDialog():New(nT,nL,nB,nR,cTituloTela,,,,,,,,,.T.)    //bruno
oDlgX:LCENTERED   := .T.
oDlgX:LMAXIMIZED  := .T.

oPanel01 := TPanel():New(0,0,cTituloTela,oDlgX,oFont16N,.T.,.T.,NIL,NIL,aAdvSize[5],10,.F.,.T. )
oPanel01:nClrPane := 16776960
oPanel01:Align    := CONTROL_ALIGN_TOP

oPanel02 := TPanel():New(0,0, ,oDlgX,oFont16N,.F.,.F.,NIL,NIL,aAdvSize[5],45,.F.,.T. )
oPanel02:Align := CONTROL_ALIGN_ALLCLIENT

oMsMGet := MsmGet():New( cAlias , , nOpcao , , , ,aExibir , {5,5,aAdvSize[6],750} , aAltera , , , , , oPanel02 , , , , , , , , , , , )
oMsMGet:oBox:Align := CONTROL_ALIGN_ALLCLIENT

ACTIVATE MSDIALOG oDlgX CENTERED ON INIT EnchoiceBar(oDlgX, {|| ProcZZN(nOpcao)},{|| oDlgX:End() } )

Return()
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัอออออออออหอออออออัออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ ProcZZN บ Autor ณ BRUNO SOUZA  บ Data ณ  07/11/2019 บฑฑ
ฑฑฬออออออออออุอออออออออสอออออออฯออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ Funcao executada para gravacao dos dados.           บฑฑ
ฑฑศออออออออออฯอออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function ProcZZN(nOpcao)

dbSelectArea("ZZN")
dbSetOrder(1)

If empty(M->ZZN_EQUIP) .or. empty(M->ZZN_REV) .or. empty(M->ZZN_FAMILI) .or. empty(M->ZZN_RESP) .or. empty(M->ZZN_USOINI).or. empty(M->ZZN_FREQ).or. empty(M->ZZN_DEPTO) .or. empty(M->ZZN_STATUS)
	
	MSGSTOP("Preencha os campos obrigatorios!!")
	Return()
	
Endif 

If  nOpcao == 3
	
	If 	ZZN->(dbSeek(xFilial("ZZN")+M->ZZN_EQUIP))//+M->ZZN_REV))  
		MSGSTOP("Nใo ้ possivel concluir, equipamento ja cadastrado!!") 
		Return()
	EndIf 
	
		SX3->(dbSetOrder(1))
		SX3->(dbSeek( "ZZN" ))
		If RecLock( "ZZN" , .T. )
			While SX3->(!EOF()) .AND. Alltrim(SX3->X3_ARQUIVO) == "ZZN"
				
				cCpoR := "ZZN->" + Alltrim(SX3->X3_CAMPO)
				cCpoM := "M->" + Alltrim(SX3->X3_CAMPO)
				&(cCpoR) := &(cCpoM)
				
				SX3->(dbSkip())
			EndDo
		EndIf

	ZZN->ZZN_FILIAL	:= xFilial("ZZN")
	ZZN->(MsUnLock())
	
Elseif  nOpcao == 4 

	dbSelectArea("ZZN")
	dbSetOrder(1)

		SX3->(dbSetOrder(1))
		SX3->(dbSeek( "ZZN" ))
		If RecLock( "ZZN" , .F. )
			While SX3->(!EOF()) .AND. Alltrim(SX3->X3_ARQUIVO) == "ZZN"
				
				cCpoR := "ZZN->" + Alltrim(SX3->X3_CAMPO)
				cCpoM := "M->" + Alltrim(SX3->X3_CAMPO)
				&(cCpoR) := &(cCpoM)
				
				SX3->(dbSkip())
			EndDo
			MsUnlock()
		EndIf
Endif

oDlgX:End()

Return() 
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณDeleteZZN บAutor  ณMicrosiga           บ Data ณ  07/11/2019 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function DeleteZZN()

If MsgYesNo("Deseja excluir este cadastro?")  

	If RecLock( "ZZN" , .F. )
		ZZN->(dbDelete())
		MsUnlock()
	EndIf
EndIf

Return() 
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณAtuvZZN   บAutor  ณMicrosiga           บ Data ณ  07/11/2019 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณAtualiza validade e revisao do bem cadastrado de acordo com บฑฑ
ฑฑบ          ณa data da ultima OS preventiva realizada. "manualmente"     บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function AtuvZZN()     

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
	If dDataatu > ZZN_VAL .AND. ZZN->ZZN_FREQ <> 'N'
		RECLOCK("ZZN", .F.)
		ZZN->ZZN_VAL := dDataatu
		MSUNLOCK()
    EndIf*/
	TEMP->(dbSkip())
EndDo
TEMP->(dbCloseArea())   

Return()
