<?php
class SaleStatAction extends UserAction{
	public function _initialize(){
		parent::_initialize();

		$tokenTall = $this->getTokenTall();
		$this->assign('tokenTall', $tokenTall);
		
	    //商家
        $business = M('business')->field("id,b_name")->select();
       // dump($business);die;
        $this->assign("businessT",$business);
		//二级分类
		$thCate = M('category')->field("id,catname")->where(array("parentid"=>0))->select();
		$this->assign("thCateT",$thCate);
		
		$shopinfo = M('wecha_shop')->where(array('tokenTall'=>$tokenTall))->find();
		$this->assign('shopinfo', $shopinfo);
		
		$buycount= M('item')->where(array('status'=>1))->count();
		$nobuycount= M('item')->where(array('status'=>0))->count();
		$fukuan= M('item_order')->where(array('status'=>1))->count();
		$fahuo= M('item_order')->where(array('status'=>2))->count();
		$yfahuo= M('item_order')->where(array('status'=>3))->count();
		$end = M('item_order')->where(array('status'=>4))->count();
		$totalamt = M('item_order')->where(array('status'=>4))->sum('order_sumPrice');
		$srvcount= M('service')->where(array('status'=>1))->count();
		$srvcount_bad= M('service')->where(array('status'=>0))->count();
		$totalamt_today = M('item_order')->where(" status=4 and FROM_UNIXTIME(add_time,'%m/%d/%Y')=date_format(now(),'%m/%d/%Y') ")->sum('order_sumPrice');
		$totalamt_online = M('item_order')->where('status=4 and supportmetho<>2')->sum('order_sumPrice');
		$this->assign('count',
				array(	'fukuan'=>$fukuan,
						'fahuo'=>$fahuo,
						'yfahuo'=>$yfahuo,
						'end'=>$end,
						'buycount'=>$buycount,
						'nobuycount'=>$nobuycount,
						'totalamt'=>$totalamt,
						'srvcount'=>$srvcount,
						'srvcount_bad'=>$srvcount_bad,
						'totalamt_today'=>$totalamt_today,
						'totalamt_online'=>$totalamt_online
				)
		);		
	}
	
	public function index(){

		//$p = new Page ( $count, 10 );//每页显示10条
		/*$order_detail=M()->query("
		select b.title,b.img,b.quantity,SUM(b.price*b.quantity) amt, d.b_name 
		from tp_item_order a, tp_order_detail b, tp_item c, tp_business d 
		where a.orderId=b.orderId 
		and a.`status`=4 
		and FROM_UNIXTIME(a.add_time,'%m/%d/%Y')=DATE_FORMAT(now(),'%m/%d/%Y') 
		and b.itemId=c.id
		and c.isBusiness=d.id
		order by SUM(b.price*b.quantity) desc");
		*/
		//商品当天订单总量
		$sum_order_item = M()->Table("tp_item_order a,tp_order_detail b,tp_item c,tp_business d,tp_category e")->field('b.title,b.img,SUM(b.quantity) sumQ,b.price,SUM(b.price*b.quantity) amt, d.b_name,e.catname')->where("a.orderId=b.orderId 
		and a.`status`=4 
		and FROM_UNIXTIME(a.add_time,'%m/%d/%Y')=DATE_FORMAT(now(),'%m/%d/%Y') 
		and b.itemId=c.id and d.id=c.isBusiness and e.id = c.cate_id and b.item_source = 0")->group('b.title')->order('amt DESC')->select();
		if($sum_order_item == null || $sum_order_item == ''){$sum_order_item = array();}
		//服务当天订单总量
		$sum_order_service = M()->Table("tp_item_order a,tp_order_detail b,tp_service c,tp_business d,tp_category e")->field('b.title,b.img,SUM(b.quantity) sumQ,b.price,SUM(b.price*b.quantity) amt, d.b_name,e.catname')->where("a.orderId=b.orderId
		and a.`status`=4
		and FROM_UNIXTIME(a.add_time,'%m/%d/%Y')=DATE_FORMAT(now(),'%m/%d/%Y')
		and b.itemId=c.id and d.id=c.business_id and e.id = c.cate_id and b.item_source = 1")->group('b.title')->order('amt DESC')->select();
		if($sum_order_service == null || $sum_order_service == ''){$sum_order_service = array();}
		$sum_order = array_merge($sum_order_item,$sum_order_service);
		$this->assign('order_detail',$sum_order);//订单商品信息
		$this->display();
	}
	
	//搜索
	public function search(){
		 $startTime = $this->_post('start_time');//起
		 $endTime = $this->_post('end_time');//止
		// dump($startTime);die;
		 $sql = "";//拼接sql语句
		 $sql2 = "";
		 if($startTime !="" && $endTime != ""){
		 	 $this->assign("startTime",$startTime);
		 	 $this->assign("endTime",$endTime);
		 	  $sql .= "and a.add_time >= ".strtotime($startTime)." and a.add_time <= ".strtotime($endTime);
		 }
		 $business = $this->_post('business');//商家
		 if($business != 0){
		 	$this->assign("businessId",$business);
		 	 $sql .=" and d.id = ".$business;
		 }
		 $thCate = $this->_post('thCate');//分类
		if($thCate != 0){
			$this->assign("thCateId",$thCate);
			$sql .= " and (e.id = ".$thCate." or e.parentid = ".$thCate.")";
		}
		$keywords = $this->_post('keywords','trim');//关键词
		if($keywords != ''){
			$this->assign('keyword',$keywords);
			$sql1 = " and c.title like '%".$keywords."%'";
			$sql2 = " and c.name like '%".$keywords."%'";
		}
       // dump($sql);die;
		$sum_order_item = M()->Table("tp_item_order a,tp_order_detail b,tp_item c,tp_business d,tp_category e")->field('b.title,b.img,SUM(b.quantity) sumQ,b.price,SUM(b.price*b.quantity) amt, d.b_name,e.catname,c.title')->where("a.orderId=b.orderId
		and a.`status`=4
		and b.itemId=c.id and d.id=c.isBusiness and e.id = c.cate_id and b.item_source = 0 ".$sql.$sql1)->group('b.title')->order('amt DESC')->select();
		if($sum_order_item == null || $sum_order_item == ''){$sum_order_item = array();}
		
		//服务当天订单总量
		$sum_order_service = M()->Table("tp_item_order a,tp_order_detail b,tp_service c,tp_business d,tp_category e")->field('b.title,b.img,SUM(b.quantity) sumQ,b.price,SUM(b.price*b.quantity) amt, d.b_name,e.catname,c.name')->where("a.orderId=b.orderId
		and a.`status`=4
		and b.itemId=c.id and d.id=c.business_id and e.id = c.cate_id and b.item_source = 1 ".$sql.$sql2)->group('b.title')->order('amt DESC')->select();
		if($sum_order_service == null || $sum_order_service == ''){$sum_order_service = array();}
		//dump(M()->getLastSql());die;
		$sum_order = array_merge($sum_order_item,$sum_order_service);
		$this->assign('order_detail',$sum_order);//订单商品信息
		//dump($sum_order);die;
		
		//销售总额
		$sum_order_price0 = M()->Table("tp_item_order a,tp_order_detail b,tp_item c,tp_business d,tp_category e")->where("a.orderId=b.orderId
		and a.`status`=4
		and b.itemId=c.id and d.id=c.isBusiness and e.id = c.cate_id and b.item_source = 0 ".$sql.$sql1)->sum('a.order_sumPrice');
		
		$sum_order_price1 = M()->Table("tp_item_order a,tp_order_detail b,tp_service c,tp_business d,tp_category e")->where("a.orderId=b.orderId
		and a.`status`=4
		and b.itemId=c.id and d.id=c.business_id and e.id = c.cate_id and b.item_source = 1 ".$sql.$sql2)->sum('a.order_sumPrice');		
		$this->assign("sumPrice",$sum_order_price0+$sum_order_price1);
		
		//在线支付总额
		$online_sum_order_price0 = M()->Table("tp_item_order a,tp_order_detail b,tp_item c,tp_business d,tp_category e")->where("a.orderId=b.orderId
		and a.`status`=4 and a.supportmetho<>2
		and b.itemId=c.id and d.id=c.isBusiness and e.id = c.cate_id and b.item_source = 0 ".$sql,$sql1)->sum('a.order_sumPrice');
		
		$online_sum_order_price1 = M()->Table("tp_item_order a,tp_order_detail b,tp_service c,tp_business d,tp_category e")->where("a.orderId=b.orderId
		and a.`status`=4 and a.supportmetho<>2
		and b.itemId=c.id and d.id=c.business_id and e.id = c.cate_id and b.item_source = 1 ".$sql.$sql2)->sum('a.order_sumPrice');
		$this->assign("online_sumPrice",$online_sum_order_price0+$online_sum_order_price1);
				
		$this->display('index');
	}
	
}
?>