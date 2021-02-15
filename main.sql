drop database assignment3;

create database assignment3;

SET GLOBAL local_infile=1;

use assignment3;

create table team (
	team_id int auto_increment,
    team_name varchar(256) not null,
    primary key (team_id)
);

create table player (
	player_id int auto_increment,
    player_name text not null,
    dob date,
    batting_hand text,
    bowling_skill text,
    country_name text,
    primary key (player_id)
);

create table match_match (
	match_id int auto_increment,
    team1 int not null,
    team2 int not null,
    match_date date,
    season_id int,
    venue text,
    toss_winner int,
    toss_decision text,
    win_type text,
    win_margin int, 
    outcome_type text,
    match_winner int, 
    man_of_the_match int,
    primary key (match_id),
    foreign key (team1) references team(team_id) on delete cascade on update cascade,
    foreign key (team2) references team(team_id) on delete cascade on update cascade,
    foreign key (toss_winner) references team(team_id) on delete cascade on update cascade,
    foreign key (match_winner) references team(team_id) on delete cascade on update cascade,
    foreign key (man_of_the_match) references player(player_id) on delete cascade on update cascade
);

create table player_match (
	match_id int,
    player_id int,
    role text not null, 
    team_id int,
    primary key (match_id, player_id),
    foreign key (player_id) references player(player_id) on delete cascade on update cascade,
    foreign key (match_id) references match_match(match_id) on delete cascade on update cascade,
    foreign key (team_id) references team(team_id) on delete cascade on update cascade
);

create table wicket_taken (
	match_id int,
    over_id int,
    ball_id int,
    player_out int not null,
    kind_out text,
    innings_no int,
    primary key (match_id, ball_id, over_id, innings_no),
    foreign key (player_out) references player(player_id) on delete cascade on update cascade,
    foreign key (match_id) references match_match(match_id) on delete cascade on update cascade
);

create table ball_by_ball (
  match_id INT,
  over_id INT ,
  ball_id INT,
  innings_no INT not null,
  team_batting INT,
  team_bowling int,
  striker_batting_position INT,
  striker int,
  non_striker int,
  bowler int,
  primary key (match_id, over_id, ball_id, innings_no),
  foreign key (match_id) references match_match(match_id) on delete cascade on update cascade,
  foreign key (team_batting) references team(team_id) on delete cascade on update cascade,
  foreign key (team_bowling) references team(team_id) on delete cascade on update cascade,
  foreign key (striker) references player(player_id) on delete cascade on update cascade,
  foreign key (non_striker) references player(player_id) on delete cascade on update cascade,
  foreign key (bowler) references player(player_id) on delete cascade on update cascade
);

create table batsman_scored(
    match_id int,
    over_id int,
    ball_id int,
    runs_scored int not null,
    innings_no int not null,
    primary key (match_id, over_id, ball_id, innings_no),
    foreign key (match_id) references match_match(match_id) on delete cascade on update cascade
);

create table extra_runs (
	match_id int,
    over_id int,
    ball_id int,
    extra_type text,
    extra_runs int not null,
    innings_no int not null,
    primary key (match_id, over_id, ball_id, innings_no),
    foreign key (match_id) references match_match(match_id) on delete cascade on update cascade
);

load data local infile "D:\\Acads\\sem6\\DBMS\\assignments\\A3\\datasets\\team.csv" 
into table team
fields terminated by ','
lines terminated by '\n'
ignore 1 rows
(team_id, team_name)
;

load data local infile "D:\\Acads\\sem6\\DBMS\\assignments\\A3\\datasets\\player.csv" 
into table player
fields terminated by ','
lines terminated by '\n'
ignore 2 rows
(player_id, player_name, dob, batting_hand, bowling_skill, country_name)
;

load data local infile "D:\\Acads\\sem6\\DBMS\\assignments\\A3\\datasets\\match.csv" 
into table match_match
fields terminated by ','
lines terminated by '\n'
ignore 2 rows
(match_id, team1, team2, match_date, season_id, venue, toss_winner, toss_decision, win_type, win_margin, outcome_type, match_winner, man_of_the_match)
;

load data local infile "D:\\Acads\\sem6\\DBMS\\assignments\\A3\\datasets\\batsman_scored.csv" 
into table batsman_scored
fields terminated by ','
lines terminated by '\n'
ignore 2 rows
(match_id, over_id, ball_id, runs_scored, innings_no)
;

load data local infile "D:\\Acads\\sem6\\DBMS\\assignments\\A3\\datasets\\ball_by_ball.csv" 
into table ball_by_ball
fields terminated by ','
lines terminated by '\n'
ignore 3 rows
(match_id, over_id, ball_id, innings_no, team_batting, team_bowling, striker_batting_position, striker, non_striker, bowler)
;

load data local infile "D:\\Acads\\sem6\\DBMS\\assignments\\A3\\datasets\\player_match.csv" 
into table player_match
fields terminated by ','
lines terminated by '\n'
ignore 2 rows
(match_id, player_id, role, team_id)
;

load data local infile "D:\\Acads\\sem6\\DBMS\\assignments\\A3\\datasets\\extra_runs.csv" 
into table extra_runs
fields terminated by ','
lines terminated by '\n'
ignore 2 rows
(match_id, over_id, ball_id, extra_type, extra_runs, innings_no)
;

load data local infile "D:\\Acads\\sem6\\DBMS\\assignments\\A3\\datasets\\wicket_taken.csv" 
into table wicket_taken
fields terminated by ','
lines terminated by '\n'
ignore 2 rows
(match_id, over_id, ball_id, player_out, kind_out, innings_no)
;

select * from team;
select * from batsman_scored;
select * from ball_by_ball;
select * from extra_runs;
select * from match_match;
select * from player_match;
select * from player;
select * from wicket_taken;
