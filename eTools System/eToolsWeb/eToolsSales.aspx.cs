#region Default References
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
#endregion
#region Additional Reference Requirements
using System.Data;
using System.Drawing;
using System.Globalization;
using eToolsSystem;
using CartEntities;
#endregion

public partial class eToolsSales : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        FormMessage.Text = "";
        FormMessage.ForeColor = Color.Black;
        FormMessage0.Text = "";
        FormMessage0.ForeColor = Color.Black;
        updateSubTotal();

        if (ToolCart.CookieExist() && (!Page.IsPostBack))
        {
            List<ToolCartData> tools = ToolCart.RetrieveCart();
            ToolList.DataSource = tools;
            ToolList.DataBind();
        }

        if (!(HttpContext.Current.Request.Cookies["SalesArgs"] == null) && (!Page.IsPostBack))
        {
            descriptionSearch.Text = HttpContext.Current.Request.Cookies["SalesArgs"]["description"].Trim();
            descriptionSearchButton_Click(sender, e);
        }

        if (!(HttpContext.Current.Request.Cookies["StockArgs"] == null) && (!Page.IsPostBack))
        {
            stockNumber.Text = HttpContext.Current.Request.Cookies["StockArgs"]["stocknumber"].Trim();
            stockNumberAdd_Click(sender, e);
        }
    }
    protected void descriptionSearchButton_Click(object sender, EventArgs e)
    {
        descriptionSearch.Text = descriptionSearch.Text.Trim();
        if (descriptionSearch.Text.Length == 0)
        {
            FormMessage.Text = "Please enter the name string you wish to search for.";
            FormMessage.ForeColor = Color.Red;
        }
        else
        {
            eToolsKraushar systemmgr = new eToolsKraushar();
            try
            {
                List<StockItemByDescription> stockinfo = new List<StockItemByDescription>();
                stockinfo = systemmgr.GetStockItemByDescription(descriptionSearch.Text);
                Response.Cookies["SalesArgs"]["description"] = descriptionSearch.Text.Trim();
                if (stockinfo.Count == 0)
                {
                    FormMessage.Text = "There are no items in stock with that description.";
                    FormMessage.ForeColor = Color.Red;
                }
                else
                {
                    stockNumber.Text = null;
                    DestroyCookie("StockArgs");
                    DescResults.DataSource = stockinfo;
                    DescResults.DataBind();
                }
            }
            catch (Exception ex)
            {
                FormMessage.Text = ex.Message;
                FormMessage.ForeColor = Color.Red;
            }
        }
    }
    protected void DescResults_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow agvrow = DescResults.SelectedRow;
        int stockNumber;
        stockNumber = int.Parse(agvrow.Cells[1].Text.Trim());

        eToolsKraushar systemmgr = new eToolsKraushar();
        try
        {
            List<StockItemByStockNumber> stockinfolist = new List<StockItemByStockNumber>();
            StockItemByStockNumber stockinfo;
            stockinfo = systemmgr.GetStockItemByStockNumber(stockNumber);
            stockinfolist.Add(stockinfo);
            ToolDetails.DataSource = stockinfolist;
            ToolDetails.DataBind();
        }
        catch(Exception ex)
        {
            FormMessage.Text = ex.Message;
            FormMessage.ForeColor = Color.Red;
        }
    }
    protected void AddToCart_Click(object sender, EventArgs e)
    {
        bool valid = true;
        int checkStock;
        int checkSold;
        string quantityTry;

        if (ToolDetails.Rows.Count == 0)
        {
            valid = false;
            FormMessage.Text = "Find an Inventory Item First.";
            FormMessage.ForeColor = Color.Red;
        }

        if (valid)
        {
            quantityTry = (ToolDetails.Rows[4].FindControl("QuantityBox") as TextBox).Text.Trim();
            
            if (!(isInteger(quantityTry)))
            {
                valid = false;
                FormMessage.Text = "Quantity sold must be an integer.";
                FormMessage.ForeColor = Color.Red;
            }
        }

        if (valid)
        {
            checkStock = int.Parse((ToolDetails.Rows[2].Cells[1].Text.Trim()));
            quantityTry = (ToolDetails.Rows[4].FindControl("QuantityBox") as TextBox).Text.Trim();
            checkSold = int.Parse(quantityTry);
            if (checkSold > checkStock)
            {
                valid = false;
                FormMessage.Text = "Quantity Sold cannot be more than Quantity in Stock.";
                FormMessage.ForeColor = Color.Red;
            }

            if (checkSold < 1)
            {
                valid = false;
                FormMessage.Text = "Quantity Sold must be 1 or more.";
                FormMessage.ForeColor = Color.Red;
            }
        }

        if (valid)
        {
            foreach (GridViewRow row in ToolList.Rows)
            {
                if ((int.Parse(ToolDetails.Rows[0].Cells[1].Text.Trim())) == (int.Parse(row.Cells[0].Text.Trim())))
                {
                    valid = false;
                    FormMessage.Text = "That item is already in the cart.  Use the Edit button for that item to make changes.";
                    FormMessage.ForeColor = Color.Red;
                }
            }
        }

        if (valid)
        {
            try
            {
                List<ToolCartData> tools = ToolCart.RetrieveCart();
                tools = ToolCart.AddItem(int.Parse(ToolDetails.Rows[0].Cells[1].Text.Trim()),
                                            ToolDetails.Rows[1].Cells[1].Text.Trim(),
                                            int.Parse(ToolDetails.Rows[2].Cells[1].Text.Trim()),
                                            decimal.Parse(ToolDetails.Rows[3].Cells[1].Text.Trim()),
                                            int.Parse((ToolDetails.Rows[4].FindControl("QuantityBox") as TextBox).Text.Trim()),
                                            tools);
                ToolCart.SaveCart(tools);
                ToolList.DataSource = tools;
                ToolList.DataBind();
                Response.Redirect(Request.RawUrl);
            }
            catch (Exception ex)
            {
                FormMessage.Text = ex.Message;
                FormMessage.ForeColor = Color.Red;
            }
        }
    }
    protected void ToolList_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        List<ToolCartData> tools = ToolCart.RetrieveCart();
        try
        {
            tools = ToolCart.RemoveItem(tools[e.RowIndex].SN, tools);

            if (tools.Count == 0)
            {
                ToolList.DataSource = null;
                ToolList.DataBind();
                ToolCart.DestroyCart();  //cookie no longer needed - empty
            }
            else
            {
                ToolList.DataSource = tools;
                ToolList.DataBind();
                ToolCart.SaveCart(tools);
            }
        }
        catch (Exception ex)
        {
            FormMessage.Text = ex.Message;
            FormMessage.ForeColor = Color.Red;
        }
        Response.Redirect(Request.RawUrl);
    }
    protected void ToolList_RowEditing(object sender, GridViewEditEventArgs e)
    {
        if (ToolList.EditIndex > -1)
        {
            FormMessage.Text = "Please update or cancel current edit row.";
            FormMessage.ForeColor = Color.Red;
        }
        else
        {
            ToolList.EditIndex = e.NewEditIndex;
            List<ToolCartData> tools = ToolCart.RetrieveCart();
            ToolList.DataSource = tools;
            ToolList.DataBind();
        }
    }
    protected void ToolList_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        ToolList.EditIndex = -1;
        List<ToolCartData> tools = ToolCart.RetrieveCart();
        ToolList.DataSource = tools;
        ToolList.DataBind();
    }
    protected void ToolList_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string stockNumber;
        string description;
        string qStock;
        string sellingPrice;
        string qSold;
        bool valid = true;
        int checkStock;
        int checkSold;
        decimal checkPrice;

        GridViewRow agvrow = ToolList.Rows[ToolList.EditIndex];

        stockNumber = agvrow.Cells[0].Text.Trim();
        description = agvrow.Cells[1].Text.Trim();
        qStock = agvrow.Cells[2].Text.Trim();
        sellingPrice = (agvrow.FindControl("PriceEdit") as TextBox).Text.Trim();
        qSold = (agvrow.FindControl("SoldEdit") as TextBox).Text.Trim();

        if (!(isInteger((agvrow.FindControl("SoldEdit") as TextBox).Text.Trim())))
        {
            valid = false;
            FormMessage.Text = "Quantity sold must be an integer.";
            FormMessage.ForeColor = Color.Red;
        }

        if (valid)
        {
            if (!(isDecimal((agvrow.FindControl("PriceEdit") as TextBox).Text.Trim())))
            {
                valid = false;
                FormMessage.Text = "Price must be a number.";
                FormMessage.ForeColor = Color.Red;
            }
        }

        if (valid)
        {
            checkStock = int.Parse(agvrow.Cells[2].Text.Trim());
            checkSold = int.Parse((agvrow.FindControl("SoldEdit") as TextBox).Text.Trim());
            if (checkSold > checkStock)
            {
                valid = false;
                FormMessage.Text = "Quantity Sold cannot be more than Quantity in Stock.";
                FormMessage.ForeColor = Color.Red;
            }
        }

        if (valid)
        {
            checkPrice = decimal.Parse((agvrow.FindControl("PriceEdit") as TextBox).Text.Trim());
            if (checkPrice < 0)
            {
                valid = false;
                FormMessage.Text = "Selling Price must be 0 or more.";
                FormMessage.ForeColor = Color.Red;
            }
        }

        if (valid)
        {
            checkSold = int.Parse((agvrow.FindControl("SoldEdit") as TextBox).Text.Trim());
            if (checkSold < 1)
            {
                valid = false;
                FormMessage.Text = "Quantity Sold must be 1 or more.";
                FormMessage.ForeColor = Color.Red;
            }
        }

        if (valid)
        {
            try
            {
                List<ToolCartData> tools = ToolCart.RetrieveCart();
                tools = ToolCart.UpdateItem(int.Parse(stockNumber),
                                            description,
                                            int.Parse(qStock),
                                            decimal.Parse(sellingPrice),
                                            int.Parse(qSold),
                                            tools);
                ToolCart.SaveCart(tools);
                ToolList.EditIndex = -1;
                ToolList.DataSource = tools;
                ToolList.DataBind();
                Response.Redirect(Request.RawUrl);
            }
            catch (Exception ex)
            {
                FormMessage.Text = ex.Message;
                FormMessage.ForeColor = Color.Red;
            }
        }
    }
    protected void stockNumberAdd_Click(object sender, EventArgs e)
    {
        string stockNumberTry;
        int stockNumberGet;
        eToolsKraushar systemmgr = new eToolsKraushar();
        StockItemByStockNumber stockinfo;
        List<StockItemByStockNumber> stockinfolist = new List<StockItemByStockNumber>();
        stockNumberTry = stockNumber.Text;

        if (isInteger(stockNumberTry))
        {
            try
            {
                stockNumberGet = int.Parse(stockNumber.Text);
                stockinfo = systemmgr.GetStockItemByStockNumber(stockNumberGet);

                if (stockinfo == null)
                {
                    FormMessage.Text = "Stock number not found.";
                    FormMessage.ForeColor = Color.Red;
                }
                else
                {
                    stockinfolist.Add(stockinfo);
                    descriptionSearch.Text = null;
                    DescResults.DataSource = null;
                    DescResults.DataBind();
                    DestroyCookie("SalesArgs");
                    Response.Cookies["StockArgs"]["stocknumber"] = stockNumberTry;
                    ToolDetails.DataSource = stockinfolist;
                    ToolDetails.DataBind();
                }
            }
            catch (Exception ex)
            {
                FormMessage.Text = ex.Message;
                FormMessage.ForeColor = Color.Red;
            }
        }
        else
        {
            FormMessage.Text = "Stock number must be a number.";
            FormMessage.ForeColor = Color.Red;
        }
    }
    protected void DescResults_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        DescResults.PageIndex = e.NewPageIndex;
        descriptionSearchButton_Click(sender, e);
    }

    protected bool isInteger(string testString)
    {
        int number;
        bool result = int.TryParse(testString, out number);
        return result;
    }

    protected bool isDecimal(string testString)
    {
        decimal number;
        bool result = decimal.TryParse(testString, out number);
        return result;
    }

    protected bool isLong(string testString)
    {
        long number;
        bool result = long.TryParse(testString, out number);
        return result;
    }

    protected void updateSubTotal()
    {
        decimal subTotalCount;
        decimal grandTotalCount;
        decimal taxesCount;
        decimal taxAmount;
        taxAmount = 0.05M;
        subTotalCount = 0;
        List<ToolCartData> theCart = ToolCart.RetrieveCart();
        foreach (ToolCartData item in theCart)
        {
            subTotalCount = subTotalCount + (item.SP * item.QSD);
        }
        subTotal.Text = String.Format("{0:F2}",subTotalCount);

        taxesCount = subTotalCount * taxAmount;
        taxes.Text = String.Format("{0:F2}", taxesCount);

        grandTotalCount = subTotalCount + taxesCount;
        grandTotal.Text = String.Format("{0:F2}", grandTotalCount);
    }

    protected void processSale_Click(object sender, EventArgs e)
    {
        string creditString;
        bool valid = true;

        List<ToolCartData> finalSale = ToolCart.RetrieveCart();
        if (finalSale.Count == 0)
        {
            FormMessage.Text = "There are no Items on the sale.";
            FormMessage.ForeColor = Color.Red;
        }
        else
        {
            creditString = creditBox.Text.Trim();
            if (creditString != null && creditString != "")
            {
                if (!(isLong(creditString)))
                {
                    valid = false;
                    FormMessage.Text = "Invalid Card Number.";
                    FormMessage.ForeColor = Color.Red;
                }

                if (valid)
                {
                    if (creditString.Length < 12 || creditString.Length > 16)
                    {
                        valid = false;
                        FormMessage.Text = "Card number must be between 12 and 16 characters.  Do not enter spaces.";
                        FormMessage.ForeColor = Color.Red;
                    }
                }
            }

            if (valid)
            {
                try
                {
                    decimal taxAmountFinal = decimal.Parse(taxes.Text);
                    decimal subTotalFinal = decimal.Parse(subTotal.Text);
                    eToolsKraushar systemmgr = new eToolsKraushar();
                    systemmgr.ProcessToolsSale(taxAmountFinal, subTotalFinal, finalSale);
                    clearDataSources();
                    FormMessage0.ForeColor = Color.Green;
                    FormMessage0.Text = "Sale has been processed.";
                }
                catch (Exception ex)
                {
                    FormMessage.Text = ex.Message;
                    FormMessage.ForeColor = Color.Red;
                }
            }
        }
    }

    protected void clearDataSources()
    {
        ToolCart.DestroyCart();
        DescResults.DataSource = null;
        DescResults.DataBind();
        ToolList.DataSource = null;
        ToolList.DataBind();
        ToolDetails.DataSource = null;
        ToolDetails.DataBind();
        updateSubTotal();
        forceSubTotal();
        DestroyCookie("SalesArgs");
        DestroyCookie("StockArgs");
        descriptionSearch.Text = "";
        stockNumber.Text = "";
    }

    protected void forceSubTotal()
    {
        creditBox.Text = "";
        subTotal.Text = "0";
        taxes.Text = "0";
        grandTotal.Text = "0";
    }

    protected void DestroyCookie(string cookieName)
    {
        if (HttpContext.Current.Request.Cookies[cookieName] != null)
        {
            HttpCookie myCookie = new HttpCookie(cookieName);
            myCookie.Expires = DateTime.Now.AddDays(-1d);
            HttpContext.Current.Response.Cookies.Add(myCookie);
        }
    }
    protected void cancel_Click(object sender, EventArgs e)
    {
        clearDataSources();
    }
}