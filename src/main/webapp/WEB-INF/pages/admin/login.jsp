<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <form name='f' action="<c:url value='/j_spring_security_check' />"
          method='POST'>
        <div class="logincontainer">

            <div class="login">
                <table>
                    <tr>
                        <td>Имя <input type='text' name='j_username'>
                        </td>
                    </tr>
                    <tr>
                        <td>Пароль <input type='password' name='j_password'/>
                        </td>
                    </tr>
                </table>
                <br/> <input class="btn btn-primary" name="submit" type="submit"
                             value="Вход"/> <br/>


                <input type="hidden" name="<c:out value="${_csrf.parameterName}"/>"
                       value="<c:out value="${_csrf.token}"/>"/>
            </div>
        </div>
    </form>

</div>


</body>
</html>
