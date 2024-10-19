# Automation
## Objectif
- Avoir à disposition un environment de travail local pour ansible.
- Ecrire des scripts de configuration de machine.

# Utilisation
## Ansible
Utiliser VsCode depuis le devcontainer. 
## VM
### Prérequis
- Windows 10/11
- Virtualbox 7.0.20
- Vagrant
### Start
Depuis le répertoire src
```pwsh
vagrant plugin install vagrant-vbguest
vagrant up
```

# Limitations
## Réseau
Cela peut être un challenge de faire communiquer une wsl avec une VM virtualbox sur un réseau privé.  
Surtout sur des configurations utilisant des vpn, des pare-feux et des commutateurs Hyper-V.
## Virtualisation
- La virtualisation de VirtualBox, pour Vagrant, se fait directement sur le hardware.  
- Celle de Hyper-v, pour WSL, se fait aussi directement sur le hardware.  
- Sur les matériels ordinaires, il ne peut que y avoir qu'un seul hyperviseur connecté.  

Ce qui fait que Hyper-V prend le contrôle de la virtualisation et Virtualbox doit virtualiser sur une interface Hyper-V. Cela diminue les performances (50%?).  
Cependant, vu la faible demande en ressource de ce projet, cela n'a pas d'impact.
