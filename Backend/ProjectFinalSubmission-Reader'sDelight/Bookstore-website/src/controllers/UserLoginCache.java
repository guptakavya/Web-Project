package controllers;



import java.net.*;
import net.spy.memcached.MemcachedClient;
import java.net.InetSocketAddress;
import java.util.concurrent.Future;

import javax.servlet.annotation.WebServlet;
@WebServlet("/UserLoginCache")




public class UserLoginCache {
	 public static void main(String[] args) {
		   
		 try{
			   
	         // Connecting to Memcached server on localhost
	         MemcachedClient mcc = new MemcachedClient(new InetSocketAddress("127.0.0.1", 11111));
	         System.out.println("Connection to server sucessful.");

	      String uname="ll";
	      System.out.println("Username value in cache - " + mcc.get(uname));
	         System.out.println("CACHE HIT");
	         
	         // add data to memcached server
	         Future fo = mcc.set("uname", 900, uname);

	         // print status of set method
	         System.out.println("set status:" + fo.get());

	         // retrieve and check the value from cache
	         System.out.println("Username value in cache - " + mcc.get(uname));

	         // try to add data with existing key
	          fo = mcc.add("uname", 900, "memcached");

	         // print status of set method
	         System.out.println("add status:" + fo.get());
	         System.out.println("CACHE MISS");

	              
	         
	         // retrieve and check the value from cache
	         System.out.println("Username value in cache - " + mcc.get(uname));
	         System.out.println("CACHE HIT");
	         // Shutdowns the memcached client
	         mcc.shutdown();
	         
	      }catch(Exception ex){
	         System.out.println(ex.getMessage());
	      }
	   }
}