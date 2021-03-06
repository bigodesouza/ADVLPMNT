#INCLUDE "RWMAKE.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �INRMN08   �Autor  �Bruno E. de Souza   � Data �  24/09/18   ���
�������������������������������������������������������������������������͹��
���Desc.     �Relatorio rastreabilidade de ferramentas                    ���
���          �, ultima movimenta��o                                       ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
User Function INRMN08()

Private oFont13n	:= TFont():New("Courier New",,12,,.F.,,,,.T.,.F.)
Private oFont10b	:= TFont():New("Arial",,10,,.T.,,,,.T.,.F.)
Private oFont13b	:= TFont():New("Courier New",,13,,.T.,,,,.T.,.F.)
Private oFont15b	:= TFont():New("Courier New",,13,,.T.,,,,.T.,.F.)
Private oFont20b	:= TFont():New("Arial",,20,,.T.,,,,.T.,.F.)
Private oBrshCin	:= TBrush():New("",RGB(190,190,190)) //Cinza
Private nLinha	    := 0
Private nLin        := 0
Private nPag        := 1
Private oPrint
Private cQuery 
Private _cQuery 

DEFINE MSDIALOG oDlg TITLE "Rastreabilidade de Ferramentas" FROM 000,000 TO 150,360 PIXEL OF oMainWnd

@ 001,001 TO 050,180 Label ""  																			PIXEL OF oDlg
@ 010,010 say "Relatorio rastreabilidade de ferramentas, ultima movimenta��o." FONT oFont SIZE 160,100	PIXEL OF oDlg
@ 060,50  BUTTON "OK"			SIZE 038,013	ACTION Processa({||PRRMN08() },"Processando dados...")	PIXEL OF oDlg
@ 060,100 BUTTON "CANCELAR"		SIZE 038,013	ACTION oDlg:end()										PIXEL OF oDlg

ACTIVATE MSDIALOG oDlg CENTERED 

Return()   
/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �PRRMN08   �Autor  �Microsiga           � Data �  24/09/18	  ���
�������������������������������������������������������������������������͹��
���Desc.     � Impressao                                                  ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/ 
Static Function PRRMN08()  

Local nRegs := 0 

//����������������������������������������������������Ŀ
//� Inicializa Objeto TMSPrinter					   �
//������������������������������������������������������
oPrint  := TMSPrinter():New("RASTREABILIDADE DE FERRAMENTAS ULTIMA MOVIMENTA��O.")
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

cQuery := "	SELECT							" + CRLF
cQuery += "	H4_CODIGO,						" + CRLF
cQuery += "	H4_DESCRI						" + CRLF
cQuery += "	FROM							" + CRLF
cQuery += "	" + RetSqlName("SH4") + " WITH(NOLOCK)		" + CRLF
cQuery += "	WHERE							" + CRLF
cQuery += "	D_E_L_E_T_<>'*'					" + CRLF
cQuery += "	AND								" + CRLF
cQuery += "	H4_FILIAL = '"+xFilial("SH4")+"'" + CRLF  
cQuery += "	ORDER BY						" + CRLF  
cQuery += "	H4_CODIGO						" + CRLF  

If Select("TRB1") > 0
	TRB1->(dbCloseArea())
EndIf

CursorWait()
dbUseArea( .t.,'TOPCONN', TcGenQry( ,, cQuery ), 'TRB1',.F., .T. )
CursorArrow()
count to nRegs
ProcRegua(nRegs)
TRB1->(dbGoTop())  

oPrint:StartPage()

LBSTJCAB() // Cabecalho
LBSTJACOR()//Corpo

nLin := 420

WHILE TRB1->(!EOF())
	IncProc('Carregando Relat�rio!')
	
	If nLin > 3200
		nPag++
		nLin := 420
		oPrint:EndPage()
		oPrint:StartPage()
		LBSTJCAB()
		LBSTJACOR()
	EndIf  
	
_cQuery	:= " SELECT TOP 1																																		" + CRLF 
_cQuery += " TJ_CODBEM,TJ_X_ENTFE , TJ_X_SAIFE ,TJ_DTORIGI ,TJ_X_HOROS,TJ_TIPMNT,TJ_ORDEM   FROM  STJ010  STJ WITH(NOLOCK)  									" + CRLF
_cQuery += " WHERE D_E_L_E_T_ <> '*' 																															" + CRLF 	  
_cQuery += " AND TJ_X_ENTFE = '"+ALLTRIM(TRB1->H4_CODIGO)+"' OR (TJ_X_SAIFE = '"+ALLTRIM(TRB1->H4_CODIGO)+"') OR (TJ_CODBEM = '"+ALLTRIM(TRB1->H4_CODIGO)+"')" + CRLF 
_cQuery += " AND TJ_FILIAL =  '"+xFilial("STJ")+"'																												" + CRLF 
_cQuery += " ORDER BY 																									   										" + CRLF
_cQuery += " TJ_ORDEM DESC																																		" + CRLF           

If Select("TRB2") > 0
	dbSelectArea("TRB2")
	TRB2->(dbCloseArea())
EndIf

// Cria tabela temporaria
TCQUERY _cQuery NEW ALIAS "TRB2"

dbSelectArea("TRB2")
TRB2->(dbGoTop()) 

	If Alltrim(TRB2->TJ_X_ENTFE) == ALLTRIM(TRB1->H4_CODIGO)
		
		oPrint:Say(nLin,0110,Alltrim(TRB2->TJ_X_ENTFE) +"-"+ TRB2->TJ_ORDEM  ,oFont13n) //Ferramenta
		oPrint:Say(nLin,0750,Alltrim(TRB2->TJ_CODBEM)      	   			   ,oFont13n) //Maquina
		oPrint:Say(nLin,1430,Transform(TRB2->TJ_X_HOROS	,"@R  99:99")      ,oFont13n) //Hora
		oPrint:Say(nLin,1920,Transform(Stod(TRB2->TJ_DTORIGI),"@R")     	   ,oFont13n) //Emissao
		
		oPrint:Line(nLin,0590,nLin+90,0590)	//Linha Vertical
		oPrint:Line(nLin,1200,nLin+90,1200)	//Linha Vertical
		oPrint:Line(nLin,1800,nLin+90,1800)	//Linha Vertical
		
		oPrint:Line( nLin-10, 0040, nLin-10, 2310 )  //Horizontal
		
		nLin += 90    
		
	Endif
	  
	//����������������������������������������������Ŀ
	//�Tras Informa��es das Ferramentas - PREVENTIVAS�
	//������������������������������������������������

	If TRB2->TJ_TIPMNT == "2"
		
		oPrint:Say(nLin,0110,Alltrim(TRB2->TJ_CODBEM)+"-"+ TRB2->TJ_ORDEM 	,oFont13n) //Ferramenta
		oPrint:Say(nLin,0750,Alltrim("FERRAMENTARIA")      	   			   	,oFont13n) //Maquina
		oPrint:Say(nLin,1430,Transform(TRB2->TJ_X_HOROS	,"@R  99:99")  	,oFont13n) //Hora
		oPrint:Say(nLin,1920,Transform(Stod(TRB2->TJ_DTORIGI),"@R")     	,oFont13n) //Emissao
		
		oPrint:Line(nLin,0590,nLin+90,0590)	//Linha Vertical
		oPrint:Line(nLin,1200,nLin+90,1200)	//Linha Vertical
		oPrint:Line(nLin,1800,nLin+90,1800)	//Linha Vertical
		
		oPrint:Line( nLin-10, 0040, nLin-10, 2310 )  //Horizontal
		
		nLin += 90   
		
	Endif
	
	//�����������������������������������������������������������������������Ŀ
	//�Tras Apenas Informa�oes da Ferramenta de Saida - Saida e sempre ESTOQUE�
	//�������������������������������������������������������������������������
	
	If Alltrim(TRB2->TJ_X_SAIFE) == ALLTRIM(TRB1->H4_CODIGO)
		
		oPrint:Say(nLin,0110,Alltrim(TRB2->TJ_X_SAIFE)+"-"+ TRB2->TJ_ORDEM  ,oFont13n) //Ferramenta
		oPrint:Say(nLin,0750,Alltrim("ESTOQUE")      	   			   		  ,oFont13n) //Maquina
		oPrint:Say(nLin,1430,Transform(TRB2->TJ_X_HOROS	,"@R  99:99")     ,oFont13n) //Hora
		oPrint:Say(nLin,1920,Transform(Stod(TRB2->TJ_DTORIGI),"@R")     	  ,oFont13n) //Emissao
		
		oPrint:Line(nLin,0590,nLin+90,0590)	//Linha Vertical
		oPrint:Line(nLin,1200,nLin+90,1200)	//Linha Vertical
		oPrint:Line(nLin,1800,nLin+90,1800)	//Linha Vertical
		
		oPrint:Line( nLin-10, 0040, nLin-10, 2310 )  //Horizontal
		
		nLin += 90
		
	Endif
	
	TRB1->(dbSkip())
Enddo

oPrint:Line( nLin, 0040, nLin, 2310 )  //Horizontal

oPrint:EndPage()
oPrint:Preview()

Return

/*������������������������������������������������������������������������������
��������������������������������������������������������������������������������
����������������������������������������������������������������������������Ŀ��
���Programa   �LBSTJCAB � Autores � Vitor Badam            � Data �26/09/2018���
����������������������������������������������������������������������������Ĵ��
���Descricao  �  Imprime Cabe�alho do Relatorio                              ���
���           �                                                              ���
�����������������������������������������������������������������������������ٱ�
��������������������������������������������������������������������������������
������������������������������������������������������������������������������*/
Static Function LBSTJCAB()

oPrint:Box (0040,0040,0320,2310)
oPrint:SayBitmap(0070,0055, "lgrl01.bmp",290,148)

oPrint:Say(0090,560,"RASTREABILIDADE DE FERRAMENTAS ULTIMA MOVIMENTA��O.",oFont20b)

oPrint:Line(0200,0040,0200,2310)    // Linha Horizontal

nLinha := 400

Return .T.

/*������������������������������������������������������������������������������
��������������������������������������������������������������������������������
����������������������������������������������������������������������������Ŀ��
���Programa   �LBSTJACOR� Autores � Vitor Badam            � Data �26/09/2018���
����������������������������������������������������������������������������Ĵ��
���Descricao  �  Imprime corpo do Relatorio                                  ���
���           �                                                              ���
�����������������������������������������������������������������������������ٱ�
��������������������������������������������������������������������������������
������������������������������������������������������������������������������*/
Static Function LBSTJACOR()

oPrint:Box(0300,0040,3310,2310)

oPrint:Line(nLinha-80,0590,nLinha+20,0590)	//Linha Vertical
oPrint:Line(nLinha-80,1200,nLinha+20,1200)	//Linha Vertical
oPrint:Line(nLinha-80,1800,nLinha+20,1800)	//Linha Vertical

oPrint:Say(nLinha-065,0100,"FERRAMENTA/ORDEM"          ,oFont10b)
oPrint:Say(nLinha-065,0790,"MAQUINA"              		,oFont10b)
oPrint:Say(nLinha-065,1450,"HORA"            			,oFont10b)
oPrint:Say(nLinha-065,2000,"DATA"      					,oFont10b)

oPrint:Say (3315,0080,cUsername   				  		,oFont10b)
oPrint:Say (3315,2180,"Pag.  "+ Strzero(nPag,2)  		,oFont10b)

Return .T.  