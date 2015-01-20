<?php

class itemAction extends frontendAction {
	public static $wordArr = array();
	public static $content = "";
    public function _initialize() {
        parent::_initialize();
        import('Think.ORG.SensitiveThesaurus');
        $keywords = new SensitiveThesaurus();
        self::$wordArr = $keywords->getKeywords();
    }
    public function filter($content){
    	if($content=="") return false;
    	self::$content = $content;
    	empty(self::$wordArr)?self::getWord():"";
    	foreach ( self::$wordArr as $row){
    		if (false !== strstr(self::$content,$row)) return false;
    	}
    	return true;
    }
    /**
     * 商品详细页
     */
    public function index() {
        $id = $this->_get('itemid', 'intval');
        !$id && $this->_404();
        $tokenTall = $this->getTokenTall();
        $item_mod = M('item');
        $item = $item_mod->field('id,cate_id,title,intro,price,zb_price,info,comments,add_time,goods_stock,buy_num,brand,size,color')->where(array('id' => $id, 'status' => 1))->find();
        !$item && $this->_404();

        //大小
        $size = substr(trim($item['size']),0,1) == '|' ? explode('|', substr(trim($item['size']),1)) : explode('|', $item['size']);
        
        //颜色
        $color = substr(trim($item['color']),0,1) == '|' ? explode('|', substr(trim($item['color']),1)) : explode('|', $item['color']);
        
        //品牌 
        $brand = M('brandlist')->field('name')->find($item['brand']);
        $item['brand'] = $brand['name'];
        
        //商品相册
        $img_list = M('item_img')->field('url')->where(array('item_id' => $id))->order('id ASC')->select();
              
        $comments_list = M('comments')->where(array('item_id' => $id))->order('create_time desc')->select();
        
        $this->assign('comments_list', $comments_list);        

        $img_list = M('item_img')->field('url')->where(array('item_id' => $id))->order('ordid')->select();
        
        //size的数量
        $countSize=0;//var_dump($size);die();
        foreach($size as $val){
        	if($val != ""){
        		$countSize=$countSize+1;
        	}
        }
        
        //color的数量
        $countColor=0;
        foreach($color as $val){
        	if($val != ""){
        		$countColor=$countColor+1;
        	}
        }
        
        //相关产品
        $condi['cate_id'] = $item['cate_id'];
        $condi['id'] = array('neq',$id);
        $recommendRes = $item_mod->field("id,img,title,price,zb_price")->where($condi)->limit(6)->select();
        $this->assign("recommendRes",$recommendRes);
        $this->assign('countSize', $countSize);
        $this->assign('countColor', $countColor);
        $this->assign('item', $item);
        $this->assign('img_list', $img_list);
        $this->assign('tokenTall', $tokenTall);
        $this->assign('size', $size);
        $this->assign('color', $color);

        $this->_config_seo(C('pin_seo_config.item'), array(
            'item_title' => $item['title'],
            'item_intro' => $item['intro'],
        ));

        $this->display();
    }
    //体检
  
    public function exambook(){
    	header("Content-type:text/html;charset=utf-8");
    	if(IS_POST){
    		$advance = M('tijian');
    		if(false === $data = $advance->create()){
    			$this->error($advance->getError());
    		}
    		//检查项目
    		$data['checkProject'] = implode('|',$_POST['checkP']);
    		//添加时间
    		$data['addTime'] = time();
    		if(false !== $advance->add($data)){
    			$this->success("您的体检项目预约已提交成功！<br />请等待电话通知！",U('index/indexnew'));
    		}else{
    			$this->error("您的体检项目预约提交失败！");
    		}
    
    	}else{
    		$this->display();
    	}
    }
    //复诊
    public function rebook(){
    	header("Content-type:text/html;charset=utf-8");
    	if(IS_POST){
    		$advance = M('fuzhen_advance');
    		if(false == $data= $advance->create()){
            	    $this->error($advance->getError());
            }
    		if($_POST['img_name'] != ''){
	    		//图片
	    		$Uninum = time();
	    		$filepath = $_SERVER['DOCUMENT_ROOT']."/Uploads/items/images/";//图片保存的路径目录
	    		if(!is_dir($filepath)){
	    			mkdir($filepath,0777, true);
	    		}
	    		$file_type = explode(".",$_POST['img_name']);
	    		//dump($file_type);die;
	    		$filename = $Uninum.'.'.$file_type[1]; //生成文件名
	    		move_uploaded_file($_FILES["my_img"]["tmp_name"],$filepath.$filename);
	    		$data['pic'] = '/Uploads/items/images/'.$filename;
    		}
    		//检查项目
    		$data['checkProject'] = implode('&nbsp;&nbsp;,&nbsp;&nbsp;',$_POST['checkProject']);
    		//专家
    		$data['tuijianProject'] = implode('&nbsp;&nbsp;,&nbsp;&nbsp;',$_POST['tuijianProject']);
    		$data['taocanProject'] = $this->_post('taocanProject','trim');
    		//贴心服务
    		$data['loveServer'] = implode('&nbsp;&nbsp;,&nbsp;&nbsp;',$_POST['loveServer']);
    		//添加时间
    		$data['addTime'] = time();
    		//dump($data);die;
    		if(false !== $advance->add($data)){
    			   $this->success("预约成功,请等待电话通知！",U('index/indexnew'));
    		}else{
    			   $this->error("您的预约提交失败！");
    		}
    		
    	}else{
    	     $this->display();
    	}
    }
    public function rebookinfo(){
    	$this->display(); 
    }
    public function rebookitem(){
    	$this->display();
    }
    public function rebookinvite(){
    	    $zid = $this->_get('zid','trim,intval');
    		$zInfo = M('zhuanjia')->where(array('id'=>$zid))->find();
    		$hos = M('order_address')->field("id,name")->where(array('id'=>$zInfo['address_id']))->find();
    		$keshi = M('keshi')->field("id,name")->where(array('id'=>$zInfo['keshi_id']))->find();
    		$zhicheng = M('zhicheng')->field('id,name')->where(array('id'=>$zInfo['zhicheng_id']))->find();
    		$zInfo['hos']=$hos['name'];
    		$zInfo['keshi']=$keshi['name'];
    		$zInfo['zhicheng']=$zhicheng['name'];
    		$this->assign('info',$zInfo);
    		$this->display();
    }
    public function rebooknum(){
    	if(IS_POST){
    		$yuyue = M('advance');
    		if(false == $data = $yuyue->create()){
    			  $this->error($yuyue->getError());
    		}
    		
    		if($_POST['img_name'] != ''){
    			//图片
    			$Uninum = time();
    			$filepath = $_SERVER['DOCUMENT_ROOT']."/Uploads/items/images/";//图片保存的路径目录
    			if(!is_dir($filepath)){
    				mkdir($filepath,0777, true);
    			}
    			$file_type = explode(".",$_POST['img_name']);
    			//dump($file_type);die;
    			$filename = $Uninum.'.'.$file_type[1]; //生成文件名
    			move_uploaded_file($_FILES["my_img"]["tmp_name"],$filepath.$filename);
    			$data['pic'] = '/Uploads/items/images/'.$filename;
    		}
    		
    		$data['addTime'] = time();
    		
    		if($yuyue->add($data)){
    			$this->success("预约成功,请等待电话通知！",U('index/indexnew'));
    		}else{
    			$this->error("参数错误");
    		}
    		
    	}else{
    		$zid = $this->_get('zid','trim,intval');
    		$zInfo = M('zhuanjia')->where(array('id'=>$zid))->find();
    		$hos = M('order_address')->field("id,name")->where(array('id'=>$zInfo['address_id']))->find();
    		$keshi = M('keshi')->field("id,name")->where(array('id'=>$zInfo['keshi_id']))->find();
    		$zhicheng = M('zhicheng')->field('id,name')->where(array('id'=>$zInfo['zhicheng_id']))->find();
    		$zInfo['hos']=$hos['name'];
    		$zInfo['keshi']=$keshi['name'];
    		$zInfo['zhicheng']=$zhicheng['name'];
    		$this->assign('info',$zInfo);
    		$this->display();
    	}

    }
    public function exambookinfo(){
    	$this->display();
    }
    public function rebookhos(){
    	$this->display();
    }
    public function examhos(){
    	$this->display();
    }
    public function examstep(){
    	$this->display();
    }
    public function examcase(){
    	$this->display();
    }
    public function petctwhat(){
    	$this->display();
    }
    public function petctdo(){
    	$this->display();
    }
    public function examdoubt(){
    	$this->display();
    }
    public function accomstep(){
    	$this->display();
    }
	public function accomchoose(){
	    	$this->display();
	    }
	public function accomnote(){
	    	$this->display();
	}
	public function accomspecial(){
		$this->display();
	}
    public function accompanyinfo(){
    	$this->display();
    }
    public function quickget(){
    	if(IS_POST){
    		 $yuyue = M('qubaogao');
    		 if(false === $data = $yuyue->create()){
    		 	 $this->error($yuyue->getError());
    		 }
    		 $data['addTime'] = time();
    		 
    		 if($yuyue->add($data)){
    		 		$this->success("提交成功,请等待电话通知！",U('index/indexnew'));
    		 }else{
    		 		$this->error("参数错误");
    		 }
    	}else{
    		$this->display();
    	}

    }
    public function accompany(){
        	if(IS_POST){
    		$yuyue = M('huizhen_advance');
    		if(false == $data = $yuyue->create()){
    			$this->error($yuyue->getError());
    		}
    		
    		if($_POST['img_name'] != ''){
    			//图片
    			$Uninum = time();
    			$filepath = $_SERVER['DOCUMENT_ROOT']."/Uploads/items/images/";//图片保存的路径目录
    			if(!is_dir($filepath)){
    				mkdir($filepath,0777, true);
    			}
    			$file_type = explode(".",$_POST['img_name']);
    			//dump($file_type);die;
    			$filename = $Uninum.'.'.$file_type[1]; //生成文件名
    			move_uploaded_file($_FILES["my_img"]["tmp_name"],$filepath.$filename);
    			$data['pic'] = '/Uploads/items/images/'.$filename;
    		}
    		$data['pageType'] = 'peizhen';
    		$data['loveServer'] =  implode('|',$_POST['loveServer']);
    		$data['addTime'] = time();
    		
    		if($yuyue->add($data)){
    			$this->success("预约成功,请等待电话通知！",U('index/indexnew'));
    		}else{
    			$this->error("参数错误");
    		}   
    				
    	}else{
    		$this->display();
    	}
    }
    public function suspectinfo(){
    	$this->display();
    }
    public function suspect(){
    	if(IS_POST){
    		$yuyue = M('huizhenAdvance');
    		if(false == $data = $yuyue->create()){
    			$this->error($yuyue->getError());
    		}
    		
    		if($_POST['img_name'] != ''){
    			//图片
    			$Uninum = time();
    			$filepath = $_SERVER['DOCUMENT_ROOT']."/Uploads/items/images/";//图片保存的路径目录
    			if(!is_dir($filepath)){
    				mkdir($filepath,0777, true);
    			}
    			$file_type = explode(".",$_POST['img_name']);
    			//dump($file_type);die;
    			$filename = $Uninum.'.'.$file_type[1]; //生成文件名
    			move_uploaded_file($_FILES["my_img"]["tmp_name"],$filepath.$filename);
    			$data['pic'] = '/Uploads/items/images/'.$filename;
    		}
    		$data['loveServer'] =  implode('|',$_POST['loveServer']);
    		$data['pageType'] = 'huizhen';
    		$data['addTime'] = time();
    		
    		if($yuyue->add($data)){
    			$this->success("预约成功,请等待电话通知！",U('index/indexnew'));
    		}else{
    			$this->error("参数错误");
    		}   
    				
    	}else{
    		$this->display();
    	}
    }
    public function petctinfo(){
    	$this->display();
    }
    public function petct(){
    	if(IS_POST){
    		$yuyue = M('petct_advance');
    		if(false === $data = $yuyue->create()){
    			$this->error($yuyue->getError());
    		}
    		$data['loveServer'] =  implode('|',$_POST['loveServer']);
    		$data['addTime'] = time(); 
    		if($yuyue->add($data)){
    			$this->success("提交成功,请等待电话通知！",U('index/indexnew'));
    		}else{
    			$this->error("参数错误");
    		}  		
    	}else{
    		$this->display();
    	}
    }
    public function expert(){
    	$this->searchInfo();
    	$mod = M('zhuanjia');
    	$list = $mod->select();
    	$list = $this->getList($list);
    	
    	$this->assign('list',$list);
    	$this->display();
    
    }
    
    public function searchInfo(){
    	$this->assign('Hos_list',M('order_address')->select());
    	$this->assign('Keshi_list',M('keshi')->select());
    	$this->assign('Zhicheng_list',M('zhicheng')->select());
    	$this->assign('Fenlei_list',M('zhuanjia')->group('zhuanjiaType')->select());
    }
    
    public function search(){
    	  $id = $this->_get('id','trim,intval');
    	  $type = $this->_get('type','trim');
    	  $keys = $this->_get('keys','trim');
    	  $huizhen = $this->_get('huizhen','trim');
    	  if(!id || !$type)$this->redirect("index/indexnew");
    	  
    	  if($type == 'hos'){
    	  	  $where['address_id'] = $id;
    	  }else if($type == 'ks'){
    	  	  $where['keshi_id'] = $id;
    	  }else if($type == 'zc'){
    	  	  $where['zhicheng_id'] = $id;
    	  }elseif($type == 'zt'){
    	  	 $where['zhuanjiaType'] = $keys;
    	  }else if($type == 'hz'){
    	  	$where['huizhenType'] = $huizhen;
    	  }else{
    	  	  $where = "1 = 1";
    	  }
    	  $this->searchInfo();
    	  $mod = M('zhuanjia');
    	  $list = $mod->where($where)->select();
          $list = $this->getList($list);
    	  
    	  $this->assign('list',$list);
    	  
    	  $this->display("expert");
    }

    public function getList($list = array()){
    	foreach ($list as $key => $val){
    		$hos = M('order_address')->field("id,name")->where(array('id'=>$val['address_id']))->find();
    		$keshi = M('keshi')->field("id,name")->where(array('id'=>$val['keshi_id']))->find();
    		$zhicheng = M('zhicheng')->field('id,name')->where(array('id'=>$val['zhicheng_id']))->find();
    		$comments = M('zhuanjia_comments')->where(array('zhuanjia_id'=>$val['id']))->count();
    		$list[$key]['hospital'] = $hos['name'];
    		$list[$key]['keshi'] = $keshi['name'];
    		$list[$key]['title'] = $zhicheng['name'];
    		$list[$key]['commentsNum'] = $comments;
    	}
    	return $list;   	
    }
    
    public function searchlist(){
        $keywords = $this->_post('keywords','trim');	
        if($keywords == ''){
        	$this->error("请输入专家姓名");
        	exit;
        }
        $where['name'] = array("like","%".$keywords."%");
        $where['shanchang'] = array('like',"%".$keywords."%");
        $where['_logic'] = 'OR';
        $this->searchInfo();
        $mod = M('zhuanjia');
        $list = $mod->where($where)->select();
        $list = $this->getList($list);
        
        $this->assign('list',$list);
        $this->display("expert");
    }
    
    //为专家点赞
   public function add_love(){
   		$zhuanjiaId = $this->_post('type','trim,intval');
   		if($zhuanjiaId == ''){
   			echo '-1';
   		}else{
   			//cookie("flag","true",time()+315360000);
   			$mod = M('zhuanjia');
   			$mod->where(array('id'=>$zhuanjiaId))->setInc('likeNum');
   			$count = $mod->field('likeNum')->where(array('id'=>$zhuanjiaId))->find();
   			echo $count['likeNum'];
   		}
   }
   
   //专家评论
   public function zhuanjiaComments(){
   	//访问者控制
   	if (!$this->visitor->is_login && in_array(ACTION_NAME, array('share_item', 'fetch_item', 'publish_item', 'like', 'unlike', 'delete', 'zhuanjiaComments'))) {
   		$this->redirect('user/login');
   	}
   	$item_comment_mod = D('zhuanjia_comments');
   	if(IS_POST){
   		$zid = $this->_post('zId','trim,intval');
   		$userComments = $this->_post('userComments');
   		//dump(session('user_info'));die;
   		//dump($zid);die;
   		if(!$zid || $userComments == ''){
   			$this->error("评论失败！");
   			exit;
   		}
   		foreach ($_POST as $key=>$val) {
   			$_POST[$key] = Input::deleteHtmlTags($val);
   		}
   		$data = array();
   		//敏感词处理
       header("Content-type:text/html;charset=utf-8");
   		if(false === $this->filter($userComments)){
   		    $this->error("评论失败，包括敏感字！");
   		    exit;
   		 }
   		//dump(self::$wordArr);die;
   		$data['comments']= $userComments;
   		$data['userId'] = $this->visitor->info['id'];
   		$data['uName'] = $this->visitor->info['username'];
   		$data['zhuanjia_id'] = $zid;
   		$data['addTime'] = time();
   		//验证商品
   		$item_mod = M('zhuanjia');
   		//$item = $item_mod->field('id,userId,uname')->where(array('id' => $data['item_id'], 'status' => '1'))->find();
   		//!$item && $this->ajaxReturn(0, L('invalid_item'));
   		//写入评论
   		if (false === $item_comment_mod->create($data)) {
   			$this->error($item_comment_mod->getError());
   		}
   		$comment_id = $item_comment_mod->add();
   		if ($comment_id) {
   			$this->success(('comment_success'));
   		} else {
   			$this->error(L('comment_failed'));
   		}
   	}else{
   		$zid = $this->_get('zId','trim,intval');
   		if(!$zid){
   			$this->error("参数错误！");
   		}	
   		
   		$resp = $item_comment_mod->where(array('zhuanjia_id' => $zid))->order('addTime Desc')->select();
   		foreach($resp as $key => $val){
   			$resp[$key]['addTime'] = fdate($val['addTime']);
   			$resp[$key]['uName'] = substr_replace($val['uName'],'*****', 3,5);
   		}
   		$this->assign('list',$resp);
   		$this->assign("zid",$zid);
   		$this->display('comments');
   	}
  }
   
    public function rebookcase(){
    	$this->display();
    }
    public function rebookdoubt(){
    	$this->display();
    }
    public function rebookstep(){
    	$this->display();
    }
    //服务
    public function index_book(){
    	$id = $this->_get("itemid","trim,intval");
    	!$id && $this->_404();
    	$tokenTall = $this->getTokenTall();
    	$mod = M("service");
    	$item = $mod->field("id,cate_id,name,price,zb_price,img,status,info")->where("id = %d",$id)->find();
    	!$item && $this->_404();
    	$img_list = M('item_service_img')->field('url')->where(array('item_id' => $id))->order('id ASC')->select();
    	
    	//相关产品
    	$condi['cate_id'] = $item['cate_id'];
    	$condi['id'] = array('neq',$id);
    	$recommendRes = $mod->field("id,img,name,price,zb_price")->where($condi)->limit(4)->select();
    	
    	$this->assign("recommendRes",$recommendRes);
    	$this->assign('item', $item);
    	$this->assign('img_list', $img_list);    	
    	$this->_config_seo(C('pin_seo_config.item'), array(
    			'item_title' => $item['name'],
    			'item_intro' => $item['into'],
    	));
    	$this->display();
    }
    
    //资讯
    public function index_phone(){
    	$id = $this->_get("itemid","trim,intval");
    	!$id && $this->_404();
    	$tokenTall = $this->getTokenTall();    	
    	$res = M("article_new")->field("id,name,img,info,cate_id")->where(array("id"=>$id))->find();
    	!$res && $this->_404();
    	$img_list = M('item_article_img')->field('url')->where(array('item_id' => $id))->order('id ASC')->select();
    	//相关产品
    	$condi['cate_id'] = $res['cate_id'];
    	$condi['id'] = array('neq',$id);
    	$recommendRes = M("article_new")->field("id,img,name")->where($condi)->limit(4)->select();
    	$this->assign("recommendRes",$recommendRes);
    	$this->assign('item', $res);
    	$this->assign('img_list', $img_list);
    	$this->_config_seo(C('pin_seo_config.item'), array(
    			'item_title' => $res['name'],
    			'item_intro' => $res['into'],
    	));    	 
    	$this->display();
    }
    
    /**
     * 点击去购买
     */
    public function tgo() {
        $url = $this->_get('to', 'base64_decode');
        redirect($url);
    }

    /**
     * AJAX获取评论列表
     */
    public function comment_list() {
        $id = $this->_get('id', 'intval');
        !$id && $this->ajaxReturn(0, L('invalid_item'));
        $item_mod = M('item');
        $item = $item_mod->where(array('id' => $id, 'status' => '1'))->count('id');
        !$item && $this->ajaxReturn(0, L('invalid_item'));
        $item_comment_mod = M('item_comment');
        $pagesize = 8;
        $map = array('item_id' => $id);
        $count = $item_comment_mod->where($map)->count('id');
        $pager = $this->_pager($count, $pagesize);
        $pager->path = 'comment_list';
        $cmt_list = $item_comment_mod->where($map)->order('id DESC')->limit($pager->firstRow . ',' . $pager->listRows)->select();
        $this->assign('cmt_list', $cmt_list);
        $data = array();
        $data['list'] = $this->fetch('comment_list');
        $data['page'] = $pager->fshow();
        $this->ajaxReturn(1, '', $data);
    }

    /**
     * 评论一个商品
     */
    public function comment() {
        foreach ($_POST as $key=>$val) {
            $_POST[$key] = Input::deleteHtmlTags($val);
        }
        $data = array();
        $data['item_id'] = $this->_post('id', 'intval');
        !$data['item_id'] && $this->ajaxReturn(0, L('invalid_item'));
        $data['info'] = $this->_post('content', 'trim');
        !$data['info'] && $this->ajaxReturn(0, L('please_input') . L('comment_content'));
        //敏感词处理
        $check_result = D('badword')->check($data['info']);
        switch ($check_result['code']) {
            case 1: //禁用。直接返回
                $this->ajaxReturn(0, L('has_badword'));
                break;
            case 3: //需要审核
                $data['status'] = 0;
                break;
        }
        $data['info'] = $check_result['content'];
        $data['uid'] = $this->visitor->info['id'];
        $data['uname'] = $this->visitor->info['username'];

        //验证商品
        $item_mod = M('item');
        $item = $item_mod->field('id,uid,uname')->where(array('id' => $data['item_id'], 'status' => '1'))->find();
        !$item && $this->ajaxReturn(0, L('invalid_item'));
        //写入评论
        $item_comment_mod = D('item_comment');
        if (false === $item_comment_mod->create($data)) {
            $this->ajaxReturn(0, $item_comment_mod->getError());
        }
        $comment_id = $item_comment_mod->add();
        if ($comment_id) {
            $this->assign('cmt_list', array(
                array(
                    'uid' => $data['uid'],
                    'uname' => $data['uname'],
                    'info' => $data['info'],
                    'add_time' => time(),
                )
            ));
            $resp = $this->fetch('comment_list');
            $this->ajaxReturn(1, L('comment_success'), $resp);
        } else {
            $this->ajaxReturn(0, L('comment_failed'));
        }
    }

    //分享商品弹窗
    public function share_item() {
        //支持的网站
        if (false === $site_list = F('item_site_list')) {
            $site_list = D('item_site')->site_cache();
        }
        $this->assign('site_list', $site_list);
        $resp = $this->fetch('dialog:share_item');
        $this->ajaxReturn(1, '', $resp);
    }

    //获取商品信息
    public function fetch_item() {
        $url = $this->_get('url', 'trim');
        $url == '' && $this->ajaxReturn(0, L('please_input') . L('correct_itemurl'));
        $aid = $this->_get('aid', 'intval');
        //获取商品信息
        $itemcollect = new itemcollect();
        !$itemcollect->url_parse($url) && $this->ajaxReturn(0, L('please_input') . L('correct_itemurl'));
        if (!$info = $itemcollect->fetch()) {
            $this->ajaxReturn(0, L('fetch_item_failed'));
        }
        $this->assign('item', $info['item']);
        $data = array();
        if ($aid) {
            $this->assign('aid', $aid);
        } else {
            //用户的专辑
            $album_list = M('album')->field('id,title')->where(array('uid' => $this->visitor->info['id']))->select();
            //专辑分类
            if (false === $album_cate_list = F('album_cate_list')) {
                $album_cate_list = D('album_cate')->cate_cache();
            }
            $this->assign('album_cate_list', $album_cate_list);
            $this->assign('album_list', $album_list);
        }
        //专辑分类
        $data['html'] = $this->fetch('dialog:fetch_item');
        $data['item'] = serialize($info['item']);
        $this->ajaxReturn(1, L('fetch_item_success'), $data);
    }

    //发布商品
    public function publish_item() {
        $item = unserialize($this->_post('item', 'trim'));
        !$item['key_id'] && $this->ajaxReturn(0, L('publish_item_failed'));
        $album_id = $this->_post('album_id', 'intval', 0);
        $ac_id = $this->_post('ac_id', 'intval', 0);
        $item['intro'] = $this->_post('intro', 'trim');
        $item['info'] = Input::deleteHtmlTags($item['info']);
        $item['uid'] = $this->visitor->info['id'];
        $item['uname'] = $this->visitor->info['username'];
        $item['status'] = C('pin_item_check') ? 0 : 1;
        //添加商品
        $item_mod = D('item');
        $result = $item_mod->publish($item, $album_id, $ac_id);
        if ($result) {
            //发布商品钩子
            $tag_arg = array('uid' => $item['uid'], 'uname' => $item['uname'], 'action' => 'pubitem');
            tag('pubitem_end', $tag_arg);
            $this->ajaxReturn(1, L('publish_item_success'));
        } else {
            $this->ajaxReturn(0, $item_mod->getError());
        }
    }

    /**
     * 喜欢一个商品
     * 返回status(todo)
     */
    public function like() {
        $id = $this->_get('id', 'intval');
        $aid = $this->_get('aid', 'intval');
        !$id && $this->ajaxReturn(0, L('invalid_item'));
        $item_mod = M('item');
        $item = $item_mod->field('id,uid,uname')->where(array('id' => $id, 'status' => '1'))->find();
        !$item && $this->ajaxReturn(0, L('invalid_item'));
        $uid = $this->visitor->info['id'];
        $uname = $this->visitor->info['username'];
        $item['uid'] == $uid && $this->ajaxReturn(0, L('like_own')); //自己的商品
        $like_mod = M('item_like');
        //是否已经喜欢过
        $is_liked = $like_mod->where(array('item_id' => $item['id'], 'uid' => $uid))->count();
        $is_liked && $this->ajaxReturn(0, L('you_was_liked'));
        if ($like_mod->add(array('item_id' => $item['id'], 'uid' => $uid, 'add_time' => time()))) {
            //增加商品喜欢数
            $item_mod->where(array('id' => $id))->setInc('likes');
            //增加用户被喜欢数
            M('user')->where(array('id' => $item['uid']))->setInc('likes');
            //增加专辑喜欢
            $aid && M('album')->where(array('id' => $aid))->setInc('likes');
            //添加喜欢钩子
            $tag_arg = array('uid' => $uid, 'uname' => $uname, 'action' => 'likeitem');
            tag('likeitem_end', $tag_arg);
            $this->ajaxReturn(1, L('like_success'));
        } else {
            $this->ajaxReturn(0, L('like_failed'));
        }
    }

    /**
     * 删除喜欢
     */
    public function unlike() {
        $id = $this->_get('id', 'intval');
        !$id && $this->ajaxReturn(0, L('invalid_item'));
        $uid = $this->visitor->info['id'];
        $like_mod = M('item_like');
        if ($like_mod->where(array('uid' => $uid, 'item_id' => $id))->delete()) {
            //喜欢数不减少~
            $this->ajaxReturn(1, L('unlike_success'));
        } else {
            $this->ajaxReturn(1, L('unlike_failed'));
        }
    }
    
    /*显示页面,房屋租赁*/
    public function house_book(){
    	$id = $this->_get("itemid","trim,intval");
    	!$id && $this->_404();
    	$tokenTall = $this->getTokenTall();
    	$res = M("house")->where(array("id"=>$id))->find();
    	!$res && $this->_404();    	
    	$img_list = M('house_img')->field('url')->where(array('item_id' => $id))->order('id ASC')->select();
    	$this->assign('item', $res);
    	$this->assign('img_list', $img_list);
    	$this->display();
    }
    
    //护工服务
    public function hugong_book(){
    	$id = $this->_get("itemid","trim,intval");
    	!$id && $this->_404();
    	$tokenTall = $this->getTokenTall();
    	$res = M("hugong")->where(array("id"=>$id))->find();
    	!$res && $this->_404();    	
    	$img_list = M('hugong_img')->field('url')->where(array('item_id' => $id))->order('id ASC')->select();
    	$this->assign('item', $res);
    	$this->assign('img_list', $img_list);
    	$this->display();
    }

    /**
     * 删除商品
     */
    public function delete() {
        $id = $this->_get('id', 'intval');
        $album_id = $this->_get('album_id', 'intval');
        !$id && $this->ajaxReturn(0, L('invalid_item'));
        $uid = $this->visitor->info['id'];
        $uname = $this->visitor->info['username'];
        if ($album_id) {
            //删除专辑里面的商品
            $result = M('album')->where(array('id' => $album_id, 'uid' => $uid))->count();
            if ($result) {
                M('album_item')->where(array('album_id' => $album_id, 'item_id' => $id))->delete();
                //减少专辑商品数量
                M('album')->where(array('id' => $album_id))->setDec('items');
                //刷新专辑封面
                D('album')->update_cover($album_id);
                $this->ajaxReturn(1, L('del_item_success'));
            } else {
                $this->ajaxReturn(0, L('del_item_failed'));
            }
        } else {
            $result = D('item')->where(array('id' => $id, 'uid' => $uid))->delete();
            //减少用户分享数量
            M('user')->where(array('id' => $uid))->setDec('shares');
            if ($result) {
                //添加删除钩子
                $tag_arg = array('uid' => $uid, 'uname' => $uname, 'action' => 'delitem');
                tag('delitem_end', $tag_arg);
                $this->ajaxReturn(1, L('del_item_success'));
            } else {
                $this->ajaxReturn(0, L('del_item_failed'));
            }
        }
    }
    
   
}
