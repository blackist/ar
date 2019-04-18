/**  
* @Title: PageBean.java <br>
* @Package com.xzit.ar.common.page <br>
* @Description: TODO <br>
* @author Mr.Black <br>
* @date 2015年12月16日 上午12:26:36 <br>
* @version V1.0 <br>
*/
package com.xzit.ar.common.page;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName: Page <br>
 * @Description: TODO 分页Bean<br>
 * @author Mr.Black <br>
 * @date 2015年12月23日 下午8:08:26 <br>
 * @version V1.2 <br>
 * @param <T><br>
 */
public class Page<T> implements Serializable {

	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 当前页码
	 */
	private int pageIndex;

	/**
	 * 页面记录数
	 */
	private int pageSize;

	/**
	 * 总页数
	 */
	private int totalPages = 0;

	/**
	 * 总记录数
	 */
	private long totalRows = 0;

	/**
	 * 排序
	 */
	private String orderBy;

	/**
	 * 页码变化范围
	 */
	private int codeRange = 5;

	/**
	 * 页码集合
	 */
	private List<Integer> codeList = new ArrayList<Integer>();

	/**
	 * 记录集合
	 */
	private List<T> beanList;

	private T queryMap;

	/**
	 * Title: <br>
	 * Description:TODO <br>
	 * <br>
	 */
	public Page() {
		super();
	}

	/**
	 * Title: <br>
	 * Description:TODO <br>
	 * 
	 * @param pageIndex
	 * @param pageSize
	 *            <br>
	 */
	public Page(int pageIndex, int pageSize) {
		super();
		this.pageIndex = pageIndex;
		this.pageSize = pageSize;
	}

	/**
	 * Title: <br>
	 * Description:TODO <br>
	 * 
	 * @param pageIndex
	 * @param pageSize
	 * @param codeRange
	 *            <br>
	 */
	public Page(int pageIndex, int pageSize, int codeRange) {
		super();
		this.pageIndex = pageIndex;
		this.pageSize = pageSize;
		this.codeRange = codeRange;
	}

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public void computeTotalPage() {
		if (pageSize > 0 && totalRows > -1) {
			int tp;
			tp = (int) (totalRows / pageSize);
			this.totalPages = totalRows % pageSize == 0 ? tp : tp + 1;
		}
	}

	public List<Integer> getCodeList() {
		return codeList;
	}

	/**
	 * @Description: TODO 设置页码集合<br>
	 * @author Mr.Black <br>
	 * @date 2015年12月23日 下午8:30:04 <br>
	 */
	public void setCodeList() {

		/**
		 * 左右页码平衡处理
		 */
		int leftAdd = 0;
		int rightAdd = 0;
		if (totalPages - pageIndex < codeRange) {
			leftAdd = codeRange - (totalPages - pageIndex);
		}
		if (pageIndex <= codeRange) {
			rightAdd = codeRange - pageIndex + 1;
		}

		/**
		 * 左页码
		 */
		for (int i = (pageIndex - codeRange - leftAdd); i < pageIndex; i++) {
			if (i > 0) {
				codeList.add(i);
			}
		}
		/**
		 * 当前页码
		 */
		codeList.add(pageIndex);
		/**
		 * 右页码
		 */
		for (int i = (pageIndex + 1); i <= (pageIndex + codeRange + rightAdd) && i <= totalPages; i++) {
			codeList.add(i);
		}

	}

	public int getCodeRange() {
		return codeRange;
	}

	public void setCodeRange(int codeRange) {
		this.codeRange = codeRange;
	}

	public List<T> getBeanList() {
		return beanList;
	}

	public void setBeanList(List<T> beanList) {
		this.beanList = beanList;
	}

	public String getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages() {
		computeTotalPage();
	}

	public long getTotalRows() {
		return totalRows;
	}

	public void setTotalRows(long totalRows) {
		this.totalRows = totalRows;
		/**
		 * 设置总页数
		 */
		this.setTotalPages();
		/**
		 * 注入动态页码
		 */
		setCodeList();
	}

	public T getQueryMap() {
		return queryMap;
	}

	public void setQueryMap(T queryMap) {
		this.queryMap = queryMap;
	}
}
