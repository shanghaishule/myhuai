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
		$config['appId'] = "wxbda9322fde0a0d69";
		$config['appSecret'] = "8748bc78ab27e06e7695dbb54c063f2b";
		
		if(!isset($_SESSION['uid']) || empty($_SESSION['uid']) || !isset($_SESSION['openid']) || empty($_SESSION['openid'])){
	    //    echo '1';
	        $data = array();
			if (isset($_GET['code'])){
				$Oauth = new Oauth2();
				$userinfo=$Oauth->getUserinfo($_GET['code'],$config);
				//dump($userinfo);echo $_GET['code'];exit;
				$data['last_login_time']=time();
				$data['last_login_ip']=get_client_ip();
				$data['nickname'] = $userinfo['nickname'];
				$data['headimgurl'] = $userinfo['headimgurl'];
				$data['openid']= $userinfo['openid'];
				$Userarr= M('user')->where(array('openid'=>$userinfo['openid']))->find();
				if(!empty($Userarr) && $Userarr!=''){
					M('user')->where(array('openid'=>$userinfo['openid']))->save($data);
					$_SESSION['uid']=$Userarr['id'];
					$_SESSION['nickname']=$Userarr['nickname'];
					$_SESSION['headimgurl']=$Userarr['headimgurl'];
					$_SESSION['openid']=$userinfo['openid'];
				}else{
					$_SESSION['uid']=M('user')->add($data);
					$_SESSION['nickname']=$userinfo['nickname'];
					$_SESSION['headimgurl']=$Userarr['headimgurl'];
					$_SESSION['openid']=$userinfo['openid'];
				}
				//dump($_SESSION['uid'].'-1-'.$_SESSION['name']);exit;
			}else{
				$myurl = C('site_url').__SELF__;
				$redirecturl = urlencode($myurl);
				$url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=".$config['appId']."&redirect_uri=".$redirecturl."&response_type=code&scope=snsapi_base&state=123#wechat_redirect";
				//dump($url);exit;
				header("Location: ".$url);
			}
		}
		$this->assign('userinfo',$data);
		$this->display();
	}
	
	public function content(){
		
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