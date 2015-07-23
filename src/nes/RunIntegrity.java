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

public class RunIntegrity {
	
	
		
		
		
		public static String setchar(String s,String c) throws IOException
		{
			File file = new File(s);
			FileInputStream fis = new FileInputStream(file);
			int l = c.length();
			//c=l+c;
			//System.out.println("New String "+l+c);
			Random r = new Random();
			int pos[]=new int[2];//
			for (int i=0;i<pos.length;i++)
			{
				pos[i]=r.nextInt(5);
				System.out.println(pos[i]);
				c=c+pos[i];
			}
			if (pos[0]>pos[1])
			{
				int k=pos[0];
				pos[0]=pos[1];
				pos[1]=k;
			}
			
			BufferedReader bufferedReader = null;
			BufferedWriter bufferedWriter = null;
			
			bufferedReader = new BufferedReader(new FileReader(s));
	    	bufferedWriter = new BufferedWriter(new FileWriter("C:\\My Files\\Temp\\Integrity.txt"));
	    	int count =0,k=0;
	    	while ((s = bufferedReader.readLine()) != null)
	    	{
	    		if(k==pos.length) k=0;
	    		
	    		if (count == pos[k])
	    		{
	    			String S = s;
	    			bufferedWriter.write(S+c.charAt(0));
	    			count++;
		    		k++;
		    		
	    		}
	    		else{
	    		bufferedWriter.write(s);
	    		count++;
	    		
	    		}
	    		bufferedWriter.newLine();
		        bufferedWriter.flush();
	    	}
	    	
			fis.close();
			return c;
		}
		
}
