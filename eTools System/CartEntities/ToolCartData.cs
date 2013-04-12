using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
#region additional namespace requirements
using System.Data;
using System.Text;
#endregion

namespace CartEntities
{
    [Serializable]
    public class ToolCartData
    {
        //member data
        public int SN { get; set; } //stock number
        public string DSC { get; set; } //description
        public int QST { get; set; } //quantity in stock
        public decimal SP { get; set; } //selling price
        public int QSD { get; set; } //quantity sold

        //default constructor
        public ToolCartData()
        {
        }

        //greedy constructor
        public ToolCartData(int inSN,
                            string inDSC,
                            int inQST,
                            decimal inSP,
                            int inQSD)
        {
            SN = inSN;
            DSC = inDSC;
            QST = inQST;
            SP = inSP;
            QSD = inQSD;
        }
    }
}
