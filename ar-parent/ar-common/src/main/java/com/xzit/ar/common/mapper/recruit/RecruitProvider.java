/**  
 * @Title: RecruitProvider.java
 * @Package com.xzit.ar.common.mapper.recruit
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月11日 上午11:40:53
 * @version V1.0  
 */
package com.xzit.ar.common.mapper.recruit;

/**
 * @ClassName: RecruitProvider
 * @Description: TODO Recruit Sql Provider
 * @author Mr.Black
 * @date 2016年2月11日 上午11:40:53
 */
public class RecruitProvider {
	
	public String entity = "r.recruit_id recruitId, r.title title, r.prof prof, r.resumes resumes, "
			+ "r.create_time createTime, r.is_top isTop, r.state state, r.state_time stateTime, "
			+ "r.salary salary, " + "u.unit_name unitName, user.account account  ";


	public String queryJob() {
		String sql = "";
		sql = "select " 
				+ entity
				+ "from "
				+ "recruit r, recruit_unit u, user user " 
				+ "where "
				+ "(r.title like #{queryStr} or r.pos_name like #{queryStr} "
				+ "or r.work_place like #{queryStr} or u.unit_name like #{queryStr} ) "
				+ "and r.unit_id = u.unit_id and r.user_id = user.user_id "
				+ "and r.state like #{state} ";
		sql += "order by r.is_top desc, r.state_time desc";
		return sql;
	}
}
