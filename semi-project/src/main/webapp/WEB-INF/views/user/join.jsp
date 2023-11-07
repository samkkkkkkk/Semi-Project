<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../include/header.jsp"%>

<link
  href="${pageContext.request.contextPath }/css/select1.css"
  rel="stylesheet"
/>
<style>
  .container {
    max-width: 80vh;
    margin: 0 auto;
    padding: 20px;
  }
  html,
  body {
    width: 100%;
    height: auto;
  }

  .inputContainer {
    /* border: 1px solid black; */
    width: 66%;
    margin: auto;
  }

  .join-form {
    background: #fff;
    padding: 20px;
    border: 1px solid #e0e0e0;
    border-radius: 5px;
  }

  /* Style the title box */
  .titlebox {
    text-align: center;
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 20px;
  }

  /* Style form fields and labels */
  .form-group {
    margin-bottom: 20px;
  }

  .form-group label {
    font-weight: bold;
  }

  .form-control {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
  }

  /* Style buttons */
  .btn {
    width: 100%;
    padding: 10px;
    font-size: 16px;
  }

  .btn-primary {
    background-color: rgb(50, 96, 122);
    color: #fff;
    border: none;
    cursor: pointer;
  }

  .btn-primary:hover {
    background-color: rgb(40, 80, 100);
  }

  .btn-success {
    background-color: rgb(50, 96, 122);
    color: #fff;
    border: none;
    cursor: pointer;
  }

  .btn-success:hover {
    background-color: rgb(40, 80, 100);
  }

  .btn-info {
    background-color: #00a0e9;
    color: #fff;
    border: none;
    cursor: pointer;
  }

  .btn-info:hover {
    background-color: #0080c9;
  }

  /* Style the mail-check-box input */
  .mail-check-box .form-control {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
    margin-top: 10px;
  }

  /* Style the mail-check-warn message */
  #mail-check-warn {
    color: red;
    margin-top: 10px;
  }

  /* Style the address search button */
  .input-group-addon button {
    background-color: rgb(50, 96, 122);
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
  }

  .input-group-addon button:hover {
    background-color: rgb(40, 80, 100);
  }

  .mail-check-box.mailBtn button {
    position: absolute;
    right: 3px;
    bottom: 2px;
    height: 35px;
    font-size: 10;
    border-radius: 5px;
  }

  .mail-check-box {
    position: relative;
  }

  .input-group.idBtn {
    position: relative;
  }

  .input-group-addon.idBtn button {
    position: absolute;
    right: 2px;
    top: 3px;
    height: 35px;
    width: 60px;
    font-size: 10;
  }

  /* .idWarn {
    font-size: 13;
    font-weight: bold;
    color: red;
    text-align: left;
    width: 200px;
  } */
</style>
<section>
  <div class="container">
    <div class="join-form">
      <div class="titlebox">logo</div>
      <div class="inputContainer inputCenter">
        <form
          action=""
          method="post"
          name="joinForm"
        >
          <div class="form-group">
            <!--사용자클래스선언-->
            <label for="id">아이디</label>
            <div class="input-group idBtn">
              <!--input2탭의 input-addon을 가져온다 -->
              <input
                type="text"
                id="userId"
                name="userId"
                class="form-control"
                id="userId"
                placeholder="아이디를 (영문포함 8~12자 이상)"
              />
              <div class="input-group-addon idBtn">
                <button
                  type="button"
                  id="idCheckBtn"
                  class="btn btn-primary"
                >
                  중복확인
                </button>
              </div>
              <span
                id="idTest"
                class="idWarn"
              ></span>
            </div>
            <span id="msgId"></span>
            <!--자바스크립트에서 추가-->
          </div>
          <div class="form-group">
            <!--기본 폼그룹을 가져온다-->
            <label for="password">비밀번호</label>
            <input
              type="password"
              class="form-control"
              id="userPw"
              name="userPw"
              placeholder="비밀번호 (영 대/소문자, 숫자 조합 7~16자 이상)"
            />
            <span id="msgPw"></span>
            <!--자바스크립트에서 추가-->
          </div>
          <div class="form-group">
            <label for="password-confrim">비밀번호 확인</label>
            <input
              type="password"
              class="form-control"
              id="pwConfirm"
              placeholder="비밀번호를 확인해주세요."
            />
            <span id="msgPw-c"></span>
            <!--자바스크립트에서 추가-->
          </div>
          <div class="form-group">
            <label for="name">이름</label>
            <input
              type="text"
              class="form-control"
              id="userName"
              name="userName"
              placeholder="이름을 입력하세요."
            />
          </div>
          <!--input2탭의 input-addon을 가져온다 -->
          <div class="form-group email-form">
            <label for="email">이메일</label><br />
            <div class="input-group">
              <input
                type="text"
                class="form-control"
                id="userEmail1"
                name="userEmail1"
                placeholder="이메일"
              />
              <select
                class="form-control"
                id="userEmail2"
                name="userEmail2"
              >
                <option>@naver.com</option>
                <option>@daum.net</option>
                <option>@gmail.com</option>
              </select>
              <div class="input-group-addon">
                <button
                  type="button"
                  id="mail-check-btn"
                  class="btn btn-primary"
                >
                  이메일인증
                </button>
              </div>
            </div>
          </div>
          <div class="mail-check-box mailBtn">
            <input
              type="text"
              class="form-control mail-check-input"
              placeholder="인증번호 6자리를 입력하세요."
              maxlength="6"
              disabled="disabled"
            />
            <button
              type="button"
              class="btn-primary mailNumBtn"
            >
              인증번호확인
            </button>
            <span id="mail-check-warn"></span>
          </div>
          <!--button탭에 들어가서 버튼종류를 확인한다-->
          <div class="form-group">
            <button
              type="button"
              id="joinBtn"
              class="btn btn-lg btn-success btn-block"
            >
              회원가입
            </button>
          </div>
          <div class="form-group">
            <button
              type="button"
              class="btn btn-lg btn-info btn-block"
              onclick="location.href='${pageContext.request.contextPath}/user/login'"
            >
              로그인
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</section>

<%@ include file="../include/footer.jsp"%>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
  let checkEmail = '';
  let idValTst, pwValTst;

  let $idTest = document.getElementById('idTest');

  // 아이디 경고창 숨겨주기
  //   document.getElementById('idTest').style.display = 'none';
  // 아이디를 입력하지 않았을 때 경고문
  document.getElementById('idCheckBtn').onclick = () => {
    const userId = document.getElementById('userId').value;
    console.log('userId: ' + userId);
    if (userId === '') {
      $idTest.style.cssText = `color : red; font-size : 12px`;
      $idTest.innerHTML = '아이디를 입력해주세요.';
      return;
    }

    fetch('${pageContext.request.contextPath}/user/id/' + userId)
      .then((res) => res.text())
      .then((result) => {
        if (result === 'ok') {
          document.getElementById('userId').setAttribute('readonly', true);
          document.getElementById('idCheckBtn').setAttribute('disabled', true);
          document.getElementById('msgId').textContent =
            '사용 가능한 아이디 입니다.';
        } else {
          document.getElementById('msgId').textContent =
            '중복된 아이디 입니다.';
          document.getElementById('userId').value = '';
          document.getElementById('userId').focus();
        }
      });
  }; // 아이디 중복확인 끝.

  //인증번호 이메일 전송
  document.getElementById('mail-check-btn').onclick = function () {
    const email =
      document.getElementById('userEmail1').value +
      document.getElementById('userEmail2').value;
    console.log('완성된 email: ', email);
    fetch('${pageContext.request.contextPath}/user/email', {
      method: 'post',
      headers: {
        'Content-Type': 'text/plain',
      },
      body: email,
    })
      .then((res) => res.text())
      .then((data) => {
        console.log('인증번호: ', data);
        //비활성화된 인증번호 입력창을 활성화
        document.querySelector('.mail-check-input').disabled = false;
        code = data; //서버가 전달한 인증번호를 전역변수에 저장.
        alert('인증번호가 전송되었습니다. 확인 후 입력란에 정확히 입력하세요.');
      })
      .catch((error) => {
        console.log(error);
        alert('알 수 없는 문제가 발생했습니다. 관리자에게 문의하세요!');
      }); // 비동기 끝.
  }; //이메일 인증 버튼 클릭 이벤트 끝

  document.querySelector('.mailNumBtn').onclick = function () {
    // console.log('blur 이벤트 발생 확인!');
    const mailCode = document.querySelector('.mail-check-input').value;
    const $resultMsg = document.getElementById('mail-check-warn'); //span
    console.log('사용자가 입력한 값: ', mailCode);

    if (mailCode === code) {
      $resultMsg.textContent = '인증번호가 일치합니다.';
      $resultMsg.style.color = 'green';
      //이메일 인증을 더 이상 못하게 버튼 비활성.
      document.getElementById('mail-check-btn').disabled = true;
      document.getElementById('userEmail1').setAttribute('readonly', true);
      document.getElementById('userEmail2').setAttribute('readonly', true);

      document.querySelector('.mail-check-input').style.display = 'none'; //인증번호 입력창 숨기기

      //select 태그에서 초기값을 사용자가 선택한 값으로 무조건 설정하는 방법
      const $email2 = document.getElementById('userEmail2');

      //사용자가 select의 옵션을 처음 선택했을 때의 값을 기억했다가
      //option 변경 시도를 할 때마다 초기값으로 강제로 변경해서
      //option이 마치 변하지 않는 것처럼 처리.
      $email2.setAttribute(
        'onFocus',
        'this.initialSelect = this.selectedIndex'
      );
      $email2.setAttribute(
        'onChange',
        'this.selectedIndex = this.initialSelect'
      );
    } else {
      $resultMsg.textContent = '인증번호를 다시 확인해 주세요.';
      $resultMsg.style.color = 'red';
      document.querySelector('.mail-check-input').focus();
    }
  }; //인증번호 검증 끝.

  //폼 데이터 검증 (회원 가입 버튼 눌렀을 시)
  document.getElementById('joinBtn').onclick = function () {
    if (idValTst && pwValTst) {
      if (!document.getElementById('userId').getAttribute('readonly')) {
        alert('아이디 중복체크는 필수입니다!');
        return;
      }
      if (document.getElementById('userName').value === '') {
        alert('이름은 필수값입니다.');
        return;
      }
      if (!document.getElementById('mail-check-btn').disabled) {
        alert('이메일 인증을 완료해 주세요.');
        return;
      }

      if (confirm('회원가입을 진행합니다.')) {
        document.joinForm.submit();
      } else return;
    } else {
      alert('입력값을 다시 한 번 확인하세요!');
    }
  };

  /*아이디 형식 검사 스크립트*/
  var id = document.getElementById('userId');
  id.onkeyup = function () {
    // 정규표현식
    var regex = /^[A-Za-z0-9+]{8,12}$/;
    // test(문자열) -> 정규표현식의 규칙에 어긋나지 않는 문자라면 true, 어긋난다면 false
    if (regex.test(document.getElementById('userId').value)) {
      document.getElementById('userId').style.borderColor = 'green';
      document.getElementById('msgId').innerHTML =
        '아이디 중복 체크는 필수 입니다';
      idValTst = true;
    } else {
      document.getElementById('userId').style.borderColor = 'red';
      document.getElementById('msgId').innerHTML = '부적합한 아이디 입니다.';
      idValTst = false;
      document.getElementById('idTest').style.display = 'none';
    }
  };

  /*비밀번호 형식 검사 스크립트*/
  var pw = document.getElementById('userPw');
  pw.onkeyup = function () {
    // var pattern1 = /[0-9]/;
    // var pattern2 = /[a-zA-Z]/;
    // var pattern3 = /[~!@#$%^&*]/;
    var regex = /^[A-Za-z0-9+]{8,16}$/;
    if (regex.test(document.getElementById('userPw').value)) {
      document.getElementById('userPw').style.borderColor = 'green';
      document.getElementById('msgPw').innerHTML = '사용가능합니다';
      pwValTst = true;
    } else {
      document.getElementById('userPw').style.borderColor = 'red';
      document.getElementById('msgPw').innerHTML =
        '비밀번호를 제대로 입력하세요.';
      pwValTst = false;
    }
  };

  /*비밀번호 확인검사*/
  var pwConfirm = document.getElementById('pwConfirm');
  pwConfirm.onkeyup = function () {
    var regex = /^[A-Za-z0-9+]{8,16}$/;
    if (
      document.getElementById('pwConfirm').value ==
      document.getElementById('userPw').value
    ) {
      document.getElementById('pwConfirm').style.borderColor = 'green';
      document.getElementById('msgPw-c').innerHTML = '비밀번호가 일치합니다';
      pwValTst = true;
    } else {
      document.getElementById('pwConfirm').style.borderColor = 'red';
      document.getElementById('msgPw-c').innerHTML =
        '비밀번호 확인란을 확인하세요';
      pwValTst = false;
    }
  };
</script>
