<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AsignacionTurno.aspx.cs" Inherits="Vistas.AsignacionTurno" %>

    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <style type="text/css">
            .auto-style1 {
                width: 100%;
            }

            .auto-style2 {}

            .auto-style3 {
                width: 96px;
            }

            .auto-style5 {
                width: 96px;
                height: 23px;
            }

            .auto-style6 {
                height: 23px;
            }

            .auto-style8 {
                width: 189px;
            }

            .auto-style9 {
                height: 23px;
                width: 189px;
            }

            .auto-style10 {
                width: 156px;
            }

            .auto-style11 {
                height: 23px;
                width: 156px;
            }

            .auto-style12 {
                width: 76px;
            }

            .auto-style13 {
                width: 76px;
                height: 23px;
            }
        </style>
    </head>

    <body>
        <form id="form1" runat="server">
            <table style="width:100%; padding: 20px; background-color: #4cff00;">
                <tr>
                    <td style="text-align:left; margin-left: 40px;">
                        <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Berlin Sans FB"
                            NavigateUrl="~/LogIn.aspx">Inicio</asp:HyperLink>
                        &nbsp;&nbsp;&nbsp;
                        <asp:HyperLink ID="HyperLink2" runat="server" Font-Names="Berlin Sans FB"
                            NavigateUrl="~/Pacientes.aspx">Pacientes</asp:HyperLink>
                        &nbsp;&nbsp;&nbsp;
                        <asp:HyperLink ID="HyperLink3" runat="server" Font-Names="Berlin Sans FB"
                            NavigateUrl="~/Medicos.aspx">Medicos</asp:HyperLink>
                        &nbsp;&nbsp;
                        <asp:HyperLink ID="HyperLink5" runat="server" Font-Names="Berlin Sans FB"
                            NavigateUrl="~/AsignacionTurno.aspx">Asignar turnos</asp:HyperLink>
                        &nbsp;&nbsp;&nbsp;
                        <asp:HyperLink ID="HyperLink4" runat="server" Font-Names="Berlin Sans FB"
                            NavigateUrl="~/Informes de Presentes.aspx">Reportes</asp:HyperLink>
                        &nbsp;&nbsp;&nbsp;
                    </td>
                    <td style="text-align:right;">
                        <asp:Label ID="lblUsuario" runat="server" Font-Names="Berlin Sans FB" Text="USUARIO">
                        </asp:Label>
                        &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnCerrarSesion" runat="server" Height="24px" Text="Cerrar sesion"
                            Font-Names="Berlin Sans FB" ForeColor="#009933" OnClick="btnCerrarSesion_Click"
                            CausesValidation="False" />
                        &nbsp;&nbsp;&nbsp;
                    </td>
                </tr>
            </table>
            <div style="text-align: center; margin-top: 40px;">
                <div>
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td class="auto-style12">&nbsp;</td>
                            <td class="auto-style8">&nbsp;</td>
                            <td class="auto-style10">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td class="auto-style12">&nbsp;</td>
                            <td class="auto-style8">&nbsp;</td>
                            <td class="auto-style10">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td class="auto-style12">&nbsp;</td>
                            <td class="auto-style8">&nbsp;</td>
                            <td class="auto-style10">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style2" colspan="5">
                                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="18pt"
                                    Text="Asignación de Turno"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td class="auto-style12">&nbsp;</td>
                            <td class="auto-style8">&nbsp;</td>
                            <td class="auto-style10">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <asp:Label ID="Label2" runat="server" Text="Especialidad:"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlEspecialidad" runat="server" Height="19px" Width="190px">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvEspecialidad" runat="server"
                                    ControlToValidate="ddlEspecialidad" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style12">
                                <asp:Label ID="Label5" runat="server" Text="Horario:"></asp:Label>
                            </td>
                            <td class="auto-style8">
                                <asp:DropDownList ID="ddlHorario" runat="server" Height="19px" Width="190px">
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style10">
                                <asp:RequiredFieldValidator ID="rfvHorario" runat="server"
                                    ControlToValidate="ddlHorario" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td class="auto-style12">&nbsp;</td>
                            <td class="auto-style8">&nbsp;</td>
                            <td class="auto-style10">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">
                                <asp:Label ID="Label3" runat="server" Text="Médico:"></asp:Label>
                            </td>
                            <td class="auto-style6">
                                <asp:DropDownList ID="ddlMedico" runat="server" Height="19px" Width="190px">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvMedico" runat="server" ControlToValidate="ddlMedico"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style13">
                                <asp:Label ID="Label6" runat="server" Text="Paciente:"></asp:Label>
                            </td>
                            <td class="auto-style9">
                                <asp:DropDownList ID="ddlPaciente" runat="server" Height="19px" Width="190px">
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style11">
                                <asp:RequiredFieldValidator ID="rfvPaciente" runat="server"
                                    ControlToValidate="ddlPaciente" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style6"></td>
                        </tr>
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td class="auto-style12">&nbsp;</td>
                            <td class="auto-style8">&nbsp;</td>
                            <td class="auto-style10">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <asp:Label ID="Label4" runat="server" Text="Fecha:"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlFecha" runat="server" Height="19px" Width="190px">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvFecha" runat="server" ControlToValidate="ddlFecha"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style12">&nbsp;</td>
                            <td class="auto-style8">
                                <asp:Button ID="btnGuardar" runat="server" Text="Guardar Turno" />
                            </td>
                            <td class="auto-style10">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3"></td>
                            <td>&nbsp;</td>
                            <td class="auto-style12"></td>
                            <td class="auto-style8"></td>
                            <td class="auto-style10"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="auto-style5"></td>
                            <td class="auto-style6"></td>
                            <td class="auto-style13"></td>
                            <td class="auto-style9"></td>
                            <td class="auto-style11"></td>
                            <td class="auto-style6"></td>
                        </tr>
                    </table>
                </div>
            </div>
        </form>
    </body>

    </html>