package nes;

import java.util.*;
import java.util.zip.Deflater;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
import java.io.*;
import java.nio.charset.Charset;
public class embed
{
	
	
	public String user ="";
	//EncryptionStart obj = new EncryptionStart();
	//user=obj.user;
   public static void main(String fname,String music,String target,String funique) throws IOException 
    {
	   
	   FileInputStream fileInputStream=null;
       File files = new File(fname);
        int length = (int) files.length();
        byte[] bFile = new byte[length];
        try 
        {
            fileInputStream = new FileInputStream(files);
            fileInputStream.read(bFile);
            fileInputStream.close();
 	    }
        catch(Exception e)
        {
        	e.printStackTrace();
        }
        FileInputStream fileInputStream2=null;
        
        File file21 = new File("C:\\My Files\\Temp\\"+music);
       
        //File file21 = new File("\\Temp\\"+music);
        
        
        
        int length2 = (int) file21.length();
       
        byte[] bFile2 = new byte[length2];
        try 
        {
            fileInputStream2 = new FileInputStream(file21);
            fileInputStream2.read(bFile2);
            fileInputStream2.close();
 	    }
        catch(Exception e)
        {
        	e.printStackTrace();
        }
        File file3 = new File("C:\\My Files\\"+target+"\\"+funique+".mp3");
        
        //File file3 = new File("\\"+target+"\\"+funique+".mp3");
        
        
        
        FileOutputStream fos = null;
        int k=100;
        Random ra = new Random();
        int x1 = 1;
        bFile2[k]=(byte)x1;
        k=k+x1;
        for (int i = 0; i < 4; i++, k+=x1)
        {
            bFile2[k] = (byte)(length >>> (i * 8));
        }
        for(int i=0;i<length;i++,k+=x1)
        {
            bFile2[k]=bFile[i];
        }
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