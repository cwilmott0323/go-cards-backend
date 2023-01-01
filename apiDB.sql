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

--
-- Name: purgeratelimitdata(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.purgeratelimitdata() RETURNS trigger
    LANGUAGE plpgsql
    AS $$ begin delete from rate_limiting where last_request < now() - interval '1 minutes'; RETURN NULL; end;$$;


ALTER FUNCTION public.purgeratelimitdata() OWNER TO postgres;

--
-- Name: updateavgscore(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.updateavgscore() RETURNS trigger
    LANGUAGE plpgsql
    AS $$ BEGIN /*YOUR lOGIC HERE*/ END; $$;


ALTER FUNCTION public.updateavgscore() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: account_card_maps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_card_maps (
    account_id integer NOT NULL,
    card_id integer NOT NULL,
    count integer NOT NULL
);


ALTER TABLE public.account_card_maps OWNER TO postgres;

--
-- Name: accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts (
    account_id integer NOT NULL,
    username character varying(64) NOT NULL,
    password character varying NOT NULL,
    email character varying(255) NOT NULL,
    created_on timestamp without time zone NOT NULL,
    last_login timestamp without time zone NOT NULL
);


ALTER TABLE public.accounts OWNER TO postgres;

--
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_id_seq OWNER TO postgres;

--
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_id_seq OWNED BY public.accounts.account_id;


--
-- Name: api_keys; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_keys (
    account_id character varying NOT NULL,
    api_key character varying,
    inserted timestamp without time zone
);


ALTER TABLE public.api_keys OWNER TO postgres;

--
-- Name: cards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cards (
    card_id integer NOT NULL,
    name character varying(128) NOT NULL,
    attack integer NOT NULL,
    defence integer NOT NULL,
    description character varying(1024),
    ability character varying(64000),
    typing character varying(64) NOT NULL,
    rarity character varying(64) NOT NULL,
    type character varying(100) NOT NULL,
    set character varying(1024) NOT NULL
);


ALTER TABLE public.cards OWNER TO postgres;

--
-- Name: cards_card_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cards_card_id_seq
    AS integer
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
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups (
    group_id integer NOT NULL,
    group_name character varying(255)
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- Name: groups_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.groups_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_group_id_seq OWNER TO postgres;

--
-- Name: groups_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.groups_group_id_seq OWNED BY public.groups.group_id;


--
-- Name: pack_codes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pack_codes (
    pack_code_id integer NOT NULL,
    pack_code_key character varying(64),
    pack_id integer,
    account_id integer
);


ALTER TABLE public.pack_codes OWNER TO postgres;

--
-- Name: pack_codes_pack_code_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pack_codes_pack_code_id_seq
    AS integer
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
    pack_id integer NOT NULL,
    pack_name character varying(1024),
    pack_code character varying,
    card_amount integer
);


ALTER TABLE public.packs OWNER TO postgres;

--
-- Name: packs_pack_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.packs_pack_id_seq
    AS integer
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
-- Name: rate_limiting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rate_limiting (
    ip character(50),
    count integer,
    last_request timestamp without time zone
);


ALTER TABLE public.rate_limiting OWNER TO postgres;

--
-- Name: user_group_map; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_group_map (
    group_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.user_group_map OWNER TO postgres;

--
-- Name: user_group_map_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_group_map_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_group_map_group_id_seq OWNER TO postgres;

--
-- Name: user_group_map_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_group_map_group_id_seq OWNED BY public.user_group_map.group_id;


--
-- Name: user_group_map_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_group_map_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_group_map_user_id_seq OWNER TO postgres;

--
-- Name: user_group_map_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_group_map_user_id_seq OWNED BY public.user_group_map.user_id;


--
-- Name: accounts account_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts ALTER COLUMN account_id SET DEFAULT nextval('public.accounts_id_seq'::regclass);


--
-- Name: cards card_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards ALTER COLUMN card_id SET DEFAULT nextval('public.cards_card_id_seq'::regclass);


--
-- Name: groups group_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups ALTER COLUMN group_id SET DEFAULT nextval('public.groups_group_id_seq'::regclass);


--
-- Name: pack_codes pack_code_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pack_codes ALTER COLUMN pack_code_id SET DEFAULT nextval('public.pack_codes_pack_code_id_seq'::regclass);


--
-- Name: packs pack_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.packs ALTER COLUMN pack_id SET DEFAULT nextval('public.packs_pack_id_seq'::regclass);


--
-- Name: user_group_map group_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_group_map ALTER COLUMN group_id SET DEFAULT nextval('public.user_group_map_group_id_seq'::regclass);


--
-- Name: user_group_map user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_group_map ALTER COLUMN user_id SET DEFAULT nextval('public.user_group_map_user_id_seq'::regclass);


--
-- Data for Name: account_card_maps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_card_maps (account_id, card_id, count) FROM stdin;
26	57	1
26	99	1
26	70	1
26	17	1
26	65	1
26	119	1
26	82	2
26	14	1
26	116	1
26	114	1
26	88	1
26	22	1
26	71	1
26	126	2
26	16	1
26	103	1
26	39	1
26	36	1
26	76	1
26	73	1
26	25	2
26	30	2
26	26	2
26	66	1
26	105	1
26	84	1
26	59	1
26	79	1
26	75	2
26	46	3
26	96	1
26	64	1
26	115	3
26	78	1
26	9	1
26	12	1
26	111	2
26	51	1
26	92	2
26	28	1
26	72	2
26	48	1
26	24	1
26	19	2
26	13	1
26	97	1
\.


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts (account_id, username, password, email, created_on, last_login) FROM stdin;
26	cwilmott	$2a$10$KL9drl5bXN1QjVaJwESix.GE7HoxcV5aoRrfBTdoGFXqlhSqMmCom	wilmott@live.co.uk	2022-12-17 15:59:50.268176	2022-12-17 15:59:50.268176
27	cwilmottt	$2a$10$6az1ltFEkhrMH1i511O/Lu4vYo5Nv3ud3d6TfLcMXhbaAH4QBAcLi	wilmott@live.co.uk.uk	2022-12-17 16:09:09.098272	2022-12-17 16:09:09.098272
\.


--
-- Data for Name: api_keys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_keys (account_id, api_key, inserted) FROM stdin;
17	UCAIJFA456Q6AINB	2021-09-27 03:53:28.768006
16	5NQVOGBHTAT2JQAO	2021-09-27 04:05:21.032079
18	2F2ON3KCWUB27QX7	2021-09-27 04:09:19.591818
19	2HA4IXAM6QHKAUU5	2021-09-27 04:09:32.580094
\.


--
-- Data for Name: cards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cards (card_id, name, attack, defence, description, ability, typing, rarity, type, set) FROM stdin;
1	Aqua Madoor	1200	2000	A wizard of the waters that conjures a liquid wall to crush any enemies that oppose him.		Spellcaster	Rare	Normal Monster	Legend of Blue Eyes White Dragon
2	Armaill	700	1300	A strange warrior who manipulates three deadly blades with both hands and his tail.		Warrior	Common	Normal Monster	Legend of Blue Eyes White Dragon
3	Armed Ninja	300	300	FLIP: Target 1 Spell Card on the field; destroy that target. (If the target is Set, reveal it, and destroy it if it is a Spell Card. Otherwise, return it to its original position.)		Warrior	Rare	Flip Effect Monster	Legend of Blue Eyes White Dragon
4	Armored Starfish	850	1400	A bluish starfish with a solid hide capable of fending off attacks.		Aqua	Common	Normal Monster	Legend of Blue Eyes White Dragon
5	Basic Insect	500	700	Usually found traveling in swarms, this creatures ideal environment is the forest.		Insect	Common	Normal Monster	Legend of Blue Eyes White Dragon
6	Beast Fangs	0	0	A Beast-Type monster equipped with this card increases its ATK and DEF by 300 points.		Equip	Short Print	Spell Card	Legend of Blue Eyes White Dragon
7	Beaver Warrior	1200	1500	What this creature lacks in size it makes up for in defense when battling in the prairie.		Beast-Warrior	Common	Normal Monster	Legend of Blue Eyes White Dragon
8	Blue-Eyes White Dragon	3000	2500	This legendary dragon is a powerful engine of destruction. Virtually invincible, very few have faced this awesome creature and lived to tell the tale.		Dragon	Ultra Rare	Normal Monster	Legend of Blue Eyes White Dragon
9	Book of Secret Arts	0	0	A Spellcaster-Type monster equipped with this card increases its ATK and DEF by 300 points.		Equip	Short Print	Spell Card	Legend of Blue Eyes White Dragon
10	Celtic Guardian	1400	1200	An elf who learned to wield a sword, he baffles enemies with lightning-swift attacks.		Warrior	Super Rare	Normal Monster	Legend of Blue Eyes White Dragon
11	Charubin the Fire Knight	1100	800	"Monster Egg" + "Hinotama Soul"		Pyro	Rare	Fusion Monster	Legend of Blue Eyes White Dragon
12	Curse of Dragon	2000	1500	A wicked dragon that taps into dark forces to execute a powerful attack.		Dragon	Super Rare	Normal Monster	Legend of Blue Eyes White Dragon
13	Dark Energy	0	0	Increase the ATK and DEF of a Fiend-Type monster equipped with this card by 300 points.		Equip	Short Print	Spell Card	Legend of Blue Eyes White Dragon
14	Dark Gray	800	900	Entirely gray, this beast has rarely been seen by mortal eyes.		Beast	Common	Normal Monster	Legend of Blue Eyes White Dragon
15	Dark Hole	0	0	Destroy all monsters on the field.		Normal	Super Rare	Spell Card	Legend of Blue Eyes White Dragon
16	Dark King of the Abyss	1200	800	Its said that this King of the Netherworld once had the power to rule over the dark.		Fiend	Common	Normal Monster	Legend of Blue Eyes White Dragon
17	Dark Magician	2500	2100	The ultimate wizard in terms of attack and defense.		Spellcaster	Ultra Rare	Normal Monster	Legend of Blue Eyes White Dragon
18	Darkfire Dragon	1500	1250	"Firegrass" + "Petit Dragon"		Dragon	Rare	Fusion Monster	Legend of Blue Eyes White Dragon
19	Darkworld Thorns	1200	900	A thorny plant found in the darklands that wraps itself around any unwary traveler.		Plant	Common	Normal Monster	Legend of Blue Eyes White Dragon
20	Dissolverock	900	1000	A monster born in the lava pits, it generates intense heat that can melt away its enemies.		Rock	Common	Normal Monster	Legend of Blue Eyes White Dragon
21	Dragon Capture Jar	0	0	Change all face-up Dragon-Type monsters on the field to Defense Position, also they cannot change their battle positions.		Continuous	Rare	Trap Card	Legend of Blue Eyes White Dragon
22	Dragon Treasure	0	0	A Dragon-Type monster equipped with this card increases its ATK and DEF by 300 points.		Equip	Short Print	Spell Card	Legend of Blue Eyes White Dragon
23	Dragoness the Wicked Knight	1200	900	"Armaill" + "One-Eyed Shield Dragon"		Warrior	Rare	Fusion Monster	Legend of Blue Eyes White Dragon
24	Drooling Lizard	900	800	A blood-sucking snake in human form that attacks any living being that passes nearby.		Reptile	Common	Normal Monster	Legend of Blue Eyes White Dragon
25	Electro-Whip	0	0	Increase the ATK and DEF of a Thunder-Type monster equipped with this card by 300 points.		Equip	Common	Spell Card	Legend of Blue Eyes White Dragon
26	Enchanting Mermaid	1200	900	A beautiful mermaid that lures voyagers to a watery grave.		Fish	Common	Normal Monster	Legend of Blue Eyes White Dragon
27	Exodia the Forbidden One	1000	1000		If you have "Right Leg of the Forbidden One", "Left Leg of the Forbidden One", "Right Arm of the Forbidden One" and "Left Arm of the Forbidden One" in addition to this card in your hand, you win the Duel.	Spellcaster	Ultra Rare	Effect Monster	Legend of Blue Eyes White Dragon
28	Fiend Reflection #2	1100	1400	A bird-beast that summons reinforcements with a hand mirror.		Winged Beast	Common	Normal Monster	Legend of Blue Eyes White Dragon
29	Final Flame	0	0	Inflict 600 points of damage to your opponents Life Points.		Normal	Rare	Spell Card	Legend of Blue Eyes White Dragon
30	Firegrass	700	600	A fire-breathing plant found growing near volcanoes.		Plant	Common	Normal Monster	Legend of Blue Eyes White Dragon
31	Fireyarou	1300	1000	A malevolent creature wrapped in flames that attacks enemies with intense fire.		Pyro	Common	Normal Monster	Legend of Blue Eyes White Dragon
32	Fissure	0	0	Destroy the 1 face-up monster your opponent controls that has the lowest ATK (your choice, if tied).		Normal	Rare	Spell Card	Legend of Blue Eyes White Dragon
33	Flame Ghost	1000	800	"Skull Servant" + "Dissolverock"		Zombie	Rare	Fusion Monster	Legend of Blue Eyes White Dragon
34	Flame Manipulator	900	1000	This Spellcaster attacks enemies with fire-related spells such as "Sea of Flames" and "Wall of Fire".		Spellcaster	Common	Normal Monster	Legend of Blue Eyes White Dragon
35	Flame Swordsman	1800	1600	"Flame Manipulator" + "Masaki the Legendary Swordsman"		Warrior	Super Rare	Fusion Monster	Legend of Blue Eyes White Dragon
36	Flower Wolf	1800	1400	"Silver Fang" + "Darkworld Thorns"		Beast	Rare	Fusion Monster	Legend of Blue Eyes White Dragon
37	Follow Wind	0	0	Increase the ATK and DEF of a Winged Beast-Type monster equipped with this card by 300 points.		Equip	Short Print	Spell Card	Legend of Blue Eyes White Dragon
38	Forest	0	0	All Insect, Beast, Plant, and Beast-Warrior monsters on the field gain 200 ATK/DEF.		Field	Common	Spell Card	Legend of Blue Eyes White Dragon
39	Frenzied Panda	1200	1000	A savage beast that carries a big bamboo stick for beating down its enemies.		Beast	Common	Normal Monster	Legend of Blue Eyes White Dragon
40	Fusionist	900	700	"Petit Angel" + "Mystical Sheep #2"		Beast	Rare	Fusion Monster	Legend of Blue Eyes White Dragon
41	Gaia the Dragon Champion	2600	2100	"Gaia The Fierce Knight" + "Curse of Dragon"		Dragon	Secret Rare	Fusion Monster	Legend of Blue Eyes White Dragon
42	Gaia The Fierce Knight	2300	2100	A knight whose horse travels faster than the wind. His battle-charge is a force to be reckoned with.		Warrior	Ultra Rare	Normal Monster	Legend of Blue Eyes White Dragon
43	Giant Soldier of Stone	1300	2000	A giant warrior made of stone. A punch from this creature has earth-shaking results.		Rock	Rare	Normal Monster	Legend of Blue Eyes White Dragon
44	Goblins Secret Remedy	0	0	Increase your Life Points by 600 points.		Normal	Rare	Spell Card	Legend of Blue Eyes White Dragon
45	Gravedigger Ghoul	0	0	Select up to 2 Monster Card(s) from your opponents Graveyard. Remove the selected card(s) from play.		Normal	Rare	Spell Card	Legend of Blue Eyes White Dragon
46	Green Phantom King	500	1600	This youthful king of the forests lives in a green world, abundant with trees and wildlife.		Plant	Common	Normal Monster	Legend of Blue Eyes White Dragon
47	Hane-Hane	450	500	FLIP: Select 1 monster on the field and return it to its owners hand.		Beast	Rare	Flip Effect Monster	Legend of Blue Eyes White Dragon
48	Hard Armor	300	1200	A living suit of armor that attacks enemies with a bone-jarring tackle.		Warrior	Common	Normal Monster	Legend of Blue Eyes White Dragon
49	Hinotama	0	0	Inflict 500 damage to your opponent.		Normal	Common	Spell Card	Legend of Blue Eyes White Dragon
50	Hinotama Soul	600	500	An intensely hot flame creature that rams anything standing in its way.		Pyro	Common	Normal Monster	Legend of Blue Eyes White Dragon
51	Hitotsu-Me Giant	1200	1000	A one-eyed behemoth with thick, powerful arms made for delivering punishing blows.		Beast-Warrior	Common	Normal Monster	Legend of Blue Eyes White Dragon
52	Kagemusha of the Blue Flame	800	400	Serving as a double for the Ruler of the Blue Flame, hes a master swordsman that wields a fine blade.		Warrior	Common	Normal Monster	Legend of Blue Eyes White Dragon
53	Karbonala Warrior	1500	1200	"M-Warrior #1" + "M-Warrior #2"		Warrior	Rare	Fusion Monster	Legend of Blue Eyes White Dragon
54	King Fog	1000	900	A fiend that dwells in a blinding curtain of smoke.		Fiend	Common	Normal Monster	Legend of Blue Eyes White Dragon
55	Kumootoko	700	1400	A massive, intelligent spider that traps enemies with webbing.		Insect	Common	Normal Monster	Legend of Blue Eyes White Dragon
56	Kurama	800	800	A vicious bird that attacks from the skies with its whip-like tail.		Winged Beast	Common	Normal Monster	Legend of Blue Eyes White Dragon
57	Larvas	800	1000	A fast-moving, bird-like creature that strangles opposing monsters with its long, thin arms.		Beast	Common	Normal Monster	Legend of Blue Eyes White Dragon
58	Laser Cannon Armor	0	0	Equip only to an Insect monster. It gains 300 ATK/DEF.		Equip	Short Print	Spell Card	Legend of Blue Eyes White Dragon
59	Left Arm of the Forbidden One	200	300	A forbidden left arm sealed by magic. Whosoever breaks this seal will know infinite power.		Spellcaster	Ultra Rare	Normal Monster	Legend of Blue Eyes White Dragon
60	Left Leg of the Forbidden One	200	300	A forbidden left leg sealed by magic. Whosoever breaks this seal will know infinite power.		Spellcaster	Ultra Rare	Normal Monster	Legend of Blue Eyes White Dragon
61	Legendary Sword	0	0	Equip only to a Warrior monster. It gains 300 ATK/DEF.		Equip	Short Print	Spell Card	Legend of Blue Eyes White Dragon
62	Lesser Dragon	1200	1000	A minor dragon incapable of breathing fire.		Dragon	Common	Normal Monster	Legend of Blue Eyes White Dragon
63	M-Warrior #1	1000	500	Specializing in combination attacks, this warrior uses magnetism to block an enemys escape.		Warrior	Common	Normal Monster	Legend of Blue Eyes White Dragon
64	M-Warrior #2	500	1000	Specializing in combination attacks, this warrior is equipped with a tough, magnetically coated armor.		Warrior	Common	Normal Monster	Legend of Blue Eyes White Dragon
65	Machine Conversion Factory	0	0	Equip only to a Machine monster. It gains 300 ATK/DEF.		Equip	Short Print	Spell Card	Legend of Blue Eyes White Dragon
66	Mammoth Graveyard	1200	800	A mammoth that protects the graves of its pack and is absolutely merciless when facing grave-robbers.		Dinosaur	Common	Normal Monster	Legend of Blue Eyes White Dragon
67	Man Eater	800	600	Man-eating plant with poison feelers for attacking enemies.		Plant	Common	Normal Monster	Legend of Blue Eyes White Dragon
68	Man-Eater Bug	450	600	FLIP: Target 1 monster on the field; destroy it.		Insect	Super Rare	Flip Effect Monster	Legend of Blue Eyes White Dragon
69	Masaki the Legendary Swordsman	1100	1100	Legendary swordmaster Masaki is a veteran of over 100 battles.		Warrior	Common	Normal Monster	Legend of Blue Eyes White Dragon
70	Meda Bat	800	400	An eyeball fiend created by a servant of the wicked, it uses "Dark Blasts" to blow away its enemies.		Fiend	Common	Normal Monster	Legend of Blue Eyes White Dragon
71	Metal Dragon	1850	1700	"Steel Ogre Grotto #1" + "Lesser Dragon"		Machine	Rare	Fusion Monster	Legend of Blue Eyes White Dragon
72	Misairuzame	1400	1600	A missile-launching fish protected by deadly spikes.		Fish	Common	Normal Monster	Legend of Blue Eyes White Dragon
73	Monster Egg	600	900	A warrior hidden within an egg that attacks enemies by flinging eggshells.		Warrior	Common	Normal Monster	Legend of Blue Eyes White Dragon
74	Monster Reborn	0	0	Target 1 monster in either GY; Special Summon it.		Normal	Ultra Rare	Spell Card	Legend of Blue Eyes White Dragon
75	Mountain	0	0	All Dragon, Winged Beast, and Thunder monsters on the field gain 200 ATK/DEF.		Field	Common	Spell Card	Legend of Blue Eyes White Dragon
76	Mystical Elf	800	2000	A delicate elf that lacks offense, but has a terrific defense backed by mystical power.		Spellcaster	Super Rare	Normal Monster	Legend of Blue Eyes White Dragon
77	Mystical Moon	0	0	Equip only to a Beast-Warrior-Type monster. It gains 300 ATK and DEF.		Equip	Short Print	Spell Card	Legend of Blue Eyes White Dragon
78	Mystical Sheep #2	800	1000	A monstrous sheep with a long tail for hypnotizing enemies.		Beast	Common	Normal Monster	Legend of Blue Eyes White Dragon
79	Nemuriko	800	700	A child-like creature that controls a sleep fiend to beckon enemies into eternal slumber.		Spellcaster	Common	Normal Monster	Legend of Blue Eyes White Dragon
80	One-Eyed Shield Dragon	700	1300	This dragon wears a shield not only for its own protection, but also for ramming its enemies.		Dragon	Common	Normal Monster	Legend of Blue Eyes White Dragon
81	Petit Angel	600	900	A quick-moving and tiny fairy thats very difficult to hit.		Fairy	Common	Normal Monster	Legend of Blue Eyes White Dragon
82	Petit Dragon	600	700	A very small dragon known for its vicious attacks.		Dragon	Common	Normal Monster	Legend of Blue Eyes White Dragon
83	Polymerization	0	0	Fusion Summon 1 Fusion Monster from your Extra Deck, using monsters from your hand or field as Fusion Material.		Normal	Super Rare	Spell Card	Legend of Blue Eyes White Dragon
84	Pot of Greed	0	0	Draw 2 cards.		Normal	Rare	Spell Card	Legend of Blue Eyes White Dragon
85	Power of Kaishin	0	0	Equip only to an Aqua monster. It gains 300 ATK/DEF.		Equip	Short Print	Spell Card	Legend of Blue Eyes White Dragon
86	Raigeki	0	0	Destroy all monsters your opponent controls.		Normal	Super Rare	Spell Card	Legend of Blue Eyes White Dragon
87	Raise Body Heat	0	0	Equip only to a Dinosaur monster. It gains 300 ATK/DEF.		Equip	Short Print	Spell Card	Legend of Blue Eyes White Dragon
88	Ray & Temperature	1000	1000	The Sun and the North Wind join hands to deliver a devastating combination of heat and gale-force winds.		Fairy	Common	Normal Monster	Legend of Blue Eyes White Dragon
89	Reaper of the Cards	1380	1930	FLIP: Select 1 Trap Card on the field and destroy it. If the selected card is Set, pick up and see the card. If it is a Trap Card, it is destroyed. If it is a Spell Card, return it to its original position.		Fiend	Rare	Flip Effect Monster	Legend of Blue Eyes White Dragon
90	Red Medicine	0	0	Increase your Life Points by 500 points.		Normal	Common	Spell Card	Legend of Blue Eyes White Dragon
91	Red-Eyes Black Dragon	2400	2000	'A ferocious dragon with a deadly attack.'		Dragon	Ultra Rare	Normal Monster	Legend of Blue Eyes White Dragon
92	Remove Trap	0	0	Select 1 face-up Trap Card on the field and destroy it.		Normal	Common	Spell Card	Legend of Blue Eyes White Dragon
93	Right Arm of the Forbidden One	200	300	A forbidden right arm sealed by magic. Whosoever breaks this seal will know infinite power.		Spellcaster	Ultra Rare	Normal Monster	Legend of Blue Eyes White Dragon
94	Right Leg of the Forbidden One	200	300	A forbidden right leg sealed by magic. Whosoever breaks this seal will know infinite power.		Spellcaster	Ultra Rare	Normal Monster	Legend of Blue Eyes White Dragon
95	Root Water	900	800	An amphibian capable of calling up a massive tidal wave from the dark seas to wipe out enemy monsters.		Fish	Common	Normal Monster	Legend of Blue Eyes White Dragon
96	Sand Stone	1300	1600	Appears from underground and attacks with long, snake-like tentacles.		Rock	Common	Normal Monster	Legend of Blue Eyes White Dragon
97	Silver Bow and Arrow	0	0	A Fairy-Type monster equipped with this card increases its ATK and DEF by 300 points.		Equip	Short Print	Spell Card	Legend of Blue Eyes White Dragon
98	Silver Fang	1200	800	A snow wolf thats beautiful to the eye, but absolutely vicious in battle.		Beast	Common	Normal Monster	Legend of Blue Eyes White Dragon
99	Skull Red Bird	1550	1200	This monster swoops down and attacks with a rain of knives stored in its wings.		Winged Beast	Common	Normal Monster	Legend of Blue Eyes White Dragon
100	Skull Servant	300	200	A skeletal ghost that isnt strong but can mean trouble in large numbers.		Zombie	Common	Normal Monster	Legend of Blue Eyes White Dragon
101	Sogen	0	0	All Warrior and Beast-Warrior monsters on the field gain 200 ATK/DEF.		Field	Common	Spell Card	Legend of Blue Eyes White Dragon
102	Sparks	0	0	Inflict 200 points of damage to your opponents Life Points.		Normal	Common	Spell Card	Legend of Blue Eyes White Dragon
103	Spike Seadra	1600	1300	Using the spikes sprouting from its body, this creature stabs its opponents and floods them with electricity.		Sea Serpent	Common	Normal Monster	Legend of Blue Eyes White Dragon
104	Spirit of the Harp	800	2000	A spirit that soothes the soul with the music of its heavenly harp.		Fairy	Rare	Normal Monster	Legend of Blue Eyes White Dragon
105	Steel Ogre Grotto #1	1400	1800	A steel idol worshipped in the Land of Machines.		Machine	Common	Normal Monster	Legend of Blue Eyes White Dragon
106	Stop Defense	0	0	Select 1 Defense Position monster on your opponents side of the field and change it to Attack Position.		Normal	Rare	Spell Card	Legend of Blue Eyes White Dragon
107	Succubus Knight	1650	1300	A warrior wizard adept in casting bone-chilling spells.		Warrior	Common	Normal Monster	Legend of Blue Eyes White Dragon
108	Swords of Revealing Light	0	0	After this cards activation, it remains on the field, but you must destroy it during the End Phase of your opponents 3rd turn. When this card is activated: If your opponent controls a face-down monster, flip all monsters they control face-up. While this card is face-up on the field, your opponents monsters cannot declare an attack.		Normal	Super Rare	Spell Card	Legend of Blue Eyes White Dragon
109	Terra the Terrible	1200	1300	Known as a swamp dweller, this creature is a minion of the dark forces.		Fiend	Common	Normal Monster	Legend of Blue Eyes White Dragon
110	The 13th Grave	1200	900	A zombie that suddenly appeared from plot #13 - an empty grave.		Zombie	Common	Normal Monster	Legend of Blue Eyes White Dragon
111	The Furious Sea King	800	700	Grand King of the Seven Seas, hes able to summon massive tidal waves to drown the enemy.		Aqua	Common	Normal Monster	Legend of Blue Eyes White Dragon
112	Trap Hole	0	0	When your opponent Normal or Flip Summons 1 monster with 1000 or more ATK: Target that monster; destroy that target.		Normal	Super Rare	Trap Card	Legend of Blue Eyes White Dragon
113	Tri-Horned Dragon	2850	2350	An unworthy dragon with three sharp horns sprouting from its head.		Dragon	Secret Rare	Normal Monster	Legend of Blue Eyes White Dragon
114	Trial of Nightmare	1300	900	This fiend passes judgment on enemies that are locked in coffins.		Fiend	Common	Normal Monster	Legend of Blue Eyes White Dragon
115	Tripwire Beast	1200	1300	This creature attacks with electromagnetic waves.		Thunder	Common	Normal Monster	Legend of Blue Eyes White Dragon
116	Turtle Tiger	1000	1500	A tiger encased in a protective shell that attacks with razor-sharp fangs.		Aqua	Common	Normal Monster	Legend of Blue Eyes White Dragon
117	Two-Mouth Darkruler	900	700	A dinosaur with two deadly jaws, it stores electricity in its horn and releases high voltage bolts from the mouth on its back.		Dinosaur	Common	Normal Monster	Legend of Blue Eyes White Dragon
118	Two-Pronged Attack	0	0	Select and destroy 2 of your monsters and 1 of your opponents monsters.		Normal	Rare	Trap Card	Legend of Blue Eyes White Dragon
119	Tyhone	1200	1400	Capable of firing cannonballs from its mouth for long-range attacks, this creature is particularly effective in mountain battles.		Winged Beast	Common	Normal Monster	Legend of Blue Eyes White Dragon
120	Umi	0	0	All Fish, Sea Serpent, Thunder, and Aqua monsters on the field gain 200 ATK/DEF, also all Machine and Pyro monsters on the field lose 200 ATK/DEF.		Field	Common	Spell Card	Legend of Blue Eyes White Dragon
121	Uraby	1500	800	Fast on its feet, this dinosaur rips enemies to shreds with its sharp claws.		Dinosaur	Common	Normal Monster	Legend of Blue Eyes White Dragon
122	Vile Germs	0	0	A Plant-Type monster equipped with this card increases its ATK and DEF by 300 points.		Equip	Short Print	Spell Card	Legend of Blue Eyes White Dragon
123	Violet Crystal	0	0	This card is not treated as a "Crystal" card. Equip only to a Zombie monster. It gains 300 ATK/DEF.		Equip	Short Print	Spell Card	Legend of Blue Eyes White Dragon
124	Wasteland	0	0	All Dinosaur, Zombie, and Rock monsters on the field gain 200 ATK/DEF.		Field	Common	Spell Card	Legend of Blue Eyes White Dragon
125	Witty Phantom	1400	1300	Dressed in a night-black tuxedo, this creature presides over the darkness.		Fiend	Common	Normal Monster	Legend of Blue Eyes White Dragon
126	Yami	0	0	All Fiend and Spellcaster monsters on the field gain 200 ATK/DEF, also all Fairy monsters on the field lose 200 ATK/DEF.		Field	Common	Spell Card	Legend of Blue Eyes White Dragon
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groups (group_id, group_name) FROM stdin;
1	calls
2	texts
\.


--
-- Data for Name: pack_codes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pack_codes (pack_code_id, pack_code_key, pack_id, account_id) FROM stdin;
\.


--
-- Data for Name: packs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.packs (pack_id, pack_name, pack_code, card_amount) FROM stdin;
1	Legend of Blue Eyes White Dragon	LOB	10
\.


--
-- Data for Name: rate_limiting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rate_limiting (ip, count, last_request) FROM stdin;
\.


--
-- Data for Name: user_group_map; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_group_map (group_id, user_id) FROM stdin;
1	1
2	1
2	2
1	1
2	1
2	2
1	1
2	1
2	2
\.


--
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_id_seq', 19, true);


--
-- Name: cards_card_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cards_card_id_seq', 433, true);


--
-- Name: groups_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.groups_group_id_seq', 1, false);


--
-- Name: pack_codes_pack_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pack_codes_pack_code_id_seq', 25, true);


--
-- Name: packs_pack_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.packs_pack_id_seq', 1, true);


--
-- Name: user_group_map_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_group_map_group_id_seq', 1, false);


--
-- Name: user_group_map_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_group_map_user_id_seq', 1, false);


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
-- Name: accounts accounts_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_username_key UNIQUE (username);


--
-- Name: api_keys api_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_keys
    ADD CONSTRAINT api_keys_pkey PRIMARY KEY (account_id);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (group_id);


--
-- Name: rate_limiting purgeratelimitdatatrigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER purgeratelimitdatatrigger AFTER INSERT OR UPDATE ON public.rate_limiting FOR EACH STATEMENT EXECUTE FUNCTION public.purgeratelimitdata();


--
-- PostgreSQL database dump complete
--

