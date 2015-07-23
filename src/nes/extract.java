
import java.nio.*;
import java.util.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.io.*;
public class extract
{
   public static void main( String[] args ) throws IOException
    {
    	FileInputStream fileInputStream=null;
        File file = new File("embedaudio2.mp3");
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
        File file3 = new File("result.txt");
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
       
        
        /*
        File destDir = new File("result.txt");
        ZipInputStream zipIn = null;
		try {
			zipIn = new ZipInputStream(new FileInputStream("result.zip"));
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        ZipEntry entry = null;
		try {
			entry = zipIn.getNextEntry();
			 while (entry != null) {
		            String filePath =  entry.getName();
		           try {
							extractFile(zipIn, filePath);
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
		            
		            try {
						zipIn.closeEntry();
						 entry = zipIn.getNextEntry();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
		           
		        }
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        // iterates over entries in the zip file
       
        try {
			zipIn.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
    }
   private static void extractFile(ZipInputStream zipIn, String filePath) throws IOException {
       BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(filePath));
       byte[] bytesIn = new byte[4096];
       int read = 0;
       while ((read = zipIn.read(bytesIn)) != -1) {
           bos.write(bytesIn, 0, read);
       }
       bos.close();*/
   }
}