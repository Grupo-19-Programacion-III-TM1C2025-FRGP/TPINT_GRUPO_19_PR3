<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Medicos.aspx.cs" Inherits="MiProyecto.Medicos" %>

    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <title>Gestion de Medicos</title>
        
    </head>

    <body>
    <div >
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

    <!-- Contenido centrado -->
    
        <form id="form1" runat="server">
            <div class="container">
                <h2>Gestion de Medicos</h2>

                <table class="form-table">
                    <tr>
                        <td colspan="2">
                            <h3>Formulario de Medico</h3>
                        </td>
                    </tr>
                    <tr>
                        <td>Legajo:</td>
                        <td>
                            <asp:TextBox ID="txtLegajo" runat="server" Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvLegajo" runat="server" ControlToValidate="txtLegajo"
                                ErrorMessage="El legajo es obligatorio" ForeColor="Red">*</asp:RequiredFieldValidator>
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
                        <td>Especialidad:</td>
                        <td>
                            <asp:DropDownList ID="ddlEspecialidad" runat="server" Width="200px">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvEspecialidad" runat="server"
                                ControlToValidate="ddlEspecialidad" ErrorMessage="La especialidad es obligatoria"
                                ForeColor="Red">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Horarios:</td>
                        <td>
                            <asp:DropDownList ID="ddlHorarios" runat="server" Width="200px">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvHorarios" runat="server" ControlToValidate="ddlHorarios"
                                ErrorMessage="Los horarios son obligatorios" ForeColor="Red">*
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td>
                            <asp:TextBox ID="txtEmail" runat="server" Width="200px"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                                ErrorMessage="Formato de email inválido"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red">*
                            </asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Telefono:</td>
                        <td>
                            <asp:TextBox ID="txtTelefono" runat="server" Width="200px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="btnAgregar" runat="server" Text="Agregar Medico" OnClick="btnAgregar_Click"
                                CssClass="btn btn-primary" />
                            <asp:Button ID="btnModificar" runat="server" Text="Modificar Medico"
                                OnClick="btnModificar_Click" Enabled="false" CssClass="btn btn-primary" />
                            <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar Formulario"
                                OnClick="btnLimpiar_Click" CssClass="btn btn-secondary" />
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
                <h3>Listado de Medicos</h3>

                <asp:GridView ID="gvMedicos" runat="server" AutoGenerateColumns="False" CssClass="gridview"
                    OnRowCommand="gvMedicos_RowCommand" OnRowEditing="gvMedicos_RowEditing"
                    OnRowDeleting="gvMedicos_RowDeleting" DataKeyNames="Legajo" AllowPaging="True" PageSize="10"
                    PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="row"
                    AlternatingRowStyle-CssClass="alt-row">
                    <Columns>
                        <asp:BoundField DataField="Legajo" HeaderText="Legajo" />
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                        <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
                        <asp:BoundField DataField="Especialidad" HeaderText="Especialidad" />
                        <asp:BoundField DataField="Horarios" HeaderText="Horarios" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="Telefono" HeaderText="Teléfono" />
                        <asp:TemplateField HeaderText="Acciones">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEditar" runat="server" CommandName="Edit"
                                    CommandArgument='<%# Eval("Legajo") %>' Text="Editar" CssClass="link-button" />
                                |
                                <asp:LinkButton ID="lnkEliminar" runat="server" CommandName="Delete"
                                    CommandArgument='<%# Eval("Legajo") %>' Text="Eliminar" CssClass="link-button"
                                    OnClientClick="return confirm('¿Está seguro de eliminar este médico?');" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                <asp:HiddenField ID="hdnLegajoSeleccionado" runat="server" />
            </div>
        </form>
    </body>

    </html>