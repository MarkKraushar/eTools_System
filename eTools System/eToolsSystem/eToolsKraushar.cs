using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
#region Additional Namespace Requirements
using System.ComponentModel;
using CartEntities;       // CartData definition
using eToolsSystem.BLWF; // Enterprise transaction
#endregion

namespace eToolsSystem
{
    public class eToolsKraushar
    {
        #region Sales
        public void ProcessToolsSale(decimal taxAmount,
                                     decimal subTotal,
                                     List<ToolCartData> theCart)
        {
            ToolAuthority blwfprovider = new ToolAuthority();
            blwfprovider.ProcessToolsSale(taxAmount, subTotal, theCart);
        }

        public void ProcessToolsReturn(decimal taxAmount,
                                       decimal subTotal,
                                       int originalSaleNumber,
                                       List<ToolCartData> theCart)
        {
            ToolAuthority blwfprovider = new ToolAuthority();
            blwfprovider.ProcessToolsReturn(taxAmount, subTotal, originalSaleNumber, theCart);
        }

        public List<SaleDetailsBySaleNumber> GetSaleDetailsBySaleNumber(int salenumber)
        {
            List<SaleDetailsBySaleNumber> saleItems = new List<SaleDetailsBySaleNumber>();
            var connect = new eToolsEntities();
            saleItems = connect.GetSaleDetailsBySaleNumber(salenumber).ToList<SaleDetailsBySaleNumber>();
            return saleItems;
        }

        public List<ReturnDetailsByOriginalSaleNumber> GetReturnDetailsByOriginalSaleNumber(int osalenumber)
        {
            List<ReturnDetailsByOriginalSaleNumber> saleItems = new List<ReturnDetailsByOriginalSaleNumber>();
            var connect = new eToolsEntities();
            saleItems = connect.GetReturnDetailsByOriginalSaleNumber(osalenumber).ToList<ReturnDetailsByOriginalSaleNumber>();
            return saleItems;
        }
        #endregion

        #region Stock
        public List<StockItemByDescription> GetStockItemByDescription(string desc)
        {
            List<StockItemByDescription> stockItems = new List<StockItemByDescription>();
            var connect = new eToolsEntities();
            stockItems = connect.GetStockItemByDescription(desc).ToList<StockItemByDescription>();
            return stockItems;
        }

        public StockItemByStockNumber GetStockItemByStockNumber(int stocknumber)
        {
            StockItemByStockNumber result;
            var connect = new eToolsEntities();
            result = connect.GetStockItemByStockNumber(stocknumber).FirstOrDefault<StockItemByStockNumber>();
            return result;
        }
        #endregion
    }
}
