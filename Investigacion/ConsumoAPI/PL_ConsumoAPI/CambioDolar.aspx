<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CambioDolar.aspx.cs" Inherits="PL_ConsumoAPI.CambioDolar" Async="true" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/Estilos.css" rel="stylesheet" />
    <title>Tipo de Cambio</title>
</head>
<body style="margin: 0; background-image: url('img/Fondo2.png'); background-size: cover; background-repeat: no-repeat;background-attachment: fixed;">
    <form id="form1" runat="server">
   <div style="display:flex; 
            justify-content:center; 
            align-items:center; 
            gap:20px; 
            margin-top:40px;">
    
    <asp:Button ID="btnConsultar" runat="server"
        Text="Consultar tipo de cambio actual"
        OnClick="btnConsultar_Click" 
        CssClass="button" />

    <asp:Button ID="btnHistorico" runat="server"
        Text="Tipo de cambio ENERO 2026"
        OnClick="btnHistorico_Click" 
        CssClass="button" />

</div>
       <div style="margin-top:40px; text-align:center;">
    
    <asp:Label ID="lblResultado" runat="server"
        CssClass="lbl" Visible="false"/>

</div>
       <div class="list">
    <div id="divTablaHistorico" runat="server">
    </div>
</div>
    </form>
</body>
</html>
