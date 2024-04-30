-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Ápr 30. 18:21
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
  `Ar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `etelek`
--

INSERT INTO `etelek` (`ID`, `Nev`, `meret`, `Leiras`, `Ar`) VALUES
(1, 'Illatos omlós kacsahús', 'kis adag', 'frissen készített kacsahús', 1080),
(2, 'Csirke szecsuani módra', 'kis adag', 'frissen készített csirke szecsuani módra', 1080),
(3, 'Hagymás csirkehús', 'kis adag', 'frissen készített hagymás csirkehús', 1080),
(4, 'Zöldséges csirkehús', 'kis adag', 'frissen készített zöldséges csirkehús', 1080),
(5, 'Sült banán', 'kis adag', 'frissen készített sült banán', 1080),
(6, 'Sült ananász', 'kis adag', 'frissen készített sült ananász', 1080),
(7, 'Sült alma', 'kis adag', 'frissen készített sült alma', 1080),
(8, 'Pirított rizs rákkal', 'kis adag', 'frissen készített pirított rizs rákkal', 1080),
(9, 'Pirított rizs marhahússal', 'kis adag', 'frissen készített pirított rizs marhahússal', 1080),
(10, 'Pirított rizs csirkehússal', 'kis adag', 'frissen készített pirított rizs csirkehússal', 1080),
(11, 'Pirított tészta csirkehússal', 'kis adag', 'frissen készített pirított tészta csirkehússal', 1080),
(12, 'Pirított tészta marhahússal', 'kis adag', 'frissen készített pirított tészta marhahússal', 1080),
(13, 'Csirkehús bambuszrüggyel, gombával', 'kis adag', 'frissen készített csirkehús bambuszrüggyel, gombával', 1080),
(14, 'Pirított tészta rákkal', 'kis adag', 'frissen készített pirított tészta rákkal', 1080),
(15, 'Sült Rák', 'kis adag', 'frissen készített rák', 1080),
(16, 'Kínai hamburger', 'kis adag', 'A zsenge párolt sertéshússal töltött pitaszerű zsemle', 1080),
(17, 'Baozi', 'kis adag', 'egy kenyérszerű gombóc, amiben a hústól a zöldségen át a babkrémig minden megtalálható.', 1080),
(18, 'Mapo Tofu', 'kis adag', 'szecsuáni tofus-marha-erjesztett-babtészta étel ', 1080),
(19, 'Gombóc', 'kis adag', 'A töltelék kollagénnel teli sertésalaplével készül, hogy hűlve megszilárdul.', 1080),
(20, '\r\nGőzölt wan-tan garnélával', 'kis adag', 'Garnélával töltött nyitott tésztabatyu', 1080);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendelesek`
--

CREATE TABLE `rendelesek` (
  `ID` int(11) NOT NULL,
  `VasarloID` int(11) DEFAULT NULL,
  `rendeles_allapota` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `vegosszeg` int(11) NOT NULL,
  `EtelID` int(11) DEFAULT NULL,
  `RendelesekDatum` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `rendelesek`
--

INSERT INTO `rendelesek` (`ID`, `VasarloID`, `rendeles_allapota`, `vegosszeg`, `EtelID`, `RendelesekDatum`) VALUES
(1, 1, 'kész', 1080, 1, '2024-02-04 22:05:13'),
(2, 2, 'lemondva', 4320, 2, '2023-11-26 00:43:41'),
(3, 3, 'kész', 4320, 3, '2023-12-20 03:08:58'),
(4, 4, 'kész', 4320, 4, '2024-09-14 18:18:25'),
(5, 5, 'kész', 1080, 5, '2024-01-08 23:27:00'),
(6, 6, 'kész', 1080, 6, '2024-06-16 01:40:37'),
(7, 7, 'kész', 3240, 7, '2024-01-01 17:21:33'),
(8, 8, 'kész', 1080, 8, '2024-09-24 00:16:58'),
(9, 9, 'kész', 2160, 9, '2023-11-04 17:39:12'),
(10, 10, 'lemondva', 4320, 10, '2023-10-14 20:51:14'),
(11, 11, 'folyamatban', 1080, 11, '2023-12-08 01:54:09'),
(12, 12, 'lemondva', 4320, 12, '2024-04-12 06:46:50'),
(13, 13, 'folyamatban', 1080, 13, '2024-04-23 14:08:54'),
(14, 14, 'folyamatban', 3240, 14, '2023-10-28 15:42:54'),
(15, 15, 'kész', 3240, 15, '2024-08-20 19:45:49'),
(16, 16, 'folyamatban', 2160, 16, '2023-04-26 16:17:12'),
(17, 17, 'folyamatban', 2160, 17, '2024-07-19 11:01:41'),
(18, 18, 'lemondva', 2160, 18, '2023-05-23 06:36:45'),
(19, 19, 'kész', 2160, 19, '2024-07-16 14:18:02'),
(20, 20, 'folyamatban', 4320, 20, '2023-07-16 14:30:09');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendeles_reszletei`
--

CREATE TABLE `rendeles_reszletei` (
  `id` int(11) NOT NULL,
  `rendeles_id` int(11) NOT NULL,
  `termek_id` int(11) NOT NULL,
  `mennyiseg` int(11) NOT NULL,
  `szallitasi_cim` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `rendeles_reszletei`
--

INSERT INTO `rendeles_reszletei` (`id`, `rendeles_id`, `termek_id`, `mennyiseg`, `szallitasi_cim`) VALUES
(1, 1, 1, 1, ' Somlyó Zoltán utca 32'),
(2, 2, 2, 4, ' Dorottya utca 49'),
(3, 3, 3, 4, ' Róna utca 71'),
(4, 4, 4, 4, ' Sirály utca 77'),
(5, 5, 5, 1, ' Első utca 75'),
(6, 6, 6, 1, ' Felhő utca 84'),
(7, 7, 7, 3, ' Hárslevelű utca 98'),
(8, 8, 8, 1, ' Csonka János utca 26'),
(9, 9, 9, 2, ' Ágó dűlő 65'),
(10, 10, 10, 4, ' Gyöngyvirág utca 76'),
(11, 11, 11, 1, ' Mongol utca 29'),
(12, 12, 12, 4, ' Kis László dűlő 91'),
(13, 13, 13, 1, ' Jósika Miklós utca 40'),
(14, 14, 14, 3, ' Győri utca 7'),
(15, 15, 15, 3, ' Rákóczi Ferenc utca 2'),
(16, 16, 16, 2, ' Bányász utca 73'),
(17, 17, 17, 2, ' Kázmér utca 86'),
(18, 18, 18, 2, ' Móra Ferenc utca 91'),
(19, 19, 19, 2, ' Dayka Gábor utca 17'),
(20, 20, 20, 4, ' Méz utca 49');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendelt_etel`
--

CREATE TABLE `rendelt_etel` (
  `Rendelt_id` int(11) NOT NULL,
  `vasarlo_id` int(11) DEFAULT NULL,
  `etel_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `rendelt_etel`
--

INSERT INTO `rendelt_etel` (`Rendelt_id`, `vasarlo_id`, `etel_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 11, 11),
(12, 12, 12),
(13, 13, 13),
(14, 14, 14),
(15, 15, 15),
(16, 16, 16),
(17, 17, 17),
(18, 18, 18),
(19, 19, 19),
(20, 20, 20);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vasarlok`
--

CREATE TABLE `vasarlok` (
  `ID` int(11) NOT NULL,
  `Nev` varchar(255) COLLATE utf8mb4_hungarian_ci DEFAULT NULL,
  `Email` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `telSzam` int(20) NOT NULL,
  `felhasznalonev` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `jelszo` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `vasarlok`
--

INSERT INTO `vasarlok` (`ID`, `Nev`, `Email`, `telSzam`, `felhasznalonev`, `jelszo`) VALUES
(1, 'Tóth Girót', 'Girot1320@gmail.com', 204229209, 'Girot1320', 'Girot660'),
(2, 'Balogh Bertalan', 'Bertalan1668@gmail.com', 701577618, 'Bertalan1668', 'Bertalan834'),
(3, 'Fehér Cirill', 'Cirill2438@gmail.com', 204116780, 'Cirill2438', 'Cirill1219'),
(4, 'Lakatos Gilgames', 'Gilgames2110@gmail.com', 204558939, 'Gilgames2110', 'Gilgames1055'),
(5, 'Papp Bertalan', 'Bertalan7602@gmail.com', 307462024, 'Bertalan7602', 'Bertalan3801'),
(6, 'Fehér Gerzson', 'Gerzson5635@gmail.com', 208913389, 'Gerzson5635', 'Gerzson2817'),
(7, 'Fekete Cézár', 'Cezar6930@gmail.com', 306655217, 'Cezar6930', 'Cezar3465'),
(8, 'Németh Csát', 'Csat6517@gmail.com', 207819188, 'Csat6517', 'Csat3258'),
(9, 'Nagy Gobert', 'Gobert9670@gmail.com', 203217463, 'Gobert9670', 'Gobert4835'),
(10, 'Nagy Berkó', 'Berko4115@gmail.com', 203790201, 'Berko4115', 'Berko2057'),
(11, 'Németh Gerhárd', 'Gerhard5203@gmail.com', 702380371, 'Gerhard5203', 'Gerhard2601'),
(12, 'Fekete Bertold', 'Bertold7903@gmail.com', 207401114, 'Bertold7903', 'Bertold3951'),
(13, 'Szabó Cirják', 'Cirjak9642@gmail.com', 702382350, 'Cirjak9642', 'Cirjak4821'),
(14, 'Török Betlen', 'Betlen6695@gmail.com', 209846259, 'Betlen6695', 'Betlen3347'),
(15, 'Simon Berke', 'Berke3865@gmail.com', 301847073, 'Berke3865', 'Berke1932'),
(16, 'Juhász Cirjék', 'Cirjek6438@gmail.com', 705689301, 'Cirjek6438', 'Cirjek3219'),
(17, 'Lakatos Csaba', 'Csaba5816@gmail.com', 201367885, 'Csaba5816', 'Csaba2908'),
(18, 'Varga Bertalan', 'Bertalan2407@gmail.com', 304662982, 'Bertalan2407', 'Bertalan1203'),
(19, 'Tóth Gilgames', 'Gilgames2534@gmail.com', 704783082, 'Gilgames2534', 'Gilgames1267'),
(20, 'Szabó Bertin', 'Bertin6554@gmail.com', 205565820, 'Bertin6554', 'Bertin3277');

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
  ADD UNIQUE KEY `RendelesekDatum` (`RendelesekDatum`),
  ADD KEY `VasarloID` (`VasarloID`),
  ADD KEY `EtelID` (`EtelID`),
  ADD KEY `végösszeg` (`vegosszeg`);

--
-- A tábla indexei `rendeles_reszletei`
--
ALTER TABLE `rendeles_reszletei`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rendeles_id` (`rendeles_id`,`termek_id`,`szallitasi_cim`),
  ADD KEY `termek_id` (`termek_id`);

--
-- A tábla indexei `rendelt_etel`
--
ALTER TABLE `rendelt_etel`
  ADD PRIMARY KEY (`Rendelt_id`),
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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `rendeles_reszletei`
--
ALTER TABLE `rendeles_reszletei`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `vasarlok`
--
ALTER TABLE `vasarlok`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `rendelesek`
--
ALTER TABLE `rendelesek`
  ADD CONSTRAINT `rendelesek_ibfk_1` FOREIGN KEY (`VasarloID`) REFERENCES `vasarlok` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rendelesek_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `rendeles_reszletei` (`rendeles_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rendelesek_ibfk_3` FOREIGN KEY (`EtelID`) REFERENCES `etelek` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `rendeles_reszletei`
--
ALTER TABLE `rendeles_reszletei`
  ADD CONSTRAINT `rendeles_reszletei_ibfk_1` FOREIGN KEY (`id`) REFERENCES `vasarlok` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rendeles_reszletei_ibfk_2` FOREIGN KEY (`termek_id`) REFERENCES `etelek` (`ID`);

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
