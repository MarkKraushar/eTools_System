using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
#region Additional Reference Requirements
using System.Data;
using System.Drawing;
using System.Globalization;
using eToolsSystem;
using CartEntities;
#endregion

public partial class eToolsReturns : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        FormMessage.Text = "";
        FormMessage.ForeColor = Color.Black;
        FormMessage0.Text = "";
        FormMessage0.ForeColor = Color.Black;
        updateSubTotal();

        if (ReturnCart.CookieExist() && (!Page.IsPostBack))
        {
            List<ToolCartData> tools = ReturnCart.RetrieveCart();
            ToolList.DataSource = tools;
            ToolList.DataBind();
        }

        if (!(HttpContext.Current.Request.Cookies["ReturnArgs"] == null) && (!Page.IsPostBack))
        {
            saleNumber.Text = HttpContext.Current.Request.Cookies["ReturnArgs"]["OriginalSaleNumber"].Trim();
            saleNumberAdd_Click(sender, e);
        }
    }
    protected void saleNumberAdd_Click(object sender, EventArgs e)
    {
        string saleNumberTry;
        int saleNumberGet;
        saleNumberTry = saleNumber.Text;

        if (isInteger(saleNumberTry))
        {
            try
            {
                eToolsKraushar systemmgr = new eToolsKraushar();
                List<SaleDetailsBySaleNumber> saleinfolist = new List<SaleDetailsBySaleNumber>();
                List<ReturnDetailsByOriginalSaleNumber> returninfolist = new List<ReturnDetailsByOriginalSaleNumber>();
                saleNumberGet = int.Parse(saleNumber.Text);
                saleinfolist = systemmgr.GetSaleDetailsBySaleNumber(saleNumberGet);

                if (saleinfolist.Count == 0)
                {
                    FormMessage.Text = "Sale number not found.";
                    startOver();
                    FormMessage.ForeColor = Color.Red;
                }
                else
                {
                    Response.Cookies["ReturnArgs"]["OriginalSaleNumber"] = saleNumber.Text.Trim();
                    originalSaleNumber.Text = saleNumber.Text.Trim();
                    returninfolist = systemmgr.GetReturnDetailsByOriginalSaleNumber(saleNumberGet);
                    if (returninfolist.Count == 0)
                    {
                        FormMessage.Text = "No returns have been made on this sale.";
                    }
                    else
                    {
                        ReturnDetails.DataSource = returninfolist;
                        ReturnDetails.DataBind();
                    }
                    SaleDetails.DataSource = saleinfolist;
                    SaleDetails.DataBind();
                }
            }
            catch (Exception ex)
            {
                FormMessage.Text = ex.Message;
                FormMessage.Text = "Sale number not found.";
                startOver();
                FormMessage.ForeColor = Color.Red;
            }
        }
        else
        {
            FormMessage.Text = "Sale number must be a number.";
            startOver();
            FormMessage.ForeColor = Color.Red;
        }
    }

    protected bool isInteger(string testString)
    {
        int number;
        bool result = int.TryParse(testString, out number);
        return result;
    }
    protected void SaleDetails_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow agvrow = SaleDetails.SelectedRow;
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
        catch (Exception ex)
        {
            FormMessage.Text = ex.Message;
            FormMessage.ForeColor = Color.Red;
        }
    }

    protected void AddToCart_Click(object sender, EventArgs e)
    {
        bool valid = true;
        int checkOriginalSale = 0;
        int checkReturns = 0;
        int checkReturned;
        string quantityTry;

        if (ToolDetails.Rows.Count == 0)
        {
            valid = false;
            FormMessage.Text = "Find a sale item First.";
            FormMessage.ForeColor = Color.Red;
        }

        if (valid)
        {
            foreach (GridViewRow row in ReturnDetails.Rows)
            {
                if ((int.Parse(row.Cells[0].Text.Trim())) == (int.Parse(ToolDetails.Rows[0].Cells[1].Text.Trim())))
                {
                    checkReturns = int.Parse(row.Cells[2].Text.Trim());
                    break;
                }
            }

            foreach (GridViewRow row in SaleDetails.Rows)
            {
                if ((int.Parse(row.Cells[1].Text.Trim())) == (int.Parse(ToolDetails.Rows[0].Cells[1].Text.Trim())))
                {
                    checkOriginalSale = int.Parse(row.Cells[4].Text.Trim());
                    break;
                }
            }
        }

        if (valid)
        {
            quantityTry = (ToolDetails.Rows[4].FindControl("QuantityBox") as TextBox).Text.Trim();

            if (!(isInteger(quantityTry)))
            {
                valid = false;
                FormMessage.Text = "Quantity returned must be an integer.";
                FormMessage.ForeColor = Color.Red;
            }
        }

        if (valid)
        {
            quantityTry = (ToolDetails.Rows[4].FindControl("QuantityBox") as TextBox).Text.Trim();
            checkReturned = int.Parse(quantityTry);
            if (checkReturned > (checkOriginalSale - checkReturns))
            {
                valid = false;
                FormMessage.Text = "Quantity Returned exceeds original sale.";
                FormMessage.ForeColor = Color.Red;
            }

            if (checkReturned < 1)
            {
                valid = false;
                FormMessage.Text = "Quantity Returned must be 1 or more.";
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
                List<ToolCartData> tools = ReturnCart.RetrieveCart();
                tools = ReturnCart.AddItem(int.Parse(ToolDetails.Rows[0].Cells[1].Text.Trim()),
                                            ToolDetails.Rows[1].Cells[1].Text.Trim(),
                                            int.Parse(ToolDetails.Rows[2].Cells[1].Text.Trim()),
                                            decimal.Parse(ToolDetails.Rows[3].Cells[1].Text.Trim()),
                                            int.Parse((ToolDetails.Rows[4].FindControl("QuantityBox") as TextBox).Text.Trim()),
                                            tools);
                ReturnCart.SaveCart(tools);
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

    protected void updateSubTotal()
    {
        decimal subTotalCount;
        decimal grandTotalCount;
        decimal taxesCount;
        decimal taxAmount;
        taxAmount = 0.05M;
        subTotalCount = 0;
        List<ToolCartData> theCart = ReturnCart.RetrieveCart();
        foreach (ToolCartData item in theCart)
        {
            subTotalCount = subTotalCount + (item.SP * item.QSD);
        }
        subTotal.Text = String.Format("{0:F2}", subTotalCount);

        taxesCount = subTotalCount * taxAmount;
        taxes.Text = String.Format("{0:F2}", taxesCount);

        grandTotalCount = subTotalCount + taxesCount;
        grandTotal.Text = String.Format("{0:F2}", grandTotalCount);
    }

    protected void startOver()
    {
        ReturnCart.DestroyCart();
        DestroyCookie("ReturnArgs");
        SaleDetails.DataSource = null;
        ReturnDetails.DataSource = null;
        ToolDetails.DataSource = null;
        SaleDetails.DataBind();
        ReturnDetails.DataBind();
        ToolDetails.DataBind();
        ToolList.DataSource = null;
        ToolList.DataBind();
        forceSubTotal();
        saleNumber.Text = "";
    }

    protected void forceSubTotal()
    {
        originalSaleNumber.Text = "";
        subTotal.Text = "0";
        taxes.Text = "0";
        grandTotal.Text = "0";
    }

    protected bool isDecimal(string testString)
    {
        decimal number;
        bool result = decimal.TryParse(testString, out number);
        return result;
    }

    protected void ToolList_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        ToolList.EditIndex = -1;
        List<ToolCartData> tools = ReturnCart.RetrieveCart();
        ToolList.DataSource = tools;
        ToolList.DataBind();
    }
    protected void ToolList_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        List<ToolCartData> tools = ReturnCart.RetrieveCart();
        try
        {
            tools = ReturnCart.RemoveItem(tools[e.RowIndex].SN, tools);

            if (tools.Count == 0)
            {
                ToolList.DataSource = null;
                ToolList.DataBind();
                ReturnCart.DestroyCart();  //cookie no longer needed - empty
            }
            else
            {
                ToolList.DataSource = tools;
                ToolList.DataBind();
                ReturnCart.SaveCart(tools);
            }
        }
        catch (Exception ex)
        {
            FormMessage.Text = ex.Message;
            FormMessage.ForeColor = Color.Red;
        }
        Response.Redirect(Request.RawUrl);
    }
    protected void ToolList_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string stockNumber;
        string description;
        string qStock = "0";
        string sellingPrice;
        string qSold;
        bool valid = true;
        int checkOriginalSale = 0;
        int checkReturns = 0;
        int checkSold;
        decimal checkPrice = 0;

        GridViewRow agvrow = ToolList.Rows[ToolList.EditIndex];

        stockNumber = agvrow.Cells[0].Text.Trim();
        description = agvrow.Cells[1].Text.Trim();
        sellingPrice = (agvrow.FindControl("PriceEdit") as TextBox).Text.Trim();
        qSold = (agvrow.FindControl("SoldEdit") as TextBox).Text.Trim();

        if (!(isInteger((agvrow.FindControl("SoldEdit") as TextBox).Text.Trim())))
        {
            valid = false;
            FormMessage.Text = "Quantity returned must be an integer.";
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
            checkPrice = decimal.Parse((agvrow.FindControl("PriceEdit") as TextBox).Text.Trim());
            if (checkPrice < 0)
            {
                valid = false;
                FormMessage.Text = "Return Price must be 0 or more.";
                FormMessage.ForeColor = Color.Red;
            }
        }

        if (valid)
        {
            checkSold = int.Parse((agvrow.FindControl("SoldEdit") as TextBox).Text.Trim());
            if (checkSold < 1)
            {
                valid = false;
                FormMessage.Text = "Quantity Returned must be 1 or more.";
                FormMessage.ForeColor = Color.Red;
            }
        }

        if (valid)
        {
            foreach (GridViewRow row in ReturnDetails.Rows)
            {
                if ((int.Parse(row.Cells[0].Text.Trim())) == (int.Parse(stockNumber)))
                {
                    checkReturns = int.Parse(row.Cells[2].Text.Trim());
                    break;
                }
            }

            foreach (GridViewRow row in SaleDetails.Rows)
            {
                if ((int.Parse(row.Cells[1].Text.Trim())) == (int.Parse(stockNumber)))
                {
                    checkOriginalSale = int.Parse(row.Cells[4].Text.Trim());
                    break;
                }
            }

            if ((int.Parse(qSold)) > (checkOriginalSale - checkReturns))
            {
                valid = false;
                FormMessage.Text = "Quantity Returned exceeds original sale.";
                FormMessage.ForeColor = Color.Red;
            }
        }

        if (valid)
        {
            try
            {
                List<ToolCartData> tools = ReturnCart.RetrieveCart();
                tools = ReturnCart.UpdateItem(int.Parse(stockNumber),
                                              description,
                                              int.Parse(qStock),
                                              decimal.Parse(sellingPrice),
                                              int.Parse(qSold),
                                              tools);
                ReturnCart.SaveCart(tools);
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
            List<ToolCartData> tools = ReturnCart.RetrieveCart();
            ToolList.DataSource = tools;
            ToolList.DataBind();
        }
    }
    protected void processSale_Click(object sender, EventArgs e)
    {
        List<ToolCartData> finalSale = ReturnCart.RetrieveCart();
        if (finalSale.Count == 0)
        {
            FormMessage.Text = "There are no Items on the sale.";
            FormMessage.ForeColor = Color.Red;
        }
        else
        {
            try
            {
                decimal taxAmountFinal = decimal.Parse(taxes.Text.Trim());
                decimal subTotalFinal = decimal.Parse(subTotal.Text.Trim());
                int oSaleNumber = int.Parse(originalSaleNumber.Text.Trim());
                eToolsKraushar systemmgr = new eToolsKraushar();
                systemmgr.ProcessToolsReturn(taxAmountFinal,
                                             subTotalFinal,
                                             oSaleNumber,
                                             finalSale);
                startOver();
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
        startOver();
    }
}