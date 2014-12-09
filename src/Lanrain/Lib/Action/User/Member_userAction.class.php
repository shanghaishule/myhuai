<?php
class Member_userAction extends UserAction{
	public function _initialize(){
	   parent::_initialize();	
	   $this->_mod=M('user');
	   $this->_itemO=M('item_order');
	}
	
	public function index(){
		$tokenTall = $this->getTokenTall();
		$lists = $this->_mod->field("id,username,phone,registerTime")->where("status = 1")->select();
		$this->assign("list",$this->getMemberInfo($lists));
		$this->assign("tokenTall",$tokenTall);
		$this->display();
	}
	
	//获取会员的最新订单信息
	public function getMemberInfo($arr = array()){
		foreach($arr as $key => $val){
			$arr[$key]['registerTime'] = date("Y-m-d H:i:s",$val['registerTime']);
			$res = $this->_itemO ->field('id,add_time,address')->where(array("userId"=>$val['id'],"status"=>4))->order('add_time DESC')->find();
			//总消费金额
			$CountPrice = $this->_itemO -> where(array("userId"=>$val['id'],"status"=>4))->sum('order_sumPrice');
				$arr[$key]['address'] = $res['address']?$res['address']:"无";
			$arr[$key]['add_time'] = $res['add_time']?date("Y-m-d H:i:s",$res['add_time']):"--";
			$arr[$key]['sumPrice'] = $CountPrice?$CountPrice:0;
		}
		return $arr;
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
					$data['password']=$this->_post('password','trim,md5');
					$result = $this->_mod->save($data);
					if ($result !== false) {
						
						$this->success('成功！', U('Member_user/index'));
					} else {
						$this->error('失败！');
					}
			} else {
				//新增
				$data['registerTime'] = time();
				$data['username'] = 'HA'.rand(1,1000).time();
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
			}else{
				$myaction = "新增";
			}
			
			$this->assign('tokenTall',$tokenTall);
			$this->assign('myaction',$myaction);
			$this->display();
		}
	}
/*	
	//消费记录
	public function buyHistory(){
		$id = $this->_get('id','intval');
		if(false !== $this->_itemO->where(array('userId'=>$id,'status'=>4))->find()){
			$res =  $this->_itemO->where(array('userId'=>$id,'status'=>4))->order('add_time DESC')->select();
			$this->assign("list",$res);
		}else{
			$this->error("没有该用户的消费记录！");
		}
		$this->display();
	}
	*/
	
	//导出会员信息
	public function exportMember(){
		$phpExcel = new Export();
		$lists = $this->_mod->field("id,username,phone,registerTime")->where("status = 1")->select();
		$phpExcel->exportexcel($this->getMemberInfo($lists),array('编号','会员名','电话','注册时间','收货地址','最近消费时间','累计消费金额'),'会员信息');
	}
	
	//对用户总消费金额作升、降排序
	public function sumPrice(){
		$type = $this->_get('type');
		$lists = $this->_mod->field("id,username,phone,registerTime")->where("status = 1")->select();
		if($type == 'asc'){//升序
			$list = $this->multi_array_sort($this->getMemberInfo($lists),"sumPrice",SORT_ASC);
		}else if($type == 'desc'){//降序
			$list = $this->multi_array_sort($this->getMemberInfo($lists),"sumPrice",SORT_DESC);
		}else{
			$this->error("参数错误！");
		}
		$this->assign("list",$list);
		$this->display("index");
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
    //搜索
    public function search(){
    	$keyword = $this->_post('keywords','trim');
    	if($keyword == ''){
    		$map="1 = 1";
    	}else{
	    	$where['username']  = array('like','%'.$keyword.'%');
	    	$where['phone']  = array('like','%'.$keyword.'%');
	    	$where['_logic'] = 'or';
	    	$map['_complex'] = $where;
	    	$map['statis'] = 1;
    	}
    	$lists = $this->_mod->field("id,username,phone,registerTime")->where($map)->select();
    	$res = $this->getMemberInfo($lists);
    	$this->assign("keyword",$keyword);
		$this->assign("list",$res);
		$this->display("index");
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
			$this->error("请先选中要删除的会员！");
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