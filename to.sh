APP=$(basename $PWD)
IMG_REPO=quay.io/fdeutsch/$APP
NS=$APP
SA=$NS

build() {
  podman -r build -t $IMG_REPO -f Containerfile .
}

push() {
  podman -r push $IMG_REPO
}

i() { echo "i: $@"; }
x() { echo "\$ $@" ; eval "$@" ; }
die() { echo "err: $@" ; exit 1; }
_oc() { echo "$ oc $@" ; oc $@ ; }
qoc() { oc $@ > /dev/null 2>&1; }

deploy() {
  _oc apply -f manifests/app.yaml
}

destroy() {
  _oc delete -f manifests/app.yaml
}

usage() {
  grep -E -o "^.*\(\)" $0
}

eval "${@:-usage}"
