Framework框架说明
=======
Framework框架集成了log、cache、config、db、rpc、message、task、web，每块都以模块形式组织，可以根据项目需要获取模块。

+ framework-common 定义公用的常量、工具类等
 
+ framework-rpc 该模块是分布式的核心模块，定义了生产者与消费者，采用apache thrift协议，可以快速简单与zookeeper部署

+ framework-cache 定义了缓存的获取。  
+ framework-cache-core 缓存核心模块
+ framework-cache-redis 采用redis作为缓存
+ framework-cache-simple 用内存来实现缓存的，不建议生产环境使用

+ [framework-db](#framework-db) 是简单易用的轻量级DAO(Data Access Object)框架，它集成了Hibernate实体维护和Mybaits SQL分离的两大优势，提供了非入侵式API，可以与Hibernate、SpringJdbc等数据库框架很好的集成 
+ framework-db-core 数据库核心模块,定义了@Dao、@Sql、@Param等注解
+ framework-db-sh 采用spring、hibernate来实现的数据库模块

+ framework-config 该模块定义了配置项的获取
+ framework-config-api 采用远程方式获取配置项,定义了配置项的获取的接口
+ framework-config-core 定义了配置项获取方式，例如获取资源文件的路径，Configuration.getString("RESOURCE.PATH"),改配置项定义在config_item, config_item_param表中

+ framework-log 分布式集成日志模块，目前日志可以采用本地记录，通过远程接口上传服务器
+ framework-log-core 分布式日志核心模块
+ framework-log-mongodb 采用mongodb存储分布式日志
+ framework-log-db 采用数据库表存储分布式日志
+ framework-log-file 采用文件存储分布式日志

+ framework-message 消息模块，支持其它模块短信、邮件、移动终端消息推送、web端桌面消息推送等功能
+ framework-message-api 远程接口
+ framework-message-core 消息的核心模块

+ framework-task Job模块，支持任务的新增、启动、暂停、重试、停止、删除
+ framework-task-api 远程接口
+ framework-task-core Job核心模块

+ framework-bootstrap 非web项目启动模块，运行 Startup启动、Shutdown关闭，关闭端口在config.properties里面配置

-------
<h2 id="framework-db">framework-db</h2>具有以下特征:

1. O/R mapping不用设置xml，零配置便于维护  
2. 不需要了解JDBC的知识  
3. SQL语句和java代码的分离  
4. 可以自动生成SQL语句  
5. 接口和实现分离，不用写持久层代码，用户只需写接口，以及某些接口方法对应的sql 它会通过动态代理自动生成实现类  
6. 支持自动事务处理和手动事务处理  
7. MiniDao整合了Hibernate+mybatis的两大优势，支持实体维护和SQL分离  
8. SQL支持脚本语言  
9. 可以无缝集成Hibernate、Spring等第三方框架，也可以单独部署运行，适应性强。  

 
###接口和SQL文件对应目录  
#####接口文件[EmpDao.java]
    @Dao
	public interface EmpDao {

	    @Sql("select * from emp")
	    List<Map<String,Object>> selectAll();
	    
	    @Sql("select * from emp where empno = :empno")
	    Map<String,Object> selectOne(@Param("empno") int empno);
	    
	    @Sql(value="select * from emp where deptno = :dept.deptno", bean=Emp.class)
	    List<Emp> selectDeptEmp(@Param("deptno")Dept dept, @Param(Param.pageIndex)int pageIndex,@Param(Param.pageSize)int pageSize);
	    
	    @Sql(bean = Emp.class)
	    List<Emp> queryEmp(@Param("dept") Dept dept);
	    
	    @Sql("select count(*) from emp")
	    int listCount(ResultTransformer transformer);
	}

####SQL文件[EmpDao_queryEmp.sql]  
	select * from emp 
	where 1=1 
	#if($dept) 
		and deptno=$dept.deptno 
	#end

####测试代码[test.java]

	@RunWith(SpringJUnit4ClassRunner.class)
	@ContextConfiguration({
	    "classpath:/META-INF/spring/*.xml"
	})
	@Transactional
	public class EmpService {
	    @Resource
	    private EmpDao empDao;
	    @Test
	    public void test() {
	        try {
	            Dept dept = new Dept();
	            dept.setDeptno(30);
	            System.out.println("------------------");
	            System.out.println(empDao.queryEmp(dept).size());
	            System.out.println("------------------");
	        }
	        catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	 }


****
###　　　　　　　　　　　　Author:王伟
###　　　　　　　　　 E-mail:ww20081120@126.com

