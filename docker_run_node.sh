#!/usr/bin/env bash
die () {
    echo >&2 "$@"
	echo 
    exit 1
}

[ "$#" -eq 3 ] || die "Eksempel: docker_run_node.sh 10.0.2.25 8080 apps/webapp.js"
echo $1 | grep -E -q '^([0-9]{1,3}\.){3}[0-9]{1,3}$' || die "IP-addresse ugyldig, $1"
echo $2 | grep -E -q '^([0-9]{1,5})$' || die "Portnummer ugyldig, $2"
echo $3 | grep -E -q '([a-zA-Z0-9]\.js)$' || die "Spesifiser et node script, $3"

COMMAND="sudo ip addr add $1/21 dev eth0"
echo "Running '$COMMAND'"
$($COMMAND)
CONTAINER_NAME="$(echo $3 | grep -E -o '[^/]([^/]+)/?$')__$1"
COMMAND="docker run -it -d --hostname $1 --name $CONTAINER_NAME -p $1:$2:$2 -v /vagrant:/opt/vagrant dockerfile/nodejs node /opt/vagrant/$3 $1 $2"
echo "Running '$COMMAND'"
CID="$($COMMAND)"
echo
echo
echo "Taile loggen: "
echo "	docker logs -f $CID"
echo "Statistikk: "
echo "	docker stats $CID"
echo "SSHe inn i container: "
echo "	docker exec -it $CID bash"
echo "Stoppe: "
echo "	docker stop $CID"
echo "Starte: "
echo "	docker start $CID"
echo "Fjern: "
echo "	docker rm -f $CID"
echo
echo
echo

