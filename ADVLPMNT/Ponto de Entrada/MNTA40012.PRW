#INCLUDE "RWMAKE.CH"  
/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �MNT40012  �Autor  �Siga/Bruno E. Souza � Data � 17/11/17    ���
�������������������������������������������������������������������������͹��
���Desc.     �Ponto de Entrada chamado antes de montar a tela para 		  ���
��� 	     �Finaliza��o de Ordem de Servi�o. Por meio deste ponto de 	  ���
��� 	     �entrada, � poss�vel carregar para tela, o conte�do de alguns���
��� 	     �campos automaticamente. � utilizado por exemplo para 		  ���
��� 	     �apontamentos padronizados.                                  ���                         
�������������������������������������������������������������������������͹��
���Uso       � AP                                                         ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
User Function MNT40012()

Local aArray := {}
Local _aArea := GetArea()

aAdd(aArray,{"TJ_IRREGU",'"52"'})
aAdd(aArray,{"TJ_DTPRFIM","dDataBase"})	 
aAdd(aArray,{"TJ_HOPRFIM","SUBSTR(TIME(),1,5)"})  //Variaveis entre aspas " "//Textos com aspas simples e duplas '" "' 
aAdd(aArray,{"TJ_DTPRINI","STJ->TJ_DTORIGI"})
aAdd(aArray,{"TJ_HOPRINI","STJ->TJ_X_HOROS"})
 
RestArea(_aArea)

Return aArray
