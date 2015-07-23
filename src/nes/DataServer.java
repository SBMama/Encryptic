package nes;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

public class DataServer {
	
	private static Connection cn=null;
	private static Statement st=null;
	private static ResultSet rs=null;
	
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	static final String DB_URL = "jdbc:mysql://localhost/encrypt";
	private static String db_name="",db_user="",db_pass="",server="localhost",sql;
	public String[][] row=new String[100000][50];public String[] column=new String[50];
	public int rowCount=0,columnCount=0;public boolean n=false; 
	
	//public void setDBName(String str){db_name= str;}
	public void setUser(String str){db_user= str;}
	public void setPWD(String str){db_pass= str;}
	public void setServer(String host, int port){server= host+":"+String.valueOf(port);}
	public void setQuery(String str){sql=str;}
	public boolean isNull(){return n;}
	
	public void connect(){
		if(db_user.equals("")){
			System.out.println("Provide Necessary DataBase Information!!");
			return;
		}
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			 cn = DriverManager.getConnection(DB_URL,"root","") ;			
			st=cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);rs=null;
			System.out.println("Connection Established");
		}
		catch(SQLException se){
			se.printStackTrace();
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void disconnect(){
		if(!(sql.equals("")))
			sql="";
		try {
			if(rs!=null)
				rs.close();
		} catch (SQLException se) {
			se.printStackTrace();
		}
		try{
			if(st!=null)
				st.close();
		}catch(SQLException se1){
			se1.printStackTrace();
		}
		try{
			if(cn!=null)
				cn.close();
		}catch(SQLException se2){
			se2.printStackTrace();
		}
		System.out.println("Disconnected");
	} 
	
	public void execute(){
		System.out.println("");System.out.println(sql);System.out.println("");
		if(sql.charAt(0)=='s'||sql.charAt(0)=='S'){
			rowCount=0;columnCount=0;int i;n=false;
			try{
				rs=st.executeQuery(sql);
				if(!rs.next()){n=true;return;}
				else{n=false;rs.previous();}
				ResultSetMetaData rsmd=rs.getMetaData();
				columnCount=rsmd.getColumnCount();
				for(i=0;i<columnCount;i++){column[i]=rsmd.getColumnLabel((i+1));}
				while(rs.next()){for(i=0;i<columnCount;i++){row[rowCount][i]=rs.getString((i+1));} rowCount++;}sql="";
			}catch(SQLException e){
				e.printStackTrace();
			}	
		}
		else if(sql.equals("")){return;}
		else{
			try{
				st.executeUpdate(sql);sql="";
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
}
