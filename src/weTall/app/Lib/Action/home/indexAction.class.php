<?php
class indexAction extends frontendAction {
    public function _initialize(){
    	$this->_cat = M('category');
    	$this->_ser = M('service');
    	$this->_item = M('item');
    	$this->_art = M('article_new');
    }

    public function getItem_cate($where = array())
    {
    	$where_init = array('status'=>'1');
    	$where =array_merge($where_init, $where);
    
    	return $item=M('item_cate')->where($where)->select();
    }
    
    public function addressselect(){
    	$upload_shop = M("item");
    	$color = $_GET["color"];
    	$size = $_GET["size"];
    	 
    	$where["id"] = $_GET["item_id"];
    	$result2 = $upload_shop->where($where)->find();
    	$detail_stock=explode(",", $result2["detail_stock"]);
    	foreach ($detail_stock as $stock){
    		$stock_real=explode("|",$stock);
    		if ($stock_real[0] == $color && $stock_real[1] == $size) {
    			$item_stcok = $stock_real[2];
    		}
    	}
    
    	$result = $item_stcok;
    	if ($result){
    		// 成功后返回客户端新增的用户ID，并返回提示信息和操作状态
    		$this->ajaxReturn($result,"新增成功！",1);
    	}else{
    		// 错误后返回错误的操作状态和提示信息
    		$this->ajaxReturn(0,"新增错误！",0);
    	}
    }
    public function search() {
    	//排序字段和方式的获得
    	$sortByStr=$this->_get("sortid","trim");
    	$sortmethod=$this->_get("sortmethod","trim");
    	if($sortByStr == "" or $sortmethod == ""){
    		$sortBy = "add_time desc";
    		$sortByStr="add_time";
    		$sortmethod="desc";
    	}else{
    		
	    	if ($_SESSION["sortstr"] == $sortByStr) {    			
		    	if($sortmethod == "asc"){
		    		$sortmethod="desc";
		    	}else{
		    		$sortmethod="asc";
		    	}
	    	}else{
	    		$sortmethod="desc";
	    	}
	    	$sortBy = $sortByStr." ".$sortmethod;
	    }
    	$this->assign("sortfield",$sortByStr);
    	$_SESSION["sortstr"]=$sortByStr;
    	$this->assign("sortmethod",$sortmethod);
    	if(IS_POST){
    	 //搜索关键字时候	
    		$keyword=$this->_post("txtkeyword","trim");
    		//搜索的方式本店，微信商城，店铺
    		$method=$this->_post("method");
    		
    		$tokenTall = $this->getTokenTall();
    		if($tokenTall != ""){
    			$token= $tokenTall;
    		}else{
    			$token=$_SESSION["tokenTall"];
    		}
    		$this->assign("method",$method);
    		if($keyword == ""){
    			$this->error("请输入关键字！");
    		}
    		else if($method=="local"){//本店
    			$this->nextPage($method, $keyword,$sortBy, $token);
                $_SESSION['keyword']=$keyword;
                $_SESSION['token']=$token;
                $_SESSION['method']=$method;
    		}else if($method=="weFig"){//微信商城
    			$this->nextPage($method, $keyword,$sortBy);
                $_SESSION['keyword']=$keyword;
                $_SESSION['method']=$method;
    		}else{//店铺内搜索微信商城
    			$this->nextPage($method, $keyword,$sortBy);
    			$_SESSION['keyword']=$keyword;
    			$_SESSION['method']=$method;
    		}
    		
    	}else{
    		$itemid=$this->_get("itemid","trim");
    		$brandid=$this->_get("brandid","trim");
    		$method2=$this->_get("method","trim");
    		if($method2 != "local" and $method2 != "weFig" and $method2 != "shop" and $method2 != ""){//类别搜索
    			$this->assign("method",$method2);
    			$this->nextPagetuan($_SESSION['token'],$method2,$sortBy);
    		}else if ($brandid != ""){//品牌
    			//$this->assign("method",$brandid);
    			$this->assign("brandid",$brandid);
    			$this->nextPageBrand($_SESSION['token'],$brandid,$sortBy);
    		}else if ($itemid != "") {//新品上市  服装鞋帽等
    			//$this->assign("method",$itemid);
    			$this->assign("itemid",$itemid);
    			$this->nextPageCate($_SESSION['token'],$itemid,$sortBy);
    		}else if($_SESSION['method'] == "local"){//本店搜索
    			$this->assign("method",$_SESSION['method']); 
    		    $this->nextPage($_SESSION['method'], $_SESSION['keyword'],$sortBy, $_SESSION['token']);
    		}else{//关键字搜索后的分页
    			$this->assign("method",$_SESSION['method']);
    			$this->nextPage($_SESSION['method'], $_SESSION['keyword'],$sortBy);
    		}
    	}
    	
    }
    public function nextPagetuan($token,$itemid,$sortBy){
    	$tokenTall = $token;
    	$this->assign('tokenTall',$tokenTall);
    	
    	switch ($itemid) {
    		case "new": $method="0";break;
    		case "recom":$method="1";break;
    		case "free":$itemCate="餐饮娱乐";break;
    		case "fuzhuang":$itemCate="服装鞋帽";break;
    		case "shuma":$itemCate="手机数码";break;
    		case "shenghuo":$itemCate="家用电器";break;
    		case "tushu":$itemCate="母婴用品";break;
    		case "huazhuang":$itemCate="美妆饰品";break;
    		case "meishi":$itemCate="百货食品";break;
    	}
    	
    	$item = M("item");
    	if($itemCate == ""){
    		if ($method=="0") {
    			$condition["news"] = "1";
    		}else{
    		    $condition["tuijian"] = $method;
    		}
    	}else{
    		$name["name"]=$itemCate;
    		$item_cate=M("item_cate")->where($name)->select();
    		foreach ($item_cate as $val){
    			$data["pid"]=$val["id"];
    			$itemID=M("item_cate")->where($data)->select();
    		}
    		foreach ($itemID as $varL){
    			$condition2[]=$varL["id"];
    		}
    		$condition["cate_id"]=array('in',$condition2);
    	}    	
    
    	if(count($condition2) != 0 or $method != ""){
    		$count = $item->where($condition)->count();   	
	    	$Page       = new Page($count,10);// 实例化分页类 传入总记录数
	    	// 进行分页数据查询 注意page方法的参数的前面部分是当前的页数使用 $_GET[p]获取
	    	$nowPage = isset($_GET['p'])?$_GET['p']:1;
	    	$show       = $Page->show();// 分页显示输出
	    	$carryrecord  = $item->where($condition)->order($sortBy)->limit($Page->firstRow.','.$Page->listRows)->select();
    	}
	    	//var_dump($carryrecord);die();
    	$this->assign("item",$carryrecord);
    	$this->assign("itemcate","Y");
    	$this->assign('page',$show);// 赋值分页输出pti
    	$this->assign("count",$count);
    	$this->display();
    }
    public function nextPageBrand($token,$itemid,$sortBy){
    	$tokenTall = $token;
    	$this->assign('tokenTall',$tokenTall);
    	 
    	$item = M("item");
    	$condition["brand"] = $itemid;
    	$count = $item->where($condition)->count();
    	$Page       = new Page($count,10);// 实例化分页类 传入总记录数
    	// 进行分页数据查询 注意page方法的参数的前面部分是当前的页数使用 $_GET[p]获取
    	$nowPage = isset($_GET['p'])?$_GET['p']:1;
    	$show       = $Page->show();// 分页显示输出
    	$carryrecord  = $item->where($condition)->order($sortBy)->limit($Page->firstRow.','.$Page->listRows)->select();
    
    	$this->assign("item",$carryrecord);
    	$this->assign("itemcate","Y");
    	$this->assign('page',$show);// 赋值分页输出pti
    	$this->assign("count",$count);
    	$this->display();
    }
    public function nextPageCate($token,$itemid,$sortBy){
    	$tokenTall = $token;
    	$this->assign('tokenTall',$tokenTall);
    	
    	$item = M("item");
    	//if($token != ""){
    	//	$condition["tokenTall"]=$token;
    	//}
    	$condition["cate_id"] = $itemid;
    	$count = $item->where($condition)->count();
    	$Page       = new Page($count,10);// 实例化分页类 传入总记录数
    	// 进行分页数据查询 注意page方法的参数的前面部分是当前的页数使用 $_GET[p]获取
    	$nowPage = isset($_GET['p'])?$_GET['p']:1;
    	$show       = $Page->show();// 分页显示输出
    	$carryrecord  = $item->where($condition)->order($sortBy)->limit($Page->firstRow.','.$Page->listRows)->select();
    	 
    	$this->assign("item",$carryrecord);
    	$this->assign("itemcate","Y");
    	$this->assign('page',$show);// 赋值分页输出pti
    	$this->assign("count",$count);
    	$this->display();
    }
    public function nextPage($method,$keyword,$sortBy,$token){
    	if($method=="shop"){   		
    		$item = M("wecha_shop");   		
    		$condition["name"] = array("like", "%".$keyword."%");
    		$count = $item->where($condition)->count();
    		$Page       = new Page($count,10);// 实例化分页类 传入总记录数
    		// 进行分页数据查询 注意page方法的参数的前面部分是当前的页数使用 $_GET[p]获取
    		$nowPage = isset($_GET['p'])?$_GET['p']:1;
    		$show       = $Page->show();// 分页显示输出
    		$carryrecord  = $item->where($condition)->order('credit DESC')->limit($Page->firstRow.','.$Page->listRows)->select();
    		
    		foreach ($carryrecord as $val){    			
    			$val["descr"]=mb_substr($val["descr"], 0,35,"utf-8")."...";
    			$carryrecord2[]=$val;
    		}
 
    		$this->assign("item",$carryrecord2);
    		$this->assign("method",$method);
    		$this->assign('page',$show);// 赋值分页输出pti
    		$this->assign("count",$count);
    		$this->display();
    	}else{
	    	$tokenTall = $token;
	    	$this->assign('tokenTall',$tokenTall);
	    	//echo $keyword."hi";die();
	    	$item = M("item");
	    	if($token != ""){
	    	   $condition["tokenTall"]=$token;
	    	}
	    	$condition["title"] = array("like", "%".$keyword."%");
	    	$count = $item->where($condition)->count();
	    	$Page       = new Page($count,10);// 实例化分页类 传入总记录数
	    	// 进行分页数据查询 注意page方法的参数的前面部分是当前的页数使用 $_GET[p]获取
	    	$nowPage = isset($_GET['p'])?$_GET['p']:1;
	    	$show       = $Page->show();// 分页显示输出
	    	$carryrecord  = $item->where($condition)->order($sortBy)->limit($Page->firstRow.','.$Page->listRows)->select();
	    	 
	    	$this->assign("item",$carryrecord);
	    	$this->assign("method",$method);
	    	$this->assign('page',$show);// 赋值分页输出pti
	    	$this->assign("count",$count);
	    	$this->display();
    	}
    }
    public function getItem($where = array())
    {
    	$where_init = array('status'=>'1');
        $where =array_merge($where_init, $where);
    	
    	return $item=M('item')->where($where)->select();
    }
    
    
    public function ajaxLogin()
    {
    	
        $user_name=$_POST['user_name'];
        $password=$_POST['password'];
       
        $user=M('user');
        $users= $user->where("username='".$user_name."' and password='".md5($password)."'")->find(); 
        if(is_array($users))
        {
        	$tokenTall = $this->getTokenTall();
    		$data = array('status'=>1, 'url'=>U('user/index', array('tokenTall'=>$tokenTall)));
    		$_SESSION['user_info']=$users;
    		$user->where("username='".$user_name."' and password='".md5($password)."'")->save(array('last_login_time'=>time()));
        }else {
       		$data = array('status'=>0);
        }
    	
		echo json_encode($data);
    	exit;
    }
    
    public function ajaxRegister()
    {
    	$username = $_GET['user_name'];
    	$user = M('user');
    	$count = $user->where("username='".$username."'")->find();
    	if(is_array($count))
    	{
        	echo 'false';
    	}else 
    	{
    		echo 'true';
    	}
    }
    
    public function ajaxCheckuser()
    {
    	$username = $_GET['user_name'];
    	$user = M('user');
    	$count = $user->where("username='".$username."'")->find();
    	if(is_array($count))
    	{
    		echo 'true';
    	}
    	else
    	{
    		echo 'false';
    	}
    	
    }
    //收藏
    public function favi()
    {
    	//dump($_SESSION);exit;
    	//0-未登录 1-保存成功 2-保存失败 3-无动作类型
    	header("content-Type: text/html; charset=Utf-8");
    	$tokenTall = $this->getTokenTall();
    	if($_POST['act']){
    		$act = $_POST['act'];
    		if ($_SESSION['user_info']) {
	    		$userid = $_SESSION['user_info']['id'];
	    		$shopfav_mod = M('shop_favi');
	    		$insdata = array('userid'=>$userid, 'tokenTall'=>$tokenTall);
	    		if ($shopfav_mod->where($insdata)->find()) {
	    			//已经有记录的情况下
	    			if ($act == "add") {
	    				//收藏
	    				$data = array('status'=>2);
	    			}else{
	    				//取消收藏
	    				if($shopfav_mod->where($insdata)->delete()){
	    					//成功
	    					$data = array('status'=>1);
	    				}else{
	    					//失败
	    					$data = array('status'=>2);
	    				}
	    			}
	    			
	    		}else{
	    			//没有记录的情况下
	    			if ($act == "add") {
	    				//收藏
		    			if ($shopfav_mod->add($insdata)) {
		    				//成功
		    				$data = array('status'=>1);
		    			}else{
		    				//失败
		    				$data = array('status'=>2);
		    			}
	    			}else{
	    				//取消收藏
	    				//成功
	    				$data = array('status'=>1);
	    			}
	    		}
	    	}else{
	    		//当前未登录
	    		$data = array('status'=>0, 'url'=>U('user/index', array('tokenTall'=>$tokenTall)));
	    	}
    	}else{
    		//没有动作类型
    		$data = array('status'=>3);
    	}
    	
    	echo json_encode($data);
    }
    
    
    //商家信息
    public function shopinfo()
    {
    	
    	/*店铺信息*/
    	$weChaShop = M("wecha_shop");
    	if($tokenTall == ""){
    		$weshopData["tokenTall"] = $_SESSION["tokenTall"];
    	}else{
    		$weshopData["tokenTall"] = $tokenTall;
    	}
    	$weChaShopDetail = $weChaShop->where($weshopData)->find();//var_dump($weshopData);die();
    	$this->assign("weshopData",$weChaShopDetail);

//dump($weChaShopDetail["name"]);

		/*创店时间*/
    	$weUser = M("wxuser");
    	$weUserDetail = $weUser->where($weshopData)->find();//var_dump($weshopData);die();
    	$weUserDetail["createtime"] = date('Y-m-d h:m:s',$weUserDetail["createtime"]);
    	$this->assign("wxuserData",$weUserDetail);
//dump($weUserDetail["createtime"]);
    	
    	/*宝贝数量*/
    	$weItem = M("item");
    	$weItemCount = $weItem->where($weshopData)->count();//var_dump($weshopData);die();
    	$this->assign("weItemCount",$weItemCount);
//dump($weItemCount);

    	/*人气指数*/
    	$weShopFavi = M("shop_favi");
    	$weShopFaviCount = $weShopFavi->where($weshopData)->count();//var_dump($weshopData);die();
    	$this->assign("weshopFaviCount",$weShopFaviCount);
//dump($weShopFaviCount);

    	/*好评率*/
    	$item_id["item_id"]= $weChaShopDetail["id"];
    	$allNum = M("comments")->count();
    	$goodNum = M("comments")->where($item_id)->count();
    	
    	$rate = $goodNum/$allNum*100;
    	$this->assign("rate",$rate);
		//dump($allNum);
		//dump($goodNum);
		//dump($rate);    	
		//dump($weChaShopDetail["phone"]);
		//die();
    	$this->display();
    }    
    	 
    public function indexnew(){
    	$token = $this->getTokenTall();
    	$cond['token'] = $token;
    	$cond['type'] ="首页";
    	$flash_pos = M("flash_pos")->where($cond)->find();
    	$flash = M("flash")->where(array("pos"=>$flash_pos['id']))->select();
    	//dump($tuijianArticle);die;
    	$this->assign("flash",$flash);
    	$this->display();
    	
    }
   public function index(){
   	   //顶部幻灯片
   	   $token = $this->getTokenTall();
   	   $cond['token'] = $token;
   	   $cond['type'] ="首页";
   	   $flash_pos = M("flash_pos")->where($cond)->find();
   	   $flash = M("flash")->where(array("pos"=>$flash_pos['id']))->select();
   	   //$where['tuijian'] = 1;
   	   //四大服务
   	   header("Content-type:text/html;charset=utf-8");
   	   $serArr = $this->_cat->where("parentid = '0'")->order('level ASC')->limit(4)->select();
   	   //推荐二级分类，是否有子级，有跳到thdcate(三级分类),没有跳到thdlist(列表，注：如果列表里只有一个商品或服务跳到详情页)
       //dump($serArr);die();
       $arr = $this->getArr("Y");
   	   //dump($arr);die;
   	   
   	   //为我推荐模块
   	   $tuijianItem = $this->_item->where(array('status'=>1,'tuijian'=>1))->select();
   	   foreach($tuijianItem as $key => $val){
   	   		$tuijianItem[$key]['link'] = U("Item/index",array("itemid"=>$val['id']));
   	   }
   	   $tuijianArticle = $this->_art->where(array('tuijian'=>1))->select();
   	   foreach($tuijianArticle as $key => $val){
   	   		$tuijianArticle[$key]['link'] = U("Item/index_phone",array("itemid"=>$val['id']));
   	   }
   	   $tuijianService = $this->_ser->where(array('tuijian'=>1))->select();
   	   foreach($tuijianService as $key => $val){
   	   		$tuijianService[$key]['link'] = U("Item/index_book",array("itemid"=>$val['id']));
   	   }
   	   //dump($tuijianArticle);die;
   	   $this->assign("flash",$flash);
   	   //dump($arr);die;
   	   $this->assign("serArr",$serArr);
   	   $this->assign("tuijian",$arr);
   	   $this->assign("tuijianItem",$tuijianItem);
   	   $this->assign("tuijianArticle",$tuijianArticle);
   	   $this->assign("tuijianService",$tuijianService);
   	   $this->display();
   }

   public function listall(){
   	  $arr = $this->getArr();
   	  //dump($arr);die; 
   	  $this->assign("res",$arr);  	
   	  $this->display();
   }
   public function seclist(){//二级分类列表
   	   $secCatid = $this->_get("catid","trim,intval");//一级分类id
   	   !$secCatid && $this->_404();
   	   
   	   //幻灯片
   	   $catName = $this->_cat->field("catname")->where(array("id"=>$secCatid))->find();
   	   $flash_pos = M("flash_pos")->where(array("type"=>$catName['catname']))->find();
   	   if(empty($flash_pos) || $flash_pos == false){
   	   	$flash_pos = M("flash_pos")->where(array("type"=>"首页"))->find();
   	   }
   	   $flash = M("flash")->where(array("pos"=>$flash_pos['id']))->select();
   	   
   	   $res = $this->_cat->where(array("parentid"=>$secCatid))->select();//一级下所有二级分类
   	   foreach ($res as $key => $val){
   	   	$flag = $this->_cat->where(array('parentid'=>$val['id']))->find();
   	   	if(empty($flag) || $flag == null){//没有子集
   	   		//查找itme,article,service,只有一个商品，跳到详情
   	   		$where['cate_id'] = $val['id'];
   	   		$itemAll = $this->_item->where($where)->count();
   	   		$serAll = $this->_ser->where($where)->count();
   	   		$artmAll = $this->_art->where($where)->count();
   	   			
   	   		if($itemAll > 1 || $serAll > 1 || $artmAll > 1 || ($itemAll+$serAll+$artmAll) > 1){//不止一条数据
   	   			 
   	   			$res[$key]['link'] = U("index/thdlist",array("catid"=>$val['id']));
   	   			 
   	   		}else if($itemAll == 1 || $serAll == 1 || $artmAll == 1 && ($itemAll+$serAll+$artmAll) == 1){
   	   			//判断表及对应的页面
   	   			$page = "";
   	   			$table="";
   	   			if($itemAll == 1){
   	   				$page = "index";
   	   				$table ="item";
   	   			}
   	   			if($serAll == 1){
   	   				$page = "index_book";
   	   				$table ="service";
   	   			}
   	   			if($artmAll == 1){
   	   				$page = "index_phone";
   	   				$table ="article_new";
   	   			}
   	   			 
   	   			if($table != ''){
   	   				//找到这条数据
   	   				// dump($table);
   	   				$item = M($table)->where($where)->find();
   	   				//根据商品所属跳到不同商品详情页
   	   				$res[$key]['link'] = U("Item/{$page}",array("itemid"=>$item['id']));
   	   			}
   	   		}else{//都没有数据
   	   			$res[$key]['link'] = U("index/index");
   	   		}
   	   	}else{//no empty
   	   		$res[$key]['link'] = U("index/thdcate",array("catid"=>$val['id']));
   	   	}
   	   } 
   	   //dump($res);die;
   	   $this->assign("res",$res); 
   	   $this->assign("flash",$flash);
   	   $this->display();
   }
   public function thdcate(){//三级分类

   	   header("Content-type:text/html;charset=utf-8");
   	   $catid = $this->_get("catid","trim,intval");//二级id
   	   !$catid && $this->_404();
   	   
   	   //幻灯片
   	   $catName = $this->_cat->field("id,parentid,catname")->where(array("id"=>$catid))->find();//找二级下的名称
   	   $flash_pos = M("flash_pos")->where(array("type"=>$catName['catname']))->find();
       if(empty($flash_pos) || $flash_pos == false){
	       	$cName = $this->_cat->field("catname")->where(array("id"=>$catName['parentid']))->find();
	       	$flash_pos = M("flash_pos")->where(array("type"=>$cName['catname']))->find();
	       	if(empty($flash_pos) || $flash_pos == false){
		       	$flash_pos = M("flash_pos")->where(array("type"=>"首页"))->find();
		    }      	
       }
   	   $flash = M("flash")->where(array("pos"=>$flash_pos['id']))->select();
   	   
   	   $res = $this->_cat->field("id,catname,picurl")->where(array("parentid"=>$catid))->order("id ASC")->select();
   	   foreach($res as $key =>$val){
	   	   	$where["cate_id"] = $val['id'];
	   	   	$where["status"] = 1;
	   	   	$condi['cate_id'] = $val['id'];
	   	   	$res[$key]["item"] = $this->getRes($where,$condi);
   	   } 
   	   //dump($res);die; 
   	   $this->assign("res",$res);
   	   $this->assign("flash",$flash);	   
   	   $this->display();
   }
   
   public function thdlist(){//没有三级，列出二级所有服务，商品，资讯
	   	$catid = $this->_get("catid","trim,intval");
	   	!$catid && $this->_404();
	   	$where["cate_id"] = $catid;
	   	$where["status"] = 1;
	   	$condi['cate_id'] = $catid;
        $res = $this->getRes($where,$condi);	   	   
	   	//dump($res);die;
   	   $this->assign("res",$res);
       $this->display();
   }
   public function houselist(){
        $res = M('house_sell')->order("updateTime Desc")->select();
        foreach ($res as $key => $val){
        	$res[$key]['link'] = U("Item/house_book",array("itemid"=>$val['id']));
        }
        dump($res);die;
        $this->assign("res",$res);
	   	$this->display('thdlist');
   }
   
   public function hugonglist(){
   	$res = M('hugong')->order("updateTime Desc")->select();
   	foreach ($res as $key => $val){
   		$res[$key]['link'] = U("Item/hugong_book",array("itemid"=>$val['id']));
   	}
   	dump($res);die;
   	$this->assign("res",$res);
   	$this->display('thdlist');   	
   }
   
   //搜索
   public function searchlist(){
   	  $keywords = $this->_post('keywords','trim');
   	  $where['title'] = array('like','%'.$keywords.'%');
   	  $condi['name'] = array('like','%'.$keywords.'%');
   	  $res = $this->getRes($where, $condi);
   	  //dump($res);die;
   	  $this->assign("res",$res);
   	  $this->assign("keywords",$keywords);
   	  $this->display();
   }
   
   public function getRes($where=array(),$condi=array()){
	     	$res = array();
   		    $tuijianItem = $this->_item->field("id,title,img,price,zb_price")->where($where)->select();
			if(is_array($tuijianItem)){
		   	   	foreach($tuijianItem as $key => $val){
		   	   		$tuijianItem[$key]['link'] = U("Item/index",array("itemid"=>$val['id']));
		   	   	}
			}else{
				$tuijianItem = array();
			}
			
	   	   	$tuijianArticle = $this->_art->field("id,name,img")->where($condi)->select();
            if(is_array($tuijianArticle)){
            	foreach($tuijianArticle as $key => $val){
            		$tuijianArticle[$key]['link'] = U("Item/index_phone",array("itemid"=>$val['id']));
            	}
            }else{
            	$tuijianArticle = array();
            }
	   	   	
	   	   	$tuijianService = $this->_ser->field("id,name,img,price,zb_price")->where($condi)->select();
	   	   	if(is_array($tuijianService)){
	   	   		foreach($tuijianService as $key => $val){
	   	   			$tuijianService[$key]['link'] = U("Item/index_book",array("itemid"=>$val['id']));
	   	   		}
	   	   	}else{
	   	   		$tuijianService = array();
	   	   	}
	   	
	   		$res = array_merge($tuijianItem,$tuijianArticle,$tuijianService);
	   	
	   	return $res;
   }
   
   public function getArr($condi=''){
   	
   	$serArr = $this->_cat->where("parentid = '0'")->order('level ASC')->limit(4)->select();
   	$arr = array();//保存所有二级被推荐的分类
   	foreach($serArr as $key => $val){
   		 $where['parentid'] = $val['id'];
   		if($condi != ''){
   		 	$where['tuijian'] = 1;
   		}
   		$tuijian_arr = $this->_cat->where($where)->select();
   		if(!empty($tuijian_arr)){
   			$arr[$key]["parrName"] = $val['catname'];
   			$arr[$key]["parrId"] = $val['id'];
   			$arr[$key]['parrTag']= $tuijian_arr;
   		}
   	}
   	// dump($arr);die;
   	
   		
   	//判断被推荐的分类是否有子级，对应添加不同的链接
   	foreach($arr as $keys => $vals){
   		foreach ($vals['parrTag'] as $key => $val){
   			$flag = $this->_cat->where(array('parentid'=>$val['id']))->find();
   			if(empty($flag) || $flag == null){//没有子集
   				//查找itme,article,service,只有一个商品，跳到详情
   				$cond['cate_id'] = $val['id'];
   				$itemAll = $this->_item->where($cond)->count();
   				$serAll = $this->_ser->where($cond)->count();
   				$artmAll = $this->_art->where($cond)->count();
   					
   				if($itemAll > 1 || $serAll > 1 || $artmAll > 1 || ($itemAll+$serAll+$artmAll) > 1){//不止一条数据
   					 
   					$arr[$keys]['parrTag'][$key]['link'] = U("index/thdlist",array("catid"=>$val['id']));
   					 
   				}else if($itemAll == 1 || $serAll == 1 || $artmAll == 1 && ($itemAll+$serAll+$artmAll) == 1){
   					//判断表及对应的页面
   					$page = "";
   					$table="";
   					if($itemAll == 1){
   						$page = "index";
   						$table ="item";
   					}
   					if($serAll == 1){
   						$page = "index_book";
   						$table ="service";
   					}
   					if($artmAll == 1){
   						$page = "index_phone";
   						$table ="article_new";
   					}
   					 
   					if($table != ''){
   						//找到这条数据
   						// dump($table);
   						$item = M($table)->where($cond)->find();
   						//根据商品所属跳到不同商品详情页
   						$arr[$keys]['parrTag'][$key]['link'] = U("Item/{$page}",array("itemid"=>$item['id']));
   					}
   				}else{//都没有数据
   					$arr[$keys]['parrTag'][$key]['link'] = U("index/index");
   				}
   			}else{//no empty
   				$arr[$keys]['parrTag'][$key]['link'] = U("index/thdcate",array("catid"=>$val['id']));
   			}
   		}
   	}
   	return $arr;   	
   }
   //复诊预约
   public function rebook(){
   	 
   	$this->display();
   }
}
