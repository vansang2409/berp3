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

--
-- Types etat propales
--

delete from llx_c_propalst;
insert into llx_c_propalst (id,code,label) values (0, 'PR_DRAFT',     'Brouillon');
insert into llx_c_propalst (id,code,label) values (1, 'PR_OPEN',      'Ouverte');
insert into llx_c_propalst (id,code,label) values (2, 'PR_SIGNED',    'Signée');
insert into llx_c_propalst (id,code,label) values (3, 'PR_NOTSIGNED', 'Non Signée');
insert into llx_c_propalst (id,code,label) values (4, 'PR_FAC',       'Facturée');
