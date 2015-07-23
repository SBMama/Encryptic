package nes;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.Scanner;


public class Rsa {
private static BigInteger n;

private static BigInteger d;

private static BigInteger e;

private static int bitlen = 512;

private static BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

private static DataServer ds = new DataServer();
  public Rsa(BigInteger newn, BigInteger newe) {
    n = newn;
    e = newe;
  }


  public Rsa() {
	// TODO Auto-generated constructor stub
}

/** Encrypt the given plaintext message. */
  public static String encrypt(String message) {
    return (new BigInteger(message.getBytes())).modPow(e, n).toString();
  }

  /** Encrypt the given plaintext message. */
  public static BigInteger encrypt(BigInteger message) {
    return message.modPow(e, n);
  }

  /** Decrypt the given ciphertext message. */


  /** Decrypt the given ciphertext message. */
  public static  BigInteger decrypt(BigInteger message,BigInteger d1,BigInteger n1) {
	  //System.out.println("Key "+d);
    return message.modPow(d1,n1);
  }

  public static void e (String text,String date,String target, String f,String user,String desc)
  {
	  
	String text1=text;
	
	
	ds.setServer("localhost", 8080);
	ds.setUser("encrypt");
	 
	ds.connect();
	ds.setQuery("select modulus, pub from keyrsa where id ='"+target+"' and d='"+date+"'");
	ds.execute();
	String temp = ds.row[0][0];
	n = new BigInteger(temp);
	
	String temp1 = ds.row[0][1];
	e = new BigInteger(temp1);
	Rsa r = new Rsa(n,e);
	//System.out.println("n "+n+" e"+e);
	BigInteger m = new BigInteger(text1.getBytes());
	BigInteger ciphertext=r.encrypt(m);
	//System.out.println(" Encrypted "+ciphertext);
	
	ds.setQuery("insert into message values ('"+target+"','"+date+"','"+ciphertext+"','"+f+"','"+user+"','"+desc+"')");
	ds.execute();
	  
  }
  
  public static String d (String user,String date,String file)
  {	
	ds.setServer("localhost", 8080);
	ds.setUser("encrypt");
		 
	ds.connect();
	  BigInteger cipher;

	ds.setQuery("select mess from message where id='"+user+"' and d='"+date+"' and f='"+file+"'");
	ds.execute();
	cipher = new BigInteger(ds.row[0][0]);
	//ds.setQuery("select organisation from users where username='"+user+"'");
	//ds.execute();
	//String org=ds.row[0][0];
	ds.setQuery("select pri,modulus from keyrsa where id='"+user+"' and d='"+date+"'");
	ds.execute();
	d=new BigInteger(ds.row[0][0]);
	n=new BigInteger(ds.row[0][1]);
	BigInteger text2 = decrypt(cipher,d,n);
	String message = new String(text2.toByteArray());
	System.out.println("Message: " + message);
	return message;
  }
  
  public static void generateKeys(String u) {
    SecureRandom r = new SecureRandom();
    BigInteger p = new BigInteger(bitlen / 2, 100, r);
    BigInteger q = new BigInteger(bitlen / 2, 100, r);
    
    n = p.multiply(q);
    BigInteger m = (p.subtract(BigInteger.ONE)).multiply(q
        .subtract(BigInteger.ONE));
    e = new BigInteger("3");
    while (m.gcd(e).intValue() > 1) {
      e = e.add(new BigInteger("2"));    
    }
    d = e.modInverse(m);
   
    
	ds.setServer("localhost", 8080);
	ds.setUser("encrypt");
	ds.connect();
	ds.setQuery("select sysdate()");
	ds.execute();
	String date = ds.row[0][0].substring(0,10);
	ds.setQuery("select d from keyrsa where id ='"+u+"'");
	ds.execute();
	int flag=0;
	if(ds.rowCount!=0)
	{
	 for(int i=0;i<ds.rowCount;i++)
	 {	
		 System.out.println(ds.row[i][0].substring(0,10));
		 if(ds.row[i][0].substring(0,10).equals(date))
		 {System.out.println("Key already registered for "+date);flag=1;break;}
	 }
	 if(flag==0)
	 {
			ds.setQuery("insert into keyrsa values ('"+u+"','"+e+"','"+d+"','"+n+"','"+date+"')");
			ds.execute();	
			}
		}
	else
	{
		ds.setQuery("insert into keyrsa values ('"+u+"','"+e+"','"+d+"','"+n+"','"+date+"')");
		ds.execute();	
		}
  }
  
}
