CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `animal`
--

DROP TABLE IF EXISTS `animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cage_id` int DEFAULT NULL,
  `is_sick` bit(1) NOT NULL,
  `weight` float NOT NULL,
  `date_in` date NOT NULL,
  `date_out` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal`
--

LOCK TABLES `animal` WRITE;
/*!40000 ALTER TABLE `animal` DISABLE KEYS */;
INSERT INTO `animal` VALUES (5,15,_binary '',111,'2022-11-25','2022-12-11'),(6,14,_binary '\0',112,'2022-11-19','2022-11-20'),(7,1,_binary '\0',111,'2022-11-19','2022-11-26'),(8,2,_binary '\0',111,'2022-11-23','2022-12-11');
/*!40000 ALTER TABLE `animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `gender` bit(1) NOT NULL,
  `email` varchar(45) NOT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `birthday` datetime(6) DEFAULT NULL,
  `identity_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_employee_user1_idx` (`username`),
  CONSTRAINT `fk_employee_user1` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Nguyễn Phú Lĩnh','linh1234',_binary '','linhnguyen3@gmail.com','https://photocross.net/wp-content/uploads/2020/03/anh-chan-dung.jpg','2001-12-19 00:00:00.000000','401232347'),(2,'Chu Đức Anh','anh1234',_binary '','chanhducu@gmail.com','https://inanh.net/wp-content/uploads/2020/07/chup-anh-chan-dung-dep-4.png','2002-12-14 00:00:00.000000','234531325'),(24,'Phi Duy','duy1234',_binary '','tamgiang12b@gmail.com','https://inanh.net/wp-content/uploads/2020/07/chup-anh-chan-dung-dep-4.png','2002-02-14 00:00:00.000000','123456789'),(25,'Anh Phương','phuong1234',_binary '','phuong@gmail.com','https://photocross.net/wp-content/uploads/2020/03/anh-chan-dung.jpg','1996-12-05 00:00:00.000000','143562784'),(26,'Hải  TT','hai1234',_binary '\0','hai@gmail.com','https://photocross.net/wp-content/uploads/2020/03/anh-chan-dung.jpg','1995-12-27 00:00:00.000000','143562783'),(27,'Văn Công','cong1234',_binary '\0','cong@gmail.com','https://photocross.net/wp-content/uploads/2020/03/anh-chan-dung.jpg','1998-03-21 00:00:00.000000','143562783'),(28,'Hữu Chánh','chanh1234',_binary '','chanh@gmail.com','https://photocross.net/wp-content/uploads/2020/03/anh-chan-dung.jpg','1994-09-12 00:00:00.000000','123987654'),(29,'Lê Thanh Thái','thai1234',_binary '','thai@gmail.com','https://photocross.net/wp-content/uploads/2020/03/anh-chan-dung.jpg','1992-09-29 00:00:00.000000','19008765');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `author` varchar(255) DEFAULT NULL,
  `content` longtext NOT NULL,
  `date_create` date DEFAULT NULL,
  `first_sentence` text NOT NULL,
  `source_url` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'NVA','<p style=\"text-align: justify;\">Năm 2022, Trung tâm tiếp tục thực hiện mô hình nuôi thâm canh bò chất lượng cao (sử dụng giống bò lai Kobe 6 - 12 tháng tuổi) kết hợp với trồng cỏ, quy mô 5 con bò và 2.500 m<sup>2</sup> đất để trồng cỏ, tại 2 xã Bình Nghi và Bình Thành, huyện Tây Sơn. Các hộ tham gia thực hiện mô hình được Nhà nước hỗ trợ 50% chi phí vật tư về thuốc và giống cỏ Mulato. Các hộ dân tham gia mô hình phải đảm bảo các điều kiện về chuồng trại nuôi nhốt, có bò Kobe ở giai đoạn 6 - 12 tháng tuổi, trọng lượng bình quân khoảng 230 kg/con, được nuôi với mục đích hướng thịt.\n\n          </p>\n          <p style=\"text-align: center;\"><img alt=\"nuôi bò Kobe\" src=\"https://nguoichannuoi.vn/upload_images/images/nha-nong-lam-giau/nuoi-bo-kobe(1).jpg\" style=\"width: 800px; height: 524px;\">\n\n          </p>\n          <p style=\"text-align: center;\"><em><span style=\"text-align: justify;\">Mô hình nuôi thâm canh bò Kobe tại 2 xã Bình Nghi và Bình Thành, huyện Tây Sơn đạt kết quả tốt. Ảnh: THÀNH NGUYÊN</span></em>\n          </p>\n          <p style=\"text-align: justify;\">Mới đây, Trung tâm tổ chức hội thảo nhằm đánh giá hiệu quả và khả năng nhân rộng mô hình. Kết quả sơ bộ cho thấy, sau 7 tháng nuôi, trọng lượng bò bình quân đạt 372,4 kg/con, năng suất cỏ đạt 4,7 tấn/2.500 m<sup>2</sup>; lợi nhuận ước đạt hơn 6 triệu đồng/con.\n          </p>\n          <p style=\"text-align: justify;\">Theo nhận xét của các hộ dân tham gia mô hình, bò Kobe là vật nuôi mới nên ban đầu có nhiều bỡ ngỡ. Tuy nhiên, đây là vật nuôi có giá trị kinh tế cao, dễ nuôi, ít bệnh so với nhiều giống bò lai đã từng nuôi, nên sau khi kết thúc mô hình, các hộ nuôi sẽ tiếp tục đầu tư và mở rộng quy mô trang trại của gia đình để phát triển loài vật nuôi mới này.\n\n          </p>\n          <p style=\"text-align: justify;\">Ông Huỳnh Việt Hùng, Giám đốc Trung tâm Khuyến nông Bình Định, cho biết: Bò Kobe có nguồn gốc từ Nhật Bản, thịt thơm ngon, hàm lượng dinh dưỡng cao. Tuy là đối tượng nuôi mới nhưng đây là loài vật nuôi hứa hẹn đem lại hiệu quả kinh tế cao trong thời gian tới. Từ mô hình này sẽ góp phần thay đổi nhận thức, tập quán chăn nuôi bò của người dân, chuyển từ chăn nuôi thả tự nhiên, tự phát sang chăn nuôi có đầu tư và ứng dụng các tiến bộ KHKT mang lại giá trị kinh tế cao. Với kết quả thực tiễn mang lại, trong thời gian tới, Trung tâm Khuyến nông Bình Định sẽ tiếp tục triển khai và nhân rộng mô hình trên các địa bàn trong tỉnh, qua đó góp phần vào việc thúc đẩy ngành chăn nuôi phát triển ngày càng bền vững.\n\n          </p>\n          <p style=\"text-align: right;\"><strong>Thành Nguyên</strong>\n\n          </p>\n          <p style=\"text-align: right;\"><em>Nguồn: Báo Bình Định</em> </p>','2022-12-12','Để thúc đẩy ngành chăn nuôi phát triển theo hướng bền vững, nhiều năm qua, Trung tâm Khuyến nông Bình Định đã triển khai nhiều mô hình chăn nuôi bò thịt chất lượng cao.','https://nguoichannuoi.vn/upload_images/images/nha-nong-lam-giau/nuoi-bo-kobe(1).jpg','Nuôi thâm canh bò thịt Kobe đạt hiệu quả cao'),(2,'NVB','<h2 style=\"text-align: justify;\">Ðối với chuồng trại</h2>\n<p style=\"text-align: justify;\">Cần che chắn chuồng trại, tránh mưa tạt, gió lùa bằng hệ thống bạt dễ thao tác và tháo lắp khi thời tiết thay đổi đột ngột. Khi nhiệt độ môi trường giảm hoặc xuống thấp cần chuẩn bị thiết bị sưởi như bóng điện, chụp sưởi… chuẩn bị chất độn chuồng như trấu, mùn cưa… để giữ ấm cho đàn vật nuôi (nhất là gia súc, gia cầm còn non, mới đẻ). \n\n</p>\n<p style=\"text-align: justify;\">Tăng cường thu gom chất thải, quét dọn chuồng nuôi, hàng ngày rửa sạch máng ăn, máng uống. Ðịnh kỳ phun sát trùng chuồng nuôi và khu vực xung quanh chuồng bằng các loại hóa chất như vôi bột, Iodine,Virkon… (khu vực xung quanh chuồng nuôi ít nhất tháng 1 lần, trong chuồng nuôi ít nhất tháng 2 lần). Ðồng thời, phát quang bụi rậm, khơi thông cống rãnh để hạn chế nơi trú ẩn của các vật trung gian truyền bệnh như ruồi, muỗi, ve, rận, bọ chuột… \n\n</p>\n<p style=\"text-align: center;\"><img alt=\"chăm sóc vật nuôi thời điểm giao mùa\" src=\"https://nguoichannuoi.vn/upload_images/images/khoa-hoc-ky-thuat-chan-nuoi/cham-soc-gia-cam-giao-mua.jpg\" style=\"width: 800px; height: 488px;\"> \n\n</p>\n<p style=\"text-align: justify;\">&nbsp; \n\n</p>\n<h2 style=\"text-align: justify;\">Chăm sóc, nuôi dưỡng</h2>\n<p style=\"text-align: justify;\">Cung cấp thức ăn, nước uống sạch sẽ, dễ tiêu, phù hợp với lứa tuổi của vật nuôi. Ðồng thời bổ sung điện giải B - Complex, vitamin, men tiêu hóa nhằm nâng cao sức đề kháng cho con vật. \n\n</p>\n<p style=\"text-align: justify;\">&nbsp;Ðối với heo con tập ăn và gà con ở giai đoạn úm, tốt nhất nên sử dụng thức ăn hỗn hợp hoàn chỉnh để đảm bảo đủ dinh dưỡng. \n\n</p>\n<p style=\"text-align: justify;\">Với trâu, bò, dê, cừu, cần cân đối lượng thức ăn thô xanh và thức ăn tinh, chủ động nguồn thức ăn bằng biện pháp dự trữ rơm khô, ủ chua thức ăn xanh nhằm đáp ứng nhu cầu thức ăn cho con vật trong thời điểm khan hiếm cỏ. \n\n</p>\n<p style=\"text-align: justify;\">Những ngày nhiệt độ xuống thấp, trời lạnh cần cho con vật uống nước ấm, thực hiện tốt quy trình úm cho gia cầm giai đoạn nhỏ. Với bê nghé non cho đi chăn thả muộn, cho về sớm hạn chế vật nuôi bị nhiễm lạnh.                         \n                        \n\n</p>\n<p style=\"text-align: justify;\">&nbsp; \n\n</p>\n<h2 style=\"text-align: justify;\">Phòng bệnh</h2>\n<p style=\"text-align: justify;\">Thực hiện tiêm vaccine phòng bệnh đầy đủ, đúng lịch cho gia súc, gia cầm theo hướng dẫn của cơ quan thú y. \n\n</p>\n<p style=\"text-align: justify;\">Có thể sử dụng các loại thảo mộc có thành phần kháng sinh như tỏi, gừng, nghệ… trộn vào thức ăn hoặc nước uống của vật nuôi để phòng một số bệnh thường gặp khi thời tiết thay đổi đột ngột như hen suyễn, tiêu chảy, tụ huyết trùng, CRD… \n\n</p>\n<p style=\"text-align: justify;\">Với gia súc, gia cầm có nhu cầu vận chuyển từ nơi này sang nơi khác cần chú ý đảm bảo đúng quy trình vận chuyển, thực hiện nghiêm kiểm dịch vận chuyển để đảm bảo an toàn dịch bệnh. \n\n</p>\n<p style=\"text-align: justify;\">Khi mua giống vật nuôi mới về, cần nuôi tại khu nuôi cách ly theo dõi ít nhất 10 - 15 ngày, khi con giống hoàn toàn khỏe mạnh mới nhập vào khu chăn nuôi chính. \n\n</p>\n<p style=\"text-align: justify;\">Hàng ngày kiểm tra theo dõi sức khỏe của đàn vật nuôi để phát hiện sớm những con có biểu hiện không bình thường (bỏ ăn, sốt, ho, thở nhanh, tiếng thở khò khè, thích nằm…) cần tách riêng để theo dõi, điều trị. Nếu thấy gia súc, gia cầm có biểu hiện triệu chứng nặng, lây lan nhanh cần báo ngay cho cán bộ thú y để có biện pháp xử lý kịp thời. \n\n</p>\n<p style=\"text-align: right;\"><strong>Trung tâm Khuyến nông&nbsp;Ninh Bình</strong>                      </p>','2022-12-11','Vào giai đoạn giao mùa, thời tiết thay đổi thất thường khiến vật nuôi không kịp thích nghi, sức đề kháng giảm. Vì vậy để đảm bảo sức khỏe và nâng cao sức đề kháng cho đàn vật nuôi, người chăn nuôi cần áp dụng tốt các biện pháp chăm sóc','https://nguoichannuoi.vn/upload_images/images/khoa-hoc-ky-thuat-chan-nuoi/cham-soc-gia-cam-giao-mua.jpg','Chăm sóc gia súc, gia cầm thời điểm giao mùa'),(3,'NVC','<p style=\"text-align: justify;\"><strong>- Nguyên nhân:&nbsp;</strong>Bệnh do một loại tiên mao trùng gây nên, sống ký sinh trong máu của con vật. Bệnh nhiễm qua đường máu do các loại ruồi muỗi hút máu truyền bệnh. Bệnh còn lây qua đường tiêu hóa, đường phân, xảy ra ở mọi lứa tuổi.\n\n          </p>\n          <p style=\"text-align: center;\"><img alt=\"bệnh ký sinh trùng cho trâu bò ngựa\" src=\"https://nguoichannuoi.vn/upload_images/images/khoa-hoc-ky-thuat-chan-nuoi/nuoi-bo-bac-giang.jpg\" style=\"width: 800px; height: 450px;\">\n\n          </p>\n          <p style=\"text-align: center;\"><em><span style=\"text-align: justify;\">Cán bộ Trung tâm Dịch vụ và Kỹ thuật nông nghiệp Yên Thế hướng dẫn người dân xã Canh Nậu phòng dịch cho đàn bò</span></em>\n\n          </p>\n          <p style=\"text-align: justify;\"><strong>- Triệu chứng:</strong>&nbsp;Con vật bị bệnh có các triệu chứng như sốt cao từ 40 - 41 độ C. Sốt 1 - 2 ngày liền, sau đó nhiệt độ hạ xuống mức bình thường. Sau 2 - 6 ngày, nhiệt độ lại tăng, cứ như thế lặp đi lặp lại nhiều đợt (sốt làn sóng). Khi con vật sốt cao thường có triệu chứng thần kinh: Quay cuồng, đi vòng tròn, run rẩy; thiếu máu và suy nhược.&nbsp;\n\n          </p>\n          <p style=\"text-align: justify;\">Bệnh có thể kéo dài 1 - 2 tháng, con vật ngày càng gầy, da khô mốc. Sức khoẻ suy yếu dần, kém ăn, phân có lẫn máu hoặc đi tháo lỏng. Có khi con vật đi ngoài ra cả màng ruột, nát từng đoạn. Thường thấy có thuỷ thũng ở hầu, ức, nách, chân, háng. Trường hợp bệnh nặng, con vật đột ngột sốt cao, bụng chướng to rồi lăn ra chết.\n\n          </p>\n          <p style=\"text-align: justify;\"><strong>- Phòng bệnh:</strong>&nbsp;Chuồng trại phải có tấm che chống ruồi, mòng. Phát quang bờ bụi, lấp vũng nước, cống rãnh quanh chuồng và bãi thả để không có chỗ cư trú cho côn trùng. Nuôi dưỡng đàn gia súc tốt, vệ sinh chuồng trại sạch sẽ. Kiểm tra máu bò định kỳ 6 tháng/lần ở những vùng có bệnh, phát hiện và điều trị kịp thời để tránh việc lây lan. Bà con có thể tiêm phòng bằng Trypanosoma theo hướng dẫn của bác sĩ thú y.\n\n          </p>\n          <p style=\"text-align: justify;\"><strong>- Điều trị:</strong>&nbsp;Dùng Trypanosoma 0,5mg/kg khối lượng, pha 1 lọ Trypanosoma (lọ 775mg có 125 mg hoạt chất) với 6 - 12 ml dung dịch nước cất. Tiêm tĩnh mạch hay tiêm bắp thịt (tiêm thật chậm). Tiêm 1 lần duy nhất với liều 1ml/20 - 25 kg thể trọng với trâu và 1ml/40 kg thể trọng với bò; liều 1ml/100 kg thể trọng với ngựa.\n\n          </p>\n          <p style=\"text-align: justify;\"><em>Lưu ý:</em>&nbsp;Trước khi tiêm thuốc trị ký sinh trùng máu nên tiêm trợ tim cho con vật trước 15 - 30 phút bằng Cafein 20% liều 10 - 20 ml hoặc long não nước 10% liều lượng 40 - 50 ml.\n\n          </p>\n          <p style=\"text-align: right;\"><strong>Trung tâm Dịch vụ và Kỹ thuật nông nghiệp Lục Ngạn</strong>\n\n          </p>\n          <p style=\"text-align: right;\"><em>Nguồn: Báo Bắc Giang</em> </p>','2022-12-10','Do thời tiết chuyển mùa nên sáng và đêm trời lạnh, có nhiều sương làm cho đàn vật nuôi chưa thích nghi, dễ mắc các bệnh về đường hô hấp, tiêu hóa. Đặc biệt, đàn trâu, bò, ngựa dễ mắc bệnh ký sinh trùng đường máu.','https://nguoichannuoi.vn/upload_images/images/khoa-hoc-ky-thuat-chan-nuoi/nuoi-bo-bac-giang.jpg','Phòng trừ bệnh ký sinh trùng đường máu cho trâu, bò, ngựa'),(4,'NVD','<h2 style=\"text-align: justify;\"><strong>Các loại thức ăn</strong></h2>\n          <p style=\"text-align: justify;\"><em>Rau xanh:</em> Thức ăn rau xanh cho heo rừng khá đa dạng, có thể kể đến như: Thân cây ngô, cây chuối, các loại rau, đu đủ, quả su su… Cùng với đó, có thể sử dụng các loại cây thuốc nam như: Hoàng ngọc, cỏ voi, nhọ nồi, khổ sâm, phèn đen… để cho heo rừng ăn giúp hạn chế bệnh tật.\n\n          </p>\n          <p style=\"text-align: justify;\"><em>Thức ăn khô:</em> Thức ăn khô cho heo rừng khá đa dạng. Thức ăn tinh bột gồm ngô, khoai sắn, cám gạo… Thức ăn bổ sung nguồn đạm gồm: Đậu các loại, giun quế, các loại cá khô. Thức ăn cần đảm bảo an toàn trước khi cho heo ăn.\n\n          </p>\n          <p style=\"text-align: justify;\">Phần máng ăn, uống cần thiết kế ở phía đầu chuồng, cũng là nơi thấp nhất trong chuồng. Mục đích giúp cho việc dọn dẹp dễ dàng, máng luôn ở trạng thái sạch sẽ. Phần máng ăn cần có độ cao 15 - 20 cm tùy theo độ cao đàn heo. Chiều dài của máng 2 - 2,2 m, độ rộng lòng máng 20 - 30 cm. Nếu máng cố định cần xây cao hơn so mặt đất 5 - 7 cm để tiện cho việc vệ sinh.\n\n          </p>\n          <p style=\"text-align: center;\"><img alt=\"nuôi heo rừng\" src=\"https://nguoichannuoi.vn/upload_images/images/khoa-hoc-ky-thuat-chan-nuoi/heo-rung.jpg\" style=\"width: 800px; height: 488px;\">\n\n          </p>\n          <p style=\"text-align: center;\"><em>Cần lưu ý đến chế độ dinh dưỡng trong quá trình chăm sóc heo rừng. Ảnh: Nhựt An/TTXVN</em>\n\n          </p>\n          <p style=\"text-align: justify;\">&nbsp;\n\n          </p>\n          <h2 style=\"text-align: justify;\"><strong>Phối trộn thức ăn</strong></h2>\n          <p style=\"text-align: justify;\">Nguyên liệu phải đảm bảo chất lượng: Không bị ẩm mốc, sâu, mọt, hấp hơi, có mùi lạ và không bị vón cục. Một số nguyên liệu cần được sơ chế trước để heo dễ tiêu hóa (như đậu tương cần rang chín, vỏ sò, vỏ hến phải nung nóng trước khi nghiền…). Các loại nguyên liệu thức ăn trước khi phối trộn cần nghiền nhỏ.\n\n          </p>\n          <p style=\"text-align: justify;\">&nbsp;Đổ dàn đều các loại nguyên liệu đã nghiền ra nền nhà khô, sạch hoặc gạch lát theo thứ tự: Loại nhiều đổ trước, loại ít đổ sau. Đối với loại nguyên liệu có khối lượng ít như khoáng, vitamin phải trộn trước với một ít bột ngô hoặc cám gạo để tăng khối lượng sau đó mới trộn lẫn với các nguyên liệu khác để đảm bảo độ đồng đều. Dùng xẻng hoặc tay trộn thật đều, sau đó đóng thức ăn vào bao nilon, bên ngoài bao nilon là bao tải, buộc kín lại. Đặt bao thức ăn lên giá, không để vào chỗ quá kín hoặc nơi ẩm ướt. Sau khi lấy cám ra cho heo ăn cần buộc kín phần còn lại tránh ẩm, mốc. Chú ý chống chuột cắn rách bao cám.\n\n          </p>\n          <p style=\"text-align: justify;\">Khối lượng nguyên liệu phối trộn cần phải căn cứ vào số lượng heo và mức ăn để trộn vừa đủ lượng thức ăn cho khoảng 5 - 7 ngày rồi lại trộn tiếp, tránh để lâu dễ phát sinh ẩm mốc.\n\n          </p>\n          <p style=\"text-align: justify;\">&nbsp;\n\n          </p>\n          <h2 style=\"text-align: justify;\"><strong>Cách cho ăn</strong></h2>\n          <p style=\"text-align: justify;\">Khẩu phần thức ăn cho heo rừng thông thường: 70% là rau, củ, quả các loại (có thể sản xuất tại trang trại), 30% là cám, gạo, ngũ cốc các loại, hèm bia, bã đậu.&nbsp; Thức ăn cho heo rừng do con người cung cấp có thể thiếu dinh dưỡng, nhất là đạm, khoáng và sinh tố... vì thế ngoài việc bổ sung thức ăn tinh giàu đạm, muối, sinh tố, cần thiết phải bổ sung thêm đá liếm cho heo rừng liếm tự do (lưu ý để nơi khô ráo, mát mẻ). Hỗn hợp đá liếm bổ sung khoáng có thể mua hay tự trộn theo tỷ lệ (muối ăn 100 g; Sắt sunfat 100 g; Đồng sunfat 50 g; Diêm sinh 100 g; Vôi tôi 1.000 g; Đất sét vừa đủ 3 kg) cho heo liếm tự do cũng chỉ hết khoảng 20 - 25 g/con/ngày.\n\n          </p>\n          <p style=\"text-align: justify;\">Thức ăn của heo rừng chủ yếu là thực vật. Không nên lạm dụng thức ăn giàu dinh dưỡng để nuôi heo rừng vì nó sẽ làm cho phẩm chất thịt của heo rừng bị biến đổi và nhiều khi làm cho heo bị bệnh rối loạn tiêu hóa gây tiêu chảy...\n\n          </p>\n          <p style=\"text-align: justify;\">Heo ăn thức ăn xanh tươi, ít uống nước, tuy nhiên cũng cần có đủ nước sạch và mát cho heo uống tự do. Hàng ngày phải vệ sinh chuồng trại, dọn bỏ thức ăn thừa, rửa sạch máng ăn, máng uống...\n\n          </p>\n          <p style=\"text-align: right;\"><strong>Phương Đông</strong> </p>','2022-12-09','Nuôi heo rừng không còn là mô hình xa lạ, tuy nhiên để heo phát triển tốt, chắc thịt cần lưu ý đến chế độ dinh dưỡng hợp lý trong quá trình chăm sóc.','https://nguoichannuoi.vn/upload_images/images/khoa-hoc-ky-thuat-chan-nuoi/heo-rung.jpg','Chế độ dinh dưỡng cho heo rừng');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_EMPLOYEE');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `username` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('anh1234','$2a$12$pDa5GWC7iqBq6iRmBTEE3ePOewBp0FWCd6bZ4JmF92ndMYT0pD8/C'),('chanh1234','$2a$12$pDa5GWC7iqBq6iRmBTEE3ePOewBp0FWCd6bZ4JmF92ndMYT0pD8/C'),('cong1234','$2a$12$pDa5GWC7iqBq6iRmBTEE3ePOewBp0FWCd6bZ4JmF92ndMYT0pD8/C'),('duy1234','$2a$12$pDa5GWC7iqBq6iRmBTEE3ePOewBp0FWCd6bZ4JmF92ndMYT0pD8/C'),('hai1234','$2a$12$pDa5GWC7iqBq6iRmBTEE3ePOewBp0FWCd6bZ4JmF92ndMYT0pD8/C'),('linh1234','$2a$12$pDa5GWC7iqBq6iRmBTEE3ePOewBp0FWCd6bZ4JmF92ndMYT0pD8/C'),('phuong1234','$2a$12$pDa5GWC7iqBq6iRmBTEE3ePOewBp0FWCd6bZ4JmF92ndMYT0pD8/C'),('thai1234','$2a$12$pDa5GWC7iqBq6iRmBTEE3ePOewBp0FWCd6bZ4JmF92ndMYT0pD8/C');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `username` varchar(45) NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`username`,`role_id`),
  KEY `fk_user_has_role_role1_idx` (`role_id`),
  KEY `fk_user_has_role_user_idx` (`username`),
  CONSTRAINT `fk_user_has_role_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `fk_user_has_role_user` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES ('duy1234',1),('hai1234',1),('phuong1234',1),('anh1234',2),('chanh1234',2),('cong1234',2),('linh1234',2),('thai1234',2);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mydb'
--

--
-- Dumping routines for database 'mydb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-18 17:04:58
