--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: hashtagUse; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."hashtagUse" (
    id integer NOT NULL,
    "hashtagId" integer NOT NULL,
    "postId" integer NOT NULL,
    "usedAt" timestamp without time zone DEFAULT now()
);


--
-- Name: hashtagUse_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."hashtagUse_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hashtagUse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."hashtagUse_id_seq" OWNED BY public."hashtagUse".id;


--
-- Name: hashtags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hashtags (
    id integer NOT NULL,
    hashtag text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: hashtags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hashtags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hashtags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hashtags_id_seq OWNED BY public.hashtags.id;


--
-- Name: likes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.likes (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "postId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.likes_id_seq OWNED BY public.likes.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    link text NOT NULL,
    text character varying(300) NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "imageUrl" text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: hashtagUse id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."hashtagUse" ALTER COLUMN id SET DEFAULT nextval('public."hashtagUse_id_seq"'::regclass);


--
-- Name: hashtags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hashtags ALTER COLUMN id SET DEFAULT nextval('public.hashtags_id_seq'::regclass);


--
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes ALTER COLUMN id SET DEFAULT nextval('public.likes_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: hashtagUse; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."hashtagUse" VALUES (1, 1, 1, '2023-01-03 19:36:19.345342');
INSERT INTO public."hashtagUse" VALUES (2, 1, 7, '2023-01-03 19:36:21.121249');
INSERT INTO public."hashtagUse" VALUES (3, 2, 1, '2023-01-03 19:36:22.373247');
INSERT INTO public."hashtagUse" VALUES (4, 2, 9, '2023-01-03 19:36:23.541243');
INSERT INTO public."hashtagUse" VALUES (5, 2, 11, '2023-01-03 19:36:24.650083');
INSERT INTO public."hashtagUse" VALUES (6, 2, 18, '2023-01-03 19:36:25.758977');
INSERT INTO public."hashtagUse" VALUES (7, 3, 2, '2023-01-03 19:36:27.775581');
INSERT INTO public."hashtagUse" VALUES (8, 3, 18, '2023-01-03 19:36:29.548704');
INSERT INTO public."hashtagUse" VALUES (9, 4, 3, '2023-01-03 19:36:30.814457');
INSERT INTO public."hashtagUse" VALUES (10, 4, 5, '2023-01-03 19:36:31.875435');
INSERT INTO public."hashtagUse" VALUES (11, 4, 11, '2023-01-03 19:36:33.110302');
INSERT INTO public."hashtagUse" VALUES (12, 4, 18, '2023-01-03 19:36:34.377788');
INSERT INTO public."hashtagUse" VALUES (13, 5, 3, '2023-01-03 19:36:36.269401');
INSERT INTO public."hashtagUse" VALUES (14, 5, 4, '2023-01-03 19:36:37.87459');
INSERT INTO public."hashtagUse" VALUES (15, 5, 20, '2023-01-03 19:36:39.874003');
INSERT INTO public."hashtagUse" VALUES (16, 6, 5, '2023-01-03 19:36:40.963521');
INSERT INTO public."hashtagUse" VALUES (17, 6, 10, '2023-01-03 19:36:42.137956');
INSERT INTO public."hashtagUse" VALUES (18, 7, 6, '2023-01-03 19:36:43.606147');
INSERT INTO public."hashtagUse" VALUES (19, 8, 9, '2023-01-03 19:36:44.702813');
INSERT INTO public."hashtagUse" VALUES (20, 9, 12, '2023-01-03 19:36:45.969245');
INSERT INTO public."hashtagUse" VALUES (21, 9, 18, '2023-01-03 19:36:46.911471');
INSERT INTO public."hashtagUse" VALUES (22, 10, 13, '2023-01-03 19:36:48.002987');
INSERT INTO public."hashtagUse" VALUES (23, 11, 14, '2023-01-03 19:36:50.15008');
INSERT INTO public."hashtagUse" VALUES (24, 12, 14, '2023-01-03 19:36:51.60683');
INSERT INTO public."hashtagUse" VALUES (25, 13, 17, '2023-01-03 19:36:52.983056');
INSERT INTO public."hashtagUse" VALUES (26, 14, 19, '2023-01-03 19:36:54.3808');
INSERT INTO public."hashtagUse" VALUES (27, 14, 20, '2023-01-03 19:36:55.695157');
INSERT INTO public."hashtagUse" VALUES (28, 15, 4, '2023-01-03 19:36:56.797723');
INSERT INTO public."hashtagUse" VALUES (29, 16, 5, '2023-01-03 19:36:57.988557');


--
-- Data for Name: hashtags; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.hashtags VALUES (1, '#útil', '2023-01-03 19:35:54.814118');
INSERT INTO public.hashtags VALUES (2, '#legal', '2023-01-03 19:35:57.179301');
INSERT INTO public.hashtags VALUES (3, '#vailáeverbo', '2023-01-03 19:35:58.763601');
INSERT INTO public.hashtags VALUES (4, '#amor', '2023-01-03 19:36:00.046438');
INSERT INTO public.hashtags VALUES (5, '#corno', '2023-01-03 19:36:01.817124');
INSERT INTO public.hashtags VALUES (6, '#socorro', '2023-01-03 19:36:03.182105');
INSERT INTO public.hashtags VALUES (7, '#amazon', '2023-01-03 19:36:04.814893');
INSERT INTO public.hashtags VALUES (8, '#confia', '2023-01-03 19:36:05.978539');
INSERT INTO public.hashtags VALUES (9, '#ferramenta', '2023-01-03 19:36:07.751152');
INSERT INTO public.hashtags VALUES (10, '#faleitôleve', '2023-01-03 19:36:08.897983');
INSERT INTO public.hashtags VALUES (11, '#telegram', '2023-01-03 19:36:10.137538');
INSERT INTO public.hashtags VALUES (12, '#whatsapp', '2023-01-03 19:36:11.137237');
INSERT INTO public.hashtags VALUES (13, '#live', '2023-01-03 19:36:12.442111');
INSERT INTO public.hashtags VALUES (14, '#chocado', '2023-01-03 19:36:14.50708');
INSERT INTO public.hashtags VALUES (15, '#inútil', '2023-01-03 19:36:15.910741');
INSERT INTO public.hashtags VALUES (16, '#caos', '2023-01-03 19:36:17.314848');


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.posts VALUES (1, 1, 'https://www.youtube.com/', 'Tá procurando aquele tutorial de sql? Pesquisa no youtube #útil #legal', '2023-01-03 19:34:34.329153');
INSERT INTO public.posts VALUES (2, 2, 'https://github.com/', 'Não esqueçam de colocar seus projetos no github #vailáeverbo', '2023-01-03 19:34:41.56346');
INSERT INTO public.posts VALUES (3, 3, 'https://web.whatsapp.com/', 'A crush te mandou mensagem, confira no whatsapp #amor #corno', '2023-01-03 19:34:45.589676');
INSERT INTO public.posts VALUES (4, 2, 'https://pt-br.facebook.com/', 'Ninguém mais usa isso #inútil #corno', '2023-01-03 19:34:48.453057');
INSERT INTO public.posts VALUES (5, 2, 'https://twitter.com/', 'Lugar onde filho chora e a mãe não vê #caos #amor #socorro', '2023-01-03 19:34:51.483208');
INSERT INTO public.posts VALUES (6, 1, 'https://www.amazon.com.br/', 'A saga completa de As Crônicas de Pedrinho está disponivel na #amazon', '2023-01-03 19:34:54.124738');
INSERT INTO public.posts VALUES (7, 4, 'https://www.ifood.com.br/', 'Preguiça de fazer um arroz e fritar um ovo? Peça um ifood #útil', '2023-01-03 19:34:57.49662');
INSERT INTO public.posts VALUES (8, 3, 'https://www.uber.com/br/pt-br/', 'Galera, olha esse site inovador em que você pede um tipo diferente de táxi. Eles oferecem até balinha!', '2023-01-03 19:34:59.895675');
INSERT INTO public.posts VALUES (9, 5, 'https://shopee.com.br/', 'ATENÇÃO! Promoção! Tudo na metade do dobro do preço! #confia #legal', '2023-01-03 19:35:02.424589');
INSERT INTO public.posts VALUES (10, 1, 'https://slack.com/intl/pt-br', 'Na empresa em que estou trabalhando, estamos usando isso aqui, muito bom! #socorro', '2023-01-03 19:35:05.150075');
INSERT INTO public.posts VALUES (11, 1, 'https://www.instagram.com/', 'Um ótimo site para perder toda a sua produtividade e felicidade na vida! #amor #legal', '2023-01-03 19:35:08.318297');
INSERT INTO public.posts VALUES (12, 4, 'https://app.diagrams.net/', 'Deem uma olhada nisso aqui, é ótimo para organizar diagramas! #ferramenta', '2023-01-03 19:35:11.159651');
INSERT INTO public.posts VALUES (13, 5, 'https://www.deepl.com/pt-BR/translator', 'Melhor que o do google #faleitôleve', '2023-01-03 19:35:14.741441');
INSERT INTO public.posts VALUES (14, 3, 'https://web.telegram.org/k/', 'O #telegram vai em poucos anos superar o #whatsapp, escrevam o que estou falando!', '2023-01-03 19:35:17.558635');
INSERT INTO public.posts VALUES (15, 3, 'https://stackoverflow.com/', 'Simplesmente o oráculo dos devs', '2023-01-03 19:35:20.318158');
INSERT INTO public.posts VALUES (16, 1, 'https://developer.mozilla.org/pt-BR/', 'Simplesmente o substituto do oráculo dos devs', '2023-01-03 19:35:23.099252');
INSERT INTO public.posts VALUES (17, 2, 'https://www.twitch.tv/', 'Nada melhor do que assistir a uma livezinha depois de comer uma sopa de feijão ouvindo Linkin Park #live', '2023-01-03 19:35:25.48727');
INSERT INTO public.posts VALUES (18, 5, 'https://docs.google.com/document/u/0/', 'Escreva sua raiva antes de jogá-la em alguém #vailáeverbo #amor #legal #ferramenta', '2023-01-03 19:35:27.899023');
INSERT INTO public.posts VALUES (19, 5, 'https://calendar.google.com/calendar/u/0/r', 'Mano, abri o calendário aqui, como assim estamos em 2023 e ninguém me avisou? #chocado', '2023-01-03 19:35:31.616602');
INSERT INTO public.posts VALUES (20, 2, 'https://www.netflix.com/br/', 'Viram o que aquele protagonista irrelevante da nova série chata fez!? #chocado #corno', '2023-01-03 19:35:33.952783');


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Matheus', 'matheus@gmail.com', 'banana', 'https://images.pexels.com/photos/2872755/pexels-photo-2872755.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', '2023-01-03 19:34:10.476671');
INSERT INTO public.users VALUES (2, 'Carlos', 'carlos@gmail.com', 'melancia', 'https://images.pexels.com/photos/1337825/pexels-photo-1337825.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', '2023-01-03 19:34:15.090753');
INSERT INTO public.users VALUES (3, 'Lucas', 'lucas@gmail.com', 'abacate', 'https://images.pexels.com/photos/4462786/pexels-photo-4462786.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', '2023-01-03 19:34:18.113811');
INSERT INTO public.users VALUES (4, 'Raphael', 'raphael@gmail.com', 'manga', 'https://images.pexels.com/photos/5875695/pexels-photo-5875695.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', '2023-01-03 19:34:20.717467');
INSERT INTO public.users VALUES (5, 'Bruno', 'bruno@gmail.com', 'laranja', 'https://images.pexels.com/photos/616838/pexels-photo-616838.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', '2023-01-03 19:34:23.671641');


--
-- Name: hashtagUse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."hashtagUse_id_seq"', 29, true);


--
-- Name: hashtags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hashtags_id_seq', 16, true);


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.likes_id_seq', 1, false);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.posts_id_seq', 20, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: hashtagUse hashtagUse_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."hashtagUse"
    ADD CONSTRAINT "hashtagUse_pkey" PRIMARY KEY (id);


--
-- Name: hashtags hashtags_hashtag_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hashtags
    ADD CONSTRAINT hashtags_hashtag_key UNIQUE (hashtag);


--
-- Name: hashtags hashtags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hashtags
    ADD CONSTRAINT hashtags_pkey PRIMARY KEY (id);


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_token_key UNIQUE (token);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: hashtagUse hashtagUse_hashtagId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."hashtagUse"
    ADD CONSTRAINT "hashtagUse_hashtagId_fkey" FOREIGN KEY ("hashtagId") REFERENCES public.hashtags(id);


--
-- Name: hashtagUse hashtagUse_postId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."hashtagUse"
    ADD CONSTRAINT "hashtagUse_postId_fkey" FOREIGN KEY ("postId") REFERENCES public.posts(id);


--
-- Name: likes likes_postId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "likes_postId_fkey" FOREIGN KEY ("postId") REFERENCES public.posts(id);


--
-- Name: likes likes_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "likes_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: posts posts_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT "posts_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

