#!/usr/bin/env dash
#

set -e

. /usr/share/openmediavault/scripts/helper-functions

########################################################################
# Update the configuration.
# <config>
#   <services>
#     <iperf3>
#       <enable>0|1</enable>
#     </iperf3>
#   </services>
# </config>
########################################################################
if ! omv_config_exists "/config/services/iperf3"; then
        omv_config_add_node "/config/services" "iperf3"
        omv_config_add_key "/config/services/iperf3" "enable" "0"
fi

exit 0
