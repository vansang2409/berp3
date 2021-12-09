-- ============================================================================
-- Copyright (C) 2007-2009		
-- Copyright (C) 2009-2012			
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
-- ============================================================================

create table llx_categorie_website_page
(
  fk_categorie  	integer NOT NULL,
  fk_website_page   integer NOT NULL,
  import_key    	varchar(14)
)ENGINE=innodb;