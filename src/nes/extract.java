package nes;

import java.nio.*;
import java.util.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.io.*;
public class extract
{
   public static void main( String user,String funique ) throws IOException
    {
    	FileInputStream fileInputStream=null;
    	System.out.println(funique);
    	File file = new File("C:\\My Files\\"+user+"\\"+funique+".mp3");
        
    	 //File file = new File("\\"+user+"\\"+funique+".mp3");
         
    	
    	
    	byte[] bFile = new byte[(int) file.length()];
        try 
        {
            fileInputStream = new FileInputStream(file);
            fileInputStream.read(bFile);
            fileInputStream.close();
 	    }
        catch(Exception e)
        {
        	e.printStackTrace();
        }
        int k=100;
        int x = bFile[k];
        k=k+x;
        byte b [] = new byte [4];
        for(int i=0;i<4;i++,k+=x)
        {
            b[i]=bFile[k];
        }
        ByteBuffer bb = ByteBuffer.wrap(b);
        bb.order(ByteOrder.LITTLE_ENDIAN);
        int l = bb.getInt();
        System.out.println(l+ " "+ k);
        byte bFile2[] = new byte [l];
        for(int i=0;i<l;i++,k+=x)
        {
            bFile2[i]=bFile[k];
        }
        File file3 = new File("C:\\My Files\\"+user+"\\result.txt");
        

        //File file3 = new File("\\"+user+"\\result.txt");
        
        
        FileOutputStream fos = null;
        try 
        {
            fos = new FileOutputStream(file3);
            fos.write(bFile2);
            fos.close();
 	    }
        catch(Exception e)
        {
        	e.printStackTrace();
        }
       
        
    
   }
}