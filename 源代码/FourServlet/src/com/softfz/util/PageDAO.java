package com.softfz.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import com.softfz.dao.db.SqlServerConn;;
/**
 * ��ҳ���߰�
 * @author Administrator
 *
 */
public class PageDAO {
	public static final String Text = "text"; //���ַ�ҳ

	public static final String Image = "image";//ͼƬ��ҳ

	public static final String BbsText = "bbstext";//��̳��ʽ��ҳ

	public static final String BbsImage = "bbsimage";//��̳ͼƬ��ʽ��ҳ

	private HttpServletRequest request;

	private int currentpage = 1; // ��ǰ�ǵڼ�ҳ

	private int pagecount = 0; // һ���ж���ҳ

	private int rscount = 0; // һ���ж�����

	private int pagesize = 20; // ÿҳ�ж�����[Ĭ��Ϊ20��]

	public PageDAO(HttpServletRequest request) {
		this.request = request;
	}

	public int getCurrentpage() {
		return currentpage;
	}

	public void setCurrentpage(int currentpage) {
		this.currentpage = currentpage;
	}

	public int getPagecount() {
		return pagecount;
	}

	public void setPagecount(int pagecount) {
		this.pagecount = pagecount;
	}

	public int getPagesize() {
		return pagesize;
	}

	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}

	public int getRscount() {
		return rscount;
	}

	public void setRscount(int rscount) {
		this.rscount = rscount;
	}

	/**
	 * ����SQL����ȡ�ܼ�¼��
	 */
	public int getRsCountForRs(String sql) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = SqlServerConn.getConn();
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				rs.last();
				this.rscount = rs.getRow();
			} else {
				this.rscount = 0;
			}

		} catch (Exception ex) {
			ex.printStackTrace();
			this.rscount = 0;
		} finally {
			SqlServerConn.ConnClose(conn,stmt,rs);
		}
		return this.rscount;
	}

	public int getRsCountForSQL(String sql) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = SqlServerConn.getConn();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				this.rscount = rs.getInt("num");//numΪSQL�����ָ����select count(id) num from.....
			} else {
				this.rscount = 0;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			this.rscount = 0;
		} finally {
			SqlServerConn.ConnClose(conn,stmt,rs);
		}
		return this.rscount;
	}

	/**
	 * ��ȡ��ҳ��
	 * 
	 * @return int
	 */
	public int getPageCount() {
		try {
			this.pagecount = ((this.rscount - 1) / this.pagesize) + 1;
		} catch (Exception ex) {
			this.pagecount = 0;
		}
		return this.pagecount;
	}

	/**
	 * ��ȡ��ǰҳ�������
	 * 
	 * @return int
	 */
	public int getCurrentPage() {
		try {
			if (this.request.getParameter("currentpage") != null
					&& Integer.parseInt(this.request
							.getParameter("currentpage")) > 1) {
				this.currentpage = Integer.parseInt(this.request
						.getParameter("currentpage"));
			} else {
				this.currentpage = 1;
			}
		} catch (Exception ex) {
			this.currentpage = 1;
		}
		return this.currentpage;
	}

	/**
	 * ��ҳ������
	 * 
	 * @param flag
	 *            
	 * @return String
	 */
	public String pagetool(String flag) {
		StringBuffer str = new StringBuffer();
		String temp = "";
		String url = this.getParamUrl();
		int ProPage = this.currentpage - 1;
		int Nextpage = this.currentpage + 1;
		// ���ֵķ�ҳ
		if (flag.equals(PageDAO.Text)) {
			str.append("<form method='post' name='pageform' action=''>");
			str
					.append("<table width='100%' border='0' cellspacing='0' cellpadding='0'>");
			str.append("<tr>");
			str.append("<td width='3%'>&nbsp;</td>");
			str.append("<td height='26'>");
			str.append("���м�¼" + this.rscount + "��&nbsp;&nbsp;&nbsp;");
			str.append("��" + this.pagecount + "ҳ&nbsp;&nbsp;&nbsp;");
			str.append("ÿҳ" + this.pagesize + "��¼&nbsp;&nbsp;&nbsp;");
			str.append("����" + this.currentpage + "/" + this.pagecount + "ҳ");
			str.append("</td><td>");
			if (this.currentpage > 1) {
				str.append("<a href='" + url + "&currentpage=1'>��ҳ</a>");
				str.append("&nbsp;&nbsp;&nbsp;");
				str.append("<a href='" + url + "&currentpage=" + ProPage
						+ "'>��һҳ</a>");
				str.append("&nbsp;&nbsp;&nbsp;");
			} else {
				str.append("��ҳ");
				str.append("&nbsp;&nbsp;&nbsp;");
				str.append("��һҳ");
				str.append("&nbsp;&nbsp;&nbsp;");
			}
			if (this.currentpage < this.pagecount) {
				str.append("<a href='" + url + "&currentpage=" + Nextpage
						+ "'>��һҳ</a>");
				str.append("&nbsp;&nbsp;&nbsp;");
			} else {
				str.append("��һҳ");
				str.append("&nbsp;&nbsp;&nbsp;");
			}
			if (this.pagecount > 1 && this.currentpage != this.pagecount) {
				str.append("<a href='" + url + "&currentpage=" + pagecount
						+ "'>βҳ</a>");
				str.append("&nbsp;&nbsp;&nbsp;");
			} else {
				str.append("βҳ");
				str.append("&nbsp;&nbsp;&nbsp;");
			}
			str.append("ת��");
			str
					.append("<select name='currentpage' onchange='javascript:ChangePage(this.value);'>");
			for (int j = 1; j <= pagecount; j++) {
				str.append("<option value='" + j + "'");
				if (currentpage == j) {
					str.append("selected");
				}
				str.append(">");
				str.append("" + j + "");
				str.append("</option>");
			}
			str.append("</select>ҳ");
			str.append("</td><td width='3%'>&nbsp;</td></tr></table>");
			str.append("<script language='javascript'>");
			str.append("function ChangePage(testpage){");
			str.append("document.pageform.action='" + url
					+ "&currentpage='+testpage+'';");
			str.append("document.pageform.submit();");
			str.append("}");
			str.append("</script>");
			str.append("</form>");
		} else if (flag.equals(PageDAO.Image)) {
			/**
			 * ͼƬ�ķ�ҳ
			 */

		} else if (flag.equals(PageDAO.BbsText)) {
			/**
			 * ��̳��ʽ�ķ�ҳ[ֱ�������ַ�ʽ����]
			 */
			str.append("<table width='100%' border='0' cellspacing='0' cellpadding='0'>");
			str.append("<tr>");
			str.append("<td width='3%'>&nbsp;</td>");
			str.append("<td height='26'>");
			str.append("��¼" + this.rscount + "��&nbsp;&nbsp;");
			str.append("��" + this.pagecount + "ҳ&nbsp;&nbsp;");
			str.append("ÿҳ" + this.pagesize + "��¼&nbsp;&nbsp;");
			str.append("����" + this.currentpage + "/" + this.pagecount + "ҳ");
			str.append("</td><td>");
			// �趨�Ƿ�����ҳ������
			if (this.currentpage > 1) {
				str.append("<a href='" + url + "&currentpage=1'>��ҳ</a>");
				str.append("&nbsp;&nbsp;");
			}
			// �趨�Ƿ�����һҳ������
			if (this.currentpage > 1) {
				str.append("<a href='" + url + "&currentpage=" + ProPage
						+ "'>��һҳ</a>");
				str.append("&nbsp;&nbsp;&nbsp;");
			}
			// �����ҳ��ֻ��10�Ļ�
			if (this.pagecount <= 10) {
				for (int i = 1; i <= this.pagecount; i++) {
					if (this.currentpage == i) {
						str.append("<font color=red>[" + i
								+ "]</font>&nbsp;&nbsp;");
					} else {
						str.append("<a href='" + url + "&currentpage=" + i
								+ "'>" + i + "</a>&nbsp;&nbsp;");
					}
				}
			} else {
				// ˵�������г���10ҳ
				// �ƶ��ػ��Ŀ�ʼҳ�ͽ���ҳ

				int endPage = this.currentpage + 4;
				if (endPage > this.pagecount) {
					endPage = this.pagecount;
				}
				int startPage = 0;
				if (this.pagecount >= 8 && this.currentpage >= 8) {
					startPage = this.currentpage - 5;
				} else {
					// ��ʾ�ӵ�һҳ��ʼ��
					startPage = 1;
				}
				System.out.println(startPage);
				System.out.println(endPage);
				for (int i = startPage; i <= endPage; i++) {
					if (this.currentpage == i) {
						str.append("<font color=red>[" + i
								+ "]</font>&nbsp;&nbsp;");
					} else {
						str.append("<a href='" + url + "&currentpage=" + i
								+ "'>" + i + "</a>&nbsp;&nbsp;");
					}
				}
			}
			// �趨�Ƿ�����һҳ������
			if (this.currentpage < this.pagecount) {
				str.append("<a href='" + url + "&currentpage=" + Nextpage
						+ "'>��һҳ</a>");
				str.append("&nbsp;&nbsp;");
			}
			// �趨�Ƿ���βҳ������
			if (this.pagecount > 1 && this.currentpage != this.pagecount) {
				str.append("<a href='" + url + "&currentpage=" + pagecount
						+ "'>βҳ</a>");
				str.append("&nbsp;&nbsp;");
			}

			str.append("</td><td width='3%'>&nbsp;</td></tr></table>");
		} else if (flag.equals(PageDAO.BbsImage)) {
			/**
			 * ��̳��ʽ�ķ�ҳ[��ͼƬ�ķ�ʽ����]
			 */
			// �趨��ҳ��ʾ��CSS
			str.append("<style>");
			str.append("BODY {FONT-SIZE: 12px;FONT-FAMILY:����;WIDTH: 60%; PADDING-LEFT: 25px;}");
			str.append("DIV.meneame {PADDING-RIGHT: 3px; PADDING-LEFT: 3px; FONT-SIZE: 80%; PADDING-BOTTOM: 3px; MARGIN: 3px; COLOR: #ff6500; PADDING-TOP: 3px; TEXT-ALIGN: center}");
			str.append("DIV.meneame A {BORDER-RIGHT: #ff9600 1px solid; PADDING-RIGHT: 7px; BACKGROUND-POSITION: 50% bottom; BORDER-TOP: #ff9600 1px solid; PADDING-LEFT: 7px; BACKGROUND-IMAGE: url('"
							+ this.request.getContextPath()
							+ "/meneame.jpg'); PADDING-BOTTOM: 5px; BORDER-LEFT: #ff9600 1px solid; COLOR: #ff6500; MARGIN-RIGHT: 3px; PADDING-TOP: 5px; BORDER-BOTTOM: #ff9600 1px solid; TEXT-DECORATION: none}");
			str.append("DIV.meneame A:hover {BORDER-RIGHT: #ff9600 1px solid; BORDER-TOP: #ff9600 1px solid; BACKGROUND-IMAGE: none; BORDER-LEFT: #ff9600 1px solid; COLOR: #ff6500; BORDER-BOTTOM: #ff9600 1px solid; BACKGROUND-COLOR: #ffc794}");
			str.append("DIV.meneame SPAN.current {BORDER-RIGHT: #ff6500 1px solid; PADDING-RIGHT: 7px; BORDER-TOP: #ff6500 1px solid; PADDING-LEFT: 7px; FONT-WEIGHT: bold; PADDING-BOTTOM: 5px; BORDER-LEFT: #ff6500 1px solid; COLOR: #ff6500; MARGIN-RIGHT: 3px; PADDING-TOP: 5px; BORDER-BOTTOM: #ff6500 1px solid; BACKGROUND-COLOR: #ffbe94}");
			str.append("DIV.meneame SPAN.disabled {BORDER-RIGHT: #ffe3c6 1px solid; PADDING-RIGHT: 7px; BORDER-TOP: #ffe3c6 1px solid; PADDING-LEFT: 7px; PADDING-BOTTOM: 5px; BORDER-LEFT: #ffe3c6 1px solid; COLOR: #ffe3c6; MARGIN-RIGHT: 3px; PADDING-TOP: 5px; BORDER-BOTTOM: #ffe3c6 1px solid}");
			str.append("</style>");
			str.append("<div class=\"meneame\">");
			// �ж��Ƿ�����һҳ
			if (this.currentpage > 1) {
				str.append("<a href='" + url
						+ "&currentpage=1' hidefocus=\"true\">��ҳ</a>");
				str.append("&nbsp;&nbsp;&nbsp;");
				str.append("<a href='" + url + "&currentpage=" + ProPage
						+ "' hidefocus=\"true\">��һҳ</a>");
				str.append("&nbsp;&nbsp;&nbsp;");
			} else {
				str.append("<span class=\"disabled\">��ҳ</span>");
				str.append("&nbsp;&nbsp;");
				str.append("<span class=\"disabled\">��һҳ</span>");
				str.append("&nbsp;&nbsp;");
			}
			// ��ʾ�м��ͼƬ
			if (this.pagecount <= 10) {
				for (int i = 1; i <= this.pagecount; i++) {
					if (this.currentpage == i) {
						str.append("<span class=\"current\">" + i + "</span>");
					} else {
						str.append("<a href='" + url + "&currentpage=" + i
								+ "' hidefocus=\"true\">" + i
								+ "</a>&nbsp;&nbsp;");
					}
				}
			} else {
				// ˵�������г���10ҳ
				// �ƶ��ػ��Ŀ�ʼҳ�ͽ���ҳ
				int endPage = this.currentpage + 4;
				if (endPage > this.pagecount) {
					endPage = this.pagecount;
				}
				int startPage = 0;
				if (this.pagecount >= 8 && this.currentpage >= 8) {
					startPage = this.currentpage - 5;
				} else {
					// ��ʾ�ӵ�һҳ��ʼ��
					startPage = 1;
				}
				System.out.println(startPage);
				System.out.println(endPage);
				for (int i = startPage; i <= endPage; i++) {
					if (this.currentpage == i) {
						str.append("<span class=\"current\">" + i + "</span>");
					} else {
						str.append("<a href='" + url + "&currentpage=" + i
								+ "' hidefocus=\"true\">" + i
								+ "</a>&nbsp;&nbsp;");
					}
				}
			}

			// �ж���һҳ��βҳ
			if (this.currentpage < this.pagecount) {
				if (this.currentpage < this.pagecount - 10) {
					str.append("...");
					str.append("<a href='" + url + "&currentpage="
							+ (this.pagecount - 1) + "' hidefocus=\"true\">"
							+ (this.pagecount - 1) + "</a>&nbsp;&nbsp;");
					str.append("<a href='" + url + "&currentpage="
							+ this.pagecount + "' hidefocus=\"true\">"
							+ this.pagecount + "</a>&nbsp;&nbsp;");
				}

				str.append("<a href='" + url + "&currentpage=" + Nextpage
						+ "' hidefocus=\"true\">��һҳ</a>");
				str.append("&nbsp;&nbsp;");
			} else {
				str.append("<span class=\"disabled\">��һҳ</span>");
				str.append("&nbsp;&nbsp;");
			}
			if (this.pagecount > 1 && this.currentpage != this.pagecount) {
				str.append("<a href='" + url + "&currentpage=" + pagecount
						+ "' hidefocus=\"true\">βҳ</a>");
				str.append("&nbsp;&nbsp;");
			} else {
				str.append("<span class=\"disabled\">βҳ</span>");
				str.append("&nbsp;&nbsp;");
			}
			str.append("</div>");
		}
		return str.toString();
	}

	public String getParamUrl() {
		String url = "";
		url = this.request.getRequestURI().toString();
		if (url.indexOf("?") == -1) {
			url = url + "?";
		}
		String totalParams = "";
		Enumeration params = this.request.getParameterNames();// �õ����в�����
		while (params.hasMoreElements()) {
			String tempName = params.nextElement().toString();
			String tempValue = this.request.getParameter(tempName);
			if (tempValue != null && !tempValue.equals("")
					&& !tempName.equals("currentpage")) {
				if (totalParams.equals("")) {

					totalParams = totalParams + tempName + "=" + tempValue;
				} else {
					totalParams = totalParams + "&" + tempName + "="
							+ tempValue;
				}
			}
		}
		String totalUrl = url + totalParams;
		return totalUrl;
	}
}