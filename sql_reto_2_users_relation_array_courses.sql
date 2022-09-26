SELECT DISTINCT
	users.id_user,
	roles.rol,
	CONCAT_WS(', ', users.first_name , users.last_name) as full_name,
	users.email,
	users.password,
	( SELECT ARRAY_AGG ('[course:' || cc.course || ' level:' || l.LEVEL || ' category:' || C.category || ']' ) inscriptions 
		FROM 	users_courses_master AS ucm
			INNER JOIN courses AS cc ON ucm.id_course = cc.id_course
			INNER JOIN levels AS l ON cc.id_level = l.id_level
			INNER JOIN categories AS "c" ON cc.id_category = "c".id_category 
		WHERE
			ucm.id_user = users.id_user 
		GROUP BY
			ucm.id_user	
	) as inscriptions
FROM
	users
	LEFT JOIN roles ON users.id_rol = roles.id_rol
	LEFT JOIN users_courses_master ON users.id_user = users_courses_master.id_user
	LEFT JOIN courses ON users_courses_master.id_course = courses.id_course
	LEFT JOIN levels ON courses.id_level = levels.id_level
	LEFT JOIN categories ON courses.id_category = categories.id_category 
ORDER BY 
	roles.rol ASC,
	users.id_user ASC
