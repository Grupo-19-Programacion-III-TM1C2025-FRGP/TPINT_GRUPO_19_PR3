<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AltaPaciente.aspx.cs" Inherits="Vistas.AltaPaciente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style4 {
            width: 180px;
        }
        .auto-style8 {
            width: 316px;
        }
        .auto-style9 {
            width: 192px;
        }
        .auto-style10 {
            width: 525px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="18pt" Text="Alta de Paciente"></asp:Label>
                    </td>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style4">DNI</td>
                    <td class="auto-style10">
                        <asp:TextBox ID="TextBox1" runat="server" Width="308px"></asp:TextBox>
                    </td>
                    <td class="auto-style9">Dirección</td>
                    <td class="auto-style8">
                        <asp:TextBox ID="TextBox17" runat="server" Width="308px"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style4">Nombre/s</td>
                    <td class="auto-style10">
                        <asp:TextBox ID="TextBox12" runat="server" Width="308px"></asp:TextBox>
                    </td>
                    <td class="auto-style9">Localidad</td>
                    <td class="auto-style8">
                        <asp:TextBox ID="TextBox18" runat="server" Width="308px"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style4">Apellido/s</td>
                    <td class="auto-style10">
                        <asp:TextBox ID="TextBox13" runat="server" Width="308px"></asp:TextBox>
                    </td>
                    <td class="auto-style9">Provincia</td>
                    <td class="auto-style8">
                        <asp:TextBox ID="TextBox19" runat="server" Width="308px"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style4">Sexo</td>
                    <td class="auto-style10">
                        <asp:TextBox ID="TextBox14" runat="server" Width="308px"></asp:TextBox>
                    </td>
                    <td class="auto-style9">Correo electrónico</td>
                    <td class="auto-style8">
                        <asp:TextBox ID="TextBox20" runat="server" Width="308px"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style4">Nacionalidad</td>
                    <td class="auto-style10">
                        <asp:TextBox ID="TextBox15" runat="server" Width="308px"></asp:TextBox>
                    </td>
                    <td class="auto-style9">Teléfono</td>
                    <td class="auto-style8">
                        <asp:TextBox ID="TextBox21" runat="server" Width="308px"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style4">Fecha de nacimiento</td>
                    <td class="auto-style10">
                        <asp:TextBox ID="TextBox16" runat="server" Width="308px"></asp:TextBox>
                    </td>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                    <td>
                        <asp:Button ID="btnAltaPaciente" runat="server" Text="Aceptar" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
