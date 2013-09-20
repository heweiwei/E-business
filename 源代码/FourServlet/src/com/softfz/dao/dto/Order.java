package com.softfz.dao.dto;
/**
 * ������
 * @author wizard
 *
 */
public class Order {
	
	private int nid;       //������
	private String scUser; //�µ��û���
	private String dgDate; //�µ�ʱ��
	private String sPayType; //���ʽ
	private String sSendType; //������ʽ
	private int nMcTypeSize; //��Ʒ������
	private String nMcSize; //��Ʒ�ܸ���
	private double nTotalPrice;//�����ܽ��
	private String sStatus; //���״̬
	private String sMsg; //��������
	private String saUser; //�����
	private String daDate; //���ʱ��
	private String ssName; //�ջ���
	private String ssAddress; //�ջ��˵�ַ
	private String ssCode; //�ջ����ʱ�
	private String ssPhone; //�ջ��˵绰
	private String ssEmail; //�ջ���Email
	
	public Order() {
	}

	public Order(int nid, String scUser, String dgDate, String payType,
			String sendType, int mcTypeSize, String mcSize, double totalPrice,
			String status, String msg, String saUser, String daDate,
			String ssName, String ssAddress, String ssCode, String ssPhone,
			String ssEmail) {
		this.nid = nid;
		this.scUser = scUser;
		this.dgDate = dgDate;
		sPayType = payType;
		sSendType = sendType;
		nMcTypeSize = mcTypeSize;
		nMcSize = mcSize;
		nTotalPrice = totalPrice;
		sStatus = status;
		sMsg = msg;
		this.saUser = saUser;
		this.daDate = daDate;
		this.ssName = ssName;
		this.ssAddress = ssAddress;
		this.ssCode = ssCode;
		this.ssPhone = ssPhone;
		this.ssEmail = ssEmail;
	}

	public int getNid() {
		return nid;
	}

	public void setNid(int nid) {
		this.nid = nid;
	}

	public String getScUser() {
		return scUser;
	}

	public void setScUser(String scUser) {
		this.scUser = scUser;
	}

	public String getDgDate() {
		return dgDate;
	}

	public void setDgDate(String dgDate) {
		this.dgDate = dgDate;
	}

	public String getSPayType() {
		return sPayType;
	}

	public void setSPayType(String payType) {
		sPayType = payType;
	}

	public String getSSendType() {
		return sSendType;
	}

	public void setSSendType(String sendType) {
		sSendType = sendType;
	}

	public int getNMcTypeSize() {
		return nMcTypeSize;
	}

	public void setNMcTypeSize(int mcTypeSize) {
		nMcTypeSize = mcTypeSize;
	}

	public String getNMcSize() {
		return nMcSize;
	}

	public void setNMcSize(String mcSize) {
		nMcSize = mcSize;
	}

	public double getNTotalPrice() {
		return nTotalPrice;
	}

	public void setNTotalPrice(double totalPrice) {
		nTotalPrice = totalPrice;
	}

	public String getSStatus() {
		return sStatus;
	}

	public void setSStatus(String status) {
		sStatus = status;
	}

	public String getSMsg() {
		return sMsg;
	}

	public void setSMsg(String msg) {
		sMsg = msg;
	}

	public String getSaUser() {
		return saUser;
	}

	public void setSaUser(String saUser) {
		this.saUser = saUser;
	}

	public String getDaDate() {
		return daDate;
	}

	public void setDaDate(String daDate) {
		this.daDate = daDate;
	}

	public String getSsName() {
		return ssName;
	}

	public void setSsName(String ssName) {
		this.ssName = ssName;
	}

	public String getSsAddress() {
		return ssAddress;
	}

	public void setSsAddress(String ssAddress) {
		this.ssAddress = ssAddress;
	}

	public String getSsCode() {
		return ssCode;
	}

	public void setSsCode(String ssCode) {
		this.ssCode = ssCode;
	}

	public String getSsPhone() {
		return ssPhone;
	}

	public void setSsPhone(String ssPhone) {
		this.ssPhone = ssPhone;
	}

	public String getSsEmail() {
		return ssEmail;
	}

	public void setSsEmail(String ssEmail) {
		this.ssEmail = ssEmail;
	}
	
	
}
