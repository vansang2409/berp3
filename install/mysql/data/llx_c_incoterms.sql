-- Copyright (C) 2001-2004 
-- Copyright (C) 2003         
-- Copyright (C) 2004-2009 
-- Copyright (C) 2004             
-- Copyright (C) 2004        
-- Copyright (C) 2005-2009 
-- Copyright (C) 2007 	          
-- Copyright (C) 2020                   <software@berp3bit.de>
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program. If not, see <https://www.gnu.org/licenses/>.
--
--

--
-- Do not place a comment at the end of the line, this file is parsed when
-- from the install and all '--' are removed.
--
-- Ne pas placer de commentaire en fin de ligne, ce fichier est parsé lors
-- de l'install et tous les sigles '--' sont supprimés.
--


INSERT INTO llx_c_incoterms (code, label, libelle, active) VALUES ('EXW', 'Ex Works', 'Ex Works, au départ non chargé, non dédouané sortie d''usine (uniquement adapté aux flux domestiques, nationaux)', 1);
INSERT INTO llx_c_incoterms (code, label, libelle, active) VALUES ('FCA', 'Free Carrier', 'Free Carrier, marchandises dédouanées et chargées dans le pays de départ, chez le vendeur ou chez le commissionnaire de transport de l''acheteur', 1);
INSERT INTO llx_c_incoterms (code, label, libelle, active) VALUES ('FAS', 'Free Alongside Ship', 'Free Alongside Ship, sur le quai du port de départ', 1);
INSERT INTO llx_c_incoterms (code, label, libelle, active) VALUES ('FOB', 'Free On Board', 'Free On Board, chargé sur le bateau, les frais de chargement dans celui-ci étant fonction du liner term indiqué par la compagnie maritime (à la charge du vendeur)', 1);
INSERT INTO llx_c_incoterms (code, label, libelle, active) VALUES ('CFR', 'Cost and Freight', 'Cost and Freight, chargé dans le bateau, livraison au port de départ, frais payés jusqu''au port d''arrivée, sans assurance pour le transport, non déchargé du navire à destination (les frais de déchargement sont inclus ou non au port d''arrivée)', 1);
INSERT INTO llx_c_incoterms (code, label, libelle, active) VALUES ('CIF', 'Cost, Insurance, Freight', 'Cost, Insurance and Freight, chargé sur le bateau, frais jusqu''au port d''arrivée, avec l''assurance marchandise transportée souscrite par le vendeur pour le compte de l''acheteur', 1);
INSERT INTO llx_c_incoterms (code, label, libelle, active) VALUES ('CPT', 'Carriage Paid To', 'Carriage Paid To, livraison au premier transporteur, frais jusqu''au déchargement du mode de transport, sans assurance pour le transport', 1);
INSERT INTO llx_c_incoterms (code, label, libelle, active) VALUES ('CIP', 'Carriage Insurance Paid', 'Carriage and Insurance Paid to, idem CPT, avec assurance marchandise transportée souscrite par le vendeur pour le compte de l''acheteur', 1);
INSERT INTO llx_c_incoterms (code, label, libelle, active) VALUES ('DAT', 'Delivered At Terminal', 'Delivered At Terminal, marchandises (déchargées) livrées sur quai, dans un terminal maritime, fluvial, aérien, routier ou ferroviaire désigné (dédouanement import, et post-acheminement payés par l''acheteur)', 1);
INSERT INTO llx_c_incoterms (code, label, libelle, active) VALUES ('DAP', 'Delivered At Place', 'Delivered At Place, marchandises (non déchargées) mises à disposition de l''acheteur dans le pays d''importation au lieu précisé dans le contrat (déchargement, dédouanement import payé par l''acheteur)', 1);
INSERT INTO llx_c_incoterms (code, label, libelle, active) VALUES ('DDP', 'Delivered Duty Paid', 'Delivered Duty Paid, marchandises (non déchargées) livrées à destination finale, dédouanement import et taxes à la charge du vendeur ; l''acheteur prend en charge uniquement le déchargement (si exclusion des taxes type TVA, le préciser clairement)', 1);
INSERT INTO llx_c_incoterms (code, label, libelle, active) VALUES ('DPU', 'Delivered at Place Unloaded', 'Delivered at Place unloaded', 1);
