package nes;


import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Scanner;
public class EncryptionStart {
	static String date="";
	static String user="";
	static String fname1="";
	static String fname2="";
	static String target="";
	static String filenameunique ="";
	static String desc ="";
	
public EncryptionStart(String user,String fname1,String fname2,String target,String desc ) throws IOException
{
		
        this.filenameunique = KMP.mainkmp();
        System.out.println("file name is "+filenameunique);
        
		this.user=user;
		this.fname1=fname1;
		this.fname2=fname2;
		this.target=target;
		this.desc=desc;
	
}
public EncryptionStart(String user,String filename)
    {
		this.user=user;
		this.filenameunique=filename;
	
	}
	
	public EncryptionStart()
	{
		
	}
	public void enc()throws IOException
	{
		Rsa r = new Rsa();
		String m = null;
		DataServer ds = new DataServer();
		ds.setServer("localhost", 8080);
		ds.setUser("encrypt");
		 
		ds.connect();
		
		ds.setQuery("select sysdate()");
		ds.execute();
		date=ds.row[0][0].substring(0,10);
	    
		KMP k = new KMP();
		m=k.mainkmp();
		
	
		
		String newm="";
		System.out.println("message "+  m);
		//RunIntegrity ri = new RunIntegrity();
		
		//newm=ri.setchar("C:\\My Files\\Temp\\"+fname1,m);
		
		//r.e(newm,date,us);
		r.e(m, date, target, filenameunique,user,desc);
		Encrypt2 en = new Encrypt2();
		en.main(m,fname1,fname2,target,filenameunique);
		
		
	
		System.gc();
	}
	
	public void dec () throws IOException
	{
		System.gc();
		Rsa r = new Rsa();
		String d="";
		//deleteFiles();
		DataServer ds = new DataServer();
		ds.setServer("localhost", 8080);
		ds.setUser("encrypt");
		 
		ds.connect();
		
		ds.setQuery("select sysdate()");
		ds.execute();
		date=ds.row[0][0].substring(0,10);
		
		extract.main(user,filenameunique);	
		d=r.d(user,date,filenameunique);
		System.out.println(d);
		String mess = d;
		System.out.println(mess);
		Decrypt2 de = new Decrypt2();
		try {
			de.main(mess, user);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
		/*CheckIntegrity c = new CheckIntegrity();
		c.main(d,user);*/
		
	}
	public static void main(String[] args)
	{
		System.out.println("Testing");
	}
	/*	public void deleteFiles()
		{
		        System.gc();
		   
		     
		
		File folder = new File("C:\\My Files\\Temp");
		File[] listOfFiles = folder.listFiles();
		for (int i = 0; i < listOfFiles.length; i++)
		{
		      if (listOfFiles[i].isFile())
		      {
		    	  listOfFiles[i].delete();
		      }
		}
		 System.gc();
		
		File w = new File("C:\\My Files\\Temp\\Integrity.txt");
		File x = new File("C:\\My Files\\Temp\\de1.txt");
		File y = new File("C:\\My Files\\Temp\\de2.txt");
		File z = new File("C:\\My Files\\Temp\\result.txt");
		w.delete();
		x.delete();
		
		z.delete();y.delete();
		
	}
	/*
	public static void main(String[] args) throws IOException
	{
		
		DateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		DataServer ds = new DataServer();
		ds.setServer("localhost", 8080);
		ds.setUser("encrypt");
		 
		ds.connect();
		
	
		
		String ts = dateFormat.format(cal.getTime()).toString();
		
		int hour = Integer.parseInt(ts.substring(0, 2));
		if (hour >= 00)
			System.out.println("Need to change Keys");
		System.out.println(hour);
		Rsa r = new Rsa();
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String yes=null;
		String u="",pass=""; int flag=0;
		System.out.print("Login ");
		
		
			do
			{
				flag=0;
			System.out.print("Enter id and pass");
			u=br.readLine();
			pass=br.readLine();
			ds.setQuery("select * from login");
			ds.execute();
			for (int i=0;i<ds.rowCount;i++)
			{
				if (u.equals(ds.row[i][0]) && pass.equals(ds.row[i][1]))
					{flag=1;break;}
				else {System.out.println("Problem. Enter again with "+u+" "+pass);}
			}
			}while(flag==0);
			
			ds.setQuery("select sysdate()");
			ds.execute();
			date=ds.row[0][0].substring(0,10);
			
			r.generateKeys(u);
		//else if(yes.equals("No")||(yes.equals("N"))||yes.equals("NO"))
	
			System.out.println("I want to encrypt (Yes/No)");
		
		try {
			yes = br.readLine();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(yes.equals("Yes")||(yes.equals("Y"))||yes.equals("YES"))
		{
			
			 
				System.out.println("target user id ");
				String us = br.readLine();
			
				String m = null;
				
			
				KMP k = new KMP();
				m=k.mainkmp();
				
				String newm="";
				System.out.println("message "+  m);
				RunIntegrity ri = new RunIntegrity();
				newm=ri.setchar("dictfile.txt",m);
				
				r.e(newm,date,us);
				//r.e(m);
				Encrypt2 en = new Encrypt2();
				en.main(m,fname2);
				File x = new File("out1.txt");
				File y = new File("out2.txt");
				x.delete();
				y.delete();
			
			}
			
		
			
		
		else if(yes.equals("No"))
		{
			
			
			String d="";
			
			
			extract.main(args);	
			d=r.d(u,date,"dictfile.txt");
			//System.out.println("Please enter decrypted key string again ");
			String mess = d.substring(0,3);
			System.out.println(mess);
			Decrypt2 de = new Decrypt2();
			try {
				de.main(mess);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    
			CheckIntegrity c = new CheckIntegrity();
			c.main(d);
			File w = new File("Integrity.txt");
			File x = new File("de1.txt");
			File y = new File("de2.txt");
			File z = new File("result.txt");
			w.delete();
			x.delete();
			
			z.delete();y.delete();
		}
	}
	*/

	
	public void newuser(String N, String P,String user,String E,String DOB,String Phone)
	{
		DataServer ds = new DataServer();
		ds.setServer("localhost", 8080);
		ds.setUser("encrypt");
		 
		ds.connect();
		
		ds.setQuery("insert into login values ('"+user+"','"+P+"','"+N+"','"+E+"','"+DOB+"','"+Phone+"')");
		ds.execute();
		ds.disconnect();
		
	}
	public void changedetails(String Pass,String Email,String Phone)
    {
		DataServer ds = new DataServer();
		ds.setServer("localhost", 8080);
		ds.setUser("encrypt");
		ds.connect();
		ds.setQuery("");
		ds.execute();
		ds.disconnect();
		
    }
}

	

