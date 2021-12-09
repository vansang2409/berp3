-- Copyright (C) 2001-2004 
-- Copyright (C) 2003         
-- Copyright (C) 2004-2009 
-- Copyright (C) 2004             
-- Copyright (C) 2004        
-- Copyright (C) 2005-2009 
-- Copyright (C) 2007 	          
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
-- Ne pas placer de commentaire en fin de ligne, ce fichier est parsé lors
-- de l'install et tous les sigles '--' sont supprimés.
--


INSERT INTO llx_c_input_method (rowid, code, libelle, active) VALUES (1, 'OrderByMail',  'Courrier',  1);
INSERT INTO llx_c_input_method (rowid, code, libelle, active) VALUES (2, 'OrderByFax',   'Fax',       1);
INSERT INTO llx_c_input_method (rowid, code, libelle, active) VALUES (3, 'OrderByEMail', 'EMail',     1);
INSERT INTO llx_c_input_method (rowid, code, libelle, active) VALUES (4, 'OrderByPhone', 'Téléphone', 1);
INSERT INTO llx_c_input_method (rowid, code, libelle, active) VALUES (5, 'OrderByWWW',   'En ligne',  1);
