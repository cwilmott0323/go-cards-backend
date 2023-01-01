--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3 (Debian 13.3-1.pgdg100+1)
-- Dumped by pg_dump version 13.3 (Debian 13.3-1.pgdg100+1)

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
-- Name: account_card_maps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_card_maps (
    account_id bigint NOT NULL,
    card_id bigint NOT NULL,
    count bigint NOT NULL
);


ALTER TABLE public.account_card_maps OWNER TO postgres;

--
-- Name: accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts (
    account_id bigint NOT NULL,
    password text NOT NULL,
    email text NOT NULL,
    created_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    last_login timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.accounts OWNER TO postgres;

--
-- Name: accounts_account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_account_id_seq OWNER TO postgres;

--
-- Name: accounts_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_account_id_seq OWNED BY public.accounts.account_id;


--
-- Name: api_keys; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_keys (
    account_id bigint NOT NULL,
    api_key character varying(255) NOT NULL,
    inserted timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.api_keys OWNER TO postgres;

--
-- Name: cards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cards (
    card_id bigint NOT NULL,
    card_name text NOT NULL,
    attack bigint NOT NULL,
    defence bigint NOT NULL,
    description text,
    ability text,
    typing text NOT NULL,
    rarity text NOT NULL,
    type text NOT NULL,
    set text NOT NULL,
    set_code text NOT NULL
);


ALTER TABLE public.cards OWNER TO postgres;

--
-- Name: cards_card_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cards_card_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cards_card_id_seq OWNER TO postgres;

--
-- Name: cards_card_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cards_card_id_seq OWNED BY public.cards.card_id;


--
-- Name: pack_codes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pack_codes (
    pack_code_id bigint NOT NULL,
    pack_code_key text NOT NULL,
    pack_id bigint NOT NULL,
    account_id bigint NOT NULL
);


ALTER TABLE public.pack_codes OWNER TO postgres;

--
-- Name: pack_codes_pack_code_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pack_codes_pack_code_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pack_codes_pack_code_id_seq OWNER TO postgres;

--
-- Name: pack_codes_pack_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pack_codes_pack_code_id_seq OWNED BY public.pack_codes.pack_code_id;


--
-- Name: packs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.packs (
    pack_id bigint NOT NULL,
    pack_name text NOT NULL,
    pack_code text NOT NULL,
    card_amount bigint NOT NULL
);


ALTER TABLE public.packs OWNER TO postgres;

--
-- Name: packs_pack_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.packs_pack_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.packs_pack_id_seq OWNER TO postgres;

--
-- Name: packs_pack_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.packs_pack_id_seq OWNED BY public.packs.pack_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    nickname character varying(255) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: accounts account_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts ALTER COLUMN account_id SET DEFAULT nextval('public.accounts_account_id_seq'::regclass);


--
-- Name: cards card_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards ALTER COLUMN card_id SET DEFAULT nextval('public.cards_card_id_seq'::regclass);


--
-- Name: pack_codes pack_code_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pack_codes ALTER COLUMN pack_code_id SET DEFAULT nextval('public.pack_codes_pack_code_id_seq'::regclass);


--
-- Name: packs pack_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.packs ALTER COLUMN pack_id SET DEFAULT nextval('public.packs_pack_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: account_card_maps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_card_maps (account_id, card_id, count) FROM stdin;
4	114	1
4	99	1
4	105	1
4	116	1
4	16	1
4	17	1
4	84	1
4	78	2
4	66	1
4	121	1
4	14	2
4	20	1
4	10	1
4	37	1
4	101	1
4	103	1
4	4	2
4	58	1
4	106	1
4	52	1
4	81	1
4	72	3
4	7	1
4	79	1
4	34	1
4	119	3
4	43	2
4	63	1
4	67	2
4	88	1
4	56	2
4	49	1
4	50	1
4	57	1
4	83	1
4	71	1
4	19	1
4	96	2
4	95	2
4	70	1
4	62	1
4	107	1
4	55	2
4	25	2
4	113	1
4	42	1
\.


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts (account_id, password, email, created_on, last_login) FROM stdin;
2	$2a$10$aEWZMlQ2e6bxx1auoiIF0uTXTqHHK01oWhwwJIvDTP0gzS2mOauua	lillchris1@hotmail.com	2021-10-21 23:00:13.95485+00	2021-10-21 23:00:13.95485+00
3	$2a$10$YeqOuSgp/nV5OZV6lBwDG..GrQS20QkeLxhFYDnKUWElP1q41053C	wilmott@live.co.uk	2021-10-22 00:09:49.280152+00	2021-10-22 00:09:49.280152+00
4	$2a$10$.Gh8nAchP9Up6uXdIaAwVe7BaVFi464uf81aCLtXn96pAUTmvZHTW	zdk@hotmail.com	2021-10-22 00:32:10.911807+00	2021-10-22 00:32:10.911807+00
\.


--
-- Data for Name: api_keys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_keys (account_id, api_key, inserted) FROM stdin;
2	WWTJZSB3VSUJZIKN	2021-10-21 23:02:22.541348+00
\.


--
-- Data for Name: cards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cards (card_id, card_name, attack, defence, description, ability, typing, rarity, type, set, set_code) FROM stdin;
2	Armaill	700	1300	A strange warrior who manipulates three deadly blades with both hands and his tail.	\N	Warrior	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
3	Armed Ninja	300	300	FLIP: Target 1 Spell Card on the field; destroy that target. (If the target is Set, reveal it, and destroy it if it is a Spell Card. Otherwise, return it to its original position.)	\N	Warrior	Rare	Flip Effect Monster	Legend of Blue Eyes White Dragon	LOB
4	Armored Starfish	850	1400	A bluish starfish with a solid hide capable of fending off attacks.	\N	Aqua	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
5	Basic Insect	500	700	Usually found traveling in swarms, this creatures ideal environment is the forest.	\N	Insect	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
6	Beast Fangs	0	0	A Beast-Type monster equipped with this card increases its ATK and DEF by 300 points.	\N	Equip	Short Print	Spell Card	Legend of Blue Eyes White Dragon	LOB
7	Beaver Warrior	1200	1500	What this creature lacks in size it makes up for in defense when battling in the prairie.	\N	Beast-Warrior	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
8	Blue-Eyes White Dragon	3000	2500	This legendary dragon is a powerful engine of destruction. Virtually invincible, very few have faced this awesome creature and lived to tell the tale.	\N	Dragon	Ultra Rare	Normal Monster	Legend of Blue Eyes White Dragon	LOB
9	Book of Secret Arts	0	0	A Spellcaster-Type monster equipped with this card increases its ATK and DEF by 300 points.	\N	Equip	Short Print	Spell Card	Legend of Blue Eyes White Dragon	LOB
10	Celtic Guardian	1400	1200	An elf who learned to wield a sword, he baffles enemies with lightning-swift attacks.	\N	Warrior	Super Rare	Normal Monster	Legend of Blue Eyes White Dragon	LOB
11	Charubin the Fire Knight	1100	800	Monster Egg + "Hinotama Soul"	\N	Pyro	Rare	Fusion Monster	Legend of Blue Eyes White Dragon	LOB
12	Curse of Dragon	2000	1500	A wicked dragon that taps into dark forces to execute a powerful attack.	\N	Dragon	Super Rare	Normal Monster	Legend of Blue Eyes White Dragon	LOB
13	Dark Energy	0	0	Increase the ATK and DEF of a Fiend-Type monster equipped with this card by 300 points.	\N	Equip	Short Print	Spell Card	Legend of Blue Eyes White Dragon	LOB
14	Dark Gray	800	900	Entirely gray, this beast has rarely been seen by mortal eyes.	\N	Beast	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
15	Dark Hole	0	0	Destroy all monsters on the field.	\N	Normal	Super Rare	Spell Card	Legend of Blue Eyes White Dragon	LOB
16	Dark King of the Abyss	1200	800	Its said that this King of the Netherworld once had the power to rule over the dark.	\N	Fiend	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
17	Dark Magician	2500	2100	The ultimate wizard in terms of attack and defense.	\N	Spellcaster	Ultra Rare	Normal Monster	Legend of Blue Eyes White Dragon	LOB
18	Darkfire Dragon	1500	1250	Firegrass + "Petit Dragon"	\N	Dragon	Rare	Fusion Monster	Legend of Blue Eyes White Dragon	LOB
19	Darkworld Thorns	1200	900	A thorny plant found in the darklands that wraps itself around any unwary traveler.	\N	Plant	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
20	Dissolverock	900	1000	A monster born in the lava pits, it generates intense heat that can melt away its enemies.	\N	Rock	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
21	Dragon Capture Jar	0	0	Change all face-up Dragon-Type monsters on the field to Defense Position, also they cannot change their battle positions.	\N	Continuous	Rare	Trap Card	Legend of Blue Eyes White Dragon	LOB
22	Dragon Treasure	0	0	A Dragon-Type monster equipped with this card increases its ATK and DEF by 300 points.	\N	Equip	Short Print	Spell Card	Legend of Blue Eyes White Dragon	LOB
23	Dragoness the Wicked Knight	1200	900	Armaill + "One-Eyed Shield Dragon"	\N	Warrior	Rare	Fusion Monster	Legend of Blue Eyes White Dragon	LOB
24	Drooling Lizard	900	800	A blood-sucking snake in human form that attacks any living being that passes nearby.	\N	Reptile	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
25	Electro-Whip	0	0	Increase the ATK and DEF of a Thunder-Type monster equipped with this card by 300 points.	\N	Equip	Common	Spell Card	Legend of Blue Eyes White Dragon	LOB
26	Enchanting Mermaid	1200	900	A beautiful mermaid that lures voyagers to a watery grave.	\N	Fish	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
27	Exodia the Forbidden One	1000	1000	\N	If you have "Right Leg of the Forbidden One", "Left Leg of the Forbidden One", "Right Arm of the Forbidden One" and "Left Arm of the Forbidden One" in addition to this card in your hand, you win the Duel.	Spellcaster	Ultra Rare	Effect Monster	Legend of Blue Eyes White Dragon	LOB
28	Fiend Reflection #2	1100	1400	A bird-beast that summons reinforcements with a hand mirror.	\N	Winged Beast	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
29	Final Flame	0	0	Inflict 600 points of damage to your opponents Life Points.	\N	Normal	Rare	Spell Card	Legend of Blue Eyes White Dragon	LOB
30	Firegrass	700	600	A fire-breathing plant found growing near volcanoes.	\N	Plant	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
31	Fireyarou	1300	1000	A malevolent creature wrapped in flames that attacks enemies with intense fire.	\N	Pyro	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
32	Fissure	0	0	Destroy the 1 face-up monster your opponent controls that has the lowest ATK (your choice, if tied).	\N	Normal	Rare	Spell Card	Legend of Blue Eyes White Dragon	LOB
33	Flame Ghost	1000	800	Skull Servant + "Dissolverock"	\N	Zombie	Rare	Fusion Monster	Legend of Blue Eyes White Dragon	LOB
34	Flame Manipulator	900	1000	This Spellcaster attacks enemies with fire-related spells such as "Sea of Flames" and "Wall of Fire".	\N	Spellcaster	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
35	Flame Swordsman	1800	1600	Flame Manipulator + "Masaki the Legendary Swordsman"	\N	Warrior	Super Rare	Fusion Monster	Legend of Blue Eyes White Dragon	LOB
36	Flower Wolf	1800	1400	Silver Fang + "Darkworld Thorns"	\N	Beast	Rare	Fusion Monster	Legend of Blue Eyes White Dragon	LOB
37	Follow Wind	0	0	Increase the ATK and DEF of a Winged Beast-Type monster equipped with this card by 300 points.	\N	Equip	Short Print	Spell Card	Legend of Blue Eyes White Dragon	LOB
38	Forest	0	0	All Insect, Beast, Plant, and Beast-Warrior monsters on the field gain 200 ATK/DEF.	\N	Field	Common	Spell Card	Legend of Blue Eyes White Dragon	LOB
39	Frenzied Panda	1200	1000	A savage beast that carries a big bamboo stick for beating down its enemies.	\N	Beast	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
40	Fusionist	900	700	Petit Angel + "Mystical Sheep #2"	\N	Beast	Rare	Fusion Monster	Legend of Blue Eyes White Dragon	LOB
41	Gaia the Dragon Champion	2600	2100	Gaia The Fierce Knight + "Curse of Dragon"	\N	Dragon	Secret Rare	Fusion Monster	Legend of Blue Eyes White Dragon	LOB
42	Gaia The Fierce Knight	2300	2100	A knight whose horse travels faster than the wind. His battle-charge is a force to be reckoned with.	\N	Warrior	Ultra Rare	Normal Monster	Legend of Blue Eyes White Dragon	LOB
43	Giant Soldier of Stone	1300	2000	A giant warrior made of stone. A punch from this creature has earth-shaking results.	\N	Rock	Rare	Normal Monster	Legend of Blue Eyes White Dragon	LOB
44	Goblins Secret Remedy	0	0	Increase your Life Points by 600 points.	\N	Normal	Rare	Spell Card	Legend of Blue Eyes White Dragon	LOB
45	Gravedigger Ghoul	0	0	Select up to 2 Monster Card(s) from your opponents Graveyard. Remove the selected card(s) from play.	\N	Normal	Rare	Spell Card	Legend of Blue Eyes White Dragon	LOB
46	Green Phantom King	500	1600	This youthful king of the forests lives in a green world, abundant with trees and wildlife.	\N	Plant	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
47	Hane-Hane	450	500	FLIP: Select 1 monster on the field and return it to its owners hand.	\N	Beast	Rare	Flip Effect Monster	Legend of Blue Eyes White Dragon	LOB
48	Hard Armor	300	1200	A living suit of armor that attacks enemies with a bone-jarring tackle.	\N	Warrior	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
49	Hinotama	0	0	Inflict 500 damage to your opponent.	\N	Normal	Common	Spell Card	Legend of Blue Eyes White Dragon	LOB
50	Hinotama Soul	600	500	An intensely hot flame creature that rams anything standing in its way.	\N	Pyro	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
51	Hitotsu-Me Giant	1200	1000	A one-eyed behemoth with thick, powerful arms made for delivering punishing blows.	\N	Beast-Warrior	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
52	Kagemusha of the Blue Flame	800	400	Serving as a double for the Ruler of the Blue Flame, hes a master swordsman that wields a fine blade.	\N	Warrior	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
53	Karbonala Warrior	1500	1200	M-Warrior #1 + "M-Warrior #2"	\N	Warrior	Rare	Fusion Monster	Legend of Blue Eyes White Dragon	LOB
54	King Fog	1000	900	A fiend that dwells in a blinding curtain of smoke.	\N	Fiend	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
55	Kumootoko	700	1400	A massive, intelligent spider that traps enemies with webbing.	\N	Insect	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
56	Kurama	800	800	A vicious bird that attacks from the skies with its whip-like tail.	\N	Winged Beast	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
57	Larvas	800	1000	A fast-moving, bird-like creature that strangles opposing monsters with its long, thin arms.	\N	Beast	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
58	Laser Cannon Armor	0	0	Equip only to an Insect monster. It gains 300 ATK/DEF.	\N	Equip	Short Print	Spell Card	Legend of Blue Eyes White Dragon	LOB
59	Left Arm of the Forbidden One	200	300	A forbidden left arm sealed by magic. Whosoever breaks this seal will know infinite power.	\N	Spellcaster	Ultra Rare	Normal Monster	Legend of Blue Eyes White Dragon	LOB
60	Left Leg of the Forbidden One	200	300	A forbidden left leg sealed by magic. Whosoever breaks this seal will know infinite power.	\N	Spellcaster	Ultra Rare	Normal Monster	Legend of Blue Eyes White Dragon	LOB
61	Legendary Sword	0	0	Equip only to a Warrior monster. It gains 300 ATK/DEF.	\N	Equip	Short Print	Spell Card	Legend of Blue Eyes White Dragon	LOB
62	Lesser Dragon	1200	1000	A minor dragon incapable of breathing fire.	\N	Dragon	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
63	M-Warrior #1	1000	500	Specializing in combination attacks, this warrior uses magnetism to block an enemys escape.	\N	Warrior	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
64	M-Warrior #2	500	1000	Specializing in combination attacks, this warrior is equipped with a tough, magnetically coated armor.	\N	Warrior	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
65	Machine Conversion Factory	0	0	Equip only to a Machine monster. It gains 300 ATK/DEF.	\N	Equip	Short Print	Spell Card	Legend of Blue Eyes White Dragon	LOB
66	Mammoth Graveyard	1200	800	A mammoth that protects the graves of its pack and is absolutely merciless when facing grave-robbers.	\N	Dinosaur	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
67	Man Eater	800	600	Man-eating plant with poison feelers for attacking enemies.	\N	Plant	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
68	Man-Eater Bug	450	600	FLIP: Target 1 monster on the field; destroy it.	\N	Insect	Super Rare	Flip Effect Monster	Legend of Blue Eyes White Dragon	LOB
69	Masaki the Legendary Swordsman	1100	1100	Legendary swordmaster Masaki is a veteran of over 100 battles.	\N	Warrior	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
70	Meda Bat	800	400	An eyeball fiend created by a servant of the wicked, it uses "Dark Blasts" to blow away its enemies.	\N	Fiend	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
71	Metal Dragon	1850	1700	Steel Ogre Grotto #1 + "Lesser Dragon"	\N	Machine	Rare	Fusion Monster	Legend of Blue Eyes White Dragon	LOB
72	Misairuzame	1400	1600	A missile-launching fish protected by deadly spikes.	\N	Fish	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
73	Monster Egg	600	900	A warrior hidden within an egg that attacks enemies by flinging eggshells.	\N	Warrior	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
74	Monster Reborn	0	0	Target 1 monster in either GY; Special Summon it.	\N	Normal	Ultra Rare	Spell Card	Legend of Blue Eyes White Dragon	LOB
75	Mountain	0	0	All Dragon, Winged Beast, and Thunder monsters on the field gain 200 ATK/DEF.	\N	Field	Common	Spell Card	Legend of Blue Eyes White Dragon	LOB
76	Mystical Elf	800	2000	A delicate elf that lacks offense, but has a terrific defense backed by mystical power.	\N	Spellcaster	Super Rare	Normal Monster	Legend of Blue Eyes White Dragon	LOB
77	Mystical Moon	0	0	Equip only to a Beast-Warrior-Type monster. It gains 300 ATK and DEF.	\N	Equip	Short Print	Spell Card	Legend of Blue Eyes White Dragon	LOB
78	Mystical Sheep #2	800	1000	A monstrous sheep with a long tail for hypnotizing enemies.	\N	Beast	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
79	Nemuriko	800	700	A child-like creature that controls a sleep fiend to beckon enemies into eternal slumber.	\N	Spellcaster	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
80	One-Eyed Shield Dragon	700	1300	This dragon wears a shield not only for its own protection, but also for ramming its enemies.	\N	Dragon	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
81	Petit Angel	600	900	A quick-moving and tiny fairy thats very difficult to hit.	\N	Fairy	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
82	Petit Dragon	600	700	A very small dragon known for its vicious attacks.	\N	Dragon	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
83	Polymerization	0	0	Fusion Summon 1 Fusion Monster from your Extra Deck, using monsters from your hand or field as Fusion Material.	\N	Normal	Super Rare	Spell Card	Legend of Blue Eyes White Dragon	LOB
84	Pot of Greed	0	0	Draw 2 cards.	\N	Normal	Rare	Spell Card	Legend of Blue Eyes White Dragon	LOB
85	Power of Kaishin	0	0	Equip only to an Aqua monster. It gains 300 ATK/DEF.	\N	Equip	Short Print	Spell Card	Legend of Blue Eyes White Dragon	LOB
86	Raigeki	0	0	Destroy all monsters your opponent controls.	\N	Normal	Super Rare	Spell Card	Legend of Blue Eyes White Dragon	LOB
87	Raise Body Heat	0	0	Equip only to a Dinosaur monster. It gains 300 ATK/DEF.	\N	Equip	Short Print	Spell Card	Legend of Blue Eyes White Dragon	LOB
88	Ray & Temperature	1000	1000	The Sun and the North Wind join hands to deliver a devastating combination of heat and gale-force winds.	\N	Fairy	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
89	Reaper of the Cards	1380	1930	FLIP: Select 1 Trap Card on the field and destroy it. If the selected card is Set, pick up and see the card. If it is a Trap Card, it is destroyed. If it is a Spell Card, return it to its original position.	\N	Fiend	Rare	Flip Effect Monster	Legend of Blue Eyes White Dragon	LOB
90	Red Medicine	0	0	Increase your Life Points by 500 points.	\N	Normal	Common	Spell Card	Legend of Blue Eyes White Dragon	LOB
91	Red-Eyes Black Dragon	2400	2000	'A ferocious dragon with a deadly attack.'	\N	Dragon	Ultra Rare	Normal Monster	Legend of Blue Eyes White Dragon	LOB
92	Remove Trap	0	0	Select 1 face-up Trap Card on the field and destroy it.	\N	Normal	Common	Spell Card	Legend of Blue Eyes White Dragon	LOB
93	Right Arm of the Forbidden One	200	300	A forbidden right arm sealed by magic. Whosoever breaks this seal will know infinite power.	\N	Spellcaster	Ultra Rare	Normal Monster	Legend of Blue Eyes White Dragon	LOB
94	Right Leg of the Forbidden One	200	300	A forbidden right leg sealed by magic. Whosoever breaks this seal will know infinite power.	\N	Spellcaster	Ultra Rare	Normal Monster	Legend of Blue Eyes White Dragon	LOB
95	Root Water	900	800	An amphibian capable of calling up a massive tidal wave from the dark seas to wipe out enemy monsters.	\N	Fish	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
96	Sand Stone	1300	1600	Appears from underground and attacks with long, snake-like tentacles.	\N	Rock	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
97	Silver Bow and Arrow	0	0	A Fairy-Type monster equipped with this card increases its ATK and DEF by 300 points.	\N	Equip	Short Print	Spell Card	Legend of Blue Eyes White Dragon	LOB
98	Silver Fang	1200	800	A snow wolf thats beautiful to the eye, but absolutely vicious in battle.	\N	Beast	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
99	Skull Red Bird	1550	1200	This monster swoops down and attacks with a rain of knives stored in its wings.	\N	Winged Beast	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
100	Skull Servant	300	200	A skeletal ghost that isnt strong but can mean trouble in large numbers.	\N	Zombie	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
101	Sogen	0	0	All Warrior and Beast-Warrior monsters on the field gain 200 ATK/DEF.	\N	Field	Common	Spell Card	Legend of Blue Eyes White Dragon	LOB
102	Sparks	0	0	Inflict 200 points of damage to your opponents Life Points.	\N	Normal	Common	Spell Card	Legend of Blue Eyes White Dragon	LOB
103	Spike Seadra	1600	1300	Using the spikes sprouting from its body, this creature stabs its opponents and floods them with electricity.	\N	Sea Serpent	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
104	Spirit of the Harp	800	2000	A spirit that soothes the soul with the music of its heavenly harp.	\N	Fairy	Rare	Normal Monster	Legend of Blue Eyes White Dragon	LOB
105	Steel Ogre Grotto #1	1400	1800	A steel idol worshipped in the Land of Machines.	\N	Machine	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
106	Stop Defense	0	0	Select 1 Defense Position monster on your opponents side of the field and change it to Attack Position.	\N	Normal	Rare	Spell Card	Legend of Blue Eyes White Dragon	LOB
107	Succubus Knight	1650	1300	A warrior wizard adept in casting bone-chilling spells.	\N	Warrior	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
108	Swords of Revealing Light	0	0	After this cards activation, it remains on the field, but you must destroy it during the End Phase of your opponents 3rd turn. When this card is activated: If your opponent controls a face-down monster, flip all monsters they control face-up. While this card is face-up on the field, your opponents monsters cannot declare an attack.	\N	Normal	Super Rare	Spell Card	Legend of Blue Eyes White Dragon	LOB
109	Terra the Terrible	1200	1300	Known as a swamp dweller, this creature is a minion of the dark forces.	\N	Fiend	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
110	The 13th Grave	1200	900	A zombie that suddenly appeared from plot #13 - an empty grave.	\N	Zombie	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
111	The Furious Sea King	800	700	Grand King of the Seven Seas, hes able to summon massive tidal waves to drown the enemy.	\N	Aqua	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
112	Trap Hole	0	0	When your opponent Normal or Flip Summons 1 monster with 1000 or more ATK: Target that monster; destroy that target.	\N	Normal	Super Rare	Trap Card	Legend of Blue Eyes White Dragon	LOB
113	Tri-Horned Dragon	2850	2350	An unworthy dragon with three sharp horns sprouting from its head.	\N	Dragon	Secret Rare	Normal Monster	Legend of Blue Eyes White Dragon	LOB
114	Trial of Nightmare	1300	900	This fiend passes judgment on enemies that are locked in coffins.	\N	Fiend	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
115	Tripwire Beast	1200	1300	This creature attacks with electromagnetic waves.	\N	Thunder	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
116	Turtle Tiger	1000	1500	A tiger encased in a protective shell that attacks with razor-sharp fangs.	\N	Aqua	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
117	Two-Mouth Darkruler	900	700	A dinosaur with two deadly jaws, it stores electricity in its horn and releases high voltage bolts from the mouth on its back.	\N	Dinosaur	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
118	Two-Pronged Attack	0	0	Select and destroy 2 of your monsters and 1 of your opponents monsters.	\N	Normal	Rare	Trap Card	Legend of Blue Eyes White Dragon	LOB
119	Tyhone	1200	1400	Capable of firing cannonballs from its mouth for long-range attacks, this creature is particularly effective in mountain battles.	\N	Winged Beast	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
120	Umi	0	0	All Fish, Sea Serpent, Thunder, and Aqua monsters on the field gain 200 ATK/DEF, also all Machine and Pyro monsters on the field lose 200 ATK/DEF.	\N	Field	Common	Spell Card	Legend of Blue Eyes White Dragon	LOB
121	Uraby	1500	800	Fast on its feet, this dinosaur rips enemies to shreds with its sharp claws.	\N	Dinosaur	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
122	Vile Germs	0	0	A Plant-Type monster equipped with this card increases its ATK and DEF by 300 points.	\N	Equip	Short Print	Spell Card	Legend of Blue Eyes White Dragon	LOB
123	Violet Crystal	0	0	This card is not treated as a "Crystal" card. Equip only to a Zombie monster. It gains 300 ATK/DEF.	\N	Equip	Short Print	Spell Card	Legend of Blue Eyes White Dragon	LOB
124	Wasteland	0	0	All Dinosaur, Zombie, and Rock monsters on the field gain 200 ATK/DEF.	\N	Field	Common	Spell Card	Legend of Blue Eyes White Dragon	LOB
125	Witty Phantom	1400	1300	Dressed in a night-black tuxedo, this creature presides over the darkness.	\N	Fiend	Common	Normal Monster	Legend of Blue Eyes White Dragon	LOB
126	Yami	0	0	All Fiend and Spellcaster monsters on the field gain 200 ATK/DEF, also all Fairy monsters on the field lose 200 ATK/DEF.	\N	Field	Common	Spell Card	Legend of Blue Eyes White Dragon	LOB
1	Aqua Madoor	1200	2000	A wizard of the waters that conjures a liquid wall to crush any enemies that oppose him	\N	Spellcaster	Rare	Normal Monster	Legend of Blue Eyes White Dragon	LOB
\.


--
-- Data for Name: pack_codes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pack_codes (pack_code_id, pack_code_key, pack_id, account_id) FROM stdin;
4	54HXVKE47YJPBMYUF6X4WWBZ	1	4
\.


--
-- Data for Name: packs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.packs (pack_id, pack_name, pack_code, card_amount) FROM stdin;
1	Legend of BlueEyes	LOB	10
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, nickname, email, password, created_at, updated_at) FROM stdin;
\.


--
-- Name: accounts_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_account_id_seq', 4, true);


--
-- Name: cards_card_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cards_card_id_seq', 126, true);


--
-- Name: pack_codes_pack_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pack_codes_pack_code_id_seq', 4, true);


--
-- Name: packs_pack_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.packs_pack_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: accounts accounts_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_email_key UNIQUE (email);


--
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (account_id);


--
-- Name: api_keys api_keys_account_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_keys
    ADD CONSTRAINT api_keys_account_id_key UNIQUE (account_id);


--
-- Name: cards cards_card_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_card_name_key UNIQUE (card_name);


--
-- Name: cards cards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_pkey PRIMARY KEY (card_id);


--
-- Name: pack_codes pack_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pack_codes
    ADD CONSTRAINT pack_codes_pkey PRIMARY KEY (pack_code_id);


--
-- Name: packs packs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.packs
    ADD CONSTRAINT packs_pkey PRIMARY KEY (pack_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_nickname_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nickname_key UNIQUE (nickname);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

