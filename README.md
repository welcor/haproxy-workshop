# HAProxy workshop
## Hjemmelekse
* Last ned [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* Last ned [Vagrant](http://downloads.vagrantup.com/)
* ```git clone git@github.com:snorrebrandstadmoen/haproxy-workshop.git```
* ```cd haproxy-workshop```
* ```vagrant up``` Konfigurerer og starter opp en VM med HAProxy provisjonert inn (laster ned en del data og tar litt tid)
* ```vagrant ssh``` Logg inn i VM
* ```vagrant halt``` Stopp VM
* ```vagrant reload``` Last opp med ny Vagrant-konfigurasjon

## Introduksjon

## Ressurser
* http://cbonte.github.io/haproxy-dconv/configuration-1.5.html

## Oppgaver
 * Enkel lastbalansering mellom 2 servere
   * Level 4
   * Level 7
 * Nedetidsfri deploy
 * Consul?
