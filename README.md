# ReaderProject
阅读器项目git关联

1、联系git账户名（Aaronlianggq） 把你ssh文件(id_rsa.pub的key值)添加到账户中 

2、进入git bash 执行命令：git clone git@github.com:Aaronlianggq/ReaderProject.git


项目依赖结构
   HZReaderBusiness ->(依赖) HZBaseBusiness -> HZCore -> ThirdLib -> IOSFramework
   层级之间完全解耦，根据依赖层次，可以删除高层文件夹（比如HZReaderBusiness）整个项目编译不会报错 

ThirdLib 目录
   添加第三方依赖库

HZCore 目录
   整个目录和(ThirdLib)可以移植到任何app, 作为底层支持。目录含有http请求模块、抽象模块（HZModule）和全局模块管理器（HZCentralManager)，以及其他辅助功能

HZBaseBusiness 目录
   实现业务数据(model)、页面（view）、路由的(Controller)的抽象定义标准

HZReaderBusiness 目录  
   对业务逻辑、数据转向、路由控制、模块管理的具体实现，子模块管理实现在Business目录，实现数据获取、转向、model对象行为等操作
   
   BookModuleManager  		对书籍管理操作
  
   DownLoadModuleManager  	资源下载任务管理器
   
   FileModuleManager		   文件操作管理器
   
   LoginModuleManager		登录授权管理器
   
   UserModuleManager		   用户人员管理器


管理器获取 。  
1、先注册管理器    (初始化的时候已经进行注册 )
2、获取管理器  例如登录 LoginModuleManager *loginManager = [hzManager managerForClass:[LoginModuleManager class]];
