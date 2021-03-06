#INCLUDE "Protheus.Ch"
#INCLUDE "RwMake.Ch"
#INCLUDE "TopConn.Ch"
#INCLUDE "FiveWin.Ch"
#INCLUDE "FWMVCDEF.CH"
/*/
��������������������������������������������������������������������
��������������������������������������������������������������������
����������������������������������������������������������������ͻ��
���Programa  � INAMN07 � Autor � Vitor Badam  � Data �  30/01/20 ���
����������������������������������������������������������������͹��
���Descricao � Tela Tipos de  Check List Autonoma                ���
����������������������������������������������������������������ͼ��
��������������������������������������������������������������������
��������������������������������������������������������������������
/*/
User Function INAMN07()

	Private oBrowse

	oBrowse := FWMBrowse():New()
	oBrowse:SetAlias("ZM0")
	oBrowse:SetDescription("Cadastro Tipo CkeckList Autonoma")

	oBrowse:Activate()

Return

/*/
	�����������������������������������������������������������������������������
	�����������������������������������������������������������������������������
	�������������������������������������������������������������������������ͻ��
	���Fun��o    �MenuDef   � Autor � Vitor Badam		 � Data � 30/01/2020  ���
	�������������������������������������������������������������������������͹��
	���Descri��o � Menudef                                                    ���
	�������������������������������������������������������������������������ͼ��
	�����������������������������������������������������������������������������
	�����������������������������������������������������������������������������
/*/

Static Function MenuDef()

	Local aRotina := {}

	ADD OPTION aRotina TITLE "Pesquisar"  		ACTION "PesqBrw" 			OPERATION 1 ACCESS 0
	ADD OPTION aRotina TITLE "Visualizar" 		ACTION "VIEWDEF.INAMN07" 	OPERATION 2 ACCESS 0
	ADD OPTION aRotina TITLE "Incluir" 	   		ACTION "VIEWDEF.INAMN07" 	OPERATION 3 ACCESS 0
	ADD OPTION aRotina TITLE "Alterar"  	  	ACTION "VIEWDEF.INAMN07" 	OPERATION 4 ACCESS 0
	ADD OPTION aRotina TITLE "Imprimir" 		ACTION "VIEWDEF.INAMN07" 	OPERATION 8 ACCESS 0
	ADD OPTION aRotina TITLE "Excluir" 	   		ACTION "VIEWDEF.INAMN07"	OPERATION 5 ACCESS 0

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

	Local oStruF1	:= FWFormStruct( 1, 'ZM0', { |cCampo| CarCpCpo(cCampo,"1") } )
	Local oModel

	oModel := MPFormModel():New( 'MINAMN07',, )

// Adiciona ao modelo uma estrutura de formul�rio de edi��o por campo
	oModel:AddFields( 'PFDF1', /*cOwner*/, oStruF1, /*bPreValidacao*/, /*bPosValidacao*/, /*bCarga*/ )

// Criar uma chave primaria
	oModel:SetPrimaryKey( {} )

	oModel:SetDescription( 'Cadastro Tipo CkeckList Autonoma' )
	oModel:GetModel( 'PFDF1' ):SetDescription( 'Cadastro Tipo CkeckList Autonoma' )


Return oModel

/*/
	�����������������������������������������������������������������������������
	�����������������������������������������������������������������������������
	�������������������������������������������������������������������������ͻ��
	���Fun��o    �ViewDef   � Autor � Vitor Badam		 � Data � 30/01/2020  ���
	�������������������������������������������������������������������������͹��
	���Descri��o � ViewDef                                                    ���
	�������������������������������������������������������������������������ͼ��
	�����������������������������������������������������������������������������
	�����������������������������������������������������������������������������
/*/

Static Function ViewDef()

	Local oStruF1	:= FWFormStruct( 2, 'ZM0', { |cCampo| CarCpCpo(cCampo,"1") } )
	Local oModel	:= FWLoadModel( "INAMN07")
	Local oView 	:= NIL

	oView := FWFormView():New()
	oView:SetModel(oModel)

	oView:AddField('VIEW_PFDF1', oStruF1, 'PFDF1' )

	oView:CreateHorizontalBox( 'PRIMEIRA', 100 )
	oView:SetOwnerView( 'VIEW_PFDF1', 'PRIMEIRA' )
	oView:EnableTitleView('VIEW_PFDF1')

	oStruF1:SetProperty( 'ZM0_CODIGO'	 ,MVC_VIEW_CANCHANGE,.F.)

	oView:SetCloseOnOk( {||.F.} )

Return oView

/*/
	�����������������������������������������������������������������������������
	�����������������������������������������������������������������������������
	�������������������������������������������������������������������������ͻ��
	���Fun��o    �CarCpCpo  � Autor � Vitor Badam		 � Data � 30/01/2020  ���
	�������������������������������������������������������������������������͹��
	���Descri��o � Carrega os campos em suas posi��es                         ���
	�������������������������������������������������������������������������ͼ��
	�����������������������������������������������������������������������������
	�����������������������������������������������������������������������������
/*/

Static Function CarCpCpo(cCampo,cParte)

	Local lRet	:= .T.

	If (Upper(Alltrim(cCampo)) $ "ZM0_FILIAL")
		lRet := .F.
	EndIf

Return lRet


/*������������������������������������������������������������������������������
��������������������������������������������������������������������������������
����������������������������������������������������������������������������Ŀ��
���Programa   �ZM0CODVER� Autores � Vitor Badam            � Data �30/01/2020���
����������������������������������������������������������������������������Ĵ��
���Descricao  � Busca o ultimo numero da ZM0                                 ���
���           �                                                              ���
�����������������������������������������������������������������������������ٱ�
��������������������������������������������������������������������������������
������������������������������������������������������������������������������*/
User Function ZM0CODVER()

Local _cQuery := Nil
Local _nDoc   := Nil

_cQuery := " SELECT MAX(ZM0_CODIGO)+1 DOC "   					+ CRLF
_cQuery += " FROM "+RetSqlName("ZM0_CODIGO")+" ZM0 " 			+ CRLF
_cQuery += " WHERE ZM0.D_E_L_E_T_ != '*' "    					+ CRLF
_cQuery += " AND   ZM0_FILIAL  = '" + xFilial("ZM0") + "' "	 	+ CRLF

dbUseArea(.T.,"TOPCONN", TCGenQry(,,_cQuery),'ZM0TMP',.F.,.T.)

_nDoc := strzero(ZM0TMP->DOC,4)

ZM0TMP->(DbCloseArea())

Return(_nDoc)
