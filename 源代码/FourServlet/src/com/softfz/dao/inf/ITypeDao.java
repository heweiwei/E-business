package com.softfz.dao.inf;

import java.util.Map;

public interface ITypeDao {
	/**
	 * �õ���С��
	 * @return 
	 * Map�д���������ά���飬type���������֣�typeid������NID�����ֺ�NID�������е�λ��һһ��Ӧ
	 * PID������ �����������е�λ��
	 * ÿ��һά����ĵ�һ��λ�ô��PIDΪ0�����ࣨ��Ϊ���ࣩ������������Ӧ��С�� 
	 * �� ����������Ϊtype[0][0],���Ե�����Ϊtype[0][1],������idΪtypeid[0][0],���Ե�idΪtypeid[0][1]
	 * ����Ĵ�СΪ1024*1024�������������1024����ÿ��������������1023��С��
	 */
	public Map getMcType();
	/**
	 * ������Ʒ�Ĵ�С��
	 * @param pid ����id
	 * @param sname ����
	 * @return �Ƿ����ӳɹ�
	 */
	public boolean addMcType(String pid,String sname);
	/**
	 * ɾ����С��
	 * @param id ���id
	 * @return �Ƿ�ɾ���ɹ�
	 */
	public boolean delMcType(String id);
	/**
	 * ����������
	 * @param id ���id
	 * @param name ����
	 * @return �Ƿ���³ɹ�
	 */
	public boolean updateMcType(String id,String name);
}
