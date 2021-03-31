<!DOCTYPE html>
<html>
    <head>
        <title>Tommy's Song Library</title>
        <link rel="stylesheet" href="styles/addSong.css">
    </head>
    <div>
        <body>
            <div id="div2">
                <a class="logout" href="<c:url value="/login?logout" />">Logout</a><br>
                <a class="logout" href="<c:url value="/songs" />">Return to playlist</a>
                <h2>Add a Song</h2>
                <form method="POST" action="songs" enctype="multipart/form-data">
                    <input type="hidden" name="action" value="add" />
                    <p>Hello, <%= (String) request.getSession().getAttribute("username")%>. How can we help you today?</p>
                    <label for="name">Song Name:</label><br>
                    <input type="text" name="name" id="name" required/><br><br>
                    <label for="artist">Artist Name:</label><br>
                    <input type="text" name="artist" id="artist" required/></textarea><br><br>
                    <label for="youtube">Link:</label><br>
                    <input type="text" name="youtube" id="youtube" required/><br><br>
                    <input id="submit" type="submit" value="Submit"/>
                </form>
            </div>
        </body>
    </div>
</html>