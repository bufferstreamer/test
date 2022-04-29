<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<head>
    <base href="<%=basePath%>">
</head>

<script>
    $(function () {

        <c:if test="${!empty msg}">
        $("span.errorMessage").html("${msg}");
        $("div.registerErrorMessageDiv").css("visibility", "visible");
        </c:if>

        $(".registerForm").submit(function () {
            if (0 == $("#name").val().length) {
                $("span.errorMessage").html("请输入用户名");
                $("div.registerErrorMessageDiv").css("visibility", "visible");
                return false;
            }
            if (0 == $("#password").val().length) {
                $("span.errorMessage").html("请输入密码");
                $("div.registerErrorMessageDiv").css("visibility", "visible");
                return false;
            }
            if (0 == $("#repeatpassword").val().length) {
                $("span.errorMessage").html("请输入重复密码");
                $("div.registerErrorMessageDiv").css("visibility", "visible");
                return false;
            }
            if ($("#password").val() != $("#repeatpassword").val()) {
                $("span.errorMessage").html("重复密码不一致");
                $("div.registerErrorMessageDiv").css("visibility", "visible");
                return false;
            }

            return true;
        });
    })
</script>

<div class="simpleLogo" style="width: 200px; padding-bottom: 0;">
    <a href="${contextPath}"><img src="img/site/simpleLogo.png"></a>
</div>

<form method="post" action="foreregister" class="registerForm" style="padding-left: 250px; padding-top: 10px;  " >


    <div class="registerDiv" style="background-image: url('http://how2j.cn/tmall/img/site/loginBackground.png') ; background-repeat: no-repeat; background-size:1450px 800px ;  width: 1600px; height: 1000px;" >
        <div class="registerErrorMessageDiv">
            <div class="alert alert-danger" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
                <span class="errorMessage"></span>
            </div>
        </div>


        <table class="registerTable"  style="margin-left: 880px; margin-top: 100px; background: white; width: 500px; height: 600px; table-layout:fixed"   >
            <tr>
                <td class="registerTip registerTableLeftTD" style="font-size: 14px; text-align: center" >注册</td>
                <td></td>
            </tr>
            <tr style="width: 500px;height: 100px; padding: 0; margin: 0;" >
                <td class="registerTableLeftTD" style="width: 100px; padding: 0;margin: 0;"   >登陆名</td>
                <td class="registerTableRightTD"><input id="name" name="name" placeholder="会员名一旦设置成功，无法修改"></td>
            </tr>
            <tr>
                <td class="registerTableLeftTD" style="width: 100px; padding: 0;margin: 0;" >登陆密码</td>
                <td class="registerTableRightTD"><input id="password" name="password" type="password"
                                                        placeholder="设置你的登陆密码"></td>
            </tr>
            <tr>
                <td class="registerTableLeftTD" style="width: 100px; padding: 0;margin: 0;" >密码确认</td>
                <td class="registerTableRightTD"><input id="repeatpassword" type="password" placeholder="请再次输入你的密码">
                </td>
            </tr>
            <tr>
                <td class="registerTableLeftTD" style="width: 100px; padding: 0;margin: 0;" >用户类型</td>
                <td class="registerTableRightTD">
                    <select name="userType" id="userType">
                        <option value="0" selected>请选择用户类型</option>
                        <option value="3">普通用户</option>
                        <option value="2">商户</option>
                        <option value="1">供应商</option>
                        <option value="4">管理员</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="registerButtonTD">
                    <a href="registerSuccess.jsp">
                        <button>提 交</button>
                    </a>
                </td>
            </tr>
        </table>
    </div>
</form>