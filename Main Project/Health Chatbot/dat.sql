`user`SELECT * FROM `expert` JOIN `login` ON `expert`.`lid`=`login`.lid



SELECT `expert`.* ,`login`.`type` FROM `login` JOIN `expert` ON `expert`.`lid`=`login`.lid