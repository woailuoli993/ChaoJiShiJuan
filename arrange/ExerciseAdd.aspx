﻿<%@ Page Language="C#" MasterPageFile="~/master/admin.master" AutoEventWireup="true"
    CodeFile="ExerciseAdd.aspx.cs" Inherits="subject_SubjectAdd" Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
     <style>
  .panel-footer{
   padding:0;
   background-color:#FFFFFF;
   height:34px;
  }
  .panel-footer ul{
   margin:0;
  }
  .pagination>li:first-child>a{
  border-top-left-radius:0;
  }
  .pagination>li:last-child>a{
  border-top-right-radius:0;
  border-bottom-right-radius:0;
  }
  .panel{
   margin-bottom:5px;
   border:none;
   border-color:
  }
  .panel-body{
   padding:0;
  }
  .panel-heading{
   border:none; 
  }
  .panel-footer{
   bottom:0;
   width:100%;
  }
  .table{
  margin:0;	
  }
  .table tr td{

  margin:0;	
  }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table id="addtable">
        <tr>
            <td>
                练习名：
            </td>
            <td>
                <asp:TextBox  class="form-control"   ID="txtArrangeName" runat="server" Width="260px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                    ControlToValidate="txtArrangeName"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                科目：
            </td>
            <td>
                 <asp:DropDownList  CssClass="form-control"   ID="ddlSubject" runat="server" Width="160px" OnSelectedIndexChanged="ddlSubject_SelectedIndexChanged" AutoPostBack="true">
                </asp:DropDownList>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="*" ControlToValidate="ddlSubject"
                    MaximumValue="999999" MinimumValue="1" Type="Integer"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td>
                试卷：
            </td>
            <td>
                 <asp:DropDownList  CssClass="form-control"   ID="ddlPaper" runat="server" Width="160px">
                </asp:DropDownList>
                <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="*"
                    ControlToValidate="ddlPaper" MaximumValue="999999" MinimumValue="1" Type="Integer"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td>
                开始时间：
            </td>
            <td>
                <asp:TextBox  class="form-control"   ID="txtStartTime" runat="server" CssClass="easyui-datetimebox" data-options="showSeconds:false" Width="160px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                截止时间：
            </td>
            <td>
                <asp:TextBox  class="form-control"   ID="txtEndTime" runat="server" CssClass="easyui-datetimebox" data-options="showSeconds:false" Width="160px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Label ID="lblInfo" runat="server" Text="" Visible="false" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:LinkButton ID="lbtnAdd" runat="server" class="btn btn-info" data-options="iconCls:'icon-save'"
                    OnClick="lbtnAdd_Click" >保存</asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
