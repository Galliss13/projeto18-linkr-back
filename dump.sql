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
-- Name: comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "postId" integer NOT NULL,
    text character varying(300) NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: follows; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.follows (
    id integer NOT NULL,
    "followerId" integer NOT NULL,
    "followedId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: follows_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.follows_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: follows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.follows_id_seq OWNED BY public.follows.id;


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
-- Name: reposts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reposts (
    id integer NOT NULL,
    "postId" integer NOT NULL,
    "repostedAt" timestamp without time zone DEFAULT now()
);


--
-- Name: reposts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reposts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reposts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reposts_id_seq OWNED BY public.reposts.id;


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
-- Name: timeline; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.timeline (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "postId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: timeline_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.timeline_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: timeline_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.timeline_id_seq OWNED BY public.timeline.id;


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
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: follows id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows ALTER COLUMN id SET DEFAULT nextval('public.follows_id_seq'::regclass);


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
-- Name: reposts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reposts ALTER COLUMN id SET DEFAULT nextval('public.reposts_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: timeline id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.timeline ALTER COLUMN id SET DEFAULT nextval('public.timeline_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: follows; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: hashtagUse; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."hashtagUse" VALUES (1, 1, 1, '2023-01-05 22:34:34.98047');
INSERT INTO public."hashtagUse" VALUES (2, 1, 7, '2023-01-05 22:34:37.40529');
INSERT INTO public."hashtagUse" VALUES (3, 2, 1, '2023-01-05 22:34:38.647405');
INSERT INTO public."hashtagUse" VALUES (4, 2, 9, '2023-01-05 22:34:39.678649');
INSERT INTO public."hashtagUse" VALUES (5, 2, 11, '2023-01-05 22:34:40.67679');
INSERT INTO public."hashtagUse" VALUES (7, 3, 2, '2023-01-05 22:34:42.896265');
INSERT INTO public."hashtagUse" VALUES (9, 4, 3, '2023-01-05 22:34:45.221146');
INSERT INTO public."hashtagUse" VALUES (10, 4, 5, '2023-01-05 22:34:47.215858');
INSERT INTO public."hashtagUse" VALUES (11, 4, 11, '2023-01-05 22:34:48.373639');
INSERT INTO public."hashtagUse" VALUES (13, 5, 3, '2023-01-05 22:34:50.559341');
INSERT INTO public."hashtagUse" VALUES (14, 5, 4, '2023-01-05 22:34:51.660549');
INSERT INTO public."hashtagUse" VALUES (16, 6, 5, '2023-01-05 22:34:54.852852');
INSERT INTO public."hashtagUse" VALUES (17, 6, 10, '2023-01-05 22:34:55.872645');
INSERT INTO public."hashtagUse" VALUES (18, 7, 6, '2023-01-05 22:34:56.884583');
INSERT INTO public."hashtagUse" VALUES (19, 8, 9, '2023-01-05 22:34:59.007233');
INSERT INTO public."hashtagUse" VALUES (21, 9, 12, '2023-01-05 22:35:01.391085');
INSERT INTO public."hashtagUse" VALUES (22, 10, 13, '2023-01-05 22:35:03.965821');
INSERT INTO public."hashtagUse" VALUES (25, 13, 17, '2023-01-05 22:35:08.314409');
INSERT INTO public."hashtagUse" VALUES (28, 15, 4, '2023-01-05 22:35:11.395366');
INSERT INTO public."hashtagUse" VALUES (29, 16, 5, '2023-01-05 22:35:12.331048');
INSERT INTO public."hashtagUse" VALUES (43, 18, 14, '2023-01-06 04:52:38');
INSERT INTO public."hashtagUse" VALUES (44, 17, 14, '2023-01-06 04:52:38');
INSERT INTO public."hashtagUse" VALUES (71, 20, 22, '2023-01-09 03:54:48');
INSERT INTO public."hashtagUse" VALUES (72, 19, 22, '2023-01-09 03:54:48');


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
INSERT INTO public.hashtags VALUES (17, '#superar', '2023-01-06 04:52:07');
INSERT INTO public.hashtags VALUES (18, '#anos', '2023-01-06 04:52:38');
INSERT INTO public.hashtags VALUES (19, '#aaaa', '2023-01-09 02:53:30');
INSERT INTO public.hashtags VALUES (20, '#novo', '2023-01-09 03:48:42');


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
INSERT INTO public.posts VALUES (15, 3, 'https://stackoverflow.com/', 'Simplesmente o oráculo dos devs', '2023-01-03 19:35:20.318158');
INSERT INTO public.posts VALUES (16, 1, 'https://developer.mozilla.org/pt-BR/', 'Simplesmente o substituto do oráculo dos devs', '2023-01-03 19:35:23.099252');
INSERT INTO public.posts VALUES (17, 2, 'https://www.twitch.tv/', 'Nada melhor do que assistir a uma livezinha depois de comer uma sopa de feijão ouvindo Linkin Park #live', '2023-01-03 19:35:25.48727');
INSERT INTO public.posts VALUES (14, 3, 'https://web.telegram.org/k/', 'O telegram vai em poucos #anos #superar o whatsapp, escrevam o que estou falando!', '2023-01-03 19:35:17.558635');
INSERT INTO public.posts VALUES (21, 9, 'https://images.pexels.com/photos/1337825/pexels-photo-1337825.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 'aaaaaa meu deus', '2023-01-09 02:24:20');
INSERT INTO public.posts VALUES (22, 9, 'https://images.pexels.com/photos/1337825/pexels-photo-1337825.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', '#novo #aaaa', '2023-01-09 02:24:22');


--
-- Data for Name: reposts; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 10, '5a1a3381-3dee-4b9a-aeba-6f0d1afdfa23', '2023-01-10 13:39:55.585954');


--
-- Data for Name: timeline; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Matheus', 'matheus@gmail.com', 'banana', 'https://images.pexels.com/photos/2872755/pexels-photo-2872755.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', '2023-01-03 19:34:10.476671');
INSERT INTO public.users VALUES (2, 'Carlos', 'carlos@gmail.com', 'melancia', 'https://images.pexels.com/photos/1337825/pexels-photo-1337825.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', '2023-01-03 19:34:15.090753');
INSERT INTO public.users VALUES (3, 'Lucas', 'lucas@gmail.com', 'abacate', 'https://images.pexels.com/photos/4462786/pexels-photo-4462786.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', '2023-01-03 19:34:18.113811');
INSERT INTO public.users VALUES (4, 'Raphael', 'raphael@gmail.com', 'manga', 'https://images.pexels.com/photos/5875695/pexels-photo-5875695.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', '2023-01-03 19:34:20.717467');
INSERT INTO public.users VALUES (5, 'Bruno', 'bruno@gmail.com', 'laranja', 'https://images.pexels.com/photos/616838/pexels-photo-616838.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', '2023-01-03 19:34:23.671641');
INSERT INTO public.users VALUES (7, 'Matheusinho', 'matheusgalindo@gmail.com', '$2b$10$BW6fsoujLXk4AboSiz26yOMV0SoqooZxV3MCvqrGNkYGR4HIRrS5a', 'data:image/jpeg;base64,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', '2023-01-06 18:45:51.163191');
INSERT INTO public.users VALUES (8, 'cabeludinho', 'cabeludo@gmail.com', '$2b$10$mUEBeqWUN2yekco0hJyEQ../nW7nslF1MG493ZXUEC.1jpYWZcEVq', 'https://images.pexels.com/photos/39317/chihuahua-dog-puppy-cute-39317.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', '2023-01-08 14:30:48.805502');
INSERT INTO public.users VALUES (9, 'que droga', 'tristeza@gmail.com', '$2b$10$iuj2J7DD1w2J5rYR4RNUN.sEegfiPRwIwtlJiAnr//FZr6IHI.y76', 'https://images.pexels.com/photos/14758617/pexels-photo-14758617.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', '2023-01-09 14:20:35.447646');
INSERT INTO public.users VALUES (10, 'oba', 'oba@gmail.com', '$2b$10$JR029GGuXJepaj4lAv8QauBVQnXRvmDCt1qu/vrs93bjsc68CxYEm', 'https://images.pexels.com/photos/14758617/pexels-photo-14758617.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', '2023-01-10 13:39:41.924268');


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.comments_id_seq', 1, false);


--
-- Name: follows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.follows_id_seq', 1, false);


--
-- Name: hashtagUse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."hashtagUse_id_seq"', 72, true);


--
-- Name: hashtags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hashtags_id_seq', 20, true);


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.likes_id_seq', 1, false);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.posts_id_seq', 23, true);


--
-- Name: reposts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reposts_id_seq', 1, false);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 1, true);


--
-- Name: timeline_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.timeline_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 10, true);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: follows follows_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_pkey PRIMARY KEY (id);


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
-- Name: reposts reposts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reposts
    ADD CONSTRAINT reposts_pkey PRIMARY KEY (id);


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
-- Name: timeline timeline_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.timeline
    ADD CONSTRAINT timeline_pkey PRIMARY KEY (id);


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
-- Name: comments comments_postId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT "comments_postId_fkey" FOREIGN KEY ("postId") REFERENCES public.posts(id);


--
-- Name: comments comments_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT "comments_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: follows follows_followedId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT "follows_followedId_fkey" FOREIGN KEY ("followedId") REFERENCES public.users(id);


--
-- Name: follows follows_followerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT "follows_followerId_fkey" FOREIGN KEY ("followerId") REFERENCES public.users(id);


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
-- Name: reposts reposts_postId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reposts
    ADD CONSTRAINT "reposts_postId_fkey" FOREIGN KEY ("postId") REFERENCES public.posts(id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: timeline timeline_postId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.timeline
    ADD CONSTRAINT "timeline_postId_fkey" FOREIGN KEY ("postId") REFERENCES public.posts(id);


--
-- Name: timeline timeline_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.timeline
    ADD CONSTRAINT "timeline_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

