// Video.java
package com.yourpackage.model;

// Video.java
public class Video {
    private int id;
    private String title;
    private String url; // 유튜브 비디오 ID로 변경
    private int viewCount;
    private String bodyPart;

    public Video(int id, String title, String url, int viewCount, String bodyPart) {
        this.id = id;
        this.title = title;
        this.url = url;
        this.viewCount = viewCount;
        this.bodyPart = bodyPart;
    }

    public int getId() {
    	return id;
    }

    public void setId(int id) {
    	this.id = id;
    }

    public String getTitle() {
    	return title;
    }

    public void setTitle(String title) {
    	this.title = title;
    }

    public String getUrl() {
    	return url;
    }

    public void setUrl(String url) {
    	this.url = url;
    }

    public int getViewCount() {
    	return viewCount;
    }

    public void setViewCount(int viewCount) {
    	this.viewCount = viewCount;
    }

    public String getBodyPart() {
    	return bodyPart;
    }

    public void setBodyPart(String bodyPart) {
    	this.bodyPart = bodyPart;
    }

    @Override
    public String toString() {
    	return "Video [id=" + id + ", title=" + title + ", url=" + url + ", viewCount=" + viewCount + ", bodyPart="
    			+ bodyPart + "]";
    }
}
