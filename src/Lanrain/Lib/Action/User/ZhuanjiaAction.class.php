<?php
class ZhuanjiaAction extends UserAction{
	public function _initialize() {
		parent::_initialize();
		$this->_mod = D('zhuanjia');
	}
	
	public function index(){
		$tokenTall = $this->getTokenTall();
		$map = array();
		//$map['tokenTall'] = $tokenTall;
		$mod = $this->_mod;
		//如果需要分页
			$count = $mod->where($map)->count();
			$pager = new Page($count, 20);

		$select = $mod->where($map)->order();
		$this->list_relation && $select->relation(true);
		$select->limit($pager->firstRow.','.$pager->listRows);
		$page = $pager->show();
		$this->assign("page", $page);
		$list = $select->select();
		foreach ($list as $key => $val){
			   $hos = M('order_address')->field("id,name")->where(array('id'=>$val['address_id']))->find();
			   $keshi = M('keshi')->field("id,name")->where(array('id'=>$val['keshi_id']))->find();
			   $zhicheng = M('zhicheng')->field('id,name')->where(array('id'=>$val['zhicheng_id']))->find();
			   $list[$key]['hospital'] = $hos['name'];
			   $list[$key]['keshi'] = $keshi['name'];
			   $list[$key]['title'] = $zhicheng['name'];
		}
		//dump($list);die;
		$this->assign('list', $list);
		$this->assign('list_table', true);
		
		$this->display();
	}

	public function edit() {
		$id = $this->_get('id');
		//提交，有id则为编辑，无id则为新增
		if (IS_POST) {
			//dump($_POST);die();
			
			//获取数据
			if (false === $data = $this->_mod->create()) {
				$this->error($this->_mod->getError());
			}

			if ($_POST['id'] != "") {
					//编辑					
					$result = $this->_mod->save($data);
					if ($result !== false) {
						$this->success('成功！', U('Zhuanjia/index'));
					} else {
						$this->error('失败！');
					}
			} else {
				//新增
				$data['addTime'] = time();

				$result = $this->_mod->add($data);
				if ($result !== false) {
					//保存详情页图片到相册
					$this->success('成功！', U('Zhuanjia/index'));
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
				$this->assign('Hos_list',M('order_address')->select());
				$this->assign('Keshi_list',M('keshi')->select());
				$this->assign('Zhicheng_list',M('zhicheng')->select());
				$this->assign('info',$info);
			}else{
				$myaction = "新增";
			}
			$this->assign('myaction',$myaction);
			$this->display();
		}
	}

	//删除
	public function del()
	{
		$id = $this->_get('id');
		$item = $this->_mod->where(array('id'=>$id))->find();
		if ($item) {
			M('comments')->where(array('item_id'=>$item['id']))->delete();
			M('item_like')->where(array('item_id'=>$item['id']))->delete();
			$this->_mod->where(array('id'=>$item['id']))->delete();
				
			$this->success('删除成功！');
		} else {
			$this->error('找不到！');
		}
	}


	//批量删除
	public function delAll(){
		$ids =  $_REQUEST["sel"];
		if($ids){
			if(is_array($ids)){
				$where = 'id in('.implode(',',$ids).')';
				$cond =  'item_id in('.implode(',',$ids).')';
			}else{
				$where = 'id='.$ids;
				$cond = 'item_id='.$ids;
			}
			$flag = $this->_mod->where($where)->delete();
			M('comments')->where($cond)->delete();
			M('item_like')->where($cond)->delete();
			if(false !== $flag){
				$this->success("删除成功".$flag."条!");
			}else{
				$this->error("删除失败");
			}
		}else{
			$this->error("请先选中要删除的专家！");
		}		
	}

}
?>