package com.haeyo.biz.profession;

public class ReReviewsVO {
	private int reviewNo;
	private int pNo;
	private String uName;
	private int order;
	private int depth;
	private int rsvNo;
	private String reReviewsContent;
	private String reReviewsDate;
	
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public int getOrder() {
		return order;
	}
	public void setOrder(int order) {
		this.order = order;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getRsvNo() {
		return rsvNo;
	}
	public void setRsvNo(int rsvNo) {
		this.rsvNo = rsvNo;
	}
	public String getReReviewsContent() {
		return reReviewsContent;
	}
	public void setReReviewsContent(String reReviewsContent) {
		this.reReviewsContent = reReviewsContent;
	}
	public String getReReviewsDate() {
		return reReviewsDate;
	}
	public void setReReviewsDate(String reReviewsDate) {
		this.reReviewsDate = reReviewsDate;
	}
	
	@Override
	public String toString() {
		return "ReReviewsVO [reviewNo=" + reviewNo + ", pNo=" + pNo + ", uName=" + uName + ", order=" + order
				+ ", depth=" + depth + ", rsvNo=" + rsvNo + ", reReviewsContent=" + reReviewsContent
				+ ", reReviewsDate=" + reReviewsDate + "]";
	}

	
}
