/*
Navicat MySQL Data Transfer

Source Server         : xammp
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : biggym

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-05-27 23:24:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `schedule` text NOT NULL,
  `speacial_features` text,
  `belongs_to` int(11) NOT NULL,
  `held_here` int(11) NOT NULL,
  `level` varchar(45) NOT NULL,
  `course_img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  KEY `belongs_to` (`belongs_to`),
  KEY `held_here` (`held_here`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`belongs_to`) REFERENCES `course_category` (`category_id`),
  CONSTRAINT `course_ibfk_2` FOREIGN KEY (`held_here`) REFERENCES `room` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', 'Teaching Yoga', 'The popularity of Yoga for its health and fitness benefits continues to grow. Both gyms and yoga centres are seeing an increased demand for yoga classes on their timetables. There are many different styles of Yoga. This Yoga Professionals course is based around the practice of Hatha Yoga – the foundation from where many popular styles of yoga have developed. On the course you will learn yoga asanas (positions), pranayama (breath control), mudra (hand positions), as well as meditation and yoga kriyas (cleansing techniques).', 'Monday, 10am-11am', 'This format is suitable if you don’t currently hold a fitness qualification or are a Level 2 qualified fitness instructor.', '1', '4', 'Advanced', null);
INSERT INTO `course` VALUES ('2', 'Exercise Referral', 'Exercise referral schemes continue to grow in number through GP commissioning, local authorities and the private sector. An extremely rewarding and potentially profitable way of advancing your career prospects, the Diploma in Exercise Referral will amply prepare you for working with medically referred clients.\n\nUtilising your chosen discipline (eg, personal training, exercise to music or yoga) you will be equipped to work with clients with a wide range of common medical conditions such as rheumatoid arthritis, depression, diabetes (Type 1 and 2), hypertension and obesity. You will also gain knowledge about the UK health care system and the exercise referral process.', 'Wednesday, 6pm-7pm', null, '1', '7', 'Advanced', null);
INSERT INTO `course` VALUES ('3', 'Cadillac', 'ACAD prepares you to teach 28 Advanced level exercises plus modifications using the Cadillac for the highly conditioned client. Incorporate a series of high level exercises into your existing equipment repertoire that are designed to challenge your most advanced students.', 'Friday, 8pm-9pm', null, '2', '10', 'Basic', null);
INSERT INTO `course` VALUES ('4', 'Reformer', 'Learn to use the various reformer components and accessories to intensify reformer repertoire and provide a stimulating workout for athletes, dancers, and highly conditioned clients. Exercises in the Advanced repertoire require greater strength, stability and flexibility. ', 'Monday, 7pm-8pm', null, '2', '4', 'Advanced', null);
INSERT INTO `course` VALUES ('5', 'Exercise and Disability', 'It is estimated that around 1 in 10 of the UK population has a disability, and yet disabled people are seriously under-represented in fitness and gym facilities.  This course has been developed as part of the Inclusive Fitness Initiative (IFI), which aims to make fitness facilities more accessible to disabled people, both in terms of the physical environment and the skills and attitudes of their staff. \n\nThis course will provide you with confidence and expertise in writing and delivering safe, effective and fun exercise programmes for a range of people with the disabilities including Down\'s syndrome, Asperger\'s syndrome, autism, cerebral palsy, spinal cord injury, limbless/amputation, visual impairment and hearing impairment. ', 'Saturday, 12pm-1pm', null, '4', '5', 'Basic', null);
INSERT INTO `course` VALUES ('6', 'Exercise Nutrition', 'It seems that every day we are bombarded with conflicting information about nutrition, obesity or new diets, making this a subject your clients are guaranteed to want to discuss.\nThis course covers the principles of healthy eating and weight management in relation to exercise, enabling you to offer nutritional advice in an exercise context.', 'Sunday, 3pm-4pm', null, '4', '1', 'Basic', null);
INSERT INTO `course` VALUES ('7', 'Fitness Dance', 'It is becoming more evident that many children are lacking the opportunity to be fit and healthy. Schools offer some activity as part of their compulsory curriculum; however, it does not cover the government activity guidelines for children needing to accumulate 60 minutes of moderate activity on a daily basis.\n\nFitness Dance course is ideal for anyone interested in running health-related exercise sessions for children, those already running sessions but without a formal qualification and current fitness instructors wanting to deliver fitness and activity sessions to children. If we want to tackle the growing problem of obesity amongst children we need to find activities kids’ will really enjoy. ', 'Friday, 12pm-1pm', 'For kids', '5', '2', 'Basic', null);
INSERT INTO `course` VALUES ('8', 'Fitness Play and Games', 'It is becoming more evident that many children are lacking the opportunity to be fit and healthy. Schools offer some activity as part of their compulsory curriculum; however, it does not cover the government activity guidelines for children needing to accumulate 60 minutes of moderate activity on a daily basis.\n\nDuring Fitness Play and Games course you will learn how to design effective but fun sessions for children. Sessions will incorporate movement to develop balance, coordination, body and spatial awareness, confidence and social interaction. As children get older it is important to include more complex movement patterns which will challenge their senses, fitness levels and confidence and will also educate them about the benefits of physical activity.', 'Thursday, 12pm-1pm', 'For kids', '5', '2', 'Basic', null);
INSERT INTO `course` VALUES ('9', 'Teen Gym', 'With figures regularly declaring a steady rise in obesity levels among young people, many gyms and personal trainers are beginning to train an increasing numbers of teenagers as a greater emphasis is placed on these youngsters to get fit and be healthy.  Undertaking this course allows current instructors to adapt their gym instructing or personal training sessions for 11-18 year olds. In addition, the course explores the physiological and psychological differences between teens and adults and the modifications required to create effective and engaging gym sessions for this age group.', 'Tuesday, 1pm-2pm', 'For teens', '6', '6', 'Basic', null);
INSERT INTO `course` VALUES ('10', 'Teen Studio', 'Teaching group exercise sessions requires certain key attributes including a passion for fitness, an outgoing personality, and a will to improve others. With all of these in abundance, no longer do you have to solely seek adult exercise classes. Whether it’s aerobics, yoga, Pilates or conditioning classes, the choice has now got even bigger with classes specifically aimed at teenagers.\n\nTeen Studio is ideal for anyone interested in running studio classes for 11-18 year olds. The development potential at this age is huge! You can play a major role in boosting the confidence, independence, health and body awareness of youngsters heading towards or through their teenage years.\n\nYou will gain an understanding of the physiological changes that many of your class attendees may be experiencing and will be confident in adapting your sessions accordingly.', 'Saturday, 6pm-7pm', 'For teens', '6', '9', 'Basic', null);
INSERT INTO `course` VALUES ('11', 'Strength and Conditioning', 'Strength and conditioning is used by professional sportsmen and women across the UK to enhance their sporting performance. It’s no coincidence that the huge success of sport in the UK over the last few years has arrived at a time when the UK has seen a significant rise in the number of strength and conditioning coaches.\n\nWith increasing media coverage highlighting the more scientific approaches to fitness which has contributed to such success, fitness enthusiasts are becoming more open-minded to the benefits of employing strength and conditioning specialists. It is the latest trend to hit the fitness industry and will soon be an essential part of any personal trainer’s toolkit.', 'Friday, 3pm-4pm', null, '7', '8', 'Basic', null);
INSERT INTO `course` VALUES ('12', 'Supple Strength', 'Encourage your participants to engage their minds as well as their muscles! Blending elements of yoga, Pilates and body conditioning, we will give you the tools to build a challenging holistic workout. You will explore exercises geared towards building strength and flexibility through a focus on posture, core stability and body alignment.', 'Monday, 4pm-5pm', null, '7', '3', 'Medium', null);
INSERT INTO `course` VALUES ('13', 'Weight Loss in Mind', 'A professional counselling course taught me that the root of our actions, who we are as a person and how we flourish, stems directly from the mind: what we believe and how we feel. We all know the way to lose weight is to follow a calorie-controlled diet and to participate in regular exercise, this is relatively simple but the hard part is getting your mind focused to do this.', 'Wednesday, 2pm-3pm', null, '8', '1', 'Basic', null);
INSERT INTO `course` VALUES ('14', 'Obesity and Diabetes', 'The news is full of worrying stories regarding the nation’s health, in particular the rise in the numbers of obese people and those suffering from Type 2 diabetes. With over a billion people worldwide now classified as overweight or obese, and 3.2 million people diagnosed with diabetes in the UK alone, the figures seem to set to rise for the foreseeable future.\n\nWith any issue comes the need for a solution. The government and the fitness industry are striving to boost the numbers of instructors who specialise in weight management. This extensive and significant Level 4 course will give instructors the vital skills and knowledge to develop detailed and tailored long-term strategies for people with obesity and diabetes.', 'Sunday, 11am-12pm', null, '8', '5', 'Medium', null);
INSERT INTO `course` VALUES ('15', 'Rehabilitation Programme', 'This course introduces you to the biomechanical principles of STOTT PILATES and their application to modified Matwork, light equipment and Reformer exercises. Emphasis is on lumbo-pelvic and shoulder girdle stabilization and the role they play in rehabilitation and injury prevention. The course is designed for physiotherapists, physical and occupational therapists, chiropractors, osteopaths, medical doctors or sports medicine doctors.', 'Sunday, 6pm-7pm', 'Applications are accepted from the following licensed or certified professionals only:\n\nPhysiotherapists/Physical Therapists\nOccupational Therapists\nChiropractors\nOsteopaths\nMedical Doctors or Sports Medicine Doctors', '9', '8', 'Medium', null);
INSERT INTO `course` VALUES ('16', 'Mindful Movement Breathing Workout', 'This mindful movement workout, created by the Merrithew Health & Fitness team, is based on the foundation that proper breathing is the key to a healthy, nourished and vibrant body. We use the breath to activate movement from the inside-out so we can concentrate on optimizing the core connection and mobility of the spine, hips and shoulder girdle. The exercises presented incorporate the Mini Stability Ball and aim to improve posture, relieve the body of negative tension, and strengthen the core.', 'Sunday, 7pm-8pm', 'Open to all Fitness Professionals and Pilates Instructors', '9', '6', 'Medium', null);
INSERT INTO `course` VALUES ('17', 'Swimming', 'No matter if you’re keen to improve your technique, want to learn to swim for the first time, improve your swimming skills, or enter your child in a swimming course; the London Aquatics Centre has tailor made options for you.  Our venue couldn’t be better placed to support you in your water related endeavours and our qualified instructors are ready to welcome all types of swimmers.', 'Tuesday, 11am-12pm', null, '10', '10', 'Basic', null);
INSERT INTO `course` VALUES ('18', 'Snorkelling', 'Snorkelling is great fun, easy to learn and an ideal way to build up confidence in the water. It is accessible to anyone - young or old - and is an enjoyable way to get the whole family involved.\n\nFor younger members of the family, snorkelling is also a great introduction to underwater sports and can be their first step towards learning to dive.', 'Wednesday, 11am-12pm', null, '10', '9', 'Medium', null);
INSERT INTO `course` VALUES ('19', 'Emergency First Aid', 'Whether you are self-employed or work in a gym, being able to give emergency first aid at work is an important skill for anyone. This course provides you with an emergency first aid in the workplace qualification that will be valid for three years from the day of training.', 'Monday, 6pm-7pm', 'No formal qualification required', '3', '7', 'Basic', null);
INSERT INTO `course` VALUES ('20', 'Lower Back Pain', 'Lower back pain affects around a third of adults in the UK every year, and has a huge impact on quality of life. Research has shown exercise to be one of the best remedies; with physical activity significantly relieving symptoms.\n\nIn this comprehensive course instructors who currently hold a Level 3 Diploma in Exercise Referral will develop an understanding of the classification, contributing factors and health risks of different types of lower back pain. You will learn how chronic, non-specific low back pain, medications, psychological/sociological factors and co-morbidities affect a client’s ability to exercise, and how to design effective physical activity and lifestyle programmes.\n\nBy helping to ease their pain through exercise, you can make a real difference to your clients’ lives.', 'Saturday, 8pm-9pm', null, '3', '3', 'Advanced', null);

-- ----------------------------
-- Table structure for course_category
-- ----------------------------
DROP TABLE IF EXISTS `course_category`;
CREATE TABLE `course_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  `about` text,
  `origins` text,
  `good_for` text,
  `practices` text,
  `category_img` varchar(255) DEFAULT NULL,
  `category_video` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_category
-- ----------------------------
INSERT INTO `course_category` VALUES ('1', 'Diploma', 'The Diploma is your one-stop shop to a lucrative career training clients one-to-one and in groups. Learn how to create effective, exciting exercise programmes for sessions both inside and outdoors whilst offering top nutritional advice for exercise.', 'Europe and America', 'People who want to pursue a career on fitness education', 'People between 18-40', null, null);
INSERT INTO `course_category` VALUES ('2', 'Pilates', 'This category is designed to give participants all the basic skills, knowledge and exercises to allow the safe and effective use of Pilates in providing a great workout for their clients. Pilates improves flexibility, agility, posture, balances musculature and teaches to move with ease and grace. In this course participants will learn how to shape clients bodies and help them to improve their lives through Pilates workouts.', 'England', 'People who seek for developing a strong core - flat abdominals and a strong back', 'People between 15-70', null, null);
INSERT INTO `course_category` VALUES ('3', 'First-aid', 'First aid is the assistance given to any person suffering a sudden illness or injury,[1] with care provided to preserve life, prevent the condition from worsening, and/or promote recovery. It includes initial intervention in a serious condition prior to professional medical help being available, such as performing CPR whilst awaiting an ambulance, as well as the complete treatment of minor conditions, such as applying a plaster to a cut. First aid is generally performed by the layperson, with many people trained in providing basic levels of first aid, and others willing to do so from acquired knowledge. Mental health first aid is an extension of the concept of first aid to cover mental health.', 'Ancient Greek', 'Preserve life, Prevent further harm, Promote recovery', 'People older than 12 years old', null, null);
INSERT INTO `course_category` VALUES ('4', 'Exercise', 'Our exercise category offers exercises for weight loss, cardio and strength training, flexibility, yoga and aerobics workouts. We also provide information on weight training, bodybuilding, and wheelchair exercises. Although our listed exercises are mainly for persons with disabilities and health conditions, such as arthritis and osteoporosis, many can be performed by anyone wishing to get and stay fit. Most adults need at least 30 minutes of moderate physical activity at least five days per week.', 'United States', 'People with special cases.', 'People between 15-70', null, null);
INSERT INTO `course_category` VALUES ('5', 'Kids', 'During the courses of thıs caterory you will learn how to design effective but fun sessions for children. Sessions will incorporate movement to develop balance, coordination, body and spatial awareness, confidence and social interaction. As children get older it is important to include more complex movement patterns which will challenge their senses, fitness levels and confidence and will also educate them about the benefits of physical activity.', 'Uknown', 'To improve body and spatial awareness, confidence and social interaction of kids.', 'People between 6-12', null, null);
INSERT INTO `course_category` VALUES ('6', 'Teen', 'During the courses of thıs caterory you will learn how to design effective but fun sessions for kids, Sessions will incorporate movement to develop balance, coordination, body and spatial awareness, confidence and social interaction. As teenagers get older it is important to include more complex movement patterns which will challenge their senses, fitness levels and confidence and will also educate them about the benefits of physical activity.', 'Unknown', 'To improve body and spatial awareness, confidence and social interaction of teenagers.', 'People between 12-18', null, null);
INSERT INTO `course_category` VALUES ('7', 'Physical Performance', 'Physical performance is mainly a function of an individuals\'s size, shape, sex, and age, but not entirely so. Success in sport at whatever level also depends on fitness. It is assumed, of course, that implicit in any definition of fitness is the absence of acute or chronic illness. Fitness is sport specific and in many sports it is also position specific. This “fitness for purpose” is a well accepted concept in sport, as reflected by the use of the word “fit” to describe, for example, successful runners, swimmers, gymnasts, and paraplegic athletes. Nevertheless, fitness for any sport has five common elements - strength, speed, endurance, flexibility, and skill. The relative contributions of each of these to the specific fitness demands of different sports are, of course, not equal. Training time devoted to each of these elements is therefore different between sports and depends on the level of participation. To a certain extent skill can compensate for poor fitness, but improved fitness allows skilful athletes to extend their performance by delaying the onset of fatigue.', 'Ancient Greek', 'People looking for sports performance training, physical therapy, life performance training', 'People between 18-60', null, null);
INSERT INTO `course_category` VALUES ('8', 'Physical Health', 'Regular physical activity is important for good health, and it\'s especially important if you\'re trying to lose weight or to maintain a healthy weight and also diabetics. When losing weight, more physical activity increases the number of calories your body uses for energy or burns off. The burning of calories through physical activity, combined with reducing the number of calories you eat, creates a calorie deficit that results in weight loss.', 'United States', 'People who wants to preserve or revover their health', 'People between 18-70', null, null);
INSERT INTO `course_category` VALUES ('9', 'Physiological Health', 'Studies show that a consistent commitment to exercise decreases anxiety, reduces depression, increases self-esteem and improves restful sleep. While exercise cannot be treated as a panacea for a serious mental health condition, it is a helpful adjunct to other mental health treatments. For milder mental health struggles, exercise leads to relief from worry and stress. Researchers have found that the mental health effects of exercise are greater when you choose strenuous, aerobic forms of exercise that elevate your heart rate and increase your blood circulation. This effect sometimes takes a few weeks to be observable. Greater impact from exercise has been seen in people who either suffer from a high degree of anxiety or were not that fit to begin with.', 'Asia', 'To reduce stress improve self-confidence, boost happy chemicals, help control addiction', 'People between 18-70', null, null);
INSERT INTO `course_category` VALUES ('10', 'Water Sports', 'Water Sports are healthy workouts that can be done for a lifetime. It is a low-impact activity that has several mental and bodily health benefits. That is a recreational motion for every one. Water Sports could provide you with a low-impact workout and it’s also a good method to calm down and feel good. Water Sports build endurance, muscle strength, and cardiovascular fitness.The US Census Bureau reports that two and a half hours per week of aerobic physical activity such as swimming can decrease the risk of chronic illnesses. Along with this, swimming is linked to better cognitive function, lower risk of type 2 diabetes, lower risk of high blood pressure, and lower risk of stroke. People are typically able to exercise longer in water than on land without increased effort, and minimal joint or muscle pain.', 'Ancient Greek', 'For endurance, muscle strength, and cardiovascular fitness', 'Everyone', null, null);

-- ----------------------------
-- Table structure for img
-- ----------------------------
DROP TABLE IF EXISTS `img`;
CREATE TABLE `img` (
  `img_id` varchar(32) NOT NULL,
  `url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of img
-- ----------------------------

-- ----------------------------
-- Table structure for instructor
-- ----------------------------
DROP TABLE IF EXISTS `instructor`;
CREATE TABLE `instructor` (
  `instructor_id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `bio` text NOT NULL,
  `qualifications` text NOT NULL,
  `awards` text,
  `ins_of_month` bit(1) NOT NULL DEFAULT b'0',
  `instructor_img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`instructor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of instructor
-- ----------------------------
INSERT INTO `instructor` VALUES ('1', 'John Frieh', 'John Frieh is many things to many people: father, husband, brother, project manager, engineer, landlord, and small business owner. Simply put, John is a busy person. When his other responsibilities allow John enjoys climbing, especially alpine climbing. John continues to challenge the notion that climbers with careers and/or children cannot accomplish much; since his first trip in 2009 John has climbed at least one significant first ascent or first winter ascent each year in Alaska. Since 2007 John has worked with Dan John, Steve Maxwell, Rob Shaul, Chip Conrad, and others in order to build his knowledge within the realm of \"strength and conditioning\". In 2009 John found his way to Gym Jones and has since enjoyed the opportunity to learn from the best of the best: Mark & Lisa Twight and Rob MacDonald. Since then John has attended the Fundamentals, Intermediate and Advanced Gym Jones seminars as well as assisted at numerous Fundamentals, Intermediate and Advanced Gym Jones seminars. For his efforts John is now considered a Gym Jones disciple and a fully certified instructor. During his training education John came to the realization that he enjoys coaching others as much as he enjoys climbing. Whether it be an endurance sport, or a strength and power dominated sport, or simply physical fitness, John is capable of coaching different athletes to their respective goals given their other life constraints. John is able to offer a variety of solutions whether it be one on one coaching or small group classes at his gym in Portland, Oregon. For those not located in Portland remote programming or mini training camps in Portland or at your location are available.', 'FULLY CERTIFIED GYM JONES INSTRUCTOR', null, '', null);
INSERT INTO `instructor` VALUES ('2', 'Chris Burkeybyle', 'Chris Burkeybyle – better known simply as Burkey – first discovered the deeper implications of fitness while training as a wilderness first responder in Bozeman, Montana. Through that lens, “fitness” was no longer merely a cosmetic goal, but a survival trait. It became apparent that certain intangible qualities – psychological fitness, mental toughness and grit - were the determining factors in ones success . To that end, he began to study, to seek out those who could teach him how use physical training to adjust attitudes, to correct imbalances and shape himself (and eventually others) to truly carry weight. In 2006 Burkey made his first of many trips to Gym Jones. Armed with a wealth of new knowledge, and seeing the benefits of mentorship and a fiercely honest peer group, he began to set plans into motion. Returning to his home outside Detroit, Michigan, Burkey turned his garage into a bare bones gym. Drawing on the lessons learned in the years he worked as a craftsman and a designer – and the questions posed during his time in Salt Lake - he forged practical skills and a love of philosophy into a force of change. After three years of diligent work, he accepted the challenge of training a friend. This responsibility resonated with him, spurring him on to study harder, to ask even more questions, to learn, and eventually – to start another business. In July of 2010 Station 515 was born. In its current embodiment, it exists within a 2500 square foot facility in Ferndale, Michigan. In this small, private location, Burkey works to create an environment that pushes and pulls, questions and guides each individual towards the embodiment their full potential. A place where philosophy has consequences. Be it in a group or a personal setting, sport specific or general fitness, the common thread is the design – to find the problem, and to fix the problem. To understand and to apply. To raise the bar.', 'None', null, '\0', null);
INSERT INTO `instructor` VALUES ('3', 'Paul Timmons', 'Paul Timmons\' diversity as both a strength and endurance athlete combined with over 20 years experience as a fitness professional offers a unique coaching perspective. This point is further illustrated by the fact that Timmons holds two DE State records in different weight classes in the deadlift and was the first person ever to complete a 15 mile solo swim from Cape May, New Jersey to Cape Henlopen, Delaware. During his athletic career Paul is 15-0 as a competitive power lifter in 4 states, has completed 6 Ironman Triathlons (including 3 at the world championships in Kona) and has completed 20 marathons. In addition, Timmons holds the rank of Renshi, which is the equivalent of a fourth degree black belt in Kenjutsu from The Delaware Budokan. Timmons attended one of the very first Gym Jones \"Fundamentals\" seminars in 2007 and has been a Salvation member since it\'s inception. One of the greatest lessons he has learned on the journey to certification is the power of an environment of excellence. And he has modeled his facility, The Firm Fitness Center in that same image. The Firm Fitness Center is a 4000 square foot facility in Rehoboth Beach, Delaware and has been in operation since 1999. Paul has a vast amount of experience in coaching and has worked with a wide variety of clients ranging from those who want to lose weight to those who compete in serious athletic endeavors.', 'None', null, '', null);
INSERT INTO `instructor` VALUES ('4', 'Matthew Owen', 'Matt Owen is the owner and founder of Project Deliverance in St. Louis, Missouri. He graduated from Lindenwood University with a Bachelors of Science in Exercise Science and went on to earn a Masters of Science in Human Performance also from Lindenwood. Matt was a four year varsity letterman and team captain on the Lindenwood Lions Track & Field team. He also spent two years during graduate school training, counseling, and preparing short and long sprinters for competition in addition to managing Project Deliverance. Although Matt\'s collegiate track and field career ended in May of 2010, he continues to train hard and compete in open track meets specializing in the short sprints and long jump events. Each season, Matt spends his winter and spring months competing and challenging himself against the best collegiate and professional sprinters and jumpers in the Midwest. During the spring semester of his freshman year of college, Matt discovered Gym Jones. The project itself resonated so strongly with him that it changed the direction of his college education, training, and the prospect of life after college and athletics. That following summer, Matt started Project Deliverance out of his parent\'s garage as a way to stay in shape for the upcoming track season. He spent most of the summer scraping together equipment, studying the Gym Jones training calendar, and training a handful of his close friends out of the garage. In 2008, Matt attended his first seminar at Gym Jones and has since spent a significant amount of time at the gym learning and developing his set of skills as a trainer, coach, and athlete. Since his first days in the gym, Matt has attended, completed, as well as assisted at the Fundamentals, Intermediate, and Advanced seminars at Gym Jones. In order to complete his undergraduate degree at Lindenwood, Matt was privledged to become the first student intern at Gym Jones. In that three week period, he had the opportunity to learn, work, and train alongside Rob MacDonald, Mark & Lisa Twight, and the other trainers at Gym Jones. The culmination of many years of work, education, and development has earned Matt the opportunity to be considered a Gym Jones disciple and fully certified instructor. Since it\'s founding in 2007, Project Deliverance has moved to a warehouse location in the South City area of St. Louis. The gym itself specializes in training athletes of all calibers as well as those who are willing to suffer in order to improve as a result. Project Deliverance offers group, one on one, and also remote training and coaching solutions. As a trainer and coach, Matt has extensive experience in the development of speed, power, power endurance, and running technique on and off of the track but is also just as capable of training endurance athletes or those who are just training for general physical preparedness.', 'None', null, '', null);
INSERT INTO `instructor` VALUES ('5', 'Shawn Kingrey', 'Shawn Kingrey wears many different hats. He is a husband, friend, instructor, team-mate, coach, artist, cyclist and fire fighter. Athletics have always been a major part of Shawn’s life. His activities have included wrestling, football, skateboarding, ice hockey and bouldering; however, if you ask him, he would say that he is “just a bike racer”. Shawn started off racing BMX as a kid then moved on to Downhill mountain bikes in college and later reinvented himself as a Road Racer. Shawn has learned from from many different people in a variety of sports: John Gill as his climbing mentor, Dave Feamster showed him the ropes in ice hockey, and Dan Pate Sr. taught him how to truly ride a road bike. Shawn has earned multiple certifications from diverse strength & conditioning organizations. He is very driven to deepen his knowledge base in nutrition, fitness, and recovery on both practical and theoretical levels. He uses this insight to improve his own athletic endeavors as well as enrich his clients’ expertise. Shawn made his way into Gym Jones after meeting Mark Twight at the 2008 Porcupine Hill Climb race in Salt Lake City. Shawn has since attended the Fundamentals, Intermediate and Advance seminars at Gym Jones where he enjoyed the opportunity to learn from Mark & Lisa Twight and Rob MacDonald. He has also been an assistant at multiple Gym Jones seminars. Gym Jones has become Shawn’s sanctuary were he finds inspiration to keep improving and growing in all of life’s endeavors. Shawn came to realize that he enjoyed training other people. He has helped co-workers train for the Combat Challenge, became a peer fitness trainer, and aid in the development of a “Wellness Program” for the Fire Department. Shawn also trains clients out of his private facility in Pueblo, CO on a 1:1 basis. Even though Shawn’s specializes in training endurance athletes he enjoys training athletes for strength/power, general fitness, or sports specific goals. For those not located in the Colorado Springs/Pueblo area, remote programming is available.', 'None', null, '\0', null);
INSERT INTO `instructor` VALUES ('6', 'Carolyn Parker', 'Carolyn Parker is, to many; an instructor, coach, friend, mentor, athlete, and someone to depend on. She has a 25+ year career in numerous sports, she “might” be referred to as a climber; with 23 years of experience in all disciplines from rock, ice, alpine climbing, and ski mountaineering, and 18 years professional guiding experience; she is however not merely a climber. Her deep and diverse experience base comes from high level participation in many sports: including road and mountain bike racing, trail running, alpine and backcountry skiing a long practice of yoga and most recently surfing. As much as she is a spirit of the mountain environment she has an infectious desire to wield “the tools” existing in a unique gym setting to continue to excel and help others to achieve their goals. Carolyn holds degrees from CNM and UNM circa 1989, 1993, her knowledge base most specifically comes from her personal commitment to learning, practicing, seeking to be better and a life long desire to “not suck”. In 1990, she started her first entrepreneurial endeavor, a women’s specific mountain bike clinic series and in 1993 obtained her first trainer certification. She began her professional climbing and guiding career in 1994, and is now a fully Certified AMGA Rock Guide. As her life came full circle, she came out of her full time mountain life in 2002 and as she scaled back her climbing and guiding ambitions she set her sights on building a business that reflected her passion for teaching, health, knowledge, community and athletic performance; she founded \"AthenaFit Training\" (which has now evolved into \"Ripple Effect Training\"). In that same year, she established her women’s climbing clinic series “Climb like a Girl”. Now with another decade under her belt, she has trained numerous athletes, ultra endurance runners, cyclists, multi-sport competitors, climbers, marathon runners, ski racers, and the general population in all aspects of fitness and health. Mark and Lisa Twight are long time friends of Carolyn’s. Her friendship with Mark dates back to 1994 when their paths crossed; recognizing each other as like minded spirits an immediate respect was established. Carolyn has been with Gym Jones since the beginning, when it wasn’t much more than a room in the back of a warehouse with a box, some weights, a \"bachar\" ladder and a tiny climbing wall. Carolyn is characterized by many as deeply motivated, bordering on obsessed, in her pursuit of knowledge and practical skill that combined with her tremendous respect for Mark and Lisa, their level of knowledge, commitment and high standards in everything they do, brought Carolyn to pursue the Gym Jones Fully Certified Instructor position. Along the way she had the honor of training with not only Mark, Lisa and the BJJ crew; but most recently learning from and establishing a friendship with Rob MacDonald another individual she has tremendous respect for and feels is an invaluable member of the Gym Jones team. She is honored to be considered a satellite of the gym. Gym Jones is the one place she feels can go to gain skill, knowledge, professional inspiration, and be guaranteed that her peers will never stop learning and growing. Carolyn’s facility is a private gym in Carbondale CO. It is here her passion comes to light, with her diverse background Carolyn trains individuals with interests in endurance based sports, power and strength based sports, climbing specific coaching and those just desiring general fitness. Training often occurs in 1:1 or small group settings however, in addition to her local athletes, Carolyn consults with many regional athletes creating training “camps” for the visiting athlete to gain the practical knowledge necessary to follow their specialized training programs she develops with them.', 'None', null, '\0', null);
INSERT INTO `instructor` VALUES ('7', 'Antonio Cordova', 'Antonio served in the U.S. Navy between 1998-2003. He traveled around the world and completed several tours overseas on the destroyer the U.S.S. Thorn. It was during this time he began to take a serious interest in performance and overall fitness due to the rigorous physical activity required. After leaving the military he pursed an education in classical music although he remained passionate about physical fitness. Antonio began his journey coaching others in 2005. He sought out different training modalities to enrich his knowledge. He has attended several RKC seminars as a trainee and instructor under Pavel Tsatsouline and Steve Maxwell. In 2010, Antonio attended Gym Jones Fundamentals seminar under Mark Twight and Rob MacDonald. Since then Antonio has attended GJ’s Intermediate and Advanced seminars. He has recently assisted at Fundamentals seminars. Antonio has completed all the GJ standards and requirements making him a Gym Jones \'Fully Certified Instructor\'. During his time spent at Gym Jones, Antonio strengthened his resolve to improve himself and his clients and subsequently opened a facility in Manhattan. He founded Precision Athlete with a colleague, Antoinette Vo. Precision Athlete is 1750 sq. ft. facility on the Upper West Side of Manhattan dedicated to advancing the understanding and development of real fitness. Precision Athlete offers private one-on-one training, semi-private training and small group classes. Each athlete has a program that is thoughtfully crafted to help achieve specific goals which can be achieved through a combination of session/class types. Antonio serves a variety of clients ranging from athletes, students, working professionals and many others who are committed to improving their strength and conditioning.', 'None', null, '', null);
INSERT INTO `instructor` VALUES ('8', 'Mario Donato', 'Born and raised in the Bahamas, Mario had no choice but to become aquatic. Surrounded by Swimmers, Free-divers and Scuba Divers he learned about the ocean first hand. His lessons started to pay off fast. At age 10 he started winning swimming competitions and free-diving down to 10m/32ft on a single breath of air. As he grew older his passion for the water strengthened. Becoming a Scuba Diving Instructor he travelled the world for the next 10 years exploring every major ocean. During his travels he was fortunate enough to learn and train with the best record holding free-divers in the world such as William Trubridge and Martin Stepanek. During this time he became an accomplished free-diver and setting records amongst his mentors with a max depth of 93m/305ft and a 8’ 30” breath hold along with dropping his heart rate down to 20 beats a minute at depth, something only found in marine mammals and other top free-divers. In 2006 while training for his last dive he stumbled across the Gym Jones website. Mario wrote Gym Jones expressing that he was training for a dive and had been revisiting the website for inspiration and assistance. The seed became planted when Gym Jones replied with a very supportive and interested response to Mario’s letter. For the next few years he followed Gym Jones and in 2010 became a Salvation Member. He visited Gym Jones a few times a year. While there, Rob MacDonald, Mark & Lisa Twight, and Carolyn Parker had a profound effect on him and his outlook on fitness. Mario has been fortunate enough to train Professional Athletes and Celebrities over the past 5 years. In 2014 he opened CMD GYM. “Center Of Mass Destruction” in Sweden where he continues to train professionals and Athletes. Mario feels the biggest lesson he has learned is: the body waits for the mind to catch up.', 'FOUNDER OF CMD GYM', null, '\0', null);
INSERT INTO `instructor` VALUES ('9', 'John Negoescu', 'John started training at theMill Gym in Perth, WA in 2008 during its first days of opening. theMill concept was inspired by one in particular individual - Mark Twight, and his vision and creation of Gym Jones. A bit of background to theMill: theMill founders wanted to create a specific environment to train in. An environment where like-minded people, including professionals, athletes and everyday people who understand what they seek and why they suffer for it. theMill is not open to anyone, you cannot buy your way in, there is a strict Initiation process, membership is earned and membership is regularly assessed. theMill is a state-of-mind where the emphasis is ‘to get the job done’. There is an ethos that members are expected to follow and, likewise what members can expect of their Trainers at theMill (Ethos: Relentless pursuit of excellence, Discipline, Primacy of functional capability, Humility, Sense of family, Sense of humour, Loyalty, Mutual Respect). In 2009, John was asked to become a Trainer at theMill as the founders saw him consistently and without fail, mirror the ethos of the gym and what it stood for with maturity beyond his years. With Gym Jones being the inspiration behind theMill, John took it upon himself to visit Gym Jones and begin his seminar education to becoming a fully certified Gym Jones Instructor. This process began in July 2011 and in February 2013 he completed all requirements to become a Gym Jones Certified Instructor. The only Gym Jones Certified Instructor in Australia. Through this process John stepped up at theMill, given the responsibility to create the structured and phased programming for all its clients. When John competed in a charity amateur boxing match in 2012, he was given the nick name “Quota”. The joke being that John is a man of few words. In some ways this nickname is accurate in that John does not engage in purposeless chat, displaying a constant interchange between disciplined mind and disciplined body. This obtains the respect from those around him and when he speaks, people listen. John consistently seeks out the uncomfortable, faces his fears and pushes his limits. He suffers in silence, puts his head down, and does what needs to be done. In the same breath, he is as disciplined and structured with his rest and recovery. John is carving out a life for himself that involves training, gaining knowledge of training and being surrounded by and learning from the best in their field. This is what he loves to do and how he loves to live.', 'None', null, '', null);
INSERT INTO `instructor` VALUES ('10', 'Pieter Vodden', 'Pieter is the first trainer from the UK to achieve full certification at Gym Jones. He has competed in a wide range of sports including football, boxing, athletics and basketball . His evolution in to a trainer was a natural progression having spent a lifetime in the gym, participating in a broad range of sport including both team and individual pursuits and having consistently studied training methodology and nutrition throughout his life. He first became a trainer in 2006 and has studied under top coaches including Charles Poliquin (PICP, Biosigniture), Adam Booth (Outbox) and Giles Greenwood (Olympic Lifting). However he considers the most significant and influential moment in his life as a trainer to be the day he met Mark Twight and Rob Macdonald at a Fundamentals Seminar in the UK in 2010. The way he has trained himself and his clients changed from that day. Seeking a better, more complete, more inspirational way of training that focuses on \"the existence of genuine fitness\" rather than the \"appearance of it\" became paramount to his programming. In his own words: \"I felt exposed, inspired , humbled and changed by my first Gym Jones experience. Mark and Rob revealed weaknesses that need correction and highlighted the existence of something better, broader yet more specific with a greater sense of athletic purpose. Nothing has been the same since. I have been further inspired by other Fully Certified Instructors and members of Gym Jones like Carolyn Parker, John Frieh, George Mayhew and feel very fortunate to have learned and trained with these people and to be part of the Gym Jones family.\" Pieter started coming out to Salt Lake City shortly after that first seminar and has since completed Intermediate, Advanced and his Internship at Gym Jones making him the first fully certified instructor outside of the U.S. He started is own company Vodden UNLTD to bring together a community that, through both individual and group work, carries the knowledge, work ethic and essence of Gym Jones to athletes and members of the public in the UK. He has brought his training up to a standard set by Gym Jones and coaches his community to follow the same path.', 'None', null, '\0', null);

-- ----------------------------
-- Table structure for offer
-- ----------------------------
DROP TABLE IF EXISTS `offer`;
CREATE TABLE `offer` (
  `course_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  KEY `catagory_id` (`category_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `offer_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `course_category` (`category_id`),
  CONSTRAINT `offer_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of offer
-- ----------------------------
INSERT INTO `offer` VALUES ('1', '1');
INSERT INTO `offer` VALUES ('2', '1');
INSERT INTO `offer` VALUES ('3', '2');
INSERT INTO `offer` VALUES ('4', '2');
INSERT INTO `offer` VALUES ('5', '3');
INSERT INTO `offer` VALUES ('6', '3');
INSERT INTO `offer` VALUES ('19', '3');
INSERT INTO `offer` VALUES ('20', '3');
INSERT INTO `offer` VALUES ('7', '5');
INSERT INTO `offer` VALUES ('8', '5');
INSERT INTO `offer` VALUES ('9', '6');
INSERT INTO `offer` VALUES ('10', '6');
INSERT INTO `offer` VALUES ('11', '7');
INSERT INTO `offer` VALUES ('12', '7');
INSERT INTO `offer` VALUES ('13', '8');
INSERT INTO `offer` VALUES ('14', '8');
INSERT INTO `offer` VALUES ('15', '9');
INSERT INTO `offer` VALUES ('16', '9');
INSERT INTO `offer` VALUES ('17', '10');
INSERT INTO `offer` VALUES ('18', '10');

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_name` varchar(100) NOT NULL,
  `coord_x` float DEFAULT NULL,
  `coord_y` float DEFAULT NULL,
  `room_img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES ('1', 'Room Inge', '45.4751', '9.25017', null);
INSERT INTO `room` VALUES ('2', 'Room Harmon', '45.4751', '9.25017', null);
INSERT INTO `room` VALUES ('3', 'Room Harald', '45.4749', '9.24913', null);
INSERT INTO `room` VALUES ('4', 'Room Varghese', '45.4749', '9.24913', null);
INSERT INTO `room` VALUES ('5', 'Room Chandra', '45.4749', '9.24845', null);
INSERT INTO `room` VALUES ('6', 'Room Zal', '45.4754', '9.24817', null);
INSERT INTO `room` VALUES ('7', 'Room Herod', '45.4754', '9.24817', null);
INSERT INTO `room` VALUES ('8', 'Room Roderic', '45.4754', '9.24817', null);
INSERT INTO `room` VALUES ('9', 'Room Aslan', '45.4758', '9.24962', null);
INSERT INTO `room` VALUES ('10', 'Room Patrice', '45.4758', '9.24962', null);

-- ----------------------------
-- Table structure for teaches_1
-- ----------------------------
DROP TABLE IF EXISTS `teaches_1`;
CREATE TABLE `teaches_1` (
  `course_id` int(11) NOT NULL,
  `instructor_id` int(11) NOT NULL,
  KEY `instructor_id` (`instructor_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `teaches_1_ibfk_1` FOREIGN KEY (`instructor_id`) REFERENCES `instructor` (`instructor_id`),
  CONSTRAINT `teaches_1_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teaches_1
-- ----------------------------
INSERT INTO `teaches_1` VALUES ('5', '1');
INSERT INTO `teaches_1` VALUES ('12', '1');
INSERT INTO `teaches_1` VALUES ('13', '1');
INSERT INTO `teaches_1` VALUES ('15', '1');
INSERT INTO `teaches_1` VALUES ('2', '2');
INSERT INTO `teaches_1` VALUES ('5', '2');
INSERT INTO `teaches_1` VALUES ('8', '2');
INSERT INTO `teaches_1` VALUES ('11', '2');
INSERT INTO `teaches_1` VALUES ('1', '3');
INSERT INTO `teaches_1` VALUES ('4', '3');
INSERT INTO `teaches_1` VALUES ('16', '3');
INSERT INTO `teaches_1` VALUES ('18', '3');
INSERT INTO `teaches_1` VALUES ('1', '4');
INSERT INTO `teaches_1` VALUES ('20', '4');
INSERT INTO `teaches_1` VALUES ('17', '4');
INSERT INTO `teaches_1` VALUES ('14', '4');
INSERT INTO `teaches_1` VALUES ('2', '5');
INSERT INTO `teaches_1` VALUES ('19', '5');
INSERT INTO `teaches_1` VALUES ('7', '5');
INSERT INTO `teaches_1` VALUES ('9', '5');
INSERT INTO `teaches_1` VALUES ('3', '6');
INSERT INTO `teaches_1` VALUES ('6', '6');
INSERT INTO `teaches_1` VALUES ('10', '6');
INSERT INTO `teaches_1` VALUES ('15', '6');
INSERT INTO `teaches_1` VALUES ('3', '7');
INSERT INTO `teaches_1` VALUES ('19', '7');
INSERT INTO `teaches_1` VALUES ('6', '7');
INSERT INTO `teaches_1` VALUES ('7', '7');
INSERT INTO `teaches_1` VALUES ('4', '8');
INSERT INTO `teaches_1` VALUES ('8', '8');
INSERT INTO `teaches_1` VALUES ('13', '8');
INSERT INTO `teaches_1` VALUES ('17', '8');
INSERT INTO `teaches_1` VALUES ('20', '9');
INSERT INTO `teaches_1` VALUES ('9', '9');
INSERT INTO `teaches_1` VALUES ('11', '9');
INSERT INTO `teaches_1` VALUES ('18', '9');
INSERT INTO `teaches_1` VALUES ('10', '10');
INSERT INTO `teaches_1` VALUES ('12', '10');
INSERT INTO `teaches_1` VALUES ('14', '10');
INSERT INTO `teaches_1` VALUES ('16', '10');

-- ----------------------------
-- Table structure for teaches_2
-- ----------------------------
DROP TABLE IF EXISTS `teaches_2`;
CREATE TABLE `teaches_2` (
  `category_id` int(11) NOT NULL,
  `instructor_id` int(11) NOT NULL,
  KEY `instructor_id` (`instructor_id`),
  KEY `catagory_id` (`category_id`),
  CONSTRAINT `teaches_2_ibfk_1` FOREIGN KEY (`instructor_id`) REFERENCES `instructor` (`instructor_id`),
  CONSTRAINT `teaches_2_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `course_category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teaches_2
-- ----------------------------
INSERT INTO `teaches_2` VALUES ('4', '1');
INSERT INTO `teaches_2` VALUES ('7', '1');
INSERT INTO `teaches_2` VALUES ('8', '1');
INSERT INTO `teaches_2` VALUES ('9', '1');
INSERT INTO `teaches_2` VALUES ('1', '2');
INSERT INTO `teaches_2` VALUES ('4', '2');
INSERT INTO `teaches_2` VALUES ('5', '2');
INSERT INTO `teaches_2` VALUES ('7', '2');
INSERT INTO `teaches_2` VALUES ('1', '3');
INSERT INTO `teaches_2` VALUES ('2', '3');
INSERT INTO `teaches_2` VALUES ('9', '3');
INSERT INTO `teaches_2` VALUES ('10', '3');
INSERT INTO `teaches_2` VALUES ('1', '4');
INSERT INTO `teaches_2` VALUES ('3', '4');
INSERT INTO `teaches_2` VALUES ('10', '4');
INSERT INTO `teaches_2` VALUES ('8', '4');
INSERT INTO `teaches_2` VALUES ('1', '5');
INSERT INTO `teaches_2` VALUES ('3', '5');
INSERT INTO `teaches_2` VALUES ('5', '5');
INSERT INTO `teaches_2` VALUES ('6', '5');
INSERT INTO `teaches_2` VALUES ('2', '6');
INSERT INTO `teaches_2` VALUES ('4', '6');
INSERT INTO `teaches_2` VALUES ('6', '6');
INSERT INTO `teaches_2` VALUES ('9', '6');
INSERT INTO `teaches_2` VALUES ('2', '7');
INSERT INTO `teaches_2` VALUES ('3', '7');
INSERT INTO `teaches_2` VALUES ('4', '7');
INSERT INTO `teaches_2` VALUES ('5', '7');
INSERT INTO `teaches_2` VALUES ('2', '8');
INSERT INTO `teaches_2` VALUES ('5', '8');
INSERT INTO `teaches_2` VALUES ('8', '8');
INSERT INTO `teaches_2` VALUES ('10', '8');
INSERT INTO `teaches_2` VALUES ('3', '9');
INSERT INTO `teaches_2` VALUES ('6', '9');
INSERT INTO `teaches_2` VALUES ('7', '9');
INSERT INTO `teaches_2` VALUES ('10', '9');
INSERT INTO `teaches_2` VALUES ('6', '10');
INSERT INTO `teaches_2` VALUES ('7', '10');
INSERT INTO `teaches_2` VALUES ('8', '10');
INSERT INTO `teaches_2` VALUES ('9', '10');

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `video_id` varchar(32) NOT NULL,
  `url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video
-- ----------------------------

-- ----------------------------
-- View structure for staff_1
-- ----------------------------
DROP VIEW IF EXISTS `staff_1`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `staff_1` AS select `c`.`course_id` AS `course_id`,`c`.`course_name` AS `course_name`,`i`.`instructor_id` AS `instructor_id`,`i`.`full_name` AS `full_name`,`i`.`bio` AS `bio`,`i`.`qualifications` AS `qualifications`,`i`.`awards` AS `awards`,`i`.`ins_of_month` AS `ins_of_month` from ((`course` `c` join `teaches_1` `t` on((`c`.`course_id` = `t`.`course_id`))) join `instructor` `i` on((`t`.`instructor_id` = `i`.`instructor_id`))) ; ;

-- ----------------------------
-- View structure for staff_2
-- ----------------------------
DROP VIEW IF EXISTS `staff_2`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `staff_2` AS select `c`.`category_id` AS `category_id`,`c`.`category_name` AS `category_name`,`i`.`instructor_id` AS `instructor_id`,`i`.`full_name` AS `full_name`,`i`.`bio` AS `bio`,`i`.`qualifications` AS `qualifications`,`i`.`awards` AS `awards`,`i`.`ins_of_month` AS `ins_of_month` from ((`course_category` `c` join `teaches_2` `t` on((`c`.`category_id` = `t`.`catagory_id`))) join `instructor` `i` on((`t`.`instructor_id` = `i`.`instructor_id`))) ; ;
DROP TRIGGER IF EXISTS `populate`;
DELIMITER ;;
CREATE TRIGGER `populate` AFTER INSERT ON `teaches_1` FOR EACH ROW begin
		DECLARE temp INT;
        set temp := (select belongs_to from course where course_id=new.course_id);
		insert into teaches_2
			values(temp,new.instructor_id);
    end
;;
DELIMITER ;
