--drop the database if it exists
if db_id('disk_inventory') is not null
	drop database disk_inventory;

--create the database
create database disk_inventory;

--use the database
use disk_inventory;

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
	genre	varchar(15) not null,
	release_date	varchar(100) not null,
	disk_type	varchar(15) not null,
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
	returned_date	date	not null,
	borrower_ID	int	not null	references BorrowerInfo(borrower_ID),
	disk_ID	int	not null	references Disk(disk_ID)
);

-- insert data into the tables
--to be added later