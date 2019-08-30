<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<header id="header">
     <div class="container">
         <div class="row">
             <div class="col-sm-12 overflow">
                <div class="social-icons pull-right">
                     <ul class="nav nav-pills">
    	                <sec:authorize access="isAnonymous()">
    	                	<li>
    	                		<a href="/SOWLBOOKS/member/logIn">
    	                			<h5>
    	                				<b>
    	                					<x>
    	                						LOGIN
    	                					</x>
    	                				</b>
    	                			</h5>
    	                		</a>
    	                	</li>
							<li>
								<a href="/SOWLBOOKS/member/signIn">
									<h5>
										<b>
											<x>
												JOIN
											</x>
										</b>
									</h5>
								</a>
							</li>
						</sec:authorize>

						<sec:authorize access="isAuthenticated()">
							<li>
								 <form action="/SOWLBOOKS/member/logOut" method="POST">
							        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							        	<b><sec:authentication property="principal.username"/></b>님, 반갑습니다. &nbsp;&nbsp;
							        <button type="submit" class="btn btn-sm btn-default">LOGOUT</button>
							    </form>
							</li>
						</sec:authorize>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<div class="navbar navbar-inverse" role="banner">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <a class="navbar-brand" href="/SOWLBOOKS/">
                    <h1><img src="/SOWLBOOKS/resources/bootstrap/images/logo.PNG" alt="logo"></h1>
                </a>

            </div>
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li class="active"><a href="/SOWLBOOKS/"><h3><b><x>Home</x></b></h3></a></li>
				<li><a href="/SOWLBOOKS/notice/notice"><h3><b><p>공지사항</p></b></h3></a></li>
                    <li><a href="/SOWLBOOKS/book/bookSearch"><h3><p><b>자료 검색</b></p></h3></a></li>
                    

                    <sec:authorize access="hasRole('ROLE_ADMIN')">
	                    <li class="dropdown"><a><h3><b><p>도서 관리<i class="fa fa-angle-down "></i></p></b></h3></a>
	                      <ul role="menu" class="sub-menu">
	                          <li><a href="/SOWLBOOKS/loan/memberCheck">대출</a></li>
	                          <li><a href="/SOWLBOOKS/loan/returnpage">반납</a></li>
	                      </ul>
	                    </li>
                    </sec:authorize>
				<sec:authorize access="hasRole('ROLE_USER')">
					<sec:authentication property='principal.username' var="logInID"/>
					<li><a href="/SOWLBOOKS/member/myInfo?member_id=${logInID }"><h3><b><p>내 정보 확인</p></b></h3></a></li>
				</sec:authorize>
				
				<sec:authorize access="isAnonymous()">
					<li><a href="/SOWLBOOKS/member/myInfo"><h3><b><p>내 정보 확인</p></b></h3></a></li>
				 </sec:authorize>
				
                    <li class="dropdown"><a><h3><b><p>게시판<i class="fa fa-angle-down "></i></p></b></h3></a>
	                    <ul role="menu" class="sub-menu">
	                        <li><a href="/SOWLBOOKS/qna/qnaList">Q & A</a></li>
	                        <li><a href="/SOWLBOOKS/qna/fna">자주 하는 질문</a></li>
	                    </ul>
                	</li>
                </ul>
            </div>
		</div>
	</div>
</header>
