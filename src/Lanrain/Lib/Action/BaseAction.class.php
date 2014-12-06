<?php
class BaseAction extends Action
{
    protected function _initialize()
    {
        define('RES', THEME_PATH . 'common');
        define('STATICS', TMPL_PATH . 'static');
        $this->assign('action', $this->getActionName());
        //设置wecha_id值
        $this->getWechaId();
    }
    protected function all_insert($name = '', $back = '/index')
    {
        $name = $name ? $name : MODULE_NAME;
        $db   = D($name);
        if ($db->create() === false) {
            $this->error($db->getError());
        } else {
            $id = $db->add();
            if ($id) {
                $m_arr = array(
                    'Img',
                    'Text',
                    'Voiceresponse',
                    'Ordering',
                    'Lottery',
                    'Host',
                    'Product',
                    'Selfform',
					'Xitie',
                	'Diymen_class'
                );
                if (in_array($name, $m_arr)) {
                    $data['pid']     = $id;
                    $data['module']  = $name;
                    $data['token']   = session('token');
                    $data['keyword'] = $_POST['keyword'];
                    M('Keyword')->add($data);
                }
                
                if ($name == "Classify") {
                	//同步到商品分类
                	$itemcatedata = array();
                	$itemcatedata['name'] = $_POST['name'];
                	$itemcatedata['tags'] = $id;
                	$itemcatedata['status'] = 1;
                	$itemcatedata['tokenTall'] = session('token');
                	M('item_cate')->add($itemcatedata);
                }

                
                $this->success('操作成功', U(MODULE_NAME . $back));
            } else {
                $this->error('操作失败', U(MODULE_NAME . $back));
            }
        }
    }
    protected function insert($name = '', $back = '/index')
    {
        $name = $name ? $name : MODULE_NAME;
        $db   = D($name);
        if ($db->create() === false) {
            $this->error($db->getError());
        } else {
            $id = $db->add();
            if ($id == true) {
                $this->success('操作成功', U(MODULE_NAME . $back));
            } else {
                $this->error('操作失败', U(MODULE_NAME . $back));
            }
        }
    }
    protected function save($name = '', $back = '/index')
    {
        $name = $name ? $name : MODULE_NAME;
        $db   = D($name);
        if ($db->create() === false) {
            $this->error($db->getError());
        } else {
            $id = $db->save();
            if ($id == true) {
                $this->success('操作成功', U(MODULE_NAME . $back));
            } else {
                $this->error('操作失败', U(MODULE_NAME . $back));
            }
        }
    }
    protected function all_save($name = '', $back = '/index')
    {
        $name = $name ? $name : MODULE_NAME;
        $db   = D($name);
        if ($db->create() === false) {
            $this->error($db->getError());
        } else {
            $id = $db->save();
            if ($id) {
                $m_arr = array(
                    'Img',
                    'Text',
                    'Voiceresponse',
                    'Ordering',
                    'Lottery',
                    'Host',
                    'Product',
                    'Selfform'
                );
                if (in_array($name, $m_arr)) {
                    $data['pid']    = $_POST['id'];
                    $data['module'] = $name;
                    $data['token']  = session('token');
                    $da['keyword']  = $_POST['keyword'];
                    M('Keyword')->where($data)->save($da);
                }
                
                if ($name == "Classify") {
                	//同步到商品分类
                	$itemcatedata0['name'] = $_POST['name'];
                	$itemcatedata1['tags'] = $_POST['id'];
                	$itemcatedata1['tokenTall'] = session('token');
                	M('item_cate')->where($itemcatedata1)->save($itemcatedata0);
                }
                
                $this->success('操作成功', U(MODULE_NAME . $back));
            } else {
                $this->error('操作失败', U(MODULE_NAME . $back));
            }
        }
    }
    protected function all_del($id, $name = '', $back = '/index')
    {
        $name = $name ? $name : MODULE_NAME;
        $db   = D($name);
        if ($db->delete($id)) {
            $this->ajaxReturn('操作成功', U(MODULE_NAME . $back));
        } else {
            $this->ajaxReturn('操作失败', U(MODULE_NAME . $back));
        }
    }
	protected function _upload(){
		import("@.ORG.UploadFile");
		$upload = new UploadFile();
		//设置上传文件大小
		$upload->maxSize = 3292200;
		//设置上传文件类型
		$upload->allowExts = explode(',','jpg,gif,png,jpeg');
		//设置附件上传目录
		$upload->savePath = './data/attachments/';
		//设置需要生成缩略图，仅对图像文件有效
		$upload->thumb = true;
		// 设置引用图片类库包路径
		$upload->imageClassPath = '@.ORG.Image';
		//设置需要生成缩略图的文件后缀
		$upload->thumbPrefix = 'm_';
		//生产2张缩略图
		//设置缩略图最大宽度
		$upload->thumbMaxWidth = '720';
		//设置缩略图最大高度
		$upload->thumbMaxHeight = '400';
		//设置上传文件规则
		$upload->saveRule = uniqid;
		//删除原图
		$upload->thumbRemoveOrigin = true;
		if (!$upload->upload()) {
			//捕获上传异常
			return $upload->getErrorMsg();
		}else{
			//取得成功上传的文件信息
			$uploadList = $upload->getUploadFileInfo();
			return $uploadList;
		}
	}
	
	/*取当前用户微信号加密值，取不到则默认为空*/
	public function getWechaId(){
		$wecha_id = $this->_request('wecha_id', 'trim', '');
		if($wecha_id != "") {$_SESSION["wecha_id"]=$wecha_id;}
		if($wecha_id == "" && $_SESSION["wecha_id"] != "") {$wecha_id = $_SESSION["wecha_id"];}
		return $wecha_id;
	}
	
	public function getTokenTall(){
		$tokenTall = $this->_request('tokenTall', 'trim', '');
		if($tokenTall == "" && $_SESSION["tokenTall"] != "") {$tokenTall = $_SESSION["tokenTall"];}
		if($tokenTall == "" && $_SESSION["token"] != "") {$tokenTall = $_SESSION["token"];}
		if($tokenTall != "") {$_SESSION["tokenTall"]=$tokenTall;}
		 
		return $tokenTall;
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
		if($mob != ""){
			$ch = curl_init();
			curl_setopt($ch, CURLOPT_URL, "http://api.weimi.cc/2/sms/send.html");
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
			curl_setopt($ch, CURLOPT_POST, TRUE);
			$uid = '1A0mXEFdgXNn';
			$pas = '2bb3w3x4';
			$tel = '4006555899';
			if($act == 'fahuo'){
				$cid = 'eh1oqMRKCHs8';
				$mobuser = $this->_request('mobuser', 'trim', '');
				$mobitem = $this->_request('mobitem', 'trim', '');
				$mobaddrname = $this->_request('mobaddrname', 'trim', '');
				$mobaddrmob = $this->_request('mobaddrmob', 'trim', '');
				
				//填写参数
				curl_setopt($ch, CURLOPT_POSTFIELDS, 'uid='.$uid.'&pas='.$pas.'&mob='.$mob.'&cid='.$cid
				.'&p1='.$mobuser.'&p2='.$mobitem.'&p3='.$mobaddrname.'&p4='.$mobaddrmob.'&p5='.$tel.'&type=json');
				
			}
			$res = curl_exec( $ch );
			curl_close( $ch );
			echo($res);
		}
	}
	
}
?>