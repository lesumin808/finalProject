function joinprocategory_check() {

	const pAgreeCheck0 = document.getElementById("pAgreeCheck0").value; // 이용약관
	// 동의 X
	const pAgreeCheck1 = document.getElementById("pAgreeCheck1").value; // 이용약관
	// 동의 O
	const pGender0 = document.getElementById("pGender0").value; // 성별
	// 남자
	const pGender1 = document.getElementById("pGender1").value; // 성별
	// 여자
	const pCategory0 = document.getElementById("pCategory0").value; // 카테고리
	// 청소
	const pCategory1 = document.getElementById("pCategory1").value; // 카테고리
	// 이사
	const pCategory2 = document.getElementById("pCategory2").value; // 카테고리
	// 수리

	if (document.getElementById("pAgreeCheck1").checked) {
		document.getElementById("pAgreeCheck0").disabled = true;
	}
	return true;

	if (document.getElementById("pGender1").checked) {
		document.getElementById("pGender0").disabled = true;
	}
	return true;
}