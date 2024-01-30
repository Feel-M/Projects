--2.1a


create procedure createAllTables
AS

create table SystemUser(
Username varchar(20) primary key ,
password varchar(20)
);

create table System_Admin(
ID int primary key identity,
name varchar(20),
Username varchar(20) unique,
foreign key (Username) References SystemUser(Username) ON DELETE CASCADE ON UPDATE CASCADE,
);

create table club (
id int primary key identity,
name varchar(20),
location varchar(20)
);

create table Club_Representative(
id int primary key identity, 
name varchar(20),
club_ID int,
foreign key (club_ID) References club (id)ON DELETE CASCADE ON UPDATE CASCADE,
Username VARCHAR(20) unique,
foreign key (Username) References SystemUser(Username) ON DELETE CASCADE ON UPDATE CASCADE,
);

create table Sports_Association_Manager (
ID int primary key  identity,
name varchar(20),
Username varchar(20) unique,
foreign key (Username) References SystemUser(Username) ON DELETE CASCADE ON UPDATE CASCADE,
);

Create table Stadium (
ID int Primary key IDENTITY,
Name varchar(20),
location varchar(20),
Capcity int,
Status bit default 1,
);

create table Stadium_Manager (
ID int primary key IDENTITY,
Name varchar(20),
Stadium_ID INT,
foreign key (Stadium_ID) References Stadium(ID) ON DELETE CASCADE ON UPDATE CASCADE,
Username VARCHAR(20) unique,
foreign key (Username) References SystemUser(Username) ON DELETE CASCADE ON UPDATE CASCADE,
);

create table Fan (
National_ID VARCHAR (20) PRIMARY KEY ,
Name varchar (20),
Birth_date Datetime,
Address varchar (20),
Phone_NO int,
status bit default 1,
Username varchar(20) unique,
foreign key (Username) References SystemUser(Username) ON DELETE CASCADE ON UPDATE CASCADE
);


create table Match (
ID int primary key IDENTITY,
Start_time datetime,
End_time datetime,
host_Club_ID int ,
guest_Club_ID int,
foreign key (host_Club_ID) References Club(ID) ON DELETE no action ON UPDATE no action,
foreign key (guest_Club_ID) References Club(ID) ON DELETE no action ON UPDATE no action,
Stadium_ID INT
foreign key (Stadium_ID) References Stadium(ID) ON DELETE no action ON UPDATE no action,
);

create table Ticket (
ID int primary key identity,
status bit default 1,
Match_ID int,
foreign key (Match_ID) References Match(ID) ON DELETE CASCADE ON UPDATE CASCADE
);

create table Host_request(
ID int primary key identity,
Club_rep_ID int ,
foreign key (Club_rep_ID) References Club_Representative(ID) ON DELETE no action ON UPDATE no action,
stadium_manager_id int,
foreign key (stadium_manager_id) References Stadium_Manager(ID) ON DELETE no action ON UPDATE no action,
match_ID int ,
foreign key (match_id) References Match(ID) ON DELETE no action ON UPDATE no action,
status VARCHAR(20),
Username VARCHAR(20),
);

create table Ticket_buying_transactions(
fan_national_ID VARCHAR(20),
ticket_ID int,
foreign key(fan_national_ID) References Fan ON DELETE CASCADE ON UPDATE CASCADE,
foreign key(ticket_ID) References Ticket ON DELETE CASCADE ON UPDATE CASCADE
);
GO

--2.1 B
CREATE PROCEDURE dropAllTables
AS
DROP TABLE  System_Admin
DROP TABLE  Sports_Association_Manager
DROP TABLE Ticket_buying_transactions
DROP TABLE  Ticket
DROP TABLE  Host_request
DROP TABLE  Match
DROP TABLE  Fan
DROP TABLE  Club_Representative
DROP TABLE  club
DROP TABLE  Stadium_Manager
DROP TABLE  Stadium
DROP TABLE  SystemUser
GO


--2.1 c
CREATE PROCEDURE dropAllProceduresFunctionsViews
AS
DROP PROCEDURE IF EXISTS 
dbo.createAllTables,dbo.dropAllTables,dbo.clearAllTables,
dbo.addAssociationManager,dbo.addNewMatch,dbo.deleteMatch,
dbo.deleteMatchesOnStadium,dbo.addClub,dbo.addTicket,
dbo.deleteClub,dbo.addStadium,dbo.deleteStadium,
dbo.blockFan,dbo.unblockFan,dbo.addRepresentative,
dbo.addHostRequest,dbo.addStadiumManager,dbo.acceptRequest,
dbo.rejectRequest,dbo.addFan,dbo.purchaseTicket,dbo.updateMatchHost,dbo.deleteMatchesOnStadium;
GO

DROP VIEW IF EXISTS dbo.allAssocManagers,dbo.allClubRepresentatives,dbo.allStadiumManagers,
dbo.allFans,dbo.allMatches,dbo.allTickets,
dbo.allCLubs,dbo.allStadiums,dbo.allRequests,
dbo.clubsWithNoMatches;
GO  

DROP FUNCTION IF EXISTS viewAvailableStadiumsOn,allUnassignedMatches,allPendingRequests,upcomingMatchesOfClub,
availableMatchesToAttend,clubsNeverPlayed,matchWithHighestAttendance,
matchesRankedByAttendance,requestsFromClub;
GO

--2.1 D
CREATE PROCEDURE clearAllTables
AS
Delete from Match
Delete from Stadium
Delete from Stadium_Manager
Delete from Ticket_buying_transactions 
Delete from Ticket
Delete from Fan
Delete from club
Delete from Host_request
Delete from Club_Representative
Delete from System_Admin
Delete from Sports_Association_Manager
Delete from SystemUser
go

--2.2a
create VIEW allAssocManagers AS 
SELECT sa.Username, SU.password, sa.name  FROM Sports_Association_Manager sa inner join SystemUser SU on sa.Username = SU.Username;
GO

--2.2b
create VIEW allClubRepresentatives AS
SELECT  cr.Username,SU.password, cr.Name AS Club_Representative_name, c.name AS Club_name from Club_Representative cr inner join 
club c on c.id= cr.club_ID
inner join SystemUser SU on cr.Username = SU.Username
where cr.club_ID= c.id
GO

--2.2c
create view allStadiumManagers AS
SELECT sm.username as Staduim_manager_username, sm.Name AS Staduim_manager_name, s.name AS Staduim_name , su.password
from Stadium_Manager sm, Stadium s, SystemUser su
go


--2.2d
create view allFans AS 
select f.Username, SU.password,f.name, f.National_id, f.birth_date, f.status 
from Fan f inner join  SystemUser SU on f.Username = SU.Username
GO

--2.2e
create view allMatches 
as
select c1.name AS host_club, c2.name AS guest_club, s.Name, s.location
FROM club c1, club c2, Match m, Stadium s, ticket t
WHERE c1.id = m.host_Club_ID AND c2.id= m.guest_Club_ID and m.Stadium_ID = s.ID and t.status = 1
GO


create proc all_matches 
@starttime datetime
as
select c1.name AS host_club, c2.name AS guest_club, s.Name, s.location
FROM club c1, club c2, Match m, Stadium s, ticket t
WHERE c1.id = m.host_Club_ID AND c2.id= m.guest_Club_ID and m.Stadium_ID = s.ID and 
t.status = 1 and m.Start_time=@starttime
GO

go
--2.2f
create view allTickets AS
select c1.name AS host_club, c2.name AS guest_club, s.name AS Stadium_name, m.Start_time
FROM club c1, club c2, Match m, Ticket t, Stadium s
WHERE c1.id = m.host_Club_ID AND c2.id = m.guest_Club_ID and t.Match_ID = m.ID AND m.Stadium_ID =s.ID
GO

--2.2g
create view allCLubs AS
SELECT c.name, c.location FROM club c
GO

--2.2h
create view allStadiums AS 
select s.name, s.location, s.Capcity, s.status 
from Stadium s
go
select *from allStadiums
go

create proc allstadiums_m
@sm_username varchar(20)
as
select s.name, s.location, s.Capcity, s.status 
from Stadium s , Stadium_Manager sm  
where sm.Username=@sm_username
GO


--2.2I
create view allRequests AS
SELECT cr.name as cr_name, c1.name as host_club_name ,c1.name as guest_club_name, 
m.Start_time, m.end_time, hr.status from Host_request hr
inner join Club_Representative cr on cr.id=hr.Club_rep_ID
inner join club c1 on c1.id=cr.club_ID
inner join club  c2 on c1.id=c2.id 
inner join match m on m.host_Club_ID = c1.id and m.guest_Club_ID=c2.id
where m.Start_time<GETDATE();
GO





--2.3.1
create procedure addAssociationManager
@name VARCHAR(20),
@user_name VARCHAR(20),
@password VARCHAR(20)
AS 
insert into SystemUser values(@user_name,@password);
INSERT INTO  Sports_Association_Manager (name, username) VALUES (@name, @user_name);
GO

--2.3.2
create procedure addNewMatch
@Host_Club_Name VARCHAR(20),
@Guest_club_name VARCHAR(20),
@Start_time DATETIME,
@end_time DATETIME
AS 
DECLARE @h_id int
DECLARE @g_id int
SELECT @h_id= c1.id,  @g_id=c2.id FROM club c1 inner join club c2 on c1.id <>c2.id
where  @Host_Club_Name =  c1.name and  @Guest_club_name =  c2.name
INSERT INTO Match (Start_time ,End_time,host_Club_ID,guest_Club_ID) VALUES (@Start_time,@end_time,@h_id,@g_id)
GO


--2.3.3
Create view clubsWithNoMatches
AS 
Select c.name from club c WHERE c.id not in
( SELECT c1.id from club c1 inner join match m1 on (c1.id = m1.host_Club_ID) or (c1.id = m1.guest_Club_ID ))
GO

--2.2.4
create procedure deleteMatch
@Host_Club_Name VARCHAR(20),
@Guest_club_name VARCHAR(20),
@Start_time DATETIME,
@end_time DATETIME
AS 
DECLARE @h_id int
SELECT @h_id= c.id FROM club c where  @Host_Club_Name =  c.name
DECLARE @g_id int
SELECT @g_id = c.id FROM club c where  @Guest_club_name =  c.name
declare @m_id int
select @m_id =m.ID from match m where m.End_time=@end_time and m.Start_time=@Start_time and m.host_Club_ID=@h_id and m.guest_Club_ID=@g_id
update Ticket
set Match_ID =null where Match_ID=@m_id
update Host_request
set match_ID =null
where match_ID=@m_id
delete from Match where Start_time = @Start_time AND
End_time = @end_time AND
host_Club_ID= @h_id AND
guest_Club_ID= @g_id
GO

--2.3.5 
create PROCEDURE deleteMatchesOnStadium 
@StadiumName VARCHAR(20)
AS   
declare @S_id int
select @S_id =s.ID from Stadium s where s.Name=@StadiumName 
declare @m_id int
select @m_id =m.ID from Match m where m.Stadium_ID= @S_id
update Ticket
set Match_ID =null where Match_ID=@m_id
update Host_request
set match_ID =null
where match_ID=@m_id 
delete from match where Stadium_ID=@S_id and Start_time>GETDATE()
GO

--2.3.6
create procedure addClub
@Club_name  VARCHAR(20),
@club_location VARCHAR(20)
AS 
Insert into club (name, location) VALUES (@Club_name, @club_location)
GO

--2.3.7
create procedure addTicket
@Host_Club_Name VARCHAR(20),
@Guest_club_name VARCHAR(20),
@start_time datetime
as
DECLARE @h_id int
SELECT @h_id= c.id FROM club c where  @Host_Club_Name =  c.name
DECLARE @g_id int
SELECT @g_id = c.id FROM club c where  @Guest_club_name =  c.name

declare @m_id int
select @m_id=m.ID from match m where m.host_Club_ID=@h_id and m.guest_Club_ID=@g_id and m.Start_time=@start_time
insert into Ticket(Match_ID) values (@m_id)
GO

--2.3.8
create procedure deleteClub
@club_name VARCHAR(20)
AS
declare @club_id int
select @club_id =c.id from club c where c.name=@club_name

update match
set host_Club_ID=null
where host_Club_ID=@club_id
update match
set guest_Club_ID=null
where guest_Club_ID=@club_id
update Club_Representative
set club_ID=null
where club_ID=@club_id
DELETE FROM club WHERE name = @club_name
GO


--2.3.9
create procedure addStadium
@stadium_name VARCHAR(20),
@Stadium_location VARCHAR(20),
@Stadium_capacity INT
AS 
INSERT INTO Stadium (Name, location, Capcity) VALUES (@stadium_name, @Stadium_location, @Stadium_capacity)
GO

--2.3.10
Create procedure deleteStadium
@name VARCHAR(20)
AS 
 declare @s_id int
select @s_id =s.ID from Stadium s where s.Name=@name
update match 
set Stadium_ID=null
where Stadium_ID=@s_id
DELETE FROM Stadium WHERE Name = @name
GO

--2.3.11
create procedure blockFan 
@id VARCHAR(20)
AS 
UPDATE Fan 
SET status = 0 WHERE National_ID = @id
GO

--2.3.12
create procedure unblockFan 
@id VARCHAR(20)
AS 
UPDATE Fan 
SET status = 1 WHERE National_ID = @id
GO

--2.3.13
create procedure addRepresentative
@Rep_name VARCHAR(20),
@Club_name varchar(20),
@R_User_name varchar(20),
@password varchar(20)
AS 
DECLARE @c_id int
select @c_id= c.id from club c where c.name=@Club_name

insert into systemUser values(@R_User_name,@password);
INSERT INTO Club_Representative  (name,club_ID,Username) VALUES (@Rep_name,@c_id,@R_User_name);
GO


--2.3.14
create function viewAvailableStadiumsOn 
(@time datetime)
returns Table AS
return  
select s.name , s.location, s.Capcity from Stadium s  inner join Match m on s.ID = m.Stadium_ID where Status = 1 AND m.Start_time <> @time; 
GO

--2.3.15
create procedure addHostRequest
@club_name varchar(20),
@stadium_name varchar(20),
@clubRep_username varchar(20),
@start_time datetime
as
declare @c_id int
select @c_id=c.id from club c where c.name=@club_name

declare @r_id int
select @r_id =cr.id from Club_Representative cr where cr.club_ID=@c_id

declare @s_id int
select @s_id=s.ID from Stadium s where s.Name=@stadium_name

declare @sm_id int
select @sm_id =sm.ID from Stadium_Manager sm where sm.Stadium_ID=@s_id

declare @m_id int
select @m_id =m.ID from match m , Club_Representative cr where 
m.Start_time=@start_time and cr.Username = @clubRep_username
insert into Host_Request (Club_rep_ID,match_ID) values (@r_id,@m_id)
GO


--2.3.16
create function allUnassignedMatches
(@club_name VARCHAR(20))
returns @UnassignedMatches  Table (Guest_name VARCHAR(20) ,startTime datetime)
as
begin
declare @c_id int
select @c_id=c.id from club c where c.name=@club_name
insert into  @UnassignedMatches 
select c.name,m.Start_time from club c ,Match m
--inner join match m on m.ID=@c_id
where m.host_Club_ID=@c_id and m.Stadium_ID=null
return
end
GO

--2.3.17
create procedure addStadiumManager
@name VARCHAR(20),
@s_name VARCHAR(20),
@userName VARCHAR(20),
@password VARCHAR(20)
AS
 Declare @s_ID int
 select s.ID from Stadium s 
 where s.Name=@s_name
insert into systemUser values(@userName,@password)
INSERT INTO Stadium_Manager  (Name,Stadium_ID,Username) VALUES (@name,@s_ID,@userName);
 GO
 
 --2.3.18
 create function allPendingRequests
(
@manager_userName VARCHAR(20)
)
returns @all_pending_requests table (club_rep VARCHAR(20),
guest_name VARCHAR(20),start_time VARCHAR(20)) as
BEGIN
insert into @all_pending_requests
select C_REP.name as club_rep_name , c.name as guest_club_name , m.start_time
from Host_request hr
inner join Club_Representative C_REP on HR.Club_rep_ID = C_REP.id AND hr.Username = @manager_userName AND hr.status = 'not handled' 
inner join club c  on c.ID = C_REP.club_ID
inner join match m on m.guest_Club_ID = c.id
where hr.status = 'not handled' 
AND hr.Username = @manager_userName
return
END
GO

--2.3.19
create procedure acceptRequest
@Stadium_manager_username varchar(20),
@guest_club_name varchar(20),
@host_club_name varchar(20),
@start_time varchar(30) 
as
declare @sm_id int
select @sm_id = sm.id from Stadium_Manager sm where sm.Username=@Stadium_manager_username

declare @s_id int
declare @capcity int
select @s_id = sm.ID from Stadium_Manager sm  inner join Stadium s on s.ID = sm.Stadium_ID and @capcity = s.Capcity
where @Stadium_manager_username=sm.Username and s.ID=@s_id

declare @g_id int
select @g_id =c1.id from club c1 where @guest_club_name=c1.name

declare @h_id int
declare @m_id int
select @h_id =c2.id from club c2 inner join match m on c2.id =m.host_Club_ID and @m_id=m.ID
where @host_club_name=c2.name and m.Start_time=@start_time and m.host_Club_ID=@h_id and m.guest_Club_ID = @g_id

declare @cr2_id int
select @cr2_id=cr2.id from Club_Representative cr2 
where @h_id=cr2.club_ID

update Host_request 
set status = 'accepted'
where match_ID=@m_id and stadium_manager_id =@s_id and Club_rep_ID=@cr2_id 
update match
set match.Stadium_ID=@s_id

declare @x int
SET @x = 0
while @x <= @capcity
exec addTicket @Host_Club_Name, 
@Guest_club_name ,
@start_time
set @x = @x+1
go

--2.3.20
create procedure rejectRequest
@Stadium_manager_username varchar(20),
@guest_club_name varchar(20),
@host_club_name varchar(20),
@start_time datetime 
as
declare @sm_id int
select @sm_id = sm.id from Stadium_Manager sm where sm.Username=@Stadium_manager_username

declare @s_id int
select @s_id = sm.ID from Stadium_Manager sm where @Stadium_manager_username=sm.Username

declare @g_id int
select @g_id =c1.id from club c1 where @guest_club_name=c1.name

declare @h_id int
select @h_id =c2.id from club c2 where @host_club_name=c2.name

declare @m_id int
select @m_id=m.ID from match m where m.Start_time=@start_time and m.host_Club_ID=@h_id and m.guest_Club_ID = @g_id

declare @cr2_id int
select @cr2_id=cr2.id from Club_Representative cr2 where @h_id=cr2.club_ID

declare @capcity int
select @capcity =s.Capcity from stadium s where s.ID=@s_id

declare @cr1_id int
select @cr1_id=cr1.id from Club_Representative cr1 where @g_id=cr1.club_ID

update Host_request 
set status = 'rejected'
where match_ID=@m_id and stadium_manager_id =@s_id and Club_rep_ID=@cr2_id 
update match
set match.Stadium_ID= NULL
go


--2.3.21
create procedure addFan
@name  VARCHAR(20),
@username VARCHAR(20),
@password VARCHAR(20),
@N_id VARCHAR(20),
@birthdate Datetime,
@Address VARCHAR(20),
@phoneNumber int
AS
select password from SystemUser SU  inner join Fan F ON SU.Username = F.Username
insert into systemUser values(@username,@password);
insert into Fan (Name,Username,National_ID,Birth_date,Address,Phone_NO)
values (@name,@username,@N_id,@birthdate,@Address,@phoneNumber)
 GO

 
--2.3.22

 --3.3.23
CREATE FUNCTION availableMatchesToAttend
(@start DATETIME)
RETURNS TABLE
AS
return (
SELECT  Host_Club.name AS 'Host_Club_Name', Guest_Club.name AS 'Guest_Club_Name', s.name AS 'Stadium', Match.Start_time AS 'Start_Time'
FROM Match 
INNER JOIN Club Host_Club ON Match.host_club_id = Host_Club.id
INNER JOIN Club Guest_Club ON Match.guest_club_id = Guest_Club.id
INNER JOIN Stadium s on s.ID = Match.Stadium_ID
INNER JOIN Ticket t on t.Match_ID = Match.ID
WHERE T.status = 1 AND Match.Start_time = @start
GROUP BY Host_Club.name,Guest_Club.name,s.name, Match.Start_time)
go

--2.3.24
create procedure purchaseTicket
@national_id varchar(20),
@guest_name varchar (20),
@host_name varchar(20),
@start_time varchar(20)
as
declare @h_id int
select @h_id =c.id from club c where c.name=@host_name

declare @g_id int
select @g_id=c.id from club c where c.name=@guest_name

declare @m_id int
select @m_id=m.ID from match m where @h_id=m.host_Club_ID and m.guest_Club_ID=@g_id and Start_time=@start_time

update ticket
set status = 0
where Match_ID=@m_id

declare @Ticket_id int
select @Ticket_id=t.id from Ticket t where Match_ID=@m_id

insert into Ticket_buying_transactions(fan_national_ID,ticket_ID) values (@national_id,@Ticket_id)

go


--2.3.25
create procedure updateMatchHost 
@host_club_name varchar(20),
@guest_club_name varchar(20),
@Start_time datetime
as
declare @h_id int
select @h_id =c.id from club c where c.name=@host_club_name

declare @g_id int
select @g_id =c.id from club c where c.name=@guest_club_name

update Match
set host_Club_ID= @g_id ,guest_Club_ID=@h_id
where Start_time=@Start_time
GO

--2.3.26
create view matchesPerTeam
as
select c.name ,COUNT(DISTINCT m.ID) Matches_count from club c inner join match m on c.id = m.guest_Club_ID or c.id = m.host_Club_ID
where(c.id =m.guest_Club_ID or c.id=m.host_Club_ID)
and m.Start_time < GETDATE()
GROUP BY C.name
GO

--2.3.27
CREATE VIEW clubsNeverMatched AS
SELECT c1.name as host_name ,c2.name as guest_name from club c1, club c2
WHERE c1.id < c2.id AND not exists 
( SELECT c1.id from club c1 inner join match m1
on (c1.id = m1.host_Club_ID and c2.id = m1.guest_club_id) or (c1.id = m1.guest_Club_ID and c2.id = m1.host_club_id ))
GO

--2.3.28
create function clubsNeverPlayed (
@clubName varchar(20)
)
returns table as
return
SELECT c1.name as host_name , c2.name as Guest_name , start_time
FROM club c1, club c2, Match
WHERE 
(Match.host_Club_ID = c1.id and Match.guest_Club_ID =c2.id  ) or (Match.guest_Club_ID=c1.id and Match.host_Club_ID=c2.id) and start_time < CURRENT_TIMESTAMP;
GO

--2.3.29
CREATE FUNCTION matchWithHighestAttendance()
RETURNS TABLE
AS
return 
SELECT TOP 1 Host_Club.name AS 'Host_Club_Name', Guest_Club.name AS 'Guest_Club_Name', COUNT(DISTINCT Ticket.ID) TicketCount
FROM Match 
INNER JOIN Club Host_Club ON Match.host_club_id = Host_Club.id
INNER JOIN Club Guest_Club ON Match.guest_club_id = Guest_Club.id
INNER JOIN Ticket ON Match.id = Ticket.Match_ID
INNER JOIN Ticket_buying_transactions ON Ticket.ID = Ticket_buying_transactions.ticket_ID
GROUP BY Host_Club.name, Guest_Club.name
ORDER BY COUNT(DISTINCT Ticket.ID) 
GO

--2.3.30
CREATE FUNCTION matchesRankedByAttendance()
RETURNS TABLE
AS
return 
SELECT TOP 100 PERCENT Host_Club.name AS 'Host_Club_Name', Guest_Club.name AS 'Guest_Club_Name', COUNT(DISTINCT Ticket.ID) TicketCount
FROM Match 
INNER JOIN Club Host_Club ON Match.host_club_id = Host_Club.id
INNER JOIN Club Guest_Club ON Match.guest_club_id = Guest_Club.id
INNER JOIN Ticket ON Match.id = Ticket.Match_ID
INNER JOIN Ticket_buying_transactions ON Ticket.ID = Ticket_buying_transactions.ticket_ID
GROUP BY Host_Club.name, Guest_Club.name
ORDER BY COUNT(DISTINCT Ticket.ID) DESC
GO

--2.3.31
CREATE FUNCTION requestsFromClub (@Stadium_name VARCHAR(20),@Club_name VARCHAR(20))
RETURNS TABLE
AS
return
SELECT  TOP 100 PERCENT Host_Club.name AS 'Host_Club_Name', Guest_Club.name AS 'Guest_Club_Name'
FROM Match 
INNER JOIN Club Host_Club ON Match.host_club_id = Host_Club.id
INNER JOIN Club Guest_Club ON Match.guest_club_id = Guest_Club.id
INNER JOIN Club_Representative CR ON Host_Club.id = CR.club_ID
INNER JOIN Host_request  HR on Host_Club.id = HR.Club_rep_ID
INNER JOIN Stadium S ON Match.Stadium_ID = S.ID
WHERE s.Name = @Stadium_name AND cr.id = (SELECT CR.id FROM Club_Representative INNER JOIN club ON CR.club_ID = club.id WHERE club.name = @Club_name)
GROUP BY Host_Club.name, Guest_Club.name
go



--32
create proc login 
@username varchar(80),
@password varchar(80),
@type varchar(80) output
as
if(@username in (select f.username from Fan f) 
and @password in (select SU.password from SystemUser SU))
set @type= 'fan' 

else if (@username in( select Sm.Username from Stadium_Manager Sm) 
and @password in (select SU.password from SystemUser SU))
set @type = 'stadium manager'

else if (@username in (select Cr.Username from Club_Representative cr) 
and @password in (select SU.password from SystemUser SU))
set @type = 'club representatives'

else if (@username in(select SAM.Username from Sports_Association_Manager SAM) 
and @password in (select SU.password from SystemUser SU))
set @type = 'sports association manager'

else if (@username in(select SA.username from System_Admin SA) 
and @password in (select SU.password from SystemUser SU))
set @type = 'System Admin'
select @type 
go
drop proc login
declare @type varchar(80)
exec  login 'samanager1' ,'samanager1',@type
go

go
create proc checkF_usernaame
@f_username varchar(30),
@check varchar(30) output
as
if (@f_username in(select f.Username from fan f ))
set @check = 'false'
else if(@f_username not in(select f.Username from fan f) )
set @check = 'true'
go

create proc check_n_id
@n_id varchar(30),
@checkid varchar(30) output
as
if (@n_id in(select f.National_ID from fan f ))
set @checkid = 'false'
else if (@n_id not in(select f.National_ID from fan f) )
set @checkid = 'true'
go

create proc check_n_id
@n_id varchar(30),
@checkid varchar(30) output
as
if (@n_id in(select f.National_ID from fan f ))
set @checkid = 'false'
else if (@n_id not in(select f.National_ID from fan f) )
set @checkid = 'true'
go

create proc checkCR_username
@cr_username varchar(20),
@check varchar(20) output
as
if (@cr_username in(select cr.Username from Club_Representative cr))
set @check = 'false'
else if (@cr_username not in(select cr.Username from Club_Representative cr) )
set @check = 'true'
go



create proc checksm_username
@sm_username varchar(20),
@check varchar (20) output
as
if (@sm_username in(select sm.Username from Stadium_Manager sm))
set @check = 'false'
else if (@sm_username not in(select sm.Username from Stadium_Manager sm) )
set @check = 'true'
go





create proc checksam_username
@sam_username varchar(20),
@check varchar (20) output
as
if (@sam_username in(select sam.Username from Sports_Association_Manager sam))
set @check = 'false'
else if (@sam_username not in(select sam.Username from Sports_Association_Manager sam) )
set @check = 'true'
go



--33
create proc getN_ID
@username varchar(20),
@password varchar(20),
@n_id varchar(30) output
as
declare @n varchar(30)
select f.National_ID  from fan f
where f.Username =@username
set @n_id=@n
go
create view info_club 
as
select c.name , c.id, c.location
from club c , Club_Representative cr
where c.id=cr.club_ID
go

create proc club_info
@clubrep_id int
as
select c.name , c.id, c.location
from club c , Club_Representative cr
where c.id=cr.club_ID and cr.id = @clubrep_id
go

create proc available_stadiums
@date datetime
as
select s.Name, s.location, s.Capcity 
from Stadium s , match m
where m.Stadium_ID=s.ID and m.Start_time=@date and s.Status=1
go


create procedure pend
@sm_username varchar(20)
as
select cr.name as club_representitve_name ,c1.name as host_club_name ,c2.name as guest_club_name ,m.Start_time as start_time ,m.End_time as end_time ,r.status as  status
from Club_Representative cr,Host_request r,Stadium_Manager sm,  club c1, club c2, Match m
where sm.Username = @sm_username and cr.id=r.Club_rep_ID and c1.id=m.host_Club_ID 
and  c2.id=m.guest_Club_ID and r.stadium_manager_id=sm.ID
go




  create function upcomingMatchesOfClub
(@clubName varchar(20))
 returns table as 
return(
select Host_Club.name as host_club_name ,Guest_Club.name as guest_club_name, m.start_time, s.name as stadium_name 
from Match m inner join 
club Host_Club  on Host_Club.name =@clubName AND m.host_Club_ID = Host_Club.id
inner join club Guest_Club on m.guest_Club_ID = Guest_Club.id
inner join Stadium s on s.ID =  m.Stadium_ID 
where m.start_time > CURRENT_TIMESTAMP and Host_Club.name =@clubName or Guest_Club.name = @clubName
and Host_Club.name = @clubName 
)
GO


CREATE PROC UP_matches
 @club_name varchar(20),
 @clubrep_username varchar(20)
 as
 select c1.name as host_club ,c2.name as guest_club, m.start_time,m.End_time,s.name as stadium_name
 from match m
 inner join club c1 on c1.id=m.host_Club_ID
 inner join club c2 on c2.id=m.guest_Club_ID
 inner join stadium s on m.Stadium_ID=s.ID
 where m.Start_time>CURRENT_TIMESTAMP and @club_name=c1.name or  @club_name=c2.name and s.Status= 1
 go

 CREATE VIEW playedMatches AS
select c1.name AS host_club, c2.name AS guest_club, m.Start_time, m.End_time
FROM club c1, club c2, Match m
WHERE c1.id = m.host_Club_ID AND c2.id= m.guest_Club_ID AND Start_time < CURRENT_TIMESTAMP
GO

CREATE VIEW upcomingMatches AS
select c1.name AS host_club, c2.name AS guest_club, m.Start_time, m.End_time
FROM club c1, club c2, Match m
WHERE c1.id = m.host_Club_ID AND c2.id= m.guest_Club_ID	AND Start_time > CURRENT_TIMESTAMP
GO

create procedure addSystemAdmin 
@user_name VARCHAR(20),
@password VARCHAR(20),
@name VARCHAR(20)

AS 
insert into SystemUser values(@user_name,@password);
INSERT INTO  System_Admin (name, username) VALUES (@name, @user_name);
GO
EXEC addSystemAdmin 'sa','password','SysAdmin'

