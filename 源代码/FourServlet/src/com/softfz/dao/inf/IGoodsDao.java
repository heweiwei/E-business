package com.softfz.dao.inf;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.softfz.dao.dto.Goods;

public interface IGoodsDao {
	/**
	 *  ͨ��ID������Ʒ
	 * @param id ��Ʒid
	 * @return ��Ʒ���� 
	 */
	public Goods getGoodsById(int id);
	/**
	 * ͨ��IDɾ����Ʒ
	 * @param id ��Ʒid
	 * @return �Ƿ�ɾ���ɹ�
	 */
	public boolean delGoodsById(int id);
	/**
	 * ������Ʒ�б�
	 * @return ��Ʒ�б�
	 */
	public List getGoodsList();
	/**
	 * ��̨������Ʒ�б�
	 * @param request
	 * @return ��Ʒ�б�
	 */
	public List getGoodsListBack(HttpServletRequest request);

	/**
	 * ͨ����������������Ʒ������Ϊname����request�У����ص�ҳ��Ʒ
	 * @param request
	 * @return ��Ʒ�б�
	 */
	public List getGoodsList(HttpServletRequest request);
	/**
	 * ������Ʒ
	 * @param map ������Ʒ����ļ���
	 * �õ��ļ��� name describ price picture smctag max min
	 * @return �Ƿ���ӳɹ�
	 */
	public boolean addGoods(Map map);
	/**
	 * ������Ʒ
	 * @param map ������Ʒ����ļ���
	 * �õ��ļ��� name describ price picture smctag max min
	 * @return �Ƿ���³ɹ�
	 */
	public boolean updateGoods(Map map);
}
