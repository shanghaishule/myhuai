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
				$this->assign('count',
						array(	'fukuan'=>$fukuan,
								'fahuo'=>$fahuo,
								'yfahuo'=>$yfahuo,
								'end'=>$end,
								'buycount'=>$buycount,
								'nobuycount'=>$nobuycount,
								'totalamt'=>$totalamt
						)
				);
				
				
				$info_notice = M('info_notice')->where(array('status'=>1))->select();
				$this->assign('info_notice', $info_notice);
				
				$this->display();
			
		
	}
}
?>