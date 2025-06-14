<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Layout.aspx.cs" Inherits="Vistas.Layout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
  <form id="form1" runat="server">
    <!-- Encabezado con tabla -->
    <table style="width:100%; padding: 20px; background-color: #00ffff;">
        <tr>
            <!-- Menú a la izquierda -->
            <td style="text-align:left;">
                <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Berlin Sans FB" NavigateUrl="~/link1.aspx">link1</asp:HyperLink>
                &nbsp;&nbsp;&nbsp;
                <asp:HyperLink ID="HyperLink2" runat="server" Font-Names="Berlin Sans FB" NavigateUrl="~/link2.aspx">link2</asp:HyperLink>
                &nbsp;&nbsp;&nbsp;
                <asp:HyperLink ID="HyperLink3" runat="server" Font-Names="Berlin Sans FB" NavigateUrl="~/link3.aspx">link3</asp:HyperLink>
            </td>

            <!-- Usuario a la derecha -->
            <td style="text-align:right;">
                <asp:Label ID="Label1" runat="server" Font-Names="Berlin Sans FB" Text="USUARIO"></asp:Label>
            </td>
        </tr>
    </table>

    <!-- Contenido centrado -->
    <div style="text-align: center; margin-top: 40px;">
        <asp:Label ID="Label2" runat="server" Font-Names="Berlin Sans FB" Text="CONTENIDO"></asp:Label>
    </div>
</form>




</body>
</html>
