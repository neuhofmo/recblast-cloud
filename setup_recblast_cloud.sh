#! /bin/bash

# register a user in AWS (explain how)
# go to AWS marketplace
# choose ubuntu? (add link)
# sizes, comp, etc.

# getting the script
# TODO upload it and write a wget

# save cloud image??? 
# AWS marketplace?

#######


# updating and downloading
echo "Updating the system and installing packages:"
sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get upgrade
sudo apt-get install python  # test
sudo apt-get install make gcc perl-doc libblas-dev liblist-moreutils-perl git liblapack-dev gfortran python-numpy python-scipy python-matplotlib ipython ipython-notebook python-pandas python-sympy python-nose python-pip

# python
# echo "Downloading Python2.7.11:"
# cd ~
# wget https://www.python.org/ftp/python/2.7.11/Python-2.7.11.tgz
# tar xfz Python-2.7.11.tgz
# rm Python-2.7.11.tgz
# cd Python-2.7.11/
# echo "Installing Python2.7.11:"
# ./configure --prefix /usr/local/lib/python2.7.11 --enable-ipv6
# make
# sudo make install
# test:
# pythonver=`/usr/local/lib/python2.7.11/bin/python -V 2>&1`
# if [ "$pythonver" = "Python 2.7.11" ] 
# then 
# 	echo "$pythonver installed successfully!"
# else
# 	echo "Problem with installing $pythonver!"
# 	echo "Quitting."
# 	exit 1
# fi

# download blast
echo "Downloading BLAST+:"
cd ~
wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/2.6.0/ncbi-blast-2.6.0+-x64-linux.tar.gz
tar zxf ncbi-blast-2.6.0+-x64-linux.tar.gz
rm ncbi-blast-2.6.0+-x64-linux.tar.gz
cd ~/ncbi-blast-2.6.0+/bin/
export PATH=$PATH:/home/ubuntu/ncbi-blast-2.6.0+/bin


# updating environment variables
echo "Adding environment variables to path..."
echo "# Updating path to include blast path" >> ~/.bash_profile
echo "export PATH=\$PATH:/home/ubuntu/ncbi-blast-2.6.0+/bin" >> ~/.bash_profile
echo "# Updating BLASTDB path" >> ~/.bash_profile
echo "export BLASTDB=/home/ubuntu/blastdb" >> ~/.bash_profile

# download DB, decompress
echo "Downloading BLAST databases:"
mkdir ~/blastdb
cd ~/blastdb
export BLASTDB=/home/ubuntu/blastdb
echo "Downloading NR:"
update_blastdb.pl --passive --decompress nr
echo "Downloading TAXDB:"
update_blastdb.pl --passive --decompress taxdb

# don't need the manual method:
## wget ftp://ftp.ncbi.nlm.nih.gov/blast/db/nr.*.tar.gz
## gunzip nr.*.tar.gz

# download recblast
echo "Downloading RecBlast:"
git clone https://github.com/neuhofmo/RecBlast.git
cd RecBlast

# install requirements
echo "Installing Python2 requirements:"
sudo python2 -m pip install -r requirements.txt

echo "All system updates, dependencies, requirements and software installed successfully."
echo "Run RecBlast from /users/ubuntu/RecBlast/"
echo "cd ~/RecBlast"
echo "./RecBlast.py --help"

echo "Good luck!"
