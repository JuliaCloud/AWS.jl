sudo apt-get -y install software-properties-common
sudo add-apt-repository -y ppa:staticfloat/julianightlies
sudo add-apt-repository -y ppa:staticfloat/julia-deps

sudo apt-get -y update

# sudo apt-get -y install build-essential libreadline-dev libncurses-dev libpcre3-dev libssl-dev python-dev libgnutls28 wget file
sudo apt-get -y install julia

# sudo apt-get -y install python-setuptools
# sudo easy_install ipython[all]
# 
# ipython profile create julia
# #apt-get -y install libzmq-dev
# julia -e 'Pkg.init(); Pkg.add("IJulia"); Pkg.add("PyPlot"); Pkg.add("Gadfly");'
# 
# echo "c.NotebookApp.open_browser = False" >> /home/ubuntu/.ipython/profile_julia/ipython_notebook_config.py
# echo "c.NotebookApp.ip = \"*\"" >> /home/ubuntu/.ipython/profile_julia/ipython_notebook_config.py

sudo echo "*             soft       nofile          8192" | sudo tee -a  /etc/security/limits.conf
sudo echo "*             hard       nofile          8192" | sudo tee -a  /etc/security/limits.conf

sudo echo "MaxStartups    10000" | sudo tee -a /etc/ssh/sshd_config





