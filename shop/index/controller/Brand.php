<?php
namespace app\index\controller;
use app\common\controller\HomeBase;
class Brand extends HomeBase
{
    public function index()
    {    		
		
		$this->assign('empty', '~~暂无数据');
		
		$this->assign('list', osc_goods()->get_brand_goods_list(input('param.'),20,'g.goods_id,g.name,g.image,g.price,gtc.category_id'));
		
		
		return $this->fetch();
   
    }
}
