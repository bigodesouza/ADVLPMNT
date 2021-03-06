#INCLUDE "Protheus.Ch"
#INCLUDE "RwMake.Ch"
#INCLUDE "TopConn.Ch"
#INCLUDE "FiveWin.Ch"
#INCLUDE "TOTVS.CH"
/*
�����������������������������������������������������������������������
�����������������������������������������������������������������������
�������������������������������������������������������������������ͻ��
���Programa  � MNTA4352� Autor�Bruno E. de Souza� Data � 20/10/17   ���
�������������������������������������������������������������������͹��
���Desc.     �Ponto de entrada Retorno mod2 mnt checklist preventiva���
�������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������
�����������������������������������������������������������������������
*/
User Function MNTA4352()

Local nRetorno  := ParamIXB[1]
Local   nOpcao       := 3
Private nLinIni      := 10
Private nColIni      := 10
Private nLinFin      := 270
Private nColFin      := 400
Private oDlgY	     := Nil
Private _oFont2      := Nil
Private oFont17	     := TFont():New( "Arial" , , 17 , , .T. , , , , , .T. , .F. )
Private cOpcaoE      := "E"
Private cOpcaoH      := "H"
Private cNumOs       := STJ->TJ_ORDEM

     If STJ->TJ_TIPMNT = "2"

          DEFINE FONT _oFont2  	NAME "Arial" Size 10,10 BOLD

          DEFINE MSDIALOG oDlgY TITLE "CHECK LIST PREVENTIVA" STYLE DS_MODALFRAME FROM nLinIni,nColIni TO nLinFin,nColFin PIXEL
          oDlgY:lCentered	:= .T.

          @ (nLinIni+005),(nColIni+015)  Button "CHECK LIST ELETRICA"    Size 150,25 PIXEL OF oDlgY ACTION U_CADMNTPRE(nOpcao,cOpcaoE,cNumOs)	FONT oFont17 PIXEL OF oDlgY
          @ (nLinIni+045),(nColIni+015)  Button "CHECK LIST HIDRAULICA"  Size 150,25 PIXEL OF oDlgY ACTION U_CADMNTPRE(nOpcao,cOpcaoH,cNumOs) FONT oFont17 PIXEL OF oDlgY
          @ (nLinIni+085),(nColIni+015)  Button "CONCLUIR"               Size 150,25 PIXEL OF oDlgY ACTION CADMNTEND(cNumOs)                  FONT oFont17 PIXEL OF oDlgY

          ACTIVATE MSDIALOG oDlgY CENTER

     EndIf

Return nRetorno
/*
�����������������������������������������������������������������������
�����������������������������������������������������������������������
�������������������������������������������������������������������ͻ��
���Programa  � CADMNTEND  � Autor�Bruno E.de SouzaData � 15/09/2020 ���
�������������������������������������������������������������������͹��
���Desc.     � Verifica se ja tem checkLIst Preventiva              ���
�������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������
�����������������������������������������������������������������������
*/
Static Function CADMNTEND(cNumOs)

   /*  dbSelectArea("ZM3")
     ZM3->(dBsetOrder(2))
     If !ZM3->(dBseek(xFilial("ZM3")+cNumOs+"H"))
          Alert('<b>Aten��o:</b><br>CheckList hidraulica n�o realizada, OS: <br><br><font color="#FF0000">'+ cNumOs +'</font>')
          Return .F.
     ElseIf !ZM3->(dBseek(xFilial("ZM3")+cNumOs+"E"))
          Alert('<b>Aten��o:</b><br>CheckList eletrica n�o realizada, OS: <br><br><font color="#FF0000">'+ cNumOs +'</font>')
          Return .F.
     Else*/
      dbSelectArea("ZM3")
     ZM3->(dBsetOrder(2))
     If !ZM3->(dBseek(xFilial("ZM3")+cNumOs))
          Alert('<b>Aten��o:</b><br>Concluir CheckList, CheckList hidraulica ou Eletrica n�o realizada, OS: <br><br><font color="#FF0000">'+ cNumOs +'</font>')
          Return .F.
     Else
          Alert('<b>Aten��o:</b><br>CheckList concluido, OS: <br><br><font color="#FF0000">'+ cNumOs +'</font>')
          oDlgY:End()
          //Return()
     EndIf

Return()
