<%@ page import = "image.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "oracle.jdbc.OracleConnection" %>
<jsp:useBean id="photo" class="image.images" scope="session" />
<%
 
  int iNumPhoto ;
  oracle.jdbc.driver.OracleConnection conn = null;
  
  if ( request.getParameter("imgID") != null )
  {
   
    iNumPhoto = Integer.parseInt(request.getParameter("imgID")) ;   
  
    try
    {  
       conn = …………;
       conn.setAutoCommit (false);  
  
       // get the image from the database
       byte[] imgData = photo.getPhoto( conn, iNumPhoto  ) ;   
       // display the image
       response.setContentType("image/gif");
       OutputStream o = response.getOutputStream();
       o.write(imgData);
       o.flush(); 
       o.close();
    }
    catch (Exception e)
    {
      e.printStackTrace();
      throw e;
    }
    finally
    {
      … Close the connexion … ;
    }  
  }
%>