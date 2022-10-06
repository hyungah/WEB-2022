package cs.dit.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class MemberController extends HttpServlet {
   private static final long serialVersionUID = 1L;
    
    protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
       request.setCharacterEncoding("utf-8");
       String viewPage = null;
       //MCommand command = null;
       
       String uri = request.getRequestURI();
       String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf(".do"));
       
       if(com != null && com.trim().equals("list")) {
          //command = new MListCommand();
          //command.execute(request, response);
    	   MemberService sevice = new MListService();
    	   sevice.execute(request,response);
    	   viewPage = "/WEB-INF/view/list.jsp";
       }
       else if(com != null && com.trim().equals("index")) {
     	   viewPage = "/WEB-INF/view/index.jsp";
        }
       
       else if(com != null && com.trim().equals("insertForm")) {
     	   viewPage = "/WEB-INF/view/insertForm.jsp";
        }
       
       else if(com != null && com.trim().equals("updateForm")) {
     	   MemberService sevice = new MViewService();
     	   sevice.execute(request,response);
     	   viewPage = "/WEB-INF/view/updateForm.jsp";
        }
       
       else if(com != null && com.trim().equals("insert")) {
     	   MemberService sevice = new MinsertService();
     	   sevice.execute(request,response);
     	   viewPage = "list.do";
        }
       
       else if(com != null && com.trim().equals("update")) {
     	   MemberService sevice = new MupdateService();
     	   sevice.execute(request,response);
     	   viewPage = "list.do";
        }
       
       else if(com != null && com.trim().equals("delete")) {
     	   MemberService sevice = new MdeleteService();
     	   sevice.execute(request,response);
     	   viewPage = "list.do";
        }
       	
       	RequestDispatcher rd = request.getRequestDispatcher(viewPage);
        rd.forward(request, response);
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doHandle(request,response);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doHandle(request,response);
   }

}