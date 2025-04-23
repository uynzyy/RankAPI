CREATE DATABASE RankingDB;
GO
USE RankingDB;
GO

CREATE TABLE Players (
    PlayerID INT PRIMARY KEY IDENTITY(1,1),
    Username NVARCHAR(50),
    Email NVARCHAR(100),
    CreatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE GamePlays (
    PlayID INT PRIMARY KEY IDENTITY(1,1),
    PlayerID INT,
    Score INT,
    PlayedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (PlayerID) REFERENCES Players(PlayerID)
);

CREATE TABLE MonthlyRankings (
    RankingID INT PRIMARY KEY IDENTITY(1,1),
    PlayerID INT,
    Year INT,
    Month INT,
    TotalScore INT,
    Rank INT,
    FOREIGN KEY (PlayerID) REFERENCES Players(PlayerID),
    CONSTRAINT UQ_Ranking UNIQUE(PlayerID, Year, Month)
);

INSERT INTO Players (Username, Email)
VALUES 
('user01', 'user01@gmail.com'),
('user02', 'user02@gmail.com'),
('user03', 'user03@gmail.com'),
('user04', 'user04@gmail.com'),
('user05', 'user05@gmail.com'),
('user06', 'user06@gmail.com'),
('user07', 'user07@gmail.com'),
('user08', 'user08@gmail.com'),
('user09', 'user09@gmail.com'),
('user10', 'user10@gmail.com'),
('user11', 'user11@gmail.com'),
('user12', 'user12@gmail.com');

INSERT INTO GamePlays (PlayerID, Score, PlayedAt)
VALUES 
(1, 90,  '2025-01-03'),
(1, 130, '2025-01-10'),
(2, 110, '2025-01-05'),
(2, 100, '2025-01-15'),
(3, 160, '2025-01-08'),
(4, 100, '2025-01-12'),
(4, 70,  '2025-01-18');

INSERT INTO MonthlyRankings (PlayerID, Year, Month, TotalScore, Rank)
VALUES
(3, 2025, 1, 160, 1),
(1, 2025, 1, 220, 2),
(2, 2025, 1, 210, 3),
(4, 2025, 1, 170, 4);

INSERT INTO GamePlays (PlayerID, Score, PlayedAt)
VALUES 
(5, 160, '2025-02-02'),
(5, 100, '2025-02-11'),
(7, 180, '2025-02-04'),
(6, 150, '2025-02-06'),
(8, 120, '2025-02-09'),
(8, 90,  '2025-02-13');

INSERT INTO MonthlyRankings (PlayerID, Year, Month, TotalScore, Rank)
VALUES
(3, 2025, 2, 270, 1),
(1, 2025, 2, 260, 2),
(2, 2025, 2, 180, 3),
(4, 2025, 2, 90, 4);

INSERT INTO GamePlays (PlayerID, Score, PlayedAt)
VALUES 
(1, 180, '2025-03-03'),
(2, 140, '2025-03-04'),
(2, 160, '2025-03-12'),
(3, 100, '2025-03-06'),
(3, 140, '2025-03-08'),
(4, 110, '2025-03-10'),
(4, 80,  '2025-03-15');

INSERT INTO MonthlyRankings (PlayerID, Year, Month, TotalScore, Rank)
VALUES
(2, 2025, 3, 300, 1),
(1, 2025, 3, 180, 2),
(3, 2025, 3, 240, 3),
(4, 2025, 3, 190, 4);

INSERT INTO GamePlays (PlayerID, Score, PlayedAt)
VALUES 
(1, 100, '2025-04-01'),
(1, 150, '2025-04-05'),
(1, 120, '2025-04-10'),
(2, 200, '2025-04-02'),
(2, 180, '2025-04-08'),
(3, 250, '2025-04-03'),
(3, 170, '2025-04-11'),
(4, 140, '2025-04-04');

INSERT INTO MonthlyRankings (PlayerID, Year, Month, TotalScore, Rank)
VALUES
(3, 2025, 4, 420, 1),
(2, 2025, 4, 380, 2),
(1, 2025, 4, 370, 3),
(4, 2025, 4, 140, 4);
