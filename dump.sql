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

INSERT INTO public."hashtagUse" VALUES (1, 1, 1, '2023-01-03 16:41:46.723179');
INSERT INTO public."hashtagUse" VALUES (2, 1, 7, '2023-01-03 16:41:49.674267');
INSERT INTO public."hashtagUse" VALUES (3, 2, 1, '2023-01-03 16:41:51.971393');
INSERT INTO public."hashtagUse" VALUES (4, 2, 9, '2023-01-03 16:41:54.299154');
INSERT INTO public."hashtagUse" VALUES (5, 2, 11, '2023-01-03 16:41:56.460627');
INSERT INTO public."hashtagUse" VALUES (6, 2, 18, '2023-01-03 16:41:59.250665');
INSERT INTO public."hashtagUse" VALUES (7, 3, 2, '2023-01-03 16:42:02.130188');
INSERT INTO public."hashtagUse" VALUES (8, 3, 18, '2023-01-03 16:42:05.331576');
INSERT INTO public."hashtagUse" VALUES (9, 4, 3, '2023-01-03 16:42:07.669576');
INSERT INTO public."hashtagUse" VALUES (10, 4, 5, '2023-01-03 16:42:10.480976');
INSERT INTO public."hashtagUse" VALUES (11, 4, 11, '2023-01-03 16:42:13.332704');
INSERT INTO public."hashtagUse" VALUES (12, 4, 18, '2023-01-03 16:42:15.754479');
INSERT INTO public."hashtagUse" VALUES (13, 5, 3, '2023-01-03 16:42:18.333449');
INSERT INTO public."hashtagUse" VALUES (14, 5, 4, '2023-01-03 16:42:21.010829');
INSERT INTO public."hashtagUse" VALUES (15, 5, 20, '2023-01-03 16:42:23.880685');
INSERT INTO public."hashtagUse" VALUES (16, 6, 5, '2023-01-03 16:42:27.974172');
INSERT INTO public."hashtagUse" VALUES (17, 6, 10, '2023-01-03 16:42:30.46177');
INSERT INTO public."hashtagUse" VALUES (18, 7, 6, '2023-01-03 16:42:32.779163');
INSERT INTO public."hashtagUse" VALUES (19, 8, 9, '2023-01-03 16:42:35.04221');
INSERT INTO public."hashtagUse" VALUES (20, 9, 12, '2023-01-03 16:42:37.232966');
INSERT INTO public."hashtagUse" VALUES (21, 9, 18, '2023-01-03 16:42:39.611523');
INSERT INTO public."hashtagUse" VALUES (22, 10, 13, '2023-01-03 16:42:42.259293');
INSERT INTO public."hashtagUse" VALUES (23, 11, 14, '2023-01-03 16:42:44.767354');
INSERT INTO public."hashtagUse" VALUES (24, 12, 14, '2023-01-03 16:42:47.51622');
INSERT INTO public."hashtagUse" VALUES (25, 13, 17, '2023-01-03 16:42:50.480062');
INSERT INTO public."hashtagUse" VALUES (26, 14, 19, '2023-01-03 16:42:52.565317');
INSERT INTO public."hashtagUse" VALUES (27, 14, 20, '2023-01-03 16:42:54.482055');
INSERT INTO public."hashtagUse" VALUES (28, 15, 4, '2023-01-03 16:42:56.788023');
INSERT INTO public."hashtagUse" VALUES (29, 16, 5, '2023-01-03 16:42:59.118035');


--
-- Data for Name: hashtags; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.hashtags VALUES (1, '#útil', '2023-01-03 16:11:34.81807');
INSERT INTO public.hashtags VALUES (2, '#legal', '2023-01-03 16:11:37.38423');
INSERT INTO public.hashtags VALUES (3, '#vailáeverbo', '2023-01-03 16:11:39.964423');
INSERT INTO public.hashtags VALUES (4, '#amor', '2023-01-03 16:11:42.197336');
INSERT INTO public.hashtags VALUES (5, '#corno', '2023-01-03 16:11:44.820655');
INSERT INTO public.hashtags VALUES (6, '#socorro', '2023-01-03 16:11:47.404621');
INSERT INTO public.hashtags VALUES (7, '#amazon', '2023-01-03 16:11:50.094616');
INSERT INTO public.hashtags VALUES (8, '#confia', '2023-01-03 16:11:52.620608');
INSERT INTO public.hashtags VALUES (9, '#ferramenta', '2023-01-03 16:11:54.94056');
INSERT INTO public.hashtags VALUES (10, '#faleitôleve', '2023-01-03 16:11:57.594467');
INSERT INTO public.hashtags VALUES (11, '#telegram', '2023-01-03 16:11:59.915363');
INSERT INTO public.hashtags VALUES (12, '#whatsapp', '2023-01-03 16:12:02.461059');
INSERT INTO public.hashtags VALUES (13, '#live', '2023-01-03 16:12:05.386896');
INSERT INTO public.hashtags VALUES (14, '#chocado', '2023-01-03 16:12:07.954536');
INSERT INTO public.hashtags VALUES (15, '#inútil', '2023-01-03 16:33:28.876396');
INSERT INTO public.hashtags VALUES (16, '#caos', '2023-01-03 16:35:42.588508');


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.posts VALUES (1, 1, 'https://www.youtube.com/', 'Tá procurando aquele tutorial de sql? Pesquisa no youtube #útil #legal', '2023-01-03 16:08:26.911461');
INSERT INTO public.posts VALUES (2, 2, 'https://github.com/', 'Não esqueçam de colocar seus projetos no github #vailáeverbo', '2023-01-03 16:08:32.206112');
INSERT INTO public.posts VALUES (3, 3, 'https://web.whatsapp.com/', 'A crush te mandou mensagem, confira no whatsapp #amor #corno', '2023-01-03 16:08:35.041918');
INSERT INTO public.posts VALUES (4, 2, 'https://pt-br.facebook.com/', 'Ninguém mais usa isso #inútil #corno', '2023-01-03 16:08:39.164059');
INSERT INTO public.posts VALUES (5, 2, 'https://twitter.com/', 'Lugar onde filho chora e a mãe não vê #caos #amor #socorro', '2023-01-03 16:08:42.119821');
INSERT INTO public.posts VALUES (6, 1, 'https://www.amazon.com.br/', 'A saga completa de As Crônicas de Pedrinho está disponivel na #amazon', '2023-01-03 16:08:46.024164');
INSERT INTO public.posts VALUES (7, 4, 'https://www.ifood.com.br/', 'Preguiça de fazer um arroz e fritar um ovo? Peça um ifood #útil', '2023-01-03 16:08:49.324956');
INSERT INTO public.posts VALUES (8, 3, 'https://www.uber.com/br/pt-br/', 'Galera, olha esse site inovador em que você pede um tipo diferente de táxi. Eles oferecem até balinha!', '2023-01-03 16:08:52.183456');
INSERT INTO public.posts VALUES (9, 5, 'https://shopee.com.br/', 'ATENÇÃO! Promoção! Tudo na metade do dobro do preço! #confia #legal', '2023-01-03 16:08:55.992287');
INSERT INTO public.posts VALUES (10, 1, 'https://slack.com/intl/pt-br', 'Na empresa em que estou trabalhando, estamos usando isso aqui, muito bom! #socorro', '2023-01-03 16:08:59.341247');
INSERT INTO public.posts VALUES (11, 1, 'https://www.instagram.com/', 'Um ótimo site para perder toda a sua produtividade e felicidade na vida! #amor #legal', '2023-01-03 16:09:01.914252');
INSERT INTO public.posts VALUES (12, 4, 'https://app.diagrams.net/', 'Deem uma olhada nisso aqui, é ótimo para organizar diagramas! #ferramenta', '2023-01-03 16:09:05.049059');
INSERT INTO public.posts VALUES (13, 5, 'https://www.deepl.com/pt-BR/translator', 'Melhor que o do google #faleitôleve', '2023-01-03 16:09:08.327073');
INSERT INTO public.posts VALUES (14, 3, 'https://web.telegram.org/k/', 'O #telegram vai em poucos anos superar o #whatsapp, escrevam o que estou falando!', '2023-01-03 16:09:11.181519');
INSERT INTO public.posts VALUES (15, 3, 'https://stackoverflow.com/', 'Simplesmente o oráculo dos devs', '2023-01-03 16:09:13.875472');
INSERT INTO public.posts VALUES (16, 1, 'https://developer.mozilla.org/pt-BR/', 'Simplesmente o substituto do oráculo dos devs', '2023-01-03 16:09:16.661949');
INSERT INTO public.posts VALUES (17, 2, 'https://www.twitch.tv/', 'Nada melhor do que assistir a uma livezinha depois de comer uma sopa de feijão ouvindo Linkin Park #live', '2023-01-03 16:09:19.414918');
INSERT INTO public.posts VALUES (18, 5, 'https://docs.google.com/document/u/0/', 'Escreva sua raiva antes de jogá-la em alguém #vailáeverbo #amor #legal #ferramenta', '2023-01-03 16:09:22.823013');
INSERT INTO public.posts VALUES (19, 5, 'https://calendar.google.com/calendar/u/0/r', 'Mano, abri o calendário aqui, como assim estamos em 2023 e ninguém me avisou? #chocado', '2023-01-03 16:09:25.834057');
INSERT INTO public.posts VALUES (20, 2, 'https://www.netflix.com/br/', 'Viram o que aquele protagonista irrelevante da nova série chata fez!? #chocado #corno', '2023-01-03 16:09:29.064151');


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Matheus', 'matheus@gmail.com', 'banana', '2023-01-03 16:06:55.136335');
INSERT INTO public.users VALUES (2, 'Carlos', 'carlos@gmail.com', 'melancia', '2023-01-03 16:06:58.71913');
INSERT INTO public.users VALUES (3, 'Lucas', 'lucas@gmail.com', 'abacate', '2023-01-03 16:07:04.033529');
INSERT INTO public.users VALUES (4, 'Raphael', 'raphael@gmail.com', 'manga', '2023-01-03 16:07:07.706285');
INSERT INTO public.users VALUES (5, 'Bruno', 'bruno@gmail.com', 'laranja', '2023-01-03 16:07:11.156523');


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

