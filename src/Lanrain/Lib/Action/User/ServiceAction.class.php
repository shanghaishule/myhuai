<?php
class ServiceAction extends UserAction{
	public function _initialize() {
		parent::_initialize();
		$this->_mod = D('Service');
		$this->_cat = M('category');
		//所有商家
		$this->assign("Bus_list",M('business')->select());
		//所有分类
		$allCategory = $this->_cat->field('id,catname')->select();
		$all_category = array();
		foreach ($allCategory as $key => $val){
			$all_category[$val['id']] = $val['catname'];
		}
		$this->assign("all_category",$all_category);
	}
	
	public function index(){
		$tokenTall = $this->getTokenTall();
		$map = array();
		$map['tokenTall'] = $tokenTall;
		$mod = $this->_mod;
		!empty($mod) && $this->_list($mod, $map);
		$this->display();
	}

	public function edit() {
		$id = $this->_get('id');
		$tokenTall = $this->getTokenTall();
		$flag = $this->_get('flag');
		
		//提交，有id则为编辑，无id则为新增
		if (IS_POST) {
			//dump($_POST);die;
			//获取数据
			if (false === $data = $this->_mod->create()) {
				$this->error($this->_mod->getError());
			}
			
			//必须上传图片
			if (empty($_POST['img'])){
				$this->error('请上传商品主图。');
			}
			if (empty($_POST['img1'])) {
				//$this->error('请至少上传1张商品详情页图片（图片1）。');
			}else{
				$imgs[] = $_POST['img1'];
			}
			if (! empty($_POST['img2'])) {
				$imgs[] = $_POST['img2'];
			}
			if (! empty($_POST['img3'])) {
				$imgs[] = $_POST['img3'];
			}
			if (! empty($_POST['img4'])) {
				$imgs[] = $_POST['img4'];
			}
			if (! empty($_POST['img5'])) {
				$imgs[] = $_POST['img5'];
			}
			if (! empty($_POST['img5'])) {
				$imgs[] = $_POST['img5'];
			}
			
			if(isset($_POST['tuijian']))
			{
				$data['tuijian']=1;
			}else {
				$data['tuijian']=0;
			}

			$data['tokenTall'] = $tokenTall;
			$data['info'] = str_replace("src=",'src="/weTall/static/LazyLoad/js/grey.gif" data-original=',$data['info']);
			//dump($data['info']);die;
			
			if ($_POST['id'] != "") {
				if ($flag=="import"){
					//从一键导入保存为正式商品
					$dataid = $data['id'];
					unset($data['id']);
					$data['add_time'] = time();
					$result = $this->_mod->add($data);
					if ($result !== false) {
						//保存详情页图片到相册
						$_img['item_id'] = $result;
						$_img['url'] = $data['img'];
						$_img['add_time'] = time();
						M('item_service_img')->add($_img);
						//从导入表里删除
						M('item_taobao')->where(array('id'=>$dataid))->delete();
						$this->success('成功！',U('Service/index'));
					} else {
						$this->error('失败！');
					}
				}else{
					//编辑					
					$data['cate_id'] = $_POST['cate_id_3']?$_POST['cate_id_3']:$_POST['cate_id_2'];
					$result = $this->_mod->save($data);
					if ($result !== false) {
						//相册更新
						//$_img['url'] = $data['img'];
						//M('item_img')->where(array('item_id'=>$data['id']))->save($_img);
						M('item_service_img')->where(array('item_id'=>$data['id']))->delete();
						$_img['item_id'] = $data['id'];
						$_img['add_time'] = time();
						foreach ($imgs as $oneimg){
							$_img['url'] = $oneimg;
							M('item_service_img')->add($_img);
						}
						$this->success('成功！',U('Service/index'));
					} else {
						$this->error('失败！');
					}
				}
			} else {
				//新增
				$data['add_time'] = time();
				
				$data['cate_id'] = $_POST['cate_id_3']?$_POST['cate_id_3']:$_POST['cate_id_2'];
				
				$result = $this->_mod->add($data);
				if ($result !== false) {
					//保存详情页图片到相册
					$_img['item_id'] = $result;
					$_img['add_time'] = time();
					//$_img['url'] = $data['img'];
					//M('item_img')->add($_img);
					foreach ($imgs as $oneimg){
						$_img['url'] = $oneimg;
						M('item_service_img')->add($_img);
					}
					$this->success('成功！', U('Service/index'));
				} else {
					$this->error('失败！');
				}
			}
		} 
		//非提交，有id为编辑展示，无id为新增展示
		else {
			if ($id) {
				$myaction = "编辑";
				$info = $this->_mod->where(array('id'=>$id))->find();
				
				$info['info'] = str_replace('src="/weTall/static/LazyLoad/js/grey.gif" data-original=',"src=", $info['info']);
				
				$imgDetail = M("item_service_img")->where(array("item_id"=>$id))->order("id ASC")->select();
				$index = 1;
				foreach ($imgDetail as $key => $val){
					$info['img'.$index] = $val['url'];
					$index ++;
				}
				$this->assign('info',$info);
				
				//商品所属分类
				$arrCate = $this->getParentid($info['cate_id']);
				$this->assign("arrCate",$arrCate);

			}else{
				$myaction = "新增";
			}
			
			$this->assign('tokenTall',$tokenTall);
			$this->assign('myaction',$myaction);
			$this->display();
		}
	}
    /**
     * 获取商品分类树杈结构
     * @return json
     */
	public function get_category(){
	  $where["parentid"]= 0;
	  $res = $this->_cat->where($where)->order("level ASC")->select();
	  foreach ($res as $key => $val){
	     $res1 = $this->_cat->where(array('parentid'=>$val['id']))->order("level ASC")->select();
	     $res[$key]['c'] = $res1;
	  	  foreach($res1 as $keys => $va){
	  	  	$res2 = $this->_cat->where(array('parentid'=>$va['id']))->order("level ASC")->select();
	  	  	if(!empty($res2) && $res){
	  	  		$res[$key]['c'][$keys]['d'] = $res2;
	  	  	}
	  	  }
	  }
	  //dump($res);
	  echo json_encode($res);
	}

    //获取商品所属分类的所有父级分类
    public $arr = array();
    public function getParentid($cat_id){
    	$res = $this->_cat->where(array("id"=>$cat_id))->find();
    	$this->arr[] = $res['id'];
    	if($res['parentid'] != 0){
    		$this->getParentid($res['parentid']);
    	}
    	return $this->arr;
    }
    
    //商品推荐处理（推荐/取消推荐）
    public function TuijianDispose(){
    	$id = $this->_get('id','intval');
    	$currentItem = $this->_mod->where("id=%d",array($id))->find();
    	if(false !== $currentItem){
    		if($currentItem['tuijian'] == 1){//如果已推荐取消推荐
    			$currentItem['tuijian'] = 0;
    		}else{
    			$currentItem['tuijian'] = 1;
    		}
    		$status = $this->_mod->where("id=%d",array($id))->save($currentItem);
    		if($status)$this->success("操作成功");
    	}else{
    		$this->error("该商品不存在");
    	}
    }
    
	//删除
	public function del()
	{
		$id = $this->_get('id');
		$item = $this->_mod->where(array('id'=>$id))->find();
		if ($item) {
			M('item_img')->where(array('item_id'=>$item['id']))->delete();
			$this->_mod->where(array('id'=>$item['id']))->delete();
				
			$this->success('删除成功！');
		} else {
			$this->error('找不到这个商品！');
		}
	}

	//条件查找
	public function search(){
		$keywords = $this->_post("keywords");
		$searchType = $this->_post('kType');
		$where = array();
		switch ($searchType){
			case "isBusiness":
				$condition['b_name'] =array("like","%".$keywords."%");
				$business = M('business')->where($condition)->select();
				$bids =array();
				foreach ($business as $key => $val){
					$bids[]=$val['id'];
				}
				if(count($bids) > 1){
					$where['business_id'] = array("in",implode(",",$bids));
				}else if(count($bids) == 1){
					$where['business_id'] = implode(",",$bids);
				}else{
					$where['business_id'] = 0;
				}
				break;
			case "cate_id":
				$condition['catname'] =array("like","%".$keywords."%");
				$business = $this->_cat->where($condition)->select();
				$bids =array();
				foreach ($business as $key => $val){
					$bids[]=$val['id'];
				}
				if(count($bids) > 1){
					$where['cate_id'] = array("in",implode(",",$bids));
				}else if(count($bids) == 1){
					$where['cate_id'] = implode(",",$bids);
				}else{
					$where['cate_id'] = 0;
				}				
				break;	
			case "tuijian":
				$where['tuijian'] = 1;
				break;
			case "status":
				$where['status'] =0;
				break;
			case "name":
				$where['name'] = array("like","%".$keywords."%");
				break;				
			case "":
				$where = "1=1";
		}
		$mod = $this->_mod;
		$where['tokenTall'] = $this->getTokenTall();
		!empty($mod) && $this->_list($mod, $where);
		$this->display("index");
	}

	//所选推荐
	public function tuijianAll(){
		$ids =  $_REQUEST["sel"];
		if($ids){
			if(is_array($ids)){
				$where = 'id in('.implode(',',$ids).')';
			}else{
				$where = 'id='.$ids;
			}
			$flag = $this->_mod->where($where)->save(array("tuijian"=>1));
			if(false !== $flag){
				$this->success("成功!");
			}else{
				$this->error("失败");
			}
		}else{
			$this->error("请先选中要推荐的服务！");
		}
	}
    //所选更改状态
    public function statusAll(){
    	$ids =  $_REQUEST["sel"];
    	if($ids){
    		if(is_array($ids)){
    			$where = 'id in('.implode(',',$ids).')';
    		}else{
    			$where = 'id='.$ids;
    		}
    		$flag = $this->_mod->where($where)->save(array("status"=>0));
    		if(false !== $flag){
    			$this->success("成功!");
    		}else{
    			$this->error("失败");
    		}
    	}else{
    		$this->error("请先选中要停止的服务！");
    	}    	
    }
	//批量删除
	public function delAll(){
		$ids =  $_REQUEST["sel"];
		if($ids){
			if(is_array($ids)){
				$where = 'id in('.implode(',',$ids).')';
			}else{
				$where = 'id='.$ids;
			}
			$flag = $this->_mod->where($where)->delete();
			if(false !== $flag){
				$this->success("删除成功".$flag."条!");
			}else{
				$this->error("删除失败");
			}
		}else{
			$this->error("请先选中要删除的服务！");
		}		
	}

}
?>