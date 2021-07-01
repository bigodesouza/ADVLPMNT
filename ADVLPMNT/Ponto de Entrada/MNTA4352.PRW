#INCLUDE "Protheus.Ch"
#INCLUDE "RwMake.Ch"
#INCLUDE "TopConn.Ch"
#INCLUDE "FiveWin.Ch"
#INCLUDE "TOTVS.CH"
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ MNTA4352º Autor³Bruno E. de Souzaº Data ³ 20/10/17   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³Ponto de entrada Retorno mod2 mnt checklist preventivaº±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
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
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ CADMNTEND  º Autor³Bruno E.de SouzaData ³ 15/09/2020 º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Verifica se ja tem checkLIst Preventiva              º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function CADMNTEND(cNumOs)

   /*  dbSelectArea("ZM3")
     ZM3->(dBsetOrder(2))
     If !ZM3->(dBseek(xFilial("ZM3")+cNumOs+"H"))
          Alert('<b>Atenção:</b><br>CheckList hidraulica não realizada, OS: <br><br><font color="#FF0000">'+ cNumOs +'</font>')
          Return .F.
     ElseIf !ZM3->(dBseek(xFilial("ZM3")+cNumOs+"E"))
          Alert('<b>Atenção:</b><br>CheckList eletrica não realizada, OS: <br><br><font color="#FF0000">'+ cNumOs +'</font>')
          Return .F.
     Else*/
      dbSelectArea("ZM3")
     ZM3->(dBsetOrder(2))
     If !ZM3->(dBseek(xFilial("ZM3")+cNumOs))
          Alert('<b>Atenção:</b><br>Concluir CheckList, CheckList hidraulica ou Eletrica não realizada, OS: <br><br><font color="#FF0000">'+ cNumOs +'</font>')
          Return .F.
     Else
          Alert('<b>Atenção:</b><br>CheckList concluido, OS: <br><br><font color="#FF0000">'+ cNumOs +'</font>')
          oDlgY:End()
          //Return()
     EndIf

Return()
