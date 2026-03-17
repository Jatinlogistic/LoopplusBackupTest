--
-- PostgreSQL database dump
--

\restrict KPBA5q2XZrzIvkmcD1DlyaBeloWbPwOstqMgPDsuEqHZLizKetIglINk40sRbma

-- Dumped from database version 17.6
-- Dumped by pg_dump version 18.3 (Ubuntu 18.3-1.pgdg24.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- Name: EXTENSION pg_graphql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: vector; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS vector WITH SCHEMA public;


--
-- Name: EXTENSION vector; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION vector IS 'vector data type and ivfflat and hnsw access methods';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_authorization_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_authorization_status AS ENUM (
    'pending',
    'approved',
    'denied',
    'expired'
);


ALTER TYPE auth.oauth_authorization_status OWNER TO supabase_auth_admin;

--
-- Name: oauth_client_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_client_type AS ENUM (
    'public',
    'confidential'
);


ALTER TYPE auth.oauth_client_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_registration_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_registration_type AS ENUM (
    'dynamic',
    'manual'
);


ALTER TYPE auth.oauth_registration_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_response_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_response_type AS ENUM (
    'code'
);


ALTER TYPE auth.oauth_response_type OWNER TO supabase_auth_admin;

--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


ALTER TYPE auth.one_time_token_type OWNER TO supabase_auth_admin;

--
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE realtime.action OWNER TO supabase_admin;

--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


ALTER TYPE realtime.equality_op OWNER TO supabase_admin;

--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


ALTER TYPE realtime.user_defined_filter OWNER TO supabase_admin;

--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


ALTER TYPE realtime.wal_column OWNER TO supabase_admin;

--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


ALTER TYPE realtime.wal_rls OWNER TO supabase_admin;

--
-- Name: buckettype; Type: TYPE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TYPE storage.buckettype AS ENUM (
    'STANDARD',
    'ANALYTICS',
    'VECTOR'
);


ALTER TYPE storage.buckettype OWNER TO supabase_storage_admin;

--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    IF EXISTS (
      SELECT FROM pg_extension
      WHERE extname = 'pg_net'
      -- all versions in use on existing projects as of 2025-02-20
      -- version 0.12.0 onwards don't need these applied
      AND extversion IN ('0.2', '0.6', '0.7', '0.7.1', '0.8', '0.10.0', '0.11.0')
    ) THEN
      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

      REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
      REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

      GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
      GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    END IF;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: supabase_admin
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO ''
    AS $_$
  BEGIN
      RAISE DEBUG 'PgBouncer auth request: %', p_usename;

      RETURN QUERY
      SELECT
          rolname::text,
          CASE WHEN rolvaliduntil < now()
              THEN null
              ELSE rolpassword::text
          END
      FROM pg_authid
      WHERE rolname=$1 and rolcanlogin;
  END;
  $_$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO supabase_admin;

--
-- Name: drop_all_policies_on_table(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.drop_all_policies_on_table(table_name text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    policy_record RECORD;
BEGIN
    FOR policy_record IN 
        SELECT policyname 
        FROM pg_policies 
        WHERE tablename = table_name 
    LOOP
        EXECUTE format('DROP POLICY IF EXISTS %I ON public.%I', policy_record.policyname, table_name);
    END LOOP;
END;
$$;


ALTER FUNCTION public.drop_all_policies_on_table(table_name text) OWNER TO postgres;

--
-- Name: match_documents(public.vector, double precision, integer, uuid, uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.match_documents(query_embedding public.vector, match_threshold double precision, match_count integer, p_user_id uuid, p_university_id uuid) RETURNS TABLE(id uuid, content text, similarity double precision)
    LANGUAGE plpgsql
    AS $$
begin
  return query
  select
    document_chunks.id,
    document_chunks.content,
    1 - (document_chunks.embedding <=> query_embedding) as similarity
  from document_chunks
  join documents on documents.id = document_chunks.document_id
  where 1 - (document_chunks.embedding <=> query_embedding) > match_threshold
  and (p_university_id is null or document_chunks.university_id = p_university_id)
  -- Filter by visibility: Public OR Owned by user
  and (
    documents.visibility = 'public' 
    or (p_user_id is not null and documents.user_id = p_user_id)
  )
  order by document_chunks.embedding <=> query_embedding
  limit match_count;
end;
$$;


ALTER FUNCTION public.match_documents(query_embedding public.vector, match_threshold double precision, match_count integer, p_user_id uuid, p_university_id uuid) OWNER TO postgres;

--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_
        -- Filter by action early - only get subscriptions interested in this action
        -- action_filter column can be: '*' (all), 'INSERT', 'UPDATE', or 'DELETE'
        and (subs.action_filter = '*' or subs.action_filter = action::text);

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or (
                          action = 'DELETE'
                          and realtime.is_visible_through_filters(old_columns, subs.filters)
                        )
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;


ALTER FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: broadcast_changes(text, text, text, text, text, record, record, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text DEFAULT 'ROW'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    -- Declare a variable to hold the JSONB representation of the row
    row_data jsonb := '{}'::jsonb;
BEGIN
    IF level = 'STATEMENT' THEN
        RAISE EXCEPTION 'function can only be triggered for each row, not for each statement';
    END IF;
    -- Check the operation type and handle accordingly
    IF operation = 'INSERT' OR operation = 'UPDATE' OR operation = 'DELETE' THEN
        row_data := jsonb_build_object('old_record', OLD, 'record', NEW, 'operation', operation, 'table', table_name, 'schema', table_schema);
        PERFORM realtime.send (row_data, event_name, topic_name);
    ELSE
        RAISE EXCEPTION 'Unexpected operation type: %', operation;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to process the row: %', SQLERRM;
END;

$$;


ALTER FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) OWNER TO supabase_admin;

--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


ALTER FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) OWNER TO supabase_admin;

--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
declare
  res jsonb;
begin
  if type_::text = 'bytea' then
    return to_jsonb(val);
  end if;
  execute format('select to_jsonb(%L::'|| type_::text || ')', val) into res;
  return res;
end
$$;


ALTER FUNCTION realtime."cast"(val text, type_ regtype) OWNER TO supabase_admin;

--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) OWNER TO supabase_admin;

--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


ALTER FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) OWNER TO supabase_admin;

--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;


ALTER FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


ALTER FUNCTION realtime.quote_wal2json(entity regclass) OWNER TO supabase_admin;

--
-- Name: send(jsonb, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  generated_id uuid;
  final_payload jsonb;
BEGIN
  BEGIN
    -- Generate a new UUID for the id
    generated_id := gen_random_uuid();

    -- Check if payload has an 'id' key, if not, add the generated UUID
    IF payload ? 'id' THEN
      final_payload := payload;
    ELSE
      final_payload := jsonb_set(payload, '{id}', to_jsonb(generated_id));
    END IF;

    -- Set the topic configuration
    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    -- Attempt to insert the message
    INSERT INTO realtime.messages (id, payload, event, topic, private, extension)
    VALUES (generated_id, final_payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      -- Capture and notify the error
      RAISE WARNING 'ErrorSendingBroadcastMessage: %', SQLERRM;
  END;
END;
$$;


ALTER FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) OWNER TO supabase_admin;

--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


ALTER FUNCTION realtime.subscription_check_filters() OWNER TO supabase_admin;

--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION realtime.to_regrole(role_name text) OWNER TO supabase_admin;

--
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


ALTER FUNCTION realtime.topic() OWNER TO supabase_realtime_admin;

--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- Name: delete_leaf_prefixes(text[], text[]); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_leaf_prefixes(bucket_ids text[], names text[]) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_rows_deleted integer;
BEGIN
    LOOP
        WITH candidates AS (
            SELECT DISTINCT
                t.bucket_id,
                unnest(storage.get_prefixes(t.name)) AS name
            FROM unnest(bucket_ids, names) AS t(bucket_id, name)
        ),
        uniq AS (
             SELECT
                 bucket_id,
                 name,
                 storage.get_level(name) AS level
             FROM candidates
             WHERE name <> ''
             GROUP BY bucket_id, name
        ),
        leaf AS (
             SELECT
                 p.bucket_id,
                 p.name,
                 p.level
             FROM storage.prefixes AS p
                  JOIN uniq AS u
                       ON u.bucket_id = p.bucket_id
                           AND u.name = p.name
                           AND u.level = p.level
             WHERE NOT EXISTS (
                 SELECT 1
                 FROM storage.objects AS o
                 WHERE o.bucket_id = p.bucket_id
                   AND o.level = p.level + 1
                   AND o.name COLLATE "C" LIKE p.name || '/%'
             )
             AND NOT EXISTS (
                 SELECT 1
                 FROM storage.prefixes AS c
                 WHERE c.bucket_id = p.bucket_id
                   AND c.level = p.level + 1
                   AND c.name COLLATE "C" LIKE p.name || '/%'
             )
        )
        DELETE
        FROM storage.prefixes AS p
            USING leaf AS l
        WHERE p.bucket_id = l.bucket_id
          AND p.name = l.name
          AND p.level = l.level;

        GET DIAGNOSTICS v_rows_deleted = ROW_COUNT;
        EXIT WHEN v_rows_deleted = 0;
    END LOOP;
END;
$$;


ALTER FUNCTION storage.delete_leaf_prefixes(bucket_ids text[], names text[]) OWNER TO supabase_storage_admin;

--
-- Name: enforce_bucket_name_length(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.enforce_bucket_name_length() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
    if length(new.name) > 100 then
        raise exception 'bucket name "%" is too long (% characters). Max is 100.', new.name, length(new.name);
    end if;
    return new;
end;
$$;


ALTER FUNCTION storage.enforce_bucket_name_length() OWNER TO supabase_storage_admin;

--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
    _filename text;
BEGIN
    SELECT string_to_array(name, '/') INTO _parts;
    SELECT _parts[array_length(_parts,1)] INTO _filename;
    RETURN reverse(split_part(reverse(_filename), '.', 1));
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
BEGIN
    -- Split on "/" to get path segments
    SELECT string_to_array(name, '/') INTO _parts;
    -- Return everything except the last segment
    RETURN _parts[1 : array_length(_parts,1) - 1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_common_prefix(text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_common_prefix(p_key text, p_prefix text, p_delimiter text) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $$
SELECT CASE
    WHEN position(p_delimiter IN substring(p_key FROM length(p_prefix) + 1)) > 0
    THEN left(p_key, length(p_prefix) + position(p_delimiter IN substring(p_key FROM length(p_prefix) + 1)))
    ELSE NULL
END;
$$;


ALTER FUNCTION storage.get_common_prefix(p_key text, p_prefix text, p_delimiter text) OWNER TO supabase_storage_admin;

--
-- Name: get_level(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_level(name text) RETURNS integer
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
SELECT array_length(string_to_array("name", '/'), 1);
$$;


ALTER FUNCTION storage.get_level(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_prefix(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_prefix(name text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
SELECT
    CASE WHEN strpos("name", '/') > 0 THEN
             regexp_replace("name", '[\/]{1}[^\/]+\/?$', '')
         ELSE
             ''
        END;
$_$;


ALTER FUNCTION storage.get_prefix(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_prefixes(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_prefixes(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
DECLARE
    parts text[];
    prefixes text[];
    prefix text;
BEGIN
    -- Split the name into parts by '/'
    parts := string_to_array("name", '/');
    prefixes := '{}';

    -- Construct the prefixes, stopping one level below the last part
    FOR i IN 1..array_length(parts, 1) - 1 LOOP
            prefix := array_to_string(parts[1:i], '/');
            prefixes := array_append(prefixes, prefix);
    END LOOP;

    RETURN prefixes;
END;
$$;


ALTER FUNCTION storage.get_prefixes(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::bigint) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(_bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text, sort_order text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    v_peek_name TEXT;
    v_current RECORD;
    v_common_prefix TEXT;

    -- Configuration
    v_is_asc BOOLEAN;
    v_prefix TEXT;
    v_start TEXT;
    v_upper_bound TEXT;
    v_file_batch_size INT;

    -- Seek state
    v_next_seek TEXT;
    v_count INT := 0;

    -- Dynamic SQL for batch query only
    v_batch_query TEXT;

BEGIN
    -- ========================================================================
    -- INITIALIZATION
    -- ========================================================================
    v_is_asc := lower(coalesce(sort_order, 'asc')) = 'asc';
    v_prefix := coalesce(prefix_param, '');
    v_start := CASE WHEN coalesce(next_token, '') <> '' THEN next_token ELSE coalesce(start_after, '') END;
    v_file_batch_size := LEAST(GREATEST(max_keys * 2, 100), 1000);

    -- Calculate upper bound for prefix filtering (bytewise, using COLLATE "C")
    IF v_prefix = '' THEN
        v_upper_bound := NULL;
    ELSIF right(v_prefix, 1) = delimiter_param THEN
        v_upper_bound := left(v_prefix, -1) || chr(ascii(delimiter_param) + 1);
    ELSE
        v_upper_bound := left(v_prefix, -1) || chr(ascii(right(v_prefix, 1)) + 1);
    END IF;

    -- Build batch query (dynamic SQL - called infrequently, amortized over many rows)
    IF v_is_asc THEN
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" >= $2 ' ||
                'AND o.name COLLATE "C" < $3 ORDER BY o.name COLLATE "C" ASC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" >= $2 ' ||
                'ORDER BY o.name COLLATE "C" ASC LIMIT $4';
        END IF;
    ELSE
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" < $2 ' ||
                'AND o.name COLLATE "C" >= $3 ORDER BY o.name COLLATE "C" DESC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" < $2 ' ||
                'ORDER BY o.name COLLATE "C" DESC LIMIT $4';
        END IF;
    END IF;

    -- ========================================================================
    -- SEEK INITIALIZATION: Determine starting position
    -- ========================================================================
    IF v_start = '' THEN
        IF v_is_asc THEN
            v_next_seek := v_prefix;
        ELSE
            -- DESC without cursor: find the last item in range
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_next_seek FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_prefix AND o.name COLLATE "C" < v_upper_bound
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSIF v_prefix <> '' THEN
                SELECT o.name INTO v_next_seek FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_prefix
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSE
                SELECT o.name INTO v_next_seek FROM storage.objects o
                WHERE o.bucket_id = _bucket_id
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            END IF;

            IF v_next_seek IS NOT NULL THEN
                v_next_seek := v_next_seek || delimiter_param;
            ELSE
                RETURN;
            END IF;
        END IF;
    ELSE
        -- Cursor provided: determine if it refers to a folder or leaf
        IF EXISTS (
            SELECT 1 FROM storage.objects o
            WHERE o.bucket_id = _bucket_id
              AND o.name COLLATE "C" LIKE v_start || delimiter_param || '%'
            LIMIT 1
        ) THEN
            -- Cursor refers to a folder
            IF v_is_asc THEN
                v_next_seek := v_start || chr(ascii(delimiter_param) + 1);
            ELSE
                v_next_seek := v_start || delimiter_param;
            END IF;
        ELSE
            -- Cursor refers to a leaf object
            IF v_is_asc THEN
                v_next_seek := v_start || delimiter_param;
            ELSE
                v_next_seek := v_start;
            END IF;
        END IF;
    END IF;

    -- ========================================================================
    -- MAIN LOOP: Hybrid peek-then-batch algorithm
    -- Uses STATIC SQL for peek (hot path) and DYNAMIC SQL for batch
    -- ========================================================================
    LOOP
        EXIT WHEN v_count >= max_keys;

        -- STEP 1: PEEK using STATIC SQL (plan cached, very fast)
        IF v_is_asc THEN
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_next_seek AND o.name COLLATE "C" < v_upper_bound
                ORDER BY o.name COLLATE "C" ASC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_next_seek
                ORDER BY o.name COLLATE "C" ASC LIMIT 1;
            END IF;
        ELSE
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" < v_next_seek AND o.name COLLATE "C" >= v_prefix
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSIF v_prefix <> '' THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" < v_next_seek AND o.name COLLATE "C" >= v_prefix
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" < v_next_seek
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            END IF;
        END IF;

        EXIT WHEN v_peek_name IS NULL;

        -- STEP 2: Check if this is a FOLDER or FILE
        v_common_prefix := storage.get_common_prefix(v_peek_name, v_prefix, delimiter_param);

        IF v_common_prefix IS NOT NULL THEN
            -- FOLDER: Emit and skip to next folder (no heap access needed)
            name := rtrim(v_common_prefix, delimiter_param);
            id := NULL;
            updated_at := NULL;
            created_at := NULL;
            last_accessed_at := NULL;
            metadata := NULL;
            RETURN NEXT;
            v_count := v_count + 1;

            -- Advance seek past the folder range
            IF v_is_asc THEN
                v_next_seek := left(v_common_prefix, -1) || chr(ascii(delimiter_param) + 1);
            ELSE
                v_next_seek := v_common_prefix;
            END IF;
        ELSE
            -- FILE: Batch fetch using DYNAMIC SQL (overhead amortized over many rows)
            -- For ASC: upper_bound is the exclusive upper limit (< condition)
            -- For DESC: prefix is the inclusive lower limit (>= condition)
            FOR v_current IN EXECUTE v_batch_query USING _bucket_id, v_next_seek,
                CASE WHEN v_is_asc THEN COALESCE(v_upper_bound, v_prefix) ELSE v_prefix END, v_file_batch_size
            LOOP
                v_common_prefix := storage.get_common_prefix(v_current.name, v_prefix, delimiter_param);

                IF v_common_prefix IS NOT NULL THEN
                    -- Hit a folder: exit batch, let peek handle it
                    v_next_seek := v_current.name;
                    EXIT;
                END IF;

                -- Emit file
                name := v_current.name;
                id := v_current.id;
                updated_at := v_current.updated_at;
                created_at := v_current.created_at;
                last_accessed_at := v_current.last_accessed_at;
                metadata := v_current.metadata;
                RETURN NEXT;
                v_count := v_count + 1;

                -- Advance seek past this file
                IF v_is_asc THEN
                    v_next_seek := v_current.name || delimiter_param;
                ELSE
                    v_next_seek := v_current.name;
                END IF;

                EXIT WHEN v_count >= max_keys;
            END LOOP;
        END IF;
    END LOOP;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(_bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text, sort_order text) OWNER TO supabase_storage_admin;

--
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


ALTER FUNCTION storage.operation() OWNER TO supabase_storage_admin;

--
-- Name: protect_delete(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.protect_delete() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Check if storage.allow_delete_query is set to 'true'
    IF COALESCE(current_setting('storage.allow_delete_query', true), 'false') != 'true' THEN
        RAISE EXCEPTION 'Direct deletion from storage tables is not allowed. Use the Storage API instead.'
            USING HINT = 'This prevents accidental data loss from orphaned objects.',
                  ERRCODE = '42501';
    END IF;
    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.protect_delete() OWNER TO supabase_storage_admin;

--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    v_peek_name TEXT;
    v_current RECORD;
    v_common_prefix TEXT;
    v_delimiter CONSTANT TEXT := '/';

    -- Configuration
    v_limit INT;
    v_prefix TEXT;
    v_prefix_lower TEXT;
    v_is_asc BOOLEAN;
    v_order_by TEXT;
    v_sort_order TEXT;
    v_upper_bound TEXT;
    v_file_batch_size INT;

    -- Dynamic SQL for batch query only
    v_batch_query TEXT;

    -- Seek state
    v_next_seek TEXT;
    v_count INT := 0;
    v_skipped INT := 0;
BEGIN
    -- ========================================================================
    -- INITIALIZATION
    -- ========================================================================
    v_limit := LEAST(coalesce(limits, 100), 1500);
    v_prefix := coalesce(prefix, '') || coalesce(search, '');
    v_prefix_lower := lower(v_prefix);
    v_is_asc := lower(coalesce(sortorder, 'asc')) = 'asc';
    v_file_batch_size := LEAST(GREATEST(v_limit * 2, 100), 1000);

    -- Validate sort column
    CASE lower(coalesce(sortcolumn, 'name'))
        WHEN 'name' THEN v_order_by := 'name';
        WHEN 'updated_at' THEN v_order_by := 'updated_at';
        WHEN 'created_at' THEN v_order_by := 'created_at';
        WHEN 'last_accessed_at' THEN v_order_by := 'last_accessed_at';
        ELSE v_order_by := 'name';
    END CASE;

    v_sort_order := CASE WHEN v_is_asc THEN 'asc' ELSE 'desc' END;

    -- ========================================================================
    -- NON-NAME SORTING: Use path_tokens approach (unchanged)
    -- ========================================================================
    IF v_order_by != 'name' THEN
        RETURN QUERY EXECUTE format(
            $sql$
            WITH folders AS (
                SELECT path_tokens[$1] AS folder
                FROM storage.objects
                WHERE objects.name ILIKE $2 || '%%'
                  AND bucket_id = $3
                  AND array_length(objects.path_tokens, 1) <> $1
                GROUP BY folder
                ORDER BY folder %s
            )
            (SELECT folder AS "name",
                   NULL::uuid AS id,
                   NULL::timestamptz AS updated_at,
                   NULL::timestamptz AS created_at,
                   NULL::timestamptz AS last_accessed_at,
                   NULL::jsonb AS metadata FROM folders)
            UNION ALL
            (SELECT path_tokens[$1] AS "name",
                   id, updated_at, created_at, last_accessed_at, metadata
             FROM storage.objects
             WHERE objects.name ILIKE $2 || '%%'
               AND bucket_id = $3
               AND array_length(objects.path_tokens, 1) = $1
             ORDER BY %I %s)
            LIMIT $4 OFFSET $5
            $sql$, v_sort_order, v_order_by, v_sort_order
        ) USING levels, v_prefix, bucketname, v_limit, offsets;
        RETURN;
    END IF;

    -- ========================================================================
    -- NAME SORTING: Hybrid skip-scan with batch optimization
    -- ========================================================================

    -- Calculate upper bound for prefix filtering
    IF v_prefix_lower = '' THEN
        v_upper_bound := NULL;
    ELSIF right(v_prefix_lower, 1) = v_delimiter THEN
        v_upper_bound := left(v_prefix_lower, -1) || chr(ascii(v_delimiter) + 1);
    ELSE
        v_upper_bound := left(v_prefix_lower, -1) || chr(ascii(right(v_prefix_lower, 1)) + 1);
    END IF;

    -- Build batch query (dynamic SQL - called infrequently, amortized over many rows)
    IF v_is_asc THEN
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" >= $2 ' ||
                'AND lower(o.name) COLLATE "C" < $3 ORDER BY lower(o.name) COLLATE "C" ASC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" >= $2 ' ||
                'ORDER BY lower(o.name) COLLATE "C" ASC LIMIT $4';
        END IF;
    ELSE
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" < $2 ' ||
                'AND lower(o.name) COLLATE "C" >= $3 ORDER BY lower(o.name) COLLATE "C" DESC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" < $2 ' ||
                'ORDER BY lower(o.name) COLLATE "C" DESC LIMIT $4';
        END IF;
    END IF;

    -- Initialize seek position
    IF v_is_asc THEN
        v_next_seek := v_prefix_lower;
    ELSE
        -- DESC: find the last item in range first (static SQL)
        IF v_upper_bound IS NOT NULL THEN
            SELECT o.name INTO v_peek_name FROM storage.objects o
            WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_prefix_lower AND lower(o.name) COLLATE "C" < v_upper_bound
            ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
        ELSIF v_prefix_lower <> '' THEN
            SELECT o.name INTO v_peek_name FROM storage.objects o
            WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_prefix_lower
            ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
        ELSE
            SELECT o.name INTO v_peek_name FROM storage.objects o
            WHERE o.bucket_id = bucketname
            ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
        END IF;

        IF v_peek_name IS NOT NULL THEN
            v_next_seek := lower(v_peek_name) || v_delimiter;
        ELSE
            RETURN;
        END IF;
    END IF;

    -- ========================================================================
    -- MAIN LOOP: Hybrid peek-then-batch algorithm
    -- Uses STATIC SQL for peek (hot path) and DYNAMIC SQL for batch
    -- ========================================================================
    LOOP
        EXIT WHEN v_count >= v_limit;

        -- STEP 1: PEEK using STATIC SQL (plan cached, very fast)
        IF v_is_asc THEN
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_next_seek AND lower(o.name) COLLATE "C" < v_upper_bound
                ORDER BY lower(o.name) COLLATE "C" ASC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_next_seek
                ORDER BY lower(o.name) COLLATE "C" ASC LIMIT 1;
            END IF;
        ELSE
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" < v_next_seek AND lower(o.name) COLLATE "C" >= v_prefix_lower
                ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
            ELSIF v_prefix_lower <> '' THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" < v_next_seek AND lower(o.name) COLLATE "C" >= v_prefix_lower
                ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" < v_next_seek
                ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
            END IF;
        END IF;

        EXIT WHEN v_peek_name IS NULL;

        -- STEP 2: Check if this is a FOLDER or FILE
        v_common_prefix := storage.get_common_prefix(lower(v_peek_name), v_prefix_lower, v_delimiter);

        IF v_common_prefix IS NOT NULL THEN
            -- FOLDER: Handle offset, emit if needed, skip to next folder
            IF v_skipped < offsets THEN
                v_skipped := v_skipped + 1;
            ELSE
                name := split_part(rtrim(storage.get_common_prefix(v_peek_name, v_prefix, v_delimiter), v_delimiter), v_delimiter, levels);
                id := NULL;
                updated_at := NULL;
                created_at := NULL;
                last_accessed_at := NULL;
                metadata := NULL;
                RETURN NEXT;
                v_count := v_count + 1;
            END IF;

            -- Advance seek past the folder range
            IF v_is_asc THEN
                v_next_seek := lower(left(v_common_prefix, -1)) || chr(ascii(v_delimiter) + 1);
            ELSE
                v_next_seek := lower(v_common_prefix);
            END IF;
        ELSE
            -- FILE: Batch fetch using DYNAMIC SQL (overhead amortized over many rows)
            -- For ASC: upper_bound is the exclusive upper limit (< condition)
            -- For DESC: prefix_lower is the inclusive lower limit (>= condition)
            FOR v_current IN EXECUTE v_batch_query
                USING bucketname, v_next_seek,
                    CASE WHEN v_is_asc THEN COALESCE(v_upper_bound, v_prefix_lower) ELSE v_prefix_lower END, v_file_batch_size
            LOOP
                v_common_prefix := storage.get_common_prefix(lower(v_current.name), v_prefix_lower, v_delimiter);

                IF v_common_prefix IS NOT NULL THEN
                    -- Hit a folder: exit batch, let peek handle it
                    v_next_seek := lower(v_current.name);
                    EXIT;
                END IF;

                -- Handle offset skipping
                IF v_skipped < offsets THEN
                    v_skipped := v_skipped + 1;
                ELSE
                    -- Emit file
                    name := split_part(v_current.name, v_delimiter, levels);
                    id := v_current.id;
                    updated_at := v_current.updated_at;
                    created_at := v_current.created_at;
                    last_accessed_at := v_current.last_accessed_at;
                    metadata := v_current.metadata;
                    RETURN NEXT;
                    v_count := v_count + 1;
                END IF;

                -- Advance seek past this file
                IF v_is_asc THEN
                    v_next_seek := lower(v_current.name) || v_delimiter;
                ELSE
                    v_next_seek := lower(v_current.name);
                END IF;

                EXIT WHEN v_count >= v_limit;
            END LOOP;
        END IF;
    END LOOP;
END;
$_$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_by_timestamp(text, text, integer, integer, text, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_by_timestamp(p_prefix text, p_bucket_id text, p_limit integer, p_level integer, p_start_after text, p_sort_order text, p_sort_column text, p_sort_column_after text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    v_cursor_op text;
    v_query text;
    v_prefix text;
BEGIN
    v_prefix := coalesce(p_prefix, '');

    IF p_sort_order = 'asc' THEN
        v_cursor_op := '>';
    ELSE
        v_cursor_op := '<';
    END IF;

    v_query := format($sql$
        WITH raw_objects AS (
            SELECT
                o.name AS obj_name,
                o.id AS obj_id,
                o.updated_at AS obj_updated_at,
                o.created_at AS obj_created_at,
                o.last_accessed_at AS obj_last_accessed_at,
                o.metadata AS obj_metadata,
                storage.get_common_prefix(o.name, $1, '/') AS common_prefix
            FROM storage.objects o
            WHERE o.bucket_id = $2
              AND o.name COLLATE "C" LIKE $1 || '%%'
        ),
        -- Aggregate common prefixes (folders)
        -- Both created_at and updated_at use MIN(obj_created_at) to match the old prefixes table behavior
        aggregated_prefixes AS (
            SELECT
                rtrim(common_prefix, '/') AS name,
                NULL::uuid AS id,
                MIN(obj_created_at) AS updated_at,
                MIN(obj_created_at) AS created_at,
                NULL::timestamptz AS last_accessed_at,
                NULL::jsonb AS metadata,
                TRUE AS is_prefix
            FROM raw_objects
            WHERE common_prefix IS NOT NULL
            GROUP BY common_prefix
        ),
        leaf_objects AS (
            SELECT
                obj_name AS name,
                obj_id AS id,
                obj_updated_at AS updated_at,
                obj_created_at AS created_at,
                obj_last_accessed_at AS last_accessed_at,
                obj_metadata AS metadata,
                FALSE AS is_prefix
            FROM raw_objects
            WHERE common_prefix IS NULL
        ),
        combined AS (
            SELECT * FROM aggregated_prefixes
            UNION ALL
            SELECT * FROM leaf_objects
        ),
        filtered AS (
            SELECT *
            FROM combined
            WHERE (
                $5 = ''
                OR ROW(
                    date_trunc('milliseconds', %I),
                    name COLLATE "C"
                ) %s ROW(
                    COALESCE(NULLIF($6, '')::timestamptz, 'epoch'::timestamptz),
                    $5
                )
            )
        )
        SELECT
            split_part(name, '/', $3) AS key,
            name,
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
        FROM filtered
        ORDER BY
            COALESCE(date_trunc('milliseconds', %I), 'epoch'::timestamptz) %s,
            name COLLATE "C" %s
        LIMIT $4
    $sql$,
        p_sort_column,
        v_cursor_op,
        p_sort_column,
        p_sort_order,
        p_sort_order
    );

    RETURN QUERY EXECUTE v_query
    USING v_prefix, p_bucket_id, p_level, p_limit, p_start_after, p_sort_column_after;
END;
$_$;


ALTER FUNCTION storage.search_by_timestamp(p_prefix text, p_bucket_id text, p_limit integer, p_level integer, p_start_after text, p_sort_order text, p_sort_column text, p_sort_column_after text) OWNER TO supabase_storage_admin;

--
-- Name: search_legacy_v1(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select path_tokens[$1] as folder
           from storage.objects
             where objects.name ilike $2 || $3 || ''%''
               and bucket_id = $4
               and array_length(objects.path_tokens, 1) <> $1
           group by folder
           order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_v2(text, text, integer, integer, text, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer DEFAULT 100, levels integer DEFAULT 1, start_after text DEFAULT ''::text, sort_order text DEFAULT 'asc'::text, sort_column text DEFAULT 'name'::text, sort_column_after text DEFAULT ''::text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE
    v_sort_col text;
    v_sort_ord text;
    v_limit int;
BEGIN
    -- Cap limit to maximum of 1500 records
    v_limit := LEAST(coalesce(limits, 100), 1500);

    -- Validate and normalize sort_order
    v_sort_ord := lower(coalesce(sort_order, 'asc'));
    IF v_sort_ord NOT IN ('asc', 'desc') THEN
        v_sort_ord := 'asc';
    END IF;

    -- Validate and normalize sort_column
    v_sort_col := lower(coalesce(sort_column, 'name'));
    IF v_sort_col NOT IN ('name', 'updated_at', 'created_at') THEN
        v_sort_col := 'name';
    END IF;

    -- Route to appropriate implementation
    IF v_sort_col = 'name' THEN
        -- Use list_objects_with_delimiter for name sorting (most efficient: O(k * log n))
        RETURN QUERY
        SELECT
            split_part(l.name, '/', levels) AS key,
            l.name AS name,
            l.id,
            l.updated_at,
            l.created_at,
            l.last_accessed_at,
            l.metadata
        FROM storage.list_objects_with_delimiter(
            bucket_name,
            coalesce(prefix, ''),
            '/',
            v_limit,
            start_after,
            '',
            v_sort_ord
        ) l;
    ELSE
        -- Use aggregation approach for timestamp sorting
        -- Not efficient for large datasets but supports correct pagination
        RETURN QUERY SELECT * FROM storage.search_by_timestamp(
            prefix, bucket_name, v_limit, levels, start_after,
            v_sort_ord, v_sort_col, sort_column_after
        );
    END IF;
END;
$$;


ALTER FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer, levels integer, start_after text, sort_order text, sort_column text, sort_column_after text) OWNER TO supabase_storage_admin;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: custom_oauth_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.custom_oauth_providers (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    provider_type text NOT NULL,
    identifier text NOT NULL,
    name text NOT NULL,
    client_id text NOT NULL,
    client_secret text NOT NULL,
    acceptable_client_ids text[] DEFAULT '{}'::text[] NOT NULL,
    scopes text[] DEFAULT '{}'::text[] NOT NULL,
    pkce_enabled boolean DEFAULT true NOT NULL,
    attribute_mapping jsonb DEFAULT '{}'::jsonb NOT NULL,
    authorization_params jsonb DEFAULT '{}'::jsonb NOT NULL,
    enabled boolean DEFAULT true NOT NULL,
    email_optional boolean DEFAULT false NOT NULL,
    issuer text,
    discovery_url text,
    skip_nonce_check boolean DEFAULT false NOT NULL,
    cached_discovery jsonb,
    discovery_cached_at timestamp with time zone,
    authorization_url text,
    token_url text,
    userinfo_url text,
    jwks_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT custom_oauth_providers_authorization_url_https CHECK (((authorization_url IS NULL) OR (authorization_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_authorization_url_length CHECK (((authorization_url IS NULL) OR (char_length(authorization_url) <= 2048))),
    CONSTRAINT custom_oauth_providers_client_id_length CHECK (((char_length(client_id) >= 1) AND (char_length(client_id) <= 512))),
    CONSTRAINT custom_oauth_providers_discovery_url_length CHECK (((discovery_url IS NULL) OR (char_length(discovery_url) <= 2048))),
    CONSTRAINT custom_oauth_providers_identifier_format CHECK ((identifier ~ '^[a-z0-9][a-z0-9:-]{0,48}[a-z0-9]$'::text)),
    CONSTRAINT custom_oauth_providers_issuer_length CHECK (((issuer IS NULL) OR ((char_length(issuer) >= 1) AND (char_length(issuer) <= 2048)))),
    CONSTRAINT custom_oauth_providers_jwks_uri_https CHECK (((jwks_uri IS NULL) OR (jwks_uri ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_jwks_uri_length CHECK (((jwks_uri IS NULL) OR (char_length(jwks_uri) <= 2048))),
    CONSTRAINT custom_oauth_providers_name_length CHECK (((char_length(name) >= 1) AND (char_length(name) <= 100))),
    CONSTRAINT custom_oauth_providers_oauth2_requires_endpoints CHECK (((provider_type <> 'oauth2'::text) OR ((authorization_url IS NOT NULL) AND (token_url IS NOT NULL) AND (userinfo_url IS NOT NULL)))),
    CONSTRAINT custom_oauth_providers_oidc_discovery_url_https CHECK (((provider_type <> 'oidc'::text) OR (discovery_url IS NULL) OR (discovery_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_oidc_issuer_https CHECK (((provider_type <> 'oidc'::text) OR (issuer IS NULL) OR (issuer ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_oidc_requires_issuer CHECK (((provider_type <> 'oidc'::text) OR (issuer IS NOT NULL))),
    CONSTRAINT custom_oauth_providers_provider_type_check CHECK ((provider_type = ANY (ARRAY['oauth2'::text, 'oidc'::text]))),
    CONSTRAINT custom_oauth_providers_token_url_https CHECK (((token_url IS NULL) OR (token_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_token_url_length CHECK (((token_url IS NULL) OR (char_length(token_url) <= 2048))),
    CONSTRAINT custom_oauth_providers_userinfo_url_https CHECK (((userinfo_url IS NULL) OR (userinfo_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_userinfo_url_length CHECK (((userinfo_url IS NULL) OR (char_length(userinfo_url) <= 2048)))
);


ALTER TABLE auth.custom_oauth_providers OWNER TO supabase_auth_admin;

--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text,
    code_challenge_method auth.code_challenge_method,
    code_challenge text,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone,
    invite_token text,
    referrer text,
    oauth_client_state_id uuid,
    linking_target_id uuid,
    email_optional boolean DEFAULT false NOT NULL
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'Stores metadata for all OAuth/SSO login flows';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text,
    web_authn_session_data jsonb
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone,
    web_authn_credential jsonb,
    web_authn_aaguid uuid,
    last_webauthn_challenge_data jsonb
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: COLUMN mfa_factors.last_webauthn_challenge_data; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.mfa_factors.last_webauthn_challenge_data IS 'Stores the latest WebAuthn challenge data including attestation/assertion for customer verification';


--
-- Name: oauth_authorizations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_authorizations (
    id uuid NOT NULL,
    authorization_id text NOT NULL,
    client_id uuid NOT NULL,
    user_id uuid,
    redirect_uri text NOT NULL,
    scope text NOT NULL,
    state text,
    resource text,
    code_challenge text,
    code_challenge_method auth.code_challenge_method,
    response_type auth.oauth_response_type DEFAULT 'code'::auth.oauth_response_type NOT NULL,
    status auth.oauth_authorization_status DEFAULT 'pending'::auth.oauth_authorization_status NOT NULL,
    authorization_code text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    expires_at timestamp with time zone DEFAULT (now() + '00:03:00'::interval) NOT NULL,
    approved_at timestamp with time zone,
    nonce text,
    CONSTRAINT oauth_authorizations_authorization_code_length CHECK ((char_length(authorization_code) <= 255)),
    CONSTRAINT oauth_authorizations_code_challenge_length CHECK ((char_length(code_challenge) <= 128)),
    CONSTRAINT oauth_authorizations_expires_at_future CHECK ((expires_at > created_at)),
    CONSTRAINT oauth_authorizations_nonce_length CHECK ((char_length(nonce) <= 255)),
    CONSTRAINT oauth_authorizations_redirect_uri_length CHECK ((char_length(redirect_uri) <= 2048)),
    CONSTRAINT oauth_authorizations_resource_length CHECK ((char_length(resource) <= 2048)),
    CONSTRAINT oauth_authorizations_scope_length CHECK ((char_length(scope) <= 4096)),
    CONSTRAINT oauth_authorizations_state_length CHECK ((char_length(state) <= 4096))
);


ALTER TABLE auth.oauth_authorizations OWNER TO supabase_auth_admin;

--
-- Name: oauth_client_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_client_states (
    id uuid NOT NULL,
    provider_type text NOT NULL,
    code_verifier text,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE auth.oauth_client_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE oauth_client_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.oauth_client_states IS 'Stores OAuth states for third-party provider authentication flows where Supabase acts as the OAuth client.';


--
-- Name: oauth_clients; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_clients (
    id uuid NOT NULL,
    client_secret_hash text,
    registration_type auth.oauth_registration_type NOT NULL,
    redirect_uris text NOT NULL,
    grant_types text NOT NULL,
    client_name text,
    client_uri text,
    logo_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    client_type auth.oauth_client_type DEFAULT 'confidential'::auth.oauth_client_type NOT NULL,
    token_endpoint_auth_method text NOT NULL,
    CONSTRAINT oauth_clients_client_name_length CHECK ((char_length(client_name) <= 1024)),
    CONSTRAINT oauth_clients_client_uri_length CHECK ((char_length(client_uri) <= 2048)),
    CONSTRAINT oauth_clients_logo_uri_length CHECK ((char_length(logo_uri) <= 2048)),
    CONSTRAINT oauth_clients_token_endpoint_auth_method_check CHECK ((token_endpoint_auth_method = ANY (ARRAY['client_secret_basic'::text, 'client_secret_post'::text, 'none'::text])))
);


ALTER TABLE auth.oauth_clients OWNER TO supabase_auth_admin;

--
-- Name: oauth_consents; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_consents (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    client_id uuid NOT NULL,
    scopes text NOT NULL,
    granted_at timestamp with time zone DEFAULT now() NOT NULL,
    revoked_at timestamp with time zone,
    CONSTRAINT oauth_consents_revoked_after_granted CHECK (((revoked_at IS NULL) OR (revoked_at >= granted_at))),
    CONSTRAINT oauth_consents_scopes_length CHECK ((char_length(scopes) <= 2048)),
    CONSTRAINT oauth_consents_scopes_not_empty CHECK ((char_length(TRIM(BOTH FROM scopes)) > 0))
);


ALTER TABLE auth.oauth_consents OWNER TO supabase_auth_admin;

--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


ALTER TABLE auth.one_time_tokens OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text,
    oauth_client_id uuid,
    refresh_token_hmac_key text,
    refresh_token_counter bigint,
    scopes text,
    CONSTRAINT sessions_scopes_length CHECK ((char_length(scopes) <= 4096))
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: COLUMN sessions.refresh_token_hmac_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.refresh_token_hmac_key IS 'Holds a HMAC-SHA256 key used to sign refresh tokens for this session.';


--
-- Name: COLUMN sessions.refresh_token_counter; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.refresh_token_counter IS 'Holds the ID (counter) of the last issued refresh token.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    disabled boolean,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: ad_stats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ad_stats (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    total_ads integer DEFAULT 0,
    unclaimed_ads integer DEFAULT 0,
    free_months_from_ads integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ad_stats OWNER TO postgres;

--
-- Name: answer_ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.answer_ratings (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid,
    chat_id uuid,
    message_id uuid,
    rating integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    processed boolean DEFAULT false,
    content_hash text,
    CONSTRAINT answer_ratings_rating_check CHECK (((rating >= 0) AND (rating <= 10)))
);


ALTER TABLE public.answer_ratings OWNER TO postgres;

--
-- Name: best_of_materials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.best_of_materials (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    subject text NOT NULL,
    topic text NOT NULL,
    summary_text text,
    sample_questions jsonb,
    study_tips text,
    quality_score integer DEFAULT 0,
    embedding public.vector(1536),
    last_updated timestamp with time zone DEFAULT now(),
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.best_of_materials OWNER TO postgres;

--
-- Name: chats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chats (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid,
    university_id uuid,
    title text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.chats OWNER TO postgres;

--
-- Name: community_posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.community_posts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    forum text NOT NULL,
    title text NOT NULL,
    content text NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    university_id uuid,
    CONSTRAINT community_posts_content_check CHECK ((char_length(content) > 0)),
    CONSTRAINT community_posts_title_check CHECK (((char_length(title) > 0) AND (char_length(title) <= 500)))
);


ALTER TABLE public.community_posts OWNER TO postgres;

--
-- Name: courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courses (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    university_id uuid,
    user_id uuid,
    course_name text,
    course_number text,
    professor text,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.courses OWNER TO postgres;

--
-- Name: document_chunks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.document_chunks (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    document_id uuid,
    university_id uuid,
    chunk_index integer,
    content text NOT NULL,
    embedding public.vector(1536),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    course_number text,
    course_name text,
    professor text
);


ALTER TABLE public.document_chunks OWNER TO postgres;

--
-- Name: documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documents (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    university_id uuid,
    user_id uuid,
    visibility text DEFAULT 'private'::text NOT NULL,
    title text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    course_number text,
    course_name text,
    professor text,
    file_name text,
    storage_bucket text,
    storage_path text,
    CONSTRAINT documents_visibility_check CHECK ((visibility = ANY (ARRAY['private'::text, 'public'::text])))
);


ALTER TABLE public.documents OWNER TO postgres;

--
-- Name: friend_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.friend_details (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    friend_number integer NOT NULL,
    contact_info text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT friend_details_friend_number_check CHECK (((friend_number >= 1) AND (friend_number <= 3)))
);


ALTER TABLE public.friend_details OWNER TO postgres;

--
-- Name: messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.messages (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    chat_id uuid,
    user_id uuid,
    role text NOT NULL,
    content text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT messages_role_check CHECK ((role = ANY (ARRAY['system'::text, 'user'::text, 'assistant'::text])))
);


ALTER TABLE public.messages OWNER TO postgres;

--
-- Name: profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profiles (
    user_id uuid NOT NULL,
    university_id uuid,
    name text,
    email text,
    major text,
    minor text,
    year text,
    interests text,
    photo_url text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    academic_year text,
    graduation_school text
);


ALTER TABLE public.profiles OWNER TO postgres;

--
-- Name: referral_stats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.referral_stats (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    total_referrals integer DEFAULT 0,
    unclaimed_referrals integer DEFAULT 0,
    free_months_from_referrals integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    referral_code text,
    business_referral_code text,
    business_referrals_count integer DEFAULT 0,
    business_unclaimed_referrals integer DEFAULT 0,
    free_months_from_business integer DEFAULT 0
);


ALTER TABLE public.referral_stats OWNER TO postgres;

--
-- Name: subscription_free_month_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscription_free_month_history (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    source text NOT NULL,
    earned_units integer DEFAULT 0 NOT NULL,
    free_months integer DEFAULT 0 NOT NULL,
    days_added integer DEFAULT 0 NOT NULL,
    stripe_subscription_id text,
    status text NOT NULL,
    error_message text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT subscription_free_month_history_source_check CHECK ((source = ANY (ARRAY['ads'::text, 'referral'::text, 'business_referral'::text]))),
    CONSTRAINT subscription_free_month_history_status_check CHECK ((status = ANY (ARRAY['pending'::text, 'success'::text, 'failed'::text, 'revoked'::text])))
);


ALTER TABLE public.subscription_free_month_history OWNER TO postgres;

--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscriptions (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    stripe_customer_id text,
    stripe_subscription_id text,
    plan_family text,
    plan_interval text,
    is_paid_user boolean DEFAULT false,
    subscription_status text,
    trial_end timestamp with time zone,
    early_bird_eligible boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    CONSTRAINT subscriptions_plan_family_check CHECK ((plan_family = ANY (ARRAY['LoopPlus'::text, 'SuperLoop'::text, 'SuperLoopEarlyBird'::text, 'LoopPlusEarlyBird'::text]))),
    CONSTRAINT subscriptions_plan_interval_check CHECK ((plan_interval = ANY (ARRAY['monthly'::text, 'yearly'::text]))),
    CONSTRAINT subscriptions_subscription_status_check CHECK ((subscription_status = ANY (ARRAY['active'::text, 'canceled'::text, 'trialing'::text])))
);


ALTER TABLE public.subscriptions OWNER TO postgres;

--
-- Name: universities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.universities (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    slug text NOT NULL,
    name text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.universities OWNER TO postgres;

--
-- Name: university_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.university_links (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    university_id uuid NOT NULL,
    url text NOT NULL,
    category text NOT NULL,
    description text,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.university_links OWNER TO postgres;

--
-- Name: user_devices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_devices (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid,
    device_id text NOT NULL,
    device_label text,
    is_active boolean DEFAULT false NOT NULL,
    first_seen_at timestamp with time zone DEFAULT now() NOT NULL,
    last_seen_at timestamp with time zone DEFAULT now() NOT NULL,
    ip_hash text
);


ALTER TABLE public.user_devices OWNER TO postgres;

--
-- Name: user_usage_monthly; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_usage_monthly (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid,
    year integer NOT NULL,
    month integer NOT NULL,
    tokens_in bigint DEFAULT 0 NOT NULL,
    tokens_out bigint DEFAULT 0 NOT NULL,
    requests integer DEFAULT 0 NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.user_usage_monthly OWNER TO postgres;

--
-- Name: messages; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.messages (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
)
PARTITION BY RANGE (inserted_at);


ALTER TABLE realtime.messages OWNER TO supabase_realtime_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    action_filter text DEFAULT '*'::text,
    CONSTRAINT subscription_action_filter_check CHECK ((action_filter = ANY (ARRAY['*'::text, 'INSERT'::text, 'UPDATE'::text, 'DELETE'::text])))
);


ALTER TABLE realtime.subscription OWNER TO supabase_admin;

--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text,
    type storage.buckettype DEFAULT 'STANDARD'::storage.buckettype NOT NULL
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: buckets_analytics; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets_analytics (
    name text NOT NULL,
    type storage.buckettype DEFAULT 'ANALYTICS'::storage.buckettype NOT NULL,
    format text DEFAULT 'ICEBERG'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE storage.buckets_analytics OWNER TO supabase_storage_admin;

--
-- Name: buckets_vectors; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets_vectors (
    id text NOT NULL,
    type storage.buckettype DEFAULT 'VECTOR'::storage.buckettype NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.buckets_vectors OWNER TO supabase_storage_admin;

--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- Name: vector_indexes; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.vector_indexes (
    id text DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    bucket_id text NOT NULL,
    data_type text NOT NULL,
    dimension integer NOT NULL,
    distance_metric text NOT NULL,
    metadata_configuration jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.vector_indexes OWNER TO supabase_storage_admin;

--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
\.


--
-- Data for Name: custom_oauth_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.custom_oauth_providers (id, provider_type, identifier, name, client_id, client_secret, acceptable_client_ids, scopes, pkce_enabled, attribute_mapping, authorization_params, enabled, email_optional, issuer, discovery_url, skip_nonce_check, cached_discovery, discovery_cached_at, authorization_url, token_url, userinfo_url, jwks_uri, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at, invite_token, referrer, oauth_client_state_id, linking_target_id, email_optional) FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
b3ec626f-8311-40ae-882f-4d67bfe75163	b3ec626f-8311-40ae-882f-4d67bfe75163	{"sub": "b3ec626f-8311-40ae-882f-4d67bfe75163", "name": "Jatin Test", "year": "freshman", "email": "demoemail7564@gmail.com", "major": "Engineering", "minor": null, "university_id": "296f159b-5540-4b59-8409-f5bf9f8d6c1e", "email_verified": true, "phone_verified": false, "university_name": "Florida State University"}	email	2026-03-12 06:12:51.105295+00	2026-03-12 06:12:51.105348+00	2026-03-12 06:12:51.105348+00	ee0840c5-af01-4a71-a3b6-3ac0d9643614
31cc7cef-c734-4a0d-8368-10440ee52424	31cc7cef-c734-4a0d-8368-10440ee52424	{"sub": "31cc7cef-c734-4a0d-8368-10440ee52424", "name": "AA", "year": "freshman", "email": "ohre255@gmail.com", "major": "biology", "minor": "finance", "university_id": "db3845d2-5679-4d84-9856-8ff2c82edc4e", "email_verified": true, "phone_verified": false, "university_name": "University of Cincinnati"}	email	2026-03-09 22:32:19.449977+00	2026-03-09 22:32:19.450026+00	2026-03-09 22:32:19.450026+00	eb894d27-8d70-4ebb-8753-134e344a8a11
73692819-0476-4078-9ee9-f66d9b60ed5f	73692819-0476-4078-9ee9-f66d9b60ed5f	{"sub": "73692819-0476-4078-9ee9-f66d9b60ed5f", "email": "swapnil@logisticinfotech.co.in", "email_verified": true, "phone_verified": false}	email	2026-01-19 14:35:51.333578+00	2026-01-19 14:35:51.334386+00	2026-01-19 14:35:51.334386+00	5b485c50-9f69-48fb-96c3-d162d001f3cf
9d84eef9-5c54-4a94-b69d-51e82faaee73	9d84eef9-5c54-4a94-b69d-51e82faaee73	{"sub": "9d84eef9-5c54-4a94-b69d-51e82faaee73", "name": "wede", "year": "sophomore", "email": "riyasindhav2003@gmail.com", "major": null, "minor": "sdfc", "university_id": "296f159b-5540-4b59-8409-f5bf9f8d6c1e", "email_verified": true, "phone_verified": false, "university_name": "Florida State University"}	email	2026-02-25 06:01:57.218403+00	2026-02-25 06:01:57.218457+00	2026-02-25 06:01:57.218457+00	724c42be-586a-45b7-b2a3-168088ddfd78
de1dc022-ea84-4098-9ac7-5952270495cb	de1dc022-ea84-4098-9ac7-5952270495cb	{"sub": "de1dc022-ea84-4098-9ac7-5952270495cb", "name": "Jatin", "year": "freshman", "email": "jatinsanchaniya9122@gmail.com", "major": "Engineering", "minor": null, "university_id": "db3845d2-5679-4d84-9856-8ff2c82edc4e", "email_verified": true, "phone_verified": false, "university_name": "University of Cincinnati"}	email	2026-03-10 05:18:20.305129+00	2026-03-10 05:18:20.305175+00	2026-03-10 05:18:20.305175+00	757b56aa-2909-43aa-8b14-fccefbc43a66
0dc711bb-e6c7-47e3-9245-be65bb8d1e11	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	{"sub": "0dc711bb-e6c7-47e3-9245-be65bb8d1e11", "name": "test_reward", "year": "freshman", "email": "coxowe9564@faxzu.com", "major": null, "minor": "Computer Science", "university_id": "296f159b-5540-4b59-8409-f5bf9f8d6c1e", "email_verified": true, "phone_verified": false, "university_name": "Florida State University"}	email	2026-03-13 11:14:40.479428+00	2026-03-13 11:14:40.479474+00	2026-03-13 11:14:40.479474+00	af47e94a-fcd4-4924-933a-aa661b666ea2
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
94c0e373-07a9-4a67-bdbe-7f685de4a677	2026-03-10 05:25:43.730964+00	2026-03-10 05:25:43.730964+00	otp	fa59f8e8-b533-4908-8c0a-bf2e881ebd98
7a2b42a4-e780-46a9-a956-84750183871d	2026-03-10 09:55:49.057761+00	2026-03-10 09:55:49.057761+00	password	f2f0d343-2851-44ce-8ef5-6a7b2dcfbe7f
960e465f-091a-4dcb-9ea6-5db284f0ddd4	2026-03-10 12:48:06.960761+00	2026-03-10 12:48:06.960761+00	password	293273bd-6ec6-4cae-8aa2-716998a7b340
75ca43a6-3288-419b-8743-8f219c42fd74	2026-03-10 12:49:52.518892+00	2026-03-10 12:49:52.518892+00	password	dabccb7c-8916-4219-b1a9-fbac67fb3f09
143ea540-aa08-455e-90b9-303f7303a177	2026-03-11 02:17:38.488053+00	2026-03-11 02:17:38.488053+00	password	ded9854d-3d03-4204-842c-62605a52b139
7f04795e-6ce1-4eba-a779-cf8e0454b8a0	2026-03-11 11:47:41.756756+00	2026-03-11 11:47:41.756756+00	password	ba389947-0396-40cf-ad25-8d0fd31aece3
d6b1b72a-ded3-41b4-a0da-82ffbdabce7b	2026-03-11 14:16:01.284883+00	2026-03-11 14:16:01.284883+00	password	ad4a65dc-1d94-42cc-8573-b4915da9024e
f08d5af8-1ea1-47c0-8a6d-54feec7a21d0	2026-03-12 06:08:05.955296+00	2026-03-12 06:08:05.955296+00	password	2b2661ff-5cd4-434b-8d96-38aaf3df49a7
c0631152-39aa-44c7-bca5-d5dd0cdc1fb7	2026-03-12 06:13:24.061163+00	2026-03-12 06:13:24.061163+00	otp	52d0da4d-f37d-4b2d-9ab3-d027efe8d9de
f9d13ec4-2c89-4c6b-9e6b-8b29ccc935a1	2026-03-12 08:22:32.789493+00	2026-03-12 08:22:32.789493+00	password	eb421e02-e517-4238-bdb3-57e71a4579a9
a599f3b1-cd36-49b9-adb8-0ffdfcb34bc8	2026-03-12 12:24:23.964636+00	2026-03-12 12:24:23.964636+00	password	1b92f945-2f7a-49dd-bf77-83e79c150c5b
14d6533f-6b13-4778-aa08-aefafd966f89	2026-02-25 06:24:38.460668+00	2026-02-25 06:24:38.460668+00	otp	7f4b52c8-d50a-40de-84dc-1afd7aa5db78
09c000ef-b3e9-4729-bfdd-45f3f21578e7	2026-02-25 06:25:05.007528+00	2026-02-25 06:25:05.007528+00	password	bb63e66a-4ff0-410a-ac6b-2e7b784d22f6
73c7192e-65b8-47bd-b0e7-2ee5a05b6999	2026-02-25 06:53:58.030802+00	2026-02-25 06:53:58.030802+00	password	568b075e-0664-46e2-982a-d5012e103ebc
aac3f3c5-35f3-441a-8ac9-40b7cdb2a335	2026-02-25 06:54:42.340075+00	2026-02-25 06:54:42.340075+00	password	7ca0f747-1f37-4384-a0df-8c118f447481
f8e0f6bf-bbce-4446-a7f9-f5accd4cbe07	2026-03-12 12:25:37.441685+00	2026-03-12 12:25:37.441685+00	password	35434dbd-4aeb-4198-82ba-01765d4021ce
b0b89ab2-4c88-4109-833e-f0d825d46b6f	2026-02-25 10:22:48.786745+00	2026-02-25 10:22:48.786745+00	password	8b3d14ba-5e7b-4752-831e-bae77f846eef
7838f368-8084-4ae6-bbe0-df7735fd5f40	2026-03-12 12:32:13.370455+00	2026-03-12 12:32:13.370455+00	password	8a8b6d49-2bf7-46b2-bc55-7cb4f0827031
430d614f-05af-4e7d-bc10-ed6b213807c2	2026-02-26 05:55:50.047343+00	2026-02-26 05:55:50.047343+00	password	de2b72b7-bad3-4f48-b040-6b41200817bc
705d8bf4-2351-4806-a7bd-f91650184c28	2026-02-26 05:57:07.115383+00	2026-02-26 05:57:07.115383+00	password	f7794566-3cec-4789-a422-2b8e289e753b
2baa7522-47ad-4746-86f1-990dbee6a943	2026-03-12 12:39:50.808903+00	2026-03-12 12:39:50.808903+00	password	04b20555-ab02-4d00-802d-5fcd93b11d42
369a3098-ecca-4e8e-af5e-cfa56b4b32b3	2026-03-12 12:41:29.486088+00	2026-03-12 12:41:29.486088+00	password	50e9e9e1-a8ba-47f0-bcab-2dd8d93e580b
04d04a5e-46f3-427f-97f5-5c68da109875	2026-02-26 05:57:20.725634+00	2026-02-26 05:57:20.725634+00	password	f8559bde-ff5b-4c81-a91f-9f07e0cec839
6d59bfe4-37df-4293-a541-2b00817e51a3	2026-03-12 12:48:18.231566+00	2026-03-12 12:48:18.231566+00	password	2b3231b7-6a75-416a-b1f9-1574709ffedd
e2b8cea9-e8ca-40a3-abf3-737adf3cc15e	2026-03-12 12:53:43.93879+00	2026-03-12 12:53:43.93879+00	password	736d7d62-cb10-402d-8080-c739e77894a9
4c3628d5-5880-421c-9f67-4d3eba53b35a	2026-02-26 05:58:05.270205+00	2026-02-26 05:58:05.270205+00	password	5c2bdbbd-2380-4ca5-bfc9-bcc8f392ad35
427878d3-9ec9-4a92-b522-26ed6216f653	2026-03-12 13:08:15.619244+00	2026-03-12 13:08:15.619244+00	password	c6ae9d90-f949-45d8-8728-bc4079c83b5a
6979dd2c-d884-47f5-a5e2-2cbc1c43db92	2026-03-12 13:08:30.553503+00	2026-03-12 13:08:30.553503+00	password	ba293414-0fac-44e0-b92a-5ef46031dfb1
4bf898db-9494-48c0-8668-84818d468175	2026-03-03 13:49:05.896443+00	2026-03-03 13:49:05.896443+00	password	7021197e-f7ea-4d1d-bf1b-c5b6d5775a23
64a936b5-a4e9-4a98-888e-8c51e00ad2d9	2026-03-12 13:12:38.204295+00	2026-03-12 13:12:38.204295+00	password	fa3a8b68-1e8c-4fad-a456-f3fe0f1f8d43
af40f740-4519-4492-b301-c675eac0ef94	2026-03-12 13:14:59.244119+00	2026-03-12 13:14:59.244119+00	password	8bdb16dc-eb9c-4581-8db0-0c22e5064aa4
c17f9510-5994-4e2b-b1da-36647b5afa7a	2026-02-17 13:52:33.968802+00	2026-02-17 13:52:33.968802+00	otp	5bd3c0a1-42be-4c56-8e18-f71870082797
323c06f6-5104-4602-9dd4-b87878ae4ef8	2026-03-12 13:32:54.053325+00	2026-03-12 13:32:54.053325+00	password	790237d3-44f7-4c9a-aec4-beaa32838018
f1a85528-b800-4fb2-8252-3ff4fbf3d7d6	2026-03-13 05:49:35.866632+00	2026-03-13 05:49:35.866632+00	password	da32d46d-b3d4-4c02-b86e-3342768be1d7
0b65d8f7-602e-4ac4-ba24-1251ee3ed0bd	2026-03-13 09:42:54.523665+00	2026-03-13 09:42:54.523665+00	password	6924209d-cec5-40b3-829a-fe69269e544c
ab77b6d0-c114-42e0-b1d0-4ed68cf633d5	2026-03-06 07:09:10.299175+00	2026-03-06 07:09:10.299175+00	password	c9f11f45-1f0a-4e77-8469-2b6bf3dc3376
0c2a79fb-dd85-4361-be70-e2edd6677932	2026-03-13 09:53:18.976108+00	2026-03-13 09:53:18.976108+00	password	5395efd4-71a1-414d-a302-464b92c2077a
b7843ba2-e005-42ec-9369-8e478b7c2993	2026-03-13 10:15:03.578057+00	2026-03-13 10:15:03.578057+00	password	80df5eef-e77f-4429-9c62-3e9cc9c9a2ee
2d9f5844-63d2-401b-ab51-a30d1e8d0051	2026-03-09 22:34:02.712383+00	2026-03-09 22:34:02.712383+00	otp	1bd46e70-656f-4c7f-ae94-897f4d246d0a
00cb2b22-8487-4330-a6c3-c7c5ba676f77	2026-03-09 22:34:31.350603+00	2026-03-09 22:34:31.350603+00	password	31f61786-692f-4834-a911-36897c1007bb
f6535a4f-66f8-4753-ac40-c609ec6ea7e3	2026-03-09 22:59:14.125788+00	2026-03-09 22:59:14.125788+00	password	6322cc91-c50f-4c3e-a2da-06bb78cd13bf
ec552c3f-10bd-42f6-9b4f-0e6c03e9a1c8	2026-03-13 10:27:48.698139+00	2026-03-13 10:27:48.698139+00	password	29a4395f-2540-4aae-a04a-18c52aeb1b35
a8d24ea5-ad85-48ee-889a-a0e3ba2e1ed5	2026-03-13 10:31:52.827283+00	2026-03-13 10:31:52.827283+00	password	0dbc3f88-177b-4e57-ab11-808b5d2eba84
3db1a5a4-5d7e-4cea-9370-d95f1a142867	2026-03-13 11:15:03.871288+00	2026-03-13 11:15:03.871288+00	otp	c8b58e36-53fa-4a51-ad0a-7a98c6cd8fa9
6645979d-a485-44c9-94c8-2b87e081c735	2026-03-13 11:16:54.575057+00	2026-03-13 11:16:54.575057+00	password	ab6a4101-5124-433c-8247-c010758d1d0c
58c090c6-d4ea-4c6c-9f88-1e2cd9879ed8	2026-03-13 13:17:18.06682+00	2026-03-13 13:17:18.06682+00	password	81037bdc-1bde-45e5-8dd9-4fb25b538c7d
f9095374-8d70-4e81-8acd-9c5577aefd94	2026-03-13 13:24:22.994115+00	2026-03-13 13:24:22.994115+00	password	f53cce60-f23f-4008-8f17-516a3d19f373
dc14b904-2e11-495e-ba6a-5a34d37eb128	2026-03-16 12:49:35.366831+00	2026-03-16 12:49:35.366831+00	password	2a65e6f6-c742-4111-bb94-0515bdbd444e
c217fe4b-481a-4fca-8691-8789a695de9e	2026-03-16 12:49:57.503756+00	2026-03-16 12:49:57.503756+00	password	80d4abce-3399-4ede-999c-99a829c1b4ac
f3d3f100-c557-4c47-a999-eac60c0b0fef	2026-03-16 12:52:02.709219+00	2026-03-16 12:52:02.709219+00	password	68c399fd-0c08-4e5a-8412-c64e586d4af1
6e3dc2c8-8904-4622-a1f5-b6d196da73e1	2026-03-16 13:06:47.345693+00	2026-03-16 13:06:47.345693+00	password	41a1fc02-2ace-4bad-8ef5-df4920104335
221cc649-f65b-432a-96a1-62d81cdc2997	2026-03-16 13:07:22.459884+00	2026-03-16 13:07:22.459884+00	password	6e87823a-1331-4bea-bcd6-b730387ead03
8b7f6a48-e7bc-4d2b-bf22-894d1496d736	2026-03-16 13:07:45.224744+00	2026-03-16 13:07:45.224744+00	password	7c27d766-8e81-4710-a98c-35dbbc4402ee
d0e0f19d-188f-4212-8f7e-1e076d133aab	2026-03-16 13:08:13.931043+00	2026-03-16 13:08:13.931043+00	password	887c65de-883d-4307-9620-e2b0197d578f
7ae03a97-66dd-4c9a-9956-343e7d888416	2026-03-16 13:08:24.150213+00	2026-03-16 13:08:24.150213+00	password	16500668-bcc9-4439-a8b9-e0230864d087
b7ac13b6-634a-44c4-b221-9998b690ddba	2026-03-16 13:08:50.810425+00	2026-03-16 13:08:50.810425+00	password	e4ff11f3-49a8-4593-b389-cb632ec1dc9b
06526c35-f388-4ab0-8f80-40d939e449b0	2026-03-16 13:09:04.671969+00	2026-03-16 13:09:04.671969+00	password	0b188ee7-15d6-41fa-9f18-5155a22db682
dcfe4b0b-7fa1-4316-8dba-df7db68a6c6b	2026-03-16 13:17:42.183054+00	2026-03-16 13:17:42.183054+00	password	f158fdef-0284-4c42-89dc-25f5656de3aa
81c406e3-e83b-49b6-a6ff-cb36b2e258aa	2026-03-16 13:25:51.402331+00	2026-03-16 13:25:51.402331+00	password	c537a3fc-eb7e-4f24-824b-88908e954728
fd2bdc72-baaf-421e-b32b-f99142111e00	2026-03-16 13:26:13.068372+00	2026-03-16 13:26:13.068372+00	password	346fa2a3-977e-4d97-bca5-725cdaa13313
94a8ad15-ad23-4060-b8f0-ac82459aa3bb	2026-03-16 13:57:23.383704+00	2026-03-16 13:57:23.383704+00	password	1125b97a-4a4d-4fcf-bcf0-1887ecfb4c01
783405cc-a0f9-413c-941b-4b260c298cc7	2026-03-16 13:57:31.848041+00	2026-03-16 13:57:31.848041+00	password	af211bad-4a79-4174-968a-a89ce22f2b31
969e7a8f-4493-4901-bb13-1022579fe89c	2026-03-16 14:04:13.34174+00	2026-03-16 14:04:13.34174+00	password	07711d10-e445-4fae-8f33-bc6ff13cfe22
b9fd47f5-face-4c6a-b72a-4c9b490db883	2026-03-16 14:13:50.941581+00	2026-03-16 14:13:50.941581+00	password	dbca9fbb-f521-4510-93a5-4a7044c00384
83515b35-df88-4ffb-9b9a-ee91b9a277dd	2026-03-16 14:14:13.200943+00	2026-03-16 14:14:13.200943+00	password	09d9000b-d8bf-4c03-971b-1f874d0a9126
a20299bb-5c06-46ef-bb3e-3ea7f1b46d9d	2026-03-16 14:15:08.980181+00	2026-03-16 14:15:08.980181+00	password	5ffa673e-3cd1-4897-b2f4-41f3a3714734
dd19bc5b-fbbc-44d2-b308-8b528d5960cd	2026-03-16 14:17:34.753188+00	2026-03-16 14:17:34.753188+00	password	bd7316dd-ea01-40cb-9db1-308fe88684e5
cf33d9d9-a57a-493e-8e8a-d626a049ffb0	2026-03-16 14:18:16.745492+00	2026-03-16 14:18:16.745492+00	password	d2d875bd-0d8b-4b82-92a4-95661707ea62
ad1d521a-b557-4097-84ec-e003ca0bf04f	2026-03-16 14:18:35.622037+00	2026-03-16 14:18:35.622037+00	password	87aefd1b-f082-4f0c-8a3e-673ed880531d
cbc2276d-2d2a-4d91-9240-1aa118db0e7a	2026-03-16 14:18:44.802506+00	2026-03-16 14:18:44.802506+00	password	df562521-864a-4fcf-976f-c9c8e1c0469d
286dffae-e9c1-4aee-b383-19f79f0b1862	2026-03-16 14:19:04.880426+00	2026-03-16 14:19:04.880426+00	password	28246d2b-e972-4431-89b6-ce91f8e23671
3737d488-4e06-43c4-942a-f8d4cadeb0ec	2026-03-16 14:19:32.336343+00	2026-03-16 14:19:32.336343+00	password	3228744b-e84b-4785-aaa3-26977b31649f
edf3d02f-6b80-4951-8b25-4d0ca99ac201	2026-03-16 14:19:42.006534+00	2026-03-16 14:19:42.006534+00	password	81e4c5fc-d785-42f2-9fca-6668fc40c49b
be807c25-4770-4b8e-96e6-f9ece08ee981	2026-03-16 14:21:15.604724+00	2026-03-16 14:21:15.604724+00	password	622fbae8-0723-40e2-a372-84134532f9b8
e44dbf56-e23c-4fe5-b07a-3c9eb3239a55	2026-03-16 14:21:25.220932+00	2026-03-16 14:21:25.220932+00	password	5a30bef3-f37f-4148-9065-5139c5a114f4
c71fe324-eaa0-4ef5-81c3-928d90846dab	2026-03-16 14:21:37.624818+00	2026-03-16 14:21:37.624818+00	password	2afabcd3-d01a-4c83-813b-1b6e0ca4ef41
a95968aa-11db-4854-b7f6-dea052199221	2026-03-16 14:22:29.620683+00	2026-03-16 14:22:29.620683+00	password	4616a7ae-f0c9-4849-9cd4-c8b00129e424
e7f4d24a-b4d9-4274-a2b7-dbc6c7ce4544	2026-03-16 14:23:28.916321+00	2026-03-16 14:23:28.916321+00	password	a8a3407c-167f-4897-8460-4915a7e09921
fa75b30c-6baf-43ca-aa62-3c7a5f3319be	2026-03-16 14:26:55.888029+00	2026-03-16 14:26:55.888029+00	password	bbf4b0b3-0bef-4ae8-98d9-b8e557ad6e77
18acca89-2d20-4734-acf5-c6be501b667d	2026-03-16 14:27:06.626717+00	2026-03-16 14:27:06.626717+00	password	1cd76280-578c-49cb-8040-f477d80f8f4d
dd3232d0-d00a-49eb-bd28-3be2389c7da9	2026-03-16 14:28:55.354638+00	2026-03-16 14:28:55.354638+00	password	d6ae0f71-1cad-4ad3-9731-905cb8169c74
eda374e2-2643-490e-86b6-04f5f84c0c7d	2026-03-16 14:29:25.899932+00	2026-03-16 14:29:25.899932+00	password	5ca376a0-dde1-4ecb-a499-2b60bc4d01a3
e4d57708-a049-48cb-aab0-afcc7524fe67	2026-03-16 14:32:30.539111+00	2026-03-16 14:32:30.539111+00	password	6f7d9d85-bec6-487c-8abe-43cfb54a43de
d5b9f541-c734-45a9-aa7b-f65b3dc2f999	2026-03-16 14:32:40.109172+00	2026-03-16 14:32:40.109172+00	password	5260994c-f020-463c-80c7-c0d7afd548ee
77388399-7030-4b18-ad54-1c95bf143f4d	2026-03-16 14:37:26.169276+00	2026-03-16 14:37:26.169276+00	password	087ec494-bd4e-4054-b7e2-cfd5cb3c03de
bc52457b-059b-4568-88e0-294b8507f512	2026-03-16 14:38:14.936861+00	2026-03-16 14:38:14.936861+00	password	882e7d89-c212-4989-b233-591b05d08013
361f58b8-2354-40c2-9afd-bc72eaf5f989	2026-03-16 14:41:25.38901+00	2026-03-16 14:41:25.38901+00	password	85f592d7-2193-49a0-b9f2-a93b7ab29147
42c25c19-8977-4000-9aa3-f8fdfa92a20e	2026-03-16 14:43:38.701562+00	2026-03-16 14:43:38.701562+00	password	d12c1c8c-9123-401e-b24b-f0b1e6a634ee
dc212127-7abc-4da9-be47-44cd64f2cbe6	2026-03-16 14:44:01.090108+00	2026-03-16 14:44:01.090108+00	password	3d948c9a-7a7b-4b4e-84f6-415b45a2b6a6
c9d22ece-1f46-4fdb-b856-cbc751e9077e	2026-03-16 14:44:24.715687+00	2026-03-16 14:44:24.715687+00	password	392dc34d-d632-4b4a-a98e-5e5b56ae5a18
8791c31a-58a3-40ca-81e5-6d1a48b7ea4e	2026-03-16 14:46:01.654597+00	2026-03-16 14:46:01.654597+00	password	e7c47090-79da-4f58-b592-27b4c153be8f
40b108ee-3c1b-42bc-80bc-563ef2f22f7c	2026-03-16 14:46:16.428164+00	2026-03-16 14:46:16.428164+00	password	76cffe70-b5e8-46d1-8d18-cac1099a678b
ea7e60fa-6f47-4af4-93ec-bb55e33bacd8	2026-03-16 14:49:38.940759+00	2026-03-16 14:49:38.940759+00	password	9ef05d73-7f0f-41b8-a98e-1b0d58ad4ce8
01dba73f-06fe-4468-9a2c-ac0fbeb9fb7b	2026-03-16 14:50:05.494996+00	2026-03-16 14:50:05.494996+00	password	f4f4617a-2ccf-4a0f-be80-126ff7a4491d
ecde64c5-5000-4a63-8c68-5a29b4309504	2026-03-16 14:50:50.158218+00	2026-03-16 14:50:50.158218+00	password	d2c049b5-3ba3-4736-8515-148303e03aee
3e47d78b-a684-4df5-9def-ac751bb9258c	2026-03-16 14:51:11.536059+00	2026-03-16 14:51:11.536059+00	password	d773d738-97bf-409a-bc2b-360953941f42
8040ad87-317d-4fc4-b404-3077b9f201c0	2026-03-16 14:52:50.48697+00	2026-03-16 14:52:50.48697+00	password	40027ebb-3891-4df7-8ca3-7a851c69cc4c
982e6aea-ff50-467b-a0fd-666a0e409676	2026-03-16 14:53:06.520796+00	2026-03-16 14:53:06.520796+00	password	73ca8141-7c62-4704-a014-d8c7f2d21e88
26270d4f-b54c-452a-8542-5ff15d904552	2026-03-16 23:45:08.147174+00	2026-03-16 23:45:08.147174+00	password	7a224a94-36da-4ba9-bec3-125d289e4a5b
a885836c-a458-448b-ae7d-8a1d81bbe2f3	2026-03-16 23:57:45.825111+00	2026-03-16 23:57:45.825111+00	password	40a8ba17-b9fe-4e19-b36d-b5c607b54490
8266ae1e-87fc-4bb5-b42e-129a54840f1e	2026-03-17 01:09:25.592656+00	2026-03-17 01:09:25.592656+00	password	3256e653-0f4d-4f10-a91f-58abac283655
7bca6717-1ef5-49dc-80ca-5c9955ec0cad	2026-03-17 05:19:53.758469+00	2026-03-17 05:19:53.758469+00	password	2ccecd5f-1442-48a8-8057-4e51e319c1ec
bc48fb1a-456c-45ad-9b12-372f206ee36b	2026-03-17 05:53:01.507632+00	2026-03-17 05:53:01.507632+00	password	d757a2d2-a2de-4267-8103-a97123d54b00
a5589dff-fa8e-4235-974f-e60a34e03274	2026-03-17 05:55:09.944433+00	2026-03-17 05:55:09.944433+00	password	25e23c23-7eb4-4cfa-979a-7e31e46786d2
2eec08a3-9d4c-48a2-8179-39617464f989	2026-03-17 06:56:21.251333+00	2026-03-17 06:56:21.251333+00	password	adc0f35b-6638-4fe5-a2ca-b22c84d17ba2
76b5b158-6487-4116-ac3f-58f65811dc50	2026-03-17 09:58:47.770863+00	2026-03-17 09:58:47.770863+00	password	8f043dad-e883-4727-a1c4-c27f693a2bd2
4e24a45b-5ba6-4a9e-85b0-933c2da6497c	2026-03-17 10:00:33.135574+00	2026-03-17 10:00:33.135574+00	password	f1ca6fff-905b-455a-9451-8be3227f06f8
9953ffca-1350-4826-ac27-5c2b32f0e9af	2026-03-17 10:48:54.477096+00	2026-03-17 10:48:54.477096+00	password	305845e6-bff5-410b-92f4-7a45a27ebe67
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid, last_webauthn_challenge_data) FROM stdin;
\.


--
-- Data for Name: oauth_authorizations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_authorizations (id, authorization_id, client_id, user_id, redirect_uri, scope, state, resource, code_challenge, code_challenge_method, response_type, status, authorization_code, created_at, expires_at, approved_at, nonce) FROM stdin;
\.


--
-- Data for Name: oauth_client_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_client_states (id, provider_type, code_verifier, created_at) FROM stdin;
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_clients (id, client_secret_hash, registration_type, redirect_uris, grant_types, client_name, client_uri, logo_uri, created_at, updated_at, deleted_at, client_type, token_endpoint_auth_method) FROM stdin;
\.


--
-- Data for Name: oauth_consents; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_consents (id, user_id, client_id, scopes, granted_at, revoked_at) FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
00000000-0000-0000-0000-000000000000	1764	qyjwacspspeb	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-10 05:24:42.402133+00	2026-03-10 05:24:42.708967+00	enycxh6e6jfu	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1766	ykcqnhkjvcbu	de1dc022-ea84-4098-9ac7-5952270495cb	f	2026-03-10 05:25:43.728242+00	2026-03-10 05:25:43.728242+00	\N	94c0e373-07a9-4a67-bdbe-7f685de4a677
00000000-0000-0000-0000-000000000000	1765	wm3qjw5j5wot	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-10 05:24:42.709864+00	2026-03-10 06:24:32.738294+00	qyjwacspspeb	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1824	vhmzdkj7f5j4	b3ec626f-8311-40ae-882f-4d67bfe75163	f	2026-03-12 06:13:24.037511+00	2026-03-12 06:13:24.037511+00	\N	c0631152-39aa-44c7-bca5-d5dd0cdc1fb7
00000000-0000-0000-0000-000000000000	412	jobjs7e45slu	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-02-25 06:24:38.432147+00	2026-02-25 06:24:38.432147+00	\N	14d6533f-6b13-4778-aa08-aefafd966f89
00000000-0000-0000-0000-000000000000	413	zojqj63cqeai	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-25 06:25:05.006117+00	2026-02-25 07:24:56.449738+00	\N	09c000ef-b3e9-4729-bfdd-45f3f21578e7
00000000-0000-0000-0000-000000000000	417	xlpheoastgmv	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-25 07:24:56.47327+00	2026-02-25 07:24:56.757891+00	zojqj63cqeai	09c000ef-b3e9-4729-bfdd-45f3f21578e7
00000000-0000-0000-0000-000000000000	414	6jwh5kcqknbx	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-25 06:53:58.000708+00	2026-02-25 07:53:49.159725+00	\N	73c7192e-65b8-47bd-b0e7-2ee5a05b6999
00000000-0000-0000-0000-000000000000	419	dt3tmn7owswg	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-25 07:53:49.175673+00	2026-02-25 07:53:49.357958+00	6jwh5kcqknbx	73c7192e-65b8-47bd-b0e7-2ee5a05b6999
00000000-0000-0000-0000-000000000000	415	iw6ganpbomdr	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-25 06:54:42.338789+00	2026-02-25 07:54:32.625971+00	\N	aac3f3c5-35f3-441a-8ac9-40b7cdb2a335
00000000-0000-0000-0000-000000000000	421	s6x3shhj7dqf	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-25 07:54:32.626635+00	2026-02-25 07:54:32.740551+00	iw6ganpbomdr	aac3f3c5-35f3-441a-8ac9-40b7cdb2a335
00000000-0000-0000-0000-000000000000	418	vlwslrvhtisd	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-25 07:24:56.759088+00	2026-02-25 08:24:46.904261+00	xlpheoastgmv	09c000ef-b3e9-4729-bfdd-45f3f21578e7
00000000-0000-0000-0000-000000000000	423	zlcd3wlf4ye5	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-25 08:24:46.929124+00	2026-02-25 08:24:47.164308+00	vlwslrvhtisd	09c000ef-b3e9-4729-bfdd-45f3f21578e7
00000000-0000-0000-0000-000000000000	420	wvzvailxeukd	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-25 07:53:49.358369+00	2026-02-25 08:53:40.698767+00	dt3tmn7owswg	73c7192e-65b8-47bd-b0e7-2ee5a05b6999
00000000-0000-0000-0000-000000000000	425	cfiedqtogl6k	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-25 08:53:40.723164+00	2026-02-25 08:53:40.971715+00	wvzvailxeukd	73c7192e-65b8-47bd-b0e7-2ee5a05b6999
00000000-0000-0000-0000-000000000000	422	puqplp56vemc	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-25 07:54:32.741025+00	2026-02-25 08:54:22.249539+00	s6x3shhj7dqf	aac3f3c5-35f3-441a-8ac9-40b7cdb2a335
00000000-0000-0000-0000-000000000000	427	fipouggo5xx5	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-25 08:54:22.250239+00	2026-02-25 08:54:22.411289+00	puqplp56vemc	aac3f3c5-35f3-441a-8ac9-40b7cdb2a335
00000000-0000-0000-0000-000000000000	424	2ely2zkcp7lx	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-25 08:24:47.165155+00	2026-02-25 09:24:38.606254+00	zlcd3wlf4ye5	09c000ef-b3e9-4729-bfdd-45f3f21578e7
00000000-0000-0000-0000-000000000000	429	qo2aivzrfq7n	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-25 09:24:38.624827+00	2026-02-25 09:24:38.915557+00	2ely2zkcp7lx	09c000ef-b3e9-4729-bfdd-45f3f21578e7
00000000-0000-0000-0000-000000000000	426	z3bdkmrd5p4f	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-25 08:53:40.97207+00	2026-02-25 09:53:31.563549+00	cfiedqtogl6k	73c7192e-65b8-47bd-b0e7-2ee5a05b6999
00000000-0000-0000-0000-000000000000	431	yjttuisslcvt	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-25 09:53:31.580992+00	2026-02-25 09:53:31.867103+00	z3bdkmrd5p4f	73c7192e-65b8-47bd-b0e7-2ee5a05b6999
00000000-0000-0000-0000-000000000000	428	dtll5kavsnq5	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-25 08:54:22.41171+00	2026-02-25 09:54:12.805501+00	fipouggo5xx5	aac3f3c5-35f3-441a-8ac9-40b7cdb2a335
00000000-0000-0000-0000-000000000000	433	zdkzwhliqwtm	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-25 09:54:12.806434+00	2026-02-25 09:54:12.937786+00	dtll5kavsnq5	aac3f3c5-35f3-441a-8ac9-40b7cdb2a335
00000000-0000-0000-0000-000000000000	434	qvw5shiwng5i	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-25 09:54:12.938312+00	2026-02-25 10:21:50.425339+00	zdkzwhliqwtm	aac3f3c5-35f3-441a-8ac9-40b7cdb2a335
00000000-0000-0000-0000-000000000000	430	c5mksyg7avhw	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-25 09:24:38.916581+00	2026-02-25 10:24:28.618256+00	qo2aivzrfq7n	09c000ef-b3e9-4729-bfdd-45f3f21578e7
00000000-0000-0000-0000-000000000000	436	7rddbrjf7txw	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-25 10:24:28.631611+00	2026-02-25 10:24:28.892831+00	c5mksyg7avhw	09c000ef-b3e9-4729-bfdd-45f3f21578e7
00000000-0000-0000-0000-000000000000	437	3vsnyyekguz4	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-02-25 10:24:28.893779+00	2026-02-25 10:24:28.893779+00	7rddbrjf7txw	09c000ef-b3e9-4729-bfdd-45f3f21578e7
00000000-0000-0000-0000-000000000000	432	xjr64dxqjps7	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-25 09:53:31.867462+00	2026-02-25 10:53:22.307742+00	yjttuisslcvt	73c7192e-65b8-47bd-b0e7-2ee5a05b6999
00000000-0000-0000-0000-000000000000	438	4p3axljbenwm	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-25 10:53:22.321695+00	2026-02-25 10:53:22.624764+00	xjr64dxqjps7	73c7192e-65b8-47bd-b0e7-2ee5a05b6999
00000000-0000-0000-0000-000000000000	439	xme4a3jsatig	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-02-25 10:53:22.625118+00	2026-02-25 10:53:22.625118+00	4p3axljbenwm	73c7192e-65b8-47bd-b0e7-2ee5a05b6999
00000000-0000-0000-0000-000000000000	435	dghf3lv7msex	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-25 10:22:48.782746+00	2026-02-25 11:36:15.469504+00	\N	b0b89ab2-4c88-4109-833e-f0d825d46b6f
00000000-0000-0000-0000-000000000000	440	uv7oy235qqfx	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-25 11:36:15.48215+00	2026-02-25 12:36:06.504915+00	dghf3lv7msex	b0b89ab2-4c88-4109-833e-f0d825d46b6f
00000000-0000-0000-0000-000000000000	441	upy26ljvgiow	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-25 12:36:06.513242+00	2026-02-25 12:36:06.845789+00	uv7oy235qqfx	b0b89ab2-4c88-4109-833e-f0d825d46b6f
00000000-0000-0000-0000-000000000000	442	uenjds7fwx3t	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-25 12:36:06.846838+00	2026-02-25 13:35:58.005456+00	upy26ljvgiow	b0b89ab2-4c88-4109-833e-f0d825d46b6f
00000000-0000-0000-0000-000000000000	443	l5gnfgyh3qrz	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-25 13:35:58.028557+00	2026-02-25 13:35:58.410742+00	uenjds7fwx3t	b0b89ab2-4c88-4109-833e-f0d825d46b6f
00000000-0000-0000-0000-000000000000	444	uhce4e3k5zrh	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-25 13:35:58.411163+00	2026-02-25 14:35:50.031716+00	l5gnfgyh3qrz	b0b89ab2-4c88-4109-833e-f0d825d46b6f
00000000-0000-0000-0000-000000000000	50	yluqzc4eovj2	73692819-0476-4078-9ee9-f66d9b60ed5f	f	2026-02-17 13:52:33.954144+00	2026-02-17 13:52:33.954144+00	\N	c17f9510-5994-4e2b-b1da-36647b5afa7a
00000000-0000-0000-0000-000000000000	445	6l6xga2zad5q	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-25 14:35:50.035657+00	2026-02-25 14:35:50.427469+00	uhce4e3k5zrh	b0b89ab2-4c88-4109-833e-f0d825d46b6f
00000000-0000-0000-0000-000000000000	446	ktkvlf7sxgnq	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-25 14:35:50.42791+00	2026-02-25 14:59:46.920322+00	6l6xga2zad5q	b0b89ab2-4c88-4109-833e-f0d825d46b6f
00000000-0000-0000-0000-000000000000	448	drvxzr6wb642	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 05:55:50.020636+00	2026-02-26 06:55:41.139043+00	\N	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	454	pnqym5hhuq5u	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 06:55:41.140819+00	2026-02-26 06:55:41.338013+00	drvxzr6wb642	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	449	z6d25jc6agtc	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 05:57:07.114121+00	2026-02-26 06:56:58.476103+00	\N	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	456	eb3hfuocypjf	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 06:56:58.477152+00	2026-02-26 06:56:58.7397+00	z6d25jc6agtc	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	450	jqyfltwwsksd	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 05:57:20.724407+00	2026-02-26 06:57:10.64115+00	\N	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	458	gnwukculg2v7	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 06:57:10.64172+00	2026-02-26 06:57:10.866466+00	jqyfltwwsksd	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	451	pndekm45yafn	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 05:58:05.267992+00	2026-02-26 06:57:56.071032+00	\N	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	460	a5c763uy3mym	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 06:57:56.071864+00	2026-02-26 06:57:56.187316+00	pndekm45yafn	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	455	irdi33fqvkml	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 06:55:41.338413+00	2026-02-26 07:55:31.764558+00	pnqym5hhuq5u	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	457	wmkvfbk2gcsb	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 06:56:58.740378+00	2026-02-26 07:56:48.445035+00	eb3hfuocypjf	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	459	iuvq7nqs3p43	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 06:57:10.86686+00	2026-02-26 07:57:00.421874+00	gnwukculg2v7	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	467	6lqjhhkqz3fd	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 07:56:48.66184+00	2026-02-26 08:56:38.56589+00	w4graa5prw3j	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	476	rg5isdbaq4va	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 08:56:38.566615+00	2026-02-26 08:56:38.759296+00	6lqjhhkqz3fd	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	550	vb3sumffaii4	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 15:56:30.839176+00	2026-02-26 15:56:30.950922+00	tijlthnlyoat	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	469	ha4kdt3xvfdd	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 07:57:00.626932+00	2026-02-26 08:56:49.90698+00	illm63t6urfc	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	464	amcgqmmmn4uy	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 07:55:31.767542+00	2026-02-26 07:55:31.988755+00	irdi33fqvkml	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	1767	d77xbytmfd3l	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-10 05:54:09.12819+00	2026-03-10 05:54:09.309442+00	plow7xndzuwp	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	478	rhbcn26tcmqk	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 08:56:49.907329+00	2026-02-26 08:56:50.009663+00	ha4kdt3xvfdd	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	466	w4graa5prw3j	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 07:56:48.445835+00	2026-02-26 07:56:48.66146+00	wmkvfbk2gcsb	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	1768	rbpltrurhnre	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-10 05:54:09.309887+00	2026-03-10 06:54:00.291431+00	d77xbytmfd3l	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	468	illm63t6urfc	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 07:57:00.422245+00	2026-02-26 07:57:00.626488+00	iuvq7nqs3p43	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	461	ylui6sqbmfmf	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 06:57:56.187686+00	2026-02-26 07:57:46.981281+00	a5c763uy3mym	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	471	7bsdlbhybybs	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 07:57:47.21159+00	2026-02-26 08:57:37.654973+00	7h3hqo7day45	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	470	7h3hqo7day45	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 07:57:46.98197+00	2026-02-26 07:57:47.211204+00	ylui6sqbmfmf	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	1825	ixuy5h5fgyzt	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 07:07:55.88267+00	2026-03-12 07:07:56.206862+00	mimifa73fchq	f08d5af8-1ea1-47c0-8a6d-54feec7a21d0
00000000-0000-0000-0000-000000000000	1826	apsitok3u5qm	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 07:07:56.2084+00	2026-03-12 07:16:43.403036+00	ixuy5h5fgyzt	f08d5af8-1ea1-47c0-8a6d-54feec7a21d0
00000000-0000-0000-0000-000000000000	1960	nrawxz3ydnk3	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 14:24:03.145989+00	2026-03-12 14:24:03.401651+00	4cev4afuggct	a599f3b1-cd36-49b9-adb8-0ffdfcb34bc8
00000000-0000-0000-0000-000000000000	465	gqsm4ez6pwf6	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 07:55:31.989142+00	2026-02-26 08:55:23.4598+00	amcgqmmmn4uy	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	480	eitw6xpsav6c	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 08:57:37.655418+00	2026-02-26 08:57:37.761406+00	7bsdlbhybybs	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	474	iuwktginrbji	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 08:55:23.463142+00	2026-02-26 08:55:23.643908+00	gqsm4ez6pwf6	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	1961	pfnt3buym423	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 14:24:03.402616+00	2026-03-12 15:23:53.410808+00	nrawxz3ydnk3	a599f3b1-cd36-49b9-adb8-0ffdfcb34bc8
00000000-0000-0000-0000-000000000000	1986	fz52yxf6uzpe	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-13 12:27:28.548547+00	2026-03-13 12:27:28.80243+00	rpyozd2cxnih	ec552c3f-10bd-42f6-9b4f-0e6c03e9a1c8
00000000-0000-0000-0000-000000000000	1987	yc4edfup55um	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-13 12:27:28.803188+00	2026-03-13 13:27:18.206807+00	fz52yxf6uzpe	ec552c3f-10bd-42f6-9b4f-0e6c03e9a1c8
00000000-0000-0000-0000-000000000000	475	qetuowq3alba	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 08:55:23.644305+00	2026-02-26 09:55:13.699592+00	iuwktginrbji	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	484	u7edxnoyrpjt	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 09:55:13.710138+00	2026-02-26 09:55:14.000341+00	qetuowq3alba	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	2028	4tjkxcu5ccmd	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-13 16:26:48.457412+00	2026-03-13 16:26:48.748446+00	zv5t6f4eakl7	ec552c3f-10bd-42f6-9b4f-0e6c03e9a1c8
00000000-0000-0000-0000-000000000000	477	bylbaesk6nre	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 08:56:38.760249+00	2026-02-26 09:56:28.708877+00	rg5isdbaq4va	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	486	pdg4cgqcio4f	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 09:56:28.709619+00	2026-02-26 09:56:28.909861+00	bylbaesk6nre	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	479	lkaswp73zuli	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 08:56:50.010055+00	2026-02-26 09:56:40.603013+00	rhbcn26tcmqk	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	488	qbtfgfunbnnr	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 09:56:40.603878+00	2026-02-26 09:56:40.749093+00	lkaswp73zuli	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	481	67czlv4u2iyu	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 08:57:37.761816+00	2026-02-26 09:57:28.221283+00	eitw6xpsav6c	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	490	wlgixv6ehusc	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 09:57:28.221673+00	2026-02-26 09:57:28.442998+00	67czlv4u2iyu	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	485	m3ktr7uhs6k5	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 09:55:14.002042+00	2026-02-26 10:55:05.296418+00	u7edxnoyrpjt	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	494	mptxwu3cv4mp	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 10:55:05.307183+00	2026-02-26 10:55:05.50399+00	m3ktr7uhs6k5	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	487	o4mxa7ivrls4	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 09:56:28.910819+00	2026-02-26 10:56:18.916233+00	pdg4cgqcio4f	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	496	2y7gqkytaslh	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 10:56:18.917647+00	2026-02-26 10:56:19.146807+00	o4mxa7ivrls4	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	489	pg4rdajotznl	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 09:56:40.750603+00	2026-02-26 10:56:30.344199+00	qbtfgfunbnnr	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	498	3xxho5ofz6nt	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 10:56:30.344559+00	2026-02-26 10:56:30.574151+00	pg4rdajotznl	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	491	b5e6tt6idqh2	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 09:57:28.443376+00	2026-02-26 10:57:19.458612+00	wlgixv6ehusc	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	500	7yxucg3h64ft	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 10:57:19.458966+00	2026-02-26 10:57:19.651098+00	b5e6tt6idqh2	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	495	jcuff2mh6h77	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 10:55:05.504379+00	2026-02-26 11:54:55.579926+00	mptxwu3cv4mp	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	504	r2fyuuc4z63q	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 11:54:55.592157+00	2026-02-26 11:54:55.849573+00	jcuff2mh6h77	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	497	tgwempzxw3xv	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 10:56:19.147294+00	2026-02-26 11:56:10.018634+00	2y7gqkytaslh	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	506	n2xfnp7u3c4r	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 11:56:10.019398+00	2026-02-26 11:56:10.240726+00	tgwempzxw3xv	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	499	5b37khkzzvxh	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 10:56:30.574557+00	2026-02-26 11:56:19.897164+00	3xxho5ofz6nt	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	508	nb77i2e26cre	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 11:56:19.897581+00	2026-02-26 11:56:20.028926+00	5b37khkzzvxh	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	501	cpkjzpghxww6	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 10:57:19.651465+00	2026-02-26 11:57:09.13148+00	7yxucg3h64ft	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	510	6mbrhd5wzi7k	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 11:57:09.132522+00	2026-02-26 11:57:09.215487+00	cpkjzpghxww6	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	505	hvl4trrzm6ev	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 11:54:55.851477+00	2026-02-26 12:54:46.022675+00	r2fyuuc4z63q	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	507	kecn7qrvb33e	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 11:56:10.24121+00	2026-02-26 12:56:01.310929+00	n2xfnp7u3c4r	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	509	djrk2dpyhxhh	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 11:56:20.029315+00	2026-02-26 12:56:10.296865+00	nb77i2e26cre	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	541	tijlthnlyoat	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 14:56:40.216341+00	2026-02-26 15:56:30.838339+00	wkg3pqzawfd5	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	644	i5bitenxd22o	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 01:52:43.701533+00	2026-02-27 01:52:43.770366+00	5ctecbor4m55	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	1769	vi4gitef7uyi	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-10 06:24:32.777532+00	2026-03-10 06:24:33.047298+00	wm3qjw5j5wot	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1770	xeinbaoky4kz	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-10 06:24:33.04889+00	2026-03-10 06:24:33.04889+00	vi4gitef7uyi	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	514	in73otr3i7oi	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 12:54:46.024405+00	2026-02-26 12:54:46.319266+00	hvl4trrzm6ev	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	1827	43qcvmioxwan	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 08:22:32.755267+00	2026-03-12 09:22:23.180654+00	\N	f9d13ec4-2c89-4c6b-9e6b-8b29ccc935a1
00000000-0000-0000-0000-000000000000	516	h6xkc5djtvgi	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 12:56:01.312518+00	2026-02-26 12:56:01.562688+00	kecn7qrvb33e	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	545	qhkxthqycwcq	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 15:54:20.014272+00	2026-02-26 16:54:11.497138+00	qrekarqpc6ey	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	518	lwieloictnpb	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 12:56:10.297256+00	2026-02-26 12:56:10.408493+00	djrk2dpyhxhh	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	554	4xw32vu7cccl	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 16:54:11.505957+00	2026-02-26 16:54:11.964645+00	qhkxthqycwcq	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	511	5xk5cc3gq65j	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 11:57:09.216529+00	2026-02-26 12:56:59.797222+00	6mbrhd5wzi7k	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	1962	c6za3g7iak77	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 14:32:44.608246+00	2026-03-12 14:32:44.878752+00	z4x7ulbqex7t	323c06f6-5104-4602-9dd4-b87878ae4ef8
00000000-0000-0000-0000-000000000000	520	hnamtglxib6n	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 12:56:59.798022+00	2026-02-26 12:56:59.995816+00	5xk5cc3gq65j	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	547	isw3irknapri	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 15:55:33.272302+00	2026-02-26 16:55:24.181994+00	cdrwbn27ur5t	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	1963	236kfyg7h7p4	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 14:32:44.8799+00	2026-03-12 15:32:34.554395+00	c6za3g7iak77	323c06f6-5104-4602-9dd4-b87878ae4ef8
00000000-0000-0000-0000-000000000000	556	gvut4smctjsj	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 16:55:24.182769+00	2026-02-26 16:55:24.503354+00	isw3irknapri	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	515	ndr5h54wgyli	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 12:54:46.32057+00	2026-02-26 13:54:37.966259+00	in73otr3i7oi	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	1988	oxiyutvkjctz	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-13 12:31:31.872904+00	2026-03-13 12:31:32.130211+00	qc2isuiryypo	a8d24ea5-ad85-48ee-889a-a0e3ba2e1ed5
00000000-0000-0000-0000-000000000000	524	z6meukzm6tse	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 13:54:37.980228+00	2026-02-26 13:54:38.262821+00	ndr5h54wgyli	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	549	muzxbsmkcwgm	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 15:55:41.69559+00	2026-02-26 16:55:31.456821+00	pwu6wglvk6vt	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	517	3t5sbqqxshjl	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 12:56:01.564097+00	2026-02-26 13:55:51.28011+00	h6xkc5djtvgi	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	526	vec5gcsjpn5u	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 13:55:51.280867+00	2026-02-26 13:55:51.426355+00	3t5sbqqxshjl	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	558	zbphwzyzfiqf	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 16:55:31.457388+00	2026-02-26 16:55:31.647387+00	muzxbsmkcwgm	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	519	pmgle6yhbqq5	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 12:56:10.408937+00	2026-02-26 13:56:00.831891+00	lwieloictnpb	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	1989	gbajs5qtufkm	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-13 12:31:32.131468+00	2026-03-13 13:31:22.481821+00	oxiyutvkjctz	a8d24ea5-ad85-48ee-889a-a0e3ba2e1ed5
00000000-0000-0000-0000-000000000000	528	oebmgtgs2hya	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 13:56:00.83227+00	2026-02-26 13:56:00.98474+00	pmgle6yhbqq5	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	551	ymhdm4bq2fvy	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 15:56:30.951329+00	2026-02-26 16:56:20.379728+00	vb3sumffaii4	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	521	aya5q44n7pap	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 12:56:59.996206+00	2026-02-26 13:56:50.47876+00	hnamtglxib6n	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	530	kqfchirpsogr	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 13:56:50.479426+00	2026-02-26 13:56:50.592813+00	aya5q44n7pap	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	560	nf4gbempvzle	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 16:56:20.380423+00	2026-02-26 16:56:20.637159+00	ymhdm4bq2fvy	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	2029	cbxrzgktwxpb	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-13 16:26:48.748966+00	2026-03-14 16:26:38.952629+00	4tjkxcu5ccmd	ec552c3f-10bd-42f6-9b4f-0e6c03e9a1c8
00000000-0000-0000-0000-000000000000	2063	sy72z6mkcqv6	31cc7cef-c734-4a0d-8368-10440ee52424	t	2026-03-16 10:33:41.5035+00	2026-03-16 10:33:41.816408+00	luy734jeqhvb	143ea540-aa08-455e-90b9-303f7303a177
00000000-0000-0000-0000-000000000000	525	ywrcwros57uv	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 13:54:38.263747+00	2026-02-26 14:54:29.230463+00	z6meukzm6tse	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	555	mhk65wbsaayu	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 16:54:11.965591+00	2026-02-26 17:54:02.648735+00	4xw32vu7cccl	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	534	pcemhgopcs3f	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 14:54:29.231306+00	2026-02-26 14:54:29.485823+00	ywrcwros57uv	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	557	bbfis2imta7s	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 16:55:24.505693+00	2026-02-26 17:55:14.619395+00	gvut4smctjsj	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	527	fybcxmfdimar	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 13:55:51.426736+00	2026-02-26 14:55:42.643899+00	vec5gcsjpn5u	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	559	gzi2d3kb24yl	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 16:55:31.647772+00	2026-02-26 17:55:21.850038+00	zbphwzyzfiqf	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	536	ai5uyoxsuddl	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 14:55:42.644667+00	2026-02-26 14:55:42.971893+00	fybcxmfdimar	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	561	aatdtzjnc53a	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 16:56:20.638662+00	2026-02-26 17:56:09.930472+00	nf4gbempvzle	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	529	ib5v77n2aiki	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 13:56:00.986643+00	2026-02-26 14:55:51.015894+00	oebmgtgs2hya	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	538	of54h2k27p5o	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 14:55:51.016391+00	2026-02-26 14:55:51.237128+00	ib5v77n2aiki	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	531	hmnnzslqmigu	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 13:56:50.593198+00	2026-02-26 14:56:40.079519+00	kqfchirpsogr	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	540	wkg3pqzawfd5	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 14:56:40.08016+00	2026-02-26 14:56:40.215841+00	hmnnzslqmigu	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	535	f626zilaekam	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 14:54:29.486516+00	2026-02-26 15:54:19.681992+00	pcemhgopcs3f	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	544	qrekarqpc6ey	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 15:54:19.68985+00	2026-02-26 15:54:20.01327+00	f626zilaekam	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	537	2uzy7p6uxxjb	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 14:55:42.972275+00	2026-02-26 15:55:33.007519+00	ai5uyoxsuddl	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	546	cdrwbn27ur5t	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 15:55:33.009011+00	2026-02-26 15:55:33.271787+00	2uzy7p6uxxjb	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	539	twwqvfqvxtxw	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 14:55:51.237529+00	2026-02-26 15:55:41.555995+00	of54h2k27p5o	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	548	pwu6wglvk6vt	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 15:55:41.556416+00	2026-02-26 15:55:41.695107+00	twwqvfqvxtxw	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	1771	sazidubhjfew	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-10 06:54:00.310351+00	2026-03-10 06:54:00.602587+00	rbpltrurhnre	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1772	kvunzu77hunl	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-10 06:54:00.603782+00	2026-03-10 09:38:27.852065+00	sazidubhjfew	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	564	heaywcxemk3j	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 17:54:02.656305+00	2026-02-26 17:54:02.973103+00	mhk65wbsaayu	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	1828	vjgifvsaqmia	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 09:22:23.208151+00	2026-03-12 09:22:23.520957+00	43qcvmioxwan	f9d13ec4-2c89-4c6b-9e6b-8b29ccc935a1
00000000-0000-0000-0000-000000000000	566	2gzpby4j2vr7	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 17:55:14.620207+00	2026-02-26 17:55:15.132238+00	bbfis2imta7s	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	1829	j233zki4w7jc	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 09:22:23.521333+00	2026-03-12 10:22:13.775374+00	vjgifvsaqmia	f9d13ec4-2c89-4c6b-9e6b-8b29ccc935a1
00000000-0000-0000-0000-000000000000	568	5qg4nb6lji6s	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 17:55:21.850763+00	2026-02-26 17:55:22.122775+00	gzi2d3kb24yl	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	1964	2tqexyre4cog	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 15:23:53.439429+00	2026-03-12 15:23:53.698623+00	pfnt3buym423	a599f3b1-cd36-49b9-adb8-0ffdfcb34bc8
00000000-0000-0000-0000-000000000000	570	whnwfhc2avuf	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 17:56:09.930879+00	2026-02-26 17:56:10.136201+00	aatdtzjnc53a	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	1990	ti3xtg4hx66y	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	t	2026-03-13 13:16:35.67427+00	2026-03-13 13:16:35.97905+00	b7vpi7lxy3d4	6645979d-a485-44c9-94c8-2b87e081c735
00000000-0000-0000-0000-000000000000	565	yvumeercdqqc	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 17:54:02.974155+00	2026-02-26 18:53:52.68949+00	heaywcxemk3j	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	1991	pvgjaav7s6i6	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	t	2026-03-13 13:16:35.979428+00	2026-03-13 14:16:27.387545+00	ti3xtg4hx66y	6645979d-a485-44c9-94c8-2b87e081c735
00000000-0000-0000-0000-000000000000	574	ngeslorb7iqj	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 18:53:52.694576+00	2026-02-26 18:53:52.819436+00	yvumeercdqqc	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	1992	hbzzbpzklhbr	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-13 13:17:18.061869+00	2026-03-13 14:17:08.738932+00	\N	58c090c6-d4ea-4c6c-9f88-1e2cd9879ed8
00000000-0000-0000-0000-000000000000	567	xts73fu4ckmw	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 17:55:15.132598+00	2026-02-26 18:55:05.821023+00	2gzpby4j2vr7	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	1965	tckc4ighhsmb	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 15:23:53.698997+00	2026-03-13 15:23:43.465905+00	2tqexyre4cog	a599f3b1-cd36-49b9-adb8-0ffdfcb34bc8
00000000-0000-0000-0000-000000000000	576	6hhmf6ngkzaq	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 18:55:05.821829+00	2026-02-26 18:55:05.999588+00	xts73fu4ckmw	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	569	ham73g2doumf	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 17:55:22.123858+00	2026-02-26 18:55:12.295309+00	5qg4nb6lji6s	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	2030	swe2crntmubb	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-13 16:30:52.68918+00	2026-03-13 16:30:52.923397+00	izz6wyca6t4s	a8d24ea5-ad85-48ee-889a-a0e3ba2e1ed5
00000000-0000-0000-0000-000000000000	578	e4jnkegpudbv	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 18:55:12.295966+00	2026-02-26 18:55:12.372978+00	ham73g2doumf	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	571	4pgrv52jvil6	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 17:56:10.136585+00	2026-02-26 18:56:00.425846+00	whnwfhc2avuf	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	580	wdmy3cu2ig4q	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 18:56:00.426249+00	2026-02-26 18:56:00.579361+00	4pgrv52jvil6	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	575	ljgdefe4pgfu	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 18:53:52.820466+00	2026-02-26 19:53:42.697219+00	ngeslorb7iqj	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	584	b5smigp7p4ly	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 19:53:42.713358+00	2026-02-26 19:53:42.879047+00	ljgdefe4pgfu	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	577	oemynduhlb6e	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 18:55:05.999949+00	2026-02-26 19:54:56.261076+00	6hhmf6ngkzaq	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	586	64gt2ymv72hr	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 19:54:56.262469+00	2026-02-26 19:54:56.336607+00	oemynduhlb6e	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	579	5s4pm7yjkiwa	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 18:55:12.373357+00	2026-02-26 19:55:02.520675+00	e4jnkegpudbv	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	588	i4ppjvqd7tx6	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 19:55:02.521377+00	2026-02-26 19:55:02.614793+00	5s4pm7yjkiwa	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	581	fhllcat7rfur	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 18:56:00.579823+00	2026-02-26 19:55:49.936061+00	wdmy3cu2ig4q	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	590	il746priahpk	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 19:55:49.938431+00	2026-02-26 19:55:50.0833+00	fhllcat7rfur	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	585	liuxoyg57gfb	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 19:53:42.880018+00	2026-02-26 20:53:32.155509+00	b5smigp7p4ly	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	594	ljws3bgi7hgv	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 20:53:32.156504+00	2026-02-26 20:53:32.235585+00	liuxoyg57gfb	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	587	54vgcqajxqx5	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 19:54:56.336976+00	2026-02-26 20:54:46.932052+00	64gt2ymv72hr	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	596	g22vtl6cjf2u	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 20:54:46.941788+00	2026-02-26 20:54:47.068439+00	54vgcqajxqx5	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	589	4pklkvtr7el6	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 19:55:02.615182+00	2026-02-26 20:54:51.7914+00	i4ppjvqd7tx6	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	598	k54uiim6l76x	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 20:54:51.791778+00	2026-02-26 20:54:51.862492+00	4pklkvtr7el6	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	591	zrzj3dlnp6ht	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 19:55:50.084423+00	2026-02-26 20:55:40.367274+00	il746priahpk	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	600	geojaxnoov3v	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 20:55:40.367961+00	2026-02-26 20:55:40.51343+00	zrzj3dlnp6ht	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	595	acdzg3dcpggu	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 20:53:32.236024+00	2026-02-26 21:53:23.022318+00	ljws3bgi7hgv	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	604	6yrkbwfuvzvg	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 21:53:23.036935+00	2026-02-26 21:53:23.137808+00	acdzg3dcpggu	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	597	a7bh352lk5gx	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 20:54:47.068892+00	2026-02-26 21:54:37.27762+00	g22vtl6cjf2u	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	606	zsabr7cmnb5j	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 21:54:37.278718+00	2026-02-26 21:54:37.347978+00	a7bh352lk5gx	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	599	33r6cquxjupx	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 20:54:51.862909+00	2026-02-26 21:54:41.032206+00	k54uiim6l76x	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	608	ak3sxlx2bime	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 21:54:41.032966+00	2026-02-26 21:54:41.114104+00	33r6cquxjupx	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	601	xjj7kxn6ytvg	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 20:55:40.513839+00	2026-02-26 21:55:29.84677+00	geojaxnoov3v	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	610	4yt3voitonlf	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 21:55:29.847426+00	2026-02-26 21:55:29.914259+00	xjj7kxn6ytvg	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	605	albbu3fezcx2	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 21:53:23.138191+00	2026-02-26 22:53:13.752801+00	6yrkbwfuvzvg	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	607	was25cuwcral	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 21:54:37.348385+00	2026-02-26 22:54:27.641135+00	zsabr7cmnb5j	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	609	ihak5bktmzyg	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 21:54:41.114504+00	2026-02-26 22:54:31.321099+00	ak3sxlx2bime	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	611	mhdqhhepqaty	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 21:55:29.914701+00	2026-02-26 22:55:19.191601+00	4yt3voitonlf	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	635	5ctecbor4m55	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 00:52:53.383903+00	2026-02-27 01:52:43.700762+00	xk57yd4zo564	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	2069	iv2n4lmpkubo	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-16 13:07:22.426893+00	2026-03-16 13:07:22.426893+00	\N	221cc649-f65b-432a-96a1-62d81cdc2997
00000000-0000-0000-0000-000000000000	637	eeq2ysnc5ped	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 00:54:07.869479+00	2026-02-27 01:53:57.078876+00	yo5kueooiaqz	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	908	fytjwya2ya3h	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 23:51:03.149867+00	2026-02-27 23:51:03.223411+00	25x7pcyblp6i	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	614	45fxnwumo4m6	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 22:53:13.763131+00	2026-02-26 22:53:13.933967+00	albbu3fezcx2	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	646	2viedfmgai6w	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 01:53:57.079677+00	2026-02-27 01:53:57.145161+00	eeq2ysnc5ped	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	1773	qjh7xmigltzt	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-10 09:55:49.004288+00	2026-03-10 09:56:39.408215+00	\N	7a2b42a4-e780-46a9-a956-84750183871d
00000000-0000-0000-0000-000000000000	616	fqr3nabhpjk3	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 22:54:27.642511+00	2026-02-26 22:54:27.733516+00	was25cuwcral	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	639	5s4nfh2m7ius	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 00:54:10.823531+00	2026-02-27 01:53:59.913067+00	hu64whlosarh	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	618	edjqafjknshk	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 22:54:31.322144+00	2026-02-26 22:54:31.404221+00	ihak5bktmzyg	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	648	6saziwdrp2vo	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 01:53:59.913742+00	2026-02-27 01:53:59.981458+00	5s4nfh2m7ius	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	1774	gi5ylfhvs37f	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-10 09:56:39.409838+00	2026-03-10 09:56:39.684499+00	qjh7xmigltzt	7a2b42a4-e780-46a9-a956-84750183871d
00000000-0000-0000-0000-000000000000	620	jucyztj2papk	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 22:55:19.191961+00	2026-02-26 22:55:19.268217+00	mhdqhhepqaty	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	641	jqewhyaybo6x	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 00:54:59.007345+00	2026-02-27 01:54:49.426344+00	unirkif6l3gs	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	1775	zgdahccredtx	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-10 09:56:39.684951+00	2026-03-10 09:57:28.975524+00	gi5ylfhvs37f	7a2b42a4-e780-46a9-a956-84750183871d
00000000-0000-0000-0000-000000000000	650	euen2kkamoxa	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 01:54:49.4283+00	2026-02-27 01:54:49.531872+00	jqewhyaybo6x	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	615	2u4o4oz22vfi	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 22:53:13.934364+00	2026-02-26 23:53:03.604613+00	45fxnwumo4m6	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	1776	khguzkgubacw	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-10 09:57:28.975887+00	2026-03-10 09:57:29.210433+00	zgdahccredtx	7a2b42a4-e780-46a9-a956-84750183871d
00000000-0000-0000-0000-000000000000	624	xl3xrrdsobia	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 23:53:03.613845+00	2026-02-26 23:53:03.715721+00	2u4o4oz22vfi	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	617	36e5sn3lar7i	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 22:54:27.734514+00	2026-02-26 23:54:17.390346+00	fqr3nabhpjk3	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	1777	ajo3hh7iwuhr	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-10 09:57:29.210807+00	2026-03-10 09:58:19.510224+00	khguzkgubacw	7a2b42a4-e780-46a9-a956-84750183871d
00000000-0000-0000-0000-000000000000	626	vkl7xnoyc2f6	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 23:54:17.395413+00	2026-02-26 23:54:17.466753+00	36e5sn3lar7i	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	619	27j434s3hsqf	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 22:54:31.404583+00	2026-02-26 23:54:21.558176+00	edjqafjknshk	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	1778	wc7p6emvffe2	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-10 09:58:19.510879+00	2026-03-10 09:58:19.744876+00	ajo3hh7iwuhr	7a2b42a4-e780-46a9-a956-84750183871d
00000000-0000-0000-0000-000000000000	628	t3v5iujmrm6h	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 23:54:21.559153+00	2026-02-26 23:54:21.619381+00	27j434s3hsqf	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	645	pfjcm7sleylm	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 01:52:43.770764+00	2026-02-27 02:52:33.035545+00	i5bitenxd22o	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	621	ipk6noc75dsp	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 22:55:19.268682+00	2026-02-26 23:55:09.527577+00	jucyztj2papk	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	630	iwdxa6bv3l3v	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 23:55:09.528431+00	2026-02-26 23:55:09.650289+00	ipk6noc75dsp	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	654	enruthox5gpa	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 02:52:33.036617+00	2026-02-27 02:52:33.108147+00	pfjcm7sleylm	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	1779	z7ecqt55kmk5	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-10 09:58:19.745262+00	2026-03-10 09:59:09.05045+00	wc7p6emvffe2	7a2b42a4-e780-46a9-a956-84750183871d
00000000-0000-0000-0000-000000000000	1830	ipbnvhtlrrj4	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 10:22:13.792578+00	2026-03-12 10:22:14.082164+00	j233zki4w7jc	f9d13ec4-2c89-4c6b-9e6b-8b29ccc935a1
00000000-0000-0000-0000-000000000000	647	gtkduixmwr7p	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 01:53:57.145696+00	2026-02-27 02:53:47.740411+00	2viedfmgai6w	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	625	gicdsoz6c34o	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 23:53:03.716073+00	2026-02-27 00:52:53.26164+00	xl3xrrdsobia	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	634	xk57yd4zo564	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 00:52:53.270433+00	2026-02-27 00:52:53.383469+00	gicdsoz6c34o	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	1831	uq3ficfombz7	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 10:22:14.084386+00	2026-03-12 11:22:05.389557+00	ipbnvhtlrrj4	f9d13ec4-2c89-4c6b-9e6b-8b29ccc935a1
00000000-0000-0000-0000-000000000000	627	7x243vibduhr	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 23:54:17.467124+00	2026-02-27 00:54:07.791542+00	vkl7xnoyc2f6	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	656	amuws5jwwmza	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 02:53:47.746557+00	2026-02-27 02:53:47.827648+00	gtkduixmwr7p	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	636	yo5kueooiaqz	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 00:54:07.792849+00	2026-02-27 00:54:07.869065+00	7x243vibduhr	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	629	h2usb5lk546r	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 23:54:21.619727+00	2026-02-27 00:54:10.755932+00	t3v5iujmrm6h	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	1966	a3gbcufrngjn	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 15:32:34.55855+00	2026-03-12 15:32:34.780469+00	236kfyg7h7p4	323c06f6-5104-4602-9dd4-b87878ae4ef8
00000000-0000-0000-0000-000000000000	638	hu64whlosarh	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 00:54:10.756622+00	2026-02-27 00:54:10.8231+00	h2usb5lk546r	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	631	26hnoggtbma3	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-26 23:55:09.650684+00	2026-02-27 00:54:58.929191+00	iwdxa6bv3l3v	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	649	un55cadpci7w	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 01:53:59.98198+00	2026-02-27 02:53:49.230066+00	6saziwdrp2vo	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	640	unirkif6l3gs	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 00:54:58.929909+00	2026-02-27 00:54:59.006875+00	26hnoggtbma3	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	658	njhuobhwmsr6	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 02:53:49.230591+00	2026-02-27 02:53:49.35147+00	un55cadpci7w	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	651	dr5gdh6s5fct	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 01:54:49.532281+00	2026-02-27 02:54:38.74569+00	euen2kkamoxa	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	660	cqjmtqstndik	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 02:54:38.746163+00	2026-02-27 02:54:38.815642+00	dr5gdh6s5fct	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	655	u7evasvzutix	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 02:52:33.108636+00	2026-02-27 03:52:23.708422+00	enruthox5gpa	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	657	ak7zz4n4ytze	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 02:53:47.828663+00	2026-02-27 03:53:37.131828+00	amuws5jwwmza	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	659	x4gsbcjscwx2	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 02:53:49.35184+00	2026-02-27 03:53:39.437266+00	njhuobhwmsr6	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	661	4kgjayipa54f	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 02:54:38.816029+00	2026-02-27 03:54:28.011765+00	cqjmtqstndik	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	1083	sqpyv672edlo	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 07:43:03.052979+00	2026-03-05 07:43:03.380795+00	vjfppdfc4z35	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	2070	qeewxlullv6u	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-16 13:07:45.219241+00	2026-03-16 13:07:45.219241+00	\N	8b7f6a48-e7bc-4d2b-bf22-894d1496d736
00000000-0000-0000-0000-000000000000	664	bbtmjnqbyjp2	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 03:52:23.720624+00	2026-02-27 03:52:23.827344+00	u7evasvzutix	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	1780	rffcvr6s5uta	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-10 09:59:09.053271+00	2026-03-10 09:59:09.299583+00	z7ecqt55kmk5	7a2b42a4-e780-46a9-a956-84750183871d
00000000-0000-0000-0000-000000000000	2071	5tqqg24b3kjb	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-16 13:08:13.929017+00	2026-03-16 13:08:13.929017+00	\N	d0e0f19d-188f-4212-8f7e-1e076d133aab
00000000-0000-0000-0000-000000000000	666	2s2fs6bsm26n	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 03:53:37.132902+00	2026-02-27 03:53:37.225841+00	ak7zz4n4ytze	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	1781	an6ojjflj2bj	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-10 09:59:09.300047+00	2026-03-10 10:39:44.534941+00	rffcvr6s5uta	7a2b42a4-e780-46a9-a956-84750183871d
00000000-0000-0000-0000-000000000000	668	iskc4whozhez	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 03:53:39.437658+00	2026-02-27 03:53:39.507725+00	x4gsbcjscwx2	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	1832	yk5tu6igdk2i	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 11:22:05.420071+00	2026-03-12 11:22:05.749153+00	uq3ficfombz7	f9d13ec4-2c89-4c6b-9e6b-8b29ccc935a1
00000000-0000-0000-0000-000000000000	670	2kg4oyl3wgh4	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 03:54:28.014027+00	2026-02-27 03:54:28.12576+00	4kgjayipa54f	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	1833	d2rnvyujd4g4	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 11:22:05.750289+00	2026-03-12 12:21:56.029002+00	yk5tu6igdk2i	f9d13ec4-2c89-4c6b-9e6b-8b29ccc935a1
00000000-0000-0000-0000-000000000000	1967	37vw7jykyrmj	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 15:32:34.780858+00	2026-03-13 09:37:24.777587+00	a3gbcufrngjn	323c06f6-5104-4602-9dd4-b87878ae4ef8
00000000-0000-0000-0000-000000000000	1993	p7veloo5clbn	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-13 13:24:22.978564+00	2026-03-13 14:24:12.304031+00	\N	f9095374-8d70-4e81-8acd-9c5577aefd94
00000000-0000-0000-0000-000000000000	665	zgd72mhz5soa	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 03:52:23.827801+00	2026-02-27 04:52:13.252268+00	bbtmjnqbyjp2	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	674	4grtm3o7f6tt	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 04:52:13.262468+00	2026-02-27 04:52:13.352538+00	zgd72mhz5soa	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	2031	oj3r5nk3wqqm	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-13 16:30:52.923767+00	2026-03-14 16:30:42.526427+00	swe2crntmubb	a8d24ea5-ad85-48ee-889a-a0e3ba2e1ed5
00000000-0000-0000-0000-000000000000	667	wkeha6snr554	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 03:53:37.226333+00	2026-02-27 04:53:27.514529+00	2s2fs6bsm26n	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	2064	onptslosi5w4	31cc7cef-c734-4a0d-8368-10440ee52424	f	2026-03-16 10:33:41.816821+00	2026-03-16 10:33:41.816821+00	sy72z6mkcqv6	143ea540-aa08-455e-90b9-303f7303a177
00000000-0000-0000-0000-000000000000	676	h3ugoxg5ot3x	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 04:53:27.515726+00	2026-02-27 04:53:27.590717+00	wkeha6snr554	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	669	q3dfbzxoaz6q	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 03:53:39.508142+00	2026-02-27 04:53:28.672487+00	iskc4whozhez	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	678	4lndx77dvo7o	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 04:53:28.673425+00	2026-02-27 04:53:28.740623+00	q3dfbzxoaz6q	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	671	3wded5jbj3uu	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 03:54:28.126161+00	2026-02-27 04:54:18.37935+00	2kg4oyl3wgh4	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	680	yx3zb5ws2ne5	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 04:54:18.379799+00	2026-02-27 04:54:18.490626+00	3wded5jbj3uu	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	675	54thj6c24ecp	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 04:52:13.352958+00	2026-02-27 05:52:03.832616+00	4grtm3o7f6tt	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	684	gz5nmlpnau4a	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 05:52:03.848747+00	2026-02-27 05:52:03.957427+00	54thj6c24ecp	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	677	4am7ai5eobw6	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 04:53:27.591849+00	2026-02-27 05:53:16.852026+00	h3ugoxg5ot3x	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	686	xk5swtwqkz2x	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 05:53:16.852867+00	2026-02-27 05:53:16.920593+00	4am7ai5eobw6	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	679	ekaleofaacqb	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 04:53:28.741601+00	2026-02-27 05:53:17.888476+00	4lndx77dvo7o	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	688	gjrbvneecc32	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 05:53:17.889009+00	2026-02-27 05:53:18.009492+00	ekaleofaacqb	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	681	hsckziovmefz	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 04:54:18.491074+00	2026-02-27 05:54:07.679045+00	yx3zb5ws2ne5	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	690	oy6scf54wock	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 05:54:07.679529+00	2026-02-27 05:54:07.740389+00	hsckziovmefz	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	685	ml4veeg4nqn6	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 05:52:03.957805+00	2026-02-27 06:51:53.867359+00	gz5nmlpnau4a	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	694	3r6abg2fnwdv	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 06:51:53.877498+00	2026-02-27 06:51:54.170569+00	ml4veeg4nqn6	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	687	735ph6ivenrt	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 05:53:16.92103+00	2026-02-27 06:53:06.790205+00	xk5swtwqkz2x	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	696	ct6vl2ef44mo	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 06:53:06.791588+00	2026-02-27 06:53:06.963457+00	735ph6ivenrt	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	689	5t5wlb4ilcze	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 05:53:18.009892+00	2026-02-27 06:53:08.857905+00	gjrbvneecc32	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	698	qizbnzkxll5z	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 06:53:08.861307+00	2026-02-27 06:53:09.058014+00	5t5wlb4ilcze	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	691	ygqktyciynch	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 05:54:07.740785+00	2026-02-27 06:53:57.40272+00	oy6scf54wock	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	700	z73kbccn722p	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 06:53:57.404141+00	2026-02-27 06:53:57.589344+00	ygqktyciynch	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	695	7airk2e2fchb	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 06:51:54.171372+00	2026-02-27 07:51:44.4727+00	3r6abg2fnwdv	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	704	vgtgsoymzcuv	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 07:51:44.473726+00	2026-02-27 07:51:44.545503+00	7airk2e2fchb	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	697	6ebfebo4gkvq	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 06:53:06.963886+00	2026-02-27 07:52:56.615606+00	ct6vl2ef44mo	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	706	qyrlivrggiap	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 07:52:56.623476+00	2026-02-27 07:52:56.837768+00	6ebfebo4gkvq	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	699	iaiy2fc67ysl	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 06:53:09.058427+00	2026-02-27 07:52:59.280479+00	qizbnzkxll5z	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	708	77tmtmgkesyr	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 07:52:59.280874+00	2026-02-27 07:52:59.360808+00	iaiy2fc67ysl	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	701	33ovjp4svgf4	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 06:53:57.590335+00	2026-02-27 07:53:46.832611+00	z73kbccn722p	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	710	iq77xuwfnreo	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 07:53:46.833445+00	2026-02-27 07:53:46.931892+00	33ovjp4svgf4	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	705	ao3rnzxvx5gr	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 07:51:44.545961+00	2026-02-27 08:51:33.843234+00	vgtgsoymzcuv	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	707	qouj62qpxhfp	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 07:52:56.839661+00	2026-02-27 08:52:46.137591+00	qyrlivrggiap	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	709	mk6vlttr6tcj	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 07:52:59.369094+00	2026-02-27 08:52:49.605678+00	77tmtmgkesyr	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	711	zsnwopr7mk5h	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 07:53:46.93238+00	2026-02-27 08:53:36.367653+00	iq77xuwfnreo	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	2072	bjq3gmzl3kql	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-16 13:08:24.146313+00	2026-03-16 13:08:24.146313+00	\N	7ae03a97-66dd-4c9a-9956-343e7d888416
00000000-0000-0000-0000-000000000000	755	i5vswgxayi5g	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 12:50:55.870795+00	2026-02-27 13:50:45.582943+00	z2sip7lqmaf6	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	714	kumrope6cxqe	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 08:51:33.843916+00	2026-02-27 08:51:33.915661+00	ao3rnzxvx5gr	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	764	dbj7idjlqsfr	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 13:50:45.585102+00	2026-02-27 13:50:45.787765+00	i5vswgxayi5g	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	758	djccvtuls5cy	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 12:52:08.688695+00	2026-02-27 13:51:58.854044+00	irp3qqb4g726	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	716	swbrk4kd4yxz	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 08:52:46.138365+00	2026-02-27 08:52:46.271498+00	qouj62qpxhfp	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	759	6wbarkey66zq	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 12:52:08.771706+00	2026-02-27 13:51:58.992649+00	un6sjbzjxver	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	761	2qxjb7wjn7tl	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 12:52:55.464441+00	2026-02-27 13:52:45.255738+00	tp6nsob43tba	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	718	6yhqze3dz6qj	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 08:52:49.606361+00	2026-02-27 08:52:49.675859+00	mk6vlttr6tcj	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	1309	mmxtxzy2i342	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 08:05:22.577609+00	2026-03-07 08:05:22.694917+00	7dtts33yxl5q	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1782	ggoifkffp7q6	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-10 12:48:06.932168+00	2026-03-10 12:48:56.267675+00	\N	960e465f-091a-4dcb-9ea6-5db284f0ddd4
00000000-0000-0000-0000-000000000000	720	ibyj2mghicbx	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 08:53:36.378182+00	2026-02-27 08:53:36.478151+00	zsnwopr7mk5h	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	1783	gr3ev6ebw35w	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-10 12:48:56.270528+00	2026-03-10 12:48:56.502688+00	ggoifkffp7q6	960e465f-091a-4dcb-9ea6-5db284f0ddd4
00000000-0000-0000-0000-000000000000	1784	qu3kgx5inxh3	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-10 12:48:56.503052+00	2026-03-10 12:49:34.921073+00	gr3ev6ebw35w	960e465f-091a-4dcb-9ea6-5db284f0ddd4
00000000-0000-0000-0000-000000000000	715	mwd7pu37pugy	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 08:51:33.916047+00	2026-02-27 09:51:23.416322+00	kumrope6cxqe	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	1785	aeskrdlyhafi	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-10 12:49:52.51691+00	2026-03-10 12:50:31.264315+00	\N	75ca43a6-3288-419b-8743-8f219c42fd74
00000000-0000-0000-0000-000000000000	724	h33qi4qizlc7	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 09:51:23.429108+00	2026-02-27 09:51:23.596908+00	mwd7pu37pugy	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	717	tpobcl4qbtox	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 08:52:46.271881+00	2026-02-27 09:52:36.467394+00	swbrk4kd4yxz	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	1786	2mvs7tglndlw	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-10 12:50:31.264722+00	2026-03-10 12:50:41.995518+00	aeskrdlyhafi	75ca43a6-3288-419b-8743-8f219c42fd74
00000000-0000-0000-0000-000000000000	726	nd7gghsswxul	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 09:52:36.468156+00	2026-02-27 09:52:36.543639+00	tpobcl4qbtox	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	719	dk36i52qy4xl	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 08:52:49.676906+00	2026-02-27 09:52:38.757259+00	6yhqze3dz6qj	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	1787	3wbtvnxozq4r	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-10 12:50:41.996055+00	2026-03-10 12:51:21.878043+00	2mvs7tglndlw	75ca43a6-3288-419b-8743-8f219c42fd74
00000000-0000-0000-0000-000000000000	728	qejg4etnpnby	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 09:52:38.757669+00	2026-02-27 09:52:38.822864+00	dk36i52qy4xl	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	721	nigtm6arbdrd	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 08:53:36.478617+00	2026-02-27 09:53:25.718481+00	ibyj2mghicbx	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	1788	r76fwha7z6mb	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-10 12:51:21.88644+00	2026-03-10 12:51:31.54976+00	3wbtvnxozq4r	75ca43a6-3288-419b-8743-8f219c42fd74
00000000-0000-0000-0000-000000000000	730	uieavhvlculf	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 09:53:25.719254+00	2026-02-27 09:53:25.776197+00	nigtm6arbdrd	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	1789	sq6buiayc25s	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-10 12:51:31.550787+00	2026-03-10 12:51:34.100974+00	r76fwha7z6mb	75ca43a6-3288-419b-8743-8f219c42fd74
00000000-0000-0000-0000-000000000000	725	imkudslcpmat	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 09:51:23.597347+00	2026-02-27 10:51:12.914788+00	h33qi4qizlc7	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	734	zymxzsqibie5	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 10:51:12.915669+00	2026-02-27 10:51:13.013396+00	imkudslcpmat	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	727	vv7zndursdar	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 09:52:36.544109+00	2026-02-27 10:52:26.23163+00	nd7gghsswxul	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	736	hxo6j2lg3oal	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 10:52:26.237249+00	2026-02-27 10:52:26.381974+00	vv7zndursdar	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	729	4mbmvndy2vpe	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 09:52:38.823244+00	2026-02-27 10:52:28.01136+00	qejg4etnpnby	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	738	ygavkk2lqg7s	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 10:52:28.011776+00	2026-02-27 10:52:28.091737+00	4mbmvndy2vpe	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	731	pbagppzvwgeb	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 09:53:25.778284+00	2026-02-27 10:53:15.113059+00	uieavhvlculf	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	740	5biekii6ua5b	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 10:53:15.113771+00	2026-02-27 10:53:15.182696+00	pbagppzvwgeb	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	735	u554efcvskqv	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 10:51:13.013751+00	2026-02-27 11:51:04.06136+00	zymxzsqibie5	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	744	mysrb6hlkthc	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 11:51:04.06215+00	2026-02-27 11:51:04.284926+00	u554efcvskqv	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	737	3ztlshz3yzzn	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 10:52:26.382458+00	2026-02-27 11:52:17.249546+00	hxo6j2lg3oal	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	746	xjod5x7egc5u	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 11:52:17.250546+00	2026-02-27 11:52:17.414899+00	3ztlshz3yzzn	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	739	zvsuhgdhspb3	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 10:52:28.092192+00	2026-02-27 11:52:18.444091+00	ygavkk2lqg7s	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	748	osqcs7kz74pa	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 11:52:18.444506+00	2026-02-27 11:52:18.585961+00	zvsuhgdhspb3	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	741	fhpw7xuv4zlp	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 10:53:15.183742+00	2026-02-27 11:53:05.438441+00	5biekii6ua5b	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	750	zjuly2tnnrjl	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 11:53:05.439264+00	2026-02-27 11:53:05.510175+00	fhpw7xuv4zlp	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	745	25a3nl7czyaa	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 11:51:04.285423+00	2026-02-27 12:50:55.606432+00	mysrb6hlkthc	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	754	z2sip7lqmaf6	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 12:50:55.607506+00	2026-02-27 12:50:55.869995+00	25a3nl7czyaa	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	747	ov4pd3lrpdwg	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 11:52:17.415386+00	2026-02-27 12:52:08.401636+00	xjod5x7egc5u	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	749	olskaeyigwsq	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 11:52:18.586361+00	2026-02-27 12:52:08.6354+00	osqcs7kz74pa	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	756	irp3qqb4g726	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 12:52:08.404086+00	2026-02-27 12:52:08.687706+00	ov4pd3lrpdwg	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	757	un6sjbzjxver	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 12:52:08.63579+00	2026-02-27 12:52:08.77064+00	olskaeyigwsq	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	751	bn4gmy32lhjg	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 11:53:05.510595+00	2026-02-27 12:52:55.242952+00	zjuly2tnnrjl	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	760	tp6nsob43tba	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 12:52:55.243366+00	2026-02-27 12:52:55.463986+00	bn4gmy32lhjg	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	2073	rkdr44ez3pfh	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-16 13:08:50.807863+00	2026-03-16 13:08:50.807863+00	\N	b7ac13b6-634a-44c4-b221-9998b690ddba
00000000-0000-0000-0000-000000000000	1834	ugz5ymbmk2tw	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 12:21:56.044383+00	2026-03-12 12:21:56.367619+00	d2rnvyujd4g4	f9d13ec4-2c89-4c6b-9e6b-8b29ccc935a1
00000000-0000-0000-0000-000000000000	2074	fslnh47on5od	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-16 13:09:04.670608+00	2026-03-16 13:09:04.670608+00	\N	06526c35-f388-4ab0-8f80-40d939e449b0
00000000-0000-0000-0000-000000000000	766	d2zcucepmeyw	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 13:51:58.854904+00	2026-02-27 13:51:59.101697+00	djccvtuls5cy	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	1835	rq4jpewtzab5	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 12:21:56.370052+00	2026-03-12 12:23:55.158939+00	ugz5ymbmk2tw	f9d13ec4-2c89-4c6b-9e6b-8b29ccc935a1
00000000-0000-0000-0000-000000000000	767	htq6og3jsqmp	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 13:51:58.993701+00	2026-02-27 13:51:59.228981+00	6wbarkey66zq	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	2110	rempoqe63wfh	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	f	2026-03-16 14:49:38.930291+00	2026-03-16 14:49:38.930291+00	\N	ea7e60fa-6f47-4af4-93ec-bb55e33bacd8
00000000-0000-0000-0000-000000000000	1968	5rzh3k3jbc5l	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-13 05:49:35.840843+00	2026-03-13 05:52:18.705378+00	\N	f1a85528-b800-4fb2-8252-3ff4fbf3d7d6
00000000-0000-0000-0000-000000000000	770	tatxexavdiob	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 13:52:45.256491+00	2026-02-27 13:52:45.480053+00	2qxjb7wjn7tl	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	2111	lbzatbgg3dbf	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	f	2026-03-16 14:50:05.493042+00	2026-03-16 14:50:05.493042+00	\N	01dba73f-06fe-4468-9a2c-ac0fbeb9fb7b
00000000-0000-0000-0000-000000000000	1994	jhgchah75t3k	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-13 13:27:18.220641+00	2026-03-13 13:27:18.466546+00	yc4edfup55um	ec552c3f-10bd-42f6-9b4f-0e6c03e9a1c8
00000000-0000-0000-0000-000000000000	2112	vlqjhi5u435j	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	f	2026-03-16 14:50:50.155928+00	2026-03-16 14:50:50.155928+00	\N	ecde64c5-5000-4a63-8c68-5a29b4309504
00000000-0000-0000-0000-000000000000	1995	f64v3lqo55ei	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-13 13:27:18.467386+00	2026-03-13 14:27:07.833384+00	jhgchah75t3k	ec552c3f-10bd-42f6-9b4f-0e6c03e9a1c8
00000000-0000-0000-0000-000000000000	2113	qa6upewkfpua	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	f	2026-03-16 14:51:11.534882+00	2026-03-16 14:51:11.534882+00	\N	3e47d78b-a684-4df5-9def-ac751bb9258c
00000000-0000-0000-0000-000000000000	2032	unvmtj5herxo	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-14 05:52:08.866225+00	2026-03-14 05:52:31.260447+00	myqucx7hlpdv	f1a85528-b800-4fb2-8252-3ff4fbf3d7d6
00000000-0000-0000-0000-000000000000	2124	h66xgi625s6w	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-17 09:58:47.725994+00	2026-03-17 09:58:47.725994+00	\N	76b5b158-6487-4116-ac3f-58f65811dc50
00000000-0000-0000-0000-000000000000	765	l5bgaqogtpiq	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 13:50:45.78826+00	2026-02-27 14:50:35.673284+00	dbj7idjlqsfr	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	2033	crpgnd5mvvgn	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-14 05:52:31.260867+00	2026-03-15 05:51:59.522837+00	unvmtj5herxo	f1a85528-b800-4fb2-8252-3ff4fbf3d7d6
00000000-0000-0000-0000-000000000000	776	u7abxoga6zih	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 14:50:35.674613+00	2026-02-27 14:50:35.926899+00	l5bgaqogtpiq	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	1790	inu6ip5k7x6y	31cc7cef-c734-4a0d-8368-10440ee52424	t	2026-03-11 02:17:38.448665+00	2026-03-15 10:33:50.04206+00	\N	143ea540-aa08-455e-90b9-303f7303a177
00000000-0000-0000-0000-000000000000	769	qqwa2v7r4nk7	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 13:51:59.229441+00	2026-02-27 14:51:50.032322+00	htq6og3jsqmp	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	768	y7enzmxwpj4p	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 13:51:59.102108+00	2026-02-27 14:51:50.033983+00	d2zcucepmeyw	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	779	fzif7jis7fvz	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 14:51:50.035497+00	2026-02-27 14:51:50.188329+00	qqwa2v7r4nk7	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	778	6565jj3dprqe	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 14:51:50.035669+00	2026-02-27 14:51:50.43867+00	y7enzmxwpj4p	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	771	elkxvagogtdw	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 13:52:45.480524+00	2026-02-27 14:52:34.946727+00	tatxexavdiob	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	782	uorjm4na44tf	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 14:52:34.952615+00	2026-02-27 14:52:35.085401+00	elkxvagogtdw	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	777	ghyhkwrrqhoy	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 14:50:35.927853+00	2026-02-27 15:50:25.955885+00	u7abxoga6zih	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	790	f4msmoepb2qv	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 15:50:25.957331+00	2026-02-27 15:50:26.220575+00	ghyhkwrrqhoy	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	780	yohca23q7cgt	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 14:51:50.188987+00	2026-02-27 15:51:40.502792+00	fzif7jis7fvz	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	792	n5cafwncgmwn	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 15:51:40.504516+00	2026-02-27 15:51:40.740349+00	yohca23q7cgt	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	781	wnt4rxdacivu	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 14:51:50.439221+00	2026-02-27 15:51:41.033343+00	6565jj3dprqe	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	794	3rptyz46rwdh	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 15:51:41.033719+00	2026-02-27 15:51:41.191174+00	wnt4rxdacivu	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	783	azpcrkblokz3	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 14:52:35.085799+00	2026-02-27 15:52:25.316339+00	uorjm4na44tf	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	796	5gzzzf3zn4gj	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 15:52:25.317131+00	2026-02-27 15:52:25.458525+00	azpcrkblokz3	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	791	fmemg33ulztg	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 15:50:26.224235+00	2026-02-27 16:50:17.239396+00	f4msmoepb2qv	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	804	3zqdy52klfiz	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 16:50:17.240431+00	2026-02-27 16:50:17.496861+00	fmemg33ulztg	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	793	ncmnnin53svt	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 15:51:40.74178+00	2026-02-27 16:51:30.921163+00	n5cafwncgmwn	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	806	otsowy7gmm5k	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 16:51:30.922206+00	2026-02-27 16:51:31.142049+00	ncmnnin53svt	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	795	xcqalnh67imd	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 15:51:41.191522+00	2026-02-27 16:51:31.768015+00	3rptyz46rwdh	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	808	zi5zwa3j4t5r	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 16:51:31.768511+00	2026-02-27 16:51:31.967155+00	xcqalnh67imd	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	797	xilcuzvl3cdb	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 15:52:25.458944+00	2026-02-27 16:52:16.2557+00	5gzzzf3zn4gj	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	810	qpxodirt3ddx	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 16:52:16.256069+00	2026-02-27 16:52:16.486115+00	xilcuzvl3cdb	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	805	jj7klsyqgwqi	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 16:50:17.49794+00	2026-02-27 17:50:07.581403+00	3zqdy52klfiz	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	809	j22jfppx4yps	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 16:51:31.967515+00	2026-02-27 17:51:21.562658+00	zi5zwa3j4t5r	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	807	6gnyazh4y7l2	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 16:51:31.142481+00	2026-02-27 17:51:21.823198+00	otsowy7gmm5k	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	811	ysb7m7xak356	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 16:52:16.486491+00	2026-02-27 17:52:05.680463+00	qpxodirt3ddx	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	1084	xxjo44gvrfmq	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 07:43:03.383061+00	2026-03-05 08:42:54.59326+00	sqpyv672edlo	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1791	xapg5ujwpamj	de1dc022-ea84-4098-9ac7-5952270495cb	f	2026-03-11 11:47:41.701397+00	2026-03-11 11:47:41.701397+00	\N	7f04795e-6ce1-4eba-a779-cf8e0454b8a0
00000000-0000-0000-0000-000000000000	2075	fhzm3ousjjih	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-16 13:17:42.157231+00	2026-03-16 13:17:42.157231+00	\N	dcfe4b0b-7fa1-4316-8dba-df7db68a6c6b
00000000-0000-0000-0000-000000000000	1836	fe5tptt5ina2	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 12:24:23.958728+00	2026-03-12 13:24:13.309316+00	\N	a599f3b1-cd36-49b9-adb8-0ffdfcb34bc8
00000000-0000-0000-0000-000000000000	2114	42qonmb3il3j	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-16 14:52:50.47787+00	2026-03-16 14:52:50.47787+00	\N	8040ad87-317d-4fc4-b404-3077b9f201c0
00000000-0000-0000-0000-000000000000	1969	463u2ayiuy2v	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-13 05:52:18.708961+00	2026-03-13 05:52:40.360057+00	5rzh3k3jbc5l	f1a85528-b800-4fb2-8252-3ff4fbf3d7d6
00000000-0000-0000-0000-000000000000	2115	div64rtdbtpj	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-16 14:53:06.516983+00	2026-03-16 14:53:06.516983+00	\N	982e6aea-ff50-467b-a0fd-666a0e409676
00000000-0000-0000-0000-000000000000	818	5luy5nhm2qoh	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 17:50:07.582448+00	2026-02-27 17:50:08.00287+00	jj7klsyqgwqi	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	2125	scq3d2g7hl4j	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-17 10:00:33.132071+00	2026-03-17 10:00:33.132071+00	\N	4e24a45b-5ba6-4a9e-85b0-933c2da6497c
00000000-0000-0000-0000-000000000000	1996	i5noayzfxlwo	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-13 13:31:22.49012+00	2026-03-13 13:31:22.720143+00	gbajs5qtufkm	a8d24ea5-ad85-48ee-889a-a0e3ba2e1ed5
00000000-0000-0000-0000-000000000000	820	2s3vnsazddds	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 17:51:21.56348+00	2026-02-27 17:51:21.747857+00	j22jfppx4yps	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	1997	mfla3smevtz2	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-13 13:31:22.720516+00	2026-03-13 14:31:12.201239+00	i5noayzfxlwo	a8d24ea5-ad85-48ee-889a-a0e3ba2e1ed5
00000000-0000-0000-0000-000000000000	822	3pkq4hnv23nm	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 17:51:21.825094+00	2026-02-27 17:51:22.002944+00	6gnyazh4y7l2	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	1970	myqucx7hlpdv	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-13 05:52:40.36047+00	2026-03-14 05:52:08.849922+00	463u2ayiuy2v	f1a85528-b800-4fb2-8252-3ff4fbf3d7d6
00000000-0000-0000-0000-000000000000	824	6yjfygsgpteu	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 17:52:05.681697+00	2026-02-27 17:52:05.773762+00	ysb7m7xak356	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	2034	mioei7bxysfb	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	t	2026-03-14 16:15:59.27497+00	2026-03-14 16:15:59.60761+00	whki27t6bqg4	6645979d-a485-44c9-94c8-2b87e081c735
00000000-0000-0000-0000-000000000000	2036	2tmmeywfaz76	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-14 16:16:39.567372+00	2026-03-14 16:16:39.802953+00	rm6yrim4bcwn	58c090c6-d4ea-4c6c-9f88-1e2cd9879ed8
00000000-0000-0000-0000-000000000000	2035	yn5xufokhqnz	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	t	2026-03-14 16:15:59.607985+00	2026-03-15 16:15:49.867106+00	mioei7bxysfb	6645979d-a485-44c9-94c8-2b87e081c735
00000000-0000-0000-0000-000000000000	2037	glhrebio2gqr	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-14 16:16:39.803389+00	2026-03-15 16:16:29.482915+00	2tmmeywfaz76	58c090c6-d4ea-4c6c-9f88-1e2cd9879ed8
00000000-0000-0000-0000-000000000000	819	jizcmt2u7nnh	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 17:50:08.003409+00	2026-02-27 18:49:58.32514+00	5luy5nhm2qoh	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	832	vcvdys5pb6l5	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 18:49:58.326316+00	2026-02-27 18:49:58.404593+00	jizcmt2u7nnh	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	821	4q7quz4e4ctp	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 17:51:21.748245+00	2026-02-27 18:51:11.65718+00	2s3vnsazddds	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	834	hdgdzcz736pu	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 18:51:11.672666+00	2026-02-27 18:51:11.913131+00	4q7quz4e4ctp	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	823	xoioa2l6mmza	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 17:51:22.003326+00	2026-02-27 18:51:12.25364+00	3pkq4hnv23nm	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	836	qpnsik7pgj4e	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 18:51:12.257386+00	2026-02-27 18:51:12.351348+00	xoioa2l6mmza	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	825	gs7lge4mhbkx	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 17:52:05.774172+00	2026-02-27 18:51:55.199977+00	6yjfygsgpteu	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	838	j4rf5jg5cy7c	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 18:51:55.20043+00	2026-02-27 18:51:55.27749+00	gs7lge4mhbkx	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	833	joorlbye3fad	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 18:49:58.405047+00	2026-02-27 19:49:48.620789+00	vcvdys5pb6l5	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	846	4gvyee4nctbo	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 19:49:48.621812+00	2026-02-27 19:49:48.708761+00	joorlbye3fad	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	835	ydjxtlrqqqnw	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 18:51:11.913675+00	2026-02-27 19:51:01.100154+00	hdgdzcz736pu	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	848	tq44e7epe7ix	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 19:51:01.102225+00	2026-02-27 19:51:01.177697+00	ydjxtlrqqqnw	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	837	w3h6hnczuftm	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 18:51:12.353766+00	2026-02-27 19:51:02.558438+00	qpnsik7pgj4e	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	850	hhaay7lonqyq	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 19:51:02.5588+00	2026-02-27 19:51:02.628044+00	w3h6hnczuftm	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	839	2rrgtot6dpvm	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 18:51:55.27793+00	2026-02-27 19:51:45.426979+00	j4rf5jg5cy7c	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	852	wdvm5xqgrwy2	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 19:51:45.42747+00	2026-02-27 19:51:45.543679+00	2rrgtot6dpvm	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	847	pbif45vtyyix	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 19:49:48.709974+00	2026-02-27 20:49:37.973653+00	4gvyee4nctbo	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	860	hqqexkywqjpe	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 20:49:37.976014+00	2026-02-27 20:49:38.040633+00	pbif45vtyyix	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	849	43zazum223f2	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 19:51:01.17812+00	2026-02-27 20:50:51.30037+00	tq44e7epe7ix	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	862	bmbk4cjtsnwt	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 20:50:51.30145+00	2026-02-27 20:50:51.400461+00	43zazum223f2	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	851	vpink5v7qiht	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 19:51:02.628425+00	2026-02-27 20:50:51.766459+00	hhaay7lonqyq	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	853	apsatvx5pdam	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 19:51:45.54416+00	2026-02-27 20:51:34.637241+00	wdvm5xqgrwy2	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	861	5umn5yea77ul	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 20:49:38.04102+00	2026-02-27 21:49:28.287456+00	hqqexkywqjpe	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	863	cwnk7scwha47	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 20:50:51.400911+00	2026-02-27 21:50:41.498299+00	bmbk4cjtsnwt	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	895	25x7pcyblp6i	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 22:51:13.000724+00	2026-02-27 23:51:03.149023+00	bixotifx3j2y	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	864	4qsyrjgebyt4	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 20:50:51.766903+00	2026-02-27 20:50:51.840045+00	vpink5v7qiht	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	2076	bdwfxfe6htta	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-16 13:25:51.373297+00	2026-03-16 13:25:51.373297+00	\N	81c406e3-e83b-49b6-a6ff-cb36b2e258aa
00000000-0000-0000-0000-000000000000	1792	244bcq6fzznc	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-11 14:16:01.253387+00	2026-03-11 15:15:52.571772+00	\N	d6b1b72a-ded3-41b4-a0da-82ffbdabce7b
00000000-0000-0000-0000-000000000000	866	4mowdmdkijiv	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 20:51:34.637893+00	2026-02-27 20:51:34.705063+00	apsatvx5pdam	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	1579	nulryuxmhrwv	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 04:58:04.613778+00	2026-03-09 04:58:04.718012+00	hgu4nlerxk32	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	2077	ntcepfaok7ui	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-16 13:26:13.061967+00	2026-03-16 13:26:13.061967+00	\N	fd2bdc72-baaf-421e-b32b-f99142111e00
00000000-0000-0000-0000-000000000000	1837	axdqrph4nwle	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 12:25:37.43814+00	2026-03-12 12:26:26.758311+00	\N	f8e0f6bf-bbce-4446-a7f9-f5accd4cbe07
00000000-0000-0000-0000-000000000000	2116	hdklgafj5z6m	31cc7cef-c734-4a0d-8368-10440ee52424	f	2026-03-16 23:45:08.115395+00	2026-03-16 23:45:08.115395+00	\N	26270d4f-b54c-452a-8542-5ff15d904552
00000000-0000-0000-0000-000000000000	1838	k7wwu6rur5lc	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 12:26:26.758982+00	2026-03-12 12:26:27.001813+00	axdqrph4nwle	f8e0f6bf-bbce-4446-a7f9-f5accd4cbe07
00000000-0000-0000-0000-000000000000	2126	dhry7zs3fewr	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-17 10:48:54.418783+00	2026-03-17 10:48:54.418783+00	\N	9953ffca-1350-4826-ac27-5c2b32f0e9af
00000000-0000-0000-0000-000000000000	1839	zwdhcw74xdlr	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 12:26:27.002201+00	2026-03-12 12:27:17.318769+00	k7wwu6rur5lc	f8e0f6bf-bbce-4446-a7f9-f5accd4cbe07
00000000-0000-0000-0000-000000000000	1971	hui2aljpvyw7	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-13 09:42:54.505138+00	2026-03-13 09:47:44.921994+00	\N	0b65d8f7-602e-4ac4-ba24-1251ee3ed0bd
00000000-0000-0000-0000-000000000000	903	4zuyohy4aurp	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 23:49:08.07572+00	2026-02-28 00:48:58.32419+00	hddtd5m4qc67	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	874	5s37at4wqbj3	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 21:49:28.288231+00	2026-02-27 21:49:28.407903+00	5umn5yea77ul	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	1998	xvbbh6vpxamy	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	t	2026-03-13 14:16:27.423771+00	2026-03-13 14:16:27.753738+00	pvgjaav7s6i6	6645979d-a485-44c9-94c8-2b87e081c735
00000000-0000-0000-0000-000000000000	865	hiosofyyeddm	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 20:50:51.840441+00	2026-02-27 21:50:40.939657+00	4qsyrjgebyt4	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	916	rotk5houhydx	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 00:48:58.326145+00	2026-02-28 00:48:58.44464+00	4zuyohy4aurp	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	876	otx5ptnjrizx	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 21:50:40.940595+00	2026-02-27 21:50:41.005462+00	hiosofyyeddm	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	905	2c3knp6l6tv7	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 23:50:20.141422+00	2026-02-28 00:50:10.243596+00	hg2w6tz3pyv3	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	878	hoqyc4skvyjl	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 21:50:41.498672+00	2026-02-27 21:50:41.615992+00	cwnk7scwha47	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	907	rljgpb64ekgh	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 23:50:21.438412+00	2026-02-28 00:50:11.574312+00	24xiwulcux3r	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	867	rxbissh652yn	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 20:51:34.705587+00	2026-02-27 21:51:23.782636+00	4mowdmdkijiv	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	880	zji3dxz3mc2f	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 21:51:23.78334+00	2026-02-27 21:51:23.845162+00	rxbissh652yn	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	2000	fckzb6rm2pqo	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-13 14:17:08.739849+00	2026-03-13 14:17:08.975669+00	hbzzbpzklhbr	58c090c6-d4ea-4c6c-9f88-1e2cd9879ed8
00000000-0000-0000-0000-000000000000	917	egmodels4ghf	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 00:48:58.445039+00	2026-02-28 01:48:48.726294+00	rotk5houhydx	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	1999	k7tpz5vqbtlb	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	t	2026-03-13 14:16:27.754378+00	2026-03-13 15:16:18.050349+00	xvbbh6vpxamy	6645979d-a485-44c9-94c8-2b87e081c735
00000000-0000-0000-0000-000000000000	2001	m2kwgjcbulyk	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-13 14:17:08.980884+00	2026-03-13 15:16:58.73804+00	fckzb6rm2pqo	58c090c6-d4ea-4c6c-9f88-1e2cd9879ed8
00000000-0000-0000-0000-000000000000	2038	ghyyex6rarhp	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-14 16:23:23.668672+00	2026-03-14 16:23:23.902035+00	nj6g3i4txgmx	a599f3b1-cd36-49b9-adb8-0ffdfcb34bc8
00000000-0000-0000-0000-000000000000	2040	ocyagr2gui53	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-14 16:23:43.291176+00	2026-03-14 16:23:43.546064+00	7r2vj37unfe4	f9095374-8d70-4e81-8acd-9c5577aefd94
00000000-0000-0000-0000-000000000000	2039	7nq3n7gbyxyg	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-14 16:23:23.906952+00	2026-03-15 16:23:13.894481+00	ghyyex6rarhp	a599f3b1-cd36-49b9-adb8-0ffdfcb34bc8
00000000-0000-0000-0000-000000000000	2041	otya5evqdyo4	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-14 16:23:43.547019+00	2026-03-15 16:23:32.813348+00	ocyagr2gui53	f9095374-8d70-4e81-8acd-9c5577aefd94
00000000-0000-0000-0000-000000000000	875	ehgyj242mhc4	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 21:49:28.408289+00	2026-02-27 22:49:18.694398+00	5s37at4wqbj3	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	888	kwhjqteykbmf	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 22:49:18.695143+00	2026-02-27 22:49:18.765912+00	ehgyj242mhc4	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	879	ut6ysjmfpsem	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 21:50:41.616439+00	2026-02-27 22:50:30.794984+00	hoqyc4skvyjl	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	890	zdf2ssqufiid	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 22:50:30.795826+00	2026-02-27 22:50:30.87225+00	ut6ysjmfpsem	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	877	uyvk7kgyre2k	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 21:50:41.005853+00	2026-02-27 22:50:31.159619+00	otx5ptnjrizx	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	892	fg6vw4l5lbi3	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 22:50:31.159975+00	2026-02-27 22:50:31.246403+00	uyvk7kgyre2k	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	881	w3zd2yrvl6aa	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 21:51:23.845601+00	2026-02-27 22:51:12.929249+00	zji3dxz3mc2f	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	894	bixotifx3j2y	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 22:51:12.929755+00	2026-02-27 22:51:13.000352+00	w3zd2yrvl6aa	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	889	feqtr3pkz7jg	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 22:49:18.766314+00	2026-02-27 23:49:07.952579+00	kwhjqteykbmf	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	902	hddtd5m4qc67	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 23:49:07.954283+00	2026-02-27 23:49:08.074044+00	feqtr3pkz7jg	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	891	5kosrtfett4c	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 22:50:30.872636+00	2026-02-27 23:50:20.05704+00	zdf2ssqufiid	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	904	hg2w6tz3pyv3	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 23:50:20.058497+00	2026-02-27 23:50:20.140997+00	5kosrtfett4c	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	893	loxglrl5q6fq	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 22:50:31.246761+00	2026-02-27 23:50:21.373697+00	fg6vw4l5lbi3	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	906	24xiwulcux3r	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 23:50:21.374486+00	2026-02-27 23:50:21.437996+00	loxglrl5q6fq	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	1085	avkbyouqafnd	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 08:42:54.612547+00	2026-03-05 08:42:54.85152+00	xxjo44gvrfmq	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	918	5uzhjcrv7bb2	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 00:50:10.244341+00	2026-02-28 00:50:10.374816+00	2c3knp6l6tv7	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	2078	gx2bw6zluock	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-16 13:57:23.349356+00	2026-03-16 13:57:23.349356+00	\N	94a8ad15-ad23-4060-b8f0-ac82459aa3bb
00000000-0000-0000-0000-000000000000	1793	wyoccepyuup4	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-11 15:15:52.611139+00	2026-03-11 15:15:52.915391+00	244bcq6fzznc	d6b1b72a-ded3-41b4-a0da-82ffbdabce7b
00000000-0000-0000-0000-000000000000	920	4ymfknkdmvf3	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 00:50:11.574686+00	2026-02-28 00:50:11.690205+00	rljgpb64ekgh	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	909	3fbcamx44hky	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-27 23:51:03.223827+00	2026-02-28 00:50:53.318591+00	fytjwya2ya3h	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	1794	jvvlasqzbakr	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-11 15:15:52.916447+00	2026-03-11 16:15:43.110096+00	wyoccepyuup4	d6b1b72a-ded3-41b4-a0da-82ffbdabce7b
00000000-0000-0000-0000-000000000000	922	3lpbnkfl4jic	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 00:50:53.319482+00	2026-02-28 00:50:53.379104+00	3fbcamx44hky	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	1840	ry6vitjafl7d	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 12:27:17.31922+00	2026-03-12 12:27:17.579953+00	zwdhcw74xdlr	f8e0f6bf-bbce-4446-a7f9-f5accd4cbe07
00000000-0000-0000-0000-000000000000	1841	zpsrxcstwn7x	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 12:27:17.581684+00	2026-03-12 12:28:06.87254+00	ry6vitjafl7d	f8e0f6bf-bbce-4446-a7f9-f5accd4cbe07
00000000-0000-0000-0000-000000000000	1842	ima52rm25unn	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 12:28:06.873249+00	2026-03-12 12:28:07.118662+00	zpsrxcstwn7x	f8e0f6bf-bbce-4446-a7f9-f5accd4cbe07
00000000-0000-0000-0000-000000000000	1843	vdfuh5onhl3f	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 12:28:07.119059+00	2026-03-12 12:28:57.40047+00	ima52rm25unn	f8e0f6bf-bbce-4446-a7f9-f5accd4cbe07
00000000-0000-0000-0000-000000000000	1844	tyb7gxqpjknc	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 12:28:57.400777+00	2026-03-12 12:28:57.626028+00	vdfuh5onhl3f	f8e0f6bf-bbce-4446-a7f9-f5accd4cbe07
00000000-0000-0000-0000-000000000000	1845	evxzlyltjt6s	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 12:28:57.626343+00	2026-03-12 12:29:46.895231+00	tyb7gxqpjknc	f8e0f6bf-bbce-4446-a7f9-f5accd4cbe07
00000000-0000-0000-0000-000000000000	930	i5je4r6pp6m4	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 01:48:48.727418+00	2026-02-28 01:48:48.842197+00	egmodels4ghf	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	919	lxz5at45nh25	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 00:50:10.375397+00	2026-02-28 01:50:00.549165+00	5uzhjcrv7bb2	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	1846	rj2k2ymlo67w	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 12:29:46.895519+00	2026-03-12 12:29:47.142399+00	evxzlyltjt6s	f8e0f6bf-bbce-4446-a7f9-f5accd4cbe07
00000000-0000-0000-0000-000000000000	932	tbpepkdfenth	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 01:50:00.550013+00	2026-02-28 01:50:00.620254+00	lxz5at45nh25	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	921	excxbpygo45g	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 00:50:11.690598+00	2026-02-28 01:50:00.818052+00	4ymfknkdmvf3	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	1847	pnfayfwishu3	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 12:29:47.142741+00	2026-03-12 12:30:37.440975+00	rj2k2ymlo67w	f8e0f6bf-bbce-4446-a7f9-f5accd4cbe07
00000000-0000-0000-0000-000000000000	934	nsjj5sgp3ptj	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 01:50:00.819405+00	2026-02-28 01:50:00.878006+00	excxbpygo45g	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	923	eoa5m4lsfhgk	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 00:50:53.379531+00	2026-02-28 01:50:43.517256+00	3lpbnkfl4jic	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	1848	fmm47etb6mtz	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 12:30:37.441359+00	2026-03-12 12:30:37.663832+00	pnfayfwishu3	f8e0f6bf-bbce-4446-a7f9-f5accd4cbe07
00000000-0000-0000-0000-000000000000	936	lamoqmlmuejj	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 01:50:43.517692+00	2026-02-28 01:50:43.635386+00	eoa5m4lsfhgk	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	1849	z33jfinvzc6z	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 12:30:37.664253+00	2026-03-12 12:31:12.363055+00	fmm47etb6mtz	f8e0f6bf-bbce-4446-a7f9-f5accd4cbe07
00000000-0000-0000-0000-000000000000	1850	ogjaydonbrq5	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 12:32:13.369153+00	2026-03-12 12:33:03.985053+00	\N	7838f368-8084-4ae6-bbe0-df7735fd5f40
00000000-0000-0000-0000-000000000000	1851	f7227oxzom5c	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 12:33:04.005334+00	2026-03-12 12:33:04.32435+00	ogjaydonbrq5	7838f368-8084-4ae6-bbe0-df7735fd5f40
00000000-0000-0000-0000-000000000000	1852	htsitv3szt3b	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 12:33:04.324695+00	2026-03-12 12:33:54.593116+00	f7227oxzom5c	7838f368-8084-4ae6-bbe0-df7735fd5f40
00000000-0000-0000-0000-000000000000	1853	dlfzua2yi24u	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 12:33:54.593498+00	2026-03-12 12:33:54.851245+00	htsitv3szt3b	7838f368-8084-4ae6-bbe0-df7735fd5f40
00000000-0000-0000-0000-000000000000	1854	ltspc3tjghqi	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 12:33:54.851685+00	2026-03-12 12:34:44.154803+00	dlfzua2yi24u	7838f368-8084-4ae6-bbe0-df7735fd5f40
00000000-0000-0000-0000-000000000000	931	jcufx6v4frus	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 01:48:48.84261+00	2026-02-28 02:48:38.083475+00	i5je4r6pp6m4	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	1855	56j3tv2tc6s2	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 12:34:44.155367+00	2026-03-12 12:34:44.396926+00	ltspc3tjghqi	7838f368-8084-4ae6-bbe0-df7735fd5f40
00000000-0000-0000-0000-000000000000	944	sqsx2lleyimw	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 02:48:38.084893+00	2026-02-28 02:48:38.145511+00	jcufx6v4frus	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	933	jz5c3m26oetn	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 01:50:00.621306+00	2026-02-28 02:49:49.772607+00	tbpepkdfenth	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	946	nm6hobjlzu7e	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 02:49:49.773367+00	2026-02-28 02:49:49.920027+00	jz5c3m26oetn	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	935	htwgc4xiq5h3	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 01:50:00.878413+00	2026-02-28 02:49:49.952592+00	nsjj5sgp3ptj	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	948	3vhy45elgsnv	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 02:49:49.953052+00	2026-02-28 02:49:50.014615+00	htwgc4xiq5h3	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	937	zvjtgrcqhxxi	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 01:50:43.635737+00	2026-02-28 02:50:32.752178+00	lamoqmlmuejj	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	950	qhzvyop6pnr3	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 02:50:32.752626+00	2026-02-28 02:50:32.808715+00	zvjtgrcqhxxi	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	945	vfojbwjx3odg	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 02:48:38.145925+00	2026-02-28 03:48:28.427254+00	sqsx2lleyimw	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	958	7fyn6gpm75sx	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 03:48:28.429196+00	2026-02-28 03:48:28.506445+00	vfojbwjx3odg	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	947	psaw43gajhff	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 02:49:49.92047+00	2026-02-28 03:49:39.022529+00	nm6hobjlzu7e	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	960	lk3ioixphay5	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 03:49:39.023774+00	2026-02-28 03:49:39.083588+00	psaw43gajhff	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	949	6ume5a5tugso	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 02:49:50.015045+00	2026-02-28 03:49:40.151709+00	3vhy45elgsnv	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	962	vusgtjaeh67d	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 03:49:40.152047+00	2026-02-28 03:49:40.220604+00	6ume5a5tugso	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	951	sbd4y4v2bjhh	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 02:50:32.809186+00	2026-02-28 03:50:21.895367+00	qhzvyop6pnr3	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	964	5aq2qyws7pyn	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 03:50:21.896016+00	2026-02-28 03:50:21.956545+00	sbd4y4v2bjhh	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	959	sg7jvwqmwf3r	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 03:48:28.506856+00	2026-02-28 04:48:17.788934+00	7fyn6gpm75sx	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	961	4x5uei3kfh7z	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 03:49:39.084002+00	2026-02-28 04:49:29.240477+00	lk3ioixphay5	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	963	jszyqyw52dfy	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 03:49:40.221061+00	2026-02-28 04:49:30.310491+00	vusgtjaeh67d	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	965	p6sr6glphaxh	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 03:50:21.956953+00	2026-02-28 04:50:11.1167+00	5aq2qyws7pyn	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	2079	k7un6gieec5r	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	f	2026-03-16 13:57:31.842136+00	2026-03-16 13:57:31.842136+00	\N	783405cc-a0f9-413c-941b-4b260c298cc7
00000000-0000-0000-0000-000000000000	1795	n4m3u4wqiicw	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-11 16:15:43.124393+00	2026-03-11 16:15:43.424566+00	jvvlasqzbakr	d6b1b72a-ded3-41b4-a0da-82ffbdabce7b
00000000-0000-0000-0000-000000000000	1796	p26uh4lkeq2f	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-11 16:15:43.424953+00	2026-03-11 17:15:33.608545+00	n4m3u4wqiicw	d6b1b72a-ded3-41b4-a0da-82ffbdabce7b
00000000-0000-0000-0000-000000000000	1856	2oqmzpkfydfz	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 12:34:44.397249+00	2026-03-12 12:35:33.668227+00	56j3tv2tc6s2	7838f368-8084-4ae6-bbe0-df7735fd5f40
00000000-0000-0000-0000-000000000000	1857	k2qbhfodtdcw	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 12:35:33.668973+00	2026-03-12 12:35:33.900467+00	2oqmzpkfydfz	7838f368-8084-4ae6-bbe0-df7735fd5f40
00000000-0000-0000-0000-000000000000	1858	k34bmth3hx7g	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 12:35:33.900832+00	2026-03-12 12:36:23.19528+00	k2qbhfodtdcw	7838f368-8084-4ae6-bbe0-df7735fd5f40
00000000-0000-0000-0000-000000000000	972	dm5oe2hegmuw	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 04:48:17.789684+00	2026-02-28 04:48:17.86148+00	sg7jvwqmwf3r	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	1859	lubb5pjcjktw	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 12:36:23.195916+00	2026-03-12 12:36:23.423473+00	k34bmth3hx7g	7838f368-8084-4ae6-bbe0-df7735fd5f40
00000000-0000-0000-0000-000000000000	974	t3qhfba7ivac	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 04:49:29.241551+00	2026-02-28 04:49:29.312035+00	4x5uei3kfh7z	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	1860	7wy3xu6gxkkm	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 12:36:23.423855+00	2026-03-12 12:37:12.711957+00	lubb5pjcjktw	7838f368-8084-4ae6-bbe0-df7735fd5f40
00000000-0000-0000-0000-000000000000	976	pmylakypjrl2	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 04:49:30.310847+00	2026-02-28 04:49:30.37962+00	jszyqyw52dfy	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	1861	tkbjjiqjhn6v	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 12:37:12.712611+00	2026-03-12 12:37:12.935014+00	7wy3xu6gxkkm	7838f368-8084-4ae6-bbe0-df7735fd5f40
00000000-0000-0000-0000-000000000000	978	tainaixexnk6	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 04:50:11.117171+00	2026-02-28 04:50:11.176243+00	p6sr6glphaxh	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	1862	cjquwf7pcukm	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 12:37:12.935381+00	2026-03-12 12:38:02.197758+00	tkbjjiqjhn6v	7838f368-8084-4ae6-bbe0-df7735fd5f40
00000000-0000-0000-0000-000000000000	1863	j4ldplovnhq2	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 12:38:02.198382+00	2026-03-12 12:38:02.43927+00	cjquwf7pcukm	7838f368-8084-4ae6-bbe0-df7735fd5f40
00000000-0000-0000-0000-000000000000	1864	2qmhzaanguim	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 12:38:02.439598+00	2026-03-12 12:38:07.493182+00	j4ldplovnhq2	7838f368-8084-4ae6-bbe0-df7735fd5f40
00000000-0000-0000-0000-000000000000	1865	k4mtbbvzgmkk	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 12:39:50.806209+00	2026-03-12 12:40:40.304299+00	\N	2baa7522-47ad-4746-86f1-990dbee6a943
00000000-0000-0000-0000-000000000000	1866	clihcoqdwtf2	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 12:40:40.306309+00	2026-03-12 12:40:40.629916+00	k4mtbbvzgmkk	2baa7522-47ad-4746-86f1-990dbee6a943
00000000-0000-0000-0000-000000000000	1867	slrbb5zw6ema	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 12:40:40.630462+00	2026-03-12 12:41:30.022254+00	clihcoqdwtf2	2baa7522-47ad-4746-86f1-990dbee6a943
00000000-0000-0000-0000-000000000000	973	rqkaa5njowka	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 04:48:17.861869+00	2026-02-28 05:48:07.136511+00	dm5oe2hegmuw	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	986	iua76m7ddo6e	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 05:48:07.137702+00	2026-02-28 05:48:07.221185+00	rqkaa5njowka	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	987	5ribqpghvkre	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-02-28 05:48:07.221569+00	2026-02-28 05:48:07.221569+00	iua76m7ddo6e	430d614f-05af-4e7d-bc10-ed6b213807c2
00000000-0000-0000-0000-000000000000	975	bzz3at74x6q5	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 04:49:29.314541+00	2026-02-28 05:49:19.459611+00	t3qhfba7ivac	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	1869	vxx5bogwjzp5	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 12:41:30.022739+00	2026-03-12 12:41:30.34069+00	slrbb5zw6ema	2baa7522-47ad-4746-86f1-990dbee6a943
00000000-0000-0000-0000-000000000000	988	2xiwvuf6p6qb	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 05:49:19.462871+00	2026-02-28 05:49:19.529165+00	bzz3at74x6q5	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	989	6h4ksthreab7	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-02-28 05:49:19.530303+00	2026-02-28 05:49:19.530303+00	2xiwvuf6p6qb	705d8bf4-2351-4806-a7bd-f91650184c28
00000000-0000-0000-0000-000000000000	977	lsiklgfsrfzb	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 04:49:30.38066+00	2026-02-28 05:49:20.505587+00	pmylakypjrl2	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	1868	442cjrg6utgl	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 12:41:29.484753+00	2026-03-12 12:42:18.768495+00	\N	369a3098-ecca-4e8e-af5e-cfa56b4b32b3
00000000-0000-0000-0000-000000000000	990	wk3rsoxldyvv	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 05:49:20.505939+00	2026-02-28 05:49:20.571681+00	lsiklgfsrfzb	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	991	dybgo2q3jq7d	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-02-28 05:49:20.572055+00	2026-02-28 05:49:20.572055+00	wk3rsoxldyvv	04d04a5e-46f3-427f-97f5-5c68da109875
00000000-0000-0000-0000-000000000000	979	qpaojbizxo35	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 04:50:11.176593+00	2026-02-28 05:50:01.320375+00	tainaixexnk6	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	992	lidpmyjtj2lz	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 05:50:01.320806+00	2026-02-28 05:50:01.393995+00	qpaojbizxo35	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	993	hh6ikgqk2itw	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-02-28 05:50:01.39437+00	2026-03-03 13:53:24.95341+00	lidpmyjtj2lz	4c3628d5-5880-421c-9f67-4d3eba53b35a
00000000-0000-0000-0000-000000000000	998	mf5fbma4vizq	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-03 13:49:05.866492+00	2026-03-03 14:48:56.177563+00	\N	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1001	idp7pd7bmjqh	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-03 14:48:56.187471+00	2026-03-03 14:48:56.449481+00	mf5fbma4vizq	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1002	gupjxeqgwxdy	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-03 14:48:56.44983+00	2026-03-03 15:48:47.926392+00	idp7pd7bmjqh	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1003	fobtqyvbvtp3	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-03 15:48:47.958787+00	2026-03-03 15:48:48.231101+00	gupjxeqgwxdy	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1004	dsskh5xlui6i	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-03 15:48:48.232228+00	2026-03-03 16:48:39.666247+00	fobtqyvbvtp3	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1005	n77oihcusyn7	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-03 16:48:39.683845+00	2026-03-03 16:48:40.67371+00	dsskh5xlui6i	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1006	ed3pnpp7t7g4	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-03 16:48:40.674823+00	2026-03-03 17:48:31.203512+00	n77oihcusyn7	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1007	rso4osy6t6b2	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-03 17:48:31.220923+00	2026-03-03 17:48:31.589289+00	ed3pnpp7t7g4	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1008	dm6ti4hfatgb	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-03 17:48:31.589699+00	2026-03-03 18:48:21.852763+00	rso4osy6t6b2	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1009	t5ld3jh2zspl	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-03 18:48:21.868213+00	2026-03-03 18:48:22.237742+00	dm6ti4hfatgb	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1010	cwrxj4cvhkwa	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-03 18:48:22.238654+00	2026-03-03 19:48:13.745093+00	t5ld3jh2zspl	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1011	kywsbpdy6vnp	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-03 19:48:13.761918+00	2026-03-03 19:48:14.123943+00	cwrxj4cvhkwa	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1012	dl5w2dhj3gis	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-03 19:48:14.124313+00	2026-03-03 20:48:05.531751+00	kywsbpdy6vnp	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1013	lcwemuzoskgk	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-03 20:48:05.542967+00	2026-03-03 20:48:05.800886+00	dl5w2dhj3gis	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1014	h6rnfzzb5zpp	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-03 20:48:05.802586+00	2026-03-03 21:47:56.191506+00	lcwemuzoskgk	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1015	srudrgc7c66l	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-03 21:47:56.209659+00	2026-03-03 21:47:56.524228+00	h6rnfzzb5zpp	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1016	obl7maqi7zo2	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-03 21:47:56.52458+00	2026-03-03 22:47:46.831929+00	srudrgc7c66l	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1017	ji7keztf4aff	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-03 22:47:46.846539+00	2026-03-03 22:47:47.129531+00	obl7maqi7zo2	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1086	45lmfn4f3ah2	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 08:42:54.853217+00	2026-03-05 09:42:45.189521+00	avkbyouqafnd	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1018	rjbvk57romqj	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-03 22:47:47.131361+00	2026-03-03 23:47:38.644947+00	ji7keztf4aff	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1019	dut2b2rcqydl	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-03 23:47:38.658422+00	2026-03-03 23:47:38.880688+00	rjbvk57romqj	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1020	jxipevc745u3	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-03 23:47:38.881092+00	2026-03-04 00:47:29.228492+00	dut2b2rcqydl	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1021	yv77lnwyi2me	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 00:47:29.24957+00	2026-03-04 00:47:29.620144+00	jxipevc745u3	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1022	fis2p6srrt6j	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 00:47:29.620601+00	2026-03-04 01:47:20.481877+00	yv77lnwyi2me	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1023	dkmvn5wroylc	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 01:47:20.498713+00	2026-03-04 01:47:20.834288+00	fis2p6srrt6j	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1024	es77uk3hyu53	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 01:47:20.834733+00	2026-03-04 02:47:11.259151+00	dkmvn5wroylc	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1025	5vpun72ufygw	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 02:47:11.272962+00	2026-03-04 02:47:11.609251+00	es77uk3hyu53	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1026	hdu6zcg2e2rr	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 02:47:11.613346+00	2026-03-04 03:47:02.203428+00	5vpun72ufygw	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1027	xzyr6a42v5om	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 03:47:02.215672+00	2026-03-04 03:47:02.522159+00	hdu6zcg2e2rr	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1028	gteigvhpd7bo	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 03:47:02.522519+00	2026-03-04 04:46:53.065926+00	xzyr6a42v5om	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1029	m6hz2mwj5wvu	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 04:46:53.077792+00	2026-03-04 04:46:53.41272+00	gteigvhpd7bo	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1030	t56duxx5ttcv	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 04:46:53.413828+00	2026-03-04 05:46:44.736015+00	m6hz2mwj5wvu	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1031	kabjsxacy7mg	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 05:46:44.748391+00	2026-03-04 05:46:44.997633+00	t56duxx5ttcv	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1032	zryhgdyy3ahi	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 05:46:44.999178+00	2026-03-04 06:46:36.643416+00	kabjsxacy7mg	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1033	tvj62ltnecok	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 06:46:36.671971+00	2026-03-04 06:46:37.052825+00	zryhgdyy3ahi	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1034	sjm5oukv4cbl	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 06:46:37.053353+00	2026-03-04 07:46:28.309128+00	tvj62ltnecok	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1035	vxtawd5mxpf6	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 07:46:28.332431+00	2026-03-04 07:46:28.558634+00	sjm5oukv4cbl	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1036	het7jwdbsx43	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 07:46:28.559006+00	2026-03-04 08:46:18.949169+00	vxtawd5mxpf6	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1037	sobhtk7ctv6c	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 08:46:18.963202+00	2026-03-04 08:46:19.313213+00	het7jwdbsx43	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1038	ojuulja3lvfv	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 08:46:19.313586+00	2026-03-04 09:46:10.732595+00	sobhtk7ctv6c	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1039	zg3n4ln4vdf2	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 09:46:10.745759+00	2026-03-04 09:46:11.00671+00	ojuulja3lvfv	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1040	ac3utgrq5zld	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 09:46:11.008748+00	2026-03-04 10:46:02.159737+00	zg3n4ln4vdf2	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1041	3wldoedcazim	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 10:46:02.178115+00	2026-03-04 10:46:02.393877+00	ac3utgrq5zld	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1042	sjbhvjoaakby	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 10:46:02.395702+00	2026-03-04 11:45:53.857657+00	3wldoedcazim	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1043	xijvqwwngq2u	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 11:45:53.871826+00	2026-03-04 11:45:54.182984+00	sjbhvjoaakby	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1044	jipshbstcw4j	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 11:45:54.193193+00	2026-03-04 12:45:45.6495+00	xijvqwwngq2u	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1045	eywv6qf54fwi	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 12:45:45.668576+00	2026-03-04 12:45:45.99031+00	jipshbstcw4j	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1046	axyp7jsog3wj	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 12:45:45.992991+00	2026-03-04 13:45:36.429262+00	eywv6qf54fwi	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1047	wns5xtxzb4ky	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 13:45:36.450913+00	2026-03-04 13:45:36.751642+00	axyp7jsog3wj	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1048	eugd2rgctyrp	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 13:45:36.752563+00	2026-03-04 14:45:27.073686+00	wns5xtxzb4ky	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1049	4ohxt7dkgxca	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 14:45:27.087347+00	2026-03-04 14:45:27.443532+00	eugd2rgctyrp	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1050	ftg4oh6qwh5u	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 14:45:27.4446+00	2026-03-04 15:45:19.006337+00	4ohxt7dkgxca	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1051	dzihqfmczrrx	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 15:45:19.025207+00	2026-03-04 15:45:19.402896+00	ftg4oh6qwh5u	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1052	hwpx5esfjncp	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 15:45:19.403267+00	2026-03-04 16:45:10.898274+00	dzihqfmczrrx	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1053	vgviyvvvt6r7	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 16:45:10.907354+00	2026-03-04 16:45:11.295205+00	hwpx5esfjncp	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1054	oup4aomx67n4	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 16:45:11.29685+00	2026-03-04 17:45:03.626507+00	vgviyvvvt6r7	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1055	v2xobb5njo2x	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 17:45:03.659272+00	2026-03-04 17:45:04.158573+00	oup4aomx67n4	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1056	lhupvnsedwqi	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 17:45:04.158992+00	2026-03-04 18:44:55.705469+00	v2xobb5njo2x	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1057	5hp6zvzcw5ff	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 18:44:55.722622+00	2026-03-04 18:44:55.996319+00	lhupvnsedwqi	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1058	rxn5ngqd3ubs	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 18:44:55.998049+00	2026-03-04 19:44:47.607129+00	5hp6zvzcw5ff	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1059	mj7iy4jnkpvw	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 19:44:47.621466+00	2026-03-04 19:44:47.90026+00	rxn5ngqd3ubs	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1060	fdlghdeym4mv	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 19:44:47.900625+00	2026-03-04 20:44:38.34564+00	mj7iy4jnkpvw	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1061	5ubtymai2epb	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 20:44:38.360339+00	2026-03-04 20:44:38.722091+00	fdlghdeym4mv	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1062	2wxvpb3am56k	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 20:44:38.722479+00	2026-03-04 21:44:29.018432+00	5ubtymai2epb	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1063	xkwgkgqzzb7e	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 21:44:29.044219+00	2026-03-04 21:44:29.288679+00	2wxvpb3am56k	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1064	yrboekiec4ec	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 21:44:29.289254+00	2026-03-04 22:44:21.173794+00	xkwgkgqzzb7e	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1065	sdzqajjtfuy3	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 22:44:21.18834+00	2026-03-04 22:44:21.432297+00	yrboekiec4ec	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1066	tryppsklzcmf	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 22:44:21.434374+00	2026-03-04 23:44:12.962261+00	sdzqajjtfuy3	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1067	pbm3jni2dp7o	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 23:44:12.974942+00	2026-03-04 23:44:13.227881+00	tryppsklzcmf	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1082	vjfppdfc4z35	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 06:43:12.615159+00	2026-03-05 07:43:03.029209+00	mqua5val4wdr	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1068	pzdc5cf2qd2e	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-04 23:44:13.229182+00	2026-03-05 00:44:04.573533+00	pbm3jni2dp7o	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1311	s4e5kfaeoxbo	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 08:35:36.15824+00	2026-03-07 08:35:36.280305+00	x6j5t3fvpfsr	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1069	tfm3wwsxmk5s	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 00:44:04.591125+00	2026-03-05 00:44:04.897569+00	pzdc5cf2qd2e	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1087	j6daafp2kb3u	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 09:42:45.209374+00	2026-03-05 09:42:45.442741+00	45lmfn4f3ah2	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1070	bqwjvj25ncbp	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 00:44:04.900743+00	2026-03-05 01:43:55.350247+00	tfm3wwsxmk5s	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	2080	emxu5xhl73rn	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-16 14:04:13.313406+00	2026-03-16 14:04:13.313406+00	\N	969e7a8f-4493-4901-bb13-1022579fe89c
00000000-0000-0000-0000-000000000000	1071	2iqetbdhzs2v	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 01:43:55.377718+00	2026-03-05 01:43:55.647858+00	bqwjvj25ncbp	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1088	yxjoaimyonxq	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 09:42:45.444108+00	2026-03-05 10:42:36.933172+00	j6daafp2kb3u	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1072	fjhpbd3jcvjg	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 01:43:55.64886+00	2026-03-05 02:43:46.132321+00	2iqetbdhzs2v	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1797	zagmxif4ep74	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-11 17:15:33.627242+00	2026-03-11 17:15:33.910387+00	p26uh4lkeq2f	d6b1b72a-ded3-41b4-a0da-82ffbdabce7b
00000000-0000-0000-0000-000000000000	1073	xs2rpunn55em	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 02:43:46.144196+00	2026-03-05 02:43:46.388322+00	fjhpbd3jcvjg	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1089	y4xapiqc2qdq	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 10:42:36.966173+00	2026-03-05 10:42:37.318995+00	yxjoaimyonxq	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1074	tycwy4p7ieq7	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 02:43:46.388676+00	2026-03-05 03:43:37.737566+00	xs2rpunn55em	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1075	l5sjj2jln4su	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 03:43:37.754524+00	2026-03-05 03:43:38.221791+00	tycwy4p7ieq7	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1090	5x47laxbxm3g	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 10:42:37.319375+00	2026-03-05 11:42:28.535829+00	y4xapiqc2qdq	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1076	u6gpvy5jnsun	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 03:43:38.222229+00	2026-03-05 04:43:29.748459+00	l5sjj2jln4su	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1798	w67amtcxsucr	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-11 17:15:33.91095+00	2026-03-11 18:15:24.115452+00	zagmxif4ep74	d6b1b72a-ded3-41b4-a0da-82ffbdabce7b
00000000-0000-0000-0000-000000000000	1077	y3btgaurn4ip	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 04:43:29.761229+00	2026-03-05 04:43:30.027262+00	u6gpvy5jnsun	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1091	oyamvfwhxrur	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 11:42:28.549807+00	2026-03-05 11:42:28.769436+00	5x47laxbxm3g	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1078	y7y246m4nkng	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 04:43:30.028961+00	2026-03-05 05:43:21.505588+00	y3btgaurn4ip	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1079	luhs4lmkq6mh	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 05:43:21.525271+00	2026-03-05 05:43:21.880764+00	y7y246m4nkng	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1092	wbddf4567vq2	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 11:42:28.769833+00	2026-03-05 12:42:19.139862+00	oyamvfwhxrur	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1080	iftfznlflhnu	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 05:43:21.881157+00	2026-03-05 06:43:12.237677+00	luhs4lmkq6mh	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1081	mqua5val4wdr	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 06:43:12.266749+00	2026-03-05 06:43:12.614033+00	iftfznlflhnu	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1871	3twxwqshubue	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 12:42:18.769234+00	2026-03-12 12:42:19.006186+00	442cjrg6utgl	369a3098-ecca-4e8e-af5e-cfa56b4b32b3
00000000-0000-0000-0000-000000000000	1093	vmafrnyhs53v	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 12:42:19.165711+00	2026-03-05 12:42:19.412523+00	wbddf4567vq2	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1870	2mkv4g64lzrm	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 12:41:30.341194+00	2026-03-12 12:42:21.201445+00	vxx5bogwjzp5	2baa7522-47ad-4746-86f1-990dbee6a943
00000000-0000-0000-0000-000000000000	1094	q5kuu7xgzedy	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 12:42:19.41351+00	2026-03-05 13:42:10.532507+00	vmafrnyhs53v	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1096	3chy7gikjnv2	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 13:42:10.538007+00	2026-03-05 13:42:10.722582+00	q5kuu7xgzedy	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1873	nc236edmtfrb	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 12:42:21.201766+00	2026-03-12 12:42:21.520123+00	2mkv4g64lzrm	2baa7522-47ad-4746-86f1-990dbee6a943
00000000-0000-0000-0000-000000000000	1872	yyyo7nhyn7as	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 12:42:19.00657+00	2026-03-12 12:43:09.293501+00	3twxwqshubue	369a3098-ecca-4e8e-af5e-cfa56b4b32b3
00000000-0000-0000-0000-000000000000	1875	vxnlo2qrfrec	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 12:43:09.294111+00	2026-03-12 12:43:09.516902+00	yyyo7nhyn7as	369a3098-ecca-4e8e-af5e-cfa56b4b32b3
00000000-0000-0000-0000-000000000000	1097	3bbzobgwiju4	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 13:42:10.722946+00	2026-03-05 14:42:00.647244+00	3chy7gikjnv2	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1100	vee5q3ky3jhk	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 14:42:00.65292+00	2026-03-05 14:42:01.098909+00	3bbzobgwiju4	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1874	bs4pa54cbjnf	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 12:42:21.520454+00	2026-03-12 12:43:11.842664+00	nc236edmtfrb	2baa7522-47ad-4746-86f1-990dbee6a943
00000000-0000-0000-0000-000000000000	1877	7g66uramd5a3	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 12:43:11.842958+00	2026-03-12 12:43:12.167211+00	bs4pa54cbjnf	2baa7522-47ad-4746-86f1-990dbee6a943
00000000-0000-0000-0000-000000000000	1876	wudv3ekh3k2b	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 12:43:09.518704+00	2026-03-12 12:43:58.810596+00	vxnlo2qrfrec	369a3098-ecca-4e8e-af5e-cfa56b4b32b3
00000000-0000-0000-0000-000000000000	1101	2cc6jjdtxobd	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 14:42:01.09938+00	2026-03-05 15:41:52.268705+00	vee5q3ky3jhk	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1104	sykqyv6nrmxc	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 15:41:52.273825+00	2026-03-05 15:41:52.524702+00	2cc6jjdtxobd	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1879	f6dbsosnwi26	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 12:43:58.811395+00	2026-03-12 12:43:59.024028+00	wudv3ekh3k2b	369a3098-ecca-4e8e-af5e-cfa56b4b32b3
00000000-0000-0000-0000-000000000000	1878	c2wsqyoyk7p5	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 12:43:12.168269+00	2026-03-12 12:44:03.035593+00	7g66uramd5a3	2baa7522-47ad-4746-86f1-990dbee6a943
00000000-0000-0000-0000-000000000000	1105	4kzsgcbnpsao	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 15:41:52.525847+00	2026-03-05 16:41:43.031678+00	sykqyv6nrmxc	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1108	wkwm53zjt3k5	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 16:41:43.046603+00	2026-03-05 16:41:43.274947+00	4kzsgcbnpsao	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1109	gq2y53f7sqhs	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 16:41:43.275366+00	2026-03-05 17:41:34.55833+00	wkwm53zjt3k5	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1112	3ulewos4dk4h	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 17:41:34.570076+00	2026-03-05 17:41:34.765972+00	gq2y53f7sqhs	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1113	rxnpvtynzcux	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 17:41:34.766338+00	2026-03-05 18:41:25.064879+00	3ulewos4dk4h	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1116	evzbyu3o76rq	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 18:41:25.085704+00	2026-03-05 18:41:25.366172+00	rxnpvtynzcux	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1117	pp372hmcawwj	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 18:41:25.366547+00	2026-03-05 19:41:16.479986+00	evzbyu3o76rq	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1120	a3hbqalxtncq	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 19:41:16.494176+00	2026-03-05 19:41:16.70848+00	pp372hmcawwj	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1121	r7lilkffw5fz	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 19:41:16.708895+00	2026-03-05 20:41:07.001075+00	a3hbqalxtncq	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	2081	m4i3ynkjslkq	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-16 14:13:50.935782+00	2026-03-16 14:13:50.935782+00	\N	b9fd47f5-face-4c6a-b72a-4c9b490db883
00000000-0000-0000-0000-000000000000	1799	kgu7sp5tlfup	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-11 18:15:24.1354+00	2026-03-11 18:15:24.432909+00	w67amtcxsucr	d6b1b72a-ded3-41b4-a0da-82ffbdabce7b
00000000-0000-0000-0000-000000000000	2082	pouzinomkrne	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-16 14:14:13.197633+00	2026-03-16 14:14:13.197633+00	\N	83515b35-df88-4ffb-9b9a-ee91b9a277dd
00000000-0000-0000-0000-000000000000	1800	vn3e4rh36cb5	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-11 18:15:24.433801+00	2026-03-11 19:15:14.628132+00	kgu7sp5tlfup	d6b1b72a-ded3-41b4-a0da-82ffbdabce7b
00000000-0000-0000-0000-000000000000	1124	k46uy2hkzf3q	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 20:41:07.01756+00	2026-03-05 20:41:07.291415+00	r7lilkffw5fz	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	2083	g533bsrccr5a	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-16 14:15:08.945968+00	2026-03-16 14:15:08.945968+00	\N	a20299bb-5c06-46ef-bb3e-3ea7f1b46d9d
00000000-0000-0000-0000-000000000000	2117	2qhzcycfw5sz	31cc7cef-c734-4a0d-8368-10440ee52424	f	2026-03-16 23:57:45.793394+00	2026-03-16 23:57:45.793394+00	\N	a885836c-a458-448b-ae7d-8a1d81bbe2f3
00000000-0000-0000-0000-000000000000	1881	jte7oj6uwbdw	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 12:44:03.035983+00	2026-03-12 12:44:03.390023+00	c2wsqyoyk7p5	2baa7522-47ad-4746-86f1-990dbee6a943
00000000-0000-0000-0000-000000000000	2065	kntaetkw5yq4	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-16 12:49:35.308163+00	2026-03-17 12:49:25.633715+00	\N	dc14b904-2e11-495e-ba6a-5a34d37eb128
00000000-0000-0000-0000-000000000000	1882	ywxchmlzyaxx	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 12:44:03.390998+00	2026-03-12 12:44:14.74618+00	jte7oj6uwbdw	2baa7522-47ad-4746-86f1-990dbee6a943
00000000-0000-0000-0000-000000000000	1125	olxonf4bmupm	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 20:41:07.291838+00	2026-03-05 21:40:58.530477+00	k46uy2hkzf3q	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1880	dwmqw3hcce5k	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 12:43:59.024422+00	2026-03-12 12:44:49.302618+00	f6dbsosnwi26	369a3098-ecca-4e8e-af5e-cfa56b4b32b3
00000000-0000-0000-0000-000000000000	1128	i5etkukhky2r	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 21:40:58.551154+00	2026-03-05 21:40:58.841413+00	olxonf4bmupm	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1972	inowzyzztxns	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-13 09:47:44.924357+00	2026-03-13 09:47:45.228054+00	hui2aljpvyw7	0b65d8f7-602e-4ac4-ba24-1251ee3ed0bd
00000000-0000-0000-0000-000000000000	2127	dku77fbndfgf	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-17 12:49:25.673183+00	2026-03-17 12:49:25.989692+00	kntaetkw5yq4	dc14b904-2e11-495e-ba6a-5a34d37eb128
00000000-0000-0000-0000-000000000000	1973	i55gknt3ptog	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-13 09:47:45.228556+00	2026-03-13 09:51:39.708688+00	inowzyzztxns	0b65d8f7-602e-4ac4-ba24-1251ee3ed0bd
00000000-0000-0000-0000-000000000000	2128	wssfj5q4souh	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-17 12:49:25.990178+00	2026-03-17 12:49:25.990178+00	dku77fbndfgf	dc14b904-2e11-495e-ba6a-5a34d37eb128
00000000-0000-0000-0000-000000000000	1129	mtc7olod2ecx	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 21:40:58.842444+00	2026-03-05 22:40:49.038053+00	i5etkukhky2r	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	2002	df5dbvsyzjq2	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-13 14:24:12.312205+00	2026-03-13 14:24:12.566423+00	p7veloo5clbn	f9095374-8d70-4e81-8acd-9c5577aefd94
00000000-0000-0000-0000-000000000000	1132	5wss5k7crqod	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 22:40:49.057315+00	2026-03-05 22:40:49.283192+00	mtc7olod2ecx	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	2066	4ydd24kgnios	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-16 12:49:57.499786+00	2026-03-17 12:49:46.770645+00	\N	c217fe4b-481a-4fca-8691-8789a695de9e
00000000-0000-0000-0000-000000000000	2003	admhsndyyozf	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-13 14:24:12.567366+00	2026-03-13 15:24:01.863828+00	df5dbvsyzjq2	f9095374-8d70-4e81-8acd-9c5577aefd94
00000000-0000-0000-0000-000000000000	2042	jedi24mwouip	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-14 16:26:38.966462+00	2026-03-14 16:26:39.324124+00	cbxrzgktwxpb	ec552c3f-10bd-42f6-9b4f-0e6c03e9a1c8
00000000-0000-0000-0000-000000000000	2129	sgwvakeaqofv	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-17 12:49:46.771011+00	2026-03-17 12:49:47.026362+00	4ydd24kgnios	c217fe4b-481a-4fca-8691-8789a695de9e
00000000-0000-0000-0000-000000000000	1133	4gvioqyvxhxr	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 22:40:49.28365+00	2026-03-05 23:40:40.531722+00	5wss5k7crqod	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	2043	iphntpdub6im	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-14 16:26:39.32461+00	2026-03-15 16:26:29.700783+00	jedi24mwouip	ec552c3f-10bd-42f6-9b4f-0e6c03e9a1c8
00000000-0000-0000-0000-000000000000	1136	tw5mftlc63mn	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 23:40:40.546323+00	2026-03-05 23:40:40.941371+00	4gvioqyvxhxr	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	2130	jognrzh47jbz	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-17 12:49:47.027662+00	2026-03-17 12:49:47.027662+00	sgwvakeaqofv	c217fe4b-481a-4fca-8691-8789a695de9e
00000000-0000-0000-0000-000000000000	1137	r5naaui4uv76	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-05 23:40:40.942917+00	2026-03-06 00:40:31.029351+00	tw5mftlc63mn	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1140	h7zk4k4uwo2v	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 00:40:31.04123+00	2026-03-06 00:40:31.429714+00	r5naaui4uv76	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1141	qmt5cbht7h7y	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 00:40:31.430669+00	2026-03-06 01:40:22.727637+00	h7zk4k4uwo2v	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1144	auwc7uv66b7p	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 01:40:22.737603+00	2026-03-06 01:40:22.954172+00	qmt5cbht7h7y	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1145	3dc55ex5kvef	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 01:40:22.95539+00	2026-03-06 02:40:13.373747+00	auwc7uv66b7p	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1148	5kpwpmgwmugt	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 02:40:13.385339+00	2026-03-06 02:40:13.687595+00	3dc55ex5kvef	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1149	yjk43maeysk5	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 02:40:13.687964+00	2026-03-06 03:40:04.035567+00	5kpwpmgwmugt	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1152	pyqp6g5wvnmv	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 03:40:04.041241+00	2026-03-06 03:40:04.258094+00	yjk43maeysk5	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1153	e4xfipdvd3a3	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 03:40:04.258452+00	2026-03-06 04:39:55.2676+00	pyqp6g5wvnmv	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1156	6y4iy6waw3jk	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 04:39:55.283637+00	2026-03-06 04:39:55.481312+00	e4xfipdvd3a3	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1157	zkcmjtms3nss	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 04:39:55.48173+00	2026-03-06 05:39:45.375267+00	6y4iy6waw3jk	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1159	2jxnfypeargr	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 05:39:45.387941+00	2026-03-06 05:39:45.581578+00	zkcmjtms3nss	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1160	afo3zceg6mm2	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 05:39:45.582053+00	2026-03-06 06:39:35.746272+00	2jxnfypeargr	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1163	o6wienhdrzgy	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 06:39:35.755784+00	2026-03-06 06:39:35.958721+00	afo3zceg6mm2	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1164	i6vy6mu2wr75	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 06:39:35.959119+00	2026-03-06 07:39:26.119656+00	o6wienhdrzgy	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1168	swq3jho2gw3g	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 07:39:26.134247+00	2026-03-06 07:39:26.3295+00	i6vy6mu2wr75	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1167	2tc4l3rzn3px	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 07:09:10.294757+00	2026-03-06 08:09:01.110258+00	\N	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1169	a4bbngrglu5e	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 07:39:26.329948+00	2026-03-06 08:39:17.318617+00	swq3jho2gw3g	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1581	4cig3ytuetsg	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 05:28:25.035817+00	2026-03-09 05:28:25.217497+00	mvwi3ok66tna	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1172	bgxjxjasqacn	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 08:09:01.11295+00	2026-03-06 08:09:01.317775+00	2tc4l3rzn3px	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	2084	d7tpipmpeapp	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-16 14:17:34.746575+00	2026-03-16 14:17:34.746575+00	\N	dd19bc5b-fbbc-44d2-b308-8b528d5960cd
00000000-0000-0000-0000-000000000000	1801	d5olcol7sw7f	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-11 19:15:14.644154+00	2026-03-11 19:15:14.923543+00	vn3e4rh36cb5	d6b1b72a-ded3-41b4-a0da-82ffbdabce7b
00000000-0000-0000-0000-000000000000	1174	6dxriw54jmqp	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 08:39:17.336373+00	2026-03-06 08:39:17.488703+00	a4bbngrglu5e	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	2085	3u6qc2lungvt	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-16 14:18:16.742919+00	2026-03-16 14:18:16.742919+00	\N	cf33d9d9-a57a-493e-8e8a-d626a049ffb0
00000000-0000-0000-0000-000000000000	1173	zyvr6k3tjsuf	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 08:09:01.318143+00	2026-03-06 09:08:52.420095+00	bgxjxjasqacn	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1802	prnld2cdu2oi	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-11 19:15:14.923954+00	2026-03-11 20:15:05.160193+00	d5olcol7sw7f	d6b1b72a-ded3-41b4-a0da-82ffbdabce7b
00000000-0000-0000-0000-000000000000	1176	pl6ijr3n7vuw	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 09:08:52.435505+00	2026-03-06 09:08:52.729469+00	zyvr6k3tjsuf	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1175	ku6rxuzjaofa	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 08:39:17.489058+00	2026-03-06 09:39:07.493387+00	6dxriw54jmqp	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1883	nlr5wygrkfiz	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 12:44:49.307117+00	2026-03-12 12:44:49.530236+00	dwmqw3hcce5k	369a3098-ecca-4e8e-af5e-cfa56b4b32b3
00000000-0000-0000-0000-000000000000	1178	4ml4elymchd7	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 09:39:07.504621+00	2026-03-06 09:39:07.752685+00	ku6rxuzjaofa	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1177	nqp3nrv6ad3r	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 09:08:52.732354+00	2026-03-06 10:08:42.833308+00	pl6ijr3n7vuw	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1884	nvp3y23qca5s	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 12:44:49.530647+00	2026-03-12 13:44:39.072013+00	nlr5wygrkfiz	369a3098-ecca-4e8e-af5e-cfa56b4b32b3
00000000-0000-0000-0000-000000000000	1180	pm425gnju74l	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 10:08:42.854284+00	2026-03-06 10:08:43.164219+00	nqp3nrv6ad3r	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1974	2o4mntcy7nwv	de1dc022-ea84-4098-9ac7-5952270495cb	f	2026-03-13 09:53:18.973026+00	2026-03-13 09:53:18.973026+00	\N	0c2a79fb-dd85-4361-be70-e2edd6677932
00000000-0000-0000-0000-000000000000	1179	pvm6ohozf3b5	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 09:39:07.754567+00	2026-03-06 10:38:57.879678+00	4ml4elymchd7	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1182	3bw5koevzc7u	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 10:38:57.897522+00	2026-03-06 10:38:58.117887+00	pvm6ohozf3b5	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	2004	gdjtmr7fytft	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-13 14:27:07.836889+00	2026-03-13 14:27:08.110105+00	f64v3lqo55ei	ec552c3f-10bd-42f6-9b4f-0e6c03e9a1c8
00000000-0000-0000-0000-000000000000	1181	vxu6bscco65d	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 10:08:43.167098+00	2026-03-06 11:08:34.168459+00	pm425gnju74l	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1184	2fdwnurzrinj	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 11:08:34.199554+00	2026-03-06 11:08:34.40232+00	vxu6bscco65d	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	2005	wtzmxw7khv62	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-13 14:27:08.111205+00	2026-03-13 15:26:58.587684+00	gdjtmr7fytft	ec552c3f-10bd-42f6-9b4f-0e6c03e9a1c8
00000000-0000-0000-0000-000000000000	1183	436ngmqqku55	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 10:38:58.118366+00	2026-03-06 11:38:49.282446+00	3bw5koevzc7u	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1186	e6ghfechbu3g	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 11:38:49.297823+00	2026-03-06 11:38:49.524241+00	436ngmqqku55	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	2044	qhbf2t2gotx4	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-14 16:30:42.54414+00	2026-03-14 16:30:42.819554+00	oj3r5nk3wqqm	a8d24ea5-ad85-48ee-889a-a0e3ba2e1ed5
00000000-0000-0000-0000-000000000000	1185	7fcu4yytxkrk	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 11:08:34.402689+00	2026-03-06 12:08:25.523772+00	2fdwnurzrinj	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	2045	vxxk67yiqt7j	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-14 16:30:42.820457+00	2026-03-15 16:30:32.180311+00	qhbf2t2gotx4	a8d24ea5-ad85-48ee-889a-a0e3ba2e1ed5
00000000-0000-0000-0000-000000000000	1189	6fgiux4trq3j	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 12:08:25.54642+00	2026-03-06 12:08:25.751251+00	7fcu4yytxkrk	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1187	exqoke5paeb7	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 11:38:49.524592+00	2026-03-06 12:38:39.733917+00	e6ghfechbu3g	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1191	2evkkz7d3pwb	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 12:38:39.750785+00	2026-03-06 12:38:40.025115+00	exqoke5paeb7	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1190	dhtpkrecy2v5	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 12:08:25.751607+00	2026-03-06 13:08:15.724971+00	6fgiux4trq3j	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1195	asfw3pupxlon	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 13:08:15.740755+00	2026-03-06 13:08:15.981745+00	dhtpkrecy2v5	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1192	h3c6mupywhsz	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 12:38:40.025498+00	2026-03-06 13:38:31.255039+00	2evkkz7d3pwb	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1197	p25g5k2odfho	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 13:38:31.281571+00	2026-03-06 13:38:31.557884+00	h3c6mupywhsz	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1196	a7mhjtm5muvc	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 13:08:15.982195+00	2026-03-06 14:08:06.023132+00	asfw3pupxlon	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1201	ewhlzh6a2iyb	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 14:08:06.033005+00	2026-03-06 14:08:06.246428+00	a7mhjtm5muvc	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1198	ilgnbmdtityf	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 13:38:31.558288+00	2026-03-06 14:38:21.673271+00	p25g5k2odfho	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1203	srt7nw5rgwuk	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 14:38:21.685394+00	2026-03-06 14:38:21.975728+00	ilgnbmdtityf	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1202	qxysvt7u7voo	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 14:08:06.246797+00	2026-03-06 15:07:57.681986+00	ewhlzh6a2iyb	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1207	jg72sagi4un3	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 15:07:57.689902+00	2026-03-06 15:07:58.058141+00	qxysvt7u7voo	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1204	bullw5pia32c	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 14:38:21.978027+00	2026-03-06 15:38:12.22745+00	srt7nw5rgwuk	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1209	szlq5qhntniy	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 15:38:12.242783+00	2026-03-06 15:38:12.474674+00	bullw5pia32c	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1208	azst475zfp7u	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 15:07:58.058487+00	2026-03-06 16:07:49.480907+00	jg72sagi4un3	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1213	ksfk74t7s2gh	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 16:07:49.497784+00	2026-03-06 16:07:49.76484+00	azst475zfp7u	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1210	bvvel7pqltiy	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 15:38:12.475851+00	2026-03-06 16:38:02.794152+00	szlq5qhntniy	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1215	eikijhlg6gi6	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 16:38:02.816223+00	2026-03-06 16:38:03.062817+00	bvvel7pqltiy	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1214	2qa6pcx452om	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 16:07:49.767229+00	2026-03-06 17:07:40.289572+00	ksfk74t7s2gh	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1219	gbhb53qfe5dw	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 17:07:40.301804+00	2026-03-06 17:07:40.626322+00	2qa6pcx452om	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1216	ecoa2cgidwec	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 16:38:03.063837+00	2026-03-06 17:37:54.369743+00	eikijhlg6gi6	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1221	2vn3x7lzz3fx	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 17:37:54.38338+00	2026-03-06 17:37:54.614138+00	ecoa2cgidwec	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1220	pnwkpdduysel	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 17:07:40.627306+00	2026-03-06 18:07:30.85022+00	gbhb53qfe5dw	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	2086	zltbaan56f6b	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-16 14:18:35.618349+00	2026-03-16 14:18:35.618349+00	\N	ad1d521a-b557-4097-84ec-e003ca0bf04f
00000000-0000-0000-0000-000000000000	1803	hq62eduvcn5m	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-11 20:15:05.172778+00	2026-03-11 20:15:05.455529+00	prnld2cdu2oi	d6b1b72a-ded3-41b4-a0da-82ffbdabce7b
00000000-0000-0000-0000-000000000000	2087	b6sirrhv5o2o	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-16 14:18:44.801147+00	2026-03-16 14:18:44.801147+00	\N	cbc2276d-2d2a-4d91-9240-1aa118db0e7a
00000000-0000-0000-0000-000000000000	1804	pnnndjl7j2zr	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-11 20:15:05.455884+00	2026-03-11 21:14:55.721329+00	hq62eduvcn5m	d6b1b72a-ded3-41b4-a0da-82ffbdabce7b
00000000-0000-0000-0000-000000000000	1885	mf5t7rmfhbq4	de1dc022-ea84-4098-9ac7-5952270495cb	f	2026-03-12 12:48:18.22669+00	2026-03-12 12:48:18.22669+00	\N	6d59bfe4-37df-4293-a541-2b00817e51a3
00000000-0000-0000-0000-000000000000	1225	doqwza44wxbw	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 18:07:30.858236+00	2026-03-06 18:07:31.080259+00	pnwkpdduysel	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1975	binoahqechac	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-13 10:15:03.538687+00	2026-03-13 10:15:03.538687+00	\N	b7843ba2-e005-42ec-9369-8e478b7c2993
00000000-0000-0000-0000-000000000000	1222	2lrxiktt274y	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 17:37:54.61449+00	2026-03-06 18:37:45.188268+00	2vn3x7lzz3fx	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	2088	zzunkiamxr22	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-16 14:19:04.877805+00	2026-03-16 14:19:04.877805+00	\N	286dffae-e9c1-4aee-b383-19f79f0b1862
00000000-0000-0000-0000-000000000000	1227	cfb4wgukdc2a	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 18:37:45.206198+00	2026-03-06 18:37:45.459023+00	2lrxiktt274y	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	2006	zrehvd5f5wo3	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-13 14:31:12.203392+00	2026-03-13 14:31:12.473321+00	mfla3smevtz2	a8d24ea5-ad85-48ee-889a-a0e3ba2e1ed5
00000000-0000-0000-0000-000000000000	2089	oizvtqvx2n76	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-16 14:19:32.334887+00	2026-03-16 14:19:32.334887+00	\N	3737d488-4e06-43c4-942a-f8d4cadeb0ec
00000000-0000-0000-0000-000000000000	2007	gjehmldv4cvt	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-13 14:31:12.47404+00	2026-03-13 15:31:02.543901+00	zrehvd5f5wo3	a8d24ea5-ad85-48ee-889a-a0e3ba2e1ed5
00000000-0000-0000-0000-000000000000	2090	wirqv4ign2vy	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-16 14:19:42.003886+00	2026-03-16 14:19:42.003886+00	\N	edf3d02f-6b80-4951-8b25-4d0ca99ac201
00000000-0000-0000-0000-000000000000	2046	cabxogtguejh	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-15 05:51:59.53383+00	2026-03-15 05:52:21.763596+00	crpgnd5mvvgn	f1a85528-b800-4fb2-8252-3ff4fbf3d7d6
00000000-0000-0000-0000-000000000000	1226	ciwipzfqnjug	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 18:07:31.081321+00	2026-03-06 19:07:22.073062+00	doqwza44wxbw	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	2118	zcllc56djyfj	31cc7cef-c734-4a0d-8368-10440ee52424	f	2026-03-17 01:09:25.539476+00	2026-03-17 01:09:25.539476+00	\N	8266ae1e-87fc-4bb5-b42e-129a54840f1e
00000000-0000-0000-0000-000000000000	1231	kbdfdi5gjpzi	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 19:07:22.086986+00	2026-03-06 19:07:22.269421+00	ciwipzfqnjug	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	2047	orb3cvwhgetx	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-15 05:52:21.764114+00	2026-03-16 05:51:50.199875+00	cabxogtguejh	f1a85528-b800-4fb2-8252-3ff4fbf3d7d6
00000000-0000-0000-0000-000000000000	1228	htzbmoqdf6mh	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 18:37:45.460356+00	2026-03-06 19:37:35.615196+00	cfb4wgukdc2a	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	2067	h3ojv75rdinz	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	t	2026-03-16 12:52:02.704933+00	2026-03-17 12:51:52.209063+00	\N	f3d3f100-c557-4c47-a999-eac60c0b0fef
00000000-0000-0000-0000-000000000000	1233	gb4vazmhs6sc	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 19:37:35.634112+00	2026-03-06 19:37:35.86838+00	htzbmoqdf6mh	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	2131	dh3zzu2dn3j6	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	t	2026-03-17 12:51:52.227217+00	2026-03-17 12:51:52.511187+00	h3ojv75rdinz	f3d3f100-c557-4c47-a999-eac60c0b0fef
00000000-0000-0000-0000-000000000000	2132	iglnjc5rgo6b	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	f	2026-03-17 12:51:52.512765+00	2026-03-17 12:51:52.512765+00	dh3zzu2dn3j6	f3d3f100-c557-4c47-a999-eac60c0b0fef
00000000-0000-0000-0000-000000000000	1232	x7ikme5dls25	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 19:07:22.269798+00	2026-03-06 20:07:13.277335+00	kbdfdi5gjpzi	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1237	ranuc6zk2kef	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 20:07:13.29104+00	2026-03-06 20:07:13.491589+00	x7ikme5dls25	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1234	o3n2tsj6o4ju	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 19:37:35.868745+00	2026-03-06 20:37:26.164605+00	gb4vazmhs6sc	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1239	kj5aydfskrsq	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 20:37:26.183796+00	2026-03-06 20:37:26.416271+00	o3n2tsj6o4ju	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1238	yamdna2c5ywc	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 20:07:13.492052+00	2026-03-06 21:07:03.949882+00	ranuc6zk2kef	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1243	km4dhlajqmpw	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 21:07:03.966881+00	2026-03-06 21:07:04.224609+00	yamdna2c5ywc	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1240	vbsww3om4rpl	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 20:37:26.418237+00	2026-03-06 21:37:16.539712+00	kj5aydfskrsq	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1245	mfbdjo4zykvf	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 21:37:16.574193+00	2026-03-06 21:37:16.78143+00	vbsww3om4rpl	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1244	67xje3x6dp6n	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 21:07:04.225001+00	2026-03-06 22:06:55.26006+00	km4dhlajqmpw	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1249	yqdwkqt2xecd	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 22:06:55.277424+00	2026-03-06 22:06:55.476074+00	67xje3x6dp6n	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1246	q2ekebmqjxye	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 21:37:16.781851+00	2026-03-06 22:37:06.905538+00	mfbdjo4zykvf	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1251	5wbwfzwh2fnq	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 22:37:06.927996+00	2026-03-06 22:37:07.162624+00	q2ekebmqjxye	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1250	u6qb7crx3pcj	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 22:06:55.476502+00	2026-03-06 23:06:45.568339+00	yqdwkqt2xecd	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1255	n4w5k476tad3	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 23:06:45.586353+00	2026-03-06 23:06:45.815892+00	u6qb7crx3pcj	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1252	vvidoi3ts3ts	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 22:37:07.163793+00	2026-03-06 23:36:58.296018+00	5wbwfzwh2fnq	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1257	dznmisvyzqmb	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 23:36:58.311943+00	2026-03-06 23:36:58.49657+00	vvidoi3ts3ts	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1256	4qknpvkmzhvb	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 23:06:45.816305+00	2026-03-07 00:06:35.829373+00	n4w5k476tad3	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1261	eizqwl2tok3b	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 00:06:35.843253+00	2026-03-07 00:06:36.048346+00	4qknpvkmzhvb	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1258	ozfijzlt3pgu	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-06 23:36:58.496965+00	2026-03-07 00:36:48.704641+00	dznmisvyzqmb	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1263	g2ax4e5ra5b6	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 00:36:48.720845+00	2026-03-07 00:36:48.94523+00	ozfijzlt3pgu	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1262	ok2jfyu7s5wj	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 00:06:36.048775+00	2026-03-07 01:06:27.22203+00	eizqwl2tok3b	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1267	uecgzao7l3tq	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 01:06:27.242093+00	2026-03-07 01:06:27.455102+00	ok2jfyu7s5wj	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1264	r6ugksrxr2hm	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 00:36:48.945629+00	2026-03-07 01:36:38.980798+00	g2ax4e5ra5b6	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1269	iyisych4kpty	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 01:36:38.991219+00	2026-03-07 01:36:39.226431+00	r6ugksrxr2hm	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1268	bpjy22lgprnw	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 01:06:27.456483+00	2026-03-07 02:06:18.532395+00	uecgzao7l3tq	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1270	3gohue5pqcvb	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 01:36:39.226773+00	2026-03-07 02:36:30.653547+00	iyisych4kpty	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1304	7dtts33yxl5q	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 07:05:32.911938+00	2026-03-07 08:05:22.556594+00	4je4d5hu5lhg	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1306	x6j5t3fvpfsr	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 07:35:45.339686+00	2026-03-07 08:35:36.142512+00	savsr4gfzgzf	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1273	lokllkqbomuf	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 02:06:18.553691+00	2026-03-07 02:06:19.246766+00	bpjy22lgprnw	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	2091	7q3vsq73sd64	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-16 14:21:15.600139+00	2026-03-16 14:21:15.600139+00	\N	be807c25-4770-4b8e-96e6-f9ece08ee981
00000000-0000-0000-0000-000000000000	1805	7xkznngzfwmd	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-11 21:14:55.738809+00	2026-03-11 21:14:56.038392+00	pnnndjl7j2zr	d6b1b72a-ded3-41b4-a0da-82ffbdabce7b
00000000-0000-0000-0000-000000000000	1275	hzugsxj2ckf4	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 02:36:30.664296+00	2026-03-07 02:36:30.975237+00	3gohue5pqcvb	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1310	4x2hnoigddxy	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 08:05:22.697586+00	2026-03-07 09:05:12.482912+00	mmxtxzy2i342	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	2092	gfyrivcao2ka	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-16 14:21:25.21883+00	2026-03-16 14:21:25.21883+00	\N	e44dbf56-e23c-4fe5-b07a-3c9eb3239a55
00000000-0000-0000-0000-000000000000	1806	igyl7a3wns65	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-11 21:14:56.03882+00	2026-03-11 22:14:47.276389+00	7xkznngzfwmd	d6b1b72a-ded3-41b4-a0da-82ffbdabce7b
00000000-0000-0000-0000-000000000000	2093	vmvhw4bljxep	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-16 14:21:37.572791+00	2026-03-16 14:21:37.572791+00	\N	c71fe324-eaa0-4ef5-81c3-928d90846dab
00000000-0000-0000-0000-000000000000	1315	eaaewc235uhb	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 09:05:12.499497+00	2026-03-07 09:05:12.634905+00	4x2hnoigddxy	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1274	g3xx45odicbf	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 02:06:19.247182+00	2026-03-07 03:06:10.358926+00	lokllkqbomuf	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1886	4dtmsv4o2gc6	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 12:53:43.909654+00	2026-03-12 12:54:33.741679+00	\N	e2b8cea9-e8ca-40a3-abf3-737adf3cc15e
00000000-0000-0000-0000-000000000000	1279	hsg7bnpdy4oe	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 03:06:10.369246+00	2026-03-07 03:06:10.557331+00	g3xx45odicbf	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1312	rehqco763q2v	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 08:35:36.282727+00	2026-03-07 09:35:27.071096+00	s4e5kfaeoxbo	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1276	kdwb4oj4aioj	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 02:36:30.979042+00	2026-03-07 03:36:21.222362+00	hzugsxj2ckf4	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1281	ykpmhvrwhfpz	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 03:36:21.238215+00	2026-03-07 03:36:21.525334+00	kdwb4oj4aioj	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1317	mboyldj7nzlw	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 09:35:27.084621+00	2026-03-07 09:35:27.190663+00	rehqco763q2v	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1887	giqbhhvgzrze	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 12:54:33.743166+00	2026-03-12 12:54:34.07732+00	4dtmsv4o2gc6	e2b8cea9-e8ca-40a3-abf3-737adf3cc15e
00000000-0000-0000-0000-000000000000	1888	bqt6l4fnihhj	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 12:54:34.077736+00	2026-03-12 12:55:24.733478+00	giqbhhvgzrze	e2b8cea9-e8ca-40a3-abf3-737adf3cc15e
00000000-0000-0000-0000-000000000000	1280	iq7zugru5sgk	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 03:06:10.557669+00	2026-03-07 04:06:00.681291+00	hsg7bnpdy4oe	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1889	7adm54ltzq7o	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 12:55:24.734184+00	2026-03-12 12:55:25.066817+00	bqt6l4fnihhj	e2b8cea9-e8ca-40a3-abf3-737adf3cc15e
00000000-0000-0000-0000-000000000000	1285	eevbmmxf572u	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 04:06:00.691526+00	2026-03-07 04:06:00.925548+00	iq7zugru5sgk	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1282	7rlw2gslswkj	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 03:36:21.525721+00	2026-03-07 04:36:11.860471+00	ykpmhvrwhfpz	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1890	65cvuzdvhdv6	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 12:55:25.069454+00	2026-03-12 12:56:15.908629+00	7adm54ltzq7o	e2b8cea9-e8ca-40a3-abf3-737adf3cc15e
00000000-0000-0000-0000-000000000000	1287	ccpw7lflzgzk	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 04:36:11.876237+00	2026-03-07 04:36:12.157114+00	7rlw2gslswkj	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1316	qan4ktidegxb	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 09:05:12.635305+00	2026-03-07 10:05:02.29201+00	eaaewc235uhb	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1891	zfbjjduxm4o4	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 12:56:15.909364+00	2026-03-12 12:56:16.232573+00	65cvuzdvhdv6	e2b8cea9-e8ca-40a3-abf3-737adf3cc15e
00000000-0000-0000-0000-000000000000	1321	xiviicohc5np	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 10:05:02.30699+00	2026-03-07 10:05:02.402974+00	qan4ktidegxb	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1286	n254agpdgj3s	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 04:06:00.92594+00	2026-03-07 05:05:50.91606+00	eevbmmxf572u	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1892	h5bboyia24dv	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 12:56:16.233513+00	2026-03-12 12:56:19.219186+00	zfbjjduxm4o4	e2b8cea9-e8ca-40a3-abf3-737adf3cc15e
00000000-0000-0000-0000-000000000000	1291	7wtu5gz6shmb	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 05:05:50.925532+00	2026-03-07 05:05:51.229184+00	n254agpdgj3s	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1318	dn4mjja3m44g	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 09:35:27.191672+00	2026-03-07 10:35:17.957783+00	mboyldj7nzlw	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1288	c5fjbgm66zbf	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 04:36:12.161887+00	2026-03-07 05:36:03.216199+00	ccpw7lflzgzk	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1293	hvvlslv7pg5g	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 05:36:03.232166+00	2026-03-07 05:36:03.426357+00	c5fjbgm66zbf	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1323	ovwzi34sselp	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 10:35:17.965494+00	2026-03-07 10:35:18.128455+00	dn4mjja3m44g	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1976	o6kp6xfdwehb	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-13 10:27:48.678604+00	2026-03-13 11:27:38.217117+00	\N	ec552c3f-10bd-42f6-9b4f-0e6c03e9a1c8
00000000-0000-0000-0000-000000000000	2008	3uv56ua45lo7	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	t	2026-03-13 15:16:18.083941+00	2026-03-13 15:16:18.397071+00	k7tpz5vqbtlb	6645979d-a485-44c9-94c8-2b87e081c735
00000000-0000-0000-0000-000000000000	1292	r43uhpumz4rm	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 05:05:51.230123+00	2026-03-07 06:05:42.008627+00	7wtu5gz6shmb	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1322	x4fockomo77p	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 10:05:02.403433+00	2026-03-07 11:04:53.112782+00	xiviicohc5np	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1297	xstj44fcxrbf	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 06:05:42.016528+00	2026-03-07 06:05:42.215264+00	r43uhpumz4rm	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1324	qdzrgtucisd3	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 10:35:18.128817+00	2026-03-07 11:35:08.848689+00	ovwzi34sselp	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1294	wdwid4uuqium	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 05:36:03.427652+00	2026-03-07 06:35:54.220569+00	hvvlslv7pg5g	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1299	cpracyptf6kl	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 06:35:54.235902+00	2026-03-07 06:35:54.362436+00	wdwid4uuqium	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	2010	eijm7jrudnly	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-13 15:16:58.74022+00	2026-03-13 15:16:59.016828+00	m2kwgjcbulyk	58c090c6-d4ea-4c6c-9f88-1e2cd9879ed8
00000000-0000-0000-0000-000000000000	2009	ies7rrynrpuy	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	t	2026-03-13 15:16:18.398018+00	2026-03-13 16:16:08.523122+00	3uv56ua45lo7	6645979d-a485-44c9-94c8-2b87e081c735
00000000-0000-0000-0000-000000000000	2011	pborjllippao	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-13 15:16:59.017314+00	2026-03-13 16:16:49.685294+00	eijm7jrudnly	58c090c6-d4ea-4c6c-9f88-1e2cd9879ed8
00000000-0000-0000-0000-000000000000	1298	svyt5jsem3wr	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 06:05:42.215677+00	2026-03-07 07:05:32.792626+00	xstj44fcxrbf	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	2048	luy734jeqhvb	31cc7cef-c734-4a0d-8368-10440ee52424	t	2026-03-15 10:33:50.069157+00	2026-03-16 10:33:41.465869+00	inu6ip5k7x6y	143ea540-aa08-455e-90b9-303f7303a177
00000000-0000-0000-0000-000000000000	1303	4je4d5hu5lhg	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 07:05:32.806234+00	2026-03-07 07:05:32.911549+00	svyt5jsem3wr	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1300	xxa4nc444ck6	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 06:35:54.362791+00	2026-03-07 07:35:45.113619+00	cpracyptf6kl	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1305	savsr4gfzgzf	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 07:35:45.133232+00	2026-03-07 07:35:45.339279+00	xxa4nc444ck6	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	2094	qxcfgksoctee	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	f	2026-03-16 14:22:29.612001+00	2026-03-16 14:22:29.612001+00	\N	a95968aa-11db-4854-b7f6-dea052199221
00000000-0000-0000-0000-000000000000	1807	3bomgtvt2p2q	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-11 22:14:47.305372+00	2026-03-11 22:14:47.642713+00	igyl7a3wns65	d6b1b72a-ded3-41b4-a0da-82ffbdabce7b
00000000-0000-0000-0000-000000000000	1808	vc6ckj6x5doe	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-11 22:14:47.643103+00	2026-03-11 23:14:37.952432+00	3bomgtvt2p2q	d6b1b72a-ded3-41b4-a0da-82ffbdabce7b
00000000-0000-0000-0000-000000000000	1327	zu2lpsnhok73	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 11:04:53.130926+00	2026-03-07 11:04:53.307171+00	x4fockomo77p	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1329	gf3luq62c4lo	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 11:35:08.868782+00	2026-03-07 11:35:09.010208+00	qdzrgtucisd3	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1893	wgzxcih5kz7n	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:08:15.594035+00	2026-03-12 13:09:04.912058+00	\N	427878d3-9ec9-4a92-b522-26ed6216f653
00000000-0000-0000-0000-000000000000	1895	lfmd5wlzggts	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:09:04.914559+00	2026-03-12 13:09:05.13031+00	wgzxcih5kz7n	427878d3-9ec9-4a92-b522-26ed6216f653
00000000-0000-0000-0000-000000000000	1894	ijqmzrvxt75h	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:08:30.55016+00	2026-03-12 13:09:19.976951+00	\N	6979dd2c-d884-47f5-a5e2-2cbc1c43db92
00000000-0000-0000-0000-000000000000	1328	fsoqn5rsq6qs	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 11:04:53.307618+00	2026-03-07 12:04:44.043987+00	zu2lpsnhok73	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1333	zt6qerzyg73c	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 12:04:44.065867+00	2026-03-07 12:04:44.175762+00	fsoqn5rsq6qs	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1897	sq5kbiijdvzk	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:09:19.977338+00	2026-03-12 13:09:20.302186+00	ijqmzrvxt75h	6979dd2c-d884-47f5-a5e2-2cbc1c43db92
00000000-0000-0000-0000-000000000000	1330	tg2lvle7nhfd	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 11:35:09.011093+00	2026-03-07 12:34:59.862183+00	gf3luq62c4lo	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1335	fm5evaiovjlf	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 12:34:59.885651+00	2026-03-07 12:35:00.03307+00	tg2lvle7nhfd	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1896	dw347475h2bz	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:09:05.130691+00	2026-03-12 13:09:55.373203+00	lfmd5wlzggts	427878d3-9ec9-4a92-b522-26ed6216f653
00000000-0000-0000-0000-000000000000	1899	jsei2ffcud6p	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:09:55.374026+00	2026-03-12 13:09:55.588817+00	dw347475h2bz	427878d3-9ec9-4a92-b522-26ed6216f653
00000000-0000-0000-0000-000000000000	1898	k4nzorzjorf2	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:09:20.302574+00	2026-03-12 13:10:10.690896+00	sq5kbiijdvzk	6979dd2c-d884-47f5-a5e2-2cbc1c43db92
00000000-0000-0000-0000-000000000000	1334	t5divogtovcu	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 12:04:44.176159+00	2026-03-07 13:04:34.900259+00	zt6qerzyg73c	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1339	yaj5imps5dqp	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 13:04:34.911456+00	2026-03-07 13:04:35.081562+00	t5divogtovcu	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1901	hvb2jwdouywa	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:10:10.69128+00	2026-03-12 13:10:11.02996+00	k4nzorzjorf2	6979dd2c-d884-47f5-a5e2-2cbc1c43db92
00000000-0000-0000-0000-000000000000	1336	j5ikaro4lc7u	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 12:35:00.033487+00	2026-03-07 13:34:50.585641+00	fm5evaiovjlf	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1341	ud2rg5espg5r	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 13:34:50.60544+00	2026-03-07 13:34:50.704033+00	j5ikaro4lc7u	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1900	jzediw2f6za2	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:09:55.589201+00	2026-03-12 13:10:44.851104+00	jsei2ffcud6p	427878d3-9ec9-4a92-b522-26ed6216f653
00000000-0000-0000-0000-000000000000	1903	lozihnvnpqbv	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:10:44.851889+00	2026-03-12 13:10:45.070453+00	jzediw2f6za2	427878d3-9ec9-4a92-b522-26ed6216f653
00000000-0000-0000-0000-000000000000	1902	n62asgiftxfj	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:10:11.031247+00	2026-03-12 13:11:02.408142+00	hvb2jwdouywa	6979dd2c-d884-47f5-a5e2-2cbc1c43db92
00000000-0000-0000-0000-000000000000	1340	kebcy5zgu6bd	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 13:04:35.081939+00	2026-03-07 14:04:25.996886+00	yaj5imps5dqp	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1345	bgrbalh55xri	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 14:04:26.008751+00	2026-03-07 14:04:26.207098+00	kebcy5zgu6bd	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1905	qgnqzhvvtxaa	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:11:02.408465+00	2026-03-12 13:11:02.721883+00	n62asgiftxfj	6979dd2c-d884-47f5-a5e2-2cbc1c43db92
00000000-0000-0000-0000-000000000000	1342	obfkai5todzt	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 13:34:50.704447+00	2026-03-07 14:34:40.309293+00	ud2rg5espg5r	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1347	u6das2sndvkx	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 14:34:40.330344+00	2026-03-07 14:34:40.4305+00	obfkai5todzt	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1904	qjgwmd746hs6	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:10:45.070862+00	2026-03-12 13:11:35.319786+00	lozihnvnpqbv	427878d3-9ec9-4a92-b522-26ed6216f653
00000000-0000-0000-0000-000000000000	1907	6dduzhei356p	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:11:35.320289+00	2026-03-12 13:11:35.536687+00	qjgwmd746hs6	427878d3-9ec9-4a92-b522-26ed6216f653
00000000-0000-0000-0000-000000000000	1906	i6br5d3xvm7i	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:11:02.723041+00	2026-03-12 13:11:52.596288+00	qgnqzhvvtxaa	6979dd2c-d884-47f5-a5e2-2cbc1c43db92
00000000-0000-0000-0000-000000000000	1346	ypvwrr2shkzu	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 14:04:26.209174+00	2026-03-07 15:04:16.874169+00	bgrbalh55xri	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1908	d2ylcv4qvnpm	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:11:35.536993+00	2026-03-12 13:12:24.817243+00	6dduzhei356p	427878d3-9ec9-4a92-b522-26ed6216f653
00000000-0000-0000-0000-000000000000	1351	bs7iclpt22jp	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 15:04:16.88044+00	2026-03-07 15:04:16.970332+00	ypvwrr2shkzu	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1348	b34xftitdxx4	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 14:34:40.430902+00	2026-03-07 15:34:31.346317+00	u6das2sndvkx	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1353	sjndt6ysc2up	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 15:34:31.361575+00	2026-03-07 15:34:31.493584+00	b34xftitdxx4	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1352	4fqeg3kwoyvs	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 15:04:16.97137+00	2026-03-07 16:04:06.510164+00	bs7iclpt22jp	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1357	7hwyhigupkbr	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 16:04:06.52637+00	2026-03-07 16:04:06.613504+00	4fqeg3kwoyvs	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1354	l5y2vjtaqr5m	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 15:34:31.493961+00	2026-03-07 16:34:21.275129+00	sjndt6ysc2up	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1359	2scdykzchnbm	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 16:34:21.295405+00	2026-03-07 16:34:21.420834+00	l5y2vjtaqr5m	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1358	llv2rcuvtzs4	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 16:04:06.613918+00	2026-03-07 17:03:56.34982+00	7hwyhigupkbr	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1363	5gsahok3vw2c	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 17:03:56.364612+00	2026-03-07 17:03:56.523345+00	llv2rcuvtzs4	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1360	l64st655treo	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 16:34:21.423138+00	2026-03-07 17:34:12.119137+00	2scdykzchnbm	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1365	psbiclf3qm5e	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 17:34:12.133729+00	2026-03-07 17:34:12.30284+00	l64st655treo	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1364	cikvhddjt2rn	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 17:03:56.523831+00	2026-03-07 18:03:46.050877+00	5gsahok3vw2c	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1369	xepg4znua3so	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 18:03:46.06212+00	2026-03-07 18:03:46.149152+00	cikvhddjt2rn	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1366	pc36reemb4qd	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 17:34:12.303232+00	2026-03-07 18:34:03.121233+00	psbiclf3qm5e	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1371	6zi2i4zu3f22	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 18:34:03.134954+00	2026-03-07 18:34:03.257971+00	pc36reemb4qd	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1370	dxnmdnrzr5fy	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 18:03:46.149543+00	2026-03-07 19:03:36.745451+00	xepg4znua3so	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1372	tunv4kfrqkrv	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 18:34:03.25839+00	2026-03-07 19:33:54.062863+00	6zi2i4zu3f22	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	2095	o3b2wixadv3r	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	f	2026-03-16 14:23:28.913674+00	2026-03-16 14:23:28.913674+00	\N	e7f4d24a-b4d9-4274-a2b7-dbc6c7ce4544
00000000-0000-0000-0000-000000000000	1375	po4jytpedm2w	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 19:03:36.755884+00	2026-03-07 19:03:36.847858+00	dxnmdnrzr5fy	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1809	76gllzwpzycz	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-11 23:14:37.973147+00	2026-03-11 23:14:38.279315+00	vc6ckj6x5doe	d6b1b72a-ded3-41b4-a0da-82ffbdabce7b
00000000-0000-0000-0000-000000000000	1377	zy2kcctwt7eo	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 19:33:54.080796+00	2026-03-07 19:33:54.254922+00	tunv4kfrqkrv	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1810	yh3ng6nvfuqf	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-11 23:14:38.279865+00	2026-03-12 00:14:28.573671+00	76gllzwpzycz	d6b1b72a-ded3-41b4-a0da-82ffbdabce7b
00000000-0000-0000-0000-000000000000	1909	6odkqpzaboul	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:11:52.596621+00	2026-03-12 13:11:52.920867+00	i6br5d3xvm7i	6979dd2c-d884-47f5-a5e2-2cbc1c43db92
00000000-0000-0000-0000-000000000000	1376	eyetcjmrw5cr	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 19:03:36.849293+00	2026-03-07 20:03:26.490703+00	po4jytpedm2w	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1381	7wdh5iojtemz	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 20:03:26.509529+00	2026-03-07 20:03:26.661353+00	eyetcjmrw5cr	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1911	o3pazpdakcdn	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:12:24.818278+00	2026-03-12 13:12:25.033021+00	d2ylcv4qvnpm	427878d3-9ec9-4a92-b522-26ed6216f653
00000000-0000-0000-0000-000000000000	1378	lfupj7rw7bsa	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 19:33:54.25537+00	2026-03-07 20:33:44.920298+00	zy2kcctwt7eo	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1383	j6puwfloqbir	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 20:33:44.928357+00	2026-03-07 20:33:45.036991+00	lfupj7rw7bsa	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1910	ek4djqeztmzf	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:11:52.924968+00	2026-03-12 13:12:42.500964+00	6odkqpzaboul	6979dd2c-d884-47f5-a5e2-2cbc1c43db92
00000000-0000-0000-0000-000000000000	1914	7w4x2tewntuo	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:12:42.501647+00	2026-03-12 13:12:42.810196+00	ek4djqeztmzf	6979dd2c-d884-47f5-a5e2-2cbc1c43db92
00000000-0000-0000-0000-000000000000	1382	v4vjyrmi7guz	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 20:03:26.665438+00	2026-03-07 21:03:16.405732+00	7wdh5iojtemz	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1912	xkurpyytrvr7	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:12:25.03354+00	2026-03-12 13:13:15.300471+00	o3pazpdakcdn	427878d3-9ec9-4a92-b522-26ed6216f653
00000000-0000-0000-0000-000000000000	1387	ab6pyenlc2zw	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 21:03:16.420407+00	2026-03-07 21:03:16.528824+00	v4vjyrmi7guz	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1384	prhtrrrb55uq	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 20:33:45.037421+00	2026-03-07 21:33:35.810732+00	j6puwfloqbir	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1916	jpvvsp75zegv	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:13:15.300924+00	2026-03-12 13:13:15.507862+00	xkurpyytrvr7	427878d3-9ec9-4a92-b522-26ed6216f653
00000000-0000-0000-0000-000000000000	1389	mvbanlugllfl	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 21:33:35.82018+00	2026-03-07 21:33:35.936467+00	prhtrrrb55uq	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1913	gmapherhnx4c	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-12 13:12:38.203248+00	2026-03-12 13:13:29.022462+00	\N	64a936b5-a4e9-4a98-888e-8c51e00ad2d9
00000000-0000-0000-0000-000000000000	1918	wuu6rhjqsia4	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-12 13:13:29.023099+00	2026-03-12 13:13:29.358124+00	gmapherhnx4c	64a936b5-a4e9-4a98-888e-8c51e00ad2d9
00000000-0000-0000-0000-000000000000	1388	fnrlpkybpmkv	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 21:03:16.52928+00	2026-03-07 22:03:06.167888+00	ab6pyenlc2zw	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1915	g7wwilwn26k2	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:12:42.810527+00	2026-03-12 13:13:32.680601+00	7w4x2tewntuo	6979dd2c-d884-47f5-a5e2-2cbc1c43db92
00000000-0000-0000-0000-000000000000	1393	hqti3hc2o2gp	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 22:03:06.184734+00	2026-03-07 22:03:06.279813+00	fnrlpkybpmkv	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1390	jtn4l3zqix23	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 21:33:35.93693+00	2026-03-07 22:33:25.502064+00	mvbanlugllfl	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1920	zzlutstxsb2q	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:13:32.680953+00	2026-03-12 13:13:32.996487+00	g7wwilwn26k2	6979dd2c-d884-47f5-a5e2-2cbc1c43db92
00000000-0000-0000-0000-000000000000	1395	c5dvhkx65xjn	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 22:33:25.516301+00	2026-03-07 22:33:25.683052+00	jtn4l3zqix23	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1917	fomfsd3af2st	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:13:15.508252+00	2026-03-12 13:14:05.094341+00	jpvvsp75zegv	427878d3-9ec9-4a92-b522-26ed6216f653
00000000-0000-0000-0000-000000000000	1922	2u6qgv5um5om	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:14:05.094701+00	2026-03-12 13:14:05.318527+00	fomfsd3af2st	427878d3-9ec9-4a92-b522-26ed6216f653
00000000-0000-0000-0000-000000000000	1394	stk2h42rdbci	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 22:03:06.280238+00	2026-03-07 23:02:56.969464+00	hqti3hc2o2gp	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1919	hcijrsalfr54	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-12 13:13:29.359347+00	2026-03-12 13:14:18.994589+00	wuu6rhjqsia4	64a936b5-a4e9-4a98-888e-8c51e00ad2d9
00000000-0000-0000-0000-000000000000	1399	4edn5bps7qn3	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 23:02:56.975611+00	2026-03-07 23:02:57.083435+00	stk2h42rdbci	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1921	n4axf5easzwa	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:13:32.997993+00	2026-03-12 13:14:23.39825+00	zzlutstxsb2q	6979dd2c-d884-47f5-a5e2-2cbc1c43db92
00000000-0000-0000-0000-000000000000	1396	syorqef5njlj	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 22:33:25.683502+00	2026-03-07 23:33:15.463388+00	c5dvhkx65xjn	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1401	fy4wjhanspjk	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 23:33:15.480444+00	2026-03-07 23:33:15.60337+00	syorqef5njlj	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1400	c7hyv3xec4jy	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 23:02:57.084622+00	2026-03-08 00:02:47.776136+00	4edn5bps7qn3	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1405	66p6ljo44656	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 00:02:47.802005+00	2026-03-08 00:02:47.96076+00	c7hyv3xec4jy	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1402	azu6l4w76phj	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-07 23:33:15.603777+00	2026-03-08 00:33:05.244824+00	fy4wjhanspjk	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1407	dirurn2q3lgw	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 00:33:05.260988+00	2026-03-08 00:33:05.36974+00	azu6l4w76phj	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1406	elh2ue5d7act	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 00:02:47.961736+00	2026-03-08 01:02:37.620115+00	66p6ljo44656	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1411	q7dgmfjdno2q	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 01:02:37.640008+00	2026-03-08 01:02:37.826857+00	elh2ue5d7act	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1408	ibf5ch2gjia6	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 00:33:05.370172+00	2026-03-08 01:32:55.982255+00	dirurn2q3lgw	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1413	zupbakyv3nq6	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 01:32:55.995957+00	2026-03-08 01:32:56.10073+00	ibf5ch2gjia6	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1412	cjtowvfz4gee	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 01:02:37.827286+00	2026-03-08 02:02:27.535257+00	q7dgmfjdno2q	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1417	nxq3emc5keze	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 02:02:27.545317+00	2026-03-08 02:02:27.660344+00	cjtowvfz4gee	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1414	dcz37svvre2w	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 01:32:56.102092+00	2026-03-08 02:32:46.792474+00	zupbakyv3nq6	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1419	w26vpapodrvi	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 02:32:46.80547+00	2026-03-08 02:32:46.918031+00	dcz37svvre2w	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1418	wdomeymnstme	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 02:02:27.660732+00	2026-03-08 03:02:17.247806+00	nxq3emc5keze	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1423	c6e3s3oknx5q	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 03:02:17.261818+00	2026-03-08 03:02:17.364486+00	wdomeymnstme	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1420	alhzini4hzbm	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 02:32:46.919179+00	2026-03-08 03:32:36.627411+00	w26vpapodrvi	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1424	nn3lek2phnge	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 03:02:17.364915+00	2026-03-08 04:02:07.944208+00	c6e3s3oknx5q	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	2096	5f2ksxjapedh	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	f	2026-03-16 14:26:55.875962+00	2026-03-16 14:26:55.875962+00	\N	fa75b30c-6baf-43ca-aa62-3c7a5f3319be
00000000-0000-0000-0000-000000000000	1425	6ssu32xt7ttm	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 03:32:36.653526+00	2026-03-08 03:32:36.780867+00	alhzini4hzbm	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1811	buj6fwb6znkg	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 00:14:28.580678+00	2026-03-12 00:14:28.835845+00	yh3ng6nvfuqf	d6b1b72a-ded3-41b4-a0da-82ffbdabce7b
00000000-0000-0000-0000-000000000000	1812	unbjeg2uxoht	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 00:14:28.836936+00	2026-03-12 01:14:18.206635+00	buj6fwb6znkg	d6b1b72a-ded3-41b4-a0da-82ffbdabce7b
00000000-0000-0000-0000-000000000000	2098	5d5clg6yycc2	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	f	2026-03-16 14:28:55.352591+00	2026-03-16 14:28:55.352591+00	\N	dd3232d0-d00a-49eb-bd28-3be2389c7da9
00000000-0000-0000-0000-000000000000	1923	455wj3pb26ln	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:14:05.31886+00	2026-03-12 13:14:55.585204+00	2u6qgv5um5om	427878d3-9ec9-4a92-b522-26ed6216f653
00000000-0000-0000-0000-000000000000	1429	3k7rfjh7yd6t	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 04:02:07.957673+00	2026-03-08 04:02:08.121993+00	nn3lek2phnge	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	2099	b73bynqwjlnk	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-16 14:29:25.898586+00	2026-03-16 14:29:25.898586+00	\N	eda374e2-2643-490e-86b6-04f5f84c0c7d
00000000-0000-0000-0000-000000000000	1426	nnu7r7aun6qg	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 03:32:36.781865+00	2026-03-08 04:32:26.45102+00	6ssu32xt7ttm	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1977	ipt3ohu2wp4z	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-13 10:31:52.820735+00	2026-03-13 11:31:42.247201+00	\N	a8d24ea5-ad85-48ee-889a-a0e3ba2e1ed5
00000000-0000-0000-0000-000000000000	1431	rgcn3iuytosk	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 04:32:26.46226+00	2026-03-08 04:32:26.560807+00	nnu7r7aun6qg	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	2119	yikkmo4aifxy	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-17 05:19:53.726633+00	2026-03-17 05:19:53.726633+00	\N	7bca6717-1ef5-49dc-80ca-5c9955ec0cad
00000000-0000-0000-0000-000000000000	2012	w5ghxnr2zwvx	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-13 15:23:43.466713+00	2026-03-13 15:23:43.71923+00	tckc4ighhsmb	a599f3b1-cd36-49b9-adb8-0ffdfcb34bc8
00000000-0000-0000-0000-000000000000	2068	afuo7lbtv6gk	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-16 13:06:47.321265+00	2026-03-17 13:06:37.913585+00	\N	6e3dc2c8-8904-4622-a1f5-b6d196da73e1
00000000-0000-0000-0000-000000000000	2014	7tsi4rc4srgz	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-13 15:24:01.866882+00	2026-03-13 15:24:02.115881+00	admhsndyyozf	f9095374-8d70-4e81-8acd-9c5577aefd94
00000000-0000-0000-0000-000000000000	1430	e4k2svqegw7j	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 04:02:08.122415+00	2026-03-08 05:01:58.768336+00	3k7rfjh7yd6t	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1435	7jesqt7c5nfe	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 05:01:58.779246+00	2026-03-08 05:01:58.878903+00	e4k2svqegw7j	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	2013	yxmxs7zhpfpj	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-13 15:23:43.720404+00	2026-03-13 16:23:33.071835+00	w5ghxnr2zwvx	a599f3b1-cd36-49b9-adb8-0ffdfcb34bc8
00000000-0000-0000-0000-000000000000	1432	4kk25l6e7hvw	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 04:32:26.561239+00	2026-03-08 05:32:16.24473+00	rgcn3iuytosk	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	2015	koiv6cb4p46z	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-13 15:24:02.117868+00	2026-03-13 16:23:52.758928+00	7tsi4rc4srgz	f9095374-8d70-4e81-8acd-9c5577aefd94
00000000-0000-0000-0000-000000000000	1437	iyypxmzqzfpa	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 05:32:16.262316+00	2026-03-08 05:32:16.37176+00	4kk25l6e7hvw	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	2049	sju63itxs46t	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	t	2026-03-15 16:15:49.89639+00	2026-03-15 16:15:50.208617+00	yn5xufokhqnz	6645979d-a485-44c9-94c8-2b87e081c735
00000000-0000-0000-0000-000000000000	2050	lsmnkmrurf4a	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	f	2026-03-15 16:15:50.209589+00	2026-03-15 16:15:50.209589+00	sju63itxs46t	6645979d-a485-44c9-94c8-2b87e081c735
00000000-0000-0000-0000-000000000000	2051	qy3q2l6cdb7h	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-15 16:16:29.486694+00	2026-03-15 16:16:29.734023+00	glhrebio2gqr	58c090c6-d4ea-4c6c-9f88-1e2cd9879ed8
00000000-0000-0000-0000-000000000000	1436	lk7lcifmox7q	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 05:01:58.880344+00	2026-03-08 06:01:48.63438+00	7jesqt7c5nfe	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	2052	2qxyt3vyypz2	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-15 16:16:29.735513+00	2026-03-15 16:16:29.735513+00	qy3q2l6cdb7h	58c090c6-d4ea-4c6c-9f88-1e2cd9879ed8
00000000-0000-0000-0000-000000000000	1441	p6cwnxzdksf5	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 06:01:48.653016+00	2026-03-08 06:01:48.829467+00	lk7lcifmox7q	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1438	tiqfe6ap5k2c	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 05:32:16.372142+00	2026-03-08 06:32:07.099698+00	iyypxmzqzfpa	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1443	4gax2sd2o764	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 06:32:07.128175+00	2026-03-08 06:32:07.24124+00	tiqfe6ap5k2c	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1442	s2emnhax5ksc	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 06:01:48.838494+00	2026-03-08 07:01:38.496037+00	p6cwnxzdksf5	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1447	ntpuza6w43sq	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 07:01:38.507498+00	2026-03-08 07:01:38.616944+00	s2emnhax5ksc	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1444	4vxw4m4es44l	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 06:32:07.241634+00	2026-03-08 07:31:58.125469+00	4gax2sd2o764	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1449	g6o2nve6lo74	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 07:31:58.147777+00	2026-03-08 07:31:58.38127+00	4vxw4m4es44l	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1448	i57vcjn6kees	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 07:01:38.617474+00	2026-03-08 08:01:28.128125+00	ntpuza6w43sq	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1453	mfth7763dp37	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 08:01:28.142601+00	2026-03-08 08:01:28.326028+00	i57vcjn6kees	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1450	adhas73eq6sc	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 07:31:58.38227+00	2026-03-08 08:31:49.222675+00	g6o2nve6lo74	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1455	feu33a7zybky	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 08:31:49.24186+00	2026-03-08 08:31:49.395234+00	adhas73eq6sc	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1454	nssgpfyij6qs	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 08:01:28.326524+00	2026-03-08 09:01:18.962483+00	mfth7763dp37	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1459	xp5ct4oh2usi	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 09:01:18.975797+00	2026-03-08 09:01:19.123677+00	nssgpfyij6qs	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1456	fdavh6tgfv3g	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 08:31:49.395663+00	2026-03-08 09:31:40.080735+00	feu33a7zybky	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1461	ecxfxxf6les3	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 09:31:40.099326+00	2026-03-08 09:31:40.219893+00	fdavh6tgfv3g	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1460	c4eqoeucir2e	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 09:01:19.124106+00	2026-03-08 10:01:09.842588+00	xp5ct4oh2usi	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1465	ennll7pcexrq	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 10:01:09.856514+00	2026-03-08 10:01:09.985216+00	c4eqoeucir2e	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1462	ldmasuw2ycun	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 09:31:40.22091+00	2026-03-08 10:31:30.845348+00	ecxfxxf6les3	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1467	77l5zynxbpwv	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 10:31:30.863292+00	2026-03-08 10:31:31.008742+00	ldmasuw2ycun	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1466	jq3s3jh6t4jw	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 10:01:09.985681+00	2026-03-08 11:00:59.581808+00	ennll7pcexrq	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1471	va4xjcyvjk32	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 11:00:59.602895+00	2026-03-08 11:00:59.708586+00	jq3s3jh6t4jw	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1468	y3gppzxkklmk	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 10:31:31.009119+00	2026-03-08 11:31:21.707953+00	77l5zynxbpwv	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1473	q2upqxuzbxvy	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 11:31:21.723959+00	2026-03-08 11:31:21.845553+00	y3gppzxkklmk	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1472	ujaozum2vhnb	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 11:00:59.708984+00	2026-03-08 12:00:49.31479+00	va4xjcyvjk32	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1474	q53pdfm3dw4g	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 11:31:21.847522+00	2026-03-08 12:31:11.539808+00	q2upqxuzbxvy	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1580	simdx6udtse6	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 04:58:04.719788+00	2026-03-09 05:57:54.756876+00	nulryuxmhrwv	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	2100	qcanhvylilgc	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	f	2026-03-16 14:32:30.498578+00	2026-03-16 14:32:30.498578+00	\N	e4d57708-a049-48cb-aab0-afcc7524fe67
00000000-0000-0000-0000-000000000000	1813	t4xkueqsxf6b	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 01:14:18.241158+00	2026-03-12 01:14:18.508904+00	unbjeg2uxoht	d6b1b72a-ded3-41b4-a0da-82ffbdabce7b
00000000-0000-0000-0000-000000000000	1477	gin367hxax44	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 12:00:49.326733+00	2026-03-08 12:00:49.428389+00	ujaozum2vhnb	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1814	vjyhrjat76ep	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 01:14:18.509428+00	2026-03-12 02:14:08.729462+00	t4xkueqsxf6b	d6b1b72a-ded3-41b4-a0da-82ffbdabce7b
00000000-0000-0000-0000-000000000000	1479	6lqtkymkzqi3	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 12:31:11.548933+00	2026-03-08 12:31:11.65824+00	q53pdfm3dw4g	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1924	lgcdicckt23k	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-12 13:14:18.995164+00	2026-03-12 13:14:19.336599+00	hcijrsalfr54	64a936b5-a4e9-4a98-888e-8c51e00ad2d9
00000000-0000-0000-0000-000000000000	1926	ae4h5vk57rci	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:14:23.398875+00	2026-03-12 13:14:23.707608+00	n4axf5easzwa	6979dd2c-d884-47f5-a5e2-2cbc1c43db92
00000000-0000-0000-0000-000000000000	1478	h4ghxzgfuuhl	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 12:00:49.428814+00	2026-03-08 13:00:40.062277+00	gin367hxax44	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1483	47rvomeirjp6	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 13:00:40.076607+00	2026-03-08 13:00:40.226772+00	h4ghxzgfuuhl	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1480	w54q4vw37n7a	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 12:31:11.658646+00	2026-03-08 13:31:01.313832+00	6lqtkymkzqi3	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1928	v3tmvo3rx3c6	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:14:55.590463+00	2026-03-12 13:14:55.798057+00	455wj3pb26ln	427878d3-9ec9-4a92-b522-26ed6216f653
00000000-0000-0000-0000-000000000000	1485	k5i24dtjnuqa	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 13:31:01.329964+00	2026-03-08 13:31:01.461054+00	w54q4vw37n7a	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1925	wcr2ookmmfhk	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-12 13:14:19.336987+00	2026-03-12 13:15:09.793058+00	lgcdicckt23k	64a936b5-a4e9-4a98-888e-8c51e00ad2d9
00000000-0000-0000-0000-000000000000	1931	vitujbj2upna	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-12 13:15:09.799268+00	2026-03-12 13:15:10.144904+00	wcr2ookmmfhk	64a936b5-a4e9-4a98-888e-8c51e00ad2d9
00000000-0000-0000-0000-000000000000	1484	6f6lj7dapost	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 13:00:40.227877+00	2026-03-08 14:00:30.806493+00	47rvomeirjp6	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1489	7v7whuyrgpea	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 14:00:30.810714+00	2026-03-08 14:00:31.014792+00	6f6lj7dapost	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1927	g4p5cdze443s	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:14:23.708478+00	2026-03-12 13:15:13.110274+00	ae4h5vk57rci	6979dd2c-d884-47f5-a5e2-2cbc1c43db92
00000000-0000-0000-0000-000000000000	1486	qvvnyybctyij	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 13:31:01.464202+00	2026-03-08 14:30:51.11933+00	k5i24dtjnuqa	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1491	3qdomq6br7r7	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 14:30:51.134379+00	2026-03-08 14:30:51.24379+00	qvvnyybctyij	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1933	vuh4ow7n5aqh	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:15:13.112116+00	2026-03-12 13:15:13.45565+00	g4p5cdze443s	6979dd2c-d884-47f5-a5e2-2cbc1c43db92
00000000-0000-0000-0000-000000000000	1929	j6s6koov4bf7	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:14:55.798629+00	2026-03-12 13:15:45.059032+00	v3tmvo3rx3c6	427878d3-9ec9-4a92-b522-26ed6216f653
00000000-0000-0000-0000-000000000000	1935	vha56oxput3a	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:15:45.059418+00	2026-03-12 13:15:45.280392+00	j6s6koov4bf7	427878d3-9ec9-4a92-b522-26ed6216f653
00000000-0000-0000-0000-000000000000	1490	ufaw2pfs5cj7	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 14:00:31.01579+00	2026-03-08 15:00:21.627368+00	7v7whuyrgpea	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1495	kph5jkxkd4q2	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 15:00:21.641845+00	2026-03-08 15:00:21.782062+00	ufaw2pfs5cj7	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1930	ly4o26iknaqh	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-12 13:14:59.242898+00	2026-03-12 13:15:49.610562+00	\N	af40f740-4519-4492-b301-c675eac0ef94
00000000-0000-0000-0000-000000000000	1492	hkytarazmb4s	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 14:30:51.244317+00	2026-03-08 15:30:41.856409+00	3qdomq6br7r7	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1497	y6t7ksjliv22	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 15:30:41.874522+00	2026-03-08 15:30:41.968689+00	hkytarazmb4s	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1937	fkkucfqo6gq2	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-12 13:15:49.610884+00	2026-03-12 13:15:49.931716+00	ly4o26iknaqh	af40f740-4519-4492-b301-c675eac0ef94
00000000-0000-0000-0000-000000000000	1932	25qim2kioiwd	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-12 13:15:10.145827+00	2026-03-12 13:16:00.787361+00	vitujbj2upna	64a936b5-a4e9-4a98-888e-8c51e00ad2d9
00000000-0000-0000-0000-000000000000	1934	i6qfc5gdrxro	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:15:13.45648+00	2026-03-12 13:16:02.870759+00	vuh4ow7n5aqh	6979dd2c-d884-47f5-a5e2-2cbc1c43db92
00000000-0000-0000-0000-000000000000	1496	ksd62ou6mcw7	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 15:00:21.78338+00	2026-03-08 16:00:11.358954+00	kph5jkxkd4q2	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1936	xiu4z2msv5l7	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:15:45.281239+00	2026-03-12 13:16:35.546857+00	vha56oxput3a	427878d3-9ec9-4a92-b522-26ed6216f653
00000000-0000-0000-0000-000000000000	1501	kjx7pkgqd7aw	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 16:00:11.374217+00	2026-03-08 16:00:11.525475+00	ksd62ou6mcw7	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1938	3app3ij6ncob	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-12 13:15:49.932841+00	2026-03-12 13:16:39.56002+00	fkkucfqo6gq2	af40f740-4519-4492-b301-c675eac0ef94
00000000-0000-0000-0000-000000000000	1498	53groefihgqy	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 15:30:41.970657+00	2026-03-08 16:30:31.742881+00	y6t7ksjliv22	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1503	ogfhpo2p47u6	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 16:30:31.764595+00	2026-03-08 16:30:31.884672+00	53groefihgqy	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1502	2q3gmaql4vkn	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 16:00:11.527272+00	2026-03-08 17:00:01.174335+00	kjx7pkgqd7aw	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1507	sa6ha5a7p5wt	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 17:00:01.189391+00	2026-03-08 17:00:01.352298+00	2q3gmaql4vkn	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1504	mik7lppwvufw	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 16:30:31.885056+00	2026-03-08 17:30:21.745131+00	ogfhpo2p47u6	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1509	ljmcacspoqc6	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 17:30:21.760199+00	2026-03-08 17:30:21.869411+00	mik7lppwvufw	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1508	3qwflrd3gk4m	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 17:00:01.352669+00	2026-03-08 17:59:51.977226+00	sa6ha5a7p5wt	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1513	ncf2lipql56y	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 17:59:51.992005+00	2026-03-08 17:59:52.086795+00	3qwflrd3gk4m	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1510	r5sv3c4r6nzg	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 17:30:21.86976+00	2026-03-08 18:30:11.644708+00	ljmcacspoqc6	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1515	oteizqdry4ww	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 18:30:11.661772+00	2026-03-08 18:30:11.761614+00	r5sv3c4r6nzg	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1514	n6ewlgyxuz4m	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 17:59:52.089478+00	2026-03-08 18:59:42.663815+00	ncf2lipql56y	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1519	cha5r7zrqy2s	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 18:59:42.676051+00	2026-03-08 18:59:42.834817+00	n6ewlgyxuz4m	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1516	7nkmgdsiypmp	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 18:30:11.761963+00	2026-03-08 19:30:01.625701+00	oteizqdry4ww	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1521	qngodncw7dbu	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 19:30:01.651805+00	2026-03-08 19:30:01.792921+00	7nkmgdsiypmp	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1520	kyon6pj7jhdk	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 18:59:42.836525+00	2026-03-08 19:59:32.331838+00	cha5r7zrqy2s	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1522	gaknbcon5m5t	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 19:30:01.793297+00	2026-03-08 20:29:51.545108+00	qngodncw7dbu	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1574	hgu4nlerxk32	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 03:58:14.953819+00	2026-03-09 04:58:04.593415+00	hyp374ajoaa4	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1525	tcfa7gcm3mob	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 19:59:32.348619+00	2026-03-08 19:59:32.436425+00	kyon6pj7jhdk	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1815	ctfn64ktlbly	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 02:14:08.748503+00	2026-03-12 02:14:09.051113+00	vjyhrjat76ep	d6b1b72a-ded3-41b4-a0da-82ffbdabce7b
00000000-0000-0000-0000-000000000000	1527	xanb5po4bez3	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 20:29:51.56612+00	2026-03-08 20:29:51.683863+00	gaknbcon5m5t	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1816	ax5z6mkykjpx	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 02:14:09.052438+00	2026-03-12 03:14:00.285552+00	ctfn64ktlbly	d6b1b72a-ded3-41b4-a0da-82ffbdabce7b
00000000-0000-0000-0000-000000000000	1939	2x5h3yn6mvy7	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-12 13:16:00.787712+00	2026-03-12 13:16:01.100475+00	25qim2kioiwd	64a936b5-a4e9-4a98-888e-8c51e00ad2d9
00000000-0000-0000-0000-000000000000	1526	uayigrv6ookg	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 19:59:32.437585+00	2026-03-08 20:59:23.028468+00	tcfa7gcm3mob	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1531	tcs6zhmkuy5u	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 20:59:23.04735+00	2026-03-08 20:59:23.153736+00	uayigrv6ookg	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1528	ylrorljifipa	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 20:29:51.684887+00	2026-03-08 21:29:41.318813+00	xanb5po4bez3	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1941	tvhjtifk7xd7	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:16:02.871131+00	2026-03-12 13:16:03.193622+00	i6qfc5gdrxro	6979dd2c-d884-47f5-a5e2-2cbc1c43db92
00000000-0000-0000-0000-000000000000	1533	a2fpvbnmfkws	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 21:29:41.338998+00	2026-03-08 21:29:41.455046+00	ylrorljifipa	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1943	4nr55cpuy4da	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:16:35.547765+00	2026-03-12 13:16:35.759953+00	xiu4z2msv5l7	427878d3-9ec9-4a92-b522-26ed6216f653
00000000-0000-0000-0000-000000000000	1532	tprx6yk5kcbw	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 20:59:23.154134+00	2026-03-08 21:59:13.83622+00	tcs6zhmkuy5u	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1945	o2idvpo4vxtu	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-12 13:16:39.560758+00	2026-03-12 13:16:39.882846+00	3app3ij6ncob	af40f740-4519-4492-b301-c675eac0ef94
00000000-0000-0000-0000-000000000000	1537	ho5vxv3oqzbl	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 21:59:13.854956+00	2026-03-08 21:59:13.974904+00	tprx6yk5kcbw	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1946	kkcjxnbswnly	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-12 13:16:39.885071+00	2026-03-12 13:16:39.885071+00	o2idvpo4vxtu	af40f740-4519-4492-b301-c675eac0ef94
00000000-0000-0000-0000-000000000000	1534	uaplbbbpe3ki	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 21:29:41.455414+00	2026-03-08 22:29:32.162764+00	a2fpvbnmfkws	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1940	uifm3mh4s2i5	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-12 13:16:01.101633+00	2026-03-12 13:16:51.49233+00	2x5h3yn6mvy7	64a936b5-a4e9-4a98-888e-8c51e00ad2d9
00000000-0000-0000-0000-000000000000	1539	finfic7rjkuo	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 22:29:32.178864+00	2026-03-08 22:29:32.297029+00	uaplbbbpe3ki	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1947	5aqnkd2dy63y	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-12 13:16:51.492654+00	2026-03-12 13:16:51.811931+00	uifm3mh4s2i5	64a936b5-a4e9-4a98-888e-8c51e00ad2d9
00000000-0000-0000-0000-000000000000	1948	vyslpqfk5lep	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-12 13:16:51.812252+00	2026-03-12 13:16:51.812252+00	5aqnkd2dy63y	64a936b5-a4e9-4a98-888e-8c51e00ad2d9
00000000-0000-0000-0000-000000000000	1942	uktsw5pxqoqx	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:16:03.19427+00	2026-03-12 13:16:53.59649+00	tvhjtifk7xd7	6979dd2c-d884-47f5-a5e2-2cbc1c43db92
00000000-0000-0000-0000-000000000000	1538	paqhgok64rvp	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 21:59:13.975298+00	2026-03-08 22:59:03.649877+00	ho5vxv3oqzbl	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1949	qykho5yezqcl	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:16:53.596795+00	2026-03-12 13:16:53.942752+00	uktsw5pxqoqx	6979dd2c-d884-47f5-a5e2-2cbc1c43db92
00000000-0000-0000-0000-000000000000	1543	nfv6k6meqq4h	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 22:59:03.667252+00	2026-03-08 22:59:03.78959+00	paqhgok64rvp	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1950	fbxtia5tjxlm	de1dc022-ea84-4098-9ac7-5952270495cb	f	2026-03-12 13:16:53.945047+00	2026-03-12 13:16:53.945047+00	qykho5yezqcl	6979dd2c-d884-47f5-a5e2-2cbc1c43db92
00000000-0000-0000-0000-000000000000	1540	afs3bnx5yrno	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 22:29:32.297483+00	2026-03-08 23:29:22.909612+00	finfic7rjkuo	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1944	bag7c223ccj4	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:16:35.760291+00	2026-03-12 13:17:24.998843+00	4nr55cpuy4da	427878d3-9ec9-4a92-b522-26ed6216f653
00000000-0000-0000-0000-000000000000	1545	dx5kvcupq3q6	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 23:29:22.930965+00	2026-03-08 23:29:23.031749+00	afs3bnx5yrno	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1951	gen6ft7pkduv	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:17:25.002589+00	2026-03-12 13:17:25.208947+00	bag7c223ccj4	427878d3-9ec9-4a92-b522-26ed6216f653
00000000-0000-0000-0000-000000000000	1952	tds2ep5s2nta	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:17:25.209312+00	2026-03-12 13:18:15.559177+00	gen6ft7pkduv	427878d3-9ec9-4a92-b522-26ed6216f653
00000000-0000-0000-0000-000000000000	1978	ecmyuy4rts4a	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	f	2026-03-13 11:15:03.809252+00	2026-03-13 11:15:03.809252+00	\N	3db1a5a4-5d7e-4cea-9370-d95f1a142867
00000000-0000-0000-0000-000000000000	1544	hqyrx3v6rkba	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 22:59:03.797644+00	2026-03-08 23:58:53.425652+00	nfv6k6meqq4h	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1549	gdn4fnswy3i7	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 23:58:53.440721+00	2026-03-08 23:58:53.603582+00	hqyrx3v6rkba	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1546	2qkefurxuwl6	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 23:29:23.032145+00	2026-03-09 00:29:13.833981+00	dx5kvcupq3q6	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1551	3j4id6mjrqy4	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 00:29:13.84861+00	2026-03-09 00:29:13.957222+00	2qkefurxuwl6	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1550	kvwpsv67dmr3	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-08 23:58:53.604129+00	2026-03-09 00:58:43.310756+00	gdn4fnswy3i7	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1555	mrleyw2ymzac	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 00:58:43.327897+00	2026-03-09 00:58:43.497246+00	kvwpsv67dmr3	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1552	i2her7h2g3sz	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 00:29:13.957627+00	2026-03-09 01:29:03.716734+00	3j4id6mjrqy4	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1557	3rzvsrri43ex	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 01:29:03.734809+00	2026-03-09 01:29:03.860702+00	i2her7h2g3sz	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1556	z7omwpjdmyfo	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 00:58:43.497613+00	2026-03-09 01:58:33.143329+00	mrleyw2ymzac	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1561	hxyrx3lzidvh	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 01:58:33.154454+00	2026-03-09 01:58:33.24966+00	z7omwpjdmyfo	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1558	2p6gkbd6tpmh	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 01:29:03.861138+00	2026-03-09 02:28:53.615824+00	3rzvsrri43ex	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1563	5wyyzzytpmch	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 02:28:53.633684+00	2026-03-09 02:28:53.745987+00	2p6gkbd6tpmh	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1562	bit3zroqqjoc	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 01:58:33.250011+00	2026-03-09 02:58:23.934714+00	hxyrx3lzidvh	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1567	pyct7rdei34z	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 02:58:23.961412+00	2026-03-09 02:58:24.080977+00	bit3zroqqjoc	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1564	4hl2h5k55pba	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 02:28:53.746372+00	2026-03-09 03:28:43.309444+00	5wyyzzytpmch	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1569	oiobl6cbvusb	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 03:28:43.320559+00	2026-03-09 03:28:43.430218+00	4hl2h5k55pba	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1568	gzmkdjl6poa2	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 02:58:24.081365+00	2026-03-09 03:58:14.831687+00	pyct7rdei34z	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1573	hyp374ajoaa4	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 03:58:14.843215+00	2026-03-09 03:58:14.949845+00	gzmkdjl6poa2	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1570	2vrycpbidggp	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 03:28:43.431291+00	2026-03-09 04:28:34.070974+00	oiobl6cbvusb	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1576	mvwi3ok66tna	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 04:28:34.200307+00	2026-03-09 05:28:25.024681+00	6qudd3x3tqvl	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1575	6qudd3x3tqvl	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 04:28:34.080677+00	2026-03-09 04:28:34.199298+00	2vrycpbidggp	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	2101	tpd7ajgdd727	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	f	2026-03-16 14:32:40.104247+00	2026-03-16 14:32:40.104247+00	\N	d5b9f541-c734-45a9-aa7b-f65b3dc2f999
00000000-0000-0000-0000-000000000000	1817	ljxlg2cybw6n	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 03:14:00.303169+00	2026-03-12 03:14:00.607038+00	ax5z6mkykjpx	d6b1b72a-ded3-41b4-a0da-82ffbdabce7b
00000000-0000-0000-0000-000000000000	2120	mtdt2v5uek2f	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-17 05:53:01.46462+00	2026-03-17 05:53:01.46462+00	\N	bc48fb1a-456c-45ad-9b12-372f206ee36b
00000000-0000-0000-0000-000000000000	1818	2uyrgyf7u2yw	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 03:14:00.607438+00	2026-03-12 04:13:50.861487+00	ljxlg2cybw6n	d6b1b72a-ded3-41b4-a0da-82ffbdabce7b
00000000-0000-0000-0000-000000000000	1585	puxb3gdzydtm	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 05:57:54.783405+00	2026-03-09 05:57:55.075145+00	simdx6udtse6	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1953	nnpj6nieesbo	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:18:15.568178+00	2026-03-12 13:18:15.792462+00	tds2ep5s2nta	427878d3-9ec9-4a92-b522-26ed6216f653
00000000-0000-0000-0000-000000000000	1582	5venc6d7vm42	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 05:28:25.218625+00	2026-03-09 06:28:16.44904+00	4cig3ytuetsg	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	2133	mhlhanm7h5rm	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-17 13:06:37.928344+00	2026-03-17 13:06:38.198838+00	afuo7lbtv6gk	6e3dc2c8-8904-4622-a1f5-b6d196da73e1
00000000-0000-0000-0000-000000000000	1587	nxhbqiltmicy	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 06:28:16.477183+00	2026-03-09 06:28:16.767158+00	5venc6d7vm42	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1954	4vdc7eqoq7ca	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:18:15.792886+00	2026-03-12 13:22:07.736944+00	nnpj6nieesbo	427878d3-9ec9-4a92-b522-26ed6216f653
00000000-0000-0000-0000-000000000000	2134	a572hyx2zuuj	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-17 13:06:38.199239+00	2026-03-17 13:06:38.199239+00	mhlhanm7h5rm	6e3dc2c8-8904-4622-a1f5-b6d196da73e1
00000000-0000-0000-0000-000000000000	1979	um3scksik5zb	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	t	2026-03-13 11:16:54.566602+00	2026-03-13 12:16:43.951937+00	\N	6645979d-a485-44c9-94c8-2b87e081c735
00000000-0000-0000-0000-000000000000	2016	b7rwmc3spiw4	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-13 15:26:58.598351+00	2026-03-13 15:26:58.886567+00	wtzmxw7khv62	ec552c3f-10bd-42f6-9b4f-0e6c03e9a1c8
00000000-0000-0000-0000-000000000000	1586	tvluviz5e3u5	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 05:57:55.075553+00	2026-03-09 06:57:46.051039+00	puxb3gdzydtm	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1591	637llgjf24np	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 06:57:46.067606+00	2026-03-09 06:57:46.305917+00	tvluviz5e3u5	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	2017	zv5t6f4eakl7	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-13 15:26:58.887429+00	2026-03-13 16:26:48.44413+00	b7rwmc3spiw4	ec552c3f-10bd-42f6-9b4f-0e6c03e9a1c8
00000000-0000-0000-0000-000000000000	1588	j55vrpkhsdr5	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 06:28:16.772028+00	2026-03-09 07:28:07.181249+00	nxhbqiltmicy	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1593	yx4lfxvubgyb	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 07:28:07.19302+00	2026-03-09 07:28:07.610757+00	j55vrpkhsdr5	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	2053	ktohmzurod3q	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-15 16:23:13.906313+00	2026-03-15 16:23:14.17809+00	7nq3n7gbyxyg	a599f3b1-cd36-49b9-adb8-0ffdfcb34bc8
00000000-0000-0000-0000-000000000000	2054	7qmvszuzhpmi	b3ec626f-8311-40ae-882f-4d67bfe75163	f	2026-03-15 16:23:14.179611+00	2026-03-15 16:23:14.179611+00	ktohmzurod3q	a599f3b1-cd36-49b9-adb8-0ffdfcb34bc8
00000000-0000-0000-0000-000000000000	2055	aqbmkeg3tq2g	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-15 16:23:32.815332+00	2026-03-15 16:23:33.051689+00	otya5evqdyo4	f9095374-8d70-4e81-8acd-9c5577aefd94
00000000-0000-0000-0000-000000000000	2056	o3lqf4ifbcxz	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-15 16:23:33.054687+00	2026-03-15 16:23:33.054687+00	aqbmkeg3tq2g	f9095374-8d70-4e81-8acd-9c5577aefd94
00000000-0000-0000-0000-000000000000	1592	x4oayd7ze24n	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 06:57:46.308171+00	2026-03-09 07:57:37.776335+00	637llgjf24np	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1597	n6iz6pokhqxp	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 07:57:37.795128+00	2026-03-09 07:57:38.13528+00	x4oayd7ze24n	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1594	7rut5qmnjbux	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 07:28:07.611172+00	2026-03-09 08:27:57.929627+00	yx4lfxvubgyb	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1599	fsnzrxrbtn47	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 08:27:57.943437+00	2026-03-09 08:27:58.51538+00	7rut5qmnjbux	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1598	aib6furgnz44	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 07:57:38.135689+00	2026-03-09 08:57:29.06895+00	n6iz6pokhqxp	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1603	uurbggkolvjp	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 08:57:29.087815+00	2026-03-09 08:57:29.388942+00	aib6furgnz44	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1600	nioukmwfu3k5	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 08:27:58.518106+00	2026-03-09 09:27:48.647369+00	fsnzrxrbtn47	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1605	ygsmnbwjoegk	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 09:27:48.673866+00	2026-03-09 09:27:48.88959+00	nioukmwfu3k5	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1604	o7nh6pt23eau	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 08:57:29.389383+00	2026-03-09 09:57:20.430576+00	uurbggkolvjp	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1609	6ydd6aqqwkbm	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 09:57:20.44328+00	2026-03-09 09:57:20.71241+00	o7nh6pt23eau	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1606	wpcdq3te3tmi	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 09:27:48.891282+00	2026-03-09 10:27:39.168979+00	ygsmnbwjoegk	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1611	qktamek2srsn	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 10:27:39.184593+00	2026-03-09 10:27:39.559027+00	wpcdq3te3tmi	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1610	4bdsiheqfoeh	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 09:57:20.712788+00	2026-03-09 10:57:10.747786+00	6ydd6aqqwkbm	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1615	ouz3hbqh7zyi	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 10:57:10.764483+00	2026-03-09 10:57:10.957284+00	4bdsiheqfoeh	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1612	6k4msxwsw3ft	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 10:27:39.559464+00	2026-03-09 11:27:30.094143+00	qktamek2srsn	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1617	kaji3ub55n5u	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 11:27:30.121849+00	2026-03-09 11:27:30.393959+00	6k4msxwsw3ft	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1616	ik7osjocy7vp	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 10:57:10.958221+00	2026-03-09 11:57:01.103774+00	ouz3hbqh7zyi	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1621	6xrov74gjhnw	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 11:57:01.120984+00	2026-03-09 11:57:01.411823+00	ik7osjocy7vp	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1618	vzclripwvyle	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 11:27:30.394673+00	2026-03-09 12:27:21.976377+00	kaji3ub55n5u	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1623	mkafuiqaxc72	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 12:27:21.994049+00	2026-03-09 12:27:22.241838+00	vzclripwvyle	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1622	53qj2djwwpri	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 11:57:01.413243+00	2026-03-09 12:56:52.325689+00	6xrov74gjhnw	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1627	fmrdkbzlv5gz	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 12:56:52.348815+00	2026-03-09 12:56:52.612235+00	53qj2djwwpri	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1624	2slm6t2gnwto	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 12:27:22.243042+00	2026-03-09 13:27:13.794594+00	mkafuiqaxc72	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1628	4ivxeeaxobdo	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 12:56:52.61322+00	2026-03-09 13:56:42.839149+00	fmrdkbzlv5gz	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	2102	fbcabam6rsyb	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	f	2026-03-16 14:37:26.162096+00	2026-03-16 14:37:26.162096+00	\N	77388399-7030-4b18-ad54-1c95bf143f4d
00000000-0000-0000-0000-000000000000	1629	dx2krwc7z56l	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 13:27:13.810762+00	2026-03-09 13:27:14.26948+00	2slm6t2gnwto	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1819	negok4izltby	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 04:13:50.89034+00	2026-03-12 04:13:51.178967+00	2uyrgyf7u2yw	d6b1b72a-ded3-41b4-a0da-82ffbdabce7b
00000000-0000-0000-0000-000000000000	2103	6m2bkutgtoxg	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	f	2026-03-16 14:38:14.93321+00	2026-03-16 14:38:14.93321+00	\N	bc52457b-059b-4568-88e0-294b8507f512
00000000-0000-0000-0000-000000000000	1820	gry3s2v3hgkn	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 04:13:51.17936+00	2026-03-12 05:13:42.289234+00	negok4izltby	d6b1b72a-ded3-41b4-a0da-82ffbdabce7b
00000000-0000-0000-0000-000000000000	2121	xpegby6fanu2	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	f	2026-03-17 05:55:09.940401+00	2026-03-17 05:55:09.940401+00	\N	a5589dff-fa8e-4235-974f-e60a34e03274
00000000-0000-0000-0000-000000000000	1955	xj4jg5yik4j3	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 13:24:13.318672+00	2026-03-12 13:24:13.566814+00	fe5tptt5ina2	a599f3b1-cd36-49b9-adb8-0ffdfcb34bc8
00000000-0000-0000-0000-000000000000	1633	l5x6t4x7ef4p	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 13:56:42.852571+00	2026-03-09 13:56:43.19175+00	4ivxeeaxobdo	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1630	k3xaynzrx6u7	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 13:27:14.269827+00	2026-03-09 14:27:05.553907+00	dx2krwc7z56l	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1956	4cev4afuggct	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 13:24:13.567517+00	2026-03-12 14:24:03.121026+00	xj4jg5yik4j3	a599f3b1-cd36-49b9-adb8-0ffdfcb34bc8
00000000-0000-0000-0000-000000000000	1635	3oynf4ykvos7	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 14:27:05.583542+00	2026-03-09 14:27:05.859133+00	k3xaynzrx6u7	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1980	puastr5thy3s	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-13 11:27:38.235952+00	2026-03-13 11:27:38.541332+00	o6kp6xfdwehb	ec552c3f-10bd-42f6-9b4f-0e6c03e9a1c8
00000000-0000-0000-0000-000000000000	1981	rpyozd2cxnih	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-13 11:27:38.547844+00	2026-03-13 12:27:28.538873+00	puastr5thy3s	ec552c3f-10bd-42f6-9b4f-0e6c03e9a1c8
00000000-0000-0000-0000-000000000000	1634	ak36av4xjos5	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 13:56:43.194074+00	2026-03-09 14:56:34.683273+00	l5x6t4x7ef4p	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	2018	liv6i4g5rwbx	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-13 15:31:02.569057+00	2026-03-13 15:31:02.906611+00	gjehmldv4cvt	a8d24ea5-ad85-48ee-889a-a0e3ba2e1ed5
00000000-0000-0000-0000-000000000000	1639	ajq6gqtrunqh	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 14:56:34.699305+00	2026-03-09 14:56:35.061181+00	ak36av4xjos5	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	2019	izz6wyca6t4s	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-13 15:31:02.908538+00	2026-03-13 16:30:52.686839+00	liv6i4g5rwbx	a8d24ea5-ad85-48ee-889a-a0e3ba2e1ed5
00000000-0000-0000-0000-000000000000	1636	brsxeijlddmd	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 14:27:05.860353+00	2026-03-09 15:26:56.049318+00	3oynf4ykvos7	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1642	g3yrufelspz3	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 15:26:56.079493+00	2026-03-09 15:26:56.430409+00	brsxeijlddmd	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	2057	fxknqg4kmxun	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-15 16:26:29.702225+00	2026-03-15 16:26:29.945277+00	iphntpdub6im	ec552c3f-10bd-42f6-9b4f-0e6c03e9a1c8
00000000-0000-0000-0000-000000000000	2058	wuk7ju23r2wg	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-15 16:26:29.945787+00	2026-03-15 16:26:29.945787+00	fxknqg4kmxun	ec552c3f-10bd-42f6-9b4f-0e6c03e9a1c8
00000000-0000-0000-0000-000000000000	1640	melpeniycd3h	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 14:56:35.061668+00	2026-03-09 15:56:26.187228+00	ajq6gqtrunqh	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1646	mm6glej7mvqt	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 15:56:26.208386+00	2026-03-09 15:56:26.466046+00	melpeniycd3h	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1643	jghavndes4hr	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 15:26:56.43163+00	2026-03-09 16:26:47.659582+00	g3yrufelspz3	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1650	phv4xitlrfuk	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 16:26:47.677262+00	2026-03-09 16:26:47.925656+00	jghavndes4hr	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1647	bwgztisqp5sq	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 15:56:26.467276+00	2026-03-09 16:56:17.207019+00	mm6glej7mvqt	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1654	7ge5lay4rmwq	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 16:56:17.226719+00	2026-03-09 16:56:17.561262+00	bwgztisqp5sq	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1651	ogipoqt23fo4	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 16:26:47.927373+00	2026-03-09 17:26:38.279099+00	phv4xitlrfuk	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1658	yupks6ykmxjj	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 17:26:38.304283+00	2026-03-09 17:26:38.640401+00	ogipoqt23fo4	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1655	adkmg6ftdmwm	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 16:56:17.561665+00	2026-03-09 17:56:07.724085+00	7ge5lay4rmwq	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1662	uhym2ykvndp5	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 17:56:07.74428+00	2026-03-09 17:56:07.949804+00	adkmg6ftdmwm	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1659	rpowvg73pms4	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 17:26:38.640912+00	2026-03-09 18:26:28.752023+00	yupks6ykmxjj	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1666	p3wb67rc3fnp	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 18:26:28.767196+00	2026-03-09 18:26:29.013519+00	rpowvg73pms4	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1663	4cj5bqqnhxyy	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 17:56:07.950227+00	2026-03-09 18:55:57.851118+00	uhym2ykvndp5	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1670	icfqwpxk2ct6	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 18:55:57.865861+00	2026-03-09 18:55:58.063202+00	4cj5bqqnhxyy	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1667	uahelnefaglt	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 18:26:29.021582+00	2026-03-09 19:26:19.740918+00	p3wb67rc3fnp	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1674	iu3jhj3z4yr6	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 19:26:19.75647+00	2026-03-09 19:26:19.977392+00	uahelnefaglt	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1671	6biayll2evfm	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 18:55:58.063598+00	2026-03-09 19:55:48.720197+00	icfqwpxk2ct6	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1678	jmixmtmbaklc	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 19:55:48.73668+00	2026-03-09 19:55:48.838642+00	6biayll2evfm	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1675	u6rrxcnlnija	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 19:26:19.977747+00	2026-03-09 20:26:09.680968+00	iu3jhj3z4yr6	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	2104	q3hxe7botzvv	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	f	2026-03-16 14:41:25.382708+00	2026-03-16 14:41:25.382708+00	\N	361f58b8-2354-40c2-9afd-bc72eaf5f989
00000000-0000-0000-0000-000000000000	1821	ngol4yxpsy75	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 05:13:42.314787+00	2026-03-12 05:13:42.598753+00	gry3s2v3hgkn	d6b1b72a-ded3-41b4-a0da-82ffbdabce7b
00000000-0000-0000-0000-000000000000	2097	xjxamzcpvohu	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	t	2026-03-16 14:27:06.625491+00	2026-03-17 06:50:15.556731+00	\N	18acca89-2d20-4734-acf5-c6be501b667d
00000000-0000-0000-0000-000000000000	1822	266gvk3kb4bs	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 05:13:42.599187+00	2026-03-12 05:26:11.416919+00	ngol4yxpsy75	d6b1b72a-ded3-41b4-a0da-82ffbdabce7b
00000000-0000-0000-0000-000000000000	2122	eh3qy57cc37k	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	f	2026-03-17 06:50:15.583243+00	2026-03-17 06:50:15.583243+00	xjxamzcpvohu	18acca89-2d20-4734-acf5-c6be501b667d
00000000-0000-0000-0000-000000000000	1682	kt4gwjmx4bc2	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 20:26:09.693932+00	2026-03-09 20:26:09.78962+00	u6rrxcnlnija	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1957	z4x7ulbqex7t	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 13:32:54.018739+00	2026-03-12 14:32:44.587301+00	\N	323c06f6-5104-4602-9dd4-b87878ae4ef8
00000000-0000-0000-0000-000000000000	1982	xbbcmw5iipyw	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-13 11:31:42.256631+00	2026-03-13 11:31:42.518984+00	ipt3ohu2wp4z	a8d24ea5-ad85-48ee-889a-a0e3ba2e1ed5
00000000-0000-0000-0000-000000000000	1679	n2yy3d2is5df	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 19:55:48.839105+00	2026-03-09 20:55:38.445624+00	jmixmtmbaklc	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1983	qc2isuiryypo	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-13 11:31:42.520379+00	2026-03-13 12:31:31.871333+00	xbbcmw5iipyw	a8d24ea5-ad85-48ee-889a-a0e3ba2e1ed5
00000000-0000-0000-0000-000000000000	1686	5gt5cuh7zhhv	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 20:55:38.465226+00	2026-03-09 20:55:38.555183+00	n2yy3d2is5df	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	2020	okgnxvt3iqyk	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	t	2026-03-13 16:16:08.554821+00	2026-03-13 16:16:08.845795+00	ies7rrynrpuy	6645979d-a485-44c9-94c8-2b87e081c735
00000000-0000-0000-0000-000000000000	2022	ez2zgv43yzfb	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-13 16:16:49.685701+00	2026-03-13 16:16:49.915565+00	pborjllippao	58c090c6-d4ea-4c6c-9f88-1e2cd9879ed8
00000000-0000-0000-0000-000000000000	1683	bvg5kw6o6cv5	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 20:26:09.79+00	2026-03-09 21:25:59.427383+00	kt4gwjmx4bc2	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1690	wzbdnlvo2em6	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 21:25:59.440876+00	2026-03-09 21:25:59.534032+00	bvg5kw6o6cv5	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	2021	whki27t6bqg4	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	t	2026-03-13 16:16:08.847262+00	2026-03-14 16:15:59.232902+00	okgnxvt3iqyk	6645979d-a485-44c9-94c8-2b87e081c735
00000000-0000-0000-0000-000000000000	2023	rm6yrim4bcwn	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-13 16:16:49.915922+00	2026-03-14 16:16:39.565194+00	ez2zgv43yzfb	58c090c6-d4ea-4c6c-9f88-1e2cd9879ed8
00000000-0000-0000-0000-000000000000	2059	ieysowlvv5qn	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-15 16:30:32.183621+00	2026-03-15 16:30:32.430624+00	vxxk67yiqt7j	a8d24ea5-ad85-48ee-889a-a0e3ba2e1ed5
00000000-0000-0000-0000-000000000000	2060	27cgj4w77nud	de1dc022-ea84-4098-9ac7-5952270495cb	f	2026-03-15 16:30:32.431322+00	2026-03-15 16:30:32.431322+00	ieysowlvv5qn	a8d24ea5-ad85-48ee-889a-a0e3ba2e1ed5
00000000-0000-0000-0000-000000000000	1687	5k2vhimojx5l	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 20:55:38.555579+00	2026-03-09 21:55:28.204293+00	5gt5cuh7zhhv	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1694	dnrlh2mihqga	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 21:55:28.223172+00	2026-03-09 21:55:28.371957+00	5k2vhimojx5l	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1691	nyx3hdkuyeaq	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 21:25:59.534482+00	2026-03-09 22:25:49.157663+00	wzbdnlvo2em6	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1698	od3fxsdxedbi	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 22:25:49.175722+00	2026-03-09 22:25:49.271048+00	nyx3hdkuyeaq	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1700	rnia5kyraepe	31cc7cef-c734-4a0d-8368-10440ee52424	f	2026-03-09 22:34:02.695688+00	2026-03-09 22:34:02.695688+00	\N	2d9f5844-63d2-401b-ab51-a30d1e8d0051
00000000-0000-0000-0000-000000000000	1695	oxjn6talru5q	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 21:55:28.372398+00	2026-03-09 22:55:18.771777+00	dnrlh2mihqga	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1704	lobvmiqsb2vo	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 22:55:18.789872+00	2026-03-09 22:55:18.877371+00	oxjn6talru5q	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1706	shxcc5bp4lyl	31cc7cef-c734-4a0d-8368-10440ee52424	f	2026-03-09 22:59:14.119881+00	2026-03-09 22:59:14.119881+00	\N	f6535a4f-66f8-4753-ac40-c609ec6ea7e3
00000000-0000-0000-0000-000000000000	1699	c5gtzs4a3tku	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 22:25:49.271479+00	2026-03-09 23:25:39.862452+00	od3fxsdxedbi	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1709	pbxuxbgry4et	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 23:25:39.88394+00	2026-03-09 23:25:39.984569+00	c5gtzs4a3tku	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1705	iy2uy4kuvzee	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 22:55:18.877851+00	2026-03-09 23:55:08.63091+00	lobvmiqsb2vo	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1713	hot6adfri53g	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 23:55:08.644713+00	2026-03-09 23:55:08.852918+00	iy2uy4kuvzee	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1710	lybvuyufs5mo	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 23:25:39.986131+00	2026-03-10 00:25:29.694271+00	pbxuxbgry4et	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1717	wqoqywwtua62	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-10 00:25:29.706702+00	2026-03-10 00:25:29.890061+00	lybvuyufs5mo	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1714	uio3oujrnvvl	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-09 23:55:08.853367+00	2026-03-10 00:54:58.642944+00	hot6adfri53g	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1721	ttomtpprcdp7	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-10 00:54:58.665586+00	2026-03-10 00:54:58.778019+00	uio3oujrnvvl	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1718	x5pfzqxpvp7f	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-10 00:25:29.890441+00	2026-03-10 01:25:19.599776+00	wqoqywwtua62	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1725	prtwi276nte4	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-10 01:25:19.616562+00	2026-03-10 01:25:19.778353+00	x5pfzqxpvp7f	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1722	ifmmkxzuj4tg	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-10 00:54:58.77852+00	2026-03-10 01:54:48.534849+00	ttomtpprcdp7	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1726	dnmnxpnxsuyx	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-10 01:25:19.778713+00	2026-03-10 02:25:09.373095+00	prtwi276nte4	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1701	v6hxh736ceuw	31cc7cef-c734-4a0d-8368-10440ee52424	t	2026-03-09 22:34:31.348592+00	2026-03-10 02:31:04.126644+00	\N	00cb2b22-8487-4330-a6c3-c7c5ba676f77
00000000-0000-0000-0000-000000000000	1753	enycxh6e6jfu	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-10 04:24:51.227665+00	2026-03-10 05:24:42.372126+00	ge7qmoajia5q	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1729	csjtbm66sd2q	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-10 01:54:48.552669+00	2026-03-10 01:54:48.681647+00	ifmmkxzuj4tg	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1759	plow7xndzuwp	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-10 04:54:18.333456+00	2026-03-10 05:54:09.118177+00	7ico2tqxt3hq	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	2105	fth42agvzsyz	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	f	2026-03-16 14:43:38.697656+00	2026-03-16 14:43:38.697656+00	\N	42c25c19-8977-4000-9aa3-f8fdfa92a20e
00000000-0000-0000-0000-000000000000	1823	mimifa73fchq	de1dc022-ea84-4098-9ac7-5952270495cb	t	2026-03-12 06:08:05.917047+00	2026-03-12 07:07:55.851123+00	\N	f08d5af8-1ea1-47c0-8a6d-54feec7a21d0
00000000-0000-0000-0000-000000000000	2106	yqqxsdul7aov	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	f	2026-03-16 14:44:01.086863+00	2026-03-16 14:44:01.086863+00	\N	dc212127-7abc-4da9-be47-44cd64f2cbe6
00000000-0000-0000-0000-000000000000	1958	oh45ktxisj3e	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 13:44:39.093831+00	2026-03-12 13:44:39.35515+00	nvp3y23qca5s	369a3098-ecca-4e8e-af5e-cfa56b4b32b3
00000000-0000-0000-0000-000000000000	1733	z47gnviex7lv	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-10 02:25:09.387504+00	2026-03-10 02:25:09.467443+00	dnmnxpnxsuyx	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	2107	c3vnznqus7gz	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	f	2026-03-16 14:44:24.706459+00	2026-03-16 14:44:24.706459+00	\N	c9d22ece-1f46-4fdb-b856-cbc751e9077e
00000000-0000-0000-0000-000000000000	1959	6hyar62qsgjv	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-12 13:44:39.356212+00	2026-03-12 13:51:13.930359+00	oh45ktxisj3e	369a3098-ecca-4e8e-af5e-cfa56b4b32b3
00000000-0000-0000-0000-000000000000	2108	aevtvtntoq6m	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-16 14:46:01.650647+00	2026-03-16 14:46:01.650647+00	\N	8791c31a-58a3-40ca-81e5-6d1a48b7ea4e
00000000-0000-0000-0000-000000000000	1984	l7h3fx47srcq	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	t	2026-03-13 12:16:43.986927+00	2026-03-13 12:16:44.381348+00	um3scksik5zb	6645979d-a485-44c9-94c8-2b87e081c735
00000000-0000-0000-0000-000000000000	2109	ejmtfvqslfxu	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-16 14:46:16.426901+00	2026-03-16 14:46:16.426901+00	\N	40b108ee-3c1b-42bc-80bc-563ef2f22f7c
00000000-0000-0000-0000-000000000000	1730	gpipizvk4pfh	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-10 01:54:48.68202+00	2026-03-10 02:54:38.404412+00	csjtbm66sd2q	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1985	b7vpi7lxy3d4	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	t	2026-03-13 12:16:44.381787+00	2026-03-13 13:16:35.646487+00	l7h3fx47srcq	6645979d-a485-44c9-94c8-2b87e081c735
00000000-0000-0000-0000-000000000000	1738	22iizyo6ks4k	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-10 02:54:38.426718+00	2026-03-10 02:54:38.571726+00	gpipizvk4pfh	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	2123	df5fqs7hebhu	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-17 06:56:21.227306+00	2026-03-17 06:56:21.227306+00	\N	2eec08a3-9d4c-48a2-8179-39617464f989
00000000-0000-0000-0000-000000000000	2024	3u6z7f2brmle	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-13 16:23:33.073459+00	2026-03-13 16:23:33.311698+00	yxmxs7zhpfpj	a599f3b1-cd36-49b9-adb8-0ffdfcb34bc8
00000000-0000-0000-0000-000000000000	2026	2eq24cbj6eo3	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-13 16:23:52.761135+00	2026-03-13 16:23:53.000827+00	koiv6cb4p46z	f9095374-8d70-4e81-8acd-9c5577aefd94
00000000-0000-0000-0000-000000000000	1734	qt3afgwjwrfn	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-10 02:25:09.467886+00	2026-03-10 03:25:00.179988+00	z47gnviex7lv	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1742	5f5s33t6p5sh	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-10 03:25:00.200317+00	2026-03-10 03:25:00.304756+00	qt3afgwjwrfn	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	2025	nj6g3i4txgmx	b3ec626f-8311-40ae-882f-4d67bfe75163	t	2026-03-13 16:23:33.312768+00	2026-03-14 16:23:23.667556+00	3u6z7f2brmle	a599f3b1-cd36-49b9-adb8-0ffdfcb34bc8
00000000-0000-0000-0000-000000000000	1735	vtnapjezn5b3	31cc7cef-c734-4a0d-8368-10440ee52424	t	2026-03-10 02:31:04.138269+00	2026-03-10 03:30:55.086665+00	v6hxh736ceuw	00cb2b22-8487-4330-a6c3-c7c5ba676f77
00000000-0000-0000-0000-000000000000	2027	7r2vj37unfe4	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-13 16:23:53.001259+00	2026-03-14 16:23:43.289805+00	2eq24cbj6eo3	f9095374-8d70-4e81-8acd-9c5577aefd94
00000000-0000-0000-0000-000000000000	1744	hpbdmsqio5tc	31cc7cef-c734-4a0d-8368-10440ee52424	t	2026-03-10 03:30:55.100833+00	2026-03-10 03:30:55.350188+00	vtnapjezn5b3	00cb2b22-8487-4330-a6c3-c7c5ba676f77
00000000-0000-0000-0000-000000000000	2061	cwnptthifop5	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-16 05:51:50.214226+00	2026-03-16 05:52:11.718565+00	orb3cvwhgetx	f1a85528-b800-4fb2-8252-3ff4fbf3d7d6
00000000-0000-0000-0000-000000000000	2062	3n7mwtleksct	9d84eef9-5c54-4a94-b69d-51e82faaee73	f	2026-03-16 05:52:11.719014+00	2026-03-16 05:52:11.719014+00	cwnptthifop5	f1a85528-b800-4fb2-8252-3ff4fbf3d7d6
00000000-0000-0000-0000-000000000000	1739	lc26sd2ok2rj	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-10 02:54:38.579226+00	2026-03-10 03:54:28.331169+00	22iizyo6ks4k	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1748	qwpzlir2zp46	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-10 03:54:28.350915+00	2026-03-10 03:54:28.520233+00	lc26sd2ok2rj	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1743	pu3yj4loalnt	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-10 03:25:00.305158+00	2026-03-10 04:24:51.089001+00	5f5s33t6p5sh	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1752	ge7qmoajia5q	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-10 04:24:51.107404+00	2026-03-10 04:24:51.226562+00	pu3yj4loalnt	4bf898db-9494-48c0-8668-84818d468175
00000000-0000-0000-0000-000000000000	1745	nymbwhkwclww	31cc7cef-c734-4a0d-8368-10440ee52424	t	2026-03-10 03:30:55.350563+00	2026-03-10 04:30:46.18793+00	hpbdmsqio5tc	00cb2b22-8487-4330-a6c3-c7c5ba676f77
00000000-0000-0000-0000-000000000000	1754	7upxfg5x5kcv	31cc7cef-c734-4a0d-8368-10440ee52424	t	2026-03-10 04:30:46.190178+00	2026-03-10 04:30:46.464135+00	nymbwhkwclww	00cb2b22-8487-4330-a6c3-c7c5ba676f77
00000000-0000-0000-0000-000000000000	1755	s66zxukv2qy5	31cc7cef-c734-4a0d-8368-10440ee52424	f	2026-03-10 04:30:46.466052+00	2026-03-10 04:30:46.466052+00	7upxfg5x5kcv	00cb2b22-8487-4330-a6c3-c7c5ba676f77
00000000-0000-0000-0000-000000000000	1749	4xiyg37ycmsw	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-10 03:54:28.52067+00	2026-03-10 04:54:18.210711+00	qwpzlir2zp46	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
00000000-0000-0000-0000-000000000000	1758	7ico2tqxt3hq	9d84eef9-5c54-4a94-b69d-51e82faaee73	t	2026-03-10 04:54:18.223713+00	2026-03-10 04:54:18.332322+00	4xiyg37ycmsw	ab77b6d0-c114-42e0-b1d0-4ed68cf633d5
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
20240729123726
20240802193726
20240806073726
20241009103726
20250717082212
20250731150234
20250804100000
20250901200500
20250903112500
20250904133000
20250925093508
20251007112900
20251104100000
20251111201300
20251201000000
20260115000000
20260121000000
20260219120000
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag, oauth_client_id, refresh_token_hmac_key, refresh_token_counter, scopes) FROM stdin;
14d6533f-6b13-4778-aa08-aefafd966f89	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-02-25 06:24:38.412018+00	2026-02-25 06:24:38.412018+00	\N	aal1	\N	\N	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	103.178.154.22	\N	\N	\N	\N	\N
ab77b6d0-c114-42e0-b1d0-4ed68cf633d5	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-06 07:09:10.288243+00	2026-03-10 06:54:00.608385+00	\N	aal1	\N	2026-03-10 06:54:00.608289	python-httpx/0.28.1	159.65.79.222	\N	\N	\N	\N	\N
7838f368-8084-4ae6-bbe0-df7735fd5f40	b3ec626f-8311-40ae-882f-4d67bfe75163	2026-03-12 12:32:13.363975+00	2026-03-12 12:38:02.441627+00	\N	aal1	\N	2026-03-12 12:38:02.441538	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
64a936b5-a4e9-4a98-888e-8c51e00ad2d9	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-12 13:12:38.202051+00	2026-03-12 13:16:51.814229+00	\N	aal1	\N	2026-03-12 13:16:51.814142	python-httpx/0.28.1	103.178.154.241	\N	\N	\N	\N	\N
e2b8cea9-e8ca-40a3-abf3-737adf3cc15e	de1dc022-ea84-4098-9ac7-5952270495cb	2026-03-12 12:53:43.884117+00	2026-03-12 12:56:16.236051+00	\N	aal1	\N	2026-03-12 12:56:16.235852	python-httpx/0.28.1	103.250.188.226	\N	\N	\N	\N	\N
c17f9510-5994-4e2b-b1da-36647b5afa7a	73692819-0476-4078-9ee9-f66d9b60ed5f	2026-02-17 13:52:33.943367+00	2026-02-17 13:52:33.943367+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	49.36.35.70	\N	\N	\N	\N	\N
7a2b42a4-e780-46a9-a956-84750183871d	de1dc022-ea84-4098-9ac7-5952270495cb	2026-03-10 09:55:48.962897+00	2026-03-10 09:59:09.30225+00	\N	aal1	\N	2026-03-10 09:59:09.302165	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
aac3f3c5-35f3-441a-8ac9-40b7cdb2a335	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-02-25 06:54:42.335982+00	2026-02-25 09:54:12.941696+00	\N	aal1	\N	2026-02-25 09:54:12.941607	python-httpx/0.28.1	159.65.79.222	\N	\N	\N	\N	\N
960e465f-091a-4dcb-9ea6-5db284f0ddd4	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-10 12:48:06.906626+00	2026-03-10 12:48:56.508574+00	\N	aal1	\N	2026-03-10 12:48:56.508483	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
09c000ef-b3e9-4729-bfdd-45f3f21578e7	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-02-25 06:25:05.00495+00	2026-02-25 10:24:28.89807+00	\N	aal1	\N	2026-02-25 10:24:28.897978	python-httpx/0.28.1	159.65.79.222	\N	\N	\N	\N	\N
73c7192e-65b8-47bd-b0e7-2ee5a05b6999	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-02-25 06:53:57.955964+00	2026-02-25 10:53:22.628813+00	\N	aal1	\N	2026-02-25 10:53:22.628726	python-httpx/0.28.1	159.65.79.222	\N	\N	\N	\N	\N
00cb2b22-8487-4330-a6c3-c7c5ba676f77	31cc7cef-c734-4a0d-8368-10440ee52424	2026-03-09 22:34:31.34755+00	2026-03-10 04:30:46.471278+00	\N	aal1	\N	2026-03-10 04:30:46.471177	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
b0b89ab2-4c88-4109-833e-f0d825d46b6f	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-02-25 10:22:48.757514+00	2026-02-25 14:35:50.431847+00	\N	aal1	\N	2026-02-25 14:35:50.431755	python-httpx/0.28.1	159.65.79.222	\N	\N	\N	\N	\N
a8d24ea5-ad85-48ee-889a-a0e3ba2e1ed5	de1dc022-ea84-4098-9ac7-5952270495cb	2026-03-13 10:31:52.818952+00	2026-03-15 16:30:32.43442+00	\N	aal1	\N	2026-03-15 16:30:32.434333	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
f8e0f6bf-bbce-4446-a7f9-f5accd4cbe07	b3ec626f-8311-40ae-882f-4d67bfe75163	2026-03-12 12:25:37.426711+00	2026-03-12 12:30:37.666305+00	\N	aal1	\N	2026-03-12 12:30:37.666215	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
6979dd2c-d884-47f5-a5e2-2cbc1c43db92	de1dc022-ea84-4098-9ac7-5952270495cb	2026-03-12 13:08:30.547894+00	2026-03-12 13:16:53.948258+00	\N	aal1	\N	2026-03-12 13:16:53.94758	python-httpx/0.28.1	103.178.154.241	\N	\N	\N	\N	\N
75ca43a6-3288-419b-8743-8f219c42fd74	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-10 12:49:52.515252+00	2026-03-10 12:51:31.555808+00	\N	aal1	\N	2026-03-10 12:51:31.555705	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
7f04795e-6ce1-4eba-a779-cf8e0454b8a0	de1dc022-ea84-4098-9ac7-5952270495cb	2026-03-11 11:47:41.657119+00	2026-03-11 11:47:41.657119+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
2d9f5844-63d2-401b-ab51-a30d1e8d0051	31cc7cef-c734-4a0d-8368-10440ee52424	2026-03-09 22:34:02.687839+00	2026-03-09 22:34:02.687839+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.2 Mobile/15E148 Safari/604.1	208.70.98.128	\N	\N	\N	\N	\N
430d614f-05af-4e7d-bc10-ed6b213807c2	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-02-26 05:55:49.966111+00	2026-02-28 05:48:07.223682+00	\N	aal1	\N	2026-02-28 05:48:07.223576	python-httpx/0.28.1	159.65.79.222	\N	\N	\N	\N	\N
6645979d-a485-44c9-94c8-2b87e081c735	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	2026-03-13 11:16:54.56236+00	2026-03-15 16:15:50.215599+00	\N	aal1	\N	2026-03-15 16:15:50.215502	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
705d8bf4-2351-4806-a7bd-f91650184c28	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-02-26 05:57:07.111743+00	2026-02-28 05:49:19.533681+00	\N	aal1	\N	2026-02-28 05:49:19.532968	python-httpx/0.28.1	159.65.79.222	\N	\N	\N	\N	\N
d6b1b72a-ded3-41b4-a0da-82ffbdabce7b	de1dc022-ea84-4098-9ac7-5952270495cb	2026-03-11 14:16:01.240796+00	2026-03-12 05:13:42.604642+00	\N	aal1	\N	2026-03-12 05:13:42.604544	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
04d04a5e-46f3-427f-97f5-5c68da109875	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-02-26 05:57:20.723238+00	2026-02-28 05:49:20.57422+00	\N	aal1	\N	2026-02-28 05:49:20.574133	python-httpx/0.28.1	159.65.79.222	\N	\N	\N	\N	\N
c0631152-39aa-44c7-bca5-d5dd0cdc1fb7	b3ec626f-8311-40ae-882f-4d67bfe75163	2026-03-12 06:13:24.024556+00	2026-03-12 06:13:24.024556+00	\N	aal1	\N	\N	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	103.250.188.226	\N	\N	\N	\N	\N
f6535a4f-66f8-4753-ac40-c609ec6ea7e3	31cc7cef-c734-4a0d-8368-10440ee52424	2026-03-09 22:59:14.111747+00	2026-03-09 22:59:14.111747+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
94c0e373-07a9-4a67-bdbe-7f685de4a677	de1dc022-ea84-4098-9ac7-5952270495cb	2026-03-10 05:25:43.720812+00	2026-03-10 05:25:43.720812+00	\N	aal1	\N	\N	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	103.178.154.241	\N	\N	\N	\N	\N
4c3628d5-5880-421c-9f67-4d3eba53b35a	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-02-26 05:58:05.263333+00	2026-02-28 05:50:01.398789+00	\N	aal1	\N	2026-02-28 05:50:01.398698	python-httpx/0.28.1	159.65.79.222	\N	\N	\N	\N	\N
323c06f6-5104-4602-9dd4-b87878ae4ef8	de1dc022-ea84-4098-9ac7-5952270495cb	2026-03-12 13:32:53.966704+00	2026-03-12 15:32:34.785659+00	\N	aal1	\N	2026-03-12 15:32:34.785566	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
f08d5af8-1ea1-47c0-8a6d-54feec7a21d0	de1dc022-ea84-4098-9ac7-5952270495cb	2026-03-12 06:08:05.884204+00	2026-03-12 07:07:56.215433+00	\N	aal1	\N	2026-03-12 07:07:56.21531	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
427878d3-9ec9-4a92-b522-26ed6216f653	de1dc022-ea84-4098-9ac7-5952270495cb	2026-03-12 13:08:15.568519+00	2026-03-12 13:18:15.795176+00	\N	aal1	\N	2026-03-12 13:18:15.79507	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
f9095374-8d70-4e81-8acd-9c5577aefd94	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-13 13:24:22.949361+00	2026-03-15 16:23:33.060564+00	\N	aal1	\N	2026-03-15 16:23:33.059855	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
4bf898db-9494-48c0-8668-84818d468175	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-03 13:49:05.845791+00	2026-03-10 06:24:33.051185+00	\N	aal1	\N	2026-03-10 06:24:33.051075	python-httpx/0.28.1	159.65.79.222	\N	\N	\N	\N	\N
2baa7522-47ad-4746-86f1-990dbee6a943	de1dc022-ea84-4098-9ac7-5952270495cb	2026-03-12 12:39:50.803118+00	2026-03-12 12:44:03.393885+00	\N	aal1	\N	2026-03-12 12:44:03.39375	python-httpx/0.28.1	103.250.188.226	\N	\N	\N	\N	\N
143ea540-aa08-455e-90b9-303f7303a177	31cc7cef-c734-4a0d-8368-10440ee52424	2026-03-11 02:17:38.409116+00	2026-03-16 10:33:41.825634+00	\N	aal1	\N	2026-03-16 10:33:41.824976	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
6d59bfe4-37df-4293-a541-2b00817e51a3	de1dc022-ea84-4098-9ac7-5952270495cb	2026-03-12 12:48:18.219167+00	2026-03-12 12:48:18.219167+00	\N	aal1	\N	\N	python-httpx/0.28.1	103.250.188.226	\N	\N	\N	\N	\N
f9d13ec4-2c89-4c6b-9e6b-8b29ccc935a1	b3ec626f-8311-40ae-882f-4d67bfe75163	2026-03-12 08:22:32.725424+00	2026-03-12 12:21:56.374379+00	\N	aal1	\N	2026-03-12 12:21:56.374286	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
0b65d8f7-602e-4ac4-ba24-1251ee3ed0bd	de1dc022-ea84-4098-9ac7-5952270495cb	2026-03-13 09:42:54.485514+00	2026-03-13 09:47:45.231061+00	\N	aal1	\N	2026-03-13 09:47:45.230961	python-httpx/0.28.1	103.250.188.226	\N	\N	\N	\N	\N
0c2a79fb-dd85-4361-be70-e2edd6677932	de1dc022-ea84-4098-9ac7-5952270495cb	2026-03-13 09:53:18.963244+00	2026-03-13 09:53:18.963244+00	\N	aal1	\N	\N	python-httpx/0.28.1	103.178.154.103	\N	\N	\N	\N	\N
369a3098-ecca-4e8e-af5e-cfa56b4b32b3	b3ec626f-8311-40ae-882f-4d67bfe75163	2026-03-12 12:41:29.476528+00	2026-03-12 13:44:39.362399+00	\N	aal1	\N	2026-03-12 13:44:39.362297	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
b7843ba2-e005-42ec-9369-8e478b7c2993	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-13 10:15:03.502286+00	2026-03-13 10:15:03.502286+00	\N	aal1	\N	\N	python-httpx/0.28.1	103.250.188.226	\N	\N	\N	\N	\N
221cc649-f65b-432a-96a1-62d81cdc2997	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-16 13:07:22.399906+00	2026-03-16 13:07:22.399906+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
af40f740-4519-4492-b301-c675eac0ef94	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-12 13:14:59.232579+00	2026-03-12 13:16:39.89046+00	\N	aal1	\N	2026-03-12 13:16:39.890374	python-httpx/0.28.1	103.250.188.226	\N	\N	\N	\N	\N
3db1a5a4-5d7e-4cea-9370-d95f1a142867	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	2026-03-13 11:15:03.71399+00	2026-03-13 11:15:03.71399+00	\N	aal1	\N	\N	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	103.178.154.103	\N	\N	\N	\N	\N
58c090c6-d4ea-4c6c-9f88-1e2cd9879ed8	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-13 13:17:18.043195+00	2026-03-15 16:16:29.742209+00	\N	aal1	\N	2026-03-15 16:16:29.7421	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
ec552c3f-10bd-42f6-9b4f-0e6c03e9a1c8	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-13 10:27:48.657354+00	2026-03-15 16:26:29.950037+00	\N	aal1	\N	2026-03-15 16:26:29.949921	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
f1a85528-b800-4fb2-8252-3ff4fbf3d7d6	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-13 05:49:35.819141+00	2026-03-16 05:52:11.722532+00	\N	aal1	\N	2026-03-16 05:52:11.72244	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
a599f3b1-cd36-49b9-adb8-0ffdfcb34bc8	b3ec626f-8311-40ae-882f-4d67bfe75163	2026-03-12 12:24:23.943515+00	2026-03-15 16:23:14.18405+00	\N	aal1	\N	2026-03-15 16:23:14.183956	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
8b7f6a48-e7bc-4d2b-bf22-894d1496d736	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-16 13:07:45.216902+00	2026-03-16 13:07:45.216902+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
d0e0f19d-188f-4212-8f7e-1e076d133aab	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-16 13:08:13.927984+00	2026-03-16 13:08:13.927984+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
7ae03a97-66dd-4c9a-9956-343e7d888416	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-16 13:08:24.145005+00	2026-03-16 13:08:24.145005+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
b7ac13b6-634a-44c4-b221-9998b690ddba	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-16 13:08:50.806867+00	2026-03-16 13:08:50.806867+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
06526c35-f388-4ab0-8f80-40d939e449b0	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-16 13:09:04.669451+00	2026-03-16 13:09:04.669451+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
dcfe4b0b-7fa1-4316-8dba-df7db68a6c6b	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-16 13:17:42.142393+00	2026-03-16 13:17:42.142393+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
c217fe4b-481a-4fca-8691-8789a695de9e	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-16 12:49:57.498579+00	2026-03-17 12:49:47.033124+00	\N	aal1	\N	2026-03-17 12:49:47.033016	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
f3d3f100-c557-4c47-a999-eac60c0b0fef	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	2026-03-16 12:52:02.702541+00	2026-03-17 12:51:52.517589+00	\N	aal1	\N	2026-03-17 12:51:52.517491	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
6e3dc2c8-8904-4622-a1f5-b6d196da73e1	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-16 13:06:47.299735+00	2026-03-17 13:06:38.202913+00	\N	aal1	\N	2026-03-17 13:06:38.202822	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
81c406e3-e83b-49b6-a6ff-cb36b2e258aa	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-16 13:25:51.339116+00	2026-03-16 13:25:51.339116+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
fd2bdc72-baaf-421e-b32b-f99142111e00	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-16 13:26:13.060936+00	2026-03-16 13:26:13.060936+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
94a8ad15-ad23-4060-b8f0-ac82459aa3bb	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-16 13:57:23.313205+00	2026-03-16 13:57:23.313205+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
783405cc-a0f9-413c-941b-4b260c298cc7	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	2026-03-16 13:57:31.840163+00	2026-03-16 13:57:31.840163+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
969e7a8f-4493-4901-bb13-1022579fe89c	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-16 14:04:13.273719+00	2026-03-16 14:04:13.273719+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
b9fd47f5-face-4c6a-b72a-4c9b490db883	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-16 14:13:50.930598+00	2026-03-16 14:13:50.930598+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
83515b35-df88-4ffb-9b9a-ee91b9a277dd	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-16 14:14:13.19663+00	2026-03-16 14:14:13.19663+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
a20299bb-5c06-46ef-bb3e-3ea7f1b46d9d	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-16 14:15:08.912476+00	2026-03-16 14:15:08.912476+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
dd19bc5b-fbbc-44d2-b308-8b528d5960cd	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-16 14:17:34.741622+00	2026-03-16 14:17:34.741622+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
cf33d9d9-a57a-493e-8e8a-d626a049ffb0	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-16 14:18:16.741884+00	2026-03-16 14:18:16.741884+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
ad1d521a-b557-4097-84ec-e003ca0bf04f	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-16 14:18:35.617174+00	2026-03-16 14:18:35.617174+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
cbc2276d-2d2a-4d91-9240-1aa118db0e7a	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-16 14:18:44.799662+00	2026-03-16 14:18:44.799662+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
286dffae-e9c1-4aee-b383-19f79f0b1862	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-16 14:19:04.876546+00	2026-03-16 14:19:04.876546+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
3737d488-4e06-43c4-942a-f8d4cadeb0ec	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-16 14:19:32.3338+00	2026-03-16 14:19:32.3338+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
edf3d02f-6b80-4951-8b25-4d0ca99ac201	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-16 14:19:42.00289+00	2026-03-16 14:19:42.00289+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
be807c25-4770-4b8e-96e6-f9ece08ee981	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-16 14:21:15.598676+00	2026-03-16 14:21:15.598676+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
e44dbf56-e23c-4fe5-b07a-3c9eb3239a55	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-16 14:21:25.217838+00	2026-03-16 14:21:25.217838+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
c71fe324-eaa0-4ef5-81c3-928d90846dab	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-16 14:21:37.534373+00	2026-03-16 14:21:37.534373+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
a95968aa-11db-4854-b7f6-dea052199221	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	2026-03-16 14:22:29.610361+00	2026-03-16 14:22:29.610361+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
e7f4d24a-b4d9-4274-a2b7-dbc6c7ce4544	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	2026-03-16 14:23:28.911661+00	2026-03-16 14:23:28.911661+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
fa75b30c-6baf-43ca-aa62-3c7a5f3319be	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	2026-03-16 14:26:55.866546+00	2026-03-16 14:26:55.866546+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
dd3232d0-d00a-49eb-bd28-3be2389c7da9	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	2026-03-16 14:28:55.351617+00	2026-03-16 14:28:55.351617+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
eda374e2-2643-490e-86b6-04f5f84c0c7d	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-16 14:29:25.897524+00	2026-03-16 14:29:25.897524+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
e4d57708-a049-48cb-aab0-afcc7524fe67	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	2026-03-16 14:32:30.462274+00	2026-03-16 14:32:30.462274+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
d5b9f541-c734-45a9-aa7b-f65b3dc2f999	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	2026-03-16 14:32:40.098466+00	2026-03-16 14:32:40.098466+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
77388399-7030-4b18-ad54-1c95bf143f4d	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	2026-03-16 14:37:26.157745+00	2026-03-16 14:37:26.157745+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
bc52457b-059b-4568-88e0-294b8507f512	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	2026-03-16 14:38:14.931927+00	2026-03-16 14:38:14.931927+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
361f58b8-2354-40c2-9afd-bc72eaf5f989	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	2026-03-16 14:41:25.378169+00	2026-03-16 14:41:25.378169+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
42c25c19-8977-4000-9aa3-f8fdfa92a20e	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	2026-03-16 14:43:38.695882+00	2026-03-16 14:43:38.695882+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
dc212127-7abc-4da9-be47-44cd64f2cbe6	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	2026-03-16 14:44:01.085797+00	2026-03-16 14:44:01.085797+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
c9d22ece-1f46-4fdb-b856-cbc751e9077e	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	2026-03-16 14:44:24.694884+00	2026-03-16 14:44:24.694884+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
8791c31a-58a3-40ca-81e5-6d1a48b7ea4e	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-16 14:46:01.648248+00	2026-03-16 14:46:01.648248+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
40b108ee-3c1b-42bc-80bc-563ef2f22f7c	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-16 14:46:16.425242+00	2026-03-16 14:46:16.425242+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
ea7e60fa-6f47-4af4-93ec-bb55e33bacd8	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	2026-03-16 14:49:38.925573+00	2026-03-16 14:49:38.925573+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
01dba73f-06fe-4468-9a2c-ac0fbeb9fb7b	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	2026-03-16 14:50:05.491862+00	2026-03-16 14:50:05.491862+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
ecde64c5-5000-4a63-8c68-5a29b4309504	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	2026-03-16 14:50:50.154533+00	2026-03-16 14:50:50.154533+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
3e47d78b-a684-4df5-9def-ac751bb9258c	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	2026-03-16 14:51:11.533486+00	2026-03-16 14:51:11.533486+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
8040ad87-317d-4fc4-b404-3077b9f201c0	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-16 14:52:50.466796+00	2026-03-16 14:52:50.466796+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
982e6aea-ff50-467b-a0fd-666a0e409676	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-16 14:53:06.513902+00	2026-03-16 14:53:06.513902+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
26270d4f-b54c-452a-8542-5ff15d904552	31cc7cef-c734-4a0d-8368-10440ee52424	2026-03-16 23:45:08.084486+00	2026-03-16 23:45:08.084486+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
a885836c-a458-448b-ae7d-8a1d81bbe2f3	31cc7cef-c734-4a0d-8368-10440ee52424	2026-03-16 23:57:45.774139+00	2026-03-16 23:57:45.774139+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
8266ae1e-87fc-4bb5-b42e-129a54840f1e	31cc7cef-c734-4a0d-8368-10440ee52424	2026-03-17 01:09:25.494439+00	2026-03-17 01:09:25.494439+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
7bca6717-1ef5-49dc-80ca-5c9955ec0cad	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-17 05:19:53.697253+00	2026-03-17 05:19:53.697253+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
bc48fb1a-456c-45ad-9b12-372f206ee36b	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-17 05:53:01.421687+00	2026-03-17 05:53:01.421687+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
a5589dff-fa8e-4235-974f-e60a34e03274	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	2026-03-17 05:55:09.93868+00	2026-03-17 05:55:09.93868+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
18acca89-2d20-4734-acf5-c6be501b667d	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	2026-03-16 14:27:06.623183+00	2026-03-17 06:50:15.607241+00	\N	aal1	\N	2026-03-17 06:50:15.607121	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
2eec08a3-9d4c-48a2-8179-39617464f989	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-17 06:56:21.180302+00	2026-03-17 06:56:21.180302+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
76b5b158-6487-4116-ac3f-58f65811dc50	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-17 09:58:47.703776+00	2026-03-17 09:58:47.703776+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
4e24a45b-5ba6-4a9e-85b0-933c2da6497c	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-17 10:00:33.130988+00	2026-03-17 10:00:33.130988+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
9953ffca-1350-4826-ac27-5c2b32f0e9af	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-17 10:48:54.382197+00	2026-03-17 10:48:54.382197+00	\N	aal1	\N	\N	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
dc14b904-2e11-495e-ba6a-5a34d37eb128	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026-03-16 12:49:35.260515+00	2026-03-17 12:49:25.995815+00	\N	aal1	\N	2026-03-17 12:49:25.995732	python-httpx/0.28.1	16.170.47.133	\N	\N	\N	\N	\N
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at, disabled) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
00000000-0000-0000-0000-000000000000	b3ec626f-8311-40ae-882f-4d67bfe75163	authenticated	authenticated	demoemail7564@gmail.com	$2a$10$.LhqCqy0yM1NpTHq8of7P.V7Du/4odhd9hwSzVN5JG5TYEhcpN6v2	2026-03-12 06:13:24.019724+00	\N		2026-03-12 06:12:51.13464+00		\N			\N	2026-03-12 12:41:29.476439+00	{"provider": "email", "providers": ["email"]}	{"sub": "b3ec626f-8311-40ae-882f-4d67bfe75163", "name": "Jatin Test", "year": "freshman", "email": "demoemail7564@gmail.com", "major": "Engineering", "university_id": "296f159b-5540-4b59-8409-f5bf9f8d6c1e", "email_verified": true, "phone_verified": false, "university_name": "Florida State University"}	\N	2026-03-12 06:12:51.054142+00	2026-03-15 16:23:14.182801+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	73692819-0476-4078-9ee9-f66d9b60ed5f	authenticated	authenticated	swapnil@logisticinfotech.co.in	$2a$10$36CUQSVUWHHTuHs409f62u.HSMod5JR2U14yhgTfZ9d7Hs8nhH/Qu	2026-02-17 13:52:33.934488+00	2026-01-19 14:35:51.343604+00		\N		\N			\N	2026-02-17 13:52:33.943261+00	{"provider": "email", "providers": ["email"]}	{"email_verified": true}	\N	2026-01-19 14:35:51.30409+00	2026-02-17 13:52:33.96825+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	31cc7cef-c734-4a0d-8368-10440ee52424	authenticated	authenticated	ohre255@gmail.com	$2a$10$fn9rDn5zboPNZyoIgEbWtep/zuiCw4/D.3QIg3nAwoXO8D/sQ0NpO	2026-03-09 22:34:02.682718+00	\N		2026-03-09 22:32:19.459961+00		\N			\N	2026-03-17 01:09:25.494346+00	{"provider": "email", "providers": ["email"]}	{"sub": "31cc7cef-c734-4a0d-8368-10440ee52424", "name": "AA", "year": "freshman", "email": "ohre255@gmail.com", "major": "biology", "minor": "finance", "university_id": "db3845d2-5679-4d84-9856-8ff2c82edc4e", "email_verified": true, "phone_verified": false, "university_name": "University of Cincinnati"}	\N	2026-03-09 22:32:19.435182+00	2026-03-17 01:09:25.582348+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	authenticated	authenticated	coxowe9564@faxzu.com	$2a$10$m8E4hOWsyAf5uaOpZZx/JOfjUuGg9bxB/izCtoEXB53gUCXV0LKOu	2026-03-13 11:15:03.633144+00	\N		2026-03-13 11:14:40.502769+00		\N			\N	2026-03-17 05:55:09.938591+00	{"provider": "email", "providers": ["email"]}	{"sub": "0dc711bb-e6c7-47e3-9245-be65bb8d1e11", "name": "test_reward", "year": "freshman", "email": "coxowe9564@faxzu.com", "minor": "Computer Science", "university_id": "296f159b-5540-4b59-8409-f5bf9f8d6c1e", "email_verified": true, "phone_verified": false, "university_name": "Florida State University"}	\N	2026-03-13 11:14:40.43467+00	2026-03-17 12:51:52.515678+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	9d84eef9-5c54-4a94-b69d-51e82faaee73	authenticated	authenticated	riyasindhav2003@gmail.com	$2a$10$EaOhPm00CiKJHkwgYOjmuOSD5tXrvD1qePfRWyouQ.iuorK0O76h2	2026-02-25 06:02:53.196679+00	\N		\N		\N			\N	2026-03-17 10:48:54.380509+00	{"provider": "email", "providers": ["email"]}	{"sub": "9d84eef9-5c54-4a94-b69d-51e82faaee73", "name": "wede", "year": "sophomore", "email": "riyasindhav2003@gmail.com", "minor": "sdfc", "university_id": "296f159b-5540-4b59-8409-f5bf9f8d6c1e", "email_verified": true, "phone_verified": false, "university_name": "Florida State University"}	\N	2026-02-25 06:01:57.170609+00	2026-03-17 13:06:38.201652+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	de1dc022-ea84-4098-9ac7-5952270495cb	authenticated	authenticated	jatinsanchaniya9122@gmail.com	$2a$10$di96ctSfGcThLnVR9LobW.1zwg2Kkq3K4PdjfAl4Vfxopo3jVIjbW	2026-03-10 05:25:43.711668+00	\N		2026-03-10 05:25:29.405801+00		\N			\N	2026-03-13 10:31:52.818856+00	{"provider": "email", "providers": ["email"]}	{"sub": "de1dc022-ea84-4098-9ac7-5952270495cb", "name": "Jatin", "year": "freshman", "email": "jatinsanchaniya9122@gmail.com", "major": "Engineering", "university_id": "db3845d2-5679-4d84-9856-8ff2c82edc4e", "email_verified": true, "phone_verified": false, "university_name": "University of Cincinnati"}	\N	2026-03-10 05:18:20.279713+00	2026-03-15 16:30:32.433153+00	\N	\N			\N		0	\N		\N	f	\N	f
\.


--
-- Data for Name: ad_stats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ad_stats (id, user_id, total_ads, unclaimed_ads, free_months_from_ads, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: answer_ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.answer_ratings (id, user_id, chat_id, message_id, rating, created_at, processed, content_hash) FROM stdin;
28a1892d-4a9b-4e2c-857c-962a25b2b09d	31cc7cef-c734-4a0d-8368-10440ee52424	6c3f7c1e-bcd5-4630-99e5-f7602bc9030b	8451d1af-9a2f-46f0-a4d5-cdbaa0427f13	9	2026-03-09 22:40:46.230192+00	t	f483e7b422772b8bc141b30362b4bf5253c398313cf217cac29712f445d5bf20
65c0e647-fe87-4744-8cf7-3e220780800c	31cc7cef-c734-4a0d-8368-10440ee52424	7bac37d2-99c7-4a8a-b369-6ee27f8cbf54	0f9bc1f8-8c16-4940-bb14-1d54cfeb080c	9	2026-03-09 23:08:16.819403+00	t	0e08421e71cc6bef7a1f8242f85c4efb913319e45a4721e4452afcf37ed6ca20
ea66df2a-c946-4ffb-8d40-7f7641f18c03	31cc7cef-c734-4a0d-8368-10440ee52424	06692b0d-b228-4c8f-8225-97b8c06d44e5	fa977515-5e78-4213-b5c9-96bb77f0fcea	5	2026-03-12 00:15:41.292746+00	f	80b47ee22beb9b83351478abb1bf94d23e585e6f2662d29e1f55762e69cad5dc
5c72789f-d95b-4462-9a15-0a35625ef322	31cc7cef-c734-4a0d-8368-10440ee52424	06692b0d-b228-4c8f-8225-97b8c06d44e5	f1e64f2c-cea5-41ed-ad6a-1863946fe768	2	2026-03-12 00:56:08.030687+00	f	21322dfce59e6417e233215686249f263dbe8cb4348cf3e8d30b56da670b1ec0
1df95a7a-0783-4d71-ae22-f6fd2580baf2	de1dc022-ea84-4098-9ac7-5952270495cb	60289ebb-4626-45a6-8ee0-1121009eec7d	56995847-bece-4e2d-9311-d8c02673ebed	5	2026-03-13 09:56:37.965626+00	f	14fa3b5c6ac9ed496b66e7219683d0e755b6b4a477171736631b889481bcb3d6
8f2f6599-0001-4b42-88a4-7147a71510cd	31cc7cef-c734-4a0d-8368-10440ee52424	df9f023a-0ffe-46e8-bee7-6c6932e7f148	1abad6d1-94a6-42dd-8608-e38b578431e9	5	2026-03-16 23:47:18.975873+00	f	67b37a1a6e010965342c806100b9635e40bad183103096c21cef1a379e13b6d8
\.


--
-- Data for Name: best_of_materials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.best_of_materials (id, subject, topic, summary_text, sample_questions, study_tips, quality_score, embedding, last_updated, created_at) FROM stdin;
4469cdef-a12b-473c-bf66-b9bb49d4839d	Computer Science	Machine Learning	Machine learning (ML) is a branch of AI where computers learn patterns from data to make predictions or decisions without explicit programming. Models train on examples, like recognizing cats from labeled images. Key types: Supervised (labeled data, e.g., spam detection), Unsupervised (patterns, e.g., customer grouping), Reinforcement (trial/error, e.g., game AI). Core process: Data → Preprocess → Train (e.g., linear regression, neural nets) → Test → Deploy. Tools: Python libraries like scikit-learn, TensorFlow—ideal for CS projects.	["What's the difference between overfitting and underfitting in ML? (Overfitting: model memorizes training data too well, fails on new data. Underfitting: too simple, misses patterns.)", "Given a dataset of house sizes and prices, how would you use linear regression to predict price for a 2000 sq ft house? (Fit line y = mx + b; train on data points.)", "Explain how a decision tree works for classifying engine failures from sensor data. (Splits data by features like temp/pressure until pure classes.)"]	Mini Study Plan (1 Week):\n1. Day 1-2: Watch free Khan Academy/YouTube intros (search 'machine learning basics Andrew Ng').\n2. Day 3-4: Code simple regression in Google Colab—try Iris dataset classification.\n3. Day 5: Quiz yourself with samples; debug errors.\n4. Day 6-7: Apply to a tiny project (e.g., predict grades from study hours) and discuss in CS office hours.	9	[-0.015140025,0.01069028,-0.008596296,-0.06004155,-0.02097429,0.014608889,-0.00033874958,-0.0050175656,0.0027979396,0.024450492,-0.0056306287,-0.00986479,-0.0046224035,0.021613853,0.14665978,-0.015116274,-0.007900489,-0.005543756,0.01319652,-0.022959715,0.0004644859,0.0052415743,-0.0069641145,-0.015598185,-0.029987829,-0.012541897,0.008424703,0.019005004,0.03427522,-0.0137618175,-0.01502227,0.018154867,0.01161661,0.026462734,-0.030738216,1.6723412e-05,-0.0062929983,-0.0030256293,0.035176326,0.004752667,-0.0013964027,-0.020679494,0.0032592192,-0.004077364,0.015739892,0.023205448,0.002558576,-0.0155558875,-0.020961925,0.009341191,-0.0073210895,0.013606001,-0.005800738,-0.22211704,0.019047184,-0.008931735,-0.00579215,0.0008003698,0.021900106,0.0008886161,-0.014634752,0.009954877,0.00031188197,0.004075539,0.02010154,-0.027458072,0.029491905,-0.012835895,-0.01358977,-0.009330212,0.0082188165,0.0069120084,0.012377284,-0.01102017,-0.013605225,-0.01159471,0.009228545,0.01613149,-0.0093231,0.03568389,-0.0025600626,-0.008927632,0.005207308,-0.03035837,-0.009660558,0.014587809,-0.02147243,-0.011450465,0.0058542322,-0.0064086113,0.028961489,0.008509292,0.021758808,-0.001553779,-0.0026745747,-0.0011645993,-0.024093334,0.0075424924,0.009628486,-0.003348989,-0.008844529,-0.026612427,-0.0069102864,-0.030004939,-0.020892663,-0.018869217,0.013612289,-0.0295555,-0.009895304,0.001891224,0.008326988,-0.013358328,0.007436072,0.022166252,-0.0059003057,-0.19397122,-0.0056226132,0.00052363187,-0.00830747,-0.0043516546,0.004868163,0.011750153,0.014210818,0.015082916,0.01662122,-0.0016612579,0.013248133,-0.011941908,0.009845336,-0.0031578834,-0.014731749,-0.008679117,-0.0074900403,-0.013899909,0.006080854,0.018283812,-0.025225127,-0.013210591,0.015727649,-0.008680456,-0.01012235,0.008932577,-0.001044552,0.0005884205,-0.0028422894,-0.012821933,-0.028949503,0.012600559,0.007512561,-0.010311789,0.01665515,-0.009493699,-0.007664637,-0.008148301,0.006699759,-0.01786014,-0.024045408,0.013649358,-0.011671184,0.011348197,0.00080254726,-0.008022933,-0.0039414926,0.011745227,-0.01934987,0.01151494,0.005682202,0.01997478,-0.0019406715,0.015280192,0.013126565,-0.004986123,-0.017467553,0.010163733,0.0008105881,-0.024327097,-0.006172822,0.019843102,0.021707041,-0.033347905,0.0076890066,0.012566396,-0.000782329,0.004984536,-0.00627632,-0.007605902,0.0028012013,0.009384316,0.024567364,0.011976984,-0.007982228,-0.0075805876,0.021027522,-0.012783456,0.00945213,-0.009282881,0.0038455299,-0.009066885,-0.006681538,0.008987508,0.00861072,-0.020129079,0.00831468,-0.011453267,-0.0030974986,-0.010006492,-0.009930363,0.002925193,0.016136348,-0.0051417765,-0.0102493195,0.007417133,-0.0051329546,-0.0021868583,0.019684866,-0.007911074,-0.006626615,-0.024406092,-0.0012740162,-0.0069168285,-0.002374622,0.016326662,0.012342876,0.010336585,0.001020314,-0.011026179,-0.0042586736,-0.023717964,0.00067143515,-0.015551438,-0.00081399194,0.011693212,-0.021220287,0.016013011,0.012347852,-0.0025616414,-0.011383176,0.03377681,0.006355455,-0.007629244,-0.015734479,-0.00045322094,0.0074029616,0.024744147,0.015176603,0.008404591,0.0027666222,0.010569248,0.0044007148,-0.006288161,-0.004284314,0.009354426,0.005839114,0.0011356273,-0.011147894,0.002477202,-0.0149908345,0.00195031,-0.015354798,-0.01485656,-0.012815854,-0.02755602,-0.009717545,-0.007536365,0.0063917353,0.0006380659,-0.004471995,-0.00717818,0.0036258255,0.02231107,0.0054129167,0.017858163,0.00035584907,0.011973545,-0.008077682,0.023241768,-0.083245516,0.013847072,-0.0048062615,-0.008065033,-0.0051790257,0.025960937,-0.007417023,0.0037856628,0.00014037114,0.01825528,0.0113828415,-0.009322776,0.00048598077,-0.01268237,-0.018381389,0.011188729,-0.012235148,0.009202025,0.008906813,-0.01591385,-0.0015139661,0.002279417,-0.023953779,0.0061740903,0.002889562,-0.023540765,-0.0049378383,0.026185898,0.015473693,0.019974208,0.007899493,0.02538025,0.0041464265,0.008419375,-0.019164126,-0.018244825,0.005363968,-0.026461765,-0.030115686,-0.012015593,-0.0055188825,-0.020048328,0.017868457,0.006836229,0.00092445075,-0.008829064,-0.006963871,-0.0123964725,-0.011907294,-0.0065795784,-0.0064351335,0.014172919,0.013056302,-0.00751273,-0.006724719,-0.0017656479,0.021036541,-0.037816864,-0.00363076,0.0022864826,0.0046244957,0.0034158074,-0.021234304,-0.00439354,0.0020157336,-0.010251088,0.0016375209,0.013826385,-0.0052967346,0.02590256,0.0019799287,-0.012807519,0.002627543,-0.01845237,0.030237189,-0.009698466,-0.021573469,-0.00474611,-0.02481443,0.020430038,0.013496142,0.004173338,0.008376479,0.0022425046,-0.0040222,-0.0040104985,-0.009847506,-0.021591216,0.016373383,-0.0057480703,0.0018231947,0.035478223,-0.0038242135,-0.00070650846,0.015304585,-0.012008118,0.010043767,-0.009828965,-0.005057384,-0.019477133,-0.042047795,-0.013318634,-0.028386414,0.02155302,0.0021203717,0.00756824,-0.013766193,-0.017585946,0.009430559,-0.023125144,0.02167538,0.014201216,0.005156916,0.018146228,-0.004625499,0.011019547,0.0012437948,0.0053089513,-0.002187798,0.0013971117,-0.009474529,-0.0004216552,-0.03183549,-0.0033634976,0.011300275,0.0046256674,-0.0007451499,-0.015654005,0.0015940574,-0.0104655875,-0.004788079,0.005054634,-0.016369142,-0.013303519,-0.02251704,-0.0027098393,0.020196814,0.03715467,-0.008676216,0.0018822732,-0.0098730475,-0.0026582677,0.022963362,-0.0035575246,-0.004165564,0.015490059,-0.0058065145,0.0029194697,0.026913702,-0.017084906,-0.0078788595,-0.00076437485,-0.0031680618,-0.002276098,-0.00024627097,0.0018684688,-0.0052790646,-0.013673028,-0.020762233,-0.021740967,0.022437617,0.0025727414,-0.018150065,-0.0019925511,0.016371962,-0.0021438801,0.017146323,0.011172468,-0.02596222,-0.021758327,0.0017535378,-0.021110103,-0.023840643,-0.025545444,-0.006574807,0.004266763,0.016479626,-0.004312887,-0.017975342,-0.0029668335,-0.0033494562,-0.007496895,0.021829205,-0.019256512,-0.011771209,0.015391168,0.008605197,-0.014366118,-0.004813697,0.0011313041,0.0246098,0.008983581,-0.007731104,-0.019050445,-0.008479585,0.0012082335,0.008372847,0.010802784,0.00013055735,0.006148316,0.0032244113,-0.008714493,0.0073823277,0.0062538804,0.003683927,0.008396409,0.0036781756,-0.0048020235,0.008004477,-0.00096197706,0.00058338343,-0.0143831475,-0.0030182542,0.005513714,0.028140994,0.017622802,0.0008499091,0.007884593,0.013834961,-0.006163005,0.0038114078,-0.013555034,-0.006352745,-0.003376195,0.009261904,-0.008270142,0.019211264,-0.0013899105,-0.00084742566,-0.0026686832,-0.014283715,-0.019846436,-0.0064673885,0.0093828915,-0.010395612,0.0007175167,0.0016846696,0.0007686608,-0.012729864,-0.011415146,-0.0021607985,0.010715146,-0.0038295244,-0.01095313,0.020814009,-0.005897312,0.0064232717,0.017305437,-0.015439596,-0.03337436,0.0200718,0.023470646,0.013022164,0.011451469,0.009889587,0.01308833,-0.004125106,0.0028041892,0.020257397,0.012525943,0.0054739253,0.013563774,-0.0075571924,-0.003552911,-5.9585633e-05,0.0012067189,-0.0033179275,-0.017857399,0.03267326,-0.07880063,-0.0046633887,0.015174213,-0.012850812,-0.010804758,0.008601299,-0.009850718,-0.01196082,0.004914444,-0.0153927235,0.005755347,0.0058703125,-0.016408043,0.018675493,0.0182209,0.005959983,-0.0152739575,-0.008378888,-0.002081154,-0.01477076,0.015756404,-0.010933696,0.01052722,0.016322264,0.0016946718,0.0030736001,0.037846986,0.010370562,-0.012933098,0.009399127,0.0031150226,0.0063332953,0.0029681777,0.022697572,-0.009161125,0.0028382388,0.01132748,-0.019229412,0.00562039,0.010229634,-0.0074036,-0.0017386732,-0.0038217208,-0.0017669159,0.0040623304,0.022944942,0.007437249,-0.029315792,-0.0052599036,0.0075945617,-0.042786527,-0.020153709,-0.012632295,-0.020117441,0.00043721992,0.010088552,0.0011461531,0.010371908,0.019596597,0.0037566437,0.019375829,0.0038819362,0.0011770729,0.03509508,0.0059201196,0.021296544,0.02081322,-0.0012747946,0.01276547,-0.010864453,0.009274464,-0.0077985544,0.0052881357,0.0015215965,-0.0025497684,0.011616005,-0.016790483,0.008739659,0.010506357,0.002190093,0.012930207,-0.012609564,-0.07608496,-0.013236371,0.0028939818,0.011117232,0.0068203136,-8.435487e-05,-0.016381506,-0.0050828145,-0.008814357,-0.036335807,-0.020101763,-0.013901022,-0.009842525,0.010187278,0.015561465,-0.0015224421,-0.0071429065,0.011537217,-0.0065945643,-0.01426039,-0.014472717,-0.0063244575,0.024200238,-0.004191875,0.0003650063,0.033708017,-0.020516638,0.014506919,0.015031874,-0.005287501,-0.0032142168,-0.17474099,-0.01177169,0.007826844,0.014093623,0.012506578,0.009115284,0.0015427569,0.0013363474,0.015090432,-0.010166309,0.0029739726,-0.017664002,-0.011348593,-0.014548324,0.0004475649,0.1475704,0.003748769,0.021790558,-0.0075280066,-0.0024474086,-0.028783167,-0.013590395,-0.026573313,0.022748398,0.005776867,-0.01319899,0.02537218,-0.013042967,0.010944932,0.011511977,-0.008428922,0.014028251,-0.0007579617,-0.028843876,0.029503386,0.019739889,0.0012851063,-0.016820496,-0.0070607,0.011700708,0.033976104,0.019662451,-0.01005957,0.0065719946,0.0025923182,0.00035920224,-0.015709423,-0.00038935078,0.00017641367,-0.0057108607,-0.02718977,-0.083830796,-0.0030270526,0.0101074,0.0038023507,0.00047787774,-0.025595602,0.0004562223,0.028189976,0.009387578,0.022051396,-0.0033215652,0.012102462,0.013277401,-0.0047725695,-0.0128093865,0.02169099,0.006819193,0.005723366,-0.024429956,0.02280976,0.017823009,-0.017237449,0.022940146,-0.007358331,-0.015909672,0.011278987,0.016954469,0.0020265512,-0.009928638,0.0056340247,-0.007846295,-0.0056238337,0.00091057125,0.024848696,-0.010211383,-0.004801053,-0.000672346,-0.0031129592,0.001272836,0.0069569726,0.006688206,-0.00050022424,0.025655622,0.0059258356,0.006031906,0.02076429,-0.01532948,0.02753057,-0.0045551495,0.0056289085,-0.007990923,0.019341473,-0.037991587,0.004452255,-0.008090607,0.02097275,0.0219104,0.007729336,0.010370918,0.0029215596,0.006744783,-0.008773226,0.010736684,-0.0065187155,0.02824571,-0.00044301947,-0.006482719,-0.0044252058,-0.012563701,-0.0014317709,9.160428e-06,-0.015310167,0.0093146665,-0.0010316407,0.013323067,-0.0025394394,-0.0014452187,-0.002920989,0.006045325,-0.0027184798,-0.013668781,0.0042972895,0.004613869,-0.004603234,0.0013624104,-0.01964773,-0.009819136,-0.004982615,-0.0016060697,-0.0012763481,-0.0073905014,-0.010851444,-0.012732834,-0.0061451197,-0.0064573823,0.00031996306,-0.018070368,-0.0015035935,-0.025474476,-0.006729238,0.00011557887,0.012572116,-0.0083603775,0.00068650587,0.0056975856,0.012364947,0.02259513,-0.004975037,0.007005674,-0.0007497209,-0.018703477,0.0017713862,0.0007470641,0.00046387513,0.018379757,0.0065350044,-0.0009781009,-0.01055672,0.014524785,0.0010687724,0.0012341266,-0.012261449,0.006980519,0.0076745604,-0.010184195,-0.008618896,0.007987756,-0.008355843,-0.017398156,0.0025166152,-0.0047221,0.01175796,0.008884126,0.0038577854,0.0071298117,-0.0030186735,-0.012712021,0.00020642595,-0.004718582,-0.001151976,-0.017069746,0.009023851,-0.012573549,-0.015492266,-0.00839409,-0.015467374,0.0020574778,0.007389711,-0.013009032,-0.004428645,-0.015594831,-0.008969337,0.0052573555,-0.0016278476,-0.0010502763,0.0027311419,-0.0030116462,0.0013522753,0.006220537,0.010700385,0.0034403123,-0.002566087,-0.0006389167,-0.007753105,-0.0049760146,-0.016166186,0.007846225,0.010579136,-0.006914154,-0.015497384,-0.011912687,0.011757736,-0.008162415,0.004682418,0.0025056086,0.02100972,0.019832516,0.015923727,0.01308408,0.009571962,0.0089133745,0.0031358893,-0.0140545955,-0.007893376,0.004383318,0.012439303,0.0041839485,0.0027117876,-0.008535521,0.011233034,0.014096418,-0.0010583705,-0.01452496,0.009317053,-0.0033285068,0.0031700288,0.0021910155,-0.0059199063,0.00096243666,0.010179562,0.006403482,0.008875303,0.0033427433,-0.011483108,0.007782923,0.007694774,-0.0011450271,-0.0026657288,-0.014741288,-0.0035803162,0.008176889,0.0011527461,-0.00019536787,0.009997972,-0.0019934003,-0.0072043524,0.0030774942,-0.0010029543,0.017524693,0.004282219,-0.001671491,0.013256525,-0.017487977,0.0005801078,0.009817095,-0.007214114,0.0020502794,-0.008641521,0.0027242503,0.014513947,-0.0070920778,-0.0058775777,0.013560347,0.0012484888,-0.00030776922,0.011751473,-0.008943087,0.004608009,-0.0039169104,0.011005209,0.02370832,-0.0026399002,0.0015555563,0.0043485267,0.0023520933,0.021393726,0.0092880055,-0.0041550975,-0.0025132538,0.006030875,0.009591175,-0.0007688959,-0.0026605888,0.008923786,-0.0010897699,-0.0013273938,0.0042665675,0.016567836,0.00460546,0.1410831,0.011699095,0.012054194,0.010715366,8.437435e-05,-0.013903115,0.008689578,-0.013559244,0.0074662184,0.018801833,-0.010006228,-0.0010614882,0.008836909,-0.005305001,0.0005855459,-0.0016108596,0.0014297981,0.0051414515,0.006619247,0.0019080533,0.011227167,0.0033452844,0.00985273,0.013222941,-0.0031732512,-0.00096384715,-0.006568123,-0.0034238517,0.0016676296,0.009552534,0.0022554097,-0.001333677,-0.0070612337,0.0135688195,0.0064437543,0.00027485623,-0.0025212467,0.012559272,0.0017283312,0.004459272,-0.005410474,0.0022303255,-0.0027846762,-0.003296883,-0.0029493307,0.0018361412,-0.0145576,-0.0060846987,-0.008519262,-0.01304992,-0.0040223305,-0.0077581326,-0.0069189514,-0.0076592895,-0.01011433,0.0035552236,0.0063163233,0.0056221946,-0.0015887461,0.0052288305,-0.0028963082,0.022352125,-0.010551998,0.010224919,0.011645277,-0.0051240562,0.011952183,0.006855537,-0.00673646,0.020651916,0.00896881,0.006598745,0.0070258584,0.0117880665,0.030330207,-0.002090907,-0.008096186,-0.0024535772,-0.0070822123,-0.011926282,-0.014314882,0.009727918,-0.010117695,-0.0003819082,-0.006453755,0.0014695919,-0.007842935,-0.005680425,0.00084507605,-0.0038340422,0.020272488,0.0012157406,-0.0114516625,0.0040083784,-0.015993731,0.0066683455,0.06443689,-0.0029608752,0.011411202,-0.017782543,0.0012007151,0.0030142884,0.0041645593,0.0102701215,0.0035022656,-0.002236111,0.010063051,0.006803978,-0.0056418544,-0.0008849849,-0.0026079128,-0.0012629114,-0.0014078666,-0.0024681333,-0.010883898,0.004930252,0.0025815314,-0.00543066,0.0004788166,0.021719556,0.0049528047,-0.0060495166,0.009868614,0.002264575,-0.010139206,0.0034481664,0.0077266744,-0.006610467,0.010117735,-0.003249911,-0.0027946949,-0.00050931703,-0.009512397,-0.0022545937,0.0036916512,0.007783132,-0.007812547,0.00024260802,0.0064539076,0.0009788746,-0.021197628,0.0044363,0.0007360658,0.0034319975,0.0059325146,0.010752039,-0.0028306446,0.0037328843,0.005224117,-0.0112279095,0.0049987584,-0.007873604,-0.015982887,0.012513094,-0.00039094113,0.0048106094,0.0001417352,-0.0045581455,-0.0031583293,0.0139160445,-0.00548481,0.009552084,-0.008208264,0.0006417558,-0.00036013784,0.0014892895,-0.0048982506,0.013369851,-4.588182e-06,-0.0010690615,0.0074884538,0.0164595,0.0015392108,0.0039955163,-0.0002471483,-0.0017757948,0.0040139197,-0.0040566064,-0.022951212,0.0072543086,-0.011936312,0.001898144,0.0036495333,0.0032362326,-0.0017458505,-0.010953133,0.014771118,-0.013807866,0.018630823,0.0014382584,-0.0040140627,-0.0036411937,-0.0023100495,-0.0059720664,0.0001950968,-0.016964216,0.003452935,0.00926771,0.00038883198,-0.0009423927,-0.008328684,0.0043281736,0.006570457,-0.0024710677,0.0054912632,-0.0018825326,0.002167434,0.0020850962,0.0072239162,-0.0014713005,-0.0037871685,-0.006056352,0.008564298,0.004743449,0.01694571,0.009845505,-0.00010949488,-0.015527571,-0.0022892195,0.00452217,-0.0018511434,-0.001135676,-0.012433067,0.002533654,-0.0017856475,0.00043795278,0.012285546,-0.004763359,0.0137510775,-0.0061582453,-0.018367646,0.0020323,-0.0195526,0.00043099624,-0.021171046,-0.002936615,-0.00016253775,-0.005945023,-0.012729756,-0.011565982,0.0059699914,-0.003297018,-0.0021808848,-0.0033999705,-0.0021945175,-0.002114497,-0.0015539164,-0.00028332524,0.008266068,-0.004908871,-0.008695177,-0.007903564,0.0058659073,0.009487383,0.010369419,0.006695383,0.016323105,-0.06861552,0.022029398,-0.00025048607,-0.00045568138,0.0034007984,-0.0048020356,-0.0031321982,-0.0068071866,0.004272291,-0.0013786559,0.0141986115,0.0012338454,-0.0033381197,-0.002525182,7.5819116e-05,-0.0059890486,-0.013947186,0.014197729,-0.00896562,-0.0053546918,-0.0053327708,-0.002426441,0.007232839,0.0012907257,0.0014860302,0.0047454783,-0.0093146125,0.0014815298,0.0003305867,0.0047768503,0.0062837363,0.015941009,0.006421132,0.007974191,0.0005157419,-0.009560683,-0.008741547,-0.018068759,0.007064888,-0.0067951423,0.018850666,-0.003050754,0.0146770375,-0.0076049757,-0.004962965,-0.0213372,0.0065913904,-0.013468593,0.010940983,0.01032377,-0.0012919727,0.0118459435,-0.0055956817,0.0059423414,-0.0023418667,-0.003440279,0.0065675615,-0.0023491925,-0.011293182,-0.0071387487,0.0047359425,0.0011276694,-0.0004971965,-0.011981115,-0.0065823235,-0.0060672387,0.0048485748,-0.000616826,-0.007401818,0.0009148767,0.011457705,0.02421749,0.019119754,-0.0019977884,-0.0011510027,0.004002132,0.004228937,0.012405453,0.008338264,0.012560041,0.00080191495,0.013809518,-0.008934413,0.004291812,-0.0011421981,0.0057563502,-0.0008602548,-0.009360662,-0.0047596283,-0.013071784,-0.011433458,0.011146737,0.0047855717,-0.008947902,0.003966315,0.004058958,0.007119453,0.02155752,0.014828181,0.008815376,-0.0017701171,-0.0067461333,0.015199656,0.0064121014,-0.0061988193,0.009883074,-0.011066376,-0.005765649,0.0037157803,0.0064494377,0.010995249,0.00030560128,-0.0068648094,0.0053707277,0.00056062185,0.0050212257,0.007126454,-0.0054245386,-0.007909483,-0.0034457396,-0.010004547,0.016422449,-0.0067440113,-0.011205044,-0.003799942,0.011511753,0.006121794,0.0029451807,0.003912617,0.00759994,-0.009766461,0.0111530535,0.008794372,-0.0128671015,-0.009329018,0.015334573,0.0024883517,0.009040769,0.006001055,0.0222823,0.007482034,0.004483192,-4.4773595e-05,-0.006943977,0.003023095,-0.004337455,0.003529998,0.01320683,-0.0013794111,-9.646921e-05,-0.0014804024,0.0051556784,0.001864831,0.0030394604,0.0051545263,-0.006729816,0.010785442,0.014219291,-0.0002881574,-0.0049546976,0.017982699,0.003144343,-0.007856212,-0.0019228586,0.017966531,-0.0047691744,-0.0049593793,-0.0012459328,-0.0017612878,0.010031744,0.00015420314,-0.00817703,-0.0004922078,-0.0007135563,0.0007554475,-0.0033694285,0.0026747189,-0.0019853136,-0.0036135134,-0.0015202543,-0.007866662,-0.0036392559,0.005160856,0.015933318,0.004552967,-0.0041782684,0.009529708,-0.0013032898,0.0063503184,-0.0058554374,-0.002643469,-0.007906237,0.008188406,0.0033921383,0.0028767674,-0.013738222,0.015819209,0.003720893,0.0023655156,-0.011673188,-0.015528321,-0.0028704028,0.004553551,0.00067518937,-0.002381565,-0.12856482,0.01520067,0.0012131106,0.01258249,-0.007619866,0.006073571,-0.00731289,-0.0028379115,-0.012085989,0.0037848423,-0.012082367,-0.015688434,0.008110284,-0.026728239,-0.0013650474,-0.009785639,0.0047701425,-0.021279609,-0.0077577457,-0.0074292505,0.010276836,0.005035141,-0.0074514635,0.0020807325,0.005929244,-0.007496668,-0.011208964,0.004058487,-0.0026108553,0.001154726,-0.016926272,-0.008739386,0.015846826,0.0017029392,0.0058053797,-0.0022839792,0.008554015,0.017298564,-0.16217807,0.0059897373,-0.004275202,-0.013080442,-0.005775945,0.00095348165,-0.0009165322,0.0020665745,0.004449576,-0.0017468783,-0.00983614,0.009405561,-0.010189613,-0.002107186,0.0051704426,0.0009132007,-0.0110841775,0.0066156997,0.0031463054,-0.0005036601,-0.011355244,0.010176062,0.0053069084,0.0073231845,0.0014029202,0.021174056,-0.0037935309,0.007552363,-0.0048636124,-0.016787782,0.001353477,-0.008459342,0.005145149,-0.012493924,-0.0056184,0.0024360244,0.0036903352,-0.009004359,-0.0030226714,0.0019062136,0.011917871,0.00091836177,8.7274784e-05,0.010433845,-0.012201036,-0.0006748783,0.009166568,-0.010603562,0.002806105,-0.00041566842,0.008611699,0.0018652412,-0.005250207,-0.0058512334,0.0043320605,0.004899365,0.011759772,-0.0065480764,0.01070606,-0.011628304,0.0063971095,0.0062319664,-0.0010858999,0.015668519,-0.0015780289,-0.004060047,0.011286453,0.008218214]	2026-03-02 09:00:37.47061+00	2026-03-02 09:00:37.641445+00
4ab4f3f9-d49f-4189-9d88-d73241c362ca	Higher Education	University of Cincinnati Enrollment	The University of Cincinnati (UC) has a total enrollment of approximately 47,000 students, including undergraduates and graduates. This figure fluctuates yearly due to admissions cycles. For the most accurate 2024-25 data, consult official sources such as the UC admissions page (https://www.uc.edu/admissions.html) or registrar reports.	["What is the approximate total enrollment at the University of Cincinnati?", "Why do UC enrollment numbers change yearly?", "Where can one find the latest UC enrollment figures for 2024-25?", "Does UC's enrollment include both undergraduate and graduate students?"]	Verify university statistics from official websites annually, as numbers fluctuate. Cross-reference admissions and registrar data for accuracy. Note trends over multiple years for better context.	9	[-0.028821345,-0.0086922,0.0041595614,-0.049141966,-0.007767844,0.026338499,0.014783467,0.015669191,-0.024073953,0.008197394,0.0053621507,-0.013427163,-0.006557376,0.015830487,0.089287356,0.03265196,-0.01071005,-0.013663766,0.022742454,-0.02382114,-0.02307168,0.030818103,-0.02989196,0.0036871943,-0.015490392,0.004161125,0.01980174,0.008695326,0.015769958,0.011690817,-0.010615724,0.009414018,-0.0056244805,0.001777773,-0.013623548,0.0029111162,0.016975146,0.0010053699,0.0024903298,-0.0044414992,0.01230198,0.027564937,0.013918412,0.0021745015,-0.005798881,0.0045784917,-0.010161537,-0.04552838,-0.0006740531,0.01456129,-0.007864373,0.01675321,-0.022957962,-0.21139848,-0.012610745,0.013376361,0.008510386,0.016131692,-0.0025138843,0.010608412,-0.014090223,0.014111922,0.003551696,0.0115933735,-0.0056336136,-0.006988627,-0.0067837704,0.01682357,0.00012799943,0.010315834,0.010583073,0.011642972,-0.020700028,-0.006974601,-0.0029766937,-0.03366808,-0.011723015,0.006366087,-0.008585355,0.0033490984,0.00086497096,0.0021132568,-0.019177545,-0.018486751,0.005778184,-0.0042244196,0.0063501955,-0.020109076,-0.011316662,-0.0023250722,-0.013857745,0.025475627,-0.0021922528,-0.029658424,0.021468243,-0.021125324,-0.0074001257,0.018431736,-0.023923224,0.0007055985,-0.008922803,-0.015734853,-0.022345047,0.0043261466,0.026380071,-0.02021958,0.014542651,-0.029568464,-0.0022461829,0.008350447,-0.0014409717,-0.011218905,0.0057522687,-0.01112803,0.0019315408,-0.19462658,0.013057237,0.013189933,-0.0018552891,-0.030760346,-0.00917802,-0.009712385,-0.0013423389,-0.018947415,-0.017144272,0.011693901,0.0068158316,-0.029488202,-0.012511959,-0.008887206,-0.0135606965,-0.040975794,0.0059646564,0.00087213167,-0.017864766,0.007207463,-0.012288857,-0.023642521,0.01178549,-0.025338111,0.013259704,0.006875481,-0.0005694049,0.035475925,-0.017384527,-0.012423486,0.005402592,-0.001277609,0.0123830205,-0.019051675,0.018483285,0.014129752,0.022637513,-0.0087937135,0.016405722,-0.012208085,0.017521381,0.007535668,-0.020603191,0.009139042,-0.017016673,0.0016484169,-0.0039492035,0.0003433745,0.0027257001,0.007113717,-0.02131174,0.011834049,0.016854208,-0.0019823078,0.021986213,-0.012227831,-0.011335118,-0.020230403,-0.01173834,-0.015905712,0.0276081,0.009139952,0.010510247,0.005291938,0.0022663723,0.007602368,-0.01681612,-0.0133261895,-0.025631398,-0.02210103,-0.010762774,0.02222675,-0.00092119724,0.0073506907,0.017872786,-0.012903097,-0.01529579,-0.02076908,0.009123811,-0.008843315,0.01574009,-0.012730998,-0.0027519925,0.0022103467,-0.004584519,0.0087876655,-0.0002335453,0.021059766,0.02503291,0.022233985,-0.018046614,0.00037907303,0.0075436886,0.039103426,-0.0010552648,-0.012955015,-0.0074285273,-0.00011298992,0.018856004,0.0055212183,-0.022808226,-0.023853043,-0.00040431664,0.009699393,0.008683553,-0.0025701246,0.0032419015,0.029973596,-0.0012757359,-0.00038638705,-0.009840346,-0.019464398,0.027652618,0.031519897,-0.015072674,-0.001363806,-0.008449411,0.010162424,0.0017951599,-0.003519815,-0.018617138,-0.0018621741,0.020186348,-0.022380607,-0.026047414,-0.009307163,0.0040090517,0.013638342,0.016485445,0.0028534366,-0.0005007898,-0.019127626,-0.0002783483,-0.002550634,0.03176716,-0.00249707,0.0045026443,-0.0030773093,-0.036456704,-0.0008504723,0.005299233,-0.020415239,-0.010255626,0.019822175,-0.019818101,0.000761507,0.0026152898,0.002028843,-0.02757691,-0.003170465,-0.0138996765,-0.029110486,0.004691869,-0.0043610553,-0.034881227,-0.009908717,-0.013479185,0.006752946,-0.00026569294,-0.011623399,-0.101922326,-0.0022979155,0.0077988612,-0.038714673,0.017939704,0.040273096,-0.0043303794,0.016980449,-0.014863141,0.0069654654,-0.029235348,-0.0071452535,-0.0017790686,-0.01600496,-0.0011811213,0.015509959,-0.016912956,-0.0052117947,0.023148071,-0.021757325,-0.0015731875,-0.007742423,-0.029466568,-0.009994514,-0.009077839,0.011591577,0.008974799,0.037639815,-0.012602252,-0.013429768,0.007852312,0.0050549046,0.009871276,0.002293736,-0.027360559,0.008766492,0.008753042,-0.00055432756,-0.003063337,0.0068271076,0.024189746,-0.005088119,0.025948713,-0.0061011827,-0.009809706,0.009884273,0.011640965,0.0021465556,-0.0142934695,-0.018330801,-0.0036453682,0.0043649646,-0.016917912,-0.013652887,-0.03372737,0.01311043,0.008284369,-0.001758511,-0.0030043998,-0.005822794,-7.554249e-05,-0.0067121726,0.01680071,-0.014513979,0.013557061,0.005723023,-0.0061491774,-0.014276135,0.0043980503,-0.0019831597,0.014261975,0.0106664505,0.01926884,-0.024426617,0.017878473,-0.0061628595,-0.008278817,-0.037597973,0.0015213547,0.011716272,-0.0057862177,0.0392351,0.0043592406,0.013930986,0.010693938,-0.0016028327,0.035856947,-0.011594667,-0.005174304,-0.0067578875,-0.0102160955,-0.009503309,-0.0035530515,-0.026188724,0.013202163,-0.008717757,-0.007092561,0.025008501,0.020822901,0.0070476527,-0.0039171297,0.024868382,-0.0044033057,-0.0013389207,-0.0015249054,0.030021215,-0.01477034,-0.0047324765,0.015493595,0.013071788,-0.0085494965,0.003351878,-0.009331053,0.005430527,-0.000490562,0.005459402,0.0018510142,-0.009818803,-0.0071444428,0.007135521,0.007798499,-0.0044583348,-0.003624449,0.013432924,-0.011876397,0.010527832,-0.010580495,-0.013530456,0.019102823,0.0006340571,-0.018004028,-0.0063197464,-0.01607479,-0.0307214,-0.0066237226,-0.0049456544,0.011798641,-0.003739282,-0.02055753,-0.033004757,0.015731698,0.010133021,0.023688111,0.012056792,0.008137793,0.019432401,-0.017442403,0.008740639,0.008313512,-0.0058518136,-0.037391484,0.0031172195,0.006288588,0.00074424484,-0.005808329,0.0076246276,-0.018059444,0.00059934723,-0.011960561,-0.012481549,0.0041752714,-0.0070979684,0.002615865,-0.0017082774,0.023731647,-0.006065078,-0.013216675,-0.004939289,-0.0021634076,0.0040422115,0.0048870007,-0.0008193235,0.0019309379,0.015428729,-0.0069799037,0.015004152,0.014168626,0.014544985,0.005409376,0.02742841,0.0025900905,0.0040036784,-0.003705706,-0.006387363,-0.017344173,0.006297033,-0.0055027893,-0.015581021,-0.0044739842,-0.005286846,-0.013139052,-0.0034037218,-0.011321947,0.011047546,0.0028497167,-0.0113088535,0.007013213,0.0068786344,-0.01158804,-0.01914208,0.038746398,-0.009881742,-0.013476872,0.007176279,-0.012079704,-0.0011165754,-0.0034765056,0.016848544,-0.020767584,0.0030203497,0.0010851702,0.0027885486,-0.0013607339,0.0044398652,0.010965055,0.00037711867,0.0032278064,-0.020486938,-0.018859982,-0.014833708,-0.00040768407,-5.5035598e-05,-0.026984047,-0.006401524,0.016982319,-0.017624525,0.0028235363,0.027995925,-0.017886903,0.0050744587,-0.029258672,-0.027993781,0.008408731,-0.0054857964,0.009142,0.018226812,-0.0009525805,-0.010284486,-0.021082168,-0.0036053911,-0.0041746846,-0.019604914,0.009335766,0.016935576,0.00526222,-0.021443402,-0.0019275345,-0.007138756,-0.00513798,0.005454109,0.020847354,0.0021737434,0.010058325,-0.008101589,-0.0035454547,0.0028403725,-0.023571104,-0.008714645,0.0032524662,-0.02645078,-0.0025245878,0.0030961432,0.03577386,0.014935279,0.0030844847,-0.035344925,0.009702233,-0.0022439682,-0.0061971406,-0.07892233,-0.004056823,-0.0104622105,-0.010933564,0.002503458,0.0032455213,-0.01671637,-0.019618772,0.0031702777,-0.011116615,-0.004784478,-0.013022875,-0.0150966095,-0.011939234,0.008068007,-0.023142282,-0.0030198873,0.036205966,-0.016093679,-0.0031107834,0.00092377514,0.023512734,0.007704051,-0.013681421,-0.009836459,0.006486939,-0.015028243,-0.010167859,-0.038571756,0.00522613,-0.0012650897,0.019084305,0.016488986,-0.006676344,0.020255229,-0.020458015,0.0023371691,0.0054103276,-0.0024889505,0.029087566,0.00090366066,-0.0050098714,0.0071542296,-0.030055039,-0.011631535,0.011467103,0.03325906,-0.021924319,0.004816999,0.0032601543,-0.032192294,-0.008729205,0.006932575,-0.010671293,0.0026951963,0.010451816,-0.01651219,0.004665531,0.009124718,-0.0066698226,-0.0006410303,0.0025716089,0.008713652,0.024015179,-0.00024234316,-0.0019388028,-0.0122387,0.0048612286,0.0025827887,-0.029527873,0.008378641,0.0077610975,-0.013023282,0.014977105,0.006818823,-0.0073666694,0.0011834458,0.01465856,0.011498184,-0.016146667,0.015236648,-0.009512767,-0.050479576,-0.008101095,-0.03756128,0.005046297,-0.0037082625,-0.012327167,-0.024850624,0.019522293,0.0061550266,0.009463031,-0.001133063,-0.0049792924,-0.008359673,-0.003977722,-0.016828418,-0.015740065,0.013415879,0.0008218572,-0.0030976667,-0.017165953,9.5190255e-05,-0.0042190873,0.027814273,0.0010250068,-0.013111256,0.027538752,-0.009825913,-0.018083565,0.0058133276,-0.046013482,0.013888859,-0.15119998,0.0073263114,0.0045861425,-0.008535625,0.003672679,-0.016182775,-0.0010865366,0.0048121605,0.007604405,0.011999788,-0.0052478835,-0.013891086,-0.014519283,-0.00055342563,0.015881866,0.15356097,-0.007164083,0.019268405,-0.020684548,0.007334381,0.0020787844,-0.00817578,0.012000394,0.0144507475,0.015864147,-0.008597339,0.03053975,0.023642251,-0.0032423355,0.027122932,0.0044998527,0.0055018174,0.01689718,-0.011643657,0.016128557,0.01387808,-0.0010693453,-0.0013737612,0.014261464,0.003194308,0.021362117,0.009790396,0.021502838,-0.021843784,-0.028632551,0.026531141,-0.015685948,0.020930888,-0.015254361,-0.009390044,0.0011932227,-0.0650327,-0.02028677,0.006188799,0.013538604,-0.012396173,-0.033599857,0.013021191,-0.010908802,0.0026587427,0.0149847055,-0.019866165,-0.0008995698,-0.0016471945,-0.008775474,-0.003062414,0.016223293,-0.024244674,-0.0034914229,0.018167794,-0.026249984,0.0060607856,-0.020772075,-0.005592295,0.011317199,-0.0057052043,-0.007516801,-0.0044610035,0.0024468228,-0.01168491,0.0038692232,-0.010769808,-0.009337883,-0.010641784,-0.015641956,0.014876729,-0.021209335,-0.0018422346,0.006271487,0.009416798,0.016775666,0.011736166,-0.011514537,0.009171464,0.0140738115,-0.005015063,0.04351873,-0.015509997,0.018900821,0.00029179096,-0.0099249,-0.027276432,0.0115122255,-0.00839153,-0.05172636,-0.020377183,0.010111516,-0.005558163,0.042476133,-0.0012550929,-0.0046481295,-0.0039298404,-0.01739734,0.010464812,-0.012888118,0.014120801,-0.0112852845,-0.004405894,0.00035453573,-0.016649365,-0.0021197677,0.0033463184,0.0037893208,0.00974006,0.0025394247,-0.0003841873,-0.002239317,-0.0037943856,-0.006150628,0.005336018,0.020047177,-0.0048220856,0.013016237,0.024167292,-0.008775734,-0.008840664,-0.013481127,0.00202306,-0.0048709502,-0.008180096,0.014027659,-0.013617228,-0.0040095546,-0.0061301845,0.0026159245,-0.0025574376,0.0040163067,0.016270602,-0.031726588,-0.0022121146,-0.012700716,-0.014768976,0.01573865,-0.007984508,-0.0076428624,-0.0111759445,0.005598989,0.00031976806,-0.0031863789,0.0066408217,0.006216686,-0.0114903515,-0.011465295,-0.0019138047,0.010194631,0.0018150947,0.014948618,-0.0065011675,0.01371234,0.008787945,0.0069898516,-0.0045576436,-0.008485549,-0.008240777,-0.007273221,0.0024086172,-0.0021019299,0.0020393515,-0.005854451,-0.006732701,0.016919324,0.01123249,0.011740175,-0.01419365,-0.012604569,0.0046187853,-0.012054934,0.014698414,0.0081255175,0.00017691877,-0.0016082511,-0.013433916,0.01462375,-0.007914575,-0.0027180563,0.003967068,0.0058511,-0.0009514891,-0.0027377296,0.0031200391,0.004323792,0.0048719263,0.008633509,-0.007359258,0.001674923,0.023008691,-0.012547435,-0.0008423043,0.0005282744,-0.0049342266,0.00870477,-0.002977963,-0.007653828,0.010267732,0.010115661,0.004487203,0.005725178,0.015461313,0.007065825,-0.005847675,-0.013040538,-0.0028120717,-0.0005769128,0.003698049,-0.0047179232,0.008042162,-0.009827729,0.016031655,-0.0004457388,0.0026865832,-0.002395016,0.0056812037,0.007967718,-0.0020584012,-0.003780561,0.010671631,0.00030636936,-0.01086197,0.02340578,-0.0026764318,-0.0014512764,0.011669488,-0.015275059,-0.012103502,0.00027742935,0.0106573915,-0.013132724,-0.0069475467,-0.0046951286,-0.017455101,0.010227822,0.0023931079,0.019858938,0.003983599,-0.014725981,0.002503259,-0.011896617,0.006034549,-0.013688788,0.009161179,0.0038349803,-0.0038278168,-0.013223761,-0.007304392,0.017666474,0.000619275,-0.0019347313,0.006096692,-0.0037284764,0.009571304,-0.011350761,-0.0027319756,-0.0051753805,-0.002569558,0.0060779694,0.029933374,0.0009997934,0.0041889995,0.010317453,-0.0013456953,-0.0032799887,0.008189407,-0.0051654633,-0.012417405,-0.011136903,-0.018616293,0.0011775187,0.011924459,0.00060548563,-0.012660124,-0.0046790466,0.024189366,-0.007055725,-0.0010933671,0.0007633458,0.0082964245,0.021022944,0.011486723,-0.00083543576,0.00048356008,-0.008458226,-0.0042522107,-0.0043688836,-0.000895998,0.0063773356,-0.00916828,0.0033353753,0.002633411,0.012246514,0.009318785,0.12340714,-0.003989961,0.00055530714,0.01677237,0.0027037654,0.0009079803,0.009995234,-0.0031163362,-0.012000098,0.00039120083,-0.00052170083,-0.007860485,0.009938409,-0.0031978623,0.0022022047,-0.005654575,0.008512657,0.012523861,-0.007050986,-0.007455951,-0.010463979,0.0055995667,0.0046826466,-0.008281159,-0.0030106565,0.0028873517,0.002329909,-0.007918893,-0.009560114,-0.0016944405,0.0006180799,0.0090696765,-0.0055890223,0.0006113795,0.0027791199,0.0068236883,-0.007714202,-0.0016747491,0.001694662,0.01291473,0.0059713456,-0.011368036,-0.012771772,-0.0055321883,0.024856243,-0.010068755,-0.011742242,4.495888e-05,0.008314319,-0.009389988,0.0011446939,-0.008985866,-0.0030362841,0.0006193839,-0.0061613545,0.0021568888,0.0036093174,0.015570389,0.0038371785,0.0033599867,-0.010686099,0.005071823,0.020396233,0.0011088921,0.0033275664,-0.016126517,0.013139664,-0.0006475271,-0.0020667159,-0.01726535,0.0005068197,-0.007867789,-0.0009959732,0.0031962288,0.034002706,-0.00024772648,0.01005814,0.0027764053,-0.010735475,-0.009900157,-0.015405603,0.014453269,-0.01186228,-0.003482763,-0.01294247,0.004838697,-0.004808785,0.0031336637,-0.0006535704,0.015603085,0.009768395,0.0051629306,-0.0016019611,-3.4855533e-05,-0.011849586,0.0037241231,0.078095116,0.010359308,-0.005850888,-0.0030099568,-0.00075613696,-0.014797375,0.0048911357,-0.0006055118,0.0032251172,0.0075605894,-0.0010560739,0.011392469,-0.0038003528,-0.0048988825,-0.006705642,-0.0014588533,0.0039753984,-0.0072504994,-0.013947955,0.004017712,-0.009819822,0.006895353,-0.008936052,-0.005402029,-0.0004003839,-0.015481426,0.011221618,0.0125710005,-0.008877568,0.0026063086,0.00055392564,0.008417891,0.012899289,-0.0007058364,-0.016031638,0.0046444735,-0.004379113,0.010246179,-0.01111117,0.0038282245,0.0069381064,0.0038508219,-0.0035703152,0.014045847,-0.019298501,-0.0117607955,-0.0019990262,-0.00082184136,-0.003741177,-0.01345485,0.010260045,0.020350682,-0.009227994,0.010673904,-0.007915847,-0.025074264,-0.023918927,0.0056835935,-0.0057067205,0.007818235,0.0069472427,-0.012065586,0.012175103,0.00083054905,0.004515145,0.0088178925,0.004172163,0.016551213,-0.006886871,-0.0042473613,0.0028388742,0.010001726,0.0121285515,0.009646375,0.0056498223,0.007693898,0.012767241,-0.0067590172,-0.0028798305,-0.0036192532,0.017858125,0.0016113597,-0.0027681645,-0.0046128365,-0.010309462,0.0054899165,0.012516273,-0.012711338,0.0026132218,-0.01499207,-0.0013777959,-0.012569992,0.013972253,-0.0070843752,-0.024078397,0.0125629185,0.0030997482,-0.0044856295,0.0038392653,-0.019071223,-0.0026131398,0.016634945,-0.010459813,0.008533994,0.01281391,0.023825219,0.0047088447,-0.0061234706,0.005356847,0.00843707,0.00630715,0.030937942,0.014863355,-0.009673661,0.003722556,-0.017535679,0.0017580248,-0.0031153092,-0.008605581,0.010798832,-0.0059400895,-0.011157694,0.019015485,0.012184524,-0.015534997,-0.0051129893,0.0019030606,-0.013775066,-0.016636478,0.016932433,-0.0022061826,-0.0055108913,-0.014859656,-0.0047883624,-0.0113655785,0.005304226,-0.008238073,0.0076398076,-0.030727722,0.0018786516,0.0069682808,-0.00097193697,-0.013080361,0.005253864,-0.005975498,-0.01802482,-0.0034872645,-0.0003839339,-0.002207906,-0.0031098803,-0.006637889,0.016367828,0.0035725143,-0.0072226524,0.018791849,-0.008654241,0.017249154,-0.0037485908,-0.008386943,-0.0066036233,0.008777775,-0.04988166,0.018101009,0.005632709,-0.006360909,-0.0050107897,0.00024076966,0.00745671,0.0035419122,-0.007892494,-0.0026165948,-0.014229692,-0.007248859,0.006038825,0.0020907943,-0.007817091,-0.003983484,-0.0067184777,-0.005372907,-0.0150495395,0.0019801683,0.0040171584,0.0067540742,0.002507244,0.0046694437,0.0014153447,0.023519346,-0.010129684,0.009944487,-0.0050659548,-0.0056420253,-0.008530593,-0.0021989238,-0.000961651,0.015759213,-0.00984129,0.0018292764,0.007032331,0.0020854087,-0.003261297,-0.002266817,-0.005229655,-0.017114319,-0.0050168415,-0.019112216,-0.00338466,-0.008381213,0.013536796,-0.009117017,0.0021519507,0.009561698,0.0036095968,0.01855603,0.014344999,0.003100216,-0.012723336,-0.0036880476,0.0077404766,0.0035955377,-0.012116224,0.0035527586,-0.002313352,0.00025936027,-0.005340211,-0.024370775,-0.010269921,0.006919674,0.0208436,0.007337043,0.0076670316,0.0015243696,0.014135387,0.018618122,-0.010136119,-0.006728902,-0.0038512866,-0.021841293,0.01758836,0.00779402,0.0022015695,0.0022159168,0.006397911,0.02125813,-0.009299614,-0.01927119,0.007968675,0.0019651654,0.014860015,-0.0038618648,-0.013731488,-0.008093926,0.0061307745,-0.00021978848,-0.0017493616,0.000112100475,-0.013092327,-0.00064581056,-0.0073862276,-0.0158428,0.006269106,0.005151087,-0.0042330325,0.0056350837,-0.017420463,0.02702754,-0.00077081163,0.0084138075,0.0015796641,0.0140287345,-0.012463185,0.00024219419,0.010895836,0.0011022608,-0.0016731522,0.0031507888,0.00065089384,-0.0072317645,-0.014295531,-0.012658282,-0.0020028707,-0.005751169,-0.02603291,0.016121507,-0.005302807,-0.0072977836,0.000323888,0.006705156,0.018808167,-0.008713733,0.013432685,0.0025481754,-0.0112192575,0.0052720862,0.018125646,-0.0016019765,-0.0052500563,0.015073796,-0.0008903605,0.020955749,0.010465724,-3.181207e-05,0.013958415,-0.009277686,0.016350515,-0.0010204447,-0.0028548518,0.013629044,-0.011930346,-0.0009344524,-0.0029262025,0.0061989925,-0.0020995215,-0.012978068,0.0061962362,0.019442784,0.013108477,-0.01186359,-0.014150264,0.0043028663,0.0020943764,-0.020267904,0.019332763,0.0034807103,0.004968436,-0.0062370873,0.00826454,0.0072003705,-0.0028978018,0.01482194,-0.009850848,0.0012396612,0.025197677,0.021522546,-0.009057792,-0.01168286,-0.0037356918,-0.0097916145,0.007857026,-0.006845445,-0.006152142,-0.0011313827,-0.012181976,0.007453159,0.013149903,0.009003373,-0.0025504117,-0.004624186,0.010696806,0.008123413,-0.0037133216,0.0011344104,-0.0038996167,-0.0023169315,0.016892139,0.009742978,-0.0015120704,-0.002024374,0.006958357,0.002156563,0.016970607,-0.005351003,0.010137548,0.011746315,0.007985197,-0.012700556,-0.014882992,-0.09821131,0.015002821,-0.018740397,-0.016130986,-0.011942285,-0.004570813,0.0027196354,-0.0018588782,0.0018407064,-0.0063411067,0.0046659196,-0.011324157,-0.0059368117,-0.032095272,-0.0017466887,0.0015276979,-0.01024875,0.005739301,-0.010121743,-0.02658035,0.008326444,0.012262755,-6.512179e-05,0.017422205,-0.008720817,0.017942207,-0.010864852,-0.012548665,0.0070848726,0.018335326,-0.004091173,-0.014108589,0.013786916,-0.007769657,-0.0054751886,-0.008030516,0.007960478,0.013462727,-0.15870188,-0.009997839,-0.0020284846,-0.0010521414,0.0031984372,-0.0042669587,0.00785445,0.0069810427,0.0033060515,-0.01675809,-0.0020659924,0.008694501,-0.0010147216,0.002179648,0.0052762614,-0.022256488,-0.0045873355,-0.0052203415,-0.00038745496,-0.00904019,0.0057863523,0.014079903,0.009909705,0.0031050208,0.0012629963,0.011420128,0.02575701,-0.006984135,-0.0012913564,0.0035359743,0.01130101,0.010670826,0.014685175,-0.008917321,-0.008036317,-0.00742018,0.0028655534,-0.00645181,-0.016132126,0.008259317,0.018024571,-0.0018724831,0.009375113,-0.002721971,0.0012990509,-0.0011626953,-0.005314399,-0.0056634997,0.013663648,-0.011652876,-0.017117044,0.00454752,0.00405768,0.010385702,-0.0019261187,0.00369963,0.0058374056,0.0010612264,-0.0025384505,0.008081208,-0.0014816003,0.01119046,-0.011084672,0.0135377105,0.03001218,0.0044052545,0.011633147,0.0043389956]	2026-03-10 08:00:15.306418+00	2026-03-10 08:00:15.406288+00
69d70ec9-41c4-4639-b5b9-352f5ce4370d	Biology	Undergraduate BIOL Courses at UC	UC's Department of Biological Sciences offers 50–100+ undergraduate Biology (BIOL) courses, including labs and electives, varying by catalog year. For Biology freshmen in BIOL 1081 (Biological Concepts: Structure & Function, taught by Prof. Dr. Stoffer), popular intro courses include BIOL 1082 (Diversity) and BIOL 1090 (Life Science). Verify current offerings and enrollments at [Class Offerings](https://www.onestop.uc.edu/registration/class-offerings.html). Check major paths at [Majors & Programs](https://www.uc.edu/majors-programs.html).	["How many undergraduate BIOL courses does UC offer?", "What are popular introductory Biology courses for freshmen?", "Where can I find the current list of BIOL class offerings?", "What is the typical freshman sequence in Biology at UC?", "How do I check requirements for the Biology major?"]	Regularly check OneStop for updated offerings and enrollments each semester. Follow the intro sequence: BIOL 1081 → 1082. Consult your advisor and review major requirements on UC's Majors & Programs page. Attend professor office hours for guidance.	9	[0.014200463,-0.008250485,-0.006754134,-0.022048378,0.002619688,0.0012826445,0.008778779,0.010613097,-0.0061416486,-0.009228605,-0.00047859014,-0.0056165615,-0.00887451,0.03233744,0.102288954,0.016424123,-0.0053190384,-0.03417986,0.023782156,-0.022118736,-0.017968677,0.013597974,-0.027852261,0.0091617545,-0.009069397,0.01595613,-0.00012871323,0.025422921,0.023385072,0.0134610105,-0.004670575,0.010574015,-0.0079106465,-0.0016685352,-0.010742753,0.02905773,0.01709063,-0.004723265,-0.0127574615,-0.010199499,-0.017146852,0.015850186,0.00811789,-0.0023619381,0.020835774,-0.0016268613,0.014494659,-0.046365388,0.006499495,0.016706541,-0.020699183,0.02928484,-0.014247237,-0.18406531,-0.014287148,0.0024991026,0.015698323,-0.016420918,0.0101184,0.00014854819,0.016512955,0.011645589,-0.018408526,-0.015485264,-0.00282932,-0.022477793,-0.0052817543,0.027770028,-0.0012144959,0.00049407117,-0.01925938,0.015139022,-0.013623849,0.0012013479,0.014363508,-0.014104049,-0.005006802,0.004656515,0.0054321145,0.034050733,0.0037852672,0.0043265736,-0.007838497,-0.023723662,-0.016012538,-0.038059227,-0.0046903677,-0.0098889405,0.0046955775,0.010295754,0.019501938,0.023413714,0.013133866,-0.022595897,-2.9321433e-05,-0.011980937,-0.0013940692,-0.015564696,-0.023268672,-0.001358115,-0.039039157,0.0013440389,-0.018297689,0.01220946,0.010773101,-0.022367813,0.016205098,-0.019435678,0.0030632163,0.014466103,-0.0016512824,-0.025448076,-0.028437022,-0.0018495251,-0.0077225,-0.18821439,0.02944149,-0.0037055023,-0.014538076,-0.0023783972,-0.008464739,0.008950332,-0.009982762,-0.006715994,-0.009496072,0.0055404194,0.0009011062,-0.013589569,-0.00038224808,-0.00396394,-0.002001522,-0.019898739,-0.00935954,0.02170351,-0.002111133,0.016743585,-0.012884895,-0.02223535,0.02514601,-0.012818245,-0.00097618083,0.00481873,-0.010559703,0.01361392,8.589447e-05,-0.024487473,0.0012083452,0.008156686,-0.008671512,0.02125118,0.015645355,0.025804691,-0.00015835204,0.0053489334,0.018040445,-0.01835829,0.028064119,0.022139477,-0.019872546,-0.010133265,0.0025870854,-0.0027234072,-0.008490731,-0.0014603222,0.012929598,0.02607481,0.015420252,0.02965196,0.013383927,0.0007096421,0.017069409,0.001971406,0.011939563,0.0010646846,0.00043402484,-0.015017976,-0.00012189579,0.002785573,0.020790583,0.0018690331,0.016876867,0.0135613205,-0.0075048227,-0.00643606,-0.025249513,-0.010704958,0.004210467,0.0050713713,0.0039753714,-0.015624595,0.005220815,-0.021655776,-0.0051231626,-0.01729392,0.0093073165,-0.010949974,0.019231174,-0.015032383,-0.011823447,0.022364527,-0.020951986,0.013830179,-0.00060845766,-0.009727406,-0.0065235747,0.006044108,-0.0033262118,-0.018124577,0.01865154,0.040304605,-0.0059339493,-0.022218931,0.0138190305,0.017715365,0.01823468,-0.019731022,-0.016721426,-0.01763573,0.011571096,0.0070361905,0.008186796,-0.012772785,0.021946734,0.03539769,-0.012896215,0.010425365,-0.015448936,-0.013878085,0.0107235685,0.014424984,-0.008679487,0.013829571,-0.027463326,-0.03965694,0.010594659,0.015142448,-0.02340082,-0.007914538,0.037502367,-0.0012869457,-0.040072944,-0.013455379,-0.012040601,0.022126678,0.017616617,0.0062783957,0.016790912,-0.0059049823,0.0067466353,0.019167818,0.03041638,0.010012824,0.009575546,0.0024767958,-0.03331901,0.018989308,0.018046621,0.025524702,0.0052990243,0.021267084,-0.011906295,-0.011013779,-0.03216608,-0.0064695873,-0.015282128,-0.0032717509,0.004625744,-0.003927367,0.0057303472,0.030819368,-0.025125043,-0.027645562,0.01646716,-0.0036670312,0.006944142,-0.0014252688,-0.10923818,0.011281166,0.008151645,-0.027253887,0.022256512,0.01344253,-0.021023337,0.015828596,-0.010983687,0.003229804,-0.024245117,-0.005737893,0.03525203,-0.01041177,0.016889894,-0.0018965782,-0.026739106,0.011527797,-0.008974589,-0.009456603,-0.014667023,-0.023184458,-0.011969146,-0.012284567,0.0075057703,-0.00037619093,0.0068414602,0.025550677,0.01779348,-0.009710762,0.0189162,-0.002545538,0.017518029,0.023503466,-0.008467195,0.005426468,-0.0036305098,-0.0027758442,-0.0073383353,-0.015978493,0.0057417913,-0.0007222896,-0.00019856819,-0.002785986,-0.0006180395,0.011671801,0.0041047637,0.0009011497,-0.02621678,-0.038578525,-0.047691543,0.00037577114,-0.00020010791,-0.0062476518,-0.025524834,-0.0040862095,0.013377974,-0.004296329,0.0025396983,0.011245717,-0.011102308,-0.011575273,0.019223532,0.0019051105,0.0020980104,0.013927315,-0.020695655,-0.011297771,-0.008132956,0.0031174552,-0.025311166,0.0073734843,0.009717369,-0.008901948,0.0057555586,0.0016559315,-0.01733308,-0.023389373,-0.0054521016,-0.013960887,0.01487295,0.038675055,0.02060475,0.008389558,0.00073858834,-0.005533586,0.019572875,-0.0070440983,-0.0022510344,-0.025802575,-0.0334853,-0.019537522,-0.021860087,-0.011413158,-0.00048799405,0.0038013326,0.0053908075,0.019776562,-0.0048934673,0.010961026,-0.016801538,0.010890528,0.0024870688,0.014675273,0.0016877062,0.026766093,-0.009276969,0.005258426,0.0031226634,0.029342782,-0.006058846,0.027244058,0.001676672,-0.008002523,0.0060052136,0.0052400967,0.017074512,-0.0017230147,0.0107921995,-0.010174803,0.031019203,0.0093275085,-0.0010012251,0.027543096,-0.0002620294,-0.0024171215,0.014562372,-0.00580841,0.00056001276,0.0141571425,-0.014575384,-0.010594949,-0.010028185,-0.02503591,0.000273672,-0.021874798,0.014801085,0.0005961555,-0.022797065,-0.013116495,0.0045055714,0.018674145,0.01589846,-0.006423461,-0.005584227,0.004417246,-0.009104397,-0.0035271342,0.0024788664,-0.0018384703,0.013695482,0.019717159,0.0018430462,-0.013261976,-0.008947147,0.018688563,0.018732302,-0.007707571,-0.01248718,-0.029783646,0.0063086576,-0.027954321,-0.0060283546,0.025306134,0.026655136,-0.007686476,0.008222379,0.021443428,-0.006341815,-0.003499865,0.02372845,0.012715528,0.019523762,-0.018196428,-0.0056275977,0.012062203,-0.0008194539,-0.0094766375,-0.016847504,0.020652603,0.004546662,-0.0070682704,-0.0012298664,-0.014854104,-0.0052513583,-0.011594298,-0.004863354,-0.0051107323,-0.00097061385,-0.0077867447,0.0075774807,-0.0054468075,-0.009102066,-0.00090207334,0.003907556,-0.005300906,-0.0037725705,0.006136446,-0.017403513,-0.017604982,0.040705703,0.026282588,0.006738208,-0.011520594,0.0050712754,-0.011618533,-0.0008513409,-0.004012942,-0.018843781,0.029017767,0.004753657,-0.020411752,-0.012278689,-0.0005402018,0.029389163,0.004095037,-0.0022954026,-0.0012583637,0.004346217,-0.011274938,-0.030815989,0.0065181875,-0.0007124887,0.02686101,0.0019783222,-0.029850004,-0.0018014215,0.016485553,-0.016800666,0.009314811,-0.008209193,-0.013825679,0.013983422,0.0053997166,0.0071684136,-0.0017180276,0.011608042,0.025378276,-0.0085053705,-0.007799666,-0.010801312,-0.007372488,0.021360599,0.008224658,-0.0047670337,-0.002248792,-0.01565991,-0.013135782,0.013097346,-0.008737908,0.01865194,0.014733641,0.01783353,-0.007710986,0.001136577,0.00482379,0.0015735708,-0.0059645516,-0.0073768087,-0.028349608,-0.004430662,-0.007964389,0.012881931,-0.005374229,0.00624667,-0.031439472,-0.009429704,-0.00025529534,0.006716248,-0.115105495,-0.007996577,-0.0025252358,0.02056073,-0.013775117,0.013579742,-0.00850169,-0.0059831464,-0.018018974,-0.022799546,0.011260614,-0.002027708,-0.004113677,0.0014456569,-0.004628501,-0.0072659957,-0.03719979,0.0140315,0.0010226526,0.015757011,0.015612098,0.010492519,0.006778508,-0.018295368,-0.0089788595,0.00093683146,0.009301999,-0.02034811,-0.04334445,-0.010434842,0.0019699377,0.028069392,0.006034382,-0.004123534,-0.020729847,-0.006558604,-0.010683921,-0.027963845,-0.007802023,0.027171265,-0.00020921433,-0.016710052,0.010579054,-0.018943442,0.0033664894,0.0053760563,0.030166212,-0.038843706,0.013119587,0.0059196325,-0.052678946,-0.008115978,0.011979277,-0.026685255,-0.0027094467,-0.022881355,-0.01193963,0.0075271674,0.017581252,0.0098729255,-0.009927735,-0.01402131,-0.005586086,0.004713377,0.0096652955,-0.0019066397,-0.0062619844,0.011818622,0.020869544,0.0016070209,0.01033645,0.024831338,-0.018667888,-0.0053273197,0.026938217,0.014131091,0.0128311105,4.1022755e-05,0.0040601883,-0.0067829024,-0.0029649127,-0.014651795,-0.07981765,-0.0020811155,-0.007853593,-0.01737641,0.008656879,0.0011644174,-0.019594135,0.023219971,-0.007332463,-0.0021842476,-0.033794377,-0.003597529,0.0087957755,0.008440169,-0.007701161,-0.018264698,0.022277992,-0.015668286,0.0076888753,-0.004473647,0.0076070153,-0.0023572822,0.008194535,-0.025166722,-0.019277437,0.05271087,-0.027883617,-0.0013961208,-0.014288663,-0.015565506,0.0072643366,-0.14112312,-0.012234771,-0.0020239733,-0.0045320587,0.0068039037,-0.012241296,-0.0027608215,0.016080929,-0.0048208083,-0.01277147,-0.022824233,-0.010375609,-0.017489376,-0.028861657,0.007834411,0.14339566,0.0093133,-0.0075186174,0.001758405,0.013357644,0.0015203635,-0.01881724,0.018789437,-0.006974587,0.02268688,0.0015628334,0.009896618,0.008763135,-0.0050754333,0.016300619,-0.0049399184,-0.0004669641,-0.0169992,0.0019548736,0.027865537,0.0069702286,-0.02712061,0.00065674074,0.0046204445,-0.00041533852,0.025322745,0.0027531509,0.014724246,-0.0014791284,0.005203372,-0.004745715,-0.014039291,0.023347579,-0.0076668737,-0.01033137,-0.01251722,-0.057861373,-0.028037539,0.0090785,0.02677258,0.0076092626,-0.009972112,0.0018354912,-0.003925291,-0.0008897313,0.0057616318,-0.012259407,0.014457647,0.03638914,-0.005326886,0.0065747346,0.010890443,0.026166188,0.009560119,0.010029586,-0.0014052804,-0.0009940388,-0.009556577,0.01213227,0.022543633,0.002618771,-0.010075255,-0.018814804,0.008789289,-0.0044111847,0.005840889,0.005907448,-0.011576117,-0.020376712,-0.004310549,-0.0062337094,-0.017465038,0.011756995,0.011430451,0.0018128834,0.0341914,0.019542597,-0.002526516,-7.3439514e-05,-0.013571888,0.0016182836,0.035340182,-0.010193629,0.007854677,-0.010404351,0.00068118604,-0.0120855635,0.0032960733,0.00478275,-0.015341367,-0.029114852,0.005911105,-0.0051360643,0.044164807,0.0006663492,-0.003402858,-0.00015246512,-0.0017918285,-0.00062955596,-0.014463707,-0.009103304,-0.014230608,-0.022998458,0.001109122,0.000655832,-0.0093662655,-0.0016565467,0.012616087,0.0066743875,0.0051604845,-0.006302676,-0.0025767835,-0.0082815485,-0.014203569,-0.011104883,-5.32451e-05,-0.010095965,0.0045431927,-0.006340495,-0.0037242263,-0.012380118,-0.011512655,-0.003404765,-0.0049323547,-0.005822215,0.0135157285,-0.013448404,0.0020745217,-0.011690325,-0.0051308214,-0.018585732,-0.009928544,-0.004640135,-0.01901383,-0.010525021,-0.0137188565,-0.01011122,0.024599612,0.0036283408,-0.0050247116,0.0018995545,0.007069654,-0.012863751,-0.0063744853,0.00018392596,0.019630801,-0.017601566,-0.0065515013,-0.013012413,0.015046247,0.010143843,0.015719326,-0.001536529,0.019181708,0.004195515,0.0077409297,0.0054461663,-0.0015378387,-0.011523179,-0.021819217,0.0052142832,-0.0031821248,-0.005463313,0.00018707839,0.006635393,0.004295451,0.01588518,-0.0016701594,-0.0058360184,-0.0038256522,-0.0012539579,0.001554067,0.03136094,0.0047257156,0.009230577,-0.0069783363,-0.0055460953,0.006602556,-0.01176288,0.011401606,0.010193319,0.0036481048,-0.003837515,0.005951239,0.007845444,-0.006755152,-0.0041508568,-0.008105928,0.014211319,-0.0012863653,0.0054838806,0.0037656005,0.0054174475,-0.0064923726,0.0014381764,0.016757311,0.006050332,-0.0027619668,0.0012242276,0.010161593,-0.004043342,-0.00095951784,0.008871537,-0.0024306169,-0.0023247912,-0.014187856,-0.0046559293,-0.00092491956,0.00613654,0.0035827728,-0.0013418631,0.0022778113,0.012453649,0.0037029795,0.010628816,-0.0015444478,0.0093308715,0.011889564,-0.010227828,-0.01903287,0.019150553,-0.0073943837,-0.009380239,0.016035212,-0.0099694645,0.010088893,0.0062791216,0.010584071,-0.0058626626,0.018854003,0.0009857,0.004289516,-0.0075968425,-0.002024221,-0.016522747,-0.0013213289,0.0059538535,0.019747151,0.0065292567,-0.014633172,0.003611499,-0.016636172,0.011202078,-0.0033845673,0.002686716,0.006742555,0.009418083,-0.0004196587,-0.0026822381,0.0038659724,-0.0047949487,-0.008232795,-6.0102448e-05,-0.009828473,0.00446015,0.0103753675,-0.0062812655,-2.447973e-05,-0.0040629506,0.0033724888,0.003315062,-0.012690907,0.005384032,-0.008415278,-0.012532318,0.007562956,0.008317876,-0.001654731,-0.003507413,-0.009880153,-0.00063326524,0.0105192885,0.0024201577,-0.0026716283,-0.0028046498,-0.01710993,0.022945838,-0.0028881466,-0.005875492,-0.0103403535,0.011909126,0.01662387,0.014498896,-0.0021402014,-0.0057259193,-0.009474687,-0.006414715,-0.00097539084,-0.0023072574,0.004822224,0.0010165673,0.0075982558,0.032007687,0.014690167,0.0002718064,0.113714285,-0.0035363398,0.001404432,0.01740068,0.004189538,-0.0050472734,0.004009737,0.016708113,-0.0048942077,0.0013877826,-0.009530295,0.00039164486,0.012072093,0.010434732,0.0028739132,-0.0040810676,0.0015842132,0.0076771607,0.012264599,-0.006020512,-0.018009586,0.008771579,-0.0053676916,0.0029646084,0.0068961172,0.005394552,0.011488113,-0.011907094,-0.019189619,0.0150826825,0.0030722062,0.001377069,0.014053278,0.0163778,-0.010187406,0.002748961,-0.011576217,0.004419864,-0.0075550945,0.013306021,-0.012294917,-0.013468535,-0.021726983,-0.015837811,0.009982106,-0.00015818415,-0.010510774,-0.00018896963,0.0034586345,0.0040333574,-0.0056225997,-0.013352985,-0.015580152,-0.008183478,-0.010167708,-0.016850298,-0.0031973121,-0.013915667,0.008073658,0.0077689337,-0.006196987,0.009180867,0.013296874,0.004529009,-0.005607616,-0.0074023525,0.0043455106,-0.0027331344,0.016205624,-0.0034685207,0.0024063273,-0.010149746,-0.019634191,-0.008132992,0.06518194,-0.006814478,0.0014242248,0.0022550311,0.00076581235,0.0003435795,-0.024202818,-0.011660823,0.004518379,0.0056762625,-0.015496227,0.019453317,-0.0016171808,-0.004137427,0.0061842734,0.007469205,0.009195724,0.0024038898,-0.008304984,0.0068911114,-0.0025123905,0.013618666,0.10262643,0.012174989,-0.015992278,0.0049995775,-0.0037502514,-0.0019765748,0.009193341,-0.0047067027,0.0008602028,0.008000917,-0.0031199837,-0.000459642,-0.01017976,-0.0011220258,-0.006192706,-0.00074107194,0.004299995,-0.0151443025,-0.0050771334,0.0007126801,-0.01404398,0.0025617625,-9.4926276e-05,-0.0013980932,0.003908846,-0.0062666466,0.011180603,-0.0027258063,-0.012264635,0.006894975,-0.00525352,0.011406258,-0.0028074607,0.0011178866,0.008848645,-0.0054098777,-0.0069189197,0.010923119,0.009634254,-0.00082276756,-0.0024206834,0.009308683,-0.024211705,0.00012504919,-0.019363401,-0.008913808,0.0056061307,0.002518826,-0.005134226,-0.012606555,0.0004147961,-0.003276781,-0.012342037,0.022996195,0.00041002023,-0.013296023,-0.01794022,0.01059487,-0.009947248,-0.010360467,0.034031656,0.012002654,0.010789547,0.0027317577,0.006340027,-0.008548148,0.00520496,0.0056507946,0.007289208,0.007200593,0.0119513925,0.032287836,-0.00036647264,0.007818404,-0.006506232,0.008699213,0.004495795,-0.0063786437,-0.004461055,-0.008089143,0.0131024495,-0.009161533,-0.008070995,-0.0003945801,0.0060822214,0.004023274,0.0038856734,-0.010758706,-0.023079373,-0.011840043,0.009473761,-0.00096075673,0.0019001935,0.002067374,-0.007887742,0.00951473,-0.0061532725,0.0016162404,0.01196079,-0.012586801,0.011836985,0.019993516,0.0024422065,-0.0010327983,0.018588874,0.008662637,-0.013203503,0.010724272,0.002564948,-0.0010746075,0.006863242,0.028741295,0.012782133,-0.018173587,0.0100348815,-0.0069515016,-0.0012038987,0.0016099497,-0.015328598,0.017870724,0.00398488,-0.007266469,0.00016622548,-0.004568321,-0.015483547,0.00095113256,-0.013969562,0.0047415597,-0.009716383,0.012128507,-0.00032530862,-0.011508073,-0.001248377,-0.0019454889,-0.0075799134,0.0048749987,-0.008819329,0.0010706407,-0.04407137,0.012170841,0.015064302,-0.0038494333,-0.0035872725,0.011567202,0.0006538301,-0.0109834755,-0.0066516437,-0.009563054,0.0034028285,0.0067404807,-0.018846951,-0.004132967,-0.0034825252,-0.0065564616,0.011883412,-0.0049129366,0.0005746306,0.007048913,0.007086737,-0.0013262298,0.016558066,-0.045605265,0.01892677,0.017964778,-0.009111936,0.0017850255,-0.013851404,0.01316473,0.0040576947,-0.0033385772,0.009722282,-0.0033960363,-0.010722066,-0.002871068,-0.0003076794,0.0027021365,-0.00036718525,-0.011232489,0.00023576015,-0.00048652943,-0.0062543154,-0.006704237,-0.0055054263,-0.0020591363,0.01061917,0.0036734538,0.0063737347,0.012659196,0.0038093508,0.0038223271,-0.005921995,-0.0087253535,0.0030259753,-0.028804123,-0.0049515963,-0.010868976,-0.007855112,0.008198882,0.0023874852,-0.00991341,0.0014665725,-0.0015325175,-0.01023049,-0.008625329,-0.015681809,-0.002408783,-0.0068321596,0.007653374,-0.0016465047,0.030700525,-0.0016807783,0.0012341426,0.0076065413,-0.012044355,0.0069959103,-0.00223473,0.011406575,0.011611594,0.009306207,-0.013543089,0.009338202,-0.003284001,-0.011084968,0.0021747723,-0.013230051,-0.0071021323,-0.0038765606,0.015531377,-0.0034663721,-0.0023958278,0.015258894,0.019428657,0.00063921924,0.006988868,0.0015164788,-0.0015867179,-0.0030353668,0.022840414,-0.0045051677,0.011136477,0.007577861,-0.004719228,0.0143345585,0.01619675,-0.010675418,0.009137571,0.014697279,0.016082065,-0.0044073765,-0.012742412,-0.0076376153,0.007898367,0.015624769,-0.01969718,0.0028225288,-0.019919427,-0.006352626,0.011368629,0.0027203572,0.00037663814,0.0050334893,0.007433656,-0.0009223396,-0.0121942535,0.016683841,-0.0008757992,0.00667577,0.00036599688,0.006072475,-0.001991364,0.0011639473,0.012452477,0.019709585,-0.021592109,-0.0036112734,-0.0011823687,0.0031715583,-0.00033059315,-0.023660427,0.0062299096,-0.00033136722,-0.01959153,0.016302377,-0.0093157,-0.009643725,0.0073519973,0.012817921,0.004109089,-0.007057127,0.015610862,-0.01602107,-0.00311945,0.018188423,0.004120459,0.0065410924,-0.005296423,0.017554875,0.015211092,0.009580393,-0.0019573707,0.002998833,0.011991149,-0.0065733246,0.024000624,-0.0030276536,-0.008216111,0.01984748,-0.009511305,0.0055678487,-0.0069459663,-0.0050549083,0.009666334,0.001250556,-0.0058898292,0.038712565,-0.006265669,-0.006333891,-0.0133629115,0.0075800866,0.0044000214,-0.005034061,0.016790831,-0.009927969,-0.008888644,-0.017716385,-0.002044469,0.0020013025,0.004912794,0.0011488668,0.0035673275,0.009842696,0.004374661,0.011795081,0.0013294609,0.009595634,0.016149879,-0.003958055,0.0020574597,0.010821381,0.0037249445,0.008931306,-0.0068395166,0.012356262,0.01346862,0.021330606,-0.020853065,0.0040513743,0.005173457,0.0026865508,-0.007828633,0.006658218,0.012063305,0.00935423,-0.0073998035,-0.0020374854,-0.008037577,0.007223709,0.0001547515,5.8527694e-05,0.0035263503,0.0025891843,0.0012378132,0.012943669,0.0019188208,-0.018796844,-0.005813782,-0.110673316,0.022682479,0.00096389034,0.0026439924,-0.01577079,0.006264532,0.0065947017,0.0043235486,0.0014793328,-0.00413107,-0.014932844,-0.014330814,0.0038103678,-0.002421743,0.008342636,0.009624699,0.010241635,-0.0035832303,0.0012187727,-0.0150906425,0.0043706903,-0.0032843363,0.0010644027,0.0007331659,-0.0030269937,0.0026617295,-0.011365166,0.00594769,0.0073701227,0.0145112565,-0.005259686,-0.017453218,0.011482006,-0.013965013,-0.00025393633,-0.014985624,0.0075951866,-0.0034692227,-0.14116791,0.0019527551,-0.0041689607,-0.009853593,-0.009031836,-0.005545976,0.00509735,0.019808032,0.0032817263,-0.008093099,0.0072085005,0.002916872,-0.010383332,-0.0027191008,0.010762973,-0.019802993,-0.009550876,0.001831623,-0.0039697415,-0.0076980568,0.0061026043,-0.00070643466,0.0078007365,0.000109243585,0.012283103,0.011657463,0.010604042,-0.007345641,0.014759511,0.0024244357,0.00047418318,0.004814259,0.012705634,0.0055832863,-0.011755147,-0.0042130467,0.007904042,-0.0059731463,-0.0024849058,0.004289315,0.00639247,0.0021287568,0.003006999,0.00047063915,-0.0031204356,-0.010955757,-0.0031368625,-0.0028051566,0.0020873875,-0.013112974,-0.0064487634,0.0133979805,0.00032433987,-0.0025815433,-0.0029540749,-0.0038326604,0.015832746,-0.0068064025,-0.006578187,-0.0019821853,-0.006496397,-0.0055732145,0.0029582344,0.0035869821,0.00093458936,0.015101155,0.019590575,-0.0054439427]	2026-03-10 08:00:24.10686+00	2026-03-10 08:00:24.161106+00
\.


--
-- Data for Name: chats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chats (id, user_id, university_id, title, created_at, updated_at) FROM stdin;
3e21644e-994d-4a38-997e-87e58428311c	9d84eef9-5c54-4a94-b69d-51e82faaee73	296f159b-5540-4b59-8409-f5bf9f8d6c1e	Brief Greeting Message	2026-03-06 07:09:29.569365+00	2026-03-06 07:09:34.284486+00
c3f1647e-492d-43e1-b43f-459e221a8ede	9d84eef9-5c54-4a94-b69d-51e82faaee73	296f159b-5540-4b59-8409-f5bf9f8d6c1e	Casual Hello Greeting	2026-03-06 07:11:11.613641+00	2026-03-06 07:11:36.861287+00
6c3f7c1e-bcd5-4630-99e5-f7602bc9030b	31cc7cef-c734-4a0d-8368-10440ee52424	db3845d2-5679-4d84-9856-8ff2c82edc4e	UC Total Student Enrollment	2026-03-09 22:40:07.392009+00	2026-03-09 22:56:09.428011+00
7bac37d2-99c7-4a8a-b369-6ee27f8cbf54	31cc7cef-c734-4a0d-8368-10440ee52424	db3845d2-5679-4d84-9856-8ff2c82edc4e	UC Biology Courses Query	2026-03-09 23:05:13.663467+00	2026-03-09 23:14:39.113281+00
ecd8424b-8eb4-45bb-8d4d-e081323fa2aa	de1dc022-ea84-4098-9ac7-5952270495cb	db3845d2-5679-4d84-9856-8ff2c82edc4e	Simple Greeting	2026-03-10 05:26:32.136125+00	2026-03-10 05:26:36.76213+00
06692b0d-b228-4c8f-8225-97b8c06d44e5	31cc7cef-c734-4a0d-8368-10440ee52424	db3845d2-5679-4d84-9856-8ff2c82edc4e	UC Home Game Weather	2026-03-12 00:14:13.115894+00	2026-03-12 00:24:58.421899+00
60289ebb-4626-45a6-8ee0-1121009eec7d	de1dc022-ea84-4098-9ac7-5952270495cb	db3845d2-5679-4d84-9856-8ff2c82edc4e	Next UC Football Game	2026-03-13 09:54:31.60812+00	2026-03-13 09:57:05.425141+00
51eb2284-2cee-4dae-8a56-54b96dc2f16f	9d84eef9-5c54-4a94-b69d-51e82faaee73	296f159b-5540-4b59-8409-f5bf9f8d6c1e	Clubs to Join	2026-03-16 13:21:24.571393+00	2026-03-16 13:21:44.050383+00
df9f023a-0ffe-46e8-bee7-6c6932e7f148	31cc7cef-c734-4a0d-8368-10440ee52424	db3845d2-5679-4d84-9856-8ff2c82edc4e	Next Quiz Timing	2026-03-16 23:46:14.623563+00	2026-03-16 23:52:40.998349+00
0fe52f72-4250-4a82-8bd6-40adc2f83a64	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	296f159b-5540-4b59-8409-f5bf9f8d6c1e	Simple Greeting	2026-03-17 05:58:11.504706+00	2026-03-17 05:58:15.482627+00
8590bc6a-e635-4874-b84b-3b5b989ec940	9d84eef9-5c54-4a94-b69d-51e82faaee73	296f159b-5540-4b59-8409-f5bf9f8d6c1e	Topic Explanation Guide	2026-03-17 10:01:47.747872+00	2026-03-17 10:02:07.527572+00
1cdb0a25-2513-4088-92d8-ad326c0fcea5	9d84eef9-5c54-4a94-b69d-51e82faaee73	296f159b-5540-4b59-8409-f5bf9f8d6c1e	Casual Greeting Message	2026-03-17 10:31:02.117393+00	2026-03-17 10:31:07.71415+00
\.


--
-- Data for Name: community_posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.community_posts (id, forum, title, content, user_id, created_at, updated_at, university_id) FROM stdin;
bd62638b-80a4-465e-be65-be5dae40bc71	have_more_fun	Great local student bar to check out	I am a freshman and I love Topcats - it is the best local bar on campus and everybody is there	31cc7cef-c734-4a0d-8368-10440ee52424	2026-03-17 00:08:38.061616+00	2026-03-17 00:08:38.061616+00	db3845d2-5679-4d84-9856-8ff2c82edc4e
\.


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.courses (id, university_id, user_id, course_name, course_number, professor, created_at) FROM stdin;
756bf9f4-8246-444c-b9de-2750d7d7419b	db3845d2-5679-4d84-9856-8ff2c82edc4e	31cc7cef-c734-4a0d-8368-10440ee52424	Biology 1081	N/A	Dr. Stoffer	2026-03-09 22:32:20.400476+00
5b81802c-a224-4235-8417-d9f24d9ce19e	db3845d2-5679-4d84-9856-8ff2c82edc4e	31cc7cef-c734-4a0d-8368-10440ee52424	FIN 1001 Intro to Financial Success	N/A	\N	2026-03-09 22:32:20.400476+00
4cacb6a8-7320-428b-b895-1c49c7ff8647	db3845d2-5679-4d84-9856-8ff2c82edc4e	de1dc022-ea84-4098-9ac7-5952270495cb	CS	N/A	Pro. jake	2026-03-10 05:18:22.242597+00
7fc0777c-2ed7-4e44-ac67-d64a9d7bb5a6	296f159b-5540-4b59-8409-f5bf9f8d6c1e	b3ec626f-8311-40ae-882f-4d67bfe75163	Mechanical	N/A	Pro. marco	2026-03-12 06:12:52.519025+00
4ab50d72-eac3-42d5-a9d2-73427831439e	296f159b-5540-4b59-8409-f5bf9f8d6c1e	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	cd	N/A	sd	2026-03-13 11:14:41.918001+00
09d5974b-2078-4fa1-ad0c-d6f9482c10b0	296f159b-5540-4b59-8409-f5bf9f8d6c1e	9d84eef9-5c54-4a94-b69d-51e82faaee73	Computer Science 	CS101	Dr. Smith	2026-03-17 10:27:55.548038+00
\.


--
-- Data for Name: document_chunks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.document_chunks (id, document_id, university_id, chunk_index, content, embedding, created_at, course_number, course_name, professor) FROM stdin;
542af94e-5bde-4303-827e-d3d538d6b179	d500e850-ab6f-4062-9771-7e4111260a90	db3845d2-5679-4d84-9856-8ff2c82edc4e	0	### Machine Learning (ML) Overview\nMachine learning is a branch of artificial intelligence (AI) where computers learn patterns from data to make predictions or decisions without explicit programming for every scenario. Models train on examples, such as recognizing cats in photos using thousands of labeled images.\n\n#### Key Concepts\n- **Types**:\n  - Supervised: Uses labeled data (e.g., spam detection).\n  - Unsupervised: Finds patterns (e.g., customer grouping).\n  - Reinforcement: Learns via trial and error (e.g., game AI).\n- **Core Process**: Data → Preprocess → Train model (e.g., linear regression, neural networks) → Test → Deploy.\n- **Tools**: Python libraries scikit-learn, TensorFlow.\n\n#### Sample Practice Questions\n1. **Basic**: Difference between overfitting and underfitting? Overfitting: Model memorizes training data, fails on new data. Underfitting: Model too simple, misses patterns.\n2. **CS 102 Level**: For a dataset of house sizes and prices, predict price for a 2000 sq ft house using linear regression (fit line y = mx + b; train on data points).\n3. **Engineering Application**: Decision tree for classifying engine failures from sensor data splits data by features (e.g., temperature, pressure) until pure classes.\n\n#### 1-Week Study Plan for CS Freshmen\n1. **Days 1-2**: Watch Khan Academy/YouTube intros (search "machine learning basics Andrew Ng").\n2. **Days 3-4**: Code simple regression in Google Colab (free Jupyter); try Iris dataset classification.\n3. **Day 5**: Quiz on sample questions; debug errors.\n4. **Days 6-7**: Build tiny project (e.g., predict grades from study hours); discuss in CS office hours.	[-0.010194214,0.0028312556,0.0007727505,-0.05570605,-0.02662146,-0.005821324,-0.002997702,-0.011074326,-0.007369732,0.028745,-0.0040839617,-0.0030678841,0.00042067622,0.015738145,0.13169688,-0.005168192,-0.007137234,-0.014771614,0.023399394,-0.02352934,0.013717983,0.015395246,-0.019212559,-0.018426945,-0.023778314,-0.018211989,0.018029772,0.0151092885,0.053125445,-0.013762456,-0.020291185,0.023427315,0.008812716,0.02005375,-0.03011767,0.0017664637,-0.010545911,-0.0047307564,0.019851554,0.0027810852,0.0029752483,-0.0078807445,-0.009309537,0.0019959786,0.0075553507,0.010157575,0.0073447735,-0.023391478,-0.017228812,0.015195697,-0.011902081,0.015329392,-0.018853536,-0.20058356,0.010178687,-0.017750058,-0.0058084647,-0.005528172,0.022774586,-0.0059367875,-0.015011284,0.009105195,-0.010006623,-0.0023099154,0.018396223,-0.030001607,0.026712364,-0.002348683,-0.006973577,-0.015651869,0.008170018,0.00029203392,0.002198143,-0.005391676,-0.017534496,-0.016893215,0.008820193,0.030625151,0.0011253043,0.025854617,-0.019194506,-0.00429844,0.01565013,-0.025819559,-0.008241041,0.00971311,-0.014992083,-0.0007195557,0.0032391907,-0.0034739808,0.017401911,0.026688179,0.023714814,0.00014447184,-0.00640456,0.010470093,-0.022429425,0.0054447427,0.007661652,-0.006966455,-0.018664747,-0.024179338,0.008562232,-0.026372273,-0.023088008,-0.01000707,0.016251426,-0.031994015,-0.0067199827,0.0015885652,0.011085491,-0.015462136,0.009393944,0.028621076,-0.004584576,-0.18597208,0.007698916,-0.0005210467,-0.0022929776,-0.003631396,-0.005800855,-0.00048018587,0.011819365,0.007218988,0.007572194,-0.01735937,0.017651638,-0.022812758,0.005238841,0.0022579741,-0.012629193,-0.018757747,-0.0014245891,-0.009165713,0.014010247,0.012909694,-0.009579108,-0.03555419,0.0060233385,-0.011745414,-0.013770552,0.016324647,0.0069234753,0.00859757,-0.01975314,-0.024557084,-0.029669423,0.01684502,0.0036156527,-0.008328653,0.013212925,-0.010979165,-0.0030728162,-0.0053130006,0.005739337,-0.034614887,-0.009503439,0.015437985,-0.006201554,0.0025006754,-0.0027823965,-0.0035195467,-0.006887056,0.016748207,-0.008000665,0.016631909,0.0010778924,0.025588702,-0.013349021,0.014413252,0.008774598,-0.009312652,-0.0136415055,0.017920235,-0.0005706524,-0.01903761,-0.0003138323,0.020208644,0.018945092,-0.01653778,0.01357102,0.008767893,-0.01597596,-0.0055364757,-0.0034655668,-0.008645959,0.0033660447,0.010282064,0.02889853,0.014573999,-0.009236594,-0.0155384075,0.026493264,-0.006344657,0.021184634,-0.015249725,0.012972506,-0.0037889772,-0.009174999,0.012270104,-0.0026645223,-0.007585672,0.008855729,-0.02080387,0.010680256,0.00012370701,-0.016346674,-0.0007073044,0.011753751,-0.01386431,-0.008888168,0.009603501,0.0074509266,0.0029335502,0.011209979,-0.01628708,-0.00545331,-0.019871885,0.008987915,-0.0054906625,0.011641987,0.013375082,0.008913795,0.029696606,0.011656361,-0.010067544,0.0004726515,-0.041414086,-0.001273061,-0.0024857062,-0.01235714,0.01074886,-0.010293297,0.0057229563,0.015707055,0.01269507,-0.007856917,0.034020122,0.01330843,-0.009338474,-0.019826518,-0.007044785,0.0041496153,0.027032075,0.032916784,0.0120742135,0.009248354,2.9768524e-08,0.00038869152,-0.0050923997,-0.003930234,0.018698178,0.0074489233,0.008483016,-0.011564888,-0.0064576752,-0.020153582,0.010195392,-0.024973452,-0.0022308682,-0.022733636,-0.026345754,-0.017599616,-0.012940804,0.0016077568,0.001399837,0.0039868476,0.009320542,0.007868721,0.009249242,0.0009286385,0.0058299764,0.0031850524,0.010858609,-0.007967221,0.018985465,-0.09203521,0.0072317966,-0.007201884,-0.003179639,-0.0019449956,0.018677875,-0.011490335,0.006645707,-0.00080647494,0.016762182,0.009424746,-0.007415622,0.019230945,-0.0057666856,-0.002905226,0.0083174305,-0.023250485,0.005632731,0.008925215,-0.01879833,0.0056910156,-0.003235269,-0.0064724595,-0.0024485558,0.007898135,-0.023658851,0.004082878,0.026256688,0.002074287,0.03261245,0.002467902,0.023008592,0.028627101,0.010900407,-0.023688635,-0.0076456224,0.0042783576,-0.029410217,-0.026404185,-0.018544057,0.0045066564,-0.028829498,0.023152161,0.00907743,-0.0023558037,-0.0074720993,-0.008230163,-0.007425965,-0.01562394,-0.004623758,-0.027124291,0.010214967,0.013782668,0.00189993,-0.003836576,0.009764295,0.013166989,-0.018600479,-0.01320576,-0.0041763247,0.010729356,0.0081911925,-0.019751275,-0.0153915705,0.0003983577,-0.023183832,-0.011675683,0.019031346,-0.00452709,0.030292049,0.00115362,-0.011062272,-0.0062354826,-0.01729491,0.0136046335,-0.017878523,-0.020348273,-0.0054374607,-0.026106518,0.012116483,0.023847051,0.010458265,0.0008666902,-0.0036500033,0.0037732439,-0.0027954152,-0.0026804432,-0.02141834,0.02099972,0.0053578163,-0.010453319,0.029327592,-0.006873043,0.011400581,0.007569559,-0.008892128,0.010121257,-0.011792599,-0.01734471,-0.010702937,-0.0424449,-0.0053576147,-0.03179773,0.021034949,-0.0032474059,0.024423277,-0.0023892545,-0.002843554,0.013549047,-0.020073047,0.029754248,0.011583975,0.0034255493,0.019671304,-0.0057471055,0.011675772,0.0060810028,0.012833923,1.2639872e-05,-0.008075484,0.0020313703,-0.012618222,-0.033690356,0.0006843378,0.010592601,0.007881018,-0.010521324,-0.020662308,0.0117360605,0.003970714,-0.009157808,0.0031630474,-0.022729238,-0.024697574,-0.01403182,-0.011115631,0.024960063,0.04018343,-0.00047538205,-0.014377147,-0.011336657,0.0034442253,0.025135798,0.0036688447,0.012006241,0.026113106,-0.014430538,-0.006345591,0.019354092,-0.010750697,-0.0028919298,-0.0028131371,0.005240764,-0.002922082,-0.0013216363,0.00624105,-0.004627285,-0.00061590626,-0.028549718,-0.023878064,0.015249257,-0.0017881464,-0.017522411,0.00015203099,0.019131612,-0.0006935155,0.029322172,0.015653025,-0.02047631,-0.015789356,0.00971639,-0.022022147,-0.018422099,-0.01120378,-0.012779659,0.0129674245,0.017516186,0.002657227,-0.007035014,6.724474e-05,0.0032001035,-0.00017393434,0.013298132,-0.02094548,0.004252246,0.0223686,0.008567459,-0.016227104,-0.023631591,0.0008737093,0.028386813,0.0017985683,-0.018294018,-0.013348971,-0.0041708387,0.006191393,0.009626479,0.012795536,-0.0020880653,-0.01525038,0.0027780135,-0.014407859,0.01738424,0.009050927,-0.0066430215,0.007520527,-0.0044830064,-0.009547613,0.020423915,-0.002381517,-0.011004495,-0.020071216,0.0057417033,0.003009394,0.029388351,0.016346943,0.017074538,0.019432811,0.010007077,-0.016200263,0.012563817,-0.012418115,-0.015310215,0.00030457508,0.012103831,0.0023615265,0.017440943,-0.0059924144,-0.0037338736,0.00095516926,-0.0108464165,-0.024742678,0.0011345105,0.024287459,0.0022633763,0.008077869,0.00833155,-0.0039857463,-0.027997095,-0.007369972,0.011570244,0.0029782827,0.0039497926,-0.010323595,0.023101168,-0.009692162,-0.0025654258,0.013145774,-0.016976234,-0.020012932,0.02208681,0.033484217,0.01875169,-0.0035951296,0.0015353693,0.00804678,-0.011511081,0.0019890952,0.0037080338,-0.001892302,0.0025950482,0.016214665,0.000861061,0.011596806,-0.005352505,-0.009918904,-0.008240366,-0.02108824,0.029596819,-0.1132998,-0.00091213005,0.016800147,-0.014970193,-0.015655851,0.009267482,-0.0034261153,-0.018812211,0.006556837,-0.0094089955,0.005842625,0.011400424,-0.0102067,0.010162958,0.016951112,-0.0020826478,-0.010004086,-1.1059006e-05,-0.0054417746,-0.017274946,0.013163124,-0.013406808,0.010719738,0.009027892,-0.014143106,-0.004920805,0.029135648,0.013586799,-0.017501079,0.0061102565,0.0044964887,0.012560569,0.011946585,0.025046965,-0.008415687,-0.014354094,0.021516398,-0.022353325,0.010281171,0.0078068925,-0.0065887277,-0.008216375,-0.009336968,-0.0046884227,0.013135469,0.022549355,0.0075827227,-0.03314314,-0.0029210253,0.01413887,-0.033926006,-0.02846198,-0.01358311,-0.010665504,0.0022776015,0.007179729,-0.014240145,0.010580614,0.019489283,-0.006753493,0.022793053,-0.007214757,0.0030927577,0.04652075,0.010032674,0.011662471,0.021196587,0.0024669443,0.026883928,-0.021966161,-0.002563514,0.00074037135,0.01049238,0.006320028,-0.010772745,0.011408857,-0.023878159,0.022847408,0.011525695,0.00798093,0.0151389735,-0.0050046644,-0.0634323,-0.008322024,0.016026424,-0.0014339235,0.0063564884,-1.3458506e-06,-0.030353246,-0.0037697307,0.0014265607,-0.03578416,-0.019497355,-0.013015813,-0.0023933141,0.008187163,0.009815028,-0.0015743362,-0.011179611,0.008785753,-0.010990111,-0.0039162403,-0.0013415064,-0.0021592712,0.024449505,-0.0008546398,-0.001004567,0.033134498,-0.022281665,0.013652503,0.013305637,-0.004900946,-0.005367106,-0.16150323,-0.004559118,0.008591664,0.010328242,-0.00077306014,0.0066363877,-0.014838503,-0.0027158451,0.014543105,-0.0028067557,0.0022538383,-0.034367375,-0.020736258,-0.02027212,-0.0038000883,0.1377822,-0.0031695394,0.027958218,-0.014103239,0.0031684747,-0.020391239,-0.013957023,-0.015344035,-0.0023260058,0.0019748406,-0.006800296,0.019248048,-0.0028664367,0.01180894,0.013520838,-0.006918972,0.015107158,-0.019310545,-0.02662011,0.026189938,0.012059249,0.0025780112,-0.017051121,-0.016102096,0.01663095,0.04707323,0.01409312,-0.021438047,0.00037831248,0.0027524019,0.00018023892,-0.016909795,0.0017398938,0.008289941,-1.0310877e-05,-0.037062846,-0.06641419,0.007859977,0.012196893,0.007420146,0.01020452,-0.02702115,0.010395195,0.026184026,-0.002296097,0.016862387,0.009575146,0.008259138,0.019756798,-0.00077812804,-0.0077536693,0.022718547,0.009296619,-0.0062839,-0.010261768,0.018221328,0.0050647585,-0.0065293936,0.0084864935,0.004218539,-0.016697388,0.003303706,0.017679341,0.00087567675,-0.025296515,-0.0019036187,-0.0034311246,-0.0052256747,-0.009985818,0.008319155,-0.008833163,0.009916678,0.012316844,0.006120636,0.0066493647,0.003387296,0.0026972766,0.003956204,0.013778057,-0.007944232,0.012070358,0.03288584,-0.016390897,0.030457577,0.006324804,-0.007061213,-0.01321114,0.015987474,-0.03215083,3.3632557e-06,-0.010504163,0.032660067,0.014247927,0.019665446,0.001196606,0.005613311,-0.0026310724,-0.0105607435,0.0061590094,-0.0018371828,0.023549402,-0.00021795103,-0.004510553,0.0007228479,-0.019821491,0.0049225963,0.006236378,-0.015564394,0.012001918,-0.0033526784,0.0065682344,0.004264699,-0.0017141957,-0.004947476,-0.0002446898,-0.00054244674,-0.017703958,-0.007174916,0.0046110465,0.003213079,0.0016934825,-0.020226609,0.0019048612,-0.0071933693,0.00069364754,0.0078502325,-0.0031507625,-0.0016055971,-0.009296241,-0.0007089538,-0.006071134,0.0025620484,-0.015992986,-0.010513662,-0.02447473,-0.0041299174,-0.0026264677,0.004807314,-0.010529175,0.0009007951,0.004135878,0.0148786325,0.015116502,-0.0076216427,0.002523636,0.0015712156,-0.01907148,0.0026893953,0.0014440137,-0.0005093825,0.019681713,0.0117136985,-0.0016077224,-0.0058611156,0.017282395,0.005018386,0.0029814597,-0.00062623806,0.0067329975,0.005957841,-0.010158154,-0.011201719,0.0034138104,-0.0071252636,-0.011582544,0.0017284092,-0.01418967,0.008657011,-0.00013391527,0.0006096617,0.0077891173,0.0025910651,0.005205347,-0.0033370694,-0.0065400084,0.0026924056,-0.014630286,0.004003734,-0.008081734,-0.0011907856,-0.006021268,-0.008060314,0.005172513,0.0034145147,-0.01292489,-0.009278137,-0.015484288,-0.0052136364,0.010421307,-0.0036658777,0.0025676342,0.0024799474,0.0046187746,-0.0009009481,0.017678952,0.008039622,0.009024363,-0.01937299,0.004103208,-0.0072210226,-0.00539297,-0.018331632,0.01068635,0.006356508,-0.0072562867,-0.01405707,-0.0069448226,0.0075104395,-0.00027625894,0.00744807,-0.0053951647,0.016415827,0.031356234,0.005579402,0.013733536,0.01442043,0.0024780144,-0.0059092334,-0.022639964,-0.016303536,0.011260886,0.012756282,-0.008210804,0.0063638515,-0.0073874732,0.014047954,0.015192316,-0.0074754925,-0.015572789,0.0039940183,-0.0030789208,0.0009301667,-0.0053344006,-0.0047711963,0.0027992153,0.016479256,0.0035409192,0.012415316,0.008531459,-0.02165206,0.013750148,-0.0035609796,0.0010773432,-0.0041779233,-0.008714167,-0.007563645,0.00019678795,-0.0042308806,0.0031586688,0.0070507345,-0.010151627,-0.00600433,0.0018479561,-0.0017513285,0.021072473,-9.4686424e-05,-0.001197046,0.015472062,-0.017301902,-0.0034078136,0.011935937,-0.013334534,-0.00055740227,-0.00075997005,-0.0003942457,0.0056433026,0.0016253958,-0.0012644163,0.0046739588,0.0033646445,0.0014845872,0.02851547,-0.010413801,0.010825941,-0.0028239298,0.0071372166,0.01527626,-0.011630824,0.010463076,0.00037961642,0.0052724024,0.01995628,0.011827906,-0.010807762,-0.011362172,-0.00035549415,0.004071635,-0.0065367557,-0.010461677,0.010438874,0.00073070993,0.00020940276,0.00048046143,0.017397532,0.0035995103,0.12541535,0.013292181,0.012224289,0.012663262,-0.0013836422,-0.0077991337,-0.0030056168,-0.016013842,0.0073794806,0.021709172,-0.010363461,1.7999773e-05,0.010900576,0.0015186976,0.0026652464,0.002861692,-0.00038206019,0.00306314,0.01254406,0.006037039,0.008856606,-0.0030915274,0.009697803,0.0035322616,-0.00325896,-0.0059714625,1.4968867e-05,-0.0022702387,-0.0010852683,0.011032027,0.0067471596,-0.00024234084,-0.0039527616,0.014413812,0.00057536893,-0.011667111,-0.0092755975,0.01074307,-0.0034495143,0.014753919,-0.01065356,-0.0017225886,-0.003852058,-0.0020195309,0.0072144116,0.012665344,-0.0065137236,-0.013611998,-0.009282413,-0.0077273855,-0.0038088523,-0.0048516863,-0.0046374067,-0.000425439,-0.006429753,0.004077727,0.011381258,0.0070731547,0.0051165004,0.0048472625,-0.0014126615,0.025685912,-0.0022845492,0.009987698,0.009392354,0.0008438056,0.014233493,0.015215075,0.009917016,0.024178684,0.009665859,0.011104748,-0.0026442455,0.008532246,0.040208053,-0.0046651647,0.0005398907,0.0018421254,-0.006858652,-0.009272194,-0.018352047,0.0004287022,-0.017590903,0.0016469546,-0.009302294,0.0038014264,-0.010426156,-0.0039884504,0.0019043621,0.002751053,0.019308448,0.0038269642,-0.015601649,0.0077327588,-0.016957855,0.004285118,0.082495555,-0.00026567702,0.012392954,-0.016818754,0.002374472,0.00194131,-0.0003279375,0.0037130415,0.008814877,-0.00607794,0.0037212984,-0.0016685739,-0.006520407,-0.0029124876,-0.005426942,4.6308855e-05,-0.0071689044,-0.007828337,-0.011745544,0.002786277,0.003484851,0.00465059,0.00015408246,0.02152871,0.009946783,-0.0069020153,0.003052417,0.011575881,-0.010511585,-0.00271151,0.008134307,-0.0003254387,0.015304867,-0.0004342975,0.0016311004,-0.0017204711,-0.008134817,0.0047833864,0.0077225133,0.009034035,-0.0059750522,0.0049420106,-0.0055278856,0.0008811957,-0.019681046,0.0037796858,0.002865343,0.0038682912,-0.0014073662,0.011707254,0.008861492,0.0002710755,0.012287896,-0.0032212907,-0.0028162943,-0.0070473053,-0.01340975,0.025662206,-0.006265796,0.005697238,0.0060922513,-0.0057590343,-0.0028000246,0.017013071,-0.0056844763,0.01459287,-0.0044068615,0.0031194473,-0.0026977768,-0.004769799,-0.003724144,0.0100282915,0.006082031,0.0063499273,-0.004107662,0.013236284,0.0031279586,-0.001618839,-0.013660628,-0.007522587,-0.00019423061,0.00072100223,-0.021405641,0.01667547,-0.009245573,-0.0010092184,0.004853528,-0.0057454794,-0.007203574,-0.009812906,0.01710614,-0.012533686,0.015722837,0.0018163864,-0.007964216,-0.011866634,-0.0036302088,-0.0067142504,0.008485113,-0.0061145336,0.008938102,0.007977684,-0.004006631,0.0041226917,-0.005271182,0.007077892,0.009104188,-0.0023140053,0.0044923043,0.0006932588,0.006884536,0.004714431,0.0033744157,-0.0052156737,0.0016294589,-0.006922357,0.011197529,0.008915449,0.01325049,0.0063722488,0.0027125692,-0.013081921,-0.004490807,-0.0015573044,0.0049393205,-0.007179565,-0.016752867,-0.0007870418,-0.010647761,-0.0032575058,0.0147543205,-0.002905357,0.00902809,-0.010630555,-0.012285866,-0.0024855984,-0.020945633,0.003313193,-0.02722215,-0.0037207967,0.005774975,-0.0067426628,-0.010854283,-0.008535614,0.00857391,-0.004999306,-0.005776981,-0.00047807975,-0.0014061739,-0.0020500459,-0.012187835,-0.00091091386,-0.0015217634,-0.006198421,-0.011471268,-0.0016375791,0.0072011873,0.0018157358,0.009044336,0.011539904,0.010894736,-0.06341894,0.027998336,0.0034904906,0.0069945813,-0.007566808,-0.01299489,-0.001334441,-0.0021715132,-0.0021650866,0.007800881,0.015213536,0.0036305347,-0.007565637,-0.0014137017,0.0077467053,-0.007695106,-0.016215827,0.017171355,-0.007307892,-0.0050623585,-0.009172939,-0.008749127,0.0038664588,0.0037600128,0.0019192062,-0.012806276,-0.00297961,-0.0025561405,0.0018078585,-0.0027943233,0.014265494,0.022001157,-0.0004280886,0.0049310527,0.006453467,-0.0043198434,-0.008361395,-0.015355635,0.0038591335,0.0032088105,0.016811632,-0.00493474,0.014593132,-0.010264154,0.0018891215,-0.019488644,0.0037908687,-0.020703297,0.010924071,0.008971138,0.00048893166,0.014268241,-0.0046202377,0.007976911,-0.0076591214,-0.004632666,0.0044085844,0.0055619553,-0.013211292,0.0027842429,0.0062408596,0.00219113,-0.0020982893,-0.015733719,1.7191322e-06,-0.009233689,0.013440062,-0.004573036,0.0013580733,-0.0048161224,0.0026030804,0.01483135,0.023779418,-0.017145269,0.012688197,-0.0022508097,0.0048521007,0.00731545,0.014958763,0.013139668,-0.00383894,0.01489005,-0.004390745,-0.0039978563,0.004277911,0.007267092,0.0007922154,-0.010144733,-0.007811133,-0.007874847,-0.012563157,0.011508641,0.0036989541,-0.0052446034,-0.0022100096,0.008238086,0.0011271052,0.022253627,0.018411575,0.011231826,0.0047094463,-0.0040820506,0.019158157,0.011020541,-0.016183421,0.015596021,-0.0076331906,-0.006167602,0.0071640294,0.0032847454,0.010440899,0.0015844936,-0.0016154452,0.0036640821,-0.007122356,0.0013060509,0.0025569913,-0.0120590385,-0.008497423,-0.003670271,-0.006410873,0.026258957,0.00096228,-0.007519239,-0.0041982033,0.014345947,0.008188249,0.00379735,0.0059257126,0.009395576,-0.0073898425,0.012382439,0.004637262,-0.013773868,-0.0036437612,0.016082933,0.0059578926,0.011096194,0.001965001,0.020016264,0.0041510393,0.01375258,0.0067574233,-0.011032638,-0.00584669,-0.005123762,0.0050340383,0.006941722,-0.0015629975,0.0021032027,0.0014497257,0.0061934977,-0.0021311103,0.0048850924,0.004995654,-0.00283377,0.007486727,0.013677878,0.019768806,-0.0027261141,0.023133308,-0.0013097061,0.0024466235,-0.005211764,0.02104456,-0.0010869013,-0.009548471,-0.0033296861,-0.0045165233,0.002689598,-0.00049554015,0.0030617414,-2.149072e-05,0.00038069623,0.0001636603,-0.0059470045,0.0059100515,-0.0028484378,-0.0075944187,0.009223203,-0.002314447,0.0037907683,0.0021492834,0.013348812,0.005084453,-0.0050116866,0.007850008,0.0017565646,-0.0006129524,-0.010163706,-0.0028619086,-0.008625959,0.0051086615,0.009327115,0.0004166226,-0.008854374,0.013424689,0.0010785798,0.0036701283,-0.009451397,-0.011654171,-0.0067207087,0.0070772395,-0.0014681739,-0.004504044,-0.13042061,0.011645722,-0.0018755634,0.004900624,-0.011502821,0.008683589,-0.009987361,-0.008793658,-0.017626291,0.005734365,-0.01914546,-0.004112696,0.008148016,-0.030523278,-0.0029344733,-0.011930344,0.008078201,-0.010885328,-0.0038464828,-0.015772702,-0.004254092,0.0085320305,-0.016485404,0.0042089596,0.0045881537,-0.005847493,-0.010150114,-0.009192593,0.010838694,-0.0019549788,-0.006689634,-0.014899162,0.021748383,0.0043029245,0.0073462245,-0.0019265477,0.015616058,0.015478122,-0.14432988,-0.009261849,-0.0051479447,-0.004392308,-0.01047014,-0.0017078602,-0.002043697,0.0043603485,0.005378327,0.004057762,-0.00026743923,0.005155832,-0.00211391,-0.0053894813,0.007232356,0.0018983642,-0.00971092,0.003597831,0.0042250496,-0.0056750095,0.0002664424,0.011781695,0.011975584,0.0040500215,0.009499399,0.020380765,0.0065443097,0.002459068,-0.0013298854,-0.015957085,-0.0049510305,-0.0043199225,-0.002300958,-0.015907925,-0.011570484,0.0048097037,0.0014834991,-0.0020872008,-0.0020229295,-0.009332895,0.0010876821,0.0050080675,0.003755461,0.0059995237,-0.013666181,-0.0037057882,0.008401128,-0.0043375646,0.008577162,-0.0010197941,0.0029035313,-0.006397824,-0.0065890355,-0.006242772,0.013297082,0.0006922811,0.009246331,-0.0032589668,0.00019137087,-0.0031843185,0.004314595,0.008406013,0.005528289,0.013134921,-0.0016466848,0.0032900963,0.0125342915,0.010638512]	2026-02-27 13:57:35.832015+00	\N	\N	\N
2fa4527c-0f4c-4761-ba21-ea6c7e06a837	b3509577-002b-4b41-aea0-6c18f0f3371f	db3845d2-5679-4d84-9856-8ff2c82edc4e	0	University of Cincinnati (UC) total enrollment (undergraduate + graduate) is approximately 47,000 students, with exact figures fluctuating yearly due to admissions cycles. For the most current 2024-25 numbers, consult official UC sources such as the [admissions page](https://www.uc.edu/admissions.html) or registrar reports.	[-0.028616035,-0.009137316,-0.0003277342,-0.0455185,-0.0037117663,0.027927186,0.011673176,0.01398012,-0.022900669,0.003167922,0.010605207,-0.016121073,-0.010971498,0.0152319735,0.08196159,0.032833636,-0.0147082945,-0.012395285,0.026348589,-0.021362372,-0.02496918,0.030946482,-0.031195832,0.006978221,-0.015539486,0.0030645304,0.016199108,0.0074294475,0.017646808,0.012658906,-0.011572404,0.008574342,-0.008382715,-0.00010811416,-0.010745923,0.0023062108,0.018009212,0.0012446966,-0.0007552734,-0.006401479,0.011014183,0.025332198,0.014049977,0.0029696885,-0.006821295,0.009963378,-0.013585357,-0.045895584,0.0021605974,0.01375662,-0.011983804,0.014886637,-0.029211849,-0.20441628,-0.015713751,0.014153437,0.010053513,0.012773613,-0.00037846935,0.013917251,-0.016568203,0.01195669,0.003741429,0.006522051,-0.00027576397,-0.003216864,-0.005451448,0.019613784,-0.00093393296,0.009388201,0.010724527,0.009732429,-0.015712041,-0.008299676,-0.005946029,-0.030712955,-0.011515908,0.011035137,-0.0059416136,0.006912385,-0.000919211,-0.0030564016,-0.012897796,-0.017199576,0.0076383916,-0.004168108,0.006654553,-0.010658242,-0.0110474005,0.00019121215,-0.010700562,0.030877465,-0.00023893037,-0.03003276,0.02231565,-0.022423442,-0.0018224958,0.021381455,-0.024605418,-0.004261949,-0.011849376,-0.01427544,-0.02240057,0.005416656,0.024218967,-0.020261183,0.014236095,-0.028064683,-0.0006028382,0.0056837522,-0.0043619913,-0.013501494,0.0074988273,-0.0149751585,0.0061491956,-0.19821134,0.018256992,0.016552428,-0.0022444418,-0.029381217,-0.008569761,-0.008155492,-0.008566588,-0.021184701,-0.007875242,0.009829208,0.0071384776,-0.032718703,-0.012266132,-0.011750251,-0.014367933,-0.044719145,0.005487499,0.00030910346,-0.018268527,0.012188805,-0.012284558,-0.027100997,0.011788346,-0.02952771,0.013930287,0.008941029,0.004161342,0.03378798,-0.018643016,-0.012522431,0.0054820934,-0.0025419989,0.012172355,-0.01674317,0.016230928,0.014672877,0.019977923,-0.004665852,0.01860293,-0.018115744,0.022270456,0.0126086455,-0.021118617,0.011640328,-0.015914012,0.005323907,0.0038666828,-0.0030270354,-0.000438175,0.0066373553,-0.016024536,0.011937336,0.016735634,-0.0061497455,0.019104289,-0.011549136,-0.01318215,-0.025260603,-0.012445597,-0.018106587,0.031221315,0.0053591765,0.013017963,0.0031880152,0.004154234,0.0096451435,-0.018337388,-0.014161679,-0.027685685,-0.023580443,-0.010685694,0.017899407,7.9203615e-05,0.0020020814,0.018499086,-0.013740216,-0.01520757,-0.016524315,0.010699273,-0.0080124,0.01633287,-0.014660011,0.0033391837,0.0012417934,-0.0051392964,0.014927818,-0.0014267227,0.021457737,0.025840608,0.017275164,-0.016276672,-0.0025519957,0.0107493065,0.038202897,-0.00135559,-0.01131276,-0.008640768,-0.0015561112,0.01803759,0.008889972,-0.019927,-0.023328077,0.0054589617,0.008295841,0.004558086,0.0028935217,0.004967676,0.028558044,-0.0036611839,0.0010471044,-0.012498792,-0.017209437,0.027236875,0.032942448,-0.007816728,0.003650061,-0.009113124,0.010155785,0.0018377568,0.0021878255,-0.021764338,0.00042888222,0.021804815,-0.022570493,-0.025140826,-0.014532888,0.008258314,0.010623138,0.015965827,-0.00034065408,0.004899674,-0.02092835,-0.00048549808,-0.0037149868,0.027556969,0.0024280786,0.009907324,-0.004528204,-0.034602277,-0.0024932388,0.008154517,-0.023218539,-0.00963004,0.01840041,-0.019149078,0.0013302668,0.0016318214,0.001624916,-0.023831662,-0.005003496,-0.011820032,-0.02837898,0.007332948,-0.002716308,-0.03387845,-0.008692486,-0.018234532,0.0052459924,0.0006894178,-0.010819169,-0.104759775,-0.0019086113,0.011922723,-0.037966125,0.018555857,0.035847746,-0.0036932223,0.015326572,-0.016491761,0.007976751,-0.024896083,-0.009008238,0.0008228057,-0.019071618,0.00028126052,0.013594326,-0.016344236,-0.0022414532,0.020230552,-0.027465511,-0.0069249156,-0.0070638596,-0.032821465,-0.008998517,-0.0067060036,0.009092761,0.008260062,0.036070794,-0.00959042,-0.010307425,0.0103958305,0.005275496,0.009109211,0.004580768,-0.026852116,0.006087594,0.0055157067,-0.0061789127,-0.0057413885,0.01062551,0.02661717,-0.0022898405,0.023276895,-0.0058819237,-0.0077834288,0.012631268,0.0146507295,0.007034848,-0.010844321,-0.01960596,-0.0061651682,0.0041945223,-0.015009604,-0.011969709,-0.035542406,0.012239274,0.0059488127,-3.4109977e-05,-0.004841776,-0.008405411,-0.00079020404,-0.0094597265,0.016435502,-0.013128331,0.013110926,0.0073449533,-0.0025240714,-0.009910839,0.00016225182,-0.0061047906,0.015046437,0.009963671,0.017169949,-0.024615197,0.016767047,-0.011944719,-0.012790417,-0.036459025,0.00051899796,0.0107320575,-0.005971822,0.039537434,0.004582811,0.012535642,0.008894713,-3.451971e-05,0.036400493,-0.012241895,-0.0030689777,-0.010297102,-0.011159803,-0.007390767,-0.004831743,-0.026731834,0.011464134,-0.007597046,-0.00278596,0.026808985,0.017342528,0.0063485773,-0.0016415499,0.025113866,-0.007960137,-0.00059941533,-0.00044037058,0.030527046,-0.02069433,-0.0056161378,0.010681169,0.010833208,-0.0041719605,0.002295785,-0.00902519,0.008271195,0.00024224061,0.003967077,0.0022157584,-0.0067067523,-0.006712474,0.008253934,0.0034229348,-0.0022836574,-0.004245094,0.010111299,-0.007053746,0.0048435926,-0.0124954125,-0.010915581,0.01980981,-0.0010349355,-0.014265454,-0.0074572293,-0.015987689,-0.034030758,-0.0066773375,-0.0068417666,0.011728371,-0.004864202,-0.018942732,-0.03582045,0.020312702,0.011190594,0.019422479,0.0078861285,0.0068460014,0.021190356,-0.018793654,0.005023269,0.011102085,-0.0039023783,-0.03792841,0.006797176,0.006809009,-0.008493174,-0.0029208062,0.011261633,-0.019195532,-0.00051219657,-0.013700901,-0.0045805513,0.008298823,-0.0068906643,-0.00026916072,0.0017112291,0.021555794,-0.00720095,-0.0030758923,-0.010011069,0.0006862226,0.002519218,0.0010650356,0.0013993102,0.00442468,0.015455575,-0.0064153173,0.011183349,0.015175204,0.012612223,0.00054943166,0.024828315,0.001954379,0.0008629676,-0.0042678043,-0.007769372,-0.020449763,0.005777598,-0.0009983251,-0.019606413,0.00027051813,-0.0058139763,-0.012168946,-0.0025585871,-0.008169721,0.013273211,0.0030933642,-0.010619444,0.008174273,0.006745855,-0.014787297,-0.02216754,0.038102347,-0.006582756,-0.012257243,0.007924996,-0.014407353,0.0011177136,-0.0054525356,0.021003075,-0.016856452,0.0057136137,-0.00338564,0.0025259338,-0.0009995295,-0.0019376487,0.008387287,0.005916586,0.003802481,-0.020325836,-0.014210536,-0.011433861,-0.00026926285,0.0018006177,-0.024280408,-0.0061900555,0.01791017,-0.019211901,-3.4096797e-06,0.027503826,-0.018481612,0.01023113,-0.025121246,-0.027812578,0.0067400476,-0.009863908,0.010871866,0.01939457,-0.0045343954,-0.00688791,-0.018117316,-0.003137594,0.00043754466,-0.021903059,0.011318918,0.014542856,0.0056894305,-0.021095073,-0.008124253,-0.00602895,-0.011501168,0.010464598,0.020480996,0.0033402892,0.010960905,-0.003388432,-0.002625291,0.013578778,-0.020659324,-0.01301643,0.0013740114,-0.023845388,-0.0021158576,0.0047460706,0.035230804,0.014605007,0.0020132463,-0.031721953,0.013661548,-0.0034045305,-0.006157159,-0.07773813,-0.0079823835,-0.00942024,-0.008143961,0.0030570847,0.0028166932,-0.021710798,-0.018586744,0.0101447655,-0.011808056,-0.00811075,-0.013038931,-0.018955706,-0.015048392,0.008423588,-0.023270309,-0.006691706,0.03254167,-0.021540286,-0.0004804252,-0.003799389,0.02687625,0.0037535452,-0.012960105,-0.010486756,0.010670151,-0.0139289,-0.010651243,-0.034432948,0.008700698,0.0020788077,0.02253319,0.019113543,-0.0116753075,0.016569054,-0.019630685,0.0010035345,0.007035223,-0.003755159,0.03248573,0.00047709426,-0.0063324952,0.011749779,-0.029891161,-0.013981697,0.0092387665,0.03619365,-0.01860176,0.0050635217,0.0046129646,-0.026396912,-0.012126199,0.00632238,-0.01079622,0.004394842,0.007770527,-0.018395694,0.010612339,0.006795926,-0.007510323,-0.0018354421,0.0037303644,0.0072520147,0.029231189,-0.003399697,-0.0034925467,-0.013387548,0.004373184,0.004608381,-0.023989467,0.0051091113,0.008448098,-0.010767946,0.01820226,0.004637687,-0.0023684832,0.0007765174,0.01220044,0.0138253085,-0.017115528,0.0192341,-0.012013919,-0.048108812,-0.0046319636,-0.030739758,0.0016208844,-0.0018061292,-0.011663349,-0.02994072,0.019304357,0.0027685226,0.010761805,-0.00045222495,-0.0033767172,-0.009312061,0.0004392513,-0.01581471,-0.015613607,0.011096651,0.003610105,-0.0018097333,-0.016188111,0.002613665,-0.0020837195,0.028069029,-0.004080587,-0.016242351,0.029065643,-0.010457509,-0.021032797,0.007994919,-0.042693485,0.014233578,-0.14435175,0.0066279634,-0.00078465656,-0.007016056,0.0052617383,-0.021372957,-0.0009461418,0.0075755557,0.010244955,0.014696112,-0.0036228949,-0.015614041,-0.015392461,-0.00023496988,0.016020214,0.15807451,-0.01034082,0.017365167,-0.018055625,0.010066835,0.0076153087,-0.0033603543,0.015566823,0.013040121,0.014177745,-0.010515951,0.03436435,0.024088115,-0.0023267178,0.025570828,0.0070238956,0.011382739,0.0116108935,-0.00961237,0.01806701,0.01693226,0.0038151431,0.0006295244,0.013090605,0.005146321,0.019026984,0.0047888746,0.028598625,-0.020121675,-0.030761536,0.028671572,-0.019012822,0.017820265,-0.021119043,-0.014086408,0.0038390728,-0.06159697,-0.02441466,0.0033139153,0.017055565,-0.0140604265,-0.028559228,0.015424363,-0.01104543,-0.0011603808,0.013420983,-0.01869018,0.0043020193,-0.00023683257,-0.013631085,-0.010017375,0.018387018,-0.019763026,-0.0036223552,0.014816649,-0.026623402,0.0052474267,-0.01937734,-0.002371038,0.009399257,-0.0050706333,-0.0059400573,-0.005901636,-0.00017326948,-0.011977182,0.0028133038,-0.01429042,-0.0035047513,-0.011225962,-0.021361751,0.019592816,-0.024154149,0.0040068747,0.0040494706,0.004853381,0.01815211,0.016013393,-0.011997255,0.011591382,0.011548275,0.0039471863,0.04337499,-0.023429072,0.017369134,0.0035116463,-0.008820655,-0.029719763,0.009179203,-0.009992697,-0.05366681,-0.018978063,0.006689606,-0.0057005333,0.046909433,-0.0003172284,-0.005120966,-0.0028476696,-0.017154964,0.014179952,-0.017908487,0.011264314,-0.013350676,-0.004550896,0.0009159667,-0.01853366,-0.0014243859,0.0010832503,0.0030453918,0.0075904164,0.0018585001,-0.0016007847,0.00038309372,-0.005249873,-0.0051181028,0.012083909,0.021216763,-0.00614009,0.013153457,0.024629083,-0.0094717825,-0.009285807,-0.0120858215,0.0037255974,-0.0037459251,-0.007548096,0.016137738,-0.010400577,-0.0042832997,-0.0048414613,0.0038862599,-0.0037914512,0.0045167697,0.011657129,-0.028010808,-0.0012107203,-0.009953653,-0.01111194,0.020688556,-0.0058913724,-0.010168251,-0.010218118,6.299312e-05,0.0014869035,-0.0021214078,0.0048826667,0.0062575564,-0.01237863,-0.0126256,-0.0005440305,0.0111241555,0.008149694,0.012331038,-0.004394942,0.0125317015,0.010380778,0.010047888,-0.0038055696,-0.0088848835,-0.010726488,-0.008463022,-0.0010087305,-0.0030120907,0.0028842397,-0.008283665,-0.005002004,0.0154558625,0.010382548,0.012573457,-0.010667069,-0.009899911,0.007592045,-0.012845098,0.014709909,0.008770701,1.1585842e-05,-0.0034385931,-0.012454558,0.014816604,-0.011738866,0.0020360802,0.0015658981,0.004680481,-0.0006882141,-0.0063319826,0.0043087336,0.0019303138,0.008929333,0.006961174,-0.0059802225,0.0025411407,0.023089401,-0.013409032,-6.5432064e-06,0.0008514522,-0.0047360845,0.011229048,-0.0026835361,-0.00844906,0.009926285,0.0069533084,0.0048554377,0.0077750185,0.013196508,0.006080897,-0.0048336107,-0.014804305,-0.0051772883,-0.0013557043,0.0035297389,-0.003707191,0.0077295406,-0.010139362,0.019691832,-0.003103186,0.0033506218,0.0025766285,0.005381131,0.008645665,-0.003268118,-0.0024217041,0.012683738,0.0014227817,-0.008623451,0.021270402,-0.0026066168,-0.0025138457,0.010497157,-0.012850523,-0.012301785,0.004234405,0.0109062465,-0.014334138,-0.006351332,-0.005231718,-0.017255833,0.012636319,0.0010506228,0.02234903,0.0030455913,-0.013666346,0.0031418481,-0.009606166,0.011072123,-0.010386424,0.010838843,0.0076330975,-0.0067086928,-0.012656257,-0.0033429256,0.016215242,0.002365928,-0.0007170569,0.0059555853,-0.005360962,0.009832843,-0.017055627,-0.003002341,-0.008979534,-0.0040636277,0.00779481,0.032580663,0.0023767438,0.0032633534,0.009697663,0.0019472374,-0.0025131304,0.004985692,-0.004894773,-0.013675644,-0.0123971505,-0.01806576,-0.001230463,0.009943933,0.00038109938,-0.007855962,-0.004810275,0.029459236,-0.007858271,-0.0017334674,0.0035899489,0.00615746,0.019882504,0.012226479,-0.0037358073,0.0031461448,-0.008862913,-0.005565231,-0.005767575,-0.0011024971,0.007562259,-0.007421159,0.0024944162,0.0040566786,0.012854518,0.008719994,0.12254575,-0.0045914976,0.004666098,0.015987394,0.00429759,9.256154e-05,0.0063768304,-0.00010820102,-0.014272756,8.572975e-05,-0.001828019,-0.008551053,0.013554255,-0.0036872302,0.006398851,-0.006769949,0.012079455,0.016048897,-0.00746843,-0.009907189,-0.011528757,0.005903342,0.0037291436,-0.0047939857,-0.006678549,0.003868146,0.004131362,-0.010676811,-0.0091863,-0.004348458,0.0026455056,0.01284763,-0.0063821236,0.000987907,0.0006381534,0.003770425,-0.011404253,-0.0014026723,0.006952856,0.01492528,0.00922307,-0.008574495,-0.01486352,-0.0029954575,0.023355644,-0.013241479,-0.010958236,0.0012321383,0.011531105,-0.006514611,0.0026827808,-0.010064105,-0.0013096066,-0.0011186277,-0.004294615,0.0020602618,0.0034222933,0.01771563,0.0066634403,0.0064554256,-0.012033479,0.004151131,0.0183539,0.0028369497,0.0031290145,-0.016423004,0.014857657,0.0021203181,-0.0011410925,-0.016230125,0.0014447188,-0.005974442,-0.00039324834,3.1387084e-05,0.03772601,0.0024172862,0.0091600325,0.002693657,-0.01344406,-0.007950008,-0.014035322,0.013388581,-0.014501037,-0.0019028835,-0.012568196,0.0066623236,-0.0051082307,0.0043905796,0.0023582494,0.018784493,0.00922679,0.006637508,-0.0062010763,0.0035709315,-0.016629657,0.003508449,0.082761794,0.009491604,-0.007985199,-0.0025083304,-0.0035409275,-0.013150282,0.006485903,-0.0030147769,0.0013670719,0.009616957,-0.0044048754,0.011796801,-0.007928332,-0.0021651268,-0.0075698053,-0.004840305,0.005556063,-0.005688532,-0.0137787,0.0060384865,-0.006921077,0.004489577,-0.0074632303,-0.00362054,-0.0018140143,-0.01347226,0.009982693,0.012103292,-0.00951121,0.002536708,0.00038030584,0.009068542,0.014053773,-0.0022797275,-0.015141427,0.004443027,-0.0020693864,0.011089339,-0.0070244092,0.004219412,0.007474733,0.006032463,-0.0007214222,0.011155795,-0.020354047,-0.006091413,-0.0021620844,-0.0016851587,-0.004351801,-0.013323458,0.01064087,0.020193396,-0.008974922,0.00956094,-0.0045188707,-0.028343286,-0.023888016,0.0039744284,-0.0073355692,0.011858552,0.006294614,-0.009490825,0.013646383,0.00010344742,0.009044241,0.0084406845,0.002722545,0.0196213,-0.0055183666,-0.0054907366,0.0031546138,0.011360164,0.012996756,0.006025902,0.002926853,0.008223127,0.00956463,-0.0064840484,0.00011618699,-0.0078394255,0.019710513,0.0025795754,-0.0031351442,-0.005181914,-0.010715898,0.007530788,0.010175767,-0.017165186,0.005294943,-0.010661882,-0.0014492624,-0.01110109,0.013360107,-0.0034713768,-0.024031399,0.01206966,0.0063600647,-0.004815468,0.0043022092,-0.021312386,-0.0070710313,0.015471534,-0.009033092,0.008956693,0.012171163,0.024040237,0.005098407,-0.0050355094,0.0033904142,0.008962779,0.006021018,0.0273898,0.015041125,-0.013723545,0.0009643418,-0.018129984,0.005261362,-0.0027220037,-0.010591107,0.012681155,-0.00790835,-0.008508603,0.011698152,0.012844719,-0.01421069,-0.004127675,0.0015793276,-0.013608518,-0.017931182,0.016769554,0.00058908673,-0.006833277,-0.018845227,0.00050180545,-0.012060119,0.0050499504,-0.008153764,0.0070746257,-0.032493826,0.003577543,0.0035383597,-0.0029314114,-0.01258021,0.0077791424,-0.003398418,-0.019496784,-0.0021366442,-0.0021153959,-0.00318381,0.0022182246,-0.0027324185,0.017465992,0.0027213874,-0.0055380645,0.017899765,-0.008126555,0.017373327,-0.0010478528,-0.0068753376,-0.0041859066,0.010099648,-0.047684986,0.017763533,0.0060544675,-0.0051374356,-0.0060683,-0.0008011555,0.008835249,-0.00034691393,-0.006987567,-0.005590481,-0.013791619,-0.0076221293,0.0038595216,0.0008577447,-0.006624804,-0.0030031481,-0.006905011,-0.004235259,-0.011647002,0.0011813833,0.0047192657,0.007829468,0.0033156343,0.00021160531,0.001081294,0.020397147,-0.011315814,0.012648572,-0.0031161737,-0.004458473,-0.006273057,-0.0028870543,-0.0009268728,0.014790558,-0.009773344,0.003641526,0.00834959,0.004297657,-0.001786768,-0.0011873832,-0.00499819,-0.020801341,-0.001354397,-0.020997725,-0.0073861177,-0.007868689,0.016744785,-0.008937611,0.003984708,0.009324811,0.002945565,0.017840415,0.013923414,0.0033789182,-0.013822355,-0.0030567544,0.007937515,0.0036356791,-0.0147096645,0.003404141,0.0008826934,-0.001218288,-0.000763915,-0.025731564,-0.009386382,0.008782363,0.020110384,0.0058448804,0.009053367,6.893909e-05,0.014201306,0.019412838,-0.0077473335,-0.0077097337,-0.0015680273,-0.01977476,0.017808152,0.007158339,0.0004165937,0.004633492,0.009549325,0.022266306,-0.009499938,-0.019765247,0.009062148,0.0032781835,0.017379882,-0.0012387339,-0.011445498,-0.01240033,0.0040613273,-0.0034523245,-0.00017722967,0.0008291913,-0.015640952,0.00020256209,-0.010244978,-0.016185919,0.007872669,0.0015262384,-0.008220793,0.0071281497,-0.01912157,0.027974738,-0.0028217968,0.006087778,0.00036680565,0.0116374185,-0.013112427,0.000933621,0.009156721,0.0010928637,-0.0025760033,0.00076646585,-0.0014388309,-0.0072217537,-0.012731306,-0.01727133,-0.0019179112,-0.00553113,-0.023500217,0.013314248,-0.0022207743,-0.0064791795,0.0010746575,0.007046688,0.018886475,-0.011628308,0.012218156,0.0048936205,-0.009688837,0.0075066146,0.018279998,-0.0044303373,-0.0067651304,0.015905555,0.00026842183,0.021245621,0.0106051685,-0.0010926382,0.015227706,-0.009319816,0.018092547,0.00065195747,-0.00035707589,0.011590434,-0.012836036,-0.004183462,-0.0064861234,0.0057619954,0.00084962917,-0.0120351175,0.0009407018,0.018857574,0.013846606,-0.01184146,-0.01452991,0.0067709517,0.0038924909,-0.022003265,0.020344215,0.0025534912,0.0069683883,-0.008238113,0.004144211,0.008067681,-0.002677343,0.012170128,-0.010863724,0.0031831735,0.025462152,0.022884611,-0.010518294,-0.014838568,-0.0031389697,-0.0066741155,0.0064755394,-0.011432242,-0.00655168,0.0030006184,-0.011510574,0.009285993,0.014886071,0.00965832,-0.0045607565,-0.0045375936,0.012676856,0.0061983075,-0.004771634,-0.0013802344,-0.004057439,-0.0017022209,0.011944968,0.0094348965,0.003937545,0.00012876153,0.0054559954,0.0018525633,0.01805499,-0.0081030475,0.011432506,0.016443027,0.0051917583,-0.010753172,-0.013513844,-0.098262206,0.016568383,-0.01912044,-0.016037015,-0.013684038,-0.0028660966,0.00015122224,-0.0036533715,0.0031285305,-0.0032881561,0.0048338114,-0.013591624,-0.0059244684,-0.03506342,-0.0035013217,0.0036528583,-0.011916281,0.0062739346,-0.011035455,-0.024017118,0.009130175,0.011821745,-0.0008768593,0.013485959,-0.0085172225,0.016881207,-0.01191265,-0.012652789,0.0074889488,0.020022413,-0.0040835133,-0.015633274,0.014567116,-0.011561684,0.00096444454,-0.007591896,0.0049435184,0.012506656,-0.15406695,-0.009068915,-0.0039584963,-0.0017077795,0.0011218182,-0.0064791706,0.008922283,0.0077919764,0.0025668233,-0.019966446,-0.0012546247,0.0076996568,-0.00368224,0.0040138057,0.0056170183,-0.021114292,-0.002164526,-0.000694757,-0.0006148877,-0.0058143954,0.004888892,0.012836331,0.013208462,0.004455298,0.0013624872,0.012354525,0.026895028,-0.006814167,0.00067946344,0.0053347223,0.012139938,0.007094924,0.012884142,-0.01057778,-0.0055598216,-0.006689541,0.0004594795,-0.009085608,-0.016457906,0.010156425,0.018520597,-0.0017797578,0.008859728,-0.0019775417,0.001244944,-0.0030952129,-0.0022801023,-0.005351988,0.013787416,-0.009804624,-0.017787796,0.0034806654,0.005503851,0.0082340585,-0.0017522725,0.001963604,0.0052376254,0.0009946866,-0.004627345,0.008205992,-0.00181736,0.010738654,-0.009886637,0.009554838,0.030060198,0.006741843,0.013359702,0.0070156315]	2026-03-09 22:40:50.509202+00	\N	\N	\N
44e9ec06-a514-4d49-b961-ab35405718d5	016c2a70-59ab-4be1-b84c-d4e54c557871	db3845d2-5679-4d84-9856-8ff2c82edc4e	0	University of Cincinnati's Department of Biological Sciences offers dozens of undergraduate Biology (BIOL) courses, with the exact total varying by catalog year (typically 50–100+ including labs/electives). Full list: [Class Offerings](https://www.onestop.uc.edu/registration/class-offerings.html).\n\nPopular introductory courses for Biology freshmen (based on typical sequences and enrollments):\n- BIOL 1081: Biological Concepts: Structure & Function (taught by Prof. Dr. Stoffer; high enrollment for majors).\n- BIOL 1082: Biological Concepts: Diversity (common follow-up).\n- BIOL 1090: Life Science (broad appeal for non-majors/majors).\n\nVerify current offerings/enrollments on official sites (update per semester). Biology major path: [Majors & Programs](https://www.uc.edu/majors-programs.html).	[0.008562801,-0.0139971925,-0.0008116075,-0.020413317,0.0066066044,0.0033861203,0.010167783,0.015374683,-0.018280305,-0.0022451114,0.0022603695,-0.010778855,-0.0036845256,0.03001933,0.090273865,0.010107742,-0.008039546,-0.029041234,0.021438023,-0.027550066,-0.012554266,0.01314976,-0.029999088,0.004491647,-0.019898921,0.013388294,0.00732598,0.027923789,0.016160486,0.015347895,0.0010505627,0.00939763,-0.009320182,-0.0064164535,-0.0150227295,0.026336402,0.020476073,0.0051269936,-0.016398976,-0.010392799,-0.009075273,0.016634546,0.016724342,-0.008686422,0.02479926,-0.005548898,0.012304083,-0.047340546,0.004479128,0.023194987,-0.01838747,0.025099756,-0.018535046,-0.1708974,-0.017367808,-0.006328704,0.015343961,-0.014654232,0.017258,-0.0047450494,0.01687897,0.023138441,-0.025295984,-0.01311079,-0.011788946,-0.023436053,-0.00266544,0.029575609,0.004273386,0.0013970977,-0.027291382,0.016879886,-0.017121892,-0.0047452105,0.0117950365,-0.01493101,-0.0073259966,-0.0017663771,0.0068330644,0.037071567,0.007397023,0.0012152668,-0.008885713,-0.017097924,-0.017146962,-0.034098335,-0.008962384,-0.011628485,-0.0017820454,0.006225091,0.010874527,0.02402363,0.010983144,-0.018764148,-0.0011802119,-0.0067943865,-0.005169774,-0.012332941,-0.025227629,0.0012498845,-0.04488002,0.0014416857,-0.021885568,-8.129177e-05,0.015706252,-0.024785561,0.017814066,-0.020290064,0.0057334984,0.023249751,-0.0012265823,-0.023991302,-0.029457407,-0.009542522,-0.0066115195,-0.18417513,0.025172904,0.0014369617,-0.01786443,-0.0034149047,-0.020069456,0.003655539,-0.012718457,-0.015206829,-0.00012040649,0.007827285,-0.0036150184,-0.012363683,-0.0068964036,-0.002398906,-0.007163514,-0.030524068,-0.006808763,0.013045955,-0.00016321693,0.018676562,-0.0039460543,-0.02074254,0.020003894,-0.020709315,0.0053360667,0.006529295,-0.0071621616,0.010594596,-0.0023559437,-0.031841885,0.0007515873,0.006332361,-0.008728784,0.01207828,0.020840265,0.025277099,-0.0022530295,-3.1885742e-05,0.021102557,-0.018459098,0.02241167,0.030889159,-0.025325725,-0.007961422,0.0071338103,-0.0001729761,-0.006104493,0.0102496175,0.011111864,0.032103553,0.0077956505,0.03586253,0.02290794,0.012196524,0.026247945,-0.0025259468,0.01729725,-0.003268472,0.005686764,-0.020426836,0.0015636585,0.0009733093,0.022744492,0.0044478183,0.015766934,0.01590494,-0.005958857,-0.011475168,-0.024784738,-0.012134697,-0.008033104,-0.00090304634,0.0006164504,-0.011058606,0.0040359404,-0.015967736,0.00021823416,-0.022206277,0.013724388,-0.005263728,0.01900103,-0.0115161985,-0.011502655,0.025317889,-0.0198131,0.019859869,-0.0016796597,-0.010168915,0.0010321256,0.0035934248,-0.0018536247,-0.012961039,0.021546854,0.04789413,-0.008463326,-0.030272363,0.015585423,0.016296206,0.02437332,-0.017281936,-0.015142236,-0.018782895,0.013834508,0.0062588477,0.0047949106,-0.014355445,0.021574995,0.046959385,-0.014576393,0.0044576423,-0.017741593,-0.004916362,0.01281385,0.01422803,-0.0061227106,0.008993746,-0.022888865,-0.04062542,0.0067385444,0.0041363696,-0.021103537,-0.008210088,0.03456036,-0.001208249,-0.033974204,-0.010438765,-0.011575422,0.029619686,0.008977968,0.00825708,0.010344552,-0.007818098,0.00971169,0.017030545,0.03373032,0.0020403187,0.011194441,-0.0060255555,-0.030807367,0.016234802,0.0057898783,0.021419065,0.0059110424,0.021136275,-0.01579016,-0.019722007,-0.041527797,-0.002321037,-0.00817151,-0.0042577377,0.00091688486,-0.00031454646,0.0071741156,0.028208286,-0.032428954,-0.024250003,0.0050894287,0.0005527727,0.004692851,-0.007452701,-0.11985021,0.00256266,0.01204108,-0.040112462,0.021674566,0.016532952,-0.018690374,0.022071285,-0.0076759476,0.007953304,-0.031910982,-0.0049633915,0.026745953,-0.0123802535,0.013855162,0.004105723,-0.024466952,0.008075561,-0.007430849,-0.0144460015,-0.0128838215,-0.023043156,-0.01512533,-0.0100303255,0.006067915,3.731008e-05,0.0115563655,0.020387547,0.012066048,-0.009955195,0.023903215,-0.008937481,0.015302352,0.021166274,-0.010740886,0.009351186,-0.00641251,0.0032348973,-0.011908274,-0.011842874,0.006509609,-0.004750757,0.0041346406,-0.0013232571,-0.0057443567,0.011503288,0.013854386,-0.0002025143,-0.0246316,-0.03505678,-0.049787458,0.0037372296,-0.0053489776,-0.004332795,-0.029691651,0.008472606,0.009909391,-0.001983014,0.00047471872,0.008737894,-0.013912895,-0.012134817,0.029327475,0.006679167,0.0033200001,0.009148403,-0.027051099,-0.01595409,-0.012195009,0.0030580952,-0.02725804,0.0132871345,0.005053364,-0.011898201,0.0051901545,0.004342445,-0.006602784,-0.026844317,-0.000955703,-0.011741259,0.015279505,0.046545357,0.017033553,0.01695689,0.0025845466,0.0009638305,0.01781611,-0.01023622,-0.010096795,-0.024798831,-0.039888285,-0.022577327,-0.021945773,-0.01431383,0.0075945845,0.0009679359,0.0077360803,0.020815592,0.005328882,0.010168418,-0.020920487,0.016250547,8.471066e-05,0.020899467,-0.0035450938,0.03660856,-0.0125593245,0.004230724,0.0049200603,0.027373808,-0.011624652,0.03160507,-0.011169328,-0.00955695,0.00544565,0.003055559,0.015038707,0.0037112243,0.014445084,-0.011778139,0.030223059,0.0012876736,-0.004210022,0.018704725,-0.004807767,-0.0026092264,0.01738725,-0.006186091,-0.0021652181,0.0154651925,-0.01917428,-0.005809142,-0.018234026,-0.028515624,7.926765e-05,-0.01903689,0.0093056755,-0.002471321,-0.03493586,-0.011777591,0.007079533,0.017994868,0.018243141,-0.0041730436,-0.0057879095,0.014415785,-0.011297598,-0.0017880732,0.0024188694,-0.0069978433,-0.0040139114,0.01566225,0.0011510511,-0.017010013,-0.010158538,0.016923886,0.010317796,-0.00775149,-0.01426998,-0.031103779,0.011554562,-0.024697857,-0.007119166,0.020107443,0.032432657,-0.0029280263,0.009281763,0.022607964,-0.0045894645,-0.009865375,0.02055099,0.013548727,0.010986132,-0.018754805,-0.00068859785,0.013346885,0.0036086268,-0.007253663,-0.012792311,0.027734589,0.015421498,0.00077153096,0.0054279105,-0.009947794,-0.0026787084,-0.013247851,-0.0024132114,-0.012709852,-0.02158322,-0.0094401175,0.0090572145,-0.00043070927,-0.014594607,0.0008912649,0.019002795,-0.009821127,0.0014023207,0.008357565,-0.019076921,-0.02183289,0.03654466,0.025941111,0.0047260527,-0.0019152507,0.011006257,-0.009390364,0.0013591928,-0.0015663379,-0.012438239,0.029906979,0.004164936,-0.018991342,-0.010083702,0.0052305753,0.024864955,0.0037407132,-0.00209106,-0.0005733782,-0.0034147492,-0.013453642,-0.027914586,0.0018004811,-0.0012402445,0.03110128,0.002969881,-0.026475938,0.0010757678,0.022577865,-0.023597013,0.0034942501,-0.011667445,-0.01904,0.012029223,0.012835044,0.014844505,-0.0030141093,0.011123708,0.017729798,-0.008400806,-0.0053336183,-0.018263107,-0.0033451554,0.011504508,0.009627304,-0.0022930917,-0.0127167115,-0.023115598,-0.007940499,0.0073436215,-0.013336953,0.011925171,0.0139473835,0.0109522715,-0.0030889958,-0.0016656719,0.012581736,-0.011149224,-0.011451203,-0.007940414,-0.017342506,-0.0019655796,-0.003568045,0.025023472,-0.005236137,0.007261475,-0.03251598,-0.008823618,0.009084192,0.0017674481,-0.108271256,-0.009911683,-0.016750384,0.020124543,-0.01119617,0.0052026142,-0.007739365,-0.013239933,-0.01276594,-0.018452058,0.010829958,-0.0030242188,-0.0043146485,-0.0044268374,-0.010412978,-0.0094606085,-0.031065233,0.026337022,-0.0013009078,0.016511831,0.022886768,0.0015470419,0.005158565,-0.02040685,-0.014082953,-0.007407634,-0.009316496,-0.021781502,-0.055031907,-0.004188418,0.0072096726,0.031106304,0.010401771,-0.006608487,-0.012491178,-0.013033869,-0.0055449195,-0.022454409,0.00020620464,0.026261086,-0.0011858126,-0.020446796,0.016878538,-0.02370991,0.0035106624,0.01606463,0.033007156,-0.044985045,0.01815023,0.0113294,-0.040942356,-0.011042409,-8.0729355e-05,-0.028393952,-0.0021592572,-0.021083664,-0.009908712,0.0030381978,0.010630872,0.004059128,-0.0072881617,-0.009674605,-0.0021895447,0.008246146,0.008911403,-0.002836222,-0.011752025,0.010167512,0.015862642,-0.0061090156,0.013536046,0.024950076,-0.021800352,0.0075786985,0.02009947,0.02319532,0.008766888,0.015389028,0.008818434,-0.016921323,-0.007306654,-0.0064072306,-0.062382717,0.002213894,-0.005433722,-0.014323644,0.006676841,0.0036287492,-0.015327936,0.028362764,-0.0022366745,-0.007507976,-0.03283149,-0.008953802,0.0037031393,0.0065432894,-0.01135618,-0.022159753,0.022684395,-0.011143951,0.007854977,-0.0018828068,0.003109736,-0.0027999072,0.0031018704,-0.017870124,-0.01928091,0.050802544,-0.029505355,-0.0040837233,-0.008859912,-0.031055648,0.0038525711,-0.13098733,-0.0038953777,-0.005443214,0.0010713101,0.005225236,-0.011353941,0.0014325086,0.020291848,-0.0055526127,-0.0073013287,-0.016025137,-0.010942092,-0.013327298,-0.02512761,0.011143476,0.14069638,0.010320313,-0.0004849833,-0.0032494464,0.0077315206,0.013254449,-0.03060632,0.018190634,-0.011557761,0.023498476,0.005022321,0.00898529,0.0022325404,-0.0028843887,0.017182117,0.0030220144,0.001614606,-0.010076184,-0.0010256344,0.02966479,0.005590865,-0.031021848,-0.0020014967,0.011896368,-0.0054365774,0.029937198,0.0048294063,0.017686715,-0.007981497,-0.003329735,-0.0020942097,-0.014546728,0.025477607,-0.007173776,-0.011921593,-0.027218053,-0.06111219,-0.02999796,0.009411498,0.022917802,0.0060498016,-0.012656283,0.0039141243,-0.0028130908,0.0030315502,0.0042434875,-0.005878319,0.010611626,0.035270292,-0.0099089565,-0.00027881766,0.0069999243,0.021269623,0.0048453836,0.010726834,0.00015190944,0.0073027615,-0.020044845,0.016878845,0.017957227,0.00037532407,-0.015216731,-0.018271387,0.004990575,-0.0052511957,0.0065060984,0.009508453,-0.011997173,-0.023460232,-0.0070029916,-0.0073977504,-0.018565696,0.009695503,0.014112931,0.0008315244,0.031852815,0.011476778,-0.0053238603,-0.0018212647,-0.010940335,-0.0030314308,0.037697177,-0.012638326,0.008583861,-0.0161671,0.0038747494,-0.0144460155,0.008333012,-0.000765946,-0.016815646,-0.023804955,0.0043818867,-0.0026305614,0.049321286,0.0037176518,-0.008191729,0.0008763141,-0.0014771215,0.00014582556,-0.01855816,-0.0050781355,-0.018757831,-0.028599015,0.0025141374,-0.0041694064,-0.005968858,0.0059896633,0.0065205647,0.0017611567,0.009333021,-0.005004552,-0.004695108,-0.0066011758,-0.011440689,-0.0069746897,0.002687726,-0.006869898,0.011308988,-0.003879539,-0.0055757035,-0.008463064,-0.014429206,-0.003401337,-0.0046160435,-0.0066871974,0.0113946665,-0.017548237,0.0042373086,-0.012139327,-0.002804917,-0.011963708,-0.010382426,0.00039965817,-0.019985225,-0.0063634436,-0.016537203,-0.010597656,0.023977216,0.001229279,-0.0077901515,-0.0033028126,0.0016743356,-0.007980898,-0.0066192164,0.0020325596,0.019972714,-0.01816024,-0.011950953,-0.018117664,0.020409625,0.010825394,0.018308517,-0.0024853956,0.019848272,-9.5095485e-05,0.0034270107,0.004582738,0.0011590599,-0.0127619095,-0.01127696,0.004653248,-0.009010582,1.7559643e-05,-0.0005017315,0.0062828516,0.0030388844,0.009344394,0.0030273115,-0.0037330391,-0.0071033402,-0.0045937784,0.005214606,0.030542728,0.005823306,0.00978302,-0.00469449,-0.010907846,0.011712188,-0.014173873,0.008597069,0.014292872,0.0025540686,-0.0047285426,0.0037715174,0.004752533,-0.0032799,-0.003409136,-0.0046728686,0.012195357,-0.004937604,0.007218783,0.005026441,0.0050787027,-0.007007192,-0.0009834262,0.010678077,0.0021269892,-0.0018013472,-0.0017297603,0.00640912,0.001438321,-0.0010868183,0.005900321,-0.00081312895,-0.0036141106,-0.014957161,-0.0039336085,-0.002888208,-0.00074378296,0.0069336696,0.000120713936,-0.0031056567,0.01443609,-4.061931e-05,0.0124006225,-8.045589e-05,0.010991283,0.009709229,-0.008771559,-0.014141975,0.013261188,-0.008470984,-0.011323669,0.015449712,-0.0056162137,0.008859876,0.012662768,0.011084635,-0.007352429,0.019942774,0.00016977686,-0.006097984,-0.006457959,0.0003039514,-0.015707808,-0.0033083523,0.005334575,0.020735845,0.0069253407,-0.017212786,0.0060722246,-0.016285768,0.011680936,-0.0034291795,0.006471708,0.0070532956,0.0030519508,-0.00240742,-0.0066784183,0.009851123,-0.008870223,-0.010007695,-0.00041640707,-0.0057255467,0.005378553,0.009355556,-0.0030223648,-0.0039892285,-0.0042655272,0.006471356,0.009471061,-0.009503619,0.011867764,-0.011486975,-0.014790812,0.01091598,0.0045367116,-0.0059746685,-0.0059756227,-0.010093499,-0.009473755,0.015509385,0.0028636076,0.0009410749,-0.0077191694,-0.016123677,0.021300284,-0.0030508374,-0.0031129362,-0.010187149,0.010400408,0.011368981,0.01650864,0.0023239702,-0.0033205275,-0.008164873,-0.0063035158,0.0035028616,0.00031091363,0.0061287475,0.0052770074,0.0024929184,0.029047256,0.022937745,-0.0039130147,0.11121711,-0.0005094514,-0.0011941305,0.021114282,-0.0021215775,-0.0065854904,0.0032076458,0.015440528,-0.00045180455,-0.0007712935,-0.0032873075,0.002938442,0.015763367,0.01036545,0.004936201,-0.008648602,-0.0023747266,0.00594191,0.0057643373,0.0019305208,-0.015478401,0.010016121,-0.006113853,0.001455438,0.012147107,0.0025654454,0.0110122785,-0.0064486684,-0.020902354,0.012725659,-0.002023996,0.0006560028,0.0132628,0.020290893,-0.011672178,0.0064052287,-0.012351557,0.0021727243,-0.008656277,0.0056958287,-0.00945692,-0.011574548,-0.020604497,-0.013701876,0.01344151,0.0028819318,-0.008873313,0.0035757034,0.0020745527,0.0037295658,-0.0015370765,-0.010372068,-0.017053392,-0.0078782635,-0.008826866,-0.014525495,-0.00029588531,-0.0007128219,0.013972163,0.004201468,-0.0031350057,0.011440879,0.014959015,0.006747286,-0.0057291514,-0.014398849,0.0016398078,-0.0033728734,0.015435682,-0.006396398,0.00021556084,-0.012740277,-0.01830282,-0.00081345765,0.06140812,-0.0013049867,-0.0023158677,0.0017523987,-0.004850118,-0.0025584996,-0.02811508,-0.0092215985,0.00011773098,0.012149709,-0.022989925,0.014937548,-0.0015179662,-0.006085697,0.0053918557,0.0074388296,0.012562233,-0.0028478263,-0.011301678,0.0062685176,-0.0064862473,0.010965486,0.10132941,0.016566426,-0.01483355,0.0074115535,-0.003691847,-0.008826395,0.008680996,-0.006005403,0.0046688067,0.012238276,-0.003962811,0.00282057,-0.018862145,-0.004746526,-0.005277663,0.007730491,0.0054659517,-0.0143552255,-0.0049713007,0.0066357004,-0.016061196,0.0066413735,0.00034132676,-0.003925327,-4.520331e-05,-0.010750828,0.012053038,0.001505835,-0.008755123,0.0057118265,0.00040670534,0.012981786,-0.008409886,0.0010699682,0.006800086,-0.002834027,-0.011198527,0.011191343,0.010968883,-0.0027873055,-0.0021991353,0.005384967,-0.02149449,-0.0015490877,-0.018445212,-0.014821088,0.0017104696,-0.00014704702,-0.0023601046,-0.011810379,0.0040843296,0.0008257745,-0.013277904,0.021053959,-0.0023180738,-0.015624482,-0.014097305,0.0077967765,-0.0120311,-0.0063218656,0.034837507,0.010332378,0.013712358,0.0011130287,0.008567897,-0.0044651167,0.006019887,0.0023213231,0.0038661652,0.0006000354,0.009603024,0.03153397,-0.0042327456,0.0071608345,-0.0058341073,0.009872546,-0.00052032375,-0.006037394,-0.005621847,-0.0067828377,0.016888883,-0.010808008,-0.00061219593,-0.0006913028,0.0013648749,0.0019883553,0.009941466,-0.008992688,-0.020495294,-0.0115658585,0.008628927,0.00039566332,0.0026039798,0.0033542223,-0.0110900765,0.008305471,-0.012036624,0.0042036213,0.014041179,-0.016336728,0.012475054,0.021997238,-0.003982363,-0.0013236708,0.011845445,0.011409735,-0.015383551,0.005361898,0.003027184,0.005947821,0.011119581,0.03251998,0.007548552,-0.012237629,0.008604382,-0.0068523185,0.00079056324,0.0034810272,-0.018996146,0.014523981,0.008225839,-0.011411995,-0.0039786333,-0.0041123354,-0.014989528,-0.0031809001,-0.008315199,0.0071637705,-0.0022087493,0.012896368,-0.0055955993,-0.010494426,-0.0029124904,-0.004521033,-0.011007742,0.003247439,-0.006948815,0.0055895667,-0.042134896,0.014235093,0.018760981,-0.0033399034,-0.0043647396,0.011669376,-0.0013253937,-0.013811206,-0.0052133994,-0.012565452,0.0015144228,-0.00019608908,-0.02059104,-0.0006717547,0.001384423,-0.013120707,0.013121252,-0.010807695,0.0022495713,0.0065801935,0.0032785833,0.0010157872,0.016630216,-0.053150423,0.019517533,0.015120985,-0.01444443,0.0015112739,-0.0117879845,0.019490255,0.0061812475,-0.00018510938,0.011659037,-0.009730815,-0.0145901535,-0.0023843325,0.0031570497,-0.003703691,-0.0020839763,-0.013082592,0.001011013,0.0014372695,-0.004099745,-0.0094874,-0.008100339,-0.0013528158,0.011053136,0.008804879,0.008451613,0.008342073,0.0012217513,0.005230234,-0.0007400716,-0.011259456,-0.00072167977,-0.025717866,0.00090633286,-0.01266614,-0.005270044,0.009421813,-0.0015118665,-0.012714354,0.003500326,0.0008437294,-0.01688025,-0.010346125,-0.01549926,0.002634441,-0.0048871045,0.006821496,-0.0040727,0.027843237,-0.0015050436,0.0023928988,0.005333136,-0.009847658,0.0063719964,-0.0061621484,0.010758754,0.013982519,0.01467428,-0.01334139,0.0014361296,-0.004306672,-0.009349855,0.005891307,-0.013954938,-0.0037696993,-0.0011025794,0.01863367,0.00011536158,-0.0016445243,0.014765252,0.021251718,0.0053348686,0.0063771214,-0.0008981659,-0.0045553865,-0.0068009677,0.022705805,-0.0018126337,0.012529296,0.0024746233,-0.003653586,0.015764723,0.013157443,-0.013262755,0.008969581,0.008567718,0.01655255,-0.0021799663,-0.014272428,-0.013845928,0.011829119,0.016288234,-0.020155882,-0.003680785,-0.016392352,-0.003997381,0.012130665,0.0035189462,-0.0019518186,0.005857266,0.0041547264,-0.0050972477,-0.013606636,0.016374491,-0.00271306,0.007817313,0.006633958,0.004314727,-0.006678043,0.0014944224,0.01234838,0.018020706,-0.018269276,-0.009554291,-0.005072553,0.0013029916,-0.0043095793,-0.020321824,0.0033889418,-0.00036733338,-0.020098561,0.019332327,-0.014135098,-0.014707466,0.0034610545,0.00867547,0.0059042005,-0.01155669,0.019810608,-0.012336748,-0.0044077314,0.0151597485,0.0057173474,0.010090309,-0.0061403154,0.021318704,0.015640717,0.012249916,-0.0029847564,0.005577665,0.011783293,-0.0065272665,0.025446583,-0.00092835363,-0.0049732793,0.016184364,-0.0057699047,0.0046691247,-0.005440886,-0.0017367626,0.0048002545,-0.0003998266,-0.00792334,0.038201418,-0.008727184,-0.010989436,-0.01782086,0.008340498,0.0016270733,-0.009850839,0.018193126,-0.00694964,-0.0064619933,-0.019139037,0.0006198494,0.001819738,0.0015067024,0.0010495252,0.0026861068,0.0044323807,0.005285823,0.010581497,-0.0009876352,0.0017876786,0.01856507,-0.0024998104,0.0017090882,0.006818053,-0.0025378135,0.008232305,-0.013341816,0.0071135983,0.011390977,0.022739548,-0.015724111,-0.0037666233,0.0060810605,0.0017512488,-0.0077231023,0.009304187,0.007952243,0.009987165,-0.0044002254,0.001145269,-0.005125034,0.008060576,0.0032011925,0.00076727703,0.0096767275,0.007742966,0.0058592013,0.009727538,0.002606229,-0.016092755,-0.013178371,-0.10084112,0.022559864,0.0025375965,0.003796129,-0.016731868,0.00339526,0.0059285103,-0.0007437616,0.0015158145,-0.00042508345,-0.010677023,-0.012616593,-5.698147e-06,-0.013546921,0.0057162694,0.00781618,0.003428312,-0.0059437486,6.69772e-05,-0.015555785,0.007423828,-0.0022042505,0.0030305567,0.006470527,-0.0027956788,2.1635467e-05,-0.012525039,0.0019549285,0.006907058,0.01783518,-0.0051279636,-0.020338587,0.019098863,-0.012427173,-0.0006898162,-0.011920631,0.010685871,-0.002210685,-0.13169998,-0.0008631251,-0.007930263,-0.010558477,-0.0077676913,-0.005538642,0.003860406,0.019796401,-0.00025525613,-0.007566487,0.012751027,0.0016148895,-0.015347359,-0.0038701082,0.011362115,-0.019086916,-0.010519918,0.0015159042,-0.00070981454,-0.0075516393,0.0074714012,0.0027249998,0.011055362,0.0069166883,0.009910944,0.014184754,0.013512741,-0.0068451506,0.007832264,0.0020131147,0.009426671,0.005026822,0.01297886,0.004428499,-0.007640874,0.002257042,0.0048057744,-0.0047166673,-0.0019520418,0.0071309917,0.0038492929,-0.0010907034,0.0007535926,0.001165187,-0.0039038938,-0.0033716045,-0.0020638164,-0.0031762864,0.0053071817,-0.017772969,-0.008582454,0.009531157,0.0052067,-0.0066801473,-0.0042862985,-0.0061081774,0.012993099,-0.0073051536,-0.0045868168,-0.0020761741,-0.0020438305,-0.008238589,0.002791058,0.0024200515,0.0073870285,0.013477269,0.021820545,-0.0067424527]	2026-03-09 23:08:23.085232+00	\N	\N	\N
6b84ecdb-603b-46b4-89f7-0d0100aec359	b9eae9ec-3d33-498e-bc38-69cbfe35a2a2	db3845d2-5679-4d84-9856-8ff2c82edc4e	0	User attends UC.	[-0.011413745,0.010774695,-0.0043407367,-0.07724739,-0.0074385908,0.0123473555,0.010474442,-0.008122329,-0.0044322135,-0.0030158076,0.0019224383,-0.011418069,-0.020069357,0.018175008,0.13198572,0.010428643,-0.011199659,-0.008601738,0.01954956,0.0010162899,-0.029356256,0.021979123,0.0007981014,-0.0089075165,-0.014793266,0.00080676575,0.022921653,0.011418728,0.03700704,0.006579285,-0.009221864,0.02020748,-0.0028089283,0.023197843,0.010239143,0.006870809,0.020830723,-0.010226645,0.008432627,-0.006592202,-0.0041612172,0.01168127,0.007642515,-0.002245555,0.007747828,0.000959138,-0.0036281114,-0.028339202,4.0436065e-05,0.00407151,-0.009001946,0.010778961,-0.024910387,-0.23100205,0.0067826766,0.018963065,0.006632099,0.0063033123,0.00051356375,-0.007131808,-0.023336641,0.013736125,-0.020500716,0.00065276294,0.01688834,-0.0023997193,0.013993064,0.012729389,-0.03391729,0.014049412,-0.004797946,-0.003178529,0.00793888,-0.00337489,0.010756291,-0.02585997,0.0030079074,0.008963577,0.015795691,0.0032437725,0.009319502,0.007874427,-0.012417442,0.0028294534,0.006593399,-0.026619215,-0.0112314,-0.009371112,-0.0028855605,-0.0041961865,-0.0050801807,0.0220446,-0.0020756593,-0.008703663,0.01749048,-0.02042292,0.007422761,-0.0033095789,-0.013017557,-0.000523249,-0.015657695,0.0010472175,0.007836742,-0.010652135,-0.008308065,-0.039949164,0.02582481,-0.023990795,-0.015794363,0.020442527,-0.002962671,-0.002388094,-0.0005896114,0.0008520516,0.015275992,-0.19630513,0.009687709,0.00091347017,-0.00876562,-0.0056276126,-0.011553722,-0.000101599915,0.0012070269,-0.0048909737,-0.024113366,0.002003046,0.0114086345,-0.032709964,-0.025795275,-0.0028108885,0.002797805,-0.021755716,0.0054030577,0.019933287,-0.0025794737,0.02091704,0.0085272975,-0.014421076,0.011439652,-0.019714773,-0.0036072314,-0.0032810196,-0.013805435,0.026247153,-0.011451521,-0.0065480997,0.0094538415,0.0032570567,0.0072017876,-0.010341454,-0.0051423116,0.029031565,0.0154499635,-0.002321291,0.00814969,-0.057976395,0.023851886,0.016527042,-0.023358952,0.007981458,0.012650733,-0.0069954474,0.0053842976,-0.004399007,-0.006162574,0.017868487,-0.021051086,0.012858587,0.0044785934,0.0059499014,-0.0072392146,-0.0035983815,-0.0124056265,0.008002195,0.025930017,0.009202434,0.0055314973,0.01033636,0.0031485092,0.013443854,-0.0140520735,-0.015951134,0.01076451,-0.008877391,-0.0007828163,-0.016997641,-0.017387977,-0.008850427,0.0058762045,-0.010298876,0.004404435,-0.018465377,-0.019489488,-0.004239481,0.012398806,-0.011458362,0.011093056,0.004929816,0.01144474,-0.011708813,-0.025632402,0.011612946,0.0015280531,0.02406258,0.0028854364,0.021819413,-0.014606117,0.0028212345,-0.003260304,0.041734114,-0.010891325,-0.015199891,0.024858737,0.00024047523,0.007816073,-0.03752075,-0.0072099585,-0.045337167,-0.017737476,0.00034921026,0.036674965,-0.007340606,0.006490706,0.0018049271,0.0075905654,0.0031163131,-0.0040658605,-0.016302109,-0.005728341,0.010173544,-0.03088657,0.021040495,-0.020713516,-0.011600219,-0.0048734345,-0.00018521959,-0.025449455,0.014218627,0.023530532,0.0017429256,-0.01078098,-0.017233165,-0.0057464084,7.318874e-05,0.017829046,0.016210616,-0.005002799,0.00023508842,-0.0071986574,0.01125533,0.011224959,0.0013317654,-0.008258925,0.0032221947,-0.01585615,-0.009124936,-0.0025388093,0.0120602995,0.007379808,-0.011845696,0.007113016,0.0036861077,0.01198189,-0.022495575,-0.01088943,0.0019669195,0.0059792474,-0.0017257652,0.0020728041,0.006634519,-0.0052775815,-0.005951578,-0.014051132,-0.005117155,0.0007352107,-0.01389903,-0.082251206,-0.0066753277,0.000912465,-0.0111838225,0.014672151,0.01983537,-0.01441447,-0.005915711,-0.007567122,-3.4250513e-06,-0.001972372,-0.010418903,0.012543629,0.008001987,-0.004703904,0.024503572,-0.007686512,0.01483434,-0.0109275365,-0.031145113,-0.0095278425,-0.0052488875,-0.022657903,0.01576785,-0.012560468,0.025960108,0.027948089,0.039798528,0.0066760564,-0.0063638347,0.000718948,0.0076564783,0.016894005,0.0015610612,-0.011401262,-0.0064701512,-0.0066987383,-0.006604263,-0.019550316,0.0070141805,0.005906099,-0.00708506,-0.00030903093,-0.021149328,0.0052712904,-0.0023058534,0.0059623877,0.011896181,-0.013456836,-0.011970135,-0.015278216,-0.008970953,-0.015934082,-0.00216175,0.005535284,0.010099376,0.005614901,-0.0023468386,-0.004719525,-0.002141592,-0.003387244,-0.002810054,0.01896066,-0.00866671,-0.005056519,0.0071531283,-0.0069126207,-0.006406263,-0.00581686,-0.012765396,0.010770903,0.015889209,0.005453178,-0.012109895,0.004361349,0.0035434945,-0.02625179,-0.021757508,0.01715763,0.0067842463,-0.011565976,0.02654648,0.009508111,0.03765479,0.02407725,-0.013608922,0.01622378,0.0022383106,-0.0030690623,-0.0020957906,0.011378811,-0.0040651043,-0.015748838,-0.0029647278,-0.006670419,0.0022709907,0.0027973482,0.023642914,-0.0051240977,0.015364901,-0.019038051,0.033718567,-0.012307854,0.0033792364,0.00089495495,0.005354256,-0.022539569,-0.00097531744,-0.0074959383,0.020122087,0.007448594,-0.009065236,0.022358172,0.016250785,0.0061370954,0.025143012,-0.003481077,0.0028338237,-0.008249746,-0.010710118,0.009353934,0.0025103074,0.0019304546,0.035074335,-0.0054381588,0.014753694,-0.0045584706,-0.00031768763,0.009918799,-0.018426001,0.0031634085,0.0046243994,0.010216484,-0.030412765,0.0024770435,-0.008980488,0.024854107,-0.006264276,0.0007536365,0.005668353,-0.0044190767,-0.009179407,0.001488483,-0.0036853533,0.019815464,-0.005253597,-0.01343556,-0.0016940625,0.01021293,0.023535194,-0.024969118,-0.0073718335,0.007532669,-0.0117864385,0.001111726,0.021840809,-0.014590203,-0.003720736,-0.0030639044,-0.0041603157,0.0036067702,-0.017525837,0.0040900786,0.0037133587,0.008222585,-0.0025300328,-0.016378175,-0.0100658545,0.003496499,0.003220592,-0.005897663,-0.0044092806,0.017226527,0.026437536,0.001643729,0.012141454,-0.008854766,0.0037394173,0.0025822301,0.017354669,-0.018746931,0.00087000715,0.009008561,-0.010921461,-0.0012746815,-0.00052885874,0.011070867,-0.0059781936,0.022157684,0.0013716281,-0.011555741,-0.008550905,-0.019108333,0.016181085,0.002066837,0.0041114483,-0.0079287505,0.0051139016,-0.01476479,-0.00076767115,0.017983412,-0.007680408,-0.010550337,0.009076477,0.015001927,0.013471576,-0.004738504,0.01481776,0.011714434,0.020328986,-0.005288264,-0.005269284,-0.012741097,0.0023301719,0.00954196,0.016648231,-0.013805429,-0.0030856102,-0.0139478315,0.0059998063,-0.019122444,-0.008715661,-0.025077643,-0.0017793911,0.016344551,-0.03442729,-0.015593111,0.013978299,0.019937795,0.019455265,-0.0040688193,-0.020378778,0.0186781,-0.0022428457,-0.016933631,-0.008286625,-0.015169889,0.0007658654,-0.0099127395,0.016905438,-0.008191284,-0.0010686157,0.012256528,0.013484262,0.0071292883,-0.006785105,0.021341795,-0.010435958,-0.00052736624,0.0005530625,0.023893332,0.017638197,0.02283873,-0.0006994291,-0.009044309,0.02706874,0.004425937,-0.014497485,-0.013140529,-0.017684387,3.2550957e-05,-0.008967981,0.012763499,0.018821139,0.009624296,-0.0105053745,0.00066572527,-0.01034494,-0.014019583,-0.10696983,0.0031150326,-0.0180897,0.0076153455,-0.007913922,-0.00562559,-0.015948247,-0.022956187,-0.0066270595,0.0013020497,-0.013207105,-0.015449025,0.0055610696,-0.00750397,-0.012070242,-0.022252092,-0.004912898,0.032023214,-0.00094112224,-0.010973441,-0.00083853095,0.018581977,0.0072188294,-0.015178219,-0.0013177809,0.0051901033,0.016640294,0.0016293281,-0.013536877,-0.0015236802,-0.02262191,0.023216467,0.005850383,0.01368455,0.0037863126,0.0026578936,-0.021245863,-0.0044110552,-0.010051317,0.02553404,0.0011516468,-0.008493904,-0.0042369943,-0.013413485,0.0023047952,0.014952147,0.027039861,-0.023384161,-0.006402782,-0.011917382,-0.026791813,0.0010865821,0.006747167,-0.0013072116,-0.008933358,0.0077100177,-0.025650013,0.008826162,-0.015025072,0.028049838,-0.0064512673,0.009421306,-0.004804478,0.019113488,-0.0061430335,0.013580818,-0.0057487153,0.020703979,-0.00048038433,0.0061866767,-0.006232554,0.02221596,-0.024338365,0.00122268,-0.0065007447,0.013747133,-0.010573534,0.012529397,0.0057507404,0.008029508,0.009507595,-0.003781238,-0.101933844,0.014900859,-0.012908464,-0.016249374,0.003809996,0.0046317806,-0.024101976,0.003772304,0.0036726815,-0.003355588,0.004224683,-0.0050326088,-0.009718873,0.010486766,-0.0047801523,-0.0025680058,0.00924904,-0.022466145,-0.0034343917,-0.005606215,0.00906436,-0.005968329,-0.0024657727,-0.013869277,-0.004748029,0.026302492,-0.006285492,0.011980031,0.006899246,-0.013135584,0.013404172,-0.17001553,0.0150675895,-0.012560428,0.007156147,0.0079770135,-0.003031349,0.0009210893,-0.0059406706,0.010801468,-0.0047789025,-0.011044641,-0.012525236,-0.030821629,-0.015525495,0.0057954486,0.14219563,-0.0046437397,0.016981842,-0.008019167,-0.004160656,0.0058880723,-0.012339961,0.0014450521,0.011515785,0.003777262,-0.008610052,0.02193274,0.018608801,-0.02676294,-0.0006055488,0.0013361729,0.01276053,-0.005153175,-0.020270973,0.01145739,-0.0063038487,-0.007832079,-0.0065017953,0.004537494,-0.0024176184,0.046092927,0.02920068,-0.008535314,-0.008513872,-0.006571391,0.013460811,-0.033005036,-0.0040806653,-0.009670601,-0.002772893,-0.017404918,-0.0784477,0.0012929371,0.012093146,0.025125504,-0.0035813965,-0.0019343141,0.03299398,0.0036841978,-0.008475344,-0.0009097652,-0.020285806,0.022859218,0.029505158,-0.003367507,0.0073098475,0.028062914,0.01024463,-0.018545995,0.015293474,-0.012436033,-0.007638201,-0.010118698,-0.008186309,0.0056467424,0.011958166,-0.0039695078,-0.009992223,-0.006577271,0.0071767955,0.008401256,-0.0010642092,0.0076234196,-0.007750044,-0.01661438,0.0039796876,-0.0023320555,-0.008794946,-0.0017205445,-0.0030878612,0.002181884,0.010810918,0.015571063,0.012061245,-0.00065789785,-0.0092579145,0.021433298,-0.00794066,-0.010926123,0.004628692,-0.009477614,-0.04085637,-0.009051985,-0.021207148,-0.023284482,-0.018980408,-0.0057799113,-0.01742681,0.040359206,0.012239463,0.006699432,-0.0024773504,-0.008772363,-0.004586545,-0.008623957,0.005180949,-0.001531882,-0.00581468,-0.0006116158,-0.015667712,-0.005903281,-0.00976039,0.00041134364,0.0085579315,0.0028173476,0.007427759,0.00075526413,0.0010673159,-0.006791639,-0.017795395,0.010892685,-0.0102096,-0.00650829,0.0049200677,0.005568783,-0.010081301,-0.011520669,0.00059718406,0.0012252264,0.0054783737,0.014661581,0.009493301,-0.0059117205,0.0025114215,0.0059300745,-0.008643263,-0.017021282,0.014514845,-0.0053123794,-0.0013638667,-0.0017157478,-0.014889209,0.008881895,0.0035575642,0.0033217971,0.003909236,0.0016009369,-0.0031299368,-0.0058953646,-0.0030968948,0.0032258441,0.0004557561,0.003564857,-0.010377642,0.008533287,0.002016451,0.002035653,-0.0053305724,0.011632629,0.0082081165,0.0017194349,-0.015348159,-0.013422895,-0.007964427,0.0075411685,0.005762075,-0.005578739,-0.008244887,-0.017318405,0.00950073,0.012564684,0.011266266,-0.0025222714,-0.015198796,0.0020594744,0.0062690894,0.0049072723,0.010359234,0.011084234,-0.010499842,-0.0260624,-0.012333033,0.003809731,-0.012258556,0.015401899,-0.004074482,0.009054784,0.00022201907,2.0876156e-05,0.0015713719,-0.0075662844,-0.01457767,0.0017350749,-0.0009536052,-0.0027254857,0.021384971,-0.010150985,-0.005002882,-0.010545224,0.0034910378,0.000705819,0.012940277,0.005915197,0.0074273585,0.0005426987,0.0008009439,-0.006342064,-0.009086391,0.014267599,0.013971471,0.0011895292,-0.0037749151,0.009721273,0.008675977,0.0019747778,0.0018914897,-0.009984096,-0.0039153285,0.0034276156,0.0005222638,-0.0034825709,0.003943852,0.0034701135,-0.0060692816,-0.0006198966,0.007737274,0.009958522,-0.0047846492,0.004241898,-0.00838246,0.016077083,0.0041443417,-0.007346869,-0.01501566,-0.006715786,0.005872622,0.0021395627,0.005667235,-0.011308612,-0.019256981,-0.0017154188,0.004686527,0.031747956,-0.001852962,-0.0033957553,0.0035327352,-0.004760414,0.0006782101,1.5505952e-05,0.0026953313,0.005973994,-0.004113573,-0.009712142,-0.019395664,0.0012503937,-0.0072984663,-0.0030458977,0.013027417,-0.003848041,0.011113854,-0.0089368,-0.0039409483,0.009747772,0.0038250214,0.003475027,0.0109543875,-0.010589718,0.01122463,0.00032689492,-0.008578995,-0.008611417,0.006163231,0.001843577,-0.017239926,0.00086737185,0.0013450014,0.012745042,0.0044405763,-0.009479898,-0.0018639343,-0.005642025,0.01306185,-0.0177705,0.009665622,-0.0045589586,0.0028243845,0.012261625,0.0057063284,0.0038874613,-0.0035760081,0.0063360347,-0.00054936105,-0.0039160205,-0.008267457,0.006914828,0.00998133,0.0040699537,0.006847346,0.010518225,0.00884246,0.12338686,0.009982521,0.0017122257,0.014927896,-0.0061971983,-0.007902439,0.010580042,0.007213338,-0.0073458697,-0.0015216515,0.0011518132,0.004819939,-0.003294185,0.015949363,0.0010609081,-0.010719075,0.007135221,0.005372623,0.013485653,0.00482193,-0.011824609,-0.004722423,-0.004815095,-0.003913427,0.0060154432,-0.0012468728,0.009532951,-0.0065183043,-0.010627699,0.008758862,0.007700567,-0.006758406,-0.0132655585,-0.012377884,-0.011820429,0.008688073,-0.00095746387,0.0025566563,0.005937412,0.035386037,-0.0006647784,-0.004606077,-0.012576543,-0.016390864,0.0050702724,0.009943926,-0.012631559,-0.001276431,0.0039334605,0.010645675,-0.015031264,-0.015344607,-0.00097480265,-0.0027008648,-0.011902994,-0.0070785806,-0.00019039547,-0.008341978,0.016057441,0.0073776483,-0.017350074,0.0010325583,0.004835899,0.0033879348,0.011210832,-0.015920667,-0.0014872238,-0.0011413206,0.00970493,-0.004103479,-0.0071259188,-0.006552294,0.0006001549,-0.008262724,0.034517758,-0.0032941396,0.0055322363,-0.0001576314,-0.01656012,-0.0075312164,0.0023184745,0.010616563,-0.007303366,0.008878065,0.0003184951,-0.012574335,-0.0012390021,0.00977485,0.011017489,0.013035566,0.017008143,-0.0065420996,-0.0067952853,0.0038743187,0.012217537,-0.00021849388,0.07678145,-0.0004732564,-0.0052176495,0.0048290687,-0.0030743943,-0.0103519745,0.011857696,0.0045748106,0.0052162004,0.0031670579,0.001796528,-0.002400258,0.0032236446,-0.011519244,-0.007682122,-0.008925469,0.0038082222,-0.0033401663,0.0004075988,0.009084394,-0.0029985812,0.012279915,-0.009452808,0.006011569,0.012894632,-6.5151195e-05,0.00034926648,0.007721725,-0.010949613,-0.00043514007,-0.008492201,0.0021775574,0.0052991845,-0.0017762386,0.002269177,0.0025732655,0.003051425,0.0061050314,-0.010262154,0.006244288,0.001621572,-0.00071097503,-0.002991773,0.0017898297,-0.027766632,-0.014082962,0.003822335,0.0011848158,-0.0074714273,0.014594081,0.0061042127,0.015832687,0.0038051032,0.00805194,-0.01016813,-0.019977046,-0.011413844,0.012852098,-0.00016975764,0.0030686767,0.0009499934,0.0012755878,0.0025303485,0.0032213791,-0.0003607008,0.0035331072,-0.014177936,0.013821262,-0.0074137542,-0.01847948,-0.0086856,0.020579819,0.011426972,0.010020127,-0.014591894,-0.005120705,-0.00066238944,-0.008381683,0.0036585098,-0.0006914186,0.00026170426,-0.007105727,-7.155938e-05,-0.0032981704,-0.0014654782,0.0009582664,0.007854152,-0.0054098256,-0.008686567,-0.008879042,0.0063450467,-0.008266861,0.009027711,-0.0040600016,-0.0143288355,0.0059167068,-0.0030927504,-0.0005625063,-0.002929395,-0.0015641517,-0.002646273,0.00707438,-0.004736499,0.0025176548,0.015071962,-0.007022657,-0.015736414,-0.008150956,0.0017439128,-0.011100337,0.00030574042,0.01855278,0.00637198,-0.011581264,0.0008608889,-0.008761984,0.0009507503,-0.0064324127,-0.012731986,0.00707479,0.014913868,-0.0019176456,-0.009024238,-0.007004527,0.0025508048,0.009336174,-0.010060477,-0.0039648484,-0.0057143033,-0.0014145694,-0.00066953024,0.0006003964,-0.0010434921,-0.0006291424,-0.007626823,-0.004861785,-0.0039331107,0.010371836,-0.011541948,0.010035436,0.017754324,0.0046436,-0.0033923374,-0.0023791923,-0.0013952772,-0.013629964,0.005199372,0.006696615,0.0017215172,-0.0019207613,0.0046688016,-0.00080585637,-0.0051664435,-0.0013723024,0.02022259,0.0030865604,0.015231441,0.012224739,0.0040743086,-0.006246949,-0.0042080474,-0.040656947,0.021414371,0.016384607,-0.0047877,0.005945596,-0.02136088,0.0027093543,0.012952585,-0.0059301974,0.0006271866,-0.0011202059,0.0012700942,0.0029507624,0.009141591,-0.007441996,-0.003951624,-0.01600629,-0.010488013,-0.015055111,-0.0073072896,-0.00036981824,0.0060105096,-0.0036976868,0.0076272236,-0.019326147,0.01224806,-0.012541271,0.009051701,-0.008654811,-0.017574688,-0.009003597,0.013835457,0.0023645475,0.006336431,-0.011463333,0.0050323065,0.0036076591,-0.0016432231,-0.009910758,-0.012371003,0.01064133,0.00022124783,0.008565873,-0.014926679,-0.010975271,0.0007350449,-0.0043230387,-0.0065434407,0.012428113,0.0083426945,-0.0073895366,0.011393319,0.0060419347,-0.0033989218,-0.0034426001,0.011934918,0.018223353,0.007091788,-0.009153413,0.0013576963,0.011796541,0.003735714,-0.003014858,-0.024723252,-0.014760438,-0.0018391475,0.008902554,-0.005654374,0.007480347,0.002516606,0.0053017912,0.008825535,0.009111198,-0.00076983304,0.013121945,0.0014586812,0.028254634,0.012982424,-0.0061887335,0.007652224,0.0058812248,0.012971726,0.0065179355,-0.010034173,0.0020671133,0.002939639,0.01138716,-0.0011269696,-0.017580556,0.005552003,-0.0015652091,0.0046138773,-0.009054624,0.0019709948,-0.004437719,0.0083262455,-0.009154006,0.00066456804,-0.0011650763,-0.0005880721,-0.004045617,-0.003230435,-0.012961184,0.013692843,-0.0041757296,0.0011215556,-0.0052366736,-0.0044313744,-0.009799423,-0.0010814904,-0.0045947623,-0.0032770876,0.0012671603,-0.006341149,0.0006646083,-0.0012213531,-0.0017823895,-0.0047005718,0.0003647802,-0.0015107773,-0.010509424,0.01228377,-0.0016631023,-0.0069859605,0.005021498,0.007949891,0.009627782,-0.00080442266,0.0148542,-0.015375457,-0.0010145353,0.017065153,0.010684486,0.007293269,0.0028269738,0.025955033,0.021137709,-0.0042657587,0.0011982716,-0.0014577623,0.008178867,-0.008789619,0.014227749,-0.011532395,-0.002221091,0.008319599,0.003860356,0.00478642,0.006767649,0.0053443103,0.017933872,-0.010725456,-0.0016347292,0.01569206,0.017431222,-0.012293761,0.013210484,-0.0065599405,-0.0005271701,-0.011581604,0.012674027,0.00061408646,-0.017601201,-0.005180382,0.011264904,0.005947451,0.0055088005,-0.0062056193,0.0013047819,-0.00608423,0.001438148,0.013165166,0.015230805,0.0049205185,0.002818319,0.013442531,0.00553885,0.005001561,0.002793286,-2.3058667e-05,-0.0119267525,0.0072842757,0.0020579342,-0.0026230807,-0.0025917059,0.0034775343,0.001205704,0.006087285,-0.006201589,0.0070098634,-0.003181301,-0.0068846843,0.012501779,-0.005004558,0.0055176653,0.0013677272,0.0015112091,0.001967324,0.0062369,-0.0015324467,0.012265196,0.011267001,0.012831794,0.001185509,-0.010782413,-0.123143874,-0.000599984,-0.010770338,-0.012176623,-0.0023389587,0.002806302,0.010024928,-0.010511843,-0.007589916,-0.0049088644,-5.5836554e-05,0.00485844,-0.0044201515,-0.014927747,0.0063576805,-0.011248168,0.004923751,-0.0035986376,9.61914e-05,-0.009647518,-0.0014493022,0.0077371355,0.0006015756,-0.0047775013,0.004539598,0.010032391,-0.023536103,-0.0030379118,0.009034071,0.012367989,-0.0011647604,-0.015979145,0.0046305126,-0.004193896,0.004147686,-0.002614596,0.009841298,0.011787481,-0.16579378,-0.017747745,-0.009901689,-0.009605243,-0.018576788,-0.00037881936,0.010949439,0.019068142,0.0105390195,0.0011801146,0.0029923494,-0.002214643,0.0025671339,-0.0074038687,5.5462093e-05,-0.008578521,-0.009558475,-0.004996026,0.0015726258,0.0129218055,-0.0085888915,0.015139172,0.007820849,0.012525163,5.0918756e-05,0.020618465,0.01843608,-0.013036966,0.0032995176,-0.010685266,0.01680181,0.005791421,0.004569992,-0.008803306,-0.0135116745,-0.0012395742,0.0032061506,-0.0063222838,0.0010864722,0.0014639571,0.0167946,-0.0034893828,0.0045507536,-0.009213363,0.0076308227,0.007487605,-0.0063210004,0.0011870384,0.0070949574,-0.0077657565,-0.010372003,0.0031561733,-0.00060559035,0.0061317706,-0.0005702161,0.0024946493,0.002288082,0.005641651,-0.0044934144,0.0043785446,-0.0075450093,0.0015933994,0.002220182,0.0010805832,-0.00060547644,-0.0042654593,0.0014434973,0.005682659]	2026-03-16 23:52:40.406608+00	\N	\N	\N
b339582c-86f0-4d22-ad16-d3c59ac904a8	b9eae9ec-3d33-498e-bc38-69cbfe35a2a2	db3845d2-5679-4d84-9856-8ff2c82edc4e	1	User is enrolled in RE 3091 Real Estate Principles with instructor Steve Reynolds.	[-0.012637217,-0.014671057,0.0032895117,-0.066352695,0.023059022,-0.004957263,-0.002668155,-0.015803114,-0.0038716223,0.024121676,0.008049484,-0.0057063955,-0.012129391,0.019349435,0.11344606,-0.0019050093,0.0027320688,-0.019924255,0.000559009,0.020671874,0.00014673722,0.019912144,-0.0044791056,-0.02292557,0.0017157667,0.0052530533,0.029023398,0.009733948,0.041230667,0.0048882673,0.0005764676,0.03371167,-0.009723122,-0.00089251454,0.005205731,0.025855046,0.010335619,-0.0057444344,-0.01247504,-0.019402657,-0.012486477,0.033625655,0.012363653,-0.0022676522,-0.005486856,0.005007378,-0.0036415185,-0.029092679,0.0075554247,0.017886128,-0.015231933,-0.008976477,-0.036524467,-0.20723692,0.024079897,-0.026881821,-0.0031039342,0.001940243,0.004658958,-0.0040024105,-0.008137095,0.013034779,-0.019475186,0.011288335,0.009885926,-0.013915577,-0.00034202266,0.009433418,-0.041331556,0.014487051,0.00336019,0.0043024686,-0.027045855,-0.0006789696,0.02668904,-0.029095475,-0.0056121787,0.012654413,-0.010794517,0.02674845,0.0024296537,0.012972754,0.008649542,0.010156171,0.02254811,-0.010569585,-0.021352893,7.0326714e-05,-0.018108726,-0.010315619,0.0002767923,0.003971977,-0.004253489,0.007901311,0.005494584,-0.015136177,0.0023158449,0.0027181143,0.00050981325,-0.0021265005,-0.0017222755,-0.006561419,-0.02175439,-0.037582375,-0.004082513,-0.044794135,0.0058929296,-0.020735119,-0.024733908,-0.0012186951,-0.0022560062,0.0012378094,-0.0029308419,0.019732391,0.031654652,-0.1894575,0.028715897,-0.0153333135,0.013440768,-0.0024308278,-0.005056833,0.003923791,-0.0018995645,-0.022454657,-0.0016524222,0.0006785373,0.010725921,-0.012828421,0.001242269,0.0072187986,0.00052581023,-0.0056280266,0.013556176,0.012555893,-0.004797591,0.03428732,-0.00078523444,0.010151326,-0.0034463308,0.00060775725,0.019977834,-0.005229964,0.016774468,0.05243401,-0.029974194,-0.03038262,-0.004909065,-0.011539626,0.0007586369,-0.02021943,-0.0064654183,0.01435604,0.009761385,0.0155548565,0.0019244691,-0.053002533,0.020063223,0.0031279204,-0.030391967,0.018727385,0.007549944,0.00080911315,0.018386954,-0.0072805258,0.003264987,0.0045275954,0.027547155,0.01553192,-0.0014005967,0.020996349,-0.012451276,-0.0015157694,0.010359984,0.023609148,0.009005776,-0.0075479476,0.0062624137,0.014725646,0.008347573,0.0048563736,-0.0060537974,-0.020966953,0.003897581,0.0068751643,-0.0012021745,-0.0017198892,0.00931071,-0.006932816,0.006165774,-0.036697175,0.0131508475,-0.013714984,-0.016042495,-0.008654785,-0.0155979935,-0.0015013547,0.003231578,-0.022577105,0.02720573,0.002421524,-0.008388521,-0.0018657432,-0.0014572254,-0.008919642,-0.0020608122,0.010451085,-0.015964346,-0.009088939,0.0072737527,0.036336187,-0.016063603,0.0005062559,0.007451065,0.0011800568,-0.0021485651,-0.021468751,-0.008323809,-0.011450223,-0.00466112,0.013933392,0.025747217,0.011369003,0.006329324,0.01902505,-0.0012705317,0.00406116,-0.0047017536,-0.005654857,0.00036107365,0.010368449,0.0018125896,0.0009957766,-0.006585931,0.0072528,0.003854854,-0.010206989,-0.0017359387,-0.0013828691,0.015795594,0.013401014,-0.0015970508,-0.03834612,0.014427643,0.007717142,0.0117324395,0.007223741,0.0059029195,0.002493572,-0.019764267,-1.619103e-05,-0.0025224357,0.016983518,0.0074385377,-0.01801957,-0.021124631,-0.004397286,-0.012012598,0.0010727205,-0.0060537006,0.017286578,0.014199887,-0.01756338,0.009006687,-0.00074829307,0.0012091622,0.010798437,9.303645e-06,0.00030523448,-0.018863471,-0.006629909,-0.010900925,-0.011300971,0.00082008884,0.007836465,0.012832926,0.031635568,-0.11074262,-0.017875718,0.015311555,-0.016610675,0.009673669,0.0331587,-0.022850517,-0.018692965,0.009178651,0.025186295,-0.004640126,-0.0019000414,0.0048527424,-0.009023921,0.014966704,0.03102461,-0.007975091,0.008427435,0.011178563,-0.0263773,-0.007850191,-0.009485424,-0.0038404209,0.012272653,0.016182221,0.016783135,0.013661669,0.037302945,0.0015121215,-0.0063874642,-0.0037671812,0.014681313,0.023317594,-0.021811103,-0.011088709,-0.006426294,0.0047199284,-0.01963074,-0.008589072,0.0050070127,0.013164873,-0.020848783,-0.010063857,-0.003249663,-0.009686011,0.015487518,-0.004387764,-0.0010566472,0.01232232,-0.012907129,-0.023138992,-0.0027893565,0.002025398,-0.0011622864,0.0127160195,-0.004526033,-0.017187122,0.0016690212,0.0022078608,0.007326793,0.013828165,0.022966515,0.014415793,0.0039702435,-0.019685265,-0.003678076,-0.018351257,0.010648398,-0.0012658371,-0.013348451,0.0064530377,0.026244616,-0.014685765,-0.0067543653,-0.010370274,0.0121802455,-0.010087033,-0.028675584,-0.017918732,0.031079087,0.0114247305,0.02783602,0.012249961,0.024149317,0.0034798502,0.021508541,0.0071732975,-0.0006430794,-0.00014592924,-0.010094467,0.006967293,-0.009542736,-0.008579662,0.003723608,-0.010227551,-0.0012734148,0.010484869,0.028768474,-0.0061992807,0.0036213978,0.0074858963,0.013137505,-0.0035805511,-0.0037905234,0.005886492,0.0015223988,-0.012005615,-0.014910428,-0.004462043,0.019171448,-0.011480087,0.0030603558,-0.0036896598,0.0074636387,-0.021531008,0.009776995,-0.017640606,0.010791729,-0.010163154,0.0022473694,0.009959092,-0.0052264603,-0.02088782,0.0052250177,0.020097742,0.01723832,-0.005862416,-0.005872459,0.019507226,-0.005426215,-0.006984626,0.0071111717,0.008652416,-0.01621379,-0.023068594,0.0015552255,0.025682349,-0.011290716,0.0043569026,0.009711256,-0.017860658,0.0055395346,-0.0072189667,-0.01891376,-0.0076925084,-0.013675524,-0.024468914,0.004059058,0.011141761,0.0025392137,-0.03327007,-0.021588737,-0.0046757646,0.0054484275,0.0019854123,-0.02071882,-0.020165397,-0.001983719,-0.009389586,-0.02765328,-0.009029322,-0.007345706,-0.018306946,0.028450942,0.0075020483,-0.00802477,0.0024546732,-0.0064389887,0.011948018,-0.016061498,-0.010119891,0.021736227,0.0068776063,0.00498325,0.004318478,0.0031130025,0.008374069,0.009809756,0.01521755,0.0022779917,0.0024909507,0.0125635145,4.4277026e-06,-0.025477393,0.015478199,-0.0050800843,0.016088095,0.0059213527,0.0023237818,0.0062879943,-0.0031001202,-0.005182751,-0.026238745,0.0139058605,-0.0071175904,-0.0012096586,-0.011263423,0.007913578,-0.0074600345,0.0009740309,0.013148046,-0.006667903,-0.0065901927,0.0065074028,0.024321454,0.020314466,-0.021265948,-0.0021199393,0.005692697,0.012411597,-0.009175469,-0.0011271358,-0.0151777705,-0.018426431,0.005307852,-0.00080239587,0.012824074,-0.0076599126,-0.01934877,0.018627737,0.00014574346,-0.0012121465,-0.027722236,0.010067102,0.0157087,0.0039995955,0.018294327,0.0038392101,-0.008826923,0.020264283,-0.0034248456,0.0044542006,0.026728995,-0.011669918,-0.012137465,0.006714049,-0.008957578,-0.011387362,-0.012182503,-0.007430429,-0.004967539,0.018842118,0.010301903,0.011119734,0.0033500248,-0.016879413,0.020728063,0.00015964684,0.0048912773,-0.0055375453,0.019693257,0.01421622,0.007988404,-0.0009644433,-0.0061483453,0.036844473,-0.0036062729,0.0037747645,-0.010512193,-0.017285142,0.026933894,-0.00837666,-0.00356196,0.012818731,0.022563633,-0.015144392,0.020541465,-0.01458822,0.014598126,-0.10063327,0.006067297,-0.019623157,-0.006482172,-0.027501488,0.021758782,-0.014590458,-0.030679593,-0.03064372,-0.011475852,-0.002711137,-0.0070556942,-0.010619897,-0.0053604534,0.0018595593,-0.008010164,-0.008183754,0.023266003,0.0075227623,-0.01127767,-0.006287476,-0.0017960275,0.0054831863,-0.008954176,0.0045479904,-0.003191149,0.019326227,0.022343174,-0.013740225,0.002567948,-0.008245495,-0.010146162,0.028660158,0.0021557556,-0.009681172,0.0003839479,-0.0058684084,0.00250413,-0.016068375,0.013281344,-0.010891539,-0.0116805965,0.013446543,-0.018396882,0.0030527266,0.021333596,0.04148797,-0.03749259,0.008465445,0.011835956,-0.028109107,0.0040478036,-0.011779051,-0.028045092,-0.011687351,-0.006266314,-0.01905477,0.011972294,-0.016274428,-0.0051006777,-0.01022422,0.0061866147,-0.008812758,0.013820766,-0.009294577,-0.009342065,0.03382451,-8.9559915e-05,-0.03225613,0.020460049,-0.01482437,0.03477451,-0.028169392,-0.017633962,0.00084804045,0.007115813,-0.009492005,0.025642013,0.013038241,0.021707784,0.0024120193,0.0121742785,-0.07900793,-0.00073414727,-0.005678806,-0.01817069,0.0109623065,-0.0068519916,-0.009471462,-0.014740194,-0.024216373,-0.011297975,-0.012456579,0.008149325,0.013876335,0.0006947041,0.0049945223,-0.010051512,0.008874766,-0.0039919224,0.022962788,-0.003559684,-0.011951117,0.0008127198,-0.035113156,-0.01609034,0.0062758625,0.0044362647,-0.01774185,-0.0051180506,-0.02466865,0.0027304173,0.0028530215,-0.17461349,0.0020954798,0.0011422207,0.012909135,0.014570718,0.00031649088,-0.0115917055,-0.008859271,0.0050852285,-0.0042536636,-0.011676301,-0.005603071,-0.030601466,-0.022537313,-0.009928247,0.13893184,-0.0036147612,-0.00093575905,-0.013940347,-0.009951431,0.0044529526,-0.00096801383,-0.0010855119,-0.0027960618,0.0048354818,0.0037297516,-0.003244322,0.0019790856,-0.0051573003,-0.0095309215,0.033019844,0.0031758705,-0.012458023,-0.031655025,0.01387587,-0.0010102176,0.0071402877,-0.0007241673,-0.0014003202,0.0067601847,0.03182371,0.020752152,-0.008875521,-0.011267646,-0.00053932617,0.0069679385,-0.017312873,-0.0026920235,0.022854561,0.021123396,-0.016911652,-0.0652436,-0.002224838,0.018127218,0.006735321,0.020435367,-0.017121041,0.024249198,-0.0019697268,0.01692655,0.019363133,-0.030350074,-0.002011844,0.0072219847,-0.006600961,-0.0041231755,0.0018827526,0.030606031,-0.006910964,0.02421286,-0.0074175205,0.0021840835,-0.013952237,0.0045254934,-0.009285456,0.009225817,-0.013178568,-0.00616121,0.028258635,-0.0018426903,0.0016852443,0.0032015091,-0.007979835,0.0060680164,-0.015615638,-0.021757187,0.014302192,-0.0027828047,0.0055257212,-0.0041836705,0.008830483,-0.0010115769,0.0074449843,0.025380228,0.01066831,-0.004247166,0.018031498,0.0037773459,-0.019598376,0.00470906,-0.0005324918,-0.016925741,0.01115531,-0.0049480475,0.018878905,0.007044581,0.0120490035,-0.00039559303,0.015628811,-0.0077808825,0.0042525134,-0.0042091906,-0.0070061963,0.0014084761,0.0021655986,-0.0015657386,-0.00969365,0.007370325,-0.005437383,-0.016976677,-0.0040540113,-0.010411334,-0.011076971,-0.00457543,-0.0011406706,-0.015945084,0.0034141245,0.00030278607,-0.0004356589,-0.0012014827,0.016736576,-0.008657511,0.0059910556,-0.00031217406,0.017691825,-0.010687684,-0.013949743,-0.0057917577,-0.0004803427,-0.004689754,0.021680415,0.0053057,-0.0071343337,-0.008404931,0.011181028,0.010194953,-0.014321765,-0.0015541308,-0.008394396,-0.004794774,-0.007631925,-0.012222681,0.025225332,0.011291092,0.014821064,-0.011011767,-0.004621549,0.004937434,-0.021305846,-0.0053118407,0.005799394,-0.0032452997,0.0008001371,0.0011352805,-0.0034289255,-0.007143965,0.009225084,-0.0071319654,-0.0060009123,-0.011471662,-0.0015935996,0.013135381,-0.009569978,0.005262363,-0.0027475283,-0.011847393,-0.014888041,0.0017943813,-0.0036735907,0.0037729924,0.01017595,0.005580209,-0.0064711883,-0.00756169,0.010230833,0.0020547428,-0.0028077068,-0.004915516,0.017503848,-0.012769364,-0.01024532,-0.017901972,0.014233434,-0.025303787,0.011050947,-0.0030767585,-0.009351511,-0.0036785465,-0.0033383297,0.008914285,-0.022330916,0.005767128,0.015752072,0.009351304,-0.001422772,0.010979219,-0.012981054,-0.008351994,0.0029014447,0.0017381327,-0.0007776067,-0.004480163,0.010049007,-0.00467779,-0.01568627,-0.0046967315,-0.010142846,-0.0011612088,0.00688403,0.0074029467,0.0018742215,-0.010147413,0.011406328,0.019254783,0.0148028,-0.0025706242,0.00489519,0.008767929,-0.0008073672,0.0048688115,-0.008886553,0.011695239,0.007028872,0.009188614,-0.0019585511,0.010960076,0.010791102,-0.0013120335,0.0075908955,-0.00082660344,0.0056785187,0.010421657,-0.0015131789,-0.0056970417,0.020168312,0.009467062,-0.00093077344,0.0055776997,-0.004725115,-0.011062569,-0.0024463406,0.006468569,0.021814514,-0.005276439,0.007453904,-0.002731479,-0.0013472264,0.0010528605,-0.019248372,0.007654913,0.0013747527,-0.0052653383,0.003698868,0.0029457116,0.011878855,0.0041203755,-0.0024653003,0.015916908,-0.0011773938,0.008818737,-0.0050565475,-0.021520974,0.0077528735,-0.009810968,-9.7892604e-05,0.0002888292,-0.022907315,0.009494553,-0.0010696282,0.00084299274,-0.015399315,0.004946174,-0.0032721628,-0.014492459,-0.0036466469,0.0066098627,0.015377153,0.003498882,-0.0010558529,-0.024998333,0.0044719013,0.010593202,-0.016746972,0.0050215367,-0.0031396598,-0.00964237,0.0035103406,0.00916259,0.01974312,-0.01581241,0.0007614335,0.0072514233,-0.0075178607,-0.0019891649,0.00093603303,-0.0046084477,0.011337035,-0.004461637,-0.003476755,-0.0050332616,0.11296644,0.0060307407,0.0022048359,0.006506345,0.006189965,0.00048020636,-0.0018275788,0.0011238268,-0.0031592727,-0.0015228629,0.00051310344,-0.003010169,0.007890598,-0.0029399577,-0.003162782,-0.0146198645,-0.00038819495,0.015235261,0.006431667,0.0036023802,-0.0054440247,-0.002628982,-0.009140111,-0.0056279916,0.0062681707,0.017360048,0.009942021,-0.01330908,-0.013521009,0.0047406983,0.0073749167,0.004873848,6.8251094e-05,0.011639003,-0.01564944,0.010340519,-0.0018400348,0.0033230628,0.002907767,0.020802604,0.006026106,-0.0009731116,0.0017812101,-0.02150836,0.008555998,0.0014526007,-0.017928055,0.0011802462,-0.0027251062,0.0022748641,-0.006194438,-0.009429909,-0.004167343,-0.006107353,-0.024103742,-0.010688015,-0.004113559,-0.0027182596,-0.004780295,0.0032859195,-0.005794305,-0.0071362588,-0.012605804,-0.003066638,-0.0017234156,-0.02520538,0.010873682,-0.005181787,-0.011868011,-0.0024009761,0.01655549,0.0023768863,-0.004005433,-0.004928591,0.050152127,-0.020390175,-0.0035320455,-0.011849942,-0.023019984,-0.012117703,-0.009046536,0.001908407,-0.0069034635,0.00072391814,0.0065149227,-0.0008441852,0.0005939065,0.0107050035,0.00204388,-0.0008601085,0.008074031,-0.00735839,-0.016760388,-0.009138174,-0.0016163293,0.0030945905,0.09884008,-0.0016717023,0.004405357,0.01902254,-0.011803488,3.6049598e-05,-0.004188297,-0.0028616996,0.009384591,-0.0017743878,0.011131678,-0.004970719,0.0038074479,0.00090982544,-0.01330768,0.008850414,0.0024357645,-0.0024863111,0.009433146,-0.0010723028,0.007247262,0.0012246837,-0.002298991,-0.004789929,0.011692486,-5.1724848e-05,-0.008617539,0.013540573,-0.0086551225,-0.010994798,0.014882553,-0.008103974,0.004753855,-0.0022799536,0.007433084,-0.0028552788,-0.007870475,0.0007151041,-0.0042151255,0.012433148,-0.004466479,-0.0018310585,-0.01479751,0.000102107595,-0.019513402,-0.011423351,0.004026871,-0.005617638,-0.0076684044,0.013456534,0.011400543,0.010980554,0.0039815153,0.0071148085,-0.021808762,0.008734808,0.0056526666,0.014847343,0.0011634273,0.0019999016,0.012681218,-0.008918444,0.0012249844,-0.0012877245,-0.012100386,0.00011544663,0.004907816,0.020541312,0.008194869,-0.010812749,0.0025084813,0.015164451,0.008941656,0.003828725,-0.004438235,-0.00038538754,0.015148398,0.012548793,-0.0031739168,-0.0033555084,-0.002852712,-0.004947855,0.0011166019,0.00077841495,0.006609757,-0.0044015464,0.018727891,-0.0151045965,-4.7418e-05,-0.018581228,-0.0017966916,-0.0017197455,0.0062050554,-0.007426611,-0.01041788,0.005737551,0.0034609628,0.004261637,-0.004668843,0.00525046,-0.0008076115,0.0038219593,0.012361897,-0.014424434,0.016233137,-0.015775343,-0.015285859,0.0075024893,-0.0027964325,-0.00840335,-0.007358404,0.005591262,0.0030429137,-0.012333095,-0.011855166,-0.013441063,0.01098414,0.007903258,-0.009523705,-0.006671409,0.019713148,-0.00523589,-0.0035097802,-0.012682014,-0.0028667692,-0.0055520767,-0.006702338,-0.0034549031,-0.0009829951,-0.0021639818,0.007614636,-0.008177652,-0.0038180023,-0.0040877317,-0.00654799,-0.006181028,0.016403569,0.005760911,-0.025607714,0.0044386154,0.011432785,-0.011513672,-0.016175257,-0.013454133,0.0017832969,-0.00068859215,0.01015651,0.014572483,0.0078072874,-0.014861183,-0.0023932434,-0.004404038,0.0034263814,-0.0043450855,0.004294634,-0.013430951,8.5952015e-05,0.010960905,-0.004210072,0.014822506,-0.005022036,-0.034758974,-0.0021589608,0.0016632937,-0.006208433,0.018878128,-0.0069885347,0.0063937292,0.010275962,0.0023003088,-0.003624876,0.0034739682,-0.0042132866,0.0030904042,0.0058487123,0.0054843016,0.011040859,-0.010745165,-0.015304345,0.0013721545,-0.012568109,-0.011877988,0.010941512,-0.012536905,-0.0023661512,-0.01564649,0.0165266,-0.0060564466,-0.004585498,-0.008207385,-0.004718374,-0.0040940507,0.005519564,0.0056507713,0.0042924825,-0.011198579,0.0045426344,-0.0022365723,0.005842481,0.00052834663,-0.0027637053,0.0158377,-0.01330597,0.0031554506,-0.007268421,-0.015211402,0.007480833,0.004712669,-0.009344988,0.008121521,-0.0048360056,-0.00032563775,0.014624375,-0.019454831,0.008251006,0.006159717,-0.0053285784,0.009549141,0.009166073,0.00079760485,-0.0039875573,0.01844378,0.009361932,-0.0033809387,-0.012816882,-0.012781919,-0.008100924,-7.563186e-05,0.0017411485,0.0010076727,0.007842813,0.019330176,0.016487487,-0.0059207836,-0.0007109218,0.009611621,-0.01154374,0.0151735805,0.009392981,0.0049098865,0.011075496,-0.0061117075,0.0089233555,0.0030061088,0.002882267,-0.00436462,0.014863573,-0.00034557134,0.0017228406,-0.0058000353,0.0074974457,-0.010015575,0.011670428,-0.0064214584,0.017755847,-0.020873688,0.012882796,-0.007502539,-0.0020660711,-0.004441216,0.0106674,0.0034797606,-0.010332288,-0.011287262,0.0058448687,-0.009221806,0.0028841526,-0.0024777423,0.009891657,-0.002695264,0.007863654,-0.013023201,0.004859654,-0.007657962,0.005870287,-0.0006138872,0.0013115844,0.0034601567,-0.009067109,-0.0055174893,-0.002671227,-0.022969186,0.005415375,-0.0121726,-0.008860124,-0.0036155062,-0.00044087914,0.006014617,-0.0026214563,0.008245636,-0.0072702942,-0.006669036,0.0025725483,0.0065936316,-0.00040953158,-0.0064138216,0.011919245,0.011655725,0.0030224053,0.0025816907,-0.004949727,-0.0031097496,-0.005584289,0.022607768,-0.013487939,0.0030346827,0.010665948,-0.012798242,0.014686034,-0.00235567,0.017548997,0.0049350723,-0.015091705,0.004997916,0.011878953,0.019469488,-0.009513905,0.013731189,-0.0123080695,0.0009497748,-0.010191639,0.0056059533,0.01204105,0.009148441,-0.008292697,-0.004883089,9.5361465e-05,0.00052961987,-0.0011122087,0.0010036754,-0.0061094523,-0.0070184646,-0.00313158,0.02246653,0.0007559197,-0.0037306547,0.002053585,0.004843888,0.006942898,-0.005944938,-0.002549374,-0.011473837,0.0002622068,0.0056477347,0.008708076,-0.017967986,0.0034200305,-0.0019011244,0.00013890142,-0.0069828564,-0.0013633553,-0.005042031,-0.0049061966,0.0062775193,0.008541443,-0.0047932416,0.0069810725,0.015310512,0.01060237,0.018584905,-0.0077502974,0.007470153,-0.0066580833,0.0058255456,-0.011465918,-0.009792481,-0.11900126,-0.005888842,0.001400503,0.0020936632,-0.015598951,0.012286431,-0.00862616,-0.001280007,-0.011370906,-0.012767072,-0.013364809,-0.00042832852,0.0074244984,-0.016172506,-0.004006175,-0.0047208457,0.0010088644,-0.00020339181,-0.012826747,-0.008770054,-0.0019554344,0.008229251,0.005039262,0.012453372,-0.0036353886,0.018666442,-0.009531452,0.0015104895,0.007046214,0.0006629627,-0.0036561736,-0.012694423,0.006417648,-0.0067299963,0.0016532461,0.00730926,0.019375132,-0.0004543069,-0.15902165,-0.0115438765,-0.013828552,0.0011424494,-0.0030938822,-0.008758033,0.0067191096,0.0047934335,0.011900124,0.003073037,-0.004870567,0.0034534258,0.0010052026,-0.0043304064,-0.009916783,-0.008525444,-0.0007882641,-0.008279982,-0.013472816,0.006181947,-0.017197808,-0.002406425,0.0066299723,0.016077923,0.0038998136,0.0034513324,0.011350521,-0.009352355,-0.01140259,-0.0013988782,0.0146076465,0.00086855586,0.017277738,-0.017137088,-0.02014496,0.0022709363,0.001883346,0.018947506,-0.001902647,-0.0019648345,0.007791748,0.0018112198,-0.002528584,0.00797072,0.0075601046,0.0076317354,-0.0069482215,0.007531359,0.012197793,-0.0063741053,-0.013681596,0.0028748557,-0.0037880205,0.0106657315,-0.0023659097,-0.00020229608,-0.012396012,0.00816928,-0.002436053,0.018028654,-0.011351923,0.00011819446,0.0076867277,-0.0036365131,0.0075042257,-0.0039030325,0.0052516363,0.003560199]	2026-03-16 23:52:40.406608+00	\N	\N	\N
\.


--
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.documents (id, university_id, user_id, visibility, title, created_at, course_number, course_name, professor, file_name, storage_bucket, storage_path) FROM stdin;
d500e850-ab6f-4062-9771-7e4111260a90	db3845d2-5679-4d84-9856-8ff2c82edc4e	\N	public	Machine Learning Basics (Learned)	2026-02-27 13:57:35.476694+00	\N	\N	\N	\N	\N	\N
b3509577-002b-4b41-aea0-6c18f0f3371f	db3845d2-5679-4d84-9856-8ff2c82edc4e	\N	public	UC Total Student Enrollment (Learned)	2026-03-09 22:40:49.819612+00	\N	\N	\N	\N	\N	\N
016c2a70-59ab-4be1-b84c-d4e54c557871	db3845d2-5679-4d84-9856-8ff2c82edc4e	\N	public	UC Biology Courses Query (Learned)	2026-03-09 23:08:22.446985+00	\N	\N	\N	\N	\N	\N
b9eae9ec-3d33-498e-bc38-69cbfe35a2a2	db3845d2-5679-4d84-9856-8ff2c82edc4e	31cc7cef-c734-4a0d-8368-10440ee52424	private	Memory: User attends UC....	2026-03-16 23:52:39.62983+00	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: friend_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.friend_details (id, user_id, friend_number, contact_info, created_at) FROM stdin;
adbd79aa-5e5c-402f-8683-32668c635707	9d84eef9-5c54-4a94-b69d-51e82faaee73	1	9876543215	2026-02-25 06:01:58.394321+00
70ca47ba-7d31-48d4-a587-a4c575560c00	9d84eef9-5c54-4a94-b69d-51e82faaee73	2	testfriends@gmail.com	2026-02-25 06:01:58.394321+00
cce76a1a-1871-4566-8782-e55e28de0280	31cc7cef-c734-4a0d-8368-10440ee52424	1	772-485-2300	2026-03-09 22:32:20.634392+00
f3e4d4bb-e26d-41a4-91b5-157de89a5d83	31cc7cef-c734-4a0d-8368-10440ee52424	2	772-203-3000	2026-03-09 22:32:20.634392+00
37f7426c-0f65-4485-930e-81b325200bf3	31cc7cef-c734-4a0d-8368-10440ee52424	3	webs801@outlook.com	2026-03-09 22:32:20.634392+00
2c6313e0-3c6f-40db-82d2-071214894b4b	de1dc022-ea84-4098-9ac7-5952270495cb	1	9851247562	2026-03-10 05:18:22.485392+00
736a90f5-e471-428c-9628-6bbd59e98a3a	b3ec626f-8311-40ae-882f-4d67bfe75163	1	5845216351	2026-03-12 06:12:52.744013+00
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.messages (id, chat_id, user_id, role, content, created_at) FROM stdin;
ed584721-50eb-4fed-bd2a-28055f7c4f86	7bac37d2-99c7-4a8a-b369-6ee27f8cbf54	31cc7cef-c734-4a0d-8368-10440ee52424	user	How many courses does UC have for biology and give me the 3 most popular course #'s	2026-03-09 23:05:13.944872+00
0f9bc1f8-8c16-4940-bb14-1d54cfeb080c	7bac37d2-99c7-4a8a-b369-6ee27f8cbf54	31cc7cef-c734-4a0d-8368-10440ee52424	assistant	UC's Department of Biological Sciences offers dozens of undergraduate Biology (BIOL) courses, but the exact total varies by catalog year (typically 50–100+ including labs/electives). Search the full list here: [Class Offerings](https://www.onestop.uc.edu/registration/class-offerings.html).\n\nAs a Biology freshman in BIOL 1081, 3 popular/enrolled intro courses (based on typical freshman sequences):\n- BIOL 1081: Biological Concepts: Structure & Function (yours with Prof. Dr. Stoffer—high enrollment for majors).\n- BIOL 1082: Biological Concepts: Diversity (common follow-up).\n- BIOL 1090: Life Science (broad appeal for non-majors/majors).\n\nVerify current offerings/enrollments on official sites, as they update per semester. For your Biology major path, check [Majors & Programs](https://www.uc.edu/majors-programs.html).	2026-03-09 23:05:32.223639+00
d0e1fc8f-99f0-48f8-832a-19b0213c0372	06692b0d-b228-4c8f-8225-97b8c06d44e5	31cc7cef-c734-4a0d-8368-10440ee52424	user	when is the next UC football game	2026-03-12 00:16:42.676963+00
64810ff8-2cbb-4824-ba96-f07a6500008d	06692b0d-b228-4c8f-8225-97b8c06d44e5	31cc7cef-c734-4a0d-8368-10440ee52424	assistant	UC football games (Bearcats schedule) are listed as major campus events. I don't have real-time dates, but check these for the next one:\n\n- Fall season typically starts late August/September; home games at Nippert Stadium.\n- [UC Calendar](https://calendar.uc.edu/all)\n- [Campus Events](https://getinvolved.uc.edu/events)\n\nVerify for exact date/time/tickets—schedules update! 🐻⬆️	2026-03-12 00:16:50.243294+00
8316eb1d-f373-4449-8cc4-4c76a6a0392c	df9f023a-0ffe-46e8-bee7-6c6932e7f148	31cc7cef-c734-4a0d-8368-10440ee52424	user	what symbiotes live in brackish water	2026-03-16 23:47:41.582872+00
62806184-61be-4f3e-8565-45ee1ecef6d8	df9f023a-0ffe-46e8-bee7-6c6932e7f148	31cc7cef-c734-4a0d-8368-10440ee52424	assistant	Hey AA, great Bio 1081 question—symbiosis (mutualism, commensalism, parasitism) is key in brackish water ecosystems like estuaries and salt marshes, where salinity fluctuates. These relationships help organisms survive stress from salt/freshwater mix.\n\n### Common symbiotes in brackish water:\n- **Nitrogen-fixing bacteria** (e.g., with salt marsh grasses like *Spartina alterniflora*)—mutualism: bacteria get habitat/carbon, plants get nitrogen.\n- **Polynucleobacter bacteria** in brackish ciliates like *Euplotes harpa*—symbionts provide nutrients/ammonia detox.\n- **Boring sponges** on oysters/mussels—parasitism: sponge drills into shell, harming/killing host.\n- **Barnacles** on crabs/shellfish—commensalism: barnacles get transport/food access, host unaffected.\n- **Cleaning shrimps** (e.g., *Alpheus estuariensis*) with fish—mutualism: shrimps eat parasites, fish get cleaned.\n\n### Sample practice questions (Bio 1081-style):\n1. Classify the barnacle-oyster relationship in a brackish estuary: (A) Mutualism (B) Commensalism (C) Parasitism. *Ans: B*\n2. How do nitrogen-fixing symbionts benefit *Spartina* in salt marshes? *Ans: Provide usable nitrogen in nutrient-poor soil.*\n3. Give an example of bacterial symbiosis in brackish-water protists. *Ans: Polynucleobacter in *Euplotes harpa*.*\n4. Why are symbiotic microbes crucial in fluctuating salinity? *Ans: Help with osmoregulation, nutrient cycling, detox.*\n\n### Quick study plan for symbiosis:\n- **Today**: Review notes/Canvas on types (mutualism/commensalism/parasitism); diagram 2 brackish examples.\n- **Next 2 days**: Quiz yourself on 5 examples + types; watch Khan Academy symbiosis vid (5 min).\n- **Before quiz**: Flashcards for hosts/symbiotes; email Dr. Stoffer for estuary focus if in syllabus.\n\nCheck your Bio 1081 Canvas modules for Prof. Stoffer's specifics—quiz prep rocks! 🚀\n\nMore details: \n🔗 [express.adobe.com](https://express.adobe.com/page/JR43T)\n🔗 [link.springer.com](https://link.springer.com/article/10.1007/s12237-022-01052-2)	2026-03-16 23:48:00.925105+00
23abde67-d92d-4526-825f-9a22184e2588	3e21644e-994d-4a38-997e-87e58428311c	9d84eef9-5c54-4a94-b69d-51e82faaee73	user	HI	2026-03-06 07:09:29.644067+00
24066c26-649d-4bdf-a759-4db6632f471f	3e21644e-994d-4a38-997e-87e58428311c	9d84eef9-5c54-4a94-b69d-51e82faaee73	assistant	Hey wede! 👋 I'm LoopPlus.ai, your study assistant for Florida State University. What do you need help with today?	2026-03-06 07:09:34.048351+00
916274ad-153a-405c-8831-3f79dc8ecbe7	7bac37d2-99c7-4a8a-b369-6ee27f8cbf54	31cc7cef-c734-4a0d-8368-10440ee52424	user	now give me a longer answer to that same question and more in depth	2026-03-09 23:13:42.385641+00
fcbb1567-5145-4516-9848-9bd1c1391641	06692b0d-b228-4c8f-8225-97b8c06d44e5	31cc7cef-c734-4a0d-8368-10440ee52424	user	why can't you do real-time dates	2026-03-12 00:24:43.524605+00
f1e64f2c-cea5-41ed-ad6a-1863946fe768	06692b0d-b228-4c8f-8225-97b8c06d44e5	31cc7cef-c734-4a0d-8368-10440ee52424	assistant	I'm built to pull from stable, official UC sources for accuracy and privacy—real-time data like event dates or weather changes too fast and requires live web access, which I don't have to keep responses reliable and focused on student success.\n\n**Quick fix**: Always check [UC Calendar](https://calendar.uc.edu/all) or [Campus Events](https://getinvolved.uc.edu/events) for the freshest Bearcats football schedule. That way, you get exact deets instantly! 🐻	2026-03-12 00:24:54.644553+00
088adbbf-20ca-49d2-b93f-1e07977c9d8b	df9f023a-0ffe-46e8-bee7-6c6932e7f148	31cc7cef-c734-4a0d-8368-10440ee52424	user	i am taking re 3091 with steve reynolds real estate principles at uc, when is my next quiz	2026-03-16 23:52:24.626393+00
0239ab88-6aab-4992-828b-bbc718b65e03	df9f023a-0ffe-46e8-bee7-6c6932e7f148	31cc7cef-c734-4a0d-8368-10440ee52424	assistant	Hey AA, for RE 3091 Real Estate Principles with Steve Reynolds, I don't have your exact quiz dates (set by instructor in syllabus/Canvas).\n\n- Log into > Dashboard > RE 3091 > Check syllabus, Quizzes tab, or calendar/announcements.\n- Email Steve Reynolds if not posted.\n- Set Canvas notifications for due dates.\n\n**Quick steps**:\n- Canvas > Your courses > RE 3091.\n- Review Modules/Quizzes for next one (often weekly/biweekly in real estate intro courses).\n- Cross-check UC academic calendar for semester exam periods.\n\nMore details: \n🔗 [Canvas](https://canvas.uc.edu)	2026-03-16 23:52:34.046272+00
edf8c964-4c1f-4305-8c1b-97a6ac2a8527	c3f1647e-492d-43e1-b43f-459e221a8ede	9d84eef9-5c54-4a94-b69d-51e82faaee73	user	HI	2026-03-06 07:11:11.693294+00
090aa455-3c55-4688-b00a-62f7e01c85d9	c3f1647e-492d-43e1-b43f-459e221a8ede	9d84eef9-5c54-4a94-b69d-51e82faaee73	assistant	Hi wede! Welcome to LoopPlus.ai, your study assistant for Florida State University. How can I help with classes, deadlines, or campus life today?	2026-03-06 07:11:15.378963+00
832ed34e-8abb-4327-90c4-03d4b642df8e	c3f1647e-492d-43e1-b43f-459e221a8ede	9d84eef9-5c54-4a94-b69d-51e82faaee73	user	HI	2026-03-06 07:11:33.143492+00
c255fd6c-9db1-4702-835e-0e9f9c444afe	c3f1647e-492d-43e1-b43f-459e221a8ede	9d84eef9-5c54-4a94-b69d-51e82faaee73	assistant	Hey wede! 👋 I'm LoopPlus.ai for Florida State University. What do you need help with today?	2026-03-06 07:11:36.632929+00
ab365b93-438a-479d-9bf0-bbe99197bbad	7bac37d2-99c7-4a8a-b369-6ee27f8cbf54	31cc7cef-c734-4a0d-8368-10440ee52424	user	now give me a longer answer to that same question and more in depth	2026-03-09 23:14:22.000446+00
ae6837f2-08e6-43d0-b001-2b327f24826b	7bac37d2-99c7-4a8a-b369-6ee27f8cbf54	31cc7cef-c734-4a0d-8368-10440ee52424	assistant	### In-Depth Overview of Biology Courses at University of Cincinnati (UC)\n\nAs a freshman Biology major taking BIOL 1081 with Prof. Dr. Stoffer, you're starting in one of UC's core sequences. UC's **Department of Biological Sciences** (in the College of Arts and Sciences) offers a robust lineup of undergraduate Biology courses, all prefixed with **BIOL**. The **exact total number isn't fixed**—it fluctuates with catalog updates, new faculty research, and semester offerings—but typically ranges from **50–100+ distinct courses** per academic year. This includes:\n\n- **Introductory/Foundation (10–15 courses)**: Entry-level for freshmen/sophomores like you.\n- **Core Required (15–20 courses)**: Genetics, ecology, evolution, cell biology—mandatory for BS/BA in Biology.\n- **Electives/Advanced (20–40+ courses)**: Labs, field studies, specialized topics (e.g., microbiology, neurobiology).\n- **Labs & Seminars (10–20)**: Paired with lectures (e.g., BIOL 1081L) or capstones.\n\nTo get the **precise current count**:\n1. Go to UC's [Class Offerings search](https://www.onestop.uc.edu/registration/class-offerings.html).\n2. Filter by **Subject: BIOL**, **Campus: Main**, **Level: Undergraduate**.\n3. Count unique course numbers (ignore sections)—this shows active offerings for upcoming terms.\n\nNumbers change yearly (e.g., summer sessions add variants), so always verify there. Full Biology program details: [Majors & Programs](https://www.uc.edu/majors-programs.html).\n\n#### Why This Many Courses? Biology at UC Emphasizes...\n- **Research Integration**: Ties to UC's strong bio research (e.g., labs in molecular bio, ecology).\n- **Flexibility for Majors/Minors**: Supports Biology BS/BA, pre-med tracks, your finance minor combo (e.g., bioinformatics electives).\n- **Interdisciplinary Options**: Cross-lists with chemistry (CHEM), environmental science.\n\n#### 3 Most Popular Course Numbers (High-Enrollment Intro Staples)\nPopularity based on consistent high enrollment (thousands of seats filled yearly for freshmen/majors), accessibility, and prereqs. Sort by "seats filled" in class search for real-time data. Here's the top 3 for Biology freshmen:\n\n1. **BIOL 1081: Biological Concepts: Structure & Function (3 credits + lab option)**  \n   - **Why popular?** Gateway for ~1,000+ students/year (Biology majors, pre-health, gen ed). Covers cells, genetics, physiology—your exact course! Prof. Dr. Stoffer's version emphasizes hands-on labs.  \n   - **Enrollment tip**: Often 200–300 seats/section; prereq: high school bio/chem.  \n   - **Study pro-tip**: Focus on diagrams (e.g., mitosis); practice with flashcards for terms like "osmosis."\n\n2. **BIOL 1082: Biological Concepts: Diversity (3 credits + lab)**  \n   - **Why popular?** Direct sequel to 1081 (~800–1,000 enrollees); evolution, biodiversity, ecology. Essential for major progression.  \n   - **Next step for you**: Take after 1081—pairs well with your freshman schedule.  \n   - **Key topics**: Darwinian evolution, ecosystems; labs include dissections/field trips.\n\n3. **BIOL 1090: Life Science (4 credits, lab-integrated)**  \n   - **Why popular?** Broad appeal (~1,500+ students/year) for non-majors, education majors, and Biology electives. Lighter prereqs, focuses on real-world apps (e.g., human health, environment).  \n   - **Fit for you**: Great elective if balancing finance minor; overlaps with intro concepts.  \n   - **Hands-on**: Experiments like DNA extraction.\n\n#### Quick Advice for Your Biology Path\n- **Freshman Sequence**: Finish 1081 → 1082 → BIOL 2000C (Intro Bio Lab) for major standing.\n- **Find More Popular Ones**: In class search, filter BIOL + sort by enrollment. Upper-level hits: BIOL 3010 (Genetics), BIOL 4060 (Ecology).\n- **Resources**: Bearcat Portal for advising; join Biology Club via GetInvolved for peer tips.\n- **Pro Tip**: Enrollment peaks early—register via One Stop. If numbers seem off, it's due to term-specific offerings.\n\nThis is based on standard UC catalogs—**double-check official tools** for 2024-25 updates, as offerings evolve. Hit up your advisor for personalized sequencing! 🚀	2026-03-09 23:14:35.913876+00
a6bfd113-e185-439b-9acd-50fd24abf3b9	60289ebb-4626-45a6-8ee0-1121009eec7d	de1dc022-ea84-4098-9ac7-5952270495cb	user	When is the next UC football game?	2026-03-13 09:54:31.932845+00
56995847-bece-4e2d-9311-d8c02673ebed	60289ebb-4626-45a6-8ee0-1121009eec7d	de1dc022-ea84-4098-9ac7-5952270495cb	assistant	The next University of Cincinnati Bearcats football game is **Saturday, October 26, 2024**, at 7:00 p.m. ET vs. Indiana State at Nippert Stadium.\n\nVerify the latest schedule and tickets on official calendars:  \n[UC Calendar](https://calendar.uc.edu/all)  \n[Campus Events](https://getinvolved.uc.edu/events)	2026-03-13 09:54:50.890446+00
d7b88133-0d67-4a33-b043-a8468ae46498	0fe52f72-4250-4a82-8bd6-40adc2f83a64	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	user	hi	2026-03-17 05:58:11.733378+00
4021cadb-68ad-49e8-9421-22251a02e91a	0fe52f72-4250-4a82-8bd6-40adc2f83a64	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	assistant	Hi! Welcome to LoopPlus.ai, your friendly AI assistant for Florida State University—how can I help you today? 😊	2026-03-17 05:58:14.699291+00
61db20df-7d67-4705-b697-f873084d02a5	ecd8424b-8eb4-45bb-8d4d-e081323fa2aa	de1dc022-ea84-4098-9ac7-5952270495cb	user	hi	2026-03-10 05:26:32.380742+00
a8db8b6e-c0d3-4594-ac13-ac489939fe42	60289ebb-4626-45a6-8ee0-1121009eec7d	de1dc022-ea84-4098-9ac7-5952270495cb	user	When is the next UC football game in 2026?	2026-03-13 09:56:46.792727+00
3eb14a6c-ae19-41ea-99e6-ff580852927f	60289ebb-4626-45a6-8ee0-1121009eec7d	de1dc022-ea84-4098-9ac7-5952270495cb	assistant	The 2026 University of Cincinnati Bearcats football schedule has not been officially released yet (typically announced 1–2 years in advance, with the season starting late August). For updates as they become available:\n\n[UC Calendar](https://calendar.uc.edu/all)  \n[Campus Events](https://getinvolved.uc.edu/events)	2026-03-13 09:56:58.73145+00
9a807856-299d-4af6-95c1-1c8ed8d84ec4	8590bc6a-e635-4874-b84b-3b5b989ec940	9d84eef9-5c54-4a94-b69d-51e82faaee73	user	Explain this topic	2026-03-17 10:01:47.975856+00
5e3de3a7-d0f7-4876-9112-34be8882ad3f	8590bc6a-e635-4874-b84b-3b5b989ec940	9d84eef9-5c54-4a94-b69d-51e82faaee73	assistant	Hey wede, "this topic" is a bit vague—what specific subject or concept from your CS101 class (or elsewhere) do you want explained? Drop more details, and I'll break it down with examples and a quick study plan! 🚀	2026-03-17 10:01:55.046175+00
c60a41a7-87cc-4d0b-930e-633176c3a18e	6c3f7c1e-bcd5-4630-99e5-f7602bc9030b	31cc7cef-c734-4a0d-8368-10440ee52424	user	How many students go to UC this year total	2026-03-09 22:40:07.627544+00
8451d1af-9a2f-46f0-a4d5-cdbaa0427f13	6c3f7c1e-bcd5-4630-99e5-f7602bc9030b	31cc7cef-c734-4a0d-8368-10440ee52424	assistant	UC's total enrollment (undergrad + grad) is approximately 47,000 students, but exact figures fluctuate yearly with admissions cycles. For the most current 2024-25 numbers, check official UC sources like the [admissions page](https://www.uc.edu/admissions.html) or registrar reports.	2026-03-09 22:40:17.714942+00
72a32fda-277f-420c-a185-b09fe89d54a7	ecd8424b-8eb4-45bb-8d4d-e081323fa2aa	de1dc022-ea84-4098-9ac7-5952270495cb	assistant	Hi Jatin! How can I help you today at the University of Cincinnati? 😊	2026-03-10 05:26:35.932034+00
a7054859-429a-4227-9bca-8a91d67dcdad	51eb2284-2cee-4dae-8a56-54b96dc2f16f	9d84eef9-5c54-4a94-b69d-51e82faaee73	user	What clubs can I join?	2026-03-16 13:21:24.822169+00
6c3465ac-349f-4267-b6c5-357118116359	51eb2284-2cee-4dae-8a56-54b96dc2f16f	9d84eef9-5c54-4a94-b69d-51e82faaee73	assistant	Hey wede, as an FSU sophomore, joining a club is a great way to build your resume, network, and have fun—perfect timing since you're past freshman year! \n\n**Quick facts on FSU clubs:**\n- Over 700 registered student organizations (RSOs), from academic (e.g., Cybersecurity Club, Ad Club), service (Dance Marathon, Relay for Life), cultural, sports/intramurals, Greek life, and more.\n- All searchable on **Nole Central** (FSU's hub for events and orgs).\n\n**How to join (3 easy steps):**\n1. Visit or start at the Office of Student Organizations & Involvement:.\n2. Filter by category, keyword (e.g., "sports," "business"), or campus location.\n3. RSVP to interest meetings or events—most are open to anyone.\n\nPro tip: Check for Involvement Fairs or Market Wednesdays for in-person sign-ups. What are you into (e.g., sports, service, academics)? I can suggest tailored options! Verify on official sites as lists update.\n\nMore details: \n🔗 [business.fsu.edu](https://business.fsu.edu/cps/students/find-club-or-organization)\n🔗 [soi.fsu.edu](https://soi.fsu.edu/)	2026-03-16 13:21:40.877254+00
33a72268-ad82-4d24-8b8a-e0d315564c3c	1cdb0a25-2513-4088-92d8-ad326c0fcea5	9d84eef9-5c54-4a94-b69d-51e82faaee73	user	Hi	2026-03-17 10:31:02.473691+00
6e4450a5-d319-4346-b5a6-0037b8f0800b	6c3f7c1e-bcd5-4630-99e5-f7602bc9030b	31cc7cef-c734-4a0d-8368-10440ee52424	user	What is the average temperature in March on campus ?	2026-03-09 22:55:18.528702+00
fe2cb5ed-bb74-4fca-ab64-5bb71db938f3	6c3f7c1e-bcd5-4630-99e5-f7602bc9030b	31cc7cef-c734-4a0d-8368-10440ee52424	assistant	In Cincinnati (UC main campus area), the average March temperature is around 42°F (6°C) overall, with daily highs ~52°F (11°C) and lows ~33°F (1°C). Weather varies—expect mix of rain/snow early month transitioning to milder spring.\n\nFor historical data or forecasts:\n- Check NOAA Cincinnati or Weather Underground.\n- UC campus can feel cooler near Ohio River; layer up for classes/orientation walks. Verify current via app for your biology field trips!	2026-03-09 22:55:27.460339+00
b5bfd20f-0cd3-4eb0-8e51-410d7482adcc	6c3f7c1e-bcd5-4630-99e5-f7602bc9030b	31cc7cef-c734-4a0d-8368-10440ee52424	user	What is the average temperature in June on campus?	2026-03-09 22:55:59.401181+00
b72f3522-8748-4dc9-bec0-75662c88cd77	6c3f7c1e-bcd5-4630-99e5-f7602bc9030b	31cc7cef-c734-4a0d-8368-10440ee52424	assistant	In Cincinnati (UC main campus area), the average June temperature is around 73°F (23°C) overall, with daily highs ~83°F (28°C) and lows ~63°F (17°C). Expect humid, warm days with thunderstorms possible—perfect for outdoor biology field work or campus rec, but stay hydrated!\n\nFor historical data or forecasts, check NOAA Cincinnati or Weather Underground.	2026-03-09 22:56:06.262907+00
4ad2afde-3fbb-4b7d-aeee-cde7214fd062	06692b0d-b228-4c8f-8225-97b8c06d44e5	31cc7cef-c734-4a0d-8368-10440ee52424	user	what is the weather forcast for the next UC football game home game	2026-03-12 00:14:13.401757+00
fa977515-5e78-4213-b5c9-96bb77f0fcea	06692b0d-b228-4c8f-8225-97b8c06d44e5	31cc7cef-c734-4a0d-8368-10440ee52424	assistant	I don't have real-time weather data, but here's how to get the forecast for UC's next home football game:\n\n- **Find the date**: Check the UC events calendar for the Bearcats football schedule (games are major campus events).\n  - [UC Calendar](https://calendar.uc.edu/all)\n  - [Campus Events](https://getinvolved.uc.edu/events)\n- **Weather check**: Use AccuWeather or Weather.com for Cincinnati, OH, on game day (Nippert Stadium). Expect typical fall temps (50-70°F), but verify closer to date as it changes.\n\nGame schedules update seasonally—confirm there for the latest! Go Bearcats! 🐻	2026-03-12 00:14:27.41759+00
07f6363a-fc52-408c-823a-74cba8d13b65	df9f023a-0ffe-46e8-bee7-6c6932e7f148	31cc7cef-c734-4a0d-8368-10440ee52424	user	when is my mnext quiz	2026-03-16 23:46:14.877418+00
1abad6d1-94a6-42dd-8608-e38b578431e9	df9f023a-0ffe-46e8-bee7-6c6932e7f148	31cc7cef-c734-4a0d-8368-10440ee52424	assistant	Hey AA, as a freshman in Biology 1081 (Prof. Dr. Stoffer) and FIN 1001, I don't have your exact quiz dates (they're set by instructors and posted in Canvas/syllabi).\n\n- Log into Canvas (canvas.uc.edu) for both courses—check the syllabus, calendar, or announcements tab for the next quiz.\n- Email Prof. Dr. Stoffer or your FIN instructor if not listed.\n- Review the academic calendar for semester deadlines around quizzes/exams.\n\n**Quick steps**:\n- Go to Canvas > Dashboard > Your courses.\n- Look under "Quizzes" or "Modules."\n- Set notifications for due dates.	2026-03-16 23:46:26.247214+00
4d116dca-fc12-46a0-b39d-00ff263e193d	1cdb0a25-2513-4088-92d8-ad326c0fcea5	9d84eef9-5c54-4a94-b69d-51e82faaee73	assistant	Hi wede! Welcome to LoopPlus.ai, your friendly AI assistant for all things Florida State University—how can I help today? 😊	2026-03-17 10:31:06.913361+00
\.


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profiles (user_id, university_id, name, email, major, minor, year, interests, photo_url, created_at, updated_at, academic_year, graduation_school) FROM stdin;
9d84eef9-5c54-4a94-b69d-51e82faaee73	296f159b-5540-4b59-8409-f5bf9f8d6c1e	wede	riyasindhav2003@gmail.com	\N	sdfc	sophomore	df	\N	2026-02-25 06:01:58.107703+00	2026-02-25 06:01:58.107703+00	Year 1	MBA
31cc7cef-c734-4a0d-8368-10440ee52424	db3845d2-5679-4d84-9856-8ff2c82edc4e	AA	ohre255@gmail.com	biology	finance	freshman	tennis, soccer, , partying on campus, real estate	\N	2026-03-09 22:32:19.926176+00	2026-03-09 22:32:19.926176+00	1	\N
de1dc022-ea84-4098-9ac7-5952270495cb	db3845d2-5679-4d84-9856-8ff2c82edc4e	Jatin	jatinsanchaniya9122@gmail.com	Engineering	\N	freshman	Music	https://gmvgnostwhpbplhbdtfz.supabase.co/storage/v1/object/public/loopplus/profiles/de1dc022-ea84-4098-9ac7-5952270495cb/1773119900.jpeg	2026-03-10 05:18:21.775399+00	2026-03-10 05:18:21.775399+00	Year 1	Degree
b3ec626f-8311-40ae-882f-4d67bfe75163	296f159b-5540-4b59-8409-f5bf9f8d6c1e	Jatin Test	demoemail7564@gmail.com	Engineering	\N	freshman	Machine manufacturing	\N	2026-03-12 06:12:52.053405+00	2026-03-12 06:12:52.053405+00	Year 1	Degree
0dc711bb-e6c7-47e3-9245-be65bb8d1e11	296f159b-5540-4b59-8409-f5bf9f8d6c1e	test_reward	coxowe9564@faxzu.com	\N	Computer Science	sophomore	ai	\N	2026-03-13 11:14:41.395567+00	2026-03-13 11:14:41.395567+00	Year 1	MBA
\.


--
-- Data for Name: referral_stats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.referral_stats (id, user_id, total_referrals, unclaimed_referrals, free_months_from_referrals, created_at, updated_at, referral_code, business_referral_code, business_referrals_count, business_unclaimed_referrals, free_months_from_business) FROM stdin;
ace596bc-a1f8-42a3-9169-f6915e5b8389	9d84eef9-5c54-4a94-b69d-51e82faaee73	0	0	0	2026-02-25 06:01:59.075101+00	2026-02-25 06:01:59.075101+00	WED1722	BIZ-QRO5720	0	0	0
1edf2954-3dd1-4d69-8e3f-55becfff56c1	31cc7cef-c734-4a0d-8368-10440ee52424	0	0	0	2026-03-09 22:32:22.65056+00	2026-03-09 22:32:22.65056+00	USR1696	BIZ-NZK2380	0	0	0
8d08071d-fa5b-45d3-a88f-1863a05dc856	de1dc022-ea84-4098-9ac7-5952270495cb	0	0	0	2026-03-10 05:18:24.521771+00	2026-03-10 05:18:24.521771+00	JAT3875	BIZ-QTJ0802	0	0	0
b718c843-2a14-489b-89f1-ca03bf5086cd	b3ec626f-8311-40ae-882f-4d67bfe75163	0	0	0	2026-03-12 06:12:54.681591+00	2026-03-12 06:12:54.681591+00	JAT6784	BIZ-TEF3233	0	0	0
ca830734-0b44-433c-a9b4-d2e39fb6fc1b	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	0	0	0	2026-03-13 11:14:43.908896+00	2026-03-13 11:14:43.908896+00	TES1064	BIZ-FCS5960	0	0	0
\.


--
-- Data for Name: subscription_free_month_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscription_free_month_history (id, user_id, source, earned_units, free_months, days_added, stripe_subscription_id, status, error_message, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscriptions (id, user_id, stripe_customer_id, stripe_subscription_id, plan_family, plan_interval, is_paid_user, subscription_status, trial_end, early_bird_eligible, created_at, updated_at) FROM stdin;
4f3eff28-4b0d-4068-b696-ec113c35fccc	9d84eef9-5c54-4a94-b69d-51e82faaee73	cus_U2gYNqXV3t6E9u	\N	\N	\N	f	trialing	2026-03-27 06:01:59.178909+00	t	2026-02-25 06:01:59.21906+00	2026-02-25 06:01:59.21906+00
6afe7ae6-1f26-44ee-802d-ee7e3a383076	de1dc022-ea84-4098-9ac7-5952270495cb	cus_U7XtMuQxAWNKnm	\N	\N	\N	f	trialing	2026-04-09 05:18:24.858521+00	t	2026-03-10 05:18:24.970823+00	2026-03-10 05:18:24.970823+00
14e1ae75-116b-4af8-a7bb-d4a1ee666317	b3ec626f-8311-40ae-882f-4d67bfe75163	\N	\N	\N	\N	f	trialing	2026-04-11 06:12:55.001769+00	t	2026-03-12 06:12:55.10763+00	2026-03-12 06:12:55.10763+00
170f1489-9b0e-4af8-af2d-508266aa2f4d	31cc7cef-c734-4a0d-8368-10440ee52424	cus_U8Dcf7XnVYmSpc	sub_1T9xJtGVYZuhZjkgFM3l0dHu	LoopPlus	monthly	t	active	2026-04-12 00:41:42+00	f	2026-03-09 22:32:23.090701+00	2026-03-12 00:41:49.403138+00
36869cbc-520a-413c-8616-066b60684ecb	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	cus_UAAxaSuPWjmwTo	\N	LoopPlus	monthly	t	active	2026-04-12 11:14:44.649648+00	t	2026-03-13 11:14:44.756447+00	2026-03-13 11:14:44.756447+00
\.


--
-- Data for Name: universities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.universities (id, slug, name, created_at) FROM stdin;
db3845d2-5679-4d84-9856-8ff2c82edc4e	uc	University of Cincinnati	2026-02-13 15:36:41.883781+00
296f159b-5540-4b59-8409-f5bf9f8d6c1e	fsu	Florida State University	2026-02-13 15:36:41.883781+00
\.


--
-- Data for Name: university_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.university_links (id, university_id, url, category, description, created_at) FROM stdin;
\.


--
-- Data for Name: user_devices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_devices (id, user_id, device_id, device_label, is_active, first_seen_at, last_seen_at, ip_hash) FROM stdin;
1c472906-3e1a-48db-882a-75ef051ecb14	9d84eef9-5c54-4a94-b69d-51e82faaee73	88af6564-c04a-49ef-865f-7fae1af15766	Chrome on Linux	f	2026-03-16 13:09:05.042406+00	2026-03-16 13:13:03.902948+00	ada38c76b69a9992a5c13a6bab883f33daa5bb2c59364f1b5a846759a9b949bd
91d111f4-c27e-43cd-b9ca-86ed5313d020	de1dc022-ea84-4098-9ac7-5952270495cb	51218553-af0c-44de-8ee8-a6b1f24f7099	Chrome on Linux	t	2026-03-12 12:39:52.468526+00	2026-03-12 13:08:31.854994+00	6e29ad14efc69da51e6a567d059584840784c2a38e4827d9c3b4db4e47b61ec5
a1d0221f-b8e0-4037-bb01-2c6034f2db5f	31cc7cef-c734-4a0d-8368-10440ee52424	b7dfb792-04d5-47cf-9feb-4f6d5a0d8526	Chrome on Windows	t	2026-03-09 22:32:20.964768+00	2026-03-16 23:45:09.661983+00	efbfefe42f0291fc34aaf3559f8ff3b5e36dd746ea87ca3867280af5e42a8168
b991c70c-6a5d-414b-9e2b-5f24ec57d06c	31cc7cef-c734-4a0d-8368-10440ee52424	c79db11b-1465-4433-91f6-c2c615eb8954	Safari on MacOS	t	2026-03-09 22:34:31.705986+00	2026-03-09 22:34:32.182639+00	efbfefe42f0291fc34aaf3559f8ff3b5e36dd746ea87ca3867280af5e42a8168
74583bd5-2907-4d07-a0c2-f35fa3bbfb81	9d84eef9-5c54-4a94-b69d-51e82faaee73	8d90fadc-d739-4962-8f2d-7ab8905607bb	Chrome on Linux	t	2026-03-13 10:27:49.484772+00	2026-03-13 13:24:23.556234+00	e7ff3e64484f28aa6be3c20b606a093c35b721cfee7abefc0813a865b01860b9
b1b36a06-7de3-490a-9bb2-31f6ce90571e	9d84eef9-5c54-4a94-b69d-51e82faaee73	922a2777-c33e-4b46-b815-8a865dbff1dd	Firefox on Linux	f	2026-03-03 13:49:06.845162+00	2026-03-16 12:49:36.689778+00	e7ff3e64484f28aa6be3c20b606a093c35b721cfee7abefc0813a865b01860b9
bb579f89-741a-43e6-a139-d7d825b2fa63	31cc7cef-c734-4a0d-8368-10440ee52424	bb44fed1-145a-4893-8c1a-d0b46ba8b03c	Edge on Windows	t	2026-03-16 23:57:46.286413+00	2026-03-16 23:57:46.902305+00	efbfefe42f0291fc34aaf3559f8ff3b5e36dd746ea87ca3867280af5e42a8168
6b55ceae-3bd4-477a-bb83-3922ff007abe	9d84eef9-5c54-4a94-b69d-51e82faaee73	33f97044-55d0-4421-b1dc-1856fa9d4221	Chrome on Linux	f	2026-02-26 05:58:05.531406+00	2026-03-16 14:46:16.785405+00	e7ff3e64484f28aa6be3c20b606a093c35b721cfee7abefc0813a865b01860b9
1c7a8287-dbb2-4c44-9ad8-1d6039e8ca49	de1dc022-ea84-4098-9ac7-5952270495cb	0250bd06-b5da-4946-965c-15152fce146e	Chrome on Linux	t	2026-03-13 09:42:56.519193+00	2026-03-13 09:53:20.299588+00	6e29ad14efc69da51e6a567d059584840784c2a38e4827d9c3b4db4e47b61ec5
53f62e97-a9fb-48dc-8c98-4941ff4d9717	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	e3be52b7-2ac5-4c2f-ad29-492d643bf42e	Chrome on Linux	t	2026-03-17 05:55:10.438643+00	2026-03-17 05:55:10.939731+00	cc3d3d894bef987de01e33602e4a4b0ef22c4dcf60d543e11c9ba6719140aded
93ea829e-d362-499a-a341-aa5cb5f83136	9d84eef9-5c54-4a94-b69d-51e82faaee73	eb18fdd5-a02a-4630-a3ab-375a642954ee	Chrome on Linux	t	2026-03-12 13:12:39.223227+00	2026-03-13 10:15:05.3797+00	8ae8c10b016f7896cc47399f0dc53c33a85942d26696e1cc8fe2ca1e545bd297
5ae5fb91-6c40-4ff7-b954-8db421a29b6c	b3ec626f-8311-40ae-882f-4d67bfe75163	d1ddb696-9eb8-43c4-9e04-2d39a950b70d	Chrome on Linux	t	2026-03-12 06:12:53.080286+00	2026-03-12 12:41:30.258235+00	e7ff3e64484f28aa6be3c20b606a093c35b721cfee7abefc0813a865b01860b9
9aa57ebf-80f0-4b0b-a401-4a19adf555d3	de1dc022-ea84-4098-9ac7-5952270495cb	c1ccac5c-96b9-4605-8ad1-df87a6618672	Chrome on Linux	t	2026-03-10 05:18:22.822878+00	2026-03-13 10:31:53.881688+00	9121a905fb8c339e741d9689b9463470c97dab90e3b9c3c3d6f657d6b98f1ed1
3ce17828-903d-4efb-8d03-def1df66c6a1	9d84eef9-5c54-4a94-b69d-51e82faaee73	477033f5-9f49-442a-9cc1-1e91985aa8f1	Chrome on Linux	f	2026-03-16 14:21:25.553878+00	2026-03-16 14:53:01.446516+00	ada38c76b69a9992a5c13a6bab883f33daa5bb2c59364f1b5a846759a9b949bd
c608a971-445a-4ecf-b068-1e3b13617a56	9d84eef9-5c54-4a94-b69d-51e82faaee73	909977b0-7def-42c0-8a0a-3ed91c69e4ca	Safari on MacOS	t	2026-03-16 13:06:48.035949+00	2026-03-17 10:00:33.816753+00	0ebc33cb8e0f35fd4157f5eb801cbc68360596f2c40283a884613e88d5b49623
\.


--
-- Data for Name: user_usage_monthly; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_usage_monthly (id, user_id, year, month, tokens_in, tokens_out, requests, updated_at) FROM stdin;
dbd52c94-3d95-4a15-aab7-445c13615571	de1dc022-ea84-4098-9ac7-5952270495cb	2026	3	3918	171	3	2026-03-13 09:56:59.550476+00
3a9ebb80-466d-49d4-b559-1afe8164372e	31cc7cef-c734-4a0d-8368-10440ee52424	2026	3	7101	783	3	2026-03-16 23:52:34.388279+00
4c62dbc7-345d-47e4-9ec6-c90a105cf8a6	0dc711bb-e6c7-47e3-9245-be65bb8d1e11	2026	3	30	27	1	2026-03-17 05:58:15.027721+00
8671b3bc-62a7-4eac-bb53-66e55ca674e9	9d84eef9-5c54-4a94-b69d-51e82faaee73	2026	3	4689	432	6	2026-03-17 10:31:07.259303+00
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2026-01-02 18:29:27
20211116045059	2026-01-02 18:29:29
20211116050929	2026-01-02 18:29:31
20211116051442	2026-01-02 18:29:33
20211116212300	2026-01-02 18:29:34
20211116213355	2026-01-02 18:29:36
20211116213934	2026-01-02 18:29:38
20211116214523	2026-01-02 18:29:40
20211122062447	2026-01-02 18:29:42
20211124070109	2026-01-02 18:29:43
20211202204204	2026-01-02 18:29:45
20211202204605	2026-01-02 18:29:47
20211210212804	2026-01-02 18:29:52
20211228014915	2026-01-02 18:29:54
20220107221237	2026-01-02 18:29:55
20220228202821	2026-01-02 18:29:57
20220312004840	2026-01-02 18:29:58
20220603231003	2026-01-02 18:30:01
20220603232444	2026-01-02 18:30:03
20220615214548	2026-01-02 18:30:05
20220712093339	2026-01-02 18:30:06
20220908172859	2026-01-02 18:30:08
20220916233421	2026-01-02 18:30:10
20230119133233	2026-01-02 18:30:11
20230128025114	2026-01-02 18:30:14
20230128025212	2026-01-02 18:30:15
20230227211149	2026-01-02 18:30:17
20230228184745	2026-01-02 18:30:18
20230308225145	2026-01-02 18:30:20
20230328144023	2026-01-02 18:30:22
20231018144023	2026-01-02 18:30:24
20231204144023	2026-01-02 18:30:26
20231204144024	2026-01-02 18:30:28
20231204144025	2026-01-02 18:30:30
20240108234812	2026-01-02 18:30:31
20240109165339	2026-01-02 18:30:33
20240227174441	2026-01-02 18:30:36
20240311171622	2026-01-02 18:30:38
20240321100241	2026-01-02 18:30:42
20240401105812	2026-01-02 18:30:46
20240418121054	2026-01-02 18:30:49
20240523004032	2026-01-02 18:30:54
20240618124746	2026-01-02 18:30:56
20240801235015	2026-01-02 18:30:58
20240805133720	2026-01-02 18:30:59
20240827160934	2026-01-02 18:31:01
20240919163303	2026-01-02 18:31:03
20240919163305	2026-01-02 18:31:05
20241019105805	2026-01-02 18:31:07
20241030150047	2026-01-02 18:31:13
20241108114728	2026-01-02 18:31:15
20241121104152	2026-01-02 18:31:17
20241130184212	2026-01-02 18:31:19
20241220035512	2026-01-02 18:31:20
20241220123912	2026-01-02 18:31:22
20241224161212	2026-01-02 18:31:24
20250107150512	2026-01-02 18:31:25
20250110162412	2026-01-02 18:31:27
20250123174212	2026-01-02 18:31:28
20250128220012	2026-01-02 18:31:30
20250506224012	2026-01-02 18:31:31
20250523164012	2026-01-02 18:31:33
20250714121412	2026-01-02 18:31:35
20250905041441	2026-01-02 18:31:36
20251103001201	2026-01-02 18:31:38
20251120212548	2026-02-27 13:32:09
20251120215549	2026-02-27 13:32:09
20260218120000	2026-02-27 13:32:09
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at, action_filter) FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id, type) FROM stdin;
loopplus	loopplus	\N	2026-02-16 13:32:02.718733+00	2026-02-16 13:32:02.718733+00	t	f	\N	\N	\N	STANDARD
\.


--
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets_analytics (name, type, format, created_at, updated_at, id, deleted_at) FROM stdin;
\.


--
-- Data for Name: buckets_vectors; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets_vectors (id, type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2026-01-02 18:29:25.051021
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2026-01-02 18:29:25.066109
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2026-01-02 18:29:25.102377
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2026-01-02 18:29:25.183593
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2026-01-02 18:29:25.188946
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2026-01-02 18:29:25.200411
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2026-01-02 18:29:25.205724
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2026-01-02 18:29:25.222466
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2026-01-02 18:29:25.228699
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2026-01-02 18:29:25.234592
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2026-01-02 18:29:25.240333
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2026-01-02 18:29:25.265125
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2026-01-02 18:29:25.277711
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2026-01-02 18:29:25.286451
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2026-01-02 18:29:25.291811
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2026-01-02 18:29:25.300263
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2026-01-02 18:29:25.305676
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2026-01-02 18:29:25.314969
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2026-01-02 18:29:25.337821
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2026-01-02 18:29:25.355189
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2026-01-02 18:29:25.361402
25	custom-metadata	d974c6057c3db1c1f847afa0e291e6165693b990	2026-01-02 18:29:25.367575
37	add-bucket-name-length-trigger	3944135b4e3e8b22d6d4cbb568fe3b0b51df15c1	2026-01-02 18:29:25.559991
44	vector-bucket-type	99c20c0ffd52bb1ff1f32fb992f3b351e3ef8fb3	2026-01-02 18:29:25.630376
45	vector-buckets	049e27196d77a7cb76497a85afae669d8b230953	2026-01-02 18:29:25.636101
46	buckets-objects-grants	fedeb96d60fefd8e02ab3ded9fbde05632f84aed	2026-01-02 18:29:25.64884
47	iceberg-table-metadata	649df56855c24d8b36dd4cc1aeb8251aa9ad42c2	2026-01-02 18:29:25.654374
49	buckets-objects-grants-postgres	072b1195d0d5a2f888af6b2302a1938dd94b8b3d	2026-01-02 18:29:25.676451
2	storage-schema	f6a1fa2c93cbcd16d4e487b362e45fca157a8dbd	2026-01-02 18:29:25.07371
6	change-column-name-in-get-size	ded78e2f1b5d7e616117897e6443a925965b30d2	2026-01-02 18:29:25.194851
9	fix-search-function	af597a1b590c70519b464a4ab3be54490712796b	2026-01-02 18:29:25.210993
10	search-files-search-function	b595f05e92f7e91211af1bbfe9c6a13bb3391e16	2026-01-02 18:29:25.216678
26	objects-prefixes	215cabcb7f78121892a5a2037a09fedf9a1ae322	2026-01-02 18:29:25.373351
27	search-v2	859ba38092ac96eb3964d83bf53ccc0b141663a6	2026-01-02 18:29:25.387837
28	object-bucket-name-sorting	c73a2b5b5d4041e39705814fd3a1b95502d38ce4	2026-01-02 18:29:25.487501
29	create-prefixes	ad2c1207f76703d11a9f9007f821620017a66c21	2026-01-02 18:29:25.493956
30	update-object-levels	2be814ff05c8252fdfdc7cfb4b7f5c7e17f0bed6	2026-01-02 18:29:25.502981
31	objects-level-index	b40367c14c3440ec75f19bbce2d71e914ddd3da0	2026-01-02 18:29:25.510628
32	backward-compatible-index-on-objects	e0c37182b0f7aee3efd823298fb3c76f1042c0f7	2026-01-02 18:29:25.518516
33	backward-compatible-index-on-prefixes	b480e99ed951e0900f033ec4eb34b5bdcb4e3d49	2026-01-02 18:29:25.528292
34	optimize-search-function-v1	ca80a3dc7bfef894df17108785ce29a7fc8ee456	2026-01-02 18:29:25.536784
35	add-insert-trigger-prefixes	458fe0ffd07ec53f5e3ce9df51bfdf4861929ccc	2026-01-02 18:29:25.543148
36	optimise-existing-functions	6ae5fca6af5c55abe95369cd4f93985d1814ca8f	2026-01-02 18:29:25.550698
38	iceberg-catalog-flag-on-buckets	02716b81ceec9705aed84aa1501657095b32e5c5	2026-01-02 18:29:25.565457
39	add-search-v2-sort-support	6706c5f2928846abee18461279799ad12b279b78	2026-01-02 18:29:25.576965
40	fix-prefix-race-conditions-optimized	7ad69982ae2d372b21f48fc4829ae9752c518f6b	2026-01-02 18:29:25.58274
41	add-object-level-update-trigger	07fcf1a22165849b7a029deed059ffcde08d1ae0	2026-01-02 18:29:25.598503
42	rollback-prefix-triggers	771479077764adc09e2ea2043eb627503c034cd4	2026-01-02 18:29:25.610554
43	fix-object-level	84b35d6caca9d937478ad8a797491f38b8c2979f	2026-01-02 18:29:25.624971
48	iceberg-catalog-ids	e0e8b460c609b9999ccd0df9ad14294613eed939	2026-01-02 18:29:25.659263
50	search-v2-optimised	6323ac4f850aa14e7387eb32102869578b5bd478	2026-02-12 11:12:41.318824
51	index-backward-compatible-search	2ee395d433f76e38bcd3856debaf6e0e5b674011	2026-02-12 11:12:41.420712
52	drop-not-used-indexes-and-functions	5cc44c8696749ac11dd0dc37f2a3802075f3a171	2026-02-12 11:12:41.421844
53	drop-index-lower-name	d0cb18777d9e2a98ebe0bc5cc7a42e57ebe41854	2026-02-12 11:12:41.529779
54	drop-index-object-level	6289e048b1472da17c31a7eba1ded625a6457e67	2026-02-12 11:12:41.531615
55	prevent-direct-deletes	262a4798d5e0f2e7c8970232e03ce8be695d5819	2026-02-12 11:12:41.533115
56	fix-optimized-search-function	cb58526ebc23048049fd5bf2fd148d18b04a2073	2026-02-12 11:12:41.540135
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata) FROM stdin;
3cefd945-fba6-41f7-8d52-cc0d664918b0	loopplus	profiles/6b117feb-7fe3-4bb5-bf5f-26cb9e1ed9ad/1771249312.jpeg	\N	2026-02-16 13:41:53.257927+00	2026-02-16 13:41:53.257927+00	2026-02-16 13:41:53.257927+00	{"eTag": "\\"b8d7dbae9b3238119e6d0ea2de5e011d\\"", "size": 6224, "mimetype": "image/jpeg", "cacheControl": "no-cache", "lastModified": "2026-02-16T13:41:54.000Z", "contentLength": 6224, "httpStatusCode": 200}	76617517-df9a-4d62-a380-3a355c3a0056	\N	{}
1ade3118-10b5-481b-99db-84445c61bb0e	loopplus	1771250415_Machine_Learning_Basics.pdf	\N	2026-02-16 14:00:16.205261+00	2026-02-16 14:00:16.205261+00	2026-02-16 14:00:16.205261+00	{"eTag": "\\"2b9dde84f8d69be404b61afeef99c081\\"", "size": 5235, "mimetype": "text/plain", "cacheControl": "no-cache", "lastModified": "2026-02-16T14:00:17.000Z", "contentLength": 5235, "httpStatusCode": 200}	fdfa5319-d176-4556-88dd-8f01e26f0f95	\N	{}
d3a125b8-3905-43ce-9a87-f16dd5cc04cd	loopplus	1771250744_Machine_Learning_Basics.pdf	\N	2026-02-16 14:05:44.938666+00	2026-02-16 14:05:44.938666+00	2026-02-16 14:05:44.938666+00	{"eTag": "\\"2b9dde84f8d69be404b61afeef99c081\\"", "size": 5235, "mimetype": "text/plain", "cacheControl": "no-cache", "lastModified": "2026-02-16T14:05:45.000Z", "contentLength": 5235, "httpStatusCode": 200}	7e6bbc8b-c7fd-4d5c-8a20-54b85140b30c	\N	{}
0539ea61-d166-4ac2-bd20-2aa78b9474a8	loopplus	1771251586_What-is-Energy.jpg	\N	2026-02-16 14:19:48.081125+00	2026-02-16 14:19:48.081125+00	2026-02-16 14:19:48.081125+00	{"eTag": "\\"cb90496e803d24e57510ad054ae3958a\\"", "size": 414129, "mimetype": "text/plain", "cacheControl": "no-cache", "lastModified": "2026-02-16T14:19:48.000Z", "contentLength": 414129, "httpStatusCode": 200}	44490cc4-1e79-43c6-9350-25c0613cd112	\N	{}
de5dae5e-52f7-4de8-8e64-86f0512238a1	loopplus	profiles/b30954ac-83cf-427a-9b75-c3d3d948dd95/1771255345.jpeg	\N	2026-02-16 15:22:26.934035+00	2026-02-16 15:22:26.934035+00	2026-02-16 15:22:26.934035+00	{"eTag": "\\"c528da7681da49f9d26ed339b73eb38d\\"", "size": 6775, "mimetype": "image/jpeg", "cacheControl": "no-cache", "lastModified": "2026-02-16T15:22:27.000Z", "contentLength": 6775, "httpStatusCode": 200}	549aaf3d-a318-4a1b-adf9-2df5c2736070	\N	{}
70a9de60-1233-4cc9-830f-8099102c3088	loopplus	profiles/144e356e-a1ca-4436-b467-03e43d444498/1771307487.jpeg	\N	2026-02-17 05:51:28.704599+00	2026-02-17 05:51:28.704599+00	2026-02-17 05:51:28.704599+00	{"eTag": "\\"c21981da10d11a1d02767357255a1198\\"", "size": 10521, "mimetype": "image/jpeg", "cacheControl": "no-cache", "lastModified": "2026-02-17T05:51:29.000Z", "contentLength": 10521, "httpStatusCode": 200}	ad3acc6d-b38c-46c6-b0d3-eee5c31af198	\N	{}
b40b5876-6ff5-4c49-a07c-94201efd02b5	loopplus	profiles/00c641c5-cd90-4b9c-8635-aec273a33cde/1771316625.jpeg	\N	2026-02-17 08:23:46.253264+00	2026-02-17 08:23:46.253264+00	2026-02-17 08:23:46.253264+00	{"eTag": "\\"c528da7681da49f9d26ed339b73eb38d\\"", "size": 6775, "mimetype": "image/jpeg", "cacheControl": "no-cache", "lastModified": "2026-02-17T08:23:47.000Z", "contentLength": 6775, "httpStatusCode": 200}	f7c20ea1-08d5-4ef0-b7e3-dc473f482561	\N	{}
79bc9f82-2a3a-43f9-8e15-c5da273ffdcb	loopplus	profiles/a933cad2-4a8c-4ad8-8cbd-06b60e183725/1771411545.jpeg	\N	2026-02-18 10:45:46.671141+00	2026-02-18 10:45:46.671141+00	2026-02-18 10:45:46.671141+00	{"eTag": "\\"c21981da10d11a1d02767357255a1198\\"", "size": 10521, "mimetype": "image/jpeg", "cacheControl": "no-cache", "lastModified": "2026-02-18T10:45:47.000Z", "contentLength": 10521, "httpStatusCode": 200}	743a2053-de1f-41f1-ae0c-09619ebd53c9	\N	{}
36b1ad0b-67eb-4dc9-8b79-dfb67698bc5f	loopplus	profiles/e5e6c16c-e9d1-4661-8555-b5837cd50dcd/1771913790.jpeg	\N	2026-02-24 06:16:30.909735+00	2026-02-24 06:16:30.909735+00	2026-02-24 06:16:30.909735+00	{"eTag": "\\"ab1a659c6eb39a4bf6a61d2ef12dc136\\"", "size": 11398, "mimetype": "image/jpeg", "cacheControl": "no-cache", "lastModified": "2026-02-24T06:16:31.000Z", "contentLength": 11398, "httpStatusCode": 200}	13467645-694d-464b-9a86-e986e57be0eb	\N	{}
7eb41496-5143-4046-ac3a-c0c2e0989b31	loopplus	profiles/bbaa302b-6ba4-4363-9523-2ac9e6f241a1/1771914455.jpeg	\N	2026-02-24 06:27:35.375124+00	2026-02-24 06:27:35.375124+00	2026-02-24 06:27:35.375124+00	{"eTag": "\\"c528da7681da49f9d26ed339b73eb38d\\"", "size": 6775, "mimetype": "image/jpeg", "cacheControl": "no-cache", "lastModified": "2026-02-24T06:27:36.000Z", "contentLength": 6775, "httpStatusCode": 200}	b52c125d-d8d0-4339-a5c0-236656918acd	\N	{}
b0a1a90e-95f4-4f96-9830-9eed771dc934	loopplus	profiles/8435350a-5cdc-4f10-bb76-2e7b381433cd/1771915420.jpeg	\N	2026-02-24 06:43:40.546119+00	2026-02-24 06:43:40.546119+00	2026-02-24 06:43:40.546119+00	{"eTag": "\\"ab1a659c6eb39a4bf6a61d2ef12dc136\\"", "size": 11398, "mimetype": "image/jpeg", "cacheControl": "no-cache", "lastModified": "2026-02-24T06:43:41.000Z", "contentLength": 11398, "httpStatusCode": 200}	dd230826-2a69-4e02-8b28-23cbc80e5dd3	\N	{}
2a04b607-a97b-48ce-8f33-f0ee17b53ae5	loopplus	profiles/6c0dc090-f231-44a7-a9bb-8e0b56474698/1771926773.jpeg	\N	2026-02-24 09:52:53.501231+00	2026-02-24 09:52:53.501231+00	2026-02-24 09:52:53.501231+00	{"eTag": "\\"ab1a659c6eb39a4bf6a61d2ef12dc136\\"", "size": 11398, "mimetype": "image/jpeg", "cacheControl": "no-cache", "lastModified": "2026-02-24T09:52:54.000Z", "contentLength": 11398, "httpStatusCode": 200}	e09c917d-f4fe-49ed-a675-9b219bbf25a8	\N	{}
e254c770-9367-4067-ab34-ff1b6dc9634b	loopplus	profiles/35a00a62-d479-4b8d-964f-d7184ac90968/1771926872.jpeg	\N	2026-02-24 09:54:32.338973+00	2026-02-24 09:54:32.338973+00	2026-02-24 09:54:32.338973+00	{"eTag": "\\"ab1a659c6eb39a4bf6a61d2ef12dc136\\"", "size": 11398, "mimetype": "image/jpeg", "cacheControl": "no-cache", "lastModified": "2026-02-24T09:54:33.000Z", "contentLength": 11398, "httpStatusCode": 200}	4d690203-ac3f-460d-ba2b-91863ad9a20d	\N	{}
c40be4a4-6246-4214-af58-810999c1f80f	loopplus	profiles/ff6f9fd9-b798-47d1-8297-19fe278b4a7a/1771926923.jpeg	\N	2026-02-24 09:55:24.413101+00	2026-02-24 09:55:24.413101+00	2026-02-24 09:55:24.413101+00	{"eTag": "\\"ab1a659c6eb39a4bf6a61d2ef12dc136\\"", "size": 11398, "mimetype": "image/jpeg", "cacheControl": "no-cache", "lastModified": "2026-02-24T09:55:25.000Z", "contentLength": 11398, "httpStatusCode": 200}	dfe7bca9-dc89-43ae-8153-3a20e31e098a	\N	{}
c3b106ca-ccf2-45c5-b941-8c7c6ed9e654	loopplus	profiles/81c96fe9-1032-4050-b906-e46dfcd8955a/1771927094.jpeg	\N	2026-02-24 09:58:14.721138+00	2026-02-24 09:58:14.721138+00	2026-02-24 09:58:14.721138+00	{"eTag": "\\"ab1a659c6eb39a4bf6a61d2ef12dc136\\"", "size": 11398, "mimetype": "image/jpeg", "cacheControl": "no-cache", "lastModified": "2026-02-24T09:58:15.000Z", "contentLength": 11398, "httpStatusCode": 200}	42426cce-68b1-4ea8-bdbd-f261fc329de7	\N	{}
57681d04-2276-447d-9cbf-3c35816d418c	loopplus	profiles/1394a6ba-4e0c-4b5f-a5f7-8e65a742cbb6/1771927919.jpeg	\N	2026-02-24 10:11:59.811752+00	2026-02-24 10:11:59.811752+00	2026-02-24 10:11:59.811752+00	{"eTag": "\\"c21981da10d11a1d02767357255a1198\\"", "size": 10521, "mimetype": "image/jpeg", "cacheControl": "no-cache", "lastModified": "2026-02-24T10:12:00.000Z", "contentLength": 10521, "httpStatusCode": 200}	183effdd-cbca-4740-9558-9de893c18764	\N	{}
1cd71c68-56c2-461d-9267-5925403898a0	loopplus	profiles/e35e12df-aaed-4d7e-9998-b798d018a9b1/1771928029.jpeg	\N	2026-02-24 10:13:49.321458+00	2026-02-24 10:13:49.321458+00	2026-02-24 10:13:49.321458+00	{"eTag": "\\"c21981da10d11a1d02767357255a1198\\"", "size": 10521, "mimetype": "image/jpeg", "cacheControl": "no-cache", "lastModified": "2026-02-24T10:13:50.000Z", "contentLength": 10521, "httpStatusCode": 200}	faefb01f-3f03-4ce9-9ed7-ab78c86115a5	\N	{}
cd79c7ca-460d-4780-ac3a-49e5bfb24255	loopplus	profiles/43d6e160-1df0-44e6-b6d6-2a4c98240cae/1771928769.jpeg	\N	2026-02-24 10:26:09.552412+00	2026-02-24 10:26:09.552412+00	2026-02-24 10:26:09.552412+00	{"eTag": "\\"c528da7681da49f9d26ed339b73eb38d\\"", "size": 6775, "mimetype": "image/jpeg", "cacheControl": "no-cache", "lastModified": "2026-02-24T10:26:10.000Z", "contentLength": 6775, "httpStatusCode": 200}	f16c5c8f-be70-4f99-a34d-50f8d3a7e54f	\N	{}
fe988aeb-0e5f-4e5d-a8f8-4c3702e10dff	loopplus	profiles/71072445-7663-4d87-85fc-dd155a10f259/1771929182.jpeg	\N	2026-02-24 10:33:02.980204+00	2026-02-24 10:33:02.980204+00	2026-02-24 10:33:02.980204+00	{"eTag": "\\"ab1a659c6eb39a4bf6a61d2ef12dc136\\"", "size": 11398, "mimetype": "image/jpeg", "cacheControl": "no-cache", "lastModified": "2026-02-24T10:33:03.000Z", "contentLength": 11398, "httpStatusCode": 200}	79d7915f-d8d2-4ee1-925f-eab6f02dd541	\N	{}
f442eb10-93a2-46b9-a2d4-4fbded7c57d4	loopplus	profiles/52303072-f840-4d0d-ae7d-d569fdb46cae/1772003423.jpeg	\N	2026-02-25 07:10:23.500656+00	2026-02-25 07:10:23.500656+00	2026-02-25 07:10:23.500656+00	{"eTag": "\\"c528da7681da49f9d26ed339b73eb38d\\"", "size": 6775, "mimetype": "image/jpeg", "cacheControl": "no-cache", "lastModified": "2026-02-25T07:10:24.000Z", "contentLength": 6775, "httpStatusCode": 200}	9bd52684-77da-41fe-835d-49f0b6e9f8fe	\N	{}
56757ea2-6f4b-406f-9574-d9eb05a90f2b	loopplus	profiles/de1dc022-ea84-4098-9ac7-5952270495cb/1773119900.jpeg	\N	2026-03-10 05:18:21.526828+00	2026-03-10 05:18:21.526828+00	2026-03-10 05:18:21.526828+00	{"eTag": "\\"b8d7dbae9b3238119e6d0ea2de5e011d\\"", "size": 6224, "mimetype": "image/jpeg", "cacheControl": "no-cache", "lastModified": "2026-03-10T05:18:22.000Z", "contentLength": 6224, "httpStatusCode": 200}	fa9ba0f7-458a-4e0f-836b-da38afa44ed5	\N	{}
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- Data for Name: vector_indexes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.vector_indexes (id, name, bucket_id, data_type, dimension, distance_metric, metadata_configuration, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 2134, true);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_admin
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: custom_oauth_providers custom_oauth_providers_identifier_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.custom_oauth_providers
    ADD CONSTRAINT custom_oauth_providers_identifier_key UNIQUE (identifier);


--
-- Name: custom_oauth_providers custom_oauth_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.custom_oauth_providers
    ADD CONSTRAINT custom_oauth_providers_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_code_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_code_key UNIQUE (authorization_code);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_id_key UNIQUE (authorization_id);


--
-- Name: oauth_authorizations oauth_authorizations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_pkey PRIMARY KEY (id);


--
-- Name: oauth_client_states oauth_client_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_client_states
    ADD CONSTRAINT oauth_client_states_pkey PRIMARY KEY (id);


--
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_user_client_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_client_unique UNIQUE (user_id, client_id);


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: ad_stats ad_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ad_stats
    ADD CONSTRAINT ad_stats_pkey PRIMARY KEY (id);


--
-- Name: ad_stats ad_stats_user_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ad_stats
    ADD CONSTRAINT ad_stats_user_id_unique UNIQUE (user_id);


--
-- Name: answer_ratings answer_ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answer_ratings
    ADD CONSTRAINT answer_ratings_pkey PRIMARY KEY (id);


--
-- Name: best_of_materials best_of_materials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.best_of_materials
    ADD CONSTRAINT best_of_materials_pkey PRIMARY KEY (id);


--
-- Name: best_of_materials best_of_materials_subject_topic_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.best_of_materials
    ADD CONSTRAINT best_of_materials_subject_topic_unique UNIQUE (subject, topic);


--
-- Name: chats chats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chats
    ADD CONSTRAINT chats_pkey PRIMARY KEY (id);


--
-- Name: community_posts community_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.community_posts
    ADD CONSTRAINT community_posts_pkey PRIMARY KEY (id);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: document_chunks document_chunks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.document_chunks
    ADD CONSTRAINT document_chunks_pkey PRIMARY KEY (id);


--
-- Name: documents documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);


--
-- Name: friend_details friend_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friend_details
    ADD CONSTRAINT friend_details_pkey PRIMARY KEY (id);


--
-- Name: friend_details friend_details_unique_friend; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friend_details
    ADD CONSTRAINT friend_details_unique_friend UNIQUE (user_id, friend_number);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (user_id);


--
-- Name: referral_stats referral_stats_business_referral_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.referral_stats
    ADD CONSTRAINT referral_stats_business_referral_code_key UNIQUE (business_referral_code);


--
-- Name: referral_stats referral_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.referral_stats
    ADD CONSTRAINT referral_stats_pkey PRIMARY KEY (id);


--
-- Name: referral_stats referral_stats_referral_code_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.referral_stats
    ADD CONSTRAINT referral_stats_referral_code_unique UNIQUE (referral_code);


--
-- Name: referral_stats referral_stats_user_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.referral_stats
    ADD CONSTRAINT referral_stats_user_id_unique UNIQUE (user_id);


--
-- Name: subscription_free_month_history subscription_free_month_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscription_free_month_history
    ADD CONSTRAINT subscription_free_month_history_pkey PRIMARY KEY (id);


--
-- Name: subscriptions subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- Name: subscriptions subscriptions_user_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_user_id_unique UNIQUE (user_id);


--
-- Name: universities universities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.universities
    ADD CONSTRAINT universities_pkey PRIMARY KEY (id);


--
-- Name: universities universities_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.universities
    ADD CONSTRAINT universities_slug_unique UNIQUE (slug);


--
-- Name: university_links university_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_links
    ADD CONSTRAINT university_links_pkey PRIMARY KEY (id);


--
-- Name: user_devices user_devices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_devices
    ADD CONSTRAINT user_devices_pkey PRIMARY KEY (id);


--
-- Name: user_devices user_devices_user_device_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_devices
    ADD CONSTRAINT user_devices_user_device_unique UNIQUE (user_id, device_id);


--
-- Name: user_usage_monthly user_usage_monthly_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_usage_monthly
    ADD CONSTRAINT user_usage_monthly_pkey PRIMARY KEY (id);


--
-- Name: user_usage_monthly user_usage_monthly_user_year_month_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_usage_monthly
    ADD CONSTRAINT user_usage_monthly_user_year_month_unique UNIQUE (user_id, year, month);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets_analytics buckets_analytics_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets_analytics
    ADD CONSTRAINT buckets_analytics_pkey PRIMARY KEY (id);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: buckets_vectors buckets_vectors_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets_vectors
    ADD CONSTRAINT buckets_vectors_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: vector_indexes vector_indexes_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_pkey PRIMARY KEY (id);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: custom_oauth_providers_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX custom_oauth_providers_created_at_idx ON auth.custom_oauth_providers USING btree (created_at);


--
-- Name: custom_oauth_providers_enabled_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX custom_oauth_providers_enabled_idx ON auth.custom_oauth_providers USING btree (enabled);


--
-- Name: custom_oauth_providers_identifier_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX custom_oauth_providers_identifier_idx ON auth.custom_oauth_providers USING btree (identifier);


--
-- Name: custom_oauth_providers_provider_type_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX custom_oauth_providers_provider_type_idx ON auth.custom_oauth_providers USING btree (provider_type);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_oauth_client_states_created_at; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_oauth_client_states_created_at ON auth.oauth_client_states USING btree (created_at);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: oauth_auth_pending_exp_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_auth_pending_exp_idx ON auth.oauth_authorizations USING btree (expires_at) WHERE (status = 'pending'::auth.oauth_authorization_status);


--
-- Name: oauth_clients_deleted_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_clients_deleted_at_idx ON auth.oauth_clients USING btree (deleted_at);


--
-- Name: oauth_consents_active_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_client_idx ON auth.oauth_consents USING btree (client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_active_user_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_user_client_idx ON auth.oauth_consents USING btree (user_id, client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_user_order_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_user_order_idx ON auth.oauth_consents USING btree (user_id, granted_at DESC);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_oauth_client_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_oauth_client_id_idx ON auth.sessions USING btree (oauth_client_id);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: sso_providers_resource_id_pattern_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_providers_resource_id_pattern_idx ON auth.sso_providers USING btree (resource_id text_pattern_ops);


--
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: answer_ratings_content_hash_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX answer_ratings_content_hash_idx ON public.answer_ratings USING btree (content_hash);


--
-- Name: answer_ratings_processed_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX answer_ratings_processed_idx ON public.answer_ratings USING btree (processed) WHERE (processed = false);


--
-- Name: best_of_materials_embedding_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX best_of_materials_embedding_idx ON public.best_of_materials USING hnsw (embedding public.vector_cosine_ops);


--
-- Name: idx_ad_stats_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ad_stats_user_id ON public.ad_stats USING btree (user_id);


--
-- Name: idx_answer_ratings_chat_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_answer_ratings_chat_id ON public.answer_ratings USING btree (chat_id);


--
-- Name: idx_answer_ratings_message_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_answer_ratings_message_id ON public.answer_ratings USING btree (message_id);


--
-- Name: idx_answer_ratings_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_answer_ratings_user_id ON public.answer_ratings USING btree (user_id);


--
-- Name: idx_chats_university_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_chats_university_id ON public.chats USING btree (university_id);


--
-- Name: idx_chats_updated_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_chats_updated_at ON public.chats USING btree (updated_at DESC);


--
-- Name: idx_chats_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_chats_user_id ON public.chats USING btree (user_id);


--
-- Name: idx_community_posts_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_community_posts_created_at ON public.community_posts USING btree (created_at DESC);


--
-- Name: idx_community_posts_forum; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_community_posts_forum ON public.community_posts USING btree (forum);


--
-- Name: idx_community_posts_university_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_community_posts_university_id ON public.community_posts USING btree (university_id);


--
-- Name: idx_community_posts_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_community_posts_user_id ON public.community_posts USING btree (user_id);


--
-- Name: idx_courses_university_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_courses_university_id ON public.courses USING btree (university_id);


--
-- Name: idx_courses_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_courses_user_id ON public.courses USING btree (user_id);


--
-- Name: idx_document_chunks_chunk_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_document_chunks_chunk_index ON public.document_chunks USING btree (document_id, chunk_index);


--
-- Name: idx_document_chunks_document_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_document_chunks_document_id ON public.document_chunks USING btree (document_id);


--
-- Name: idx_document_chunks_university_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_document_chunks_university_id ON public.document_chunks USING btree (university_id);


--
-- Name: idx_documents_university_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_documents_university_id ON public.documents USING btree (university_id);


--
-- Name: idx_documents_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_documents_user_id ON public.documents USING btree (user_id);


--
-- Name: idx_documents_visibility; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_documents_visibility ON public.documents USING btree (visibility);


--
-- Name: idx_free_month_history_source; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_free_month_history_source ON public.subscription_free_month_history USING btree (source);


--
-- Name: idx_free_month_history_stripe_sub; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_free_month_history_stripe_sub ON public.subscription_free_month_history USING btree (stripe_subscription_id);


--
-- Name: idx_free_month_history_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_free_month_history_user ON public.subscription_free_month_history USING btree (user_id);


--
-- Name: idx_friend_details_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_friend_details_user_id ON public.friend_details USING btree (user_id);


--
-- Name: idx_messages_chat_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_messages_chat_id ON public.messages USING btree (chat_id);


--
-- Name: idx_messages_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_messages_created_at ON public.messages USING btree (chat_id, created_at);


--
-- Name: idx_messages_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_messages_user_id ON public.messages USING btree (user_id);


--
-- Name: idx_profiles_university_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_profiles_university_id ON public.profiles USING btree (university_id);


--
-- Name: idx_referral_stats_referral_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_referral_stats_referral_code ON public.referral_stats USING btree (referral_code);


--
-- Name: idx_referral_stats_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_referral_stats_user_id ON public.referral_stats USING btree (user_id);


--
-- Name: idx_subscriptions_stripe_subscription_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_subscriptions_stripe_subscription_id ON public.subscriptions USING btree (stripe_subscription_id);


--
-- Name: idx_subscriptions_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_subscriptions_user_id ON public.subscriptions USING btree (user_id);


--
-- Name: idx_universities_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_universities_slug ON public.universities USING btree (slug);


--
-- Name: idx_university_links_university_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_university_links_university_id ON public.university_links USING btree (university_id);


--
-- Name: idx_user_devices_active; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_devices_active ON public.user_devices USING btree (user_id) WHERE (is_active = true);


--
-- Name: idx_user_devices_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_devices_user_id ON public.user_devices USING btree (user_id);


--
-- Name: idx_user_usage_monthly_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_usage_monthly_user_id ON public.user_usage_monthly USING btree (user_id);


--
-- Name: idx_user_usage_monthly_year_month; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_usage_monthly_year_month ON public.user_usage_monthly USING btree (user_id, year, month);


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING btree (entity);


--
-- Name: messages_inserted_at_topic_index; Type: INDEX; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE INDEX messages_inserted_at_topic_index ON ONLY realtime.messages USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: subscription_subscription_id_entity_filters_action_filter_key; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_action_filter_key ON realtime.subscription USING btree (subscription_id, entity, filters, action_filter);


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: buckets_analytics_unique_name_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX buckets_analytics_unique_name_idx ON storage.buckets_analytics USING btree (name) WHERE (deleted_at IS NULL);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: idx_objects_bucket_id_name_lower; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name_lower ON storage.objects USING btree (bucket_id, lower(name) COLLATE "C");


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: vector_indexes_name_bucket_id_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX vector_indexes_name_bucket_id_idx ON storage.vector_indexes USING btree (name, bucket_id);


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: buckets enforce_bucket_name_length_trigger; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER enforce_bucket_name_length_trigger BEFORE INSERT OR UPDATE OF name ON storage.buckets FOR EACH ROW EXECUTE FUNCTION storage.enforce_bucket_name_length();


--
-- Name: buckets protect_buckets_delete; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER protect_buckets_delete BEFORE DELETE ON storage.buckets FOR EACH STATEMENT EXECUTE FUNCTION storage.protect_delete();


--
-- Name: objects protect_objects_delete; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER protect_objects_delete BEFORE DELETE ON storage.objects FOR EACH STATEMENT EXECUTE FUNCTION storage.protect_delete();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_oauth_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_oauth_client_id_fkey FOREIGN KEY (oauth_client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: ad_stats ad_stats_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ad_stats
    ADD CONSTRAINT ad_stats_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: answer_ratings answer_ratings_chat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answer_ratings
    ADD CONSTRAINT answer_ratings_chat_id_fkey FOREIGN KEY (chat_id) REFERENCES public.chats(id) ON DELETE CASCADE;


--
-- Name: answer_ratings answer_ratings_message_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answer_ratings
    ADD CONSTRAINT answer_ratings_message_id_fkey FOREIGN KEY (message_id) REFERENCES public.messages(id) ON DELETE CASCADE;


--
-- Name: answer_ratings answer_ratings_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answer_ratings
    ADD CONSTRAINT answer_ratings_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: chats chats_university_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chats
    ADD CONSTRAINT chats_university_id_fkey FOREIGN KEY (university_id) REFERENCES public.universities(id);


--
-- Name: chats chats_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chats
    ADD CONSTRAINT chats_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: community_posts community_posts_university_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.community_posts
    ADD CONSTRAINT community_posts_university_id_fkey FOREIGN KEY (university_id) REFERENCES public.universities(id) ON DELETE CASCADE;


--
-- Name: community_posts community_posts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.community_posts
    ADD CONSTRAINT community_posts_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: courses courses_university_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_university_id_fkey FOREIGN KEY (university_id) REFERENCES public.universities(id);


--
-- Name: courses courses_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: document_chunks document_chunks_document_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.document_chunks
    ADD CONSTRAINT document_chunks_document_id_fkey FOREIGN KEY (document_id) REFERENCES public.documents(id) ON DELETE CASCADE;


--
-- Name: document_chunks document_chunks_university_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.document_chunks
    ADD CONSTRAINT document_chunks_university_id_fkey FOREIGN KEY (university_id) REFERENCES public.universities(id);


--
-- Name: documents documents_university_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_university_id_fkey FOREIGN KEY (university_id) REFERENCES public.universities(id);


--
-- Name: documents documents_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: friend_details friend_details_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friend_details
    ADD CONSTRAINT friend_details_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: messages messages_chat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_chat_id_fkey FOREIGN KEY (chat_id) REFERENCES public.chats(id) ON DELETE CASCADE;


--
-- Name: messages messages_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: profiles profiles_university_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_university_id_fkey FOREIGN KEY (university_id) REFERENCES public.universities(id);


--
-- Name: profiles profiles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: referral_stats referral_stats_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.referral_stats
    ADD CONSTRAINT referral_stats_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: subscription_free_month_history subscription_free_month_history_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscription_free_month_history
    ADD CONSTRAINT subscription_free_month_history_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: subscriptions subscriptions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: university_links university_links_university_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_links
    ADD CONSTRAINT university_links_university_id_fkey FOREIGN KEY (university_id) REFERENCES public.universities(id) ON DELETE CASCADE;


--
-- Name: user_devices user_devices_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_devices
    ADD CONSTRAINT user_devices_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: user_usage_monthly user_usage_monthly_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_usage_monthly
    ADD CONSTRAINT user_usage_monthly_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: vector_indexes vector_indexes_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets_vectors(id);


--
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- Name: best_of_materials Allow read access to best_of_materials; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow read access to best_of_materials" ON public.best_of_materials FOR SELECT USING (true);


--
-- Name: profiles Authenticated users can view all profiles; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Authenticated users can view all profiles" ON public.profiles FOR SELECT TO authenticated USING (true);


--
-- Name: document_chunks Chunks: insert own; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Chunks: insert own" ON public.document_chunks FOR INSERT WITH CHECK ((document_id IN ( SELECT documents.id
   FROM public.documents
  WHERE (documents.user_id = auth.uid()))));


--
-- Name: document_chunks Chunks: read auth; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Chunks: read auth" ON public.document_chunks FOR SELECT USING ((auth.role() = 'authenticated'::text));


--
-- Name: universities Universities are public; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Universities are public" ON public.universities FOR SELECT USING (true);


--
-- Name: university_links University links are public; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "University links are public" ON public.university_links FOR SELECT USING (true);


--
-- Name: community_posts Users can create posts; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can create posts" ON public.community_posts FOR INSERT WITH CHECK ((auth.uid() = user_id));


--
-- Name: chats Users can delete their own chats; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can delete their own chats" ON public.chats FOR DELETE USING ((auth.uid() = user_id));


--
-- Name: documents Users can delete their own documents; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can delete their own documents" ON public.documents FOR DELETE USING ((auth.uid() = user_id));


--
-- Name: messages Users can delete their own messages; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can delete their own messages" ON public.messages FOR DELETE USING ((auth.uid() = user_id));


--
-- Name: community_posts Users can delete their own posts; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can delete their own posts" ON public.community_posts FOR DELETE USING ((auth.uid() = user_id));


--
-- Name: subscription_free_month_history Users can insert own free history; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can insert own free history" ON public.subscription_free_month_history FOR INSERT WITH CHECK ((user_id = auth.uid()));


--
-- Name: answer_ratings Users can insert own ratings; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can insert own ratings" ON public.answer_ratings FOR INSERT WITH CHECK ((auth.uid() = user_id));


--
-- Name: chats Users can insert their own chats; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can insert their own chats" ON public.chats FOR INSERT WITH CHECK ((auth.uid() = user_id));


--
-- Name: documents Users can insert their own documents; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can insert their own documents" ON public.documents FOR INSERT WITH CHECK ((auth.uid() = user_id));


--
-- Name: messages Users can insert their own messages; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can insert their own messages" ON public.messages FOR INSERT WITH CHECK ((auth.uid() = user_id));


--
-- Name: profiles Users can insert their own profile; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can insert their own profile" ON public.profiles FOR INSERT WITH CHECK ((auth.uid() = user_id));


--
-- Name: friend_details Users can manage friend details; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can manage friend details" ON public.friend_details USING ((auth.uid() = user_id));


--
-- Name: courses Users can manage own courses; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can manage own courses" ON public.courses USING ((auth.uid() = user_id));


--
-- Name: user_devices Users can manage own devices; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can manage own devices" ON public.user_devices USING ((auth.uid() = user_id));


--
-- Name: subscription_free_month_history Users can update own free history; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can update own free history" ON public.subscription_free_month_history FOR UPDATE USING ((user_id = auth.uid()));


--
-- Name: subscriptions Users can update own subscription; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can update own subscription" ON public.subscriptions FOR UPDATE USING ((auth.uid() = user_id));


--
-- Name: chats Users can update their own chats; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can update their own chats" ON public.chats FOR UPDATE USING ((auth.uid() = user_id));


--
-- Name: documents Users can update their own documents; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can update their own documents" ON public.documents FOR UPDATE USING ((auth.uid() = user_id));


--
-- Name: community_posts Users can update their own posts; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can update their own posts" ON public.community_posts FOR UPDATE TO authenticated USING ((auth.uid() = user_id)) WITH CHECK ((auth.uid() = user_id));


--
-- Name: profiles Users can update their own profile; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can update their own profile" ON public.profiles FOR UPDATE USING ((auth.uid() = user_id));


--
-- Name: community_posts Users can view all community posts; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can view all community posts" ON public.community_posts FOR SELECT TO authenticated USING (true);


--
-- Name: ad_stats Users can view own ad stats; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can view own ad stats" ON public.ad_stats FOR SELECT USING ((auth.uid() = user_id));


--
-- Name: courses Users can view own courses; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can view own courses" ON public.courses FOR SELECT USING ((auth.uid() = user_id));


--
-- Name: user_devices Users can view own devices; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can view own devices" ON public.user_devices FOR SELECT USING ((auth.uid() = user_id));


--
-- Name: subscription_free_month_history Users can view own free history; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can view own free history" ON public.subscription_free_month_history FOR SELECT USING ((user_id = auth.uid()));


--
-- Name: documents Users can view own or public documents; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can view own or public documents" ON public.documents FOR SELECT USING (((auth.uid() = user_id) OR (visibility = 'public'::text)));


--
-- Name: answer_ratings Users can view own ratings; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can view own ratings" ON public.answer_ratings FOR SELECT USING ((auth.uid() = user_id));


--
-- Name: referral_stats Users can view own referral stats; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can view own referral stats" ON public.referral_stats FOR SELECT USING ((auth.uid() = user_id));


--
-- Name: subscriptions Users can view own subscription; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can view own subscription" ON public.subscriptions FOR SELECT USING ((auth.uid() = user_id));


--
-- Name: user_usage_monthly Users can view own usage; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can view own usage" ON public.user_usage_monthly FOR SELECT USING ((auth.uid() = user_id));


--
-- Name: chats Users can view their own chats; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can view their own chats" ON public.chats FOR SELECT USING ((auth.uid() = user_id));


--
-- Name: messages Users can view their own messages; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can view their own messages" ON public.messages FOR SELECT USING ((auth.uid() = user_id));


--
-- Name: profiles Users can view their own profile; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can view their own profile" ON public.profiles FOR SELECT USING ((auth.uid() = user_id));


--
-- Name: ad_stats; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.ad_stats ENABLE ROW LEVEL SECURITY;

--
-- Name: answer_ratings; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.answer_ratings ENABLE ROW LEVEL SECURITY;

--
-- Name: best_of_materials; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.best_of_materials ENABLE ROW LEVEL SECURITY;

--
-- Name: chats; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.chats ENABLE ROW LEVEL SECURITY;

--
-- Name: community_posts; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.community_posts ENABLE ROW LEVEL SECURITY;

--
-- Name: courses; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.courses ENABLE ROW LEVEL SECURITY;

--
-- Name: document_chunks; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.document_chunks ENABLE ROW LEVEL SECURITY;

--
-- Name: documents; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.documents ENABLE ROW LEVEL SECURITY;

--
-- Name: friend_details; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.friend_details ENABLE ROW LEVEL SECURITY;

--
-- Name: messages; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: profiles; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

--
-- Name: referral_stats; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.referral_stats ENABLE ROW LEVEL SECURITY;

--
-- Name: subscription_free_month_history; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.subscription_free_month_history ENABLE ROW LEVEL SECURITY;

--
-- Name: subscriptions; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.subscriptions ENABLE ROW LEVEL SECURITY;

--
-- Name: universities; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.universities ENABLE ROW LEVEL SECURITY;

--
-- Name: university_links; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.university_links ENABLE ROW LEVEL SECURITY;

--
-- Name: user_devices; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.user_devices ENABLE ROW LEVEL SECURITY;

--
-- Name: user_usage_monthly; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.user_usage_monthly ENABLE ROW LEVEL SECURITY;

--
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: objects Allow user deletes; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow user deletes" ON storage.objects FOR DELETE USING (((bucket_id = 'loopplus'::text) AND (auth.uid() = owner)));


--
-- Name: objects Allow user downloads; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow user downloads" ON storage.objects FOR SELECT USING (((bucket_id = 'loopplus'::text) AND (auth.role() = 'authenticated'::text)));


--
-- Name: objects Allow user updates; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow user updates" ON storage.objects FOR UPDATE USING (((bucket_id = 'loopplus'::text) AND (auth.uid() = owner)));


--
-- Name: objects Allow user uploads; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow user uploads" ON storage.objects FOR INSERT WITH CHECK (((bucket_id = 'loopplus'::text) AND (auth.role() = 'authenticated'::text)));


--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_analytics; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets_analytics ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_vectors; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets_vectors ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: vector_indexes; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.vector_indexes ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT USAGE ON SCHEMA auth TO postgres;


--
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA storage TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- Name: SCHEMA vault; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA vault TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA vault TO service_role;


--
-- Name: FUNCTION halfvec_in(cstring, oid, integer); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_in(cstring, oid, integer) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_in(cstring, oid, integer) TO anon;
GRANT ALL ON FUNCTION public.halfvec_in(cstring, oid, integer) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_in(cstring, oid, integer) TO service_role;


--
-- Name: FUNCTION halfvec_out(public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_out(public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_out(public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_out(public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_out(public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_recv(internal, oid, integer); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_recv(internal, oid, integer) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_recv(internal, oid, integer) TO anon;
GRANT ALL ON FUNCTION public.halfvec_recv(internal, oid, integer) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_recv(internal, oid, integer) TO service_role;


--
-- Name: FUNCTION halfvec_send(public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_send(public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_send(public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_send(public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_send(public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_typmod_in(cstring[]); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_typmod_in(cstring[]) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_typmod_in(cstring[]) TO anon;
GRANT ALL ON FUNCTION public.halfvec_typmod_in(cstring[]) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_typmod_in(cstring[]) TO service_role;


--
-- Name: FUNCTION sparsevec_in(cstring, oid, integer); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_in(cstring, oid, integer) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_in(cstring, oid, integer) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_in(cstring, oid, integer) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_in(cstring, oid, integer) TO service_role;


--
-- Name: FUNCTION sparsevec_out(public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_out(public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_out(public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_out(public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_out(public.sparsevec) TO service_role;


--
-- Name: FUNCTION sparsevec_recv(internal, oid, integer); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_recv(internal, oid, integer) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_recv(internal, oid, integer) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_recv(internal, oid, integer) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_recv(internal, oid, integer) TO service_role;


--
-- Name: FUNCTION sparsevec_send(public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_send(public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_send(public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_send(public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_send(public.sparsevec) TO service_role;


--
-- Name: FUNCTION sparsevec_typmod_in(cstring[]); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_typmod_in(cstring[]) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_typmod_in(cstring[]) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_typmod_in(cstring[]) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_typmod_in(cstring[]) TO service_role;


--
-- Name: FUNCTION vector_in(cstring, oid, integer); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_in(cstring, oid, integer) TO postgres;
GRANT ALL ON FUNCTION public.vector_in(cstring, oid, integer) TO anon;
GRANT ALL ON FUNCTION public.vector_in(cstring, oid, integer) TO authenticated;
GRANT ALL ON FUNCTION public.vector_in(cstring, oid, integer) TO service_role;


--
-- Name: FUNCTION vector_out(public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_out(public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_out(public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_out(public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_out(public.vector) TO service_role;


--
-- Name: FUNCTION vector_recv(internal, oid, integer); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_recv(internal, oid, integer) TO postgres;
GRANT ALL ON FUNCTION public.vector_recv(internal, oid, integer) TO anon;
GRANT ALL ON FUNCTION public.vector_recv(internal, oid, integer) TO authenticated;
GRANT ALL ON FUNCTION public.vector_recv(internal, oid, integer) TO service_role;


--
-- Name: FUNCTION vector_send(public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_send(public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_send(public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_send(public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_send(public.vector) TO service_role;


--
-- Name: FUNCTION vector_typmod_in(cstring[]); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_typmod_in(cstring[]) TO postgres;
GRANT ALL ON FUNCTION public.vector_typmod_in(cstring[]) TO anon;
GRANT ALL ON FUNCTION public.vector_typmod_in(cstring[]) TO authenticated;
GRANT ALL ON FUNCTION public.vector_typmod_in(cstring[]) TO service_role;


--
-- Name: FUNCTION array_to_halfvec(real[], integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.array_to_halfvec(real[], integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.array_to_halfvec(real[], integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.array_to_halfvec(real[], integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.array_to_halfvec(real[], integer, boolean) TO service_role;


--
-- Name: FUNCTION array_to_sparsevec(real[], integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.array_to_sparsevec(real[], integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.array_to_sparsevec(real[], integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.array_to_sparsevec(real[], integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.array_to_sparsevec(real[], integer, boolean) TO service_role;


--
-- Name: FUNCTION array_to_vector(real[], integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.array_to_vector(real[], integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.array_to_vector(real[], integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.array_to_vector(real[], integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.array_to_vector(real[], integer, boolean) TO service_role;


--
-- Name: FUNCTION array_to_halfvec(double precision[], integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.array_to_halfvec(double precision[], integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.array_to_halfvec(double precision[], integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.array_to_halfvec(double precision[], integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.array_to_halfvec(double precision[], integer, boolean) TO service_role;


--
-- Name: FUNCTION array_to_sparsevec(double precision[], integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.array_to_sparsevec(double precision[], integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.array_to_sparsevec(double precision[], integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.array_to_sparsevec(double precision[], integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.array_to_sparsevec(double precision[], integer, boolean) TO service_role;


--
-- Name: FUNCTION array_to_vector(double precision[], integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.array_to_vector(double precision[], integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.array_to_vector(double precision[], integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.array_to_vector(double precision[], integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.array_to_vector(double precision[], integer, boolean) TO service_role;


--
-- Name: FUNCTION array_to_halfvec(integer[], integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.array_to_halfvec(integer[], integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.array_to_halfvec(integer[], integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.array_to_halfvec(integer[], integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.array_to_halfvec(integer[], integer, boolean) TO service_role;


--
-- Name: FUNCTION array_to_sparsevec(integer[], integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.array_to_sparsevec(integer[], integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.array_to_sparsevec(integer[], integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.array_to_sparsevec(integer[], integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.array_to_sparsevec(integer[], integer, boolean) TO service_role;


--
-- Name: FUNCTION array_to_vector(integer[], integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.array_to_vector(integer[], integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.array_to_vector(integer[], integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.array_to_vector(integer[], integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.array_to_vector(integer[], integer, boolean) TO service_role;


--
-- Name: FUNCTION array_to_halfvec(numeric[], integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.array_to_halfvec(numeric[], integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.array_to_halfvec(numeric[], integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.array_to_halfvec(numeric[], integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.array_to_halfvec(numeric[], integer, boolean) TO service_role;


--
-- Name: FUNCTION array_to_sparsevec(numeric[], integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.array_to_sparsevec(numeric[], integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.array_to_sparsevec(numeric[], integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.array_to_sparsevec(numeric[], integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.array_to_sparsevec(numeric[], integer, boolean) TO service_role;


--
-- Name: FUNCTION array_to_vector(numeric[], integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.array_to_vector(numeric[], integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.array_to_vector(numeric[], integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.array_to_vector(numeric[], integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.array_to_vector(numeric[], integer, boolean) TO service_role;


--
-- Name: FUNCTION halfvec_to_float4(public.halfvec, integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_to_float4(public.halfvec, integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_to_float4(public.halfvec, integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.halfvec_to_float4(public.halfvec, integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_to_float4(public.halfvec, integer, boolean) TO service_role;


--
-- Name: FUNCTION halfvec(public.halfvec, integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec(public.halfvec, integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.halfvec(public.halfvec, integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.halfvec(public.halfvec, integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec(public.halfvec, integer, boolean) TO service_role;


--
-- Name: FUNCTION halfvec_to_sparsevec(public.halfvec, integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_to_sparsevec(public.halfvec, integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_to_sparsevec(public.halfvec, integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.halfvec_to_sparsevec(public.halfvec, integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_to_sparsevec(public.halfvec, integer, boolean) TO service_role;


--
-- Name: FUNCTION halfvec_to_vector(public.halfvec, integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_to_vector(public.halfvec, integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_to_vector(public.halfvec, integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.halfvec_to_vector(public.halfvec, integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_to_vector(public.halfvec, integer, boolean) TO service_role;


--
-- Name: FUNCTION sparsevec_to_halfvec(public.sparsevec, integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_to_halfvec(public.sparsevec, integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_to_halfvec(public.sparsevec, integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_to_halfvec(public.sparsevec, integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_to_halfvec(public.sparsevec, integer, boolean) TO service_role;


--
-- Name: FUNCTION sparsevec(public.sparsevec, integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec(public.sparsevec, integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec(public.sparsevec, integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.sparsevec(public.sparsevec, integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec(public.sparsevec, integer, boolean) TO service_role;


--
-- Name: FUNCTION sparsevec_to_vector(public.sparsevec, integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_to_vector(public.sparsevec, integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_to_vector(public.sparsevec, integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_to_vector(public.sparsevec, integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_to_vector(public.sparsevec, integer, boolean) TO service_role;


--
-- Name: FUNCTION vector_to_float4(public.vector, integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_to_float4(public.vector, integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.vector_to_float4(public.vector, integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.vector_to_float4(public.vector, integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.vector_to_float4(public.vector, integer, boolean) TO service_role;


--
-- Name: FUNCTION vector_to_halfvec(public.vector, integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_to_halfvec(public.vector, integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.vector_to_halfvec(public.vector, integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.vector_to_halfvec(public.vector, integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.vector_to_halfvec(public.vector, integer, boolean) TO service_role;


--
-- Name: FUNCTION vector_to_sparsevec(public.vector, integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_to_sparsevec(public.vector, integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.vector_to_sparsevec(public.vector, integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.vector_to_sparsevec(public.vector, integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.vector_to_sparsevec(public.vector, integer, boolean) TO service_role;


--
-- Name: FUNCTION vector(public.vector, integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector(public.vector, integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.vector(public.vector, integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.vector(public.vector, integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.vector(public.vector, integer, boolean) TO service_role;


--
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;


--
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;


--
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;


--
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;


--
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea, text[], text[]) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;


--
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.crypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.dearmor(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;


--
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_bytes(integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;


--
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_uuid() FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text, integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO dashboard_user;


--
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;


--
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_key_id(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1mc() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v4() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_nil() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_dns() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_oid() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_url() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_x500() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;


--
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- Name: FUNCTION pg_reload_conf(); Type: ACL; Schema: pg_catalog; Owner: supabase_admin
--

GRANT ALL ON FUNCTION pg_catalog.pg_reload_conf() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;


--
-- Name: FUNCTION binary_quantize(public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.binary_quantize(public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.binary_quantize(public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.binary_quantize(public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.binary_quantize(public.halfvec) TO service_role;


--
-- Name: FUNCTION binary_quantize(public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.binary_quantize(public.vector) TO postgres;
GRANT ALL ON FUNCTION public.binary_quantize(public.vector) TO anon;
GRANT ALL ON FUNCTION public.binary_quantize(public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.binary_quantize(public.vector) TO service_role;


--
-- Name: FUNCTION cosine_distance(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.cosine_distance(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.cosine_distance(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.cosine_distance(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.cosine_distance(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION cosine_distance(public.sparsevec, public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.cosine_distance(public.sparsevec, public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.cosine_distance(public.sparsevec, public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.cosine_distance(public.sparsevec, public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.cosine_distance(public.sparsevec, public.sparsevec) TO service_role;


--
-- Name: FUNCTION cosine_distance(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.cosine_distance(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.cosine_distance(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.cosine_distance(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.cosine_distance(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION drop_all_policies_on_table(table_name text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.drop_all_policies_on_table(table_name text) TO anon;
GRANT ALL ON FUNCTION public.drop_all_policies_on_table(table_name text) TO authenticated;
GRANT ALL ON FUNCTION public.drop_all_policies_on_table(table_name text) TO service_role;


--
-- Name: FUNCTION halfvec_accum(double precision[], public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_accum(double precision[], public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_accum(double precision[], public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_accum(double precision[], public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_accum(double precision[], public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_add(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_add(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_add(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_add(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_add(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_avg(double precision[]); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_avg(double precision[]) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_avg(double precision[]) TO anon;
GRANT ALL ON FUNCTION public.halfvec_avg(double precision[]) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_avg(double precision[]) TO service_role;


--
-- Name: FUNCTION halfvec_cmp(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_cmp(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_cmp(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_cmp(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_cmp(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_combine(double precision[], double precision[]); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_combine(double precision[], double precision[]) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_combine(double precision[], double precision[]) TO anon;
GRANT ALL ON FUNCTION public.halfvec_combine(double precision[], double precision[]) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_combine(double precision[], double precision[]) TO service_role;


--
-- Name: FUNCTION halfvec_concat(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_concat(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_concat(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_concat(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_concat(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_eq(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_eq(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_eq(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_eq(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_eq(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_ge(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_ge(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_ge(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_ge(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_ge(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_gt(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_gt(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_gt(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_gt(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_gt(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_l2_squared_distance(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_l2_squared_distance(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_l2_squared_distance(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_l2_squared_distance(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_l2_squared_distance(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_le(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_le(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_le(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_le(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_le(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_lt(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_lt(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_lt(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_lt(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_lt(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_mul(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_mul(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_mul(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_mul(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_mul(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_ne(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_ne(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_ne(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_ne(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_ne(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_negative_inner_product(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_negative_inner_product(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_negative_inner_product(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_negative_inner_product(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_negative_inner_product(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_spherical_distance(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_spherical_distance(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_spherical_distance(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_spherical_distance(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_spherical_distance(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_sub(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_sub(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_sub(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_sub(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_sub(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION hamming_distance(bit, bit); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.hamming_distance(bit, bit) TO postgres;
GRANT ALL ON FUNCTION public.hamming_distance(bit, bit) TO anon;
GRANT ALL ON FUNCTION public.hamming_distance(bit, bit) TO authenticated;
GRANT ALL ON FUNCTION public.hamming_distance(bit, bit) TO service_role;


--
-- Name: FUNCTION hnsw_bit_support(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.hnsw_bit_support(internal) TO postgres;
GRANT ALL ON FUNCTION public.hnsw_bit_support(internal) TO anon;
GRANT ALL ON FUNCTION public.hnsw_bit_support(internal) TO authenticated;
GRANT ALL ON FUNCTION public.hnsw_bit_support(internal) TO service_role;


--
-- Name: FUNCTION hnsw_halfvec_support(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.hnsw_halfvec_support(internal) TO postgres;
GRANT ALL ON FUNCTION public.hnsw_halfvec_support(internal) TO anon;
GRANT ALL ON FUNCTION public.hnsw_halfvec_support(internal) TO authenticated;
GRANT ALL ON FUNCTION public.hnsw_halfvec_support(internal) TO service_role;


--
-- Name: FUNCTION hnsw_sparsevec_support(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.hnsw_sparsevec_support(internal) TO postgres;
GRANT ALL ON FUNCTION public.hnsw_sparsevec_support(internal) TO anon;
GRANT ALL ON FUNCTION public.hnsw_sparsevec_support(internal) TO authenticated;
GRANT ALL ON FUNCTION public.hnsw_sparsevec_support(internal) TO service_role;


--
-- Name: FUNCTION hnswhandler(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.hnswhandler(internal) TO postgres;
GRANT ALL ON FUNCTION public.hnswhandler(internal) TO anon;
GRANT ALL ON FUNCTION public.hnswhandler(internal) TO authenticated;
GRANT ALL ON FUNCTION public.hnswhandler(internal) TO service_role;


--
-- Name: FUNCTION inner_product(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.inner_product(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.inner_product(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.inner_product(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.inner_product(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION inner_product(public.sparsevec, public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.inner_product(public.sparsevec, public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.inner_product(public.sparsevec, public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.inner_product(public.sparsevec, public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.inner_product(public.sparsevec, public.sparsevec) TO service_role;


--
-- Name: FUNCTION inner_product(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.inner_product(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.inner_product(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.inner_product(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.inner_product(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION ivfflat_bit_support(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.ivfflat_bit_support(internal) TO postgres;
GRANT ALL ON FUNCTION public.ivfflat_bit_support(internal) TO anon;
GRANT ALL ON FUNCTION public.ivfflat_bit_support(internal) TO authenticated;
GRANT ALL ON FUNCTION public.ivfflat_bit_support(internal) TO service_role;


--
-- Name: FUNCTION ivfflat_halfvec_support(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.ivfflat_halfvec_support(internal) TO postgres;
GRANT ALL ON FUNCTION public.ivfflat_halfvec_support(internal) TO anon;
GRANT ALL ON FUNCTION public.ivfflat_halfvec_support(internal) TO authenticated;
GRANT ALL ON FUNCTION public.ivfflat_halfvec_support(internal) TO service_role;


--
-- Name: FUNCTION ivfflathandler(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.ivfflathandler(internal) TO postgres;
GRANT ALL ON FUNCTION public.ivfflathandler(internal) TO anon;
GRANT ALL ON FUNCTION public.ivfflathandler(internal) TO authenticated;
GRANT ALL ON FUNCTION public.ivfflathandler(internal) TO service_role;


--
-- Name: FUNCTION jaccard_distance(bit, bit); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.jaccard_distance(bit, bit) TO postgres;
GRANT ALL ON FUNCTION public.jaccard_distance(bit, bit) TO anon;
GRANT ALL ON FUNCTION public.jaccard_distance(bit, bit) TO authenticated;
GRANT ALL ON FUNCTION public.jaccard_distance(bit, bit) TO service_role;


--
-- Name: FUNCTION l1_distance(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.l1_distance(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.l1_distance(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.l1_distance(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.l1_distance(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION l1_distance(public.sparsevec, public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.l1_distance(public.sparsevec, public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.l1_distance(public.sparsevec, public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.l1_distance(public.sparsevec, public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.l1_distance(public.sparsevec, public.sparsevec) TO service_role;


--
-- Name: FUNCTION l1_distance(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.l1_distance(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.l1_distance(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.l1_distance(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.l1_distance(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION l2_distance(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.l2_distance(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.l2_distance(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.l2_distance(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.l2_distance(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION l2_distance(public.sparsevec, public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.l2_distance(public.sparsevec, public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.l2_distance(public.sparsevec, public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.l2_distance(public.sparsevec, public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.l2_distance(public.sparsevec, public.sparsevec) TO service_role;


--
-- Name: FUNCTION l2_distance(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.l2_distance(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.l2_distance(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.l2_distance(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.l2_distance(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION l2_norm(public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.l2_norm(public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.l2_norm(public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.l2_norm(public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.l2_norm(public.halfvec) TO service_role;


--
-- Name: FUNCTION l2_norm(public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.l2_norm(public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.l2_norm(public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.l2_norm(public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.l2_norm(public.sparsevec) TO service_role;


--
-- Name: FUNCTION l2_normalize(public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.l2_normalize(public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.l2_normalize(public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.l2_normalize(public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.l2_normalize(public.halfvec) TO service_role;


--
-- Name: FUNCTION l2_normalize(public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.l2_normalize(public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.l2_normalize(public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.l2_normalize(public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.l2_normalize(public.sparsevec) TO service_role;


--
-- Name: FUNCTION l2_normalize(public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.l2_normalize(public.vector) TO postgres;
GRANT ALL ON FUNCTION public.l2_normalize(public.vector) TO anon;
GRANT ALL ON FUNCTION public.l2_normalize(public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.l2_normalize(public.vector) TO service_role;


--
-- Name: FUNCTION match_documents(query_embedding public.vector, match_threshold double precision, match_count integer, p_user_id uuid, p_university_id uuid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.match_documents(query_embedding public.vector, match_threshold double precision, match_count integer, p_user_id uuid, p_university_id uuid) TO anon;
GRANT ALL ON FUNCTION public.match_documents(query_embedding public.vector, match_threshold double precision, match_count integer, p_user_id uuid, p_university_id uuid) TO authenticated;
GRANT ALL ON FUNCTION public.match_documents(query_embedding public.vector, match_threshold double precision, match_count integer, p_user_id uuid, p_university_id uuid) TO service_role;


--
-- Name: FUNCTION sparsevec_cmp(public.sparsevec, public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_cmp(public.sparsevec, public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_cmp(public.sparsevec, public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_cmp(public.sparsevec, public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_cmp(public.sparsevec, public.sparsevec) TO service_role;


--
-- Name: FUNCTION sparsevec_eq(public.sparsevec, public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_eq(public.sparsevec, public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_eq(public.sparsevec, public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_eq(public.sparsevec, public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_eq(public.sparsevec, public.sparsevec) TO service_role;


--
-- Name: FUNCTION sparsevec_ge(public.sparsevec, public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_ge(public.sparsevec, public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_ge(public.sparsevec, public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_ge(public.sparsevec, public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_ge(public.sparsevec, public.sparsevec) TO service_role;


--
-- Name: FUNCTION sparsevec_gt(public.sparsevec, public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_gt(public.sparsevec, public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_gt(public.sparsevec, public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_gt(public.sparsevec, public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_gt(public.sparsevec, public.sparsevec) TO service_role;


--
-- Name: FUNCTION sparsevec_l2_squared_distance(public.sparsevec, public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_l2_squared_distance(public.sparsevec, public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_l2_squared_distance(public.sparsevec, public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_l2_squared_distance(public.sparsevec, public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_l2_squared_distance(public.sparsevec, public.sparsevec) TO service_role;


--
-- Name: FUNCTION sparsevec_le(public.sparsevec, public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_le(public.sparsevec, public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_le(public.sparsevec, public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_le(public.sparsevec, public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_le(public.sparsevec, public.sparsevec) TO service_role;


--
-- Name: FUNCTION sparsevec_lt(public.sparsevec, public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_lt(public.sparsevec, public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_lt(public.sparsevec, public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_lt(public.sparsevec, public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_lt(public.sparsevec, public.sparsevec) TO service_role;


--
-- Name: FUNCTION sparsevec_ne(public.sparsevec, public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_ne(public.sparsevec, public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_ne(public.sparsevec, public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_ne(public.sparsevec, public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_ne(public.sparsevec, public.sparsevec) TO service_role;


--
-- Name: FUNCTION sparsevec_negative_inner_product(public.sparsevec, public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_negative_inner_product(public.sparsevec, public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_negative_inner_product(public.sparsevec, public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_negative_inner_product(public.sparsevec, public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_negative_inner_product(public.sparsevec, public.sparsevec) TO service_role;


--
-- Name: FUNCTION subvector(public.halfvec, integer, integer); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.subvector(public.halfvec, integer, integer) TO postgres;
GRANT ALL ON FUNCTION public.subvector(public.halfvec, integer, integer) TO anon;
GRANT ALL ON FUNCTION public.subvector(public.halfvec, integer, integer) TO authenticated;
GRANT ALL ON FUNCTION public.subvector(public.halfvec, integer, integer) TO service_role;


--
-- Name: FUNCTION subvector(public.vector, integer, integer); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.subvector(public.vector, integer, integer) TO postgres;
GRANT ALL ON FUNCTION public.subvector(public.vector, integer, integer) TO anon;
GRANT ALL ON FUNCTION public.subvector(public.vector, integer, integer) TO authenticated;
GRANT ALL ON FUNCTION public.subvector(public.vector, integer, integer) TO service_role;


--
-- Name: FUNCTION vector_accum(double precision[], public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_accum(double precision[], public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_accum(double precision[], public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_accum(double precision[], public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_accum(double precision[], public.vector) TO service_role;


--
-- Name: FUNCTION vector_add(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_add(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_add(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_add(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_add(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION vector_avg(double precision[]); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_avg(double precision[]) TO postgres;
GRANT ALL ON FUNCTION public.vector_avg(double precision[]) TO anon;
GRANT ALL ON FUNCTION public.vector_avg(double precision[]) TO authenticated;
GRANT ALL ON FUNCTION public.vector_avg(double precision[]) TO service_role;


--
-- Name: FUNCTION vector_cmp(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_cmp(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_cmp(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_cmp(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_cmp(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION vector_combine(double precision[], double precision[]); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_combine(double precision[], double precision[]) TO postgres;
GRANT ALL ON FUNCTION public.vector_combine(double precision[], double precision[]) TO anon;
GRANT ALL ON FUNCTION public.vector_combine(double precision[], double precision[]) TO authenticated;
GRANT ALL ON FUNCTION public.vector_combine(double precision[], double precision[]) TO service_role;


--
-- Name: FUNCTION vector_concat(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_concat(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_concat(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_concat(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_concat(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION vector_dims(public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_dims(public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.vector_dims(public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.vector_dims(public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.vector_dims(public.halfvec) TO service_role;


--
-- Name: FUNCTION vector_dims(public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_dims(public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_dims(public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_dims(public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_dims(public.vector) TO service_role;


--
-- Name: FUNCTION vector_eq(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_eq(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_eq(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_eq(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_eq(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION vector_ge(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_ge(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_ge(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_ge(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_ge(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION vector_gt(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_gt(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_gt(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_gt(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_gt(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION vector_l2_squared_distance(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_l2_squared_distance(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_l2_squared_distance(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_l2_squared_distance(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_l2_squared_distance(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION vector_le(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_le(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_le(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_le(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_le(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION vector_lt(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_lt(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_lt(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_lt(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_lt(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION vector_mul(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_mul(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_mul(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_mul(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_mul(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION vector_ne(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_ne(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_ne(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_ne(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_ne(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION vector_negative_inner_product(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_negative_inner_product(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_negative_inner_product(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_negative_inner_product(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_negative_inner_product(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION vector_norm(public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_norm(public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_norm(public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_norm(public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_norm(public.vector) TO service_role;


--
-- Name: FUNCTION vector_spherical_distance(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_spherical_distance(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_spherical_distance(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_spherical_distance(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_spherical_distance(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION vector_sub(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_sub(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_sub(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_sub(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_sub(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO postgres;
GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO dashboard_user;


--
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- Name: FUNCTION send(payload jsonb, event text, topic text, private boolean); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO postgres;
GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO dashboard_user;


--
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- Name: FUNCTION topic(); Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;


--
-- Name: FUNCTION _crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO service_role;


--
-- Name: FUNCTION create_secret(new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- Name: FUNCTION update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- Name: FUNCTION avg(public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.avg(public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.avg(public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.avg(public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.avg(public.halfvec) TO service_role;


--
-- Name: FUNCTION avg(public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.avg(public.vector) TO postgres;
GRANT ALL ON FUNCTION public.avg(public.vector) TO anon;
GRANT ALL ON FUNCTION public.avg(public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.avg(public.vector) TO service_role;


--
-- Name: FUNCTION sum(public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sum(public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.sum(public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.sum(public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.sum(public.halfvec) TO service_role;


--
-- Name: FUNCTION sum(public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sum(public.vector) TO postgres;
GRANT ALL ON FUNCTION public.sum(public.vector) TO anon;
GRANT ALL ON FUNCTION public.sum(public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.sum(public.vector) TO service_role;


--
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.audit_log_entries TO postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;


--
-- Name: TABLE custom_oauth_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.custom_oauth_providers TO postgres;
GRANT ALL ON TABLE auth.custom_oauth_providers TO dashboard_user;


--
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.flow_state TO postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;


--
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.identities TO postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.identities TO dashboard_user;


--
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.instances TO postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;


--
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_challenges TO postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_factors TO postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;


--
-- Name: TABLE oauth_authorizations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_authorizations TO postgres;
GRANT ALL ON TABLE auth.oauth_authorizations TO dashboard_user;


--
-- Name: TABLE oauth_client_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_client_states TO postgres;
GRANT ALL ON TABLE auth.oauth_client_states TO dashboard_user;


--
-- Name: TABLE oauth_clients; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_clients TO postgres;
GRANT ALL ON TABLE auth.oauth_clients TO dashboard_user;


--
-- Name: TABLE oauth_consents; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_consents TO postgres;
GRANT ALL ON TABLE auth.oauth_consents TO dashboard_user;


--
-- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.one_time_tokens TO postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.one_time_tokens TO dashboard_user;


--
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.refresh_tokens TO postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;


--
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_providers TO postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;


--
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_relay_states TO postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT SELECT ON TABLE auth.schema_migrations TO postgres WITH GRANT OPTION;


--
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sessions TO postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;


--
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_domains TO postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;


--
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_providers TO postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;


--
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.users TO postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;


--
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements TO dashboard_user;


--
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements_info FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO dashboard_user;


--
-- Name: TABLE ad_stats; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.ad_stats TO anon;
GRANT ALL ON TABLE public.ad_stats TO authenticated;
GRANT ALL ON TABLE public.ad_stats TO service_role;


--
-- Name: TABLE answer_ratings; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.answer_ratings TO anon;
GRANT ALL ON TABLE public.answer_ratings TO authenticated;
GRANT ALL ON TABLE public.answer_ratings TO service_role;


--
-- Name: TABLE best_of_materials; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.best_of_materials TO anon;
GRANT ALL ON TABLE public.best_of_materials TO authenticated;
GRANT ALL ON TABLE public.best_of_materials TO service_role;


--
-- Name: TABLE chats; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.chats TO anon;
GRANT ALL ON TABLE public.chats TO authenticated;
GRANT ALL ON TABLE public.chats TO service_role;


--
-- Name: TABLE community_posts; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.community_posts TO anon;
GRANT ALL ON TABLE public.community_posts TO authenticated;
GRANT ALL ON TABLE public.community_posts TO service_role;


--
-- Name: TABLE courses; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.courses TO anon;
GRANT ALL ON TABLE public.courses TO authenticated;
GRANT ALL ON TABLE public.courses TO service_role;


--
-- Name: TABLE document_chunks; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.document_chunks TO anon;
GRANT ALL ON TABLE public.document_chunks TO authenticated;
GRANT ALL ON TABLE public.document_chunks TO service_role;


--
-- Name: TABLE documents; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.documents TO anon;
GRANT ALL ON TABLE public.documents TO authenticated;
GRANT ALL ON TABLE public.documents TO service_role;


--
-- Name: TABLE friend_details; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.friend_details TO anon;
GRANT ALL ON TABLE public.friend_details TO authenticated;
GRANT ALL ON TABLE public.friend_details TO service_role;


--
-- Name: TABLE messages; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.messages TO anon;
GRANT ALL ON TABLE public.messages TO authenticated;
GRANT ALL ON TABLE public.messages TO service_role;


--
-- Name: TABLE profiles; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.profiles TO anon;
GRANT ALL ON TABLE public.profiles TO authenticated;
GRANT ALL ON TABLE public.profiles TO service_role;


--
-- Name: TABLE referral_stats; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.referral_stats TO anon;
GRANT ALL ON TABLE public.referral_stats TO authenticated;
GRANT ALL ON TABLE public.referral_stats TO service_role;


--
-- Name: TABLE subscription_free_month_history; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.subscription_free_month_history TO anon;
GRANT ALL ON TABLE public.subscription_free_month_history TO authenticated;
GRANT ALL ON TABLE public.subscription_free_month_history TO service_role;


--
-- Name: TABLE subscriptions; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.subscriptions TO anon;
GRANT ALL ON TABLE public.subscriptions TO authenticated;
GRANT ALL ON TABLE public.subscriptions TO service_role;


--
-- Name: TABLE universities; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.universities TO anon;
GRANT ALL ON TABLE public.universities TO authenticated;
GRANT ALL ON TABLE public.universities TO service_role;


--
-- Name: TABLE university_links; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.university_links TO anon;
GRANT ALL ON TABLE public.university_links TO authenticated;
GRANT ALL ON TABLE public.university_links TO service_role;


--
-- Name: TABLE user_devices; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.user_devices TO anon;
GRANT ALL ON TABLE public.user_devices TO authenticated;
GRANT ALL ON TABLE public.user_devices TO service_role;


--
-- Name: TABLE user_usage_monthly; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.user_usage_monthly TO anon;
GRANT ALL ON TABLE public.user_usage_monthly TO authenticated;
GRANT ALL ON TABLE public.user_usage_monthly TO service_role;


--
-- Name: TABLE messages; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON TABLE realtime.messages TO postgres;
GRANT ALL ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

REVOKE ALL ON TABLE storage.buckets FROM supabase_storage_admin;
GRANT ALL ON TABLE storage.buckets TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO postgres WITH GRANT OPTION;


--
-- Name: TABLE buckets_analytics; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets_analytics TO service_role;
GRANT ALL ON TABLE storage.buckets_analytics TO authenticated;
GRANT ALL ON TABLE storage.buckets_analytics TO anon;


--
-- Name: TABLE buckets_vectors; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT ON TABLE storage.buckets_vectors TO service_role;
GRANT SELECT ON TABLE storage.buckets_vectors TO authenticated;
GRANT SELECT ON TABLE storage.buckets_vectors TO anon;


--
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

REVOKE ALL ON TABLE storage.objects FROM supabase_storage_admin;
GRANT ALL ON TABLE storage.objects TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO postgres WITH GRANT OPTION;


--
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;


--
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;


--
-- Name: TABLE vector_indexes; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT ON TABLE storage.vector_indexes TO service_role;
GRANT SELECT ON TABLE storage.vector_indexes TO authenticated;
GRANT SELECT ON TABLE storage.vector_indexes TO anon;


--
-- Name: TABLE secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.secrets TO service_role;


--
-- Name: TABLE decrypted_secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.decrypted_secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.decrypted_secrets TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO service_role;


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO supabase_admin;

--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

--
-- PostgreSQL database dump complete
--

\unrestrict KPBA5q2XZrzIvkmcD1DlyaBeloWbPwOstqMgPDsuEqHZLizKetIglINk40sRbma

