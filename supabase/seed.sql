SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.8
-- Dumped by pg_dump version 15.8

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
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."audit_log_entries" ("instance_id", "id", "payload", "created_at", "ip_address") VALUES
	('00000000-0000-0000-0000-000000000000', 'e974997a-0f38-478d-a746-162d673b8c13', '{"action":"user_confirmation_requested","actor_id":"28db9a98-e994-4713-a7c3-682f4a904a2e","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-06-24 06:09:28.160887+00', ''),
	('00000000-0000-0000-0000-000000000000', 'afb0878c-256c-4ff0-b836-f4b92e97ec40', '{"action":"user_signedup","actor_id":"28db9a98-e994-4713-a7c3-682f4a904a2e","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"team"}', '2025-06-24 06:19:41.070015+00', ''),
	('00000000-0000-0000-0000-000000000000', '5d58a62a-b4d4-4952-8f6a-5cde51f950c7', '{"action":"login","actor_id":"28db9a98-e994-4713-a7c3-682f4a904a2e","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 06:28:31.15349+00', ''),
	('00000000-0000-0000-0000-000000000000', '44884308-48b6-45a6-883e-410c787e6246', '{"action":"logout","actor_id":"28db9a98-e994-4713-a7c3-682f4a904a2e","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-06-24 06:33:50.898245+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b77d424c-13e7-48fd-a688-4da466262d10', '{"action":"user_confirmation_requested","actor_id":"5b2c76b1-dae6-4111-820b-6c2c4677c6d8","actor_username":"fschuchardt@cad-schroer.de","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-06-24 06:34:12.267816+00', ''),
	('00000000-0000-0000-0000-000000000000', '326876b4-2645-4540-9150-557fa01479b3', '{"action":"user_confirmation_requested","actor_id":"5b2c76b1-dae6-4111-820b-6c2c4677c6d8","actor_username":"fschuchardt@cad-schroer.de","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-06-24 06:35:47.097745+00', ''),
	('00000000-0000-0000-0000-000000000000', '60abf80a-7367-414a-8669-94bb372ba196', '{"action":"user_confirmation_requested","actor_id":"5b2c76b1-dae6-4111-820b-6c2c4677c6d8","actor_username":"fschuchardt@cad-schroer.de","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-06-24 06:37:19.814321+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd85431d9-d765-4091-b54b-bb73c3c4c5af', '{"action":"user_confirmation_requested","actor_id":"5b2c76b1-dae6-4111-820b-6c2c4677c6d8","actor_username":"fschuchardt@cad-schroer.de","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-06-24 06:45:12.060195+00', ''),
	('00000000-0000-0000-0000-000000000000', '36a31186-20fc-4bf6-9c04-be5c439701fc', '{"action":"user_confirmation_requested","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-06-24 06:46:08.131017+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd3016168-f310-4638-b9ed-5e5887e4a8be', '{"action":"user_confirmation_requested","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-06-24 06:47:17.937409+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a376d27e-fe87-47e2-8fc9-a10fd17d89bb', '{"action":"user_confirmation_requested","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-06-24 06:48:19.20018+00', ''),
	('00000000-0000-0000-0000-000000000000', '2d7439b8-2956-4bd6-a35b-fe0f485244d5', '{"action":"user_signedup","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"team"}', '2025-06-24 06:51:53.336746+00', ''),
	('00000000-0000-0000-0000-000000000000', '73d2fa9d-818b-415f-a971-6bf671e47b16', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 06:51:59.323255+00', ''),
	('00000000-0000-0000-0000-000000000000', '789b4dfa-35c0-483a-b9aa-0661164bca17', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 07:21:24.369396+00', ''),
	('00000000-0000-0000-0000-000000000000', '512dbc1a-9bbe-4f1e-9cfb-f85d39c1ca1d', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 07:22:53.200366+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bcf08e17-74f9-48b8-b680-ae1ad1b0f59f', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 08:43:52.678922+00', ''),
	('00000000-0000-0000-0000-000000000000', '253e1a97-44d3-48dd-8a29-49a1b37aa0e7', '{"action":"token_refreshed","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-06-24 08:52:00.574072+00', ''),
	('00000000-0000-0000-0000-000000000000', '8802c6a0-2881-4da1-8089-fc79e25ca7be', '{"action":"token_revoked","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-06-24 08:52:00.575853+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e2fba8a5-1af7-441a-a355-2db131aec2e3', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 08:52:27.481806+00', ''),
	('00000000-0000-0000-0000-000000000000', '76b95e10-0b4e-4751-8c4b-8935091ac352', '{"action":"logout","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-06-24 08:59:10.385271+00', ''),
	('00000000-0000-0000-0000-000000000000', '8f764ea6-08be-45a2-b210-1681d7cc078a', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 08:59:16.357089+00', ''),
	('00000000-0000-0000-0000-000000000000', '32802d69-ddb9-41bd-9813-835218a5054e', '{"action":"logout","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-06-24 09:11:12.007852+00', ''),
	('00000000-0000-0000-0000-000000000000', '111e914f-646d-4686-b55e-29d2db437d69', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 09:11:17.570135+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c6deb36c-f006-47d7-a970-3291d336d60b', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 09:25:48.93519+00', ''),
	('00000000-0000-0000-0000-000000000000', '73a1c1fe-2cf0-4bf5-a032-ac3bd253be17', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 09:28:28.052466+00', ''),
	('00000000-0000-0000-0000-000000000000', '753e8840-d9ed-4272-a8be-342e118f7c75', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 09:30:20.780286+00', ''),
	('00000000-0000-0000-0000-000000000000', 'dfd01afd-a326-4c10-a95b-02b1bf05648b', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 09:36:59.365059+00', ''),
	('00000000-0000-0000-0000-000000000000', '9fee3cc2-d27b-4b46-9f0d-8cbb7c520c81', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 09:37:15.683214+00', ''),
	('00000000-0000-0000-0000-000000000000', '2b999e52-b0ab-4c30-a8ac-215e9a36f210', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 09:38:01.236074+00', ''),
	('00000000-0000-0000-0000-000000000000', '2e67b072-d0c6-4ffc-af82-be6c15438840', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 09:38:27.758451+00', ''),
	('00000000-0000-0000-0000-000000000000', '31d4a5ef-cc87-4fc9-bfc9-52fd228d55b2', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 09:39:48.239741+00', ''),
	('00000000-0000-0000-0000-000000000000', '081ab0ab-681a-4182-a3f0-4cffe4183b0e', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 09:41:19.745034+00', ''),
	('00000000-0000-0000-0000-000000000000', 'edef3a20-a4a3-48a6-8b52-6e0f87bc2fe7', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 09:43:52.964203+00', ''),
	('00000000-0000-0000-0000-000000000000', '49daccbb-4ac0-4759-9897-1ad3848161e6', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 09:47:01.461484+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fbaa0e97-1592-4875-a308-32de0f59f8cd', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 10:01:35.407907+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd6b07d42-ec98-4319-a18b-dc81a4d865fa', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 10:02:07.010137+00', ''),
	('00000000-0000-0000-0000-000000000000', '8aa42e31-687f-48e3-9823-979f68b4e250', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 10:03:21.112053+00', ''),
	('00000000-0000-0000-0000-000000000000', '18661f3c-7d47-4a82-ae18-d0b43607957e', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 10:06:45.801386+00', ''),
	('00000000-0000-0000-0000-000000000000', '8918320c-be34-4e92-bf34-87206f65fab3', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 10:10:13.604443+00', ''),
	('00000000-0000-0000-0000-000000000000', '6787107d-cc7f-4899-92d2-b21ee616b66d', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 10:12:11.50587+00', ''),
	('00000000-0000-0000-0000-000000000000', '565d2858-8230-44b1-886a-cc1d32c63db1', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 10:15:19.447425+00', ''),
	('00000000-0000-0000-0000-000000000000', 'aac6c339-3f6d-4fe7-a396-260fc3550ac8', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 10:15:38.678566+00', ''),
	('00000000-0000-0000-0000-000000000000', '596b56e4-bca1-49c7-9afe-b3214d5ade00', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 10:49:19.281803+00', ''),
	('00000000-0000-0000-0000-000000000000', '50a54653-8e5d-41fe-97fa-297580679156', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 10:51:11.732031+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd3fc508a-2936-400a-b2fd-907eed6b75cc', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 10:51:40.974095+00', ''),
	('00000000-0000-0000-0000-000000000000', '90443e01-4f1e-41aa-aa6c-be5b31662aa4', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 10:53:25.404203+00', ''),
	('00000000-0000-0000-0000-000000000000', '894b4fbd-85a2-4662-962e-0fa90bd9d784', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 11:17:33.010174+00', ''),
	('00000000-0000-0000-0000-000000000000', '57b932cb-f7d8-495b-bd57-1861a116d1d0', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 11:22:28.186462+00', ''),
	('00000000-0000-0000-0000-000000000000', '2edb4d22-c400-46ed-8478-99edfaed24fd', '{"action":"logout","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-06-24 11:32:07.461212+00', ''),
	('00000000-0000-0000-0000-000000000000', '14aa2ab5-8c05-46b4-803e-9cca39edbcf3', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 11:32:26.395222+00', ''),
	('00000000-0000-0000-0000-000000000000', '9bd55357-4087-40ce-9f71-8ee2b986b048', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 11:36:42.944767+00', ''),
	('00000000-0000-0000-0000-000000000000', '0580842f-0c02-4c93-b589-92cfb8b6e9ab', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 11:40:54.302084+00', ''),
	('00000000-0000-0000-0000-000000000000', '903a8c0d-2519-4f64-bc8a-646085e0070d', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 11:52:08.790926+00', ''),
	('00000000-0000-0000-0000-000000000000', '7a51fb7a-6fff-4a5b-bde4-5daf3832c55a', '{"action":"logout","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-06-24 11:52:17.293746+00', ''),
	('00000000-0000-0000-0000-000000000000', '86a125d7-ca1b-4c1f-89a4-6c081fdfce16', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 11:53:05.065047+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c0c9a541-ffb5-4467-aa39-ed3f9b8ffc5f', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 12:00:19.979961+00', ''),
	('00000000-0000-0000-0000-000000000000', '845a3696-6438-4245-b337-e98b5e967fee', '{"action":"logout","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-06-24 12:57:55.544734+00', ''),
	('00000000-0000-0000-0000-000000000000', '81885fe8-083f-413c-bad6-833925b3e013', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 13:00:23.400366+00', ''),
	('00000000-0000-0000-0000-000000000000', '932c8715-c2f8-4087-88fe-cd26b96950bc', '{"action":"logout","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-06-24 13:01:34.462565+00', ''),
	('00000000-0000-0000-0000-000000000000', '588e7cc2-3787-4eaf-adc1-92dcf38fc90d', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 13:11:46.635867+00', ''),
	('00000000-0000-0000-0000-000000000000', '06355ec9-549f-4b49-b97b-c4e19bfb5197', '{"action":"logout","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-06-24 13:24:54.693815+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cafcf7b6-2864-40bc-bf5c-91f93b2c1a21', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 13:37:39.619444+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fc3afa8e-539b-4a1d-9659-de8e2b612f20', '{"action":"logout","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-06-24 13:58:23.149473+00', ''),
	('00000000-0000-0000-0000-000000000000', '8e401b69-7fef-4fa9-adc5-bbe142742fa4', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 13:58:27.871698+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fc3dad08-83bd-4bd5-90d2-3f07a3e90617', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 14:17:00.346079+00', ''),
	('00000000-0000-0000-0000-000000000000', '05426528-65d3-4402-a926-af671c701f57', '{"action":"token_refreshed","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-06-24 16:53:41.173916+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b67ccfa2-9090-4b80-a33e-ef8dd49023a1', '{"action":"token_revoked","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-06-24 16:53:41.17761+00', ''),
	('00000000-0000-0000-0000-000000000000', '411d50b4-26ec-4c18-be91-b457a29a2e6d', '{"action":"logout","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-06-24 16:53:41.427873+00', ''),
	('00000000-0000-0000-0000-000000000000', '9944b38b-d9e1-45cc-b7e1-af1982755dff', '{"action":"user_confirmation_requested","actor_id":"4f46e0a2-6887-47db-9e69-8b84ce1999d7","actor_username":"daniela.schuchardt@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-06-24 16:54:36.890414+00', ''),
	('00000000-0000-0000-0000-000000000000', 'caab607f-840b-40d2-a7b0-055da0411f08', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 16:55:14.038333+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b11837d9-2204-41ee-a60d-c746ff3c7348', '{"action":"user_signedup","actor_id":"4f46e0a2-6887-47db-9e69-8b84ce1999d7","actor_username":"daniela.schuchardt@gmail.com","actor_via_sso":false,"log_type":"team"}', '2025-06-24 16:55:36.694175+00', ''),
	('00000000-0000-0000-0000-000000000000', '277477bb-4950-49b5-ac92-0f33ca271c75', '{"action":"login","actor_id":"4f46e0a2-6887-47db-9e69-8b84ce1999d7","actor_username":"daniela.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 16:59:05.190816+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a687f0b3-e539-4d64-8b80-8a27b6533a9a', '{"action":"logout","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-06-24 17:00:15.394532+00', ''),
	('00000000-0000-0000-0000-000000000000', '6a0de7d0-3dd1-4b19-a009-c2c4b16d1d68', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-24 17:01:16.284456+00', ''),
	('00000000-0000-0000-0000-000000000000', '170624ae-4ff9-47a1-893b-f0e86592b80b', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-25 06:56:16.225712+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b2fde76c-09e4-424e-b2c2-f5eae702a2a1', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-25 07:48:11.690215+00', ''),
	('00000000-0000-0000-0000-000000000000', '4f0a0e0b-10d4-4fe2-9d6a-e099c87c43d5', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-25 08:12:52.994715+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a27bb645-8cfb-498a-b0a3-25e2b9c849d9', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-25 08:13:10.927226+00', ''),
	('00000000-0000-0000-0000-000000000000', '3ecee2da-3079-44f0-ad7a-f5b6e1ea9e95', '{"action":"logout","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-06-25 08:13:33.020879+00', ''),
	('00000000-0000-0000-0000-000000000000', '9a409ae3-e546-491a-8666-3508ceec68b7', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-25 08:13:37.435475+00', ''),
	('00000000-0000-0000-0000-000000000000', 'be4cff6c-3189-490e-89ed-1c9d3515b69a', '{"action":"logout","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-06-25 08:14:06.141958+00', ''),
	('00000000-0000-0000-0000-000000000000', '04426259-c4ec-4ef8-92dd-8e22253a53e5', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-25 08:14:10.42097+00', ''),
	('00000000-0000-0000-0000-000000000000', '2a7088e8-e7cb-41c5-b7c9-6100ccb1ece3', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-25 08:37:10.250373+00', ''),
	('00000000-0000-0000-0000-000000000000', '4087cb81-fc9f-499d-83c0-7d4565e67329', '{"action":"logout","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-06-25 08:38:16.037894+00', ''),
	('00000000-0000-0000-0000-000000000000', '9cf2c10c-d799-45be-a1d8-1fad49408b80', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-25 08:39:46.939945+00', ''),
	('00000000-0000-0000-0000-000000000000', '0507f2b1-e694-43a2-b45a-fff3db026188', '{"action":"token_refreshed","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-06-25 09:50:43.780263+00', ''),
	('00000000-0000-0000-0000-000000000000', '9bd58b5f-5d18-438b-92f7-b07e8abf57e2', '{"action":"token_revoked","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-06-25 09:50:43.781156+00', ''),
	('00000000-0000-0000-0000-000000000000', '1fbdaf65-5e59-4cea-816e-5a0085dbcbd9', '{"action":"logout","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-06-25 09:51:04.114749+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f040e9c9-a5d7-49ce-b165-1673454a793e', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-25 09:51:10.249939+00', ''),
	('00000000-0000-0000-0000-000000000000', '82200b12-6168-4047-acbc-ec071b7d9929', '{"action":"logout","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-06-25 10:16:32.777616+00', ''),
	('00000000-0000-0000-0000-000000000000', '70af3ade-9e9e-4540-b2d3-aeeb21f71343', '{"action":"login","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-25 10:16:37.407862+00', ''),
	('00000000-0000-0000-0000-000000000000', '5c3a2016-5782-44d1-99a0-504ee0100ab7', '{"action":"logout","actor_id":"eec940b3-c10d-48e1-8d34-606287983413","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-06-25 10:16:49.771848+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c4657213-4b89-4cd2-b2cf-b53382511e9a', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"fridtjof.christensohn@gmail.com","user_id":"eec940b3-c10d-48e1-8d34-606287983413","user_phone":""}}', '2025-06-25 10:25:12.954048+00', ''),
	('00000000-0000-0000-0000-000000000000', '9b60c56e-e2e4-4b9f-9d94-d9202a172fda', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"fridtjof.schuchardt@gmail.com","user_id":"28db9a98-e994-4713-a7c3-682f4a904a2e","user_phone":""}}', '2025-06-25 10:43:59.947406+00', ''),
	('00000000-0000-0000-0000-000000000000', '5af30bf3-f510-47c1-b082-23885996ebfb', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"daniela.schuchardt@gmail.com","user_id":"4f46e0a2-6887-47db-9e69-8b84ce1999d7","user_phone":""}}', '2025-06-25 10:44:13.350712+00', ''),
	('00000000-0000-0000-0000-000000000000', '1069c9c3-b429-480c-9d71-da1f840b0a4b', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"fschuchardt@cad-schroer.de","user_id":"5b2c76b1-dae6-4111-820b-6c2c4677c6d8","user_phone":""}}', '2025-06-25 10:44:17.519682+00', ''),
	('00000000-0000-0000-0000-000000000000', '38f39ff7-a2ed-467a-aa2d-ed0e080eee3c', '{"action":"user_signedup","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"github"}}', '2025-06-25 10:44:40.914811+00', ''),
	('00000000-0000-0000-0000-000000000000', '7874c87c-4ffa-480e-997f-d66a954d814e', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-06-25 10:44:52.569037+00', ''),
	('00000000-0000-0000-0000-000000000000', '108115e9-ab65-4653-801c-914f49099266', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-06-25 10:44:57.564391+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ac4ff78a-690f-4c96-91a5-5d62a476941e', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-06-25 10:45:32.918339+00', ''),
	('00000000-0000-0000-0000-000000000000', '03e87668-2891-4bce-ad7b-037d8d61732d', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-06-25 10:48:31.262183+00', ''),
	('00000000-0000-0000-0000-000000000000', '6ce7ac71-a7cb-4002-a922-7a4edb4d58f2', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-06-25 10:48:45.173188+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c74e03b6-9d59-41e1-97a8-0860f56bde0c', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-06-25 10:48:53.163028+00', ''),
	('00000000-0000-0000-0000-000000000000', '9261c315-ae89-4582-b5fb-5345afa222ee', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-06-25 10:49:27.68091+00', ''),
	('00000000-0000-0000-0000-000000000000', '9778cfad-89a3-4e33-85dc-14f84e1bc884', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-06-25 10:51:37.493402+00', ''),
	('00000000-0000-0000-0000-000000000000', '537d6dfa-b98b-497c-9aa5-96a6d6db31f3', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-06-25 10:58:05.673762+00', ''),
	('00000000-0000-0000-0000-000000000000', '6c22ef96-a835-4d2b-aaca-001f982dcb7b', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-06-25 10:58:16.487317+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f83f1e9a-dd70-4847-bced-e4f251c3a9b1', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-06-25 11:00:47.462246+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ce0f1cd6-3e6b-48fd-b546-4909c56c68d5', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-06-25 11:01:48.756819+00', ''),
	('00000000-0000-0000-0000-000000000000', 'aa705d37-289b-4dc0-ab60-8bbc1036abef', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-06-25 11:01:54.203172+00', ''),
	('00000000-0000-0000-0000-000000000000', '14bf4346-067f-40b6-9d86-3cf336aa7da5', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-06-25 11:11:26.657025+00', ''),
	('00000000-0000-0000-0000-000000000000', '098c2281-f486-42a5-b3bb-5c6e3a838d5f', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-06-25 11:11:43.046928+00', ''),
	('00000000-0000-0000-0000-000000000000', '393d6ded-9048-4198-baaa-c8de8dab1b26', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-06-25 11:14:55.766286+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd0021d7a-a549-44d9-b4f8-e54872565bb6', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-06-25 11:18:10.04054+00', ''),
	('00000000-0000-0000-0000-000000000000', '20adfc95-3550-4055-afea-9ca397b4a510', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-06-25 11:18:23.217043+00', ''),
	('00000000-0000-0000-0000-000000000000', '2d97ce92-dcd8-41de-a327-5345edf4ba36', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-06-25 11:19:27.98173+00', ''),
	('00000000-0000-0000-0000-000000000000', '708d97ba-6f94-4801-8e65-71568a7a15ba', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-06-25 11:20:42.54222+00', ''),
	('00000000-0000-0000-0000-000000000000', '52fdc239-8b82-4af8-88db-d943c862cf47', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-06-25 11:22:02.905498+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ef2e7431-67f4-4750-adc4-a52fc42bb4a0', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-06-25 11:22:19.708093+00', ''),
	('00000000-0000-0000-0000-000000000000', '92b3faf1-fd18-41be-982b-e0e946923f74', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-06-25 11:37:07.778203+00', ''),
	('00000000-0000-0000-0000-000000000000', '03112886-7b0a-46d8-9fa1-70bad984090a', '{"action":"user_confirmation_requested","actor_id":"aee8bf44-c17a-4d5d-897f-2250c62bd4ff","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-06-25 11:38:13.26532+00', ''),
	('00000000-0000-0000-0000-000000000000', '4853100c-1a1c-48b0-b049-b28de4c47fe0', '{"action":"user_signedup","actor_id":"aee8bf44-c17a-4d5d-897f-2250c62bd4ff","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"team"}', '2025-06-25 11:38:40.360722+00', ''),
	('00000000-0000-0000-0000-000000000000', '5e50370d-4427-4522-8c48-d902ba5a3bab', '{"action":"login","actor_id":"aee8bf44-c17a-4d5d-897f-2250c62bd4ff","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-25 11:38:50.717802+00', ''),
	('00000000-0000-0000-0000-000000000000', '957e68c6-cdc9-4d01-8cc2-bb0e55c44ecd', '{"action":"logout","actor_id":"aee8bf44-c17a-4d5d-897f-2250c62bd4ff","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-06-25 11:38:59.669359+00', ''),
	('00000000-0000-0000-0000-000000000000', 'dda0fc20-425d-4361-bfe1-7e5d831a1b1e', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-06-25 11:39:01.920137+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f8c4f7a3-3eee-4553-99c8-e8fc94054e51', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-06-25 11:46:29.558086+00', ''),
	('00000000-0000-0000-0000-000000000000', '1547d181-b113-4621-8435-70696918fc13', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-06-25 11:46:37.303781+00', ''),
	('00000000-0000-0000-0000-000000000000', '6dbaba64-f12b-41d5-9ce8-a37c71d606db', '{"action":"login","actor_id":"aee8bf44-c17a-4d5d-897f-2250c62bd4ff","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-25 11:54:13.032842+00', ''),
	('00000000-0000-0000-0000-000000000000', '50068254-086e-447e-aaff-83a65ccd7790', '{"action":"logout","actor_id":"aee8bf44-c17a-4d5d-897f-2250c62bd4ff","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-06-25 11:57:48.977793+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a60867da-5536-4715-9d7e-b88145a2a0e8', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-06-25 11:57:51.644632+00', ''),
	('00000000-0000-0000-0000-000000000000', '848994aa-935d-4ceb-819a-d9a5cee057e8', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-06-25 12:03:59.345793+00', ''),
	('00000000-0000-0000-0000-000000000000', '2d03524e-7bcb-4862-a4f2-972f87b880fb', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-06-25 12:04:24.387393+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c9744370-9667-401b-b27c-cda1a9d81e7c', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-06-25 12:09:24.628207+00', ''),
	('00000000-0000-0000-0000-000000000000', '98373538-a94e-4a81-b1d7-fab8a2ae9e13', '{"action":"logout","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-06-25 12:09:38.00582+00', ''),
	('00000000-0000-0000-0000-000000000000', '7cd8062f-95b4-4167-ba87-75c54a23c40b', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-06-25 12:09:40.063312+00', ''),
	('00000000-0000-0000-0000-000000000000', '0a923558-7476-4e5f-844c-02b1efbc6482', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-06-25 12:17:04.285024+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ccb08e29-992e-4bc2-a830-60bddfdd7613', '{"action":"logout","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-06-25 12:41:26.670612+00', ''),
	('00000000-0000-0000-0000-000000000000', '6f73e3e2-5148-4883-aab0-c3a5308ee1d9', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-06-25 12:41:30.67295+00', ''),
	('00000000-0000-0000-0000-000000000000', '962cac41-b368-4bcb-82b8-e65b081c974f', '{"action":"logout","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-06-25 13:36:23.376777+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a2ab4243-e6ce-4589-a37b-379f7f9fbdd2', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-06-25 13:36:39.31182+00', ''),
	('00000000-0000-0000-0000-000000000000', '22ce041e-94a2-4426-aead-66a19fc186db', '{"action":"user_confirmation_requested","actor_id":"4fcded2d-ff11-4ab6-98df-75e784247fa3","actor_username":"akrawczyk@cad-schroer.de","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-06-25 13:37:06.232807+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e30e5264-0570-409a-9c8b-de574ecf5e97', '{"action":"login","actor_id":"aee8bf44-c17a-4d5d-897f-2250c62bd4ff","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-25 13:47:14.418441+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b110f136-46ee-42cd-97f7-b02e2a2e3a0a', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-06-25 13:51:14.799599+00', ''),
	('00000000-0000-0000-0000-000000000000', '1b28f734-1898-4508-a694-463055d5e5cc', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-06-25 14:24:03.249502+00', ''),
	('00000000-0000-0000-0000-000000000000', '847a52b9-f31c-448b-bf00-b663e0cf8912', '{"action":"logout","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-06-25 14:24:11.365387+00', ''),
	('00000000-0000-0000-0000-000000000000', '6bf234de-20db-4147-bdb4-95f9caeb9af2', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-06-26 05:00:43.360798+00', ''),
	('00000000-0000-0000-0000-000000000000', 'dd692c36-cb07-41ef-8945-6ab3cf7bb3c9', '{"action":"token_refreshed","actor_id":"aee8bf44-c17a-4d5d-897f-2250c62bd4ff","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-06-26 09:06:45.724012+00', ''),
	('00000000-0000-0000-0000-000000000000', '8e9f334f-3c8e-426a-88e5-691022c771c8', '{"action":"token_revoked","actor_id":"aee8bf44-c17a-4d5d-897f-2250c62bd4ff","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-06-26 09:06:45.728176+00', ''),
	('00000000-0000-0000-0000-000000000000', '361de2ad-4043-4cb4-89f8-d9973e7f7e8b', '{"action":"logout","actor_id":"aee8bf44-c17a-4d5d-897f-2250c62bd4ff","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-06-26 09:06:52.71555+00', ''),
	('00000000-0000-0000-0000-000000000000', '303b7ff1-174a-4f25-87ae-16b8e21c7e8e', '{"action":"login","actor_id":"aee8bf44-c17a-4d5d-897f-2250c62bd4ff","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-26 09:06:58.419013+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e6df95aa-acd1-4649-8b9b-890315b18c49', '{"action":"logout","actor_id":"aee8bf44-c17a-4d5d-897f-2250c62bd4ff","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-06-26 09:07:17.993907+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bfe9f812-3754-472e-aee7-2a94cc86aa3c', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-06-26 11:59:19.248395+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c882477c-2372-48aa-a3c8-164c10052037', '{"action":"token_refreshed","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-06-26 13:30:31.213133+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ec029c70-8132-419f-a130-da5c9ecb8cd0', '{"action":"token_revoked","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-06-26 13:30:31.215824+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a3a95a4d-2437-4c91-86ef-843d438cfb49', '{"action":"token_refreshed","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-06-27 07:46:09.206581+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a45f1975-e319-4643-9093-39bce4cf4284', '{"action":"token_revoked","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-06-27 07:46:09.211926+00', ''),
	('00000000-0000-0000-0000-000000000000', '26ddbb97-d5ca-4eeb-ae1e-57a1741e587f', '{"action":"logout","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-06-27 07:46:12.026945+00', ''),
	('00000000-0000-0000-0000-000000000000', '388460d1-15e7-4298-b6b9-db776c726eae', '{"action":"user_confirmation_requested","actor_id":"f7de143b-91bc-4092-b65f-5e22b5d87124","actor_username":"fschuchardt@cad-schroer.de","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-06-27 07:48:41.064707+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b716a6e4-9c0d-4fba-a3bd-96e1f67e5e49', '{"action":"user_confirmation_requested","actor_id":"30436480-128a-4adc-a027-408b2bfe2517","actor_username":"autobahnueberwachung@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-06-27 07:53:25.956461+00', ''),
	('00000000-0000-0000-0000-000000000000', '64971af2-a6a5-41e6-b95e-550522e0b23a', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"autobahnueberwachung@gmail.com","user_id":"30436480-128a-4adc-a027-408b2bfe2517","user_phone":""}}', '2025-06-27 08:00:15.885977+00', ''),
	('00000000-0000-0000-0000-000000000000', '21847bd4-f524-4027-9865-cebdb0862329', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"fschuchardt@cad-schroer.de","user_id":"f7de143b-91bc-4092-b65f-5e22b5d87124","user_phone":""}}', '2025-06-27 08:00:21.529542+00', ''),
	('00000000-0000-0000-0000-000000000000', '86895b70-8fcc-446f-9635-4b257f7e5a6e', '{"action":"user_confirmation_requested","actor_id":"de2ff697-0acc-4c4e-9135-8d07c29176ee","actor_username":"autobahnueberwachung@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-06-27 08:00:44.137382+00', ''),
	('00000000-0000-0000-0000-000000000000', '3d11553f-4ca3-4d8c-b39c-7a342948cb2e', '{"action":"user_signedup","actor_id":"de2ff697-0acc-4c4e-9135-8d07c29176ee","actor_username":"autobahnueberwachung@gmail.com","actor_via_sso":false,"log_type":"team"}', '2025-06-27 08:01:04.967476+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c8e7debc-bec0-42cb-8af6-45a8baac8ace', '{"action":"token_refreshed","actor_id":"de2ff697-0acc-4c4e-9135-8d07c29176ee","actor_username":"autobahnueberwachung@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-06-28 09:43:24.325498+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e4ecb313-1fcb-40d2-9b8f-9ac468692845', '{"action":"token_revoked","actor_id":"de2ff697-0acc-4c4e-9135-8d07c29176ee","actor_username":"autobahnueberwachung@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-06-28 09:43:24.331219+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b5bc6aff-5087-40ff-8880-e5d7485c70e7', '{"action":"token_refreshed","actor_id":"de2ff697-0acc-4c4e-9135-8d07c29176ee","actor_username":"autobahnueberwachung@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-06-30 05:44:19.406213+00', ''),
	('00000000-0000-0000-0000-000000000000', '3e2b7b6f-3e5b-4fea-80e0-558dcf0d8159', '{"action":"token_revoked","actor_id":"de2ff697-0acc-4c4e-9135-8d07c29176ee","actor_username":"autobahnueberwachung@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-06-30 05:44:19.416707+00', ''),
	('00000000-0000-0000-0000-000000000000', '5fcb04cf-095a-4d8c-9590-cdbe73a9dc00', '{"action":"logout","actor_id":"de2ff697-0acc-4c4e-9135-8d07c29176ee","actor_username":"autobahnueberwachung@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-06-30 06:38:32.036955+00', ''),
	('00000000-0000-0000-0000-000000000000', 'dd62d074-737b-41b0-bd78-d6de404b3472', '{"action":"login","actor_id":"aee8bf44-c17a-4d5d-897f-2250c62bd4ff","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-30 06:38:38.766877+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e2473e54-213d-4cd7-bdda-bb76e52d682c', '{"action":"user_confirmation_requested","actor_id":"4fcded2d-ff11-4ab6-98df-75e784247fa3","actor_username":"akrawczyk@cad-schroer.de","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-06-30 09:59:28.403049+00', ''),
	('00000000-0000-0000-0000-000000000000', '294a13c6-885a-4d2e-9e81-a22d7d493064', '{"action":"token_refreshed","actor_id":"aee8bf44-c17a-4d5d-897f-2250c62bd4ff","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-06-30 10:08:54.94175+00', ''),
	('00000000-0000-0000-0000-000000000000', '8c6a1357-c453-4085-bfce-e9194c707b08', '{"action":"token_revoked","actor_id":"aee8bf44-c17a-4d5d-897f-2250c62bd4ff","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-06-30 10:08:54.944625+00', ''),
	('00000000-0000-0000-0000-000000000000', '9f4c569a-8d2c-457f-8893-78587e8d635e', '{"action":"user_confirmation_requested","actor_id":"e5e4df08-a0b5-4201-8dab-985e4d644c36","actor_username":"akrawczyk@relantern.de","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-06-30 10:15:43.746347+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ae36b133-211b-4fef-a594-5bb8afa8d762', '{"action":"user_signedup","actor_id":"e5e4df08-a0b5-4201-8dab-985e4d644c36","actor_username":"akrawczyk@relantern.de","actor_via_sso":false,"log_type":"team"}', '2025-06-30 10:16:41.612643+00', ''),
	('00000000-0000-0000-0000-000000000000', '30fc21e2-2b18-4583-9987-df4c6c91ff8e', '{"action":"login","actor_id":"e5e4df08-a0b5-4201-8dab-985e4d644c36","actor_username":"akrawczyk@relantern.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-06-30 10:17:06.579146+00', ''),
	('00000000-0000-0000-0000-000000000000', '47ff17af-7cc4-4151-bbf9-977e334f6aad', '{"action":"token_refreshed","actor_id":"aee8bf44-c17a-4d5d-897f-2250c62bd4ff","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-06-30 11:09:12.234923+00', ''),
	('00000000-0000-0000-0000-000000000000', '33dcfa1b-ffaa-410e-a0c9-71fdbdb2bfd8', '{"action":"token_revoked","actor_id":"aee8bf44-c17a-4d5d-897f-2250c62bd4ff","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-06-30 11:09:12.240775+00', ''),
	('00000000-0000-0000-0000-000000000000', '47ccd038-7793-4ced-9faa-9b8689173800', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"akrawczyk@cad-schroer.de","user_id":"4fcded2d-ff11-4ab6-98df-75e784247fa3","user_phone":""}}', '2025-06-30 12:00:19.32131+00', ''),
	('00000000-0000-0000-0000-000000000000', '5d33574a-c9d9-43fc-a59b-9d4f6ced5317', '{"action":"logout","actor_id":"aee8bf44-c17a-4d5d-897f-2250c62bd4ff","actor_username":"fridtjof.christensohn@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-06-30 12:00:33.296899+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a77792c1-73fb-4373-beaa-4b9b16c1fad8', '{"action":"user_confirmation_requested","actor_id":"43acfefa-dc06-4e26-b4c9-9548ee71c19a","actor_username":"fschuchardt@cad-schroer.de","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-06-30 12:00:49.450396+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bdcd72ca-66f3-480d-ba09-31c5dbefedf6', '{"action":"user_signedup","actor_id":"43acfefa-dc06-4e26-b4c9-9548ee71c19a","actor_username":"fschuchardt@cad-schroer.de","actor_via_sso":false,"log_type":"team"}', '2025-06-30 12:02:04.061588+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c084d426-4e04-4a20-85c5-482c83b08b91', '{"action":"logout","actor_id":"43acfefa-dc06-4e26-b4c9-9548ee71c19a","actor_username":"fschuchardt@cad-schroer.de","actor_via_sso":false,"log_type":"account"}', '2025-06-30 12:31:50.267353+00', ''),
	('00000000-0000-0000-0000-000000000000', '336225fc-b750-45a9-813b-7d083f129004', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-06-30 12:32:00.712676+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a5a5c9f4-49e7-45e3-8183-67278e0a9a45', '{"action":"token_refreshed","actor_id":"e5e4df08-a0b5-4201-8dab-985e4d644c36","actor_username":"akrawczyk@relantern.de","actor_via_sso":false,"log_type":"token"}', '2025-06-30 13:11:12.565927+00', ''),
	('00000000-0000-0000-0000-000000000000', '130cf87f-e2c1-4934-a5c9-e5d3625e5c44', '{"action":"token_revoked","actor_id":"e5e4df08-a0b5-4201-8dab-985e4d644c36","actor_username":"akrawczyk@relantern.de","actor_via_sso":false,"log_type":"token"}', '2025-06-30 13:11:12.573223+00', ''),
	('00000000-0000-0000-0000-000000000000', '4f7d8903-d438-42b4-9c5a-b1a4a82b19bc', '{"action":"logout","actor_id":"e5e4df08-a0b5-4201-8dab-985e4d644c36","actor_username":"akrawczyk@relantern.de","actor_via_sso":false,"log_type":"account"}', '2025-06-30 13:11:16.052771+00', ''),
	('00000000-0000-0000-0000-000000000000', '16a81929-9240-4b47-b3e0-fa36133cac3c', '{"action":"user_confirmation_requested","actor_id":"c04324f6-185b-4ddc-a6da-166370a96cfd","actor_username":"akrawczyk@cad-schroer.de","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-06-30 13:11:57.18349+00', ''),
	('00000000-0000-0000-0000-000000000000', '59726254-c1df-41e7-95e3-d140aa1b1745', '{"action":"user_signedup","actor_id":"c04324f6-185b-4ddc-a6da-166370a96cfd","actor_username":"akrawczyk@cad-schroer.de","actor_via_sso":false,"log_type":"team"}', '2025-06-30 13:12:17.784272+00', ''),
	('00000000-0000-0000-0000-000000000000', '3cf0e8e5-1d31-4cf9-98ef-fbc67cbdaf50', '{"action":"token_refreshed","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-06-30 13:41:45.387142+00', ''),
	('00000000-0000-0000-0000-000000000000', '35b8f3f8-7b2c-41d7-8dbb-ee5453a83fc7', '{"action":"token_revoked","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-06-30 13:41:45.391196+00', ''),
	('00000000-0000-0000-0000-000000000000', '2e164bd2-7bb6-4d5a-948b-569955f83f9e', '{"action":"token_refreshed","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-07-01 06:54:28.923023+00', ''),
	('00000000-0000-0000-0000-000000000000', '6761a2d3-e813-4e6b-8b82-516f4cb88aef', '{"action":"token_revoked","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-07-01 06:54:28.929339+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bd34be57-33cb-43da-b7cb-95c5c8bfe50c', '{"action":"logout","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-07-01 06:54:31.93299+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cb3c7508-e047-4b9e-a706-d2d9d9268923', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-07-01 06:54:35.093606+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e5a7496b-26e0-4623-8191-d9c829d7a87c', '{"action":"logout","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-07-01 06:54:37.912111+00', ''),
	('00000000-0000-0000-0000-000000000000', '56d7d28b-7e18-45f6-a175-b32b33e97b35', '{"action":"login","actor_id":"43acfefa-dc06-4e26-b4c9-9548ee71c19a","actor_username":"fschuchardt@cad-schroer.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-07-01 06:54:43.64083+00', ''),
	('00000000-0000-0000-0000-000000000000', '9fe881df-7d09-400a-b32c-4edf8aa2040f', '{"action":"token_refreshed","actor_id":"43acfefa-dc06-4e26-b4c9-9548ee71c19a","actor_username":"fschuchardt@cad-schroer.de","actor_via_sso":false,"log_type":"token"}', '2025-07-01 07:52:50.331527+00', ''),
	('00000000-0000-0000-0000-000000000000', '150ee0eb-f749-4ef1-8ca1-303b50149839', '{"action":"token_revoked","actor_id":"43acfefa-dc06-4e26-b4c9-9548ee71c19a","actor_username":"fschuchardt@cad-schroer.de","actor_via_sso":false,"log_type":"token"}', '2025-07-01 07:52:50.337794+00', ''),
	('00000000-0000-0000-0000-000000000000', '35878192-1eac-4428-b46f-66fa0a46e13a', '{"action":"token_refreshed","actor_id":"43acfefa-dc06-4e26-b4c9-9548ee71c19a","actor_username":"fschuchardt@cad-schroer.de","actor_via_sso":false,"log_type":"token"}', '2025-07-01 09:39:29.86732+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c25ac0a6-65cc-4d60-bac3-9faf1349851f', '{"action":"token_revoked","actor_id":"43acfefa-dc06-4e26-b4c9-9548ee71c19a","actor_username":"fschuchardt@cad-schroer.de","actor_via_sso":false,"log_type":"token"}', '2025-07-01 09:39:29.871367+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fd5ae1ea-cdf3-4a0c-b4b0-1203036e7d92', '{"action":"token_refreshed","actor_id":"43acfefa-dc06-4e26-b4c9-9548ee71c19a","actor_username":"fschuchardt@cad-schroer.de","actor_via_sso":false,"log_type":"token"}', '2025-07-01 10:55:26.426168+00', ''),
	('00000000-0000-0000-0000-000000000000', '51f729d8-aee8-4542-a2d1-1f7deaba3bf0', '{"action":"token_revoked","actor_id":"43acfefa-dc06-4e26-b4c9-9548ee71c19a","actor_username":"fschuchardt@cad-schroer.de","actor_via_sso":false,"log_type":"token"}', '2025-07-01 10:55:26.429914+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ac314190-488c-47f0-a496-5125be2d3a50', '{"action":"token_refreshed","actor_id":"43acfefa-dc06-4e26-b4c9-9548ee71c19a","actor_username":"fschuchardt@cad-schroer.de","actor_via_sso":false,"log_type":"token"}', '2025-07-01 13:35:39.950409+00', ''),
	('00000000-0000-0000-0000-000000000000', '6ec4caef-9694-4db3-b226-06f7ae0356b8', '{"action":"token_revoked","actor_id":"43acfefa-dc06-4e26-b4c9-9548ee71c19a","actor_username":"fschuchardt@cad-schroer.de","actor_via_sso":false,"log_type":"token"}', '2025-07-01 13:35:39.955015+00', ''),
	('00000000-0000-0000-0000-000000000000', '72d4a75e-d22d-4719-a84c-03da455350a7', '{"action":"token_refreshed","actor_id":"43acfefa-dc06-4e26-b4c9-9548ee71c19a","actor_username":"fschuchardt@cad-schroer.de","actor_via_sso":false,"log_type":"token"}', '2025-07-02 06:48:38.809681+00', ''),
	('00000000-0000-0000-0000-000000000000', '4bdbcb56-ba12-4a87-9592-556ae8b5cbaa', '{"action":"token_revoked","actor_id":"43acfefa-dc06-4e26-b4c9-9548ee71c19a","actor_username":"fschuchardt@cad-schroer.de","actor_via_sso":false,"log_type":"token"}', '2025-07-02 06:48:38.814688+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bed00387-2837-49c5-b327-aa44f12b6b2e', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-07-02 07:16:55.345286+00', ''),
	('00000000-0000-0000-0000-000000000000', 'dc287452-21bf-479d-8a73-a66cfa072d0f', '{"action":"logout","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-07-02 07:16:58.38956+00', ''),
	('00000000-0000-0000-0000-000000000000', '31e83cce-c800-48c3-b8fe-5a4547c52135', '{"action":"login","actor_id":"43acfefa-dc06-4e26-b4c9-9548ee71c19a","actor_username":"fschuchardt@cad-schroer.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-07-02 07:17:04.014162+00', ''),
	('00000000-0000-0000-0000-000000000000', '91a66370-a9a6-4871-bdb5-b91fd5f0ef06', '{"action":"logout","actor_id":"43acfefa-dc06-4e26-b4c9-9548ee71c19a","actor_username":"fschuchardt@cad-schroer.de","actor_via_sso":false,"log_type":"account"}', '2025-07-02 07:36:54.985883+00', ''),
	('00000000-0000-0000-0000-000000000000', 'be48e845-c878-4370-a148-ff3d49eec803', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-07-02 07:36:57.906419+00', ''),
	('00000000-0000-0000-0000-000000000000', '3d2112ca-cf9e-40ae-ad65-658b957ea65e', '{"action":"logout","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-07-02 07:45:20.422182+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd5043c01-c791-44bd-8cf8-4ee07f385c82', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-07-02 07:45:23.752984+00', ''),
	('00000000-0000-0000-0000-000000000000', '447139b3-1e8f-48b5-80ca-ea8b7a0e8c18', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-07-02 07:48:11.923977+00', ''),
	('00000000-0000-0000-0000-000000000000', '1d15cb73-aa22-4ebf-9bd7-51459cb1a2c4', '{"action":"login","actor_id":"43acfefa-dc06-4e26-b4c9-9548ee71c19a","actor_username":"fschuchardt@cad-schroer.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-07-02 07:48:50.982509+00', ''),
	('00000000-0000-0000-0000-000000000000', '83b2093f-6df5-4e96-88b5-d1cd729bf731', '{"action":"token_refreshed","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-07-02 08:50:58.685688+00', ''),
	('00000000-0000-0000-0000-000000000000', '77816688-4f92-4818-a433-1dd698daed6b', '{"action":"token_revoked","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-07-02 08:50:58.693228+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c7b01804-8c65-4e55-828e-1af5d5920ab0', '{"action":"token_refreshed","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-07-02 10:35:27.485181+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c4fdbba8-d8fc-4e96-b573-3ea265650b5d', '{"action":"token_revoked","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-07-02 10:35:27.48815+00', ''),
	('00000000-0000-0000-0000-000000000000', '46ab97d0-0978-48b1-83af-6e6f26801a65', '{"action":"token_refreshed","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-07-02 11:59:54.447257+00', ''),
	('00000000-0000-0000-0000-000000000000', '07adec43-3a43-4cad-877a-46b5d423c1e4', '{"action":"token_revoked","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-07-02 11:59:54.449358+00', ''),
	('00000000-0000-0000-0000-000000000000', '63b28346-0b7b-42c3-97d1-e1c70370f7f6', '{"action":"logout","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-07-02 12:54:10.415251+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e061b6be-453b-47de-8ce8-4a16d86d5a21', '{"action":"login","actor_id":"43acfefa-dc06-4e26-b4c9-9548ee71c19a","actor_username":"fschuchardt@cad-schroer.de","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-07-02 13:22:29.904297+00', ''),
	('00000000-0000-0000-0000-000000000000', 'de3b51c2-0c87-4369-a861-5057f4de791b', '{"action":"user_signedup","actor_id":"3ef92041-0ecf-4b21-92e4-bb339149f220","actor_name":"Asef Dündar","actor_username":"asaf93@hotmail.de","actor_via_sso":false,"log_type":"team","traits":{"provider":"github"}}', '2025-07-02 13:48:15.353079+00', ''),
	('00000000-0000-0000-0000-000000000000', '358a7875-d435-437a-a94b-339f15204c9c', '{"action":"token_refreshed","actor_id":"3ef92041-0ecf-4b21-92e4-bb339149f220","actor_name":"Asef Dündar","actor_username":"asaf93@hotmail.de","actor_via_sso":false,"log_type":"token"}', '2025-07-02 15:07:08.304985+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f6da33fb-d113-43d8-9e75-e38bc70e6931', '{"action":"token_revoked","actor_id":"3ef92041-0ecf-4b21-92e4-bb339149f220","actor_name":"Asef Dündar","actor_username":"asaf93@hotmail.de","actor_via_sso":false,"log_type":"token"}', '2025-07-02 15:07:08.313822+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cb7b75ca-edff-4ad8-8ee9-50c32be3688f', '{"action":"token_refreshed","actor_id":"43acfefa-dc06-4e26-b4c9-9548ee71c19a","actor_username":"fschuchardt@cad-schroer.de","actor_via_sso":false,"log_type":"token"}', '2025-07-07 06:15:02.525008+00', ''),
	('00000000-0000-0000-0000-000000000000', '226aedd3-af7a-48cb-a965-162f11329891', '{"action":"token_revoked","actor_id":"43acfefa-dc06-4e26-b4c9-9548ee71c19a","actor_username":"fschuchardt@cad-schroer.de","actor_via_sso":false,"log_type":"token"}', '2025-07-07 06:15:02.533519+00', ''),
	('00000000-0000-0000-0000-000000000000', '54bbabbb-c4e7-4d8b-97d6-e118c30392be', '{"action":"token_refreshed","actor_id":"43acfefa-dc06-4e26-b4c9-9548ee71c19a","actor_username":"fschuchardt@cad-schroer.de","actor_via_sso":false,"log_type":"token"}', '2025-07-07 08:31:37.717634+00', ''),
	('00000000-0000-0000-0000-000000000000', '420da979-483c-45c2-94a4-f41a2f2c2836', '{"action":"token_revoked","actor_id":"43acfefa-dc06-4e26-b4c9-9548ee71c19a","actor_username":"fschuchardt@cad-schroer.de","actor_via_sso":false,"log_type":"token"}', '2025-07-07 08:31:37.728255+00', ''),
	('00000000-0000-0000-0000-000000000000', '231e1ccd-0457-44d7-b01f-940a4c6bc476', '{"action":"logout","actor_id":"43acfefa-dc06-4e26-b4c9-9548ee71c19a","actor_username":"fschuchardt@cad-schroer.de","actor_via_sso":false,"log_type":"account"}', '2025-07-07 08:31:58.690736+00', ''),
	('00000000-0000-0000-0000-000000000000', '637e8953-247a-442d-82e8-b3cbc9be431f', '{"action":"login","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"github"}}', '2025-07-07 08:32:09.536697+00', ''),
	('00000000-0000-0000-0000-000000000000', '367603e7-23c9-435a-8706-9ed28506e52e', '{"action":"user_confirmation_requested","actor_id":"2cfdcdd5-1206-4438-b02c-cc3e4e25fc26","actor_username":"lurselmans@cad-schroer.de","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-07-07 08:32:31.826879+00', ''),
	('00000000-0000-0000-0000-000000000000', '7829eccd-6645-4a61-89a0-398e871e175a', '{"action":"user_signedup","actor_id":"2cfdcdd5-1206-4438-b02c-cc3e4e25fc26","actor_username":"lurselmans@cad-schroer.de","actor_via_sso":false,"log_type":"team"}', '2025-07-07 08:33:15.947782+00', ''),
	('00000000-0000-0000-0000-000000000000', '7f8a68aa-2b88-4b83-8048-5a1de6d42c68', '{"action":"token_refreshed","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-07-07 09:35:54.497952+00', ''),
	('00000000-0000-0000-0000-000000000000', '33bf2bb7-df54-47e8-ad4c-a3cdb4e0e460', '{"action":"token_revoked","actor_id":"3d2087b0-2f8d-4870-911f-d74b95c31d58","actor_name":"Fridtjof","actor_username":"fridtjof.schuchardt@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-07-07 09:35:54.504965+00', '');


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."users" ("instance_id", "id", "aud", "role", "email", "encrypted_password", "email_confirmed_at", "invited_at", "confirmation_token", "confirmation_sent_at", "recovery_token", "recovery_sent_at", "email_change_token_new", "email_change", "email_change_sent_at", "last_sign_in_at", "raw_app_meta_data", "raw_user_meta_data", "is_super_admin", "created_at", "updated_at", "phone", "phone_confirmed_at", "phone_change", "phone_change_token", "phone_change_sent_at", "email_change_token_current", "email_change_confirm_status", "banned_until", "reauthentication_token", "reauthentication_sent_at", "is_sso_user", "deleted_at", "is_anonymous") VALUES
	('00000000-0000-0000-0000-000000000000', '3ef92041-0ecf-4b21-92e4-bb339149f220', 'authenticated', 'authenticated', 'asaf93@hotmail.de', NULL, '2025-07-02 13:48:15.356778+00', NULL, '', NULL, '', NULL, '', '', NULL, '2025-07-02 13:48:15.363154+00', '{"provider": "github", "providers": ["github"]}', '{"iss": "https://api.github.com", "sub": "26894204", "name": "Asef Dündar", "email": "asaf93@hotmail.de", "full_name": "Asef Dündar", "user_name": "aatd", "avatar_url": "https://avatars.githubusercontent.com/u/26894204?v=4", "provider_id": "26894204", "email_verified": true, "phone_verified": false, "preferred_username": "aatd"}', NULL, '2025-07-02 13:48:15.322726+00', '2025-07-02 15:07:08.320317+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '3d2087b0-2f8d-4870-911f-d74b95c31d58', 'authenticated', 'authenticated', 'fridtjof.schuchardt@gmail.com', NULL, '2025-06-25 10:44:40.915333+00', NULL, '', NULL, '', NULL, '', '', NULL, '2025-07-07 08:32:09.537245+00', '{"provider": "github", "providers": ["github"]}', '{"iss": "https://api.github.com", "sub": "91590196", "name": "Fridtjof", "email": "fridtjof.schuchardt@gmail.com", "full_name": "Fridtjof", "user_name": "AutobahnAuffahrt", "avatar_url": "https://avatars.githubusercontent.com/u/91590196?v=4", "provider_id": "91590196", "email_verified": true, "phone_verified": false, "preferred_username": "AutobahnAuffahrt"}', NULL, '2025-06-25 10:44:40.898756+00', '2025-07-07 09:35:54.516793+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', 'e5e4df08-a0b5-4201-8dab-985e4d644c36', 'authenticated', 'authenticated', 'akrawczyk@relantern.de', '$2a$10$lV1Ynhk5bhpCWd8rupnqye1JX5fWZpe9Nis/LXdLo/5NS8R8ycP66', '2025-06-30 10:16:41.613947+00', NULL, '', '2025-06-30 10:15:43.749503+00', '', NULL, '', '', NULL, '2025-06-30 10:17:06.579978+00', '{"provider": "email", "providers": ["email"]}', '{"sub": "e5e4df08-a0b5-4201-8dab-985e4d644c36", "email": "akrawczyk@relantern.de", "email_verified": true, "phone_verified": false}', NULL, '2025-06-30 10:15:43.726719+00', '2025-06-30 13:11:12.577705+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', 'de2ff697-0acc-4c4e-9135-8d07c29176ee', 'authenticated', 'authenticated', 'autobahnueberwachung@gmail.com', '$2a$10$OJd9fK547dKuxWXy7P0YwuUbj/I3V9.s/JatQ1ZJkGyTM0VX9BXqu', '2025-06-27 08:01:04.969771+00', NULL, '', '2025-06-27 08:00:44.139163+00', '', NULL, '', '', NULL, '2025-06-27 08:01:04.974823+00', '{"provider": "email", "providers": ["email"]}', '{"sub": "de2ff697-0acc-4c4e-9135-8d07c29176ee", "email": "autobahnueberwachung@gmail.com", "email_verified": true, "phone_verified": false}', NULL, '2025-06-27 08:00:44.112962+00', '2025-06-30 05:44:19.430417+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', 'c04324f6-185b-4ddc-a6da-166370a96cfd', 'authenticated', 'authenticated', 'akrawczyk@cad-schroer.de', '$2a$10$c3G0A4YfsH8Z8x/WBjJ3h.SRZup4pB6wqrIypg2lxmgqRbcpYL2H2', '2025-06-30 13:12:17.784842+00', NULL, '', '2025-06-30 13:11:57.183994+00', '', NULL, '', '', NULL, '2025-06-30 13:12:17.788037+00', '{"provider": "email", "providers": ["email"]}', '{"sub": "c04324f6-185b-4ddc-a6da-166370a96cfd", "email": "akrawczyk@cad-schroer.de", "email_verified": true, "phone_verified": false}', NULL, '2025-06-30 13:11:57.172919+00', '2025-06-30 13:12:17.789933+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', 'aee8bf44-c17a-4d5d-897f-2250c62bd4ff', 'authenticated', 'authenticated', 'fridtjof.christensohn@gmail.com', '$2a$10$a0m6SyCOAqrYGXW79YLOjePDTpwxpy3CQ/DhCGYDrWR6TY1BbcKEO', '2025-06-25 11:38:40.361354+00', NULL, '', '2025-06-25 11:38:13.266947+00', '', NULL, '', '', NULL, '2025-06-30 06:38:38.772901+00', '{"provider": "email", "providers": ["email"]}', '{"sub": "aee8bf44-c17a-4d5d-897f-2250c62bd4ff", "email": "fridtjof.christensohn@gmail.com", "email_verified": true, "phone_verified": false}', NULL, '2025-06-25 11:38:13.252814+00', '2025-06-30 11:09:12.249003+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '43acfefa-dc06-4e26-b4c9-9548ee71c19a', 'authenticated', 'authenticated', 'fschuchardt@cad-schroer.de', '$2a$10$AIt8NjoYGZlVSO5/CDPt6OU78Umd4b9P86NA3CN4bhXWXOMDMs0zK', '2025-06-30 12:02:04.063281+00', NULL, '', '2025-06-30 12:00:49.452292+00', '', NULL, '', '', NULL, '2025-07-02 13:22:29.913201+00', '{"provider": "email", "providers": ["email"]}', '{"sub": "43acfefa-dc06-4e26-b4c9-9548ee71c19a", "email": "fschuchardt@cad-schroer.de", "email_verified": true, "phone_verified": false}', NULL, '2025-06-30 12:00:49.436859+00', '2025-07-07 08:31:37.740699+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '2cfdcdd5-1206-4438-b02c-cc3e4e25fc26', 'authenticated', 'authenticated', 'lurselmans@cad-schroer.de', '$2a$10$Uv7iarHffo8hXjDfVLTSreUcWA7Qqq7M5i.N.xmzU0ngm.7hzIOoW', '2025-07-07 08:33:15.948596+00', NULL, '', '2025-07-07 08:32:31.831566+00', '', NULL, '', '', NULL, '2025-07-07 08:33:15.952195+00', '{"provider": "email", "providers": ["email"]}', '{"sub": "2cfdcdd5-1206-4438-b02c-cc3e4e25fc26", "email": "lurselmans@cad-schroer.de", "email_verified": true, "phone_verified": false}', NULL, '2025-07-07 08:32:31.795254+00', '2025-07-07 08:33:15.955698+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false);


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."identities" ("provider_id", "user_id", "identity_data", "provider", "last_sign_in_at", "created_at", "updated_at", "id") VALUES
	('aee8bf44-c17a-4d5d-897f-2250c62bd4ff', 'aee8bf44-c17a-4d5d-897f-2250c62bd4ff', '{"sub": "aee8bf44-c17a-4d5d-897f-2250c62bd4ff", "email": "fridtjof.christensohn@gmail.com", "email_verified": true, "phone_verified": false}', 'email', '2025-06-25 11:38:13.262289+00', '2025-06-25 11:38:13.262361+00', '2025-06-25 11:38:13.262361+00', 'c7c2047d-6806-4c15-9cd9-7b996098313f'),
	('43acfefa-dc06-4e26-b4c9-9548ee71c19a', '43acfefa-dc06-4e26-b4c9-9548ee71c19a', '{"sub": "43acfefa-dc06-4e26-b4c9-9548ee71c19a", "email": "fschuchardt@cad-schroer.de", "email_verified": true, "phone_verified": false}', 'email', '2025-06-30 12:00:49.445171+00', '2025-06-30 12:00:49.445226+00', '2025-06-30 12:00:49.445226+00', '00df625c-97d1-493a-92de-76100d766d00'),
	('c04324f6-185b-4ddc-a6da-166370a96cfd', 'c04324f6-185b-4ddc-a6da-166370a96cfd', '{"sub": "c04324f6-185b-4ddc-a6da-166370a96cfd", "email": "akrawczyk@cad-schroer.de", "email_verified": true, "phone_verified": false}', 'email', '2025-06-30 13:11:57.180153+00', '2025-06-30 13:11:57.180212+00', '2025-06-30 13:11:57.180212+00', '27dd3b01-ccea-4ba4-91e7-d8e856155e13'),
	('de2ff697-0acc-4c4e-9135-8d07c29176ee', 'de2ff697-0acc-4c4e-9135-8d07c29176ee', '{"sub": "de2ff697-0acc-4c4e-9135-8d07c29176ee", "email": "autobahnueberwachung@gmail.com", "email_verified": true, "phone_verified": false}', 'email', '2025-06-27 08:00:44.134107+00', '2025-06-27 08:00:44.134169+00', '2025-06-27 08:00:44.134169+00', '6aefa07f-1280-45de-b447-0a6210e0cbc8'),
	('e5e4df08-a0b5-4201-8dab-985e4d644c36', 'e5e4df08-a0b5-4201-8dab-985e4d644c36', '{"sub": "e5e4df08-a0b5-4201-8dab-985e4d644c36", "email": "akrawczyk@relantern.de", "email_verified": true, "phone_verified": false}', 'email', '2025-06-30 10:15:43.738146+00', '2025-06-30 10:15:43.738207+00', '2025-06-30 10:15:43.738207+00', '3da6d6a2-9316-4a5d-9c48-d74951201403'),
	('26894204', '3ef92041-0ecf-4b21-92e4-bb339149f220', '{"iss": "https://api.github.com", "sub": "26894204", "name": "Asef Dündar", "email": "asaf93@hotmail.de", "full_name": "Asef Dündar", "user_name": "aatd", "avatar_url": "https://avatars.githubusercontent.com/u/26894204?v=4", "provider_id": "26894204", "email_verified": true, "phone_verified": false, "preferred_username": "aatd"}', 'github', '2025-07-02 13:48:15.342537+00', '2025-07-02 13:48:15.342588+00', '2025-07-02 13:48:15.342588+00', '394b3303-23da-47d3-b408-f9b933aab2f9'),
	('91590196', '3d2087b0-2f8d-4870-911f-d74b95c31d58', '{"iss": "https://api.github.com", "sub": "91590196", "name": "Fridtjof", "email": "fridtjof.schuchardt@gmail.com", "full_name": "Fridtjof", "user_name": "AutobahnAuffahrt", "avatar_url": "https://avatars.githubusercontent.com/u/91590196?v=4", "provider_id": "91590196", "email_verified": true, "phone_verified": false, "preferred_username": "AutobahnAuffahrt"}', 'github', '2025-06-25 10:44:40.909714+00', '2025-06-25 10:44:40.909787+00', '2025-07-07 08:32:09.523164+00', 'a5ddfeab-1e6f-4f2c-b4f2-809ae9c7afdb'),
	('2cfdcdd5-1206-4438-b02c-cc3e4e25fc26', '2cfdcdd5-1206-4438-b02c-cc3e4e25fc26', '{"sub": "2cfdcdd5-1206-4438-b02c-cc3e4e25fc26", "email": "lurselmans@cad-schroer.de", "email_verified": true, "phone_verified": false}', 'email', '2025-07-07 08:32:31.817618+00', '2025-07-07 08:32:31.817671+00', '2025-07-07 08:32:31.817671+00', '2d82f0ab-7d8a-4416-98df-ac06a69303bf');


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."sessions" ("id", "user_id", "created_at", "updated_at", "factor_id", "aal", "not_after", "refreshed_at", "user_agent", "ip", "tag") VALUES
	('6ddd80ef-3199-42e4-8bac-ba3af5ad15ff', '3ef92041-0ecf-4b21-92e4-bb339149f220', '2025-07-02 13:48:15.363247+00', '2025-07-02 15:07:08.322301+00', NULL, 'aal1', NULL, '2025-07-02 15:07:08.322227', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36', '176.6.58.90', NULL),
	('a88c77e8-3298-449e-810c-59f2ff291883', '2cfdcdd5-1206-4438-b02c-cc3e4e25fc26', '2025-07-07 08:33:15.952262+00', '2025-07-07 08:33:15.952262+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:139.0) Gecko/20100101 Firefox/139.0', '93.234.33.75', NULL),
	('9ea2e6fa-90ab-4855-ae13-565f01566077', '3d2087b0-2f8d-4870-911f-d74b95c31d58', '2025-07-07 08:32:09.537318+00', '2025-07-07 09:35:54.520012+00', NULL, 'aal1', NULL, '2025-07-07 09:35:54.519932', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '94.31.92.3', NULL),
	('b9412833-23d4-4e5a-9323-55e44deef3e1', 'c04324f6-185b-4ddc-a6da-166370a96cfd', '2025-06-30 13:12:17.788103+00', '2025-06-30 13:12:17.788103+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0', '91.48.53.234', NULL);


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."mfa_amr_claims" ("session_id", "created_at", "updated_at", "authentication_method", "id") VALUES
	('b9412833-23d4-4e5a-9323-55e44deef3e1', '2025-06-30 13:12:17.790267+00', '2025-06-30 13:12:17.790267+00', 'otp', '4750461a-3f83-4022-999f-c38b7ae02f72'),
	('6ddd80ef-3199-42e4-8bac-ba3af5ad15ff', '2025-07-02 13:48:15.367779+00', '2025-07-02 13:48:15.367779+00', 'oauth', 'a12af50c-dbe5-4572-8fdf-952db6a3df03'),
	('9ea2e6fa-90ab-4855-ae13-565f01566077', '2025-07-07 08:32:09.546646+00', '2025-07-07 08:32:09.546646+00', 'oauth', '0517ec1a-1f6d-49a2-894a-aa334ea61ab3'),
	('a88c77e8-3298-449e-810c-59f2ff291883', '2025-07-07 08:33:15.956519+00', '2025-07-07 08:33:15.956519+00', 'otp', '53ad3e27-0ee8-440d-85a2-66a858959145');


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."refresh_tokens" ("instance_id", "id", "token", "user_id", "revoked", "created_at", "updated_at", "parent", "session_id") VALUES
	('00000000-0000-0000-0000-000000000000', 142, '7wb6gcxwt4i7', '3ef92041-0ecf-4b21-92e4-bb339149f220', true, '2025-07-02 13:48:15.365212+00', '2025-07-02 15:07:08.314528+00', NULL, '6ddd80ef-3199-42e4-8bac-ba3af5ad15ff'),
	('00000000-0000-0000-0000-000000000000', 143, 'nirwxicg53ib', '3ef92041-0ecf-4b21-92e4-bb339149f220', false, '2025-07-02 15:07:08.317607+00', '2025-07-02 15:07:08.317607+00', '7wb6gcxwt4i7', '6ddd80ef-3199-42e4-8bac-ba3af5ad15ff'),
	('00000000-0000-0000-0000-000000000000', 147, 'irolmghleuoz', '2cfdcdd5-1206-4438-b02c-cc3e4e25fc26', false, '2025-07-07 08:33:15.953597+00', '2025-07-07 08:33:15.953597+00', NULL, 'a88c77e8-3298-449e-810c-59f2ff291883'),
	('00000000-0000-0000-0000-000000000000', 146, 'jayraf73sub4', '3d2087b0-2f8d-4870-911f-d74b95c31d58', true, '2025-07-07 08:32:09.544966+00', '2025-07-07 09:35:54.505625+00', NULL, '9ea2e6fa-90ab-4855-ae13-565f01566077'),
	('00000000-0000-0000-0000-000000000000', 148, 'unbnwwnkx5x6', '3d2087b0-2f8d-4870-911f-d74b95c31d58', false, '2025-07-07 09:35:54.512246+00', '2025-07-07 09:35:54.512246+00', 'jayraf73sub4', '9ea2e6fa-90ab-4855-ae13-565f01566077'),
	('00000000-0000-0000-0000-000000000000', 122, 'yt7rcprjo35g', 'c04324f6-185b-4ddc-a6da-166370a96cfd', false, '2025-06-30 13:12:17.788906+00', '2025-06-30 13:12:17.788906+00', NULL, 'b9412833-23d4-4e5a-9323-55e44deef3e1');


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."profiles" ("id", "created_at", "username") VALUES
	('aee8bf44-c17a-4d5d-897f-2250c62bd4ff', '2025-06-25 11:38:13.252448+00', 'auto'),
	('3d2087b0-2f8d-4870-911f-d74b95c31d58', '2025-06-25 10:44:40.89453+00', 'Hans'),
	('de2ff697-0acc-4c4e-9135-8d07c29176ee', '2025-06-27 08:00:44.10864+00', NULL),
	('e5e4df08-a0b5-4201-8dab-985e4d644c36', '2025-06-30 10:15:43.726315+00', NULL),
	('c04324f6-185b-4ddc-a6da-166370a96cfd', '2025-06-30 13:11:57.172581+00', NULL),
	('43acfefa-dc06-4e26-b4c9-9548ee71c19a', '2025-06-30 12:00:49.436519+00', 'Mussy'),
	('3ef92041-0ecf-4b21-92e4-bb339149f220', '2025-07-02 13:48:15.310301+00', 'AATD'),
	('2cfdcdd5-1206-4438-b02c-cc3e4e25fc26', '2025-07-07 08:32:31.794929+00', NULL);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."teams" ("id", "name", "created_at", "created_by") VALUES
	('b2c8e0d6-572a-4724-a0fd-23d2a9dae6cb', '2nd team', '2025-06-24 07:21:48.850564+00', NULL),
	('aab2fc23-5cdb-478c-ba56-85e4ec803176', 'first team', '2025-06-24 06:30:13.70718+00', NULL),
	('48c2deab-4006-4846-8e43-0e5e7948f686', 'AutobahnPolizei', '2025-06-25 12:34:12.678402+00', '3d2087b0-2f8d-4870-911f-d74b95c31d58'),
	('f2a940e9-0ef3-43c0-83b2-bbe5f536c1ff', 'lantern''s', '2025-06-30 10:17:19.870419+00', 'e5e4df08-a0b5-4201-8dab-985e4d644c36'),
	('1991f761-79a9-41c4-b2d9-ad66fe987ce4', 'Ein Asef', '2025-07-02 13:49:30.642745+00', '3ef92041-0ecf-4b21-92e4-bb339149f220'),
	('9598eb72-6f08-4e1c-be22-3702d4f79a40', 'AutofahrerMoerderUndVerbrecher', '2025-07-07 08:33:34.719769+00', '2cfdcdd5-1206-4438-b02c-cc3e4e25fc26');


--
-- Data for Name: members; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."members" ("user_id", "team_id") VALUES
	('3d2087b0-2f8d-4870-911f-d74b95c31d58', '48c2deab-4006-4846-8e43-0e5e7948f686'),
	('e5e4df08-a0b5-4201-8dab-985e4d644c36', 'f2a940e9-0ef3-43c0-83b2-bbe5f536c1ff'),
	('43acfefa-dc06-4e26-b4c9-9548ee71c19a', '48c2deab-4006-4846-8e43-0e5e7948f686'),
	('3ef92041-0ecf-4b21-92e4-bb339149f220', '1991f761-79a9-41c4-b2d9-ad66fe987ce4'),
	('2cfdcdd5-1206-4438-b02c-cc3e4e25fc26', '9598eb72-6f08-4e1c-be22-3702d4f79a40');


--
-- Data for Name: rides; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."rides" ("id", "user_id", "km", "created_at", "StartPoint") VALUES
	('98d8041f-aff9-432b-8db8-bc09b0201b27', '3d2087b0-2f8d-4870-911f-d74b95c31d58', 200, '2025-06-25 13:36:03.706631', '0101000020E6100000C070412173E91B40701E4FD690BA4940'),
	('e8b13a05-8be4-45e9-b1dd-9da24a6a841f', '43acfefa-dc06-4e26-b4c9-9548ee71c19a', 150, '2025-07-02 07:17:47.637771', '0101000020E6100000A02BC12853F11F40E079E7E09C1D4A40'),
	('9a47944e-0fcc-49e6-b61e-21f47cae9b4f', '43acfefa-dc06-4e26-b4c9-9548ee71c19a', 50, '2025-07-02 13:22:58.651656', '0101000020E6100000C095180416371F40F093FDEC4DB04940'),
	('292ef2e1-a480-4241-bdf7-67a035b51ee8', '3ef92041-0ecf-4b21-92e4-bb339149f220', 242, '2025-07-02 13:48:34.952346', '0101000020E6100000100F4C6B2AC93840B41AD6CE4F4C4740'),
	('c019bd9a-f21f-47e8-8174-2c04ad99ec6d', '3d2087b0-2f8d-4870-911f-d74b95c31d58', 60, '2025-07-07 08:32:32.902793', '0101000020E610000020988EEABA7A1B40E418F4C73BB04940'),
	('7e12e23a-b256-486f-84a9-d851ed081baa', '2cfdcdd5-1206-4438-b02c-cc3e4e25fc26', 15, '2025-07-07 08:34:10.516494', '0101000020E6100000005B5825347C1A40FCEB177B79B84940');


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 148, true);


--
-- PostgreSQL database dump complete
--

RESET ALL;
