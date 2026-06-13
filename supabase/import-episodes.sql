-- 批量导入节目数据（共 641 条）
-- episode_number = 文件行序 (#1-#641)
-- title = 原始文字（保留原始编号或【】格式）
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
VALUES (11, '【番外】微信平台正式上线啦！', '2014-05-13', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (12, '011：土豪时代说“黄金”', '2014-05-13', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (13, '012：一次关于“广播”的广播', '2014-05-21', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (14, '013：味道的秘密', '2014-05-27', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (15, '014：穿越回古代吃些啥？', '2014-06-05', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (16, '015：五谷是哪五谷？', '2014-06-06', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (17, '016：蚊子真挑血型喝?!', '2014-06-11', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (18, '017：蚊子怪谈', '2014-06-18', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (19, '018：真实比例的太阳系（上）', '2014-06-25', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (20, '019：真实比例的太阳系（下）', '2014-06-26', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (21, '【番外】旭岽换搭档啦！', '2014-07-02', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (22, '020：梅雨？霉雨！', '2014-07-02', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (23, '021：足球世界杯之“足球”', '2014-07-09', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (24, '022：足球世界杯之“世界和杯”', '2014-07-09', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (25, '023：先有鸡，还是先有蛋？！', '2014-07-16', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (26, '024：一打“鸡蛋问题”请打包带走！', '2014-07-23', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (27, '025：真实比例的银河系（上）', '2014-07-30', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (28, '026：真实比例的银河系（下）', '2014-07-31', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (29, '027：“脑细胞”那点事儿', '2014-08-06', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (30, '【科普】地震来了怎么办？你必须get的自救手册', '2014-08-13', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (31, '028：我们为什么要睡觉？', '2014-08-13', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (32, '029：一起睡觉吧！', '2014-08-20', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (33, '【番外】和我们聊聊~', '2014-08-20', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (34, '030：如果月亮消失了？！', '2014-08-27', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (35, '031：月球轶事', '2014-09-03', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (36, '032：苹果，不是你们想的那个！', '2014-09-18', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (37, '033：我们为什么会无聊？', '2014-09-10', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (38, '034：向"拖延症"宣战！', '2014-09-25', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (39, '【特刊】电梯出事故怎么办？', '2014-09-30', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (40, '035：百蟹全说', '2014-10-02', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (41, '036：秋天的惊叹', '2014-10-09', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (42, '037：一两银子值多少钱？', '2014-10-16', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (43, '038：流星雨没啥大不了', '2014-10-23', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (44, '039：我们为什么会哭泣?', '2014-10-30', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (45, '040：人真的会哭瞎吗？', '2014-11-06', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (46, '041：水能载舟，亦能毁三观', '2014-11-14', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (47, '042：江与河的区别？', '2014-11-20', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (48, '043：世界上最高的山？！', '2014-11-27', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (49, '044：趁着吃不起之前搞懂巧克力！', '2014-12-05', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (50, '045：坐飞机，你必须知道的常识', '2014-12-11', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (51, '046：飞机上的“便便”去哪了？', '2014-12-18', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (52, '【年终特辑】2014，谢谢你们！', '2014-12-25', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (53, '047：历史上消失的10天', '2015-01-02', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (54, '048：月份和星期的来历', '2015-01-09', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (55, '049：农历其实不是“阴历”', '2015-01-15', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (56, '050：“闰月”到底咋回事？', '2015-01-22', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (57, '051：你的生肖可能错了？！', '2015-01-29', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (58, '052：理解“四维空间”', '2015-02-05', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (59, '053：颠覆你的情人节！', '2015-02-13', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (60, '054：咩～羊年说羊', '2015-02-19', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (61, '055：“A4纸”里的秘密', '2015-03-13', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (62, '056：再从2B铅笔说起！', '2015-03-06', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (63, '057：纸真是中国人发明的吗？', '2015-03-20', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (64, '058：折过的纸如何复原？', '2015-03-27', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (65, '【特刊】解析月全食', '2015-04-04', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (66, '059：一个"联觉者"的自白', '2015-04-10', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (67, '060：我们如何丈量世界？', '2015-04-19', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (68, '061：真实比例的微观世界', '2015-04-24', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (69, '062：穿越回古代如何买房？', '2015-05-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (70, '063：浩劫与重生', '2015-05-08', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (71, '064：我们为什么会恐惧？', '2015-05-15', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (72, '065：恐怖片的秘籍', '2015-05-22', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (73, '066：大脑是家大公司', '2015-05-29', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (74, '【番外】氢OS及寻宝答案', '2015-06-05', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (75, '067：科举和高考，真不是一回事儿！', '2015-06-05', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (76, '068：如何准备一场科举考试？', '2015-06-12', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (77, '069：人为什么要有血型？', '2015-06-19', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (78, '070：血型真和性格有关系？！', '2015-06-26', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (79, '071：关于眼睛的实验课', '2015-07-03', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (80, '072：眼睛其实有盲点', '2015-07-10', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (81, '073：站在冥王星上是一种怎样的感受？', '2015-07-17', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (82, '074：谢谢“腐烂”', '2015-07-24', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (83, '075：彩虹究竟是哪七色？', '2015-07-31', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (84, '076：彩虹为什么是弯的？', '2015-08-07', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (85, '077：夜空为什么是黑的？', '2015-08-14', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (86, '078：减肥的基础课', '2015-08-21', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (87, '079：减肥的正确姿势', '2015-08-28', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (88, '080：我们为什么会做梦？', '2015-09-04', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (89, '【特刊】流星·射电·夏天的星', '2015-09-11', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (90, '081：梦的解释', '2015-09-18', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (91, '082：怀孕是一种怎样的体验？', '2015-09-25', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (92, '083：关于科学家的不科学故事', '2015-10-09', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (93, '084：科学家童年的“神话”', '2015-10-16', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (94, '085：蚁后传', '2015-10-23', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (95, '086：蚂蚁漫谈', '2015-10-30', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (96, '087：闲话宝石', '2015-11-06', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (97, '088：宝石真有神奇的功能？', '2015-11-13', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (98, '089：喝咖啡的正确姿势', '2015-11-20', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (99, '090：咖啡速成指南', '2015-11-27', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (100, '【特刊】《火星救援》的科学剧透', '2015-12-05', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (101, '091：狭义相对论入门', '2015-12-04', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (102, '092：广义相对论浅谈', '2015-12-11', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (103, '093：入埃及记', '2015-12-18', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (104, '【年终特辑】2015，感谢有你！', '2015-12-25', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (105, '094：我们为什么会老去？', '2016-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (106, '095：你到底几岁了？', '2016-01-08', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (107, '096：万物之龄 · 生物篇', '2016-01-15', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (108, '097：万物之龄 · 格物篇', '2016-01-22', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (109, '098：火到底是什么？', '2016-01-29', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (110, '099：穿越回古代如何生火？', '2016-02-05', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (111, '100：吼～猴年话猴', '2016-02-12', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (112, '【番外】原来旭岽是这样？！', '2016-02-19', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (113, '【特刊】宇宙最强音——引力波', '2016-02-19', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (114, '101：馒头的前世今生', '2016-02-26', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (115, '102：细菌的世界', '2016-03-04', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (116, '103：再次颠覆你的星座观', '2016-03-11', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (117, '104：漫游十二星座', '2016-03-18', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (118, '105：跳进黑洞是怎样的体验？', '2016-03-25', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (119, '106：分娩是一种怎样的体验？', '2016-04-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (120, '107：虚数不“虚”', '2016-04-08', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (121, '108：你真的会说话吗？', '2016-04-15', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (122, '109：你真听得懂话吗？', '2016-04-22', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (123, '110：一起吃“醋”吧！', '2016-04-29', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (124, '111：病毒的国度', '2016-05-06', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (125, '112：花儿为什么这样红？', '2016-05-13', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (126, '113：植物的“视觉”', '2016-05-20', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (127, '114：玻璃为什么是透明的？', '2016-05-27', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (128, '115：玻璃是固体吗？！', '2016-06-03', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (129, '116：遇见霸王龙该怎么办？', '2016-06-10', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (130, '117：侏罗纪漫游指南', '2016-06-17', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (131, '118：我们为什么会尴尬？', '2016-06-24', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (132, '119：尴尬为什么会传染？', '2016-07-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (133, '120：植物的“嗅觉”', '2016-07-08', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (134, '121：比无穷大还大？！', '2016-07-15', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (135, '122：蜂王传', '2016-07-22', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (136, '123：谈谈“茶”经', '2016-07-29', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (137, '124：奥运偏门知识扫盲', '2016-08-05', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (138, '125：穿越回古代如何参加奥运？', '2016-08-12', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (139, '126：我们为什么要运动？', '2016-08-19', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (140, '127：颜色的“黑历史”', '2016-08-26', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (141, '128：牛奶的“白知识”', '2016-09-02', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (142, '129：真菌的乐土', '2016-09-09', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (143, '130：土，是有生命的！', '2016-09-16', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (144, '131：秘密的秘密', '2016-09-23', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (145, '132：“强迫症”到底是什么？', '2016-09-30', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (146, '133：“强迫症”还有救么？', '2016-10-07', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (147, '134：住在"红矮星"是怎样的体验？', '2016-10-14', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (148, '135：太阳之死', '2016-10-21', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (149, '136：穿行德意志', '2016-10-28', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (150, '137：我是谁？！', '2016-11-04', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (151, '138：山之重', '2016-11-11', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (152, '139：“油”的学问', '2016-11-18', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (153, '140：钢铁是怎样炼成的？', '2016-11-25', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (154, '141：世界上最“冷”的地方', '2016-12-02', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (155, '142：我们为什么会冷？', '2016-12-09', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (156, '143：雪球地球', '2016-12-16', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (157, '【年终特辑】2016，咱们一起！', '2016-12-27', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (158, '144：初探量子世界', '2017-01-06', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (159, '145：不讲理的量子世界（上）', '2017-01-13', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (160, '146：不讲理的量子世界（下）', '2017-01-13', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (161, '147：隧穿·纠缠·那只猫', '2017-01-20', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (162, '148：叽～鸡年聊鸡', '2017-01-27', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (163, '149：植物有“触觉”吗？！', '2017-02-03', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (164, '150：计算机都在“计算”些什么？', '2017-02-10', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (165, '151：处方真的是“天书”吗？！', '2017-02-17', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (166, '152：大脑是如何让我们说话的？', '2017-02-24', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (167, '153：对不起，我得了“微信恐惧”', '2017-03-03', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (168, '154：古中国的星空', '2017-03-10', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (169, '155：“既视感”到底是什么？！', '2017-03-17', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (170, '156：手术的“黑历史”', '2017-03-24', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (171, '157：麻醉简史', '2017-03-31', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (172, '158：鼻子里的学问', '2017-04-07', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (173, '159：嘴巴里的科学', '2017-04-14', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (174, '160：关于“果实”的奇葩事儿', '2017-04-21', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (175, '161：大登陆时代', '2017-04-28', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (176, '162：无菌术与白大褂', '2017-05-05', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (177, '【番外】关于《天文原来是这样》的八个问题', '2017-05-12', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (178, '163：太阳系水世界', '2017-05-12', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (179, '164：水从哪里来？！', '2017-05-19', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (180, '【活动】7月15日北京，我们约一个吧~', '2017-05-26', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (181, '165：我们逃不开的“偏见”', '2017-05-26', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (182, '166：AI眼中的世界', '2017-06-02', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (183, '167：大海怪', '2017-06-16', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (184, '【特刊】消费电子与我的这30年（1997-2027）', '2017-06-22', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (185, '168：陆与海之歌丨卷一（海爬时代）', '2017-06-23', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (186, '【特刊】“要命”的嗓子疼！', '2017-06-30', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (187, '169：输液治疗的前世今生', '2017-07-07', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (188, '170：陆与海之歌丨卷二（鲸鱼王朝）', '2017-07-14', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (189, '171：如果宇宙只有一年', '2017-07-21', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (190, '172：健身前，先听听我的故事', '2017-08-04', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (191, '173：健身入门指南丨原理篇', '2017-08-11', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (192, '174：健身入门指南丨训练篇', '2017-08-11', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (193, '【活动】8月20日，我在深圳等你！', '2017-08-12', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (194, '175：健身入门指南丨饮食篇', '2017-08-18', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (195, '176：指纹的秘密', '2017-08-24', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (196, '177：“指纹断案”那些事儿', '2017-09-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (197, '178：电的旅程', '2017-09-08', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (198, '179：电的安全', '2017-09-15', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (199, '180：我们为什么会过敏？！', '2017-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (200, '181：过敏了该怎么办？', '2017-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (201, '182：贫血没那么简单', '2017-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (202, '【特刊】FAST找到脉冲星啦！', '2017-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (203, '【特刊】黑猩猩真的能崛起嘛？', '2017-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (204, '183：从“双中子星合并”说起', '2017-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (205, '184：你的直觉靠谱吗？', '2017-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (206, '【特刊】家电可以是这样的？！', '2017-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (207, '185：感性的力量', '2017-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (208, '186：神秘的第六感？！', '2017-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (209, '187：超能力动物世界（上）', '2017-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (210, '188：超能力动物世界（下）', '2017-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (211, '189：厨房里的科学（上）', '2017-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (212, '190：厨房里的科学（下）', '2017-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (213, '191：泰国再体检报告', '2017-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (214, '【年终特辑】2017，一路同行！', '2017-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (215, '192：我们从哪里来？', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (216, '193：从无性到有性', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (217, '194：千奇百怪的“性别”', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (218, '195：不忍直视的“爱情”', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (219, '196：什么是爱情？！', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (220, '197：旺~狗年讲狗', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (221, '198：那些“狗”事儿', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (222, '【番外】狗年闯关的试卷分析', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (223, '199：浅谈“文房四宝”', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (224, '200：长颈鹿，你的脖子怎么那么长？！', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (225, '【特刊】纪念霍金：巨人的遗产', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (226, '201：充满误会的长颈鹿', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (227, '202：鸟从哪里来？', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (228, '203：颜料的“毒”成分', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (229, '204：我们为什么要吃盐？', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (230, '205：盐从哪里来？', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (231, '206：谢谢小白鼠！', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (232, '【特刊】汽车里的黑科技', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (233, '207：谢谢“果蝇”！', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (234, '208：未来的那些事', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (235, '209：我们为什么那么臭？', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (236, '210：大豆为什么如此重要？', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (237, '211：行进土耳其（上）', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (238, '212：行进土耳其（下）', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (239, '213：人们为什么喜欢阴谋论？', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (240, '214：防腐剂有点“冤”？！', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (241, '215：线粒体夏娃', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (242, '216：肤色简史', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (243, '217：世界上最快的家伙', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (244, '【特刊】突破，让快更快！', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (245, '218：土与火之歌 | 从陶到瓷', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (246, '219：土与火之歌 | 从中国到世界', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (247, '220：恶之花', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (248, '【特刊】工业的过去、现在和未来', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (249, '221：台风是怎样炼成的？', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (250, '222：我们为什么会上瘾？', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (251, '223：从“人工智障”到“人工智能”', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (252, '224：鼠后攻略', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (253, '【番外】无中生有的孤独福利', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (254, '225：免疫疗法为什么能抗癌？', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (255, '226：便便是如何拉出来的？', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (256, '227：便便品鉴指南', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (257, '228：进入原子世界', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (258, '229：撞开原子核', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (259, '230：物质的本源', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (260, '【番外】精彩的脑洞是会上瘾的！', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (261, '231：大气层之旅', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (262, '232：大气从哪里来？', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (263, '【特刊】取暖那些事儿', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (264, '233：我们逃不开的雾霾', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (265, '234：比黄金还贵的“铝”？', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (266, '235：一切命中注定？！', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (267, '【特刊】六个关键词回顾科技界的2018！', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (268, '【年终特辑】2018，永不言弃', '2018-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (269, '236：回不到的过去，看不见的未来', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (270, '237：命运，掌握在自己手中？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (271, '238：拿什么拯救你，我的发际线？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (272, '239：可编程的物质', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (273, '240：猪年谈猪~哼', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (274, '241：钱币往事', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (275, '【番外】猪年闯关的试卷分析', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (276, '242：如果地球真去流浪了', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (277, '243：生二胎是怎样的体验？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (278, '244：胚胎历险记丨精子的战争', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (279, '245：胚胎历险记丨从受精卵到胎儿', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (280, '246：胚胎历险记丨向着出生，冲刺！', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (281, '247：深入火山', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (282, '248：意识不到的感觉', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (283, '【特刊】直面黑洞丨首张黑洞照片的台前与幕后', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (284, '249：黑洞照片的正确打开方式', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (285, '250：如何设计一枚火箭？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (286, '251：兽族崛起丨哺乳动物的先祖', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (287, '252：大脑是如何学习语言的？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (288, '253：如何杀死一颗草莓？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (289, '254：小心，别触电了！', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (290, '【特刊】车钥匙简史', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (291, '255：有趣的“火腿”', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (292, '256：漫游西地中海丨岸上篇', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (293, '257：漫游西地中海丨船上篇', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (294, '258：垃圾分类背后的逻辑', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (295, '259：不靠谱的记忆', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (296, '【特刊】声音背后的科学', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (297, '【特刊】为了翻山越岭，人类都驯化过哪些坐骑？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (298, '260：节奏感是怎么回事？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (299, '【番外】感冒了，交张请假条', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (300, '261：除了鸟，动物都是如何上天的？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (301, '262：云为什么不会掉下来？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (302, '263：月亮上到底有水吗？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (303, '【番外】我们终于有书啦！', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (304, '264：我们为什么能“嗅”到？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (305, '265：嗅觉到底有多重要？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (306, '266：其他“人”', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (307, '267：人类起源丨我们为什么直立行走？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (308, '268：人类起源丨我们为什么来自非洲？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (309, '269：植物为什么要吃肉？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (310, '270：我们为什么要呼吸？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (311, '271：遇见尼德兰丨巴黎感觉', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (312, '272：遇见尼德兰丨名画之旅', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (313, '273：重元素从哪来？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (314, '274：“中国机长”究竟经历了什么？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (315, '275：“多重人格”真的存在吗？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (316, '276：反常的黑洞', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (317, '277：雪花为什么是六瓣的？', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (318, '278：大萧条与次贷危机', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (319, '【特刊】青花椒的故事', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (320, '【年终特辑】2019，继续探索！', '2019-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (321, '279：“终点”那些事 | 生理篇', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (322, '280：“终点”那些事 | 思想篇', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (323, '281：“终点”那些事 | 永生篇', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (324, '282：鼠年叨鼠~吱', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (325, '【番外】鼠年闯关的试卷分析', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (326, '283：水游澳洲', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (327, '284：你所不知的“肺炎” | 呼吸篇', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (328, '285：你所不知的“肺炎” | 病毒篇', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (329, '286：你所不知的“肺炎” | 炎症篇', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (330, '287：你所不知的“肺炎” | 诊疗篇', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (331, '【特刊】被龙卷风卷起来会怎样？', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (332, '288：参宿四真要炸了吗？', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (333, '289：面团里的学问', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (334, '【特刊】被吸尘器吸进去会怎样？', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (335, '290：什么样的药物是可信的？', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (336, '291：水果为什么这样甜？', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (337, '【特刊】步入星际文明，人类还差几步？', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (338, '【特刊】系外宜居行星调查', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (339, '292：假消息的真面目（上）', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (340, '293：假消息的真面目（下）', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (341, '294：我们为什么会眨眼？', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (342, '295：银河系到底长啥样？', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (343, '296：无穷大减一是多少？', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (344, '【特刊】发明的逻辑', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (345, '297：现代世界的发明者', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (346, '298：兽族崛起 | 龙族的黎明', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (347, '299：兽族崛起 | 与巨龙同行', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (348, '300：兽族崛起 | 走向新生代', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (349, '301：迷信背后的科学', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (350, '【特刊】火星，我们来啦！（上）', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (351, '【特刊】火星，我们来啦！（中）', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (352, '【特刊】火星，我们来啦！（下）', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (353, '302：消暑那些事儿', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (354, '303：长高秘籍', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (355, '304：谢谢“模式生物”！', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (356, '305：我们为什么要撒尿？', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (357, '306：人会被尿憋死吗？', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (358, '【特刊】转基因蚊子要来了？', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (359, '307：我们是如何学会说话的？', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (360, '308：神秘的中等质量黑洞', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (361, '309：金星上的生命？', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (362, '310：熵之逆', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (363, '【特刊】“黑洞”获诺奖意外吗？', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (364, '【特刊】“酸汤子事件”的警示', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (365, '311：海上的高速公路', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (366, '312：如何靠卖“借条”致富？', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (367, '313：潜入深渊', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (368, '【特刊】如何潜入深渊？', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (369, '【特刊】肠道会左右你的情绪？！', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (370, '314：阿雷西博的遗产', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (371, '315：不一样的颜色', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (372, '316：嫦娥五号的全解析', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (373, '【请回答2020】科技视角下的疫情启示录', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (374, '317：走进艾滋病——U医生惊魂记', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (375, '【年终特辑】2020，重新出发！', '2020-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (376, '【特刊】人造子宫真的要来了？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (377, '318：直面肿瘤 |生理篇', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (378, '319：直面肿瘤 | 心理篇', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (379, '320：直面肿瘤 | 诊疗篇', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (380, '321：暖冬里的寒潮？！', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (381, '322：牛年说牛~哞', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (382, '【番外】牛年闯关的试卷分析', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (383, '323：牛肉入门指南 | 品种篇', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (384, '324：牛肉入门指南 | 解剖篇', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (385, '325：圆周率要多精确才够用？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (386, '326：如何科学地倒时差？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (387, '327：接种新冠疫苗是怎样的体验？（上）', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (388, '328：接种新冠疫苗是怎样的体验？（下）', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (389, '329：冰之晕 | 日晕是如何形成的？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (390, '330：冰之晕 | 幻日是怎么一回事？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (391, '331：时间之问 | “现在”真的存在吗？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (392, '332：时间之问 | 时间真在“流逝”吗？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (393, '333：筑梦天宫 | 中国空间站将如何搭建？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (394, '334：筑梦天宫 | 我们为什么需要空间站？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (395, '335：肥皂为什么能去污？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (396, '336：“祝融号”会在火星做什么？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (397, '337：超高能天文 | 神秘的宇宙线', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (398, '338：超高能天文 | 最高能的光子', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (399, '339：核辐射之殇 | 物理篇', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (400, '340：核辐射之殇 | 生理篇', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (401, '341：核辐射之殇 | 防护篇', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (402, '342：鱼会被淹死吗？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (403, '343：蜗牛为什么这么慢？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (404, '344：《中国医生》里的急救细节', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (405, '345：你的精神有问题吗？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (406, '346：木头为什么不导电？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (407, '347：蜂蜜里的放射性“铯”？！', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (408, '348：网页是如何打开的？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (409, '349：上海天文馆的正确打开方式（上）', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (410, '350：上海天文馆的正确打开方式（下）', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (411, '【特刊】当我们这一代人老去时', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (412, '351：重回“细菌的世界”', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (413, '352：穿越回古代如何吃饭？（上）', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (414, '353：穿越回古代如何吃饭？（下）', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (415, '354：计算群星 | 谈谈女性与航天', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (416, '355：水熊真有这么强？！', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (417, '356：万物之网', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (418, '357：“辣”的本质是什么？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (419, '【特刊】屏幕的进化史', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (420, '358：触觉其实有“四种”？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (421, '359：感觉之外的“现实”', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (422, '360：现实是什么？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (423, '361：如何防御一颗小行星？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (424, '362：盲人如何理解颜色？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (425, '363：星星为什么会闪？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (426, '【特刊】电动车真的更环保吗？', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (427, '364：聊聊“超级鸽王”——詹姆斯·韦布望远镜', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (428, '【年终特辑】2021，相伴相依！', '2021-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (429, '365：周而复始 | 太阳周期是怎么回事？', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (430, '366：周而复始 | 冰期为何会旋回？', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (431, '367：周而复始 | 火山与银河轨道周期', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (432, '368：虎年话虎~嗷', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (433, '【番外】虎年闯关的试卷分析', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (434, '369：冬奥里的“冷”知识', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (435, '370：我们为什么会分心？', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (436, '371：注意力拯救计划', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (437, '【番外】我们的新书《生命的战争》', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (438, '【番外】《植物的战斗》与《生命的战争》', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (439, '372：人为什么爱喝酒？', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (440, '373：喵~“猫年话猫”', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (441, '374：千姿百态的睡眠', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (442, '375：神秘的宇宙闪光灯——快速射电暴', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (443, '376：蔬菜储存指南', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (444, '377：“大白们”如何做好自我防护？', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (445, '378：物理学的新乌云？！', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (446, '379：烘焙里的科学 | 奶油的变化', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (447, '380：烘焙里的科学 | 神奇的乳化', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (448, '381：你也能懂的微积分', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (449, '382：直击银河系中心黑洞', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (450, '383：如何科学地改掉习惯', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (451, '384：“流星暴雨”真的要来了？！', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (452, '385：手机是如何控制我们的？', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (453, '386：“瘾品化”的产品', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (454, '387：小行星里的氨基酸', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (455, '388：“侏罗纪世界”的恐龙科学吗？', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (456, '389：如果恐龙真的复活了？！', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (457, '390：闪电是如何形成的？', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (458, '391：冰激凌那些事儿', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (459, '392：如果月球可以旅行了？', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (460, '393：世界上最深的洞', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (461, '394：詹姆斯·韦布的“新宇宙”', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (462, '395：深入地心', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (463, '396：什么才是“休克”？', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (464, '【特刊】麦克风的进化史', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (465, '397：如何欣赏国画？', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (466, '【番外】一起共读《宇宙》吧！', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (467, '398：天文学家被打脸了？！', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (468, '399：计算机病毒为什么越来越少了？', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (469, '400：重回新生代', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (470, '401：新近纪往事', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (471, '402：元宇宙移民！冲吗？', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (472, '403：打个“酱油”吧！', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (473, '404：委屈的味精', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (474, '405：中国空间站这一路', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (475, '406：大闸蟹的一生', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (476, '407：要了命的胸痛', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (477, '408：三亚“躺平”指南', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (478, '409：闰秒要取消了？！', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (479, '410：电池里的学问', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (480, '411：2022，太空里的那些事', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (481, '412：旭岽的新冠开箱', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (482, '【年终特辑】2022，否极泰来！', '2022-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (483, '【特刊】三体科技，需要多久才能走入现实？', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (484, '413：藏在日出时间里的秘密', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (485, '414：“完美的一天”真的存在吗？', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (486, '415：兔年聊兔~啊', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (487, '【番外】兔年闯关的试卷分析', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (488, '416：香港“逛吃”指南', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (489, '417：坚果里的困惑（上）', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (490, '418：坚果里的困惑（下）', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (491, '【番外】第六届“理性的力量”演讲会即将到来！', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (492, '419：我和ChatGPT聊了一晚上', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (493, '420：多肉漫谈', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (494, '421：岛中湖中岛中湖中岛', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (495, '422：岛屿的魅力', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (496, '423：我和GPT4也聊了一晚上', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (497, '424：糯米为什么没成为主食？', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (498, '425：再问水从哪里来？', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (499, '426：竹子竟然是一种草？！', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (500, '427：沙子为什么不够用了？！', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (501, '428：蚕为什么如此挑食？', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (502, '429：“首张黑洞全景照”的深度解析', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (503, '430：“绫、罗、绸、缎”都是啥？', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (504, '431：瓜里的“瓜”', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (505, '432：发往木星的“果汁”', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (506, '433：眼镜里的奥妙', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (507, '434：寻味马来西亚 | 美食篇', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (508, '435：寻味马来西亚 | 风情篇', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (509, '436：脉冲星里的黑寡妇？！', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (510, '437：一种“很新的”引力波？！', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (511, '438：真实比例的地球', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (512, '439：藻类真的是植物吗？', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (513, '440：塞上追星', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (514, '441：穿越回古代如何旅行？', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (515, '442：懂点键盘乐（上）', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (516, '443：懂点键盘乐（下）', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (517, '444：数字中的禁忌', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (518, '445：我们为什么会失眠？', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (519, '446：中国未来的天文观测圣地', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (520, '447：我们真的离得开塑料吗？', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (521, '448：如何去小行星采矿？', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (522, '【特刊】发际线自救指南', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (523, '449：照顾新生儿是怎样的体验？', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (524, '450：逐日阿联酋 | 物价篇', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (525, '451：逐日阿联酋 | 阿布扎比篇', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (526, '452：逐日阿联酋 | 迪拜篇', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (527, '453：穿越回古代如何做美妆博主？', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (528, '454：火箭是如何上天的？', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (529, '455：石油真的快枯竭了吗？', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (530, '456：手把手，教你挖石油！', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (531, '457：忽然消失的三颗恒星？！', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (532, '458：极光与地磁暴', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (533, '459：似曾相识的越南（上）', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (534, '460：似曾相识的越南（下）', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (535, '【年终特辑】2023，世界你好！', '2023-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (536, '461：我们为什么会欺骗？', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (537, '462：如何识破谎言？', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (538, '【特刊】神秘的“第三只眼”', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (539, '463：爱因斯坦的“探针”', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (540, '464：赌徒默示录', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (541, '465：龙年讲龙~哇', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (542, '【特刊】2024，一切的不可能都在变得可能', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (543, '【番外】龙年闯关的试卷分析', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (544, '466：SORA的价值与危险 | 小原桌001期', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (545, '467：输血的前世今生', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (546, '468：记忆简史 | 磁储存篇', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (547, '【十周年特辑】我们一起走过！', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (548, '469：记忆简史 | 光储存篇', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (549, '470：电影公映背后的门道', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (550, '471：Vision Pro 深度体验报告 | 小原桌002期（上）', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (551, '472：MR真的是未来吗？ | 小原桌002期（下）', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (552, '473：原来“是”是这样？！', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (553, '474：改变世界的“草”', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (554, '【特刊】声音里的“色盲悖论”？！', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (555, '475：悖论不“悖” | 上篇', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (556, '476：为什么要去月球背面挖土？', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (557, '477：文昌追火箭攻略 | 地点篇', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (558, '478：文昌追火箭攻略 | 感受篇', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (559, '479：如何在国内追极光？ | 上篇', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (560, '480：如何在国内追极光？ | 下篇', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (561, '【特刊】咖啡因为什么“上头”？！', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (562, '481：遨游东地中海 | 古希腊篇', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (563, '482：遨游东地中海 | 爱琴海篇', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (564, '483：遨游东地中海 | 亚得里亚海篇', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (565, '484：遨游东地中海 | 威尼斯篇', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (566, '485：悖论不“悖” | 中篇', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (567, '486：悖论不“悖” | 下篇', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (568, '487：如何处理一只鲍鱼？', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (569, '488：干鲍凭什么那么贵？', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (570, '489：丹尼索瓦人的故事', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (571, '490：如何训练一只猫？', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (572, '491：阿尔山寻星记｜风光篇', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (573, '492：阿尔山寻星记｜极光篇', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (574, '493：“把戏”里的科学', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (575, '494：协调月球时', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (576, '495：掰手指数数，最多能数多少？', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (577, '496：我们为什么选择了十进制？', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (578, '497：巴厘感觉（上）', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (579, '498：巴厘感觉（下）', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (580, '499：我和GPT4o又聊了一整晚', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (581, '500：勇闯西海岸｜劝退篇', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (582, '501：勇闯西海岸｜洛杉矶篇', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (583, '502：勇闯西海岸｜拉斯维加斯篇', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (584, '503：勇闯西海岸｜旧金山篇', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (585, '504：“宇宙大爆炸”背后的故事', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (586, '【年终特辑】2024，拥抱未来！', '2024-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (587, '505：时间的矛盾', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (588, '506：蛇年谈蛇~嘶', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (589, '【番外】蛇年闯关的试卷分析', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (590, '507：小行星真的要撞地球了？！（上）', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (591, '508：小行星真的要撞地球了？！（下）', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (592, '509：“软盘”的那些有的没的', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (593, '510：再问“我是谁？”', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (594, '511：记忆简史 | 硅储存篇', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (595, '512：穿越回商代，如何铸一口鼎？', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (596, '513：手把手，教你挖恐龙！', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (597, '514：冰川其实是流动的？！', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (598, '515：古人是如何说话的？', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (599, '516：NASA，危！', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (600, '517：我们为什么会哺乳？', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (601, '518：殷商探源｜商代真的很恐怖吗？', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (602, '519：殷商探源｜甲骨如何进行占卜？', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (603, '520：颠覆你的“对称观”？！', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (604, '521：骨髓移植的前世今生', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (605, '522：天问二号，一场十年的“星际远征”', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (606, '523：回味伊比利亚｜观感篇', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (607, '524：回味伊比利亚｜西班牙篇', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (608, '525：回味伊比利亚｜葡萄牙篇', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (609, '526：手把手，教你建造核电站！', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (610, '527：手把手，教你掌控核聚变！', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (611, '528：广西自然探索笔记', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (612, '529：机器的语言', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (613, '530：岩石其实在流动？！', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (614, '531：如何科学“摆烂”？', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (615, '532：我们为什么喜欢角落？', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (616, '533：西天取星｜喀什篇', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (617, '534：西天取星｜帕米尔篇', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (618, '535：“幽灵粒子”的终极谜题', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (619, '536：星际访客，超速了！', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (620, '537：什么是“面向对象”编程？', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (621, '538：环游西西里', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (622, '539：漫步多瑙河｜维也纳篇', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (623, '540：漫步多瑙河｜布达佩斯篇', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (624, '541：语言是如何演化的？', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (625, '【番外】西班牙日全食之旅，招募中！', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (626, '542：电与磁的悲欢离合（上）', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (627, '543：电与磁的悲欢离合（下）', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (628, '544：蓝藻为何“黑化”了？', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (629, '545：古人为什么要烧炭？', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (630, '546：手把手，教你制作“人体冬眠舱”！（上）', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (631, '547：手把手，教你制作“人体冬眠舱”！（下）', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (632, '548：银杏为什么这么臭？', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (633, '549：如何在太空里涮火锅？', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (634, '550：逐句解析《元来是这样》', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (635, '【年终特辑】2025，新的路口！', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (636, '551：“水银体温计”为什么要停产？', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (637, '552：键盘往事｜从QWER的起源说起', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (638, '553：键盘往事｜Ctrl、Alt等各种按键的来历', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (639, '554：“车厘子”到底是不是樱桃？', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (640, '555：马年叨马~咴｜动物篇', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
INSERT INTO episodes (episode_number, title, publish_date, duration, status)
VALUES (641, '556：马年叨马~咴｜历史篇', '2025-01-01', 0, 'published')
ON CONFLICT (episode_number) DO UPDATE SET title = EXCLUDED.title, publish_date = EXCLUDED.publish_date, status = 'published';
