package com.example.songmanager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/songs")
public class SongServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String title = request.getParameter("title");
        String artist = request.getParameter("artist");

        if (title != null && artist != null) {
            String trimmedTitle = title.trim();
            String trimmedArtist = artist.trim();
            if (!trimmedTitle.isEmpty() && !trimmedArtist.isEmpty()) {
                Song song = new Song();
                song.setTitle(trimmedTitle);
                song.setArtist(trimmedArtist);
                SongDAO.addSong(song);
            }
        }
        response.sendRedirect(request.getContextPath() + "/songs");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            String idParam = request.getParameter("id");
            try {
                int id = Integer.parseInt(idParam);
                SongDAO.deleteSong(id);
                response.sendRedirect(request.getContextPath() + "/songs");
                return;
            } catch (NumberFormatException ignored) {

            }
        }

        String searchQuery = request.getParameter("search");
        request.setAttribute("songList", SongDAO.getAllSongs(searchQuery));
        request.setAttribute("search", searchQuery == null ? "" : searchQuery);

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}