/**
 * <pre>
 *  게시글 삭제 시 alert 창
 * </pre>
 * @author 작성자명
 * @since 2022. 9. 15.
 * @version 1.0
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자       수정내용
 * --------     --------    ----------------------
 * 2022. 9. 15.      고혜인       최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */ 

$("#delBtn").on("click", function(event) { //삭제 시 alert
	event.preventDefault();

	Swal.fire({
		title: '삭제하시겠습니까?',
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: 'Yes'
	}).then((result) => {
		if(result.isConfirmed == true){
			$("#delForm").submit();
		}
	})
});
