PUSHD %~dp0
SET scriptDir=%CD%
POPD

TYPE %scriptDir%\q3ut4\mapcycle_unshuffled.txt | %scriptDir%\Shuffle.bat > %scriptDir%\q3ut4\mapcycle.txt
%scriptDir%\Quake3-UrT-Ded.exe +exec server.cfg
