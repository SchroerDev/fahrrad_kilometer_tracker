create extension if not exists "postgis" with schema "extensions";


create table "public"."members" (
    "user_id" uuid not null default gen_random_uuid(),
    "team_id" uuid not null default gen_random_uuid()
);


alter table "public"."members" enable row level security;

create table "public"."profiles" (
    "id" uuid not null,
    "created_at" timestamp with time zone not null default now(),
    "username" text
);


alter table "public"."profiles" enable row level security;

create table "public"."rides" (
    "id" uuid not null default gen_random_uuid(),
    "user_id" uuid not null default gen_random_uuid(),
    "km" numeric,
    "created_at" timestamp without time zone default now(),
    "StartPoint" geography not null
);


alter table "public"."rides" enable row level security;

create table "public"."teams" (
    "id" uuid not null default gen_random_uuid(),
    "name" text not null default ''::text,
    "created_at" timestamp with time zone not null default now(),
    "created_by" uuid default auth.uid()
);


alter table "public"."teams" enable row level security;

CREATE UNIQUE INDEX members_pkey ON public.members USING btree (user_id);

CREATE UNIQUE INDEX profiles_pkey ON public.profiles USING btree (id);

CREATE UNIQUE INDEX rides_pkey ON public.rides USING btree (id);

CREATE UNIQUE INDEX teams_pkey ON public.teams USING btree (id);

alter table "public"."members" add constraint "members_pkey" PRIMARY KEY using index "members_pkey";

alter table "public"."profiles" add constraint "profiles_pkey" PRIMARY KEY using index "profiles_pkey";

alter table "public"."rides" add constraint "rides_pkey" PRIMARY KEY using index "rides_pkey";

alter table "public"."teams" add constraint "teams_pkey" PRIMARY KEY using index "teams_pkey";

alter table "public"."members" add constraint "members_team_id_fkey" FOREIGN KEY (team_id) REFERENCES teams(id) not valid;

alter table "public"."members" validate constraint "members_team_id_fkey";

alter table "public"."members" add constraint "members_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE not valid;

alter table "public"."members" validate constraint "members_user_id_fkey";

alter table "public"."members" add constraint "members_user_id_profiles_fkey" FOREIGN KEY (user_id) REFERENCES profiles(id) not valid;

alter table "public"."members" validate constraint "members_user_id_profiles_fkey";

alter table "public"."profiles" add constraint "profiles_id_fkey1" FOREIGN KEY (id) REFERENCES auth.users(id) ON DELETE CASCADE not valid;

alter table "public"."profiles" validate constraint "profiles_id_fkey1";

alter table "public"."rides" add constraint "rides_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE not valid;

alter table "public"."rides" validate constraint "rides_user_id_fkey";

alter table "public"."teams" add constraint "teams_created_by_fkey" FOREIGN KEY (created_by) REFERENCES auth.users(id) ON DELETE SET NULL not valid;

alter table "public"."teams" validate constraint "teams_created_by_fkey";

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.delete_team_if_empty()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
begin
  -- Prüfe, ob noch Mitglieder im Team sind
  if not exists (
    select 1 from members where team_id = OLD.team_id
  ) then
    delete from teams where id = OLD.team_id;
  end if;
  return null;
end;
$function$
;

CREATE OR REPLACE FUNCTION public.handle_new_user()
 RETURNS trigger
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
begin
  insert into public.profiles (id)
  values (new.id);
  return new;
end;
$function$
;

create or replace view "public"."team_members_view" as  SELECT members.team_id,
    members.user_id,
    profiles.username
   FROM (members
     LEFT JOIN profiles ON ((members.user_id = profiles.id)));


grant delete on table "public"."members" to "anon";

grant insert on table "public"."members" to "anon";

grant references on table "public"."members" to "anon";

grant select on table "public"."members" to "anon";

grant trigger on table "public"."members" to "anon";

grant truncate on table "public"."members" to "anon";

grant update on table "public"."members" to "anon";

grant delete on table "public"."members" to "authenticated";

grant insert on table "public"."members" to "authenticated";

grant references on table "public"."members" to "authenticated";

grant select on table "public"."members" to "authenticated";

grant trigger on table "public"."members" to "authenticated";

grant truncate on table "public"."members" to "authenticated";

grant update on table "public"."members" to "authenticated";

grant delete on table "public"."members" to "service_role";

grant insert on table "public"."members" to "service_role";

grant references on table "public"."members" to "service_role";

grant select on table "public"."members" to "service_role";

grant trigger on table "public"."members" to "service_role";

grant truncate on table "public"."members" to "service_role";

grant update on table "public"."members" to "service_role";

grant delete on table "public"."profiles" to "anon";

grant insert on table "public"."profiles" to "anon";

grant references on table "public"."profiles" to "anon";

grant select on table "public"."profiles" to "anon";

grant trigger on table "public"."profiles" to "anon";

grant truncate on table "public"."profiles" to "anon";

grant update on table "public"."profiles" to "anon";

grant delete on table "public"."profiles" to "authenticated";

grant insert on table "public"."profiles" to "authenticated";

grant references on table "public"."profiles" to "authenticated";

grant select on table "public"."profiles" to "authenticated";

grant trigger on table "public"."profiles" to "authenticated";

grant truncate on table "public"."profiles" to "authenticated";

grant update on table "public"."profiles" to "authenticated";

grant delete on table "public"."profiles" to "service_role";

grant insert on table "public"."profiles" to "service_role";

grant references on table "public"."profiles" to "service_role";

grant select on table "public"."profiles" to "service_role";

grant trigger on table "public"."profiles" to "service_role";

grant truncate on table "public"."profiles" to "service_role";

grant update on table "public"."profiles" to "service_role";

grant delete on table "public"."rides" to "anon";

grant insert on table "public"."rides" to "anon";

grant references on table "public"."rides" to "anon";

grant select on table "public"."rides" to "anon";

grant trigger on table "public"."rides" to "anon";

grant truncate on table "public"."rides" to "anon";

grant update on table "public"."rides" to "anon";

grant delete on table "public"."rides" to "authenticated";

grant insert on table "public"."rides" to "authenticated";

grant references on table "public"."rides" to "authenticated";

grant select on table "public"."rides" to "authenticated";

grant trigger on table "public"."rides" to "authenticated";

grant truncate on table "public"."rides" to "authenticated";

grant update on table "public"."rides" to "authenticated";

grant delete on table "public"."rides" to "service_role";

grant insert on table "public"."rides" to "service_role";

grant references on table "public"."rides" to "service_role";

grant select on table "public"."rides" to "service_role";

grant trigger on table "public"."rides" to "service_role";

grant truncate on table "public"."rides" to "service_role";

grant update on table "public"."rides" to "service_role";

grant delete on table "public"."teams" to "anon";

grant insert on table "public"."teams" to "anon";

grant references on table "public"."teams" to "anon";

grant select on table "public"."teams" to "anon";

grant trigger on table "public"."teams" to "anon";

grant truncate on table "public"."teams" to "anon";

grant update on table "public"."teams" to "anon";

grant delete on table "public"."teams" to "authenticated";

grant insert on table "public"."teams" to "authenticated";

grant references on table "public"."teams" to "authenticated";

grant select on table "public"."teams" to "authenticated";

grant trigger on table "public"."teams" to "authenticated";

grant truncate on table "public"."teams" to "authenticated";

grant update on table "public"."teams" to "authenticated";

grant delete on table "public"."teams" to "service_role";

grant insert on table "public"."teams" to "service_role";

grant references on table "public"."teams" to "service_role";

grant select on table "public"."teams" to "service_role";

grant trigger on table "public"."teams" to "service_role";

grant truncate on table "public"."teams" to "service_role";

grant update on table "public"."teams" to "service_role";

create policy "Enable delete for users based on user_id"
on "public"."members"
as permissive
for delete
to public
using ((( SELECT auth.uid() AS uid) = user_id));


create policy "Enable read access for all users"
on "public"."members"
as permissive
for select
to public
using (true);


create policy "Mitglied darf nur sich selbst updaten"
on "public"."members"
as permissive
for update
to public
using ((auth.uid() = user_id));


create policy "Mitglied darf sich selbst eintragen"
on "public"."members"
as permissive
for insert
to public
with check ((auth.uid() = user_id));


create policy "Team members can view their team members"
on "public"."members"
as permissive
for select
to public
using ((user_id = auth.uid()));


create policy "service role can Delete Members"
on "public"."members"
as permissive
for delete
to service_role
using (true);


create policy "Enable users to view their own data only"
on "public"."profiles"
as permissive
for select
to authenticated
using ((( SELECT auth.uid() AS uid) = id));


create policy "User darf eigenes Profil updaten"
on "public"."profiles"
as permissive
for update
to public
using ((auth.uid() = id));


create policy "Users can insert their eigenen profile"
on "public"."profiles"
as permissive
for insert
to public
with check ((auth.uid() = id));


create policy "service role can delete profiles"
on "public"."profiles"
as permissive
for delete
to service_role
using (true);


create policy "Enable insert for users based on user_id"
on "public"."rides"
as permissive
for insert
to public
with check ((( SELECT auth.uid() AS uid) = user_id));


create policy "Enable users to view their own data only"
on "public"."rides"
as permissive
for select
to authenticated
using ((( SELECT auth.uid() AS uid) = user_id));


create policy "Users can view their own rides"
on "public"."rides"
as permissive
for select
to public
using ((auth.uid() = user_id));


create policy "service role can delete rides"
on "public"."rides"
as permissive
for delete
to service_role
using (true);


create policy "Anyone can view teams"
on "public"."teams"
as permissive
for select
to public
using (true);


create policy "Enable insert for authenticated users only"
on "public"."teams"
as permissive
for insert
to authenticated
with check (true);


CREATE TRIGGER trg_delete_team_if_empty AFTER DELETE ON public.members FOR EACH ROW EXECUTE FUNCTION delete_team_if_empty();


