<%@ Page EnableEventValidation="false" ValidateRequest="false" Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="eToolsSales.aspx.cs" Inherits="eToolsSales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style5
        {
            width: 200px;
            text-align: right;
        }
        .style6
        {
            width: 100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>eTools Sales</h1>
<h2>Find Inventory Item:</h2>
<br />
    <table style="width: 97%;">
        <tr>
            <td class="style5">
                &nbsp;
                Stock Number:</td>
            <td>
                &nbsp;
                <asp:TextBox ID="stockNumber" runat="server" Width="300px"></asp:TextBox>
            &nbsp;&nbsp;
                <asp:Button ID="stockNumberAdd" runat="server" Text="View" Width="60px" 
                    onclick="stockNumberAdd_Click" />
            </td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;
                or</td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp; Description:</td>
            <td>
                &nbsp;
                <asp:TextBox ID="descriptionSearch" runat="server" Width="300px"></asp:TextBox>
            &nbsp;&nbsp;
                <asp:Button ID="descriptionSearchButton" runat="server" Text="Search" 
                    Width="60px" onclick="descriptionSearchButton_Click" />
            </td>
        </tr>
        <tr>
            <td class="style5">
            </td>
            <td>
                <asp:Label ID="FormMessage" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style5">
            </td>
            <td>
                Search Results:</td>
        </tr>
        <tr>
            <td class="style5">
            </td>
            <td>
                <asp:GridView ID="DescResults" runat="server" AllowPaging="True" PageSize="5" 
                    onselectedindexchanged="DescResults_SelectedIndexChanged" 
                    HorizontalAlign="Left" Width="450px" 
                    onpageindexchanging="DescResults_PageIndexChanging">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                    </Columns>
                    <PagerSettings FirstPageText="First" LastPageText="Last" 
                        Mode="NextPrevious" NextPageText="Next" PageButtonCount="2" 
                        PreviousPageText="Previous" />
                </asp:GridView>
            </td>
        </tr>
    </table>
    <h2>Add to Sale:</h2>
    <table style="width: 97%;">
        <tr>
            <td class="style5">
                &nbsp;
            </td>
            <td>
                &nbsp;
                <asp:DetailsView ID="ToolDetails" runat="server" Height="50px" Width="185px" 
                    GridLines="None" HorizontalAlign="Left">
                    <Fields>
                        <asp:TemplateField HeaderText="Quantity:">
                            <ItemTemplate>
                                <asp:TextBox ID="QuantityBox" runat="server">1</asp:TextBox>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                    </Fields>
                </asp:DetailsView>
            </td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;
            </td>
            <td>
                &nbsp;
                <asp:Button ID="AddToCart" runat="server" Text="Add To Sale" 
                    onclick="AddToCart_Click" />
            </td>
        </tr>
    </table>
    <br />
    <h2>Review and Finish Sale:</h2>
    <table style="width: 97%;">
        <tr>
            <td class="style6">
            </td>
            <td>
                <asp:GridView ID="ToolList" runat="server" onrowdeleting="ToolList_RowDeleting" 
                    AutoGenerateColumns="False" HorizontalAlign="Left" 
                    onrowediting="ToolList_RowEditing" Width="650px" 
                    onrowcancelingedit="ToolList_RowCancelingEdit" 
                    onrowupdating="ToolList_RowUpdating">
                    <Columns>
                        <asp:BoundField DataField="SN" HeaderText="Stock#" ReadOnly="True">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DSC" HeaderText="Description" ReadOnly="True">
                        <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="QST" HeaderText="In Stock" ReadOnly="True">
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Price">
                            <EditItemTemplate>
                                <asp:TextBox ID="PriceEdit" runat="server" Text='<%# Eval("SP") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("SP") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="#Sold">
                            <EditItemTemplate>
                                <asp:TextBox ID="SoldEdit" runat="server" Text='<%# Eval("QSD") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("QSD") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:CommandField ButtonType="Button" ShowEditButton="True">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>
                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
    <br />
    <table style="width: 97%;">
        <tr>
            <td class="style5">
                Sub-Total:</td>
            <td>
                &nbsp;
                $<asp:Label ID="subTotal" runat="server" Text="0"></asp:Label>
                </td>
        </tr>
        <tr>
            <td class="style5">
                Taxes:</td>
            <td>
                &nbsp;
                $<asp:Label ID="taxes" runat="server" Text="0"></asp:Label>
                </td>
        </tr>
        <tr>
            <td class="style5">
                Grand Total:</td>
            <td>
                &nbsp;
                $<asp:Label ID="grandTotal" runat="server" Text="0"></asp:Label>
                </td>
        </tr>
        <tr>
            <td class="style5">
                Credit / Debit Card Number:</td>
            <td>
                &nbsp;
                <asp:TextBox ID="creditBox" runat="server" Width="180px"></asp:TextBox>
                &nbsp;(Optional)</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;
            </td>
            <td>
                &nbsp;
                <asp:Button ID="processSale" runat="server" Text="Process Sale" 
                    onclick="processSale_Click" />
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;
            </td>
            <td>
                &nbsp;
                <asp:Button ID="cancel" runat="server" Text="Cancel" 
                    onclick="cancel_Click" />
            </td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;
            </td>
            <td>
                &nbsp;
                
                <asp:Label ID="FormMessage0" runat="server"></asp:Label>
                
                </td>
        </tr>
    </table>
</asp:Content>

