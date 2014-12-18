<?php
class AddressAction extends UserAction{
	public function _initialize() {
		parent::_initialize();
		$this->_mod = D('order_address');
	}
	
	public function index(){
		$tokenTall = $this->getTokenTall();
		$map = array();
		$map['tokenTall'] = $tokenTall;
		$mod = $this->_mod;
		!empty($mod) && $this->_list($mod, $map,'','ASC');
		$this->display();
	}

	public function edit() {
		$id = $this->_get('id');
		$tokenTall = $this->getTokenTall();
		//提交，有id则为编辑，无id则为新增
		if (IS_POST) {
			//dump($_POST);die();
			
			//获取数据
			if (false === $data = $this->_mod->create()) {
				$this->error($this->_mod->getError());
			}

			$data['tokenTall'] = $tokenTall;

			if ($_POST['id'] != "") {

					$result = $this->_mod->save($data);
					if ($result !== false) {
						$this->success('成功！', U('Address/index'));
					} else {
						$this->error('失败！');
					}

			} else {
				$result = $this->_mod->add($data);
				if ($result !== false) {
					$this->success('成功！', U('Address/index'));
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
			$this->_mod->where(array('id'=>$item['id']))->delete();
				
			$this->success('删除成功！');
		} else {
			$this->error('找不到这个地址名称！');
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
			$this->error("请先选中要删除的地址！");
		}		
	}

}
?>