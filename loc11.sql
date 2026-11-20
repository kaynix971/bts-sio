-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : ven. 20 nov. 2026 à 13:19
-- Version du serveur : 8.0.45
-- Version de PHP : 8.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `loc11`
--

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `num_client` int NOT NULL,
  `nom_prenom` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `adresse` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `permis` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`num_client`, `nom_prenom`, `adresse`, `permis`) VALUES
(200, 'Rémy', 'Paris', 1234),
(201, 'David', 'Créteil', 568);

-- --------------------------------------------------------

--
-- Structure de la table `locations`
--

CREATE TABLE `locations` (
  `id_location` int NOT NULL,
  `date_location` date NOT NULL,
  `nbre_jour` int NOT NULL,
  `num_client` int NOT NULL,
  `immatriculation` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `locations`
--

INSERT INTO `locations` (`id_location`, `date_location`, `nbre_jour`, `num_client`, `immatriculation`) VALUES
(12, '2026-11-19', 3, 201, '300 TU 300'),
(13, '2026-11-10', 2, 200, '200 TU 200');

-- --------------------------------------------------------

--
-- Structure de la table `voiture`
--

CREATE TABLE `voiture` (
  `immatriculation` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `marque` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `couleur` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `kilometrage` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `date_circulation` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `voiture`
--

INSERT INTO `voiture` (`immatriculation`, `marque`, `couleur`, `kilometrage`, `date_circulation`) VALUES
('200 TU 200', 'bmw', 'noire', '10000', '2026-11-16'),
('300 TU 300', 'mercedes', 'blanc', '20000', '2026-11-10');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`num_client`);

--
-- Index pour la table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id_location`),
  ADD KEY `num_client` (`num_client`),
  ADD KEY `immatriculation` (`immatriculation`);

--
-- Index pour la table `voiture`
--
ALTER TABLE `voiture`
  ADD PRIMARY KEY (`immatriculation`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`immatriculation`) REFERENCES `voiture` (`immatriculation`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `locations_ibfk_2` FOREIGN KEY (`num_client`) REFERENCES `clients` (`num_client`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
