<%@ page import="java.util.Map" %>
<%
    @SuppressWarnings(
            
    
    "unchecked")
    Map<Integer, Song> songDatabase = (Map<Integer, Song>) request.getAttribute("songDatabase");
    int numSongs = songDatabase.size();
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Tommy's Song Library</title>
        <link rel="stylesheet" href="styles/main.css">
    </head>
    <body>
        <a href="<c:url value="/login?logout" />">Logout</a>
        <h2>Songs</h2>
        <p id="tommy"><a href="
              <c:url value="/songs">
                  <c:param name="action" value="tommy" />
              </c:url>
                         ">Tommy's Songs!</a></p><br>
        <p id="add"><a href="
              <c:url value="/songs">
                  <c:param name="action" value="add" />
              </c:url>
                       ">Add a Song</a></p><br>
        <p id="clear"><a href="
              <c:url value="/songs">
                  <c:param name="action" value="empty" />
              </c:url>
              ">Clear playlist</a></p>
        <p id="label" style="font-style: italic">There
            <%= numSongs == 1 ? "is " : "are "%>
            <%= Integer.toString(numSongs)%>
            <%= numSongs == 1 ? " song " : " songs "%>
            in the playlist.</p>

        <%
            if (songDatabase.size() > 0) {
        %>
        <ul>
            <%
                for (int id : songDatabase.keySet()) {
                    String idString = Integer.toString(id);
                    Song song = songDatabase.get(id);
            %>
            <li><a id="list" href="
                   <c:url value="/songs">
                       <c:param name="action" value="view" />
                       <c:param name="songId" value="<%= idString%>" />
                   </c:url>
                   "><%= idString%>.) <%= song.getArtist()%> - <%= song.getName()%></a>
                <p><a href="
                      <c:url value="/songs">
                          <c:param name="action" value="remove" />
                          <c:param name="songId" value="<%= idString%>" />
                      </c:url>
                      ">Remove</a></p>
            </li>
            <%
                }
            %>
        </ul>
        <%
            }
        %>
    </body>
</html>