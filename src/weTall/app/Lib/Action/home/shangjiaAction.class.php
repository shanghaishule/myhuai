<?php

class shangjiaAction extends userbaseAction {
	
	public function _initialize(){
		parent::_initialize();
	
	}
	
	public function ajaxCheckuser()
	{
		$username = $_GET['user_name'];
		$user = M('business');
		$count = $user->where("b_uname='".$username."'")->find();
		if(is_array($count))
		{
			echo 'true';
		}
		else
		{
			echo 'false';
		}
		 
	}
	
    /**
     * 商家登陆
     */
    public function login() {
    	$tokenTall = $this->getTokenTall();
    	$this->assign('tokenTall', $tokenTall);
        $this->visitor->is_login && $this->redirect('shangjia/index', array('tokenTall'=>$tokenTall));
        if (IS_POST) {
            $username = $this->_post('username', 'trim');
            $password = $this->_post('password', 'trim');
            $remember = $this->_post('remember');
            if (empty($username)) {
                IS_AJAX && $this->ajaxReturn(0, L('please_input').L('password'));
                $this->error(L('please_input').L('username'));
            }
            if (empty($username)) {
                IS_AJAX && $this->ajaxReturn(0, L('please_input').L('password'));
                $this->error(L('please_input').L('password'));
            }
            //连接用户中心
            $passport = $this->_user_server();
            $uid = $passport->auth($username, $password);
            if (!$uid) {
                IS_AJAX && $this->ajaxReturn(0, $passport->get_error());
                $this->error($passport->get_error());
            }
            //登陆
            $this->visitor->login($uid, $remember);
            //登陆完成钩子
            $tag_arg = array('uid'=>$uid, 'uname'=>$username, 'action'=>'login');
            tag('login_end', $tag_arg);
            //同步登陆
            $synlogin = $passport->synlogin($uid);
            if (IS_AJAX) {
                $this->ajaxReturn(1, L('login_successe').$synlogin);
            } else {
                //跳转到登陆前页面（执行同步操作）
                $ret_url = $this->_post('ret_url', 'trim');
                $this->success(L('login_successe').$synlogin, $ret_url);
            }
        } else {
            /* 同步退出外部系统 */
            if (!empty($_GET['synlogout'])) {
                $passport = $this->_user_server();
                $synlogout = $passport->synlogout();
            }
            if (IS_AJAX) {
                $resp = $this->fetch('dialog:login');
                $this->ajaxReturn(1, '', $resp);
            } else {
                //来路
                $ret_url = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : __APP__;
                $this->assign('ret_url', $ret_url);
                $this->assign('synlogout', $synlogout);
                $this->_config_seo();
                $this->display();
            }
        }
    }
    
   
    /**
     * 用户退出
     */
    public function logout() {
        $this->visitor->logout();
        //同步退出
        $passport = $this->_user_server();
        $synlogout = $passport->synlogout();
        //跳转到退出前页面（执行同步操作）
        //取商家token值，取不到则默认为空
        $tokenTall = $this->getTokenTall();
        $this->assign('tokenTall',$tokenTall);
        $this->success(L('logout_successe').$synlogout, U('shangjia/index',array('tokenTall'=>$tokenTall)));
    }

    /**
    * 基本信息修改
    */
    public function index() {
    	//取商家token值，取不到则默认为空
    	$tokenTall = $this->getTokenTall();
 	
        $item_order=M('item_order');
        $order_detail=M('order_detail');
        if(!isset($_GET['status']))
        {
      	    $status=1;
        }
        else
        {
      	    $status=$_GET['status'];
        }
      
        $item_orders= $item_order->order('id desc')->where(array('status'=>$status,userId=>$this->visitor->info['id']))->select();
        foreach ($item_orders as $key=>$val)
        {
      		$order_details = $order_detail->where("orderId='".$val['orderId']."'")->select();
	      	foreach ($order_details as $val)
	      	{
	      		$items = array('title'=>$val['title'],'img'=>$val['img'],'price'=>$val['price'],'quantity'=>$val['quantity'],'itemId'=>$val['itemId'],'size'=>$val['size'],'color'=>$val['color']);
	      		$item_orders[$key]['items'][] = $items;
	      	}
        }
      
       $this->assign('item_orders',$item_orders);
       $this->assign('status',$status);
       $this->assign('tokenTall',$tokenTall);
       $this->_config_seo();
       $this->display();
    }


    /**
     * 修改密码
     */
    public function password() {
        if( IS_POST ){
            $oldpassword = $this->_post('oldpassword','trim');
            $password   = $this->_post('password','trim');
            $repassword = $this->_post('repassword','trim');
            !$password && $this->error(L('no_new_password'));
            $password != $repassword && $this->error(L('inconsistent_password'));
            $passlen = strlen($password);
            if ($passlen < 6 || $passlen > 20) {
                $this->error('password_length_error');
            }
            //连接用户中心
            $passport = $this->_user_server();
            $result = $passport->edit($this->visitor->info['id'], $oldpassword, array('password'=>$password));
            if ($result) {
                $msg = array('status'=>1, 'info'=>L('edit_password_success'));
            } else {
                $msg = array('status'=>0, 'info'=>$passport->get_error());
            }
            $this->assign('msg', $msg);
        }
        $this->_config_seo();
        $this->display();
    }

   
}