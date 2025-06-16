<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LayoutMedico.aspx.cs" Inherits="Vistas.LayoutMedico" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
      <form id="form1" runat="server">
    <table style="width:100%; padding: 20px; background-color: #00ffff;">
        <tr>
            <td style="text-align:left; margin-left: 40px;">
                <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Berlin Sans FB" NavigateUrl="~/Inicio.aspx">Inicio</asp:HyperLink>
                &nbsp;&nbsp;&nbsp;
                <asp:HyperLink ID="HyperLink2" runat="server" Font-Names="Berlin Sans FB" NavigateUrl="~/Asistencias.aspx">Registrar asistencias</asp:HyperLink>
                &nbsp;&nbsp;&nbsp;
              
            
            </td>

            <td style="text-align:right;">
                <asp:Label ID="Label1" runat="server" Font-Names="Berlin Sans FB" Text="USUARIO"></asp:Label>
                 &nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" Height="24px" Text="Cerrar sesion" Font-Names="Berlin Sans FB" ForeColor="Blue" />
            </td>
        </tr>
    </table>

    <div style="text-align: center; margin-top: 40px;">
        <asp:Label ID="Label2" runat="server" Font-Names="Berlin Sans FB" Text="CONTENIDO"></asp:Label>
    </div>
</form>
</body>
</html>
