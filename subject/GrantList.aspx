﻿<%@ Page Language="C#" MasterPageFile="~/master/admin.master" AutoEventWireup="true"
    CodeFile="GrantList.aspx.cs" Inherits="subject_SubjectList" Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        $(function(){
           $('#oe_iframe').window('close');
           $('#oe_iframe2').window('close');
        })
        function oe_add()
        {
            $('#oe_iframe').window({   
                 title:'授课添加',
                 iconCls:'icon-add',                 
                 onClose:function(){   
                    $('#<%=btnHide.ClientID %>').click();
                 }   
            });  
            $('#oe_iframe').window('open');
            $('#oe_iframe').window('resize',{  
                width: 750,  
                height: 500  
            }); 
            $('#oe_iframe').window('move',{   
                left:150,   
                top:0   
            });
            return false;    
        }
        function oe_edit()
        {
            $('#oe_iframe2').window('open');
            $('#oe_iframe2').window({   
                 title:'授课编辑', 
                 iconCls:'icon-cut',                
                 onClose:function(){   
                    $('#<%=btnHide.ClientID %>').click();
                 }   
            }); 
            $('#oe_iframe2').window('resize',{  
                width: 750,  
                height: 500  
            }); 
            $('#oe_iframe2').window('move',{   
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
             <asp:DropDownList  CssClass="form-control"   ID="ddlUserName" runat="server"  Width="160px">
            </asp:DropDownList>
              <asp:DropDownList  CssClass="form-control"   ID="ddlSubject" runat="server"  Width="160px">
            </asp:DropDownList>
            <asp:LinkButton ID="lbtnSearch" runat="server" class="btn btn-default" data-options="plain:true,iconCls:'icon-search'"
                OnClick="lbtnSearch_Click"><span class="glyphicon glyphicon-search marginRight" ></span>搜索</asp:LinkButton>
            <asp:LinkButton ID="lbtnAdd" runat="server" class="btn btn-default" data-options="plain:true,iconCls:'icon-add'"
                OnClientClick="return oe_add();"><span class="glyphicon  glyphicon-plus marginRight" ></span>添加</asp:LinkButton>
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
                    <asp:TemplateField HeaderText="教师名">
                        <ItemTemplate>
                            <%# Eval("realname")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="科目名">
                        <ItemTemplate>
                            <%# Eval("subjectname")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="班级数量">
                        <ItemTemplate>
                            <%# Eval("classcount")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnEdit" runat="server" class="btn btn-default" data-options="plain:true,iconCls:'icon-cut'"
                                CommandArgument='<%#Eval("userid") %>' CommandName='<%#Eval("subjectid") %>' OnClick="lbtnEdit_Click">编辑授课</asp:LinkButton>
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
    <div id="oe_iframe" class="easyui-window" style="padding: 5px;">
        <iframe src="GrantAdd.aspx" frameborder="0" scrolling="auto" width="100%" height="100%">
        </iframe>
    </div>
    <div id="oe_iframe2" class="easyui-window" style="padding: 5px;">
        <iframe src="GrantAdd.aspx<%=editString %>" frameborder="0" scrolling="auto" width="100%"
            height="100%"></iframe>
    </div>
</asp:Content>
