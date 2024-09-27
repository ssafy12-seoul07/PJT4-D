package com.ssafy.review.model.service;

import java.util.List;

import com.ssafy.review.model.dto.Review;
import com.ssafy.review.model.repository.ReviewRepository;
import com.ssafy.review.model.repository.ReviewRepositoryImpl;
//싱글턴으로 관리
public class ReviewServiceImpl implements ReviewService {

	private static ReviewService service = new ReviewServiceImpl();
	private ReviewRepository repo = ReviewRepositoryImpl.getInstance();
	
	private ReviewServiceImpl() {
	}	
	
	public static ReviewService getInstance() {
		return service;
	}
	
	
	@Override
	public List<Review> getList() {
		return repo.selectAll();
	}

	@Override
	public Review getReview(int id) {
//		repo.updateViewCnt(id);
		return repo.selectOne(id);
	}

	@Override
	public void writeReview(Review review) {
		//게시글 등록! Repo
		repo.insertReview(review);
	}

	@Override
	public void modifyReview(Review review) {
		repo.updateReview(review);
	}

	@Override
	public void removeReview(int id) {
		repo.deleteReview(id);
	}

}
