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
	
	/**
	 * 获取商品分类及分类下服务和资讯树杈结构
	 * @return json
	 */
	public function get_category(){
		$where["parentid"]= 0;
		$res = $this->_mod->where($where)->order("level ASC")->select();
		foreach ($res as $key => $val){
			$res1 = $this->_mod->where(array('parentid'=>$val['id']))->order("level ASC")->select();
			$res[$key]['c'] = $res1;
			foreach($res1 as $keys => $va){
				$res2 = $this->_mod->where(array('parentid'=>$va['id']))->order("level ASC")->select();
				if(!empty($res2) && $res){
					$res[$key]['c'][$keys]['d'] = $res2;
					foreach($res2 as $keyT => $vaT){
						$resService = M('service')->where(array("cate_id"=>$vaT['id']))->select();
						$resArticle = M('article_new')->where(array("cate_id"=>$vaT['id']))->select();
						$res[$key]['c'][$keys]['d'][$keyT]['e'][]= $resService;
						$res[$key]['c'][$keys]['d'][$keyT]['e'][]= $resArticle;
					}
				}else{
			
				}
			}
		}
		dump($res);
		//echo json_encode($res);
	}
	
	public function test(){
		$this->get_category();
	}
}
?>