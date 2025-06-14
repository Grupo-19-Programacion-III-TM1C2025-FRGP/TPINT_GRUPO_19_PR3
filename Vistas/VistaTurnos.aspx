<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VistaTurnos.aspx.cs" Inherits="Vistas.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 236px;
            margin-left: 40px;
        }
        .auto-style3 {
            width: 97px;
        }
        .auto-style4 {
            width: 79px;
        }
        .auto-style7 {
            width: 116px;
        }
        .auto-style8 {
            height: 26px;
        }
        .auto-style10 {
            width: 116px;
            height: 26px;
        }
        .auto-style11 {
            width: 236px;
            height: 26px;
        }
        .auto-style12 {
            width: 97px;
            height: 26px;
        }
        .auto-style13 {
            width: 79px;
            height: 26px;
        }
        .auto-style14 {
            width: 245px;
        }
        .auto-style15 {
            width: 245px;
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style14">&nbsp;</td>
                    <td class="auto-style2">
                        <asp:Label ID="lbl_Vista_Turnos" runat="server" Font-Bold="True" Font-Size="16pt" Text="Vista de turnos"></asp:Label>
                    </td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style15"></td>
                    <td class="auto-style11"></td>
                    <td class="auto-style10"></td>
                    <td class="auto-style11"></td>
                    <td class="auto-style12"></td>
                    <td class="auto-style13"></td>
                    <td class="auto-style8"></td>
                </tr>
                <tr>
                    <td class="auto-style14">&nbsp;</td>
                    <td class="auto-style2">
                        <asp:GridView ID="gvPacientes" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" AutoGenerateSelectButton="True" Height="66px" OnSelectedIndexChanged="gvPacientes_SelectedIndexChanged" Width="696px">
                            <Columns>
                                <asp:TemplateField HeaderText="Dni">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_Dni" runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_Dni" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nombre">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_Nombre" runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_Nombre" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Apellido">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_Apellido" runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_Apellido" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Sexo">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_Sexo" runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_Sexo" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Fecha">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_Fecha" runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_Fecha" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Medico">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_Medico" runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_Medico" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Especialidad">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_Especialidad" runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_Especialidad" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Presente / Ausente"></asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style14">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style14">Busqueda de turno:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtPacientes" runat="server" Width="225px"></asp:TextBox>
                    </td>
                    <td class="auto-style7">
                        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" />
                    </td>
                    <td class="auto-style4">
                        <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" />
                    </td>
                    <td class="auto-style3">
                        &nbsp;</td>
                    <td class="auto-style4">
                        &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style14">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style14">Observaciones de la consulta:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtObservación" runat="server" Width="225px"></asp:TextBox>
                    </td>
                    <td class="auto-style7">
                        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" Width="86px" />
                    </td>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
    <p>
&nbsp;&nbsp;&nbsp;
    </p>
</body>
</html>
