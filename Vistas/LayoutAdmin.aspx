<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LayoutAdmin.aspx.cs" Inherits="Vistas.Layout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
  <form id="form1" runat="server">
    <table style="width:100%; padding: 20px; background-color: #4cff00;">
        <tr>
            <td style="text-align:left; margin-left: 40px;">
                <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Berlin Sans FB" NavigateUrl="~/Inicio.aspx">Inicio</asp:HyperLink>
                &nbsp;&nbsp;&nbsp;
                <asp:HyperLink ID="HyperLink2" runat="server" Font-Names="Berlin Sans FB" NavigateUrl="~/AltaPaciente.aspx">Pacientes</asp:HyperLink>
                &nbsp;&nbsp;&nbsp;
                <asp:HyperLink ID="HyperLink3" runat="server" Font-Names="Berlin Sans FB" NavigateUrl="~/Medicos.aspx">Medicos</asp:HyperLink>
                &nbsp;&nbsp;
                <asp:HyperLink ID="HyperLink5" runat="server" Font-Names="Berlin Sans FB" NavigateUrl="~/AsignacionTurno.aspx">Asignar turnos</asp:HyperLink>
                &nbsp;&nbsp;&nbsp;
                <asp:HyperLink ID="HyperLink4" runat="server" Font-Names="Berlin Sans FB" NavigateUrl="~/Informes de Presentes.aspx">Reportes</asp:HyperLink>
                &nbsp;&nbsp;&nbsp;
            
            </td>

            <td style="text-align:right;">
                <asp:Label ID="Label1" runat="server" Font-Names="Berlin Sans FB" Text="USUARIO"></asp:Label>
                 &nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" Height="24px" Text="Cerrar sesion" Font-Names="Berlin Sans FB" ForeColor="#009933" />
                 &nbsp;&nbsp;&nbsp;
            </td>
        </tr>
    </table>

    <div style="text-align: center; margin-top: 40px;">
        <asp:Label ID="Label2" runat="server" Font-Names="Berlin Sans FB" Text="CONTENIDO"></asp:Label>
    </div>
</form>




</body>
</html>
