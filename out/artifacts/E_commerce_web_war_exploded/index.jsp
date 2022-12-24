<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="凯喵的小店, 您最好的电商购物平台选择。">
  <meta name="keywords" content="数码,生鲜,服饰,家电,生活">
  <title>凯喵的小店</title>
  <link rel="stylesheet" href="client/index_main.css">
</head>
<html>
<body>
<div class="main">
  <div class="header">
    <img class="logo" src="image/logo.png">
    <!-- <h1>header</h1> -->
    <!-- 头部右上菜单模块 -->
    <div class="menu_header">
      <span class="sep"></span>
      <a href="client/login.jsp" target="_blank">请先登录</a>
      <span class="sep">|</span>
      <a href="client/register.jsp" target="_blank">免费注册</a>
      <span class="sep">|</span>
      <a href="backstage/user_order.jsp" target="_blank" >我的订单</a>
      <span class="sep">|</span>
      <a href="#" onclick="help_center();">帮助中心</a>
      <span class="sep">|</span>
      <a href="backstage/product_selling.jsp"  target="_blank">商品记录查询</a>
      <span class="sep">|</span>
      <a href="backstage/AllUser_log.jsp"  target="_blank">用户记录查询</a>
      <span class="sep">|</span>
      <a href="LogoutServlet" onclick="log_exit();">退出登录</a>


    </div>
  </div>

  <div class="nav">
    <div class="menu_nav">
      <span class="sep"></span>
      <a href="index.jsp" >首页</a>
      <span class="sep">|</span>
      <a href="product/fresh.jsp" target="_blank">生鲜</a>
      <span class="sep">|</span>
      <a href="product/delicious_food.jsp" target="_blank">美食</a>
      <span class="sep">|</span>
      <a href="product/kitchen.jsp" target="_blank">餐厨</a>
      <span class="sep">|</span>
      <a href="product/home.jsp" target="_blank">居家</a>
      <span class="sep">|</span>
      <a href="product/wash.jsp" target="_blank">洗护</a>
      <span class="sep">|</span>
      <a href="product/baby.jsp" target="_blank">孕婴</a>
      <span class="sep">|</span>
      <a href="product/clothes.jsp" target="_blank">服装</a>
      <span class="sep">|</span>
      <a href="product/electric.jsp" target="_blank">电器</a>

    </div>

  </div>
  <div class="container">
    <!-- 三个盒子用margin进行布局
    中间的是自适应，所以放在最后一个-->
    <div class="lside">
      <!-- <h2>这是左边栏</h2> -->
      <!-- #侧边栏 -->
      <aside class="category">
        <ul>
          <li><a href="#" onclick="pop_up();">生鲜 <span>水果 蔬菜</span></a></li>
          <li><a href="#" onclick="pop_up();">美食 <span>面点 水果</span></a></li>
          <li><a href="#" onclick="pop_up();">餐厨 <span>刀具 菜板</span></a></li>
          <li><a href="#" onclick="pop_up();">电器 <span>冰箱 洗衣机</span></a></li>
          <li><a href="#" onclick="pop_up();">居家 <span>奶粉 玩具 辅食</span></a></li>
          <li><a href="#" onclick="pop_up();">洗护 <span>洗发 洗护 美妆</span></a></li>
          <li><a href="#" onclick="pop_up();">孕婴 <span>奶粉 玩具</span></a></li>
          <li><a href="#" onclick="pop_up();">服饰 <span>女装 男装</span></a></li>
          <li><a href="#" onclick="pop_up();">杂货 <span>户外 图书</span></a></li>
          <li><a href="#" onclick="pop_up();">品牌 <span>品牌制造</span></a></li>
        </ul>
      </aside>
    </div>

    <div class="rside">
      <!-- #search -->
      <div class="search_frame">
        <input type="search" placeholder="搜一搜"><br/>
      </div>
      <!-- <h2>这是右边栏</h2> -->
      <div class="search_favorite">
        <div class="search_title">探索发现</div>
        <ul class="like_table">
          <li><a href = "#"  onclick="pop_up();">朝陇山兔</a></li>
          <li><a href = "#"  onclick="pop_up();">凯尔希周边</a></li>
          <li><a href = "#"  onclick="pop_up();">安格斯牛肉厚切</a></li>
          <li><a href = "#"  onclick="pop_up();">耐克气垫鞋</a></li>
          <li><a href = "#"  onclick="pop_up();">广东特产</a></li>
          <li><a href = "#"  onclick="pop_up();">帝王蟹大龙虾</a></li>
          <li><a href = "#"  onclick="pop_up();">2022新款冬季毛衣</a></li>
          <li><a href = "#"  onclick="pop_up();">挪威三文鱼整条</a></li>
          <li><a href = "#"  onclick="pop_up();">gre学习</a></li>
        </ul>
      </div>

    </div>

    <div class="content">
      <!-- <h2>这是中间栏</h2> -->

      <!-- #轮播图指示器 -->
      <ul id="indicator">
        <li>
          <a href="#"><img src="image/slide_img/1.jpg" class="slide_img" alt=""></a>
        </li>
        <li>
          <a href="#"><img src="image/slide_img/2.jpg" class="slide_img" alt=""></a>
        </li>
        <li>
          <a href="#"><img src="image/slide_img/3.jpg" class="slide_img" alt=""></a>
        </li>
        <li>
          <a href="#"><img src="image/slide_img/4.jpg" class="slide_img" alt=""></a>
        </li>
        <li>
          <a href="#"><img src="image/slide_img/5.jpg" class="slide_img" alt=""></a>
        </li>
        <li>
          <a href="#"><img src="image/slide_img/1.jpg" class="slide_img" alt=""></a>
        </li>
      </ul>
      <!-- 五个小点来指示 -->
      <ul id="icolist">
        <li onclick="img_change(0)"></li>
        <li onclick="img_change(1)"></li>
        <li onclick="img_change(2)"></li>
        <li onclick="img_change(3)"></li>
        <li onclick="img_change(4)"></li>
      </ul>
      <!-- #左右按钮 -->
      <div class="prev">《</div>
      <div class="next">》</div>

    </div>


  </div>

  <div class="footer">
    <p>2022 © 咪酱 版权所有 粤ICP备xxxxxxxx号</p>
  </div>

</div>
<script>
  // JavaScript执行引擎并非一行一行地分析和执行程序，而是一段一段地分析执行的。
  // 而且在分析执行同一段 代码中，定义式的函数语句会被提取出来优先执行。函数定义执行完后，才会按顺序执行其他代码。

  // 包括变量和函数在内的所有声明都会在任何代码被执行前首先被处理。 即使声明是在调用的下方进行的，但浏览器仍然先声明再调用（执行），这个现象叫做“提升”。
  // 所以，即便一个函数的声明在下方，在前面仍然可以正常执行这个函数。
  // 赋值或其他逻辑运算是在执行阶段进行的，在预处理阶段会被忽略。

  var _prev = document.querySelector(".prev");
  var _next = document.querySelector(".next");

  //小圆点：先根据id定位，再根据tag（li）获取数据元素
  var ico_list = document.getElementById("icolist").getElementsByTagName("li");
  var left = 0;//图片的左边界
  var timer;
  var size = 5;
  run();
  function run(){
    if(left <= -4000){
      left = 0;
      //如果一圈五张图片全部轮转完，则从头开始计数
    }
    indicator.style.marginLeft = left + 'px';
    //通过css控制左边界，注意要加上px
    var n = (left % 800 == 0) ? n = 2000 : n = 10;
    //n来判断是不是一张图片结束，如果是停顿2000ms，否则正常停顿5ms
    left -= 5;
    //每隔5ms转一次
    //setTimeout(JavaScript 函数, 等待的毫秒数)，每隔一段时间执行这个函数
    timer = setTimeout(run, n);
    var x = Math.floor(-left / 800);
    icoChange(x);
  }

  // 通过n（n是图片的位置，第几张图片），设置一个改变图片位置的函数
  function img_change(n){
    //现在想要设置的左边界
    let _left = - (n * 800);
    //将新的左边界值传给style
    indicator.style.marginLeft = _left;
    //再将新的值传给left参数，方便后续操作。因为run需要靠left来执行
    left = _left;
  }
  _prev.onclick = function(){
    var prev_loc = Math.floor(-left / 800) - 1;
    if(prev_loc == -1){
      // 如果是第一张，定位到最后一张，也就是size-1;
      prev_loc = size - 1;
    }
    img_change(prev_loc);
  }

  _next.onclick = function(){
    var next_loc = Math.floor(- left / 800) + 1;
    if(next_loc == size){
      // 如果是最后一张一张，定位到第一张，也就是0;
      next_loc = 0;
    }
    img_change(next_loc)
  }

  // 五个小点来指示


  function icoChange(x){
    //函数需要在run里调用
    for(let i = 0; i < ico_list.length; i++){
      //改变对应的原点的颜色
      if(i == x){
        ico_list[x].style.backgroundColor = "lightgrey";
      }
      else{
        ico_list[i].style.backgroundColor = "";
      }
    }
  }

  function pop_up(){
    alert("抱歉，该功能尚待开发，您可以点击上方绿色菜单栏进行购物")
  }
  function help_center(){
    alert("欢迎您注册、使用凯喵帐号！《帐号使用协议》（如下简称“本协议”）系您与我们就帐号的注册和使用而订立的协议。在您使用小米帐号的注册和使用服务（如下简称“本服务”）之前，我们在此特别提醒您，请您认真阅读、充分理解本协议各条款，特别是涉及服务费用条款，免除或者限制小米责任的条款，对您的权利限制条款，争议解决和法律适用条款等，此类条款将以加粗的形式提示您注意。您通过网络页面点击同意和/或注册和使用帐号的行为，即视为您已阅读、理解并同意接受本协议，并同意接受本协议各项条款的约束。若您不同意本协议，则您有充分且完全的权利退出本服务。")
  }
  function log_exit(){alert("已退出登录");}

</script>
</body>
</html>
</html>