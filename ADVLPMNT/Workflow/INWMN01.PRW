#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH" 

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณINWMN01   บAutor  ณBruno E. de Souza   บ Data ณ  28/12/17   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณEnvia Workflow de notifica็ao de SC pendente da manuten็ao  บฑฑ
ฑฑบ          ณpendente a mais de 15 dias                                  บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ AP                                                         บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/
User Function INWMN01()    

WfPrepEnv('01','01',,,'SIGAMNT')

RodaSche()

Return
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณRodaSche  บAutor  ณMicrosiga           บ Data ณ  28/12/2017 บฑฑ
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
Local _cBody 		:= ""
Local _cCor  		:= ""
Local _cEmail		:= AllTrim(GETMV("IN_WFSCMN"))
Local _nY    		:= 0
Local cCrtl 		:= 0   

cQuery:= "SELECT																							  " + CRLF
cQuery+= "C1_NUM AS 'SC',																					  " + CRLF
cQuery+= "C1_ITEM AS 'ITEMSC',																				  " + CRLF
cQuery+= "C1_PRODUTO AS 'PRODUTO',																		   	  " + CRLF
cQuery+= "C1_DESCRI AS 'DESCPROD',																			  " + CRLF
cQuery+= "SUBSTRING(C1_DATPRF,7,2)+'/'+ SUBSTRING(C1_DATPRF,5,2)+'/'+SUBSTRING(C1_DATPRF,1,4) AS 'PREVENT',   " + CRLF
cQuery+= "SUBSTRING(C1_EMISSAO,7,2)+'/'+ SUBSTRING(C1_EMISSAO,5,2)+'/'+SUBSTRING(C1_EMISSAO,1,4) AS 'EMISSC', " + CRLF
cQuery+= "C1_COTACAO AS 'COTACAO',																			  " + CRLF
cQuery+= "C1_PEDIDO AS 'PEDIDO',																			  " + CRLF
cQuery+= "C1_QUANT AS 'QTDSOLIC',																			  " + CRLF
cQuery+= "C1_QUJE  AS 'QTDATEND',																			  " + CRLF  
cQuery+= "C1_OBS AS 'OBS',																					  " + CRLF 
cQuery+= "C1_APLIC AS 'APLIC',																				  " + CRLF 
cQuery+= "B1_GRUPO,																							  " + CRLF 
cQuery+= "C1_UNIDREQ																						  " + CRLF 
cQuery+= "FROM																								  " + CRLF 
cQuery+= +RetSqlName("SC1")+'  C1 WITH(NOLOCK)' 															    + CRLF 
cQuery+= "JOIN																								  " + CRLF 
cQuery+= +RetSqlName("SB1")+'  B1 WITH(NOLOCK) ' 																+ CRLF 
cQuery+= "ON																								  " + CRLF 
cQuery+= "B1_COD = C1_PRODUTO																				  " + CRLF 
cQuery+= "WHERE																								  " + CRLF
cQuery+= "C1_APROV = 'L'																					  " + CRLF
cQuery+= "AND																								  " + CRLF
cQuery+= "C1_QUJE <> C1_QUANT																				  " + CRLF
cQuery+= "AND																								  " + CRLF
cQuery+= "C1_RESIDUO NOT IN ('S','E')																		  " + CRLF
cQuery+= "AND																								  " + CRLF
cQuery+= "DATEDIFF(DAY,C1_EMISSAO,GETDATE()) > '15' 														  " + CRLF
cQuery+= "AND																								  " + CRLF
cQuery+= "C1.D_E_L_E_T_<>'*'																				  " + CRLF
cQuery+= "AND																								  " + CRLF
cQuery+= "B1.D_E_L_E_T_<>'*'																				  " + CRLF
cQuery+= "AND																								  " + CRLF
cQuery+= "C1_FILIAL = '"+xFilial("SC1")+"' 																	  " + CRLF
cQuery+= "AND																								  " + CRLF
cQuery+= "C1_PEDIDO = ''																					  " + CRLF
cQuery+= "ORDER BY																							  " + CRLF
cQuery+= "C1_NUM 																							  " + CRLF  

If Select("TRB") > 0
	dbSelectArea("TRB")
	TRB->(DbCloseArea())
EndIf

TCQUERY cQuery NEW ALIAS TRB
  
dbSelectArea("TRB")
TRB->(dbGoTop()) 

_cBody := '<html>'
_cBody += '<head>'
_cBody += '<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">'
_cBody += '</head>'
_cBody += '<html>'
_cBody += '<head></head>'
_cBody += '<html>'
_cBody += '<head>'
_cBody += '<title>SOLICITAวีES DE COMPRAS DE MANUTENวรO PENDENTES</title>'
_cBody += '</head>'
_cBody += '<body>'
_cBody += '<center>'
_cBody += '  <table width="2100" border="0" cellspacing="0" cellpadding="0">'
_cBody += '    <tr>'
_cBody += '      <td colspan="12" bgcolor="#000033" align="center"><div align="center"><strong><font color="#FFFFFF" face="Arial, Helvetica, sans-serif">SOLICITA&Ccedil;&Otilde;ES DE COMPRAS DE MANUTEN&Ccedil;&Atilde;O PENDENTES </font></strong> </div></td>'
_cBody += '    </tr>'
_cBody += '    <tr>'
_cBody += '      <td width="114" bgcolor="#FF9933" align="left" valign="baseline"><div align="center"><strong><font size="2" face="Arial, Helvetica, sans-serif">Numero SC</font></strong> </div></td>'
_cBody += '      <td width="105" bgcolor="#FF9933" align="left" valign="baseline"><div align="center"><b><font size="2" face="Arial, Helvetica, sans-serif">Item SC </font></b></div></td>'
_cBody += '      <td width="140" bgcolor="#FF9933" align="left" valign="baseline"><b><font size="2" face="Arial, Helvetica, sans-serif">Codigo Produto </font></b></td>'
_cBody += '      <td width="268" bgcolor="#FF9933" align="left" valign="baseline"><b><font size="2" face="Arial, Helvetica, sans-serif">Descri&ccedil;ao Produto </font></b></td>'
_cBody += '      <td width="130" bgcolor="#FF9933" align="left" valign="baseline"><div align="center"><b><font size="2" face="Arial, Helvetica, sans-serif">Data Necessidade</font> </b></div></td>'
_cBody += '      <td width="105" bgcolor="#FF9933" align="left" valign="baseline"><div align="center"><strong><font size="2" face="Arial, Helvetica, sans-serif">Emiss&atilde;o</font></strong> </div></td>'
_cBody += '      <td width="79" bgcolor="#FF9933" align="left" valign="baseline"><div align="center"><b><font size="2" face="Arial, Helvetica, sans-serif">Cota&ccedil;&atilde;o</font></b></div></td>'
_cBody += '      <td width="104" bgcolor="#FF9933" align="left" valign="baseline"><div align="center"><b><font size="2" face="Arial, Helvetica, sans-serif">Pedido</font></b></div></td>'
_cBody += '      <td width="125" bgcolor="#FF9933" align="left" valign="baseline"><b><font size="2" face="Arial, Helvetica, sans-serif">Quant. Solic. </font></b></td>'
_cBody += '      <td width="130" bgcolor="#FF9933" align="left" valign="baseline"><b><font size="2" face="Arial, Helvetica, sans-serif">Quant. Entregue </font></b></td>' 
_cBody += '	     <td width="400" bgcolor="#FF9933" align="left" valign="baseline"><b><font size="2" face="Arial, Helvetica, sans-serif">Aplica็ao </font></b></td>'
_cBody += '  	 <td width="400" bgcolor="#FF9933" align="left" valign="baseline"><b><font size="2" face="Arial, Helvetica, sans-serif">Observa็ใo </font></b></td>'
_cBody += '    </tr>'
    
    While TRB->(!EOF())  
    
    If TRB->C1_UNIDREQ == "MANUT" .OR. TRB->B1_GRUPO $ "0611*0612" //incluido itens que sao criticos, mas solicitados pelo Almoxarifado
	
	cCrtl := 1     
	
		_nY++
		
		If _nY%2 == 0
			_cCor := "#FFFFFF"
		Else
			_cCor := "#D8E6F5"
		EndIf
		
_cBody += '   <tr>'
_cBody += '      <td width="114" align="left" valign="baseline" bgcolor="' + _cCor + '"><div align="center"><strong><font face="Arial, Helvetica, sans-serif"><font size="2" color="#666666">'+TRB->SC+ '</font> </font></strong></div></td>'
_cBody += '      <td width="105" bgcolor="' + _cCor + '" align="left" valign="baseline"><div align="center"><strong><font color="#666666" size="2" face="Arial, Helvetica, sans-serif">'+TRB->ITEMSC+ '</font> </strong></div></td>'
_cBody += '      <td width="140" bgcolor="' + _cCor + '" align="left" valign="baseline"><strong><font color="#666666" size="2" face="Arial, Helvetica, sans-serif">'+TRB->PRODUTO+ '</font></strong></td>'
_cBody += '      <td width="268" bgcolor="' + _cCor + '" align="left" valign="baseline"><strong><font color="#666666" size="2" face="Arial, Helvetica, sans-serif">'+TRB->DESCPROD+ '</font></strong></td>'
_cBody += '      <td width="130" bgcolor="' + _cCor + '" align="left" valign="baseline"><div align="center"><strong><font face="Arial, Helvetica, sans-serif"><font size="2" color="#666666">'+TRB->PREVENT+ '</font></font></strong></div></td>'
_cBody += '      <td width="105" bgcolor="' + _cCor + '" align="left" valign="baseline"><div align="center"><strong><font color="#666666" size="2" face="Arial, Helvetica, sans-serif">'+TRB->EMISSC+ '</font></strong></div></td>'
_cBody += '      <td width="79" bgcolor="'  + _cCor + '" align="left" valign="baseline"><div align="center"><font color="#666666" size="2" face="Arial, Helvetica, sans-serif"><strong>'+TRB->COTACAO+ '</strong></font></div></td>'
_cBody += '      <td width="104" bgcolor="' + _cCor + '" align="left" valign="baseline"><div align="center"><strong><font color="#666666" size="2" face="Arial, Helvetica, sans-serif">'+TRB->PEDIDO+ '</font></strong></div></td>'
_cBody += '      <td width="125" bgcolor="' + _cCor + '" align="left" valign="baseline"><div align="left"><strong><font color="#666666" size="2" face="Arial, Helvetica, sans-serif">' + ALLTRIM(TRANSFORM(TRB->QTDSOLIC,"@E 99999999.99"))	+   '</font></strong></div></td>'
_cBody += '      <td width="130" bgcolor="' + _cCor + '" align="left" valign="baseline"><div align="left"><strong><font color="#666666" size="2" face="Arial, Helvetica, sans-serif">' + ALLTRIM(TRANSFORM(TRB->QTDATEND,"@E 99999999.99"))	+   '</font></strong></div></td>'
_cBody += ' 	 <td width="400" bgcolor="' + _cCor + '" align="left" valign="baseline"><div align="left"><strong><font color="#666666" size="2" face="Arial, Helvetica, sans-serif">'+TRB->APLIC+ '</font></strong></div></td>'
_cBody += ' 	 <td width="400" bgcolor="' + _cCor + '" align="left" valign="baseline"><div align="left"><strong><font color="#666666" size="2" face="Arial, Helvetica, sans-serif">'+TRB->OBS+ '</font></strong></div></td>'
    
    EndIf
    
 	TRB->(dbSkip())
EndDo
TRB->(dbCloseArea())
  
  _cBody += ' </table>'
  _cBody += ' </center></body></html> ' 

If cCrtl == 1
	u_GeraMail(,,,,_cEmail,"*** Notifica็ใo de SC Pendentes Manutencao ***",_cBody,,.T.)
EndIf

Return()
