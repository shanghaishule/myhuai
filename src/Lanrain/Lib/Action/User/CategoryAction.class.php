<?php
class CategoryAction extends UserAction{
	public function _initialize() {
		parent::_initialize();
		//$this->_mod = D('Function');
		$this->_mod = D('category');
		$funtypelist= D('function_master')->order('isshow desc, class, orderno')->select();
		foreach ($funtypelist as $val){
			$funtype_list[$val['id']]=$val['name'];
		}
		$this->assign('funtype_list',$funtype_list);
		//dump($funtype_list);exit;
	}
	
	
	public function index(){
		$tokenTall = $this->getTokenTall();
		$where['parentid'] = 0;
		$secondArr = $this->getChildren($this->_mod->field('id,catname')->where($where)->order('level asc')->select());
		$arr = $this->get_categories_tree();
		dump($arr);die;
		$this->assign("list",$secondArr);
		$this->display();
	}
	function get_categories_tree($cat_id = '')
	{
		if ($cat_id != '')
		{
			$where['id']=$cat_id;
			$res = $this->_P ->where($where)->find();
			$parent_id = $res['parent_id'];
		}
		else
		{
			$parent_id =0;
		}
		/*
		 判断当前分类中全是是否是底级分类，
		如果是取出底级分类上级分类，
		如果不是取当前分类及其下的子分类
		*/
		if ($this->_P->where(array("parent_id"=>$parent_id))->find() || $parent_id == 0)
		{
			/* 获取当前分类及其子分类 */
			$where["parent_id"]=$parent_id;
			$res = $this->_P->where($where)->order("orderList ASC,id ASC")->select();
			//dump($this->_P->getLastSql());dump($res);exit;
			foreach ($res AS $row)
			{
				//  if ($row['is_show'])
				//  {
				$cat_arr[$row['id']]['cid'] = $row['id'];
				$cat_arr[$row['id']]['catname'] = $row['catname'];
				//$cat_arr[$row['id']]['url']  = $this->build_uri('productcategory', array('cid' => $row['id']), $row['name']);
	
				if (isset($row['id']) != null)
				{
					$cat_arr[$row['id']]['id'] = $this->get_child_tree($row['id']);
				}
				//   }
			}
		}
		if(isset($cat_arr))
		{
			return $cat_arr;
		}
	}
	function get_child_tree($tree_id = '')
	{
		$three_arr = array();
		if ($this->_P->where(array("parent_id"=>$tree_id)) || $tree_id == '')
		{
			$where["parent_id"]=$tree_id;
			$res = $this->_P->where($where)->order("orderList,id")->select();
			foreach ($res AS $row)
			{
				// if ($row['is_show']){
				$three_arr[$row['id']]['cid']   = $row['id'];
				$three_arr[$row['id']]['catname'] = $row['catname'];
				//$three_arr[$row['id']]['url']  = $this->build_uri('productcategory', array('cid' => $row['id']), $row['name']);
	
				if (isset($row['id']) != null)
				{
					$three_arr[$row['id']]['id'] = $this->get_child_tree($row['id']);
	
				}
				//  }
			}
		}
		return $three_arr;
	}	
	//获取子类
    public function getChildren($parentArr){
    	
       	foreach ($parentArr as $key => $val){
       		$childrenArr = $this->_mod->where("parentid='%d'",array($val['id']))->order('level asc')->select();
       		$parentArr[$key]['children'] = $childrenArr;
       	}
       	
       	return $parentArr;
    }
    
	public function edit() {
		
		$id = $this->_get('id');
		$tokenTall = $this->getTokenTall();
		
		//提交，有id则为编辑，无id则为新增
		if (IS_POST){
			//dump($_POST);exit;
			$_POST['funname']='MyClassify';
			$_POST['actname']='index';
			//获取数据
			if (false === $data = $this->_mod->create()) {
				$this->error($this->_mod->getError());
			}
			$data['tokenTall'] = $tokenTall;
			
			if ($_POST['id'] != ""){
				//编辑
				$result = $this->_mod->save($data);
			} else {
				//新增
				$result = $this->_mod->add($data);
			}

			if ($result !== false) {
				$this->success('成功！', U('FunctionClassify/index'));
			} else {
				$this->error('失败！');
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
	
	public function del()
	{
	
		$ids = $this->_get('id');
		if ($ids) {
			if (false !== $this->_mod->delete($ids)) {
				$this->success('删除成功！');
			} else {
				$this->error('删除失败！');
			}
		} else {
			$this->error('参数错误！');
		}
	}

}
?>