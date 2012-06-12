using System;
using System.Text.RegularExpressions;
using System.Web.UI;


public partial class _Default : System.Web.UI.Page 
{
//  Create a String to store our search results
private string SearchString = "";
protected void Page_Load(object sender, EventArgs e)
{

}
public string HighlightText(string InputTxt)
{
string Search_Str = txtSearch.Text;
// Setup the regular expression and add the Or operator.
Regex RegExp = new Regex(Search_Str.Replace(" ", "|").Trim(), RegexOptions.IgnoreCase);
// Highlight keywords by calling the 
//delegate each time a keyword is found.
return RegExp.Replace(InputTxt, new MatchEvaluator(ReplaceKeyWords));
}

public string ReplaceKeyWords(Match m)
{
return ("<span class=highlight>" + m.Value + "</span>");
}
protected void btnSearch_Click(object sender, ImageClickEventArgs e)
{
//  Set the value of the SearchString so it gets
SearchString = txtSearch.Text;
}
protected void btnClear_Click(object sender, ImageClickEventArgs e)
{
//  Simple clean up text to return the Gridview to it's default state
txtSearch.Text = "";
SearchString = "";
gvDetails.DataBind();
}
}
