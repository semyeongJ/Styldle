# STYLDLE

<h3>개요</h3>
<span>STYLDLE은 패션SNS와 쇼핑몰이 결합된 eCommerce 웹사이트입니다.</span>

<h3>내용</h3>
<span>게시글을 통해서 자신만의 패션 스타일을 공유할 수 있고 좋아요와 댓글로 소통할 수 있는  SNS 기능과 마음에 드는 아이템은 바로 구매할 수 있는 자체 쇼핑몰로 구성되어 있습니다.</span>

<h4>주요기능</h4>
<ul>
<li>회원가입, 마이페이지 - 회원가입과 로그인, 로그아웃, 마이페이지에서 회원 정보 수정/탈퇴가 가능합니다.</li>
<li>SNS 스타일 게시판 - 본인만의 스타일을 게시글에 등록할 수 있고 조회, 수정, 삭제도 있으며 댓글과 좋아요 기능을 사용할 수 있습니다.</li>
<li>쇼핑몰 페이지 - 회원이 사용하는 페이지로 상품목록을 조회할 수 있고 상품을 클릭하면 상품의 상세페이지를 조회할 수 있습니다. 마음에 드는 상품은 장바구니에 추가할 수도 있습니다.</li>
<li>쇼핑몰 관리자 페이지 - 관리자가 사용하는 페이지로 상품목록과 주문목록을 조회 할 수 있고 새로운 상품을 등록할 수도 있습니다.</li>
<li>Q&A 커뮤니티 페이지 - 회원들 간에 고민이나 질문을 올리는 Q&A게시판으로 등록, 조회, 수정, 삭제가 가능하고 모달창을 이용한 댓글기능과 게시물 검색기능, 페이징기능을 구현했습니다.</li>
<li>결제시스템(API) - 결제시스템으로 아임포트의 카카오페이API를 사용하였습니다. 주문정보를 API에 전달하고 실행시켜 QR결제가 가능하도록 구현하였습니다. 결제 후에는 주문확인서 페이지로 넘어가 주문 내역을 확인할 수 있습니다.</li>
<li>장바구니/주문조회 - 회원이 쇼핑몰에서 마음에 드는 상품을 장바구니에 담고 주문 완료 후 자신의 주문내역을 주문조회 화면에서 확인 할 수 있습니다.</li>
<li>메인 페이지 - 메인 화면에서는 최근에 올라온 쇼핑몰 아이템과 SNS스타일 게시물이 보입니다. 슬라이스로 넘기며 확인 할 수 있습니다. 상단에는 각종 페이지로 넘어 갈 수 있는 네비게이션 바가 있습니다.</li>
</ul>
<span>제가 담당한 파트는 Q&A커뮤니티의 CRUD와 주문확인서, 결제API입니다.</span>
<h3>작업 환경</h3>
<ul>
<li>IntelliJ, Tomcat, MySQLWorkbench, Mybatis, Spring</li>
<li>Java, JavaScript, HTML, CSS 등</li>
</ul>
<h3>결과</h3>
<span>메인 페이지와 Q&A페이지, 회원의 스타일게시판, 쇼핑몰페이지, 쇼핑몰 관리자 페이지, 로그인/회원가입, 마이페이지, 결제API 구현에 성공했습니다. 개발 과정에 부족한 부분들은 채워가며 계획했던 방향과 거의 일치하게 개발하였습니다.</span>
