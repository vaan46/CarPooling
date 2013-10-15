modifica

DROP DATABASE IF EXISTS CarPooling;
CREATE DATABASE CarPooling;
USE CarPooling;

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


CREATE TABLE `utente` (
    `username` varchar(20) NOT NULL,
    `password` varchar(20) DEFAULT NULL,
    `nome` varchar(20) DEFAULT NULL,
    `cognome` varchar(20) DEFAULT NULL,
    `data_nascita` date DEFAULT NULL,
    `citta_nascita` varchar(30) DEFAULT NULL,
    `citta_residenza` varchar(30) DEFAULT NULL,
    `codice_fiscale` varchar(16) DEFAULT NULL,
    `email` varchar(30) DEFAULT NULL,
    `num_telefono` varchar(15) DEFAULT NULL,
    PRIMARY KEY (`username`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `guidatore` (
    `num_viaggio` int NOT NULL,
    `username` varchar(20) NOT NULL, 
    `media_feedback` float DEFAULT NULL,
    `commento` varchar(300) DEFAULT NULL,
    PRIMARY KEY(`num_viaggio`),
    FOREIGN KEY(`username`) REFERENCES `utente`(`username`)
);

CREATE TABLE `passeggero` (
    `username` varchar(20) NOT NULL,
    `num_viaggio` int NOT NULL,
    `feedback_pass` float DEFAULT NULL,
    `commento_pass` varchar(300) DEFAULT NULL,
    `feedback_guid` float DEFAULT NULL,
    `commento_guid` varchar(300) DEFAULT NULL,
    PRIMARY KEY `user_viaggio` (`username`,`num_viaggio`),
    FOREIGN KEY(`num_viaggio`) REFERENCES `viaggio`(`num_viaggio`),
    FOREIGN KEY(`username`) REFERENCES `utente`(`username`)
);

CREATE TABLE `viaggio` (
    `num_viaggio` int NOT NULL,
    `username` varchar(20) NOT NULL,
    `citta_partenza` varchar(30) NOT NULL,
    `data_partenza` date NOT NULL,
    `citta_arrivo` varchar(30) NOT NULL,
    `note` varchar(300) DEFAULT NULL,
    `targa` varchar(10) NOT NULL,
    PRIMARY KEY (`num_viaggio`),
    FOREIGN KEY (`targa`) REFERENCES `veicolo`(`targa`),
    FOREIGN KEY (`username`) REFERENCES `utente`(`username`)
);

CREATE TABLE `veicolo` (
    `targa` varchar(10) NOT NULL,
    `username` varchar(20) NOT NULL,
    `tipo` varchar(20) DEFAULT NULL,
    `num_posti` int NOT NULL,
    `carburante` varchar(15) DEFAULT NULL,
    `consumo_medio` float DEFAULT NULL,
    PRIMARY KEY (`targa`),
    FOREIGN KEY (`username`) REFERENCES `utente`(`username`)
);

