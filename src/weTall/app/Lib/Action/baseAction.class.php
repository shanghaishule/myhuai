<?php
/**
 * 控制器基类
 *
 * @author andery
 */
class baseAction extends Action
{
    protected function _initialize() {
        //消除所有的magic_quotes_gpc转义
        Input::noGPC();
        //初始化网站配置
        if (false === $setting = F('setting')) {
            $setting = D('setting')->setting_cache();
        }
        //设置tokenTall值
        $tokenTall = $this->getTokenTall();
        $this->assign('tokenTall', $tokenTall);
        
        //设置wecha_id值
        $this->getWechaId();
        
        C($setting);
        //发送邮件
        $this->assign('async_sendmail', session('async_sendmail'));
        
        //dump($_SESSION);exit;
        
        $allfunction = M('Function')->where(array('belonguser'=>session('belonguser')))->select();
        $allfunctiontype = M('Function')->Distinct(true)->field('funtype')->where(array('belonguser'=>session('belonguser'),'funtype'=>array('neq','默认')))->order('usenum')->select();
        $this->assign('allfunction',$allfunction);
        $this->assign('allfunctiontype',$allfunctiontype);
        
        
    }
    
    public function _empty() {
        $this->_404();
    }
    
    protected function _404($url = '') {
        if ($url) {
            redirect($url);
        } else {
            send_http_status(404);
            $this->display(TMPL_PATH . '404.html');
            exit;
        }
    }

    /**
     * 添加邮件到队列
     */
    protected function _mail_queue($to, $subject, $body, $priority = 1) {
        $to_emails = is_array($to) ? $to : array($to);
        $mails = array();
        $time = time();
        foreach ($to_emails as $_email) {
            $mails[] = array(
                'mail_to' => $_email,
                'mail_subject' => $subject,
                'mail_body' => $body,
                'priority' => $priority,
                'add_time' => $time,
                'lock_expiry' => $time,
            );
        }
        M('mail_queue')->addAll($mails);

        //异步发送邮件
        $this->send_mail(false);
    }

    /**
     * 发送邮件
     */
    public function send_mail($is_sync = true) {
        if (!$is_sync) {
            //异步
            session('async_sendmail', true);
            return true;
        } else {
            //同步
            session('async_sendmail', null);
            return D('mail_queue')->send();
        }
    }

    /**
     * 上传文件默认规则定义
     */
    protected function _upload_init($upload) {
        $allow_max = C('pin_attr_allow_size'); //读取配置
        $allow_exts = explode(',', C('pin_attr_allow_exts')); //读取配置
        $allow_max && $upload->maxSize = $allow_max * 1024;   //文件大小限制
        $allow_exts && $upload->allowExts = $allow_exts;  //文件类型限制
        $upload->saveRule = 'uniqid';
        return $upload;
    }

    /**
     * 上传文件
     */
    protected function _upload($file, $dir = '', $thumb = array(), $save_rule='uniqid') {
        $upload = new UploadFile();
        if ($dir) {
            $upload_path = C('pin_attach_path') . $dir . '/';
            $upload->savePath = $upload_path;
        }
        if ($thumb) {
            $upload->thumb = true;
            $upload->thumbMaxWidth = $thumb['width'];
            $upload->thumbMaxHeight = $thumb['height'];
            $upload->thumbPrefix = '';
            $upload->thumbSuffix = isset($thumb['suffix']) ? $thumb['suffix'] : '_thumb';
            $upload->thumbExt = isset($thumb['ext']) ? $thumb['ext'] : '';
            $upload->thumbRemoveOrigin = isset($thumb['remove_origin']) ? true : false;
        }
        //自定义上传规则
        $upload = $this->_upload_init($upload);
        if( $save_rule!='uniqid' ){
            $upload->saveRule = $save_rule;
        }

        if ($result = $upload->uploadOne($file)) {
            return array('error'=>0, 'info'=>$result);
        } else {
            return array('error'=>1, 'info'=>$upload->getErrorMsg());
        }
    }

    /**
     * AJAX返回数据标准
     *
     * @param int $status
     * @param string $msg
     * @param mixed $data
     * @param string $dialog
     */
    protected function ajaxReturn($status=1, $msg='', $data='', $dialog='') {
        parent::ajaxReturn(array(
            'status' => $status,
            'msg' => $msg,
            'data' => $data,
            'dialog' => $dialog,
        ));
    }
    
    /*取商家token值，取不到则默认为空*/
    public function getTokenTall(){
    	$tokenTall = $this->_request('tokenTall', 'trim', '');
    	if($tokenTall == "" && $_SESSION["tokenTall"] != "") {$tokenTall = $_SESSION["tokenTall"];}
    	if($tokenTall == "" && $_SESSION["token"] != "") {$tokenTall = $_SESSION["token"];}
    	if($tokenTall != "") {$_SESSION["tokenTall"]=$tokenTall;}
    	
    	return $tokenTall;
    }
    
    /*取当前用户微信号加密值，取不到则默认为空*/
    public function getWechaId(){
    	$wecha_id = $this->_request('wecha_id', 'trim', '');
    	if($wecha_id != "") {$_SESSION["wecha_id"]=$wecha_id;}
    	if($wecha_id == "" && $_SESSION["wecha_id"] != "") {$wecha_id = $_SESSION["wecha_id"];}
    	return $wecha_id;
    }
    
    /*微米短信接口
     * 短信接口二，触发类模板短信接口，可以设置动态参数变量。适合：验证码、订单短信等。
    	1、设定微米账号的接口UID和接口密码
    	2、传入目标手机号码，多个以“,”分隔，一次性调用最多100个号码，示例：139********,138********
    	3、短信模板cid，通过微米后台创建，由在线客服审核。必须设置好短信签名，签名规范：
    	1）、模板内容一定要带签名，签名放在模板内容的最前面；
    	2）、签名格式：【***】，签名内容为三个汉字以上（包括三个）；
    	3）、短信内容不允许双签名，即短信内容里只有一个“【】”。
    	4、传入模板参数。短信模板内容示例：
    	【微米网】您的验证码是：%P%，%P%分钟内有效。如非您本人操作，可忽略本消息。
    	传入两个参数：
    	p1：610912
    	p2：3
    	最终发送内容：
    	【微米网】您的验证码是：610912，3分钟内有效。如非您本人操作，可忽略本消息。
     * */
    public function PHPSMS(){
    	
    	$act = $this->_request('act', 'trim', '');
    	$mob = $this->_request('mob', 'trim', '');
    	$smscode = $this->_request('smscode', 'trim', '');
    	
    	if($mob != "" && $smscode != ""){
	    	$ch = curl_init();
	    	curl_setopt($ch, CURLOPT_URL, "http://api.weimi.cc/2/sms/send.html");
	    	curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
	    	curl_setopt($ch, CURLOPT_POST, TRUE);
	    	$uid = '1A0mXEFdgXNn';
	    	$pas = '2bb3w3x4';
	    	if($act == 'register'){
	    		$cid = 'PPE1fo4CUJxJ';
		    	//填写参数
		    	curl_setopt($ch, CURLOPT_POSTFIELDS, 'uid='.$uid.'&pas='.$pas.'&mob='.$mob.'&cid='.$cid.'&p1=沪爱健康&p2='.$smscode.'&p3=4006555899&type=json');
		    }
	    	$res = curl_exec( $ch );
	    	curl_close( $ch );
	    	echo($res);
    	}
    	//echo json_encode($_POST);
    }
}