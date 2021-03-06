<?php
class IndexAction extends BaseAction{

	//关注回复
	public function index(){
		if(isset($_SESSION['uid']) && $_SESSION['uid'] != ''){
		   $this->redirect(U('User/Index/index'));
		}else{
			$this->display('login');
		}
	}
	
	public function resetpwd(){
		$uid=$this->_get('uid','intval');
		$code=$this->_get('code','trim');
		$rtime=$this->_get('resettime','intval');
		$info=M('Users')->find($uid);
		if( (md5($info['uid'].$info['password'].$info['email'])!==$code) || ($rtime<time()) ){
			$this->error('非法操作',U('Index/index'));
		}
		
		$this->assign('uid',$uid);
		$this->display();
	}
	
	
	//微信书
	public function book(){
	    $wxBook = M('img')->where(array('classname'=>'微信书'))->order('statdate DESC')->select();
		$count=0;
		foreach($wxBook as $key =>$val){
			$count+= $val['click'];
		}
		$this->assign('count',$count);
	    $this->assign('bookList',$wxBook);
		$this->display();
	}
	//详情
	public function content(){
		//$where['token']=$this->_get('token','trim');
		$contentid=intval($_GET['id']);	
		$imgDetail =  M('img')->where(array('id'=>$contentid))->find();
		$this->assign('imgDetail',$imgDetail);
		$commentsNum = M('img_comments')->where(array('imgid'=>$contentid))->count();
		$commentsPer = M('img_comments')->where(array('imgid'=>$contentid))->order('id DESC')->select();
		foreach($commentsPer as $key => $val){
			  $uInfo = M('user')->where(array('id'=>$val['uid']))->find();
			  $commentsPer[$key]['headimgurl'] = $uInfo['headimgurl'];
			  $commentsPer[$key]['nickname'] = $uInfo['nickname'];
		}
		$this->assign('commesNum',$commentsNum);
		$this->assign('comments',$commentsPer);
		$this->display();
	}
	//留言
	public function message(){
		if(!isset($_SESSION['newid']) && $_SESSION['newid'] == ''){
			 $_SESSION['newid'] = $this->_post('newid','intval');
			 $_SESSION['content'] = $this->_post('content','content');
		}
		 $this->getUserInfo();
		 $newid = $_SESSION['newid'];
		 $content = $_SESSION['content'];
		 	unset($_SESSION['newid']);$_SESSION['newid'] = null;
			unset($_SESSION['content']);$_SESSION['content'] = null;		 
         M('img_comments')->add(array('imgid'=>$newid,'uid'=>$_SESSION['uid'],'content'=>$content));
         if($newid == 0){
         	$this->redirect(U('Index/comments'));
         }else{
         	$this->redirect(U('Index/content/',array('id'=>$newid)));
         }
        
	}
	
	public function getUserInfo(){
		//if(!isset($_SESSION['uid']) || empty($_SESSION['uid']) || !isset($_SESSION['openid']) || empty($_SESSION['openid'])){
		$config['appId'] = "wxbda9322fde0a0d69";
		$config['appSecret'] = "8748bc78ab27e06e7695dbb54c063f2b";
		$data = array();
		if (isset($_GET['code'])){
			$Oauth = new Oauth2();
			$userinfo=$Oauth->getUserinfo($_GET['code'],$config);
			$Userarr= M('user')->where(array('openid'=>$userinfo['openid']))->find();
			$data['last_login_time']=time();
			$data['last_login_ip']=get_client_ip();
			$data['nickname'] = $userinfo['nickname'];
			$data['headimgurl'] = $userinfo['headimgurl'];
			$data['openid']= $userinfo['openid'];
			//dump($userinfo);exit;
			if(!empty($Userarr) && $Userarr!=''){
				M('user')->where(array('openid'=>$userinfo['openid']))->save($data);
				$_SESSION['uid']=$Userarr['id'];
				//$_SESSION['nickname']=$Userarr['nickname'];
				//$_SESSION['headimgurl']=$Userarr['headimgurl'];
				//$_SESSION['openid']=$userinfo['openid'];
			}else{
				//	$uid = M('user')->add($data);
				$_SESSION['uid']=M('user')->add($data);
				//	$_SESSION['nickname']=$userinfo['nickname'];
				//	$_SESSION['headimgurl']=$Userarr['headimgurl'];
				//	$_SESSION['openid']=$userinfo['openid'];
			}
			//dump($_SESSION['uid'].'-1-'.$_SESSION['name']);exit;
		}else{
			$myurl = C('site_url').__SELF__;
			$redirecturl = urlencode($myurl);
			$url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=".$config['appId']."&redirect_uri=".$redirecturl."&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect";
			//dump($url);exit;
			header("Location: ".$url);
		}
	//		}		

	}
	
	public function comments(){
		$commentsNum = M('img_comments')->where(array('imgid'=>0))->count();
		$commentsPer = M('img_comments')->where(array('imgid'=>0))->order('id DESC')->select();
		foreach($commentsPer as $key => $val){
			  $uInfo = M('user')->where(array('id'=>$val['uid']))->find();
			  $commentsPer[$key]['headimgurl'] = $uInfo['headimgurl'];
			  $commentsPer[$key]['nickname'] = $uInfo['nickname'];
		}
		$this->assign('commesNum',$commentsNum);
		$this->assign('comments',$commentsPer);
		$this->display();
	}
	
	//浏览量
	//资讯点击量
	public function clickNum(){
		$where['id']=$this->_get('id','trim');
		if($where['id']){
			M('img')->where($where)->setInc('click');
		}
	}

	
	public function indexnew(){
		$this->display();
		}
	public function test(){
		require_once './Extend/PHPExcel_1.7.9/Classes/PHPExcel/IOFactory.php';
		
		if (!file_exists("./Extend/PHPExcel_1.7.9/Examples/01simple.xls")) {
			exit("file not exist.");
		}
		
		$objPHPExcel = PHPExcel_IOFactory::load("./Extend/PHPExcel_1.7.9/Examples/01simple.xls");
		
		dump($objPHPExcel);
		
		die('xxxx');
	}
}