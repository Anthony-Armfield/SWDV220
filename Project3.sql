-- marking changes from project 2 to allow for correct insertions

--drop the database if it exists
if db_id('disk_inventory') is not null
	drop database disk_inventory
go

--create the database
create database disk_inventory
go

--use the database
use disk_inventory
go

-- create the tables
create table Status
(
	status_ID	int	not null	identity	primary key,
	status	varchar(15)	not null
);
create table Disk
(
	disk_ID	int	not null	identity	primary key,
	disk_name	varchar(100) not null	unique,
	genre	varchar(100) not null,
	release_date	date not null,								-- changing this data type to date
	disk_type	varchar(100) not null,
	status_ID	int not null	references Status(status_ID)
);
create table ArtistInfo
(
	artist_ID	int	not null	identity	primary key,
	artist_name	varchar(100)	not null	unique,
	artist_type	varchar(15)	not null
);
create table DiskHasArtist
(
	disk_has_artist_ID	int	not null	identity	primary key,	-- created a PK for the disk has artist table
	disk_ID	int not null	references Disk(disk_ID),
	artist_ID	int	not null	references ArtistInfo(artist_ID)
);
create table BorrowerInfo
(
	borrower_ID	int	not null	identity	primary key,
	borrower_first_name	varchar(100)	not null,
	borrower_last_name	varchar(100)	not null,
	borrower_phone_number	varchar(14)	not null
);
create table DiskHasBorrower
(
	borrowed_session_ID	int	not null	identity	primary key,
	borrowed_date	date	not null,
	returned_date	date,											--marked returned_date to allow null
	borrower_ID	int	not null	references BorrowerInfo(borrower_ID),
	disk_ID	int	not null	references Disk(disk_ID)
);


-- end of adjustments



-- insert data into the tables

-- use the database
use disk_inventory
go

-- Insert into the status table
insert into Status
	(
		status
	)
	values
		('Borrowed'), 
		('In Inventory');

--insert into the Disk table
insert into Disk
	(
		disk_name,
		genre,
		release_date,
		disk_type,
		status_ID
	)
	values
		('POST-','Punk Rock','20280202','CD', 2),
		('Ephorize', 'Hip Hop', '20280205', 'CD', 2),
		('Avatar Country', 'Groove Metal', '20280222', 'CD', 2),
		('Wrong Creatures', 'Metal', '20280222', 'CD', 2),
		('Vale', 'Glam Metal', '20280222', 'CD', 2),
		('Blue Madonna', 'Pop', '20280222', 'CD', 2),
		('What Happens Next', 'Instrumental Rock', '20280222', 'CD', 2),
		('Country Music Made Me Do It', 'Country', '20280222', 'CD', 2),
		('Underworld', 'Alternative Rock', '20280222', 'CD', 1),
		('Pounding the Pavement', 'Heavy Metal', '20280229', 'CD', 2),
		('Mania', 'Pop Rock', '20280229', 'CD', 2),
		('Culture II', 'Hip Hop', '20280229', 'CD', 2),
		('Future', 'Future House', '20280209', 'CD', 2),
		('Day69', 'Trap', '20280223', 'CD', 2),
		('Bobby Tarantino II', 'Hip Hop', '20280309', 'CD', 2),
		('Seasons Change', 'Country', '20280326', 'CD', 2),
		('Boarding House Reach', 'Blues Rock', '20280323', 'CD', 1),
		('Lost & Found', 'Country', '20280328', 'CD', 2),
		('Virtue', 'Neo-psychodelia', '20280330', 'CD', 2),
		('Where''s the Drop?', 'Classical', '20280330', 'CD', 2);

-- insert into the ArtistInfo table
insert into ArtistInfo
	(
		artist_name,
		artist_type
	)
	values
		('Jeff Rosenstock', 'Solo'),
		('Cupcakke', 'Solo'),
		('Avatar', 'Band'),
		('Black Rebel Motorcycle Club', 'Band'),
		('Black Veil Brides', 'Band'),
		('Borns', 'Band'),
		('Jow Satriani', 'Solo'),
		('Meghan Patrick', 'Solo'),
		('Tonight Alive', 'Band'),
		('Anvil', 'Band'),
		('Fall Out Boy', 'Band'),
		('Migos', 'Band'),
		('Don Diablo', 'Solo'),
		('6ix9ine', 'Solo'),
		('Logic', 'Solo'),
		('Scotty McCreery', 'Solo'),
		('Jack White', 'Solo'),
		('Troy Cassar-Daley', 'Solo'),
		('The Voidz', 'Band'),
		('Deadmau5', 'Solo');

--insert into the DiskHasArtist table
insert into DiskHasArtist
	(
		disk_ID,
		artist_ID
	)
	values
		(1, 1),
		(2, 2),
		(2, 3),
		(3, 4),
		(4, 4),
		(5, 5),
		(6, 6),
		(7, 7),
		(8, 8),
		(9, 8),
		(10, 9),
		(11, 10),
		(12, 12),
		(13, 13),
		(14, 14),
		(15, 15),
		(15, 11),
		(16, 16),
		(17, 17),
		(18, 18),
		(19, 19),
		(20, 20);

-- insert into the BorrowerInfo table
insert into BorrowerInfo
	(
		borrower_first_name,
		borrower_last_name,
		borrower_phone_number
	)
	values
		('Anthony', 'Armfield', '208-539-7916'),
		('Stephanie', 'Armfield', '208-421-7752'),
		('Mike', 'Larsen', '208-546-7845'),
		('Mike', 'Mitchell', '208-565-3256'),
		('Melissa', 'Mitchell', '208-325-6647'),
		('Mike', 'Parker', '208-784-5623'),
		('Genee', 'Parker', '208-784-3265'),
		('John', 'Baldauf', '208-342-2201'),
		('Brandon', 'Walters', '208-924-7619'),
		('Carolyn', 'Osario', '208-924-4612'),
		('Carry', 'Carmody', '208-924-8523'),
		('Sherriel', 'Cavelli', '208-433-8666'),
		('Brock', 'Tincher', '208-432-6598'),
		('Elizabeth', 'Tincher', '208-432-6599'),
		('Lori', 'Dickson', '208-528-8857'),
		('Howard', 'Dickson', '208-528-8858'),
		('Becky', 'Vasquez', '208-423-5497'),
		('Brooke', 'Vasquez', '208-423-5492'),
		('Todd', 'Cheney', '208-830-8730'),
		('Jeff', 'Powell', '208-697-1345'),
		('Jenny', 'Powell', '208-697-1345'),
		('Stephanie', 'Powell', '208-697-2357');

--Insert into the DiskHasBorrower table
insert into DiskHasBorrower
	(
		borrowed_date,
		returned_date,
		borrower_ID,
		disk_ID
	)
	values
		('10-10-2018', '10-14-2018', 1, 1),
		('10-10-2018', '10-14-2018', 1, 2),
		('10-10-2018', '10-14-2018', 4, 1),
		('10-10-2018', '10-11-2018', 3, 3),
		('10-10-2018', '10-14-2018', 5, 4),
		('10-10-2018', '10-14-2018', 6, 5),
		('10-10-2018', '10-14-2018', 7, 6),
		('10-10-2018', '10-14-2018', 8, 7),
		('10-10-2018', '10-14-2018', 9, 8),
		('10-10-2018', NULL, 10, 9),
		('10-10-2018', '10-14-2018', 11, 10),
		('10-10-2018', '10-14-2018', 12, 11),
		('10-10-2018', '10-14-2018', 13, 12),
		('10-10-2018', '10-14-2018', 14, 13),
		('10-10-2018', '10-14-2018', 15, 14),
		('10-10-2018', '10-14-2018', 16, 15),
		('10-10-2018', NULL, 17, 17),
		('10-12-2018', '10-14-2018', 3, 3),
		('10-10-2018', '10-14-2018', 18, 18),
		('10-10-2018', '10-14-2018', 20, 19),
		('10-10-2018', '10-14-2018', 21, 20);


--Additional Queries!!!

--Query to list all disks that have not been returned
select borrower_ID as 'Borrower ID', disk_ID as 'Disk ID', borrowed_date as 'Borrowed Date', returned_date as 'Return Date' from DiskHasBorrower
where returned_date is null

-- updating 1 row with a where clause in the Disk table
update Disk
set genre = 'Country'
where disk_ID = 12

-- deleting 1 row using the where clause from the borrower table
delete from BorrowerInfo
where borrower_ID = 22