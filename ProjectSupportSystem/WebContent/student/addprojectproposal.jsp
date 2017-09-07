<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BIT-University of Colombo School of Computing - Project
	Evaluation Support System</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="resources/styles/bitstudent.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/scripts/bitstudent.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>


</head>
<body>

	<jsp:include page="../_header.jsp" />
	<jsp:include page="../_leftSideBarStudent.jsp" />

	<div id="loginedUser">
		<p>You are logged in as: ${user.userName}</p>
	</div>
	<div class="changer" id="formload">
		<div id="proposal">
			<form class="form-horizontal" method="POST"
				action="DoAddProjectProposal">
				<c:if test="${param.success eq 1}">
					<div class="alert alert-success">
						<strong>Successfully Deleted !</strong>
					</div>
				</c:if>
				<c:if test="${param.success eq 0}">
					<div class="alert alert-warning">
						<strong>Successfully Updated !</strong>
					</div>
				</c:if>
				<center>
					<h4>Project Details</h4>
				</center>
				<div class="form-group">
					<label for="projectTitle" class="col-sm-3 control-label">
						Project Title: </label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="projectTitle"
							placeholder="Project Title" required>
					</div>
				</div>
				<div class="form-group">
					<label for="projectTitle" class="col-sm-3 control-label">
						Number of Attempts: </label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="noOfAttempts"
							placeholder="No of attempts (If repeat Student)" required>
					</div>
				</div>
				<div class="form-group">
					<label for="previousDecision" class="col-sm-3 control-label">
						previous Decision: </label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="previousDecision"
							placeholder="Previous Decision(if repeat student)" required>
					</div>
				</div>
				<div class="form-group">
					<label for="earlierTitle" class="col-sm-3 control-label">
						Earlier Project Title: </label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="earlierTitle"
							placeholder="Earlier Project Title(if repeat student)" required>
					</div>
				</div>
				<div class="form-group">
					<label for="motivationForProject" class="col-sm-3 control-label">
						Motivation for the Project: </label>
					<div class="col-sm-9">
						<textarea class="form-control" name="motivation" rows="3"
							placeholder="Motivation for the project" required></textarea>
					</div>
				</div>
				<div class="form-group">
					<label for="Objectives" class="col-sm-3 control-label">
						Objectives: </label>
					<div class="col-sm-9">
						<textarea class="form-control" name="objectives" rows="3"
							placeholder="Objectives" required></textarea>
					</div>
				</div>
				<div class="form-group">
					<label for="scope" class="col-sm-3 control-label"> Scope: </label>
					<div class="col-sm-9">
						<textarea class="form-control" name="scope" rows="3"
							placeholder="Scope of the project " required></textarea>
					</div>
				</div>
				<div class="form-group">
					<label for="functionlities" class="col-sm-3 control-label">
						Critical functionalities: </label>
					<div class="col-sm-9">
						<textarea class="form-control" name="funtionalities" rows="3"
							placeholder="Critical Functionalaties of for project" required></textarea>
					</div>
				</div>
				<div class="form-group">
					<label for="deliverables" class="col-sm-3 control-label">
						Deliverables: </label>
					<div class="col-sm-9">
						<textarea class="form-control" name="deliverables" rows="3"
							placeholder="Deliverables are Items that you would deliver to the client at the end of the project"
							required></textarea>
					</div>
				</div>
				<div class="form-group">
					<label for="resources" class="col-sm-3 control-label">
						Resource Requirements: </label>
					<div class="col-sm-9">
						<textarea class="form-control" name="resources" rows="3"
							placeholder="Eg : hardware,software, ...." required></textarea>
					</div>
				</div>

				<div class="form-group">
					<label for="evaluation" class="col-sm-3 control-label">
						Self-Evaluation: </label>
					<div class="col-sm-9">
						<textarea class="form-control" name="evauation" rows="3"
							placeholder="Proposed way of self evaluating the success of your system"
							required></textarea>
					</div>
				</div>




				<button type="submit" class="btn btn-default">Save</button>
			</form>
		</div>
	</div>

</body>
</html>