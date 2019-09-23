package com.kirilo.sqlite.jdbc;

public class DirObject {
    private int id;
    private String name_en;

    public DirObject() {
    }

    public DirObject(int id, String name_en, String name_ua) {
        this.id = id;
        this.name_en = name_en;
        this.name_ua = name_ua;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName_en() {
        return name_en;
    }

    public void setName_en(String name_en) {
        this.name_en = name_en;
    }

    public String getName_ua() {
        return name_ua;
    }

    public void setName_ua(String name_ua) {
        this.name_ua = name_ua;
    }

    private String name_ua;
}
