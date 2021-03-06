CREATE DATABASE  IF NOT EXISTS `biggym` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `biggym`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: biggym
-- ------------------------------------------------------
-- Server version	5.6.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `schedule` text NOT NULL,
  `speacial_features` text,
  `belongs_to` int(11) NOT NULL,
  `held_here` int(11) NOT NULL,
  `level` varchar(45) NOT NULL,
  PRIMARY KEY (`course_id`),
  KEY `belongs_to` (`belongs_to`),
  KEY `held_here` (`held_here`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`belongs_to`) REFERENCES `course_category` (`category_id`),
  CONSTRAINT `course_ibfk_2` FOREIGN KEY (`held_here`) REFERENCES `room` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'Teaching Yoga','The popularity of Yoga for its health and fitness benefits continues to grow. Both gyms and yoga centres are seeing an increased demand for yoga classes on their timetables. There are many different styles of Yoga. This Yoga Professionals course is based around the practice of Hatha Yoga – the foundation from where many popular styles of yoga have developed. On the course you will learn yoga asanas (positions), pranayama (breath control), mudra (hand positions), as well as meditation and yoga kriyas (cleansing techniques).','Monday, 10am-11am','This format is suitable if you don’t currently hold a fitness qualification or are a Level 2 qualified fitness instructor.',1,4,'Advanced'),(2,'Exercise Referral','Exercise referral schemes continue to grow in number through GP commissioning, local authorities and the private sector. An extremely rewarding and potentially profitable way of advancing your career prospects, the Diploma in Exercise Referral will amply prepare you for working with medically referred clients.\n\nUtilising your chosen discipline (eg, personal training, exercise to music or yoga) you will be equipped to work with clients with a wide range of common medical conditions such as rheumatoid arthritis, depression, diabetes (Type 1 and 2), hypertension and obesity. You will also gain knowledge about the UK health care system and the exercise referral process.','Wednesday, 6pm-7pm',NULL,1,7,'Advanced'),(3,'Cadillac','ACAD prepares you to teach 28 Advanced level exercises plus modifications using the Cadillac for the highly conditioned client. Incorporate a series of high level exercises into your existing equipment repertoire that are designed to challenge your most advanced students.','Friday, 8pm-9pm',NULL,2,10,'Basic'),(4,'Reformer','Learn to use the various reformer components and accessories to intensify reformer repertoire and provide a stimulating workout for athletes, dancers, and highly conditioned clients. Exercises in the Advanced repertoire require greater strength, stability and flexibility. ','Monday, 7pm-8pm',NULL,2,4,'Advanced'),(5,'Exercise and Disability','It is estimated that around 1 in 10 of the UK population has a disability, and yet disabled people are seriously under-represented in fitness and gym facilities.  This course has been developed as part of the Inclusive Fitness Initiative (IFI), which aims to make fitness facilities more accessible to disabled people, both in terms of the physical environment and the skills and attitudes of their staff. \n\nThis course will provide you with confidence and expertise in writing and delivering safe, effective and fun exercise programmes for a range of people with the disabilities including Down\'s syndrome, Asperger\'s syndrome, autism, cerebral palsy, spinal cord injury, limbless/amputation, visual impairment and hearing impairment. ','Saturday, 12pm-1pm',NULL,4,5,'Basic'),(6,'Exercise Nutrition','It seems that every day we are bombarded with conflicting information about nutrition, obesity or new diets, making this a subject your clients are guaranteed to want to discuss.\nThis course covers the principles of healthy eating and weight management in relation to exercise, enabling you to offer nutritional advice in an exercise context.','Sunday, 3pm-4pm',NULL,4,1,'Basic'),(7,'Fitness Dance','It is becoming more evident that many children are lacking the opportunity to be fit and healthy. Schools offer some activity as part of their compulsory curriculum; however, it does not cover the government activity guidelines for children needing to accumulate 60 minutes of moderate activity on a daily basis.\n\nFitness Dance course is ideal for anyone interested in running health-related exercise sessions for children, those already running sessions but without a formal qualification and current fitness instructors wanting to deliver fitness and activity sessions to children. If we want to tackle the growing problem of obesity amongst children we need to find activities kids’ will really enjoy. ','Friday, 12pm-1pm','For kids',5,2,'Basic'),(8,'Fitness Play and Games','It is becoming more evident that many children are lacking the opportunity to be fit and healthy. Schools offer some activity as part of their compulsory curriculum; however, it does not cover the government activity guidelines for children needing to accumulate 60 minutes of moderate activity on a daily basis.\n\nDuring Fitness Play and Games course you will learn how to design effective but fun sessions for children. Sessions will incorporate movement to develop balance, coordination, body and spatial awareness, confidence and social interaction. As children get older it is important to include more complex movement patterns which will challenge their senses, fitness levels and confidence and will also educate them about the benefits of physical activity.','Thursday, 12pm-1pm','For kids',5,2,'Basic'),(9,'Teen Gym','With figures regularly declaring a steady rise in obesity levels among young people, many gyms and personal trainers are beginning to train an increasing numbers of teenagers as a greater emphasis is placed on these youngsters to get fit and be healthy.  Undertaking this course allows current instructors to adapt their gym instructing or personal training sessions for 11-18 year olds. In addition, the course explores the physiological and psychological differences between teens and adults and the modifications required to create effective and engaging gym sessions for this age group.','Tuesday, 1pm-2pm','For teens',6,6,'Basic'),(10,'Teen Studio','Teaching group exercise sessions requires certain key attributes including a passion for fitness, an outgoing personality, and a will to improve others. With all of these in abundance, no longer do you have to solely seek adult exercise classes. Whether it’s aerobics, yoga, Pilates or conditioning classes, the choice has now got even bigger with classes specifically aimed at teenagers.\n\nTeen Studio is ideal for anyone interested in running studio classes for 11-18 year olds. The development potential at this age is huge! You can play a major role in boosting the confidence, independence, health and body awareness of youngsters heading towards or through their teenage years.\n\nYou will gain an understanding of the physiological changes that many of your class attendees may be experiencing and will be confident in adapting your sessions accordingly.','Saturday, 6pm-7pm','For teens',6,9,'Basic'),(11,'Strength and Conditioning','Strength and conditioning is used by professional sportsmen and women across the UK to enhance their sporting performance. It’s no coincidence that the huge success of sport in the UK over the last few years has arrived at a time when the UK has seen a significant rise in the number of strength and conditioning coaches.\n\nWith increasing media coverage highlighting the more scientific approaches to fitness which has contributed to such success, fitness enthusiasts are becoming more open-minded to the benefits of employing strength and conditioning specialists. It is the latest trend to hit the fitness industry and will soon be an essential part of any personal trainer’s toolkit.','Friday, 3pm-4pm',NULL,7,8,'Basic'),(12,'Supple Strength','Encourage your participants to engage their minds as well as their muscles! Blending elements of yoga, Pilates and body conditioning, we will give you the tools to build a challenging holistic workout. You will explore exercises geared towards building strength and flexibility through a focus on posture, core stability and body alignment.','Monday, 4pm-5pm',NULL,7,3,'Medium'),(13,'Weight Loss in Mind','A professional counselling course taught me that the root of our actions, who we are as a person and how we flourish, stems directly from the mind: what we believe and how we feel. We all know the way to lose weight is to follow a calorie-controlled diet and to participate in regular exercise, this is relatively simple but the hard part is getting your mind focused to do this.','Wednesday, 2pm-3pm',NULL,8,1,'Basic'),(14,'Obesity and Diabetes','The news is full of worrying stories regarding the nation’s health, in particular the rise in the numbers of obese people and those suffering from Type 2 diabetes. With over a billion people worldwide now classified as overweight or obese, and 3.2 million people diagnosed with diabetes in the UK alone, the figures seem to set to rise for the foreseeable future.\n\nWith any issue comes the need for a solution. The government and the fitness industry are striving to boost the numbers of instructors who specialise in weight management. This extensive and significant Level 4 course will give instructors the vital skills and knowledge to develop detailed and tailored long-term strategies for people with obesity and diabetes.','Sunday, 11am-12pm',NULL,8,5,'Medium'),(15,'Rehabilitation Programme','This course introduces you to the biomechanical principles of STOTT PILATES and their application to modified Matwork, light equipment and Reformer exercises. Emphasis is on lumbo-pelvic and shoulder girdle stabilization and the role they play in rehabilitation and injury prevention. The course is designed for physiotherapists, physical and occupational therapists, chiropractors, osteopaths, medical doctors or sports medicine doctors.','Sunday, 6pm-7pm','Applications are accepted from the following licensed or certified professionals only:\n\nPhysiotherapists/Physical Therapists\nOccupational Therapists\nChiropractors\nOsteopaths\nMedical Doctors or Sports Medicine Doctors',9,8,'Medium'),(16,'Mindful Movement Breathing Workout','This mindful movement workout, created by the Merrithew Health & Fitness team, is based on the foundation that proper breathing is the key to a healthy, nourished and vibrant body. We use the breath to activate movement from the inside-out so we can concentrate on optimizing the core connection and mobility of the spine, hips and shoulder girdle. The exercises presented incorporate the Mini Stability Ball and aim to improve posture, relieve the body of negative tension, and strengthen the core.','Sunday, 7pm-8pm','Open to all Fitness Professionals and Pilates Instructors',9,6,'Medium'),(17,'Swimming','No matter if you’re keen to improve your technique, want to learn to swim for the first time, improve your swimming skills, or enter your child in a swimming course; the London Aquatics Centre has tailor made options for you.  Our venue couldn’t be better placed to support you in your water related endeavours and our qualified instructors are ready to welcome all types of swimmers.','Tuesday, 11am-12pm',NULL,10,10,'Basic'),(18,'Snorkelling','Snorkelling is great fun, easy to learn and an ideal way to build up confidence in the water. It is accessible to anyone - young or old - and is an enjoyable way to get the whole family involved.\n\nFor younger members of the family, snorkelling is also a great introduction to underwater sports and can be their first step towards learning to dive.','Wednesday, 11am-12pm',NULL,10,9,'Medium'),(19,'Emergency First Aid','Whether you are self-employed or work in a gym, being able to give emergency first aid at work is an important skill for anyone. This course provides you with an emergency first aid in the workplace qualification that will be valid for three years from the day of training.','Monday, 6pm-7pm','No formal qualification required',3,7,'Basic'),(20,'Lower Back Pain','Lower back pain affects around a third of adults in the UK every year, and has a huge impact on quality of life. Research has shown exercise to be one of the best remedies; with physical activity significantly relieving symptoms.\n\nIn this comprehensive course instructors who currently hold a Level 3 Diploma in Exercise Referral will develop an understanding of the classification, contributing factors and health risks of different types of lower back pain. You will learn how chronic, non-specific low back pain, medications, psychological/sociological factors and co-morbidities affect a client’s ability to exercise, and how to design effective physical activity and lifestyle programmes.\n\nBy helping to ease their pain through exercise, you can make a real difference to your clients’ lives.','Saturday, 8pm-9pm',NULL,3,3,'Advanced');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_category`
--

DROP TABLE IF EXISTS `course_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  `about` text,
  `origins` text,
  `good_for` text,
  `practices` text,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_category`
--

LOCK TABLES `course_category` WRITE;
/*!40000 ALTER TABLE `course_category` DISABLE KEYS */;
INSERT INTO `course_category` VALUES (1,'Diploma',NULL,NULL,NULL,NULL),(2,'Pilates',NULL,NULL,NULL,NULL),(3,'First-aid',NULL,NULL,NULL,NULL),(4,'Exercise',NULL,NULL,NULL,NULL),(5,'Kids',NULL,NULL,NULL,NULL),(6,'Teen',NULL,NULL,NULL,NULL),(7,'Physical Performance',NULL,NULL,NULL,NULL),(8,'Physical Health',NULL,NULL,NULL,NULL),(9,'Physiological Health',NULL,NULL,NULL,NULL),(10,'Water Sports',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `course_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `img`
--

DROP TABLE IF EXISTS `img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `img` (
  `img_id` varchar(32) NOT NULL,
  `url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `img`
--

LOCK TABLES `img` WRITE;
/*!40000 ALTER TABLE `img` DISABLE KEYS */;
/*!40000 ALTER TABLE `img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor` (
  `instructor_id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `bio` text NOT NULL,
  `qualifications` text NOT NULL,
  `awards` text,
  `ins_of_month` varchar(4) NOT NULL,
  PRIMARY KEY (`instructor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES (1,'John Frieh','John Frieh is many things to many people: father, husband, brother, project manager, engineer, landlord, and small business owner. Simply put, John is a busy person. When his other responsibilities allow John enjoys climbing, especially alpine climbing. John continues to challenge the notion that climbers with careers and/or children cannot accomplish much; since his first trip in 2009 John has climbed at least one significant first ascent or first winter ascent each year in Alaska. Since 2007 John has worked with Dan John, Steve Maxwell, Rob Shaul, Chip Conrad, and others in order to build his knowledge within the realm of \"strength and conditioning\". In 2009 John found his way to Gym Jones and has since enjoyed the opportunity to learn from the best of the best: Mark & Lisa Twight and Rob MacDonald. Since then John has attended the Fundamentals, Intermediate and Advanced Gym Jones seminars as well as assisted at numerous Fundamentals, Intermediate and Advanced Gym Jones seminars. For his efforts John is now considered a Gym Jones disciple and a fully certified instructor. During his training education John came to the realization that he enjoys coaching others as much as he enjoys climbing. Whether it be an endurance sport, or a strength and power dominated sport, or simply physical fitness, John is capable of coaching different athletes to their respective goals given their other life constraints. John is able to offer a variety of solutions whether it be one on one coaching or small group classes at his gym in Portland, Oregon. For those not located in Portland remote programming or mini training camps in Portland or at your location are available.','FULLY CERTIFIED GYM JONES INSTRUCTOR',NULL,'yes'),(2,'Chris Burkeybyle','Chris Burkeybyle – better known simply as Burkey – first discovered the deeper implications of fitness while training as a wilderness first responder in Bozeman, Montana. Through that lens, “fitness” was no longer merely a cosmetic goal, but a survival trait. It became apparent that certain intangible qualities – psychological fitness, mental toughness and grit - were the determining factors in ones success . To that end, he began to study, to seek out those who could teach him how use physical training to adjust attitudes, to correct imbalances and shape himself (and eventually others) to truly carry weight. In 2006 Burkey made his first of many trips to Gym Jones. Armed with a wealth of new knowledge, and seeing the benefits of mentorship and a fiercely honest peer group, he began to set plans into motion. Returning to his home outside Detroit, Michigan, Burkey turned his garage into a bare bones gym. Drawing on the lessons learned in the years he worked as a craftsman and a designer – and the questions posed during his time in Salt Lake - he forged practical skills and a love of philosophy into a force of change. After three years of diligent work, he accepted the challenge of training a friend. This responsibility resonated with him, spurring him on to study harder, to ask even more questions, to learn, and eventually – to start another business. In July of 2010 Station 515 was born. In its current embodiment, it exists within a 2500 square foot facility in Ferndale, Michigan. In this small, private location, Burkey works to create an environment that pushes and pulls, questions and guides each individual towards the embodiment their full potential. A place where philosophy has consequences. Be it in a group or a personal setting, sport specific or general fitness, the common thread is the design – to find the problem, and to fix the problem. To understand and to apply. To raise the bar.','None',NULL,'no'),(3,'Paul Timmons','Paul Timmons\' diversity as both a strength and endurance athlete combined with over 20 years experience as a fitness professional offers a unique coaching perspective. This point is further illustrated by the fact that Timmons holds two DE State records in different weight classes in the deadlift and was the first person ever to complete a 15 mile solo swim from Cape May, New Jersey to Cape Henlopen, Delaware. During his athletic career Paul is 15-0 as a competitive power lifter in 4 states, has completed 6 Ironman Triathlons (including 3 at the world championships in Kona) and has completed 20 marathons. In addition, Timmons holds the rank of Renshi, which is the equivalent of a fourth degree black belt in Kenjutsu from The Delaware Budokan. Timmons attended one of the very first Gym Jones \"Fundamentals\" seminars in 2007 and has been a Salvation member since it\'s inception. One of the greatest lessons he has learned on the journey to certification is the power of an environment of excellence. And he has modeled his facility, The Firm Fitness Center in that same image. The Firm Fitness Center is a 4000 square foot facility in Rehoboth Beach, Delaware and has been in operation since 1999. Paul has a vast amount of experience in coaching and has worked with a wide variety of clients ranging from those who want to lose weight to those who compete in serious athletic endeavors.','None',NULL,'yes'),(4,'Matthew Owen','Matt Owen is the owner and founder of Project Deliverance in St. Louis, Missouri. He graduated from Lindenwood University with a Bachelors of Science in Exercise Science and went on to earn a Masters of Science in Human Performance also from Lindenwood. Matt was a four year varsity letterman and team captain on the Lindenwood Lions Track & Field team. He also spent two years during graduate school training, counseling, and preparing short and long sprinters for competition in addition to managing Project Deliverance. Although Matt\'s collegiate track and field career ended in May of 2010, he continues to train hard and compete in open track meets specializing in the short sprints and long jump events. Each season, Matt spends his winter and spring months competing and challenging himself against the best collegiate and professional sprinters and jumpers in the Midwest. During the spring semester of his freshman year of college, Matt discovered Gym Jones. The project itself resonated so strongly with him that it changed the direction of his college education, training, and the prospect of life after college and athletics. That following summer, Matt started Project Deliverance out of his parent\'s garage as a way to stay in shape for the upcoming track season. He spent most of the summer scraping together equipment, studying the Gym Jones training calendar, and training a handful of his close friends out of the garage. In 2008, Matt attended his first seminar at Gym Jones and has since spent a significant amount of time at the gym learning and developing his set of skills as a trainer, coach, and athlete. Since his first days in the gym, Matt has attended, completed, as well as assisted at the Fundamentals, Intermediate, and Advanced seminars at Gym Jones. In order to complete his undergraduate degree at Lindenwood, Matt was privledged to become the first student intern at Gym Jones. In that three week period, he had the opportunity to learn, work, and train alongside Rob MacDonald, Mark & Lisa Twight, and the other trainers at Gym Jones. The culmination of many years of work, education, and development has earned Matt the opportunity to be considered a Gym Jones disciple and fully certified instructor. Since it\'s founding in 2007, Project Deliverance has moved to a warehouse location in the South City area of St. Louis. The gym itself specializes in training athletes of all calibers as well as those who are willing to suffer in order to improve as a result. Project Deliverance offers group, one on one, and also remote training and coaching solutions. As a trainer and coach, Matt has extensive experience in the development of speed, power, power endurance, and running technique on and off of the track but is also just as capable of training endurance athletes or those who are just training for general physical preparedness.','None',NULL,'yes'),(5,'Shawn Kingrey','Shawn Kingrey wears many different hats. He is a husband, friend, instructor, team-mate, coach, artist, cyclist and fire fighter. Athletics have always been a major part of Shawn’s life. His activities have included wrestling, football, skateboarding, ice hockey and bouldering; however, if you ask him, he would say that he is “just a bike racer”. Shawn started off racing BMX as a kid then moved on to Downhill mountain bikes in college and later reinvented himself as a Road Racer. Shawn has learned from from many different people in a variety of sports: John Gill as his climbing mentor, Dave Feamster showed him the ropes in ice hockey, and Dan Pate Sr. taught him how to truly ride a road bike. Shawn has earned multiple certifications from diverse strength & conditioning organizations. He is very driven to deepen his knowledge base in nutrition, fitness, and recovery on both practical and theoretical levels. He uses this insight to improve his own athletic endeavors as well as enrich his clients’ expertise. Shawn made his way into Gym Jones after meeting Mark Twight at the 2008 Porcupine Hill Climb race in Salt Lake City. Shawn has since attended the Fundamentals, Intermediate and Advance seminars at Gym Jones where he enjoyed the opportunity to learn from Mark & Lisa Twight and Rob MacDonald. He has also been an assistant at multiple Gym Jones seminars. Gym Jones has become Shawn’s sanctuary were he finds inspiration to keep improving and growing in all of life’s endeavors. Shawn came to realize that he enjoyed training other people. He has helped co-workers train for the Combat Challenge, became a peer fitness trainer, and aid in the development of a “Wellness Program” for the Fire Department. Shawn also trains clients out of his private facility in Pueblo, CO on a 1:1 basis. Even though Shawn’s specializes in training endurance athletes he enjoys training athletes for strength/power, general fitness, or sports specific goals. For those not located in the Colorado Springs/Pueblo area, remote programming is available.','None',NULL,'no'),(6,'Carolyn Parker','Carolyn Parker is, to many; an instructor, coach, friend, mentor, athlete, and someone to depend on. She has a 25+ year career in numerous sports, she “might” be referred to as a climber; with 23 years of experience in all disciplines from rock, ice, alpine climbing, and ski mountaineering, and 18 years professional guiding experience; she is however not merely a climber. Her deep and diverse experience base comes from high level participation in many sports: including road and mountain bike racing, trail running, alpine and backcountry skiing a long practice of yoga and most recently surfing. As much as she is a spirit of the mountain environment she has an infectious desire to wield “the tools” existing in a unique gym setting to continue to excel and help others to achieve their goals. Carolyn holds degrees from CNM and UNM circa 1989, 1993, her knowledge base most specifically comes from her personal commitment to learning, practicing, seeking to be better and a life long desire to “not suck”. In 1990, she started her first entrepreneurial endeavor, a women’s specific mountain bike clinic series and in 1993 obtained her first trainer certification. She began her professional climbing and guiding career in 1994, and is now a fully Certified AMGA Rock Guide. As her life came full circle, she came out of her full time mountain life in 2002 and as she scaled back her climbing and guiding ambitions she set her sights on building a business that reflected her passion for teaching, health, knowledge, community and athletic performance; she founded \"AthenaFit Training\" (which has now evolved into \"Ripple Effect Training\"). In that same year, she established her women’s climbing clinic series “Climb like a Girl”. Now with another decade under her belt, she has trained numerous athletes, ultra endurance runners, cyclists, multi-sport competitors, climbers, marathon runners, ski racers, and the general population in all aspects of fitness and health. Mark and Lisa Twight are long time friends of Carolyn’s. Her friendship with Mark dates back to 1994 when their paths crossed; recognizing each other as like minded spirits an immediate respect was established. Carolyn has been with Gym Jones since the beginning, when it wasn’t much more than a room in the back of a warehouse with a box, some weights, a \"bachar\" ladder and a tiny climbing wall. Carolyn is characterized by many as deeply motivated, bordering on obsessed, in her pursuit of knowledge and practical skill that combined with her tremendous respect for Mark and Lisa, their level of knowledge, commitment and high standards in everything they do, brought Carolyn to pursue the Gym Jones Fully Certified Instructor position. Along the way she had the honor of training with not only Mark, Lisa and the BJJ crew; but most recently learning from and establishing a friendship with Rob MacDonald another individual she has tremendous respect for and feels is an invaluable member of the Gym Jones team. She is honored to be considered a satellite of the gym. Gym Jones is the one place she feels can go to gain skill, knowledge, professional inspiration, and be guaranteed that her peers will never stop learning and growing. Carolyn’s facility is a private gym in Carbondale CO. It is here her passion comes to light, with her diverse background Carolyn trains individuals with interests in endurance based sports, power and strength based sports, climbing specific coaching and those just desiring general fitness. Training often occurs in 1:1 or small group settings however, in addition to her local athletes, Carolyn consults with many regional athletes creating training “camps” for the visiting athlete to gain the practical knowledge necessary to follow their specialized training programs she develops with them.','None',NULL,'no'),(7,'Antonio Cordova','Antonio served in the U.S. Navy between 1998-2003. He traveled around the world and completed several tours overseas on the destroyer the U.S.S. Thorn. It was during this time he began to take a serious interest in performance and overall fitness due to the rigorous physical activity required. After leaving the military he pursed an education in classical music although he remained passionate about physical fitness. Antonio began his journey coaching others in 2005. He sought out different training modalities to enrich his knowledge. He has attended several RKC seminars as a trainee and instructor under Pavel Tsatsouline and Steve Maxwell. In 2010, Antonio attended Gym Jones Fundamentals seminar under Mark Twight and Rob MacDonald. Since then Antonio has attended GJ’s Intermediate and Advanced seminars. He has recently assisted at Fundamentals seminars. Antonio has completed all the GJ standards and requirements making him a Gym Jones \'Fully Certified Instructor\'. During his time spent at Gym Jones, Antonio strengthened his resolve to improve himself and his clients and subsequently opened a facility in Manhattan. He founded Precision Athlete with a colleague, Antoinette Vo. Precision Athlete is 1750 sq. ft. facility on the Upper West Side of Manhattan dedicated to advancing the understanding and development of real fitness. Precision Athlete offers private one-on-one training, semi-private training and small group classes. Each athlete has a program that is thoughtfully crafted to help achieve specific goals which can be achieved through a combination of session/class types. Antonio serves a variety of clients ranging from athletes, students, working professionals and many others who are committed to improving their strength and conditioning.','None',NULL,'yes'),(8,'Mario Donato','Born and raised in the Bahamas, Mario had no choice but to become aquatic. Surrounded by Swimmers, Free-divers and Scuba Divers he learned about the ocean first hand. His lessons started to pay off fast. At age 10 he started winning swimming competitions and free-diving down to 10m/32ft on a single breath of air. As he grew older his passion for the water strengthened. Becoming a Scuba Diving Instructor he travelled the world for the next 10 years exploring every major ocean. During his travels he was fortunate enough to learn and train with the best record holding free-divers in the world such as William Trubridge and Martin Stepanek. During this time he became an accomplished free-diver and setting records amongst his mentors with a max depth of 93m/305ft and a 8’ 30” breath hold along with dropping his heart rate down to 20 beats a minute at depth, something only found in marine mammals and other top free-divers. In 2006 while training for his last dive he stumbled across the Gym Jones website. Mario wrote Gym Jones expressing that he was training for a dive and had been revisiting the website for inspiration and assistance. The seed became planted when Gym Jones replied with a very supportive and interested response to Mario’s letter. For the next few years he followed Gym Jones and in 2010 became a Salvation Member. He visited Gym Jones a few times a year. While there, Rob MacDonald, Mark & Lisa Twight, and Carolyn Parker had a profound effect on him and his outlook on fitness. Mario has been fortunate enough to train Professional Athletes and Celebrities over the past 5 years. In 2014 he opened CMD GYM. “Center Of Mass Destruction” in Sweden where he continues to train professionals and Athletes. Mario feels the biggest lesson he has learned is: the body waits for the mind to catch up.','FOUNDER OF CMD GYM',NULL,'no'),(9,'John Negoescu','John started training at theMill Gym in Perth, WA in 2008 during its first days of opening. theMill concept was inspired by one in particular individual - Mark Twight, and his vision and creation of Gym Jones. A bit of background to theMill: theMill founders wanted to create a specific environment to train in. An environment where like-minded people, including professionals, athletes and everyday people who understand what they seek and why they suffer for it. theMill is not open to anyone, you cannot buy your way in, there is a strict Initiation process, membership is earned and membership is regularly assessed. theMill is a state-of-mind where the emphasis is ‘to get the job done’. There is an ethos that members are expected to follow and, likewise what members can expect of their Trainers at theMill (Ethos: Relentless pursuit of excellence, Discipline, Primacy of functional capability, Humility, Sense of family, Sense of humour, Loyalty, Mutual Respect). In 2009, John was asked to become a Trainer at theMill as the founders saw him consistently and without fail, mirror the ethos of the gym and what it stood for with maturity beyond his years. With Gym Jones being the inspiration behind theMill, John took it upon himself to visit Gym Jones and begin his seminar education to becoming a fully certified Gym Jones Instructor. This process began in July 2011 and in February 2013 he completed all requirements to become a Gym Jones Certified Instructor. The only Gym Jones Certified Instructor in Australia. Through this process John stepped up at theMill, given the responsibility to create the structured and phased programming for all its clients. When John competed in a charity amateur boxing match in 2012, he was given the nick name “Quota”. The joke being that John is a man of few words. In some ways this nickname is accurate in that John does not engage in purposeless chat, displaying a constant interchange between disciplined mind and disciplined body. This obtains the respect from those around him and when he speaks, people listen. John consistently seeks out the uncomfortable, faces his fears and pushes his limits. He suffers in silence, puts his head down, and does what needs to be done. In the same breath, he is as disciplined and structured with his rest and recovery. John is carving out a life for himself that involves training, gaining knowledge of training and being surrounded by and learning from the best in their field. This is what he loves to do and how he loves to live.','None',NULL,'yes'),(10,'Pieter Vodden','Pieter is the first trainer from the UK to achieve full certification at Gym Jones. He has competed in a wide range of sports including football, boxing, athletics and basketball . His evolution in to a trainer was a natural progression having spent a lifetime in the gym, participating in a broad range of sport including both team and individual pursuits and having consistently studied training methodology and nutrition throughout his life. He first became a trainer in 2006 and has studied under top coaches including Charles Poliquin (PICP, Biosigniture), Adam Booth (Outbox) and Giles Greenwood (Olympic Lifting). However he considers the most significant and influential moment in his life as a trainer to be the day he met Mark Twight and Rob Macdonald at a Fundamentals Seminar in the UK in 2010. The way he has trained himself and his clients changed from that day. Seeking a better, more complete, more inspirational way of training that focuses on \"the existence of genuine fitness\" rather than the \"appearance of it\" became paramount to his programming. In his own words: \"I felt exposed, inspired , humbled and changed by my first Gym Jones experience. Mark and Rob revealed weaknesses that need correction and highlighted the existence of something better, broader yet more specific with a greater sense of athletic purpose. Nothing has been the same since. I have been further inspired by other Fully Certified Instructors and members of Gym Jones like Carolyn Parker, John Frieh, George Mayhew and feel very fortunate to have learned and trained with these people and to be part of the Gym Jones family.\" Pieter started coming out to Salt Lake City shortly after that first seminar and has since completed Intermediate, Advanced and his Internship at Gym Jones making him the first fully certified instructor outside of the U.S. He started is own company Vodden UNLTD to bring together a community that, through both individual and group work, carries the knowledge, work ethic and essence of Gym Jones to athletes and members of the public in the UK. He has brought his training up to a standard set by Gym Jones and coaches his community to follow the same path.','None',NULL,'no');
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer`
--

DROP TABLE IF EXISTS `offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer` (
  `course_id` int(11) NOT NULL,
  `catagory_id` int(11) NOT NULL,
  KEY `catagory_id` (`catagory_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `offer_ibfk_1` FOREIGN KEY (`catagory_id`) REFERENCES `course_category` (`category_id`),
  CONSTRAINT `offer_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer`
--

LOCK TABLES `offer` WRITE;
/*!40000 ALTER TABLE `offer` DISABLE KEYS */;
INSERT INTO `offer` VALUES (1,1),(2,1),(3,2),(4,2),(5,3),(6,3),(19,3),(20,3),(7,5),(8,5),(9,6),(10,6),(11,7),(12,7),(13,8),(14,8),(15,9),(16,9),(17,10),(18,10);
/*!40000 ALTER TABLE `offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_name` varchar(100) NOT NULL,
  `coord_x` float DEFAULT NULL,
  `coord_y` float DEFAULT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'Room Inge',45.4751,9.25017),(2,'Room Harmon',45.4751,9.25017),(3,'Room Harald',45.4749,9.24913),(4,'Room Varghese',45.4749,9.24913),(5,'Room Chandra',45.4749,9.24845),(6,'Room Zal',45.4754,9.24817),(7,'Room Herod',45.4754,9.24817),(8,'Room Roderic',45.4754,9.24817),(9,'Room Aslan',45.4758,9.24962),(10,'Room Patrice',45.4758,9.24962);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `staff_1`
--

DROP TABLE IF EXISTS `staff_1`;
/*!50001 DROP VIEW IF EXISTS `staff_1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `staff_1` AS SELECT 
 1 AS `course_id`,
 1 AS `course_name`,
 1 AS `instructor_id`,
 1 AS `full_name`,
 1 AS `bio`,
 1 AS `qualifications`,
 1 AS `awards`,
 1 AS `ins_of_month`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `staff_2`
--

DROP TABLE IF EXISTS `staff_2`;
/*!50001 DROP VIEW IF EXISTS `staff_2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `staff_2` AS SELECT 
 1 AS `category_id`,
 1 AS `category_name`,
 1 AS `instructor_id`,
 1 AS `full_name`,
 1 AS `bio`,
 1 AS `qualifications`,
 1 AS `awards`,
 1 AS `ins_of_month`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `teaches_1`
--

DROP TABLE IF EXISTS `teaches_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teaches_1` (
  `course_id` int(11) NOT NULL,
  `instructor_id` int(11) NOT NULL,
  KEY `instructor_id` (`instructor_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `teaches_1_ibfk_1` FOREIGN KEY (`instructor_id`) REFERENCES `instructor` (`instructor_id`),
  CONSTRAINT `teaches_1_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teaches_1`
--

LOCK TABLES `teaches_1` WRITE;
/*!40000 ALTER TABLE `teaches_1` DISABLE KEYS */;
INSERT INTO `teaches_1` VALUES (5,1),(12,1),(13,1),(15,1),(2,2),(5,2),(8,2),(11,2),(1,3),(4,3),(16,3),(18,3),(1,4),(20,4),(17,4),(14,4),(2,5),(19,5),(7,5),(9,5),(3,6),(6,6),(10,6),(15,6),(3,7),(19,7),(6,7),(7,7),(4,8),(8,8),(13,8),(17,8),(20,9),(9,9),(11,9),(18,9),(10,10),(12,10),(14,10),(16,10);
/*!40000 ALTER TABLE `teaches_1` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger populate
	after insert on teaches_1
    for each row
    begin
		DECLARE temp INT;
        set temp := (select belongs_to from course where course_id=new.course_id);
		insert into teaches_2
			values(temp,new.instructor_id);
    end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `teaches_2`
--

DROP TABLE IF EXISTS `teaches_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teaches_2` (
  `catagory_id` int(11) NOT NULL,
  `instructor_id` int(11) NOT NULL,
  KEY `instructor_id` (`instructor_id`),
  KEY `catagory_id` (`catagory_id`),
  CONSTRAINT `teaches_2_ibfk_1` FOREIGN KEY (`instructor_id`) REFERENCES `instructor` (`instructor_id`),
  CONSTRAINT `teaches_2_ibfk_2` FOREIGN KEY (`catagory_id`) REFERENCES `course_category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teaches_2`
--

LOCK TABLES `teaches_2` WRITE;
/*!40000 ALTER TABLE `teaches_2` DISABLE KEYS */;
INSERT INTO `teaches_2` VALUES (4,1),(7,1),(8,1),(9,1),(1,2),(4,2),(5,2),(7,2),(1,3),(2,3),(9,3),(10,3),(1,4),(3,4),(10,4),(8,4),(1,5),(3,5),(5,5),(6,5),(2,6),(4,6),(6,6),(9,6),(2,7),(3,7),(4,7),(5,7),(2,8),(5,8),(8,8),(10,8),(3,9),(6,9),(7,9),(10,9),(6,10),(7,10),(8,10),(9,10);
/*!40000 ALTER TABLE `teaches_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video` (
  `video_id` varchar(32) NOT NULL,
  `url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `staff_1`
--

/*!50001 DROP VIEW IF EXISTS `staff_1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `staff_1` AS select `c`.`course_id` AS `course_id`,`c`.`course_name` AS `course_name`,`i`.`instructor_id` AS `instructor_id`,`i`.`full_name` AS `full_name`,`i`.`bio` AS `bio`,`i`.`qualifications` AS `qualifications`,`i`.`awards` AS `awards`,`i`.`ins_of_month` AS `ins_of_month` from ((`course` `c` join `teaches_1` `t` on((`c`.`course_id` = `t`.`course_id`))) join `instructor` `i` on((`t`.`instructor_id` = `i`.`instructor_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `staff_2`
--

/*!50001 DROP VIEW IF EXISTS `staff_2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `staff_2` AS select `c`.`category_id` AS `category_id`,`c`.`category_name` AS `category_name`,`i`.`instructor_id` AS `instructor_id`,`i`.`full_name` AS `full_name`,`i`.`bio` AS `bio`,`i`.`qualifications` AS `qualifications`,`i`.`awards` AS `awards`,`i`.`ins_of_month` AS `ins_of_month` from ((`course_category` `c` join `teaches_2` `t` on((`c`.`category_id` = `t`.`catagory_id`))) join `instructor` `i` on((`t`.`instructor_id` = `i`.`instructor_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-26 16:20:36
