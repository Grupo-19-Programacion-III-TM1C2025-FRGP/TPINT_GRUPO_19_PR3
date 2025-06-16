<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pacientes.aspx.cs" Inherits="Vistas.Pacientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Gestión de pacientes</title>
</head>
<body>
    <!-- Encabezado con tabla -->
    <div style="width:100%; padding: 20px; background-color: #00ffff;">
        <tr>
            <!-- Menú a la izquierda -->
            <td style="text-align:left;">
                <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Berlin Sans FB" NavigateUrl="~/link1.aspx">link1</asp:HyperLink>
                &nbsp;&nbsp;&nbsp;
                <asp:HyperLink ID="HyperLink2" runat="server" Font-Names="Berlin Sans FB" NavigateUrl="~/link2.aspx">link2</asp:HyperLink>
                &nbsp;&nbsp;&nbsp;
                <asp:HyperLink ID="HyperLink3" runat="server" Font-Names="Berlin Sans FB" NavigateUrl="~/link3.aspx">link3</asp:HyperLink>
            </td>

            <!-- Usuario a la derecha -->
            <td style="text-align:right;">
                <asp:Label ID="Label1" runat="server" Font-Names="Berlin Sans FB" Text="USUARIO"></asp:Label>
            </td>
        </tr>
    </div>
    <form id="form1" runat="server">
        <div class="container">
    <h2>Gestión de Pacientes</h2>

    <table class="form-table">
        <tr>
            <td colspan="2">
                <h3>Formulario de Paciente</h3>
            </td>
        </tr>
        <tr>
            <td>DNI:</td>
            <td>
                <asp:TextBox ID="txtDNI" runat="server" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDNI" runat="server" ControlToValidate="txtDNI"
                    ErrorMessage="El DNI es obligatorio" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Nombre:</td>
            <td>
                <asp:TextBox ID="txtNombre" runat="server" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre"
                    ErrorMessage="El nombre es obligatorio" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Apellido:</td>
            <td>
                <asp:TextBox ID="txtApellido" runat="server" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido"
                    ErrorMessage="El apellido es obligatorio" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Sexo:</td>
            <td>
                <asp:DropDownList ID="ddlSexo" runat="server" Width="200px">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvEspecialidad" runat="server"
                    ControlToValidate="ddlSexo" ErrorMessage="El sexo es obligatorio"
                    ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Nacionalidad:</td>
            <td>
                <asp:DropDownList ID="ddlNacionalidad" runat="server" Width="200px">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvNacionalidad" runat="server" ControlToValidate="ddlNacionalidad"
                    ErrorMessage="La nacionalidad es obligatoria" ForeColor="Red">*
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Fecha de Nacimiento:</td>
            <td>
                <asp:TextBox ID="txtFechaNacimiento" runat="server" TextMode="Date" Width="189px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvFechaNacimiento" runat="server" ControlToValidate="txtFechaNacimiento"
                    ErrorMessage="La fecha de nacimiento es obligatoria" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Dirección:</td>
            <td>
                <asp:TextBox ID="txtDireccion" runat="server" Width="189px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txtDireccion"
                    ErrorMessage="La dirección es obligatoria" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Provincia:</td>
            <td>
                <asp:TextBox ID="txtProvincia" runat="server" Width="189px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvProvincia" runat="server" ControlToValidate="txtProvincia"
                    ErrorMessage="La provincia es obligatoria" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Localidad:</td>
            <td>
                <asp:TextBox ID="txtLocalidad" runat="server" Width="189px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvLocalidad" runat="server" ControlToValidate="txtLocalidad"
                    ErrorMessage="La localidad es obligatoria" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Email:</td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" Width="200px" TextMode="Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvMail" runat="server" ControlToValidate="txtEmail"
                    ErrorMessage="La Email es obligatorio" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Teléfono:</td>
            <td>
                <asp:TextBox ID="txtTelefono" runat="server" Width="200px" TextMode="Number"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnAgregar" runat="server" Text="Agregar Paciente" CssClass="btn btn-primary" />
                <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar Formulario" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
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

</div>

                <asp:GridView ID="gvPacientes" runat="server" AutoGenerateColumns="False" CssClass="gridview"
                    OnRowCommand="gvPacientes_RowCommand" OnRowEditing="gvPacientes_RowEditing"
                    OnRowDeleting="gvPacientes_RowDeleting" DataKeyNames="DNI" AllowPaging="True"
                    PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="row"
                    AlternatingRowStyle-CssClass="alt-row">
<AlternatingRowStyle CssClass="alt-row"></AlternatingRowStyle>
                    <Columns>
                        <asp:BoundField DataField="DNI" HeaderText="DNI" />
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                        <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
                        <asp:BoundField DataField="Sexo" HeaderText="Sexo" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="Telefono" HeaderText="Teléfono" />
                        <asp:TemplateField HeaderText="Acciones">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEditar0" runat="server" CommandName="Edit"
                                    CommandArgument='<%# Eval("DNI") %>' Text="Editar" CssClass="link-button" />
                                |
                                <asp:LinkButton ID="lnkEliminar0" runat="server" CommandName="Delete"
                                    CommandArgument='<%# Eval("DNI") %>' Text="Eliminar" CssClass="link-button"
                                    OnClientClick="return confirm('¿Está seguro de eliminar este paciente?');" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

<HeaderStyle CssClass="header"></HeaderStyle>

<PagerStyle CssClass="pager"></PagerStyle>

<RowStyle CssClass="row"></RowStyle>
                </asp:GridView>

                <asp:HiddenField ID="hdnFDniSeleccionado" runat="server" />
    </form>
</body>
</html>
