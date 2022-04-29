<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品详情</title>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="这是一个通用的导航页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/admin/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed"
          href="${pageContext.request.contextPath}/admin/assets/i/app-icon72x72@2x.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/admin.css">
    <script src="${pageContext.request.contextPath}/admin/assets/js/jquery.min.js"></script>
    <link href="${pageContext.request.contextPath}/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/app.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/layer/2.4/layer.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/lib/zTree/v3/js/jquery.ztree.all-3.5.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css"
          type="text/css">
    <link href="${pageContext.request.contextPath}/css/bootstrap/form-control.css" rel="stylesheet">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/js/bootstrap.validation/css/bootstrapValidator.css"/>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/bootstrap.validation/js/bootstrapValidator.js"></script>

    <style>

        .sideMenu{
            width: 200px;
            height: 1000px;
            bottom: 0px;
            background-color: #393D49;
            margin: 0px;
        }
        .sideMenu li {
            font-size: 16px;
        }

        .sideMenu a {
            font-size: 16px;
        }

        .admin-header {
            background-color: #2a3542;
        }

        div.pageDiv {
            text-align: center;
        }

    </style>
</head>
<body>

<header class="am-topbar admin-header"  >
    <div class="am-topbar-brand"><img src="${pageContext.request.contextPath}/admin/assets/i/logo.png" ></div>
    <div class="am-collapse am-topbar-collapse" id="topbar-collapse">
        <ul class="am-nav am-nav-pills am-topbar-nav admin-header-list">
            <li class="soso">
                <p>
                    <select data-am-selected="{btnWidth: 70, btnSize: 'sm', btnStyle: 'default'}">
                        <option value="b">全部</option>
                        <option value="o">产品</option>
                        <option value="o">会员</option>
                    </select>
                </p>
                <p class="ycfg"><input type="text" class="am-form-field am-input-sm"/></p>
                <p>
                    <button class="am-btn am-btn-xs am-btn-default am-xiao"><i class="am-icon-search"></i></button>
                </p>
            </li>
            <li class="am-hide-sm-only" style="float: right;"><a href="javascript:;" id="admin-fullscreen">
                <span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a>
            </li>
        </ul>
    </div>
</header>


<div class="sideMenu" style="float: left;">

    <h3 class="am-icon-logistics"><em></em> <a href="#">物流系统</a></h3>
    <ul>
        <li><a href="${pageContext.request.contextPath}/commodity/allCommodity">查看库存商品</a></li>
        <li><a href="${pageContext.request.contextPath}/order/map">生成路线</a></li>
        <li><a href="${pageContext.request.contextPath}/order/match">分析订单操作</a></li>
    </ul>
    <h3 class="am-icon-users"><em></em> <a href="#">商品管理</a></h3>
    <ul>
        <li><a href="${pageContext.request.contextPath}/admin_product_listAll">商品列表</a></li>
        <li><a href="toCategory">分类管理</a></li>

    </ul>

    <h3 class="am-icon-cart-plus"><em></em> <a href="#">订单管理</a></h3>
    <ul>

        <li><a href="admin_showAllOrder.do">全部列表</a></li>


        <li><a href="list_By_Admin?status=waitPay">待付款</a></li>
        <li><a href="list_By_Admin?status=waitDelivery">未发货订单</a></li>
        <li><a href="list_By_Admin?status=waitConfirm">待确认收货</a></li>
        <li><a href="list_By_Admin?status=finish">已完成订单</a></li>
        <li><a href="list_By_Admin?status=waitTuihuo">待退货</a></li>
        <li><a href="list_By_Admin?status=yituihuo">已退货</a></li>
        <li><a href="list_By_Admin?status=delete">已删除</a></li>


    </ul>


    <h3 class="am-icon-volume-up"><em></em> <a href="#">评论管理</a></h3>
    <ul>
        <li><a href="admin_review_list">评论列表</a></li>
    </ul>

    <h3 class="am-icon-gears"><em></em> <a href="#">统计报表</a></h3>
    <ul>


        <li><a href="go_chart1?cid=83"> 库存统计图 </a></li>
        <li><a href="go_chart2?cid=83"> 销量统计图 </a></li>

        <li><a href="go_chart3?cid=83"> 评论 </a></li>


    </ul>
</div>
<!-- sideMenu End -->


<script type="text/javascript">
    jQuery(".sideMenu").slide({
        titCell: "h3", //鼠标触发对象
        targetCell: "ul", //与titCell一一对应，第n个titCell控制第n个targetCell的显示隐藏
        effect: "slideDown", //targetCell下拉效果
        delayTime: 300, //效果时间
        triggerTime: 150, //鼠标延迟触发时间（默认150）
        defaultPlay: false,//默认是否执行效果（默认true）
        returnDefault: true //鼠标从.sideMen移走后返回默认状态（默认false）
    });
</script>


<div class="container" style="float: left ;margin-left: 10px;" >
    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column">
            <div class="page-header">
                <h4>商品详情</h4>
            </div>
        </div>
    </div>


</div>
<div class="row clearfix" style="float: left ;margin-left: 10px; width: 1700px;"  >
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 column">
        <table class="table table-hover table-striped">
            <thead>
            <tr>
                <th>commodity_id</th>
                <th>cate_id</th>
                <th>store_id</th>
                <th>name</th>
                <th>subtitle</th>
                <th>main_image</th>
                <th>sub_images</th>
                <th>detail</th>
                <th>price</th>
                <th>quantity</th>
                <th>location</th>
                <th>status</th>
                <th>creat_time</th>
                <th>modify_time</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="commodity" items="${commodityList}">
                <tr>
                    <td>${commodity.commodity_id}</td>
                    <td>${commodity.cate_id}</td>
                    <td>${commodity.store_id}</td>
                    <td>${commodity.name}</td>
                    <td>${commodity.subtitle}</td>
                    <td>${commodity.main_image}</td>
                    <td>${commodity.sub_images}</td>
                    <td>${commodity.detail}</td>
                    <td>${commodity.price}</td>
                    <td>${commodity.quantity}</td>
                    <td>${commodity.location}</td>
                    <td>${commodity.status}</td>
                    <td>${commodity.creat_time}</td>
                    <td>${commodity.modify_time}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/commodity/toUpdate?commodity_id=${commodity.commodity_id}">修改</a>&nbsp;&nbsp;
                        <a href="${pageContext.request.contextPath}/commodity/delete?commodity_id=${commodity.commodity_id}">删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</div>
</body>
</html>
