#!/usr/bin/env bash
die () {
    echo >&2 "$@"
	echo 
    exit 1
}

[ "$#" -eq 3 ] || die "Eksempel: docker_run_jar.sh 10.0.2.25 8080 apps/gs-spring-boot-0.1.0.jar"
echo $1 | grep -E -q '^([0-9]{1,3}\.){3}[0-9]{1,3}$' || die "IP-addresse ugyldig, $1"
echo $2 | grep -E -q '^([0-9]{1,5})$' || die "Portnummer ugyldig, $2"
echo $3 | grep -E -q '([a-zA-Z0-9]\.jar)$' || die "Spesifiser en kjørbar .jar-fil, $3"

COMMAND="sudo ip addr add $1/21 dev eth0"
echo "Running '$COMMAND'"
$($COMMAND)
CONTAINER_NAME="$(echo $3 | grep -E -o '[^/]([^/]+)/?$')__$1"
COMMAND="docker run --hostname $1 --name $CONTAINER_NAME -p $1:$2:$2 -d -v /vagrant:/opt/vagrant -it dockerfile/java:oracle-java8 java -jar -Dserver.port=$2 /opt/vagrant/$3"
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



