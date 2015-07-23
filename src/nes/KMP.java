package nes;


import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.Random;
public class KMP
{
    private int []failure;
    private static int c=0;
   // private static String key="";
    public static boolean check(char ch, char xh)
    {
    	if(ch==xh || ch==(char)(xh+32)||ch==(char)(xh-32))
    		return true;
    	else
    		return false;
    }
    public KMP(String text, String pat)
    {
        failure = new int[pat.length()];
        fail(pat);
        int pos = posMatch(text, pat);
        if (pos != -1)
        {    //System.out.println("\nMatch found at index "+ pos);
        	 c++;
        	 while(text.length() > 0)
        	 {
        		 text=text.substring((pos+1));
        		 pos = posMatch(text, pat);
        		 if(pos==-1)
        			 break;
        		 //System.out.println("\nMatch found at index ");
        		 c++;
        	 }
        }
    }
    public KMP() {
		// TODO Auto-generated constructor stub
	}
	private void fail(String pat)
    {
        int n = pat.length();
        failure[0] = -1;
        for (int j = 1; j < n; j++)
        {
            int i = failure[j - 1];
            while (check(pat.charAt(j),pat.charAt(i+1)) && i >= 0)
                i = failure[i];
            if (check(pat.charAt(j),pat.charAt(i+1)))
                failure[j] = i + 1;
            else
                failure[j] = -1;
        }
    }
    private int posMatch(String text, String pat)
    {
        int i = 0, j = 0;
        int lens = text.length();
        int lenp = pat.length();
        while (i < lens && j < lenp)
        {
            if (check(text.charAt(i),pat.charAt(j)))
            {
                i++;
                j++;
            }
            else if (j == 0)
                i++;
            else
                j = failure[j - 1] + 1;
        }
        return ((j == lenp) ? (i - lenp) : -1);
    }
    public static String mainkmp() throws IOException
    {    
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int x = 0;
        String key="";
        {
        	
        	Random r = new Random();
        	int n=3;
        	while(n>0)
        	{	int ch1= r.nextInt(25)+65;
        		int ch2= r.nextInt(25)+97;
        		int ch3=r.nextInt(2);
        		if(ch3==0)
        		{	
        			key+=(char)ch1;
        			//key+=(char)ch2;
        		}
        		else
        		{
        			key+=(char)ch2;
        			//key+=(char)ch1;
        		}
        		n--;
        	}
        	System.out.println("Generated string -> "+key);
        	return key;
        	
        }
    }
}