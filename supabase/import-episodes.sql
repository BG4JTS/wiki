-- 批量导入节目数据（共 641 条，全部顺延编号 #1 - #641）
-- 番外/特刊/科普也占编号，按时间顺序递增
-- 请在 Supabase SQL Editor 执行

INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (1, '001：“2B”铅笔的秘密？', '2014-03-08', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (2, '002：十分钟颠覆你的星座观', '2014-03-24', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (3, '003：纸只能对折9次吗？', '2014-03-28', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (4, '004：那张对折到太阳的纸', '2014-03-28', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (5, '005：中国也有十二星座', '2014-04-02', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (6, '006：纸牌背后的事儿', '2014-04-09', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (7, '007：重新认识你的头发', '2014-04-17', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (8, '008：猫的世界你不懂', '2014-04-24', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (9, '009：狗的世界太疯狂', '2014-04-30', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (10, '010：笑为什么会传染？', '2014-05-07', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (11, '011：【番外】微信平台正式上线啦！', '2014-05-13', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (12, '012：土豪时代说“黄金”', '2014-05-13', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (13, '013：一次关于“广播”的广播', '2014-05-21', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (14, '014：味道的秘密', '2014-05-27', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (15, '015：穿越回古代吃些啥？', '2014-06-05', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (16, '016：五谷是哪五谷？', '2014-06-06', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (17, '017：蚊子真挑血型喝?!', '2014-06-11', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (18, '018：蚊子怪谈', '2014-06-18', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (19, '019：真实比例的太阳系（上）', '2014-06-25', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (20, '020：真实比例的太阳系（下）', '2014-06-26', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (21, '021：【番外】旭岽换搭档啦！', '2014-07-02', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (22, '022：梅雨？霉雨！', '2014-07-02', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (23, '023：足球世界杯之“足球”', '2014-07-09', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (24, '024：足球世界杯之“世界和杯”', '2014-07-09', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (25, '025：先有鸡，还是先有蛋？！', '2014-07-16', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (26, '026：一打“鸡蛋问题”请打包带走！', '2014-07-23', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (27, '027：真实比例的银河系（上）', '2014-07-30', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (28, '028：真实比例的银河系（下）', '2014-07-31', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (29, '029：“脑细胞”那点事儿', '2014-08-06', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (30, '030：【科普】地震来了怎么办？你必须get的自救手册', '2014-08-13', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (31, '031：我们为什么要睡觉？', '2014-08-13', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (32, '032：一起睡觉吧！', '2014-08-20', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (33, '033：【番外】和我们聊聊~', '2014-08-20', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (34, '034：如果月亮消失了？！', '2014-08-27', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (35, '035：月球轶事', '2014-09-03', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (36, '036：苹果，不是你们想的那个！', '2014-09-18', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (37, '037：我们为什么会无聊？', '2014-09-10', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (38, '038：向"拖延症"宣战！', '2014-09-25', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (39, '039：【特刊】电梯出事故怎么办？', '2014-09-30', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (40, '040：百蟹全说', '2014-10-02', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (41, '041：秋天的惊叹', '2014-10-09', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (42, '042：一两银子值多少钱？', '2014-10-16', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (43, '043：流星雨没啥大不了', '2014-10-23', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (44, '044：我们为什么会哭泣?', '2014-10-30', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (45, '045：人真的会哭瞎吗？', '2014-11-06', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (46, '046：水能载舟，亦能毁三观', '2014-11-14', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (47, '047：江与河的区别？', '2014-11-20', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (48, '048：世界上最高的山？！', '2014-11-27', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (49, '049：趁着吃不起之前搞懂巧克力！', '2014-12-05', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (50, '050：坐飞机，你必须知道的常识', '2014-12-11', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (51, '051：飞机上的“便便”去哪了？', '2014-12-18', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (52, '052：【年终特辑】2014，谢谢你们！', '2014-12-25', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (53, '053：历史上消失的10天', '2015-01-02', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (54, '054：月份和星期的来历', '2015-01-09', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (55, '055：农历其实不是“阴历”', '2015-01-15', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (56, '056：“闰月”到底咋回事？', '2015-01-22', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (57, '057：你的生肖可能错了？！', '2015-01-29', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (58, '058：理解“四维空间”', '2015-02-05', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (59, '059：颠覆你的情人节！', '2015-02-13', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (60, '060：咩～羊年说羊', '2015-02-19', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (61, '061：“A4纸”里的秘密', '2015-03-13', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (62, '062：再从2B铅笔说起！', '2015-03-06', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (63, '063：纸真是中国人发明的吗？', '2015-03-20', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (64, '064：折过的纸如何复原？', '2015-03-27', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (65, '065：【特刊】解析月全食', '2015-04-04', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (66, '066：一个"联觉者"的自白', '2015-04-10', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (67, '067：我们如何丈量世界？', '2015-04-19', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (68, '068：真实比例的微观世界', '2015-04-24', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (69, '069：穿越回古代如何买房？', '2015-05-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (70, '070：浩劫与重生', '2015-05-08', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (71, '071：我们为什么会恐惧？', '2015-05-15', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (72, '072：恐怖片的秘籍', '2015-05-22', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (73, '073：大脑是家大公司', '2015-05-29', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (74, '074：【番外】氢OS及寻宝答案', '2015-06-05', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (75, '075：科举和高考，真不是一回事儿！', '2015-06-05', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (76, '076：如何准备一场科举考试？', '2015-06-12', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (77, '077：人为什么要有血型？', '2015-06-19', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (78, '078：血型真和性格有关系？！', '2015-06-26', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (79, '079：关于眼睛的实验课', '2015-07-03', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (80, '080：眼睛其实有盲点', '2015-07-10', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (81, '081：站在冥王星上是一种怎样的感受？', '2015-07-17', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (82, '082：谢谢“腐烂”', '2015-07-24', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (83, '083：彩虹究竟是哪七色？', '2015-07-31', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (84, '084：彩虹为什么是弯的？', '2015-08-07', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (85, '085：夜空为什么是黑的？', '2015-08-14', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (86, '086：减肥的基础课', '2015-08-21', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (87, '087：减肥的正确姿势', '2015-08-28', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (88, '088：我们为什么会做梦？', '2015-09-04', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (89, '089：【特刊】流星·射电·夏天的星', '2015-09-11', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (90, '090：梦的解释', '2015-09-18', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (91, '091：怀孕是一种怎样的体验？', '2015-09-25', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (92, '092：关于科学家的不科学故事', '2015-10-09', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (93, '093：科学家童年的“神话”', '2015-10-16', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (94, '094：蚁后传', '2015-10-23', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (95, '095：蚂蚁漫谈', '2015-10-30', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (96, '096：闲话宝石', '2015-11-06', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (97, '097：宝石真有神奇的功能？', '2015-11-13', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (98, '098：喝咖啡的正确姿势', '2015-11-20', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (99, '099：咖啡速成指南', '2015-11-27', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (100, '100：【特刊】《火星救援》的科学剧透', '2015-12-05', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (101, '101：狭义相对论入门', '2015-12-04', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (102, '102：广义相对论浅谈', '2015-12-11', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (103, '103：入埃及记', '2015-12-18', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (104, '104：【年终特辑】2015，感谢有你！', '2015-12-25', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (105, '105：我们为什么会老去？', '2016-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (106, '106：你到底几岁了？', '2016-01-08', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (107, '107：万物之龄 · 生物篇', '2016-01-15', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (108, '108：万物之龄 · 格物篇', '2016-01-22', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (109, '109：火到底是什么？', '2016-01-29', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (110, '110：穿越回古代如何生火？', '2016-02-05', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (111, '111：吼～猴年话猴', '2016-02-12', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (112, '112：【番外】原来旭岽是这样？！', '2016-02-19', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (113, '113：【特刊】宇宙最强音——引力波', '2016-02-19', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (114, '114：馒头的前世今生', '2016-02-26', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (115, '115：细菌的世界', '2016-03-04', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (116, '116：再次颠覆你的星座观', '2016-03-11', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (117, '117：漫游十二星座', '2016-03-18', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (118, '118：跳进黑洞是怎样的体验？', '2016-03-25', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (119, '119：分娩是一种怎样的体验？', '2016-04-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (120, '120：虚数不“虚”', '2016-04-08', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (121, '121：你真的会说话吗？', '2016-04-15', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (122, '122：你真听得懂话吗？', '2016-04-22', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (123, '123：一起吃“醋”吧！', '2016-04-29', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (124, '124：病毒的国度', '2016-05-06', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (125, '125：花儿为什么这样红？', '2016-05-13', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (126, '126：植物的“视觉”', '2016-05-20', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (127, '127：玻璃为什么是透明的？', '2016-05-27', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (128, '128：玻璃是固体吗？！', '2016-06-03', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (129, '129：遇见霸王龙该怎么办？', '2016-06-10', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (130, '130：侏罗纪漫游指南', '2016-06-17', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (131, '131：我们为什么会尴尬？', '2016-06-24', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (132, '132：尴尬为什么会传染？', '2016-07-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (133, '133：植物的“嗅觉”', '2016-07-08', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (134, '134：比无穷大还大？！', '2016-07-15', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (135, '135：蜂王传', '2016-07-22', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (136, '136：谈谈“茶”经', '2016-07-29', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (137, '137：奥运偏门知识扫盲', '2016-08-05', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (138, '138：穿越回古代如何参加奥运？', '2016-08-12', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (139, '139：我们为什么要运动？', '2016-08-19', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (140, '140：颜色的“黑历史”', '2016-08-26', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (141, '141：牛奶的“白知识”', '2016-09-02', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (142, '142：真菌的乐土', '2016-09-09', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (143, '143：土，是有生命的！', '2016-09-16', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (144, '144：秘密的秘密', '2016-09-23', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (145, '145：“强迫症”到底是什么？', '2016-09-30', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (146, '146：“强迫症”还有救么？', '2016-10-07', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (147, '147：住在"红矮星"是怎样的体验？', '2016-10-14', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (148, '148：太阳之死', '2016-10-21', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (149, '149：穿行德意志', '2016-10-28', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (150, '150：我是谁？！', '2016-11-04', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (151, '151：山之重', '2016-11-11', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (152, '152：“油”的学问', '2016-11-18', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (153, '153：钢铁是怎样炼成的？', '2016-11-25', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (154, '154：世界上最“冷”的地方', '2016-12-02', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (155, '155：我们为什么会冷？', '2016-12-09', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (156, '156：雪球地球', '2016-12-16', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (157, '157：【年终特辑】2016，咱们一起！', '2016-12-27', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (158, '158：初探量子世界', '2017-01-06', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (159, '159：不讲理的量子世界（上）', '2017-01-13', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (160, '160：不讲理的量子世界（下）', '2017-01-13', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (161, '161：隧穿·纠缠·那只猫', '2017-01-20', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (162, '162：叽～鸡年聊鸡', '2017-01-27', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (163, '163：植物有“触觉”吗？！', '2017-02-03', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (164, '164：计算机都在“计算”些什么？', '2017-02-10', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (165, '165：处方真的是“天书”吗？！', '2017-02-17', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (166, '166：大脑是如何让我们说话的？', '2017-02-24', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (167, '167：对不起，我得了“微信恐惧”', '2017-03-03', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (168, '168：古中国的星空', '2017-03-10', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (169, '169：“既视感”到底是什么？！', '2017-03-17', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (170, '170：手术的“黑历史”', '2017-03-24', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (171, '171：麻醉简史', '2017-03-31', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (172, '172：鼻子里的学问', '2017-04-07', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (173, '173：嘴巴里的科学', '2017-04-14', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (174, '174：关于“果实”的奇葩事儿', '2017-04-21', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (175, '175：大登陆时代', '2017-04-28', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (176, '176：无菌术与白大褂', '2017-05-05', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (177, '177：【番外】关于《天文原来是这样》的八个问题', '2017-05-12', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (178, '178：太阳系水世界', '2017-05-12', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (179, '179：水从哪里来？！', '2017-05-19', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (180, '180：【活动】7月15日北京，我们约一个吧~', '2017-05-26', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (181, '181：我们逃不开的“偏见”', '2017-05-26', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (182, '182：AI眼中的世界', '2017-06-02', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (183, '183：大海怪', '2017-06-16', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (184, '184：【特刊】消费电子与我的这30年（1997-2027）', '2017-06-22', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (185, '185：陆与海之歌丨卷一（海爬时代）', '2017-06-23', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (186, '186：【特刊】“要命”的嗓子疼！', '2017-06-30', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (187, '187：输液治疗的前世今生', '2017-07-07', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (188, '188：陆与海之歌丨卷二（鲸鱼王朝）', '2017-07-14', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (189, '189：如果宇宙只有一年', '2017-07-21', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (190, '190：健身前，先听听我的故事', '2017-08-04', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (191, '191：健身入门指南丨原理篇', '2017-08-11', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (192, '192：健身入门指南丨训练篇', '2017-08-11', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (193, '193：【活动】8月20日，我在深圳等你！', '2017-08-12', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (194, '194：健身入门指南丨饮食篇', '2017-08-18', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (195, '195：指纹的秘密', '2017-08-24', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (196, '196：“指纹断案”那些事儿', '2017-09-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (197, '197：电的旅程', '2017-09-08', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (198, '198：电的安全', '2017-09-15', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (199, '199：我们为什么会过敏？！', '2017-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (200, '200：过敏了该怎么办？', '2017-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (201, '201：贫血没那么简单', '2017-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (202, '202：【特刊】FAST找到脉冲星啦！', '2017-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (203, '203：【特刊】黑猩猩真的能崛起嘛？', '2017-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (204, '204：从“双中子星合并”说起', '2017-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (205, '205：你的直觉靠谱吗？', '2017-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (206, '206：【特刊】家电可以是这样的？！', '2017-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (207, '207：感性的力量', '2017-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (208, '208：神秘的第六感？！', '2017-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (209, '209：超能力动物世界（上）', '2017-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (210, '210：超能力动物世界（下）', '2017-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (211, '211：厨房里的科学（上）', '2017-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (212, '212：厨房里的科学（下）', '2017-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (213, '213：泰国再体检报告', '2017-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (214, '214：【年终特辑】2017，一路同行！', '2017-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (215, '215：我们从哪里来？', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (216, '216：从无性到有性', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (217, '217：千奇百怪的“性别”', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (218, '218：不忍直视的“爱情”', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (219, '219：什么是爱情？！', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (220, '220：旺~狗年讲狗', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (221, '221：那些“狗”事儿', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (222, '222：【番外】狗年闯关的试卷分析', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (223, '223：浅谈“文房四宝”', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (224, '224：长颈鹿，你的脖子怎么那么长？！', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (225, '225：【特刊】纪念霍金：巨人的遗产', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (226, '226：充满误会的长颈鹿', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (227, '227：鸟从哪里来？', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (228, '228：颜料的“毒”成分', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (229, '229：我们为什么要吃盐？', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (230, '230：盐从哪里来？', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (231, '231：谢谢小白鼠！', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (232, '232：【特刊】汽车里的黑科技', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (233, '233：谢谢“果蝇”！', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (234, '234：未来的那些事', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (235, '235：我们为什么那么臭？', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (236, '236：大豆为什么如此重要？', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (237, '237：行进土耳其（上）', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (238, '238：行进土耳其（下）', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (239, '239：人们为什么喜欢阴谋论？', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (240, '240：防腐剂有点“冤”？！', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (241, '241：线粒体夏娃', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (242, '242：肤色简史', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (243, '243：世界上最快的家伙', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (244, '244：【特刊】突破，让快更快！', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (245, '245：土与火之歌 | 从陶到瓷', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (246, '246：土与火之歌 | 从中国到世界', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (247, '247：恶之花', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (248, '248：【特刊】工业的过去、现在和未来', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (249, '249：台风是怎样炼成的？', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (250, '250：我们为什么会上瘾？', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (251, '251：从“人工智障”到“人工智能”', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (252, '252：鼠后攻略', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (253, '253：【番外】无中生有的孤独福利', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (254, '254：免疫疗法为什么能抗癌？', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (255, '255：便便是如何拉出来的？', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (256, '256：便便品鉴指南', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (257, '257：进入原子世界', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (258, '258：撞开原子核', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (259, '259：物质的本源', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (260, '260：【番外】精彩的脑洞是会上瘾的！', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (261, '261：大气层之旅', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (262, '262：大气从哪里来？', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (263, '263：【特刊】取暖那些事儿', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (264, '264：我们逃不开的雾霾', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (265, '265：比黄金还贵的“铝”？', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (266, '266：一切命中注定？！', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (267, '267：【特刊】六个关键词回顾科技界的2018！', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (268, '268：【年终特辑】2018，永不言弃', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (269, '269：回不到的过去，看不见的未来', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (270, '270：命运，掌握在自己手中？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (271, '271：拿什么拯救你，我的发际线？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (272, '272：可编程的物质', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (273, '273：猪年谈猪~哼', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (274, '274：钱币往事', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (275, '275：【番外】猪年闯关的试卷分析', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (276, '276：如果地球真去流浪了', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (277, '277：生二胎是怎样的体验？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (278, '278：胚胎历险记丨精子的战争', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (279, '279：胚胎历险记丨从受精卵到胎儿', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (280, '280：胚胎历险记丨向着出生，冲刺！', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (281, '281：深入火山', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (282, '282：意识不到的感觉', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (283, '283：【特刊】直面黑洞丨首张黑洞照片的台前与幕后', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (284, '284：黑洞照片的正确打开方式', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (285, '285：如何设计一枚火箭？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (286, '286：兽族崛起丨哺乳动物的先祖', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (287, '287：大脑是如何学习语言的？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (288, '288：如何杀死一颗草莓？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (289, '289：小心，别触电了！', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (290, '290：【特刊】车钥匙简史', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (291, '291：有趣的“火腿”', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (292, '292：漫游西地中海丨岸上篇', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (293, '293：漫游西地中海丨船上篇', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (294, '294：垃圾分类背后的逻辑', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (295, '295：不靠谱的记忆', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (296, '296：【特刊】声音背后的科学', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (297, '297：【特刊】为了翻山越岭，人类都驯化过哪些坐骑？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (298, '298：节奏感是怎么回事？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (299, '299：【番外】感冒了，交张请假条', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (300, '300：除了鸟，动物都是如何上天的？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (301, '301：云为什么不会掉下来？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (302, '302：月亮上到底有水吗？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (303, '303：【番外】我们终于有书啦！', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (304, '304：我们为什么能“嗅”到？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (305, '305：嗅觉到底有多重要？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (306, '306：其他“人”', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (307, '307：人类起源丨我们为什么直立行走？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (308, '308：人类起源丨我们为什么来自非洲？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (309, '309：植物为什么要吃肉？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (310, '310：我们为什么要呼吸？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (311, '311：遇见尼德兰丨巴黎感觉', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (312, '312：遇见尼德兰丨名画之旅', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (313, '313：重元素从哪来？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (314, '314：“中国机长”究竟经历了什么？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (315, '315：“多重人格”真的存在吗？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (316, '316：反常的黑洞', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (317, '317：雪花为什么是六瓣的？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (318, '318：大萧条与次贷危机', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (319, '319：【特刊】青花椒的故事', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (320, '320：【年终特辑】2019，继续探索！', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (321, '321：“终点”那些事 | 生理篇', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (322, '322：“终点”那些事 | 思想篇', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (323, '323：“终点”那些事 | 永生篇', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (324, '324：鼠年叨鼠~吱', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (325, '325：【番外】鼠年闯关的试卷分析', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (326, '326：水游澳洲', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (327, '327：你所不知的“肺炎” | 呼吸篇', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (328, '328：你所不知的“肺炎” | 病毒篇', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (329, '329：你所不知的“肺炎” | 炎症篇', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (330, '330：你所不知的“肺炎” | 诊疗篇', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (331, '331：【特刊】被龙卷风卷起来会怎样？', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (332, '332：参宿四真要炸了吗？', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (333, '333：面团里的学问', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (334, '334：【特刊】被吸尘器吸进去会怎样？', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (335, '335：什么样的药物是可信的？', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (336, '336：水果为什么这样甜？', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (337, '337：【特刊】步入星际文明，人类还差几步？', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (338, '338：【特刊】系外宜居行星调查', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (339, '339：假消息的真面目（上）', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (340, '340：假消息的真面目（下）', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (341, '341：我们为什么会眨眼？', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (342, '342：银河系到底长啥样？', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (343, '343：无穷大减一是多少？', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (344, '344：【特刊】发明的逻辑', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (345, '345：现代世界的发明者', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (346, '346：兽族崛起 | 龙族的黎明', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (347, '347：兽族崛起 | 与巨龙同行', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (348, '348：兽族崛起 | 走向新生代', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (349, '349：迷信背后的科学', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (350, '350：【特刊】火星，我们来啦！（上）', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (351, '351：【特刊】火星，我们来啦！（中）', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (352, '352：【特刊】火星，我们来啦！（下）', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (353, '353：消暑那些事儿', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (354, '354：长高秘籍', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (355, '355：谢谢“模式生物”！', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (356, '356：我们为什么要撒尿？', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (357, '357：人会被尿憋死吗？', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (358, '358：【特刊】转基因蚊子要来了？', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (359, '359：我们是如何学会说话的？', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (360, '360：神秘的中等质量黑洞', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (361, '361：金星上的生命？', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (362, '362：熵之逆', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (363, '363：【特刊】“黑洞”获诺奖意外吗？', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (364, '364：【特刊】“酸汤子事件”的警示', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (365, '365：海上的高速公路', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (366, '366：如何靠卖“借条”致富？', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (367, '367：潜入深渊', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (368, '368：【特刊】如何潜入深渊？', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (369, '369：【特刊】肠道会左右你的情绪？！', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (370, '370：阿雷西博的遗产', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (371, '371：不一样的颜色', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (372, '372：嫦娥五号的全解析', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (373, '373：【请回答2020】科技视角下的疫情启示录', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (374, '374：走进艾滋病——U医生惊魂记', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (375, '375：【年终特辑】2020，重新出发！', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (376, '376：【特刊】人造子宫真的要来了？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (377, '377：直面肿瘤 |生理篇', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (378, '378：直面肿瘤 | 心理篇', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (379, '379：直面肿瘤 | 诊疗篇', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (380, '380：暖冬里的寒潮？！', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (381, '381：牛年说牛~哞', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (382, '382：【番外】牛年闯关的试卷分析', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (383, '383：牛肉入门指南 | 品种篇', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (384, '384：牛肉入门指南 | 解剖篇', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (385, '385：圆周率要多精确才够用？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (386, '386：如何科学地倒时差？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (387, '387：接种新冠疫苗是怎样的体验？（上）', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (388, '388：接种新冠疫苗是怎样的体验？（下）', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (389, '389：冰之晕 | 日晕是如何形成的？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (390, '390：冰之晕 | 幻日是怎么一回事？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (391, '391：时间之问 | “现在”真的存在吗？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (392, '392：时间之问 | 时间真在“流逝”吗？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (393, '393：筑梦天宫 | 中国空间站将如何搭建？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (394, '394：筑梦天宫 | 我们为什么需要空间站？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (395, '395：肥皂为什么能去污？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (396, '396：“祝融号”会在火星做什么？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (397, '397：超高能天文 | 神秘的宇宙线', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (398, '398：超高能天文 | 最高能的光子', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (399, '399：核辐射之殇 | 物理篇', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (400, '400：核辐射之殇 | 生理篇', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (401, '401：核辐射之殇 | 防护篇', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (402, '402：鱼会被淹死吗？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (403, '403：蜗牛为什么这么慢？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (404, '404：《中国医生》里的急救细节', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (405, '405：你的精神有问题吗？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (406, '406：木头为什么不导电？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (407, '407：蜂蜜里的放射性“铯”？！', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (408, '408：网页是如何打开的？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (409, '409：上海天文馆的正确打开方式（上）', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (410, '410：上海天文馆的正确打开方式（下）', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (411, '411：【特刊】当我们这一代人老去时', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (412, '412：重回“细菌的世界”', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (413, '413：穿越回古代如何吃饭？（上）', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (414, '414：穿越回古代如何吃饭？（下）', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (415, '415：计算群星 | 谈谈女性与航天', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (416, '416：水熊真有这么强？！', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (417, '417：万物之网', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (418, '418：“辣”的本质是什么？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (419, '419：【特刊】屏幕的进化史', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (420, '420：触觉其实有“四种”？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (421, '421：感觉之外的“现实”', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (422, '422：现实是什么？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (423, '423：如何防御一颗小行星？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (424, '424：盲人如何理解颜色？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (425, '425：星星为什么会闪？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (426, '426：【特刊】电动车真的更环保吗？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (427, '427：聊聊“超级鸽王”——詹姆斯·韦布望远镜', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (428, '428：【年终特辑】2021，相伴相依！', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (429, '429：周而复始 | 太阳周期是怎么回事？', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (430, '430：周而复始 | 冰期为何会旋回？', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (431, '431：周而复始 | 火山与银河轨道周期', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (432, '432：虎年话虎~嗷', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (433, '433：【番外】虎年闯关的试卷分析', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (434, '434：冬奥里的“冷”知识', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (435, '435：我们为什么会分心？', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (436, '436：注意力拯救计划', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (437, '437：【番外】我们的新书《生命的战争》', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (438, '438：【番外】《植物的战斗》与《生命的战争》', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (439, '439：人为什么爱喝酒？', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (440, '440：喵~“猫年话猫”', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (441, '441：千姿百态的睡眠', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (442, '442：神秘的宇宙闪光灯——快速射电暴', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (443, '443：蔬菜储存指南', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (444, '444：“大白们”如何做好自我防护？', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (445, '445：物理学的新乌云？！', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (446, '446：烘焙里的科学 | 奶油的变化', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (447, '447：烘焙里的科学 | 神奇的乳化', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (448, '448：你也能懂的微积分', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (449, '449：直击银河系中心黑洞', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (450, '450：如何科学地改掉习惯', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (451, '451：“流星暴雨”真的要来了？！', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (452, '452：手机是如何控制我们的？', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (453, '453：“瘾品化”的产品', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (454, '454：小行星里的氨基酸', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (455, '455：“侏罗纪世界”的恐龙科学吗？', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (456, '456：如果恐龙真的复活了？！', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (457, '457：闪电是如何形成的？', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (458, '458：冰激凌那些事儿', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (459, '459：如果月球可以旅行了？', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (460, '460：世界上最深的洞', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (461, '461：詹姆斯·韦布的“新宇宙”', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (462, '462：深入地心', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (463, '463：什么才是“休克”？', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (464, '464：【特刊】麦克风的进化史', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (465, '465：如何欣赏国画？', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (466, '466：【番外】一起共读《宇宙》吧！', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (467, '467：天文学家被打脸了？！', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (468, '468：计算机病毒为什么越来越少了？', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (469, '469：重回新生代', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (470, '470：新近纪往事', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (471, '471：元宇宙移民！冲吗？', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (472, '472：打个“酱油”吧！', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (473, '473：委屈的味精', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (474, '474：中国空间站这一路', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (475, '475：大闸蟹的一生', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (476, '476：要了命的胸痛', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (477, '477：三亚“躺平”指南', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (478, '478：闰秒要取消了？！', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (479, '479：电池里的学问', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (480, '480：2022，太空里的那些事', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (481, '481：旭岽的新冠开箱', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (482, '482：【年终特辑】2022，否极泰来！', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (483, '483：【特刊】三体科技，需要多久才能走入现实？', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (484, '484：藏在日出时间里的秘密', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (485, '485：“完美的一天”真的存在吗？', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (486, '486：兔年聊兔~啊', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (487, '487：【番外】兔年闯关的试卷分析', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (488, '488：香港“逛吃”指南', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (489, '489：坚果里的困惑（上）', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (490, '490：坚果里的困惑（下）', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (491, '491：【番外】第六届“理性的力量”演讲会即将到来！', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (492, '492：我和ChatGPT聊了一晚上', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (493, '493：多肉漫谈', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (494, '494：岛中湖中岛中湖中岛', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (495, '495：岛屿的魅力', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (496, '496：我和GPT4也聊了一晚上', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (497, '497：糯米为什么没成为主食？', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (498, '498：再问水从哪里来？', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (499, '499：竹子竟然是一种草？！', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (500, '500：沙子为什么不够用了？！', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (501, '501：蚕为什么如此挑食？', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (502, '502：“首张黑洞全景照”的深度解析', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (503, '503：“绫、罗、绸、缎”都是啥？', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (504, '504：瓜里的“瓜”', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (505, '505：发往木星的“果汁”', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (506, '506：眼镜里的奥妙', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (507, '507：寻味马来西亚 | 美食篇', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (508, '508：寻味马来西亚 | 风情篇', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (509, '509：脉冲星里的黑寡妇？！', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (510, '510：一种“很新的”引力波？！', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (511, '511：真实比例的地球', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (512, '512：藻类真的是植物吗？', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (513, '513：塞上追星', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (514, '514：穿越回古代如何旅行？', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (515, '515：懂点键盘乐（上）', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (516, '516：懂点键盘乐（下）', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (517, '517：数字中的禁忌', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (518, '518：我们为什么会失眠？', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (519, '519：中国未来的天文观测圣地', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (520, '520：我们真的离得开塑料吗？', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (521, '521：如何去小行星采矿？', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (522, '522：【特刊】发际线自救指南', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (523, '523：照顾新生儿是怎样的体验？', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (524, '524：逐日阿联酋 | 物价篇', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (525, '525：逐日阿联酋 | 阿布扎比篇', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (526, '526：逐日阿联酋 | 迪拜篇', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (527, '527：穿越回古代如何做美妆博主？', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (528, '528：火箭是如何上天的？', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (529, '529：石油真的快枯竭了吗？', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (530, '530：手把手，教你挖石油！', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (531, '531：忽然消失的三颗恒星？！', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (532, '532：极光与地磁暴', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (533, '533：似曾相识的越南（上）', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (534, '534：似曾相识的越南（下）', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (535, '535：【年终特辑】2023，世界你好！', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (536, '536：我们为什么会欺骗？', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (537, '537：如何识破谎言？', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (538, '538：【特刊】神秘的“第三只眼”', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (539, '539：爱因斯坦的“探针”', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (540, '540：赌徒默示录', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (541, '541：龙年讲龙~哇', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (542, '542：【特刊】2024，一切的不可能都在变得可能', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (543, '543：【番外】龙年闯关的试卷分析', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (544, '544：SORA的价值与危险 | 小原桌001期', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (545, '545：输血的前世今生', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (546, '546：记忆简史 | 磁储存篇', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (547, '547：【十周年特辑】我们一起走过！', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (548, '548：记忆简史 | 光储存篇', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (549, '549：电影公映背后的门道', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (550, '550：Vision Pro 深度体验报告 | 小原桌002期（上）', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (551, '551：MR真的是未来吗？ | 小原桌002期（下）', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (552, '552：原来“是”是这样？！', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (553, '553：改变世界的“草”', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (554, '554：【特刊】声音里的“色盲悖论”？！', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (555, '555：悖论不“悖” | 上篇', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (556, '556：为什么要去月球背面挖土？', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (557, '557：文昌追火箭攻略 | 地点篇', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (558, '558：文昌追火箭攻略 | 感受篇', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (559, '559：如何在国内追极光？ | 上篇', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (560, '560：如何在国内追极光？ | 下篇', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (561, '561：【特刊】咖啡因为什么“上头”？！', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (562, '562：遨游东地中海 | 古希腊篇', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (563, '563：遨游东地中海 | 爱琴海篇', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (564, '564：遨游东地中海 | 亚得里亚海篇', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (565, '565：遨游东地中海 | 威尼斯篇', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (566, '566：悖论不“悖” | 中篇', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (567, '567：悖论不“悖” | 下篇', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (568, '568：如何处理一只鲍鱼？', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (569, '569：干鲍凭什么那么贵？', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (570, '570：丹尼索瓦人的故事', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (571, '571：如何训练一只猫？', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (572, '572：阿尔山寻星记｜风光篇', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (573, '573：阿尔山寻星记｜极光篇', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (574, '574：“把戏”里的科学', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (575, '575：协调月球时', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (576, '576：掰手指数数，最多能数多少？', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (577, '577：我们为什么选择了十进制？', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (578, '578：巴厘感觉（上）', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (579, '579：巴厘感觉（下）', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (580, '580：我和GPT4o又聊了一整晚', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (581, '581：勇闯西海岸｜劝退篇', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (582, '582：勇闯西海岸｜洛杉矶篇', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (583, '583：勇闯西海岸｜拉斯维加斯篇', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (584, '584：勇闯西海岸｜旧金山篇', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (585, '585：“宇宙大爆炸”背后的故事', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (586, '586：【年终特辑】2024，拥抱未来！', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (587, '587：时间的矛盾', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (588, '588：蛇年谈蛇~嘶', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (589, '589：【番外】蛇年闯关的试卷分析', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (590, '590：小行星真的要撞地球了？！（上）', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (591, '591：小行星真的要撞地球了？！（下）', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (592, '592：“软盘”的那些有的没的', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (593, '593：再问“我是谁？”', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (594, '594：记忆简史 | 硅储存篇', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (595, '595：穿越回商代，如何铸一口鼎？', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (596, '596：手把手，教你挖恐龙！', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (597, '597：冰川其实是流动的？！', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (598, '598：古人是如何说话的？', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (599, '599：NASA，危！', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (600, '600：我们为什么会哺乳？', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (601, '601：殷商探源｜商代真的很恐怖吗？', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (602, '602：殷商探源｜甲骨如何进行占卜？', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (603, '603：颠覆你的“对称观”？！', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (604, '604：骨髓移植的前世今生', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (605, '605：天问二号，一场十年的“星际远征”', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (606, '606：回味伊比利亚｜观感篇', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (607, '607：回味伊比利亚｜西班牙篇', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (608, '608：回味伊比利亚｜葡萄牙篇', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (609, '609：手把手，教你建造核电站！', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (610, '610：手把手，教你掌控核聚变！', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (611, '611：广西自然探索笔记', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (612, '612：机器的语言', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (613, '613：岩石其实在流动？！', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (614, '614：如何科学“摆烂”？', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (615, '615：我们为什么喜欢角落？', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (616, '616：西天取星｜喀什篇', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (617, '617：西天取星｜帕米尔篇', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (618, '618：“幽灵粒子”的终极谜题', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (619, '619：星际访客，超速了！', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (620, '620：什么是“面向对象”编程？', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (621, '621：环游西西里', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (622, '622：漫步多瑙河｜维也纳篇', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (623, '623：漫步多瑙河｜布达佩斯篇', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (624, '624：语言是如何演化的？', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (625, '625：【番外】西班牙日全食之旅，招募中！', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (626, '626：电与磁的悲欢离合（上）', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (627, '627：电与磁的悲欢离合（下）', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (628, '628：蓝藻为何“黑化”了？', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (629, '629：古人为什么要烧炭？', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (630, '630：手把手，教你制作“人体冬眠舱”！（上）', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (631, '631：手把手，教你制作“人体冬眠舱”！（下）', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (632, '632：银杏为什么这么臭？', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (633, '633：如何在太空里涮火锅？', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (634, '634：逐句解析《元来是这样》', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (635, '635：【年终特辑】2025，新的路口！', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (636, '636：“水银体温计”为什么要停产？', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (637, '637：键盘往事｜从QWER的起源说起', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (638, '638：键盘往事｜Ctrl、Alt等各种按键的来历', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (639, '639：“车厘子”到底是不是樱桃？', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (640, '640：马年叨马~咴｜动物篇', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (641, '641：马年叨马~咴｜历史篇', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
