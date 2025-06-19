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
                width: 97px;
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
                width: 97px;
                height: 28px;
            }

            .auto-style28 {
                height: 28px;
            }
        </style>
    </head>

    <body>
        <form id="form1" runat="server">
            <table style="width:100%; padding: 20px; background-color: #00ffff;">
                <tr>
                    <td style="text-align:left; margin-left: 40px;">
                        <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Berlin Sans FB"
                            NavigateUrl="~/LogIn.aspx">Inicio</asp:HyperLink>
                        &nbsp;&nbsp;&nbsp;
                        <asp:HyperLink ID="HyperLink2" runat="server" Font-Names="Berlin Sans FB"
                            NavigateUrl="~/VistaTurnos.aspx">Ver Turnos</asp:HyperLink>
                        &nbsp;&nbsp;&nbsp;
                    </td>
                    <td style="text-align:right;">
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
                            <td class="auto-style2">
                                &nbsp;</td>
                            <td class="auto-style7">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style3">&nbsp;</td>
                            <td class="auto-style4">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style15"></td>
                            <td class="auto-style11"></td>
                            <td class="auto-style11">&nbsp;</td>
                            <td class="auto-style10"></td>
                            <td class="auto-style11"></td>
                            <td class="auto-style12"></td>
                            <td class="auto-style13"></td>
                            <td class="auto-style8"></td>
                        </tr>
                        <tr>
                            <td class="auto-style14">&nbsp;</td>
                            <td class="auto-style2">
                                <asp:GridView ID="gvPacientes" runat="server" AutoGenerateColumns="False"
                                    AutoGenerateEditButton="True" AutoGenerateSelectButton="True" Height="66px"
                                    OnSelectedIndexChanged="gvPacientes_SelectedIndexChanged" Width="696px">
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
                            <td class="auto-style2">
                                &nbsp;</td>
                            <td class="auto-style7">&nbsp;</td>
                            <td class="auto-style4">&nbsp;</td>
                            <td class="auto-style3">&nbsp;</td>
                            <td class="auto-style4">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style24"></td>
                            <td class="auto-style23"></td>
                            <td class="auto-style23">&nbsp;</td>
                            <td class="auto-style25"></td>
                            <td class="auto-style26"></td>
                            <td class="auto-style27"></td>
                            <td class="auto-style26"></td>
                            <td class="auto-style28"></td>
                        </tr>
                        <tr>
                            <td class="auto-style18">Busqueda de turno:</td>
                            <td class="auto-style17">
                                <asp:TextBox ID="txtPacientes" runat="server" Width="225px"></asp:TextBox>
                            </td>
                            <td class="auto-style17">
                                <asp:RequiredFieldValidator ID="rfvBusqueda" runat="server"
                                    ControlToValidate="txtPacientes" ErrorMessage="El campo se encuentra vacio.">
                                </asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style19">
                                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" />
                            </td>
                            <td class="auto-style20">
                                <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" />
                            </td>
                            <td class="auto-style21">
                            </td>
                            <td class="auto-style20">
                            </td>
                            <td class="auto-style22"></td>
                        </tr>
                        <tr>
                            <td class="auto-style14">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
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
                            <td class="auto-style2">
                                &nbsp;</td>
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
            </div>
        </form>
        <p>
            &nbsp;&nbsp;&nbsp;
        </p>
    </body>

    </html>