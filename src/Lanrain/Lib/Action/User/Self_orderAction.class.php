<?php
class Self_orderAction extends UserAction{
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
	
}
?>