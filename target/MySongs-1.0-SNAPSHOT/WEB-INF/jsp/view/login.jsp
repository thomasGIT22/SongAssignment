<!DOCTYPE html>
<html>
    <head>
        <title>Tommy's Song Library</title>
        <link rel="stylesheet" href="styles/login.css">
    </head>
    <div>
        <body>
            <div id="div2">
                <h2>Login</h2>
                <p>You must log in to access the songs site.</p>
                <%
                    if ((Boolean) request.getAttribute("loginFailed")) {
                %>
                <p style="font-weight: bold;">The username or password you entered are not correct. Please try again.</p>
                <%
                    }
                %>
                <form method="POST" action="<c:url value="/login" />">
                    <label for="username">Username</label>
                    <input type="text" name="username" id="username" /><br><br>
                    <label for="password">Password</label>
                    <input id="password" type="password" name="password" id="password" /><br><br>
                    <input type="submit" value="Log In" />
                </form>
            </div>
        </body>
    </div>
</html>