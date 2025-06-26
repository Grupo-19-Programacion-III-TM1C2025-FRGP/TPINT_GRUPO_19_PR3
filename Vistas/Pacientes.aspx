<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pacientes.aspx.cs" Inherits="Vistas.Pacientes" %>

    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Gestión de pacientes</title>
        <style type="text/css">
            .auto-style1 {
                width: 216px;
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
                <div class="container">
                    <h2>Gestión de Pacientes</h2>

                    <table class="form-table">
                        <tr>
                            <td colspan="2">
                                <h3>Formulario para agregar un Paciente</h3>
                            </td>
                        </tr>
                        <tr>
                            <td>DNI:</td>
                            <td class="auto-style1">
                                <asp:TextBox ID="txtDNI" runat="server" Width="200px" TextMode="Number"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvDNI" runat="server" ControlToValidate="txtDNI"
                                    ErrorMessage="El DNI es obligatorio" ForeColor="Red" ValidationGroup="1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Nombre:</td>
                            <td class="auto-style1">
                                <asp:TextBox ID="txtNombre" runat="server" Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre"
                                    ErrorMessage="El nombre es obligatorio" ForeColor="Red" ValidationGroup="1">*
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Apellido:</td>
                            <td class="auto-style1">
                                <asp:TextBox ID="txtApellido" runat="server" Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvApellido" runat="server"
                                    ControlToValidate="txtApellido" ErrorMessage="El apellido es obligatorio"
                                    ForeColor="Red" ValidationGroup="1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                       <tr>
                        <td>Sexo:</td>
                        <td class="auto-style1">
                                <asp:DropDownList ID="ddlSexo" runat="server" Width="202px">
                                    <asp:ListItem Value="M">Masculino</asp:ListItem>
                                    <asp:ListItem Value="F">Femenino</asp:ListItem>
                                </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvSexo" runat="server"
                                ControlToValidate="ddlSexo" ErrorMessage="El sexo es obligatorio"
                                ForeColor="Red" ValidationGroup="1">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Nacionalidad:</td>
                        <td class="auto-style1">
                            <asp:TextBox ID="txtNacionalidad" runat="server" Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvNacionalidad" runat="server"
                                ControlToValidate="txtNacionalidad" ErrorMessage="El apellido es obligatorio"
                                ForeColor="Red" ValidationGroup="1">*</asp:RequiredFieldValidator>
                        </td>
</tr>
                        <tr>
                            <td>Fecha de Nacimiento:</td>
                            <td class="auto-style1">
                                <asp:TextBox ID="txtFechaNacimiento" runat="server" TextMode="Date" Width="189px">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvFechaNacimiento" runat="server"
                                    ControlToValidate="txtFechaNacimiento"
                                    ErrorMessage="La fecha de nacimiento es obligatoria" ForeColor="Red" ValidationGroup="1">*
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Dirección:</td>
                            <td class="auto-style1">
                                <asp:TextBox ID="txtDireccion" runat="server" Width="189px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvDireccion" runat="server"
                                    ControlToValidate="txtDireccion" ErrorMessage="La dirección es obligatoria"
                                    ForeColor="Red" ValidationGroup="1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                           <tr>
                            <td>Provincia:</td>
                            <td class="auto-style1">
                                <asp:DropDownList ID="ddlProvincia" runat="server" Width="200px" AutoPostBack="true" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvProvincia" runat="server"
                                    ControlToValidate="ddlProvincia" ErrorMessage="Los horarios son obligatorios"
                                    ForeColor="Red" ValidationGroup="1">*
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Localidad:</td>
                            <td class="auto-style1">
                                <asp:DropDownList ID="ddlLocalidad" runat="server" Width="200px">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ControlToValidate="ddlLocalidad" ErrorMessage="Los horarios son obligatorios"
                                    ForeColor="Red" ValidationGroup="1">*
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                       
                        <tr>
                            <td>Email:</td>
                            <td class="auto-style1">
                                <asp:TextBox ID="txtEmail" runat="server" Width="200px" TextMode="Email"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvMail" runat="server" ControlToValidate="txtEmail"
                                    ErrorMessage="La Email es obligatorio" ForeColor="Red" ValidationGroup="1">*
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Teléfono:</td>
                            <td class="auto-style1">
                                <asp:TextBox ID="txtTelefono" runat="server" Width="200px" TextMode="Number">
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="btnAgregar" runat="server" Text="Agregar Paciente" OnClick="btnAgregar_Click" />

                                <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar Formulario" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="1" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="lblMensaje" runat="server" ForeColor="Green" CssClass="success-message">
                                </asp:Label>
                            </td>
                        </tr>
                    </table>

                    <br />
                    <h3>Listado de Pacientes</h3>
                    <p>
                        <asp:GridView ID="gvPacientes" runat="server" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" DataKeyNames="DNI" OnRowCancelingEdit="gvPacientes_RowCancelingEdit" OnRowDeleting="gvPacientes_RowDeleting" OnRowEditing="gvPacientes_RowEditing" OnRowUpdating="gvPacientes_RowUpdating">
                        </asp:GridView>
                    </p>

                </div>

            </div>   
          
        </form>
    </body>

    </html>