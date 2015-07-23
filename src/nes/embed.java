
import java.util.*;
import java.util.zip.Deflater;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
import java.io.*;
import java.nio.charset.Charset;
public class embed
{
   public static void main( String fname) 
    {
	   /*
	   
        File file2 = new File("a.zip");
        FileOutputStream fout = null;
		try {
			fout = new FileOutputStream(file2);
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}  
		String file=fname;
		int x=1;
        File f2=null;
        String ff = "a.zip";
        String content = null;
        	try {
        		content = new Scanner(new File(file)).useDelimiter("\\Z").next();
        	} catch (FileNotFoundException e2) {
        		// TODO Auto-generated catch block
        		e2.printStackTrace();
        	}
        	f2 = new File(ff);
            FileOutputStream fout2 = null;
			try {
				fout2 = new FileOutputStream(f2);
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	ZipOutputStream zip = new ZipOutputStream(fout2);  
            zip.setMethod(ZipOutputStream.DEFLATED); 
            zip.setLevel(9); 
        try {
			zip.putNextEntry(new ZipEntry(file));
		} catch (IOException e1) {
			System.out.println("not found");
			e1.printStackTrace();
		} 
        try {
			zip.write(content.getBytes(Charset.forName("UTF-8")));
			zip.closeEntry();
			 zip.close(); 
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}  
        file=ff;
        ff=(String)("a"+x+".zip");
        x++;
        */
       
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
        File file21 = new File("audio.mp3");
        byte[] bFile2 = new byte[(int) file21.length()];
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
        File file3 = new File("embedaudio2.mp3");
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