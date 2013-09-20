package com.softfz.dao.dto;

import com.softfz.util.Arith;
/**
 * ��Ʒ��
 * @author Administrator
 *
 */
public class Goods {
	private int id; //��Ʒid
	private String name;//��Ʒ��
	private int count;//��Ʒ����
	private double price;//��Ʒ�۸�
	private double totalCount;//��Ʒ�ܼ� ����*����
	
	private String smcTag; //�Ƿ�ȱ��
	private String addTime;//����ʱ��
	private String describ ;//��Ʒ����
	private String picture ;//��ƷͼƬ
	private String max;//��������
	private String min;//����С��
	
	public Goods() {
	}
	public Goods(int id, String name, int count, double price) {
		this.id = id;
		this.name = name;
		this.count = count;
		this.price = price;
	}
	/**
	 * �õ���Ʒ����
	 * @return String
	 */
	public String getMax() {
		return max;
	}
	/**
	 * ������Ʒ����
	 * @param max ��Ʒ����
	 */
	public void setMax(String max) {
		this.max = max;
	}
	/**
	 * �õ���ƷС��
	 * @return String
	 */
	public String getMin() {
		return min;
	}
	/**
	 * ������ƷС��
	 * @param min ��ƷС��
	 */
	public void setMin(String min) {
		this.min = min;
	}
	/**
	 * �õ��Ƿ�ȱ��
	 * @return String
	 */
	public String getSmcTag() {
		return smcTag;
	}
	/**
	 * �����Ƿ�ȱ��
	 * @param smcTag �Ƿ�ȱ������ȱΪn��ȱ��Ϊy
	 */
	public void setSmcTag(String smcTag) {
		this.smcTag = smcTag;
	}
	/**
	 * �õ���Ʒ��ӵ�ʱ��
	 * @return String
	 */
	public String getAddTime() {
		return addTime;
	}
	/**
	 * ������Ʒ��ӵ�ʱ��
	 * @param addTime ��Ʒ��ӵ�ʱ��
	 */
	public void setAddTime(String addTime) {
		this.addTime = addTime;
	}
	/**
	 * �õ���Ʒ��������Ϣ
	 * @return String
	 */
	public String getDescrib() {
		return describ;
	}
	/**
	 * ������Ʒ��������Ϣ
	 * @param describ ��Ʒ������Ϣ
	 */
	public void setDescrib(String describ) {
		this.describ = describ;
	}
	/**
	 * �õ���Ʒ��ͼƬ����
	 * @return String
	 */
	public String getPicture() {
		return picture;
	}
	/**
	 * ������Ʒ��ͼƬ����
	 * @param picture ͼƬ����
	 */
	public void setPicture(String picture) {
		this.picture = picture;
	}
	/**
	 * ������Ʒ���ܼ�
	 * @param totalCount ��Ʒ�ܼ�
	 */
	public void setTotalCount(double totalCount) {
		this.totalCount = totalCount;
	}
	/**
	 * �õ���Ʒ������
	 * @return int
	 */
	public int getCount() {
		return count;
	}
	/**
	 * ������Ʒ������
	 * @param count ��Ʒ����
	 */
	public void setCount(int count) {
		this.count = count;
	}
	/**
	 * �õ���Ʒ��id
	 * @return int
	 */
	public int getId() {
		return id;
	}
	/**
	 * ������Ʒ��id
	 * @param id ��Ʒ��id
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * �õ���Ʒ������
	 * @return String
	 */
	public String getName() {
		return name;
	}
	/**
	 * ������Ʒ������
	 * @param name ��Ʒ������
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * �õ���Ʒ�ļ۸�
	 * @return double
	 */
	public double getPrice() {
		return price;
	}
	/**
	 * ������Ʒ�ļ۸�
	 * @param price ��Ʒ�ļ۸�
	 */
	public void setPrice(double price) {
		this.price = price;
	}
	/**
	 * �õ���Ʒ���ܼ�
	 * @return double
	 */
	public double getTotalCount(){
		return Arith.mul(count, price);
	}
	
}
