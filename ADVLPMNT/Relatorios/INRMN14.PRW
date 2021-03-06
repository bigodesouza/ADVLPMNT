#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "TBICONN.CH"
#INCLUDE "RWMAKE.CH"
/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �INRMN14   �Autor  �Bruno E. de Souza   � Data �  11/06/2021 ���
�������������������������������������������������������������������������͹��
���Desc.     �RELATORIO DE CHECKLIST SUGESTOES OPERADOR                   ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
User Function INRMN14()

//�������������������������������������������������������������������������Ŀ
//� Declara variaveis										                �
//���������������������������������������������������������������������������
Private oFont10b	:= TFont():New("Arial",,10,,.F.,,,,.F.,.F.)
Private oFont11b	:= TFont():New("Arial",,11,,.F.,,,,.F.,.F.)
Private oFont12b	:= TFont():New("Arial",,12,,.T.,,,,.T.,.F.)
Private oFont15b	:= TFont():New("Arial",,15,,.T.,,,,.T.,.F.)
Private nLinha	    := 0
Private nLinhaB	    := 0
Private oPrint
Private cPerg   	:= "INRMN10"

//�������������������������������������������������������������������������Ŀ
//� Parametros																�
//���������������������������������������������������������������������������
Pergunte(cPerg,.T.)

Processa( {|lEnd| INRMN14F()}, 'Aguarde...','Gerando Relatorio...', .t. )

Return()
/*������������������������������������������������������������������������������
��������������������������������������������������������������������������������
����������������������������������������������������������������������������Ŀ��
���Programa   �INRMN14F	� Autores � Bruno E. de Souza      � Data �11/06/2021���
����������������������������������������������������������������������������Ĵ��
���Descricao  �  Imprime Informa��es Complementares                          ���
���           �                                                              ���
�����������������������������������������������������������������������������ٱ�
��������������������������������������������������������������������������������
������������������������������������������������������������������������������*/
Static Function INRMN14F()

//����������������������������������������������������Ŀ
//� Inicializa Objeto TMSPrinter					   �
//������������������������������������������������������
oPrint	:= TMSPrinter():New("RELATORIO DE CHECKLIST SUGESTOES OPERADOR")
lPrinter:= oPrint:IsPrinterActive()
oPrint:SetLandscape()  // Marca Radio Button para impressao em paisagem
oPrint:SetpaperSize(9) // Ajuste para papel a4

//����������������������������������������������������Ŀ
//�Caso nao encontre a impressora conectada localmente,�
//�abre a tela para escolha de impressora de rede      �
//������������������������������������������������������

//������������������������������������������������������������Ŀ
//� Inicia a impressao										   �
//� da Frente do Relatorio									   �
//��������������������������������������������������������������

If !lPrinter
	oPrint:Setup()
Endif

If !oPrint:IsPrinterActive()
	MsgInfo("N�o existe nenhum impressora conectada no computador, impress�o cancelada!")
	Return
Endif

oPrint:StartPage()

Processa({|| INRMN14I() },"Processando Dados para Impress�o...")

oPrint:EndPage()

oPrint:Preview()

Return()
/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �INRMN14I  �Autor  �Microsiga           � Data �  11/06/2021 ���
�������������������������������������������������������������������������͹��
���Desc.     �Processa dados do relatorio                                 ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function INRMN14I()

Local nPag      := 1
Local cQry      := ""
Local ctexto    := ""

cQry := "SELECT																											 " + CRLF
cQry += "ZM1_SEQDOC,																									 " + CRLF
cQry += "SUBSTRING(ZM1_DATA,7,2)+'/'+SUBSTRING(ZM1_DATA,5,2)+'/'+SUBSTRING(ZM1_DATA,1,4) AS  'DATACHK',	 				 " + CRLF
cQry += "ZM1_HORA,																										 " + CRLF
cQry += "T9_CODBEM,																										 " + CRLF
cQry += "CAST(CAST(ZM1_SUGEST AS VARBINARY(8000)) AS VARCHAR(8000)) AS 'SUGEST',										 " + CRLF
cQry += "ISNULL(CAST(CAST(ZM1_RESSG AS VARBINARY(8000)) AS VARCHAR(8000)),'SEM RESPOSTA DA MNT ATE O MOMENTO') AS 'RESSG'" + CRLF
cQry += "FROM																											 " + CRLF
cQry += "	" + RetSqlName("ZM1") + " ZM1 WITH(NOLOCK)																	 " + CRLF
cQry += "JOIN																											 " + CRLF
cQry += "	" + RetSqlName("ST9") + " ST9 WITH(NOLOCK)																	 " + CRLF
cQry += "ON																												 " + CRLF
cQry += "ZM1_TPMAQU = T9_RECFERR																						 " + CRLF
cQry += "AND																											 " + CRLF
cQry += "ZM1_FILIAL = T9_FILIAL																							 " + CRLF
cQry += "AND																											 " + CRLF
cQry += "ZM1.D_E_L_E_T_<>'*'																							 " + CRLF
cQry += "WHERE																											 " + CRLF
cQry += "ZM1_FILIAL = '"+xFilial("ZM1")+"'																				 " + CRLF
cQry += "AND																											 " + CRLF
cQry += "T9_FILIAL = '"+xFilial("ZM1")+"'																				 " + CRLF
cQry += "AND																											 " + CRLF
cQry += "ZM1_SUGEST <>''																								 " + CRLF
cQry += "AND																											 " + CRLF
cQry += "ZM1_SEQDOC BETWEEN '"+ALLTRIM(MV_PAR01)+"' AND '"+ALLTRIM(MV_PAR02)+"'											 " + CRLF							
cQry += "AND																											 " + CRLF																							
cQry += "ZM1_DATA BETWEEN  '"+DTOS(MV_PAR03)+"' AND '"+DTOS(MV_PAR04)+"'										         " + CRLF
cQry += "GROUP BY																										 " + CRLF
cQry += "ZM1_SEQDOC,																									 " + CRLF
cQry += "ZM1_DATA,																										 " + CRLF
cQry += "ZM1_HORA,																										 " + CRLF
cQry += "T9_CODBEM,																										 " + CRLF
cQry += "ZM1_SUGEST,																									 " + CRLF
cQry += "ZM1_RESSG																										 " + CRLF

	If Select("TRB1" ) > 0
		TRB1->(dbCloseArea())
	EndIf
		
		TcQuery cQry New Alias "TRB1"
		
		dbSelectArea("TRB1")
		
		TRB1->(dbGoTop())
	
	oPrint:Say(0100,1500,"Periodo: "+DTOC(MV_PAR03)+" at� "+DTOC(MV_PAR04),oFont11b)
	oPrint:Say(0200,0150,"INYLBRA"										  ,oFont15b)
	oPrint:Say(0200,1230,"RELATORIO DE CHECKLIST SUGESTOES OPERADOR"	  ,oFont15b)
	oPrint:Say(0100,3100,DTOC(Date())								      ,oFont11b)
	oPrint:Say(0200,3100,"Pagina "+CVALTOCHAR(nPag)  				      ,oFont11b)

	oPrint:Say(0300,0050,"Doc.Autonoma"	    ,oFont11b)
	oPrint:Say(0300,0340,"Data Chk. List."  ,oFont11b)
	oPrint:Say(0300,0620,"Hora" 		    ,oFont11b)
	oPrint:Say(0300,0750,"Cod. Bem"		    ,oFont11b)
	oPrint:Say(0300,0950,"Sugest�o"		    ,oFont11b)
	oPrint:Say(0300,2350,"Resposta Sugest�o",oFont11b)


	While TRB1->(!Eof())

		If nLinha > 1440
			nLinha:= 0
			nLinhaB:= 0
			nPag++
			oPrint:EndPage()
			oPrint:StartPage()

			oPrint:Say(0100,1500,"Periodo: "+DTOC(MV_PAR03)+" at� "+DTOC(MV_PAR04),oFont11b)
			oPrint:Say(0200,0150,"INYLBRA"										  ,oFont15b)
			oPrint:Say(0200,1230,"RELATORIO DE CHECKLIST SUGESTOES OPERADOR"	  ,oFont15b)
			oPrint:Say(0100,3100,DTOC(Date())								      ,oFont11b)
			oPrint:Say(0200,3100,"Pagina "+CVALTOCHAR(nPag)					      ,oFont11b)
	
			oPrint:Say(0300,0050,"Doc.Autonoma"		,oFont11b)
			oPrint:Say(0300,0340,"Data Chk. List."	,oFont11b)
			oPrint:Say(0300,0620,"Hora" 			,oFont11b)
			oPrint:Say(0300,0750,"Cod. Bem"			,oFont11b)
			oPrint:Say(0300,0950,"Sugest�o"			,oFont11b)
			oPrint:Say(0300,2350,"Resposta Sugest�o",oFont11b)
		EndIf

	

	ctexto := alltrim(TRB1->SUGEST)
    ctexto := strtran(ctexto, chr(13) + chr(10), "")

 	If !empty(ctexto)
		oPrint:Say(	nLinha+0400,0050,TRB1->ZM1_SEQDOC,oFont11b)
		oPrint:Say(	nLinha+0400,0340,TRB1->DATACHK	 ,oFont11b)
		oPrint:Say(	nLinha+0400,0620,TRB1->ZM1_HORA	 ,oFont11b)
		oPrint:Say(	nLinha+0400,0750,TRB1->T9_CODBEM ,oFont10b)

		nLinhaB := nLinha
	 	oPrint:Say(nLinha+400,0950,SUBSTR(ALLTRIM(TRB1->SUGEST),1,61),oFont10b)
		 	If LEN(ALLTRIM(TRB1->SUGEST)) > 61
			 nLinha += 50
			 oPrint:Say(nLinha+400,0950,SUBSTR(ALLTRIM(TRB1->SUGEST),62,61),oFont10b)
			EndIf

			If LEN(ALLTRIM(TRB1->SUGEST)) > 122
			 nLinha += 50
			 oPrint:Say(nLinha+400,0950,SUBSTR(ALLTRIM(TRB1->SUGEST),123,61),oFont10b)
			EndIf

			///////////////////////////////

			oPrint:Say(nLinhaB+400,2350,SUBSTR(ALLTRIM(TRB1->RESSG),1,51),oFont10b)
			If LEN(ALLTRIM(TRB1->RESSG)) > 51
				nLinhaB += 50
				oPrint:Say(nLinhaB+400,2350,SUBSTR(ALLTRIM(TRB1->RESSG),51,51),oFont10b)
			EndIf

			nLinha += 100
			//////////////////////////////////////////
			/*oPrint:Say(nLinha,0100,SUBSTR(ALLTRIM(TRB1->SUGEST),1,50),oFont11b)
			If LEN(ALLTRIM(TRB1->SUGEST)) > 51
			 nLinha += 50
			 //nLinhaB -= 50
			 oPrint:Say(nLinha,0100,SUBSTR(ALLTRIM(TRB1->SUGEST),51,80),oFont11b)
			EndIf

			oPrint:Say(nLinhaB,1600,SUBSTR(ALLTRIM(TRB1->RESSG),1,15),oFont11b)
			If LEN(ALLTRIM(TRB1->SUGEST)) > 51
			nLinhaB += 50
			EndIf
			If LEN(ALLTRIM(TRB1->RESSG)) > 15
				If LEN(ALLTRIM(TRB1->SUGEST)) > 51
					nLinhaB -= 50
				EndIf
			 nLinha += 50
			 nLinhaB += 50
			 oPrint:Say(nLinhaB,1600,SUBSTR(ALLTRIM(TRB1->RESSG),16,80),oFont11b)
			EndIf

			If LEN(ALLTRIM(TRB1->RESSG)) > 15 .AND. LEN(ALLTRIM(TRB1->SUGEST)) < 51
				nLinha += 50
				
			EndIf
			nLinhaB += 50*/
			////////////////////////////////////////////

	EndIf
		TRB1->(dbSkip())
	EndDo

Return()
