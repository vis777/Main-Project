/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 8.0.31 : Database - health_chatbot
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`health_chatbot` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `health_chatbot`;

/*Table structure for table `chat` */

DROP TABLE IF EXISTS `chat`;

CREATE TABLE `chat` (
  `Chatid` int NOT NULL AUTO_INCREMENT,
  `Chat` varchar(100) DEFAULT NULL,
  `fromid` int DEFAULT NULL,
  `toid` int DEFAULT NULL,
  `Date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Chatid`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `chat` */

insert  into `chat`(`Chatid`,`Chat`,`fromid`,`toid`,`Date`) values 
(1,'hi',3,7,'2023-03-23'),
(2,'hlo',3,7,'2023-03-23'),
(3,'hh',3,7,'2023-03-23'),
(4,'hlo',3,7,'2023-03-23'),
(5,'sd',3,7,'2023-03-23'),
(6,'hi',2,13,'2023-03-23'),
(7,'hello',2,13,'2023-03-23'),
(8,'good morning\r\n',2,3,'2023-03-23'),
(9,'ok',3,2,'2023-03-23'),
(10,'  bgbbgv',2,3,'2023-03-27'),
(11,'bbbn',2,3,'2023-03-27'),
(12,'OIDXOI\'Qhdx',3,2,'2023-03-27'),
(13,'gjfgjfx',2,3,'2023-03-27'),
(14,'hello',3,2,'2023-03-31'),
(15,'hello',2,3,'2023-03-31'),
(16,'hy\r\n',3,5,'2023-04-01'),
(17,'hello',6,2,'2023-04-04');

/*Table structure for table `chatbot` */

DROP TABLE IF EXISTS `chatbot`;

CREATE TABLE `chatbot` (
  `Chid` int NOT NULL AUTO_INCREMENT,
  `Dataid` int DEFAULT NULL,
  `Reply` varchar(100) DEFAULT NULL,
  `Send` int DEFAULT NULL,
  PRIMARY KEY (`Chid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `chatbot` */

/*Table structure for table `complaint` */

DROP TABLE IF EXISTS `complaint`;

CREATE TABLE `complaint` (
  `Cid` int NOT NULL AUTO_INCREMENT,
  `lid` int DEFAULT NULL,
  `Complaint` varchar(100) DEFAULT NULL,
  `Date` varchar(100) DEFAULT NULL,
  `Reply` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Cid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `complaint` */

insert  into `complaint`(`Cid`,`lid`,`Complaint`,`Date`,`Reply`) values 
(1,3,'bad','01/01/2000','okkkkkk'),
(2,3,'gfxgf','2023-03-23','ok'),
(3,3,'what?','2023-03-27','yeah'),
(4,6,'why we get cold?','2023-04-03','pending'),
(5,7,'What are allergies?','2023-04-03','pending');

/*Table structure for table `dataset` */

DROP TABLE IF EXISTS `dataset`;

CREATE TABLE `dataset` (
  `Dataid` int NOT NULL AUTO_INCREMENT,
  `Question` varchar(100) DEFAULT NULL,
  `Answer` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`Dataid`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `dataset` */

insert  into `dataset`(`Dataid`,`Question`,`Answer`) values 
(7,'Why do I get sick?','When you get sick, part or all of your body is not working as it should. The cause of sickness can come from inside your body or from the outside world. Diseases that start on the inside are usually inherited in the genes that you receive from your parents, which make up the master plan that determines how your body will grow and run. Abnormal development or functioning of different body systems is the cause of many chronic diseases.  Things in the outside world can cause sickness too. Poisons in the environment can cause illnesses in people. Not eating the right foods, with their important nutrients, can also cause diseases. But the most common cause of sickness from the outside world is infectious agents. These agents are usually microscopic organisms (living things so small that they can only be seen with the help of microscopes) such as bacteria and viruses, commonly referred to as germs. Bacteria and viruses and other microscopic organisms live in the air, water, and soil that make up our world. They are on the things and people we touch and in the food we eat. Many of them are beneficial: bacteria are needed to make cheese, some bacteria help vegetables grow, and some bacteria clean the environment and enrich the soil by feeding on dead plants and animals. But there are other microscopic organisms that invade the bodies of plants and animals—and people—and cause diseases.'),
(8,'How do the disease-causing germs invade my body?','Your skin is a wonderful protective barrier that prevents many of the disease-causing germs that you run into each day from entering your body. Only when you have an opening in your skin—like a cut or a scrape—are germs likely to enter there. Most germs enter through your mouth and nose, making their way farther into your body through your respiratory or digestive tracts. But even then, certain chemicals in body tissues and fluids keep many harmful germs from causing problems. When an infection does begin—with the germs multiplying inside your body—your immune systemleaps into action to get rid of the foreign organisms. Your white blood cells produce special substances called antibodies that attack and destroy the invaders, helping you to recover.'),
(9,'What does the immune system do?','The immune system protects the human body against germs, which are microorganisms that cause sickness and disease. There are four major types of germs— harmful bacteria (pathogens), viruses, fungi, and protozoa. This defense system begins with the skin, which stops germs from getting into your blood or tissues. If germs get into your body, for example through your nose or mouth, white blood cells called phagocytes and lymphocytes attack them. Phagocytes scout out and destroy invaders, and long-living lymphocytes remember the invaders and release chemicals called antibodies to make the body resistant, or immune, to them. White blood cells live in the bloodstream, lymphatic system, and spleen.  The lymphatic system (or lymph system, for short) is a far-reaching network that extends throughout your entire body. A clear liquid called lymph runs throughout the system, washing the body’s cells with nutrients and water and detecting and removing pathogens. Lymph is filtered through the lymph nodes and then passes into the body\'s bloodstream.'),
(10,'What is the difference between bacteria and viruses?','Bacteria are single-celled organisms that have the ability to feed themselves and to reproduce. They are found everywhere, including the air, water, and soil. They divide and multiply very quickly, which means that one cell can become 1 million cells in just a few hours. Viruses are microorganisms that are smaller than bacteria, but they cannot grow or reproduce without the help of a separate living cell. Once a virus gets inside your body, it attaches itself to a healthy cell and uses the cell’s nucleus to reproduce itself.'),
(11,'Do our intestines contain germs?','Yes, our intestines contain germs. Germs aren\'t all bad—in fact, some are helpful. For example, the common bacterium E. coli can be found in our intestines, and it helps us digest green vegetables and beans (also making gases). These same bacteria also make vitamin K, which causes blood to clot.'),
(12,'Where are some other places that germs hide?','Germs are everywhere! Most germs spread through the air, invading our homes, pets, and family, and sometimes they make us sick. Besides your bathroom toilet and the kitchen sink, everyday items such as shopping carts, restaurant menus, mobile phones, and shower curtains contain germs. These items contain bacteria, mold, and rhinoviruses (instigators of the common cold) that can lead to sickness. In fact, cold and flu viruses can survive for 18 hours on hard surfaces. Common household items can be swabbed with a disinfectant wipe easily before use in order to prevent germs from spreading. Washing your hands with soap and water, using hand sanitizer, and avoiding touching your face with your hands after using these items also helps keep germs away from you. To eliminate dust mites—those little critters that live in your bed sheets and feed on dead skin cells—don’t make your bed for a while. Studies have found that dust mites need humidity levels above 50 percent to survive and cannot live in the arid conditions of an unmade bed.'),
(13,'What are allergies?','An allergic reaction is a reaction to a substance that is typically harmless to most other people. Allergies happen when a person’s immune system overreacts to a substance that the person has breathed in, touched, or eaten. Allergens—the antigens that bring on an allergic reaction—may be foods, medications, plants or animals, chemicals, dust, or molds. Some common allergic reactions are hay fever, allergic conjunctivitis (an eye reaction), asthma, pet-dander allergies, and skin reactions, such as hives. A common cause for allergies are dust mites, a large part of household dust. If they are breathed in by an allergic person, the body parts of the dead mites can trigger asthma, a lung condition that causes a person to have difficulty breathing. Cat and dog dander, or skin flakes, can cause an allergic reaction, such as sneezing, wheezing, and runny eyes and nose. Common food allergy triggers are the proteins in cow’s milk, eggs, peanuts, wheat, soy, fish, shellfish, and tree nuts.'),
(14,'What are antibiotics?','Antibiotics are medicines that help the human body fight bacteria, either by killing the offending germs directly or by weakening them so that the body’s own immune system can fight and kill them more easily. The most widely known antibiotic is penicillin, which is made from mold. Penicillin kills bacteria by interfering with the formation of the cell walls or cell contents of the bacteria.'),
(15,'How was penicillin developed?','In 1928 the Scottish research scientist Alexander Fleming found that mold had accidentally contaminated one of his experiments. The mold created a bacteria-free circle around itself, and Fleming deduced that the mold was an antibacterial agent that could kill many harmful bacteria. He named the active agent penicillin. By the middle of the 20th century, Fleming’s discovery birthed a pharmaceutical industry that made synthetic penicillin to treat many bacterial diseases of the day, including syphilis, gangrene, and tuberculosis. He won a Nobel Prize in 1945 for his discovery.'),
(16,'Can chicken soup help a cold go away?','Chicken soup doesn\'t cure a cold, but it can help lessen the symptoms. For centuries, people around the world have used chicken soup to treat the common cold. Chicken soup can help people feel better, but scientists have learned that chicken fat may help relieve cold and flu symptoms in two ways. First, the chicken broth acts as an anti-inflammatory by slowing down the movement of neutrophils (immune system cells that play a role in the body’s inflammatory response). Second, it temporarily speeds up the movement of mucus through the nose. This movement helps relieve congestion and limits the amount of time viruses are in contact with the nose’s lining.'),
(17,'Why is exercise important to health?','Exercise is good for your health. Regular physical activity helps a person have stronger bones and muscles, helps control body fat, helps prevent certain illnesses, and contributes to a good outlook on life. Regular exercise helps promote digestion and a good night’s sleep. When children exercise as part of their busy lives, they are better equipped to manage the physical and emotional challenges of a busy day. Many governments and other organizations recommend at least 150 minutes of moderate-intensity physical activity every week.'),
(18,'Why is sleep necessary for good health?','Scientists do not know exactly why people need sleep, but studies show that sleep is necessary for survival. Sleep appears to be necessary for the nervous system to work properly. While too little sleep one night may leave us feeling drowsy and unable to concentrate the next day, a long period of too little sleep leads to poor memory and physical performance. Hallucinations (experiencing things that aren’t really there), vision problems, and mood swings may develop if sleep deprivation continues.'),
(19,'Can alcohol be bad for your health?','Alcohol is a type of drug known as a depressant that slows down the body’s central nervous system. After a person has had a few drinks, it immediately affects the way they think or act. Alcohol can make a person feel sleepy, less coordinated, and slow to react. And it can cause your brain to feel foggy as well as make you think and see differently. After years of drinking, alcohol use can cause stomach and intestinal problems, liver damage, nerve and muscle damage, heart problems, and brain damage. Alcohol can cause everything from blackouts to permanent loss of brain function and memory. Researchers have also linked long-term drinking to cancer of the throat, mouth, liver, esophagus, and larynx. Drinking alcohol can also lead to emotional and psychological problems such as sadness and depression. If a pregnant woman drinks too much alcohol, it can seriously injure her unborn baby and result in birth defects.'),
(20,'Why is smoking cigarettes unhealthy?','In addition to the stimulant nicotine, cigarettes contain many harmful chemicals, including tar and the poisonous gas carbon monoxide. These chemicals present health risks that range from bronchitis to cancer. Doctors believe that cigarette smoking is the cause of 90 percent of all cases of lung cancer. Heart disease, heart attack, and stroke are far more common in smokers. One of the effects of nicotine is constricting the blood vessels, which causes high blood pressure. Another effect is that smoking raises your heart rate, which adds extra stress on your heart. Smoking also affects every part of the body’s circulatory system. Your blood becomes thicker and stickier, making it harder for your heart to work effectively. The lining of the blood vessels is damaged, allowing fat deposits to stick, which most likely causes arteriosclerosis, or hardening of the arteries. Smoking also stains teeth, fingernails, and lung tissue, and it causes bad breath.'),
(21,'Is secondhand smoke bad?','Yes, secondhand smoke is bad. Also known as environmental tobacco smoke (ETS), secondhand smoke is a mixture of the smoke given off by the burning end of a cigarette, pipe, or cigar and the smoke exhaled by people who are smoking. It is involuntarily inhaled by nonsmokers, lingers in the air hours after cigarettes have been extinguished, and can cause a wide range of illnesses, including cancer, respiratory infections, and asthma.');

/*Table structure for table `disease` */

DROP TABLE IF EXISTS `disease`;

CREATE TABLE `disease` (
  `disease_id` int NOT NULL AUTO_INCREMENT,
  `disease` varchar(1000) DEFAULT NULL,
  `treatment` varchar(1000) DEFAULT NULL,
  `preventive_measure` varchar(5000) DEFAULT NULL,
  `did` int DEFAULT NULL,
  PRIMARY KEY (`disease_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

/*Data for the table `disease` */

insert  into `disease`(`disease_id`,`disease`,`treatment`,`preventive_measure`,`did`) values 
(1,'Fungal infection','bath twice, use detol or neem in bathing water, keep infected area dry, use clean cloths','In humans, fungal infections occur when an invading fungus takes over an area of the body and is too much for the immune system to handle. Fungi can live in the air, soil, water, and plants. There are also some fungi that live naturally in the human body. Like many microbes, there are helpful fungi and harmful fungi.',9),
(2,'Allergy','apply calamine, cover area with bandage, use ice to compress itching','An allergy is an immune system response to a foreign substance that\'s not typically harmful to your body.They can include certain foods, pollen, or pet dander. Your immune system\'s job is to keep you healthy by fighting harmful pathogens.',10),
(3,'GERD','avoid fatty spicy food, avoid lying down after eating, maintain healthy weight, exercise','Gastroesophageal reflux disease, or GERD, is a digestive disorder that affects the lower esophageal sphincter (LES), the ring of muscle between the esophagus and stomach. Many people, including pregnant women, suffer from heartburn or acid indigestion caused by GERD.',11),
(4,'Chronic cholestasis','cold baths, anti itch medicine, consult doctor, eat healthy','Chronic cholestatic diseases, whether occurring in infancy, childhood or adulthood, are characterized by defective bile acid transport from the liver to the intestine, which is caused by primary damage to the biliary epithelium in most cases',11),
(5,'Drug Reaction','Stop irritation, consult nearest hospital, stop taking drug','An adverse drug reaction (ADR) is an injury caused by taking medication. ADRs may occur following a single dose or prolonged administration of a drug or result from the combination of two or more drugs.',10),
(6,'Peptic ulcer diseae','avoid fatty spicy food, consume probiotic food, eliminate milk, limit alcohol','Peptic ulcer disease (PUD) is a break in the inner lining of the stomach, the first part of the small intestine, or sometimes the lower esophagus. An ulcer in the stomach is called a gastric ulcer, while one in the first part of the intestines is a duodenal ulcer.',11),
(7,'AIDS','avoid open cuts, wear ppe if possible, consult doctor, follow up','Acquired immunodeficiency syndrome (AIDS) is a chronic, potentially life-threatening condition caused by the human immunodeficiency virus (HIV). By damaging your immune system, HIV interferes with your body\'s ability to fight infection and disease.',12),
(8,'Diabetes ','have balanced diet, exercise, consult doctor, follow up','Diabetes is a disease that occurs when your blood glucose, also called blood sugar, is too high. Blood glucose is your main source of energy and comes from the food you eat. Insulin, a hormone made by the pancreas, helps glucose from food get into your cells to be used for energy.',13),
(9,'Gastroenteritis','stop eating solid food for while, try taking small sips of water, rest, ease back into eating','Gastroenteritis is an inflammation of the digestive tract, particularly the stomach, and large and small intestines. Viral and bacterial gastroenteritis are intestinal infections associated with symptoms of diarrhea , abdominal cramps, nausea , and vomiting .',11),
(10,'Bronchial Asthma','switch to loose cloothing, take deep breaths, get away from trigger, seek help','Bronchial asthma is a medical condition which causes the airway path of the lungs to swell and narrow. Due to this swelling, the air path produces excess mucus making it hard to breathe, which results in coughing, short breath, and wheezing. The disease is chronic and interferes with daily working.',10),
(11,'Hypertension ','meditation, salt baths, reduce stress, get proper sleep','Hypertension (HTN or HT), also known as high blood pressure (HBP), is a long-term medical condition in which the blood pressure in the arteries is persistently elevated. High blood pressure typically does not cause symptoms.',13),
(12,'Migraine','meditation, reduce stress, use poloroid glasses in sun, consult doctor','A migraine can cause severe throbbing pain or a pulsing sensation, usually on one side of the head. It\'s often accompanied by nausea, vomiting, and extreme sensitivity to light and sound. Migraine attacks can last for hours to days, and the pain can be so severe that it interferes with your daily activities.',14),
(13,'Jaundice','drink plenty of water, consume milk thistle, eat fruits and high fiberous food, medication','Yellow staining of the skin and sclerae (the whites of the eyes) by abnormally high blood levels of the bile pigment bilirubin. The yellowing extends to other tissues and body fluids. Jaundice was once called the \"morbus regius\" (the regal disease) in the belief that only the touch of a king could cure it',11),
(14,'Malaria','Consult nearest hospital, avoid oily food, avoid non veg food, keep mosquitos out','An infectious disease caused by protozoan parasites from the Plasmodium family that can be transmitted by the bite of the Anopheles mosquito or by a contaminated needle or transfusion. Falciparum malaria is the most deadly type.',15),
(15,'Chicken pox','use neem in bathing, consume neem leaves, take vaccine, avoid public places','Chickenpox is a highly contagious disease caused by the varicella-zoster virus (VZV). It can cause an itchy, blister-like rash. The rash first appears on the chest, back, and face, and then spreads over the entire body, causing between 250 and 500 itchy blisters.',13),
(16,'Dengue','drink papaya leaf juice, avoid fatty spicy food, keep mosquitos away, keep hydrated','an acute infectious disease caused by a flavivirus (species Dengue virus of the genus Flavivirus), transmitted by aedes mosquitoes, and characterized by headache, severe joint pain, and a rash. â€” called also breakbone fever, dengue fever.',12),
(17,'Typhoid','eat high calorie vegitables, antiboitic therapy, consult doctor, medication','A vein that has enlarged and twisted, often appearing as a bulging, blue blood vessel that is clearly visible through the skin. Varicose veins are most common in older adults, particularly women, and occur especially on the legs.',13),
(18,'hepatitis A','Consult nearest hospital, wash hands through, avoid fatty spicy food, medication','Hepatitis A is a highly contagious liver infection caused by the hepatitis A virus. The virus is one of several types of hepatitis viruses that cause inflammation and affect your liver\'s ability to function.',16),
(19,'Hepatitis B','consult nearest hospital, vaccination, eat healthy, medication','Hepatitis B is an infection of your liver. It can cause scarring of the organ, liver failure, and cancer. It can be fatal if it isn\'t treated. It\'s spread when people come in contact with the blood, open sores, or body fluids of someone who has the hepatitis B virus.',16),
(20,'Hepatitis C','Consult nearest hospital, vaccination, eat healthy, medication','Inflammation of the liver due to the hepatitis C virus (HCV), which is usually spread via blood transfusion (rare), hemodialysis, and needle sticks. The damage hepatitis C does to the liver can lead to cirrhosis and its complications as well as cancer.',16),
(21,'Hepatitis D','consult doctor, medication., eat healthy, follow up','Hepatitis D, also known as the hepatitis delta virus, is an infection that causes the liver to become inflamed. This swelling can impair liver function and cause long-term liver problems, including liver scarring and cancer. The condition is caused by the hepatitis D virus (HDV).',16),
(22,'Hepatitis E','stop alcohol consumption, take rest, consult doctor, medication','A rare form of liver inflammation caused by infection with the hepatitis E virus (HEV). It is transmitted via food or drink handled by an infected person or through infected water supplies in areas where fecal matter may get into the water. Hepatitis E does not cause chronic liver disease.',16),
(23,'Alcoholic hepatitis','stop alcohol consumption, onsult doctor, medication 	follow up','Bronchial asthma is a medical condition which causes the airway path of the lungs to swell and narrow. Due to this swelling, the air path produces excess mucus making it hard to breathe, which results in coughing, short breath, and wheezing. The disease is chronic and interferes with daily working.',16),
(24,'Tuberculosis','cover mouth, consult doctor, medication, rest','Tuberculosis (TB) is an infectious disease usually caused by Mycobacterium tuberculosis (MTB) bacteria. Tuberculosis generally affects the lungs, but can also affect other parts of the body. Most infections show no symptoms, in which case it is known as latent tuberculosis.',12),
(25,'Common Cold','drink vitamin c rich drinks, take vapour, avoid cold food, keep fever in check','The common cold is a viral infection of your nose and throat (upper respiratory tract). It\'s usually harmless, although it might not feel that way. Many types of viruses can cause a common cold.',13),
(26,'Pneumonia','consult doctor, medication, rest, follow up','Pneumonia is an infection in one or both lungs. Bacteria, viruses, and fungi cause it. The infection causes inflammation in the air sacs in your lungs, which are called alveoli. The alveoli fill with fluid or pus, making it difficult to breathe.',12),
(27,'Dimorphic hemmorhoids(piles)','avoid fatty spicy food, consume witch hazel, warm bath with epsom salt, consume alovera juice','Hemorrhoids, also spelled haemorrhoids, are vascular structures in the anal canal. Other names, Haemorrhoids, piles, hemorrhoidal disease.',18),
(28,'Heart attack','call ambulance, chew or swallow asprin, keep calm','The death of heart muscle due to the loss of blood supply. The loss of blood supply is usually caused by a complete blockage of a coronary artery, one of the arteries that supplies blood to the heart muscle.',8),
(29,'Hypothyroidism','reduce stress, do exercise, eat healthy, get proper sleep, use lemon balm, take radioactive iodine treatment','Hypothyroidism, also called underactive thyroid or low thyroid, is a disorder of the endocrine system in which the thyroid gland does not produce enough thyroid hormone.',19),
(30,'Hypoglycemia','lie down on side, check in pulse, drink sugary drinks, consult doctor','Hypoglycemia is a condition in which your blood sugar (glucose) level is lower than normal. Glucose is your body\'s main energy source. Hypoglycemia is often related to diabetes treatment. But other drugs and a variety of conditions many rare can cause low blood sugar in people who don\'t have diabetes.',19),
(31,'Arthritis','exercise, use hot and cold therapy, try acupuncture, massage','Arthritis is the swelling and tenderness of one or more of your joints. The main symptoms of arthritis are joint pain and stiffness, which typically worsen with age. The most common types of arthritis are osteoarthritis and rheumatoid arthritis.',20),
(32,'Urinary tract infection','drink plenty of water, increase vitamin c intake, drink cranberry juice, take probiotics','Urinary tract infection: An infection of the kidney, ureter, bladder, or urethra. Abbreviated UTI. Not everyone with a UTI has symptoms, but common symptoms include a frequent urge to urinate and pain or burning when urinating.',21),
(33,'Paralysis (brain hemorrhage)','massage, eat healthy, exercise, consult doctor','Intracerebral hemorrhage (ICH) is when blood suddenly bursts into brain tissue, causing damage to your brain. Symptoms usually appear suddenly during ICH. They include headache, weakness, confusion, and paralysis, particularly on one side of your body.',15),
(34,'Varicose veins','lie down flat and raise the leg high, use oinments, use vein compression, dont stand still for long','A vein that has enlarged and twisted, often appearing as a bulging, blue blood vessel that is clearly visible through the skin. Varicose veins are most common in older adults, particularly women, and occur especially on the legs.',22),
(35,'Osteoarthristis','acetaminophen, consult nearest hospital, follow up, salt baths','Osteoarthritis is the most common form of arthritis, affecting millions of people worldwide. It occurs when the protective cartilage that cushions the ends of your bones wears down over time.',20),
(36,'Acne','bath twice, avoid fatty spicy food, drink plenty of water, avoid too many products','Acne vulgaris is the formation of comedones, papules, pustules, nodules, and/or cysts as a result of obstruction and inflammation of pilosebaceous units (hair follicles and their accompanying sebaceous gland). Acne develops on the face and upper trunk. It most often affects adolescents.',9),
(37,'Psoriasis','wash hands with warm soapy water, stop bleeding using pressure, consult doctor, salt baths','Psoriasis is a common skin disorder that forms thick, red, bumpy patches covered with silvery scales. They can pop up anywhere, but most appear on the scalp, elbows, knees, and lower back. Psoriasis can\'t be passed from person to person. It does sometimes happen in members of the same family.',9),
(38,'Impetigo','soak affected area in warm water, use antibiotics, remove scabs with wet compressed cloth, consult doctor','Impetigo is a common and highly contagious skin infection that mainly affects infants and children. Impetigo usually appears as red sores on the face, especially around a child\'s nose and mouth, and on hands and feet. The sores burst and develop honey-colored crusts.',9),
(39,'Cervical spondylosis','use heating pad or cold pack, exercise, take otc pain reliver, consult doctor','Cervical spondylosis is a general term for age-related wear and tear affecting the spinal disks in your neck. As the disks dehydrate and shrink, signs of osteoarthritis develop, including bony projections along the edges of bones (bone spurs).',23),
(40,'Hyperthyroidism','eat healthy, massage, use lemon balm, take radioactive iodine treatment','Hyperthyroidism (overactive thyroid) occurs when your thyroid gland produces too much of the hormone thyroxine. Hyperthyroidism can accelerate your body\'s metabolism, causing unintentional weight loss and a rapid or irregular heartbeat.',19),
(41,'(vertigo) Paroymsal  Positional Vertigo','lie down, avoid sudden change in body, avoid abrupt head movment, relax','Benign paroxysmal positional vertigo (BPPV) is one of the most common causes of vertigo â€” the sudden sensation that you\'re spinning or that the inside of your head is spinning. Benign paroxysmal positional vertigo causes brief episodes of mild to intense dizziness.',13);

/*Table structure for table `expert` */

DROP TABLE IF EXISTS `expert`;

CREATE TABLE `expert` (
  `eid` int NOT NULL AUTO_INCREMENT,
  `lid` int DEFAULT NULL,
  `Fname` varchar(100) DEFAULT NULL,
  `Lname` varchar(100) DEFAULT NULL,
  `Place` varchar(100) DEFAULT NULL,
  `Post` varchar(100) DEFAULT NULL,
  `Pin` bigint DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` bigint DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `expert` */

insert  into `expert`(`eid`,`lid`,`Fname`,`Lname`,`Place`,`Post`,`Pin`,`Email`,`Phone`,`area`) values 
(1,2,'Ravi ','kk','kozhikode','345',670045,'ravi1@gmail.com',6789123412,'doctor'),
(2,3,'Akash','Mishra','Kochi','ernalkode',123,'Akash23@gmail.com',8907654321,'doc'),
(3,4,'Shyam','Kumar','Thrishur','anakara',567,'shyam2@gmail.com',9899657432,'doct');

/*Table structure for table `home remedies` */

DROP TABLE IF EXISTS `home remedies`;

CREATE TABLE `home remedies` (
  `Hid` int NOT NULL AUTO_INCREMENT,
  `Did` int DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Remedy` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Hid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `home remedies` */

insert  into `home remedies`(`Hid`,`Did`,`Name`,`Remedy`) values 
(1,1,'vishnu','hot water'),
(2,3,'tablet','paracetamol');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `lid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `login` */

insert  into `login`(`lid`,`username`,`password`,`type`) values 
(1,'admin','admin','admin'),
(2,'ravi','ravi','expert'),
(3,'akash','akash','expert'),
(4,'shyam','shyam','expert'),
(5,'expert','expert','expert'),
(6,'user','user','user'),
(7,'jason','Jasonroy123','user'),
(8,'67889','6778','user'),
(9,'vishnu','Vishnu123','user');

/*Table structure for table `rating` */

DROP TABLE IF EXISTS `rating`;

CREATE TABLE `rating` (
  `Rid` int NOT NULL AUTO_INCREMENT,
  `Eid` int DEFAULT NULL,
  `Rating` int DEFAULT NULL,
  `Date` varchar(100) DEFAULT NULL,
  `lid` int DEFAULT NULL,
  PRIMARY KEY (`Rid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `rating` */

insert  into `rating`(`Rid`,`Eid`,`Rating`,`Date`,`lid`) values 
(1,2,5,'10/12/2000',3),
(2,2,1,'2023-03-23',3),
(3,2,1,'2023-03-23',3),
(4,5,5,'2023-03-31',3),
(5,5,4,'2023-04-01',3),
(6,2,1,'2023-04-01',3);

/*Table structure for table `suggestions` */

DROP TABLE IF EXISTS `suggestions`;

CREATE TABLE `suggestions` (
  `Sid` int NOT NULL AUTO_INCREMENT,
  `Eid` int DEFAULT NULL,
  `Suggestions` varchar(100) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `Date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Sid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `suggestions` */

insert  into `suggestions`(`Sid`,`Eid`,`Suggestions`,`Description`,`Date`) values 
(1,2,'wertwer','dsfg','02/12/2022'),
(2,5,'dafgadgdfg','dfg','02/22/2132'),
(3,2,'anything else','nope','2023-03-16');

/*Table structure for table `symptoms` */

DROP TABLE IF EXISTS `symptoms`;

CREATE TABLE `symptoms` (
  `s_id` int NOT NULL AUTO_INCREMENT,
  `disease_id` int DEFAULT NULL,
  `symptom` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=319 DEFAULT CHARSET=latin1;

/*Data for the table `symptoms` */

insert  into `symptoms`(`s_id`,`disease_id`,`symptom`) values 
(1,1,'itching'),
(2,1,'skin_rash'),
(3,1,'nodal_skin_eruptions'),
(4,1,'dischromic__patches'),
(5,2,'continuous_sneezing'),
(6,2,'shivering'),
(7,2,'chills'),
(8,2,'watering_from_eyes'),
(9,3,'stomach_pain'),
(10,3,'acidity'),
(11,3,'ulcers_on_tongue'),
(12,3,'vomiting'),
(13,3,'cough'),
(14,4,'itching'),
(15,4,'vomiting'),
(16,4,'yellowish_skin'),
(17,4,'nausea'),
(18,4,'loss_of_appetite'),
(19,5,'itching'),
(20,5,'skin_rash'),
(21,5,'stomach_pain'),
(22,5,'burning_micturition'),
(23,5,'spotting_urination'),
(24,6,'vomiting'),
(25,6,'loss_of_appetite'),
(26,6,'abdominal_pain'),
(27,6,'passage_of_gases'),
(28,6,'internal_itching'),
(29,6,'indigestion'),
(30,7,'muscle_wasting'),
(31,7,'patches_in_throat'),
(32,7,'high_fever'),
(33,7,'extra_marital_contacts'),
(34,8,'fatigue'),
(35,8,'weight_loss'),
(36,8,'restlessness'),
(37,8,'lethargy'),
(38,8,'irregular_sugar_level'),
(39,8,'blurred_and_distorted_vision'),
(40,8,'obesity'),
(41,8,'increased_appetite'),
(42,8,'polyuria'),
(43,8,'excessive_hunger'),
(44,9,'vomiting'),
(45,9,'sunken_eyes'),
(46,9,'dehydration'),
(47,9,'diarrhoea'),
(48,10,'fatigue'),
(49,10,'cough'),
(50,10,'high_fever'),
(51,10,'breathlessness'),
(52,10,'family_history'),
(53,10,'mucoid_sputum'),
(54,11,'headache'),
(55,11,'chest_pain'),
(56,11,'dizziness'),
(57,11,'loss_of_balance'),
(58,11,'lack_of_concentration'),
(59,12,'acidity'),
(60,12,'indigestion'),
(61,12,'headache'),
(62,12,'blurred_and_distorted_vision'),
(63,12,'excessive_hunger'),
(64,12,'stiff_neck'),
(65,12,'depression'),
(66,12,'irritability'),
(67,12,'visual_disturbances'),
(68,39,'back_pain'),
(69,39,'weakness_in_limbs'),
(70,39,'neck_pain'),
(71,39,'dizziness'),
(72,39,'loss_of_balance'),
(73,33,'vomiting'),
(74,33,'headache'),
(75,33,'weakness_of_one_body_side'),
(76,33,'altered_sensorium'),
(77,13,'itching'),
(78,13,'vomiting'),
(79,13,'fatigue'),
(80,13,'weight_loss'),
(81,13,'high_fever'),
(82,13,'yellowish_skin'),
(83,13,'dark_urine'),
(84,13,'abdominal_pain'),
(85,14,'chills'),
(86,14,'vomiting'),
(87,14,'high_fever'),
(88,14,'sweating'),
(89,14,'headache'),
(90,14,'nausea'),
(91,14,'muscle_pain'),
(92,14,'diarrhoea'),
(93,15,'itching'),
(94,15,'skin_rash'),
(95,15,'fatigue'),
(96,15,'lethargy'),
(97,15,'high_fever'),
(98,15,'headache'),
(99,15,'loss_of_appetite'),
(100,15,'mild_fever'),
(101,15,'swelled_lymph_nodes'),
(102,15,'malaise'),
(103,15,'red_spots_over_body'),
(104,16,'skin_rash'),
(105,16,'chills'),
(106,16,'joint_pain'),
(107,16,'vomiting'),
(108,16,'fatigue'),
(109,16,'high_fever'),
(110,16,'headache'),
(111,16,'nausea'),
(112,16,'loss_of_appetite'),
(113,16,'pain_behind_the_eyes'),
(114,16,'back_pain'),
(115,16,'muscle_pain'),
(116,16,'red_spots_over_body'),
(117,16,'malaise'),
(118,17,'chills'),
(119,17,'vomiting'),
(120,17,'fatigue'),
(121,17,'high_fever'),
(122,17,'nausea'),
(123,17,'constipation'),
(124,17,'abdominal_pain'),
(125,17,'diarrhoea'),
(126,17,'toxic_look_(typhos)'),
(127,17,'belly_pain'),
(128,17,'headache'),
(129,18,'joint_pain'),
(130,18,'vomiting'),
(131,18,'yellowish_skin'),
(132,18,'dark_urine'),
(133,18,'nausea'),
(134,18,'loss_of_appetite'),
(135,18,'abdominal_pain'),
(136,18,'diarrhoea'),
(137,18,'mild_fever'),
(138,18,'yellowing_of_eyes'),
(139,18,'muscle_pain'),
(140,19,'itching'),
(141,19,'fatigue'),
(142,19,'lethargy'),
(143,19,'yellowish_skin'),
(144,19,'dark_urine'),
(145,19,'loss_of_appetite'),
(146,19,'abdominal_pain'),
(147,19,'yellow_urine'),
(148,19,'yellowing_of_eyes'),
(149,19,'malaise'),
(150,19,'receiving_blood_transfusion'),
(151,19,'receiving_unsterile_injections'),
(152,20,'fatigue'),
(153,20,'yellowish_skin'),
(154,20,'nausea'),
(155,20,'loss_of_appetite'),
(156,20,'family_history'),
(157,20,'yellowing_of_eyes'),
(158,21,'joint_pain'),
(159,21,'vomiting'),
(160,21,'fatigue'),
(161,21,'yellowish_skin'),
(162,21,'dark_urine'),
(163,21,'nausea'),
(164,21,'loss_of_appetite'),
(165,21,'abdominal_pain'),
(166,21,'yellowing_of_eyes'),
(167,22,'joint_pain'),
(168,22,'vomiting'),
(169,22,'fatigue'),
(170,22,'high_fever'),
(171,22,'yellowish_skin'),
(172,22,'dark_urine'),
(173,22,'nausea'),
(174,22,'loss_of_appetite'),
(175,22,'abdominal_pain'),
(176,22,'yellowing_of_eyes'),
(177,22,'coma'),
(178,22,'stomach_bleeding'),
(179,22,'acute_liver_failure'),
(180,23,'vomiting'),
(181,23,'yellowish_skin'),
(182,23,'abdominal_pain'),
(183,23,'swelling_of_stomach'),
(184,23,'distention_of_abdomen'),
(185,23,'history_of_alcohol_consumption'),
(186,23,'fluid_overload'),
(187,24,'chills'),
(188,24,'vomiting'),
(189,24,'fatigue'),
(190,24,'weight_loss'),
(191,24,'cough'),
(192,24,'high_fever'),
(193,24,'breathlessness'),
(194,24,'sweating'),
(195,24,'loss_of_appetite'),
(196,24,'mild_fever'),
(197,24,'yellowing_of_eyes'),
(198,24,'swelled_lymph_nodes'),
(199,24,'malaise'),
(200,24,'phlegm'),
(201,24,'chest_pain'),
(202,24,'blood_in_sputum'),
(203,25,'continuous_sneezing'),
(204,25,'chills'),
(205,25,'fatigue'),
(206,25,'cough'),
(207,25,'high_fever'),
(208,25,'headache'),
(209,25,'swelled_lymph_nodes'),
(210,25,'malaise'),
(211,25,'phlegm'),
(212,25,'throat_irritation'),
(213,25,'redness_of_eyes'),
(214,25,'sinus_pressure'),
(215,25,'runny_nose'),
(216,25,'congestion'),
(217,25,'chest_pain'),
(218,25,'loss_of_smell'),
(219,25,'muscle_pain'),
(220,26,'chills'),
(221,26,'fatigue'),
(222,26,'cough'),
(223,26,'high_fever'),
(224,26,'breathlessness'),
(225,26,'sweating'),
(226,26,'malaise'),
(227,26,'phlegm'),
(228,26,'chest_pain'),
(229,26,'fast_heart_rate'),
(230,26,'rusty_sputum'),
(231,27,'constipation'),
(232,27,'pain_during_bowel_movements'),
(233,27,'pain_in_anal_region'),
(234,27,'bloody_stool'),
(235,27,'irritation_in_anus'),
(236,28,'vomiting'),
(237,28,'breathlessness'),
(238,28,'sweating'),
(239,28,'chest_pain'),
(240,34,'fatigue'),
(241,34,'cramps'),
(242,34,'bruising'),
(243,34,'obesity'),
(244,34,'swollen_legs'),
(245,34,'swollen_blood_vessels'),
(246,34,'prominent_veins_on_calf'),
(247,29,'fatigue'),
(248,29,'weight_gain'),
(249,29,'cold_hands_and_feets'),
(250,29,'mood_swings'),
(251,29,'lethargy'),
(252,29,'dizziness'),
(253,29,'puffy_face_and_eyes'),
(254,29,'enlarged_thyroid'),
(255,29,'brittle_nails'),
(256,29,'swollen_extremeties'),
(257,29,'depression'),
(258,29,'irritability'),
(259,29,'abnormal_menstruation'),
(260,40,'fatigue'),
(261,40,'mood_swings'),
(262,40,'weight_loss'),
(263,40,'restlessness'),
(264,40,'sweating'),
(265,40,'diarrhoea'),
(266,40,'fast_heart_rate'),
(267,40,'excessive_hunger'),
(268,40,'muscle_weakness'),
(269,40,'irritability'),
(270,40,'abnormal_menstruation'),
(271,30,'vomiting'),
(272,30,'fatigue'),
(273,30,'anxiety'),
(274,30,'sweating'),
(275,30,'headache'),
(276,30,'nausea'),
(277,30,'blurred_and_distorted_vision'),
(278,30,'excessive_hunger'),
(279,30,'drying_and_tingling_lips'),
(280,30,'slurred_speech'),
(281,30,'irritability'),
(282,30,'palpitations'),
(283,35,'joint_pain'),
(284,35,'neck_pain'),
(285,35,'knee_pain'),
(286,35,'hip_joint_pain'),
(287,35,'swelling_joints'),
(288,35,'painful_walking'),
(289,31,'muscle_weakness'),
(290,31,'stiff_neck'),
(291,31,'swelling_joints'),
(292,31,'movement_stiffness'),
(293,31,'painful_walking'),
(294,36,'skin_rash'),
(295,36,'pus_filled_pimples'),
(296,36,'blackheads'),
(297,36,'scurring'),
(298,32,'burning_micturition'),
(299,32,'bladder_discomfort'),
(300,32,'foul_smell_of_urine'),
(301,32,'continuous_feel_of_urine'),
(302,37,'skin_rash'),
(303,37,'joint_pain'),
(304,37,'skin_peeling'),
(305,37,'silver_like_dusting'),
(306,37,'small_dents_in_nails'),
(307,37,'inflammatory_nails'),
(308,38,'skin_rash'),
(309,38,'high_fever'),
(310,38,'blister'),
(311,38,'red_sore_around_nose'),
(312,38,'yellow_crust_ooze'),
(313,41,'vomiting'),
(314,41,'headache'),
(315,41,'nausea'),
(316,41,'spinning_movements'),
(317,41,'loss_of_balance'),
(318,41,'unsteadiness');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `Uid` int NOT NULL AUTO_INCREMENT,
  `lid` int DEFAULT NULL,
  `Fname` varchar(100) DEFAULT NULL,
  `Lname` varchar(100) DEFAULT NULL,
  `Place` varchar(100) DEFAULT NULL,
  `Post` varchar(100) DEFAULT NULL,
  `Pin` bigint DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` bigint DEFAULT NULL,
  PRIMARY KEY (`Uid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `user` */

insert  into `user`(`Uid`,`lid`,`Fname`,`Lname`,`Place`,`Post`,`Pin`,`Email`,`Phone`) values 
(1,3,'vishnu','nair','aksdj','12423',123,'vishnusnair2000@gmail.com',12423),
(2,13,'aswasw','hhhhhhhhh','ghhghg','vbn',78788,'as@gmaik,,,jhh',678),
(3,14,'Anirudh','Ram','Tirur','Pollisery',676102,'anirudhpaveri1@gmail.com',789654321),
(4,15,'sridev','vadakath','valancheri','valancheri',123,'sridevvadakath@gmail.com',1234567890),
(5,16,'shanib','jaan','Adrekkod','valancheri',234,'shanibjaan12@gmail.com',1357924680),
(6,7,'jason','roy','Kozhikode','345',600097,'jasonroy123@gmail.com',8907654321),
(7,8,'456778','456778','456788','67788',7789,'4567788',6789),
(8,9,'Vishnu','Nait','Kuttipuram','anakkara',600097,'v@gmail.com',8907654321);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
