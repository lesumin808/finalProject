/**
 * 
 */

function labelAdd(array){
	const txt = "txt";
	const sub_category = document.getElementById("sub_category");
    for(i=0; i< array.length; i++){
        const li = document.createElement("li");
        const label = document.createElement("label");
        const input = document.createElement("input");
        label.htmlFor = array[i];
        label.innerText = document.getElementById(array[i]).innerText;
        label.addEventListener("click", select);
        input.type = "checkbox";
        input.name = txt.concat(array[i].substring(1));
        input.value = document.getElementById(array[i]).innerText;
        input.id = array[i];
        li.appendChild(input);
        li.appendChild(label);
        sub_category.appendChild(li);
    }
    
}

function select() {
    (this.classList.contains("select")) ? this.classList.remove("select") : this.classList.add("select");
}

const textWrap = document.getElementById("textWrap");
const revModifyBtn = document.getElementsByClassName("revModifyBtn");
/*
for(let i=0; i < revModifyBtn.length; i++){
	revModifyBtn[i].addEventListener("click", showModify(i));
}
*/

function reviewPro(event){
	const prmodifyLi = event.target;
	let childTextWrap = prmodifyLi.parentNode.parentNode.parentNode.lastElementChild;
	childTextWrap.style.display = "flex";
}
function showModify(event) {
	const modifyLi = event.target;
	let childTextWrap = modifyLi.parentNode.parentNode.parentNode.children[6];
	console.log(childTextWrap);
	childTextWrap.style.display = "flex";
}

function cancelModify(){
	textWrap.style.display = "none"
}

//사용자 댓글 업데이트
function updateReview(event){
		let target = event.target.parentNode.parentNode.parentNode.children[2];
		let input = event.target.parentNode.parentNode.parentNode.children[6].children[0].children[0];
		let reviewNo = event.target.parentNode.parentNode.parentNode.children[6].children[0].children[1];
		let reviewText = event.target.parentNode.parentNode.parentNode.children[6];
		console.log(reviewText);
		$.ajax({
			url:"ajaxReview.do",
			type: "GET",
			data: {
				reviewContent : input.value,
				reviewNo : reviewNo.value
			},
			contentType : "application/json; charset=UTF-8",
			dataType: "json",
			success: function(result){
				console.log(result);
				let content = result.reviewContent;
				console.log(content);
				target.value = content;
				input.value = content;
				reviewText.style.display = "none";
			}
		});
}

//대댓글 ajax
function insertReReview(){
	var reviewModify = $('#RereviewModify').serialize();
		console.log(reviewModify);
		$.ajax({
			url:"insertReReview.do",
			type: "GET",
			data: reviewModify,
			contentType : "application/json; charset=UTF-8",
			dataType: "json",
			success: function(result){
				console.log("result값");
				console.log(result);
				$.each(result, function(index, item){
		            resultItem= "<div id='replyImage'></div>"
					  +"<div id='rereview'>"
		              +"<h1>"+ item.uName + "전문가"+"</h1>"
					  +"<span>전문가</span>"
		              +"<p>"+item.reReviewsDate+"</p>"
		              +"<h3>"+item.reReviewsContent+"</h3>"
		              +"</div>"
	          	 $('#proReReview').append(resultItem);
	           }) //each end
			document.getElementById("reviewTextWrap").style.display = "none";
			}
		});
}

const score = document.getElementsByClassName("score");
const ul = document.getElementsByClassName("star");
//별돌리기
function startScore(){
    for(i=0; i<score.length; i++){
        let scoreTxt = score[i].innerText;
        let starshare = Math.floor(scoreTxt);
        let remainder = scoreTxt - starshare;
        for(j=0; j < starshare; j++){
            let li = document.createElement("li");
            li.innerText = "★";
            ul[i].appendChild(li);
        }
        if(remainder >= 0.5){
            let harf_li = document.createElement("li");
            harf_li.innerText = "☆";
            ul[i].appendChild(harf_li);
        }
      
        console.log(remainder);
    }
}






