<%@ page session="true" %>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int finalScore = (Integer) session.getAttribute("score");

    session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Quiz Result</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #e0c3fc, #8ec5fc);
            font-family: Arial, sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .result-box {
            background-color: white;
            padding: 30px 50px;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        .result-box h2 {
            background-color: #ffd54f;
            padding: 10px;
            border-radius: 6px;
            margin-bottom: 20px;
        }

        .result-box h3 {
            color: #333;
        }

        .result-box a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 25px;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        .result-box a:hover {
            background-color: #1e7e34;
        }
    </style>
</head>
<body>
    <div class="result-box">
        <h2>Congratulations.......Quiz Completed!!</h2>
        <h3>Your Final Score: <%= finalScore %> out of 10</h3>
        <a href="login.jsp">Try Again</a>
    </div>
</body>
</html>
