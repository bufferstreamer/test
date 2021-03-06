package wzz.digou.controller;

import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.github.pagehelper.PageHelper;
import com.sun.xml.internal.ws.api.model.ExceptionType;
import gsh.controller.DoStrategyImpl;
import gsh.pojo.Address;
import gsh.pojo.NormalBuyingToB;
import gsh.pojo.NormalOrderToB;
import org.apache.commons.lang.math.RandomUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.HtmlUtils;
import wzz.comparator.*;
import wzz.digou.pojo.Collection;
import wzz.digou.pojo.*;
import wzz.digou.service.*;
import wzz.digou.util.AlipayConfig;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("")
public class ForeController {
    private static final Logger log = LoggerFactory.getLogger(ForeController.class);
    public static Queue<NormalOrder> normalOrderslist = new LinkedList<>();
    @Autowired
    CategoryService categoryService;
    @Autowired
    ProductService productService;
    @Autowired
    UserService userService;
    @Autowired
    ProductImageService productImageService;
    @Autowired
    PropertyValueService propertyValueService;
    @Autowired
    OrderService orderService;
    @Autowired
    OrderItemService orderItemService;
    @Autowired
    ReviewService reviewService;
    @Autowired
    MemberService memberService;
    @Autowired
    CollectionService collectionService;


//    public void sendToTradingMidOffice() throws InterruptedException {
//        while (true){
//            if (!list.isEmpty()){
//                NormalOrder normalOrder = list.remove();
//                for (NormalMemberOrder mo : normalOrder.getNormalMemberOrders()){
//                    String moPK = generatePK('6');
//                    mo.setOrderId(moPK);
//                }
//                String no = generatePK('6');
//                normalOrder.setOrderId(no);
//                //???normalOrder??????????????????
//                Thread.sleep(1);
//            }else {
//                Thread.sleep(100);
//            }
//        }
//    }
//    public String generatePK(char identification){
//        int[] weight = new int[]{7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2};
//        long summary = 0;
//        int[] timestamp = generateTimeStamp();
//        for (int i=0; i<16; i++){
//            summary += timestamp[i]*weight[i];
//        }
//        int remainder = (int) (summary % 11);
//        Map<Integer, String> remainderMap = new HashMap<Integer, String>(Map.of(0,"1", 1,"0", 2, "X", 3,"9", 4,"8", 5, "7", 6, "6", 7, "5", 8, "4", 9, "3"));
//        remainderMap.put(10, "2");
//        String pk = identification + Arrays.toString(timestamp).replaceAll(", ", "").replace("[","").replace("]","") + remainderMap.get(remainder);
//        System.out.println(pk.length());
//        return pk;
//    }
//    public int[] generateTimeStamp(){
//        long l = System.currentTimeMillis() * 1000L + (System.nanoTime() % 1000L);
//        String num = String.valueOf(l);
//        int[] res = new int[16];
//        for (int i=0; i<16; i++){
//            res[i] = Integer.parseInt(String.valueOf(num.charAt(i)));
//        }
//        return res;
//    }

    //????????????
    @RequestMapping("forehome")
    public String home(Model model) {
        List<Category> cs = categoryService.list();
        productService.fill(cs);
        productService.fillByRow(cs);
        model.addAttribute("cs", cs);
        return "2cjsp/fore/home";
    }

    //??????????????????
    @RequestMapping("showcategory")
    public void allCategory(Model model) {
        List<Category> cs = categoryService.list();
        productService.fill(cs);
        productService.fillByRow(cs);
        model.addAttribute("cs", cs);
    }

    //?????????????????????????????????
    @RequestMapping("allproductofcategory")
    public String allproductofc(int cid, String sort, Model model, HttpSession session) {
        Category c = categoryService.get(cid);
        productService.fill(c);
        productService.setSaleAndReviewNumber(c.getProducts());
        if (null != sort) {
            switch (sort) {
                case "review"://??????
                    Collections.sort(c.getProducts(), new ProductReviewComparator());
                    break;
                case "date"://??????
                    Collections.sort(c.getProducts(), new ProductDateComparator());
                    break;
                case "saleCount"://??????
                    Collections.sort(c.getProducts(), new ProductSaleCountComparator());
                    break;
                case "price"://??????
                    Collections.sort(c.getProducts(), new ProductPriceComparator());
                    break;
                case "all"://??????
                    Collections.sort(c.getProducts(), new ProductAllComparator());
                    break;
            }
        }
        session.setAttribute("showProduct", "showProduct");
        model.addAttribute("c", c);
        return "2cjsp/fore/category";
    }

    //?????????????????????????????????
    @RequestMapping("forecategory")
    public String category(int cid, String sort, Model model, HttpSession session) {
        Category c = categoryService.get(cid);
        productService.fill(c);
        productService.setSaleAndReviewNumber(c.getProducts());//????????????????????????????????????
        User user = (User) session.getAttribute("user");
        if(user!=null){
            productService.setScore(user.getId(),c.getProducts());
            sort = "score";
            Collections.sort(c.getProducts(), new ProductScoreComparator());
        }

        if (null != sort) {
            switch (sort) {
                case "review"://??????
                    Collections.sort(c.getProducts(), new ProductReviewComparator());
                    break;
                case "date"://??????
                    Collections.sort(c.getProducts(), new ProductDateComparator());
                    break;
                case "saleCount"://??????
                    Collections.sort(c.getProducts(), new ProductSaleCountComparator());
                    break;
                case "price"://??????
                    Collections.sort(c.getProducts(), new ProductPriceComparator());
                    break;
                case "all"://??????
                    Collections.sort(c.getProducts(), new ProductAllComparator());
                    break;
            }
        }
        session.setAttribute("showProduct", "showProduct");
        model.addAttribute("c", c);
        return "2cjsp/fore/category";
    }

    //??????????????????
    @RequestMapping("foreproduct")
    public String product(int pid, HttpSession hs) {
        Product p = productService.get(pid);

        List<ProductImage> productSingleImages = productImageService.list(p.getId(), ProductImageService.type_single);
        List<ProductImage> productDetailImages = productImageService.list(p.getId(), ProductImageService.type_detail);
        p.setProductSingleImages(productSingleImages);
        p.setProductDetailImages(productDetailImages);

        List<PropertyValue> pvs = propertyValueService.list(p.getId());
        List<Review> reviews = reviewService.list(p.getId());
        productService.setSaleAndReviewNumber(p);
        User user = (User) hs.getAttribute("user");
        String username = "";
        if (user != null)
            username = user.getName();
        Collection collection = collectionService.getPdSC(pid, username);
        log.error("----------------" + collection.getPid() + "-------" + collection.getScuname());
        if (collection == null || collection.getPid() == -1) {
            hs.setAttribute("isShouChang", "false");
        } else {
            hs.setAttribute("isShouChang", "true");
        }
        hs.setAttribute("reviews", reviews);
        hs.setAttribute("p", p);
        hs.setAttribute("pvs", pvs);
        return "2cjsp/fore/product";
    }

    //??????????????????
    @RequestMapping("oneproduct")
    public String oneofproduct(int pid, HttpSession hs) {
        Product p = productService.get(pid);

        List<ProductImage> productSingleImages = productImageService.list(p.getId(), ProductImageService.type_single);
        List<ProductImage> productDetailImages = productImageService.list(p.getId(), ProductImageService.type_detail);
        p.setProductSingleImages(productSingleImages);
        p.setProductDetailImages(productDetailImages);

        List<PropertyValue> pvs = propertyValueService.list(p.getId());
        List<Review> reviews = reviewService.list(p.getId());
        productService.setSaleAndReviewNumber(p);
        User user = (User) hs.getAttribute("user");
        String username = "";
        if (user != null)
            username = user.getName();
        Collection collection = collectionService.getPdSC(pid, username);
        log.error("----------------" + collection.getPid() + "-------" + collection.getScuname());
        if (collection == null || collection.getPid() == -1) {
            hs.setAttribute("isShouChang", "false");
        } else {
            hs.setAttribute("isShouChang", "true");
        }
        hs.setAttribute("reviews", reviews);
        hs.setAttribute("p", p);
        hs.setAttribute("pvs", pvs);
        return "2cjsp/fore/product";
    }

    //??????
    @RequestMapping("foresearch")
    public String search(String keyword, Model model,HttpSession session) {
        PageHelper.offsetPage(0, 20);
        List<Product> ps = productService.search(keyword);
        productService.setSaleAndReviewNumber(ps);
        User user = (User) session.getAttribute("user");
        if(user!=null){
            productService.setScore(user.getId(),ps);
            Collections.sort(ps, new ProductScoreComparator());
        }
        model.addAttribute("ps", ps);
        return "2cjsp/fore/searchResult";
    }

    //????????????old
    @RequestMapping("forebuyone")
    public String buyone(int pid, int num, HttpSession session) {
        Product p = productService.get(pid);
        int oiid = 0;
        User user = (User) session.getAttribute("user");
        System.out.println("?????????????????????");
        if (user == null) {
            return "2cjsp/fore/login";
        }
        boolean found = false;
        List<OrderItem> ois = orderItemService.listByUser(user.getId());
        for (OrderItem oi : ois) {
            if (oi.getProduct().getId().intValue() == p.getId().intValue()) {
                oi.setNumber(oi.getNumber() + num);
                orderItemService.update(oi);
                found = true;
                oiid = oi.getId();
                break;
            }
        }
        if (!found) {
            OrderItem oi = new OrderItem();
            oi.setUid(user.getId());
            oi.setNumber(num);
            oi.setPid(pid);
            orderItemService.add(oi);
            oiid = oi.getId();
        }
        return "redirect:forebuy?oiid=" + oiid;
    }

    //????????????new
    @RequestMapping("forebuyonenew")
    public String buyoneNew(int pid, int num, HttpSession session) {
        Product p = productService.get(pid);
        int oiid = 0;
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "2cjsp/fore/login";
        }
        OrderItem oi = new OrderItem();
        oi.setUid(user.getId());
        oi.setNumber(num);
        oi.setPid(pid);
        orderItemService.add(oi);
        oiid = oi.getId();
        return "redirect:forebuy?oiid=" + oiid;
    }

    //????????????old
    @RequestMapping("forebuy")
    public String buy(Model model, String[] oiid, HttpSession session) {
        List<OrderItem> ois = new ArrayList<>();
        float total = 0;
        System.out.println("?????????????????????");
        for (String strid : oiid) {
            int id = Integer.parseInt(strid);
            OrderItem oi = orderItemService.get(id);
            total += oi.getProduct().getPromotePrice() * oi.getNumber();
            ois.add(oi);
        }

        session.setAttribute("ois", ois);
        model.addAttribute("total", total);
        return "2cjsp/fore/buy";
    }


    //????????????old
    @RequestMapping("forecreateOrder")
    public String createOrder(HttpSession session, Order order) {
        User user = (User) session.getAttribute("user");
        String orderCode = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()) + RandomUtils.nextInt(10000);
        order.setOrderCode(orderCode);
        order.setCreateDate(new Date());
        order.setUid(user.getId());
        order.setStatus(OrderService.waitPay);
        List<OrderItem> ois = (List<OrderItem>) session.getAttribute("ois");
        float total = orderService.add(order, ois);
        session.setAttribute("oid", order.getId());
        session.setAttribute("total", total);
//        return "redirect:forealipay?oid="+order.getId()+"&total="+total;
        Address address = new Address(null, order.getAddress(), null,Integer.toString(order.getUid()), order.getMobile(),
                order.getAddress(), order.getAddress(), order.getAddress(), null);
        ArrayList<NormalOrderToB> normalOrderToBS = new ArrayList<>();
        for(OrderItem orderItem: ois){
            normalOrderToBS.add(new NormalOrderToB(Integer.toString(1), 0, Integer.toString(1), orderItem.getNumber(), 1,null,null, null));
        }
        gsh.pojo.Bill bill = new gsh.pojo.Bill();
        NormalBuyingToB normalBuyingToB = new NormalBuyingToB(Integer.toString(1),normalOrderToBS,"???233?????????", order.getTotal(), bill,address,order.getCreateDate());

        //???normalOrder??????????????????
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        DoStrategyImpl doStrategyImpl = (DoStrategyImpl) ctx.getBean("doStrategyImpl");
        doStrategyImpl.doStrategyActivity(normalBuyingToB);
        return "2cjsp/fore/home";
    }


    //????????????new
    @RequestMapping("forecreateNormalOrder")
    public String createNormalOrder(HttpSession session, Order order) {
        //????????????????????????
        String payStrategy = "AliPay";
        NormalOrder normalOrder = new NormalOrder();
        User user = (User) session.getAttribute("user");
        List<OrderItem> ois = (List<OrderItem>) session.getAttribute("ois");
        //???????????????ID
        CustomAddress address = new CustomAddress(order.getReceiver(), order.getMobile(), order.getAddress(), order.getAddress(), order.getAddress(), order.getAddress(), order.getPost());
        normalOrder.setDeliveryAddress(address);//????????????
        normalOrder.setPlaceTime(new Date(System.currentTimeMillis()));//????????????
        normalOrder.setConsumerId(String.valueOf(user.getId()));//?????????ID
        ArrayList<NormalMemberOrder> memberOrders = new ArrayList<NormalMemberOrder>();
        for (OrderItem oi : ois) {
            NormalMemberOrder memberOrder = new NormalMemberOrder();
            memberOrder.setProductId(String.valueOf(oi.getPid()));//??????ID
            memberOrder.setQuantity(oi.getNumber());//????????????
            Double amount = Double.valueOf(oi.getProduct().getPromotePrice() * oi.getNumber());
            memberOrder.setAmount(amount);
            Bill bill = new Bill(payStrategy, amount);
            memberOrder.setBill(bill);//??????
            memberOrders.add(memberOrder);
        }
        normalOrder.setNormalMemberOrders(memberOrders);
        synchronized (normalOrderslist) {
            normalOrderslist.add(normalOrder);
            normalOrderslist.notifyAll();
        }
        //??????????????????????????????
        //??????????????????id
        //??????????????????
        //??????????????????
        //???????????????id
        //amount = 0
        //for??????{

        //}
        String orderCode = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()) + RandomUtils.nextInt(10000);
        order.setOrderCode(orderCode);
        order.setCreateDate(new Date());
        order.setUid(user.getId());
        order.setStatus(OrderService.waitPay);
        float total = orderService.add(order, ois);
        session.setAttribute("oid", order.getId());
        session.setAttribute("total", total);
        return "redirect:forealipay?oid=" + order.getId() + "&total=" + total;
    }

    @RequestMapping(value = "forealipay")
    public String goAlipay(int oid, float total, HttpServletRequest request, HttpServletResponse response) throws Exception {
        User user = (User) request.getSession().getAttribute("user");
        List<OrderItem> ot = orderItemService.getByoAndu(user.getId(), oid);
        String productName = ot.get(0).getProduct().getName();
        Order order = orderService.get(oid);

        //??????????????????AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);

        //??????????????????
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

        //?????????????????????????????????????????????????????????????????????
        String out_trade_no = order.getOrderCode();
        //?????????????????????
        String total_amount = String.valueOf(Float.valueOf(total));
        //?????????????????????
        String subject = ot.get(0).getProduct().getName();
        //?????????????????????
        String body = order.getUserMessage();

        // ?????????????????????????????????????????????????????????????????????????????????1m???15d???m-?????????h-?????????d-??????1c-?????????1c-??????????????????????????????????????????????????????0??????????????? ???????????????????????????????????? ??? 1.5h??????????????? 90m???
        String timeout_express = "1c";

        alipayRequest.setBizContent("{\"out_trade_no\":\"" + out_trade_no + "\","
                + "\"total_amount\":\"" + total_amount + "\","
                + "\"subject\":\"" + subject + "\","
                + "\"body\":\"" + body + "\","
                + "\"timeout_express\":\"" + timeout_express + "\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

        //??????
        String result = alipayClient.pageExecute(alipayRequest).getBody();
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        out.println(result);
        return null;
    }

    @ResponseBody
    @RequestMapping("forepayed")
    public ModelAndView payed(Model model, HttpSession hs) {
        ModelAndView mav = new ModelAndView();
        int oid = Integer.parseInt(hs.getAttribute("oid").toString());
        Order order = orderService.get(oid);
        order.setStatus(OrderService.waitDelivery);
        order.setPayDate(new Date());
        orderService.update(order);
        model.addAttribute("o", order);
        mav.setViewName("2cjsp/fore/payed");
        return mav;
    }

    @RequestMapping("forebought")
    public String bought(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        List<Order> os = orderService.list(user.getId(), OrderService.delete);

        orderItemService.fill(os);

        model.addAttribute("os", os);

        return "2cjsp/fore/bought";
    }

    @RequestMapping("foreconfirmPay")
    public String confirmPay(Model model, int oid) {
        Order o = orderService.get(oid);
        orderItemService.fill(o);
        model.addAttribute("o", o);
        return "2cjsp/fore/confirmPay";
    }


    @RequestMapping("foreorderConfirmed")
    public String orderConfirmed(Model model, int oid) {
        Order o = orderService.get(oid);
        o.setStatus(OrderService.waitReview);
        o.setConfirmDate(new Date());
        orderService.update(o);
        return "2cjsp/fore/orderConfirmed";
    }


    @RequestMapping("foredeleteOrder")
    @ResponseBody
    public String deleteOrder(Model model, int oid) {
        Order o = orderService.get(oid);
        o.setStatus(OrderService.delete);
        orderService.update(o);
        return "success";
    }

    //????????????????????? ????????????
    @RequestMapping("forereview")
    public String review(Model model, int oid) {
        //??????????????????
        Order o = orderService.get(oid);
        //?????????????????????
        orderItemService.fill(o);

        //??????????????????
        Product p = o.getOrderItems().get(0).getProduct();

        //?????? ???????????? ?????? ??????

        List<Review> reviews = reviewService.list(p.getId());

        //?????????????????? ?????????   ?????????
        productService.setSaleAndReviewNumber(p);

        //??????session???  ???????????????   ?????? ?????? ???????????????
        model.addAttribute("p", p);
        model.addAttribute("o", o);
        model.addAttribute("reviews", reviews);
        return "2cjsp/ore/review";
    }


    //????????????   ????????? ?????????
    @RequestMapping("foredoreview")
    public String doreview(Model model, HttpSession session, @RequestParam("oid") int oid, @RequestParam("pid") int pid, @RequestParam("price_value") float price_value, String content) {
        Order o = orderService.get(oid);
        o.setStatus(OrderService.finish);
        orderService.update(o);

        Product p = productService.get(pid);
        content = HtmlUtils.htmlEscape(content);

        //??????????????????
        User user = (User) session.getAttribute("user");
        Member member = (Member) session.getAttribute("current_member");

        //????????????
        Review review = new Review();
        review.setContent(content);
        review.setPid(pid);
        review.setCreateDate(new Date());
        review.setUid(user.getId());
        reviewService.add(review);

        //???????????????
        member.setMember_points(member.getMember_points() + (int) price_value);
        memberService.updateUserPoint(member);
        session.setAttribute("current_member", member);

        return "redirect:forereview?oid=" + oid + "&showonly=true";
    }


    @RequestMapping("foreupdate")
    public String foreupdate(Model model, HttpSession session) {
        return "2cjsp/fore/updateMyinfo";
    }

    //?????????????????????
    @RequestMapping("foretuijian")
    public String pdTuijian(HttpSession session) {
        List<Product> productList = new ArrayList<>();
        for (int pid : orderItemService.getTuijian()) {
            productList.add(productService.get(pid));
        }
        session.setAttribute("c", productList);
        session.setAttribute("showProduct", "tuijian");
        return "2cjsp/fore/category";
    }

    //????????????????????????
    @RequestMapping("foreGouzuire")
    public String pdGouZuiRe(HttpSession session) {
        List<Product> productList = new ArrayList<>();
        for (int i : productService.getGouZuiRe()) {
            productList.add(productService.get(i));
        }
        session.setAttribute("showProduct", "gouZuiRe");
        session.setAttribute("c", productList);
        return "2cjsp/fore/category";
    }

    @RequestMapping("foremypoint")
    public String foremypoint(Model model) {
        return "2cjsp/fore/shownMypoint";
    }

    @RequestMapping("go_chart1")
    public String forechart1(Model model, @RequestParam("cid") int id, HttpSession session) {
        System.out.println(id);
        Category cc = categoryService.get(id);
        productService.fill(cc);
        productService.setSaleAndReviewNumber(cc.getProducts());

        Map<String, Integer> map1 = new HashMap();

        for (Product pp : cc.getProducts()) {
            map1.put(pp.getName(), pp.getStock());
        }

        session.setAttribute("map1", map1);
//
//            float arr[]={50, 20, 36, 10, 10, 30};
//
//            session.setAttribute("shuju",arr);
        session.setAttribute("admin_showProduct", "admin_showProduct");
        model.addAttribute("cc", cc);

        return "2cjsp/admin/admin_chart1";

    }

    @RequestMapping("go_chart3")
    public String forechart3(Model model, @RequestParam("cid") int id, HttpSession session) {

        System.out.println(id);
        Category cc = categoryService.get(id);
        productService.fill(cc);
        productService.setSaleAndReviewNumber(cc.getProducts());

        Map<String, Integer> map3 = new HashMap();

        for (Product pp : cc.getProducts()) {
            map3.put(pp.getName(), pp.getReviewCount());
        }

        session.setAttribute("map3", map3);

        session.setAttribute("admin_showProduct", "admin_showProduct");
        model.addAttribute("cc", cc);

        return "2cjsp/admin/admin_chart3";

    }


    @RequestMapping("go_chart2")
    public String forechart2(Model model, @RequestParam("cid") int id, HttpSession session) {

        System.out.println(id);
        Category cc = categoryService.get(id);
        productService.fill(cc);
        productService.setSaleAndReviewNumber(cc.getProducts());

        Map<String, Integer> map2 = new HashMap();

        for (Product pp : cc.getProducts()) {
            map2.put(pp.getName(), pp.getSaleCount());
        }

        session.setAttribute("map2", map2);
        float arr[] = {50, 20, 36, 10, 10, 30};

        session.setAttribute("shuju", arr);
        session.setAttribute("admin_showProduct", "admin_showProduct");
        model.addAttribute("cc", cc);
        return "2cjsp/admin/admin_chart2";

    }


    //    //??????session
//    @RequestMapping("forecheckLogin")
//    @ResponseBody
//    public String checkLogin( HttpSession session) {
//        User user =(User)  session.getAttribute("user");
////        System.out.println("?????????????????? controller");
//        if(null!=user)
//            return "success";
//        return "fail";
//    }

//    @RequestMapping("foreloginAjax")
//    @ResponseBody
//    public String loginAjax(@RequestParam("name") String name, @RequestParam("password") String password,HttpSession session) {
//        name = HtmlUtils.htmlEscape(name);
//        User user = userService.get(name,password);
//
//        if(null==user){
//            return "fail";
//        }
//        session.setAttribute("user", user);
//        return "success";
//    }

    //    //????????????
//    @RequestMapping("foreregister")
//    public String register(Model model,User user) {
//        String name =  user.getName();
//        name = HtmlUtils.htmlEscape(name);
//        user.setName(name);
//        boolean exist = userService.isExist(name);
//        if(exist){
//            String m ="????????????????????????,????????????";
//            model.addAttribute("msg", m);
//            return "fore/register";
//        }
//        userService.add(user);
//        //?????????????????????
//        Member m=new Member();
//        m.setMember_name(user.getName());
//        //???????????????
//        memberService.add(m);
//        return "redirect:registerSuccessPage";//?????????PageController??????registerSuccessPage
//    }

//    //????????????
//    @RequestMapping("forelogin")
//    public String login(@RequestParam("name") String name, @RequestParam("password") String password, Model model, HttpSession session) {
//        name = HtmlUtils.htmlEscape(name);
//        User user = userService.get(name,password);
//
//        if(null==user){
//            model.addAttribute("msg", "??????????????????");
//            return "fore/login";
//        }
//        session.setAttribute("user", user);
//        return "redirect:forehome";
//    }

//    /**    ????????? ??????        */
//    @RequestMapping("adminadmin_login")
//            public String admin_login(@RequestParam("admin_name") String name, @RequestParam("admin_password") String password, Model model, HttpSession session) {
//            name = HtmlUtils.htmlEscape(name);
//              System.out.println("??????????????????"+name);
//            User user = userService.get(name,password);
//
//            if(null==user){
//                model.addAttribute("msg", "??????????????????");
//                return "admin/admin_login";
//            }
//            session.setAttribute("admin", user);
//             return "admin/admin_index";
//        }

//    @RequestMapping("adminlogoff")
//    public String adminlogout( HttpSession session) {
//        session.removeAttribute("admin");
//        return "redirect:forehome";
//    }


//    @RequestMapping("forelogout")
//    public String logout( HttpSession session) {
//        session.removeAttribute("user");
//        return "redirect:forehome";
//    }

    //    @RequestMapping("foreaddCart")
//    @ResponseBody
//    public String addCart(int pid, int num, Model model,HttpSession session) {
//        Product p = productService.get(pid);
//        User user =(User)  session.getAttribute("user");
//        boolean found = false;
//
//        List<OrderItem> ois = orderItemService.listByUser(user.getId());
//        for (OrderItem oi : ois) {
//            if(oi.getProduct().getId().intValue()==p.getId().intValue()){
//                oi.setNumber(oi.getNumber()+num);
//                orderItemService.update(oi);
//                found = true;
//                break;
//            }
//        }
//        if(!found){
//            OrderItem oi = new OrderItem();
//            oi.setUid(user.getId());
//            oi.setNumber(num);
//            oi.setPid(pid);
//            orderItemService.add(oi);
//        }
//        return "success";
//    }


//    @RequestMapping("forecart")
//    public String cart( Model model,HttpSession session) {
//        User user =(User)  session.getAttribute("user");
//        List<OrderItem> ois = orderItemService.listByUser(user.getId());
//        model.addAttribute("ois", ois);
//        return "fore/cart";
//    }


//    @RequestMapping("forechangeOrderItem")
//    @ResponseBody
//    public String changeOrderItem( Model model,HttpSession session, int pid, int number) {
//        User user =(User)  session.getAttribute("user");
//        if(null==user)
//            return "fail";
//
//        List<OrderItem> ois = orderItemService.listByUser(user.getId());
//        for (OrderItem oi : ois) {
//            if(oi.getProduct().getId().intValue()==pid){
//                oi.setNumber(number);
//                orderItemService.update(oi);
//                break;
//            }
//        }
//        return "success";
//    }


//    @RequestMapping("foredeleteOrderItem")
//    @ResponseBody
//    public String deleteOrderItem( Model model,HttpSession session,int oiid){
//        User user =(User)  session.getAttribute("user");
//        if(null==user)
//            return "fail";
//        orderItemService.delete(oiid);
//   2cjsp "success";
//    }

}

