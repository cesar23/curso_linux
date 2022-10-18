#bytesToHumanReadable() {
#    local i=${1:-0} d="" s=0 S=("Bytes" "KiB" "MiB" "GiB" "TiB" "PiB" "EiB" "YiB" "ZiB")
#    while ((i > 1024 && s < ${#S[@]}-1)); do
#        printf -v d ".%02d" $((i % 1024 * 100 / 1024))
#        i=$((i / 1024))
#        s=$((s + 1))
#    done
#    echo "$i$d ${S[$s]}"
#}

kiloBytes_To_HumanReadable() {
    local i=${1:-0} d="" s=0 S=("Bytes" "KiB" "MiB" "GiB" "TiB" "PiB" "EiB" "YiB" "ZiB")
    # ::: start - aqui yo lo sobre escribi para que convierta bytes a kilobytes
    local j=$(( i * 1000))
    # ::: end - aqui yo lo sobre escribi para que convierta bytes a kilobytes
    while ((j > 1024 && s < ${#S[@]}-1)); do
        printf -v d ".%02d" $((j % 1024 * 100 / 1024))
        j=$((j / 1024))
        s=$((s + 1))
    done
    echo "$j$d ${S[$s]}"
}
kiloBytes_To_HumanReadable 958504
