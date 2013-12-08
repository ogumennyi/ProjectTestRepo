package com.moysport.tests;

import java.util.List; 
import java.util.Iterator;

import org.hibernate.HibernateException; 
import org.hibernate.Session;
import org.hibernate.Transaction; 
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;





import com.moysport.model.Game;
import com.moysport.model.Event;
//import com.moysport.model.Game;
//import com.moysport.model.Event;
import com.moysport.model.User;
import com.moysport.service.EventService;

public class Main {

    private static SessionFactory factory;	    		

    
   @SuppressWarnings("unchecked")
   public static void main(String[] args) {
	   
			System.out.println("Test1");

	   try {
		   factory = new AnnotationConfiguration().configure().buildSessionFactory();
		   
	   } catch (Throwable ex) { System.err.println("Failed to create sessionFactory object." + ex); throw new ExceptionInInitializerError(ex); }
	   
		// SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	 //  SessionFactory sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
	   Session session = factory.openSession();
	   Transaction tx = null;
	   Integer eventID = null;
	   
	   try{ tx = session.beginTransaction(); 
	   			//List employees = session.createQuery("FROM User").list(); 
	   		///	System.out.println("Test");
	   			//for (Iterator iterator = employees.iterator(); 	iterator.hasNext();){ 
	   			//		User user = (User) iterator.next(); 
	   			//		System.out.print("First Name: " + user.getFirstname()); 
	   			//		System.out.print(" Last Name: " + user.getLastname()); 
	   			//		System.out.println(" Username: " + user.getUsername());
	      			//}
	   			EventService eventService;
	   			Event event = (Event)session.get(Event.class, 1);


	   			
	   			//events.setName("Name changed to 1");
	   			//session.update(events);

	     	//	Event events = new Event();
	   		//	EventService eventService;
	   		//  eventService.addEvents(events);
	   			
	   	//		events.setName("Moy test event");
	   	////		eventID = (Integer) session.save(events); 
	   	//		System.out.print("eventID created " + eventID); 
	   	//	    Game game1 = new Game();
	   	//	    game1.setIdgame(idgame);

	   	//	game1.setsetEventgames(Set<Game> eventgames) {
	   		//	this.eventgames = eventgames;
   			tx.commit(); 
	   	}
	   catch (HibernateException e) { 
		   if (tx!=null) tx.rollback(); e.printStackTrace(); 
		   }
	   finally { session.close(); }
	   
	   
	   //Game game2 = new Game();
	   
	 //  game1.setComments("test comments, game1");
	  // game1.setComments("test comments, game2");

	//   game1.setEvents(events);
	 //  game1.setEvents(events);


   }
}