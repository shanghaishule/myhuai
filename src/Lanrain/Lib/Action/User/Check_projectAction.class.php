<?php
class Check_projectAction extends UserAction{
	public function _initialize() {
		parent::_initialize();
		$this->_mod = D('fuzhen_advance');
	}
	
	public function index(){
		$tokenTall = $this->getTokenTall();
		$map = array();
		$mod = $this->_mod;
		!empty($mod) && $this->_list($mod, $map);
		$this->display();
	}

}
?>