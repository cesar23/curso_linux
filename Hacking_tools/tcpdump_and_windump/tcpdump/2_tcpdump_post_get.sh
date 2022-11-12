# fuente : https://www.middlewareinventory.com/blog/tcpdump-capture-http-get-post-requests-apache-weblogic-websphere/


tcpdump -i enp0s8 -s 0 -A 'tcp[((tcp[12:1] & 0xf0) >> 2):4] = 0x47455420'


# Here 0x47455420 depicts the ASCII value of  characters  'G' 'E' 'T' ' '

#    Character	ASCII Value
#    G	47
#    E	45
#    T	54
#    Space	20
