package utils;


import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.PaymentIntent;
import com.stripe.model.checkout.Session;
import com.stripe.param.checkout.SessionCreateParams;
public class CheckoutController {


	public void prueba() throws StripeException {
    // This is your test secret API key.
		Stripe.apiKey = "sk_test_51M8LMbDPnpMPrdK2ERdXeEfkt9zyzbIF1iUprDH8THaJk51Mw0g0cnA2VWLaTfC9hexwJa8wY2d9KeRHkNpoTnvQ00JpvUL8jG";

		List<Object> paymentMethodTypes =
		  new ArrayList<>();
		paymentMethodTypes.add("card");
		Map<String, Object> params = new HashMap<>();
		params.put("amount", 2000);
		params.put("currency", "eur");
		params.put(
		  "payment_method_types",
		  paymentMethodTypes
		);

		PaymentIntent paymentIntent = PaymentIntent.create(params);
}
}
