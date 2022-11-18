<?php

function getIpRang(  $cidr) {

    list($ip, $mask) = explode('/', $cidr);

    $maskBinStr =str_repeat("1", $mask ) . str_repeat("0", 32-$mask );      //net mask binary string
    $inverseMaskBinStr = str_repeat("0", $mask ) . str_repeat("1",  32-$mask ); //inverse mask

    $ipLong = ip2long( $ip );
    $ipMaskLong = bindec( $maskBinStr );
    $inverseIpMaskLong = bindec( $inverseMaskBinStr );
    $netWork = $ipLong & $ipMaskLong;

    $start = $netWork+1;//去掉网络号 ,ignore network ID(eg: 192.168.1.0)

    $end = ($netWork | $inverseIpMaskLong) -1 ; //去掉广播地址 ignore brocast IP(eg: 192.168.1.255)
    return array( $start, $end );
}
list( $long_startIp , $long_endIp) = getIpRang( "56.15.0.6/16" );
echo "start ip:" . long2ip( $long_startIp );
echo "<br />";
echo "end ip:" . long2ip( $long_endIp );



function ip_in_network($ip, $net_addr, $net_mask){
    if($net_mask <= 0){ return false; }
    $ip_binary_string = sprintf("%032b",ip2long($ip));
    $net_binary_string = sprintf("%032b",ip2long($net_addr));
    return (substr_compare($ip_binary_string,$net_binary_string,0,$net_mask) === 0);
}
echo "\n";
$enred=ip_in_network("201.234.112.134","201.234.0.0",17 ); //true
echo $enred;
function encode_ip ($ip)
{
    $d = explode('.', $ip);
    if (count($d) == 4) return sprintf('%02x%02x%02x%02x', $d[0], $d[1], $d[2], $d[3]);

    $d = explode(':', preg_replace('/(^:)|(:$)/', '', $ip));
    $res = '';
    foreach ($d as $x)
        $res .= sprintf('%0'. ($x == '' ? (9 - count($d)) * 4 : 4) .'s', $x);
    return $res;
}

// decoded
function decode_ip($int_ip)
{
    function hexhex($value) { return dechex(hexdec($value)); };

    if (strlen($int_ip) == 32) {
        $int_ip = substr(chunk_split($int_ip, 4, ':'), 0, 39);
        $int_ip = ':'. implode(':', array_map("hexhex", explode(':',$int_ip))) .':';
        preg_match_all("/(:0)+/", $int_ip, $zeros);
        if (count($zeros[0]) > 0) {
            $match = '';
            foreach($zeros[0] as $zero)
                if (strlen($zero) > strlen($match))
                    $match = $zero;
            $int_ip = preg_replace('/'. $match .'/', ':', $int_ip, 1);
        }
        return preg_replace('/(^:([^:]))|(([^:]):$)/', '$2$4', $int_ip);
    }
    $hexipbang = explode('.', chunk_split($int_ip, 2, '.'));
    return hexdec($hexipbang[0]). '.' . hexdec($hexipbang[1]) . '.' . hexdec($hexipbang[2]) . '.' . hexdec($hexipbang[3]);
}

echo "\n";
$enred=encode_ip("201.234.112.134"); //true
echo $enred;
