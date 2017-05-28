<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ATracker.SpAddinWeb.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="../Scripts/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="../Scripts/common.js"></script>
    <script type="text/javascript">
        var hostweburl;

        // Load the SharePoint resources.
        $(document).ready(function () {

            // Get the URI decoded add-in web URL.
            hostweburl =
                decodeURIComponent(
                    getQueryStringParameter("SPHostUrl")
            );

            // The SharePoint js files URL are in the form:
            // web_url/_layouts/15/resource.js
            var scriptbase = hostweburl + "/_layouts/15/";

            // Load the js file and continue to the 
            // success handler.
            $.getScript(scriptbase + "SP.UI.Controls.js")
        });

        // Function to retrieve a query string value.
        function getQueryStringParameter(paramToRetrieve) {
            var params =
                document.URL.split("?")[1].split("&");
            var strParams = "";
            for (var i = 0; i < params.length; i = i + 1) {
                var singleParam = params[i].split("=");
                if (singleParam[0] == paramToRetrieve)
                    return singleParam[1];
            }
        }
    </script>
    <link type="text/css" rel="stylesheet" href="<%= sharePointSiteUrl + "/_layouts/15/defaultcss.ashx" %>" />
    <link type="text/css" rel="Stylesheet" href="../Styles/tracker.css"
</head>
<body style="overflow: auto;">
    <!-- Chrome control placeholder. Options are declared inline.  -->
    <div
        id="chrome_ctrl_container"
        data-ms-control="SP.UI.Controls.Navigation"
        data-ms-options='{  

            "appIconUrl" : "/Images/AppIcon.png",
            "appTitle" : "Transfirm Version Tracker",
            "settingsLinks" : [

            ]
         }'>
        <%--            "appHelpPageUrl" : "Help.aspx",--%>    <%--                {
                    "linkUrl" : "Default.aspx",
                    "displayName" : "Settings"
                },
                {
                    "linkUrl" : "Default.aspx",
                    "displayName" : "Contact us"
                }--%>
    </div>
    <form id="form1" runat="server">
        <div class="container">
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableCdn="True" />
            <div style="display:none;">
            <label>Library Name</label>
            <asp:TextBox runat="server" ID="libraryName"></asp:TextBox>
            <asp:Button runat="server" Text="Add Remote Event Receiver" OnClick="AddRER_OnClick" ID="AddRER" />
            <asp:Button runat="server" Text="Remove Remote Event Receiver" OnClick="RemoveRER_OnClick" ID="RemoveRER" />
                </div>
            <asp:Literal runat="server" ID="currentStatus"></asp:Literal>
            <div class="output">
                <asp:Literal runat="server" ID="output"></asp:Literal>
            </div>
        </div>
    </form>
</body>
</html>
