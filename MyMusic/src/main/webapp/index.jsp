<%@ page import="java.util.*, com.example.songmanager.Song" %>

<!DOCTYPE html>
<html>
<head>
    <title>Spotify</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
    />
</head>
<body class="bg-light">

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-9 col-xl-8">
            <div class="card shadow-sm border-0">
                <div class="card-body p-4 p-md-5">
                    <div class="text-center mb-4">
                        <img
                                src="https://upload.wikimedia.org/wikipedia/commons/1/19/Spotify_logo_without_text.svg"
                                alt="Spotify Icon"
                                width="64"
                                height="64"
                                class="mb-2"
                        />
                        <h1 class="h3 mb-0">Spotify</h1>
                    </div>

                    <h2 class="h5 mb-3">Add Song</h2>
                    <form action="songs" method="post" class="row g-3 mb-4">
                        <div class="col-md-5">
                            <input
                                    type="text"
                                    name="title"
                                    class="form-control"
                                    placeholder="Song Title"
                                    required
                            />
                        </div>
                        <div class="col-md-5">
                            <input
                                    type="text"
                                    name="artist"
                                    class="form-control"
                                    placeholder="Artist"
                                    required
                            />
                        </div>
                        <div class="col-md-2 d-grid">
                            <button type="submit" class="btn btn-success">Add</button>
                        </div>
                    </form>

                    <form action="songs" method="get" class="mb-3">
                        <div class="input-group">
                            <input
                                    type="text"
                                    name="search"
                                    class="form-control"
                                    placeholder="Search by title or artist"
                                    value="<%= request.getAttribute("search") == null ? "" : request.getAttribute("search") %>"
                            />
                            <button type="submit" class="btn btn-primary">Search</button>
                        </div>
                    </form>

                    <div class="table-responsive">
                        <table class="table table-striped table-hover align-middle mb-0">
                            <thead class="table-dark">
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Title</th>
                                <th scope="col">Artist</th>
                                <th scope="col">Actions</th>
                            </tr>
                            </thead>
                            <tbody>

                            <%
                                List<Song> songs = (List<Song>) request.getAttribute("songList");
                                if (songs != null && !songs.isEmpty()) {
                                    for (Song s : songs) {
                            %>
                            <tr>
                                <td><%= s.getId() %></td>
                                <td><%= s.getTitle() %></td>
                                <td><%= s.getArtist() %></td>
                                <td class="text-nowrap">
                                    <a
                                            href="songs?action=delete&id=<%= s.getId() %>"
                                            class="btn btn-sm btn-danger"
                                            onclick="return confirm('Delete this song?');"
                                    >Delete</a>
                                    <button
                                            type="button"
                                            class="btn btn-sm btn-outline-primary"
                                            data-title="<%= s.getTitle() == null ? "" : s.getTitle().replace("&", "&amp;").replace("\"", "&quot;").replace("<", "&lt;").replace(">", "&gt;") %>"
                                            data-artist="<%= s.getArtist() == null ? "" : s.getArtist().replace("&", "&amp;").replace("\"", "&quot;").replace("<", "&lt;").replace(">", "&gt;") %>"
                                            onclick="playOnYoutube(this)"
                                    >Play</button>
                                </td>
                            </tr>
                            <%
                                    }
                                } else {
                            %>
                            <tr>
                                <td colspan="4" class="text-center text-muted py-4">No songs found.</td>
                            </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"
></script>
<script>
    function playOnYoutube(button) {
        var title = (button.getAttribute("data-title") || "").trim();
        var artist = (button.getAttribute("data-artist") || "").trim();
        var query = [title, artist].filter(Boolean).join(" ");
        var searchUrl = "https://www.youtube.com/results?search_query=" + encodeURIComponent(query);
        window.open(searchUrl, "_blank");
    }
</script>

</body>
</html>