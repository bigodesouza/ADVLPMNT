#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "TBICONN.CH"
#INCLUDE "RWMAKE.CH"
/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �INRMN09   �Autor  �Bruno E. de Souza   � Data �  18/07/19   ���
�������������������������������������������������������������������������͹��
���Desc.     �Relatorio TOTAL HORA CORRETIVA EMERGENCIAL                  ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
User Function INRMN09()

//�������������������������������������������������������������������������Ŀ
//� Declara variaveis										                �
//���������������������������������������������������������������������������

Private oFont11b	:= TFont():New("Arial",,11,,.F.,,,,.F.,.F.)
Private oFont12b	:= TFont():New("Arial",,12,,.T.,,,,.T.,.F.)
Private oFont15b	:= TFont():New("Arial",,15,,.T.,,,,.T.,.F.)
Private nLinha	    := 0
Private oPrint
Private cPerg   := "INRMN09"

//�������������������������������������������������������������������������Ŀ
//� Parametros																�
//���������������������������������������������������������������������������
Pergunte(cPerg,.T.)

Processa( {|lEnd| INRMN09F()}, 'Aguarde...','Gerando Relatorio...', .t. )

Return()
/*������������������������������������������������������������������������������
��������������������������������������������������������������������������������
����������������������������������������������������������������������������Ŀ��
���Programa   �INRMN09F	� Autores � Bruno E. de Souza      � Data �29/07/2019���
����������������������������������������������������������������������������Ĵ��
���Descricao  �  Imprime Informa��es Complementares                          ���
���           �                                                              ���
�����������������������������������������������������������������������������ٱ�
��������������������������������������������������������������������������������
������������������������������������������������������������������������������*/
Static Function INRMN09F()

//����������������������������������������������������Ŀ
//� Inicializa Objeto TMSPrinter					   �
//������������������������������������������������������
oPrint	:= TMSPrinter():New("TOTAL HORA CORRETIVA EMERGENCIAL")
lPrinter:= oPrint:IsPrinterActive()
oPrint:SetPortrait()  // Marca Radio Button para impressao em paisagem
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

Processa({|| INRMN09I() },"Processando Dados para Impress�o...")

oPrint:EndPage()

oPrint:Preview()

Return()
/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �INRMN09I  �Autor  �Microsiga           � Data �  18/07/19   ���
�������������������������������������������������������������������������͹��
���Desc.     �Processa dados do relatorio                                 ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
Static Function INRMN09I()

Local Nx        := 0
Local nPag      := 1
Local cQry      := ""
Local _aAux 	:= {}

//Verifica se existe Sored Procedure no banco.
If TcSPExist("SP_INRMN09")
	
	//Executa a Stored Procedure SP_INRMN09 com seus parametros
	TcSqlExec( "EXEC SP_INRMN09'" +DTOS(MV_PAR01)+ "','" +DTOS(MV_PAR02)+ "','" +MV_PAR03+ "'")
	
	cQry := "SELECT * FROM ##INRMN09"
	
	If Select("TEMP") > 0
		TEMP->(dbCloseArea())
	EndIf
	
	TCQUERY cQry NEW ALIAS "TEMP"
	
	TEMP->(DBGOTOP())
	
	While	TEMP->(!EOF())
		
		Npos := Ascan(_aAux, {|x| Alltrim(x[1])== Alltrim(TEMP->TJ_CODBEM)})
		
		If TEMP->TEMPO <> 0
			If Npos == 0
				aAdd(_aAux,{	TEMP->TJ_CODBEM	,;
				TEMP->T9_NOME	,;
				TEMP->TEMPO		})
			Else
				_aAux[Npos][3] += TEMP->TEMPO
			EndIf
		EndIf
		TEMP->(dbSkip())
	End
	Asort(_aAux,,, { |x, y| x[3] > y[3] } )
	
	oPrint:Say(0100,0820,"Periodo: "+DTOC(MV_PAR01)+" at� "+DTOC(MV_PAR02)	,oFont11b)
	oPrint:Say(0200,0050,"INYLBRA"											,oFont15b)
	oPrint:Say(0200,0650,"TOTAL HORA CORRETIVA EMERGENCIAL"				    ,oFont15b)
	oPrint:Say(0100,2000,DTOC(Date())								        ,oFont11b)
	
	oPrint:Say(0300,0350,"C�digo" 					,oFont11b)
	oPrint:Say(0300,0750,"Equipamento" 				,oFont11b)
	oPrint:Say(0300,2020,"Total horas" 				,oFont11b)
	oPrint:Say(0340,1950,"corretiva emergencial"	,oFont11b)
	oPrint:Say(3050,2000,"P�gina "+CVALTOCHAR(nPag),oFont11b)
	
	For Nx := 1 to Len(_aAux)
		
		If nLinha > 2500
			nLinha:= 0
			nPag++
			oPrint:EndPage()
			oPrint:StartPage()
			
			oPrint:Say(0100,0820,"Periodo: "+DTOC(MV_PAR01)+" at� "+DTOC(MV_PAR02)	,oFont11b)
			oPrint:Say(0200,0050,"INYLBRA"											,oFont15b)
			oPrint:Say(0200,0650,"TOTAL HORA CORRETIVA EMERGENCIAL"				    ,oFont15b)
			oPrint:Say(0100,2000,DTOC(Date())								        ,oFont11b)
			
			oPrint:Say(0300,0350,"C�digo" 					,oFont11b)
			oPrint:Say(0300,0750,"Equipamento" 				,oFont11b)
			oPrint:Say(0300,2020,"Total horas" 				,oFont11b)
			oPrint:Say(0340,1950,"corretiva emergencial"	,oFont11b)
			oPrint:Say(3050,2000,"P�gina "+CVALTOCHAR(nPag),oFont11b)
		EndIf
		
		oPrint:Say(	nLinha+0400,0350,_aAux[Nx,1]				,oFont12b)
		oPrint:Say(	nLinha+0400,0750,_aAux[Nx,2]				,oFont12b)
		oPrint:Say(	nLinha+0400,2020,CVALTOCHAR(_aAux[Nx,3])	,oFont12b)
		
		nLinha += 60
		
	Next Nx
	//////////////////////////////////////////////
	cQuery := "DROP TABLE ##INRMN09"
	
	If TCSQLExec(cQuery) < 0
		cErro := TCSQLERROR()
		MsgInfo(cErro)
	Endif
	
Else
	//Se a Stored Procedure nao existe no banco, entao e um erro. Encerra tudo.
	UserException( "A Stored Procedure SP_INRMN09 nao existe!" + Chr(10) + TCSqlError() )
Endif

Return()
