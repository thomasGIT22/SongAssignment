/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stout;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Thomas Stout
 */
@WebServlet(name = "SongServlet", urlPatterns = {"/songs"})
@MultipartConfig(
        fileSizeThreshold = 5_242_880, //5MB
        maxFileSize = 20_971_520L //20MB
)
public class SongServlet extends HttpServlet {
    
    private Map<Integer, Song> songDatabase = new LinkedHashMap<>();
    private volatile int SONG_ID_SEQUENCE = 1;

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        HttpSession session = request.getSession();
        if (session.getAttribute("username") == null) {
            response.sendRedirect("login");
            return;
        }
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }
        switch (action) {
            case "add":
                showSongForm(request, response);
                break;
            case "view":
                viewSong(request, response);
                break;
            case "empty":
                emptySongs(request, response);
                break;
            case "remove":
                removeSong(request, response);
                break;
            case "tommy":
                mySongs(request, response);
                break;
            case "list":
            default:
                listSongs(request, response);
                break;
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        HttpSession session = request.getSession();
        if (session.getAttribute("username") == null) {
            response.sendRedirect("login");
            return;
        }
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }
        switch (action) {
            case "add":
                addSong(request, response);
                break;
            case "empty":
                emptySongs(request, response);
                break;
            case "remove":
                removeSong(request, response);
                break;
            case "tommy":
                mySongs(request, response);
                break;
            case "list":
            default:
                listSongs(request, response);
                break;
        }
    }
    
    private void viewSong(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idString = request.getParameter("songId");
        Song song = getSong(idString);

        if (song == null) {
            return;
        }

        request.setAttribute("songId", idString);
        HttpSession session = request.getSession();
        request.setAttribute("song", song);
//        request.setAttribute("ticket", ticket);

        request.getRequestDispatcher("/WEB-INF/jsp/view/viewSong.jsp").forward(request, response);
    }
    
    private Song getSong(String idString) throws ServletException, IOException {
        if (idString == null || idString.length() == 0) {
            return null;
        }

        try {
            Song song = songDatabase.get(Integer.parseInt(idString));
            if (song == null) {
                return null;
            }
            return song;
        } catch (Exception e) {
            return null;
        }
    }
    
    private void addSong(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Song song = new Song();
        song.setName(request.getParameter("name"));
        song.setArtist(request.getParameter("artist"));
        song.setYoutube(request.getParameter("youtube"));

        int id;
        synchronized (this) {
            id = SONG_ID_SEQUENCE++;
            this.songDatabase.put(id, song);
        }

        response.sendRedirect("songs?action=view&songId=" + id);
    }
    
    private void showSongForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/jsp/view/songForm.jsp").forward(request, response);
    }
    
    private void listSongs(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("songDatabase", this.songDatabase);
        request.getRequestDispatcher("/WEB-INF/jsp/view/listSongs.jsp").forward(request, response);
    }
    private void emptySongs(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        songDatabase.clear();
        request.setAttribute("songDatabase", this.songDatabase);
        request.getRequestDispatcher("/WEB-INF/jsp/view/listSongs.jsp").forward(request, response);
    }
    
    private void mySongs(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("songDatabase", this.songDatabase);
        request.getRequestDispatcher("/WEB-INF/jsp/view/mySongs.jsp").forward(request, response);
    }
    private void removeSong(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int selection = Integer.parseInt(request.getParameter("songId"));
        songDatabase.remove(selection);
        request.setAttribute("songDatabase", this.songDatabase);
        request.getRequestDispatcher("/WEB-INF/jsp/view/listSongs.jsp").forward(request, response);
    }
}
