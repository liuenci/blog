/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-03-31 14:53:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `cate_id` int(11) DEFAULT NULL,
  `content` text,
  `date` date DEFAULT NULL,
  `c_num` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `status` int(2) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `ref_cateid` (`cate_id`),
  CONSTRAINT `ref_cateid` FOREIGN KEY (`cate_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('30', 'check约束', '1', '---\r\ndate: 2017-11-29 15:42\r\nstatus: public\r\ntitle: \'oracle check约束总结\'\r\n---\r\n\r\n1. 创建表的时候创建约束\r\n* 定义为列的约束\r\n```oracle\r\ncreate table KCB2\r\n(\r\n课程号 varchar2(10) not null,\r\n课程名 varchar2(10) not null,\r\n开课学期 number(1) null,\r\n学时 number(2) null,\r\n学分 number(1) check(学分>=0 and 学分<=10) not null --定义为列的约束\r\n)\r\n```\r\nun* 定义为表的约束\r\n```oracle\r\ncreate table books\r\n(\r\nbook_id number(10),\r\nbook_name varchar(50) not null,\r\nbook_desc varchar2(50) default \'new book\',\r\nmax_lvl number(3,2) not null,\r\ntrade_price number(4,1) not null,\r\nconstraint ch_cost check(max_lvl<=250)\r\n)\r\n```', '2018-02-27', '6', '1001', '0');
INSERT INTO `article` VALUES ('32', 'oracle授权', '5', '以前一直用的 oracle11g，每次安装都没有 sql developer,今天 google 看到原来 11g 好像没有内置 sql developer,并且删除了 scott 用户，又解决了我一个使用 oracle 的困惑。\r\n\r\n下面讲讲如何创建 scott 用户并且授予权限。\r\n\r\n参考链接如下：http://blog.csdn.net/btt2013/article/details/52554514\r\n\r\n##### 使用数据库管理员身份登陆账户\r\n在这一步之前你先要保证自己的数据库服务启动，这里我就不说了，然后打开 sql plus 之后登陆。输入口令直接回车即可。\r\n```\r\nsys  as sysdba;\r\n```\r\n##### 创建用户并且设置密码\r\n```\r\ncreate user scott identified by 123456;\r\n```\r\n##### 授予权限\r\n由于我在安装 oracle 的时候把创建为容器数据库给取消了，所以授予权限有一点点不同。\r\n```\r\ngrant connect,resource,unlimited tablespace to scott;\r\n```\r\n如果创建容器数据库可以使用下面这行语句\r\n```\r\ngrant connect,resource.unlimited tablespace to scott container=all;\r\n```\r\n##### 设置用户使用的表空间\r\n```\r\nalter user scott default tablespace users;\r\nalter user scott temporary tablespace temp;\r\n```\r\n##### 使用 scott 用户登录\r\n```\r\nconnect scott/123456;\r\n```\r\n##### 显示当前用户\r\n```\r\nshow user;\r\n```\r\n', '2018-03-23', '10', '1001', '0');
INSERT INTO `article` VALUES ('48', 'git 初级命令', '5', '这篇文章用来记录自己学习git时所遇到的一些命令。\r\n1. 设置全局的用户名和邮箱\r\n```git\r\ngit config --global user.name \"cier\"\r\ngit config --global user.email \"154910381@qq.com\"\r\n```\r\n2. 查看设置的用户名和邮箱\r\n```git\r\ngit config user.name\r\ngit config user.email\r\n```\r\n3. 清屏\r\n```git\r\nclear\r\n```\r\n4. git初始化\r\n```git\r\ngit init\r\n```\r\n5. 显示隐藏文件\r\n```git\r\nls -a\r\n```\r\n6. 生成文件\r\n```git\r\ntouch 1.py\r\n```\r\n7. 查看文件状态，看是否有文件没有添加到我们的git版本库中\r\n```git\r\ngit status\r\n```\r\n8. 简单的拉取代码操作\r\n```git\r\ngit pull \"https://github.com/liuenci/Git-Test.git\"\r\n```\r\n这个可以在新建一个仓库并且初始化有readme.md的文件时使用\r\n9. 查看日志\r\n```git\r\ngit log\r\n```\r\n10. 查看此次add和上次commit的两个版本之间的不同\r\n```git\r\ngit diff\r\n```\r\n还有一种查看方式是\r\n```\r\ngit diff --cached\r\n```\r\n具体是啥我也没弄懂，以后要是找到答案再补上\r\n11. add所有的改变的文件\r\n```\r\ngit add .\r\n```\r\n12. 将日志一行一行打印\r\n```\r\ngit log --oneline\r\n```\r\n13. 补充上一次提交的内容，并且不改变commit的message,但是commit ID改变了\r\n```\r\ngit commit --amend --no-edit\r\n```\r\n14. add 之后想要继续更改其中的内容，可以选择回退\r\n```\r\ngit reset 1.py\r\n```\r\n15. reset回到HEAD指针所在的版本\r\n```\r\ngit reset --hard HEAD\r\n```\r\n16. 回退到当前版本的第 n 个版本,把 n 替换成你想要回退的版本即可\r\n```\r\ngit reset --hard HEAD~n\r\n```\r\n17. 回到指定的commit ID 的版本\r\n```\r\ngit reset --hard 7757af1\r\n```\r\n18. 查看所有的日志，包括未来的。\r\n```\r\ngit reflog\r\n```\r\n19. 单个文件的版本回退\r\n```\r\ngit checkout\r\ngit checkout 7757af1 -- 1.py\r\n```\r\n20. 使用图形的方式打印日志，一般用于多分支的情况\r\n```\r\ngit log --oneline --graph\r\n```\r\n21. 查看所有的分支\r\n```\r\ngit branch\r\n```\r\n22. 创建分支\r\n```\r\ngit branch dev\r\n```\r\n23. 切换分支\r\n```\r\ngit checkout master\r\n```\r\n24. 删除分支\r\n```\r\n## 没有合并的分支\r\ngit branch -D dev\r\n```\r\n26. 建立分支的同时将head指针移动到新创建的分支\r\n```\r\ngit checkout -b dev\r\n```\r\n27. 在add的同时commit，这种方式只适合于当前版本库中已经有的文件，新创建的文件无法被是被\r\n```\r\ngit commit -am \"新创建的文件无法识别\"\r\n```\r\n28. 在当前分支上合并其它分支的内容\r\n```\r\ngit merge --no-ff \"合并的message\" dev\r\n```\r\n29. 简单的合并分支\r\n```\r\ngit merge dev\r\n```\r\n30. 另外一种合并分支的方式\r\n```\r\ngit rebase dev\r\n```\r\n31. 将未完成的工作暂存在缓存区。\r\n```\r\ngit stash\r\n```\r\n32. 将暂存区中的内容拿出来\r\n```\r\ngit stash pop\r\n```\r\n33. 忽略windows和unix换行符\r\n```\r\ngit config --global core.autocrlf false\r\n```\r\n', '2018-03-21', '124', '1001', '1');
INSERT INTO `article` VALUES ('49', '使用git提交到github', '5', '因为自己老是忘记 git 上传的步骤，每次上传文件都要重新谷歌找答案，所以\r\n干脆写下来记录一下。\r\n\r\n1. 在github上创建仓库，创建仓库的时候勾选初始化readme文件\r\n\r\n2. 如果是从来没有上传过github的代码，则执行以下代码。\r\n\r\n3. 先初始化git的本地仓库。\r\n```\r\ngit init;\r\n```\r\n4. 再将readme文件从云端拉下来，这样云端仓库中的readme文件就到自己本地来了\r\n```\r\ngit pull \"github仓库地址\"\r\n```\r\n5. 将文件提交到缓存区,2.x版本的git两个命令都是一样都能将被删除的文件提交到缓存区\r\n```\r\ngit add .\r\n// 或者 git add -A\r\n```\r\n6. 提交一个版本到本地仓库\r\n```\r\ngit commit -m \"message\"\r\n```\r\n6. 添加远程仓库分支\r\n```\r\ngit remote add origin \"github地址\"\r\n```\r\n7. 将本地master分支的代码推送到远程仓库origin的master分支\r\n```\r\ngit push -u origin master.\r\n// 我试了下下面这个命令也是正确的可以上传的\r\ngit push origin master\r\n```\r\n\r\n###### 总结\r\ngit 的学习是一门大学问，技术是永远学不完的，只能一点一点慢慢学，遇到问题解决完再进行总结才能得到最大的收益，这样才能避免下次再出这样的错误。\r\n', '2018-03-21', '15', '1001', '0');
INSERT INTO `article` VALUES ('51', '约束总结', '4', '---\r\ndate: 2017-11-29 15:42\r\nstatus: public\r\ntitle: \'oracle check约束总结\'\r\n---\r\n\r\n1. 创建表的时候创建约束\r\n* 定义为列的约束\r\n```oracle\r\ncreate table KCB2\r\n(\r\n课程号 varchar2(10) not null,\r\n课程名 varchar2(10) not null,\r\n开课学期 number(1) null,\r\n学时 number(2) null,\r\n学分 number(1) check(学分>=0 and 学分<=10) not null --定义为列的约束\r\n)\r\n```\r\nun* 定义为表的约束\r\n```oracle\r\ncreate table books\r\n(\r\nbook_id number(10),\r\nbook_name varchar(50) not null,\r\nbook_desc varchar2(50) default \'new book\',\r\nmax_lvl number(3,2) not null,\r\ntrade_price number(4,1) not null,\r\nconstraint ch_cost check(max_lvl<=250)\r\n)\r\n```', '2018-03-23', '0', '1002', '0');
INSERT INTO `article` VALUES ('52', 'haha', '1', 'haha', '2018-03-23', '1', '1001', '0');
INSERT INTO `article` VALUES ('53', 'ceshi', '1', 'ceshi ', '2018-03-23', '0', '1001', '0');
INSERT INTO `article` VALUES ('54', 'ceshi', '1', 'cesjo', '2018-03-23', '1', '1001', '0');
INSERT INTO `article` VALUES ('55', '哈哈', '1', '哈哈', '2018-03-23', '0', '1001', '0');
INSERT INTO `article` VALUES ('56', '11', '1', '11', '2018-03-23', '0', '1001', '2');
INSERT INTO `article` VALUES ('57', '22', '1', '22', '2018-03-23', '0', '1001', '2');
INSERT INTO `article` VALUES ('58', '11', '1', '11', '2018-03-23', '1', '1001', '0');
INSERT INTO `article` VALUES ('59', '方法', '1', '法', '2018-03-23', '13', '1001', '0');
INSERT INTO `article` VALUES ('60', '法', '1', ' 法', '2018-03-23', '2', '1001', '0');
INSERT INTO `article` VALUES ('61', 'haha ', '1', 'hah ', '2018-03-24', '0', '1001', '2');
INSERT INTO `article` VALUES ('62', 'hah ', '1', 'aa', '2018-03-24', '17', '1001', '1');
INSERT INTO `article` VALUES ('63', '时间复杂度分析', '1', '---\r\ndate: 2018-01-20 20:29\r\nstatus: public\r\ntitle: 算法时间复杂度判断\r\n---\r\n\r\n在判断时间复杂度之间，我们需要知道什么是如何推导大O阶方法。\r\n> 推导大O阶方法的步骤\r\n1. 用常数1取代运行时间中的所有加法常数。\r\n2. 在修改后的运行次数函数中，只保留最高阶项。\r\n3. 如果最高阶项存在且不是1，则去除与这个项相乘的常数\r\n\r\n经过上面三步得到的结果就是大O阶，下面讲解几种常见的时间复杂度的判断。\r\n> 常数阶\r\n\r\n代码如下:\r\n```java\r\nint sum = 0,n = 100; // 执行一次\r\nsum = ( 1 + n ) * n / 2; // 执行一次\r\nSystem.out.println(sum); // 执行一次\r\n```\r\n以上这个算法的运行次数函数是f(n) = 3;\r\n现在根据推导大O阶的方法推导一下这个算法的时间复杂度。\r\n首先将常数3变为1，然后保留最高阶项，但是这个算法没有最高阶项，所以它的时间复杂度就是O(1)。\r\n> 线性阶\r\n\r\n代码如下:\r\n```java\r\nfor(int i = 0; i < n; i++){\r\n    System.out.println(i);\r\n}\r\n```\r\n很明显这个算法的循环次数为n，所以推导大O阶得到O(n)。\r\n> 对数阶\r\n\r\n代码如下:\r\n```java\r\nint count = 1;\r\nwhile (count < n){\r\n    count = count * 2;\r\n}\r\n```\r\n因为每次 count 乘以 2 之后，就距离 n 就更近了一份。因为 2 的 x 次方等于 n，得到时间复杂度 x = log2n (以 2 为底的 n 对数)。\r\n> 平方阶\r\n\r\n代码如下:\r\n```java\r\nint i,j;\r\nfor(i = 0; i < n; i++){\r\n    for(j = 0; j < n; j++){\r\n        System.out.println(i*j);   \r\n    }\r\n}\r\n```\r\n由于内循环是一个 O(n) 的时间复杂度，外层循环只不过是将内层循环再循环 n 次，所以时间复杂度为 O(n2)（n 的平方），因此可以总结出循环的时间复杂度等于循环体的复杂度乘以该循环运行的次数。\r\n\r\n总结常用的时间复杂度所耗费的时间从小到大依次是:\r\nO(1) < O(logn) < O(n) < O(nlogn) < O(n 平方) < O(n 三次方) < O(2 的 n 次方) < O(n!) < O(n 的 n 次方)', '2018-03-24', '4', '1008', '1');
INSERT INTO `article` VALUES ('64', '链式结构', '1', '---\r\ndate: 2018-02-02 20:22\r\nstatus: public\r\ntitle: 数据结构-栈-链式结构\r\n---\r\n\r\n在我的前一篇文章中讲述了栈的顺序结构，这篇文章将带大家实现栈的链式结构。\r\n#### 什么是栈的链式结构\r\n栈的顺序结构需要依托于数组来实现，而栈的链式结构则不需要依托于数组，而是在每个结点中存放一个指针域，这个指针域指向这个结点的直接后继，这种依次链接并且插入和删除结点只允许在栈顶进行就叫做栈的链式结构。\r\n栈的链式结构也叫做链栈。\r\n#### 从链表进化为链栈\r\n栈只是栈顶来做插入和删除操作，栈顶放在链表的头部还是尾部呢？由于单链表有头指针，而栈顶指针也是必须的，那干嘛不让它俩合二为一呢，所以比较好的办法是把链顶放在单链表的头部。另外，都已经有了栈顶在头部了，单链表中比较常用的头结点也就失去了意义，通常对于链栈来说，是不需要头结点的。\r\n#### 如何实现链栈\r\n##### 结点类 Node\r\n由于链栈也是由一个个的结点组成,所以结点类是少不了的，每个结点包括两个部分，一个数据域，一个指针域。\r\n数据域存储要处理的数据，指针域存储当前结点的直接后继的引用。\r\n核心代码如下：\r\n```java\r\npublic class Node {\r\n    private Object element; // 数据域\r\n    private Node next; // 指针域\r\n}\r\n```\r\n##### 接口 ILinkedStack\r\n这个接口和我写的栈的顺序结构的接口一，一模一样。关键还是规范入栈和出栈操作，辅助实现一个获取栈顶元素以及判空操作。\r\n核心代码如下：\r\n```java\r\n */\r\npublic interface ILinkedStack {\r\n    void push(Object object);\r\n    Object pop();\r\n    Object getTop();\r\n    boolean isEmpty();\r\n}\r\n```\r\n##### 接口实现类 LinkedStackImpl\r\n链栈初始化：链栈的初始化只需要将链顶引用 head 赋值为空并且将链栈的大小 size 赋值为 0 即可完成初始化。\r\n入栈：因为链栈没有大小限制，不像顺序栈需要考虑数组预先分配的大小，所以在入栈只需要将插入的结点的指针域指向当前的栈顶指针，再将栈顶指针指向插入的新的结点，最后将链栈的大小更新。\r\n出栈：出栈的话还是需要判断当前的链栈是否为空，如果为空栈当然就不能删除结点了，如果为空栈则需要输出错误警告信息，并且返回 null；如果不为空则需要将栈顶指针指向当前栈顶的下一个结点，并且将链栈的大小更新。\r\n判空：判断当前链栈是否为空只需要判断 head == null 为 true 还是 false 即可。\r\n核心代码如下：\r\n```java\r\npublic class LinkedStackImpl implements ILinkedStack {\r\n    Node head; // 栈顶指针\r\n    int size; // 结点的个数\r\n    public LinkedStackImpl() {\r\n        head = null;\r\n        size = 0;\r\n    }\r\n    @Override\r\n    public void push(Object object) {\r\n        head = new Node(object,head);\r\n        size++;\r\n    }\r\n    @Override\r\n    public Object pop() {\r\n        if (isEmpty()) {\r\n            System.out.println(\"栈为空\");\r\n            return null;\r\n        }\r\n        Object object = head.getElement();\r\n        head = head.getNext();\r\n        size--;\r\n        return object;\r\n    }\r\n    @Override\r\n    public Object getTop() {\r\n        return head.getElement();\r\n    }\r\n    @Override\r\n    public boolean isEmpty() {\r\n        return head == null;\r\n    }\r\n}\r\n```\r\n##### 测试类 LinkedStackTest\r\n测试类比较简单，无非是按照初始化链栈，进行入栈，再进行出栈操作，测试每一个方法是否正确，这里就不贴代码了，想了解详情的可以查看我的 github 地址，上面有所有的用 Java 写的数据结构的代码。\r\n#### 项目源码获取方式\r\ngithub 地址：https://github.com/liuenci/Data-Structure。\r\n有兴趣的同学点个 Star 再走啊。', '2018-03-24', '2', '1009', '0');
INSERT INTO `article` VALUES ('65', '顺序结构', '1', '---\r\ndate: 2018-02-01 19:59\r\nstatus: public\r\ntitle: 数据结构-栈-顺序结构\r\n---\r\n\r\n#### 什么是栈\r\n栈是一种特殊的线性表，但是只允许在表尾进行插入和删除。相对于普遍意义上的线性表来说，实现要简单不少，不过这里我们还要知道栈的几个关键的概念。\r\n#### 栈的关键点\r\n我们把允许插入和删除的一端称为栈顶(top),另一端称为栈底(bottom);不含任何数据元素的栈称为空栈。\r\n栈又称为后进先出(Last In First Out)的线性表，简称为LIFO结构。\r\n#### 关于栈的插入和删除\r\n栈的插入操作，叫做进栈，也称压栈、入栈。\r\n栈的删除操作，叫做出栈，也称弹栈。\r\n#### 栈的顺序结构实现\r\n在我的前几篇文章中，说到线性表有两种实现方式，一种是顺序结构，一种是链式结构。而我们的栈作为一种特殊的线性表，因而也具有这两种实现方式，这里我们详细讲述栈的顺序结构的实现。\r\n##### 先来一个接口 ISequenceStack\r\n这段时间自己写数据结构的代码，特别中意接口，以前一直不怎么写接口的，现在发现写接口特别有利于自己的代码规范，写接口就像自己高中写作文列提纲一样，你知道自己该写哪些内容，所以我建议大家都好好学习写接口。\r\n这里的接口主要为了规范 push(压栈) 和 pop(出栈)操作，辅助操作有 getTop()(得到栈顶元素) 和 isEmpty()(栈的判空操作)。\r\n核心代码如下：\r\n```java\r\npublic interface ISequenceStack {\r\n    void push(Object obj);\r\n    Object pop();\r\n    Object getTop();\r\n    boolean isEmpty();\r\n}\r\n```\r\n##### 接口实现类 SequenceStackImpl\r\n接口实现类主要包括一个栈的初始化(init()),压栈(push())，以及出栈(pop())。\r\n栈的初始化：\r\n栈的实现需要一个数组作为依托，所以需要将数组实例化。此外，我们需要一个栈顶指针，表明栈顶所在的位置。\r\n核心代码如下:\r\n```java\r\npublic void init(int size) {\r\n        this.maxSize = size;\r\n        top = -1;\r\n        stack = new Object[size];\r\n}\r\n```\r\n压栈：\r\n压栈就是在这个栈中插入数据的过程，所以先要判断栈是否已经满了，如果满了则返回并且输出错误警告信息。\r\n如果栈不满，将 top 指针后移，再将数据插入。\r\n核心代码如下：\r\n```java\r\npublic void push(Object obj) {\r\n        if ( top == maxSize) {\r\n            System.out.println(\"栈已满\");\r\n            return;\r\n        }\r\n        top++;\r\n        stack[top] = obj;\r\n    }\r\n```\r\n出栈：\r\n出栈就是在这个栈中删除数据的过程，所以先要判断该栈是否为空，如果为空则返回 null，并且输出错误警告信息。\r\n如果不为空，则将该结点设置为 null，然后 top 指针前移。\r\n核心代码如下：\r\n```java\r\npublic Object pop() {\r\n        if (isEmpty()){\r\n            System.out.println(\"栈为空\");\r\n            return null;\r\n        }\r\n        Object obj = stack[top];\r\n        stack[top] = null;\r\n        top--;\r\n        return obj;\r\n}\r\n```\r\n##### 栈的测试类 \r\n栈的测试类比较简单，主要是测试栈的实现类中每一个方法是否可用，以及边界条件下测试栈会不会报异常。这里就不贴源代码占篇幅了，想要了解详情的可以去我的 github 上面查看数据结构全部的源代码。\r\n#### 项目源码获取地址\r\ngithub:https://github.com/liuenci/Data-Structure.\r\n觉得可以的同学可以点一波 Star 再走啊。\r\n', '2018-03-24', '4', '1009', '1');
INSERT INTO `article` VALUES ('66', 'git使用', '5', '#### git使用\r\n参考文章：http://www.xgllseo.com/?p=5428\r\n感谢大神。\r\n\r\n下面是我挣扎了三天各种重装Ubuntu系统之后开始使用git的一点小经验。\r\n1. 测试git是否安装\r\n```\r\ngit --version\r\n```\r\n记住一定是--,不是一个-。\r\n\r\n2. 获取ssh密钥\r\n```\r\nssh-keygen -C \"你的github邮箱\" -f ~/.ssh/github\r\n```\r\n执行的过程中会提示你需要设置密码，不要管它，一路回车。\r\n这时候会在你的～/目录下面生成一个.ssh/目录，但是Ubuntu默认是不显示这个目录的。查看.ssh目录下的github.pub获取公钥认证，就是一串乱码。\r\n接下来获取这串乱码。\r\n```\r\ncd .ssh\r\nsudo gedit github.pub\r\n```\r\n这个时候会打开这个文件，只需要复制里面的代码到github里面的SSH and GPG keys 里面填写一下就好了。\r\n\r\n3. 创建本地项目文件\r\n这个文件就是专门负责项目的上传和更新，进入这个文件夹，然后在终端输入以下代码\r\n```\r\ngit clone \"你的github仓库地址\"\r\n```\r\n\r\n4. 提交文件夹到github上\r\n```\r\ngit add . // 更新整个目录\r\ngit config user.name \"liuenci\" //第一次需要配置\r\ngit config user.email \"154910381@qq.com\" //第一次需要配置\r\ngit commit -m \"更新版本简要说明\"\r\ngit push -u origin master\r\n```\r\n这样子就能够上传我们的项目了。\r\n', '2018-03-25', '0', '1001', '2');
INSERT INTO `article` VALUES ('67', '测试图片', '1', '![](http://ove4nglsb.bkt.clouddn.com/03-01-02.png)', '2018-03-25', '6', '1001', '1');
INSERT INTO `article` VALUES ('68', 'linux文件权限', '3', '#### 为什么有权限\r\n在一个系统中，如果只有一个用户，那有没有权限都无所谓，但是如果在一个系统上有多个用户的时候，为了避免其他用户对重要文件的查看修改等操作，所以就出现了权限的概念。\r\n#### 如何查看权限\r\n查看文件的权限只需要输入以下命令即可查看。\r\n```\r\nls -l\r\n```\r\n![Linux文件权限](http://ove4nglsb.bkt.clouddn.com/03-01-02.png)\r\n图片来源:https://morvanzhou.github.io/tutorials/others/linux-basic/3-01-file-permissions/ 侵删。\r\n\r\n类似于 drwxrwxr-x 这种格式的就是文件的权限。细节展示在上面的图中，下面解释一下这个字符串的四个部分。\r\n* Type:文件的类型，(- 为文件，d 为文件夹，其他的还有 l,n,有需求再搜)\r\n* User:在 Type 后面紧跟着的三个空就是说是用 User 的身份能对这个做什么处理(r 能读；w 能写；x 能执行；- 不能完成某个操作)，User 一般指的是当前使用电脑的人。\r\n* Group:一个 Group 里面可能有一个或者多个 User,这些权限的样式和 User 一样。\r\n* Others:除了 User 和 Group 以外人的权限。\r\n#### 如何修改权限\r\n先看一个例子，如何给 User 添加执行权限\r\n```\r\nchmod u+r file.py\r\n```\r\n归纳一下得到以下公式\r\n```\r\nchmod [谁][怎么修改][修改哪个文件]\r\n```\r\nu+r 就是说给 User 加上 read 权限，给 file.py 这个文件进行修改。\r\n[谁]\r\n* u:修改 User\r\n* g:修改 Group\r\n* o:修改 Others\r\n* a:修改 all\r\n[怎么修改]\r\n* +,-,= : 加上，剪掉，等于某些权限\r\n* r,w,x : 或者多个权限一起，比如 rw.\r\n', '2018-03-25', '4', '1001', '1');
INSERT INTO `article` VALUES ('69', 'ubuntu', '2', '#### Ubuntu基础命令\r\n###### cd 切换位置\r\n移动到 Document\r\n```\r\ncd Documents\r\n```\r\n移动到上一级目录\r\n```\r\ncd ..\r\n```\r\n返回到 Home 目录\r\n```\r\ncd ~\r\n```\r\n返回到你刚刚所在的目录\r\n```\r\ncd -\r\n```\r\n去往电脑的任何一个位置,使用的是绝对位置\r\n```\r\ncd /home/cier\r\n```\r\n##### ls 浏览文件\r\n显示当前目录下所有文件（不包括隐藏文件）\r\n```\r\nls\r\n```\r\n显示当前目录下文件的详细信息\r\n```\r\nls -l\r\n```\r\n显示所有文件，包括隐藏文件\r\n```\r\nls -a\r\n```\r\n更人性化的显示文件\r\n```\r\nls -lh\r\n```\r\n显示 ls 所有的功能\r\n```\r\nls --help\r\n```\r\n##### touch 创建文件\r\n创建一个文件\r\n```\r\ntouch file1\r\n```\r\n创建多个文件\r\n```\r\ntouch file1 file2 file3 file4 file5\r\n```\r\n##### cp 复制文件或者文件夹\r\n将老文件复制到新文件\r\n```\r\ncp file1 file1copy\r\n```\r\n如果file1copy已经存在，上面的语句会直接覆盖原来的file1copy,为了避免覆盖，需要在cp后面加一个选项。回复任意大小写的\'y\'或者\'yes\'就确认复制，直接回车或者输入其他字母会取消复制，\r\n```\r\ncp -i file1 file1copy\r\n```\r\n复制进文件夹\r\n```\r\ncp file1 folder1/\r\n```\r\n复制文件夹，需要加上 -R (recursive)\r\n```\r\ncp -R folder1/ folder2/\r\n```\r\n复制文件名称部分相同的文件\r\n```\r\ncp file* folder2/\r\n```\r\n复制单独的几个文件到另外一个文件夹\r\n```\r\ncp file1 file1copy file2 folder1/\r\n```\r\n#####　mv 移动文件\r\n移动一个文件到另外一个文件夹\r\n```\r\nmv file6 folder1/\r\n```\r\n移动文件到原来的地点，但是以不同的名字，就是重命名\r\n```\r\nmv file1 file1rename\r\n```\r\n找到更多的 mv 的操作\r\n```\r\nmv --help\r\n```\r\n##### mkdir 创建文件夹\r\n在当前目录添加一个文件夹\r\n```\r\nmkdir folder3\r\n```\r\n在文件夹中建一个文件\r\n```\r\nmkdir folder3/file1\r\n```\r\n##### rmdir 移除文件夹\r\nrmdir 就是 remove directory 的意思，但是这个命令只能删除文件夹内没有文件的文件夹。也就是说只能移除空文件夹。\r\n```\r\nrmdir folder3\r\n```\r\n##### rm 移除文件\r\n移除单个文件\r\n```\r\nrm file1\r\n```\r\n有提示的移除文件\r\n-i 每个要移除的文件都进行提示\r\n-I 超过三个要移除的文件才进行提示\r\n```\r\nrm -i file1 file2 file3\r\nrm -I file*\r\n```\r\n删除非空文件夹,加上 -r 或者 -R\r\n```\r\nrm -r folder1\r\n```\r\n##### nano 编辑脚本\r\n打开一个python脚本进行编辑,编辑完之后 ctrl+x 保存，再通过 python 指令运行\r\n```\r\nnano file.py\r\npython file.py\r\n```\r\n##### cat 查看脚本内容,或者将脚本中的内容写进另外一个脚本中\r\n查看 python 脚本内容\r\n```\r\ncat file.py\r\n```\r\n将文件的内容写进另外一个文件，另外一个文件不存在时会自动创建\r\n```\r\ncat file.py > file2.py\r\n```\r\n将多个文件写进另外一个文件，另外一个文件不存在时会自动创建,内容顺序为 file1 file2 file3\r\n```\r\ncat file1.py file2.py > file3.py\r\n```\r\n将一个文件写入到另外一个文件的末尾\r\n```\r\ncat file1.py >> file2.py\r\n```\r\n', '2018-03-25', '1', '1001', '1');

-- ----------------------------
-- Table structure for article_tag_inner
-- ----------------------------
DROP TABLE IF EXISTS `article_tag_inner`;
CREATE TABLE `article_tag_inner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `a_id` int(11) DEFAULT NULL,
  `t_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_tag_inner
-- ----------------------------
INSERT INTO `article_tag_inner` VALUES ('18', '34', '6');
INSERT INTO `article_tag_inner` VALUES ('19', '34', '7');
INSERT INTO `article_tag_inner` VALUES ('22', '36', '6');
INSERT INTO `article_tag_inner` VALUES ('23', '36', '7');
INSERT INTO `article_tag_inner` VALUES ('41', '1001', '6');
INSERT INTO `article_tag_inner` VALUES ('42', '1001', '7');
INSERT INTO `article_tag_inner` VALUES ('46', '37', '6');
INSERT INTO `article_tag_inner` VALUES ('47', '37', '7');
INSERT INTO `article_tag_inner` VALUES ('48', '38', '6');
INSERT INTO `article_tag_inner` VALUES ('49', '38', '7');
INSERT INTO `article_tag_inner` VALUES ('81', '40', '7');
INSERT INTO `article_tag_inner` VALUES ('85', '41', '8');
INSERT INTO `article_tag_inner` VALUES ('86', '41', '10');
INSERT INTO `article_tag_inner` VALUES ('87', '43', '7');
INSERT INTO `article_tag_inner` VALUES ('88', '44', '6');
INSERT INTO `article_tag_inner` VALUES ('99', '39', '6');
INSERT INTO `article_tag_inner` VALUES ('100', '39', '7');
INSERT INTO `article_tag_inner` VALUES ('105', '45', '7');
INSERT INTO `article_tag_inner` VALUES ('106', '45', '8');
INSERT INTO `article_tag_inner` VALUES ('107', '46', '6');
INSERT INTO `article_tag_inner` VALUES ('122', '47', '6');
INSERT INTO `article_tag_inner` VALUES ('123', '47', '7');
INSERT INTO `article_tag_inner` VALUES ('124', '47', '8');
INSERT INTO `article_tag_inner` VALUES ('125', '48', '10');
INSERT INTO `article_tag_inner` VALUES ('126', '49', '10');
INSERT INTO `article_tag_inner` VALUES ('127', '50', '7');
INSERT INTO `article_tag_inner` VALUES ('128', '51', '12');
INSERT INTO `article_tag_inner` VALUES ('132', '33', '7');
INSERT INTO `article_tag_inner` VALUES ('133', '52', '6');
INSERT INTO `article_tag_inner` VALUES ('137', '32', '6');
INSERT INTO `article_tag_inner` VALUES ('138', '32', '7');
INSERT INTO `article_tag_inner` VALUES ('139', '34', '6');
INSERT INTO `article_tag_inner` VALUES ('140', '57', '6');
INSERT INTO `article_tag_inner` VALUES ('141', '56', '6');
INSERT INTO `article_tag_inner` VALUES ('142', '63', '16');
INSERT INTO `article_tag_inner` VALUES ('143', '64', '18');
INSERT INTO `article_tag_inner` VALUES ('147', '65', '18');
INSERT INTO `article_tag_inner` VALUES ('148', '65', '19');
INSERT INTO `article_tag_inner` VALUES ('149', '65', '20');
INSERT INTO `article_tag_inner` VALUES ('151', '66', '14');
INSERT INTO `article_tag_inner` VALUES ('152', '67', '14');
INSERT INTO `article_tag_inner` VALUES ('154', '69', '14');

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('1', '编程语言');
INSERT INTO `categories` VALUES ('2', '计算机网络');
INSERT INTO `categories` VALUES ('3', '操作系统');
INSERT INTO `categories` VALUES ('4', '数据库');
INSERT INTO `categories` VALUES ('5', '工具使用');
INSERT INTO `categories` VALUES ('6', '规范');
INSERT INTO `categories` VALUES ('7', '数据结构');
INSERT INTO `categories` VALUES ('8', 'dsse');

-- ----------------------------
-- Table structure for discuss
-- ----------------------------
DROP TABLE IF EXISTS `discuss`;
CREATE TABLE `discuss` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `a_id` int(11) DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref-article` (`a_id`),
  KEY `ref-user` (`u_id`),
  CONSTRAINT `ref-article` FOREIGN KEY (`a_id`) REFERENCES `article` (`id`),
  CONSTRAINT `ref-user` FOREIGN KEY (`u_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of discuss
-- ----------------------------
INSERT INTO `discuss` VALUES ('26', 'duogejige', '62', '1001', '2018-03-24');
INSERT INTO `discuss` VALUES ('27', '哇，写的真好', '63', '1008', '2018-03-24');
INSERT INTO `discuss` VALUES ('28', '这写的是啥啊', '62', null, '2018-03-24');
INSERT INTO `discuss` VALUES ('29', '瞎写的', '62', null, '2018-03-24');
INSERT INTO `discuss` VALUES ('30', '666', '64', '1009', '2018-03-24');
INSERT INTO `discuss` VALUES ('31', '还可以吧', '63', null, '2018-03-25');
INSERT INTO `discuss` VALUES ('32', '非常好', '68', '1001', '2018-03-25');
INSERT INTO `discuss` VALUES ('33', '非常好', '67', null, '2018-03-25');

-- ----------------------------
-- Table structure for draft
-- ----------------------------
DROP TABLE IF EXISTS `draft`;
CREATE TABLE `draft` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `cate_id` int(11) DEFAULT NULL,
  `content` text,
  `date` date DEFAULT NULL,
  `c_num` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ref_cateid` (`cate_id`),
  CONSTRAINT `draft_ibfk_1` FOREIGN KEY (`cate_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of draft
-- ----------------------------

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES ('1', 'Java');
INSERT INTO `tag` VALUES ('2', 'oracle');
INSERT INTO `tag` VALUES ('3', '和');
INSERT INTO `tag` VALUES ('4', '11');
INSERT INTO `tag` VALUES ('5', '人工智能');
INSERT INTO `tag` VALUES ('6', '数据分析');
INSERT INTO `tag` VALUES ('7', 'C/C++');
INSERT INTO `tag` VALUES ('8', 'python');
INSERT INTO `tag` VALUES ('9', '大数据');
INSERT INTO `tag` VALUES ('10', 'biaoqian');
INSERT INTO `tag` VALUES ('11', '20万');
INSERT INTO `tag` VALUES ('12', '袁宽的标签');
INSERT INTO `tag` VALUES ('13', '一些标签');
INSERT INTO `tag` VALUES ('14', '阿宽');
INSERT INTO `tag` VALUES ('15', '数据库');
INSERT INTO `tag` VALUES ('16', '主席的标签');
INSERT INTO `tag` VALUES ('17', '');
INSERT INTO `tag` VALUES ('18', 'Java');
INSERT INTO `tag` VALUES ('19', 'python');
INSERT INTO `tag` VALUES ('20', 'c');
INSERT INTO `tag` VALUES ('21', 'asdsa');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `description` text,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1012 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1001', '刘恩赐', '207ACD61A3C1BD506D7E9A4535359F8A', '13272135322', '154910382@qq.com', '11hah sds', '1');
INSERT INTO `user` VALUES ('1002', '袁宽', '207ACD61A3C1BD506D7E9A4535359F8A', '13272135321', 'yuankuan@gmial.com', '哈哈', '1');
INSERT INTO `user` VALUES ('1003', 'admin', '207ACD61A3C1BD506D7E9A4535359F8A', '15096325586', '154910381@qq.com', '系统管理员', '0');
INSERT INTO `user` VALUES ('1004', '刘恩赐1', 'E10ADC3949BA59ABBE56E057F20F883E', '13272163525', '154910381@qq.com', null, '1');
INSERT INTO `user` VALUES ('1005', '刘恩赐2', 'E10ADC3949BA59ABBE56E057F20F883E', '13272435252', '154910381@qq.com', null, '1');
INSERT INTO `user` VALUES ('1006', '刘松', 'E10ADC3949BA59ABBE56E057F20F883E', '13272432525', '154910381@qq.cn', null, '1');
INSERT INTO `user` VALUES ('1007', '李晓', 'E10ADC3949BA59ABBE56E057F20F883E', '13272135456', '15490381@qq.com', null, '1');
INSERT INTO `user` VALUES ('1008', '熊晨晨', '207ACD61A3C1BD506D7E9A4535359F8A', '13272135322', '154910380@qq.com', null, '1');
INSERT INTO `user` VALUES ('1009', '刘松1号', '207ACD61A3C1BD506D7E9A4535359F8A', '13272142222', 'liuenci@gmail.com', null, '1');
INSERT INTO `user` VALUES ('1010', '张几把宽', '207ACD61A3C1BD506D7E9A4535359F8A', '13272135328', 'liuencier@gmail.com', null, '1');
INSERT INTO `user` VALUES ('1011', 'liuenci', '207ACD61A3C1BD506D7E9A4535359F8A', '13272135327', 'liuencier@gmail.cn', null, '1');

-- ----------------------------
-- Table structure for user_tag_inner
-- ----------------------------
DROP TABLE IF EXISTS `user_tag_inner`;
CREATE TABLE `user_tag_inner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL,
  `t_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_tag_inner
-- ----------------------------
INSERT INTO `user_tag_inner` VALUES ('9', '1002', '12');
INSERT INTO `user_tag_inner` VALUES ('11', '1001', '14');
INSERT INTO `user_tag_inner` VALUES ('13', '1008', '16');
INSERT INTO `user_tag_inner` VALUES ('15', '1009', '18');
INSERT INTO `user_tag_inner` VALUES ('16', '1009', '19');
INSERT INTO `user_tag_inner` VALUES ('17', '1009', '20');
INSERT INTO `user_tag_inner` VALUES ('18', '1001', '21');
