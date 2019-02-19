-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 19, 2019 at 10:49 AM
-- Server version: 5.6.35
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `smartrecruit`
--

-- --------------------------------------------------------

--
-- Table structure for table `candidat`
--

CREATE TABLE `candidat` (
  `id_candidat` int(11) NOT NULL,
  `nom` varchar(80) DEFAULT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telephone` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `candidat`
--

INSERT INTO `candidat` (`id_candidat`, `nom`, `prenom`, `email`, `telephone`) VALUES
(1, 'Martins', 'Caroline', 'martins.caroline@gmail.com', '06787878'),
(2, 'Kohen', 'Simo', 'kohen.simo@gmail.com', '06545454'),
(3, 'Faboco', 'Bastien', 'fabco.bastien@gmail.com', '07232323');

-- --------------------------------------------------------

--
-- Table structure for table `candidat_offre`
--

CREATE TABLE `candidat_offre` (
  `id_candidat` int(11) NOT NULL,
  `id_offre` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `candidat_offre`
--

INSERT INTO `candidat_offre` (`id_candidat`, `id_offre`) VALUES
(1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `offre`
--

CREATE TABLE `offre` (
  `id_offre` int(11) NOT NULL,
  `position` varchar(80) DEFAULT NULL,
  `nom_entreprise` varchar(50) DEFAULT NULL,
  `localisation` varchar(50) DEFAULT NULL,
  `date_publication` varchar(10) DEFAULT NULL,
  `contrat` set('ALTERNANCE','CDD','CDI','STAGE','TEMPS PLEIN','TEMPS PARTIEL','FREELANCE') DEFAULT NULL,
  `descriptif` text,
  `image` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `offre`
--

INSERT INTO `offre` (`id_offre`, `position`, `nom_entreprise`, `localisation`, `date_publication`, `contrat`, `descriptif`, `image`) VALUES
(1, 'Technicien(ne) micro-informatique', 'Humensis', ' Paris 75012', '2019-01-21', 'CDD', 'Sous la responsabilité du Responsable des systèmes d’information de Humensis, vous aurez notamment en charge les missions suivantes: \r\nGestion et préparation des postes de travail utilisateurs (Mac & PC / Téléphonie/ Licences etc…)\nGestion des comptes utilisateurs sous Active Directory\nGestion des droits d \'accès dans le respect des règles de sécurité de l\'entreprise\nGestion du parc Impressions (Copieurs / Imprimantes)\nSupport auprès des utilisateurs sur site ou à distance (matériel, système d exploitation, applications, connexions réseau)Suivi des différents incidents déclarés', 'https://www.puf.com/sites/default/files/kcfinder/images/humensis%20baseline.png'),
(2, 'Technicien informatique - H/F', 'COPY-TOP', ' Paris 75', '2019-01-21', 'STAGE', 'Rattaché au Responsable d’Exploitation, vos missions au quotidien seront :\nLa gestion et la maintenance du parc informatique (PC/MAC)\nL’installation et la mise à jour des logiciels et applications métiers\nLes connexions RIP et paramétrages des drivers d\'impression (PC/MAC)\nL’assistance aux utilisateurs et la définition des procédures courantes de maintenance\nLa supervision des réseaux LAN et VPN\nLa veille technologique, les préconisations d’amélioration, le reporting d’activité', 'https://upload.wikimedia.org/wikipedia/commons/a/a7/Logo-COPY-TOP.png'),
(3, 'Product Owner / Designer H/F', 'Jellysmack', ' Levallois-Perret(92)', '2019-01-21', 'CDI,TEMPS PLEIN', 'Aujourd\'hui, nous avons besoin d\'agrandir l\'équipe Produit et de la renforcer avec un Product Owner à très forte sensibilité UI/UX pour améliorer et soutenir le développement des différents produits, en collaboration avec le Product Manager, Product Designer et l\'équipe Tech (développeurs et data scientistes).\nVos missions seront de :\nTraduire les besoins utilisateurs en fonctionnalités,\nProduire les interfaces Sketch,\nSpécifier les fonctionnalités sous formes d\'User Story,\nDéfinir et maintenir le backlog et prioriser les développements au travers de Weekly Goals,\nFaire le suivi des développements et les recettes fonctionnelles et visuelles,\nCommuniquer sur l\'avancement de la réalisation du produit auprès du reste de l\'équipe.', 'https://cdn.welcometothejungle.co/uploads/organization/logo/9100/151516/keli-network.png'),
(4, 'Technicien d\'exploitation réseaux LAN/WAN H/F', 'Orange', ' Massy(91)', '2019-01-21', 'CDI,TEMPS PLEIN', '   Vous intégrez l\'entité gérant l\'activité des Services Managés en charge de la supervision et de l\'exploitation des Systèmes d\'Informations directement de nos clients grands comptes ;\nAu sein de cette équipe, vous serez assurerez la bonne coordination et prise en charge des problématiques remontées par le client. Vos missions seront les suivantes :\nAdministrer et exploiter les solutions informatiques implémentées chez nos clients,\nGérer les incidents et changements de niveau 1,\nParticiper à la rédaction des procédures d\'exploitation du niveau 1,\nOrienter les escalades vers le niveau 2 ou les services compétents,\nAssurer un reporting de l\'activité déployée chez le client.', 'https://www.castorette.paris/wp-content/uploads/2018/07/orange-logo.jpg'),
(5, 'STAGE - ASSISTANT IT ANALYST, H/F', 'BNP Paribas Securities Services', 'Pantin(93)', '2019-01-21', 'STAGE', 'Votre activité sera rythmée par l’analyse et le développement d’un outil de suivi interne : l’opportunité d’accéder à un poste à responsabilités dès le début de votre parcours chez BNP Paribas !\n\nVous recevrez les instructions et veillerez à leur bon déroulement :\nDans un premier temps le collaborateur aura en charge d\'effectuer l\'analyse du support fonctionnel relatif à un outil de suivi de l\'activité, utilisée par les responsables IT et MOA, qui est également un outil de suivi des dépenses en liaison avec d’autres logiciels. La version 1 de l\'outil est composée :\nd\'une application développée en PowerBuilder,\nd\'une base de données Sybase.\nDans un second temps, le collaborateur travaillera sur la nouvelle version de l’outil. La refonte en cours s\'effectue en mode AGILE sous JAVA EXTJS et Postgresql.   ', 'https://d29dpxox3qezd.cloudfront.net/uploads/mentor/5b8a6555030bae6d40d6173c/logo.png'),
(6, 'Administrateur Système et Réseau F/H', 'ACCENGAGE', 'Paris(75)', '2019-01-21', 'ALTERNANCE,STAGE', 'Gestion du parc informatique sous l’assistance du pôle Opérationnel \n\nGestion et résolution des actions de support coté infrastructure \n\nGestion et résolution des tickets et support interne via freshdesk \n\nParticipation au projet de migration bigdata et autres évolutions internes \n\nSous la direction du Référent infra & Production vous interviendrez dans un environnement challengeant sur des technologies innovantes (big data, cloud…) sur une infrastructure à fort trafic. \n\n  ', 'https://www.accengage.com/wp-content/uploads/2014/04/accengage-logo-job-offers-v3-GRAND-FORMAT.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `candidat`
--
ALTER TABLE `candidat`
  ADD PRIMARY KEY (`id_candidat`);

--
-- Indexes for table `candidat_offre`
--
ALTER TABLE `candidat_offre`
  ADD PRIMARY KEY (`id_candidat`,`id_offre`),
  ADD KEY `id_offre` (`id_offre`);

--
-- Indexes for table `offre`
--
ALTER TABLE `offre`
  ADD PRIMARY KEY (`id_offre`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `candidat`
--
ALTER TABLE `candidat`
  MODIFY `id_candidat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `offre`
--
ALTER TABLE `offre`
  MODIFY `id_offre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;