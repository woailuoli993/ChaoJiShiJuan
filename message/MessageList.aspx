﻿<%@ Page Language="C#" MasterPageFile="~/master/admin.master" AutoEventWireup="true"
    CodeFile="MessageList.aspx.cs" Inherits="subject_SubjectList" Title="无标题页" %>

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
    <div id="box" class="panel panel-default" style="height:100%;">
       <div id="box_top" class="panel-heading">
            标题或内容：<asp:TextBox  class="form-control"   ID="txtWord" CssClass="form-control"  runat="server"></asp:TextBox>
            <asp:LinkButton ID="lbtnSearch" runat="server" class="btn btn-default" data-options="plain:true,iconCls:'icon-search'"
                OnClick="lbtnSearch_Click"><span class="glyphicon glyphicon-search marginRight" ></span>搜索</asp:LinkButton>
            <asp:LinkButton ID="lbtnDelete" runat="server" class="btn btn-default" data-options="plain:true,iconCls:'icon-cancel'"
                OnClick="lbtnDelete_Click" OnClientClick="return confirm('您确定删除所选的吗？')"><span class="glyphicon glyphicon-remove marginRight" ></span>删除所选</asp:LinkButton>
        </div>
        <div class="panel-body" id="box_middle">
            <asp:GridView ID="gvwData" runat="server" runat="server" AutoGenerateColumns="false" CssClass="table table_style"  GridLines="None" 
                HorizontalAlign="Center">
                <Columns>
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1+pageSize*(pageIndex-1) %></ItemTemplate>
                        <ItemStyle  />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="">
                        <HeaderTemplate>
                            <asp:CheckBox ID="chkbAll" runat="server"  />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkbOne" runat="server"  />
                        </ItemTemplate>
                        <ItemStyle  />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="标题">
                        <ItemTemplate>
                            &nbsp;&nbsp;<%# GetSmallTitle(Eval("messagetitle").ToString())%>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="发布者">
                        <ItemTemplate>
                            <%# Eval("realname")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="创建时间">
                        <ItemTemplate>
                            <%# Eval("createtime")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <a  class="btn btn-info"  data-options="plain:true,iconCls:'icon-cut'" onclick="return top.addTab('编辑公告','message/MessageAdd.aspx?id=<%#Eval("id") %>')">
                                <span class="glyphicon glyphicon-pencil  marginRight" ></span>编辑</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    没有返回任何数据！
                </EmptyDataTemplate>
                <HeaderStyle  />
                <RowStyle HorizontalAlign="Center" />
                <EmptyDataRowStyle Font-Size="16px" ForeColor="Red" Font-Bold="true" />
            </asp:GridView>
        </div>
    </div>
    <div id="pp" class="easyui-pagination" style="background: #efefef; border: 1px solid #ccc;"
        data-options="  
        total:<%=pageTotal%>,
        onSelectPage:function(pageIndex, pageSize){  
             $('#<%=hfPageIndex.ClientID %>').val(pageIndex);
             $('#<%=hfPageSize.ClientID %>').val(pageSize);
             $('#<%=btnHide.ClientID %>').click();
        },
        showRefresh:false,
        pageNumber:<%=pageIndex %>,
        pageSize:<%=pageSize %>  
    ">
    </div>
    <div style="display: none;">
        <asp:HiddenField ID="hfPageIndex" runat="server" />
        <asp:HiddenField ID="hfPageSize" runat="server" />
        <asp:Button ID="btnHide" runat="server" Text="" OnClick="btnHide_Click" />
    </div>
</asp:Content>
