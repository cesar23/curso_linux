#correr python desde shell linux

CURRENT_DIR=$(dirname $0)
port=8082

python server_python.py $port "${CURRENT_DIR}"
