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
	    $wxBook = M('img')->where(array('classname'=>'微信书'))->select();
	    $this->assign('bookList',$wxBook);
		$this->display();
	}
	//详情
	public function content(){
		$db=M('Img');
		//$where['token']=$this->_get('token','trim');
		$contentid=intval($_GET['id']);	
		$imgDetail =  M('img')->where(array('id'=>$contentid))->find();
		$this->assign('imgDetail',$imgDetail);
		$commentsNum = M('img_comments')->where(array('imgid'=>$contentid))->count();
		$commentsPer = M('img_comments')->where(array('imgid'=>$contentid))->select();
		foreach($commentsPer as $key => $val){
			  $uInfo = M('user')->where(array('id'=>$val['uid']))->find();
			  $commentsPer[$key]['headimgurl'] = $uInfo['headimgurl'];
			  $commentsPer[$key]['nickname'] = $uInfo['nickname'];
		}
		$this->assign('comments',$commentsPer);
		$this->display();
	}
	//留言
	public function message(){
		 $newsId = $this->_post('newid','intval');
		 $content = $this->_post('content','content');
        $this->getUserInfo();exit;
        // M('img_comments')->add(array('imgid'=>$newsId,'uid'=>$uid,'content'=>$content));
         $this->redirect(U('Index/book'));
	}
	
	//浏览量
	//资讯点击量
	public function clickNum(){
		$where['id']=$this->_get('id','trim');
		if($where['id']){
			M('img')->where($where)->setInc('click');
		}
	}
	public function getUserInfo(){
		//	if(!isset($_SESSION['uid']) || empty($_SESSION['uid']) || !isset($_SESSION['openid']) || empty($_SESSION['openid'])){
		//    echo '1';
		$config['appId'] = "wxbda9322fde0a0d69";
		$config['appSecret'] = "8748bc78ab27e06e7695dbb54c063f2b";
		$data = array();
		$uid = '';
		if (isset($_GET['code'])){
			$Oauth = new Oauth2();
			$userinfo=$Oauth->getUserinfo($_GET['code'],$config);
			dump($userinfo);
			$Userarr= M('user')->where(array('openid'=>$userinfo['openid']))->find();
			$data['last_login_time']=time();
			$data['last_login_ip']=get_client_ip();
			$data['nickname'] = $userinfo['nickname'];
			$data['headimgurl'] = $userinfo['headimgurl'];
			$data['openid']= $userinfo['openid'];
			dump($Userarr);die;
			if(!empty($Userarr) && $Userarr!=''){
				$uid = $Userarr['id'];
				M('user')->where(array('openid'=>$userinfo['openid']))->save($data);
				//$_SESSION['uid']=$Userarr['id'];
				//$_SESSION['nickname']=$Userarr['nickname'];
				//$_SESSION['headimgurl']=$Userarr['headimgurl'];
				//$_SESSION['openid']=$userinfo['openid'];
			}else{
				$uid = M('user')->add($data);
 				/*
				$_SESSION['uid']=M('user')->add($data);
				$_SESSION['nickname']=$userinfo['nickname'];
				$_SESSION['headimgurl']=$Userarr['headimgurl'];
				$_SESSION['openid']=$userinfo['openid'];
				*/
			}
			//dump($_SESSION['uid'].'-1-'.$_SESSION['name']);exit;
		}else{
			$myurl = C('site_url').__SELF__;
			$redirecturl = urlencode($myurl);
			$url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=".$config['appId']."&redirect_uri=".$redirecturl."&response_type=code&scope=snsapi_base&state=123#wechat_redirect";
			//dump($url);exit;
			header("Location: ".$url);
		}	
		//	}
	//	return $uid;	
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