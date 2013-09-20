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
 * ��Ʒ�����࣬����method�����ָ���ҵ��
 * method=divList �õ���ҳ��Ʒ�б�
 * method=List ����������ѯ�õ�����Ʒ�б�
 * method=detail �õ�ĳ����Ʒ����ϸ��Ϣ
 * method=del ɾ��ĳ����Ʒ
 * method=getType �õ���Ʒ�Ĵ�С��
 * method=add ������Ʒ
 * method=update ������Ʒ
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
		if(method.equals("divList")){//��ҳ
			//�õ�һҳ����Ʒ�б�
			List<Goods> goodsList= goodsDao.getGoodsList(request);
			request.setAttribute("goodsList", goodsList);
			//�õ���Ʒ��С��
			Map map=typeDao.getMcType();
			String [][] type = (String[][])map.get("type");
			int [][] typeid=(int[][])map.get("typeid");	
			HttpSession session=request.getSession();
			session.setAttribute("type", type);
			session.setAttribute("typeid", typeid);
			
			request.getRequestDispatcher("/front/Goods_List.jsp").forward(request, response);
		}
		else if(method.equals("List")){//��̨��ѯ��Ʒ�б�
			List<Goods> goodsList= goodsDao.getGoodsListBack(request);
			request.setAttribute("name", request.getParameter("name"));
			request.setAttribute("goodsList", goodsList);
			request.getRequestDispatcher("/back/goods/goods_list.jsp").forward(request, response);
		}
		else if(method.equals("detail")){//��Ʒĳ����Ʒ����ϸ��Ϣ
			int id= Integer.parseInt(request.getParameter("id"));
			Goods goods= goodsDao.getGoodsById(id);
			request.setAttribute("goods", goods);
			request.getRequestDispatcher("/front/detail.jsp").forward(request, response);
		}
		else if(method.equals("del")){//ɾ����Ʒ
			int id= Integer.parseInt(request.getParameter("id"));
			boolean flag=goodsDao.delGoodsById(id);
			String info="";
			if(flag){
				info="ɾ���ɹ�";
			}
			else{
				info="ɾ��ʧ��";
			}
			out.println("<script>alert('"+info+"')</script>");
			
			List<Goods> goodsList= goodsDao.getGoodsList();
			request.setAttribute("goodsList", goodsList);
			request.getRequestDispatcher("/back/goods/goods_list.jsp").forward(request, response);
		}
		else if(method.equals("getType")){//�õ���Ʒ��С��
			Map map=typeDao.getMcType();
			String [][] type = (String[][])map.get("type");
			int [][] typeid=(int[][])map.get("typeid");	
			HttpSession session=request.getSession();
			session.setAttribute("type", type);
			session.setAttribute("typeid", typeid);
			request.getRequestDispatcher("/back/goods/addGoods.jsp").forward(request, response);
		}
		else if(method.equals("add")){//������Ʒ
			DiskFileUpload dfu= new DiskFileUpload();
			dfu.setSizeMax(1024*1024*100);
			dfu.setSizeThreshold(4096);
			Map map= new HashMap();
			boolean flag=false;
			try {
				List<FileItem> list=dfu.parseRequest(request);//����request���õ�FileItem
				for (Iterator iterator = list.iterator(); iterator.hasNext();) {//����FileItem
					FileItem fileItem = (FileItem) iterator.next();
					if(fileItem.isFormField()){//���FileItem���ı�
						String filename=fileItem.getFieldName();//������
						String value = fileItem.getString();//����ֵ
						map.put(filename, value);
					}
					else{//���FileItem�Ƕ������ļ�
						String oldFilename= fileItem.getName();//�õ��ϴ��ļ��ı���ȫ·��
						String newFilename=null;
						if(oldFilename.equals("")){//�ļ�Ϊ��ʱ�������ϴ�ͼƬ����
							newFilename=null;
						}
						else {
							newFilename=createNewFilename(oldFilename);//����һ���²��ظ����ļ���
							String path=this.getServletContext().getRealPath("/front/images/product/"+newFilename);//�ϴ��ļ���·��
							fileItem.write(new File(path));//�ϴ��ļ�
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
		else if(method.equals("update")){//������Ʒ
			String id=request.getParameter("id");
			DiskFileUpload dfu= new DiskFileUpload();
			dfu.setSizeMax(1024*1024*100);
			dfu.setSizeThreshold(4096);
			Map map= new HashMap();
			map.put("id", id);
			boolean flag=false;
			try {
				List<FileItem> list=dfu.parseRequest(request);//����request���õ�FileItem
				for (Iterator iterator = list.iterator(); iterator.hasNext();) {//����FileItem
					FileItem fileItem = (FileItem) iterator.next();
					if(fileItem.isFormField()){//���FileItem���ı�
						String filename=fileItem.getFieldName();//������
						String value = fileItem.getString();//����ֵ
						map.put(filename, value);
					}
					else{//���FileItem�Ƕ������ļ�
						String oldFilename= fileItem.getName();//�õ��ϴ��ļ��ı���ȫ·��
						String newFilename=null;
						if(oldFilename.equals("")){//�ļ�Ϊ��ʱ�������ϴ�ͼƬ����
							newFilename=null;
						}
						else{
							newFilename=createNewFilename(oldFilename);//����һ���²��ظ����ļ���
							String path=this.getServletContext().getRealPath("/front/images/product/"+newFilename);//�ϴ��ļ���·��
							fileItem.write(new File(path));//�ϴ��ļ�
						}
						map.put(fileItem.getFieldName(), newFilename);
					}
				}
				if(map.get("picture")!=null){//���ϴ���ͼƬ���򽫾�ͼƬɾ��
					File file = new File(this.getServletContext().getRealPath("/front/images/product/"+map.get("oldpicture")));
					file.delete();
				}
				else {//û���ϴ���ͼƬ
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
