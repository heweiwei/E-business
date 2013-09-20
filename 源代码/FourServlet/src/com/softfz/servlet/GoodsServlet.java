package com.softfz.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;

import com.softfz.dao.dto.Goods;
import com.softfz.dao.impl.GoodsDao;
import com.softfz.dao.impl.TypeDao;
import com.softfz.dao.inf.IGoodsDao;
/**
 * 商品操作类，根据method来区分各种业务
 * method=divList 得到分页商品列表
 * method=List 根据条件查询得到的商品列表
 * method=detail 得到某个商品的详细信息
 * method=del 删除某个商品
 * method=getType 得到商品的大小类
 * method=add 增加商品
 * method=update 更新商品
 * 
 * 
 * @author wizard
 *
 */
public class GoodsServlet extends HttpServlet {

	public GoodsServlet() {
	}

	public void destroy() {
		super.destroy(); 
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String method=request.getParameter("method");
		if(method==null){
			method="";
		}
		String name =request.getParameter("name");
		String max=request.getParameter("max");
		String min=request.getParameter("min");
		GoodsDao  goodsDao= new GoodsDao();
		TypeDao typeDao=new TypeDao();
		if(method.equals("divList")){//分页
			//得到一页的商品列表
			List<Goods> goodsList= goodsDao.getGoodsList(request);
			request.setAttribute("goodsList", goodsList);
			//得到商品大小类
			Map map=typeDao.getMcType();
			String [][] type = (String[][])map.get("type");
			int [][] typeid=(int[][])map.get("typeid");	
			HttpSession session=request.getSession();
			session.setAttribute("type", type);
			session.setAttribute("typeid", typeid);
			
			request.getRequestDispatcher("/front/Goods_List.jsp").forward(request, response);
		}
		else if(method.equals("List")){//后台查询商品列表
			List<Goods> goodsList= goodsDao.getGoodsListBack(request);
			request.setAttribute("name", request.getParameter("name"));
			request.setAttribute("goodsList", goodsList);
			request.getRequestDispatcher("/back/goods/goods_list.jsp").forward(request, response);
		}
		else if(method.equals("detail")){//商品某个商品的详细信息
			int id= Integer.parseInt(request.getParameter("id"));
			Goods goods= goodsDao.getGoodsById(id);
			request.setAttribute("goods", goods);
			request.getRequestDispatcher("/front/detail.jsp").forward(request, response);
		}
		else if(method.equals("del")){//删除商品
			int id= Integer.parseInt(request.getParameter("id"));
			boolean flag=goodsDao.delGoodsById(id);
			String info="";
			if(flag){
				info="删除成功";
			}
			else{
				info="删除失败";
			}
			out.println("<script>alert('"+info+"')</script>");
			
			List<Goods> goodsList= goodsDao.getGoodsList();
			request.setAttribute("goodsList", goodsList);
			request.getRequestDispatcher("/back/goods/goods_list.jsp").forward(request, response);
		}
		else if(method.equals("getType")){//得到商品大小类
			Map map=typeDao.getMcType();
			String [][] type = (String[][])map.get("type");
			int [][] typeid=(int[][])map.get("typeid");	
			HttpSession session=request.getSession();
			session.setAttribute("type", type);
			session.setAttribute("typeid", typeid);
			request.getRequestDispatcher("/back/goods/addGoods.jsp").forward(request, response);
		}
		else if(method.equals("add")){//增加商品
			DiskFileUpload dfu= new DiskFileUpload();
			dfu.setSizeMax(1024*1024*100);
			dfu.setSizeThreshold(4096);
			Map map= new HashMap();
			boolean flag=false;
			try {
				List<FileItem> list=dfu.parseRequest(request);//解析request，得到FileItem
				for (Iterator iterator = list.iterator(); iterator.hasNext();) {//迭代FileItem
					FileItem fileItem = (FileItem) iterator.next();
					if(fileItem.isFormField()){//如果FileItem是文本
						String filename=fileItem.getFieldName();//变量名
						String value = fileItem.getString();//变量值
						map.put(filename, value);
					}
					else{//如果FileItem是二进制文件
						String oldFilename= fileItem.getName();//得到上传文件的本地全路径
						String newFilename=null;
						if(oldFilename.equals("")){//文件为空时，不做上传图片操作
							newFilename=null;
						}
						else {
							newFilename=createNewFilename(oldFilename);//生成一个新不重复的文件名
							String path=this.getServletContext().getRealPath("/front/images/product/"+newFilename);//上传文件的路径
							fileItem.write(new File(path));//上传文件
						}
						map.put(fileItem.getFieldName(), newFilename);
					}
				}
				
				flag=goodsDao.addGoods(map);
				request.getRequestDispatcher("/servlet/GoodsServlet?method=List").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(method.equals("update")){//更新商品
			String id=request.getParameter("id");
			DiskFileUpload dfu= new DiskFileUpload();
			dfu.setSizeMax(1024*1024*100);
			dfu.setSizeThreshold(4096);
			Map map= new HashMap();
			map.put("id", id);
			boolean flag=false;
			try {
				List<FileItem> list=dfu.parseRequest(request);//解析request，得到FileItem
				for (Iterator iterator = list.iterator(); iterator.hasNext();) {//迭代FileItem
					FileItem fileItem = (FileItem) iterator.next();
					if(fileItem.isFormField()){//如果FileItem是文本
						String filename=fileItem.getFieldName();//变量名
						String value = fileItem.getString();//变量值
						map.put(filename, value);
					}
					else{//如果FileItem是二进制文件
						String oldFilename= fileItem.getName();//得到上传文件的本地全路径
						String newFilename=null;
						if(oldFilename.equals("")){//文件为空时，不做上传图片操作
							newFilename=null;
						}
						else{
							newFilename=createNewFilename(oldFilename);//生成一个新不重复的文件名
							String path=this.getServletContext().getRealPath("/front/images/product/"+newFilename);//上传文件的路径
							fileItem.write(new File(path));//上传文件
						}
						map.put(fileItem.getFieldName(), newFilename);
					}
				}
				if(map.get("picture")!=null){//如上传新图片，则将旧图片删除
					File file = new File(this.getServletContext().getRealPath("/front/images/product/"+map.get("oldpicture")));
					file.delete();
				}
				else {//没有上传新图片
					map.put("picture",map.get("oldpicture"));
				}
				
				flag=goodsDao.updateGoods(map);
				request.getRequestDispatcher("/servlet/GoodsServlet?method=List").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
	private String createNewFilename(String oldFilename) {
		String tmp="";
		tmp=String.valueOf(System.currentTimeMillis())+String.valueOf(new Random().nextInt(100));
		String newFilename=tmp+oldFilename.substring(oldFilename.lastIndexOf("."));
		return newFilename;
	}
	public void init() throws ServletException {
	}

}
