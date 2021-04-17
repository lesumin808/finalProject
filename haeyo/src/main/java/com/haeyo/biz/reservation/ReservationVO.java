package com.haeyo.biz.reservation;


import java.sql.Date;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ReservationVO extends ReservationCategoryVO {
	
	public ReservationVO() {
		super();
	}

	private int rsvNo;
	private int uNo;
	private int pNo;
	@JsonFormat(pattern = "yyyy-MM-dd", shape=JsonFormat.Shape.STRING)
	private Date rsvDate;

	//@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Date start;
	
	private String uName;
	private String title;
	
	//테스트 추가
	private String pName;
	private String pEmail;
    
	
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpEmail() {
		return pEmail;
	}
	public void setpEmail(String pEmail) {
		this.pEmail = pEmail;
	}
	public void setRsvRoom(int rsvRoom) {
		this.rsvRoom = rsvRoom;
	}
	
	//전문가 달력일정
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getStart() {
		return start;
	}
	public void setStart(Date start) {
		this.start = start;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}

	private String rsvLoc;
	
	private String rsvPic1;
	private String rsvPic2;
	
	public String getRsvPic1() {
		return rsvPic1;
	}
	public void setRsvPic1(String rsvPic1) {
		this.rsvPic1 = rsvPic1;
	}
	public String getRsvPic2() {
		return rsvPic2;
	}
	public void setRsvPic2(String rsvPic2) {
		this.rsvPic2 = rsvPic2;
	}

	private String rsvDetail;
	private String rsvCategory;
	
	@JsonFormat(pattern = "yyyy-MM-dd", shape=JsonFormat.Shape.STRING)
	private Date rsvCredate;
	
	private int completeCheck;
	
	@JsonIgnore
	private MultipartFile file1;
	
	@JsonIgnore
	private MultipartFile file2;
	
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	public MultipartFile getFile2() {
		return file2;
	}
	public void setFile2(MultipartFile file2) {
		this.file2 = file2;
	}

	//다중 파일 업로드
	@JsonIgnore
	MultipartFile[] files;

	public MultipartFile[] getFiles() {
		return files;
	}
	public void setFiles(MultipartFile[] files) {
		this.files = files;
	}

	//테스트용 삭제
	private int rsvWaterpipe;
	private int rsvElectric;
	private int rsvDoor;
	private int rsvLiving;
	private int rsvTrash;
	
	public int getRsvWaterpipe() {
		return rsvWaterpipe;
	}
	public void setRsvWaterpipe(int rsvWaterpipe) {
		this.rsvWaterpipe = rsvWaterpipe;
	}
	public int getRsvElectric() {
		return rsvElectric;
	}
	public void setRsvElectric(int rsvElectric) {
		this.rsvElectric = rsvElectric;
	}
	public int getRsvDoor() {
		return rsvDoor;
	}
	public void setRsvDoor(int rsvDoor) {
		this.rsvDoor = rsvDoor;
	}
	public int getRsvLiving() {
		return rsvLiving;
	}
	public void setRsvLiving(int rsvLiving) {
		this.rsvLiving = rsvLiving;
	}
	public int getRsvTrash() {
		return rsvTrash;
	}
	public void setRsvTrash(int rsvTrash) {
		this.rsvTrash = rsvTrash;
	}

	private int rsvTransportation;
	private int rsvOneroom;
	private int rsvkeep;
	
	public int getRsvTransportation() {
		return rsvTransportation;
	}
	public void setRsvTransportation(int rsvTransportation) {
		this.rsvTransportation = rsvTransportation;
	}
	public int getRsvOneroom() {
		return rsvOneroom;
	}
	public void setRsvOneroom(int rsvOneroom) {
		this.rsvOneroom = rsvOneroom;
	}
	public int getRsvkeep() {
		return rsvkeep;
	}
	public void setRsvkeep(int rsvkeep) {
		this.rsvkeep = rsvkeep;
	}
	
	private int rsvToilet;
	private int rsvRoom;
	private int rsvRefrigerator;
	private int rsvArrangement;
	private int rsvHomein;
	
	public int getRsvToilet() {
		return rsvToilet;
	}
	public void setRsvToilet(int rsvToilet) {
		this.rsvToilet = rsvToilet;
	}
	public int getRsvRoom() {
		return rsvRoom;
	}
	public void setRoom(int rsvLiving) {
		this.rsvRoom = rsvLiving;
	}
	public int getRsvRefrigerator() {
		return rsvRefrigerator;
	}
	public void setRsvRefrigerator(int rsvRefrigerator) {
		this.rsvRefrigerator = rsvRefrigerator;
	}
	public int getRsvArrangement() {
		return rsvArrangement;
	}
	public void setRsvArrangement(int rsvArrangement) {
		this.rsvArrangement = rsvArrangement;
	}
	public int getRsvHomein() {
		return rsvHomein;
	}
	public void setRsvHomein(int rsvHomein) {
		this.rsvHomein = rsvHomein;
	}
	
	//여기까지 테스트용
	
	
	
	private ReservationCleaningVO reservationCleaningVO;
	
	private ReservationMovingVO reservationMovingVO;
	private ReservationRepairVO reservationRepairVO;

	public ReservationCleaningVO getReservationCleaningVO() {
		return reservationCleaningVO;
	}

	public void setReservationCleaningVO(ReservationCleaningVO reservationCleaningVO) {
		this.reservationCleaningVO = reservationCleaningVO;
	}

	public ReservationMovingVO getReservationMovingVO() {
		return reservationMovingVO;
	}

	public void setReservationMovingVO(ReservationMovingVO reservationMovingVO) {
		this.reservationMovingVO = reservationMovingVO;
	}

	public ReservationRepairVO getReservationRepairVO() {
		return reservationRepairVO;
	}

	public void setReservationRepairVO(ReservationRepairVO reservationRepairVO) {
		this.reservationRepairVO = reservationRepairVO;
	}

	public int getRsvNo() {
		return rsvNo;
	}

	public void setRsvNo(int rsvNo) {
		this.rsvNo = rsvNo;
	}

	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	@Override
	public int getpNo() {
		return pNo;
	}
	@Override
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public Date getRsvDate() {
		return rsvDate;
	}

	public void setRsvDate(Date rsvDate) {
		this.rsvDate = rsvDate;
	}

	public String getRsvLoc() {
		return rsvLoc;
	}

	public void setRsvLoc(String rsvLoc) {
		this.rsvLoc = rsvLoc;
	}

	public String getRsvDetail() {
		return rsvDetail;
	}

	public void setRsvDetail(String rsvDetail) {
		this.rsvDetail = rsvDetail;
	}

	public String getRsvCategory() {
		return rsvCategory;
	}

	public void setRsvCategory(String rsvCategory) {
		this.rsvCategory = rsvCategory;
	}

	public Date getRsvCredate() {
		return rsvCredate;
	}

	public void setRsvCredate(Date rsvCredate) {
		this.rsvCredate = rsvCredate;
	}

	public int getCompleteCheck() {
		return completeCheck;
	}

	public void setCompleteCheck(int completeCheck) {
		this.completeCheck = completeCheck;
	}
	
	@Override
	public String toString() {
		return "ReservationVO [rsvNo=" + rsvNo + ", uNo=" + uNo + ", pNo=" + pNo + ", rsvDate=" + rsvDate + ", start="
				+ start + ", uName=" + uName + ", title=" + title + ", pName=" + pName + ", pEmail=" + pEmail
				+ ", rsvLoc=" + rsvLoc + ", rsvPic1=" + rsvPic1 + ", rsvPic2=" + rsvPic2 + ", rsvDetail=" + rsvDetail
				+ ", rsvCategory=" + rsvCategory + ", rsvCredate=" + rsvCredate + ", completeCheck=" + completeCheck
				+ ", file1=" + file1 + ", file2=" + file2 + ", rsvWaterpipe="
				+ rsvWaterpipe + ", rsvElectric=" + rsvElectric + ", rsvDoor=" + rsvDoor + ", rsvLiving=" + rsvLiving
				+ ", rsvTrash=" + rsvTrash + ", rsvTransportation=" + rsvTransportation + ", rsvOneroom=" + rsvOneroom
				+ ", rsvkeep=" + rsvkeep + ", rsvToilet=" + rsvToilet + ", rsvRoom=" + rsvRoom + ", rsvRefrigerator="
				+ rsvRefrigerator + ", rsvArrangement=" + rsvArrangement + ", rsvHomein=" + rsvHomein
				+ ", reservationCleaningVO=" + reservationCleaningVO + ", reservationMovingVO=" + reservationMovingVO
				+ ", reservationRepairVO=" + reservationRepairVO + "]";
	}
	
	/*
	 * @Override public String toString() { return "ReservationVO [rsvNo=" + rsvNo +
	 * ", uNo=" + uNo + ", pNo=" + pNo + ", rsvDate=" + rsvDate + ", start=" + start
	 * + ", uName=" + uName + ", title=" + title + ", pName=" + pName + ", pEmail="
	 * + pEmail + ", rsvLoc=" + rsvLoc + ", rsvPic1=" + rsvPic1 + ", rsvPic2=" +
	 * rsvPic2 + ", rsvDetail=" + rsvDetail + ", rsvCategory=" + rsvCategory +
	 * ", rsvCredate=" + rsvCredate + ", completeCheck=" + completeCheck +
	 * ", file1=" + file1 + ", file2=" + file2 + ", files=" + Arrays.toString(files)
	 * + ", rsvWaterpipe=" + rsvWaterpipe + ", rsvElectric=" + rsvElectric +
	 * ", rsvDoor=" + rsvDoor + ", rsvLiving=" + rsvLiving + ", rsvTrash=" +
	 * rsvTrash + ", rsvTransportation=" + rsvTransportation + ", rsvOneroom=" +
	 * rsvOneroom + ", rsvkeep=" + rsvkeep + ", rsvToilet=" + rsvToilet +
	 * ", rsvRoom=" + rsvRoom + ", rsvRefrigerator=" + rsvRefrigerator +
	 * ", rsvArrangement=" + rsvArrangement + ", rsvHomein=" + rsvHomein +
	 * ", reservationCleaningVO=" + reservationCleaningVO + ", reservationMovingVO="
	 * + reservationMovingVO + ", reservationRepairVO=" + reservationRepairVO + "]";
	 * }
	 */
	
	
	
}
