-- ============================================================================
-- Copyright (C) 2005      
-- Copyright (C) 2005-2017 
-- Copyright (C) 2005-2009 
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
-- ===========================================================================

create table llx_usergroup
(
  rowid         integer AUTO_INCREMENT PRIMARY KEY,
  nom           varchar(180) NOT NULL,
  entity        integer DEFAULT 1 NOT NULL,	-- multi company id
  datec         datetime,
  tms           timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  note          text,
  model_pdf     varchar(255) DEFAULT NULL
)ENGINE=innodb;

-- 
-- List of codes for the field entity
--
-- 0 : global group
-- 1 : first company group
-- 2 : second company group
-- 3 : etc...
--
