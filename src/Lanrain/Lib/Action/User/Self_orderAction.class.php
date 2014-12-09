<?php
class Self_orderAction extends UserAction{
	public $arr = array();
	public function _initialize(){
		parent::_initialize();
		$this->_mod = M('category');
	}
	public function index(){
		$where["parentid"]= 0;
		$res = $this->_mod->where($where)->order("level ASC")->select();
		$this->assign("firstCat",$res);
		$this->display();
	}	
	
	/**
	 * 获取商品分类及分类下服务和资讯树杈结构
	 * @return json
	 */
	public function get_category(){
		$where["parentid"]= 0;
		$res = $this->_mod->where($where)->order("level ASC")->select();//一级分类
		foreach ($res as $key => $val){
			$res1 = $this->_mod->where(array('parentid'=>$val['id']))->order("level ASC")->select();//二级分类
			$res[$key]['c'] = $res1;
			foreach($res1 as $keys => $va){
				$res2 = $this->_mod->where(array('parentid'=>$va['id']))->order("level ASC")->select();
				if(!empty($res2) && $res){
					$res[$key]['c'][$keys]['d'] = $res2;
					foreach($res2 as $keyT => $vaT){
						$res[$key]['c'][$keys]['d'][$keyT]['e'] = $this->getSerArt($vaT['id']);
					}
			    }else{
			    	$res[$key]['c'][$keys]['d'] = $this->getSerArt($va['id']);
			    }
	        }
		}
		//dump($res);die;
		echo json_encode($res);
	}
	
	//获取底级分类的服务和资讯
	public function getSerArt($cate_id = ''){
		$arr = array();
		$resService = M('service')->where(array("cate_id"=>$cate_id))->select();
		if($resService == null || empty($resService)){
			$resService = $arr;
		}else{
			foreach ($resService as $key => $val){
				$resService[$key]['source'] = 'service';//给每个item加标识，区分商品，服务，资讯
				$resService[$key]['e'] = array();
			}
		}
		$resArticle = M('article_new')->where(array("cate_id"=>$cate_id))->select();
		if($resArticle == null || empty($resArticle)){
			$resArticle = $arr;
		}else{
			foreach ($resArticle as $key => $val){
				$resArticle[$key]['source'] = 'article_new';
				$resArticle[$key]['e']=array();
			}
		}
		return array_merge($resService,$resArticle);
	}
	
    //快速搜索
    public function search(){
    	$arr = array();
    	$keywords = $this->_post('keywords','trim');
    	$where = array();
    	$where['name'] = array('like','%'.$keywords.'%');
    	$resService = M('service')->where($where)->select();
    	if($resService == null || empty($resService)){
    		$resService = $arr;
    	}else{
    		foreach ($resService as $key => $val){
    			$resService[$key]['listItem'] = implode(' >> ',$this->getParentid($val['cate_id']))." >> ".preg_replace("/($keywords)/i","<b style=\"color:red\">\\1</b>",$val['name']);
    			$resService[$key]['source'] = 'service';
    			$this->arr = array();//清空前条保存的数据
    		}
    	} 
    	$resArticle = M('article_new')->where($where)->select();
    	if($resArticle == null || empty($resArticle)){
    		$resArticle = $arr;
    	}else{
    		foreach ($resArticle as $key => $va){
    			$resArticle[$key]['listItem'] =implode(' >> ',$this->getParentid($va['cate_id']))." >> ".preg_replace("/($keywords)/i","<b style=\"color:red\">\\1</b>",$va['name']);
    			$resArticle[$key]['source'] = 'article_new';
    			$this->arr = array();
    		}
    	}
    	$res = array_merge($resService,$resArticle);
    	//dump($res);die;
    	$this->assign('allSerArt',$res);
    	$this->assign("keywords",$keywords);
    	$this->assign("countItem",count($res));
    	$this->display("index");
    }
    
    //获取商品所属分类的所有父级分类 
    public function getParentid($cat_id){
    	$res = $this->_mod->where(array("id"=>$cat_id))->find();
    	$this->arr[] = $res['catname'];
    	if($res['parentid'] != 0){
    		$this->getParentid($res['parentid']);
    	}
    	krsort($this->arr);
    	return $this->arr;
    }
    //自助下单
    public function edit(){
    	if(IS_POST){
    		$dingdanhao = date("Y-m-dH-i-s");
    		$dingdanhao = str_replace("-","",$dingdanhao);
    		$dingdanhao .= rand(1000,2000);
    		$data['orderId'] = $dingdanhao;
    		$data['add_time'] = time();
    		$dataD['orderId'] = $dingdanhao;
    		$dataD['itemId'] = $this->_post('Item_id');
    		$itemTab = $this->_post('ItemSource');
    		if($itemTab == 'service'){
    			$dataD['item_source'] = 1;
    		}
    		if($itemTab == 'article_new'){
    			$dataD['item_source'] = 2;
    		}
    		$dataD['title'] = $this->_post('Item_name');
    		$dataD['img'] = $this->_post('Item_img');
    		$dataD['price'] = $this->_post('Item_price');
    		$dataD['quantity'] = $this->_post('goods_num');
    		if($dataD['itemId'] == '' || $dataD['item_source']=='' || $dataD['title']==''|| $dataD['price'] == '' || $dataD['quantity']==''){
    			$this->error("请填写完整信息！");
    		}
    		$data['address_name'] = $this->_post('address_name');
    		$data['address'] = $this->_post('address');
    		$data['mobile'] = $this->_post('Item_phone');
    		$data['note'] = $this->_post('Item_note');
    		$data['goods_sumPrice'] = $dataD['price'] * $dataD['quantity'];
    		$data['order_sumPrice'] = $dataD['price'] * $dataD['quantity'];
    		$data['orderSource'] = 1;//后台客服下单
    		$data['userId'] = session("uid");
    		$data['userName'] = session("uname");
    		$data['supportmetho'] = 2;//货到付款
    		$data['freetype'] = 0;//卖家包邮
    		$data['userfree'] = 0;//无需快递
    		$data['tokenTall'] = $this->getTokenTall();
    		$flag =M('item_order')->add($data);
    		if($flag){
    			if(M('order_detail')->add($dataD)){
    				 $this->success("订单已生成！",U('Wetall_order/edit',array('id'=>$flag)));
    			}else{
    				$this->error("订单生成失败！");
    			}
    		}else{
    			$this->error("订单生成失败！");
    		}
    	}else{
    		$where['name'] = $this->_get("Itemname");
    		$where['id'] = $this->_get("Itemid",'intval,trim');
    		$Item_table = $this->_get("Item_table",'trim');
    		//echo $Itemid.':'.$Itemname.':'.$Item_table;
    		if($where['name'] == '' || $where['id']== '' || $Item_table == ''){
    			$this->error("参数错误，返回重新选择！");
    		}
    		
    		$ItemInfo = M($Item_table)->where($where)->find();
    		if(false === $ItemInfo){
    			$this->error("没发现该服务或资讯！");
    		}
    		$this->assign("info",$ItemInfo);
    		$this->assign("ItemSource",$Item_table);
    	}
        $this->display();	
    }
    
    public function test(){
    	//$this->get_category();
    	$Ip = new IpLocation('UTFWry.dat'); // 实例化类 参数表示IP地址库文件
    	$area = $Ip->getlocation('112.124.112.21'); // 获取某个IP地址所在的位置
    	dump($area);
    }
    
}
?>