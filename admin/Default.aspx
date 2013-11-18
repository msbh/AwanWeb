<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="login_Default" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" style="width: 100%; height: 100% overflow-y: hidden;">
<head id="Head1" runat="server">
    <title>Awan International K.K - Admin Panel - Welcome | Login</title>
    <style type="text/css">
        
        body {font-family: Verdana; font-size: 10pt;}
        
        
        .logincontainer {position: relative; margin: 8px auto; width: 680px; height:555px; background-image: url(car2.png); } 
          
               
        .loginform {position: absolute; top: 300px; left: 100px; width: 250px; height: 200px;}
        
        .loginform ul {list-style-type: none; padding:0px; margin:0px;}
        
        .loginform ul li {padding:5px; margin-top:8px;}
        
        label, input {font-size: 0.8em;width: 110px; display:block; float:left;}
        
        .status {display:block; text-align:center; font-weight:bold; color: #FF9900;}
        
    </style>
    <link type="text/css" href="../_assets/css/glowbutton.css" rel="stylesheet" />
    
    <script type="text/javascript" src="../_assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="../_assets/js/jquery.metadata.min.js"></script>
    <script type="text/javascript" src="../_assets/js/jquery.color.js"></script>
    <script type="text/javascript" src="../_assets/js/jquery.glowbuttons.js"></script>
    <script type="text/javascript">
    
        $(document).ready(function(){   
            $('.glow').glowbuttons();
        });  
    
    </script>     
    
    
    
    
</head>
<body style="overflow: -moz-scrollbars-vertical; overflow-x: hidden;overflow-y: hidden; ">
    <form id="form1" runat="server">
    <div class="logincontainer" style="left: 0px; top: 0px">        
        <div class="loginform" style="left: 362px; top: 389px; height: 114px">
            <ul>
                <li>
                    <asp:TextBox ID="txtUsername" runat="server" ValidationGroup="LoginForm" MaxLength="20" Width="125px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvUsername" runat="server" 
                        ControlToValidate="txtUsername" ErrorMessage="Username Required" 
                        ValidationGroup="LoginForm">*</asp:RequiredFieldValidator>
                </li>
                <li>
                    <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" 
                        ValidationGroup="LoginForm" MaxLength="20" Width="125px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                        ControlToValidate="txtPassword" ErrorMessage="Password Required" 
                        ValidationGroup="LoginForm">*</asp:RequiredFieldValidator>
                    <asp:Button ID="btnLogin" runat="server" CssClass="glow" Text="Login" 
                        ValidationGroup="LoginForm" Height="24px" Width="82px" />
                        
                    <asp:Label ID="lblstatus" runat="server" Text="" ForeColor="Red"></asp:Label>
                        
                </li>
            </ul>
        </div>
        </div>
    </form>
</body>



</html>

