<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="Vistas.LogIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center; margin-top: 50px;">
            <asp:Label ID="lblTitulo" runat="server" Text="INGRESO AL SISTEMA" Font-Size="XX-Large" Font-Bold="True"></asp:Label>
        </div>

        <br />

        <table align="center" style="margin-top: 20px;">
            <tr>
                <td>
                    <asp:Label ID="lblUsuario" runat="server" Text="Usuario:" Font-Bold="True"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtUsuario" runat="server" Width="200px"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPassword" runat="server" Text="Contraseña:" Font-Bold="True"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" Width="200px" TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center; padding-top: 10px;">
                    <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" OnClick="btnIngresar_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblMensaje" runat="server" Width="200px"></asp:Label>
                </td>
            </tr>
        </table>

    </form>
</body>
</html>
