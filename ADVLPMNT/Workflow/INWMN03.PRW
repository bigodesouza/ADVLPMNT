#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณINWMN03   บAutor  ณBruno E. de Souza   บ Data ณ  16/09/2020 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณProdutos do Grupo 0611,0612 com movimenta็ใo maior que      บฑฑ
ฑฑบ          ณo estoque maximo em 3 meses                                 บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function INWMN03()

    WfPrepEnv('01','01',,,'SIGAMNT')

    RodaSche()

Return()
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRodaSche  บAutor  ณMicrosiga           บ Data ณ  16/09/2020 บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
Static Function RodaSche()

Local cQuery		:= ""
Local _cHtml 		:= ""
Local _cCor  		:= ""
Local _nCor         := 0
Local _cEmail		:= AllTrim(GETMV("IN_WFPP06"))

cQuery:= "SELECT                                                        "+ CRLF
cQuery+= "D3_COD AS 'COD',                                              "+ CRLF
cQuery+= "B1_DESC AS 'DESCR',                                           "+ CRLF
cQuery+= "B1_X_FAMBE,                                                   "+ CRLF
cQuery+= "B1_X_CODB1,                                                   "+ CRLF
cQuery+= "B1_X_CODB2,                                                   "+ CRLF
cQuery+= "B1_X_CODB3,                                                   "+ CRLF
cQuery+= "B1_GRUPO AS 'GRUPO',                                          "+ CRLF
cQuery+= "B1_EMAX AS 'ESTOMAX',                                         "+ CRLF
cQuery+= "SUM(D3_QUANT) AS 'QTDMOV'                                     "+ CRLF
cQuery+= "FROM                                                          "+ CRLF
cQuery+= +RetSqlName("SD3")+'  SD3 WITH(NOLOCK)'                         + CRLF
cQuery+= "JOIN                                                          "+ CRLF
cQuery+= +RetSqlName("SB1")+'  SB1 WITH(NOLOCK)'                         + CRLF
cQuery+= "ON                                                            "+ CRLF
cQuery+= "B1_COD = D3_COD                                               "+ CRLF
cQuery+= "WHERE                                                         "+ CRLF
cQuery+= "D3_EMISSAO BETWEEN DATEADD(DAY, -90 , GETDATE()) AND GETDATE()"+ CRLF
cQuery+= "AND                                                           "+ CRLF
cQuery+= "SB1.D_E_L_E_T_<>'*'                                           "+ CRLF
cQuery+= "AND                                                           "+ CRLF
cQuery+= "SD3.D_E_L_E_T_<>'*'                                           "+ CRLF
cQuery+= "AND                                                           "+ CRLF
cQuery+= "D3_FILIAL = '"+xFilial("SD3")+"'                              "+ CRLF
cQuery+= "AND                                                           "+ CRLF
cQuery+= "B1_MSBLQL <> 1                                                "+ CRLF
cQuery+= "AND                                                           "+ CRLF
cQuery+= "B1_GRUPO IN ('0611','0612')                                   "+ CRLF
cQuery+= "AND                                                           "+ CRLF
cQuery+= "D3_CF = 'RE0'                                                 "+ CRLF
cQuery+= "GROUP BY                                                      "+ CRLF
cQuery+= "D3_COD,                                                       "+ CRLF
cQuery+= "B1_EMAX,                                                      "+ CRLF
cQuery+= "B1_DESC,                                                      "+ CRLF
cQuery+= "B1_X_FAMBE,                                                   "+ CRLF
cQuery+= "B1_X_CODB1,                                                   "+ CRLF
cQuery+= "B1_X_CODB2,                                                   "+ CRLF
cQuery+= "B1_X_CODB3,                                                   "+ CRLF
cQuery+= "B1_GRUPO                                                      "+ CRLF
cQuery+= "HAVING SUM(D3_QUANT) > B1_EMAX                                "+ CRLF
cQuery+= "ORDER BY                                                      "+ CRLF
cQuery+= "D3_COD,                                                       "+ CRLF
cQuery+= "B1_EMAX,                                                      "+ CRLF
cQuery+= "B1_DESC,                                                      "+ CRLF
cQuery+= "B1_X_FAMBE,                                                   "+ CRLF
cQuery+= "B1_X_CODB1,                                                   "+ CRLF
cQuery+= "B1_X_CODB2,                                                   "+ CRLF
cQuery+= "B1_X_CODB3,                                                   "+ CRLF
cQuery+= "B1_GRUPO                                                      "+ CRLF

  If Select("TRB") > 0
        dbSelectArea("TRB")
        TRB->(DbCloseArea())
    EndIf

    TCQUERY cQuery NEW ALIAS TRB

    dbSelectArea("TRB")
    TRB->(dbGoTop())

      _cHtml := "<html>"
    _cHtml += "<head>"
    _cHtml += "<title>Produtos do Grupo 0611,0612 com movimenta็ใo maior que o estoque maximo em 3 meses</title>"
    _cHtml += "</head>"
    _cHtml += "<body leftmargin='0' topmargin='0' rightmargin='0' bottommargin='0'>"
    _cHtml += "<table width='100%' height='100%' border='0' cellpadding='0' cellspacing='0'>"
    _cHtml += " <tr>"
    _cHtml += "  <th width='100%' height='100%' align='center' valign='top' scope='col'>"
    _cHtml += "   <table width='1200' height='250' border='' cellpadding='0' cellspacing='0'>"
    _cHtml += "    <tr>"
    _cHtml += "     <th width='1200' height='79' scope='col'>"
    _cHtml += "      <table width='100%' height='100%' border='0' cellpadding='0' cellspacing='0' >"
    _cHtml += "       <tr>
    _cHtml += "         <td width='67%' align='center' valign='middle' scope='col'><font face='Arial' size='+1'><b>Produtos do Grupo 0611,0612 com movimenta็ใo maior que o estoque maximo em 3 meses</b></font><BR>"
    _cHtml += "          <font face='Arial' size='2'>Ref.: " + DTOC(dDataBase)+ "</font>"
    _cHtml += "			</td>"
    _cHtml += "         <td width='17%' align='right' valign='top' scope='col'><font face='Arial' size='2'>" + DTOC(dDataBase) + " <br> " + TIME() + "</font></td>"
    _cHtml += "       </tr>"
    _cHtml += "      </table>"
    _cHtml += "     </th>"
    _cHtml += "    </tr>"
    _cHtml += "    <tr>"
    _cHtml += "     <td height='25' bgcolor='#CCCCCC'>"
    _cHtml += "      <table width='100%' height='100%' border='1' cellpadding='0' cellspacing='0'>"
    _cHtml += "       <tr>"
    _cHtml += "        <th width='15%' height='100%' align='center' valign='middle' scope='col'><font face='Arial' size='2'><b>PRODUTO                 	</b></font></th>"
    _cHtml += "        <th width='25%' height='100%' align='center' valign='middle' scope='col'><font face='Arial' size='2'><b>DESCRIวรO                </b></font></th>"
    _cHtml += "        <th width='5%' height='100%' align='center' valign='middle' scope='col'><font face='Arial' size='2'><b>GRUPO                 	</b></font></th>"
    _cHtml += "        <th width='10%' height='100%' align='center' valign='middle' scope='col'><font face='Arial' size='2'><b>FAMILIA BEM             	</b></font></th>"
    _cHtml += "        <th width='10%' height='100%' align='center' valign='middle' scope='col'><font face='Arial' size='2'><b>BEM 1                 	</b></font></th>"
    _cHtml += "        <th width='10%' height='100%' align='center' valign='middle' scope='col'><font face='Arial' size='2'><b>BEM 2                 	</b></font></th>"
    _cHtml += "        <th width='10%' height='100%' align='center' valign='middle' scope='col'><font face='Arial' size='2'><b>BEM 3                 	</b></font></th>"
    _cHtml += "        <th width='10%' height='100%' align='center' valign='middle' scope='col'><font face='Arial' size='2'><b>ESTOQUE MAXIMO      		</b></font></th>"
    _cHtml += "        <th width='5%' height='100%' align='center' valign='middle' scope='col'><font face='Arial' size='2'><b>QTD. MOVIMENTADA    		</b></font></th>"
    _cHtml += "       </tr>"
    _cHtml += "      </table>"
    _cHtml += "     </td>"
    _cHtml += "    </tr>"
    _cHtml += "<tr>"
    _cHtml += " <td height='25' bgcolor='#FFFFFF'>"
    _cHtml += "  <table width='100%' height='100%' border='0' cellpadding='0' cellspacing='0'>"
    _cHtml += "   <tr>"
    _cHtml += "    <th width='9%' height='100%' align='center' valign='middle' bgcolor='#000066' scope='col'>"
    _cHtml += "    </th>"
    _cHtml += "    <th width='91%' align='left' valign='middle' bgcolor='#000066' scope='col'>"
    _cHtml += "    </th>"
    _cHtml += "   </tr>"
    _cHtml += "  </table>"
    _cHtml += " </td>"
    _cHtml += "</tr>"
 
    While TRB->(!EOF())
            If _nCor%2 <> 0
                _cCor := "#E0FFFF"
            Else
                _cCor := "#CCDAEA"
            EndIf

            _cHtml += "<tr>"
            _cHtml += " <td height='25' bgcolor='#FFFFFF'>"
            _cHtml += "  <table width='100%' height='100%' border='1' cellpadding='0' cellspacing='0'>"
            _cHtml += "   <tr>"
            _cHtml += "    <td width='15%' height='20' align='Center'   valign='middle' bgcolor='" + _cCor + "' scope='col'><font size='2' face='Arial'>"  + TRB->COD				+ "</font></td>"
            _cHtml += "    <td width='25%' height='20' align='Center'   valign='middle' bgcolor='" + _cCor + "' scope='col'><font size='2' face='Arial'>"  + ALLTRIM(DESCR)			+ "</font></td>"
            _cHtml += "    <td width='5%' height='20' align='Center'   valign='middle' bgcolor='" + _cCor + "' scope='col'><font size='2' face='Arial'>"  + TRB->GRUPO    	        + "</font></td>"
            _cHtml += "    <td width='10%' height='20' align='Center'   valign='middle' bgcolor='" + _cCor + "' scope='col'><font size='2' face='Arial'>"  + TRB->B1_X_FAMBE    	+ "</font></td>"
            _cHtml += "    <td width='10%' height='20' align='Center'   valign='middle' bgcolor='" + _cCor + "' scope='col'><font size='2' face='Arial'>"  + TRB->B1_X_CODB1    	+ "</font></td>"
            _cHtml += "    <td width='10%' height='20' align='Center'   valign='middle' bgcolor='" + _cCor + "' scope='col'><font size='2' face='Arial'>"  + TRB->B1_X_CODB2    	+ "</font></td>"
            _cHtml += "    <td width='10%' height='20' align='Center'   valign='middle' bgcolor='" + _cCor + "' scope='col'><font size='2' face='Arial'>"  + TRB->B1_X_CODB3   		+ "</font></td>"
            _cHtml += "    <td width='10%' height='20' align='Center'   valign='middle' bgcolor='" + _cCor + "' scope='col'><font size='2' face='Arial'>"  + ALLTRIM(TRANSFORM(TRB->ESTOMAX,"@E 99999999.99"))+ "</b></font></td>"
            _cHtml += "    <td width='5%' height='20' align='Center'   valign='middle' bgcolor='" + _cCor + "' scope='col'><font size='2' face='Arial'>"  + ALLTRIM(TRANSFORM(TRB->QTDMOV,"@E 99999999.99"))	+ "</b></font></td>"
            _cHtml += "   </tr>"
            _cHtml += "  </table>"
            _cHtml += " </td>"
            _cHtml += "</tr>"
            
            TRB->(dbSkip())
    EndDo
    TRB->(dbCloseArea())

    _cHtml += "   </table>"
    _cHtml += "  </th>"
    _cHtml += " </tr>"
    _cHtml += "</table>"
    _cHtml += "</body>"
    _cHtml += "</html>"

    u_GeraMail(,,,,_cEmail,"Produtos do Grupo 0611,0612 com movimenta็ใo maior que o estoque maximo em 3 meses",_cHtml,,.T.)

Return()
