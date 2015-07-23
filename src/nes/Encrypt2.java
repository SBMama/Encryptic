package nes;

import java.io.*;
public class Encrypt2
{
	public static int alpha [] = new int [26];
	public static void main(String m,String file,String audio,String t,String funique)throws IOException
	{
		String s="C:\\My Files\\Temp\\"+file;
		setFrequency(s);
		writeEncrypt1(s);
		writeEncrypt2(m,audio,t,funique);
	}
	public static int maxFrequency()
	{
		int max=0, pos=0;
		for (int i=0;i<26;i++)
		{
			if(alpha[i]>max)
			{	max=alpha[i];
				pos=i;
			}
		}
		System.out.println((char)(pos+65));
		return max;
	}
	public static void setFrequency(String s) throws IOException
	{
		int i=0;
		for(i=0;i<26;i++)
		{
			alpha[i]=0;
		}
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
	public static void writeEncrypt1(String st)throws IOException
	{
		BufferedReader bufferedReader = null;
    	BufferedWriter bufferedWriter = null;
    	int max;
    	char ch, xh;
    	try
    	{
    	    bufferedReader = new BufferedReader(new FileReader(st));
    	    bufferedWriter = new BufferedWriter(new FileWriter("C:\\My Files\\Temp\\out1.txt"));
    	    String s = "";
    	    max=maxFrequency();
    	    while(max>26)
 				max-=26;
 			System.out.println(max);
 			while ((s = bufferedReader.readLine()) != null)
    	    {
    	        for(int i=0;i<s.length();i++)
    	        {
    	        	ch=s.charAt(i);
    	        	if ((ch>='a'&&ch<='z')||(ch>='A'&&ch<='Z'))
    				{
    					xh=(char)(ch+max);
    					if((xh>'z'&&ch>='a'&&ch<='z')||(xh>'Z'&&ch>='A'&&ch<='Z'))
    						xh=(char)(xh-26);
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
	public static void writeEncrypt2(String st,String audio,String target,String funique)throws IOException
	{
		BufferedReader bufferedReader2 = null;
    	BufferedWriter bufferedWriter2 = null;
    	char ch;
    	try
    	{
    	    bufferedReader2 = new BufferedReader(new FileReader("C:\\My Files\\Temp\\out1.txt"));
    	    bufferedWriter2 = new BufferedWriter(new FileWriter("C:\\My Files\\Temp\\out2.txt"));
    	    String s = "";
    	    while ((s = bufferedReader2.readLine()) != null)
    	    {
    	    	String t="";
    	    	int flag=0;
    	    	for(int i=0;i<s.length();i++)
    	        {
    	        	ch=s.charAt(i);
    	        	if ((ch>='a'&&ch<='z')||(ch>='A'&&ch<='Z'))
    	        		t+=ch;
    				else
    				{
    					flag=1;
    					int k=0, j=0;
    					String v="";
    					while(k<t.length())
    					{
    						v+=(char)(t.charAt(k++)+st.charAt(j++));
    						if(j>=st.length())
    							j=0;
    					}
    					v=v+ch;
    					t="";
    					for (int p=0;p<v.length();p++)
    						bufferedWriter2.write(v.charAt(p));
    				}
    	        }
    	    	//if(flag==0)
    	    	{
    	    		int k=0, j=0;
					String v="";
					while(k<t.length())
					{
						v+=(char)(t.charAt(k++)+st.charAt(j++));
						if(j>=st.length())
							j=0;
					}
					for (int p=0;p<v.length();p++)
						bufferedWriter2.write(v.charAt(p));
    	    	}
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
				embed.main("C:\\My Files\\Temp\\out2.txt",audio,target,funique);

			}
    	    catch (IOException e)
    	    {
				e.printStackTrace();
			}
    	}
    }
}
