-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 12, 2019 at 09:47 AM
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
  `id_offre` varchar(200) NOT NULL,
  `etat` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `favoris`
--

CREATE TABLE `favoris` (
  `id_candidat` int(11) NOT NULL,
  `id_offre` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `offre`
--

CREATE TABLE `offre` (
  `id_offre` varchar(200) NOT NULL,
  `position` varchar(80) DEFAULT NULL,
  `nom_entreprise` varchar(50) DEFAULT NULL,
  `localisation` varchar(50) DEFAULT NULL,
  `date_publication` varchar(10) DEFAULT NULL,
  `descriptif` text,
  `image` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `offre`
--

INSERT INTO `offre` (`id_offre`, `position`, `nom_entreprise`, `localisation`, `date_publication`, `descriptif`, `image`) VALUES
('aaf880c7-3a00-4f9a-bc4f-f994badbcc43', 'Technicien micro-informatique', 'Humensis', ' Paris 75012', '21-01-2019', 'Sous la responsabilité du Responsable des systèmes d’information de Humensis, vous aurez notamment en charge les missions suivantes: \r\nGestion et préparation des postes de travail utilisateurs (Mac & PC / Téléphonie/ Licences etc…)\nGestion des comptes utilisateurs sous Active Directory\nGestion des droits d \'accès dans le respect des règles de sécurité de l\'entreprise\nGestion du parc Impressions (Copieurs / Imprimantes)\nSupport auprès des utilisateurs sur site ou à distance (matériel, système d exploitation, applications, connexions réseau)Suivi des différents incidents déclarés', 'https://www.puf.com/sites/default/files/kcfinder/images/humensis%20baseline.png'),
('7c225dce-2e97-4aec-82bd-8a09a6539db8', 'Technicien informatique', 'COPY-TOP', ' Paris 75', '21-01-2019', 'Rattaché au Responsable d’Exploitation, vos missions au quotidien seront :\nLa gestion et la maintenance du parc informatique (PC/MAC)\nL’installation et la mise à jour des logiciels et applications métiers\nLes connexions RIP et paramétrages des drivers d\'impression (PC/MAC)\nL’assistance aux utilisateurs et la définition des procédures courantes de maintenance\nLa supervision des réseaux LAN et VPN\nLa veille technologique, les préconisations d’amélioration, le reporting d’activité', 'https://upload.wikimedia.org/wikipedia/commons/a/a7/Logo-COPY-TOP.png'),
('bf506729-d3f6-49f3-b11f-69e0ca9f3d6a', 'Product Owner / Designer', 'Jellysmack', ' Levallois-Perret(92)', '01-03-2019', 'Aujourd\'hui, nous avons besoin d\'agrandir l\'équipe Produit et de la renforcer avec un Product Owner à très forte sensibilité UI/UX pour améliorer et soutenir le développement des différents produits, en collaboration avec le Product Manager, Product Designer et l\'équipe Tech (développeurs et data scientistes).\nVos missions seront de :\nTraduire les besoins utilisateurs en fonctionnalités,\nProduire les interfaces Sketch,\nSpécifier les fonctionnalités sous formes d\'User Story,\nDéfinir et maintenir le backlog et prioriser les développements au travers de Weekly Goals,\nFaire le suivi des développements et les recettes fonctionnelles et visuelles,\nCommuniquer sur l\'avancement de la réalisation du produit auprès du reste de l\'équipe.', 'https://cdn.welcometothejungle.co/uploads/organization/logo/9100/151516/keli-network.png'),
('bdada5eb-dbf9-443f-95d6-eee9f7817abb', 'Technicien d\'exploitation réseaux', 'Orange', ' Massy(91)', '17-01-2019', '   Vous intégrez l\'entité gérant l\'activité des Services Managés en charge de la supervision et de l\'exploitation des Systèmes d\'Informations directement de nos clients grands comptes ;\nAu sein de cette équipe, vous serez assurerez la bonne coordination et prise en charge des problématiques remontées par le client. Vos missions seront les suivantes :\nAdministrer et exploiter les solutions informatiques implémentées chez nos clients,\nGérer les incidents et changements de niveau 1,\nParticiper à la rédaction des procédures d\'exploitation du niveau 1,\nOrienter les escalades vers le niveau 2 ou les services compétents,\nAssurer un reporting de l\'activité déployée chez le client.', 'https://www.castorette.paris/wp-content/uploads/2018/07/orange-logo.jpg'),
('14f5dcdf-44e5-4317-aac6-c6b97062f005', 'STAGE - ASSISTANT IT ANALYST', 'BNP Paribas Securities Services', 'Pantin(93)', '21-01-2019', 'Votre activité sera rythmée par l’analyse et le développement d’un outil de suivi interne : l’opportunité d’accéder à un poste à responsabilités dès le début de votre parcours chez BNP Paribas !\n\nVous recevrez les instructions et veillerez à leur bon déroulement :\nDans un premier temps le collaborateur aura en charge d\'effectuer l\'analyse du support fonctionnel relatif à un outil de suivi de l\'activité, utilisée par les responsables IT et MOA, qui est également un outil de suivi des dépenses en liaison avec d’autres logiciels. La version 1 de l\'outil est composée :\nd\'une application développée en PowerBuilder,\nd\'une base de données Sybase.\nDans un second temps, le collaborateur travaillera sur la nouvelle version de l’outil. La refonte en cours s\'effectue en mode AGILE sous JAVA EXTJS et Postgresql.   ', 'https://d29dpxox3qezd.cloudfront.net/uploads/mentor/5b8a6555030bae6d40d6173c/logo.png'),
('b8fa433d-d9d6-44de-bafa-39755ca3f34d', 'Administrateur Système et Réseau', 'ACCENGAGE', 'Paris(75)', '18-02-2019', 'Gestion du parc informatique sous l’assistance du pôle Opérationnel \n\nGestion et résolution des actions de support coté infrastructure \n\nGestion et résolution des tickets et support interne via freshdesk \n\nParticipation au projet de migration bigdata et autres évolutions internes \n\nSous la direction du Référent infra & Production vous interviendrez dans un environnement challengeant sur des technologies innovantes (big data, cloud…) sur une infrastructure à fort trafic. \n\n  ', 'https://www.accengage.com/wp-content/uploads/2014/04/accengage-logo-job-offers-v3-GRAND-FORMAT.png');

-- --------------------------------------------------------

--
-- Table structure for table `recruteur`
--

CREATE TABLE `recruteur` (
  `id_recruteur` int(11) NOT NULL,
  `nom` varchar(80) DEFAULT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telephone` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recruteur`
--

INSERT INTO `recruteur` (`id_recruteur`, `nom`, `prenom`, `email`, `telephone`) VALUES
(1, 'Tresh', 'Holden', 't.holden@gmail.com', '06787878');

-- --------------------------------------------------------

--
-- Table structure for table `recruteur_offre`
--

CREATE TABLE `recruteur_offre` (
  `id_recruteur` int(11) NOT NULL,
  `id_offre` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recruteur_offre`
--

INSERT INTO `recruteur_offre` (`id_recruteur`, `id_offre`) VALUES
(1, '14f5dcdf-44e5-4317-aac6-c6b97062f005'),
(1, 'aaf880c7-3a00-4f9a-bc4f-f994badbcc43'),
(1, '7c225dce-2e97-4aec-82bd-8a09a6539db8'),
(1, 'b8fa433d-d9d6-44de-bafa-39755ca3f34d'),
(1, 'bf506729-d3f6-49f3-b11f-69e0ca9f3d6a'),
(1, 'bdada5eb-dbf9-443f-95d6-eee9f7817abb');

-- --------------------------------------------------------

--
-- Table structure for table `rendez_vous`
--

CREATE TABLE `rendez_vous` (
  `id_rdv` int(11) NOT NULL,
  `id_offre` varchar(200) NOT NULL,
  `id_candidat` int(11) NOT NULL,
  `id_recruteur` int(11) NOT NULL,
  `date` varchar(10) NOT NULL,
  `time` varchar(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

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
-- Indexes for table `favoris`
--
ALTER TABLE `favoris`
  ADD PRIMARY KEY (`id_candidat`,`id_offre`),
  ADD KEY `id_offre` (`id_offre`);

--
-- Indexes for table `offre`
--
ALTER TABLE `offre`
  ADD PRIMARY KEY (`id_offre`);

--
-- Indexes for table `recruteur`
--
ALTER TABLE `recruteur`
  ADD PRIMARY KEY (`id_recruteur`);

--
-- Indexes for table `recruteur_offre`
--
ALTER TABLE `recruteur_offre`
  ADD PRIMARY KEY (`id_offre`),
  ADD KEY `id_offre` (`id_offre`);

--
-- Indexes for table `rendez_vous`
--
ALTER TABLE `rendez_vous`
  ADD PRIMARY KEY (`id_rdv`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `candidat`
--
ALTER TABLE `candidat`
  MODIFY `id_candidat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `recruteur`
--
ALTER TABLE `recruteur`
  MODIFY `id_recruteur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `rendez_vous`
--
ALTER TABLE `rendez_vous`
  MODIFY `id_rdv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;