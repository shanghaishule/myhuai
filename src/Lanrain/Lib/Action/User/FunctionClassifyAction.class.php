<?php
class FunctionClassifyAction extends UserAction{
	public function _initialize() {
		parent::_initialize();
		//$this->_mod = D('Function');
		$this->_mod = D('category');
		$funtypelist= $this->_mod->where(array("parentid"=>0))->order('level')->select();
		foreach ($funtypelist as $key => $val){
			$funtype_list[$key]['id']=$val['id'];
			$funtype_list[$key]['cname']=$val['catname'];
		}
		$this->assign('funtype_list',$funtype_list);
		//dump($funtype_list);exit;
	}
	
	
	public function index(){
		$tokenTall = $this->getTokenTall();
		/*$map = array();
		$map['funname'] = 'MyClassify';
		$mod = $this->_mod;
		!empty($mod) && $this->_list($mod, $map, 'gid', 'asc');*/
		$where['parentid'] = 0;
		$secondArr = $this->getChildren($this->_mod->field('id,catname')->where($where)->order('level asc')->select());
		//dump($secondArr);die;
		$this->assign("list",$secondArr);
		$this->display();
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
		if (IS_POST) {
			//dump($_POST);exit;
			//$_POST['funname']='MyClassify';
			//$_POST['actname']='index';
			//获取数据

			if (false === $data = $this->_mod->create()) {
				$this->error($this->_mod->getError());
			}
			
			if(isset($_POST['tuijian']))
			{
				$data['tuijian']=1;
			}else {
				$data['tuijian']=0;
			}
			
			$data['token'] = $tokenTall;
			$arr = array(0,$_POST['parentid']);
			$data['arrparentid'] = implode(',',$arr);
			if ($_POST['id'] != "") {
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
	
	public function del()
	{
	
		$ids = $this->_get('id');
		if ($ids) {
			$res = $this->_mod->where(array('parentid'=>$ids))->find();
			if($res !== false && empty($res)){
				if (false !== $this->_mod->delete($ids)) {
					$this->success('删除成功！');
				} else {
					$this->error('删除失败！');
				}
			}else{
				$this->error('请先删除该分类下的子类！');
			}

		} else {
			$this->error('参数错误！');
		}
	}

}
?>