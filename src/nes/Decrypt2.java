
import java.io.*;
public class Decrypt2
{
	public static int alpha [] = new int [26];
	public static void main(String m)throws IOException
	{
		writeDecrypt1(m);
		setFrequency("de1.txt");
		writeDecrypt2();
	}
	public static int maxFrequency()
	{
		int max=0;
		for (int i=0;i<26;i++)
		{
			if(alpha[i]>max)
				max=alpha[i];
		}
		return max;
	}
	public static void setFrequency(String s) throws IOException
	{
		File file = new File(s);
		FileInputStream fis = new FileInputStream(file);
		try
		{
 			int content;
 			while ((content = fis.read()) != -1)
			{
				char ch=(char)content;
				if ((ch>='a'&&ch<='z'))
					alpha[content-97]++;
				else if(ch>='A'&&ch<='Z')
					alpha[content-65]++;
			}
		}
		catch (IOException e) 
		{
			e.printStackTrace();
		}
		fis.close();
	}
	public static void writeDecrypt2()throws IOException
	{
		BufferedReader bufferedReader = null;
    	BufferedWriter bufferedWriter = null;
    	int max, max2;
    	char ch, xh;
    	try 
    	{
    	    bufferedReader = new BufferedReader(new FileReader("de1.txt"));
    	    bufferedWriter = new BufferedWriter(new FileWriter("de2.txt"));
    	    String s = "";
    	    max=maxFrequency();
    	    max2=max;
 			while(max>26)
 				max-=26;
 			while(max2>9)
 				max2-=9;
 			while ((s = bufferedReader.readLine()) != null)
    	    {
    	        for(int i=0;i<s.length();i++)
    	        {
    	        	ch=s.charAt(i);
    	        	if ((ch>='a'&&ch<='z')||(ch>='A'&&ch<='Z'))
    				{
    					xh=(char)(ch-max);
    					if((xh<'a'&&ch>='a'&&ch<='z')||(xh<'A'&&ch>='A'&&ch<='Z'))
    						xh=(char)(xh+26);
    					bufferedWriter.write(xh);
    				}
    	        	else if (ch>='0'&&ch<='9')
    				{
    					xh=(char)(ch-max2);
    					if(xh<'0'&&ch>='0'&&ch<='9')
    						xh=(char)(xh+9);
    					bufferedWriter.write(xh);
    				}
    				else 
    				{
    					bufferedWriter.write(ch);
    				}
    	        }
    	        bufferedWriter.newLine();
    	        bufferedWriter.flush();
    	    }
    	}
    	catch (FileNotFoundException e) 
    	{
    	    e.printStackTrace();
    	}
    	catch (IOException e)
    	{
    	    e.printStackTrace();
    	} 
    	finally
    	{
    	    try
    	    {
				bufferedReader.close();
				bufferedWriter.close();
			}
    	    catch (IOException e)
    	    {
				e.printStackTrace();
			}
    	}
    }
	public static void writeDecrypt1(String st)throws IOException
	{
		BufferedReader bufferedReader2 = null;
    	BufferedWriter bufferedWriter2 = null;
    	char ch;
    	try 
    	{
    	    bufferedReader2 = new BufferedReader(new FileReader("result.txt"));
    	    bufferedWriter2 = new BufferedWriter(new FileWriter("de1.txt"));
    	    String s = "";
    	    while ((s = bufferedReader2.readLine()) != null)
    	    {
    	    	String t="";
    	    	for(int i=0;i<s.length();i++)
    	        {
    	        	ch=s.charAt(i);
    	        	if ((int)ch>122)
    	        		t+=ch;
    				else 
    				{
    					int k=0, j=0;
    					String v="";
    					while(k<t.length())
    					{
    						v+=(char)(t.charAt(k++)-st.charAt(j++));
    						if(j>=st.length())
    							j=0;
    					}
    					v=v+ch;
    					t="";
    					for (int p=0;p<v.length();p++)
    						bufferedWriter2.write(v.charAt(p));
    				}
    	        }
    	    	int k=0, j=0;
				String v="";
				while(k<t.length())
				{
					v+=(char)(t.charAt(k++)-st.charAt(j++));
					if(j>=st.length())
						j=0;
				}
				for (int p=0;p<v.length();p++)
					bufferedWriter2.write(v.charAt(p));
    	    	bufferedWriter2.newLine();
    	        bufferedWriter2.flush();
    	    }
    	}
    	catch (FileNotFoundException e) 
    	{
    	    e.printStackTrace();
    	}
    	catch (IOException e)
    	{
    	    e.printStackTrace();
    	} 
    	finally
    	{
    	    try
    	    {
				bufferedReader2.close();
				bufferedWriter2.close();
			}
    	    catch (IOException e)
    	    {
				e.printStackTrace();
			}
    	}
    }
}
