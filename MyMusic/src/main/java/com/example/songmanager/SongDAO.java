package com.example.songmanager;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SongDAO {

    public static List<Song> getAllSongs(String search) {
        List<Song> list = new ArrayList<>();
        String trimmedSearch = search == null ? "" : search.trim();
        try {
            String sql;
            if (trimmedSearch.isEmpty()) {
                sql = "SELECT * FROM songs";
            } else {
                sql = "SELECT * FROM songs WHERE title LIKE ? OR artist LIKE ?";
            }

            try (Connection con = DBConnection.getConnection();
                 PreparedStatement ps = con.prepareStatement(sql)) {
                if (!trimmedSearch.isEmpty()) {
                    ps.setString(1, "%" + trimmedSearch + "%");
                    ps.setString(2, "%" + trimmedSearch + "%");
                }

                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        list.add(new Song(
                                rs.getInt("id"),
                                rs.getString("title"),
                                rs.getString("artist")
                        ));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static int addSong(Song s) {
        int status = 0;
        String sql = "INSERT INTO songs(title, artist) VALUES (?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, s.getTitle());
            ps.setString(2, s.getArtist());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }

    public static int deleteSong(int id) {
        int status = 0;
        String sql = "DELETE FROM songs WHERE id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }
}