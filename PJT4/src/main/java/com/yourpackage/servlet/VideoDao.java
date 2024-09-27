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
    	addVideo(new Video(0, "심으뜸 모닝 스트레칭", "50WCSpZtdmA", 0, "전신"));
        addVideo(new Video(0, "20분 전신순환 스트레칭 Ep.08", "Kk7TQGqQ3nA", 0, "전신"));
        addVideo(new Video(0, "뭉친 어깨, 뻣뻣한 골반 풀어주는 요가", "D3yExRi7EME&t=791s", 0, "상체"));
        addVideo(new Video(0, "하체운동이 중요한 이유? 이것만 보고 따라하자 !", "tzN6ypk6Sps", 0, "하체"));
        addVideo(new Video(0, "(Sub)누워서하는 5분 복부운동!! 효과보장!","7TLk7ps", 0, "복부"));
        addVideo(new Video(0, "11자복근 복부 최고의 운동 [복근 핵매운맛]", "PjGcOP-TQPE", 0, "등"));
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
