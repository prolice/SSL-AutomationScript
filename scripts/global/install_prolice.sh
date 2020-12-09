#!/bin/bash
mkdir foundryssl
echo '#!/bin/bash' >> foundryssl/variables.sh

echo 'Your FoundryData folder:'
read -p 'Foundry Data Path=' -e -i '.local/share/FoundryVTT/Config' foundrydata
echo 'foundrydata='$foundrydata >> foundryssl/variables.sh

echo 'Your FQDN (Full Qualified Domain Name) : <domain.com>'
read fqdn
echo 'fqdn='$fqdn >> foundryssl/variables.sh

echo 'Your subdomain name: <foundry>.domain.com *** ONLY THE FIRST PART BEFORE .domain.com in this case <foundry>' 
read subdomain
echo 'subdomain='$subdomain >> foundryssl/variables.sh

echo 'Your valid email'
read email
echo 'email='$email >> foundryssl/variables.sh

echo 'currentuser='$(whoami) >> foundryssl/variables.sh

sudo chown root:root foundryssl/variables.sh
sudo chmod 700 foundryssl/variables.sh

sudo ./SSL-AutomationScript/scripts/global/certbot.sh
