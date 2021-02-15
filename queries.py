use_assignment3 = "use assignment3;"

create_teacher_table = """
CREATE TABLE teacher (
  teacher_id INT PRIMARY KEY,
  first_name VARCHAR(40) NOT NULL,
  last_name VARCHAR(40) NOT NULL,
  language_1 VARCHAR(3) NOT NULL,
  language_2 VARCHAR(3),
  dob DATE,
  tax_id INT UNIQUE,
  phone_no VARCHAR(20)
  );
 """

create_table_ball_by_ball = """
create table ball_by_ball (
  match_id INT PRIMARY KEY,
  over_id INT PRIMARY KEY,
  ball_id INT PRIMARY KEY,
  innings_no INT PRIMARY KEY,
  team_batting INT,
  team_bowling int,
  striker_batting_position INT,
  striker int,
  non_striker int,
  bowler int
  );
 """


create_table_batsman_scored = """
create table batsman_scored(
    id int(10) unsigned auto_increment primary key,
    match_id int(10),
    over_id int(10),
    ball_id int(10),
    runs_scored int(10),
    innings_no int(10)
);

"""

load_csv_batsman_scored = """
load data local infile "datasets/batsman_scored.csv" 
into table batsman_scored
fields terminated by ','
lines terminated by '\n'
ignore 2 rows
(match_id, over_id, ball_id, runs_scored, innings_no)
;
"""

drop_table_teacher = """drop table teacher;"""