SELECT DISTINCT
	users.id_user,
	roles.rol,
	CONCAT_WS(', ', users.first_name , users.last_name) as full_name,
	users.email,
	users.password,
	( SELECT ARRAY_AGG (' ' || cc.course ) AS inscriptions
					FROM  users_courses_master as ucm
					INNER  JOIN courses cc 	ON ucm.id_course = cc.id_course
					WHERE 	ucm.id_user=users.id_user
					GROUP BY ucm.id_user	
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
