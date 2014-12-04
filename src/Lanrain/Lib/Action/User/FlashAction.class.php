<?php
/**
 *首页幻灯片回复
**/
class FlashAction extends UserAction{
	public function index(){
		//检查权限和功能
		$this->checkauth('Flash','Flash');
        $this->assign("list",M("flash_pos")->select()); 
		$this->display();
	}
	public function flashAd(){
		$db=D('Flash');
	    $where['pos']=$this->_get("id","intval");
	    if($where['pos'] == ''){
	      $this->error("参数错误",U(MODULE_NAME.'/index'));
	    }
		$where['uid']=session('uid');
		$where['token']=session('token');
		$count=$db->where($where)->count();
		$page=new Page($count,25);
		$info=$db->where($where)->limit($page->firstRow.','.$page->listRows)->select();
		$this->assign('page',$page->show());
		$this->assign('info',$info);
		$this->assign("posid",$where['pos']);
		$this->display();
	}
	public function add(){
		$this->assign("pos",$this->_get("posid","intval"));
		$this->display();
	}
	//添加广告位
	public function addPos(){
		if(IS_POST){
			if(false === $data = M('flash_pos')->create()){
				$this->error(M('flash_pos')->getError());
			}
		  if($_POST['id'] == ''){//新增
		  		if(false !== M('flash_pos')->add($data)){
		  			$this->success("添加成功",U(MODULE_NAME.'/index'));
		  		}else{
		  			$this->error("添加失败",U(MODULE_NAME.'/index'));
		  		}

		  }else{//编辑
		  	  if(false !== M('flash_pos')->save($data)){
		  	  	$this->success("更新成功",U(MODULE_NAME.'/index'));
		  	  }else{
		  	  	$this->success("更新失败",U(MODULE_NAME.'/index'));
		  	  }
		  }

		}else{
			$id=$this->_get("id","intval");
			$catAll = M('category')->where(array("parentid"=>0))->select();
			$arr = array();
			foreach ($catAll as $key => $val){
				$catRes = M('category')->where(array("parentid"=>$val['id']))->select();
				if($catRes != null){
					$arr = array_merge($arr,$catRes);
				}
			}
			$res = array_merge($catAll,$arr);
			if($id != ''){
				$info = M('flash_pos')->where(array("id"=>$id))->find();
			}
		}
		$this->assign("info",$info);
		$this->assign("cateG",$res);
		$this->display();
	}
	public function edit(){
		$where['id']=$this->_get('id','intval');
		$where['uid']=session('uid');
		$where['pos'] = $this->_get("posid","intval");
		$res=D('Flash')->where($where)->find();
		$this->assign('info',$res);
		$this->assign("posid",$where['pos']);
		$this->display();
	}
	public function del(){
		$where['id']=$this->_get('id','intval');
		$where['uid']=session('uid');
		if(D(MODULE_NAME)->where($where)->delete()){
			$this->success('操作成功',U(MODULE_NAME.'/index'));
		}else{
			$this->error('操作失败',U(MODULE_NAME.'/index'));
		}
	}
	public function delPos(){
		$where['id']=$this->_get('id','intval');
		if(M('flash_pos')->where($where)->delete()){
			M('Flash')->where(array("pos"=>$where['id']))->find();
			$this->success('操作成功',U(MODULE_NAME.'/index'));
		}else{
			$this->error('操作失败',U(MODULE_NAME.'/index'));
		}
	}	
	public function insert(){
		$this->all_insert();
	}
	public function upsave(){
		$this->all_save();
	}
	
}
?>