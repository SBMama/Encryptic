package nes;
public class Handler {

	public static void main (String[] args)
	{
		DataServer ds = new DataServer();
		ds.setServer("localhost", 8080);
		ds.setUser("encrypt");
		
}
}
