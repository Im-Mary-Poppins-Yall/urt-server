# urt-server

> An Urban Terror server configuration repository

This repository should be cloned and merged with an actual installation of Urban Terror.

It sets sensible defaults for the configuration of a LAN server. Since this is not a server that stays up but rather one that is started occasionally, there are scripts that make sure it doesn't always start on the same map.

The file [ut_prepare_server.sh](./ut_prepare_server.sh):

* shuffles the maps from [mapcycle_unshuffled.txt](./q3ut4/mapcycle_unshuffled.txt) and writes them in the file `q3ut4/mapcycle.txt` (git-ignored for obvious reasons)
* reads the [server_no_map.cfg](./q3ut4/server_no_map.cfg) file, prompts for the rcon password, and switches the first map to match the first map of the new map cycle so the server immediately starts with a different map each time

The file [ut_launch.bat](./ut_launch.bat) shuffles the maps in the map cycle and runs the server. It unfortunately doesn't update the server configuration because that's beyond my batch abilities.
