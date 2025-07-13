<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Medicos.aspx.cs" Inherits="MiProyecto.Medicos" %>

    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <title>Gestion de Medicos</title>
        <style type="text/css">
            .auto-style1 {
                width: 100%;
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
                    <h2>Gestion de Medicos</h2>

                    <table class="form-table">
                        <tr>
                            <td colspan="2">
                                <h3>Formulario de Medico</h3>
                            </td>
                        </tr>
                        <tr>
                            <td>DNI:</td>
                            <td>
                                <asp:TextBox ID="txtDNI" runat="server" Width="200px" TextMode="Number"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvDNI" runat="server" ControlToValidate="txtDNI"
                                    ErrorMessage="El legajo es obligatorio" ForeColor="Red" ValidationGroup="1">*
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Nombre:</td>
                            <td>
                                <asp:TextBox ID="txtNombre" runat="server" Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre"
                                    ErrorMessage="El nombre es obligatorio" ForeColor="Red" ValidationGroup="1">*
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Apellido:</td>
                            <td>
                                <asp:TextBox ID="txtApellido" runat="server" Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvApellido" runat="server"
                                    ControlToValidate="txtApellido" ErrorMessage="El apellido es obligatorio"
                                    ForeColor="Red" ValidationGroup="1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Sexo:</td>
                            <td>
                                <asp:DropDownList ID="ddlSexo" runat="server" Width="202px">
                                    <asp:ListItem Value="M">Masculino</asp:ListItem>
                                    <asp:ListItem Value="F">Femenino</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvSexo" runat="server" ControlToValidate="ddlSexo"
                                    ErrorMessage="El sexo es obligatorio" ForeColor="Red" ValidationGroup="1">*
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Nacionalidad:</td>
                            <td>
                                <asp:TextBox ID="txtNacionalidad" runat="server" Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvNacionalidad" runat="server"
                                    ControlToValidate="txtNacionalidad" ErrorMessage="El apellido es obligatorio"
                                    ForeColor="Red" ValidationGroup="1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Provincia:</td>
                            <td>
                                <asp:DropDownList ID="ddlProvincia" runat="server" Width="200px" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvProvincia" runat="server"
                                    ControlToValidate="ddlProvincia" ErrorMessage="Los horarios son obligatorios"
                                    ForeColor="Red" ValidationGroup="1">*
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Localidad:</td>
                            <td>
                                <asp:DropDownList ID="ddlLocalidad" runat="server" Width="200px">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvLocalidad" runat="server"
                                    ControlToValidate="ddlLocalidad" ErrorMessage="Los horarios son obligatorios"
                                    ForeColor="Red" ValidationGroup="1">*
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Nacimiento:</td>
                            <td>
                                <asp:TextBox ID="txtNacimiento" runat="server" Width="200px" TextMode="Date">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvNacimiento" runat="server"
                                    ControlToValidate="txtNacimiento" ErrorMessage="El apellido es obligatorio"
                                    ForeColor="Red" ValidationGroup="1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Especialidad:</td>
                            <td>
                                <asp:DropDownList ID="ddlEspecialidad" runat="server" Width="200px">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvEspecialidad" runat="server"
                                    ControlToValidate="ddlEspecialidad" ErrorMessage="La especialidad es obligatoria"
                                    ForeColor="Red" ValidationGroup="1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Hora Entrada:</td>
                            <td>
                                <asp:DropDownList ID="ddlHoraEntrada" runat="server" Width="200px" OnSelectedIndexChanged="ddlHoraEntrada_SelectedIndexChanged" AutoPostBack="True">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvHorarios0" runat="server"
                                    ControlToValidate="ddlHoraEntrada" ErrorMessage="La hora de entrada es obligatoria"
                                    ForeColor="Red" ValidationGroup="1">*
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Hora Salida:</td>
                            <td>
                                <asp:DropDownList ID="ddlHoraSalida" runat="server" Width="200px">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvHorarios" runat="server"
                                    ControlToValidate="ddlHoraSalida" ErrorMessage="La hora de salida es obligatoria"
                                    ForeColor="Red" ValidationGroup="1">*
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Email:</td>
                            <td>
                                <asp:TextBox ID="txtEmail" runat="server" Width="200px" TextMode="Email"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="revEmail" runat="server"
                                    ControlToValidate="txtEmail" ErrorMessage="Formato de email inválido"
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"
                                    ValidationGroup="1">
                                    *
                                </asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Telefono:</td>
                            <td>
                                <asp:TextBox ID="txtTelefono" runat="server" Width="200px" TextMode="Number"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvTelefono" runat="server"
                                    ControlToValidate="txtTelefono" ErrorMessage="El teléfono es obligatorio"
                                    ForeColor="Red" ValidationGroup="1">*
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Usuario:</td>
                            <td>
                                <asp:TextBox ID="txtUsuario" runat="server" Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvUsuario" runat="server"
                                    ControlToValidate="txtUsuario" ErrorMessage="El usuario es obligatorio"
                                    ForeColor="Red" ValidationGroup="1">*
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Contrasena:</td>
                            <td>
                                <asp:TextBox ID="txtContrasenia" runat="server" Width="200px" TextMode="Password">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvContrasenia" runat="server"
                                    ControlToValidate="txtContrasenia" ErrorMessage="La contrasea es obligatoria"
                                    ForeColor="Red" ValidationGroup="1">*
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Repetir Contrasena:</td>
                            <td>
                                <asp:TextBox ID="txtRepetirContrasenia" runat="server" Width="200px"
                                    TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvRepetirContrasenia" runat="server"
                                    ControlToValidate="txtRepetirContrasenia" ErrorMessage="Debe repetir la contrasena"
                                    ForeColor="Red" ValidationGroup="1">*
                                </asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cvContrasenias" runat="server"
                                    ControlToCompare="txtContrasenia" ControlToValidate="txtRepetirContrasenia"
                                    ErrorMessage="Las contraseas no coinciden" ForeColor="Red" ValidationGroup="1">*
                                </asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="btnAgregar" runat="server" Text="Agregar Medico"
                                    OnClick="btnAgregar_Click" CssClass="btn btn-primary" ValidationGroup="1" />
                                <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar Formulario"
                                    OnClick="btnLimpiar_Click" CssClass="btn btn-secondary" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red"
                                    ValidationGroup="1" />
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
                    <h3>Listado de Medicos</h3>
                    <h3>
                        <asp:Label ID="labelUsername" runat="server" Font-Size="Small" ForeColor="Red"></asp:Label>
                    </h3>
                    <p>
                        &nbsp;</p>
                    <p>
                        <table class="auto-style1">
                            <tr>
                                <td>Filtro por especialidad</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:DropDownList ID="ddlEspecialidadesFiltrar" runat="server" AutoPostBack="True" Height="16px" OnSelectedIndexChanged="ddlEspecialidadesFiltrar_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                                <td>
                        <asp:GridView ID="gvMedicos" runat="server" AutoGenerateDeleteButton="True"
                            AutoGenerateEditButton="True" DataKeyNames="Legajo"
                            OnRowCancelingEdit="gvMedicos_RowCancelingEdit" OnRowDeleting="gvMedicos_RowDeleting"
                            OnRowEditing="gvMedicos_RowEditing" OnRowUpdating="gvMedicos_RowUpdating" AllowPaging="True" OnPageIndexChanging="gvMedicos_PageIndexChanging">
                        </asp:GridView>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </p>

                    <asp:Label ID="lblMensajeExito" runat="server" Font-Size="Small" ForeColor="#009933"></asp:Label>
                    <br />
                                <asp:Label ID="Label1" runat="server" Text="Referencias Provincias, Localidades y Especialidades"></asp:Label>
                                <asp:GridView ID="gvProvincia" runat="server" Width="308px" AllowPaging="True" OnPageIndexChanging="gvProvincia_PageIndexChanging">
                                </asp:GridView>
                                <br />
                                <asp:GridView ID="gvLocalidad" runat="server" Width="323px" AllowPaging="True" OnPageIndexChanging="gvLocalidad_PageIndexChanging">
                                </asp:GridView>
                            <br />
                            <asp:GridView ID="gvEspecialidad" runat="server" AllowPaging="True" OnPageIndexChanging="gvEspecialidad_PageIndexChanging">
                    </asp:GridView>
                    <br />
                </div>
            </div>
        </form>
    </body>

    </html>