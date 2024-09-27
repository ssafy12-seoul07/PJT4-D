// VideoServlet.java
package com.yourpackage.servlet;

import com.yourpackage.model.Video;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/VideoServlet")
public class VideoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private VideoDao videoDao;

    @Override
    public void init() throws ServletException {
        super.init();
        videoDao = new VideoDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");

        // action이 null인 경우 기본 로직으로 처리
        if (action == null) {
            action = "default"; // 기본 action 값 설정
        }

        switch (action) {
            case "filter":
                String bodyPart = request.getParameter("bodyPart");
                List<Video> filteredVideos = videoDao.getVideosByBodyPart(bodyPart);
                request.setAttribute("filteredVideos", filteredVideos);
                RequestDispatcher dispatcherFilter = request.getRequestDispatcher("index.jsp");
                dispatcherFilter.forward(request, response);
                break;

            case "view":
                String videoIdStr = request.getParameter("id");
                if (videoIdStr != null) {
                    try {
                        int videoId = Integer.parseInt(videoIdStr);
                        videoDao.ViewCount(videoId); // 조회수 증가 로직 제거
                        Video video = videoDao.getVideoById(videoId); // 영상 정보 가져오기
                        request.setAttribute("video", video);
                        RequestDispatcher dispatcherView = request.getRequestDispatcher("videoDetail.jsp");
                        dispatcherView.forward(request, response);
                    } catch (NumberFormatException e) {
                        e.printStackTrace();
                        response.sendRedirect("VideoServlet");
                    }
                } else {
                    response.sendRedirect("VideoServlet");
                }
                break;

            default:
                List<Video> topVideos = videoDao.getTopViewedVideos();
                List<String> bodyParts = videoDao.getAllBodyParts();
                request.setAttribute("topVideos", topVideos);
                request.setAttribute("bodyParts", bodyParts);
                RequestDispatcher dispatcherDefault = request.getRequestDispatcher("index.jsp");
                dispatcherDefault.forward(request, response);
                break;
        }
    }
}
