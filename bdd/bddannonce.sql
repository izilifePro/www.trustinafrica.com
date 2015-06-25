-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le : Mar 23 Juin 2015 à 12:42
-- Version du serveur: 5.5.20
-- Version de PHP: 5.3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `bddannonce`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE IF NOT EXISTS `administrateur` (
  `Id_Admin` varchar(25) NOT NULL,
  `Nom_Admin` varchar(25) NOT NULL,
  `Prenom_Admin` varchar(25) NOT NULL,
  PRIMARY KEY (`Id_Admin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `annonces`
--

CREATE TABLE IF NOT EXISTS `annonces` (
  `Id_Annonces` varchar(25) NOT NULL,
  `Date` date NOT NULL,
  `Libelle` varchar(360) NOT NULL,
  `Commentaire` varchar(360) NOT NULL,
  `Lieu` varchar(360) NOT NULL,
  `code_Pays` varchar(3) NOT NULL,
  PRIMARY KEY (`Id_Annonces`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

CREATE TABLE IF NOT EXISTS `compte` (
  `Id_Compte` varchar(25) NOT NULL,
  `Login` varchar(50) NOT NULL,
  `Mot_Passe` varchar(50) NOT NULL,
  `Type_compte` varchar(50) NOT NULL,
  PRIMARY KEY (`Id_Compte`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `consulter`
--

CREATE TABLE IF NOT EXISTS `consulter` (
  `Id_Annonces` varchar(25) NOT NULL,
  `Id_Membre` varchar(25) NOT NULL,
  `Id_Nmembre` varchar(25) NOT NULL,
  PRIMARY KEY (`Id_Annonces`,`Id_Membre`,`Id_Nmembre`),
  KEY `Id_Membre` (`Id_Membre`),
  KEY `Id_Nmembre` (`Id_Nmembre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `emploi`
--

CREATE TABLE IF NOT EXISTS `emploi` (
  `Id_Annonces` varchar(25) NOT NULL,
  `Type_Emploi` varchar(100) NOT NULL,
  `Fonction` varchar(100) NOT NULL,
  `Experience` varchar(10) NOT NULL,
  `Secteur` varchar(100) NOT NULL,
  `Niveau` varchar(100) NOT NULL,
  `Contrat` varchar(100) NOT NULL,
  PRIMARY KEY (`Id_Annonces`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `fond_commerce`
--

CREATE TABLE IF NOT EXISTS `fond_commerce` (
  `Id_Fond` varchar(25) NOT NULL,
  `Contrat` varchar(100) NOT NULL,
  `Prix` double NOT NULL,
  `Type_Fond` varchar(100) NOT NULL,
  PRIMARY KEY (`Id_Fond`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

CREATE TABLE IF NOT EXISTS `image` (
  `Id_Image` varchar(25) NOT NULL,
  `Id_Annonces` varchar(25) NOT NULL,
  `Non_Image` varchar(25) NOT NULL,
  PRIMARY KEY (`Id_Image`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `immobilier`
--

CREATE TABLE IF NOT EXISTS `immobilier` (
  `Id_Immobilier` varchar(25) NOT NULL,
  `Prix` float NOT NULL,
  `Surface` int(11) NOT NULL,
  `Pièce` int(11) NOT NULL,
  `Type_Immobilier` varchar(100) NOT NULL,
  `Type_Contrat` varchar(100) NOT NULL,
  PRIMARY KEY (`Id_Immobilier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `marchandise`
--

CREATE TABLE IF NOT EXISTS `marchandise` (
  `Id_Marchandise` varchar(25) NOT NULL,
  `Type_Marchandise` varchar(100) NOT NULL,
  `Prix` float NOT NULL,
  `Quantité` int(11) NOT NULL,
  PRIMARY KEY (`Id_Marchandise`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `materiel_professionnel`
--

CREATE TABLE IF NOT EXISTS `materiel_professionnel` (
  `Id_Materiel` varchar(25) NOT NULL,
  `Type_Materiel` varchar(100) NOT NULL,
  `Prix` float NOT NULL,
  PRIMARY KEY (`Id_Materiel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `membre`
--

CREATE TABLE IF NOT EXISTS `membre` (
  `Id_Membre` varchar(25) NOT NULL,
  `Nom_Membre` varchar(25) NOT NULL,
  `Prenom_Membre` varchar(25) NOT NULL,
  `Email` varchar(25) NOT NULL,
  `Tel` int(11) NOT NULL,
  `Adresse` varchar(100) NOT NULL,
  `Civilite` varchar(10) NOT NULL,
  `Pseudonyme` varchar(25) NOT NULL,
  `Date_Naissance` date NOT NULL,
  PRIMARY KEY (`Id_Membre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `non_membre`
--

CREATE TABLE IF NOT EXISTS `non_membre` (
  `Id_Nmembre` varchar(25) NOT NULL,
  PRIMARY KEY (`Id_Nmembre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `traitement`
--

CREATE TABLE IF NOT EXISTS `traitement` (
  `Id_Admin` varchar(25) NOT NULL,
  `Id_Annonces` varchar(25) NOT NULL,
  PRIMARY KEY (`Id_Admin`,`Id_Annonces`),
  KEY `Id_Annonces` (`Id_Annonces`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `vehicule`
--

CREATE TABLE IF NOT EXISTS `vehicule` (
  `Id_Vehicule` varchar(25) NOT NULL,
  `Type_Vehucule` varchar(100) NOT NULL,
  `Prix` float NOT NULL,
  `Model` varchar(100) NOT NULL,
  `Kilometrage` int(11) NOT NULL,
  `Energie` varchar(25) NOT NULL,
  `Boite_Vitesse` varchar(25) NOT NULL,
  PRIMARY KEY (`Id_Vehicule`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `annonces`
--
ALTER TABLE `annonces`
  ADD CONSTRAINT `annonces_ibfk_2` FOREIGN KEY (`Id_Annonces`) REFERENCES `image` (`Id_Image`);

--
-- Contraintes pour la table `compte`
--
ALTER TABLE `compte`
  ADD CONSTRAINT `compte_ibfk_1` FOREIGN KEY (`Id_Compte`) REFERENCES `membre` (`Id_Membre`);

--
-- Contraintes pour la table `consulter`
--
ALTER TABLE `consulter`
  ADD CONSTRAINT `consulter_ibfk_3` FOREIGN KEY (`Id_Nmembre`) REFERENCES `non_membre` (`Id_Nmembre`),
  ADD CONSTRAINT `consulter_ibfk_1` FOREIGN KEY (`Id_Annonces`) REFERENCES `annonces` (`Id_Annonces`),
  ADD CONSTRAINT `consulter_ibfk_2` FOREIGN KEY (`Id_Membre`) REFERENCES `membre` (`Id_Membre`);

--
-- Contraintes pour la table `emploi`
--
ALTER TABLE `emploi`
  ADD CONSTRAINT `emploi_ibfk_1` FOREIGN KEY (`Id_Annonces`) REFERENCES `annonces` (`Id_Annonces`);

--
-- Contraintes pour la table `fond_commerce`
--
ALTER TABLE `fond_commerce`
  ADD CONSTRAINT `fond_commerce_ibfk_1` FOREIGN KEY (`Id_Fond`) REFERENCES `annonces` (`Id_Annonces`);

--
-- Contraintes pour la table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `image_ibfk_1` FOREIGN KEY (`Id_Image`) REFERENCES `annonces` (`Id_Annonces`);

--
-- Contraintes pour la table `immobilier`
--
ALTER TABLE `immobilier`
  ADD CONSTRAINT `immobilier_ibfk_1` FOREIGN KEY (`Id_Immobilier`) REFERENCES `annonces` (`Id_Annonces`);

--
-- Contraintes pour la table `marchandise`
--
ALTER TABLE `marchandise`
  ADD CONSTRAINT `marchandise_ibfk_1` FOREIGN KEY (`Id_Marchandise`) REFERENCES `annonces` (`Id_Annonces`);

--
-- Contraintes pour la table `materiel_professionnel`
--
ALTER TABLE `materiel_professionnel`
  ADD CONSTRAINT `materiel_professionnel_ibfk_1` FOREIGN KEY (`Id_Materiel`) REFERENCES `annonces` (`Id_Annonces`);

--
-- Contraintes pour la table `traitement`
--
ALTER TABLE `traitement`
  ADD CONSTRAINT `traitement_ibfk_2` FOREIGN KEY (`Id_Annonces`) REFERENCES `administrateur` (`Id_Admin`),
  ADD CONSTRAINT `traitement_ibfk_1` FOREIGN KEY (`Id_Admin`) REFERENCES `annonces` (`Id_Annonces`);

--
-- Contraintes pour la table `vehicule`
--
ALTER TABLE `vehicule`
  ADD CONSTRAINT `vehicule_ibfk_2` FOREIGN KEY (`Id_Vehicule`) REFERENCES `annonces` (`Id_Annonces`),
  ADD CONSTRAINT `vehicule_ibfk_1` FOREIGN KEY (`Id_Vehicule`) REFERENCES `annonces` (`Id_Annonces`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
