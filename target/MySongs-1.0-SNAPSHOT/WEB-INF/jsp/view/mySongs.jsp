<%
    Song song = (Song) request.getAttribute("song");
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Tommy's Song Library</title>
        <link rel="stylesheet" href="styles/tommy.css">
    </head>
    <body>
        <div id="miniDiv">
            <a href="<c:url value="/login?logout" />">Logout</a><br><br>
            <a href="<c:url value="/songs" />">Return to playlist</a>
        </div>
        <h2>Some Songs I Actually Listen To!</h2>
        <div class="song">
            <p class="songName"><strong>Song Name:</strong><br>
                This Life</p>
            <p class="artist"><strong>Artist:</strong><br>
                Denzel Curry</p>
            <p class="album"><strong>Album:</strong><br>
                Imperial</p>
            <iframe class="video" width="560" height="315" 
                    src="https://www.youtube.com/embed/tULwXYKVkTs" 
                    title="YouTube video player" frameborder="0" 
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
                    allowfullscreen></iframe>
        </div>
        <div class="song">
            <p class="songName"><strong>Song Name:</strong><br>
                Pink + White</p>
            <p class="artist"><strong>Artist:</strong><br>
                Frank Ocean</p>
            <p class="album"><strong>Album:</strong><br>
                Blonde</p>
            <iframe class="video" width="560" height="315" 
                    src="https://www.youtube.com/embed/uzS3WG6__G4" 
                    title="YouTube video player" frameborder="0" 
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
                    allowfullscreen></iframe>
        </div>
        <div class="song">
            <p class="songName"><strong>Song Name:</strong><br>
                Break From Toronto</p>
            <p class="artist"><strong>Artist:</strong><br>
                PARTYNEXTDOOR</p>
            <p class="album"><strong>Album:</strong><br>
                PARTYNEXTDOOR</p>
            <iframe class="video" width="560" height="315" 
                    src="https://www.youtube.com/embed/lXYq9ImJIN8" 
                    title="YouTube video player" frameborder="0" 
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
                    allowfullscreen></iframe>
        </div>
        <div class="song">
            <p class="songName"><strong>Song Name:</strong><br>
                Picture Me Grapin</p>
            <p class="artist"><strong>Artist:</strong><br>
                NLE Choppa</p>
            <p class="album"><strong>Album:</strong><br>
                From Dark to Light</p>
            <iframe class="video" width="560" height="315" 
                    src="https://www.youtube.com/embed/OPDCaQ7mqCg" 
                    title="YouTube video player" frameborder="0" 
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
                    allowfullscreen></iframe>
        </div>
        <div class="song">
            <p class="songName"><strong>Song Name:</strong><br>
                Bruuuh Remix</p>
            <p class="artist"><strong>Artist:</strong><br>
                JID</p>
            <p class="album"><strong>Album:</strong><br>
                ~Single~</p>
            <iframe class="video" width="560" height="315" 
                    src="https://www.youtube.com/embed/yaCNI_W-lNQ" 
                    title="YouTube video player" frameborder="0" 
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
                    allowfullscreen></iframe>
        </div>
        <a href="<c:url value="/songs" />">Return to playlist</a>
    </body>
</html>