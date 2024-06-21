-- Algumas consultas sobre o BD musicadb

-- Heavy Metal anos 80
select 
	b.banda_id, b.nome as Banda, b.genero, a.album_id, a.nome as Album, a.ano_lancamento, m.musica_id, m.nome 
from 
	musicas m 
inner join 
	albuns a on a.album_id = m.album_id
inner join 
	bandas b on a.banda_id = b.banda_id 
where b.genero = 'Heavy Metal' and a.ano_lancamento < 1990;

-- Heavy Metal moderno
select 
	b.banda_id, b.nome as Banda, b.genero, a.album_id, a.nome as Album, a.ano_lancamento, m.musica_id, m.nome 
from 
	musicas m 
inner join 
	albuns a on a.album_id = m.album_id
inner join 
	bandas b on a.banda_id = b.banda_id 
where b.genero = 'Heavy Metal' and a.ano_lancamento >= 1990;

-- Rock Nacional
select 
	b.banda_id, b.nome as Banda, b.genero, a.album_id, a.nome as Album, a.ano_lancamento, m.musica_id, m.nome 
from 
	musicas m 
inner join 
	albuns a on a.album_id = m.album_id
inner join 
	bandas b on a.banda_id = b.banda_id 
where b.genero = 'Rock Nacional'

-- Rock Gaúcho
select 
	b.banda_id, b.nome as Banda, b.genero, a.album_id, a.nome as Album, a.ano_lancamento, m.musica_id, m.nome 
from 
	musicas m 
inner join 
	albuns a on a.album_id = m.album_id
inner join 
	bandas b on a.banda_id = b.banda_id 
where b.genero = 'Rock Gaúcho'

-- consulta playlists
select p.nome, b.nome as banda, a.nome as album, m.nome as musica from playlists p 
inner join playlists_musicas pm on pm.playlist_id = p.playlist_id 
inner join musicas m on m.musica_id = pm.musica_id
inner join albuns a on a.album_id = m.album_id 
inner join bandas b on b.banda_id = a.banda_id 
order by p.nome, b.nome, a.nome, m.nome;
