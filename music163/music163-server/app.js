//下载命令在线  
//npm i cors express-session express  mysql
//2:将以上四个模块引入到当程序
const express = require("express");
const mysql = require("mysql");
const cors = require("cors");
const session = require("express-session"); 
//3:创建数据库连接池(池 提高效率)
var pool = mysql.createPool({
    host:"127.0.0.1", //数据库地址
    user:"root",      //数据库用户名
    password:"",      //数据库密码
    port:3306,      //数据库端口
    database:"music",//库名
    connectionLimit:15//15连接
})
//4:配置跨域模块
//  允许哪个程序跨域访问服务器
//  脚手架:8081 允许8081访问我
//  服务器:4001 你
var server = express();
server.use(cors({
  //允许程序列表
  origin:["http://127.0.0.1:8081","http://localhost:8081/"],
  credentials:true//每次请求需要验证
}))
//5:配置session模块?????????
server.use(session({
   secret:"128位字符串",//安全字符串
   resave:true,//请求时更新数据
   saveUninitialized:true//保存初始数据
}))
//6:配置项目静态目录 public
server.use(express.static("public"))
//7:创建express对象绑定4001端口
server.listen(4001);

//8:功能一:完成用户登录
server.get("/login",(req,res)=>{
//(1)获取脚手架参数 uname upwd
var uname = req.query.uname;
var upwd = req.query.upwd;
//(2)创建sql语句查询
var sql = "SELECT uid FROM user WHERE uname = ? AND upwd = ?";
//(3)执行sql语句
pool.query(sql,[uname,upwd],(err,result)=>{
 if(err)throw err;
 //(4)获取执行结果
 //(5)判断查询是否成功 result.length
 if(result.length==0){
   res.send({code:-1,msg:"用户名或密码有误"})
 }else{
   //5.1 保存用户id在session对象中
   req.session.uid = result[0].id;
   res.send({code:1,msg:"登录成功"})
 }
 //(6)将结果返回脚手架
})
})

//#检测
//启动服务器
//   node app.js
//打开浏览器在地址栏输入按回
//   http://127.0.0.1:4001/login?uname=yiyi&upwd=123456   



//功能二:分页显示歌曲列表
//1:接收GET /song 
server.get("/song",(req,res)=>{
//2:接收二个参数 
//  pno 页码 pagePageSize 页大小
var pno = req.query.pno;
var ps = req.query.pageSize;
//3:设置默认值 pno=1 pageSize=4
if(!pno){pno=1}
if(!ps){ps=4}
//4:计算第一问号值
var off = (pno-1)*ps;
//5:对pageSize转int
ps = parseInt(ps); 
//6:创建sql语句
var sql = "SELECT s_id,s_name,s_man,s_style,s_pic FROM song LIMIT ?,?";
//7:执行sql语句
pool.query(sql,[off,ps],(err,result)=>{
  if(err)throw err;
  res.send({code:1,msg:"查询成功",data:result})
})
//8:将返回结果发送脚手架 
})
//检测 83~104 复制 你app.js重新
//启动 node app.js
//http://127.0.0.1:4001/song
//http://127.0.0.1:4001/song?pno=2

