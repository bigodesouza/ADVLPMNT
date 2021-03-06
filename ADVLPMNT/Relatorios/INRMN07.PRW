#INCLUDE "RWMAKE.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � INRMN07  � Autor � Vitor Badam        � Data �  14/08/2017 ���
�������������������������������������������������������������������������͹��
���Descricao � Relatorio de Rastreabilidade de Ferramentas 				  ���
���          �  		                                                  ���
�������������������������������������������������������������������������͹��
���Uso       � MP11	                                                      ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
User Function INRMN07()

//�������������������������������������������������������������������������Ŀ
//� Declara variaveis										                �
//���������������������������������������������������������������������������
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
Private cPerg       := "INRMN07PG"
Private cQuery

If Pergunte(cPerg, .T.)
	Processa( {|lEnd| PRRMN07()}, 'Aguarde...','Gerando relat�rio...', .t. )
EndIf

Return

/*������������������������������������������������������������������������������
��������������������������������������������������������������������������������
����������������������������������������������������������������������������Ŀ��
���Programa   �PRRMN07  � Autores � Vitor Badam            � Data �14/08/2017���
����������������������������������������������������������������������������Ĵ��
���Descricao  �  Imprime Informa��es Complementares                          ���
���           �                                                              ���
�����������������������������������������������������������������������������ٱ�
��������������������������������������������������������������������������������
������������������������������������������������������������������������������*/
Static Function PRRMN07()

Local   nRegs      := 0

//����������������������������������������������������Ŀ
//� Inicializa Objeto TMSPrinter					   �
//������������������������������������������������������
oPrint  := TMSPrinter():New("RASTREABILIDADE DE FERRAMENTAS")
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

cQuery := " SELECT TJ_CODBEM,TJ_X_ENTFE , TJ_X_SAIFE ,TJ_DTORIGI ,TJ_X_HOROS,TJ_TIPMNT,TJ_ORDEM   FROM " + RetSqlName("STJ") + " STJ WITH(NOLOCK) " + CRLF
cQuery += " WHERE D_E_L_E_T_ <> '*' " 	+ CRLF
cQuery += " AND TJ_DTORIGI BETWEEN  '" + Dtos(MV_PAR01)+"' AND '" + Dtos(MV_PAR02) +"'    " + CRLF
cQuery += " AND TJ_X_ENTFE = '" + MV_PAR03 +"' OR (TJ_X_SAIFE = '" + MV_PAR03 +"' )   OR (TJ_CODBEM = '" + MV_PAR03 +"'  )  " + CRLF
cQuery += " ORDER BY TJ_DTORIGI   " + CRLF

If Select("QUESSTJ") > 0
	QUESSTJ->(dbCloseArea())
EndIf

CursorWait()
dbUseArea( .t.,'TOPCONN', TcGenQry( ,, cQuery ), 'QUESSTJ',.F., .T. )
CursorArrow()
count to nRegs
ProcRegua(nRegs)
dbGoTop()

//������������������������������������������������������������Ŀ
//� Inicia a impressao										   �
//� da Frente do Relatorio								       �
//��������������������������������������������������������������
oPrint:StartPage()

LBSTJCAB() // Cabecalho
LBSTJACOR()//Corpo

nLin := 420

WHILE QUESSTJ->(!EOF())
	IncProc('Carregando Relat�rio!')
	
	If nLin > 3200
		nPag++
		nLin := 420
		oPrint:EndPage()
		oPrint:StartPage()
		LBSTJCAB()
		LBSTJACOR()
	EndIf
	
	//���������������������������������Ŀ
	//�Tras Apenas Informa��o da Maquina�
	//�����������������������������������
		
	If Alltrim(QUESSTJ->TJ_X_ENTFE) == Alltrim(MV_PAR03)
		
		oPrint:Say(nLin,0110,Alltrim(QUESSTJ->TJ_X_ENTFE) +"-"+ QUESSTJ->TJ_ORDEM      	   		,oFont13n) //Ferramenta
		oPrint:Say(nLin,0750,Alltrim(QUESSTJ->TJ_CODBEM)      	   			   						,oFont13n) //Maquina
		oPrint:Say(nLin,1430,Transform(QUESSTJ->TJ_X_HOROS	,"@R  99:99")     	   	   				,oFont13n) //Hora
		oPrint:Say(nLin,1920,Transform(Stod(QUESSTJ->TJ_DTORIGI),"@R")     	   	   				,oFont13n) //Emissao
		
		oPrint:Line(nLin,0590,nLin+90,0590)	//Linha Vertical
		oPrint:Line(nLin,1200,nLin+90,1200)	//Linha Vertical
		oPrint:Line(nLin,1800,nLin+90,1800)	//Linha Vertical
		
		oPrint:Line( nLin-10, 0040, nLin-10, 2310 )  //Horizontal
		
		nLin += 90    
		
	Endif
	  
	//����������������������������������������������Ŀ
	//�Tras Informa��es das Ferramentas - PREVENTIVAS�
	//������������������������������������������������

	If QUESSTJ->TJ_TIPMNT == "2"
		
		oPrint:Say(nLin,0110,Alltrim(QUESSTJ->TJ_CODBEM)+"-"+ QUESSTJ->TJ_ORDEM       	   	 		,oFont13n) //Ferramenta
		oPrint:Say(nLin,0750,Alltrim("FERRAMENTARIA")      	   			   					  		,oFont13n) //Maquina
		oPrint:Say(nLin,1430,Transform(QUESSTJ->TJ_X_HOROS	,"@R  99:99")     	   	   				,oFont13n) //Hora
		oPrint:Say(nLin,1920,Transform(Stod(QUESSTJ->TJ_DTORIGI),"@R")     	   	   				,oFont13n) //Emissao
		
		oPrint:Line(nLin,0590,nLin+90,0590)	//Linha Vertical
		oPrint:Line(nLin,1200,nLin+90,1200)	//Linha Vertical
		oPrint:Line(nLin,1800,nLin+90,1800)	//Linha Vertical
		
		oPrint:Line( nLin-10, 0040, nLin-10, 2310 )  //Horizontal
		
		nLin += 90   
		
	Endif
	
	//�����������������������������������������������������������������������Ŀ
	//�Tras Apenas Informa�oes da Ferramenta de Saida - Saida e sempre ESTOQUE�
	//�������������������������������������������������������������������������
	
	If Alltrim(QUESSTJ->TJ_X_SAIFE) == Alltrim(MV_PAR03)
		
		oPrint:Say(nLin,0110,Alltrim(QUESSTJ->TJ_X_SAIFE)+"-"+ QUESSTJ->TJ_ORDEM       	   		,oFont13n) //Ferramenta
		oPrint:Say(nLin,0750,Alltrim("ESTOQUE")      	   			   					  			,oFont13n) //Maquina
		oPrint:Say(nLin,1430,Transform(QUESSTJ->TJ_X_HOROS	,"@R  99:99")     	   	   				,oFont13n) //Hora
		oPrint:Say(nLin,1920,Transform(Stod(QUESSTJ->TJ_DTORIGI),"@R")     	   	   				,oFont13n) //Emissao
		
		oPrint:Line(nLin,0590,nLin+90,0590)	//Linha Vertical
		oPrint:Line(nLin,1200,nLin+90,1200)	//Linha Vertical
		oPrint:Line(nLin,1800,nLin+90,1800)	//Linha Vertical
		
		oPrint:Line( nLin-10, 0040, nLin-10, 2310 )  //Horizontal
		
		nLin += 90
		
	Endif
	
	QUESSTJ->(dbSkip())
Enddo

oPrint:Line( nLin, 0040, nLin, 2310 )  //Horizontal

oPrint:EndPage()
oPrint:Preview()

Return

/*������������������������������������������������������������������������������
��������������������������������������������������������������������������������
����������������������������������������������������������������������������Ŀ��
���Programa   �LBSTJCAB � Autores � Vitor Badam            � Data �14/08/2017���
����������������������������������������������������������������������������Ĵ��
���Descricao  �  Imprime Cabe�alho do Relatorio                              ���
���           �                                                              ���
�����������������������������������������������������������������������������ٱ�
��������������������������������������������������������������������������������
������������������������������������������������������������������������������*/
Static Function LBSTJCAB()

oPrint:Box (0040,0040,0320,2310)
oPrint:SayBitmap(0070,0055, "lgrl01.bmp",290,148)

oPrint:Say(0090,680,"RASTREABILIDADE DA FERRAMENTA ",oFont20b)

oPrint:Line(0200,0040,0200,2310)    // Linha Horizontal

oPrint:Say(0220,0900, Transform(MV_PAR01,"@E")+ " A  "+ Transform(MV_PAR02,"@E" ) ,oFont15b)

nLinha := 400

Return .T.

/*������������������������������������������������������������������������������
��������������������������������������������������������������������������������
����������������������������������������������������������������������������Ŀ��
���Programa   �LBSTJACOR� Autores � Vitor Badam            � Data �14/08/2017���
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
