package com.amazingReader.control;

import com.amazingReader.util.GetMessageCode;
import org.json.JSONException;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/sendSMS.action")
public class SendSms extends HttpServlet {
	 /**
	 * 
	 */
	private static final long serialVersionUID = 3161007526255892518L;

	@Override
	 public void doPost(HttpServletRequest req, HttpServletResponse resp)
				throws ServletException, IOException {
			String phone=req.getParameter("phone");
			System.out.println("\n\n"+phone);
			//根据获取到的手机号发送验证码
		String code= null;
		try {
			code = GetMessageCode.getCode(phone);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		req.getSession().setAttribute("code",code);
			req.getSession().setAttribute("time",new Date());
			System.out.println(code);
			//resp.getWriter().print(code);
		}
}
