<?php
class Self_orderAction extends UserAction{
	public $arr = array();
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
		$res = $this->_mod->where($where)->order("level ASC")->select();//一级分类
		foreach ($res as $key => $val){
			$res1 = $this->_mod->where(array('parentid'=>$val['id']))->order("level ASC")->select();//二级分类
			$res[$key]['c'] = $res1;
			foreach($res1 as $keys => $va){
				$res2 = $this->_mod->where(array('parentid'=>$va['id']))->order("level ASC")->select();
				if(!empty($res2) && $res){
					$res[$key]['c'][$keys]['d'] = $res2;
					foreach($res2 as $keyT => $vaT){
						$res[$key]['c'][$keys]['d'][$keyT]['e'] = $this->getSerArt($vaT['id']);
					}
			    }else{
			    	$res[$key]['c'][$keys]['d'] = $this->getSerArt($va['id']);
			    }
	        }
		}
		//dump($res);
		echo json_encode($res);
	}
	
	//获取底级分类的服务和资讯
	public function getSerArt($cate_id = ''){
		$arr = array();
		$resService = M('service')->where(array("cate_id"=>$cate_id))->select();
		if($resService == null || empty($resService)){
			$resService = $arr;
		}
		$resArticle = M('article_new')->where(array("cate_id"=>$cate_id))->select();
		if($resArticle == null || empty($resArticle)){
			$resArticle = $arr;
		}
		return array_merge($resService,$resArticle);
	}
	
    //快速搜索
    public function search(){
    	$arr = array();
    	$keywords = $this->_post('keywords','trim');
    	$where['name'] = array('like','%'.$keywords.'%');
    	$resService = M('service')->where($where)->select();
    	if($resService == null || empty($resService)){
    		$resService = $arr;
    	}else{
    		foreach ($resService as $key => $val){
    			$resService[$key]['listItem'] = implode(' >> ',$this->getParentid($val['cate_id']))." >> ".preg_replace("/($keywords)/i","<b style=\"color:red\">\\1</b>",$val['name']);
    		    $this->arr = array();//清空前条保存的数据
    		}
    	} 
    	$resArticle = M('article_new')->where($where)->select();
    	if($resArticle == null || empty($resArticle)){
    		$resArticle = $arr;
    	}else{
    		foreach ($resArticle as $key => $va){
    			$resArticle[$key]['listItem'] =implode(' >> ',$this->getParentid($va['cate_id']))." >> ".preg_replace("/($keywords)/i","<b style=\"color:red\">\\1</b>",$va['name']);
    			$this->arr = array();
    		}
    	}
    	$res = array_merge($resService,$resArticle);
    	$this->assign('allSerArt',$res);
    	$this->assign("keywords",$keywords);
    	$this->assign("countItem",count($res));
    	$this->display("index");
    }
    
    //获取商品所属分类的所有父级分类 
    public function getParentid($cat_id){
    	$res = $this->_mod->where(array("id"=>$cat_id))->find();
    	$this->arr[] = $res['catname'];
    	if($res['parentid'] != 0){
    		$this->getParentid($res['parentid']);
    	}
    	krsort($this->arr);
    	return $this->arr;
    }
    
    public function test(){
    	dump($this->getParentid(17));
    }
}
?>