<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Medicos.aspx.cs" Inherits="MiProyecto.Medicos" %>

    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <title>Gestion de Medicos</title>
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
                                <asp:TextBox ID="txtDNI" runat="server" Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvDNI" runat="server" ControlToValidate="txtDNI"
                                    ErrorMessage="El legajo es obligatorio" ForeColor="Red">*
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Nombre:</td>
                            <td>
                                <asp:TextBox ID="txtNombre" runat="server" Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre"
                                    ErrorMessage="El nombre es obligatorio" ForeColor="Red">*
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Apellido:</td>
                            <td>
                                <asp:TextBox ID="txtApellido" runat="server" Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvApellido" runat="server"
                                    ControlToValidate="txtApellido" ErrorMessage="El apellido es obligatorio"
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Sexo:</td>
                            <td>
                                <asp:TextBox ID="txtSexo" runat="server" Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvSexo" runat="server"
                                    ControlToValidate="txtSexo" ErrorMessage="El apellido es obligatorio"
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Nacionalidad:</td>
                            <td>
                                <asp:TextBox ID="txtNacionalidad" runat="server" Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvNacionalidad" runat="server"
                                    ControlToValidate="txtNacionalidad" ErrorMessage="El apellido es obligatorio"
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Provincia:</td>
                            <td>
                                <asp:DropDownList ID="ddlProvincia" runat="server" Width="200px" AutoPostBack="true" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvProvincia" runat="server"
                                    ControlToValidate="ddlProvincia" ErrorMessage="Los horarios son obligatorios"
                                    ForeColor="Red">*
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
                                    ForeColor="Red">*
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Nacimiento:</td>
                            <td>
                                <asp:TextBox ID="txtNacimiento" runat="server" Width="200px" TextMode="Date"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvNacimiento" runat="server"
                                    ControlToValidate="txtNacimiento" ErrorMessage="El apellido es obligatorio"
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
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
                            <td>Dias de Atencion:</td>
                            <td>
                                <asp:DropDownList ID="ddlDiaAtencion" runat="server" Width="200px">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvDiaAtencion" runat="server"
                                    ControlToValidate="ddlDiaAtencion" ErrorMessage="Los horarios son obligatorios"
                                    ForeColor="Red">*
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Horarios:</td>
                            <td>
                                <asp:DropDownList ID="ddlHorarios" runat="server" Width="200px">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvHorarios" runat="server"
                                    ControlToValidate="ddlHorarios" ErrorMessage="Los horarios son obligatorios"
                                    ForeColor="Red">*
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Email:</td>
                            <td>
                                <asp:TextBox ID="txtEmail" runat="server" Width="200px"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="revEmail" runat="server"
                                    ControlToValidate="txtEmail" ErrorMessage="Formato de email inválido"
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red">
                                    *
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
                                <asp:Button ID="btnAgregar" runat="server" Text="Agregar Medico"
                                    OnClick="btnAgregar_Click" CssClass="btn btn-primary" />
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
                        OnRowDeleting="gvMedicos_RowDeleting" DataKeyNames="Legajo" AllowPaging="True"
                        PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="row"
                        AlternatingRowStyle-CssClass="alt-row" OnSelectedIndexChanged="gvMedicos_SelectedIndexChanged" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" DataSourceID="SqlDataSource1">
                    <AlternatingRowStyle CssClass="alt-row"></AlternatingRowStyle>
                        <Columns>
                            <asp:BoundField DataField="Legajo" HeaderText="Legajo" InsertVisible="False" ReadOnly="True" SortExpression="Legajo" />
                            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                            <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
                            <asp:BoundField DataField="DNI" HeaderText="DNI" SortExpression="DNI" />
                            <asp:BoundField DataField="Sexo" HeaderText="Sexo" SortExpression="Sexo" />
                            <asp:BoundField DataField="Nacionalidad" HeaderText="Nacionalidad" SortExpression="Nacionalidad" />
                            <asp:BoundField DataField="Fecha de Nacimiento" HeaderText="Fecha de Nacimiento" SortExpression="Fecha de Nacimiento" />
                            <asp:BoundField DataField="Localidad" HeaderText="Localidad" SortExpression="Localidad" />
                            <asp:BoundField DataField="Especialidad" HeaderText="Especialidad" SortExpression="Especialidad" />
                            <asp:BoundField DataField="Dias de Atencion" HeaderText="Dias de Atencion" SortExpression="Dias de Atencion" />
                            <asp:BoundField DataField="Horario" HeaderText="Horario" SortExpression="Horario" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
                        </Columns>

                        <HeaderStyle CssClass="header"></HeaderStyle>

                        <PagerStyle CssClass="pager"></PagerStyle>

                        <RowStyle CssClass="row"></RowStyle>
                    </asp:GridView>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ClinicaConnectionString %>" SelectCommand="SELECT LegajoMedico AS 'Legajo', NombreMedico AS 'Nombre', ApellidoMedico AS 'Apellido', DNI, Sexo, Nacionalidad, FechaNacimiento AS 'Fecha de Nacimiento', Localidad, Especialidad, DiaAtencion AS 'Dias de Atencion', Horario, Email, Telefono FROM Medico WHERE Estado=1"></asp:SqlDataSource>
                    <asp:Label ID="lblMensajeExito" runat="server"></asp:Label>
                </div>
            </div>
        </form>
    </body>

    </html>