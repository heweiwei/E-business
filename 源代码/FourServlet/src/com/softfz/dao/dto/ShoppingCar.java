package com.softfz.dao.dto;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.softfz.dao.impl.GoodsDao;
import com.softfz.util.Arith;
/**
 * ���ﳵ
 * @author Administrator
 *
 */
public class ShoppingCar {
	private List<Goods> goodsList= new ArrayList();//��Ʒ�б�
	private double totalPrice;//��Ʒ�ܽ��
	private int totalCount;//��Ʒ�ܸ���
	private static final GoodsDao goodsDao = new GoodsDao();
	
	/**
	 * �õ���Ʒ������
	 * @return ��Ʒ������
	 */
	public int getNMcSize(){//��Ʒ������
		return goodsList.size();
	}
	/**
	 * �õ����ﳵ�ڵ���Ʒ�б�
	 * @return ��Ʒ�б�
	 */
	public List<Goods> getGoodsList() {
		return goodsList;
	}
	/**
	 * ���ù��ﳵ�ڵ���Ʒ�б�
	 * @param goodsList ��Ʒ�б�
	 */
	public void setGoodsList(List<Goods> goodsList) {
		this.goodsList = goodsList;
	}
	/**
	 * �õ����ﳵ����Ʒ�ܼ�
	 * @return ��Ʒ�ܼ�
	 */
	public double getTotalPrice() {
		double tmp=0;
		for(Goods goods:goodsList){
			tmp=Arith.add(tmp, goods.getTotalCount());
		}
		return tmp;
	}
	/**
	 * ���ù��ﳵ����Ʒ�ܼ�
	 * @param totalPrice  ��Ʒ�ܼ�
	 */
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	/**
	 * �õ����ﳵ����Ʒ������
	 * @return ��Ʒ������
	 */
	public int getTotalCount() {
		int tmp=0;
		for(Goods goods: goodsList){
			tmp+=goods.getCount();
		}
		return tmp;
	}
	/**
	 * ���ù��ﳵ����Ʒ������
	 * @param totalCount ��Ʒ������
	 */
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	/**
	 * �����Ʒ
	 * @param  id ��Ʒid
	 */
	public void addGoods(int id){
		boolean exist=false;
		for(Goods goods:goodsList){
			if(goods.getId()==id){//���ﳵ���Ѵ���
				goods.setCount(goods.getCount()+1);
				exist=true;
			}
		}
		if(!exist){//���ﳵ�в�����
			Goods goods=goodsDao.getGoodsById(id);
			goods.setCount(1);
			goodsList.add(goods);
		}
	}
	/**
	 * ɾ����Ʒ
	 * @param id ��Ʒ��id
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
	 * ��չ��ﳵ
	 * 
	 */
	public void clearGoods(){
		goodsList.clear();
	}
}
