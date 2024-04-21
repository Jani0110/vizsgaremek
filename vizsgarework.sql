-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: mysql:3306
-- Létrehozás ideje: 2024. Ápr 15. 18:51
-- Kiszolgáló verziója: 8.1.0
-- PHP verzió: 8.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `vizsgarework`
--
CREATE DATABASE IF NOT EXISTS `vizsgarework` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `vizsgarework`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `etelek`
--

CREATE TABLE `etelek` (
  `id` int NOT NULL,
  `nev` varchar(255) NOT NULL,
  `ar` int NOT NULL,
  `meret` varchar(255) NOT NULL,
  `kategoria_id` int NOT NULL,
  `leiras` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- A tábla adatainak kiíratása `etelek`
--

INSERT INTO `etelek` (`id`, `nev`, `ar`, `meret`, `kategoria_id`, `leiras`) VALUES
(1, 'Illatos omlós kacsahús', 1080, 'kicsi adag', 4, 'frissen készített kacsahús'),
(2, 'Csirke szecsuani módra', 1080, 'kicsi adag', 4, 'frissen készített csirke szecsuani módra'),
(3, 'Hagymás csirkehús', 1080, 'kicsi adag', 4, 'frissen készített hagymás csirkehús'),
(4, 'Zöldséges csirkehús', 1080, 'kicsi adag', 4, 'frissen készített zöldséges csirkehús'),
(5, 'Sült banán', 1080, 'kicsi adag', 10, 'frissen készített sült banán'),
(6, 'Sült ananász', 1080, 'kicsi adag', 10, 'frissen készített sült ananász'),
(7, 'Sült alma', 1080, 'kicsi adag', 10, 'frissen készített sült alma'),
(8, 'Pirított rizs rákkal', 1080, 'kicsi adag', 7, 'frissen készített pirított rizs rákkal'),
(9, 'Pirított rizs marhahússal', 1080, 'kicsi adag', 7, 'frissen készített pirított rizs marhahússal'),
(10, 'Pirított rizs csirkehússal', 1080, 'kicsi adag', 7, 'frissen készített pirított rizs csirkehússal'),
(11, 'Pirított tészta csirkehússal', 1080, 'kicsi adag', 6, 'frissen készített pirított tészta csirkehússal'),
(12, 'Pirított tészta marhahússal', 1080, 'kicsi adag', 6, 'frissen készített pirított tészta marhahússal'),
(13, 'Csirkehús bambuszrüggyel, gombával', 1080, 'kicsi adag', 5, 'frissen készített csirkehús bambuszrüggyel, gombával'),
(14, 'Pirított tészta rákkal', 1080, 'kicsi adag', 6, 'frissen készített pirított tészta rákkal'),
(15, 'Sült Rák', 1080, 'kicsi adag', 4, 'frissen készített rák'),
(16, 'Kínai hamburger', 1080, 'Kicsi adag', 8, 'A zsenge párolt sertéshússal töltött pitaszerű zsemle'),
(17, 'Baozi', 1080, 'Kicsi adag', 6, 'egy kenyérszerű gombóc, amiben a hústól a zöldségen át a babkrémig minden megtalálható.'),
(18, 'Mapo Tofu', 1080, 'Kicsi adag', 3, 'szecsuáni tofus-marha-erjesztett-babtészta étel '),
(19, 'Gombóc', 1080, 'Kicsi adag', 6, 'A töltelék kollagénnel teli sertésalaplével készül, hogy hűlve megszilárdul.'),
(20, 'Gőzölt wan-tan garnélával', 1080, 'Kicsi adag', 6, 'Garnélával töltött nyitott tésztabatyu');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kategoriak`
--

CREATE TABLE `kategoriak` (
  `id` int NOT NULL,
  `nev` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- A tábla adatainak kiíratása `kategoriak`
--

INSERT INTO `kategoriak` (`id`, `nev`) VALUES
(1, 'Levesek'),
(2, 'Gyümölcsök'),
(3, 'Tofu és gomba'),
(4, 'Húsok'),
(5, 'Zöldségek'),
(6, 'Tészták'),
(7, 'Rizs'),
(8, 'Dim sum'),
(9, 'Tea és italok'),
(10, 'Desszertek');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendelesek`
--

CREATE TABLE `rendelesek` (
  `id` int NOT NULL,
  `vevo_id` int NOT NULL,
  `rendeles_datuma` date NOT NULL,
  `vegosszeg` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendelt_etel`
--

CREATE TABLE `rendelt_etel` (
  `id` int NOT NULL,
  `rendeles_id` int NOT NULL,
  `etel_id` int NOT NULL,
  `mennyiseg` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vevok`
--

CREATE TABLE `vevok` (
  `id` int NOT NULL,
  `vezeteknev` varchar(50) NOT NULL,
  `keresztnev` varchar(100) NOT NULL,
  `felhasznalonev` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `jelszo` varchar(32) NOT NULL,
  `telszam` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- A tábla adatainak kiíratása `vevok`
--

INSERT INTO `vevok` (`id`, `vezeteknev`, `keresztnev`, `felhasznalonev`, `email`, `jelszo`, `telszam`) VALUES
(1, 'Nagy', 'Dani', 'Dani12', 'kukac@gmail.com', '123654', 2147483647),
(2, 'Lakatos', 'Ronáldó', 'Roni12', 'kukac2@gmail.com', '567098', 2147483647),
(3, 'Sándor', 'Dani', 'Sani12', 'kukac3@gmail.com', '123987', 2147483647),
(4, 'Anna', 'Dani', 'Ani12', 'kukac4@gmail.com', '123123', 2147483647),
(5, 'Mária', 'Dani', 'Mari12', 'kukac5@gmail.com', '123321', 2147483647),
(6, 'Hedvig', 'Dani', 'Hedi12', 'kukac6@gmail.com', '987654', 2147483647);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `etelek`
--
ALTER TABLE `etelek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kategoria_id` (`kategoria_id`);

--
-- A tábla indexei `kategoriak`
--
ALTER TABLE `kategoriak`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `rendelesek`
--
ALTER TABLE `rendelesek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vevo_id` (`vevo_id`);

--
-- A tábla indexei `rendelt_etel`
--
ALTER TABLE `rendelt_etel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rendeles_id` (`rendeles_id`),
  ADD KEY `etel_id` (`etel_id`);

--
-- A tábla indexei `vevok`
--
ALTER TABLE `vevok`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `etelek`
--
ALTER TABLE `etelek`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `kategoriak`
--
ALTER TABLE `kategoriak`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `rendelesek`
--
ALTER TABLE `rendelesek`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `rendelt_etel`
--
ALTER TABLE `rendelt_etel`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `vevok`
--
ALTER TABLE `vevok`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `etelek`
--
ALTER TABLE `etelek`
  ADD CONSTRAINT `etelek_ibfk_1` FOREIGN KEY (`kategoria_id`) REFERENCES `kategoriak` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `rendelesek`
--
ALTER TABLE `rendelesek`
  ADD CONSTRAINT `rendelesek_ibfk_1` FOREIGN KEY (`vevo_id`) REFERENCES `vevok` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `rendelt_etel`
--
ALTER TABLE `rendelt_etel`
  ADD CONSTRAINT `rendelt_etel_ibfk_1` FOREIGN KEY (`etel_id`) REFERENCES `etelek` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rendelt_etel_ibfk_2` FOREIGN KEY (`rendeles_id`) REFERENCES `rendelesek` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
