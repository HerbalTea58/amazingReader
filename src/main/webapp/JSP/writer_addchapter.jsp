<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/12
  Time: 23:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
    <title>上传章节</title>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
    <link rel="shortcut icon" href="<%=basePath%>Picture/惊鸿图标.jpg"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/Css/writer_all.css" type="text/css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath }/Css/writer_addchapter.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/Css/writer_pop.css" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/Scripts/wangEditor.js"></script>

    <script src="../Scripts/jquery.min.js" type="text/javascript"></script>
    <script src="../Scripts/PopDrag.js" type="text/javascript"></script>


</head>
<body style="background: #efefef">
<div></div>
<div class="all">
    <div class="head">
        <div class="title">
            <a href="${pageContext.request.contextPath}/JSP/writer_home.jsp"><span class="title1">惊鸿·</span><span class="title2">作家专区</span></a>
        </div>
        <div class="notify">
            <img id="notify" class="img1" src="${pageContext.request.contextPath}/${LoginWriter.writerPortrait}" onclick="over()"><span class="notify1" onclick="over()">个人中心</span>
        </div>
        <div id="float_div" class="float_div" onmouseover="show()" onmouseout="notshow()">
            <div class="arrow"></div>
            <a href="${pageContext.request.contextPath}/JSP/writer_owner.jsp"><span class="float_span">作家资料</span></a>
            <a id="new_button" class="float_span" href="#">更改密码</a>
            <a href="${pageContext.request.contextPath}/Writer/OutLogin.action"><span class="float_span" style="border: none">退出登录</span></a>
        </div>
    </div>
    <div id="changePass" class="popBox">
        <span class="popBoxHandle">修改密码</span>
        <span class="new2">原密码:</span>
        <input id="new3" name="password1" type="password" class="new3"/>
        <span class="new4">新密码:</span>
        <input id="new5" name="password2" type="password" class="new5"/>
        <span class="new6">再次输入:</span>
        <input id="new7" name="password3" type="password" class="new7"/>
        <button id="submit" type="button" class="submit">提交</button>
        <button id="close" type="button" id="cancel" class="submit1">取消</button>
    </div>
    <div class="main">
        <div class="All_label">
            <a href="${pageContext.request.contextPath}/Writer/WriterHome.action"><div class="son_label">
                <span class="label_span">专 区 首 页</span>
            </div></a>
            <a href="${pageContext.request.contextPath}/Writer/WriterNovels.action" ><div class="son_label_choosed">
                <span class="label_span_choosed">作 品 管 理</span>
            </div></a>
            <a href="${pageContext.request.contextPath}/Writer/WriterDate.action" ><div class="son_label">
                <span class="label_span">数 据 统 计</span>
            </div></a>
            <a href="${pageContext.request.contextPath}/Writer/WriterIncome.action" ><div class="son_label">
                <span class="label_span">稿 酬 收 入</span>
            </div></a>
        </div>
        <div class="context">
            <div class="context_title">&nbsp;作品管理
                <div class="context_title1">&nbsp;${book.bookName}</div>
            </div>

            <div id="context_summary" class="context_summary">
                <a id="setting" href="${pageContext.request.contextPath}/Writer/GetDraftSetting.action?id=${book.bookId}"><span class="choosed">作品设置</span></a>
                <a id="draft" href="${pageContext.request.contextPath}/Writer/WriterChapterDraft.action?id=${book.bookId}" ><span class="choosed">草稿箱</span></a>
                <a id="beout" href="${pageContext.request.contextPath}/Writer/WriterChapterBeout.action?id=${book.bookId}"><span class="choosed">已发布章节</span></a>
                <a id="delete" href="${pageContext.request.contextPath}/Writer/WriterChapterDelete.action?id=${book.bookId}"><span class="choosed">回收箱</span></a>
            </div>
            <%--<c:if test="<%= c != choosed%>">
                <script !src="">alert("不为空")</script>
            </c:if>
            <c:if test="<%= c == choosed%>">
                <script>alert("为空")</script>
            </c:if>--%>


            <div id="draft1" class="draft1">
                <div class="left">
                    <div class="left_top">
                        <span class="left_top_span">共 ${draftList.size()} 章</span>
                    </div>
                    <div class="draft_float" style="height:93%;overflow:auto;">
                        <c:forEach var="draftList1" items="${draftList }">
                            <a href="${pageContext.request.contextPath}/Writer/GetDraft.action?chpaternum=${draftList1.draftChapterNum}&bookId=${book.bookId}">
                                <div id="draft_index${book.bookId}+${draftList1.draftChapterNum}" class="draft_index"
                                    <c:if test="${draftList1.draftCheckStatu == 1}">style="background-color: #f6f6f6" </c:if>
                                     <c:if test="${draftList1.draftCheckStatu == 2}">style="background-color: #ffcbb3" </c:if>
                                >
                                    <span class="draft_title">${draftList1.draftChapterName} </span>
                                    <span class="draft_num">${draftList1.draftWordNum}字</span>
                                    <span class="draft_time"><fmt:formatDate value="${draftList1.draftEditTime}" type="both" pattern="yyyy/MM/dd HH:mm:ss"/></span>
                                </div>
                            </a>
                        </c:forEach>
                    </div>
                </div>
                <form method="post" name="chapter">
                    <div class="right">
                        <div class="right_top">
                            <input name="id" value="${book.bookId}" type="hidden"/>
                            <span id="span_type" class="span_type">章节类型:</span>
                            <select class="select1" name="select1" >
                                <option value="${draft.draftChapterStatu}">
                                    <c:if test="${draft.draftChapterStatu == false}">
                                        公共章节
                                    </c:if>
                                    <c:if test="${draft.draftChapterStatu == true}">
                                        收费章节
                                    </c:if>
                                </option>
                                <option value="false">公众章节</option>
                                <option value="true">收费章节</option>
                            </select>
                            <%--<a href="${pageContext.request.contextPath}/JSP/writer_addchapter.jsp?ch=delete">sjfj</a>--%>
                            <span id="chapter_num" class="chapter_num">${draft.draftWordNum}</span>
                            <input name="wordnum" id="wordnum" type="hidden" value="${draft.draftWordNum}"/>
                            <%--<button id="chapter_num" type="submit" class="chapter_num">字数统计</button>--%>
                            <button id="chapter_new" type="submit" class="chapter_new">新建章节</button>
                            <button id="chapter_remove" type="submit" class="chapter_remove">删除</button>
                            <button id="chapter_save" type="submit" class="chapter_save">保存</button>
                            <button id="chapter_autosave" type="submit" class="chapter_save" style="display:none;">保存</button>
                            <button id="chapter_upload" type="submit" class="chapter_upload">上传章节</button>

                        </div>
                       <%-- <div id="draft_chapter_pop" class="popBox" style="z-index: 10000">
                            <button id="close" class="close">×</button>
                            <span class="popBoxHandle">发布章节</span>
                                <span class="new2">标题:</span>
                            <button id="draft_chapter" type="button" class="chapter_upload">上传章节</button>
                                <button id="chapter_upload" type="submit" class="draft_chapter_upload">上传章节</button>
                        </div>--%>
                        <input id="title" type="text" name="title" class="chapter_title" value="${draft.draftChapterName}"></input>

                        <div id="chapter_main1" class="chapter_main1" ></div>
                        <c:if test="${draft.draftChapterContent   ==  '<p><br></p>'}">
                            <%--<span class="tip1" id="tip1">正文</span>--%>
                        </c:if>
                        <div id="chapter_main2" class="chapter_main">
                            ${draft.draftChapterContent}
                        </div>
                        <textarea id="chapter_main_html"  name="main" style="display: none"></textarea>

                </form>

            </div>

        </div>
    </div>

</div>
<script type="text/javascript">
    document.getElementById("chapter_main2").onkeydown = function (event) {
        if (event.keyCode == 13) {
            document.getElementById("chapter_autosave").click();
        }
    }
</script>
<script type="text/javascript">
    document.getElementById("chapter_save").onclick = function () {
        document.chapter.action = "${pageContext.request.contextPath}/Writer/WriterSaveDraft.action?chapterNum=${chapterNum}&id=${book.bookId}";
        document.chapter.submit();
    }
    document.getElementById("chapter_upload").onclick = function () {
        document.chapter.action = "${pageContext.request.contextPath}/Writer/WriterAddChapter.action?chapterNum=${chapterNum}";
        document.chapter.submit();
    }
   document.getElementById("chapter_new").onclick = function () {
        document.chapter.action = "${pageContext.request.contextPath}/Writer/WriterNewDraft.action";
        document.chapter.submit();
    }
    document.getElementById("chapter_remove").onclick = function () {
        document.chapter.action = "${pageContext.request.contextPath}/Writer/DeleteDraft.action?chapterNum=${chapterNum}&bookId=${book.bookId}";
        document.chapter.submit();
    }
    document.getElementById("chapter_autosave").onclick = function () {
        document.chapter.action = "${pageContext.request.contextPath}/Writer/AutoSaveDraft.action?chapterNum=${chapterNum}&id=${book.bookId}";
        document.chapter.submit();
    }
</script>
<script type="text/javascript">

    function textCount(el){
        var val = el.value;
        val = val.replace(/\n|\r|\t|\<p\>|\<\/p\>|\<br\>|&nbsp;/gi,"");
        var eLen = val.length;
        return eLen;
    }
    var el = document.getElementById("chapter_main2");
    var el2 = document.getElementById("chapter_main_html");

    var E = window.wangEditor
    var editor = new E('#chapter_main1', '#chapter_main2')  // 两个参数也可以传入 elem 对象，class 选择器
    // var editor = new E('#chapter_main2')

    editor.customConfig.menus = [
        'bold',
        'fontSize',
        'fontName',
        'underline',
        'strikeThrough',
        'image',  // 插入图片
        'undo',
        'redo'
    ]
    var $text1 = $('#chapter_main_html')
    editor.customConfig.onchange = function (html) {
        // 监控变化，同步更新到 textarea
        $text1.val(html)
        var len = textCount(el2);
        document.getElementById('chapter_num').innerHTML = len;
        document.getElementById("wordnum").value = len;
    }
    editor.create()
    // 初始化 textarea 的值
    $text1.val(editor.txt.html())

    if(${chapterNum == null}){
        editor.$textElem.attr('contenteditable', false);
    }else {
        editor.$textElem.attr('contenteditable', true);
    }
</script>

<script type="text/javascript">

    var p = new PopUp({
        id: "draft_chapter_pop"
    });
    EventUtil.addEvent(window, 'resize', function () {
        p.setPosition();
        p.enableShadow && p.enableShadow.shadow && p.enableShadow.setProperty(p.enableShadow.shadow);
    });

    EventUtil.addEvent(EventUtil._$('draft_chapter'), 'click', function () {
        p.show({
            /*            x:300,
                        y:300*/
        });
    })
    EventUtil.addEvent(window,'load',function() {
        if((isIE6 || isOpera) && p.isScroll != null && p.isScroll == 'enabled') {
            EventUtil.addEvent(window,'scroll', function() {
                setTimeout(function() {
                    p.setPosition();
                },100);
            });
        }
    });
    EventUtil.addEvent(EventUtil._$('close'),'click', function() {
        //自定义点击取消按钮之后得操作

        //隐藏弹出框
        p.hide();
    });
</script>
<script type="text/javascript">

    function show(){
        document.getElementById("float_div").style.display = "block";

    }
    function notshow() {
        document.getElementById("float_div").style.display = "none";

    }
    function over(){
        if(document.getElementById("float_div").style.display == "block")
            document.getElementById("float_div").style.display = "none";
        else
            document.getElementById("float_div").style.display = "block";
    }

</script>
<script src="${pageContext.request.contextPath}/jquery-1.11.2.js"></script>
<script type="text/javascript">
    var p = new PopUp({
        id: "changePass"
    });
    EventUtil.addEvent(window, 'resize', function () {
        p.setPosition();
        p.enableShadow && p.enableShadow.shadow && p.enableShadow.setProperty(p.enableShadow.shadow);
    });

    EventUtil.addEvent(EventUtil._$('new_button'), 'click', function () {
        p.show({
            /*            x:300,
                        y:300*/
        });
    })
    EventUtil.addEvent(window,'load',function() {
        if((isIE6 || isOpera) && p.isScroll != null && p.isScroll == 'enabled') {
            EventUtil.addEvent(window,'scroll', function() {
                setTimeout(function() {
                    p.setPosition();
                },100);
            });
        }
    });
    EventUtil.addEvent(EventUtil._$('submit'),'click', function() {
        //自定义点击取消按钮之后得操作
        var value = ${LoginWriter.writerPassword}
        var value1 = document.getElementById("new3").value;
        if(value != value1){
            alert("原密码错误");
        }else {
            var value2 = document.getElementById("new5").value;
            var value3 = document.getElementById("new7").value;
            if(value2 != value3)
                alert("两次输入新密码不同");
            else {
                if(confirm("确定修改密码？")){
                    var url = '${pageContext.request.contextPath }/Writer/ChangePassword.action';
                    $.get(url,"password="+value2,function(data){
                        if(date == true){
                            alert("更新成功");
                        }else {
                            alert("更新失败");
                        }
                    });
                }
                //隐藏弹出框
                p.hide();
            }
        }
    });
    EventUtil.addEvent(EventUtil._$('close'),'click', function() {
        //自定义点击取消按钮之后得操作
        //隐藏弹出框
        p.hide();
    });
</script>
<script type="text/javascript">
    function changeColor1(id){
        document.getElementById(id).style.backgroundColor = "#f6f6f6";
    }
    function changeColor2(id){
        document.getElementById(id).style.backgroundColor = "#ffcbb3";
    }
</script>
<script type="text/javascript">
    $(document).ready(function(){
        $(window).scrollTop(130);
    })
</script>
</body>
</html>