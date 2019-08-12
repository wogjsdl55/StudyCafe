<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<body class="landing-page sidebar-collapse">
  <%@ include file="/WEB-INF/views/include/top.jsp" %>

  <div class="page-header" data-parallax="true" style="background-image: url('/resources/img/bg-masthead.jpg');">
    <div class="container">
      <div class="motto text-center">
        <h1>문화/학습/카페 공간</h1>
        <h3>카페형 열린 스터디 홀, 그룹 스터디 룸, 힐링카페 홀.</h3>
        <br />
        <a href="" class="btn btn-outline-neutral btn-round" style="width: 15%; margin-right: 4%; font-size: 20px;">좌석선택</a>
        <a href="/member/member"><button type="button" class="btn btn-outline-neutral btn-round" style="width: 15%; font-size: 20px;">회원가입</button></a>
      </div>
    </div>
  </div>
  <div class="main">
    <div class="section text-center">
      <div class="container">
        <div class="row">
          <div class="col-md-8 ml-auto mr-auto">
            <h2 class="title">노맨의 Study Cafe</h2>
            <h5 class="description">
            	130평대 대형 오픈형
				스터디공간과<br/>
				2~20인이 들어가는 독립형 스터디룸 10여개를 갖춘<br/>
				노맨의 Study Cafe
            </h5>
            <br>
          </div>
        </div>
        <br/>
        <br/>
        <div class="row">
          <div class="col-md-3">
            <div class="info">
              <div class="icon icon-danger">
                <img src="/resources/img/trophy.png" style="width: 60px;">
              </div>
              <div class="description">
                <h4 class="info-title">집에서 과외하기 부담스러울 때</h4>
                <p class="description">부모님도 선생님도 조금씩 부담스러운 과외공간.<br/>그럴 때 바로 노맨의 Study Cafe가 해결 공간이고자 해요.</p>
              </div>
            </div>
          </div>
          <div class="col-md-3">
            <div class="info">
              <div class="icon icon-danger">
              	<img src="/resources/img/file.png" style="width: 60px;">
              </div>
              <div class="description">
                <h4 class="info-title">자유롭고 독립적인 공간</h4>
                <p>토론/모임 공간이 독립/자유롭고,<br/>최적의 OA 환경(대형모니터 등)을 갖춘 곳</p>
              </div>
            </div>
          </div>
          <div class="col-md-3">
            <div class="info">
              <div class="icon icon-danger">
                <img src="/resources/img/circle.png" style="width: 60px;">
              </div>
              <div class="description">
                <h4 class="info-title">오래 있어도 편한 곳</h4>
                <p>커피숍처럼 오랫동안 있다고해도 눈치 보지 않아도 되는 곳</p>
              </div>
            </div>
          </div>
          <div class="col-md-3">
            <div class="info">
              <div class="icon icon-danger">
                <img src="/resources/img/medal.png" style="width: 60px;">
              </div>
              <div class="description">
                <h4 class="info-title">집에서는 도저히...</h4>
                <p>집중도 안되고 뭔가 유혹이 많을 때…</br>노맨의 Study Cafe가 해결 공간이고자 해요.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="section section-dark text-center">
      <div class="container">
        <h2 class="title">스터디 갤러리</h2>
        <div class="row">
          <div class="col-md-4">
            <div class="card card-profile card-plain">
              <img src="/resources/img/study.jpg" alt="" style="height:300px;">
              <div class="card-body">
                  <div class="author">
                  	<h4 class="card-title">Group Study Room</h4>
                  </div>
                <p class="card-description text-center">
                  	과의, 토론, 모임에 집중하는 공간
                </p>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card card-profile card-plain">
              <img src="/resources/img/group.jpg" alt="" style="height:300px;">
              <div class="card-body">
                <a href="#paper-kit">
                  <div class="author">
                    <h4 class="card-title">Private Study Hall</h4>
                  </div>
                </a>
                <p class="card-description text-center">
                  	나를 위해 집중하고 사색하는 공간
                </p>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card card-profile card-plain">
              <img src="/resources/img/healing.jpg" alt="" style="height:300px;">
              <div class="card-body">
                <a href="#paper-kit">
                  <div class="author">
                    <h4 class="card-title">Healing Cafe Hall</h4>
                  </div>
                </a>
                <p class="card-description text-center">
                  	지치면 쉴 수 있는....편한 공간
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="section landing-section">
      <div class="container">
        <div class="row">
          <div class="col-md-8 ml-auto mr-auto">
            <h2 class="text-center">Keep in touch?</h2>
            <form class="contact-form">
              <div class="row">
                <div class="col-md-6">
                  <label>Name</label>
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text">
                        <i class="nc-icon nc-single-02"></i>
                      </span>
                    </div>
                    <input type="text" class="form-control" placeholder="Name">
                  </div>
                </div>
                <div class="col-md-6">
                  <label>Email</label>
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text">
                        <i class="nc-icon nc-email-85"></i>
                      </span>
                    </div>
                    <input type="text" class="form-control" placeholder="Email">
                  </div>
                </div>
              </div>
              <label>Message</label>
              <textarea class="form-control" rows="4" placeholder="Tell us your thoughts and feelings..."></textarea>
              <div class="row">
                <div class="col-md-4 ml-auto mr-auto">
                  <button class="btn btn-danger btn-lg btn-fill">Send Message</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  <footer class="footer   footer-white ">
    <div class="container">
      <div class="row">
        <nav class="footer-nav">
          <ul>
            <li>
              <a href="https://www.creative-tim.com" target="_blank">Creative Tim</a>
            </li>
            <li>
              <a href="http://blog.creative-tim.com/" target="_blank">Blog</a>
            </li>
            <li>
              <a href="https://www.creative-tim.com/license" target="_blank">Licenses</a>
            </li>
          </ul>
        </nav>
        <div class="credits ml-auto">
          <span class="copyright">
            ©
            <script>
              document.write(new Date().getFullYear())
            </script>, made with <i class="fa fa-heart heart"></i> by Creative Tim
          </span>
        </div>
      </div>
    </div>
  </footer>
</body>
</html>
