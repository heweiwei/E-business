package com.softfz.dao.inf;

import java.util.Map;

public interface ITypeDao {
	/**
	 * 得到大小类
	 * @return 
	 * Map中存有两个二维数组，type数组存放名字，typeid数组存放NID，名字和NID在数组中的位置一一对应
	 * PID体现在 数据在数组中的位置
	 * 每个一维数组的第一个位置存放PID为0的种类（即为大类），后面存放他相应的小类 
	 * 如 电器的名字为type[0][0],电脑的名字为type[0][1],电器的id为typeid[0][0],电脑的id为typeid[0][1]
	 * 数组的大小为1024*1024，即大类最多有1024个，每个大类中最多包含1023个小类
	 */
	public Map getMcType();
	/**
	 * 增加商品的大小类
	 * @param pid 父类id
	 * @param sname 类名
	 * @return 是否增加成功
	 */
	public boolean addMcType(String pid,String sname);
	/**
	 * 删除大小类
	 * @param id 类的id
	 * @return 是否删除成功
	 */
	public boolean delMcType(String id);
	/**
	 * 更新种类名
	 * @param id 类的id
	 * @param name 类名
	 * @return 是否更新成功
	 */
	public boolean updateMcType(String id,String name);
}
