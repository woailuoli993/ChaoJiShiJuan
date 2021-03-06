﻿<%@ Page Language="C#" MasterPageFile="~/master/admin.master" AutoEventWireup="true"
    CodeFile="CorrectList.aspx.cs" Inherits="subject_SubjectList" Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        $(function(){
           $('#oe_iframe').window('close');
        })
        function oe_add()
        {
            $('#oe_iframe').window({   
                 title:'简答批改',
                 iconCls:'icon-cut',                 
                 onClose:function(){   
                    $('#<%=btnHide.ClientID %>').click();
                 }   
            });  
            $('#oe_iframe').window('open');
            $('#oe_iframe').window('resize',{  
                width: 700,  
                height: 450  
            }); 
            $('#oe_iframe').window('move',{   
                left:150,   
                top:0   
            });
            return false;    
        }        
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="box" class="panel panel-default" style="height:100%;">
       <div id="box_top" class="panel-heading">
            考试名：<asp:TextBox  class="form-control"   ID="txtWord" CssClass="form-control"  runat="server"></asp:TextBox>
             <asp:DropDownList  CssClass="form-control"   ID="ddlSubject" runat="server" Width="160px">
            </asp:DropDownList>
            <asp:LinkButton ID="lbtnSearch" runat="server" class="btn btn-default" data-options="plain:true,iconCls:'icon-search'"
                OnClick="lbtnSearch_Click"><span class="glyphicon glyphicon-search marginRight" ></span>搜索</asp:LinkButton>
        </div>
        <div class="panel-body" id="box_middle">
            <asp:GridView ID="gvwData" runat="server" runat="server" AutoGenerateColumns="false" CssClass="table table_style"  GridLines="None" 
                HorizontalAlign="Center" onrowdatabound="gvwData_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1+pageSize*(pageIndex-1) %></ItemTemplate>
                        <ItemStyle  />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="科目名">
                        <ItemTemplate>
                            <%# Eval("subjectname")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="考试名">
                        <ItemTemplate>
                            <%# Eval("arrangetitle")%>
                        </ItemTemplate>
                    </asp:TemplateField>                    
                    <asp:TemplateField HeaderText="开始时间">
                        <ItemTemplate>
                            <%# Eval("starttime")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="结束时间">
                        <ItemTemplate>
                            <%# Eval("endtime")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="待批改数量">
                        <ItemTemplate>
                            <%# Eval("answercount")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnEdit" runat="server" class="btn btn-default" data-options="plain:true,iconCls:'icon-cut'"
                                CommandArgument='<%#Eval("id") %>' OnClick="lbtnEdit_Click">简答批改</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    没有需要批改的简答题！
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
    <div id="oe_iframe" class="easyui-window" style="padding: 5px;">
        <iframe src="CorrectAnswer.aspx<%=editString %>" frameborder="0" scrolling="auto"
            width="100%" height="100%"></iframe>
    </div>
</asp:Content>
