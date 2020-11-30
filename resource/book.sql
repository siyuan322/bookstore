
create table t_user(
	`id` int primary key auto_increment,
	`username` varchar(20) not null unique,
	`password` varchar(32) not null,
	`email` varchar(200),
	`role` varchar(32)
);

insert into t_user(`username`,`password`,`email`, `role`) values('admin','admin','admin@qq.com', 'admin');
insert into t_user(`username`,`password`,`email`, `role`) values('zhangsan','zhangsan','siyuan_322@163.com', 'user');
select * from t_user;

create table t_book(
	`id` int primary key auto_increment,
	`name` varchar(100),
	`price` decimal(11,2),
	`author` varchar(100),
	`sales` int,
	`stock` int,
	`img_path` varchar(200),
	`brief` varchar(255)
);


## 插入初始化测试数据
insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`, `brief`) values(null , '陪孩子终身成长（樊登2020新书）' , '樊登' , 80 , 9999 , 9 , 'static/img/1.jpg','樊登不仅是 40，000，000 会员的领读人，还是参与、陪伴和享受孩子成长的父亲。 面对东西方多样的育儿理念和方法，家长们无所适从。樊登去芜存菁，将个人认同并验证的教育理念和方法写《读懂孩子的心》。帮助迷茫中的父母解决了各种棘手难题：孩子抵触写作业、叛逆期、性格内向、缺乏社会能力等等。 ');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`, `brief`) values(null , '伟大的孤独【《萤火虫小巷》作者超越新作】' , '(美) 克莉丝汀·汉娜' , 15 , 6 , 13 , 'static/img/2.jpg', '爸爸总是告诫蕾妮外面的世界很危险，其实她的家里才是*危险的。 1974年的阿拉斯加， *闪亮和*黑暗的人性在漫长夜里肆意滋长。 阿拉斯加非常大，有很多地方可以藏起爱这样的小东西：邻居间的友爱、深深的母女爱，青涩的纯真爱和扭曲甚至可能致命的恋人爱。');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`, `brief`) values(null , '流血的皇权：楚汉争霸(套装共2册)' , '于泽俊' , 73.99, 99999 , 52 , 'static/img/3.jpg','本书以公元前210年秦始皇出巡病死沙丘为切，生动地再现了从刘邦出生、起义，到秦王朝彻底被推翻，项羽戏下分封诸侯，楚汉争霸，汉守天下这段波澜壮阔、跌宕起伏的历史。故事丝丝扣，人物栩栩如生，语言生动活泼，是近年来历史小说创作领域不可多得的一部佳作。<br/>【推荐语】<br/>1、梁晓声看完赞不绝口，忍不住提笔为它写下赞词：“胸中自有豪气在，敢遣霸雄战笔端！”并亲写3000字推荐语，是为序！ 2、写《大秦帝国》没写完的后续故事；看《楚汉传奇》没拍出的真实情节；了解不同于《史记》记载的刘邦项羽！');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`, `brief`) values(null , '钝感力（渡边淳一经典：具备不为小事动摇的钝感力，才能成为真正的赢家)' , '渡边淳一' , 31.40, 1000 , 50 , 'static/img/4.jpg', '奥运冠军大杨扬领读推荐，写给易因小事而动摇、敏感、什么都往心里去的人；帮你玩转人际关系，缓解焦虑情绪，排遣工作压力，走出人生低谷。马未都、樊登、蔡康永、王俊凯知名大V书单。）');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`, `brief`) values(null , '你当像鸟飞往你的山（比尔·盖茨年度特别推荐）' , '塔拉 · 韦斯特弗 ' , 59, 14 , 95 , 'static/img/5.jpg','17岁前从未上过学的女孩，如何成为剑桥大学博士？我们要背叛多少曾经，才能找到真正的自我！《纽约时报》 等数十家媒体一致公推“年度图书”，作者获选《时代周刊》年度影响力人物！这本书比你听说的还要好！');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`, `brief`) values(null , '你就是孩子最好的玩具 樊登推荐' , '（美）金伯莉·布雷恩 ' , 23, 12 , 53 , 'static/img/6.jpg', '美国著名儿童教育家分享有显著效果的情感引导育儿模式。远离熊孩子，奠定父母与孩子一生的亲密关系。风靡美国的情感引导5步法，给孩子无条件的爱，帮助孩子学会解决问题');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`, `brief`) values(null , '侦探与小偷 （教育部统编《语文》推荐阅读）' , '叶永烈' , 22, 125 , 535 , 'static/img/7.jpg','中国少儿科普界泰斗，“世界名人录”入选者，“小灵通之父”叶永烈科学故事短篇精选，获全国优秀少儿读物奖、改编同名动画片、被翻译成多种语言。大字护眼，阅读不累');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`, `brief`) values(null , '人间失格（日本小说家太宰治代表作）' , '（日）太宰治' , 19 , 47 , 36 , 'static/img/8.jpg', '超燃！“丧文化”流行，《人间失格》成了现象级畅销书，创当当3天销售50000+册的奇迹！收录作者绝笔之作《Good bye》。一个“丧失为人资格”少年的心灵独白，一个对村上春树影响至深的绝望凄美故事。');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`, `brief`) values(null , '正面管教(修订版)' , '[美] 简·尼尔森' , 38 , 85 , 95 , 'static/img/9.jpg','如何不惩罚、不娇纵地有效管教孩子。畅销美国400多万册，被翻译成16种语言畅销全球；让数百万孩子、父母和老师受益终身的经典之作；自1981年本书*版出版以来，《正面管教》已经成为管教孩子的“黄金准则');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`, `brief`) values(null , '小熊和最好的爸爸（全7册）' , '（荷）阿兰德·丹姆' , 34, 52 , 62 , 'static/img/10.jpg', '此商品新老版本随机发货！和爸爸一起读的绘本，极易操作学习增强父子情感的图画书。孩子学习做男子汉：粗犷、睿智、谦逊、幽默，细致；爸爸学习父爱的技巧：了解孩子的梦想，为孩子的勇气而骄傲，成为孩子眼中的英雄');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`, `brief`) values(null , '乌合之众 : 大众心理研究' , '(法) 古斯塔夫·勒庞 ' , 20 , 52 , 74 , 'static/img/11.jpg','群体心理学奠基之作，弗洛伊德誉之为“当之无愧的名著”。中科院心理学硕士2018全译本，更完整、专业、流畅。被希特勒利用，影响罗斯福、戴高乐等政要，三次遭禁。康辉、袁立等推荐阅读 ');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`, `brief`) values(null , '养育男孩（典藏版）' , '(澳) 史蒂夫·比达尔夫' , 38, 48 , 82 , 'static/img/12.jpg', '1~18岁男孩父母的启蒙之书和进阶指南！樊登官方推荐，全球畅销400万册，中文版累计加印80次，销量超150万册，蝉联畅销榜20年，教你如何抓住男孩成长的3个关键阶段，培养积极勇敢、有担当的男孩');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`, `brief`) values(null , '蛤蟆先生去看心理医生' , '罗伯特·戴博德' , 36, 19 , 9999 , 'static/img/13.jpg', '英国亚马逊五星评分、长踞心理咨询图书畅销榜。故事版《自卑与超越》，将心理学知识完美融入故事情节，零基础也能读。帮助人们认识自我、走出抑郁、找到希望。果麦出品。');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`, `brief`) values(null , '小王子（名家全译本，原版插图精美再现）' , '(法) 圣埃克苏佩里' , 22 , 22 , 88 , 'static/img/14.jpg', '被誉为阅读量仅次于《圣经》的zui佳读物，被译成300多种语言，销量高达5亿册！首次完整揭秘作者的人生传奇故事，展示与《小王子》有关的钱币、纪念章、邮票等精美周边图片。');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`, `brief`) values(null , '神奇校车·图画书版（全12册）' , '(美)乔安娜柯尔' , 196 , 122 , 188 , 'static/img/15.jpg','风靡全世界的“神奇校车”再次出发！搭乘神奇校车，跟着卷毛老师来一次时空穿越之旅，去认识那些闪耀在历史星河中的伟大科学家！（蒲公英童书馆出品）');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`, `brief`) values(null , '作家榜经典：月亮与六便士' , '[英] 毛姆' , 31 , 21 , 81 , 'static/img/16.jpg','荣获5项大奖的作家榜经典名著！全新未删节插图珍藏版，靠口碑火爆全网！1133985名读者真实五星好评！口碑爆棚，好评如潮！满地都是六便士，他却抬头看见了月亮！读经典名著，认准作家榜！谨防山寨');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`, `brief`)values(null , '流浪的地球（刘慈欣著）' , '刘慈欣' , 24 , 210 , 810 , 'static/img/17.jpg', '科幻界“诺贝尔奖”雨果奖得主刘慈欣著，获科幻小说银河奖特等奖，根据本书改编的同名电影票房突破45亿！本书还收录《超新星纪元》《圆圆的肥皂泡》《诗云》等著名短篇科幻，是大刘《三体》之外ZUI重磅作品。');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`, `brief`) values(null , '养育女孩（新版）' , '[澳]史蒂夫·比达尔夫' , 38.2 , 210 , 810 , 'static/img/18.jpg','1~18岁女孩父母的启蒙之书和进阶指南！樊登官方推荐，全球畅销400万册《养育男孩》作者史蒂夫·比达尔夫畅销力作！教你如何把握女孩成长的5个阶段，帮助她们成为聪慧、优雅、独立和内心强大的女人');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`, `brief`) values(null , '东野圭吾：白夜行' , '[日]东野圭吾' , 59 , 20 , 10 , 'static/img/19.jpg', '我一直走在白夜里，从来就没有太阳，所以不怕失去。中文版发行量超600万册。');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`, `brief`) values(null , '云边有个小卖部（陆定昊诚挚推荐）' , '张嘉佳' , 28 , 20 , 80 , 'static/img/20.jpg', '写给陪伴我们的人，写给每个人心中的山和海。如果你有时间打开，那请给我一个机会，陪伴你度过安静的阅读时光。随书附赠云边镇四季明信片和张嘉佳作词单曲彩蛋。');


## 查看表内容
select id,name,author,price,sales,stock,img_path from t_book;


create table t_order(
	`order_id` varchar(50) primary key,
	`create_time` datetime,
	`price` decimal(11,2),
	`status` int,
	`user_id` int,
	foreign key(`user_id`) references t_user(`id`)
);

create table t_order_item(
	`id` int primary key auto_increment,
	`img_path` varchar(255),
	`name` varchar(100),
	`count` int,
	`price` decimal(11,2),
	`total_price` decimal(11,2),
	`order_id` varchar(50),
	foreign key(`order_id`) references t_order(`order_id`)
);



