<?php
/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2019/1/9
 * Time: 14:46
 */

namespace app\order\controller;


use app\admin\controller\Base;
use think\Controller;

class Order extends Base
{

	public function index()
	{

		return view();
	}





	public function orderData()
	{
		$sendData = [
			"apkey"     => "0fa2e1b4-8c6c-06d8-7885-3cf7e2063121",
			"starttime" => date("Y-m-d H:i:s",strtotime("-1 day")),  //查询开始时间
			"span"      => 1200,    //查询日期间隔
			"page"      => 1,		//开始页码  1-100
			"pagesize"  => 100,   //每页条数 1-100
			"tkstatus"  => 1,    //订单状态，1: 全部订单，3：订单结算，12：订单付款， 13：订单失效，14：订单成功； 订单查询类型为‘结算时间’时，只能查订单结算状态
			"ordertype" => "create_time",  //订单查询类型，创建时间“create_time”，或结算时间“settle_time”
			"tbname"    => "wsy19880526",
		];
		$sendData = http_build_query($sendData);
		$url = "https://api.open.21ds.cn/apiv1/gettkorder?".$sendData;
//		$data = file_get_contents($url);
//		$list = json_decode($data, true);
		var_dump($url);exit();

	}





}