﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pacientes.aspx.cs" Inherits="Vistas.Pacientes" %>

    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Gestión de pacientes</title>
        <style type="text/css">
            .auto-style1 {
                width: 226px;
            }
            .auto-style2 {
                height: 26px;
            }
            .auto-style3 {
                width: 31px;
            }
            .auto-style4 {
                width: 66px;
            }
            .auto-style5 {
                width: 74px;
            }
            .auto-style6 {
                width: 100%;
            }
            .auto-style7 {
                width: 1226px;
            }
            .auto-style8 {
                width: 298px;
            }
            .auto-style9 {
                width: 7346px;
            }
            .auto-style10 {
                width: 175px;
            }
            .auto-style11 {
                width: 81px;
            }
            .auto-style12 {
                width: 299px;
            }
            .auto-style17 {
                width: 148px;
            }
            .auto-style18 {
                width: 134px;
            }
            .auto-style19 {
                width: 111px;
            }
            .auto-style20 {
                width: 32px;
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

                                <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar Formulario" OnClick="btnLimpiar_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="1" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="auto-style2">
                                <asp:Label ID="lblMensaje0" runat="server" ForeColor="Green" CssClass="success-message">
                                </asp:Label>
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
                    <table class="auto-style6">
                        <tr>
                            <td class="auto-style10">Buscar por DNI:</td>
                            <td class="auto-style12">
                                <asp:TextBox ID="txtDNI2" runat="server" Width="259px" ValidationGroup="2"></asp:TextBox>
                            </td>
                            <td class="auto-style20">
                                <asp:RequiredFieldValidator ID="rfvDNI2" runat="server" ControlToValidate="txtDNI2" ForeColor="Red" ValidationGroup="2">*</asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style11">
                                <asp:Button ID="BuscarDNI" runat="server" OnClick="BuscarDNI_Click" Text="Buscar" ValidationGroup="2" />
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style10">Buscar por nombre:</td>
                            <td class="auto-style12">
                                <asp:TextBox ID="txtNombre2" runat="server" Width="259px" ValidationGroup="3"></asp:TextBox>
                            </td>
                            <td class="auto-style20">
                                <asp:RequiredFieldValidator ID="rfvNombre2" runat="server" ControlToValidate="txtNombre2" ForeColor="Red" ValidationGroup="3">*</asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style11">
                                <asp:Button ID="BuscarNombre" runat="server" OnClick="BuscarNombre_Click" Text="Buscar" ValidationGroup="3" />
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                    <p>
                        <table class="auto-style6">
                            <tr>
                                <td colspan="3">Filtros de provincia</td>
                                <td rowspan="9">
                        <asp:GridView ID="gvPacientes" runat="server" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" DataKeyNames="DNI" OnRowCancelingEdit="gvPacientes_RowCancelingEdit" OnRowDeleting="gvPacientes_RowDeleting" OnRowEditing="gvPacientes_RowEditing" OnRowUpdating="gvPacientes_RowUpdating" AllowPaging="True" OnPageIndexChanging="gvPacientes_PageIndexChanging">
                        </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style17">
                                    <asp:Button ID="BsAs" runat="server" OnClick="BsAs_Click" Text="Buenos Aires" Width="134px" />
                                </td>
                                <td class="auto-style19">
                                    <asp:Button ID="Formosa" runat="server" OnClick="Formosa_Click" Text="Formosa" />
                                </td>
                                <td class="auto-style18">
                                    <asp:Button ID="Salta" runat="server" OnClick="Salta_Click" Text="Salta" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style17">
                                    <asp:Button ID="Cordoba" runat="server" OnClick="Cordoba_Click" Text="Cordoba" />
                                </td>
                                <td class="auto-style19">
                                    <asp:Button ID="Jujuy" runat="server" OnClick="Jujuy_Click" Text="Jujuy" />
                                </td>
                                <td class="auto-style18">
                                    <asp:Button ID="SanJuan" runat="server" OnClick="SanJuan_Click" Text="San Juan" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style17">
                                    <asp:Button ID="SantaFe" runat="server" OnClick="SantaFe_Click" Text="Santa Fe" />
                                </td>
                                <td class="auto-style19">
                                    <asp:Button ID="LaPampa" runat="server" OnClick="LaPampa_Click" Text="La Pampa" />
                                </td>
                                <td class="auto-style18">
                                    <asp:Button ID="SanLuis" runat="server" OnClick="SanLuis_Click" Text="San Luis" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style17">
                                    <asp:Button ID="Catamarca" runat="server" OnClick="Catamarca_Click" Text="Catamarca" />
                                </td>
                                <td class="auto-style19">
                                    <asp:Button ID="LaRioja" runat="server" OnClick="LaRioja_Click" Text="La Rioja" />
                                </td>
                                <td class="auto-style18">
                                    <asp:Button ID="SantaCruz" runat="server" OnClick="SantaCruz_Click" Text="Santa Cruz" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style17">
                                    <asp:Button ID="Chaco" runat="server" OnClick="Chaco_Click" Text="Chaco" />
                                </td>
                                <td class="auto-style19">
                                    <asp:Button ID="Mendoza" runat="server" OnClick="Mendoza_Click" Text="Mendoza" />
                                </td>
                                <td class="auto-style18">
                                    <asp:Button ID="SantiagoEstero" runat="server" OnClick="SantiagoEstero_Click" Text="Santiago del E." Width="136px" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style17">
                                    <asp:Button ID="Chubut" runat="server" OnClick="Chubut_Click" Text="Chubut" />
                                </td>
                                <td class="auto-style19">
                                    <asp:Button ID="Misiones" runat="server" OnClick="Misiones_Click" Text="Misiones" />
                                </td>
                                <td class="auto-style18">
                                    <asp:Button ID="TierraDelFuego" runat="server" OnClick="TierraDelFuego_Click" Text="Tierra del Fuego" Width="140px" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style17">
                                    <asp:Button ID="Corrientes" runat="server" OnClick="Corrientes_Click" Text="Corrientes" />
                                </td>
                                <td class="auto-style19">
                                    <asp:Button ID="Neuquen" runat="server" OnClick="Neuquen_Click" Text="Neuquen" />
                                </td>
                                <td class="auto-style18">
                                    <asp:Button ID="Tucuman" runat="server" OnClick="Tucuman_Click" Text="Tucuman" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style17">
                                    <asp:Button ID="EntreRios" runat="server" OnClick="EntreRios_Click" Text="Entre Rios" />
                                </td>
                                <td class="auto-style19">
                                    <asp:Button ID="RioNegro" runat="server" OnClick="RioNegro_Click" Text="Rio Negro" />
                                </td>
                                <td class="auto-style18">
                                    <asp:Button ID="Todo" runat="server" OnClick="Todo_Click" Text="Todos" />
                                </td>
                            </tr>
                        </table>
                    </p>
                    <p>
                        &nbsp;</p>
                    <table class="auto-style6">
                        <tr>
                            <td class="auto-style9">
                                <asp:Label ID="Label1" runat="server" Text="Referencias Provincias y Localidades"></asp:Label>
                            </td>
                            <td class="auto-style7">&nbsp;</td>
                        </tr>
                    </table>

                    <table class="form-table">
                        <tr>
                            <td class="auto-style8">
                                &nbsp;</td>
                            <td class="auto-style3">
                                <asp:GridView ID="gvProvincia" runat="server" Width="308px" AllowPaging="True" OnPageIndexChanging="gvProvincia_PageIndexChanging">
                                </asp:GridView>
                            </td>
                            <td class="auto-style4">
                                &nbsp;</td>
                            <td class="auto-style5">
                                <asp:GridView ID="gvLocalidad" runat="server" Width="323px" AllowPaging="True" OnPageIndexChanging="gvLocalidad_PageIndexChanging">
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>

                </div>

            </div>   
          
        </form>
    </body>

    </html>