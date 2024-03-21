-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Már 21. 10:55
-- Kiszolgáló verziója: 10.4.17-MariaDB
-- PHP verzió: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `kinai`
--
CREATE DATABASE IF NOT EXISTS `kinai` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `kinai`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `etelek`
--

CREATE TABLE `etelek` (
  `ID` int(11) NOT NULL,
  `Nev` varchar(255) COLLATE utf8mb4_hungarian_ci DEFAULT NULL,
  `meret` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `Leiras` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `Ar` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

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

CREATE TABLE `rendelesek` (
  `ID` int(11) NOT NULL,
  `VasarloID` int(11) DEFAULT NULL,
  `remdeles_datum` date NOT NULL,
  `rendeles_idopont` time NOT NULL,
  `rendeles_allapota` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `végösszeg` decimal(10,2) NOT NULL,
  `EtelID` int(11) DEFAULT NULL,
  `RendelesekDatum` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendeles_reszletei`
--

CREATE TABLE `rendeles_reszletei` (
  `id` int(11) NOT NULL,
  `rendeles_id` int(11) NOT NULL,
  `termek_id` int(11) NOT NULL,
  `termek_nev` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `mennyiseg` int(11) NOT NULL,
  `szallitasi_cim` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendelt_etel`
--

CREATE TABLE `rendelt_etel` (
  `Rendelt_id` int(11) NOT NULL,
  `vasarlo_id` int(11) DEFAULT NULL,
  `etel_id` int(11) DEFAULT NULL,
  `mennyiseg` int(11) DEFAULT NULL,
  `Teljes_osszeg` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vasarlok`
--

CREATE TABLE `vasarlok` (
  `ID` int(11) NOT NULL,
  `Nev` varchar(255) COLLATE utf8mb4_hungarian_ci DEFAULT NULL,
  `Email` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `telSzam` int(11) NOT NULL,
  `felhasznalonev` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `jelszo` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `vasarlok`
--

INSERT INTO `vasarlok` (`ID`, `Nev`, `Email`, `telSzam`, `felhasznalonev`, `jelszo`) VALUES
(1, 'Dani', 'kukac@gmail.com', 2147483647, 'Dani12', '123654'),
(2, 'Nándor', 'kukac2@gmail.com', 2147483647, 'Nani12', '567098'),
(3, 'Sándor', 'kukac3@gmail.com', 2147483647, 'Sani12', '123987'),
(4, 'Anna', 'kukac4@gmail.com', 2147483647, 'Ani12', '123123'),
(5, 'Mária', 'kukac5@gmail.com', 2147483647, 'Mari12', '123321'),
(6, 'Hedvig', 'kukac6@gmail.com', 2147483647, 'Hedi12', '987654');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `etelek`
--
ALTER TABLE `etelek`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Leírás` (`Leiras`),
  ADD UNIQUE KEY `Nev` (`Nev`,`meret`,`Ar`);

--
-- A tábla indexei `rendelesek`
--
ALTER TABLE `rendelesek`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `remdeles_datum` (`remdeles_datum`,`rendeles_idopont`,`végösszeg`),
  ADD UNIQUE KEY `rendeles_allapota` (`rendeles_allapota`),
  ADD UNIQUE KEY `RendelesekDatum` (`RendelesekDatum`),
  ADD KEY `VasarloID` (`VasarloID`),
  ADD KEY `EtelID` (`EtelID`),
  ADD KEY `végösszeg` (`végösszeg`);

--
-- A tábla indexei `rendeles_reszletei`
--
ALTER TABLE `rendeles_reszletei`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rendeles_id` (`rendeles_id`,`termek_id`,`szallitasi_cim`),
  ADD UNIQUE KEY `mennyiseg` (`mennyiseg`),
  ADD UNIQUE KEY `termek_nev` (`termek_nev`),
  ADD KEY `termek_id` (`termek_id`);

--
-- A tábla indexei `rendelt_etel`
--
ALTER TABLE `rendelt_etel`
  ADD PRIMARY KEY (`Rendelt_id`),
  ADD UNIQUE KEY `Teljes_osszeg` (`Teljes_osszeg`),
  ADD UNIQUE KEY `mennyiseg` (`mennyiseg`),
  ADD KEY `vasarlo_id` (`vasarlo_id`),
  ADD KEY `etel_id` (`etel_id`);

--
-- A tábla indexei `vasarlok`
--
ALTER TABLE `vasarlok`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Email` (`Email`,`felhasznalonev`,`jelszo`),
  ADD UNIQUE KEY `Nev` (`Nev`,`telSzam`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `etelek`
--
ALTER TABLE `etelek`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `rendelesek`
--
ALTER TABLE `rendelesek`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `rendeles_reszletei`
--
ALTER TABLE `rendeles_reszletei`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `vasarlok`
--
ALTER TABLE `vasarlok`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
