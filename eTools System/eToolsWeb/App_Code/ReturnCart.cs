#region Default Namespaces
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
#endregion
#region Additional Namespace Requirements
using System.Text;
using CartEntities;
#endregion
/// <summary>
/// Summary description for ToolCart
/// </summary>
public class ReturnCart
{
    public static List<ToolCartData> RetrieveCart()
    {
        List<ToolCartData> theCart;
        if (ReturnCart.CookieExist())
        {
            try
            {
                string XMLCartString = HttpContext.Current.Request.Cookies["ReturnCart"].Value;
                System.Xml.Serialization.XmlSerializer serializer = new System.Xml.Serialization.XmlSerializer(typeof(List<ToolCartData>));
                theCart = (List<ToolCartData>)serializer.Deserialize(new System.Xml.XmlTextReader(new System.IO.StringReader(XMLCartString)));
            }
            catch (Exception ex)
            {
                throw new Exception("Error loading Tool Cart. Error : " + ex.ToString());
            }
        }
        else
        {
            theCart = new List<ToolCartData>();
        }
        return theCart;
    }

    public static void SaveCart(List<ToolCartData> theCart)
    {
        // convert (serialize) the List<T> into an XML string
        System.Text.StringBuilder XMLCart = new System.Text.StringBuilder();
        System.IO.StringWriter XMLCartStream = new System.IO.StringWriter(XMLCart);
        System.Xml.Serialization.XmlSerializer serializer = new System.Xml.Serialization.XmlSerializer(theCart.GetType());
        serializer.Serialize(XMLCartStream, theCart);

        // compress the XML string character-by-character
        System.Text.StringBuilder XMLCompressedCart = new System.Text.StringBuilder();
        // step through the string, obtain a character, test and act accordingly
        for (int i = 0; i < XMLCart.Length; i++)
        {
            char c = XMLCart[i];
            if (!(char.IsControl(c)))// || char.IsWhiteSpace(c)
            {
                XMLCompressedCart.Append(c);
            }
        }
        // place the XML string into the cookie
        HttpContext.Current.Response.Cookies.Add(new HttpCookie("ReturnCart", XMLCompressedCart.ToString()));
    }

    public static List<ToolCartData> AddItem(int inSN,
                                             string inDSC,
                                             int inQST,
                                             decimal inSP,
                                             int inQSD,
                                             List<ToolCartData> theCart)
    {
        ToolCartData cartItem = new ToolCartData();
        cartItem.SN = inSN;
        cartItem.DSC = inDSC;
        cartItem.QST = inQST;
        cartItem.SP = inSP;
        cartItem.QSD = inQSD;
        theCart.Add(cartItem);
        return theCart;
    }

    public static List<ToolCartData> UpdateItem(int inSN,
                                                string inDSC,
                                                int inQST,
                                                decimal inSP,
                                                int inQSD,
                                                List<ToolCartData> theCart)
    {
        int itemIndex = theCart.FindIndex(item => item.SN == inSN);

        theCart[itemIndex].DSC = inDSC;
        theCart[itemIndex].QST = inQST;
        theCart[itemIndex].SP = inSP;
        theCart[itemIndex].QSD = inQSD;
        return theCart;
    }

    public static List<ToolCartData> RemoveItem(int stockNumber,
                                                List<ToolCartData> theCart)
    {
        int itemIndex = theCart.FindIndex(item => item.SN == stockNumber);
        theCart.RemoveAt(itemIndex);
        return theCart;
    }

    public static void DestroyCart()
    {
        HttpCookie aCookie = new HttpCookie("ReturnCart");
        aCookie.Expires = DateTime.Today.AddDays(-30);
        HttpContext.Current.Response.Cookies.Add(aCookie);
    }

    //Use this function to see if session cookie is present... 
    public static Boolean CookieExist()
    {
        return (HttpContext.Current.Request.Cookies["ReturnCart"] != null);
    }
    Boolean IsSupportingSessionCookies()
    {
        return (!(HttpContext.Current.Request.Cookies["ASP.NET_SessionId"] == null));
    }
    //Use these functions to support special characters in session cookies
    public static string FromEncodedCookie(string s)
    {
        return Encoding.UTF8.GetString(Convert.FromBase64String(HttpUtility.UrlDecode(s)));
    }

    public static string ToEncodedCookie(string s)
    {
        return HttpUtility.UrlEncode(Convert.ToBase64String(Encoding.UTF8.GetBytes(s)));
    }
}