<?php
class FamilydocAction extends UserAction{
	public function _initialize() {
		parent::_initialize();
		$this->_mod = D('familydoc');
	}
	
	public function index(){
		$tokenTall = $this->getTokenTall();
		$map = array();
		$mod = $this->_mod;
		//如果需要分页
		$count = $mod->where($map)->count();
		$pager = new Page($count, 20);
		$select = $mod->where($map)->order();
		$this->list_relation && $select->relation(true);
		$select->limit($pager->firstRow.','.$pager->listRows);
		$page = $pager->show();
		$this->assign("page", $page);
		$list = $select->select();
		foreach($list as $key => $val){
			$zhicheng = M('zhicheng')->field('id,name')->where(array('id'=>$val['zcid']))->find();
			$list[$key]['zc'] = $zhicheng['name'];
		}
		$this->assign('list', $list);
		$this->display();
	}

	public function edit() {
		$id = $this->_get('id');
		//提交，有id则为编辑，无id则为新增
		if (IS_POST) {
			//dump($_POST);die();
			//获取数据
			if (false === $data = $this->_mod->create()) {
				$this->error($this->_mod->getError());
			}
			//必须上传图片
			if (empty($_POST['headimgurl'])){
				$this->error('请上传专家头像。');
			}
			
			if ($_POST['id'] != "") {
					//编辑					
					$result = $this->_mod->save($data);
					if ($result !== false) {
						$this->success('成功！', U('Familydoc/index'));
					} else {
						$this->error('失败！');
					}
			} else {
				//新增
				$data['createtime'] = time();

				$result = $this->_mod->add($data);
				if ($result !== false) {
					//保存详情页图片到相册
					$this->success('成功！', U('Familydoc/index'));
				} else {
					$this->error('失败！');
				}
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
			
			$this->assign('Zhicheng_list',M('zhicheng')->select());
			$this->assign('myaction',$myaction);
			$this->display();
		}
	}
    
	/**
	 * 家庭医生问答列表
	 */
	public function answerlist(){
		$did = $this->_get('id','trim,intval');
		if($did == ''){
			 $this->error("没有该医生");
		}
		//$askList = M('familydocchat')->where(array("docid"=>$did))->group('uid')->order('addtime ASC')->select();
		$map = array();
		$mod = M('familydocchat');
		$map['docid'] = $did;
		//如果需要分页
		$count = $mod->where($map)->group('uid')->count();
		$pager = new Page($count, 20);
		$select = $mod->where($map)->group('uid')->order('addtime ASC');
		$this->list_relation && $select->relation(true);
		$select->limit($pager->firstRow.','.$pager->listRows);
		$page = $pager->show();
		$this->assign("page", $page);
		$list = $select->select();
		foreach($list as $key => $val){
			$userInfo = M('user')->field('id,nickname,headimgurl')->where(array('id'=>$val['uid']))->find();
			$list[$key]['nickname'] = $userInfo['nickname'];
			$list[$key]['headimgurl'] =$userInfo['headimgurl'];
		}
		
		foreach($list as $key => $val){
			$chatInfo = $mod->where(array('docid'=>$did,'uid'=>$val['uid']))->order('addtime ASC')->select();
			$list[$key]['chatInfo'] = $chatInfo;
		}		
		//dump($list);die;	
		$this->assign('list', $list);
		$this->display();
	}
	
	/**
	 * send doc apply
	 */
	public function sendDocApply(){
		
	}
	
	
	//删除
	public function del()
	{
		$id = $this->_get('id');
		$item = $this->_mod->where(array('id'=>$id))->find();
		if ($item) {
			$this->_mod->where(array('id'=>$item['id']))->delete();
			$this->success('删除成功！');
		} else {
			$this->error('删除失败');
		}
	}

	//批量删除
	public function delAll(){
		$ids =  $_REQUEST["sel"];
		if($ids){
			if(is_array($ids)){
				$where = 'id in('.implode(',',$ids).')';
			}else{
				$where = 'id='.$ids;
			}
			$flag = $this->_mod->where($where)->delete();
			if(false !== $flag){
				$this->success("删除成功".$flag."条!");
			}else{
				$this->error("删除失败");
			}
		}else{
			$this->error("请先选中要删除的项！");
		}		
	}

}
?>