package nes;

import java.io.File;

public class Showfiles {

	public static String[] main (String user)
	{
		String Fname[] = new String [100];
		File folder = new File("C:\\My Files\\"+user);
		
		//File folder = new File("\\"+user);
		
		
		
		File[] listOfFiles = folder.listFiles();

		    for (int i = 0; i < listOfFiles.length; i++) {
		      if (listOfFiles[i].isFile()) {
		    	  Fname[i]=listOfFiles[i].getName();
		        System.out.println("File " + listOfFiles[i].getName());
		      } else if (listOfFiles[i].isDirectory()) {
		        System.out.println("Directory " + listOfFiles[i].getName());
		      }
		    }
			return Fname;
	}
}
