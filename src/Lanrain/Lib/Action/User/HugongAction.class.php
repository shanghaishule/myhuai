<?php
class HugongAction extends UserAction{
	public function _initialize() {
		parent::_initialize();
		$this->_mod = D('hugong');
	}
	
	public function index(){
		$tokenTall = $this->getTokenTall();
		$map = array();
		$map['uid'] = session("uid");
		$mod = $this->_mod;
		!empty($mod) && $this->_list($mod, $map);
		$this->assign("tokenTall",$tokenTall);
		$this->display();
	}

	public function edit() {
		$id = $this->_get('id');
		$tokenTall = $this->getTokenTall();
		$flag = $this->_get('flag');
		
		//提交，有id则为编辑，无id则为新增
		if (IS_POST) {
			//dump($_POST);die();
			
			//获取数据
			if (false === $data = $this->_mod->create()) {
				$this->error($this->_mod->getError());
			}
			
			//必须上传图片
			if (empty($_POST['img'])){
				$this->error('请上传商品主图。');
			}
			if (! empty($_POST['img1'])) {
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
            
			$data['tokenTall'] = $tokenTall;
			$data['info'] = str_replace("src=",'src="/weTall/static/LazyLoad/js/grey.gif" data-original=',$data['info']);
			//dump($data);exit;	
			
			if ($_POST['id'] != "") {
				    $data['updateTime'] = time();
					$result = $this->_mod->save($data);
					if ($result !== false) {
						//相册更新
						M('hugong_img')->where(array('item_id'=>$data['id']))->delete();
						$_img['item_id'] = $data['id'];
						$_img['add_time'] = time();
						foreach ($imgs as $oneimg){
							$_img['url'] = $oneimg;
							M('hugong_img')->add($_img);
						}
						$this->success('成功！', U('Hugong/index'));
					} else {
						$this->error('失败！');
					}
			} else {
				//新增
				$data['uid'] = session("uid");
				$data['addTime'] = time();
				$data['updateTime'] = time();
				$result = $this->_mod->add($data);
				if ($result !== false) {
					//保存详情页图片到相册
					$_img['item_id'] = $result;
					$_img['add_time'] = time();
					//$_img['url'] = $data['img'];
					//M('item_img')->add($_img);
					foreach ($imgs as $oneimg){
						$_img['url'] = $oneimg;
						M('hugong_img')->add($_img);
					}
					$this->success('成功！', U('Hugong/index'));
				} else {
					$this->error('失败！');
				}
			}
		} 
		//非提交，有id为编辑展示，无id为新增展示
		else {
			if ($id) {
				$myaction = "编辑";
				$info = $this->_mod->where(array('id'=>$id,'uid'=>session('uid')))->find();
				$info['info'] = str_replace('src="/weTall/static/LazyLoad/js/grey.gif" data-original=',"src=", $info['info']);
				$imgDetail = M("hugong_img")->where(array("item_id"=>$id))->order("id ASC")->select();
				$index = 1;
				foreach ($imgDetail as $key => $val){
					$info['img'.$index] = $val['url'];
					$index ++;
				}
				$this->assign('info',$info);

			}else{
				$myaction = "新增";
			}
			
			$this->assign('tokenTall',$tokenTall);
			$this->assign('myaction',$myaction);
			$this->display();
		}
	}
    
	//删除
	public function del()
	{
		$id = $this->_get('id');
		$item = $this->_mod->where(array('id'=>$id,'uid'=>session('uid')))->find();
		if ($item) {
			$this->_mod->where(array('id'=>$item['id']))->delete();
			$this->success('删除成功！');
		} else {
			$this->error('找不到这条信息！');
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
			$this->error("请先选中要删除的信息！");
		}		
	}

	//更新单条信息
	public function updateT(){
		$id = $this->_get('id');
		$item = $this->_mod->where(array('id'=>$id,'uid'=>session('uid')))->find();
		if ($item) {
			$data['updateTime'] =  time();
			$this->_mod->where(array('id'=>$item['id']))->save($data);
			$this->success('更新成功！');
		} else {
			$this->error('找不到这条信息！');
		}		   
	}
	
	//批量更新
	public function updateAll(){
		$ids =  $_REQUEST["sel"];
		if($ids){
			if(is_array($ids)){
				$where = 'id in('.implode(',',$ids).')';
			}else{
				$where = 'id='.$ids;
			}
			$data['updateTime'] =  time();
			$flag = $this->_mod->where($where)->save($data);	
			if(false !== $flag){
				$this->success("删除成功".$flag."条!");
			}else{
				$this->error("删除失败");
			}
		}else{
			$this->error("请先选中要删除的信息！");
		}		
	}
}
?>