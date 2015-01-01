# About

Script based on 
https://www.digitalocean.com/community/tutorials/how-to-add-swap-on-ubuntu-14-04
and written for fast adding SWAP on Ubuntu.

# Usage
cd /tmp
wget https://raw.githubusercontent.com/igormukhingmailcom/digitalocean-make-swap-on-ubuntu/master/make-swap.sh
chmod a+x make-swap.sh
sudo ./make-swap.sh /swapfile 4G
free # Check result
rm make-swap.sh