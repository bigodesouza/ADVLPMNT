#INCLUDE "Protheus.Ch"
#INCLUDE "RwMake.Ch"
#INCLUDE "TopConn.Ch"
#INCLUDE "FiveWin.Ch"
#INCLUDE "FWMVCDEF.CH"
/*/
��������������������������������������������������������������������
��������������������������������������������������������������������
����������������������������������������������������������������ͻ��
���Programa� INAMN09 � Autor �Bruno E. de Souza� Data � 30/01/20 ���
����������������������������������������������������������������͹��
���Descricao � Tela Tipos de  Check List Preventiva              ���
����������������������������������������������������������������ͼ��
��������������������������������������������������������������������
��������������������������������������������������������������������
/*/
User Function INAMN09()
	
	Private oBrowse
	Private crev := 0
	
	oBrowse := FWMBrowse():New()
	oBrowse:SetAlias("ZM2")
	oBrowse:SetDescription("Cadastro Tipo CkeckList Preventiva") 

	oBrowse:Activate()  
	
Return()
/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa� MenuDef	� Autor �Bruno E. de Souza   � Data � 30/01/20 	  ���
�������������������������������������������������������������������������͹��
���Descri��o � Menudef                                                    ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/
Static Function MenuDef()
	
	Local aRotina := {}

	ADD OPTION aRotina TITLE "Pesquisar"  		ACTION "PesqBrw" 			OPERATION 1 ACCESS 0
	ADD OPTION aRotina TITLE "Visualizar" 		ACTION "VIEWDEF.INAMN09" 	OPERATION 2 ACCESS 0   
	ADD OPTION aRotina TITLE "Incluir" 	   		ACTION "VIEWDEF.INAMN09" 	OPERATION 3 ACCESS 0
	ADD OPTION aRotina TITLE "Alterar"  	  	ACTION "VIEWDEF.INAMN09" 	OPERATION 4 ACCESS 0
	ADD OPTION aRotina TITLE "Imprimir" 		ACTION "VIEWDEF.INAMN09" 	OPERATION 8 ACCESS 0
	ADD OPTION aRotina TITLE "Excluir" 	   		ACTION "VIEWDEF.INAMN09"	OPERATION 5 ACCESS 0

Return aRotina

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Fun��o    �ModelDef  � Autor � Vitor Badam		 � Data � 30/01/2020  ���
�������������������������������������������������������������������������͹��
���Descri��o � Modeldef                                                   ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/
Static Function ModelDef()

Local oStruF1	:= FWFormStruct( 1, 'ZM2', { |cCampo| CarCpCpo(cCampo,"1") } )
Local oModel  

oModel := MPFormModel():New( 'MINAMN09',, )

// Adiciona ao modelo uma estrutura de formul�rio de edi��o por campo
oModel:AddFields( 'PFDF1', /*cOwner*/, oStruF1, /*bPreValidacao*/, /*bPosValidacao*/, /*bCarga*/ ) 
 
// Criar uma chave primaria
oModel:SetPrimaryKey( {} )  

oModel:SetDescription( 'Cadastro Tipo CkeckList Preventiva' ) 
oModel:GetModel( 'PFDF1' ):SetDescription( 'Cadastro Tipo CkeckList Preventiva' ) 

Return oModel
/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Fun��o    �ViewDef   � Autor �Bruno E. de Souza	 � Data � 30/01/2020  ���
�������������������������������������������������������������������������͹��
���Descri��o � ViewDef                                                    ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/
Static Function ViewDef()

Local oStruF1	:= FWFormStruct( 2, 'ZM2', { |cCampo| CarCpCpo(cCampo,"1") } )
Local oModel	:= FWLoadModel( "INAMN09")
Local oView 	:= NIL     
           
oView := FWFormView():New()
oView:SetModel(oModel)

oView:AddField('VIEW_PFDF1', oStruF1, 'PFDF1' ) 

oView:CreateHorizontalBox( 'PRIMEIRA', 100 )
oView:SetOwnerView( 'VIEW_PFDF1', 'PRIMEIRA' )
oView:EnableTitleView('VIEW_PFDF1')

oStruF1:SetProperty( 'ZM2_CODIGO'	 ,MVC_VIEW_CANCHANGE,.F.)

//oView:SetCloseOnOk( {||.F.} )
oView:SetCloseOnOk( {||.T.} )

oView:SetViewAction( 'BUTTONOK',{ |oView| msConfMvc() } ) 

Return oView   

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Fun��o    �CarCpCpo  � Autor �Bruno E. de Souza   � Data � 30/01/2020  ���
�������������������������������������������������������������������������͹��
���Descri��o � Carrega os campos em suas posi��es                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/
Static Function CarCpCpo(cCampo,cParte)

Local lRet	:= .T.   

If (Upper(Alltrim(cCampo)) $ "ZM2_FILIAL") 
	lRet := .F.
EndIf

Return lRet  
/*������������������������������������������������������������������������������
��������������������������������������������������������������������������������
����������������������������������������������������������������������������Ŀ��
���Programa   �ZM2CODVER� Autores �Bruno E. de Souza       � Data �30/01/2020���
����������������������������������������������������������������������������Ĵ��
���Descricao  � Busca o ultimo numero da ZM2                                 ���
���           �                                                              ���
�����������������������������������������������������������������������������ٱ�
��������������������������������������������������������������������������������
������������������������������������������������������������������������������*/
User Function ZM2CODVER()

Local _cQuery := Nil
Local _nDoc   := Nil

_cQuery := " SELECT MAX(ZM2_CODIGO)+1 DOC "   					+ CRLF
_cQuery += " FROM "+RetSqlName("ZM2_CODIGO")+" ZM2 " 			+ CRLF
_cQuery += " WHERE ZM2.D_E_L_E_T_ != '*' "    					+ CRLF
_cQuery += " AND   ZM2_FILIAL  = '" + xFilial("ZM2") + "' "	 	+ CRLF

dbUseArea(.T.,"TOPCONN", TCGenQry(,,_cQuery),'ZM2TMP',.F.,.T.)

_nDoc := strzero(ZM2TMP->DOC,4)

ZM2TMP->(DbCloseArea())

Return(_nDoc)

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �msConfMvc �Autor  �Microsiga           � Data �  29/09/20   ���
�������������������������������������������������������������������������͹��
���Desc.     �                                                            ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function msConfMvc() 

	Local lRet := .T.

		crev := ZM2->ZM2_REVIS + 1
    	crev := StrZero(crev,3)

		If Reclock( "ZM2" , .F. )

			ZM2->ZM2_REVIS  := VAL(crev)   //Revisao de Altera��o
			//SB1->B1_X_DTFAM  := Date() //Data da Altera��o

			ZM2->(MsUnlock())

		Endif
	
Return lRet
