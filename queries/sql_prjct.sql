create database project;
use project;
select * from appearances;
select * from games;
select * from players;
select * from teams;

#1.Players who scored more goals than the average player
select 
p.name,SUM(a.goals) as total_goals
from players p inner join appearances a
on p.playerID = a.playerID
group by p.playerID, p.name
having SUM(a.goals) > 
(select 
avg(player_goals)
from (select SUM(goals) as player_goals
from appearances
group by playerID) as x)
order by total_goals desc;

#2.What are the 5 biggest victories by an away team?
select
ht.team_name as home_team,at.team_name as away_team,g.awayGoals-g.homeGoals as goal_difference 
from teams at inner join games g 
on g.awayTeamID=at.teamID 
inner join teams ht
on g.homeTeamID=ht.teamID
order by goal_difference desc
limit 5; 

#3.Which players have the highest expected goals?(top 3)
select
p.name, round(sum(a.xGoals), 2) as xG
from players p inner join appearances a
on p.playerID = a.playerID
group by p.name
order by xG desc
limit 3;

#4.List matches where the home team won.
select
h.team_name as home_team,a.team_name as away_team,g.homeGoals,g.awayGoals
from games g inner join teams h on g.homeTeamID = h.teamID
inner join teams a on g.awayTeamID = a.teamID
where g.homeGoals > g.awayGoals;

#5.Find players who have both scored at least one goal and provided at least one assist.
select
p.name,sum(a.goals) as goals,sum(a.assists) as assists
from players p inner join appearances a on p.playerID = a.playerID
group by p.name
having sum(a.goals) > 0 and sum(a.assists) > 0
order by goals desc;

#6.Find the top 10 players by goal contributions
select 
p.name,sum(a.goals) as goals,sum(a.assists) as assists,sum(a.goals + a.assists) as contributions
from players p inner join appearances a 
on p.playerid = a.playerid
group by p.playerid, p.name
order by contributions desc
limit 10;

#7.find players who scored more than 3 goals with fewer than 20 appearances
select 
p.name,sum(a.goals) as goals,count(a.gameID) as appearance
from players p inner join appearances a
on p.playerID=a.playerID
group by p.name
having goals>3 and appearance<20;

#8.which players scored at least 2 goals and had a shooting conversion rate above 20%?
select p.name,sum(a.goals) as goals,sum(a.shots) as shots,round(100*sum(a.goals)/sum(a.shots),2) as conversion
from players p inner join appearances a 
on p.playerid=a.playerid
group by p.name
having sum(a.goals)>=2 and sum(a.shots)>0 and sum(a.goals)/sum(a.shots)>0.20
order by conversion desc;

#9.which players appeared in matches where more than 4 total goals were scored?
select 
distinct p.name
from players p inner join appearances a
on p.playerid=a.playerid
inner join games g
on a.gameid=g.gameid
where g.homegoals+g.awaygoals>4
order by p.name;

#10.Which players scored goals while playing for the home team?
select
p.name,t.team_name,sum(a.goals) as goals
from players p
inner join appearances a
on p.playerid=a.playerid
inner join games g
on a.gameid=g.gameid
inner join teams t
on g.hometeamid=t.teamid
where a.goals>0
group by p.playerid, p.name, t.teamid, t.team_name
order by goals desc;

#11.Which players have made more than 2 appearances in matches where at least 3 goals were scored?
select
p.name,count(a.gameid) as appearances
from players p inner join appearances a
on p.playerid=a.playerid
inner join games g
on a.gameid=g.gameid
where g.homegoals+g.awaygoals>=1
group by p.name
having appearances>2;

#12.How many goals did each team score in each season?
select
g.season,t.team_name,sum(case when g.hometeamid = t.teamid then g.homegoals else g.awaygoals end) as goals
from teams t inner join games g
on t.teamid=g.hometeamid or t.teamid=g.awayteamid
group by g.season, t.teamid,t.team_name
order by g.season,goals desc;

#13.Which teams have recorded the most home wins?(top 10)
select t.team_name,count(*) as home_wins
from teams t inner join games g
on t.teamid = g.hometeamid
where g.homegoals > g.awaygoals
group by t.teamid, t.team_name
order by home_wins desc
limit 10;

#14.Which players scored goals in matches where their team won?
select
p.name,count(a.gameid) as goals
from players p inner join appearances a
on p.playerid=a.playerid
inner join games g on a.gameid=g.gameid
inner join teams t
on g.hometeamid=t.teamid or g.awayteamid=t.teamid
where a.goals > 0 and ((g.hometeamid=t.teamid and g.homegoals>g.awaygoals) or (g.awayteamid=t.teamid and g.awaygoals>g.homegoals))
group by p.playerid, p.name
order by goals desc;

#15.Which players have never made an appearance in any game?
select
p.name
from players p left join appearances a
on p.playerid = a.playerid
where a.playerid is null;

#16.Find games where no player received a yellow card.
select g.gameid, count(a.yellowcard) as yellow_cards
from appearances a right join games g
on g.gameid=a.gameid
group by g.gameid
having count(a.yellowcard)=0;

#17.Create a view showing game results
create view game_results as
select
gameid,date,hometeamid,awayteamid,homegoals,awaygoals,
case
when homegoals > awaygoals then 'home win'
when homegoals < awaygoals then 'away win'
else 'draw'
end as result
from games;

select * from game_results;

#18.Create a view showing each player's total appearances, goals and assists
create view player_summary as
select
p.playerid,
p.name,count(a.gameid) as appearances,sum(a.goals) as goals,sum(a.assists) as assists
from players p left join appearances a
on p.playerid=a.playerid
group by p.playerid, p.name;

select *
from player_summary;

#19.Procedure to find players by position
delimiter //
create procedure players_by_position(in player_position varchar(20))
begin
select
p.name,a.position
from players p inner join appearances a
on p.playerid = a.playerid
where a.position = player_position
group by p.playerid, p.name, a.position;
end //
delimiter ;

call players_by_position('AMR');

#20.
delimiter //
create procedure player_stats(in pid int)
begin
select p.name,count(a.gameid) as appearances,sum(a.time) as minutes,sum(a.goals) as goals,sum(a.assists) as assists,sum(a.shots) as shots,
sum(a.xgoals) as xg,sum(a.xassists) as xa,sum(a.yellowcard) as yellow_cards,sum(a.redcard) as red_cards
from players p inner join appearances a
on p.playerid=a.playerid
where p.playerid=pid
group by p.playerid, p.name;
end //
delimiter ;

call player_stats(647);