#INCLUDE "RWMAKE.CH"  
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³MNT40012  ºAutor  ³Siga/Bruno E. Souza º Data ³ 17/11/17    º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³Ponto de Entrada chamado antes de montar a tela para 		  º±±
±±º 	     ³Finalização de Ordem de Serviço. Por meio deste ponto de 	  º±±
±±º 	     ³entrada, é possível carregar para tela, o conteúdo de algunsº±±
±±º 	     ³campos automaticamente. É utilizado por exemplo para 		  º±±
±±º 	     ³apontamentos padronizados.                                  º±±                         
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ AP                                                         º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
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
