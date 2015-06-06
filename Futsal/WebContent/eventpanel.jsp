<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Manage booking</title>
<link rel="stylesheet" type="text/css" media="screen" href="bootstrap/css/bootstrap-datetimepicker.min.css">
<script type="text/javascript" src="bootstrap/moment/moment.js"></script>
<script type="text/javascript" src="bootstrap/js/jquery.min.js"></script> 
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap-datetimepicker.min.js"></script>
</head>
<body>
<p align="center"><jsp:include page="menubar.jsp" /></p>

<div class="container">
<div class="jumbotron"></div>
<div class="row">
<div class="col-md-3 first"></div>
<div class="col-md-6 second">
<form action="Event" method="post">
	<input type="hidden" name="eventid" value="${eventinfo.eventId}">
	<table border="1" align="center" class="table table-bordered table-hover">
	<tr><td colspan=2 align="center"><h1>Event</h1></td></tr>
	<tr><td>Event Name:</td><td><input type="text" name="name" value="${eventinfo.eventName}"></td></tr>
	<tr><td>Event Time:</td>
	<td align="center">
	
	<%-- start time --%>
	<div class='input-group date' id='datetimepickerstart'>
        <input type='text' class="form-control" name="start" placeholder="Start time" value="<fmt:formatDate value="${eventinfo.eventStart}" pattern="dd/MM/yyyy HH:mm" />" />
        <span class="input-group-addon">
            <span class="glyphicon glyphicon-calendar"></span>
        </span>
    </div>
	<%-- end time --%>
	<div class='input-group date' id='datetimepickerend'>
       <input type='text' class="form-control" name="end" placeholder="End time" value="<fmt:formatDate value="${eventinfo.eventEnd}" pattern="dd/MM/yyyy HH:mm" />" />
       <span class="input-group-addon">
           <span class="glyphicon glyphicon-calendar"></span>
       </span>
    </div>
    
	<script type="text/javascript">
	    $(function () {
	        $('#datetimepickerstart').datetimepicker({
            	showTodayButton: true,
            	format: "DD/MM/YYYY HH:mm"
            });
	        $('#datetimepickerend').datetimepicker({
            	showTodayButton: true,
            	format: "DD/MM/YYYY HH:mm"
            });
	        $("#datetimepickerstart").on("dp.change", function (e) {
	            $('#datetimepickerend').data("DateTimePicker").minDate(e.date);
	        });
	        $("#datetimepickerend").on("dp.change", function (e) {
	            $('#datetimepickerstart').data("DateTimePicker").maxDate(e.date);
	        });
	    });
	</script>
	</td></tr>
	<tr><td>Court</td><td><em>All courts are closed to public during event.</em></td>
	</tr>
	<tr><td colspan="2" align="center"><input type="submit" value="Submit" class="btn btn-primary"></td></tr>
	</table>
</form>
</div>
<div class="col-md-3 third"></div>
</div>
</div>
</body>
</html>