SELECT c.carona_id, c.usuario_id motorista, avg(cp.avaliacao) media_avaliacao, count(cp.usuario_id) qtd_usuario_carona
	FROM carona c, carona_participa cp, usuario u
	WHERE c.carona_id = cp.carona_id 
		and c.usuario_id = u.usuario_id
		and c.carona_status_id = (SELECT carona_status_id from carona_status where nome = 'ABERTA')
	GROUP BY c.carona_id;