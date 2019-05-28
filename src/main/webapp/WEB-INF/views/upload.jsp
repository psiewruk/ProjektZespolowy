<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
  pageEncoding="utf-8"%> 
<html>
<head>
<title>Upload File Request Page</title>
</head>
<body>

	<form method="POST" action="uploadFile?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
		File to upload: <input type="file" name="file"><br /> 
		<input type="submit" value="Upload"> Press here to upload the file!
	</form>
	
</body>
</html>