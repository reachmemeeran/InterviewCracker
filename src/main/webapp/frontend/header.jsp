    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
        integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
    <link rel="stylesheet" href="css/style.css"> 
        <div class="header">
            <div class="link-item-h first-item">
            	<a class="ah" href="${pageContext.request.contextPath}">
                	<img src="images/InterviewCracker.jpg" style="width:63px;height:63px;">
                </a>
            </div>
            <div class="middle-item">
                <div class="link-item-h">
                	<a class="ah" href="list_pop_exercise">POP Exercises</a>
                </div>
                <div class="link-item-h">
                    <a class="ah" href="list_code">Coding Challenge</a>
                </div>
                
            </div>
            <div class="link-item-h staff-cont">
            <c:if test="${loggedStudent!=null }">
            	<c:if test="${profilepic!=null }">
            	<img src="data:image/jpeg;base64,${profilepic}" style="width:60px;height:50px;border-radius:50%"/>
            	</c:if>
            	<c:if test="${profilepic==null }">
            		<div class="staff-icon"><a class="fa-solid fa-staff"></a></div>
            	</c:if>
                <a class="ah" href="student_profile">Welcome, ${loggedStudent.fullname } </a>
                <i><a class="ah" href="logout"> <span>Logout</span></a></i>
            </c:if>
            <c:if test="${loggedStudent==null }">
            	<a class="ah" href="login">Sign In</a>
            	<a class="ah" href="register">Student Register</a>
            </c:if>
            </div>
            <!-- <div class="right-item">
                <div class="link-item-h margin-left-3">
                   <a class="fa-solid fa-magnifying-glass"></a>
                </div>
                <div class="link-item-h margin-left-3">
                   <a class="fa-solid fa-inbox"></a>
                </div>
                <div class="link-item-h margin-left-3">
                   <a class="fa-solid fa-bell"></a>
                </div>
                <div class="link-item-h margin-left-3">
                   <a class="fa-solid fa-cart-shopping"></a>
                </div>
            </div> -->

        </div>
        <div class="sidebar">
            <div class="link-item-s">
                <a class="fa fa-bars"></a>
            </div>
            <div class="link-item-s item-margin-2">
                <a class="fa-solid fa-code"></a>
            </div>
            <div class="link-item-s">
                <a class="fa-solid fa-university"></a>
            </div>
            <div class="link-item-s">
                <a class="fa-solid fa-bars-progress"></a>
            </div>
            <div class="link-item-s">
            	<a class="fa-solid fa-chart-column"></a>
            </div>
            <div class="link-item-s item-last">
            	<a class="fa-solid fa-gear"></a>
            </div>
        </div>

