-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1:3306
-- Létrehozás ideje: 2024. Már 05. 08:40
-- Kiszolgáló verziója: 8.0.31
-- PHP verzió: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `kinai2`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `etelek`
--

DROP TABLE IF EXISTS `etelek`;
CREATE TABLE IF NOT EXISTS `etelek` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nev` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci DEFAULT NULL,
  `meret` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `Leiras` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci NOT NULL,
  `Ar` double DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Leírás` (`Leiras`),
  UNIQUE KEY `Nev` (`Nev`,`meret`,`Ar`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `etelek`
--

INSERT INTO `etelek` (`ID`, `Nev`, `meret`, `Leiras`, `Ar`) VALUES
(1, 'Illatos omlós kacsahús', 'kicsi adag', 'frissen készített kacsahús', 1080),
(2, 'Csirke szecsuani módra', 'kicsi adag', 'frissen készített csirke szecsuani módra', 1080),
(3, 'Hagymás csirkehús', 'kicsi adag', 'frissen készített hagymás csirkehús', 1080),
(4, 'Zöldséges csirkehús', 'kicsi adag', 'frissen készített zöldséges csirkehús', 1080),
(5, 'Sült banán', 'kicsi adag', 'frissen készített sült banán', 1080),
(6, 'Sült ananász', 'kicsi adag', 'frissen készített sült ananász', 1080),
(7, 'Sült alma', 'kicsi adag', 'frissen készített sült alma', 1080),
(8, 'Pirított rizs rákkal', 'kicsi adag', 'frissen készített pirított rizs rákkal', 1080),
(9, 'Pirított rizs marhahússal', 'kicsi adag', 'frissen készített pirított rizs marhahússal', 1080),
(10, 'Pirított rizs csirkehússal', 'kicsi adag', 'frissen készített pirított rizs csirkehússal', 1080),
(11, 'Pirított tészta csirkehússal', 'kicsi adag', 'frissen készített pirított tészta csirkehússal', 1080),
(12, 'Pirított tészta marhahússal', 'kicsi adag', 'frissen készített pirított tészta marhahússal', 1080),
(13, 'Csirkehús bambuszrüggyel, gombával', 'kicsi adag', 'frissen készített csirkehús bambuszrüggyel, gombával', 1080),
(14, 'Pirított tészta rákkal', 'kicsi adag', 'frissen készített pirított tészta rákkal', 1080),
(15, 'Sült Rák', 'kicsi adag', 'frissen készített rák', 1080),
(16, 'Kínai hamburger', 'Kicsi adag', 'A zsenge párolt sertéshússal töltött pitaszerű zsemle', 1080),
(17, 'Baozi', 'Kicsi adag', 'egy kenyérszerű gombóc, amiben a hústól a zöldségen át a babkrémig minden megtalálható.', 1080),
(18, 'Mapo Tofu', 'Kicsi adag', 'szecsuáni tofus-marha-erjesztett-babtészta étel ', 1080),
(19, 'Gombóc', 'Kicsi adag', 'A töltelék kollagénnel teli sertésalaplével készül, hogy hűlve megszilárdul.', 1080),
(20, '\r\nGőzölt wan-tan garnélával', 'Kicsi adag', 'Garnélával töltött nyitott tésztabatyu', 1080);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendelesek`
--

DROP TABLE IF EXISTS `rendelesek`;
CREATE TABLE IF NOT EXISTS `rendelesek` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `VasarloID` int DEFAULT NULL,
  `remdeles_datum` date NOT NULL,
  `rendeles_idopont` time NOT NULL,
  `rendeles_allapota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `végösszeg` decimal(10,2) NOT NULL,
  `EtelID` int DEFAULT NULL,
  `RendelesekDatum` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `remdeles_datum` (`remdeles_datum`,`rendeles_idopont`,`végösszeg`),
  UNIQUE KEY `rendeles_allapota` (`rendeles_allapota`),
  UNIQUE KEY `RendelesekDatum` (`RendelesekDatum`),
  KEY `VasarloID` (`VasarloID`),
  KEY `EtelID` (`EtelID`),
  KEY `végösszeg` (`végösszeg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendeles_reszletei`
--

DROP TABLE IF EXISTS `rendeles_reszletei`;
CREATE TABLE IF NOT EXISTS `rendeles_reszletei` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rendeles_id` int NOT NULL,
  `termek_id` int NOT NULL,
  `termek_nev` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci NOT NULL,
  `mennyiseg` int NOT NULL,
  `szallitasi_cim` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rendeles_id` (`rendeles_id`,`termek_id`,`szallitasi_cim`),
  UNIQUE KEY `mennyiseg` (`mennyiseg`),
  UNIQUE KEY `termek_nev` (`termek_nev`),
  KEY `termek_id` (`termek_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendelt_etel`
--

DROP TABLE IF EXISTS `rendelt_etel`;
CREATE TABLE IF NOT EXISTS `rendelt_etel` (
  `Rendelt_id` int NOT NULL,
  `vasarlo_id` int DEFAULT NULL,
  `etel_id` int DEFAULT NULL,
  `mennyiseg` int DEFAULT NULL,
  `Teljes_osszeg` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Rendelt_id`),
  UNIQUE KEY `Teljes_osszeg` (`Teljes_osszeg`),
  UNIQUE KEY `mennyiseg` (`mennyiseg`),
  KEY `vasarlo_id` (`vasarlo_id`),
  KEY `etel_id` (`etel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vasarlok`
--

DROP TABLE IF EXISTS `vasarlok`;
CREATE TABLE IF NOT EXISTS `vasarlok` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nev` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci DEFAULT NULL,
  `Email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci NOT NULL,
  `telSzam` int NOT NULL,
  `felhasznalonev` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci NOT NULL,
  `jelszo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Email` (`Email`,`felhasznalonev`,`jelszo`),
  UNIQUE KEY `Nev` (`Nev`,`telSzam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;


INSERT INTO `etelek` (`ID`, `Nev`, `Email`, `telSzam`, `felhasznalonev`, 'jelszo') VALUES
(1,'Dani','kukac@gmail.com',06704567894,'Dani12',123654),
(2,'Nándor','kukac2@gmail.com',06704567895,'Nani12',567098),
(3,'Sándor','kukac3@gmail.com',06704567864,'Sani12',123987),
(4,'Anna','kukac4@gmail.com',06704567898,'Ani12',123123),
(5,'Mária','kukac5@gmail.com',06704567890,'Mari12',123321),
(6,'Hedvig','kukac6@gmail.com',06704567897,'Hedi12',987654);

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `rendelesek`
--
ALTER TABLE `rendelesek`
  ADD CONSTRAINT `rendelesek_ibfk_1` FOREIGN KEY (`VasarloID`) REFERENCES `vasarlok` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rendelesek_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `rendeles_reszletei` (`rendeles_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rendelesek_ibfk_3` FOREIGN KEY (`EtelID`) REFERENCES `etelek` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rendelesek_ibfk_4` FOREIGN KEY (`végösszeg`) REFERENCES `rendelt_etel` (`Teljes_osszeg`);

--
-- Megkötések a táblához `rendeles_reszletei`
--
ALTER TABLE `rendeles_reszletei`
  ADD CONSTRAINT `rendeles_reszletei_ibfk_1` FOREIGN KEY (`id`) REFERENCES `vasarlok` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rendeles_reszletei_ibfk_2` FOREIGN KEY (`termek_id`) REFERENCES `etelek` (`ID`),
  ADD CONSTRAINT `rendeles_reszletei_ibfk_3` FOREIGN KEY (`termek_nev`) REFERENCES `etelek` (`Nev`);

--
-- Megkötések a táblához `rendelt_etel`
--
ALTER TABLE `rendelt_etel`
  ADD CONSTRAINT `rendelt_etel_ibfk_1` FOREIGN KEY (`vasarlo_id`) REFERENCES `rendelesek` (`VasarloID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rendelt_etel_ibfk_2` FOREIGN KEY (`etel_id`) REFERENCES `etelek` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rendelt_etel_ibfk_3` FOREIGN KEY (`Rendelt_id`) REFERENCES `rendeles_reszletei` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `vasarlok`
--
ALTER TABLE `vasarlok`
  ADD CONSTRAINT `vasarlok_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `rendelesek` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
