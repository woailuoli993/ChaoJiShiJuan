﻿<%@ Page Language="C#" MasterPageFile="~/master/admin.master" AutoEventWireup="true"
    CodeFile="PaperImport.aspx.cs" Inherits="admin_task_StudentImport" Title="导入学生" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table id="addtable">
        <tr>
            <td>
                <asp:FileUpload ID="fulImport" runat="server" />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                    ControlToValidate="fulImport"></asp:RequiredFieldValidator>&nbsp;&nbsp;
            </td>
            <td>
                <asp:LinkButton ID="btnImport" runat="server" class="btn btn-default" data-options="iconCls:'icon-help'"
                    OnClick="btnImport_Click"><span class="glyphicon glyphicon-download-alt marginRight" ></span>导入</asp:LinkButton>
            </td>
            <td>
                <asp:LinkButton ID="btnDownload1" runat="server" class="btn btn-default" OnClick="btnDownload1_Click" CausesValidation="false">模板下载</asp:LinkButton>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblTip" runat="server" Text="" ForeColor="Red"></asp:Label>
</asp:Content>
