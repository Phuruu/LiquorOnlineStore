function orderHistory() {
		document.getElementById("detailSales").style.display = 'none';
		document.getElementById("chart_div").style.display = 'none';
		document.getElementById("membership_div").style.display = 'none';
		document.getElementById("store_div").style.display = 'none';
		document.getElementById("product_table").style.display = 'none';
		document.getElementById("review_table").style.display = 'none';
		document.getElementById("detail_product").style.display = 'none';
		document.getElementById("QandA_div").style.display = 'none';
		document.getElementById("notice_div").style.display = 'none';
		document.getElementById("footer_div").style.display = 'block';
		document.getElementById("order_div").style.display = 'block';
	}
	function salesManagement() {
		document.getElementById("membership_div").style.display = 'none';
		document.getElementById("order_div").style.display = 'none';
		document.getElementById("store_div").style.display = 'none';
		document.getElementById("product_table").style.display = 'none';
		document.getElementById("review_table").style.display = 'none';
		document.getElementById("detail_product").style.display = 'none';
		document.getElementById("QandA_div").style.display = 'none';
		document.getElementById("notice_div").style.display = 'none';
		
    	google.charts.load('current', {'packages':['corechart']});

    	google.charts.setOnLoadCallback(drawChart);

		function drawChart() {
			document.getElementById("footer_div").style.display = 'block';
			document.getElementById("chart_div").style.display = 'block';
			document.getElementById("detailSales").style.display = 'block';
			var data = new google.visualization.DataTable();
	        
			data.addColumn('string', 'Topping');
	        data.addColumn('number', '총매출');
	        data.addRows([
	          ['1월', 10],
	          ['2월', 30],
	          ['3월', 10],
	          ['4월', 30],
	          ['5월', 50],
	          ['6월', 20],
	          ['7월', 40],
	          ['8월', 70],
	          ['9월', 100],
	          ['10월', 200],
	          ['11월', 150],
	          ['12월', 250]
	        ]);
	
	        var options = {'title':'희노애락 현재년도 매출관리'};
	
	        var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
	        chart.draw(data, options);
			
	      }
		$('input[name="datetimes"]').daterangepicker({
			timePicker: true,
			startDate: moment().startOf('hour'),
			endDate: moment().startOf('hour').add(32, 'hour'),
			locale: {
		  		format: 'M월DD일'
			}
		});
		$('input[name="datetimes"]').on('apply.daterangepicker', function(ev, picker) {
			let startDate = picker.startDate.format('YYYY-MM-DD');
			let endDate = picker.endDate.format('YYYY-MM-DD');
			
			$.ajax("period.do", {
				type: "get",
				data: { startDate: startDate, endDate: endDate},
				dataType: "text", 
				success: function(respData){
					alert(respData);
					
				},
				error: function(){
					alert("실패");
				}
			});
			
		});
	}
	
	function storeManagement() {
		document.getElementById("detailSales").style.display = 'none';
		document.getElementById("chart_div").style.display = 'none';
		document.getElementById("membership_div").style.display = 'none';
		document.getElementById("order_div").style.display = 'none';
		document.getElementById("product_table").style.display = 'none';
		document.getElementById("review_table").style.display = 'none';
		document.getElementById("detail_product").style.display = 'none';
		document.getElementById("QandA_div").style.display = 'none';
		document.getElementById("notice_div").style.display = 'none';
		document.getElementById("footer_div").style.display = 'none';
		document.getElementById("store_div").style.display = 'block';
		
	}
	function memberManagement(searchDivision, searchKeyword, pageNum) {
		document.getElementById("detailSales").style.display = 'none';
		document.getElementById("chart_div").style.display = 'none';
		document.getElementById("order_div").style.display = 'none';
		document.getElementById("store_div").style.display = 'none';
		document.getElementById("product_table").style.display = 'none';
		document.getElementById("review_table").style.display = 'none';
		document.getElementById("detail_product").style.display = 'none';
		document.getElementById("QandA_div").style.display = 'none';
		document.getElementById("notice_div").style.display = 'none';
		document.getElementById("footer_div").style.display = 'block';
		document.getElementById("membership_div").style.display = 'block';
			
		if (pageNum == null) {
			pageNum = 1;
		}

		if (searchKeyword == "-1") {
			searchKeyword = "";
		}
		$.ajax("searchUsers.do", {
			type: "post",
			data: { searchDivision:searchDivision, searchKeyword:searchKeyword, pageNum: pageNum },
			dataType: "json",
			success: function(respData) {
				let dispHtml = "";
				let ugender = "남";
				for (let index = 0; index < 10; index++) {
					
					if (respData.resultUserList[index] == null) {
						dispHtml += "<tr id=\"table_tr\" height=\"70px\">";
						dispHtml += "<td colspan=\"11\"></td>";
						dispHtml += "</tr>";
					} else {
						if (respData.resultUserList[index].ugender == 1) {
							ugender = "여자";
						}
						dispHtml += "<tr id=\"table_tr\" height=\"70px\">";
						dispHtml += "<td>" + respData.resultUserList[index].ucode + "</td>";
						dispHtml += "<td>" + respData.resultUserList[index].userId + "</td>";
						dispHtml += "<td>" + respData.resultUserList[index].userPwd + "</td>";
						dispHtml += "<td>" + respData.resultUserList[index].uname + "</td>";
						dispHtml += "<td>" + respData.resultUserList[index].unick + "</td>";
						dispHtml += "<td>" + respData.resultUserList[index].uaddr + "</td>";
						dispHtml += "<td>" + ugender + "</td>";
						dispHtml += "<td>" + respData.resultUserList[index].uemail + "</td>";
						dispHtml += "<td>" + respData.resultUserList[index].ubirth + "</td>";
						dispHtml += "<td>" + respData.resultUserList[index].uphone + "</td>";
						dispHtml += "<td>";
						dispHtml += "<a href=\"memberDelete.do?uCode=" + respData.resultUserList[index].ucode + "\"><img id=\"deleteImg\" src=\"resources/image/delete.png\" alt=\"삭제\"></a>";
						dispHtml += "</td>";
						dispHtml += "</tr>";
					}
				}
				
				dispHtml += "<tr class=\"pagination\" height=\"50px\"><td colspan=\"11\">";
				
				if (respData.page < 2) {
					
					dispHtml += "<a>\<</a>&nbsp;&nbsp;";
				} else if ((respData.page - 1) < respData.startpage) {
					if (searchKeyword == "") {
						searchKeyword = "-1";
					}
					dispHtml += "<a href=\"javascript:memberManagement("+ searchDivision + "," + searchKeyword + "," + (respData.endpage - 5) +");\">\<</a>&nbsp;&nbsp;";
				} else {
					if (searchKeyword == "") {
						searchKeyword = "-1";
					}
					dispHtml += "<a href=\"javascript:memberManagement("+ searchDivision + "," + searchKeyword + "," + (respData.page - 1) +");\">\<</a>&nbsp;&nbsp;";
				}
				
				for (var pageCnt = respData.startpage; pageCnt <= respData.endpage; pageCnt++) {
					
					if (pageCnt == respData.page) {
						
						if (searchKeyword == "") {
							searchKeyword = "-1";
						}
						dispHtml += "<a class=\"active\" href=\"javascript:memberManagement("+ searchDivision + "," + searchKeyword + "," + pageCnt +");\">" + pageCnt + "</a>&nbsp;&nbsp;";
					} else if (respData.page == respData.lastPage) {
						if (searchKeyword == "") {
							searchKeyword = "-1";
						}
						dispHtml += "<a class=\"active\" href=\"javascript:memberManagement("+ searchDivision + "," + searchKeyword + "," + respData.lastPage +");\">" + respData.lastPage + "</a>&nbsp;&nbsp;";
						break;
					} else {
						if (searchKeyword == "") {
							searchKeyword = "-1";
						}
						dispHtml += "<a href=\"javascript:memberManagement("+ searchDivision + "," + searchKeyword + "," + pageCnt +");\">" + pageCnt + "</a>&nbsp;&nbsp;";
					}
				}
				
				if (respData.page > respData.endpage) {
					if (searchKeyword == "") {
						searchKeyword = "-1";
					}
					dispHtml += "<a href=\"javascript:memberManagement("+ searchDivision + "," + searchKeyword + "," + (respData.startpage + 5) +");\">\></a>&nbsp;&nbsp;";
				} else if (respData.page == respData.lastPage) {
					if (searchKeyword == "") {
						searchKeyword = "-1";
					}
					dispHtml += "<a>\></a>&nbsp;&nbsp;";
				} else {
					if (searchKeyword == "") {
						searchKeyword = "-1";
					}
					dispHtml += "<a href=\"javascript:memberManagement("+ searchDivision + "," + searchKeyword + "," + (respData.page + 1) +");\">\></a>&nbsp;&nbsp;";
				}
				dispHtml += "</td></tr>";
				
				$("#membership_tbody").html(dispHtml);
				
			},
			error: function() {
				alert("에러");
			}
		});
		
		
	}
	
	function detail(divisionNum, pageNum) {
		if (pageNum == null) {
			pageNum = 1;
		}
		
		$.ajax("product.do", {
			type: "get",
			data: { divisionNum: divisionNum, pageNum: pageNum},
			dataType: "json", 
			success: function(respData){
				let dispHtml = "";
				
				for (let index = 0; index < 10; index++) {
					
					if (respData.resultList[index] == null) {
						dispHtml += "<tr id=\"table_tr\" height=\"70px\">";
						dispHtml += "<td colspan=\"5\"></td>";
						dispHtml += "</tr>";
					} else {
						dispHtml += "<tr id=\"table_tr\" height=\"70px\">";
						dispHtml += "<td width=\"5%\">" + respData.resultList[index].pcode + "</td>";
						dispHtml += "<td width=\"5%\">" + respData.resultList[index].pname + "</td>";
						dispHtml += "<td width=\"30%\">" + respData.resultList[index].pprice + "원</td>";
						dispHtml += "<td width=\"30%\">" + respData.resultList[index].pinfo + "</td>";
						dispHtml += "<td width=\"30%\>";
						dispHtml += "<a href=\"product_state.do?state=2&pcode="+ respData.resultList[index].pcode +"\"><img id=\"updateImg\" src=\"resources/image/update.png\" alt=\"수정\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
						dispHtml += "<a href=\"product_state.do?state=3&pcode="+ respData.resultList[index].pcode +"\"><img id=\"deleteImg\" src=\"resources/image/delete.png\" alt=\"삭제\"></a>";
						dispHtml += "</td>";
						dispHtml += "</tr>";
					}
				}
				dispHtml += "<tr class=\"pagination\" height=\"50px\"><td colspan=\"5\">";
				
				if (respData.page < 2) {
					
					dispHtml += "<a>\<</a>&nbsp;&nbsp;";
				} else if ((respData.page - 1) < respData.startpage) {
					dispHtml += "<a href=\"javascript:detail("+ divisionNum + "," + (respData.endpage - 5) +");\">\<</a>&nbsp;&nbsp;";
				} else {
					dispHtml += "<a href=\"javascript:detail("+ divisionNum + "," + (respData.page - 1) +");\">\<</a>&nbsp;&nbsp;";
				}
				
				for (var pageCnt = respData.startpage; pageCnt <= respData.endpage; pageCnt++) {
					
					if (pageCnt == respData.page) {
						
						dispHtml += "<a class=\"active\" href=\"javascript:detail("+ divisionNum + "," + pageCnt +");\">" + pageCnt + "</a>&nbsp;&nbsp;";
					} else if (respData.page == respData.lastPage) {
						dispHtml += "<a class=\"active\" href=\"javascript:detail("+ divisionNum + "," + respData.lastPage +");\">" + respData.lastPage + "</a>&nbsp;&nbsp;";
						break;
					} else {
						dispHtml += "<a href=\"javascript:detail("+ divisionNum + "," + pageCnt +");\">" + pageCnt + "</a>&nbsp;&nbsp;";
					}
				}
				
				if (respData.page > respData.endpage) {
					dispHtml += "<a href=\"javascript:detail("+ divisionNum + "," + (respData.startpage + 5) +");\">\></a>&nbsp;&nbsp;";
				} else if (respData.page == respData.lastPage) {
					dispHtml += "<a>\></a>&nbsp;&nbsp;";
				} else {
					dispHtml += "<a href=\"javascript:detail("+ divisionNum + "," + (respData.page + 1) +");\">\></a>&nbsp;&nbsp;";
				}
				dispHtml += "</td></tr>";
				$("#product_tbody").html(dispHtml);
			},
			error: function(){
				alert("실패");				
			}
		});
		document.getElementById("footer_div").style.display = 'block';
		document.getElementById("detail_product").style.display = 'block';
	}
	
	function productManagement() {
		document.getElementById("review_table").style.display = 'none';
		document.getElementById("detail_product").style.display = 'none';
		document.getElementById("product_table").style.display = 'block';
	}
	
	
	function reviewManagement(pageNum) {
		document.getElementById("product_table").style.display = 'none';
		document.getElementById("detail_product").style.display = 'none';
		
		if (pageNum == null) {
			pageNum = 1;
		}
		$.ajax("review.do", {
			type: "get",
			data: { pageNum: pageNum },
			dataType: "json", 
			success: function(respData){
				let dispHtml = "";
				
				for (let index = 0; index < 10; index++) {
					
					if (respData.reviewList[index] == null) {
						dispHtml += "<tr id=\"table_tr\" height=\"70px\">";
						dispHtml += "<td colspan=\"8\"></td>";
						dispHtml += "</tr>";
					} else {
						dispHtml += "<tr id=\"table_tr\" height=\"70px\">";
						dispHtml += "<td width=\"10%\">" + (index + 1) + "</td>";
						dispHtml += "<td width=\"15%\">" + respData.reviewList[index].userId + "</td>";
						dispHtml += "<td width=\"15%\">" + respData.reviewList[index].pCode + "</td>";
						dispHtml += "<td width=\"15%\">" + respData.reviewList[index].rDate + "</td>";
						dispHtml += "<td width=\"15%\">" + respData.reviewList[index].pName + "</td>";
						dispHtml += "<td width=\"15%\">" + respData.reviewList[index].rContent + "</td>";
						dispHtml += "<td width=\"5%\">" + respData.reviewList[index].rStar + "</td>";
						dispHtml += "<td width=\"10%\">";
						dispHtml += "<a href=\"#\"><img id=\"updateImg\" src=\"resources/image/update.png\" alt=\"수정\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
						dispHtml += "<a href=\"reviewDelete.do?userId=" + respData.reviewList[index].userId + "&pCode=" + respData.reviewList[index].pCode + "\"><img id=\"deleteImg\" src=\"resources/image/delete.png\" alt=\"삭제\"></a>";
						dispHtml += "</td>";
						dispHtml += "</tr>";
					}
				}
				dispHtml += "<tr class=\"pagination\" height=\"50px\"><td colspan=\"8\" >";
				
				if (respData.page < 2) {
					
					dispHtml += "<a>\<</a>&nbsp;&nbsp;";
				} else if ((respData.page - 1) < respData.startpage) {
					dispHtml += "<a href=\"javascript:reviewManagement(" + (respData.endpage - 5) +");\">\<</a>&nbsp;&nbsp;";
				} else {
					dispHtml += "<a href=\"javascript:reviewManagement(" + (respData.page - 1) +");\">\<</a>&nbsp;&nbsp;";
				}
				
				for (var pageCnt = respData.startpage; pageCnt <= respData.endpage; pageCnt++) {
					
					if (pageCnt == respData.page) {
						
						dispHtml += "<a class=\"active\" href=\"javascript:reviewManagement(" + pageCnt +");\">" + pageCnt + "</a>&nbsp;&nbsp;";
					} else if (respData.page == respData.lastPage) {
						dispHtml += "<a class=\"active\" href=\"javascript:reviewManagement(" + respData.lastPage +");\">" + respData.lastPage + "</a>&nbsp;&nbsp;";
						break;
					} else {
						dispHtml += "<a href=\"javascript:reviewManagement(" + pageCnt +");\">" + pageCnt + "</a>&nbsp;&nbsp;";
					}
				}
				
				if (respData.page > respData.endpage) {
					dispHtml += "<a href=\"javascript:reviewManagement(" + (respData.startpage + 5) +");\">\></a>&nbsp;&nbsp;";
				} else if (respData.page == respData.lastPage) {
					dispHtml += "<a>\></a>&nbsp;&nbsp;";
				} else {
					dispHtml += "<a href=\"javascript:reviewManagement(" + (respData.page + 1) +");\">\></a>&nbsp;&nbsp;";
				}
				dispHtml += "</td></tr>";
				$("#review_tbody").html(dispHtml);
			},
			error: function(){
				alert("실패");				
			}
			
		});
		document.getElementById("footer_div").style.display = 'block';
		document.getElementById("review_table").style.display = 'block';
	}
	
	function questionManagement(searchDivision, searchKeyword, pageNum) {
		document.getElementById("detailSales").style.display = 'none';
		document.getElementById("chart_div").style.display = 'none';
		document.getElementById("membership_div").style.display = 'none';
		document.getElementById("order_div").style.display = 'none';
		document.getElementById("store_div").style.display = 'none';
		document.getElementById("product_table").style.display = 'none';
		document.getElementById("review_table").style.display = 'none';
		document.getElementById("detail_product").style.display = 'none';
		document.getElementById("notice_div").style.display = 'none';
		
		if (pageNum == null) {
			pageNum = 1;
		}

		if (searchKeyword == "-1") {
			searchKeyword = "";
		}
		$.ajax("QnAList.do", {
			type: "get",
			data: { searchDivision:searchDivision, searchKeyword:searchKeyword, pageNum: pageNum },
			dataType: "json", 
			success: function(respData){
				let dispHtml = "";
				
				for (let index = 0; index < 10; index++) {
					if (respData.QnAList[index] == null) {
						dispHtml += "<tr id=\"table_tr\" height=\"70px\">";
						dispHtml += "<td colspan=\"6\"></td>";
						dispHtml += "</tr>";
					} else {
						dispHtml += "<tr id=\"table_tr\" height=\"70px\">";
						dispHtml += "<td width=\"5%\">" + (index + 1) + "</td>";
						dispHtml += "<td width=\"5%\">" + respData.QnAList[index].qCode + "</td>";
						dispHtml += "<td width=\"15%\">" + respData.QnAList[index].qTitle + "</td>";
						dispHtml += "<td width=\"30%\">" + respData.QnAList[index].qContent + "</td>";
						dispHtml += "<td width=\"30%\">" + respData.QnAList[index].qDate + "</td>";
						dispHtml += "<td width=\"30%\">";
						dispHtml += "<a href=\"#\"><img id=\"updateImg\" src=\"resources/image/update.png\" alt=\"수정\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
						dispHtml += "<a href=\"questionDelete.do?qCode=" + respData.QnAList[index].qCode + "\"><img id=\"deleteImg\" src=\"resources/image/delete.png\" alt=\"삭제\"></a>";
						dispHtml += "</td>";
						dispHtml += "</tr>";
					}
				}
				dispHtml += "<tr class=\"pagination\" height=\"50px\"><td colspan=\"6\">";
				
				if (respData.page < 2) {
					
					dispHtml += "<a>\<</a>&nbsp;&nbsp;";
				} else if ((respData.page - 1) < respData.startpage) {
					if (searchKeyword == "") {
						searchKeyword = "-1";
					}
					dispHtml += "<a href=\"javascript:questionManagement("+ searchDivision + "," + searchKeyword + "," + (respData.endpage - 5) +");\">\<</a>&nbsp;&nbsp;";
				} else {
					if (searchKeyword == "") {
						searchKeyword = "-1";
					}
					dispHtml += "<a href=\"javascript:questionManagement("+ searchDivision + "," + searchKeyword + "," + (respData.page - 1) +");\">\<</a>&nbsp;&nbsp;";
				}
				
				for (var pageCnt = respData.startpage; pageCnt <= respData.endpage; pageCnt++) {
					
					if (pageCnt == respData.page) {
						
						if (searchKeyword == "") {
							searchKeyword = "-1";
						}
						dispHtml += "<a class=\"active\" href=\"javascript:questionManagement("+ searchDivision + "," + searchKeyword + "," + pageCnt +");\">" + pageCnt + "</a>&nbsp;&nbsp;";
					} else if (respData.page == respData.lastPage) {
						if (searchKeyword == "") {
							searchKeyword = "-1";
						}
						dispHtml += "<a class=\"active\" href=\"javascript:questionManagement("+ searchDivision + "," + searchKeyword + "," + respData.lastPage +");\">" + respData.lastPage + "</a>&nbsp;&nbsp;";
						break;
					} else {
						if (searchKeyword == "") {
							searchKeyword = "-1";
						}
						dispHtml += "<a href=\"javascript:questionManagement("+ searchDivision + "," + searchKeyword + "," + pageCnt +");\">" + pageCnt + "</a>&nbsp;&nbsp;";
					}
				}
				
				if (respData.page > respData.endpage) {
					if (searchKeyword == "") {
						searchKeyword = "-1";
					}
					dispHtml += "<a href=\"javascript:questionManagement("+ searchDivision + "," + searchKeyword + "," + (respData.startpage + 5) +");\">\></a>&nbsp;&nbsp;";
				} else if (respData.page == respData.lastPage) {
					if (searchKeyword == "") {
						searchKeyword = "-1";
					}
					dispHtml += "<a>\></a>&nbsp;&nbsp;";
				} else {
					if (searchKeyword == "") {
						searchKeyword = "-1";
					}
					dispHtml += "<a href=\"javascript:questionManagement("+ searchDivision + "," + searchKeyword + "," + (respData.page + 1) +");\">\></a>&nbsp;&nbsp;";
				}
				dispHtml += "</td></tr>";
				$("#QnA_tbody").html(dispHtml);
			},
			error: function(){
				alert("실패");				
			}
		});
		document.getElementById("footer_div").style.display = 'block';
		document.getElementById("QandA_div").style.display = 'block';
	}
	
	function announcement(pageNum) {
		document.getElementById("detailSales").style.display = 'none';
		document.getElementById("chart_div").style.display = 'none';
		document.getElementById("membership_div").style.display = 'none';
		document.getElementById("order_div").style.display = 'none';
		document.getElementById("store_div").style.display = 'none';
		document.getElementById("product_table").style.display = 'none';
		document.getElementById("review_table").style.display = 'none';
		document.getElementById("detail_product").style.display = 'none';
		document.getElementById("QandA_div").style.display = 'none';
		if (pageNum == null) {
			pageNum = 1;
		}
		
		$.ajax("noticeList.do", {
			type: "get",
			data: { pageNum: pageNum },
			dataType: "json", 
			success: function(respData){
				let dispHtml = "";
				
				for (let index = 0; index < 10; index++) {
					if (respData.NoticeList[index] == null) {
						dispHtml += "<tr id=\"table_tr\" height=\"70px\">";
						dispHtml += "<td colspan=\"6\"></td>";
						dispHtml += "</tr>";
					} else {
						dispHtml += "<tr id=\"table_tr\" height=\"70px\">";
						dispHtml += "<td width=\"5%\">" + (index + 1) + "</td>";
						dispHtml += "<td width=\"5%\">" + respData.NoticeList[index].ncode + "</td>";
						dispHtml += "<td width=\"15%\">" + respData.NoticeList[index].ntitle + "</td>";
						dispHtml += "<td width=\"30%\">" + respData.NoticeList[index].ncontent + "</td>";
						dispHtml += "<td width=\"30%\">" + respData.NoticeList[index].ndate + "</td>";
						dispHtml += "<td width=\"30%\">";
						dispHtml += "<a href=\"#\"><img id=\"updateImg\" src=\"resources/image/update.png\" alt=\"수정\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
						dispHtml += "<a href=\"noticeDelete.do?ncode=" + respData.NoticeList[index].ncode + "\"><img id=\"deleteImg\" src=\"resources/image/delete.png\" alt=\"삭제\"></a>";
						dispHtml += "</td>";
						dispHtml += "</tr>";
					}
				}
				dispHtml += "<tr class=\"pagination\" height=\"50px\"><td colspan=\"6\">";
				
				if (respData.page < 2) {
					
					dispHtml += "<a>\<</a>&nbsp;&nbsp;";
				} else if ((respData.page - 1) < respData.startpage) {
					dispHtml += "<a href=\"javascript:announcement("+ (respData.endpage - 5) +");\">\<</a>&nbsp;&nbsp;";
				} else {
					dispHtml += "<a href=\"javascript:announcement("+ (respData.page - 1) +");\">\<</a>&nbsp;&nbsp;";
				}
				
				for (var pageCnt = respData.startpage; pageCnt <= respData.endpage; pageCnt++) {
					
					if (pageCnt == respData.page) {
						dispHtml += "<a class=\"active\" href=\"javascript:announcement("+ pageCnt +");\">" + pageCnt + "</a>&nbsp;&nbsp;";
					} else if (respData.page == respData.lastPage) {
						dispHtml += "<a class=\"active\" href=\"javascript:announcement("+ respData.lastPage +");\">" + respData.lastPage + "</a>&nbsp;&nbsp;";
						break;
					} else {
						dispHtml += "<a href=\"javascript:announcement("+ pageCnt +");\">" + pageCnt + "</a>&nbsp;&nbsp;";
					}
				}
				
				if (respData.page > respData.endpage) {
					dispHtml += "<a href=\"javascript:announcement("+ (respData.startpage + 5) +");\">\></a>&nbsp;&nbsp;";
				} else if (respData.page == respData.lastPage) {
					dispHtml += "<a>\></a>&nbsp;&nbsp;";
				} else {
					dispHtml += "<a href=\"javascript:announcement("+ (respData.page + 1) +");\">\></a>&nbsp;&nbsp;";
				}
				dispHtml += "</td></tr>";
				$("#notice_tbody").html(dispHtml);
			},
			error: function(){
				alert("실패");				
			}
		});
		document.getElementById("footer_div").style.display = 'block';
		document.getElementById("notice_div").style.display = 'block';

	}