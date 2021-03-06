#INCLUDE "RWMAKE.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � INRMN13  � Autor �Bruno E. Souza      � Data �  20/10/2020 ���
�������������������������������������������������������������������������͹��
���Descricao � Relatorio cadastro equipamentos Preventiva			      ���
���          �                                                 			  ���
�������������������������������������������������������������������������͹��
���Uso       � MP12	                                                      ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
User Function INRMN13()

//�������������������������������������������������������������������������Ŀ
//� Declara variaveis										                �
//���������������������������������������������������������������������������

Private oFont11b	:= TFont():New("Arial",,11,,.F.,,,,.F.,.F.)
Private oFont12b	:= TFont():New("Arial",,12,,.T.,,,,.T.,.F.)
Private oFont15b	:= TFont():New("Arial",,15,,.T.,,,,.T.,.F.)
Private nLinha	    := 0
Private oPrint
Private cPerg   := "INRMN13"

//�������������������������������������������������������������������������Ŀ
//� Parametros																�
//���������������������������������������������������������������������������
Pergunte(cPerg,.T.)

Processa( {|lEnd| IMPINY13()}, 'Aguarde...','Gerando relat�rio...', .t. )

Return

/*������������������������������������������������������������������������������
��������������������������������������������������������������������������������
����������������������������������������������������������������������������Ŀ��
���Programa   �IMPINY13� Autores � Bruno E. de Souza      � Data �20/10/2020���
����������������������������������������������������������������������������Ĵ��
���Descricao  �  Imprime Informa��es Complementares                          ���
���           �                                                              ���
�����������������������������������������������������������������������������ٱ�
��������������������������������������������������������������������������������
������������������������������������������������������������������������������*/
Static Function IMPINY13()

//����������������������������������������������������Ŀ
//� Inicializa Objeto TMSPrinter					   �
//������������������������������������������������������
oPrint  := TMSPrinter():New("Relatorio cadastro equipamentos Preventiva")
lPrinter:= oPrint:IsPrinterActive()
oPrint:SetPortrait()  // Marca Radio Button para impressao em paisagem
oPrint:SetpaperSize(9) // Ajuste para papel a4

//����������������������������������������������������Ŀ
//�Caso nao encontre a impressora conectada localmente,�
//�abre a tela para escolha de impressora de rede      �
//������������������������������������������������������

If !lPrinter
	oPrint:Setup()
Endif

If !oPrint:IsPrinterActive()
	MsgInfo("N�o existe nenhum impressora conectada no computador, impress�o cancelada!")
	Return
Endif

//������������������������������������������������������������Ŀ
//� Inicia a impressao										   �
//� da Frente do Relatorio									   �
//��������������������������������������������������������������

oPrint:StartPage()
IMPINY13D()
oPrint:EndPage()

oPrint:Preview()

Return()
/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �IMPINY13D �Autor  �Bruno E. de Souza   � Data �  20/10/2020 ���
�������������������������������������������������������������������������͹��
���Desc.     �Formacao dos dados para o relatorio                         ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function IMPINY13D

Local cQry 	  := ""
Local cCodbem := ""
Local cOsChk  := ""
Local nPag    := 1
Local nLinha  := 0

cQry	:= "SELECT																								"+ CRLF
cQry	+="ZZN_EQUIP AS 'CODBEM',																				"+ CRLF
cQry	+="T9_NOME AS 'DESCBEM',																				"+ CRLF
cQry	+="TJ_ORDEM AS 'ORDEMOS',																				"+ CRLF
cQry	+="CASE WHEN ZZN_FREQ = 'B' THEN 'BIMESTRAL'															"+ CRLF
cQry	+="WHEN ZZN_FREQ = 'S' THEN 'SEMESTRAL'																	"+ CRLF
cQry	+="WHEN ZZN_FREQ = 'M' THEN 'MENSAL'																	"+ CRLF
cQry	+="WHEN ZZN_FREQ = 'Q' THEN 'QUINZENAL'																	"+ CRLF
cQry	+="WHEN ZZN_FREQ = 'T' THEN 'TRIMESTRAL'																"+ CRLF
cQry	+="WHEN ZZN_FREQ = 'D' THEN 'QUADRIMESTRAL'																"+ CRLF
cQry	+="WHEN ZZN_FREQ = 'A' THEN 'ANUAL'																		"+ CRLF
cQry	+="WHEN ZZN_FREQ = 'P' THEN 'POR ESTADO'																"+ CRLF
cQry	+="WHEN ZZN_FREQ = 'E' THEN 'BIANUAL'																	"+ CRLF
cQry	+="WHEN ZZN_FREQ = 'N' THEN 'MANUAL' ELSE 'SEM CADASTRO' END 'STATUS',									"+ CRLF
cQry	+="SUBSTRING(TJ_DTMPINI,7,2)+'/'+SUBSTRING(TJ_DTMPINI,5,2)+'/'+SUBSTRING(TJ_DTMPINI,1,4) AS 'DATAINI',	"+ CRLF
cQry	+="SUBSTRING(TJ_DTMPFIM,7,2)+'/'+SUBSTRING(TJ_DTMPFIM,5,2)+'/'+SUBSTRING(TJ_DTMPFIM,1,4) AS 'DATAFIM',	"+ CRLF
cQry	+="SUBSTRING(TJ_DTORIGI,7,2)+'/'+SUBSTRING(TJ_DTORIGI,5,2)+'/'+SUBSTRING(TJ_DTORIGI,1,4) AS 'DTINOS',	"+ CRLF
cQry	+="ZZN_OSPROG AS 'OSPROG',																				"+ CRLF
cQry	+="ZZN_OSREAL AS 'OSREAL'																				"+ CRLF
cQry	+="FROM																									"+ CRLF
cQry	+=""+RetSQLName("ZZN")+" ZZN																		 	"+ CRLF
cQry	+="JOIN																									"+ CRLF
cQry	+=""+RetSQLName("STJ")+" STJ																			"+ CRLF
cQry	+="ON																									"+ CRLF
cQry	+="ZZN_EQUIP = TJ_CODBEM																				"+ CRLF
cQry	+="AND																									"+ CRLF
cQry	+="ZZN_FILIAL = TJ_FILIAL																				"+ CRLF
cQry	+="JOIN																									"+ CRLF
cQry	+=""+RetSQLName("ST9")+" ST9 																			"+ CRLF
cQry	+="ON																									"+ CRLF
cQry	+="ZZN_EQUIP = T9_CODBEM 																				"+ CRLF
cQry	+="AND																									"+ CRLF
cQry	+="ZZN_FILIAL = T9_FILIAL																				"+ CRLF
cQry	+="AND																									"+ CRLF
cQry	+="ST9.D_E_L_E_T_<>'*'																					"+ CRLF
cQry	+="AND																									"+ CRLF
cQry	+="STJ.D_E_L_E_T_<>'*'																					"+ CRLF
cQry	+="WHERE																								"+ CRLF
cQry	+="ZZN.D_E_L_E_T_<>'*'																					"+ CRLF
cQry	+="AND																									"+ CRLF
cQry	+="TJ_SITUACA <> 'C' 																					"+ CRLF 																				
cQry	+="AND																									"+ CRLF																							 
cQry	+="TJ_TIPMNT = '2' 																						"+ CRLF
cQry	+="AND																									"+ CRLF
cQry    += "ZZN_FILIAL = '"+xFilial("ZZN")+"'																	"+ CRLF
cQry	+="AND																									"+ CRLF
cQry	+="ZZN_EQUIP BETWEEN '"+Alltrim(MV_PAR01)+"' AND '"+Alltrim(MV_PAR02)+"' 								"+ CRLF
cQry	+="AND																									"+ CRLF
cQry	+="TJ_DTORIGI BETWEEN  '"+DTOS(MV_PAR03)+"' AND  '"+DTOS(MV_PAR04)+"' 									"+ CRLF	
cQry	+="ORDER BY																								"+ CRLF
cQry	+="ZZN_EQUIP,																							"+ CRLF
cQry	+="TJ_ORDEM																								"+ CRLF

	If Select("TEMP") > 0
		TEMP->(dbCloseArea())
	EndIf
	
	TcQuery cQry New Alias "TEMP"
	
	dbSelectArea("TEMP")
	TEMP->(dbGoTop())
	
	cCodbem := TEMP->CODBEM

	oPrint:Say(0040,1000,"Periodo: "+DTOC(MV_PAR03)+" at� "+DTOC(MV_PAR04)	,oFont11b)
	oPrint:Say(0100,0050,"INYLBRA"											,oFont15b)
	oPrint:Say(0100,0800,"Relatorio cadastro equipamentos Preventiva"	    ,oFont15b)
	oPrint:Say(0100,2900,DTOC(Date())								        ,oFont11b)

	oPrint:Say(0200,0050,"Cod. Bem:"  ,oFont15b)
	oPrint:Say(0200,0670,"Descri��o:" ,oFont15b)
	
	oPrint:Say(0210,0320,TEMP->CODBEM  ,oFont12b)
	oPrint:Say(0210,0970,TEMP->DESCBEM ,oFont12b)

	oPrint:Say(0270,0050,"Num.O.S"  				,oFont11b)
	oPrint:Say(0270,0250,"Periodo preventiva " 		,oFont11b)
	oPrint:Say(0270,0600,"Data inicio." 	 		,oFont11b)
	oPrint:Say(0270,0850,"Data fim."				,oFont11b)
	oPrint:Say(0270,1080,"Data OS." 				,oFont11b)
	oPrint:Say(0270,1300,"Prev. Prog."				,oFont11b)
	oPrint:Say(0270,1550,"Prev. Real. " 			,oFont11b)
	oPrint:Say(0270,1800,"Check List."    			,oFont11b)
	oPrint:Say(2950,2000,"P�gina "+CVALTOCHAR(nPag) ,oFont11b)

	nLinha += 320

	While TEMP->(!EOF())
		If nLinha > 2800
			nLinha:= 210
			nPag++
			oPrint:EndPage()
			oPrint:StartPage()

			oPrint:Say(0040,1000,"Periodo: "+DTOC(MV_PAR03)+" at� "+DTOC(MV_PAR04)	,oFont11b)
			oPrint:Say(0100,0050,"INYLBRA"											,oFont15b)
			oPrint:Say(0100,0800,"Relatorio cadastro equipamentos Preventiva"	    ,oFont15b)
			oPrint:Say(0100,2900,DTOC(Date())								        ,oFont11b)
			oPrint:Say(2950,2000,"P�gina "+CVALTOCHAR(nPag)							,oFont11b)
		EndIf

		dbSelectArea("ZM3")
		ZM3->(dbSetOrder(1))
		If ZM3->(dbSeek( xFilial("ZM3")+ALLTRIM(TEMP->ORDEMOS))) 
			cOsChk := "OK"
		Else  
			cOsChk := "NOK"
		EndIf

		If TEMP->CODBEM <> cCodbem

			nLinha+= 20
			oPrint:Say(nLinha,0050,"Cod. Bem:"	,oFont15b)
			oPrint:Say(nLinha,0670,"Descri��o:"	,oFont15b)

			oPrint:Say(nLinha+10,0320,TEMP->CODBEM	 ,oFont12b)
			oPrint:Say(nLinha+10,0970,TEMP->DESCBEM	 ,oFont12b)

			nLinha+= 70

			oPrint:Say(nLinha,0050,"Num.O.S"  			,oFont11b)
			oPrint:Say(nLinha,0250,"Periodo preventiva" ,oFont11b)
			oPrint:Say(nLinha,0600,"Data inicio." 	 	,oFont11b)
			oPrint:Say(nLinha,0850,"Data fim."			,oFont11b)
			oPrint:Say(nLinha,1080,"Data OS." 			,oFont11b)
			oPrint:Say(nLinha,1300,"Prev. Prog."		,oFont11b)
			oPrint:Say(nLinha,1550,"Prev. Real. " 		,oFont11b)
			oPrint:Say(nLinha,1800,"Check List."    	,oFont11b)
		
			nLinha+= 70

		EndIf

			oPrint:Say(nLinha,0050,TEMP->ORDEMOS		 	,oFont11b)
	   		oPrint:Say(nLinha,0250,TEMP->STATUS		 		,oFont11b)
			oPrint:Say(nLinha,0600,TEMP->DATAINI	 		,oFont11b)
	   	    oPrint:Say(nLinha,0850,TEMP->DATAFIM	 		,oFont11b)
			oPrint:Say(nLinha,1080,TEMP->DTINOS		 		,oFont11b)
	   		oPrint:Say(nLinha,1320,CVALTOCHAR(TEMP->OSPROG)	,oFont11b)
			oPrint:Say(nLinha,1570,CVALTOCHAR(TEMP->OSREAL)	,oFont11b)
	   	    oPrint:Say(nLinha,1800,cOsChk	 				,oFont11b)

			nLinha+= 50

			cCodbem := TEMP->CODBEM
		
		TEMP->(dbSkip())
	EndDo

	TEMP->(dbCloseArea())
Return()
