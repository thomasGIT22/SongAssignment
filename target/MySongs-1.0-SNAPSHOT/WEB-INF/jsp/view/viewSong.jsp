<%
    Song song = (Song)request.getAttribute("song");
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Tommy's Song Library</title>
    </head>
    <body>
        <a href="<c:url value="/login?logout" />">Logout</a>
        <h2>Song #${fn:escapeXml(songId)}</h2>
        <p><strong>Song Name:</strong><br>
            ${fn:escapeXml(song.name)}</p>
        <p><strong>Artist:</strong><br>
            ${fn:escapeXml(song.artist)}</p>
        <p><strong>Youtube Link:</strong><br>
            ${fn:escapeXml(song.youtube)}</p>
        <a href="<c:url value="/songs" />">Return to playlist</a>
    </body>
</html>