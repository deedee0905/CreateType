package com.amita.createType.ex.post.subscription;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.amita.createType.ex.post.subscription.bo.SubscriptionBO;
import com.amita.createType.ex.post.subscription.model.SubscriptionDetail;

@Controller
@RequestMapping("/individual")
public class SubscriptionController {
	
	@Autowired
	private SubscriptionBO subscriptionBO;
	
	// 구독 채널 view
		@GetMapping("/subscription/view")
		public String subscribeChannelView(
				HttpServletRequest request
				,Model model
				) {
			
			HttpSession session = request.getSession();
			int userId = (Integer)session.getAttribute("userId");
			List<SubscriptionDetail> subscriptionList = subscriptionBO.getSubscriptionList(userId);
			int channelCount = subscriptionBO.countChannelSubscription(userId);
			
			model.addAttribute("subscriptionList", subscriptionList);
			model.addAttribute("channelCount", channelCount);
			
			return "individual/subscribe";
		}

}
