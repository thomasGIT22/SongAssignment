package com.stout;

/**
 *
 * @author Thomas Stout
 */

/*
 * POJO class for a song
 */
public class Song {
    private int songID;
    private String name;
    private String artist;
    private String youtube;
    
    // Default constructor
    public Song(){}

    // Constructor that uses all attributes
    public Song(int songID, String name, String artist, String youtube){
        this.songID = songID;
        this.name = name;
        this.artist = artist;
        this.youtube = youtube;
    }
    
    public int getSongID() {
        return songID;
    }

    public void setSongID(int songID) {
        this.songID = songID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getArtist() {
        return artist;
    }

    public void setArtist(String artist) {
        this.artist = artist;
    }

    public String getYoutube() {
        return youtube;
    }

    public void setYoutube(String youtube) {
        this.youtube = youtube;
    }

    @Override
    public String toString() {
        return "Song{" + "songID=" + songID + ", name=" + name + ", artist=" + artist + ", youtube=" + youtube + '}';
    }
}
