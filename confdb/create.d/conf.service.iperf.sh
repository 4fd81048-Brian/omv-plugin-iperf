#!/usr/bin/env dash
#
# This file is part of OpenMediaVault.
#
# @license   http://www.gnu.org/licenses/gpl.html GPL Version 3
# @author    Volker Theile <volker.theile@openmediavault.org>
# @copyright Copyright (c) 2009-2023 Volker Theile
#
# OpenMediaVault is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
#
# OpenMediaVault is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with OpenMediaVault. If not, see <http://www.gnu.org/licenses/>.

set -e

. /usr/share/openmediavault/scripts/helper-functions

########################################################################
# Update the configuration.
# <config>
#   <services>
#     <iperf>
#       <enable>0|1</enable>
#       <host></host>
#       <port>5201</port>
#       <udp>0|1</udp>
#       <parallel>1</parallel>
#       <reverse>0|1</reverse>
#     </iperf>
#   </services>
# </config>
########################################################################
if ! omv_config_exists "/config/services/iperf"; then
        omv_config_add_node "/config/services" "iperf"
        omv_config_add_key "/config/services/iperf" "enable" "0"
        omv_config_add_key "/config/services/iperf" "host" ""
        omv_config_add_key "/config/services/iperf" "port" "5201"
        omv_config_add_key "/config/services/iperf" "udp" "0"
        omv_config_add_key "/config/services/iperf" "parallel" "1"
        omv_config_add_key "/config/services/iperf" "reverse" "0"
fi

exit 0
