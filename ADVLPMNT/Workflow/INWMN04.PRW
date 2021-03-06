#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �INWMN04   �Autor  �Vitor Badam       � Data �  04/11/20     ���
�������������������������������������������������������������������������͹��
���Desc.     �Envia Workflow CONTROLE DE PE�AS PRODUZIDAS NAS LINHAS      ���
���          � SAMWA MQMO12 E MQMO13.                                     ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
User Function INWMN04()

	WfPrepEnv('01','01',,,'SIGAMNT')

	RodaSche()

Return
/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �RodaSche  �Autor  �Vitor Badam         � Data �  04/11/2020 ���
�������������������������������������������������������������������������͹��
���Desc.     �  Gera o worflow com Dados.                                 ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function RodaSche()

	Local cQuery		:= ""
	Local _cHtml 		:= ""
	Local _cEmail		:= AllTrim(GETMV("IN_WFMNTEF"))
	Local dDataOs       := ""

	cQuery:= " SELECT TJ_CODBEM ,MAX(TJ_DTORIGI) AS DATATROC   FROM " +RetSqlName("STJ") + "  WITH(NOLOCK) " + CRLF
	cQuery+= " INNER JOIN " + RetSqlName("STL") + "  WITH(NOLOCK)  "   + CRLF
	cQuery+= " ON TJ_ORDEM = TL_ORDEM AND TJ_FILIAL = TL_FILIAL AND STL010.D_E_L_E_T_ <> '*' " + CRLF
	cQuery+= " WHERE STJ010.D_E_L_E_T_ <> '*' " + CRLF
	cQuery+= " AND TJ_CODBEM IN ('MQMO0013','MQMO0012') " + CRLF //Somente esta maquina
	cQuery+= " AND TL_CODIGO = 'MA10001047' " + CRLF //Produto da troca de teflon
	cQuery+= " AND TJ_FILIAL = '"+ xFilial("STJ") + "' " + CRLF
	cQuery+= " GROUP BY TJ_CODBEM " + CRLF

	If Select("TRB") > 0
		dbSelectArea("TRB")
		TRB->(DbCloseArea())
	EndIf

	TCQUERY cQuery NEW ALIAS TRB

	dbSelectArea("TRB")
	TRB->(dbGoTop())

	While TRB->(!EOF())

		cRecur := ""
		If Alltrim(TRB->TJ_CODBEM) == "MQMO0012"
			cRecur := 'MQMO12'
		Else
			cRecur := 'MQMO13'
		Endif

		dDataOs :=  TRB->DATATROC //BUSCA A ULTIMA TROCA DO FELTRON PELO CODIGO DO INSUMO

		cQuery:= "  SELECT H6_RECURSO , SUM(H6_QTDPROD) AS 'PRODUZIDO' FROM " +RetSqlName("SH6")+ "  WITH(NOLOCK) " + CRLF
		cQuery+= "  WHERE D_E_L_E_T_ <> '*' " + CRLF
		cQuery+= "  AND H6_RECURSO = '"+ cRecur + "' " + CRLF
		cQuery+= "  AND H6_FILIAL = '"+ xFilial("SH6") + "' " + CRLF
		cQuery+= "  AND H6_OP <> '' " + CRLF
		cQuery+= "  AND H6_IN_DTPR >= '"+ dDataOs + "' " + CRLF
		cQuery+= "  GROUP BY H6_RECURSO " + CRLF

		If Select("TRB1") > 0
			dbSelectArea("TRB1")
			TRB1->(DbCloseArea())
		EndIf

		TCQUERY cQuery NEW ALIAS TRB1

		dbSelectArea("TRB1")
		TRB1->(dbGoTop())

		If TRB1->(!EOF())

			If TRB1->PRODUZIDO > 37000 //Quando ultrapassar essa quantidade enviar o worflow

				_cHtml := "<html>"
				_cHtml += "<head>"
				_cHtml += "<title>CONTROLE DE PE�AS PRODUZIDAS NAS LINHAS SAMWA - "+ TRB1->H6_RECURSO + " </title>"
				_cHtml += "</head>"
				_cHtml += "<style type='text/css'> "
				_cHtml += ".style5 { "
				_cHtml += "    font-weight: bold; "
				_cHtml += "    font-family: Arial, Helvetica, sans-serif; "
				_cHtml += "    font-size: 18px; "
				_cHtml += " } "
				_cHtml += ".style6 { "
				_cHtml += "   font-family: Arial, Helvetica, sans-serif; "
				_cHtml += "    font-size: 18px; "
				_cHtml += " } "
				_cHtml += ".style7 { "
				_cHtml += "    font-family: Arial, Helvetica, sans-serif; "
				_cHtml += "    font-size: 25px; "
				_cHtml += "    font-weight: bold; "
				_cHtml += " } "
				_cHtml += ".style9 { "
				_cHtml += "    font-family: Arial, Helvetica, sans-serif; "
				_cHtml += "    font-size: 18px; "
				_cHtml += "    color: #FF0000; "
				_cHtml += "    font-weight: bold; "
				_cHtml += " } "
				_cHtml += " </style> "
				_cHtml += " <p align='center' class= 'style7'>CONTROLE DE PE�AS PRODUZIDAS NAS LINHAS SAMWA - "+ TRB1->H6_RECURSO + " </p> "
				_cHtml += " <p align='center' class='style6'><strong>Ref.: "+ DTOC(dDataBase) + " </strong></p> "
				_cHtml += " <p align='center' class='style6'></p> "
				_cHtml += " <div class='style5'> "
				_cHtml += " <div> "
				_cHtml += "    <div align='center'>PE�AS PRODUZIDAS NAS LINHAS SAMWA - " + TRB1->H6_RECURSO + " ATINGIU - " + Transform(TRB1->PRODUZIDO,"@E 99999999.99") + " PE�AS PRODUZIDAS , ULTIMA TROCA NA DATA -  " + Dtoc(Stod(dDataOs)) + " !!</div> "
				_cHtml += " </div> "
				_cHtml += " </div> "
				_cHtml += " <p align='center' class='style6'>&nbsp;</p> "
				_cHtml += " <div> "
				_cHtml += " <div> "
				_cHtml += "    <div align='center' class='style9'>RECOMEND�VEL PROVIDENCIAR A TROCA DO TEFLON DA ESTUFA.</div> "
				_cHtml += "</div> "
				_cHtml += "</div> <p>&nbsp;</p> "
				_cHtml += "</body>"
				_cHtml += "</html>"

				u_GeraMail(,,,,_cEmail,"*CONTROLE DE PE�AS PRODUZIDAS NAS LINHAS SAMWA - " + TRB1->H6_RECURSO + " *",_cHtml,,.T.)

			Endif
		Endif

		TRB->(dbSkip())
	EndDo

	TRB->(dbCloseArea())

Return()
