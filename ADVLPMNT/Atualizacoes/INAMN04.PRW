#Include "Protheus.ch"
#INCLUDE "FWMVCDEF.CH"
/*
���������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������
�����������������������������������������������������������������������������������������ͻ��
���Programa   �IMAMN04 	 � Cadastro de Mecanico Por Turno					              ���
���           �          �                                                                ���
�����������������������������������������������������������������������������������������͹��
���Par�metros �Nil.                                                                       ���
�����������������������������������������������������������������������������������������͹��
���Retorno    �Nil                                                                        ���
�����������������������������������������������������������������������������������������Ķ��
���Autor      � 17/09/15 �Vitor Badam                                  					  ���
�����������������������������������������������������������������������������������������Ķ��
���Descricao  � Programacao em MVC                         								  ���
�����������������������������������������������������������������������������������������ͼ��
���������������������������������������������������������������������������������������������
���������������������������������������������������������������������������������������������
*/

User Function INAMN04()
	
	Private oBrowse
	
	oBrowse := FWMBrowse():New()
	oBrowse:SetAlias("ZZM")
	oBrowse:SetDescription("Mecanico por Turno") 

	oBrowse:Activate()  
	
Return

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Fun��o    �MenuDef   � Autor � Vitor Badam		 � Data � 21/05/2019  ���
�������������������������������������������������������������������������͹��
���Descri��o � Menudef                                                    ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/

Static Function MenuDef()
	
	Local aRotina := {}

	ADD OPTION aRotina TITLE "Pesquisar"  		ACTION "PesqBrw" 			OPERATION 1 ACCESS 0
	ADD OPTION aRotina TITLE "Visualizar" 		ACTION "VIEWDEF.INAMN04" 	OPERATION 2 ACCESS 0 
	ADD OPTION aRotina TITLE "Incluir"	 		ACTION "VIEWDEF.INAMN04" 	OPERATION 3 ACCESS 0
	ADD OPTION aRotina TITLE "Alterar"  	  	ACTION "VIEWDEF.INAMN04" 	OPERATION 4 ACCESS 0
	ADD OPTION aRotina TITLE "Excluir"	 		ACTION "VIEWDEF.INAMN04" 	OPERATION 5 ACCESS 0

Return aRotina

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Fun��o    �ModelDef  � Autor � Vitor Badam		 � Data � 25/05/2019  ���
�������������������������������������������������������������������������͹��
���Descri��o � Modeldef                                                   ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/

Static Function ModelDef()

Local oStruF1	:= FWFormStruct( 1, 'ZZM', { |cCampo| CarCpCpo(cCampo,"1") } )
Local oModel  

oModel := MPFormModel():New( 'MINAMN04',,{|| CarregTOk()} )

// Adiciona ao modelo uma estrutura de formul�rio de edi��o por campo
oModel:AddFields( 'PFDF1', /*cOwner*/, oStruF1, /*bPreValidacao*/, /*bPosValidacao*/, /*bCarga*/ ) 
 
// Criar uma chave primaria
oModel:SetPrimaryKey( {{"ZZM_FILIAL","ZZM_MAT","ZZM_TURNO"}} )  

oModel:SetDescription( 'Cadastro de Mecanico Por Turno' ) 
oModel:GetModel( 'PFDF1' ):SetDescription( 'Cadastro de Mecanico Por Turno' ) 


Return oModel

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Fun��o    �ViewDef   � Autor � Vitor Badam		 � Data � 25/05/2019  ���
�������������������������������������������������������������������������͹��
���Descri��o � ViewDef                                                    ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/

Static Function ViewDef()

Local oStruF1	:= FWFormStruct( 2, 'ZZM', { |cCampo| CarCpCpo(cCampo,"1") } )
Local oModel	:= FWLoadModel( "INAMN04")
Local oView 	:= NIL     
           
oView := FWFormView():New()
oView:SetModel(oModel)

oView:AddField('VIEW_PFDF1', oStruF1, 'PFDF1' ) 

oView:CreateHorizontalBox( 'PRIMEIRA', 100 )
oView:SetOwnerView( 'VIEW_PFDF1', 'PRIMEIRA' )
oView:EnableTitleView('VIEW_PFDF1')

oView:SetCloseOnOk( {||.F.} )

Return oView   

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Fun��o    �CarCpCpo  � Autor � Vitor Badam		 � Data � 25/05/2019  ���
�������������������������������������������������������������������������͹��
���Descri��o � Carrega os campos em suas posi��es                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/

Static Function CarCpCpo(cCampo,cParte)

Local lRet	:= .F.   

If (Upper(Alltrim(cCampo)) $ "ZZM_MAT;ZZM_NOME;ZZM_TURNO;ZZM_TIPO;ZZM_STATUS")
	lRet := .T.
EndIf

Return lRet 

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Fun��o    �CarregTOk � Autor �Vitor Badam 		 � Data � 11/02/2016  ���
�������������������������������������������������������������������������͹��
���Descri��o � Valida��o na confirma��o do cadastro                       ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/

Static Function CarregTOk()

Local oModel 		:= FWModelActive()
Local oModelTrab	:= oModel:GetModel('PFDF1')
Local nOperation 	:= oModel:GetOperation()
Local lRet			:= .T.

If nOperation = 3 .OR. nOperation = 4
	dbSelectArea("ZZM")
	ZZM->(dbSetOrder(2))
   If	ZZM->(dbSeek(xFilial("ZZM")+ oModelTrab:ADATAMODEL[1][1][2]+ oModelTrab:ADATAMODEL[1][3][2]))  
   		 MsgStop("Este funcionario ja esta Cadastrado para este turno.")
   		lRet := .F.
   Endif
EndIf      

Return lRet 
