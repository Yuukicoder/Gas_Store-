/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package ProjectController;

import DTO.Constants;
import DTO.FBConstants;
import DTO.UserFaceBookDTO;
import DTO.UserGoogleDTO;
//import static ProjectController.LoginGoogleServlet.getToken;
//import static ProjectController.LoginGoogleServlet.getUserInfo;
//import static ProjectController.LoginGoogleServlet.getToken;
//import static ProjectController.LoginGoogleServlet.getUserInfo;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

/**
 *
 * @author Admin
 */
public class LoginFaceBookServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
           String code = request.getParameter("code");
               String accessToken = getToken(code);
//               System.out.println(accessToken);
               UserFaceBookDTO user = getUserInfo(accessToken);
    } 
//        public static String getToken(String code) throws ClientProtocolException, IOException {
//		// call api to get token
//		String response = Request.Post(FBConstants.FACEBOOK_LINK_GET_TOKEN)
//				.bodyForm(Form.form().add("client_id", FBConstants.FACEBOOK_CLIENT_ID)
//						.add("client_secret",FBConstants.FACEBOOK_CLIENT_SECRET)
//						.add("redirect_uri", FBConstants.FACEBOOK_REDIRECT_URI).add("code", code)
//						.add("grant_type",FBConstants.FACEBOOK_GRANT_TYPE).build())
//				.execute().returnContent().asString();
//
//		JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
//		String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
//		return accessToken;
//	}
    public static String getToken(String code) throws ClientProtocolException, IOException {
        String response = Request.Post(FBConstants.FACEBOOK_LINK_GET_TOKEN)
                .bodyForm(
                        Form.form()
       .add("client_id", FBConstants.FACEBOOK_CLIENT_ID)
                        .add("client_secret", FBConstants.FACEBOOK_CLIENT_SECRET)
                        .add("redirect_uri", FBConstants.FACEBOOK_REDIRECT_URI)
                        .add("code", code)
                        .build()
                )
                .execute().returnContent().asString();
        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

//	public static UserFaceBookDTO getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
//		String link = FBConstants.FACEBOOK_LINK_GET_USER_INFO + accessToken;
//		String response = Request.Get(link).execute().returnContent().asString();
//
//		UserFaceBookDTO googlePojo = new Gson().fromJson(response, UserFaceBookDTO.class);
//
//		return googlePojo;
//	}
     public static UserFaceBookDTO getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = FBConstants.FACEBOOK_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        UserFaceBookDTO fbAccount= new Gson().fromJson(response, UserFaceBookDTO.class);
        return fbAccount;
    }


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         String code = request.getParameter("code");
    if (code == null || code.isEmpty()) {
      RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
  

      dis.forward(request, response);
    } else {
      String accessToken = getToken(code);
      UserFaceBookDTO googlePojo = getUserInfo(accessToken);
      request.setAttribute("id", googlePojo.getId());
      request.setAttribute("name", googlePojo.getName());
      request.setAttribute("email", googlePojo.getEmail());
      RequestDispatcher dis = request.getRequestDispatcher("StaffHome.jsp");
      dis.forward(request, response);
    }
    } 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
