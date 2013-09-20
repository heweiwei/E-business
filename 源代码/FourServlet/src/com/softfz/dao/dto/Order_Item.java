package com.softfz.dao.dto;
/**
 * 订单明细
 * @author Administrator
 *
 */
public class Order_Item {
	private int nid;  //编号
	private int nOrderId; //所属订单
	private int nMcId; //订购商品ID
	private String sMcName; //商品名称
	private String sDescription;//商品描述
	private String simg;//商品图片
	private int nCount;//商品数
	private double nprice;//商品价格
	private double nTotalPrice; //商品总价
	
	public Order_Item() {
	}

	public Order_Item(int nid, int orderNum, int mcId, String mcName,
			String description, String simg, int count, double nprice,
			double totalPrice) {
		this.nid = nid;
		nOrderId = orderNum;
		nMcId = mcId;
		sMcName = mcName;
		sDescription = description;
		this.simg = simg;
		nCount = count;
		this.nprice = nprice;
		nTotalPrice = totalPrice;
	}

	public int getNid() {
		return nid;
	}

	public void setNid(int nid) {
		this.nid = nid;
	}

	public int getnOrderId() {
		return nOrderId;
	}

	public void setnOrderId(int nOrderId) {
		this.nOrderId = nOrderId;
	}

	public int getnMcId() {
		return nMcId;
	}

	public void setnMcId(int nMcId) {
		this.nMcId = nMcId;
	}

	public String getsMcName() {
		return sMcName;
	}

	public void setsMcName(String sMcName) {
		this.sMcName = sMcName;
	}

	public String getsDescription() {
		return sDescription;
	}

	public void setsDescription(String sDescription) {
		this.sDescription = sDescription;
	}

	public String getSimg() {
		return simg;
	}

	public void setSimg(String simg) {
		this.simg = simg;
	}

	public int getnCount() {
		return nCount;
	}

	public void setnCount(int nCount) {
		this.nCount = nCount;
	}

	public double getNprice() {
		return nprice;
	}

	public void setNprice(double nprice) {
		this.nprice = nprice;
	}

	public double getnTotalPrice() {
		return nTotalPrice;
	}

	public void setnTotalPrice(double nTotalPrice) {
		this.nTotalPrice = nTotalPrice;
	}
	
}
