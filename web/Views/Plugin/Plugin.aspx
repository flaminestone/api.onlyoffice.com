﻿<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    window.Asc.plugin object
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">window.Asc.plugin object</span>
    </h1>

    <div class="header-gray">Description</div>

    <p class="dscr">The object created at the plugin startup. It has several methods, some of them are optional and are to be used only if and when needed.</p>

    <div class="header-gray">Methods and properties</div>

    <table class="table">
        <colgroup>
            <col style="width: 150px;" />
            <col />
            <col style="width: 100px;" />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>Name</td>
                <td>Description</td>
                <td>Type</td>
                <td>Presence</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("button") %>">button</a></td>
                <td>The buttons used with the plugin and the plugin behavior when these buttons are clicked. The method is called when any of the plugin buttons is clicked.</td>
                <td>function</td>
                <td>required</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("callcommand") %>">callCommand</a>/<a href="<%= Url.Action("executecommand") %>">executeCommand</a></td>
                <td>The <em>window.Asc.plugin.callCommand</em> method is used to send the data back to the editor. Replaced the <em>window.Asc.plugin.executeCommand</em> method when working with texts so that to simplify the syntax of the script you want to pass to the editors. The <em>window.Asc.plugin.executeCommand</em> method is now primarily used to work with OLE objects.
                </td>
                <td>function</td>
                <td>required</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("executemethod") %>">executeMethod</a></td>
                <td>Used to execute certain editor methods using the plugin.</td>
                <td>function</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("info") %>">info</a></td>
                <td>It stores all the information about the editor where the plugin is used.</td>
                <td>object</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("init") %>">init</a></td>
                <td>The data sent to the plugin and what is to be done with it and how. This method is called when the plugin is started.</td>
                <td>function</td>
                <td>required</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("onexternalmouseup") %>">onExternalMouseUp</a></td>
                <td>Specify the action that is to be performed when the mouse button is released outside the plugin iframe.</td>
                <td>function</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("onmethodreturn") %>">onMethodReturn</a></td>
                <td>Used to return the result of the previously executed method.</td>
                <td>function</td>
                <td>optional</td>
            </tr>
        </tbody>
    </table>

    <div class="header-gray">Example</div>

    <pre>
(function(window, undefined){
    var text = "Hello world!";
    window.Asc.plugin.init = function() {
        Asc.scope.text = text;
        this.callCommand(function() {
            var oDocument = Api.GetDocument();
            var oParagraph = Api.CreateParagraph();
            oParagraph.AddText(Asc.scope.text);
            oDocument.InsertContent([oParagraph]);
        }, true);
    };
    window.Asc.plugin.button = function(id)
    {
    };
})(window, undefined);
</pre>
</asp:Content>
