package com.example.demo.tags;

import javax.servlet.http.HttpServletRequest;
import org.springframework.web.servlet.tags.RequestContextAwareTag;
public class CategoryTags extends RequestContextAwareTag {
	@Override
	protected int doStartTagInternal() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void doFinally() {
		try {
			
		String jspPage = "../category/category.jsp";
			HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
			
			pageContext.include(jspPage);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
