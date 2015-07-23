package nes;


import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Random;

public class CheckIntegrity {
	
	
		
		public static void main(String m,String user)throws IOException
		{
			String c=m;
			System.out.println("Starting  ");
			String s="C:\\My Files\\Temp\\de2.txt";
			getchar(s,c,user);
		//	writeEncrypt2(c);
		}
		
		public static void getchar(String s,String c,String user) throws IOException
		{
			System.out.println("getchar ");
			File file = new File(s);
			FileInputStream fis = new FileInputStream(file);
		    System.out.println("Final "+c);
			BufferedReader bufferedReader = null;
			BufferedWriter bufferedWriter = null;
			
			bufferedReader = new BufferedReader(new FileReader(s));
	    	bufferedWriter = new BufferedWriter(new FileWriter("C:\\My Files\\"+user+"\\IntegrityChecked.txt"));
	    	
	    	String inte=c.substring(3);
	    	System.out.println(" "+inte);
	    	int n = Integer.parseInt(inte);
	    	int pos[]=new int[2];
	    	for (int i=0;i<pos.length;i++)
	    	{	
	    		pos[i]=n%10;
	    		n=n/10;
	    		
	    	}
	    	int count =0,k=0;
	    	String st="";
	    	while ((st = bufferedReader.readLine()) != null)
	    	{
	    		k=0;
	    		for (int i=0;i<pos.length;i++)
	    		{
	    			
	    			if (count == pos[i]){
	    				System.out.println("count "+count +" pos[i] "+pos[i] );
	    				System.out.println(st);
	    				if ((st.charAt(st.length()-1)!=c.charAt(0))) {
	    					System.out.println("Not integral");
	    					break;
	    				}
	    				else
	    				{
	    					bufferedWriter.write(st.substring(0, st.length()-1));
	    					k=1;
	    					System.out.println( st.substring(0, st.length()-1));
	    					
	    					bufferedWriter.newLine();
	    					k=1;
	    					
	    					//st=bufferedReader.readLine();
	    					System.out.println(st);
	    					
	    					
	    				}
	    				
	    			}
	    			
	    		}
	    			
		    				
		    			//	bufferedReader.readLine();
		    				
		    				count++;
		    				if(k!=1)
		    				{
		    					bufferedWriter.write(st);
		    					bufferedWriter.newLine();
		    				}
		    				
		    			
	    			
	    		}
	    		//bufferedWriter.write(st);
	    		//bufferedWriter.newLine();
	    			/*else
	    			{
	    				bufferedWriter.write(st);
	    				bufferedWriter.newLine();
	    			}
	    			*/
	    		
	    	
	    	//bufferedWriter.newLine();
		    bufferedWriter.flush();
	    	
	    	
			fis.close();
		}
		
}
