-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 08 fév. 2019 à 11:36
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `smartrecruit`
--

-- --------------------------------------------------------

--
-- Structure de la table `candidat`
--

DROP TABLE IF EXISTS `candidat`;
CREATE TABLE IF NOT EXISTS `candidat` (
  `id_candidat` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(80) DEFAULT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telephone` int(100) DEFAULT NULL,
  PRIMARY KEY (`id_candidat`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `candidat`
--

INSERT INTO `candidat` (`id_candidat`, `nom`, `prenom`, `email`, `telephone`) VALUES
(1, 'Martins', 'Caroline', 'martins.caroline@gmail.com', 6787878),
(2, 'Kohen', 'Simo', 'kohen.simo@gmail.com', 6545454),
(3, 'Faboco', 'Bastien', 'fabco.bastien@gmail.com', 7232323);

-- --------------------------------------------------------

--
-- Structure de la table `candidat_offre`
--

DROP TABLE IF EXISTS `candidat_offre`;
CREATE TABLE IF NOT EXISTS `candidat_offre` (
  `id_candidat` int(11) NOT NULL,
  `id_offre` int(11) NOT NULL,
  PRIMARY KEY (`id_candidat`,`id_offre`),
  KEY `id_offre` (`id_offre`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `candidat_offre`
--

INSERT INTO `candidat_offre` (`id_candidat`, `id_offre`) VALUES
(1, 1),
(1, 6),
(2, 3),
(2, 5),
(3, 4);

-- --------------------------------------------------------

--
-- Structure de la table `offre`
--

DROP TABLE IF EXISTS `offre`;
CREATE TABLE IF NOT EXISTS `offre` (
  `id_offre` int(11) NOT NULL AUTO_INCREMENT,
  `position` varchar(80) DEFAULT NULL,
  `nom_entreprise` varchar(50) DEFAULT NULL,
  `localisation` varchar(50) DEFAULT NULL,
  `date_publication` datetime DEFAULT NULL,
  `contrat` set('ALTERNANCE','CDD','CDI','STAGE','TEMPS PLEIN','TEMPS PARTIEL','FREELANCE') DEFAULT NULL,
  `descriptif` text,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_offre`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `offre`
--

INSERT INTO `offre` (`id_offre`, `position`, `nom_entreprise`, `localisation`, `date_publication`, `contrat`, `descriptif`, `image`) VALUES
(1, 'Technicien(ne) micro-informatique', 'Humensis', ' Paris 75012', '2019-01-21 14:49:25', 'CDD', 'Sous la responsabilité du Responsable des systèmes d’information de Humensis, vous aurez notamment en charge les missions suivantes: \r\nGestion et préparation des postes de travail utilisateurs (Mac & PC / Téléphonie/ Licences etc…)\nGestion des comptes utilisateurs sous Active Directory\nGestion des droits d \'accès dans le respect des règles de sécurité de l\'entreprise\nGestion du parc Impressions (Copieurs / Imprimantes)\nSupport auprès des utilisateurs sur site ou à distance (matériel, système d exploitation, applications, connexions réseau)Suivi des différents incidents déclarés', 'humensis.png'),
(2, 'Technicien informatique - H/F', 'COPY-TOP', ' Paris 75', '2019-01-21 14:49:25', 'STAGE', 'Rattaché au Responsable d’Exploitation, vos missions au quotidien seront :\nLa gestion et la maintenance du parc informatique (PC/MAC)\nL’installation et la mise à jour des logiciels et applications métiers\nLes connexions RIP et paramétrages des drivers d\'impression (PC/MAC)\nL’assistance aux utilisateurs et la définition des procédures courantes de maintenance\nLa supervision des réseaux LAN et VPN\nLa veille technologique, les préconisations d’amélioration, le reporting d’activité', 'copytop.png'),
(3, 'Product Owner / Designer H/F', 'Jellysmack', ' Levallois-Perret(92)', '2019-01-21 14:49:25', 'CDI,TEMPS PLEIN', 'Aujourd\'hui, nous avons besoin d\'agrandir l\'équipe Produit et de la renforcer avec un Product Owner à très forte sensibilité UI/UX pour améliorer et soutenir le développement des différents produits, en collaboration avec le Product Manager, Product Designer et l\'équipe Tech (développeurs et data scientistes).\nVos missions seront de :\nTraduire les besoins utilisateurs en fonctionnalités,\nProduire les interfaces Sketch,\nSpécifier les fonctionnalités sous formes d\'User Story,\nDéfinir et maintenir le backlog et prioriser les développements au travers de Weekly Goals,\nFaire le suivi des développements et les recettes fonctionnelles et visuelles,\nCommuniquer sur l\'avancement de la réalisation du produit auprès du reste de l\'équipe.', 'jellysmack.png'),
(4, 'Technicien d\'exploitation réseaux LAN/WAN H/F', 'Orange', ' Massy(91)', '2019-01-21 14:49:25', 'CDI,TEMPS PLEIN', '   Vous intégrez l\'entité gérant l\'activité des Services Managés en charge de la supervision et de l\'exploitation des Systèmes d\'Informations directement de nos clients grands comptes ;\nAu sein de cette équipe, vous serez assurerez la bonne coordination et prise en charge des problématiques remontées par le client. Vos missions seront les suivantes :\nAdministrer et exploiter les solutions informatiques implémentées chez nos clients,\nGérer les incidents et changements de niveau 1,\nParticiper à la rédaction des procédures d\'exploitation du niveau 1,\nOrienter les escalades vers le niveau 2 ou les services compétents,\nAssurer un reporting de l\'activité déployée chez le client.', 'orange.png'),
(5, 'STAGE - ASSISTANT IT ANALYST, H/F', 'BNP Paribas Securities Services', 'Pantin(93)', '2019-01-21 14:49:25', 'STAGE', 'Votre activité sera rythmée par l’analyse et le développement d’un outil de suivi interne : l’opportunité d’accéder à un poste à responsabilités dès le début de votre parcours chez BNP Paribas !\n\nVous recevrez les instructions et veillerez à leur bon déroulement :\nDans un premier temps le collaborateur aura en charge d\'effectuer l\'analyse du support fonctionnel relatif à un outil de suivi de l\'activité, utilisée par les responsables IT et MOA, qui est également un outil de suivi des dépenses en liaison avec d’autres logiciels. La version 1 de l\'outil est composée :\nd\'une application développée en PowerBuilder,\nd\'une base de données Sybase.\nDans un second temps, le collaborateur travaillera sur la nouvelle version de l’outil. La refonte en cours s\'effectue en mode AGILE sous JAVA EXTJS et Postgresql.   ', 'bnp.png'),
(6, 'Administrateur Système et Réseau F/H', 'ACCENGAGE', 'Paris(75)', '2019-01-21 14:49:25', 'ALTERNANCE,STAGE', 'Gestion du parc informatique sous l’assistance du pôle Opérationnel \n\nGestion et résolution des actions de support coté infrastructure \n\nGestion et résolution des tickets et support interne via freshdesk \n\nParticipation au projet de migration bigdata et autres évolutions internes \n\nSous la direction du Référent infra & Production vous interviendrez dans un environnement challengeant sur des technologies innovantes (big data, cloud…) sur une infrastructure à fort trafic. \n\n  ', 'accengage.png');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
