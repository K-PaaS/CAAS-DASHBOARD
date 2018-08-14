<%--
  Namespaces main
  @author Hyungu Cho
  @version 1.0
  @since 2018.08.14
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div style="padding: 10px;">
    DEPLOYMENT 대시보드 :: DEPLOYMENT DASHBOARD
    <div style="padding: 10px;">
        <button type="button" id="btnSearch"> [ 조회 ] </button>
        <button type="button" id="btnReset"> [ 목록 초기화 ] </button>
    </div>
    <h1>RESULT</h1>
    <div id="resultArea" style="width: 98%; height: auto; min-height: 100px; padding: 10px; margin: 1%; border: dotted deepskyblue 4px;">
    </div>
</div>
<script type="text/javascript">

  // GET LIST
  var getList = function() {
    procCallAjax("/workload/deployments/getList.do", "GET", null, null, callbackGetList);
  };


  // CALLBACK
  var callbackGetList = function(data) {
    if (RESULT_STATUS_FAIL === data.resultStatus) return false;

    var htmlString = [];
    htmlString.push("DEPLOYMENTS LIST :: <br><br>");

    /*
    var items = data.items;
    var listLength = items.length;

    for (var i = 0; i < listLength; i++) {
      htmlString.push(
        "name :: " + items[i].name + " || "
        + "uid :: " + items[i].uid
        + "<br><br>");
    }
    */
    // TODO :: DEBUG ONLY (진입점)
    htmlString.push( "type :: " + data.type + " || " + "status :: " + data.status);

    $('#resultArea').html(htmlString);
  };


  // BIND
  $("#btnSearch").on("click", function() {
    getList();
  });


  // BIND
  $("#btnReset").on("click", function() {
    $('#resultArea').html("");
  });


  // ON LOAD
  $(document.body).ready(function () {
    //
  });

</script>
