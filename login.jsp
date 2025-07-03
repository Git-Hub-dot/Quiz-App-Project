<%@ page session="true" %>
<%
    String myUser = request.getParameter("username");
    String myPass = request.getParameter("password");

    if (myUser != null && myPass != null) 
    {
        if (myUser.equals("Uname") && myPass.equals("Pword")) 
        {
            session.setAttribute("user", "Uname");
            session.setAttribute("score", 0);   
            session.setAttribute("current", 0); 
            response.sendRedirect("quiz.jsp");
            return;
        } 
        else 
        {
            out.print("<script>alert('Login Failed!');</script>");
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Saroj DTL Quiz - Login</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #a1c4fd, #c2e9fb);
            font-family: Arial, sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-box {
            background-color: white;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        .login-box h2 {
            background-color: aquamarine;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .login-box input[type="text"],
        .login-box input[type="password"] {
            padding: 10px;
            width: 90%;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .login-box input[type="submit"] {
            background-color: #28a745;
            color: white;
            padding: 10px 25px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .login-box input[type="submit"]:hover {
            background-color: #218838;
        }

        .login-box h3 {
            margin-bottom: 15px;
            color: #333;
        }
    </style>
</head>
<body>
    <div class="login-box">
        <h2>Saroj DTL Ultimate Quiz</h2>
        <h3>Login to join and play...</h3>
        <form method="get" action="login.jsp">
            <input type="text" name="username" placeholder="Username" required><br>
            <input type="password" name="password" placeholder="Password" required><br>
            <input type="submit" value="Login">
        </form>
    </div>
</body>
</html>
