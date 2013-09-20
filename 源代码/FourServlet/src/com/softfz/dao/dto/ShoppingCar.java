package com.softfz.dao.dto;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.softfz.dao.impl.GoodsDao;
import com.softfz.util.Arith;
/**
 * 购物车
 * @author Administrator
 *
 */
public class ShoppingCar {
	private List<Goods> goodsList= new ArrayList();//商品列表
	private double totalPrice;//商品总金额
	private int totalCount;//商品总个数
	private static final GoodsDao goodsDao = new GoodsDao();
	
	/**
	 * 得到商品种类数
	 * @return 商品种类数
	 */
	public int getNMcSize(){//商品种类数
		return goodsList.size();
	}
	/**
	 * 得到购物车内的商品列表
	 * @return 商品列表
	 */
	public List<Goods> getGoodsList() {
		return goodsList;
	}
	/**
	 * 设置购物车内的商品列表
	 * @param goodsList 商品列表
	 */
	public void setGoodsList(List<Goods> goodsList) {
		this.goodsList = goodsList;
	}
	/**
	 * 得到购物车内商品总价
	 * @return 商品总价
	 */
	public double getTotalPrice() {
		double tmp=0;
		for(Goods goods:goodsList){
			tmp=Arith.add(tmp, goods.getTotalCount());
		}
		return tmp;
	}
	/**
	 * 设置购物车内商品总价
	 * @param totalPrice  商品总价
	 */
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	/**
	 * 得到购物车内商品总数量
	 * @return 商品总数量
	 */
	public int getTotalCount() {
		int tmp=0;
		for(Goods goods: goodsList){
			tmp+=goods.getCount();
		}
		return tmp;
	}
	/**
	 * 设置购物车内商品总数量
	 * @param totalCount 商品总数量
	 */
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	/**
	 * 添加物品
	 * @param  id 商品id
	 */
	public void addGoods(int id){
		boolean exist=false;
		for(Goods goods:goodsList){
			if(goods.getId()==id){//购物车中已存在
				goods.setCount(goods.getCount()+1);
				exist=true;
			}
		}
		if(!exist){//购物车中不存在
			Goods goods=goodsDao.getGoodsById(id);
			goods.setCount(1);
			goodsList.add(goods);
		}
	}
	/**
	 * 删除商品
	 * @param id 商品的id
	 */
	public void delGoods(int id){
		Goods g=null;
		for(Goods goods:goodsList){
			if(goods.getId()==id){
				g=goods;
				break;
			}
		}
		goodsList.remove(g);
	}
	public void updateGoodsNumber(int id,int count){
		for(Goods goods:goodsList){
			if(goods.getId()==id){
				goods.setCount(count);
				break;
			}
		}
	}
	/**
	 * 清空购物车
	 * 
	 */
	public void clearGoods(){
		goodsList.clear();
	}
}
