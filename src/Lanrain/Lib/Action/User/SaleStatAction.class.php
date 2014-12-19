<?php
class SaleStatAction extends UserAction{
	public function index(){
	
		$tokenTall = $this->getTokenTall();
		$this->assign('tokenTall', $tokenTall);
		
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
		$totalamt_today = M('item_order')->where(" status=4 and date_format(add_time,'%m/%d/%Y')=date_format(now(),'%m/%d/%Y') ")->sum('order_sumPrice');
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
		$count = M()->Table("tp_item_order a,tp_order_detail b,tp_item c,tp_business d,tp_category e,tp_service f")->field('b.title,b.img,SUM(b.quantity) sumQ,b.price,SUM(b.price*b.quantity) amt, d.b_name,e.catname')->group('b.title')->where("(a.orderId=b.orderId 
		and a.`status`=4 
		and FROM_UNIXTIME(a.add_time,'%m/%d/%Y')=DATE_FORMAT(now(),'%m/%d/%Y') 
		and b.itemId=c.id
		and c.isBusiness=d.id and c.cate_id = e.id) OR (a.orderId=b.orderId 
		and a.`status`=4 
		and FROM_UNIXTIME(a.add_time,'%m/%d/%Y')=DATE_FORMAT(now(),'%m/%d/%Y')
		and b.itemId=f.id
		and f.business_id=d.id and f.cate_id = e.id)")->count();    //计算总数
		//dump($count);die;
		$p = new Page ( $count, 10 );//每页显示10条
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
		$order_detail = M()->Table("tp_item_order a,tp_order_detail b,tp_item c,tp_business d,tp_category e,tp_service f")->field('b.title,b.img,SUM(b.quantity) sumQ,b.price,SUM(b.price*b.quantity) amt, d.b_name,e.catname')->group('b.title')->where("(a.orderId=b.orderId 
		and a.`status`=4 
		and FROM_UNIXTIME(a.add_time,'%m/%d/%Y')=DATE_FORMAT(now(),'%m/%d/%Y') 
		and b.itemId=c.id
		and c.isBusiness=d.id and c.cate_id = e.id) OR (a.orderId=b.orderId 
		and a.`status`=4 
		and FROM_UNIXTIME(a.add_time,'%m/%d/%Y')=DATE_FORMAT(now(),'%m/%d/%Y')
		and b.itemId=f.id
		and f.business_id=d.id and f.cate_id = e.id)")->order('amt DESC')->limit($p->firstRow.','.$p->listRows)->select();
		$show       = $p->show();// 分页显示输出
		$this->assign('page',$show);// 赋值分页输出
		$this->assign('order_detail',$order_detail);//订单商品信息
		$this->display();
	}
}
?>