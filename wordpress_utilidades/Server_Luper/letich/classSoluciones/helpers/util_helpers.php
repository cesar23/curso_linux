<?php
if (!function_exists('phpConsoleLog')) {
	function phpConsoleLog($data,$label=''){

		if (gettype($data) == "array") {

			echo "<script>";
			if($label!=''){echo "console.group('".$label."');";}
			echo "console.log('debugWP (array):'," . json_encode($data) . ");";
			if($label!=''){echo "console.groupEnd();";}
			echo "</script>";
		} else if (gettype($data) == "object") {


			echo "<script>";
			if($label!=''){echo "console.group('".$label."');";}
			echo "console.log('debugWP (Object):'," . json_encode($data) . ");";
			if($label!=''){echo "console.groupEnd();";}
			echo "</script>";


		} else if (gettype($data) == "integer") {
			echo "<script>";
			if($label!=''){echo "console.group('".$label."');";}
			echo "console.log('debugWP (Integer):'," . json_encode($data) . ");";
			if($label!=''){echo "console.groupEnd();";}
			echo "</script>";


		} else if (gettype($data) == "double") {
			echo "<script>";
			if($label!=''){echo "console.group('".$label."');";}
			echo "console.log('debugWP (double):'," . json_encode($data) . ");";
			if($label!=''){echo "console.groupEnd();";}
			echo "</script>";


		} else {
			echo "<script>";
			if($label!=''){echo "console.group('".$label."');";}
			echo "console.log('debugWP (string):'," . json_encode($data) . ");";
			if($label!=''){echo "console.groupEnd();";}
			echo "</script>";
		}
	}

}
if (!function_exists('isIpv4')) {
	function isIpv4( $ip ) {
		if ( 4 === (int) strlen( inet_pton( $ip ) ) ) {
			return true;
		}
		return false;
	}
}

if (!function_exists('getClientIp_onlyIpv4')) {
	function getClientIp_onlyIpv4() {
		$ipaddress = '';
		if ( isset( $_SERVER['HTTP_CLIENT_IP']) ) {
			$ipaddress = $_SERVER['HTTP_CLIENT_IP'];
			if(!isIpv4($ipaddress)){
				$ipaddress = $_SERVER['REMOTE_ADDR'];

			}
		} else if ( isset( $_SERVER['HTTP_X_FORWARDED_FOR'] ) ) {
			$ipaddress = $_SERVER['HTTP_X_FORWARDED_FOR'];
			if(!isIpv4($ipaddress)){
				$ipaddress = $_SERVER['REMOTE_ADDR'];

			}
		} else if ( isset( $_SERVER['HTTP_X_FORWARDED'] ) ) {
			$ipaddress = $_SERVER['HTTP_X_FORWARDED'];
			if(!isIpv4($ipaddress)){
				$ipaddress = $_SERVER['REMOTE_ADDR'];
			}
		} else if ( isset( $_SERVER['HTTP_FORWARDED_FOR'] ) ) {
			$ipaddress = $_SERVER['HTTP_FORWARDED_FOR'];
			if(!isIpv4($ipaddress)){
				$ipaddress = $_SERVER['REMOTE_ADDR'];
			}
		} else if ( isset( $_SERVER['HTTP_FORWARDED'] ) ) {
			$ipaddress = $_SERVER['HTTP_FORWARDED'];
			if(!isIpv4($ipaddress)){
				$ipaddress = $_SERVER['REMOTE_ADDR'];
			}
		} else if ( isset( $_SERVER['REMOTE_ADDR'] ) ) {
			$ipaddress = $_SERVER['REMOTE_ADDR'];
		} else {
			$ipaddress = 'UNKNOWN';
		}

		return $ipaddress;
	}
}
