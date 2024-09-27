package com.ssafy.review.model.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ssafy.review.model.dto.Review;

//싱글턴
public class ReviewRepositoryImpl implements ReviewRepository {
	
	private static ReviewRepository repo = new ReviewRepositoryImpl();
	
	//게시글을 관리를 하겠다.
	//메모리를 DB라고 생각
	private List<Review> list = new ArrayList<>();	//리스트로 관리 (해볼것)
	private Map<Integer, Review> reviews = new HashMap<>(); //맵으로 관리 V
	
	
	
	private ReviewRepositoryImpl() {
		reviews.put(1, new Review("SSAFY 완벽가이드", "양띵균", "1학기를 잘 이수하는방법은...."));
	}
	
	public static ReviewRepository getInstance() {
		return repo;
	}
	
	
	
	@Override
	public List<Review> selectAll() {
//		return list; //리스트로 관리했으면 요거면 끝
//		return (List<Review>)reviews.values();
		
		List<Review> tmp = new ArrayList<>();
		for(int key : reviews.keySet()) {
			tmp.add(reviews.get(key));
		}
		
		return tmp;
	}

	@Override
	public Review selectOne(int id) {
		
		//리스트였으면 반복문 돌면서 찾고
		
		
		return reviews.get(id);
	}

	@Override
	public void insertReview(Review review) {
		reviews.put(review.getId(), review);	//ID를 키로 해서 맵으로관리
		list.add(review); //리스트로 목록을 관리
	}

	@Override
	public void updateReview(Review review) {
		reviews.put(review.getId(), review); //맵으로
	}

	@Override
	public void deleteReview(int id) {
		//리스트면 반복문 돌려서 지우기
		reviews.remove(id); //맵
	}

//	@Override
//	public void updateViewCnt(int id) {
//		Review r = reviews.get(id);
//		r.setViewCnt(r.getViewCnt()+1);
//	}

}
