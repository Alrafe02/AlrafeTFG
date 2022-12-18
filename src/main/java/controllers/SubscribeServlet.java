package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.stripe.Stripe;
import com.stripe.model.Customer;
import com.stripe.model.Subscription;
import com.stripe.model.SubscriptionItem;
/**
 * Servlet implementation class SubscribeServlet
 */
@WebServlet("/SubscribeServlet")
public class SubscribeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubscribeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			// API key, Params and Token
			Stripe.apiKey = "sk_test_51M8LMbDPnpMPrdK2ERdXeEfkt9zyzbIF1iUprDH8THaJk51Mw0g0cnA2VWLaTfC9hexwJa8wY2d9KeRHkNpoTnvQ00JpvUL8jG"; // Secret Key
			String token = request.getParameter("stripeToken"); // the token got from Stripe
			String email = request.getParameter("email");
			String nameCompnay = request.getParameter("nameCompany");

			/***************** use existing customer begin *****************/
			//Customer cu = Customer.retrieve("cus_MtxEqHFdbx5aLz"); //existing Customer ID
			/***************** use existing customer end *****************/

			/***************** create new customer begin ****************
			Map<String, Object> customerParams = new HashMap<String, Object>();
			customerParams.put("description", nameCompnay);
			customerParams.put("email", email);
			customerParams.put("source", token);
			Customer cu = Customer.create(customerParams);
			/***************** create new customer begin *****************/

			/***************** use existing customer begin *****************/
			//Map<String, Object> params = new HashMap<String, Object>();
			//params.put("plan", "mqin"); // Pland ID
			Map<String, Object> params = new HashMap<>();
			params.put(
			  "subscription",
			  "sub_1MA9p82tXu0CfXKwCKdFdgsH"
			);
			params.put(
			  "price",
			  "price_1MA9p8DPnpMPrdK2Zpzz3HJB"
			);
			params.put("quantity", 2);

			SubscriptionItem subscriptionItem = SubscriptionItem.create(params);
			
			//Subscription subscription = cu.createSubscription(params);
			//System.out.println("status: " + subscription.getStatus());
			/***************** use existing customer begin *****************/

			// thankyou
			//if ("active".equals(subscription.getStatus())) {
			//	response.sendRedirect("thankyou.jsp");
			//}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("subscription failed: " + e);
		}
	}
}
