<?php
class Business_dataAction extends UserAction{
	public function _initialize() {
		parent::_initialize();
		$this->_mod = D('business');
	
	}
   	
	public function index(){
	    $this->display();	
	}
	
	//编辑
	public function edit(){
		$this->display();
	}
}
?>