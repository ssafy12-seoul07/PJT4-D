// VideoDao.java
package com.yourpackage.servlet;

import com.yourpackage.model.Video;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

public class VideoDao {
    private List<Video> videos;
    private int currentId;

    public VideoDao() {
        videos = new ArrayList<>();
        currentId = 1;
        initializeDummyData(); // 초기 더미 데이터 생성
    }

    // 초기 더미 데이터 생성 메소드
    private void initializeDummyData() {
        addVideo(new Video(0, "팔 운동 영상 0", "50WCSpZtdmA", 10, "전신"));
        addVideo(new Video(0, "다리 운동 영상 1", "Kk7TQGqQ3nA", 5, "전신"));
        addVideo(new Video(0, "복근 운동 영상 2", "D3yExRi7EME&t=791s", 8, "상체"));
        addVideo(new Video(0, "가슴 운동 영상 3", "tzN6ypk6Sps", 12, "하체"));
        addVideo(new Video(0, "어깨 운동 영상 4", "7TLk7pscICk", 7, "복부"));
        addVideo(new Video(0, "등 운동 영상 5", "kXYiU_JCYtU", 15, "등"));
        // 필요한 만큼 더미 데이터 추가 가능
    }

    // 영상 추가 메소드
    public void addVideo(Video video) {
        video.setId(currentId++);
        videos.add(video);
    }

    // 조회수 상위 영상 가져오기 메소드
    public List<Video> getTopViewedVideos() {
        return videos.stream()
                     .sorted(Comparator.comparingInt(Video::getViewCount).reversed())
                     .limit(10)
                     .collect(Collectors.toList());
    }

    // 운동 부위별 영상 가져오기 메소드
    public List<Video> getVideosByBodyPart(String bodyPart) {
        return videos.stream()
                     .filter(video -> video.getBodyPart().equalsIgnoreCase(bodyPart))
                     .collect(Collectors.toList());
    }

    // 모든 운동 부위 가져오기 메소드
    public List<String> getAllBodyParts() {
        return videos.stream()
                     .map(Video::getBodyPart)
                     .distinct()
                     .collect(Collectors.toList());
    }

    // 조회수 증가 메소드
    public void ViewCount(int id) {
        for (Video video : videos) {
            if (video.getId() == id) {
                video.setViewCount(video.getViewCount() + 1);
                break;
            }
        }
    }

    // 특정 영상 가져오기 메소드
    public Video getVideoById(int id) {
        for (Video video : videos) {
            if (video.getId() == id) {
                return video;
            }
        }
        return null; // 해당 ID의 영상이 없을 경우 null 반환
    }
}
