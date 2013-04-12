using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
#region Additional Namespace Requirements
using System.ComponentModel;
using CartEntities;       // CartData definition
using eToolsSystem.BLWF; // Enterprise transaction
using System.Transactions;
#endregion

namespace eToolsSystem.BLWF
{
    internal class ToolAuthority
    {
        public void ProcessToolsSale(decimal taxAmount,
                                     decimal subTotal,
                                     List<ToolCartData> theCart)
        {
            using (TransactionScope scope = new TransactionScope())
            {
                //
                // all code that follows the Using statement and before the .Complete
                // belongs to the transaction. Failure to reach the .Complete will
                // result in an automatic rollback of all work.
                //
                var connect = new eToolsEntities();
                connect.CreateSale("S", null, taxAmount, subTotal);
                foreach (ToolCartData cartItem in theCart)
                {
                    connect.CreateSaleDetail(cartItem.SN,
                                             cartItem.SP,
                                             cartItem.QSD);
                }
                scope.Complete();
            }
        }

        public void ProcessToolsReturn(decimal taxAmount,
                                       decimal subTotal,
                                       int originalSaleNumber,
                                       List<ToolCartData> theCart)
        {
            using (TransactionScope scope = new TransactionScope())
            {
                //
                // all code that follows the Using statement and before the .Complete
                // belongs to the transaction. Failure to reach the .Complete will
                // result in an automatic rollback of all work.
                //
                var connect = new eToolsEntities();
                connect.CreateSale("R", originalSaleNumber, taxAmount, subTotal);
                foreach (ToolCartData cartItem in theCart)
                {
                    connect.CreateReturnDetail(cartItem.SN,
                                               cartItem.SP,
                                               cartItem.QSD);
                                               
                }
                scope.Complete();
            }
        }
    }
}
