<?php
class ZhimingAction extends UserAction{
	public function _initialize() {
		parent::_initialize();
		$this->_mod = M('advance');
	}
	
	public function index(){
		$type =$this->_get('type','trim,intval');
		$map = array();
		$mod = $this->_mod;
		if(empty($type)){
			 $map['type'] = $type;
		}
		!empty($mod) && $this->_list($mod, $map,'','DESC');
		$this->display();
	}

}
?>