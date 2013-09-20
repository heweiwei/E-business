package com.softfz.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.softfz.dao.dto.Admin;
/**
 * 后台安全过滤器
 * @author Administrator
 *
 */
public class SecurityFilterBack implements Filter {

	public void destroy() {
	}

	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
			FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest)servletRequest;
		HttpServletResponse response = (HttpServletResponse)servletResponse;
		
		HttpSession session  = request.getSession();
		Admin admin =  (Admin)session.getAttribute("loginUserBack");
		if(admin==null)
		{
			PrintWriter out=response.getWriter();
			out.println("<script>window.top.location.href='/FourServlet/index.jsp'</script>");
		}else
		{
			chain.doFilter(request, response);
		}
		
	}

	public void init(FilterConfig filterConfig) throws ServletException {
	}

}
