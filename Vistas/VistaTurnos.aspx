<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VistaTurnos.aspx.cs" Inherits="Vistas.VistaTurnos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            margin-left: 40px;
        }

        .auto-style3 {
            width: 186px;
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
            width: 186px;
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

        .auto-style17 {
            width: 236px;
            margin-left: 40px;
            height: 10px;
        }

        .auto-style18 {
            width: 245px;
            height: 10px;
        }

        .auto-style19 {
            width: 116px;
            height: 10px;
        }

        .auto-style20 {
            width: 79px;
            height: 10px;
        }

        .auto-style21 {
            width: 186px;
            height: 10px;
        }

        .auto-style22 {
            height: 10px;
        }

        .auto-style23 {
            width: 236px;
            margin-left: 40px;
            height: 28px;
        }

        .auto-style24 {
            width: 245px;
            height: 28px;
        }

        .auto-style25 {
            width: 116px;
            height: 28px;
        }

        .auto-style26 {
            width: 79px;
            height: 28px;
        }

        .auto-style27 {
            width: 186px;
            height: 28px;
        }

        .auto-style28 {
            height: 28px;
        }

        .auto-style29 {
            width: 112px;
            margin-left: 40px;
        }

        .auto-style31 {
            width: 112px;
            margin-left: 40px;
            height: 28px;
        }

        .auto-style32 {
            width: 112px;
            margin-left: 40px;
            height: 10px;
        }

        .auto-style33 {
            width: 112px;
            height: 26px;
        }

        .auto-style34 {
            margin-left: 40px;
            height: 26px;
        }

        .auto-style35 {
            width: 112px;
            margin-left: 40px;
            height: 26px;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <table style="width: 100%; padding: 20px; background-color: #00ffff;">
            <tr>
                <td style="text-align: left; margin-left: 40px;">
                    <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Berlin Sans FB"
                        NavigateUrl="~/LogIn.aspx">Inicio</asp:HyperLink>
                    &nbsp;&nbsp;&nbsp;
                        <asp:HyperLink ID="HyperLink2" runat="server" Font-Names="Berlin Sans FB"
                            NavigateUrl="~/VistaTurnos.aspx">Ver Turnos</asp:HyperLink>
                    &nbsp;&nbsp;&nbsp;
                </td>
                <td style="text-align: right;">
                    <asp:Label ID="lblUsuario" runat="server" Font-Names="Berlin Sans FB" Text="USUARIO">
                    </asp:Label>
                    &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnCerrarSesion" runat="server" Height="24px" Text="Cerrar sesion"
                            Font-Names="Berlin Sans FB" ForeColor="Blue" OnClick="btnCerrarSesion_Click"
                            CausesValidation="False" />
                </td>
            </tr>
        </table>
        <div style="text-align: center; margin-top: 40px;">
            <div>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style14">&nbsp;</td>
                        <td class="auto-style2">
                            <asp:Label ID="lbl_Vista_Turnos" runat="server" Font-Bold="True" Font-Size="16pt"
                                Text="Vista de turnos"></asp:Label>
                        </td>
                        <td class="auto-style29">&nbsp;</td>
                        <td class="auto-style7">&nbsp;</td>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style3">&nbsp;</td>
                        <td class="auto-style4">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style15"></td>
                        <td class="auto-style11"></td>
                        <td class="auto-style33">&nbsp;</td>
                        <td class="auto-style10"></td>
                        <td class="auto-style11"></td>
                        <td class="auto-style12"></td>
                        <td class="auto-style13"></td>
                        <td class="auto-style8"></td>
                    </tr>
                    <tr>
                        <td class="auto-style14" rowspan="5">
                            <asp:Label ID="lblError" runat="server"></asp:Label>
                        </td>
                        <td class="auto-style2" colspan="3" rowspan="5">
                            <asp:GridView ID="gvTurnos" runat="server" DataKeyNames="DNI, Fecha, Hora, Paciente" AutoGenerateEditButton="True" OnRowCancelingEdit="gvTurnos_RowCancelingEdit" OnRowEditing="gvTurnos_RowEditing" OnRowUpdating="gvTurnos_RowUpdating" AllowPaging="True" OnPageIndexChanging="gvTurnos_PageIndexChanging"
                                OnRowCreated="gvTurnos_RowCreated" OnSelectedIndexChanging="gvTurnos_SelectedIndexChanging"
                                OnRowDataBound="gvTurnos_RowDataBound">
                                <Columns>
                                    <asp:TemplateField HeaderText="Asistencia">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAsistencia" runat="server" Text='<%# Eval("Asistencia") %>' />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlAsistencia" runat="server">
                                                <asp:ListItem Text="Presente" Value="Presente" />
                                                <asp:ListItem Text="Ausente" Value="Ausente" />
                                                <asp:ListItem Text="Pendiente" Value="Pendiente" />
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </td>
                        <td class="auto-style4" rowspan="5">&nbsp;</td>
                        <td class="auto-style3">Filtros por Asistencia</td>
                        <td class="auto-style4" rowspan="5">&nbsp;</td>
                        <td rowspan="5">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                            <asp:Button ID="btnPresente" runat="server" OnClick="btnPresente_Click" Text="Presente" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                            <asp:Button ID="btnAusente" runat="server" OnClick="btnAusente_Click" Text="Ausente" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                            <asp:Button ID="btnPendiente" runat="server" OnClick="btnPendiente_Click" Text="Pendiente" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                            <asp:Button ID="btnTodo" runat="server" OnClick="btnTodo_Click" Text="Ver Todo" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style24"></td>
                        <td class="auto-style23">&nbsp;</td>
                        <td class="auto-style31">&nbsp;</td>
                        <td class="auto-style25"></td>
                        <td class="auto-style26"></td>
                        <td class="auto-style27"></td>
                        <td class="auto-style26"></td>
                        <td class="auto-style28"></td>
                    </tr>
                    <tr>
                        <td class="auto-style18">Busqueda por DNI:</td>
                        <td class="auto-style17">
                            <asp:TextBox ID="txtDNI" runat="server" Width="225px"></asp:TextBox>
                        </td>
                        <td class="auto-style32">
                            <asp:RequiredFieldValidator ID="rfvBusqueda" runat="server"
                                ControlToValidate="txtDNI" ValidationGroup="1">*</asp:RequiredFieldValidator>
                        </td>
                        <td class="auto-style19">
                            <asp:Button ID="btnBuscarDNI" runat="server" Text="Buscar" OnClick="btnBuscarDNI_Click" ValidationGroup="1" />
                        </td>
                        <td class="auto-style20">&nbsp;</td>
                        <td class="auto-style21"></td>
                        <td class="auto-style20"></td>
                        <td class="auto-style22"></td>
                    </tr>
                    <tr>
                        <td class="auto-style14">Busqueda por nombre:</td>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtNombre" runat="server" Width="225px"></asp:TextBox>
                        </td>
                        <td class="auto-style29">
                            <asp:RequiredFieldValidator ID="rfvBusqueda0" runat="server"
                                ControlToValidate="txtNombre" ValidationGroup="2">*</asp:RequiredFieldValidator>
                        </td>
                        <td class="auto-style7">
                            <asp:Button ID="btnBuscarNombre" runat="server" Text="Buscar" OnClick="btnBuscarNombre_Click" ValidationGroup="2" />
                        </td>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style3">&nbsp;</td>
                        <td class="auto-style4">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style15"></td>
                        <td class="auto-style34"></td>
                        <td class="auto-style35"></td>
                        <td class="auto-style10"></td>
                        <td class="auto-style34"></td>
                        <td class="auto-style12"></td>
                        <td class="auto-style13"></td>
                        <td class="auto-style8"></td>
                    </tr>
                    <tr>
                        <td class="auto-style14">&nbsp;</td>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style29">&nbsp;</td>
                        <td class="auto-style7">&nbsp;</td>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style3">&nbsp;</td>
                        <td class="auto-style4">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
    <p>
        &nbsp;&nbsp;&nbsp;
    </p>
</body>

</html>
