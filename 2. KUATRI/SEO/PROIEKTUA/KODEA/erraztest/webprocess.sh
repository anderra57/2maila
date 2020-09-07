#!/bin/bash
DIRVIRTPYTHON='python3envmetrix'
source /var/www/html/erraztest/python3envmetrix/bin/activate
echo "`id`"
python3 $(dirname "$0")/complejidadtextual.py $1
deactivate


