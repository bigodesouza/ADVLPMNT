#INCLUDE "Rwmake.ch"
#INCLUDE "Protheus.ch"
/*/
������������������������������������������������������������������������������
������������������������������������������������������������������������������
��������������������������������������������������������������������������Ŀ��
���Programa  � INRMN11                                                    ���
��������������������������������������������������������������������������Ĵ��
���Descricao � Relat�rio de Mapa de acompanhamento de necessidade de MP    ���
��������������������������������������������������������������������������Ĵ��
���Altera�oes� incluido perguntas via parambox, pois nas perguntas via cfg ���
���          �  nao existe combo para 8 op�oes.                            ���
���          �                                                             ���
���������������������������������������������������������������������������ٱ�
��������������������������������������������������������������������������Ĵ��
���Criado em � 24/09/2020 � Analista � VITOR.TDI	                       ���
���Modificado� 			  �          � 									   ���
���������������������������������������������������������������������������ٱ�
������������������������������������������������������������������������������
������������������������������������������������������������������������������
DIN - Desenvolvimento Inylbra              -                      Documentacao
������������������������������������������������������������������������������
/*/

User Function INRMN11()

    Local aRet		:= {}
    Local cPar		:= ""
    Local aParamBox := {}
    Local _cOpcoes  := "1;0;1;INRMN11"
    Local _aCombo	:= {"0611","0612"}

    aadd(aParamBox,{1,"Data de"				,dDataBase	,"","","","",50,.F.})
    aadd(aParamBox,{1,"Data Ate"			,dDataBase	,"","","","",50,.F.})
    aadd(aParamBox,{1,"Produto de :"		,Space(15)	,"","","SB1","",0,.F.})
    aadd(aParamBox,{1,"Produto Ate :"		,Space(15)	,"","","SB1","",0,.F.})
    aadd(aParamBox,{2,"Grupo TB"            ,			,_aCombo ,95, , .F.})

    If ParamBox(aParamBox,"Pergunta",@aRet)

        cPar := dtos(aRet[1])+";"+dtos(aRet[2])+";"+aRet[3]+";"+aRet[4]+";"+aRet[5]

        callcrys("INRMN11",cPar,_cOpcoes)

    EndIf

Return
