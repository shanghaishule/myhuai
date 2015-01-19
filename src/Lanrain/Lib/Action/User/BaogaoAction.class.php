<?php
class BaogaoAction extends UserAction{
	public function _initialize() {
		parent::_initialize();
		$this->_mod = D('qubaogao');
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