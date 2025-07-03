<%@ page session="true" %>
<%
    if (session.getAttribute("user") == null) 
    {
        response.sendRedirect("login.jsp");
        return;
    }

    String[] questions = {
        "1. What is the Capital city of Japan?", "2. Who is the current President of Nepal?",
        "3. In which Continent does Turkey lies?", "4. What is the Boiling point of water?",
        "5. Who is the Author of Hamlet?", "6. Who discovered the gravity?",
        "7. Which is the Largest ocean?", "8. What is the Currency of Japan?",
        "9. Who is the Inventor of light bulb?", "10. What is the Square root of 64?"
    };

    String[][] options = {
        {"Kathmandu", "Tokyo", "Seoul", "Beijing"},
        {"KP Sharma Oli", "Vidhya Devi Bhandari", "Ram Chandra Paudel", "Pushpa Kamal Dahal"},
        {"Asia", "Africa", "Europe", "Russia"},
        {"90°C", "80°C", "100°C", "70°C"},
        {"Charles Dickens", "Leo Tolstoy", "William Shakespeare", "Saroj Dhital"},
        {"Albert Einstein", "Isaac Newton", "Galileo", "Tesla"},
        {"Indian", "Pacific", "Atlantic", "Arctic"},
        {"Dollar", "Yuan", "Yen", "Euro"},
        {"Newton", "Faraday", "Edison", "Franklin"},
        {"6", "7", "8", "9"}
    };

    String[] correctAnswers = {
        "Tokyo", "Ram Chandra Paudel", "Europe", "100°C", "William Shakespeare",
        "Isaac Newton", "Pacific", "Yen", "Edison", "8"
    };

    int current = (int) session.getAttribute("current");
    int score = (int) session.getAttribute("score");

    String selected = request.getParameter("ans");
    boolean answered = false;
    if (selected != null) {
        answered = true;
        if (selected.equalsIgnoreCase(correctAnswers[current - 1])) {
            score++;
            session.setAttribute("score", score);
        }
        session.setAttribute("answeredFeedback",
            selected.equalsIgnoreCase(correctAnswers[current - 1]) ?
            "<p style='color:green;'>Absolutely Correct!!</p>" :
            "<p style='color:red;'>Incorrect.. Correct Answer: " + correctAnswers[current - 1] + "</p>"
        );
        session.setAttribute("currentScoreMsg", "<p><b>You got " + score + " out of 10.</b></p><hr>");
    }

    if (current >= 10) {
        response.sendRedirect("result.jsp");
        return;
    }

%>
<!DOCTYPE html>
<html>
<head>
    <title>Quiz</title>
    <style>
        body {
            background: linear-gradient(to right, #ffecd2, #fcb69f);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-family: Arial, sans-serif;
            margin: 0;
        }
        .quiz-box {
            background-color: #ffffff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            width: 500px;
            text-align: center;
        }
        .quiz-box h2 {
            background-color: #90ee90;
            padding: 10px;
            border-radius: 8px;
        }
        .quiz-box form {
            margin-top: 20px;
        }
        .quiz-box input[type="radio"] {
            margin: 10px;
        }
        .quiz-box input[type="submit"] {
            background-color: #007bff;
            color: white;
            padding: 10px 25px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 15px;
        }
        .quiz-box input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .feedback {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="quiz-box">
        <h2>Saroj DTL Quiz</h2>

        <% if (answered || session.getAttribute("answeredFeedback") != null) { %>
            <div class="feedback">
                <%= session.getAttribute("answeredFeedback") %>
                <%= session.getAttribute("currentScoreMsg") %>
                <%
                    session.removeAttribute("answeredFeedback");
                    session.removeAttribute("currentScoreMsg");
                %>
            </div>
        <% } %>

        <form method="post" action="quiz.jsp">
            <p><b><%= questions[current] %></b></p>
            <% for (int i = 0; i < 4; i++) { %>
                <input type="radio" name="ans" value="<%= options[current][i] %>" required>
                <%= options[current][i] %><br>
            <% } %>
            <input type="submit" value="Submit Answer">
            <%
                session.setAttribute("current", current + 1);
            %>
        </form>
    </div>
</body>
</html>
