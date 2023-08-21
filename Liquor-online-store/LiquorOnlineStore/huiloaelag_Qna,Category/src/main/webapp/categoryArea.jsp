<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>area</title>
<link rel="stylesheet" href="./resources/css/common.css">
<style>
	.container {
		padding-left: 300px;
		display:inline-block;
		vertical-align:top;
	}
	#img {
		width: 700px;
		height: 1000px;
	}
	#areaText {
		display:inline-block;
		padding-top: 100px;
		padding-left: 50px;
	}
	#main {
		color: #6D3114;
		margin: 0 auto;
		text-align: center;
	}
	#sul {
		width: 120px; 
		height: 170px;
		display:inline-block;
		vertical-align:top;
		margin-right: 30px;
	}
	#text {
		display:inline-block;
		/* margin: 0 auto; */
		text-align: center;
		margin-top: 25px;
	}
	ul li {
		text-align: center;
	}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-rwdImageMaps/1.6/jquery.rwdImageMaps.min.js"></script>
<script>
	$(function(){
		$('img[usemap]').rwdImageMaps();
		$("#img").width("100%");
	});
</script>
<script>
	function getJsonAreaListData(data) {
		if (data == 1) {
			var pLocal = "SEL";
			var area = "서울"
		} else if (data == 2) {
			var pLocal = "GGD";
			var area = "경기도"
		} else if (data == 3) {
			var pLocal = "CCD";
			var area = "충청도"
		} else if (data == 4) {
			var pLocal = "GSD";
			var area = "경상도"
		} else if (data == 5) {
			var pLocal = "JLD";
			var area = "전라도"
		} else if (data == 6) {
			var pLocal = "JJD";
			var area = "제주도"
		}
		
		$.ajax("getJsonAreaList.do?pLocal=" + pLocal, {
			type: "get", 
			data: pLocal,
			dataType: "json", //응답받을 데이터 타입
			success: function(respData){
				console.log(respData);
				
				let dispHtml = '<h2> \"' + area + '\" 로 검색된 전통주 결과</h2><br>'
				dispHtml += "<table>";
				$.each(respData, function(index, area){
					dispHtml += "<tr>";
					dispHtml += "<th>";
					dispHtml += "<img id='sul' src='./resources/img/alcohol/" + area.pImg + "'>";
					dispHtml += "</th>";
					dispHtml += "<td>";
					dispHtml += "<div id='text'>";
					dispHtml += "<h3>" + this.pName + "</h3>" + "<p>";
					dispHtml += "가격 : " + this.pPrice + "<p>";
					dispHtml += this["pInfo"] + "</div>";
					dispHtml += "<br>";
					dispHtml += "<hr><br>";
					dispHtml += "</td>";
					dispHtml += "</tr>";
				});
				
				dispHtml += "</table>";
				$("#areaText").html(dispHtml);
			},
			error: function(){
				alert("실패~~~");
			}
		});
	}
</script>
</head>
<body>
<%-- <jsp:include page="/resources/js/header.jsp" /> --%>

<h1 id="main">원하는 지역을 선택해주세요.</h1>
<p id="main">*선택한 지역별 생산, 전통주를 확인할 수 있습니다*</p>
<div class="container">
	<img src="resources/img/map22.png" usemap="#photo" id="img">
	<map id="photo" name="photo">
	    <area shape="poly" alt="서울" href="javascript:getJsonAreaListData(1)" coords="919,861,894,891,875,910,881,923,860,927,839,918,846,944,858,963,873,971,888,986,902,971,923,977,947,971,966,952,974,935,982,920,955,931,949,912,955,901,947,872">
	    <area shape="poly" alt="경기도" href="javascript:getJsonAreaListData(2)" coords="806,758,804,779,810,832,812,857,789,863,782,840,749,842,757,878,778,899,787,916,820,929,829,969,829,1000,823,1021,831,1034,856,1045,860,1064,839,1068,823,1076,801,1064,812,1087,791,1101,806,1125,844,1095,850,1106,871,1112,841,1118,829,1133,839,1152,823,1158,852,1171,873,1137,877,1163,852,1188,890,1224,907,1192,930,1188,913,1209,928,1217,955,1203,980,1209,1012,1230,1025,1222,1037,1203,1052,1207,1060,1182,1079,1173,1088,1158,1115,1158,1138,1152,1141,1118,1166,1112,1187,1104,1185,1078,1191,1051,1195,1030,1195,1011,1204,977,1195,950,1216,933,1195,914,1172,914,1143,901,1111,899,1107,872,1111,853,1105,823,1111,807,1122,788,1130,764,1117,750,1107,724,1088,729,1077,684,1037,687,1023,661,997,655,978,651,966,674,949,657,932,638,913,625,905,657,875,687,865,716,888,672,867,710,867,703,854,729,841,746,818,748,867,710">
	    <area shape="poly" alt="충청도" href="javascript:getJsonAreaListData(3)" coords="907,1218,863,1241,865,1270,841,1285,846,1247,846,1218,829,1232,827,1199,804,1190,793,1207,772,1209,759,1178,753,1188,742,1203,730,1236,715,1247,713,1215,709,1194,688,1190,694,1205,696,1232,686,1245,665,1241,656,1207,635,1228,612,1251,608,1268,601,1293,608,1310,627,1312,654,1310,675,1306,686,1338,724,1325,732,1348,715,1367,717,1392,721,1422,740,1445,751,1491,747,1527,732,1561,770,1592,799,1637,825,1622,852,1603,867,1592,875,1567,888,1565,911,1569,945,1567,961,1588,980,1597,1006,1586,1029,1573,1039,1599,1058,1624,1086,1641,1109,1641,1128,1622,1149,1613,1172,1620,1202,1620,1223,1616,1254,1613,1261,1578,1275,1555,1286,1540,1288,1515,1263,1523,1244,1506,1223,1508,1216,1483,1233,1474,1227,1445,1227,1418,1239,1401,1218,1382,1208,1363,1223,1352,1231,1323,1248,1321,1261,1300,1288,1312,1305,1308,1292,1268,1322,1268,1328,1249,1351,1264,1362,1239,1383,1253,1412,1276,1433,1262,1435,1222,1444,1201,1469,1184,1484,1159,1509,1152,1477,1144,1456,1135,1431,1131,1414,1116,1376,1119,1372,1100,1387,1087,1360,1076,1349,1070,1336,1079,1315,1081,1307,1097,1282,1093,1280,1074,1265,1072,1252,1093,1239,1114,1204,1119,1183,1102,1164,1116,1145,1114,1134,1154,1088,1154,1077,1178,1056,1184,1035,1207,1020,1226,987,1209,966,1201,936,1211">
	    <area shape="poly" alt="경상도" href="javascript:getJsonAreaListData(4)" coords="1511,1160,1555,1156,1560,1127,1591,1148,1650,1148,1688,1148,1713,1167,1745,1122,1785,1127,1799,1211,1814,1274,1821,1314,1789,1367,1818,1424,1802,1455,1779,1502,1791,1565,1787,1605,1785,1636,1846,1601,1846,1651,1842,1702,1821,1754,1817,1813,1802,1870,1772,1845,1777,1887,1779,1942,1722,1946,1743,1990,1680,2041,1640,2024,1614,2047,1545,2049,1507,2011,1480,1997,1484,2018,1499,2051,1509,2070,1547,2163,1520,2203,1490,2224,1457,2220,1442,2247,1408,2262,1387,2272,1347,2235,1349,2169,1332,2157,1301,2190,1299,2230,1252,2222,1216,2190,1197,2117,1181,2083,1130,2026,1124,1961,1139,1925,1145,1887,1141,1862,1132,1832,1147,1820,1147,1775,1178,1733,1185,1714,1221,1700,1242,1674,1239,1645,1227,1626,1275,1584,1275,1558,1298,1539,1290,1516,1265,1521,1243,1504,1227,1510,1227,1489,1237,1472,1233,1419,1237,1398,1218,1369,1233,1344,1248,1325,1267,1306,1298,1316,1313,1310,1300,1276,1324,1272,1340,1261,1361,1261,1376,1245,1408,1270,1431,1259,1439,1234,1454,1200,1486,1173">
	    <area shape="poly" alt="전라도" href="javascript:getJsonAreaListData(5)" coords="799,1683,837,1683,812,1714,829,1740,793,1733,753,1767,719,1792,742,1820,782,1820,780,1843,753,1847,717,1860,702,1881,723,1923,696,1923,709,1948,688,1944,677,1980,664,2001,627,2043,633,2066,643,2100,662,2102,664,2125,648,2134,635,2150,660,2159,692,2125,686,2159,686,2191,658,2214,645,2220,637,2266,637,2296,612,2317,576,2336,568,2348,587,2363,620,2367,656,2353,673,2327,690,2332,711,2342,717,2367,715,2382,715,2407,732,2431,759,2401,791,2393,827,2380,854,2370,875,2361,898,2336,900,2306,921,2311,947,2325,985,2344,1020,2348,1056,2330,1069,2315,1081,2300,1094,2287,1130,2266,1161,2266,1174,2226,1183,2212,1187,2188,1210,2180,1187,2100,1132,2026,1124,1963,1134,1919,1147,1875,1132,1837,1147,1818,1145,1771,1172,1736,1187,1712,1233,1691,1241,1660,1229,1622,1201,1611,1151,1609,1107,1637,1067,1626,1048,1605,1031,1578,972,1588,940,1567,902,1565,877,1569,865,1594,793,1639,759,1674">
	    <area shape="poly" alt="제주도" href="javascript:getJsonAreaListData(6)" coords="688,2778,645,2787,587,2837,582,2881,629,2917,660,2896,715,2898,751,2890,780,2883,801,2869,835,2867,862,2833,883,2803,896,2778,879,2763,831,2757,793,2740">
	</map>
</div>
	
<div id="areaText">
	<p></p>
</div>

<br><br><br>
<jsp:include page="/resources/js/footer.jsp" />
</body>
</html>