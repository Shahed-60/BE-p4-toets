
DROP DATABASE IF EXISTS `BE-toets-335476`;


CREATE DATABASE IF NOT EXISTS `BE-toets-335476`;

Use `BE-toets-335476`;

CREATE TABLE Examen (
    Id              TINYINT           UNSIGNED            NOT NULL    AUTO_INCREMENT
    StudentId           INT,
    Rijschool           VARCHAR(40),
    Stad                VARCHAR(30),
    Rijbewijscategorie  VARCHAR(4),
    Datum               DATE,
    Uitslag             VARCHAR(20),
    IsActief            BIT                             NOT NULL    DEFAULT 1,
    Opmerkingen         VARCHAR(250)                        NULL    DEFAULT NULL,
    DatumAangemaakt     DateTime(6)                     NOT NULL,
    DatumGewijzigd      DateTime(6)                     NOT NULL
    ,CONSTRAINT      PK_Examen_Id   PRIMARY KEY CLUSTERED(Id)
)ENGINE=InnoDB;


INSERT INTO Examen (Id, 
StudentId, 
Rijschool, 
Stad, 
Rijbewijscategorie, 
Datum, Uitslag, 
IsActief, 
Opmerkingen, 
DatumAangemaakt 
,DatumGewijzigd)
VALUES 
    (1, 100234, 'VolGasVooruit', 'Rotterdam', 'B', '2023-04-03', 'Geslaagd', 1, NULL, SYSDATE(6), SYSDATE(6)),
    (2, 123432, 'InZijnVierDoorDeBocht', 'Sliedrecht', 'C', '2023-03-01', 'Geslaagd',  1, NULL, SYSDATE(6), SYSDATE(6)),
    (3, 103234, 'LinksomRechtsom', 'Dordrecht', 'D', '2023-05-15', 'Geslaagd',  1, NULL, SYSDATE(6), SYSDATE(6)),
    (4, 106452, 'OpDeVluchtStrook', 'Zwijndrecht', 'AM', '2023-05-08', 'Gezakt',  1, NULL, SYSDATE(6), SYSDATE(6)),
    (5, 104546, 'RechtDoorEnGaan', 'Rotterdam', 'B', '2023-05-17', 'Gezakt',  1, NULL, SYSDATE(6), SYSDATE(6)),
    (6, 100333, 'AltijdGeslaagd', 'Dordrecht', 'B', '2023-05-12', 'Geslaagd',  1, NULL, SYSDATE(6), SYSDATE(6)),
    (7, 124444, 'RijlesVoorJou', 'Rotterdam', 'B', '2023-04-12', 'Geslaagd',  1, NULL, SYSDATE(6), SYSDATE(6));

-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CREATE TABLE ExamenPerExaminator (
    Id              TINYINT           UNSIGNED            NOT NULL    AUTO_INCREMENT
    ExamenId        INT,
    ExaminatorId    INT,
    IsActief        BIT             NOT NULL    DEFAULT 1,
    Opmerkingen     VARCHAR(250)    NULL        DEFAULT NULL,
    DatumAangemaakt DateTime(6)     NOT NULL,
    DatumGewijzigd  DateTime(6)     NOT NULL,

    CONSTRAINT      PK_ExamenPerExaminator_Id   PRIMARY KEY CLUSTERED(Id)
    FOREIGN KEY (ExamenId) REFERENCES Examen(Id),
    FOREIGN KEY (ExaminatorId) REFERENCES Examinator(Id)
)ENGINE=InnoDB;



INSERT INTO ExamenPerExaminator (Id, ExamenId, ExaminatorId, IsActief, Opmerkingen, DatumAangemaakt ,DatumGewijzigd)
VALUES 
                                (1, 1, 3, 1, NULL, SYSDATE(6), SYSDATE(6)),
                                (2, 3, 3, 1, NULL, SYSDATE(6), SYSDATE(6)),
                                (3, 2, 2, 1, NULL, SYSDATE(6), SYSDATE(6)),
                                (4, 4, 1, 1, NULL, SYSDATE(6), SYSDATE(6)),
                                (5, 7, 3, 1, NULL, SYSDATE(6), SYSDATE(6)),
                                (6, 6, 2, 1, NULL, SYSDATE(6), SYSDATE(6)),
                                (7, 5, 4, 1, NULL, SYSDATE(6), SYSDATE(6));
-- --------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Examinator (
    Id              TINYINT         UNSIGNED        NOT NULL    AUTO_INCREMENT
    Voornaam            VARCHAR(50),
    Tussenvoegsel       VARCHAR(50),
    Achternaam          VARCHAR(50),
    Mobiel              VARCHAR(20),
    IsActief            BIT             NOT NULL    DEFAULT 1,
    Opmerkingen         VARCHAR(250)    NULL        DEFAULT NULL,
    DatumAangemaakt     DateTime(6)     NOT NULL,
    DatumGewijzigd      DateTime(6)     NOT NULL
   ,CONSTRAINT      PK_Examinator_Id   PRIMARY KEY CLUSTERED(Id)
) ENGINE=InnoDB;

INSERT INTO Examinator (Id, 
Voornaam, 
Tussenvoegsel, 
Achternaam, 
Mobiel, 
IsActief, 
Opmerkingen,
 DatumAangemaakt
  ,DatumGewijzigd) 
VALUES 
 (1, 'Manuel', 'van', 'Meekeren', '06-28493823', 1, NULL, SYSDATE(6), SYSDATE(6)),
(2, 'Lisette', 'den', 'Dongen', '06-24383299', 1, NULL, SYSDATE(6), SYSDATE(6)),
(3, 'Jurswailly', '', 'Luciano', '06-28493823', 1, NULL, SYSDATE(6), SYSDATE(6)),
(4, 'Naswha', '', 'Salawi', '06-34291219', 1, NULL, SYSDATE(6), SYSDATE(6));