package HMS;

import java.util.*;
public class YourNumberMyWord
{
 public static String rt;
  public String pw(int n,String ch)
  { 
    String  one[]={" "," one"," two"," three"," four"," five"," six"," seven"," eight"," Nine"," ten"," eleven"," twelve"," thirteen"," fourteen","fifteen"," sixteen"," seventeen"," eighteen"," nineteen"};
 
    String ten[]={" "," "," twenty"," thirty"," forty"," fifty"," sixty","seventy"," eighty"," ninety"};
 
String res="";
	String var;
 if(n > 19) { 
	 var = ten[n/10]+" "+one[n%10];
	 } 
 else { 
var = one[n];	 
 }
 if(n > 0)
res = var + ch;


return res;
 }
 
  public static String main(int n)
  {
    

	  StringBuffer str = new StringBuffer();
    if(n <= 0)  
{                 
      System.out.println("Enter numbers greater than 0");
   }
   else
   {
      YourNumberMyWord a = new YourNumberMyWord();
      
   
      str.append(a.pw((n/1000000000)," Hundred"));
      str.append(a.pw((n/10000000)%100," crore"));
      str.append(a.pw(((n/100000)%100)," lakh"));
      str.append(a.pw(((n/1000)%100)," thousand"));
      str.append(a.pw(((n/100)%10)," hundred"));
      str.append(a.pw((n%100)," "));
    }
    
	return str.toString();
  }
}
