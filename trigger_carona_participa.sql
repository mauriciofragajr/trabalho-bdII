CREATE OR REPLACE FUNCTION check_interesse() RETURNS trigger AS $check_interesse$
	DECLARE
		carona_usuario_id int;
		usuario_interessado_id int;
        qtd_usuarios_carona int;
        qtd int;
    BEGIN
        -- REGRA 1: Um usuário não pode entrar na carona criada por ele mesmo
		usuario_interessado_id := NEW.usuario_id;
		SELECT usuario_id INTO carona_usuario_id FROM carona where carona_id = NEW.carona_id;
        IF carona_usuario_id = usuario_interessado_id THEN
            RAISE EXCEPTION 'Usuário não pode entrar na carona criada por ele mesmo.';
        END IF;

        -- REGRA 2: Só pode entrar na carona se ainda estiver vagas, ou seja, o número de pessoas participando da carona
        -- deve ser menor ou igual à quantidade de vagas ofertadas para a mesma carona
        SELECT vagas_qtd INTO qtd FROM carona where carona_id = NEW.carona_id; -- Pegado a qtd de vagas para essa carona
        SELECT count(*) INTO qtd_usuarios_carona FROM carona_participa where carona_id = NEW.carona_id; -- Contador de todas as ocorrencias registradas

        IF qtd_usuarios_carona = qtd THEN
            RAISE EXCEPTION 'Carona já está cheia.';
        END IF;

        RETURN NEW;
    END;
$check_interesse$ LANGUAGE plpgsql;

CREATE TRIGGER check_interesse BEFORE INSERT OR UPDATE ON carona_participa
    FOR EACH ROW EXECUTE PROCEDURE check_interesse();