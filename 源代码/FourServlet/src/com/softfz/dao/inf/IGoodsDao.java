package com.softfz.dao.inf;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.softfz.dao.dto.Goods;

public interface IGoodsDao {
	/**
	 *  通过ID查找商品
	 * @param id 商品id
	 * @return 商品对象 
	 */
	public Goods getGoodsById(int id);
	/**
	 * 通过ID删除商品
	 * @param id 商品id
	 * @return 是否删除成功
	 */
	public boolean delGoodsById(int id);
	/**
	 * 返回商品列表
	 * @return 商品列表
	 */
	public List getGoodsList();
	/**
	 * 后台返回商品列表
	 * @param request
	 * @return 商品列表
	 */
	public List getGoodsListBack(HttpServletRequest request);

	/**
	 * 通过查找条件查找商品，条件为name，在request中，返回单页商品
	 * @param request
	 * @return 商品列表
	 */
	public List getGoodsList(HttpServletRequest request);
	/**
	 * 增加商品
	 * @param map 含有商品对象的集合
	 * 用到的键有 name describ price picture smctag max min
	 * @return 是否添加成功
	 */
	public boolean addGoods(Map map);
	/**
	 * 更新商品
	 * @param map 含有商品对象的集合
	 * 用到的键有 name describ price picture smctag max min
	 * @return 是否更新成功
	 */
	public boolean updateGoods(Map map);
}
