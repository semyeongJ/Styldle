<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Styldle</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="/resources/images/icons/favicon.png"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/fonts/iconic/css/material-design-iconic-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/fonts/linearicons-v1.0.0/icon-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/slick/slick.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/MagnificPopup/magnific-popup.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/perfect-scrollbar/perfect-scrollbar.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/css/util.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/main.css">
    <!--===============================================================================================-->
</head>

<body class="animsition">

<%--<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>--%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script type="text/javascript" src="/resources/js/heart.js"></script>
<style>
    #heart {
        cursor: pointer;
    }
    #imgDiv {
        width: 100%;
    }
    .chat li {
        margin-bottom: 15px;
    }
    #tagDiv td {
        padding-right: 8px;
    }
    #tagDiv th {
        padding-right: 15px;
        color: #0b0b0b;
    }
    #tagDiv img {
        width: 100px;
        height: 100px;
        border-radius: 15px;
    }
    #tagDiv div {
        border: 1px solid #DCDCDC;
        border-radius: 16px;
        margin-bottom: 10px;
        margin-right: 1px;
    }
    .summary:hover, button:not(.uploadBtn):hover {
        text-decoration: underline;
    }
</style>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<!-- ????????? ?????? -->
<section class="bg0 p-t-23 p-b-130">
    <div class="container">
        <div class="p-b-10" style="display: flex; flex-direction: row; flex-wrap: wrap; justify-content: space-between">
            <div>
                <h3 class="ltext-103 cl5">
                    Style
                </h3>
            </div>

            <div>
                <a href="upload" id="registerBtn" class="flex-c-m size-101 stext-101 cl0 bg3 bor2 hov-btn3 trans-04">
                    ?????????
                </a>
            </div>
        </div>

        <div class="row isotope-grid">
            <%-- ????????? ?????? --%>
            <c:forEach items="${board}" var="board">
                <div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item">
                    <!-- Block2 -->
                    <div class="block2">
                        <div class="block2-pic hov-img0" id="uploadResult${board.postId}">
                            <%-- ????????? ?????? --%>
                            <a href="#" data-postid="${board.postId}"
                               class="getBtn block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
                                ??????
                            </a>
                        </div>

                        <div class="block2-txt flex-w flex-t p-t-14">
                            <div class="row" style="width: 100%; flex: 100%;">
                                <div class="col">
                                    <p class="stext-104 cl4 trans-04 js-name-b2 p-b-6">
                                        ${board.userId}
                                    </p>
                                </div>
                                <div class="col cl3 flex-r">
                                    <div>
                                        <%-- ????????? --%>
                                        <i class="fa fa-heart"></i>
                                        <span id="heartCnt${board.postId}"></span>
                                        <%-- ????????? --%>
                                        <i class="fa fa-comment"></i>
                                        <span id="replyCnt${board.postId}"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="row stext-105 cl3 m-lr-0" style="width: 100%; flex: 100%;">
                                <c:choose>
                                    <c:when test="${fn:length(board.content) gt 29}">
                                        <a href="#" data-postid="${board.postId}" class="getBtn summary js-show-modal1"
                                           style="color: #808080;">${fn:substring(board.content, 0, 28)}...??? ??????</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="#" data-postid="${board.postId}" class="getBtn summary js-show-modal1"
                                           style="color: #666">${board.content}</a>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <!-- Pagination -->
        <div id="pagination" class="flex-c-m flex-w w-full p-t-38">
            <c:if test="${pageMaker.prev}">
                <a href="${pageMaker.startPage - 1}" class="flex-c-m how-pagination1 trans-04 m-all-7"> << </a>
            </c:if>
            <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                <a href="${num}"
                   class="flex-c-m how-pagination1 trans-04 m-all-7 ${pageMaker.cri.pageNum == num ? 'active-pagination1' : ''}">${num}</a>
            </c:forEach>
            <c:if test="${pageMaker.next}">
                <a href="${pageMaker.endPage + 1}" class="flex-c-m how-pagination1 trans-04 m-all-7"> >> </a>
            </c:if>
            <form action="/style/list" id='actionForm' method="get">
                <input type='hidden' name="pageNum" value="${pageMaker.cri.pageNum}"/>
                <input type='hidden' name="amount" value="${pageMaker.cri.amount}"/>
            </form>
        </div>
    </div>
</section>

<!-- Modal1 -->
<%-- ????????? ?????? --%>
<div class="wrap-modal1 js-modal1 p-t-60 p-b-20">
    <div class="overlay-modal1 js-hide-modal1"></div>

    <div class="container">
        <div class="bg0 p-t-60 p-b-30 p-lr-15-lg how-pos3-parent">

            <button class="how-pos3 hov3 trans-04 js-hide-modal1">
                <img src="/resources/images/icons/icon-close.png" alt="CLOSE">
            </button>

            <div class="myModal row">
                <div class="col-md-6 col-lg-6 p-b-30">
                    <div class="p-l-25 p-r-30 p-lr-0-lg">
                        <div class="wrap-slick3 flex-sb flex-w">
                            <div class="slick3 gallery-lb" id="imgDiv">
                                <div class="item-slick3">
                                    <div class="wrap-pic-w pos-relative">
                                        <%-- ????????? ?????? ????????? --%>
                                        <img src="#" >
                                        <%-- ????????? ?????? --%>
                                        <a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
                                           href="#">
                                            <i class="fa fa-expand"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%-- ?????? ????????? ?????? --%>
                        <div id="tagDiv"></div>
                        <%-- ?????? ????????? --%>
                        <div id='my-spinner' class="m-tb-15" style="text-align: center; display: none">
                            <img src='//cdnjs.cloudflare.com/ajax/libs/galleriffic/2.0.1/css/loader.gif'>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-lg-6 p-b-30">
                    <div class="p-r-50 p-t-5 p-lr-0-lg">
                        <h4 id="userId" class="mtext-105 cl2 js-name-detail p-b-14">
                            ?????? ?????????
                        </h4>
                        <span id="date" class="mtext-106 cl2">
                            ?????????
                        </span>
                        <ul id="tagList">
                        </ul>
                        <textarea id="content" class="stext-102 cl3 p-t-23 w-100" style="resize: none" readonly>
                            ??????
                        </textarea>
                        <div class="row">
                            <%-- ?????? ?????? --%>
                            <div class="heartDiv col m-t-26"></div>
                            <%-- ??????/?????? ?????? --%>
                            <div id="editDiv" class="col m-t-26 txt-right"></div>
                        </div>

                        <hr>
                        <p>??????(<span id="commentCnt">0</span>)</p>
                        <div class="chatInput row p-lr-15 m-t-6"></div>
                        <%-- ?????? ?????? --%>
                        <ul class="chat"></ul>
                        <%-- ?????? ????????? --%>
                        <div class="panel-footer"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>

<script>
    var loggedUserId = "<c:out value='${userVO.userId}'/>" || null;

    // ????????? ?????? ????????????
    (function () {
        <c:forEach items="${board}" var="board">
        // ????????? ????????????
        $.getJSON("/style/getStyleImg", {postId: ${board.postId}}, function (img) {
            var fileCallPath = encodeURIComponent(img.uploadPath + "/s_" + img.uuid + "_" + img.fileName);
            var str = "<img src='/display?fileName=" + fileCallPath + "'/>";
            $(`#uploadResult${board.postId}`).prepend(str);
        })

        // ????????? ????????????
        $.getJSON("/replies/cnt", {postId: ${board.postId}}, function (result) {
            var str = "<small>" + result + "</small>";
            $(`#replyCnt${board.postId}`).html(str);
        })

        // ???????????? ????????????
        heartService.getCount(${board.postId}, function (result) {
            var str = "<small>" + result + "</small>";
            $(`#heartCnt${board.postId}`).html(str);
        })
        </c:forEach>
    })()

    function reconfirm(str) {
        return confirm('?????? ' + str + '???????????????????');
    }

    $(document).ready(function () {

        // ????????? ?????? ??????
        var actionForm = $("#actionForm");
        $("#pagination a").click(function (e) {
            e.preventDefault();
            var thisIs = $(this).attr("href");
            actionForm.find("input[name='pageNum']").val(thisIs);
            actionForm.submit();
        })

        // ???????????? ????????? ???
        $('.js-hide-modal1').on('click', function () {
            $(".wrap-modal1").modal('hide');
            $("#userId").empty();
            $("#tagDiv").empty();
            $("#date").empty();
            $("#tagList").empty();
            $("#content").empty();
            $(".heartDiv").empty();
            $("#editDiv").empty();
            $(".chat").empty();
            $(".panel-footer").empty();
        });

        // ????????? ?????? - ???????????? ????????? ???
        $(".getBtn").click(function (e) {
            $(".wrap-modal1").modal("show");
            $('#my-spinner').show();

            // ?????? ????????? ??????
            $(".chatInput").html("<div class='col-9 bor8 m-b-20 how-pos4-parent'>"
                + "<input id='replyInput' class='stext-111 cl2 plh3 size-116' type='text' placeholder='????????? ??????????????????.'/>"
                + "</div>"
                + "<div class='col-3 flex-w flex-r-m m-b-20 p-0'>"
                + "<button id='uploadBtn' class='uploadBtn flex-c-m stext-101 cl0 bg3 bor2 hov-btn3 trans-04' style='height: 40px; width: 90%;'>"
                + "??????"
                + "</button>"
                + "</div>");

            // ?????? ?????? ??????
            $(".heartDiv").html('<span id="heart" class="mtext-106 cl2"></span>'
                + '<small id="heartCnt"></small>');

            var postId = $(this).data("postid");
            var heart = {postId: postId, userId: loggedUserId}
            var jHeart = $("#heart");
            var heartYN = false;
            console.log("???????????? ?????????.", postId);

            // ????????? ????????? ????????????
            $.getJSON("/style/getStyleImg", {postId: postId}, function (img) {
                var fileCallPath = encodeURIComponent(img.uploadPath + "/s_" + img.uuid + "_" + img.fileName);
                var originalFile = encodeURIComponent(img.uploadPath + "/" + img.uuid + "_" + img.fileName);
                $(".item-slick3 img").attr("src", "/display?fileName=" + originalFile);
                $(".item-slick3 a").attr("href", "/display?fileName=" + originalFile);
            })

            // ????????? ?????? ?????? ??????
            $.getJSON("/style/" + postId + ".json", function (result) {
                $("#userId").text(result.userId);
                $("#date").text(result.date);
                $("#content").text(result.content);
                $("#conDiv").text(result.postId);

                if (loggedUserId === result.userId) {
                    // ??????/?????? ?????? ??????
                    var editStr = "";
                    editStr += "<form><input type='hidden' name='postId' value='" + result.postId + "'/>";
                    editStr += "<input type='hidden' name='pageNum' value='" + ${pageMaker.cri.pageNum} +"'/>";
                    editStr += "<input type='hidden' name='amount' value='" + ${pageMaker.cri.amount} +"'/>";
                    editStr += "<button id='editBtn' type='button' data-oper='update' id='update'>??????</button> | ";
                    editStr += "<button id='deleteBtn' type='button' data-oper='delete' id='delete'>??????</button></form>";
                    $("#editDiv").html(editStr);

                    // ????????? ??????, ?????? ?????? ??????
                    $("#editDiv button").click(function (e) {
                        e.preventDefault();
                        var formObj = $("form");
                        var operation = $(this).data('oper')
                        if (operation === 'update') {
                            formObj
                                .attr('action', '/style/update')
                                .attr('method', 'get')
                                .submit();
                        } else if (operation === 'delete' && reconfirm("??????")) {
                            formObj
                                .attr('action', '/style/remove')
                                .attr('method', 'post')
                                .submit();
                        }
                    })
                }
            }).fail(function (xhr, status, err) {
                console.log(err);
            })

            // ?????? ????????? ????????????
            $.getJSON("/tag/" + postId + ".json", function (result) {
                $('#my-spinner').hide(); // ?????? ????????? ??????
                if (result.length !== 0) var str = "<hr>";
                for (var i of result) {
                    str += "<div><table><th rowspan='2'>";
                    str += "<a href='" + i.link + "' target='_blank'>"
                    str += "<img src='" + i.image + "'/></a></th>";
                    str += "<th>" + i.tagName + "</th>";
                    str += "<tr><td><small>";
                    str += "<a href='" + i.link + "' target='_blank'>" + i.title + "</a>";
                    str += "</small></td></tr></table></div>";
                }
                $("#tagDiv").html(str);
            })

            // ?????? ??????
            getHeart(heart);

            function getHeart(heart) {
                heartService.get(heart, function (isClicked) {
                    heartToggle(isClicked);
                    getHeartCount(heart.postId);
                })
            }

            function heartToggle(isClicked) {
                if (isClicked) {
                    heartYN = true;
                    // ?????? ????????? ??????????????? ?????????
                    jHeart
                        .css("color", "red")
                        .html("<i class='fa fa-heart'></i>");
                } else {
                    heartYN = false;
                    // ??? ?????? ??????
                    jHeart
                        .css("color", "black")
                        .html("<i class='fa fa-heart-o'></i>");
                }
            }

            // ???????????? ???????????? ??????
            function getHeartCount(postId) {
                heartService.getCount(postId, function (result) {
                    $("#heartCnt").text(result);
                    var str = "<small>" + result + "</small>";
                    $("#heartCnt" + postId).html(str);
                })
            }

            // ????????? ??????/????????? ??????
            jHeart.click(function (e) {
                if (heart.userId == null) {
                    alert("????????? ??? ?????? ???????????????.");
                    return;
                }
                if (heartYN) {
                    heartService.remove(heart, function (result) {
                        if (result === "success") {
                            getHeart(heart);
                        }
                    })
                } else {
                    heartService.save(heart, function (result) {
                        if (result === "success") getHeart(heart);
                    })
                }
            })

            // ?????? ??? ??????
            $.getJSON("/replies/cnt", {postId: postId}, function (result) {
                $("#commentCnt").text(result);
            })

            // ?????? ?????? ????????????
            var replyUL = $(".chat");
            var pageNum = 1;

            showCommentList(1);

            function showCommentList(page) {
                replyService.getList({postId: postId, page: page || 1}, function (replyCnt, list) {
                    // ?????? ??? ????????????
                    $("#commentCnt").text(replyCnt);
                    $("#replyCnt" + postId).html("<small>" + replyCnt + "</small>");

                    if (page === -1) {
                        pageNum = Math.ceil(replyCnt / 10.0);
                        showCommentList(pageNum);
                        return;
                    }
                    if (list == null || list.length === 0) {
                        replyUL.html("");
                        return;
                    }

                    var str = "";
                    for (var i = 0; i < list.length; i++) {
                        var commentWriter = list[i].userId;
                        str += "<li class='comment' data-commentid='" + list[i].commentId + "'>";
                        str += "<div>";
                        str += "<strong>" + list[i].userId + "</strong>";
                        str += "<small>" + replyService.displayTime(list[i].date) + "</small>";
                        if (loggedUserId === commentWriter) {
                            str += " <button class='editComment' type='button'"
                                + " data-commentid='" + list[i].commentId + "'"
                                + " data-comment='" + list[i].comment + "'"
                                + " data-userid='" + list[i].userId + "'>"
                                + "??????</button>";
                            str += " <button class='deleteComment' type='button'"
                                + " data-commentid='" + list[i].commentId + "'>"
                                + "??????</button>";
                        }
                        str += "</div>";
                        str += "<div id='commentContent" + list[i].commentId + "'>";
                        str += "<p>" + list[i].comment + "</p>";
                        str += "</div></li>";
                    }
                    replyUL.html(str);
                    // ?????? ????????? ?????? ??????
                    showReplyPage(replyCnt);
                    // ?????? ????????? ????????? ????????????

                    // ?????? ??????
                    $(".editComment").click(function (e) {
                        var comment = $(this).data("comment");
                        var commentId = $(this).data("commentid");
                        var userId = $(this).data("userid");
                        var str = "";
                        str += "<strong>" + userId + "</strong>";
                        str += '<div class="row p-lr-15 m-t-6">';
                        str += '<div class="col-7 bor8 m-b-20 how-pos4-parent">';
                        str += '<input id="editCommentInput' + commentId + '" class="stext-111 cl2 plh3 size-111" type="text" value="' + comment + '"/></div>';
                        str += '<div class="col-3 flex-w m-b-20 p-0 m-l-10">';
                        str += '<button id="editCommentBtn' + commentId + '" class="flex-c-m stext-101 cl0 bg3 bor2 hov-btn3 trans-04" style="height: 40px; width: 50%;">??????</button>';
                        str += "</div></div>";
                        $(this).closest("li").html(str);

                        $("#editCommentBtn" + commentId).click(function (e) {
                            var reply = {
                                commentId,
                                comment: $("#editCommentInput" + commentId).val()
                            }
                            replyService.update(reply, function (result) {
                                if (result === "success") {
                                    showCommentList(page);
                                }
                            }, function (err) {
                                alert("?????? ??? ????????? ??????????????????.");
                            })
                        })
                    })

                    // ?????? ??????
                    $(".deleteComment").click(function (e) {
                        var commentId = $(this).data("commentid");
                        if (reconfirm("??????")) {
                            replyService.remove(commentId, function (result) {
                                if (result === "success") {
                                    showCommentList(page);
                                }
                            }, function (err) {
                                alert("?????? ??? ????????? ??????????????????.");
                            })
                        }
                    })
                })
            }

            // ?????? ????????? ?????? ??????
            var replyPageFooter = $(".panel-footer");

            function showReplyPage(replyCnt) {
                var endNum = Math.ceil(pageNum / 10.0) * 10;
                var startNum = endNum - 9;
                var prev = startNum !== 1;
                var next = false;

                if (endNum * 10 >= replyCnt) {
                    endNum = Math.ceil(replyCnt / 10.0);
                }
                if (endNum * 10 < replyCnt) {
                    next = true;
                }

                var str = "<div class='flex-c-m flex-w w-full p-t-38'>";
                if (prev) {
                    str += "<a class='flex-c-m how-pagination1 trans-04 m-all-7' href='" + (startNum - 1) + "'><<</a>";
                }
                for (var i = startNum; i <= endNum; i++) {
                    var active = pageNum === i ? "active-pagination1" : "";
                    str += "<a class='flex-c-m how-pagination1 trans-04 m-all-7'" + active + " href='" + i + "'>" + i + "</a>";
                }
                if (next) {
                    str += "<a class='flex-c-m how-pagination1 trans-04 m-all-7' href ='" + (endNum + 1) + "'>>></a>";
                }
                str += "</div>";
                replyPageFooter.html(str);

                // ?????? ????????? ?????? ????????? ??????
                $(".panel-footer a").click(function (e) {
                    e.preventDefault();
                    pageNum = $(this).attr("href");
                    showCommentList(pageNum);
                })
            }

            // ?????? ??????
            $("#uploadBtn").click(function (e) {
                <c:if test="${userVO == null}">
                alert("????????? ??? ?????? ???????????????.");
                return;
                </c:if>
                var comment = $("#replyInput").val();
                if (comment === "") {
                    alert("?????? ????????? ??????????????????.");
                    return;
                }
                var reply = {
                    comment: comment,
                    userId: '${userVO.userId}',
                    postId: postId
                }
                replyService.add(reply, function (result) {
                    if (result === "success") {
                        showCommentList(-1);
                        $("#replyInput").val("");
                    }
                }, function (err) {
                    alert("?????? ?????? ??? ????????? ??????????????????.");
                })
            })
        })
    })
</script>
<!--===============================================================================================-->
<script src="/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="/resources/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="/resources/vendor/bootstrap/js/popper.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="/resources/vendor/select2/select2.min.js"></script>
<script>
    $(".js-select2").each(function(){
        $(this).select2({
            minimumResultsForSearch: 20,
            dropdownParent: $(this).next('.dropDownSelect2')
        });
    })
</script>
<!--===============================================================================================-->
<script src="/resources/vendor/daterangepicker/moment.min.js"></script>
<script src="/resources/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script src="/resources/vendor/slick/slick.min.js"></script>
<script src="/resources/js/slick-custom.js"></script>
<!--===============================================================================================-->
<script src="/resources/vendor/parallax100/parallax100.js"></script>
<script>
    $('.parallax100').parallax100();
</script>
<!--===============================================================================================-->
<script src="/resources/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<script>
    $('.gallery-lb').each(function() { // the containers for all your galleries
        $(this).magnificPopup({
            delegate: 'a', // the selector for gallery item
            type: 'image',
            gallery: {
                enabled:true
            },
            mainClass: 'mfp-fade'
        });
    });
</script>
<!--===============================================================================================-->
<script src="/resources/vendor/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
<script src="/resources/vendor/sweetalert/sweetalert.min.js"></script>
<script>
    $('.js-addwish-b2').on('click', function(e){
        e.preventDefault();
    });

    $('.js-addwish-b2').each(function(){
        var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
        $(this).on('click', function(){
            swal(nameProduct, "is added to wishlist !", "success");

            $(this).addClass('js-addedwish-b2');
            $(this).off('click');
        });
    });

    $('.js-addwish-detail').each(function(){
        var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

        $(this).on('click', function(){
            swal(nameProduct, "is added to wishlist !", "success");

            $(this).addClass('js-addedwish-detail');
            $(this).off('click');
        });
    });

    /*---------------------------------------------*/

    $('.js-addcart-detail').each(function(){
        var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
        $(this).on('click', function(){
            swal(nameProduct, "is added to cart !", "success");
        });
    });
</script>
<!--===============================================================================================-->
<script src="/resources/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script>
    $('.js-pscroll').each(function(){
        $(this).css('position','relative');
        $(this).css('overflow','hidden');
        var ps = new PerfectScrollbar(this, {
            wheelSpeed: 1,
            scrollingThreshold: 1000,
            wheelPropagation: false,
        });

        $(window).on('resize', function(){
            ps.update();
        })
    });
</script>
<!--===============================================================================================-->
<script src="/resources/js/main.js"></script>

</body>
</html>
