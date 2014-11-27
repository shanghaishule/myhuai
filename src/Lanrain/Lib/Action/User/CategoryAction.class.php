<?php
class CategoryAction extends UserAction{
	public function _initialize() {
		parent::_initialize();
		//$this->_mod = D('Function');
		$this->_mod = D('category');
		/*$funtypelist= $this->_mod->where(array('parentid'=>0))->order('level')->select();
		foreach ($funtypelist as $key => $val){
			$funtype_list[$key]['id']=$val['id'];
			$funtype_list[$key]['cname']=$val['catname'];
		}*/
		$this->assign('list',$this->get_categories_tree());
		//dump($funtype_list);exit;
	}
	
	
	public function index(){
		$tokenTall = $this->getTokenTall();
		$this->display();
	}
	public function get_categories_tree($cat_id = '')
	{
		if ($cat_id != '')
		{
			$where['id']=$cat_id;
			$res = $this->_mod ->where($where)->find();
			$parent_id = $res['parentid'];
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
		if ($this->_mod->where(array("parentid"=>$parent_id))->find() || $parent_id == 0)
		{
			/* 获取当前分类及其子分类 */
			$where["parentid"]=$parent_id;
			$res = $this->_mod->where($where)->order("level ASC")->select();
			//dump($res);exit;
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
		if ($this->_mod->where(array("parentid"=>$tree_id)) || $tree_id == '')
		{
			$where["parentid"]=$tree_id;
			$res = $this->_mod->where($where)->order("level ASC")->select();
			foreach ($res AS $row)
			{
				// if ($row['is_show']){
				$three_arr[$row['id']]['cid']   = $row['id'];
				$three_arr[$row['id']]['catname'] = $row['catname'];
				$three_arr[$row['id']]['linkurl'] = $row['linkurl'];
				$three_arr[$row['id']]['level'] = $row['level'];
				$three_arr[$row['id']]['picurl'] = $row['picurl'];
				$three_arr[$row['id']]['outlinkurl'] = $row['outlinkurl'];
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
			//$_POST['funname']='MyClassify';
			//$_POST['actname']='index';
			
			//获取数据
			if(isset($_POST['tuijian']))
			{
				$data['tuijian']=1;
			}else {
				$data['tuijian']=0;
			}
			if (false === $data = $this->_mod->create()) {
				$this->error($this->_mod->getError());
			}
			$arr = array(0,$_POST['Fparentid'],$_POST['Sparentid']);
			
			$data['arrparentid'] = implode(',',$arr);
			$data['parentid'] = $_POST['Sparentid'];
			
			if ($_POST['id'] != ""){
				//编辑
				$result = $this->_mod->save($data);
			} else {
				//新增
				$result = $this->_mod->add($data);
			}

			if ($result !== false) {
				$this->success('成功！', U('Category/index'));
			} else {
				$this->error('失败！');
			}
			
		} 
		//非提交，有id为编辑展示，无id为新增展示
		else {
			if ($id) {
				$myaction = "编辑";
				$info = $this->_mod->where(array('id'=>$id))->find();
				//该分类的父类的所有子类
				$arr = explode(',',$info['arrparentid']);
				$first_category = $this->_mod->field('id,catname')->where(array('id'=>$arr[1]))->find();
				$second_parent = $this->_mod->field('id,catname')->where(array('parentid'=>$arr[1]))->select();
				//dump($second_parent);die;
				$this->assign('info',$info);
				$this->assign('second_parent',$second_parent);
				$this->assign('first_category',$first_category);
			}else{
				$myaction = "新增";
			}
						
			$this->assign('myaction',$myaction);
			$this->display();
		}
	}	
	public function getSecondCate(){
		$id = $this->_post('id','intval');
		$secondArr = $this->_mod->where(array('parentid'=>$id))->select();
		if($secondArr){
			echo json_encode($secondArr);
		}else{
			echo '0';
		}
	}
	
	//分类推荐处理（推荐/取消推荐）
	public function TuijianDispose(){
		$id = $this->_get('id','intval');
		$currentItem = $this->_mod->where("id=%d",array($id))->find();
		if(false !== $currentItem){
			if($currentItem['tuijian'] == 1){//如果已推荐取消推荐
				$currentItem['tuijian'] = 0;
			}else{
				$currentItem['tuijian'] = 1;
			}
			$status = $this->_mod->where("id=%d",array($id))->save($currentItem);
			if($status)$this->success("操作成功");
		}else{
			$this->error("该分类不存在");
		}
	}	
	
	public function del(){
		$ids = $this->_get('id');
		if ($ids) {
			if (false !== $this->_mod->delete($ids)){
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