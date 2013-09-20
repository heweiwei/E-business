package com.softfz.dao.dto;
/**
 * ������ϸ
 * @author Administrator
 *
 */
public class Order_Item {
	private int nid;  //���
	private int nOrderId; //��������
	private int nMcId; //������ƷID
	private String sMcName; //��Ʒ����
	private String sDescription;//��Ʒ����
	private String simg;//��ƷͼƬ
	private int nCount;//��Ʒ��
	private double nprice;//��Ʒ�۸�
	private double nTotalPrice; //��Ʒ�ܼ�
	
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
