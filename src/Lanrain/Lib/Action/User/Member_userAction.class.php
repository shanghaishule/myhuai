<?php
class Member_userAction extends UserAction{
	public function _initialize(){
	   parent::_initialize();	
	   $this->_mod=M('user');
	   $this->_itemO=M('item_order');
	}
	
	public function index(){
	
		$lists = $this->_mod->where("status = 1")->select();
		foreach($lists as $key => $val){
			$res = $this->_itemO ->field('id,add_time,address')->where(array("userId"=>$val['id']))->order('add_time DESC')->find();
			//总消费金额
			$CountPrice = $this->_itemO -> where(array("userId"=>$val['id']))->sum('order_sumPrice');
			$lists[$key]['sumPrice'] = $CountPrice;
			$lists[$key]['add_time'] = $res['add_time'];
			$lists[$key]['address'] = $res['address'];
			
		}
		//dump($lists);die;
		$this->assign("list",$lists);
		$this->display();
	}
	
	//添加
	public function edit(){
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
			if (empty($_POST['phone'])){
				$this->error('请填写手机号');
			}
			
			if(empty($_POST['password']))
			{
				$this->error('请填写密码');
			}
			if(isset($_POST['status']))
			{
				$data['status']=1;
			}else {
				$data['status']=0;
			}
			//dump($data);exit;	
			
			if ($_POST['id'] != "") {

					$result = $this->_mod->save($data);
					if ($result !== false) {
						//相册更新
						//$_img['url'] = $data['img'];
						//M('item_img')->where(array('item_id'=>$data['id']))->save($_img);
						//M('item_img')->where(array('item_id'=>$data['id']))->delete();
						$this->success('成功！', U('Member_user/index'));
					} else {
						$this->error('失败！');
					}
			} else {
				//新增
				$data['registerTime'] = time();
				$data['last_login_time'] = time();
				$data['role'] = 5;
				$data['password']=$this->_post('password','trim,md5');
				$result = $this->_mod->add($data);
				if ($result !== false) {

					$this->success('成功！', U('Member_user/index'));
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
	
	//重置密码
	public function resetPassword(){
		$id = $this->_get('id','intval');
	   if(session('userid') && $id){
	   	  $data['password'] = md5('ha123456');
	   	  if(false === $this->_mod->where(array('id'=>$id))->save()){
	   	  	$this->success("重置成功！");
	   	  }else{
	   	  	$this->error("重置失败！");
	   	  }
	   }else{
	   	    $this->error('非法操作!');
	   }	
	}

	//删除
	public function del()
	{
		$id = $this->_get('id');
		$item = $this->_mod->where(array('id'=>$id))->find();
		if ($item) {
			$this->_itemO->where(array('userId'=>$item['id']))->delete();
			M('user_address')->where(array('uid'=>$item['id']))->delete();
			$this->_mod->where(array('id'=>$item['id']))->delete();
	
			$this->success('删除成功！');
		} else {
			$this->error('没有该会员！');
		}
	}	
	/*多维数组排序
	 $multi_array:多维数组名称
	$sort_key:二维数组的键名
	$sort:排序常量	SORT_ASC || SORT_DESC
	*/
	function multi_array_sort(&$multi_array,$sort_key,$sort=SORT_DESC){
		if(is_array($multi_array)){
			foreach ($multi_array as $row_array){
				if(is_array($row_array)){
					//把要排序的字段放入一个数组中，
					$key_array[] = $row_array[$sort_key];
				}else{
					return false;
				}
			}
		}else{
			return false;
		}
		//对多个数组或多维数组进行排序
		array_multisort($key_array,$sort,$multi_array);
		return $multi_array;
	}	
}