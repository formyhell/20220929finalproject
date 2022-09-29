/**
 * <pre>
 * 
 * </pre>
 * @author 작성자명
 * @since 2022. 9. 14.
 * @version 1.0
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자       수정내용
 * --------     --------    ----------------------
 * 2022. 9. 14.      고혜인       최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */ 

let searchForm = $("#searchForm");
let pagingArea = $(".pagingArea").on("click", "a", function(event){
	let page = $(this).data("page");
	searchForm.find("[name=page]").val(page);
	
	searchForm.submit();
});
	
let searchUI = $("#searchUI").on("click", "#searchBtn", function(event){
	searchForm.get(0).reset();
	let inputs = searchUI.find(":input[name]");
	console.log("inputs1",inputs);
	$(inputs).each(function(idx, input){
		let name = $(this).attr("name");
		let value = $(this).val();
		searchForm.find("[name="+name+"]").val(value);
	});
	searchForm.submit();
});
