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

            .auto-style14 {
                width: 7%;
            }
            .auto-style15 {
                width: 56%;
            }
            .auto-style16 {
                width: 5%;
            }
            .auto-style17 {
                width: 14%;
            }
            .auto-style20 {
                width: 7%;
                height: 23px;
            }
            .auto-style21 {
                height: 23px;
                width: 56%;
            }
            .auto-style22 {
                width: 5%;
                height: 23px;
            }
            .auto-style23 {
                height: 23px;
                width: 14%;
            }
            .auto-style26 {
                width: 10px;
            }
            .auto-style27 {
                height: 23px;
                width: 10px;
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
                            <td class="auto-style14">&nbsp;</td>
                            <td class="auto-style15">&nbsp;</td>
                            <td class="auto-style16">&nbsp;</td>
                            <td class="auto-style17">&nbsp;</td>
                            <td class="auto-style26">&nbsp;</td>
                            <td class="auto-style17">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style14">&nbsp;</td>
                            <td class="auto-style15">&nbsp;</td>
                            <td class="auto-style16">&nbsp;</td>
                            <td class="auto-style17">&nbsp;</td>
                            <td class="auto-style26">&nbsp;</td>
                            <td class="auto-style17">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style14">&nbsp;</td>
                            <td class="auto-style15">&nbsp;</td>
                            <td class="auto-style16">&nbsp;</td>
                            <td class="auto-style17">&nbsp;</td>
                            <td class="auto-style26">&nbsp;</td>
                            <td class="auto-style17">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style2" colspan="5">
                                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="18pt"
                                    Text="Asignación de Turno"></asp:Label>
                            </td>
                            <td class="auto-style17">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style14">&nbsp;</td>
                            <td class="auto-style15">&nbsp;</td>
                            <td class="auto-style16">&nbsp;</td>
                            <td class="auto-style17">&nbsp;</td>
                            <td class="auto-style26">&nbsp;</td>
                            <td class="auto-style17">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style14">
                                <asp:Label ID="Label2" runat="server" Text="Especialidad:"></asp:Label>
                            </td>
                            <td class="auto-style15">
                                <asp:DropDownList ID="ddlEspecialidad" runat="server" Height="19px" Width="190px" AutoPostBack="True" OnSelectedIndexChanged="ddlEspecialidad_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvEspecialidad" runat="server"
                                    ControlToValidate="ddlEspecialidad" ErrorMessage="Se debe elegir una especialidad" ForeColor="Red" InitialValue="0" ValidationGroup="1">*</asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style16">
                                <asp:Label ID="Label5" runat="server" Text="Horario:"></asp:Label>
                            </td>
                            <td class="auto-style17">
                                <asp:DropDownList ID="ddlHorario" runat="server" Height="19px" Width="190px">
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style26">
                                <asp:RequiredFieldValidator ID="rfvHorario" runat="server"
                                    ControlToValidate="ddlHorario" ErrorMessage="Se debe seleccionar un horario" ForeColor="Red" InitialValue="0" ValidationGroup="1">*</asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style17">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style14">&nbsp;</td>
                            <td class="auto-style15">&nbsp;</td>
                            <td class="auto-style16">&nbsp;</td>
                            <td class="auto-style17">&nbsp;</td>
                            <td class="auto-style26">&nbsp;</td>
                            <td class="auto-style17">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style20">
                                <asp:Label ID="Label3" runat="server" Text="Médico:"></asp:Label>
                            </td>
                            <td class="auto-style21">
                                <asp:DropDownList ID="ddlMedico" runat="server" Height="19px" Width="190px">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvMedico" runat="server" ControlToValidate="ddlMedico"
                                    ErrorMessage="Se debe elegir un médico" ForeColor="Red" InitialValue="0" ValidationGroup="1">*</asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style22">
                                <asp:Label ID="Label6" runat="server" Text="DNI Paciente:"></asp:Label>
                            </td>
                            <td class="auto-style23">
                                <asp:TextBox ID="txtDNIPaciente" runat="server" TextMode="Number" Width="175px"></asp:TextBox>
                            </td>
                            <td class="auto-style27">
                                <asp:RequiredFieldValidator ID="rfvPaciente" runat="server"
                                    ControlToValidate="txtDNIPaciente" ErrorMessage="Se debe seleccionar un paciente" ForeColor="Red" ValidationGroup="1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revTxtDNIPaciente" runat="server" ControlToValidate="txtDNIPaciente" ErrorMessage="Ingrese un DNI válido" ForeColor="Red" ValidationExpression="^\d{8}" ValidationGroup="1">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="auto-style23">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style14">&nbsp;</td>
                            <td class="auto-style15">&nbsp;</td>
                            <td class="auto-style16">&nbsp;</td>
                            <td class="auto-style17">&nbsp;</td>
                            <td class="auto-style26">&nbsp;</td>
                            <td class="auto-style17">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style14">
                                <asp:Label ID="Label4" runat="server" Text="Fecha:"></asp:Label>
                            </td>
                            <td class="auto-style15">
                                <asp:TextBox ID="txtFecha" runat="server" TextMode="Date" Width="179px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvFecha" runat="server" ControlToValidate="txtFecha"
                                    ErrorMessage="Se debe seleccionar una fecha" ForeColor="Red" ValidationGroup="1">*</asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style16">&nbsp;</td>
                            <td class="auto-style17">
                                <asp:Button ID="btnGuardar" runat="server" Text="Guardar Turno" OnClick="btnGuardar_Click" ValidationGroup="1" />
                            </td>
                            <td class="auto-style26">&nbsp;</td>
                            <td class="auto-style17">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style14"></td>
                            <td class="auto-style15">&nbsp;</td>
                            <td class="auto-style16"></td>
                            <td class="auto-style17">
                                <asp:Button ID="txtLimpiar" runat="server" OnClick="txtLimpiar_Click" Text="Limpiar formulario" Width="162px" />
                            </td>
                            <td class="auto-style26"></td>
                            <td class="auto-style17"></td>
                        </tr>
                        <tr>
                            <td class="auto-style20"></td>
                            <td class="auto-style21">
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="1" />
                            </td>
                            <td class="auto-style22"></td>
                            <td class="auto-style23">
                                <asp:Label ID="lblMensaje" runat="server" ForeColor="#00CC00"></asp:Label>
                            </td>
                            <td class="auto-style27"></td>
                            <td class="auto-style23"></td>
                        </tr>
                    </table>
                </div>
            </div>
        </form>
    </body>

    </html>