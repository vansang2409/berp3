-- ============================================================================
-- Copyright (C) 2016		
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

ALTER TABLE llx_website_page ADD UNIQUE INDEX uk_website_page_url (fk_website, pageurl);

ALTER TABLE llx_website_page ADD CONSTRAINT fk_website_page_website FOREIGN KEY (fk_website) REFERENCES llx_website (rowid);

