#INCLUDE "PROTHEUS.CH"
#INCLUDE "RWMAKE.CH"
#Include "topconn.ch"

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������Ŀ��
���Programa  � MBRWBTN  � Autor �Douglas de Oliveira    � Data �18/03/2005���
�������������������������������������������������������������������������Ĵ��
���Descri��o � Ponto de Entrada para controlar um botao pressionado na    ���
���          � MBROWSE. Sera acessado em qualquer programa que utilize    ���
���          � esta funcao.                                               ���
�������������������������������������������������������������������������Ĵ��
���Parametros� Enviado ao Ponto de Entrada um vetor com 3 informacoes:    ���
���          � PARAMIXB[1] = Alias atual;                                 ���
���          � PARAMIXB[2] = Registro atual;                              ���
���          � PARAMIXB[3] = Numero da opcao selecionada                  ���
�������������������������������������������������������������������������Ĵ��
���Retorno   � Se retornar .T. executa a funcao relacionada ao botao.     ���
�������������������������������������������������������������������������Ĵ��
���Obs.:     � Utilizar na 4.07 e acima. Na 2.07 nao executa este PE.     ���
��������������������������������������������������������������������������ٱ�
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/
User Function MBRWBTN()

aArea := GetArea()
_lRet := .T.

If FWCodEmp() == "01"  //Apenas Inylbra
	
	If UPPER(Rtrim(FUNNAME())) == "MATA080"  // Cadastro de TES  
	
		If PARAMIXB[3] == 4 // Alteracao
			If SF4->F4_CODIGO <= '499'
				dbSelectArea("SD1")
				//�����������������������Ŀ
				//�Itens de nf de entrada �
				//�������������������������
				cChaveSD1 := "D1_FILIAL+D1_DOC+D1_SERIE+D1_FORNECE+D1_LOJA+D1_COD+D1_ITEM"
				cIndexSD1 := CriaTrab(nil,.f.)
				cFiltro   := "D1_TES = '"+SF4->F4_CODIGO+"' "
				cFiltro   += ".And. SD1->D1_FILIAL = '"+SF4->F4_FILIAL+"' "
				IndRegua("SD1",cIndexSD1,cChaveSD1,,cFiltro,"Selecionando registros")
				nIndexSD1 := RetIndex("SD1")
				
				dbSelectArea("SD1")
				dbSetOrder(nIndexSD1+1)
				While !Eof()
					If !Empty(SD1->D1_TES)
						MsgBox("Aten��o !!! Este TES possui movimenta��o, Altera��o n�o permitida ","Aviso","INFO")
						_lRet := .F.
						Exit
					EndIf
					dbSkip()
				EndDo
				
				Ferase(cIndexSD1+GetDbExtension())
				Ferase(cIndexSD1+OrdBagExt())
			Else
				dbSelectArea("SD2")
				//���������������������Ŀ
				//�Itens de nf de saida �
				//�����������������������
				cChaveSD2 := "D2_FILIAL+D2_DOC+D2_LOCAL+D2_NUMSEQ"
				cIndexSD2 := CriaTrab(nil,.f.)
				cFiltro   := "D2_TES = '"+SF4->F4_CODIGO+"' "
				cFiltro   += ".And. SD2->D2_FILIAL = '"+SF4->F4_FILIAL+"' "
				IndRegua("SD2",cIndexSD2,cChaveSD2,,cFiltro,"Selecionando registros")
				nIndexSD2 := RetIndex("SD2")
				
				dbSelectArea("SD2")
				dbSetOrder(nIndexSD2+1)
				While !Eof()
					If !Empty(SD2->D2_TES)
						MsgBox("Aten��o !!! Este TES possui movimenta��o, Altera��o n�o permitida ","Aviso","INFO")
						_lRet := .F.
						Exit
					EndIf
					dbSkip()
				EndDo
				
				Ferase(cIndexSD2+GetDbExtension())
				Ferase(cIndexSD2+OrdBagExt())
				
			EndIf
		EndIf
		
	ElseIf UPPER(Rtrim(FUNNAME())) == "MATA450" .And. !Alltrim(__CUSERID) $ "000000*000304*000982" // An. credito de pedido
	
		If PARAMIXB[3] == 2 // Automatico
			MsgBox("Aten��o !!! Rotina nao permitida ","Aviso","INFO")
			_lRet := .F.
		EndIf   
		
	ElseIf UPPER(Rtrim(FUNNAME())) == "MATA450A"  .And. !Alltrim(__CUSERID) $ "000000*000304*000982" // An. credito de cliente
	
		If PARAMIXB[3] == 2 // Automatico
			MsgBox("Aten��o !!! Rotina nao permitida ","Aviso","INFO")
			_lRet := .F.
		EndIf 
		
	ElseIf UPPER(Rtrim(FUNNAME())) == "MATA456"  .And. !Alltrim(__CUSERID) $ "000000*000304*000982" // Liberacao credito/estoque  
	
		// Alterado pelo Analista Evaldo em 30/09/05 as 08:54
		MsgBox("Aten��o !!! Rotina nao permitida ","Aviso","INFO")
		_lRet := .F.  
		
	ElseIf UPPER(Rtrim(FUNNAME())) == "MATA010" // PRODUTO 
	
		If PARAMIXB[3] == 4 .OR. PARAMIXB[3] == 5 // ALT/EXC
			RecLock("SB1",.F.)
			SB1->B1_DT_ALT := dDatabase
			SB1->B1_DT_INC := dDatabase
			MsUnLock()
		EndIf  
		
	ElseIf UPPER(Rtrim(FUNNAME())) == "MATA030" // CLIENTE   
	
		If PARAMIXB[3] == 4 .OR. PARAMIXB[3] == 5 // ALT/EXC
			RecLock("SA1",.F.)
			SA1->A1_DT_ALT := dDatabase
			MsUnLock()
		EndIf 
		
	ElseIf UPPER(Rtrim(FUNNAME())) == "MATA410" // PEDIDO 
	
		If PARAMIXB[3] == 4 .OR. PARAMIXB[3] == 5 // ALT/EXC
			RecLock("SC5",.F.)
			SC5->C5_DT_ALT := dDatabase
			MsUnLock()
		EndIf

	ElseIf UPPER(Rtrim(FUNNAME())) == "OMSA010" // TABELA TIPO DE PRECO   
	
		If PARAMIXB[3] == 4 .OR. PARAMIXB[3] == 5 // ALT/EXC
			RecLock("DA0",.F.)
			DA0->DA0_DT_ALT := dDatabase
			MsUnLock()
		EndIf

	ElseIf UPPER(Rtrim(FUNNAME())) == "MATA360" // CONDICAO DE PAGAMENTO
	
		If PARAMIXB[3] == 4 .OR. PARAMIXB[3] == 5 // ALT/EXC
			RecLock("SE4",.F.)
			SE4->E4_DT_ALT := dDatabase
			MsUnLock()
		EndIf 
		
	ElseIf UPPER(Rtrim(FUNNAME())) == "MATA040" // VENDEDOR
	
		If PARAMIXB[3] == 4 .OR. PARAMIXB[3] == 5 // ALT/EXC
			RecLock("SA3",.F.)
			SA3->A3_DT_ALT := dDatabase
			MsUnLock()
		EndIf 
		
	ElseIf UPPER(Rtrim(FUNNAME())) == "MATA050" // TRANSPORTADORA   
	
		If PARAMIXB[3] == 4 .OR. PARAMIXB[3] == 5 // ALT/EXC
			RecLock("SA4",.F.)
			SA4->A4_DT_ALT := dDatabase
			MsUnLock()
		EndIf  
		
	EndIf
	
Endif

RestArea(aArea)
Return(_lRet)
