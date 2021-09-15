<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SweetAlert._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <asp:Button ID="btnSweet" runat="server" Text="Sweer Alert" CssClass="btn btn-primary m-3" 
            OnClientClick="return MostrarSweet(this);" OnClick="btnSweet_Click" />
    </div>

    <script>
        function MostrarSweet(btnSweet) {
            console.log(btnSweet);
            if (btnSweet.dataset.confirmed) {
                btnSweet.dataset.confirmed = false;
                return true;
            } else {
                event.preventDefault();
                Swal.fire({
                    title: 'Desea guardar los cambios?',
                    showDenyButton: true,
                    showCancelButton: true,
                    confirmButtonText: 'Guardar',
                    denyButtonText: `Cancelar`,
                }).then((result) => {
                    if (result.isConfirmed) {
                        btnSweet.dataset.confirmed = true;
                        btnSweet.click();
                    } else if (result.isDenied) {
                        Swal.fire('Los cambios no fueron guardados.', '', 'info')
                    }
                })

            }
        }
    </script>
    
</asp:Content>
