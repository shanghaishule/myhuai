<?php
class PeizhenAction extends UserAction{
	public function _initialize() {
		parent::_initialize();
		$this->_mod = D('huizhen_advance');
	}
	
	public function index(){
		$tokenTall = $this->getTokenTall();
		$map = array();
		$mod = $this->_mod;
		$map['pageType'] = 'peizhen';
		!empty($mod) && $this->_list($mod, $map);
		$this->display();
	}

}
?>