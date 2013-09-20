package com.softfz.dao.dto;

import com.softfz.util.Arith;
/**
 * 商品类
 * @author Administrator
 *
 */
public class Goods {
	private int id; //商品id
	private String name;//商品名
	private int count;//商品数量
	private double price;//商品价格
	private double totalCount;//商品总价 单价*数量
	
	private String smcTag; //是否缺货
	private String addTime;//增加时间
	private String describ ;//商品描述
	private String picture ;//商品图片
	private String max;//所属大类
	private String min;//所属小类
	
	public Goods() {
	}
	public Goods(int id, String name, int count, double price) {
		this.id = id;
		this.name = name;
		this.count = count;
		this.price = price;
	}
	/**
	 * 得到商品大类
	 * @return String
	 */
	public String getMax() {
		return max;
	}
	/**
	 * 设置商品大类
	 * @param max 商品大类
	 */
	public void setMax(String max) {
		this.max = max;
	}
	/**
	 * 得到商品小类
	 * @return String
	 */
	public String getMin() {
		return min;
	}
	/**
	 * 设置商品小类
	 * @param min 商品小类
	 */
	public void setMin(String min) {
		this.min = min;
	}
	/**
	 * 得到是否缺货
	 * @return String
	 */
	public String getSmcTag() {
		return smcTag;
	}
	/**
	 * 设置是否缺货
	 * @param smcTag 是否缺货，不缺为n，缺货为y
	 */
	public void setSmcTag(String smcTag) {
		this.smcTag = smcTag;
	}
	/**
	 * 得到商品添加的时间
	 * @return String
	 */
	public String getAddTime() {
		return addTime;
	}
	/**
	 * 设置商品添加的时间
	 * @param addTime 商品添加的时间
	 */
	public void setAddTime(String addTime) {
		this.addTime = addTime;
	}
	/**
	 * 得到商品的描述信息
	 * @return String
	 */
	public String getDescrib() {
		return describ;
	}
	/**
	 * 设置商品的描述信息
	 * @param describ 商品描述信息
	 */
	public void setDescrib(String describ) {
		this.describ = describ;
	}
	/**
	 * 得到商品的图片名称
	 * @return String
	 */
	public String getPicture() {
		return picture;
	}
	/**
	 * 设置商品的图片名称
	 * @param picture 图片名称
	 */
	public void setPicture(String picture) {
		this.picture = picture;
	}
	/**
	 * 设置商品的总价
	 * @param totalCount 商品总价
	 */
	public void setTotalCount(double totalCount) {
		this.totalCount = totalCount;
	}
	/**
	 * 得到商品的数量
	 * @return int
	 */
	public int getCount() {
		return count;
	}
	/**
	 * 设置商品的数量
	 * @param count 商品数量
	 */
	public void setCount(int count) {
		this.count = count;
	}
	/**
	 * 得到商品的id
	 * @return int
	 */
	public int getId() {
		return id;
	}
	/**
	 * 设置商品的id
	 * @param id 商品的id
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * 得到商品的名称
	 * @return String
	 */
	public String getName() {
		return name;
	}
	/**
	 * 设置商品的名称
	 * @param name 商品的名称
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 得到商品的价格
	 * @return double
	 */
	public double getPrice() {
		return price;
	}
	/**
	 * 设置商品的价格
	 * @param price 商品的价格
	 */
	public void setPrice(double price) {
		this.price = price;
	}
	/**
	 * 得到商品的总价
	 * @return double
	 */
	public double getTotalCount(){
		return Arith.mul(count, price);
	}
	
}
