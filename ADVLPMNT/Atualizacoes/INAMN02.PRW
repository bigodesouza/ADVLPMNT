#Include "Protheus.Ch"
#Include "TopConn.Ch"
#Include "FileIO.ch"
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³INAMN02   º Autor ³ Bruno Souza  º Data ³  30/04/14   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³Solicitaçao de Serviço Manutençao			            º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
User Function INAMN02()                           

Local cFiltra       := "ZMS->ZMS_USERID == __CUSERID"
Local cFiltraADM    := "ZMS->ZMS_STATUS == '6' .OR. ZMS->ZMS_STATUS == '4' .OR. ZMS->ZMS_STATUS == '3' .OR. ZMS->ZMS_STATUS == '1'"////"ZMS->ZMS_NUM <> '1'"//
Private cCadastro   := "SOLICITAÇÃO SERVIÇO MANUTENÇÃO"
Private aRotina     := {}
Private cString     := "ZMS"
Private aIndexZMS   := {}
Private bFiltraBrw  := { || FilBrowse(cString,@aIndexZMS,@cFiltra) }
Private bFiltraADM  := { || FilBrowse(cString,@aIndexZMS,@cFiltraADM) }
//Private cDepart     := UPPER(ALLTRIM(Right(cUserName,3)))
Private cDepartTI	:=(Alltrim(cUserName))   
Private cUseresp    :=(Alltrim(cUserName)) //usuario responsaveis visualizam todas SS  
Private cParuser    := AllTrim(GETMV("IN_MNTRESP"))  

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Quebra do aRotina, caso haja necessidade de configurar³
//³vizualição para determinados usuários.                ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If cDepartTI $ "TDI*Administrador" .OR. cUseresp $ cParuser // cDepart $ "MNT*FER" .OR. 
	Aadd( aRotina , {"Pesquisar " 	 	,"Axpesqui"					,0,1 })
	Aadd( aRotina , {"Visualizar" 	 	,"AxVisual"			   		,0,2 })
	Aadd( aRotina , {"Legenda"	  	 	,"u_ZMSLEG(cString,6)" 		,0,6 })
	Aadd( aRotina , {"Alterar"	  	 	,"u_INCLUIZMS(cString,4)"  	,0,4 })
	Aadd( aRotina , {"Incluir"	  	 	,"u_INCLUIZMS(cString,3)" 	,0,3 })
	Aadd( aRotina , {"Associar O.S"   	,"u_INCLUIZMS(cString,7)" 	,0,4 })
	Aadd( aRotina , {"Finalizar S.S" 	,"u_FINALSS(cString,6)" 	,0,6 })
	Aadd( aRotina , {"Reenviar WF S.S"  ,"u_SSEMAIL(cString,8)" 	,0,2 })
	Aadd( aRotina , {"Reeprimir S.S"  	,"u_IMPSS(cString,9)" 	    ,0,2 })
	Aadd( aRotina , {"Cancelar S.S"    ,"u_INCLUIZMS(cString,10)" 	,0,4 })
	Aadd( aRotina , {"Andamento S.S"   ,"u_INCLUIZMS(cString,11)" 	,0,4 })
	Aadd( aRotina , {"Hist. S.S Atendidas","u_INAMN03()" 			,0,2 })
  //Aadd( aRotina , {"Pesqui. Satisf."  ,"u_SATISUS(cString,5)" 	,0,2 }) 


Else
	Aadd( aRotina , {"Pesquisar " 	 	,"Axpesqui"					,0,1 })
	Aadd( aRotina , {"Visualizar" 	 	,"AxVisual"			   		,0,2 })
	Aadd( aRotina , {"Legenda"	  	 	,"u_ZMSLEG(cString,6)" 		,0,6 })
	Aadd( aRotina , {"Alterar"	  	 	,"u_INCLUIZMS(cString,4)"  	,0,4 })
	Aadd( aRotina , {"Incluir"	  	 	,"u_INCLUIZMS(cString,3)" 	,0,3 })
	Aadd( aRotina , {"Reenviar WF S.S"  ,"u_SSEMAIL(cString,8)" 	,0,2 })
	Aadd( aRotina , {"Reeprimir S.S"  	,"u_IMPSS(cString,9)" 	    ,0,2 })

EndIf

Private aCores := { {' Alltrim(ZMS->ZMS_STATUS) == "1" '  ,'BR_VERMELHO'},;
{' Alltrim(ZMS->ZMS_STATUS) == "5" '  					   ,'BR_LARANJA' },;
{' Alltrim(ZMS->ZMS_STATUS) == "6" '  					   ,'BR_AZUL'	 },;  
{' Alltrim(ZMS->ZMS_STATUS) == "3" '  					   ,'BR_AMARELO' },;
{' Alltrim(ZMS->ZMS_STATUS) == "2" '   					   ,'BR_VERDE'   }}  
//{' Alltrim(ZMS->ZMS_STATUS) == "4" '  					   ,'BR_PRETO'	 },;


If cDepartTI $ "TDI*Administrador" .OR. cUseresp $ cParuser //If cDepart $ "MNT*FER" .OR. 
	Eval(bFiltraADM)
	DbSelectArea(cString)
	dbSetOrder(1)                              //admin TI e manutençao consegue visualizar todas SS
 	Mbrowse(6,1,22,74,cString,,,,,,aCores)
   
Else
	Eval(bFiltraBrw)
	DbSelectArea(cString)
	dbSetOrder(1)                                   //Usuarios so visualizam suas SS
	Mbrowse(6,1,22,74,cString,,,,,,aCores)
EndIf

Return
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma   	ZMSLEG  ºAutor  ³Bruno Souza         º Data ³30/04/2014   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³Legenda do browse.                                          º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³Paranoa - Tapetes                                           º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
User Function ZMSLEG()

Local cCadastro:= "Status da Solicitação de Serviço"

Local aCores	:=	{	{'BR_VERMELHO' 	,'NAO ATENDIDO'								},;
						{	 'BR_LARANJA'  	,'CANCELADO'			   				},;
						{	 'BR_AZUL'  	,'EM ANDAMENTO'			   				},; 
						{	 'BR_AMARELO'  	,'EM APROVAÇAO PELO USUARIO (FINALIZAR)'},;
						{    'BR_VERDE' 	,'ATENDIDO'								} }  


//{	 'BR_PRETO'  	,'REJEITADO'				},;                                                     
//{	 'BR_AMARELO'  	,'EM APROVAÇAO PELO USUARIO'},;
BrwLegenda(cCadastro,"Legenda",aCores)

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³INCLUIZMS º Autor ³ BRUNO SOUZA  º Data ³  30/04/14   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Altera Campo do cadastro					            º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
User Function INCLUIZMS(cAlias,nOpcao)

Local cTituloTela := "SOLICITAÇÃO SERVIÇO MANUTENÇÃO "
Local aAltera     := {}
Local aExibir     := {}
Private oDlgX     := Nil
Private aAdvSize  := MsAdvSize()
Private oFont16N  := TFont():New( "Arial" , , 16 , , .T. , , , , , .F. , .F. )

aAdvSize[6] -= (1/100) * aAdvSize[6]
aAdvSize[5] -= (1/100) * aAdvSize[5]

If nOpcao == 4 .AND. ZMS->ZMS_STATUS == "2"
	
	MSGALERT("Não é possivel alterar SS ja finalizada.")
	Return
EndIf

/*If nOpcao == 4 .AND. ZMS->ZMS_STATUS == "3"
	
	MSGALERT("Não é possivel alterar SS em pesquisa de satisfação")
	Return
EndIf*/

/*If nOpcao == 4 .AND. ZMS->ZMS_STATUS == "4"
	
	MSGALERT("Não é possivel alterar SS rejeitada")
	Return
EndIf */

If nOpcao == 4 .AND. ZMS->ZMS_STATUS == "5" .OR. nOpcao == 7 .AND. ZMS->ZMS_STATUS == "5"
	
	MSGALERT("Não é possivel associar O.S ou alterar SS cancelada")
	Return
EndIf  

If nOpcao == 4 .AND. ZMS->ZMS_STATUS == "6"
	
	MSGALERT("Não é possivel alterar SS em andamento")
	Return
EndIf 

/*If nOpcao == 10 .AND. ZMS->ZMS_STATUS == "3"
	
	MSGALERT("Não é possivel Cancelar SS em aprovação do usuario")
	Return
EndIf */

If nOpcao == 10 .AND. ZMS->ZMS_STATUS == "2"
	
	MSGALERT("Não é possivel cancelar SS atendida")
	Return
EndIf   

If nOpcao == 11 .AND. ZMS->ZMS_STATUS == "5" 
	
	MSGALERT("SS cancelada, não é possivel alterar")
	Return
EndIf 

If nOpcao == 11 .AND. ZMS->ZMS_STATUS == "2" 
	
	MSGALERT("SS ja atendida, não é possivel alterar")
	Return
EndIf   

/*If nOpcao == 11 .AND. ZMS->ZMS_STATUS == "3"
	
	MSGALERT("Não é possivel alterar, aguarde envio de satisfação do usuario")
	Return
EndIf*/


If nOpcao == 4
	RegToMemory( cAlias, .F.)
	aAltera :=  {"ZMS_NUM","ZMS_DATA","ZMS_HORA","ZMS_PRIOD","ZMS_USER","ZMS_SETOR","ZMS_RAMAL","ZMS_AREA","ZMS_PARADA","ZMS_MAQ","ZMS_CODMAQ","ZMS_SOLDES","NOUSER" }
ElseIf nOpcao == 3
	RegToMemory( cAlias, .T.)
	aAltera :=  {"ZMS_FILIAL","ZMS_NUM","ZMS_DATA","ZMS_HORA","ZMS_PRIOD","ZMS_USER","ZMS_SETOR","ZMS_RAMAL","ZMS_AREA","ZMS_PARADA","ZMS_MAQ","ZMS_CODMAQ","ZMS_SOLDES","NOUSER" }
ElseIf nOpcao == 7
	RegToMemory( cAlias, .F.)
	aAltera :=  {"ZMS_OS","NOUSER"}
ElseIf nOpcao == 10
	RegToMemory( cAlias, .F.)
	aAltera :=  {"ZMS_CANCEL","NOUSER"}
ElseIf nOpcao == 11
	RegToMemory( cAlias, .F.)
	aAltera :=  {"ZMS_ANDAME","NOUSER"}
EndIf

aExibir :=  {"ZMS_NUM","ZMS_DATA","ZMS_HORA","ZMS_PRIOD","ZMS_USER","ZMS_SETOR","ZMS_RAMAL","ZMS_AREA","ZMS_PARADA","ZMS_MAQ","ZMS_CODMAQ","ZMS_SOLDES","ZMS_OS","ZMS_CANCEL","ZMS_ANDAME","NOUSER" }

oDlgX := MSDialog():New(0,0,aAdvSize[6],aAdvSize[5],cTituloTela,,,,,,,,,.T.)
oDlgX:LCENTERED   := .T.
oDlgX:LMAXIMIZED  := .T.

oPanel01 := TPanel():New(0,0,cTituloTela,oDlgX,oFont16N,.T.,.T.,NIL,NIL,aAdvSize[5],10,.F.,.T. )
oPanel01:nClrPane := 16776960
oPanel01:Align    := CONTROL_ALIGN_TOP

oPanel02 := TPanel():New(0,0, ,oDlgX,oFont16N,.F.,.F.,NIL,NIL,aAdvSize[5],45,.F.,.T. )
oPanel02:Align := CONTROL_ALIGN_ALLCLIENT

oMsMGet := MsmGet():New( cAlias , , nOpcao , , , ,aExibir , {5,5,aAdvSize[6],500} , aAltera , , , , , oPanel02 , , , , , , , , , , , )
oMsMGet:oBox:Align := CONTROL_ALIGN_ALLCLIENT

ACTIVATE MSDIALOG oDlgX CENTERED ON INIT EnchoiceBar(oDlgX, {|| ProcZMS(nOpcao)},{|| oDlgX:End() } )

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ ProcZMS º Autor ³ BRUNO SOUZA  º Data ³  30/04/14   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Funcao executada para gravacao dos dados.           º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function ProcZMS(nOpcao)

dbSelectArea("ZMS")
dbSetOrder(1)

If empty(M->ZMS_PRIOD) .or. empty(M->ZMS_SETOR) .or. empty(M->ZMS_RAMAL) .or. empty(M->ZMS_AREA) .or. empty(M->ZMS_PARADA).or. empty(M->ZMS_MAQ).or. empty(M->ZMS_SOLDES)
	
	MSGSTOP("Preencha os campos obrigatorios!!")
	Return
	
Endif

If  nOpcao == 3
	
	SX3->(dbSetOrder(1))
	SX3->(dbSeek( "ZMS" ))
	If RecLock( "ZMS" , .T. )
		While SX3->(!EOF()) .AND. Alltrim(SX3->X3_ARQUIVO) == "ZMS"
			
			If Alltrim(SX3->X3_CAMPO) <> "ZMS_NUM"  //PARA NAO GRAVAR SEQUENCIA DUPLICADA
			
			cCpoR := "ZMS->" + Alltrim(SX3->X3_CAMPO)
			cCpoM := "M->" + Alltrim(SX3->X3_CAMPO)
			&(cCpoR) := &(cCpoM)
			EndIf
			SX3->(dbSkip())
		EndDo
		
	EndIf
	
	ZMS->ZMS_NUM := U_ZMSNUMSE()
	ZMS->ZMS_FILIAL	:= xFilial("ZMS")
	ZMS->ZMS_USERID := __CUSERID
	ZMS->(MsUnLock())
	
	MsgRun("Enviando Email para Manutençao ..." ,,{|| U_SSEMAIL()})
	MsgRun("Gerando Impressao ..." 				,,{|| U_IMPSS()})
	
Elseif  nOpcao == 4 .OR. nOpcao == 7
	
	dbSelectArea("ZMS")
	dbSetOrder(1)
	If ZMS->(dbSeek(xFilial("ZMS")+ M->ZMS_NUM))
		
		SX3->(dbSetOrder(1))
		SX3->(dbSeek( "ZMS" ))
		If RecLock( "ZMS" , .F. )
			While SX3->(!EOF()) .AND. Alltrim(SX3->X3_ARQUIVO) == "ZMS"
				
				cCpoR := "ZMS->" + Alltrim(SX3->X3_CAMPO)
				cCpoM := "M->" + Alltrim(SX3->X3_CAMPO)
				&(cCpoR) := &(cCpoM)
				
				SX3->(dbSkip())
			EndDo
			MsUnlock()
		EndIf
	Endif
	
Elseif  nOpcao == 10  //campo cancelamento
	If empty(M->ZMS_CANCEL)
		MSGSTOP("Preencha Motivo de Cancelamento!!")
		Return
		
	Endif
	
	dbSelectArea("ZMS")
	dbSetOrder(1)
	If ZMS->(dbSeek(xFilial("ZMS")+ M->ZMS_NUM))
		
		SX3->(dbSetOrder(1))
		SX3->(dbSeek( "ZMS" ))
		If RecLock( "ZMS" , .F. )
			While SX3->(!EOF()) .AND. Alltrim(SX3->X3_ARQUIVO) == "ZMS"
				
				cCpoR := "ZMS->" + Alltrim(SX3->X3_CAMPO)
				cCpoM := "M->" + Alltrim(SX3->X3_CAMPO)
				&(cCpoR) := &(cCpoM)
				
				SX3->(dbSkip())
			EndDo
			MsUnlock()
		EndIf
	Endif
	MsgRun("Enviando Email Motivo Cancelamento ..." ,,{|| U_CANCELSS()})     
	
	Elseif  nOpcao == 11  //campo cancelamento
	If empty(M->ZMS_ANDAME)
		MSGSTOP("Preencha Andamento da SS!!")
		Return
		
	Endif
	
	dbSelectArea("ZMS")
	dbSetOrder(1)
	If ZMS->(dbSeek(xFilial("ZMS")+ M->ZMS_NUM))
		
		SX3->(dbSetOrder(1))
		SX3->(dbSeek( "ZMS" ))
		If RecLock( "ZMS" , .F. )
			While SX3->(!EOF()) .AND. Alltrim(SX3->X3_ARQUIVO) == "ZMS"
				
				cCpoR := "ZMS->" + Alltrim(SX3->X3_CAMPO)
				cCpoM := "M->" + Alltrim(SX3->X3_CAMPO)
				&(cCpoR) := &(cCpoM)
				
				SX3->(dbSkip())
			EndDo
			MsUnlock()
		EndIf
	Endif
	MsgRun("Enviando Email Andamento da SS ..." ,,{|| U_ANDAMSS()})
	
Endif

oDlgX:End()

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ZMSNUMSE  ºAutor  ³Bruno E. Souza      º Data ³  07/23/14   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Pega sequencia correta para o campo ZMS_NUM                º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ AP                                                         º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
User Function ZMSNUMSE()

Local _cQuery := Nil
Local _nDoc   := Nil

_cQuery := " SELECT MAX(ZMS_NUM)+1 DOC "   				     	+ CRLF
_cQuery += " FROM "+RetSqlName("ZMS")+" ZMS WITH(NOLOCK) " 		+ CRLF
_cQuery += " WHERE ZMS.D_E_L_E_T_ != '*' "    					+ CRLF
_cQuery += " AND   ZMS_FILIAL  = '" + xFilial("ZMS") + "' "	 	+ CRLF

dbUseArea(.T.,"TOPCONN", TCGenQry(,,_cQuery),'ZMSTMP',.F.,.T.)

_nDoc := strzero(ZMSTMP->DOC,6)

ZMSTMP->(DbCloseArea())

Return(_nDoc)  

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³FINALSS   ºAutor  ³Bruno e. de Souza   º Data ³  07/24/14   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Finaliza SS em aberto de com botao finaliza SS             º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ AP                                                         º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
User Function FINALSS() 

local _dDtfim := ddatabase
Local _horafim := SubStr(Time(),1,5)  

If ZMS->ZMS_STATUS == "2"
	Msgalert("A Solicitação de Serviço  "+ZMS->ZMS_NUM+ " Ja foi finaliza")
	Return
Endif

/*If ZMS->ZMS_STATUS == "3"
	Msgalert("A Solicitação de Serviço  "+ZMS->ZMS_NUM+ " em pesquisa de Satisfação, não é possivel finalizar")
	Return
Endif */

/*If ZMS->ZMS_STATUS == "4"
	Msgalert("A Solicitação de Serviço  "+ZMS->ZMS_NUM+ " Rejeitada, não é possivel finalizar")
	Return
Endif */

If ZMS->ZMS_STATUS == "5"
	Msgalert("A Solicitação de Serviço  "+ZMS->ZMS_NUM+ " Cancelada, não é possivel finalizar")
	Return
Endif

If	MsgYesNo("Deseja Finalizar SS?")
	
	dbSelectArea("ZMS")
	dbSetOrder(1)
	
	If ZMS->(dbSeek(xFilial("ZMS")+ ZMS->ZMS_NUM)) .AND. ZMS->ZMS_STATUS == "1" .OR. ZMS->ZMS_STATUS == "3" //ALTERADO PARA ACEITAR FINALIZAR EM AMARELO 26/01/2015
		RecLock( "ZMS" , .F. )
	   	ZMS->ZMS_STATUS := "2" 
	   	ZMS->ZMS_SSHFIM := _horafim
		ZMS->ZMS_SSDFIM := _dDtfim
		ZMS->ZMS_USERF  := "M"   //finalizado pela Manutençao
		Msgalert("A Solicitaçao de Serviço  "+ZMS->ZMS_NUM+ " Finalizada com Sucesso!")
		MsUnLock()
	EndIf
EndIf

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³SSEMAIL   ºAutor  ³Bruno e. de Souza   º Data ³  07/24/14   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³Envia email para os responsaveis Manutençao                 º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ AP                                                         º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/

User Function SSEMAIL()

Local _cHtml	:= ""
Local _cEmail	:= AllTrim(GETMV("IN_MNTSS"))// parametro com email responsaveis da manutençao
Local _dData    := ZMS->ZMS_DATA

If ZMS->ZMS_STATUS == "2"
	Msgalert("A Solicitaçao de Serviço  "+ZMS->ZMS_NUM+ " Ja foi atendida, não é possivel reenviar email")
	Return
Endif

/*If ZMS->ZMS_STATUS == "3"
	Msgalert("A Solicitaçao de Serviço  "+ZMS->ZMS_NUM+ " Em pesquisa de Satisfação não é possivel reenviar email")
	Return
Endif*/

/*If ZMS->ZMS_STATUS == "4"
	Msgalert("A Solicitação de Serviço  "+ZMS->ZMS_NUM+ " Rejeitada não é possivel reenviar email")
	Return
Endif  */

If ZMS->ZMS_STATUS == "5"
	Msgalert("A Solicitação de Serviço  "+ZMS->ZMS_NUM+ " Cancelada não é possivel reenviar email")
	Return
Endif

If ZMS->ZMS_STATUS == "6"
	Msgalert("A Solicitação de Serviço  "+ZMS->ZMS_NUM+ " Em andamento não é possivel reenviar email")
	Return
Endif 

_dData := DTOS(_dData)

dbSelectArea("ZMS")
ZMS->(dbSetOrder(1))
If ZMS->(dbSeek(xFilial("ZMS")+ZMS->ZMS_NUM))
EndIf

_cHtml := "<html>  <head>   <title>SOLICITAÇAO DE SERVIÇO MANUTENÇAO " +ZMS->ZMS_NUM+"</title>  </head>   <body bgcolor='#F3F3F3' topmargin='0' leftmargin='0' rightmargin='0' bottommargin='0'>    <table width='100%' height='100%' border='0' align='center' cellspacing='20'>     <tr>      <td height='609' align='center' valign='top' bgcolor='#F3F3F3' scope='col'><table width='575' border='0' cellpadding='0' cellspacing='0' bgcolor='#FFFFFF'>       <tr>
_cHtml += " <th width='569' align='center' valign='top' scope='col'>SOLICITA&Ccedil;AO DE SERVI&Ccedil;O MANUTEN&Ccedil;AO </th>
_cHtml += "</tr><tr><td height='83' align='center' valign='top'><table width='98%' border='0' cellpadding='0' cellspacing='0'><tr><th align='center' valign='top' scope='col'><hr noshade='noshade' color='#EBEBEB' style='float:inherit' size='1'></th></tr><tr><td height='5'></td></tr></table><table width='100%' border='0' cellpadding='0' cellspacing='0'><tr><th scope='col'><table width='100%' height='100%' border='0' cellpadding='0' cellspacing='5'><tr><th width='20%' align='left' valign='top' scope='col'><font face='Arial, Helvetica, sans-serif' size='2' color='#666666'>
_cHtml += "	<b>Numero SS :<br>
_cHtml += "  Data Solici.:<br>
_cHtml += "  Hora Solicit:<br>
_cHtml += "  Prioridade:<br>
_cHtml += "  Solicitante:<br>
_cHtml += "  Setor:<br>
_cHtml += "  Ramal:<br>
_cHtml += "</b></font></th>                 <th width='33%' align='left' valign='top' scope='col'> 				<font face='Arial, Helvetica, sans-serif' size='2' color='#999999'>
_cHtml += + ZMS->ZMS_NUM   					+ " <br>"
_cHtml += + SUBSTRING(_dData,7,2)+"/"+SUBSTRING(_dData,5,2)+"/"+SUBSTRING(_dData,1,4) + " <br>"
_cHtml += + ZMS->ZMS_HORA  		   			+ " <br>"
_cHtml += + ZMS->ZMS_PRIOD 					+ " <br>"
_cHtml += + SUBSTRING(ZMS->ZMS_USER,1,22)	+ " <br>"
_cHtml += + ZMS->ZMS_SETOR					+ " <br>"
_cHtml += + ZMS->ZMS_RAMAL 					+ " <br>"
_cHtml += "  </font>					</th>
_cHtml += "  <th width='21%' align='left' valign='top' scope='col'> 				<font face='Arial, Helvetica, sans-serif' size='2' color='#666666'>
_cHtml += "    <b>Area:<br><br>
_cHtml += "    Parada:<br>
_cHtml += "    Maquina\Bem:<br>
_cHtml += "    Cod.Maq\Bem:<br>
_cHtml += "    Ordem Serv.:<br>
_cHtml += "  </b></font>				</th>
_cHtml += "  <th width='26%' align='left' valign='top' scope='col'><font face='Arial, Helvetica, sans-serif' size='2' color='#999999'>
_cHtml += + ZMS->ZMS_AREA	+   " <br>"
_cHtml += + ZMS->ZMS_PARADA	+   " <br>"
_cHtml += + ZMS->ZMS_MAQ	+   " <br>"
_cHtml += + ZMS->ZMS_CODMAQ	+   " <br>"
_cHtml += + ZMS->ZMS_OS		+   " <br>"
_cHtml += "  </font>					</th>
_cHtml += "</tr>             </table></th>           </tr>           <tr>           	<td height='5'><hr noshade='noshade' color='#EBEBEB' style='float:inherit' size='1' width='98%'></td>           </tr> 		  <tr>
_cHtml += "  <td align='center' valign='top' bgcolor='#CCCCCC'>&nbsp;</td>
_cHtml += "</tr> 		  <tr>            <td align='center' valign='top' bgcolor='#FFFFFF'><table width='100%' border='0'>     	<tr>           <th align='center' valign='middle' scope='col'><p>&nbsp;</p>
_cHtml += "                        <table width='72%' height='86' border='0' cellpadding='0' cellspacing='0'>
_cHtml += "                          <tr>
_cHtml += "                            <th height='19' align='center' valign='top' bgcolor='#000066' scope='col'><font color='#FFFFFF' face='Arial, Helvetica, sans-serif' size='2'>Descri&ccedil;ao Solicita&ccedil;ao </font></th>
_cHtml += "                          </tr>
_cHtml += "                          <tr>
_cHtml += "                            <td align='center' valign='middle' bgcolor='#F2F2FF'><font color='#333333' face='Arial, Helvetica, sans-serif' size='2'> <br>
_cHtml += + ZMS->ZMS_SOLDES		+   " <br>"
_cHtml += "                            </font></td>
_cHtml += "                          </tr>
_cHtml += "                        </table>
_cHtml += "                        <p>&nbsp;</p>                   </th>
_cHtml += "                      <th width='1%' align='center' valign='middle' scope='col'>&nbsp;</th>
_cHtml += "</tr>             </table></td>           </tr>         </table> 		</td>     </tr> 	<tr> 	<td height='24' align='center' valign='middle' bgcolor='#990000'><font color='#FFFFFF' face='Arial, Helvetica, sans-serif' size='2'><B>Workflow Inylbra - Favor não responder este e-mail</B></font></td> 	</tr>   </table></td>   </tr> </table> </body> </html>

u_GeraMail(,,,,_cEmail,"*** Solicitaçao de Serviço Manutençao " +ZMS->ZMS_NUM+" ***",_cHtml,,.T.)

Msgalert("A Solicitaçao de Serviço  "+ZMS->ZMS_NUM+ " Foi Enviada com Sucesso")

Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³IMPSS     ºAutor  ³Bruno e. de Souza   º Data ³  07/24/14   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ IMPRIME SOLICITAÇAO DE SERVIÇO                             º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ AP                                                         º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/

User Function IMPSS()

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Declara variaveis										                ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

Private oFont08b	:= TFont():New("Arial",,08,,.T.,,,,.T.,.F.)
Private oFont11b	:= TFont():New("Arial",,11,,.T.,,,,.T.,.F.)
Private oFont12b	:= TFont():New("Arial",,12,,.T.,,,,.T.,.F.)
Private oFont15b	:= TFont():New("Arial",,15,,.T.,,,,.T.,.F.)
Private oBrshCinza	:= TBrush():New("",CLR_GRAY)
Private nLinha	    := 0
Private oPrint
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Parametros																³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Processa( {|lEnd| LBRIMPOS()}, 'Aguarde...','Gerando relatório...', .t. )

Return

/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Programa   ³LBRIMPOS	³ Autores ³ Bruno E. de Souza      ³ Data ³06/06/2014³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao  ³  Imprime Informações Complementares                          ³±±
±±³           ³                                                              ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß*/
Static Function LBRIMPOS()

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Inicializa Objeto TMSPrinter					   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
oPrint  := TMSPrinter():New("SOLICITAÇÃO DE SERVIÇO")
lPrinter:= oPrint:IsPrinterActive()
oPrint:SetPortrait()  // Marca Radio Button para impressao em paisagem
oPrint:SetpaperSize(9) // Ajuste para papel a4

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Caso nao encontre a impressora conectada localmente,³
//³abre a tela para escolha de impressora de rede      ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

If !lPrinter
	oPrint:Setup()
Endif

If !oPrint:IsPrinterActive()
	MsgInfo("Não existe nenhum impressora conectada no computador, impressão cancelada!")
	Return
Endif

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Inicia a impressao										   ³
//³ da Frente do Relatorio									   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

oPrint:StartPage()
LBOSMNT()
oPrint:EndPage()

oPrint:Preview()

Return

/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Programa   ³LBOSMNT	³ Autores ³ Bruno E. de Souza      ³ Data ³06/06/2014³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao  ³  Imprime Cabeçalho do Relatorio                              ³±±
±±³           ³                                                              ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß*/
Static Function LBOSMNT()

Local nLinha  := 0
Local nBegin  := 0 
Local _dDatar := ZMS->ZMS_DATA
Local nCount  := 0

_dDatar := DTOS(_dDatar)

dbSelectArea("ZMS")
ZMS->(dbSetOrder(1))
If ZMS->(dbSeek(xFilial("ZMS")+ZMS->ZMS_NUM))
EndIf

oPrint:Box (3130,0040,0080,2320)

oPrint:FillRect( { 190 , 040 , 250 , 2320}, oBrshCinza )
oPrint:FillRect( { 730 , 040 , 790 , 2320}, oBrshCinza )  //preenchimento fundo cinza
oPrint:FillRect( { 1210, 040 , 1270, 2320}, oBrshCinza )
oPrint:FillRect( { 1930, 040 , 1990, 2320}, oBrshCinza )
oPrint:FillRect( { 2590, 040 , 2650, 2320}, oBrshCinza )

oPrint:Line(nLinha+0190,0040, nLinha+0190,2320) //1	    //Linha Horizontal
oPrint:Line(nLinha+0250,0040, nLinha+0250,2320) //2
oPrint:Line(nLinha+0310,0040, nLinha+0310,2320) //3
oPrint:Line(nLinha+0370,0040, nLinha+0370,2320) //4
oPrint:Line(nLinha+0430,0040, nLinha+0430,2320) //5
oPrint:Line(nLinha+0490,0040, nLinha+0490,1640) //6
oPrint:Line(nLinha+0550,0040, nLinha+0550,1640) //7
oPrint:Line(nLinha+0610,0040, nLinha+0610,2320) //8
oPrint:Line(nLinha+0670,0040, nLinha+0670,2320) //9
oPrint:Line(nLinha+0730,0040, nLinha+0730,2320) //10
oPrint:Line(nLinha+0790,0040, nLinha+0790,2320) //11
oPrint:Line(nLinha+0850,0040, nLinha+0850,2320) //12
oPrint:Line(nLinha+0910,0040, nLinha+0910,2320) //13
oPrint:Line(nLinha+0970,0040, nLinha+0970,2320) //14	    //Linha Horizontal
oPrint:Line(nLinha+1030,0040, nLinha+1030,2320) //15
oPrint:Line(nLinha+1090,0040, nLinha+1090,2320) //16
oPrint:Line(nLinha+1150,0040, nLinha+1150,2320) //17
oPrint:Line(nLinha+1210,0040, nLinha+1210,2320) //18
oPrint:Line(nLinha+1270,0040, nLinha+1270,2320) //19
oPrint:Line(nLinha+1330,0040, nLinha+1330,2320) //20
oPrint:Line(nLinha+1390,0040, nLinha+1390,2320) //21
oPrint:Line(nLinha+1450,0040, nLinha+1450,2320) //22
oPrint:Line(nLinha+1510,0040, nLinha+1510,2320) //23
oPrint:Line(nLinha+1570,0040, nLinha+1570,2320) //24
oPrint:Line(nLinha+1630,0040, nLinha+1630,2320) //25
oPrint:Line(nLinha+1690,0040, nLinha+1690,2320) //26
oPrint:Line(nLinha+1750,0040, nLinha+1750,2320) //27
oPrint:Line(nLinha+1810,0040, nLinha+1810,2320) //28
oPrint:Line(nLinha+1870,0040, nLinha+1870,2320) //29
oPrint:Line(nLinha+1930,0040, nLinha+1930,2320) //30
oPrint:Line(nLinha+1990,0040, nLinha+1990,2320) //31
oPrint:Line(nLinha+2050,0040, nLinha+2050,2320) //32
oPrint:Line(nLinha+2110,0040, nLinha+2110,2320) //33
oPrint:Line(nLinha+2170,0040, nLinha+2170,2320) //34
oPrint:Line(nLinha+2230,0040, nLinha+2230,2320) //35
oPrint:Line(nLinha+2290,0040, nLinha+2290,2320) //36
oPrint:Line(nLinha+2350,0040, nLinha+2350,2320) //37
oPrint:Line(nLinha+2410,0040, nLinha+2410,2320) //38
oPrint:Line(nLinha+2470,0040, nLinha+2470,2320) //39
oPrint:Line(nLinha+2530,0040, nLinha+2530,2320) //40
oPrint:Line(nLinha+2590,0040, nLinha+2590,2320) //41
oPrint:Line(nLinha+2650,0040, nLinha+2650,2320) //42 
oPrint:Line(nLinha+2710,0040, nLinha+2710,2320) //43
oPrint:Line(nLinha+2770,0040, nLinha+2770,2320) //44
oPrint:Line(nLinha+2830,0040, nLinha+2830,2320) //45
oPrint:Line(nLinha+2890,0040, nLinha+2890,2320) //46
oPrint:Line(nLinha+2950,0040, nLinha+2950,2320) //47
oPrint:Line(nLinha+3010,0040, nLinha+3010,2320) //48
oPrint:Line(nLinha+3070,0040, nLinha+3070,2320) //49
//oPrint:Line(nLinha+3130,0040, nLinha+3130,2320) //50
//oPrint:Line(nLinha+3190,0040, nLinha+3190,2320) //51

oPrint:Line(nLinha+0080,0380, nLinha+0190,0380) //1     //Linhas Verticais
oPrint:Line(nLinha+0080,1940, nLinha+0190,1940) //2
oPrint:Line(nLinha+0310,1160, nLinha+0370,1160) //3
oPrint:Line(nLinha+0370,1640, nLinha+0610,1640) //4
oPrint:Line(nLinha+1270,0470, nLinha+1930,0470) //5
oPrint:Line(nLinha+1270,1000, nLinha+1930,1000) //6
oPrint:Line(nLinha+1990,0480, nLinha+2590,0480) //7
oPrint:Line(nLinha+1990,0805, nLinha+2590,0805) //8
oPrint:Line(nLinha+1990,1130, nLinha+2590,1130) //9
oPrint:Line(nLinha+1990,1455, nLinha+2590,1455) //10
oPrint:Line(nLinha+1990,1780, nLinha+2590,1780) //11
oPrint:Line(nLinha+1990,2105, nLinha+2590,2105) //12 
oPrint:Line(nLinha+1990,1130, nLinha+2590,1130) //13
oPrint:Line(nLinha+1990,1455, nLinha+2590,1455) //14
oPrint:Line(nLinha+1990,1780, nLinha+2590,1780) //15
oPrint:Line(nLinha+1990,2105, nLinha+2590,2105) //16 
oPrint:Line(nLinha+2650,0480, nLinha+3130,0480) //17
oPrint:Line(nLinha+2650,0710, nLinha+3130,0710) //18  
oPrint:Line(nLinha+2650,0970, nLinha+3130,0970) //19
oPrint:Line(nLinha+2650,1230, nLinha+3130,1230) //20
oPrint:Line(nLinha+2650,1455, nLinha+3130,1455) //21
oPrint:Line(nLinha+2650,1680, nLinha+3130,1680) //22 
oPrint:Line(nLinha+2650,1900, nLinha+3130,1900) //23

oPrint:Say(0110,0100,"INYLBRA" 			      ,oFont15b)
oPrint:Say(0110,0860,"SOLICITAÇÃO DE SERVIÇO" ,oFont15b)
oPrint:Say(0080,1945,"Nº S.S" 				  ,oFont15b)
oPrint:Say(0120,2000,ZMS->ZMS_NUM			  ,oFont15b)

oPrint:Say(0200,1050,"REQUISITANTE" 		 ,oFont12b)

oPrint:Say(0255,0050,"Solicitante" 			 			 ,oFont08b)
oPrint:Say(0280,0050,SUBSTRING(ZMS->ZMS_USER,1,24)		 ,oFont08b)

oPrint:Say(0255,0470,"Data" 		 			 															 ,oFont08b)
oPrint:Say(0280,0470,SUBSTRING(_dDatar,7,2)+"/"+SUBSTRING(_dDatar,5,2)+"/"+SUBSTRING(_dDatar,1,4)			 ,oFont08b)

oPrint:Say(0255,0650,"Hora" 		 	     ,oFont08b)
oPrint:Say(0280,0650,ZMS->ZMS_HORA			 ,oFont08b)

oPrint:Say(0255,0770,"Ramal" 		 		 ,oFont08b)
oPrint:Say(0280,0770,ZMS->ZMS_RAMAL			 ,oFont08b)

oPrint:Say(0255,0935,"Status" 		                     ,oFont08b)
If ZMS->ZMS_STATUS == "1"
	oPrint:Say(0280,0935,"NAO ATENDIDO" 				 ,oFont08b)
Elseif ZMS->ZMS_STATUS == "2"
	oPrint:Say(0280,0935,"ATENDIDO" 	 				 ,oFont08b)
/*Elseif ZMS->ZMS_STATUS == "3"
	oPrint:Say(0280,0935,"EM APROVAÇÃO PELO USUARIO" 	 ,oFont08b) 
Elseif ZMS->ZMS_STATUS == "4"
	oPrint:Say(0280,0935,"REJEITADO" 	 				 ,oFont08b)*/
Elseif ZMS->ZMS_STATUS == "5"
	oPrint:Say(0280,0935,"CANCELADA" 	 				 ,oFont08b) 
Elseif ZMS->ZMS_STATUS == "6"
	oPrint:Say(0280,0935,"EM ANDAMENTO" 	 			 ,oFont08b)
EndIf

oPrint:Say(0255,1170,"Nº OS" 		 ,oFont08b)
oPrint:Say(0280,1170,ZMS->ZMS_OS	 ,oFont08b)

oPrint:Say(0315,0045,"Area" 		 ,oFont08b)
oPrint:Say(0340,0045,ZMS->ZMS_AREA	 ,oFont08b)

oPrint:Say(0315,0650,"Setor" 		 ,oFont08b)
oPrint:Say(0340,0650,ZMS->ZMS_SETOR	 ,oFont08b)

oPrint:Say(0320,1170,"Prioridade" 	 ,oFont11b)
If ZMS->ZMS_PRIOD == 'A'
	oPrint:Say(0320,1400,"(X) Alta" 	 ,oFont11b)
	oPrint:Say(0320,1690,"(__) Média" 	 ,oFont11b)
	oPrint:Say(0320,1980,"(__) Baixa" 	 ,oFont11b)
	
ElseIf ZMS->ZMS_PRIOD == 'M'
	oPrint:Say(0320,1400,"(__) Alta" 	 ,oFont11b)
	oPrint:Say(0320,1690,"(X) Média" 	 ,oFont11b)
	oPrint:Say(0320,1980,"(__) Baixa" 	 ,oFont11b)
	
ElseIf ZMS->ZMS_PRIOD == 'B'
	oPrint:Say(0320,1400,"(__) Alta" 	 ,oFont11b)
	oPrint:Say(0320,1690,"(__) Média" 	 ,oFont11b)
	oPrint:Say(0320,1980,"(X) Baixa" 	 ,oFont11b)
	
Else
	oPrint:Say(0320,1400,"(__) Alta" 	 ,oFont11b)
	oPrint:Say(0320,1690,"(__) Média" 	 ,oFont11b)
	oPrint:Say(0320,1980,"(__) Baixa" 	 ,oFont11b)
EndIf

oPrint:Say(0375,0045,"Serviço Solicitado:" 	 ,oFont08b)

nLi := 0390
nCount:= MLCount(ZMS->ZMS_SOLDES,80)
For nBegin := 1 To iif(NCount > 6,6,NCount)
	if !Empty(MemoLine(ZMS->ZMS_SOLDES,80,nBegin))
		oPrint:Say (nLi,0295,MemoLine(ZMS->ZMS_SOLDES,80,nBegin) ,oFont08b)
		nLi := nLi + 60
	endif
Next nBegin

oPrint:Say(0375,1645,"Cód. Maq\Bem" 	,oFont08b)
oPrint:Say(0400,1645,ZMS->ZMS_CODMAQ	,oFont08b)

oPrint:Say(0375,1900,"Maquina\Bem" 	 	,oFont08b)
oPrint:Say(0400,1900,ZMS->ZMS_MAQ	 	,oFont08b)

oPrint:Say(0435,1645,"Parada:" 	 	 		     ,oFont08b)
If ZMS->ZMS_PARADA == 'T'
	oPrint:Say(0475,1645,"Total (X)" 	 	 	 ,oFont08b)
	oPrint:Say(0525,1645,"Parcial (__)" 	 	 ,oFont08b)
	oPrint:Say(0575,1645,"Sem Parada (__)" 	     ,oFont08b)
ElseIf ZMS->ZMS_PARADA == 'P'
	oPrint:Say(0475,1645,"Total (__)" 	 	 	 ,oFont08b)
	oPrint:Say(0525,1645,"Parcial (X)" 	 	     ,oFont08b)
	oPrint:Say(0575,1645,"Sem Parada (__)" 	     ,oFont08b)
ElseIf ZMS->ZMS_PARADA == 'S'
	oPrint:Say(0475,1645,"Total (__)" 	 	 	 ,oFont08b)
	oPrint:Say(0525,1645,"Parcial (__)" 	 	 ,oFont08b)
	oPrint:Say(0575,1645,"Sem Parada (X)" 	     ,oFont08b)
Else
	oPrint:Say(0475,1645,"Total (__)" 	 	 	 ,oFont08b)
	oPrint:Say(0525,1645,"Parcial (__)" 	 	 ,oFont08b)
	oPrint:Say(0575,1645,"Sem Parada (__)" 	     ,oFont08b)
EndIf

oPrint:Say(0740,1050,"MANUTENÇÃO" 		     ,oFont12b)

oPrint:Say(0795,0045,"Serviço executado:" 	 ,oFont08b)

oPrint:Say(1220,1050,"MATERIAL UTILIZADO" 	 ,oFont12b)

oPrint:Say(1280,0215,"Qtde" 	 	 		 ,oFont08b)
oPrint:Say(1280,0630,"Código do Material" 	 ,oFont08b)
oPrint:Say(1280,1500,"Descrição do material" ,oFont08b)

oPrint:Say(1940,1050,"MÃO DE OBRA UTILIZADA",oFont12b)

oPrint:Say(1995,0045,"Nome do Funcion." 	,oFont08b)
oPrint:Say(1995,0485,"R.E. do Funcion."    ,oFont08b)
oPrint:Say(1995,0810,"Data Início Tarefa"  ,oFont08b)
oPrint:Say(1995,1135,"Hora Início Tarefa"  ,oFont08b)
oPrint:Say(1995,1460,"Data Fim Tarefa" 	    ,oFont08b)
oPrint:Say(1995,1785,"Hora Fim tarefa"  	,oFont08b)
oPrint:Say(1995,2110,"Total Horas" 		    ,oFont08b)

oPrint:Say(2600,1050,"INTERRUPÇÕES" 	 ,oFont12b)
	
oPrint:Say(2655,0045,"Nome do Funcion." 	,oFont08b)
oPrint:Say(2655,0485,"R.E. do Funcion."    ,oFont08b)
oPrint:Say(2655,0715,"Data Início Tarefa"  ,oFont08b)
oPrint:Say(2655,0975,"Hora Início Tarefa"  ,oFont08b)
oPrint:Say(2655,1235,"Data Fim Tarefa" 	    ,oFont08b)
oPrint:Say(2655,1460,"Hora Fim tarefa"  	,oFont08b) 
oPrint:Say(2655,1685,"Total Horas" 		    ,oFont08b) 
oPrint:Say(2655,1905,"Motivo"	 		    ,oFont08b)

oPrint:Say(3180,0935,"NOME:__________________________ " 	,oFont11b)
oPrint:Say(3230,1060,"APROVAÇÃO DO SOLICITANTE "   			,oFont08b)
oPrint:Say(3180,1705,"DATA: ______/______/_________" 		,oFont11b)


Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³SATISUS   ºAutor  ³Bruno E. de Souza   º Data ³  07/30/14   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³Workflow para aprovacao de solicitacao de serviço           º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ AP                                                         º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
/*User Function SATISUS()

Local oProcess	:= Nil
Local cMailId	:= ""
Local cHtml		:= ""
Local cEmail	:= ""
Local cNum		:= ""
Local cSolicit  := ""

If ZMS->ZMS_STATUS == "2"
	Msgalert("A Solicitação de Serviço  "+ZMS->ZMS_NUM+ " Ja foi atendida, não é possivel Enviar Pesquisa de Satisfação")
	Return
EndIf
If ZMS->ZMS_STATUS == "5"
	Msgalert("A Solicitação de Serviço  "+ZMS->ZMS_NUM+ " Cancelada, não é possivel Enviar Pesquisa de Satisfação")
	Return
EndIf

If ZMS->ZMS_STATUS == "1" .OR. ZMS->ZMS_STATUS == "3" .OR. ZMS->ZMS_STATUS == "4" .OR. ZMS->ZMS_STATUS == "6" 
	RecLock( "ZMS" , .F. )
	ZMS->ZMS_STATUS := "3"
	Msgalert("A pesquisa de satisfação  "+ZMS->ZMS_NUM+ " Foi Enviada")
	MsUnLock()
EndIf   *

If PswSeek(AllTrim(ZMS->ZMS_USERID),.t.)
	cEmail := PswRet()[1][14]
EndIf

oProcess := TWFProcess():New("APROVSC","WORKFLOW PARA APROVACAO DE SS")
oProcess:NewTask("WORKFLOW PARA APROVACAO DE SS","\WORKFLOW\MNT\SATISUS_SOLI.HTML")

oProcess:oHTML:valbyname("cData"		, Date()				  						)
oProcess:oHTML:valbyname("cHora"		, Time()				  						)
oProcess:oHTML:valbyname("cNum"			, ZMS->ZMS_NUM					  				)
oProcess:oHTML:valbyname("cSolicit" 	, ZMS->ZMS_USER							        )
oProcess:oHTML:valbyname("OBS"			, ""											)

oProcess:cSubject 	:= "AprovaçaçÃo SolicitaçÃ serviço " + ZMS->ZMS_NUM
oProcess:cTo 		:= "APROVSC"
oProcess:bReturn  	:= "U_SATISUSR()"
cMailId 			:= oProcess:Start()
cHtml				:= cMailId + ".HTM"
oProcess:NewTask("LINK","\WORKFLOW\MNT\SATISUS_LINK.HTML")
oProcess:oHTML:ValByName("cNum"		, ZMS->ZMS_NUM)
oProcess:oHtml:ValByName("cLink"	, AllTrim("http://" + AllTrim(GetMv("ES_HTTPCOM")) + "/" + cHtml))
oProcess:cSubject	:= "Pesquisa Satisfação Solicitacão de Serviço " + ZMS->ZMS_NUM
oProcess:cTo		:= cEmail
oProcess:Start()

//Endif

Return Nil  */

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³SATISUSR  ºAutor  ³Bruno E. de souza   º Data ³  07/31/14   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Retorno Workflow SS                                        º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ AP                                                         º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
/*User Function SATISUSR(oProcess)

Local cNum		:= oProcess:oHTML:RetByName("cNum")
Local cObs		:= oProcess:oHTML:RetByName("OBS")
Local cOpc		:= oProcess:oHTML:RetByName("OPC")
Local cData		:= oProcess:oHTML:RetByName("cData")
Local cHora 	:= oProcess:oHTML:RetByName("cHora")
Local cSolicit 	:= oProcess:oHTML:RetByName("cSolicit")
Local cEmailm	:= AllTrim(GETMV("IN_MNTSS"))
local _dDtfimu  := ddatabase
Local _horafimu := SubStr(Time(),1,5) 

dbSelectArea("ZMS")
ZMS->(dbSetOrder(1))
ZMS->(dbSeek(xFilial("ZMS")+cNum))

If cOpc == "N"
	While !ZMS->(EOF()) .and. ZMS->ZMS_NUM == cNum
		Reclock("ZMS",.F.)
		ZMS->ZMS_STATUS := "4"
		ZMS->(msUnlock())
		ZMS->(dbSkip())
	End
	
	oProcess := TWFProcess():New("APROVSC","WORKFLOW PARA APROVACAO DE SS")
	oProcess:NewTask("WORKFLOW PARA APROVACAO DE SS","\WORKFLOW\MNT\SATISUSR.HTML")
	
	oProcess:oHTML:valbyname("cData"		, Date()				  						)
	oProcess:oHTML:valbyname("cHora"		, Time()				  						)
	oProcess:oHTML:valbyname("cNum"			, cNum					  			        	)
	oProcess:oHTML:valbyname("cSolicit" 	, cSolicit								        )
	oProcess:oHTML:valbyname("OBS"			, cObs											)
	
	oProcess:cSubject	:= "Solicitação de Serviço Rejeitada " + cNum
	oProcess:cTo		:= cEmailm
	oProcess:Start()
	
ElseIf cOpc == "S"
	While !ZMS->(EOF()) .and. ZMS->ZMS_NUM == cNum
		Reclock("ZMS",.F.)
		ZMS->ZMS_STATUS := "2" 
		ZMS->ZMS_SSHFIM := _horafimu 
		ZMS->ZMS_SSDFIM := _dDtfimu
		ZMS->ZMS_USERF  := "U" //finalizado pelo usuario  
		ZMS->(msUnlock())
		ZMS->(dbSkip())
	End
	
	oProcess := TWFProcess():New("APROVSC","WORKFLOW PARA APROVACAO DE SS")
	oProcess:NewTask("WORKFLOW PARA APROVACAO DE SS","\WORKFLOW\MNT\SATISUSA.HTML")
	
	oProcess:oHTML:valbyname("cData"		, Date()				  						)
	oProcess:oHTML:valbyname("cHora"		, Time()				  						)
	oProcess:oHTML:valbyname("cNum"			, cNum					  			        	)
	oProcess:oHTML:valbyname("cSolicit" 	, cSolicit							            )
	oProcess:oHTML:valbyname("OBS"			, cObs											)
	
	oProcess:cSubject	:= "Solicitacão de Serviço Aprovada " + cNum
	oProcess:cTo		:= cEmailm
	oProcess:Start()
	
EndIf

Return    */


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³CANCELSS  ºAutor  ³BRUNO E. DE SOUZA   º Data ³  08/06/14   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³CANCELA E ENVIA JUSTIFICATIVA PARA O SOLICITANTE            º±±
±±º          ³                                                            º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ AP                                                         º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/

User Function CANCELSS()  

Local _cHtmlc	:= ""
Local _cEmailc	:= ""
Local _dDatac   := ZMS->ZMS_DATA 
local _dDatcanc := DtoC(ddatabase)
Local _hOracanc := SubStr(Time(),1,5)  

_dDatac := DTOS(_dDatac)

If	MsgYesNo("Deseja Cancelar SS?")
	
	dbSelectArea("ZMS")
	ZMS->(dbSetOrder(1))
	If ZMS->(dbSeek(xFilial("ZMS")+ZMS->ZMS_NUM))
	EndIf
	
	If ZMS->(dbSeek(xFilial("ZMS")+ ZMS->ZMS_NUM)) //.AND. ZMS->ZMS_STATUS == "1" .OR.ZMS->ZMS_STATUS == "1"
		RecLock( "ZMS" , .F. )
		ZMS->ZMS_STATUS := "5"
		ZMS->ZMS_SSHFIM := _hOracanc
		ZMS->ZMS_SSDFIM := CTOD(_dDatcanc)
		ZMS->ZMS_USERF  := "C"   //finalizado por Cancelamento
		Msgalert("A Solicitaçao de Serviço  "+ZMS->ZMS_NUM+ " Cancelada com Sucesso!")
		MsUnLock()
	EndIf
	
	
	If PswSeek(AllTrim(ZMS->ZMS_USERID),.t.)
		_cEmailc := PswRet()[1][14]
	EndIf

_cHtmlc :="<html>  <head>   <title>SOLICITAÇAO DE SERVIÇO MANUTENÇAO CANCELAMENTO</title>  </head>   <body bgcolor='#F3F3F3' topmargin='0' leftmargin='0' rightmargin='0' bottommargin='0'>    <table width='100%' height='100%' border='0' align='center' cellspacing='20'>     <tr>      <td height='609' align='center' valign='top' bgcolor='#F3F3F3' scope='col'><table width='575' border='0' cellpadding='0' cellspacing='0' bgcolor='#FFFFFF'>       <tr>
_cHtmlc +=" <th width='569' align='center' valign='top' scope='col'>SOLICITA&Ccedil;AO DE SERVI&Ccedil;O CANCELADA </th>
_cHtmlc +=" </tr><tr><td height='83' align='center' valign='top'><table width='98%' border='0' cellpadding='0' cellspacing='0'><tr><th align='center' valign='top' scope='col'><hr noshade='noshade' color='#EBEBEB' style='float:inherit' size='1'></th></tr><tr><td height='5'></td></tr></table><table width='100%' border='0' cellpadding='0' cellspacing='0'><tr><th scope='col'><table width='100%' height='100%' border='0' cellpadding='0' cellspacing='5'><tr><th width='20%' align='left' valign='top' scope='col'><font face='Arial, Helvetica, sans-serif' size='2' color='#666666'>
_cHtmlc +="<b>Numero SS :<br>
_cHtmlc +=" Data Solici.:<br>
_cHtmlc +="  Hora Solicit:<br>
_cHtmlc +=" Prioridade:<br>
_cHtmlc +=" Solicitante:<br>
_cHtmlc +=" Setor:<br>
_cHtmlc +=" Ramal:<br>
_cHtmlc +="</b></font></th>                 <th width='33%' align='left' valign='top' scope='col'> 				<font face='Arial, Helvetica, sans-serif' size='2' color='#999999'>
_cHtmlc += + ZMS->ZMS_NUM   					+ " <br>"
_cHtmlc += + SUBSTRING(_dDatac,7,2)+"/"+SUBSTRING(_dDatac,5,2)+"/"+SUBSTRING(_dDatac,1,4) + " <br>"
_cHtmlc += + ZMS->ZMS_HORA  		   			+ " <br>"
_cHtmlc += + ZMS->ZMS_PRIOD 					+ " <br>"
_cHtmlc += + SUBSTRING(ZMS->ZMS_USER,1,22)	+ " <br>"
_cHtmlc += + ZMS->ZMS_SETOR					+ " <br>"
_cHtmlc += + ZMS->ZMS_RAMAL 					+ " <br>"
_cHtmlc +=" </font>					</th>
_cHtmlc +="  <th width='21%' align='left' valign='top' scope='col'> 				<p><font face='Arial, Helvetica, sans-serif' size='2' color='#666666'>
_cHtmlc +="    <b>Area:<br>
_cHtmlc +="      Parada:<br>
_cHtmlc +="      Maquina\Bem:<br>
_cHtmlc +="      Cod.Maq\Bem:<br>
_cHtmlc +="      Ordem Serv.:<br>
_cHtmlc +="	  Data Cancel:<br>
_cHtmlc +="	  Hora Cancel:<br>
_cHtmlc +="	  </b></font></p>
_cHtmlc +="   <p><font face='Arial, Helvetica, sans-serif' size='2' color='#666666'><b><br>
_cHtmlc +="      </b></font> </p></th>
_cHtmlc +="<th width='26%' align='left' valign='top' scope='col'><font face='Arial, Helvetica, sans-serif' size='2' color='#999999'>
_cHtmlc += + ZMS->ZMS_AREA	+   " <br>"
_cHtmlc += + ZMS->ZMS_PARADA	+   " <br>"
_cHtmlc += + ZMS->ZMS_MAQ	+   " <br>"
_cHtmlc += + ZMS->ZMS_CODMAQ	+   " <br>"
_cHtmlc += + ZMS->ZMS_OS		+   " <br>" 
_cHtmlc += + _dDatcanc	+   " <br>"
_cHtmlc += + _hOracanc	+   " <br>"
_cHtmlc +="</font>					</th>
_cHtmlc +="</tr>             </table></th>           </tr>           <tr>           	<td height='5'><hr noshade='noshade' color='#EBEBEB' style='float:inherit' size='1' width='98%'></td>           </tr> 		  <tr>
_cHtmlc +=" <td align='center' valign='top' bgcolor='#CCCCCC'>&nbsp;</td>
_cHtmlc +="</tr> 		  <tr>            <td align='center' valign='top' bgcolor='#FFFFFF'><table width='100%' border='0'>     	<tr>           <th align='center' valign='middle' scope='col'><p>&nbsp;</p>
_cHtmlc +="                       <table width='72%' height='86' border='0' cellpadding='0' cellspacing='0'>
_cHtmlc +="                          <tr>
_cHtmlc +="                           <th height='19' align='center' valign='top' bgcolor='#000066' scope='col'><font color='#FFFFFF' face='Arial, Helvetica, sans-serif' size='2'>Motivo Cancelamento </font></th>
_cHtmlc +="                        </tr>
_cHtmlc +="                          <tr>
_cHtmlc +="                           <td align='center' valign='middle' bgcolor='#F2F2FF'><font color='#333333' face='Arial, Helvetica, sans-serif' size='2'> <br>
_cHtmlc += + ZMS->ZMS_CANCEL		+   " <br>"
_cHtmlc +="                            </font></td>
_cHtmlc +="                          </tr>
_cHtmlc +="                        </table>
_cHtmlc +="                       <p>&nbsp;</p>                   </th>
_cHtmlc +="                     <th width='1%' align='center' valign='middle' scope='col'>&nbsp;</th>
_cHtmlc +="</tr>             </table></td>           </tr>         </table> 		</td>     </tr> 	<tr> 	<td height='24' align='center' valign='middle' bgcolor='#990000'><font color='#FFFFFF' face='Arial, Helvetica, sans-serif' size='2'><B>Workflow Inylbra - Favor não responder este e-mail</B></font></td> 	</tr>   </table></td>   </tr> </table> </body> </html>

	u_GeraMail(,,,,_cEmailc,"*** Motivo Cancelamento de SS " +ZMS->ZMS_NUM+" ***",_cHtmlc,,.T.)

	Msgalert("Motivo cancelamento da SS  "+ZMS->ZMS_NUM+ " Foi Enviada com Sucesso")
EndIf
	Msgalert("Cancelamento da SS "+ZMS->ZMS_NUM+ " não foi concluido!")
Return


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ANDAMSS	ºAutor  ³BRUNO E. DE SOUZA   º Data ³  08/07/14   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³indica que a SS esta em desenvolvimento pela MNT e envia    º±±
±±º          ³email ao solicitante                                        º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ AP                                                         º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/

User Function ANDAMSS()  

Local _cHtmla	:= ""
Local _cEmaila	:= ""
Local _dDataa   := ZMS->ZMS_DATA 
local _dDatcana := DtoC(ddatabase)
Local _hOracana := SubStr(Time(),1,5)  

_dDataa := DTOS(_dDataa)

If	MsgYesNo("Deseja Confirmar alteraçao SS?")
	
dbSelectArea("ZMS")
ZMS->(dbSetOrder(1))
If ZMS->(dbSeek(xFilial("ZMS")+ZMS->ZMS_NUM))
EndIf
	
	If ZMS->(dbSeek(xFilial("ZMS")+ ZMS->ZMS_NUM)) //.AND. ZMS->ZMS_STATUS == "1" .OR.ZMS->ZMS_STATUS == "1"
		RecLock( "ZMS" , .F. )
		ZMS->ZMS_STATUS := "6"
		Msgalert("A Solicitaçao de Serviço  "+ZMS->ZMS_NUM+ " Alterada com Sucesso!")
		MsUnLock()
	EndIf
EndIf   

If PswSeek(AllTrim(ZMS->ZMS_USERID),.t.)
	_cEmaila := PswRet()[1][14]
EndIf

_cHtmla :="<html>  <head>   <title>SOLICITAÇAO EM ANDAMENTO</title>  </head>   <body bgcolor='#F3F3F3' topmargin='0' leftmargin='0' rightmargin='0' bottommargin='0'>    <table width='100%' height='100%' border='0' align='center' cellspacing='20'>     <tr>      <td height='609' align='center' valign='top' bgcolor='#F3F3F3' scope='col'><table width='575' border='0' cellpadding='0' cellspacing='0' bgcolor='#FFFFFF'>       <tr>
_cHtmla +=" <th width='569' align='center' valign='top' scope='col'>SOLICITA&Ccedil;AO DE SERVI&Ccedil;O EM ANDAMENTO </th>
_cHtmla +=" </tr><tr><td height='83' align='center' valign='top'><table width='98%' border='0' cellpadding='0' cellspacing='0'><tr><th align='center' valign='top' scope='col'><hr noshade='noshade' color='#EBEBEB' style='float:inherit' size='1'></th></tr><tr><td height='5'></td></tr></table><table width='100%' border='0' cellpadding='0' cellspacing='0'><tr><th scope='col'><table width='100%' height='100%' border='0' cellpadding='0' cellspacing='5'><tr><th width='20%' align='left' valign='top' scope='col'><font face='Arial, Helvetica, sans-serif' size='2' color='#666666'>
_cHtmla +="<b>Numero SS :<br>
_cHtmla +=" Data Solici.:<br>
_cHtmla +="  Hora Solicit:<br>
_cHtmla +=" Prioridade:<br>
_cHtmla +=" Solicitante:<br>
_cHtmla +=" Setor:<br>
_cHtmla +=" Ramal:<br>
_cHtmla +="</b></font></th>                 <th width='33%' align='left' valign='top' scope='col'> 				<font face='Arial, Helvetica, sans-serif' size='2' color='#999999'>
_cHtmla += + ZMS->ZMS_NUM   					+ " <br>"
_cHtmla += + SUBSTRING(_dDataa,7,2)+"/"+SUBSTRING(_dDataa,5,2)+"/"+SUBSTRING(_dDataa,1,4) + " <br>"
_cHtmla += + ZMS->ZMS_HORA  		   			+ " <br>"
_cHtmla += + ZMS->ZMS_PRIOD 					+ " <br>"
_cHtmla += + SUBSTRING(ZMS->ZMS_USER,1,22)	+ " <br>"
_cHtmla += + ZMS->ZMS_SETOR					+ " <br>"
_cHtmla += + ZMS->ZMS_RAMAL 					+ " <br>"
_cHtmla +=" </font>					</th>
_cHtmla +="  <th width='21%' align='left' valign='top' scope='col'> 				<p><font face='Arial, Helvetica, sans-serif' size='2' color='#666666'>
_cHtmla +="    <b>Area:<br>
_cHtmla +="      Parada:<br>
_cHtmla +="      Maquina\Bem:<br>
_cHtmla +="      Cod.Maq\Bem:<br>
_cHtmla +="      Ordem Serv.:<br>
_cHtmla +="	  Data Cancel:<br>
_cHtmla +="	  Hora Cancel:<br>
_cHtmla +="	  </b></font></p>
_cHtmla +="   <p><font face='Arial, Helvetica, sans-serif' size='2' color='#666666'><b><br>
_cHtmla +="      </b></font> </p></th>
_cHtmla +="<th width='26%' align='left' valign='top' scope='col'><font face='Arial, Helvetica, sans-serif' size='2' color='#999999'>
_cHtmla += + ZMS->ZMS_AREA	+   " <br>"
_cHtmla += + ZMS->ZMS_PARADA	+   " <br>"
_cHtmla += + ZMS->ZMS_MAQ	+   " <br>"
_cHtmla += + ZMS->ZMS_CODMAQ	+   " <br>"
_cHtmla += + ZMS->ZMS_OS		+   " <br>" 
_cHtmla += + _dDatcana	+   " <br>"
_cHtmla += + _hOracana	+   " <br>"
_cHtmla +="</font>					</th>
_cHtmla +="</tr>             </table></th>           </tr>           <tr>           	<td height='5'><hr noshade='noshade' color='#EBEBEB' style='float:inherit' size='1' width='98%'></td>           </tr> 		  <tr>
_cHtmla +=" <td align='center' valign='top' bgcolor='#CCCCCC'>&nbsp;</td>
_cHtmla +="</tr> 		  <tr>            <td align='center' valign='top' bgcolor='#FFFFFF'><table width='100%' border='0'>     	<tr>           <th align='center' valign='middle' scope='col'><p>&nbsp;</p>
_cHtmla +="                       <table width='72%' height='86' border='0' cellpadding='0' cellspacing='0'>
_cHtmla +="                          <tr>
_cHtmla +="                           <th height='19' align='center' valign='top' bgcolor='#000066' scope='col'><font color='#FFFFFF' face='Arial, Helvetica, sans-serif' size='2'>Em Andamento </font></th>
_cHtmla +="                        </tr>
_cHtmla +="                          <tr>
_cHtmla +="                           <td align='center' valign='middle' bgcolor='#F2F2FF'><font color='#333333' face='Arial, Helvetica, sans-serif' size='2'> <br>
_cHtmla += + ZMS->ZMS_ANDAME		+   " <br>"
_cHtmla +="                            </font></td>
_cHtmla +="                          </tr>
_cHtmla +="                        </table>
_cHtmla +="                       <p>&nbsp;</p>                   </th>
_cHtmla +="                     <th width='1%' align='center' valign='middle' scope='col'>&nbsp;</th>
_cHtmla +="</tr>             </table></td>           </tr>         </table> 		</td>     </tr> 	<tr> 	<td height='24' align='center' valign='middle' bgcolor='#990000'><font color='#FFFFFF' face='Arial, Helvetica, sans-serif' size='2'><B>Workflow Inylbra - Favor não responder este e-mail</B></font></td> 	</tr>   </table></td>   </tr> </table> </body> </html>

u_GeraMail(,,,,_cEmaila,"*** SS em Andamento " +ZMS->ZMS_NUM+"***",_cHtmla,,.T.)

Msgalert("Em andamento SS  "+ZMS->ZMS_NUM+ " Foi Enviada com Sucesso")
Return
