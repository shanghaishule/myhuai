<?php
class PetctAction extends UserAction{
	public function _initialize() {
		parent::_initialize();
		$this->_mod = D('petct_advance');
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