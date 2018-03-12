package HMS;

import java.util.*;
public class YourNumberMyWord
{
 public static String rt;
  public void pw(int n,String ch)
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
rt = res; 
System.out.print(res);
 }
 
  public static void main(int n)
  {
    

    
    if(n <= 0)  
{                 
      System.out.println("Enter numbers greater than 0");
   }
   else
   {
      YourNumberMyWord a = new YourNumberMyWord();
      
   
      a.pw((n/1000000000)," Hundred");
      a.pw((n/10000000)%100," crore");
      a.pw(((n/100000)%100)," lakh");
      a.pw(((n/1000)%100)," thousand");
      a.pw(((n/100)%10)," hundred");
      a.pw((n%100)," ");
    }
    System.out.println(YourNumberMyWord.rt);
	//return res;
  }
}
