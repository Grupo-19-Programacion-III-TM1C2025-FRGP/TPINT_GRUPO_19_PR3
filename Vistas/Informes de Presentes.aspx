<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Informes de Presentes.aspx.cs" Inherits="Vistas.Informes_de_Ausentes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            width: 193px;
        }
        .auto-style5 {
            width: 220px;
        }
        .auto-style4 {
            width: 99px;
        }
        .auto-style6 {
            width: 145px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style5">
                        <asp:Label ID="lbl_Informe_Presentes" runat="server" Font-Bold="True" Font-Size="16pt" Text="Informe presentes"></asp:Label>
                    </td>
                    <td class="auto-style5">
                        &nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">Fecha de inicio:</td>
                    <td class="auto-style5">
                        <asp:DropDownList ID="ddFechaInicialP" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style5">
                        <asp:RequiredFieldValidator ID="rfvInicioP" runat="server" ControlToValidate="ddFechaInicialP" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style4">Fecha final:</td>
                    <td class="auto-style6">
                        <asp:DropDownList ID="ddFechaFinalp" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style6">
                        <asp:RequiredFieldValidator ID="rfvFinal" runat="server" ControlToValidate="ddFechaFinalp" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:Button ID="btnCalcularP" runat="server" Text="Calcular" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">Porcentaje de presentes:</td>
                    <td class="auto-style5">
                        <asp:Label ID="lblPresentes" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style5">
                        &nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style5">
                        <asp:GridView ID="gvPresentes" runat="server">
                        </asp:GridView>
                    </td>
                    <td class="auto-style5">
                        &nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
