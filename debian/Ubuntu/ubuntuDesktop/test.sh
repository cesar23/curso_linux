
while true; do

	current_hr=$((10#$(date +'%H')))
	current_min=$((10#$(date +'%M')))
	six_am=6
	six_pm=18

	# sunrise
	if [[ current_hr -eq six_am ]]; then

		next_check=43200 # 12 hrs in s
		#watch -x --interval $next_check -c xset -led named 'Scroll Lock'
		xset -led named 'Scroll Lock'
		#watch -x --interval $next_check -c auto-scrlck

		echo 'Next check at' $(date -d "now + $next_check seconds")',' 'approx' $(($next_check/60/60)) 'hrs from now.'
		sleep $next_check

	# sunset
	elif [[ current_hr -eq six_pm ]]; then

		next_check=43200 # 12 hrs in s
		#watch -x --interval $next_check -c xset led named 'Scroll Lock'
		xset led named 'Scroll Lock'
		#watch -x --interval $next_check -c auto-scrlck

		echo 'Next check at' $(date -d "now + $next_check seconds")',' 'approx' $(($next_check/60/60)) 'hrs from now.'
		sleep $next_check

	# midnight till before sunrise
	elif [[ current_hr -lt six_am ]]; then

		min_to_six=$(($((10#$six_am*60 + 10#0)) - $((10#$current_hr*60 + 10#$current_min))))
		next_check=$(($min_to_six * 60))
		
		#watch -x --interval $next_check -c xset led named 'Scroll Lock'
		xset led named 'Scroll Lock'
		#watch -x --interval $next_check -c auto-scrlck

		echo 'Next check at' $(date -d "now + $next_check seconds")',' 'approx' $(($next_check/60/60)) 'hrs from now.'
		sleep $next_check

	# after sunrise till sunset
	elif [[ current_hr -lt six_pm ]]; then

		min_to_six=$(($((10#$six_pm*60 + 10#0)) - $((10#$current_hr*60 + 10#$current_min))))
		next_check=$(($min_to_six * 60))
		
		#watch -x --interval $next_check -c xset -led named 'Scroll Lock'
		xset -led named 'Scroll Lock'
		#watch -x --interval $next_check -c auto-scrlck

		echo 'Next check at' $(date -d "now + $next_check seconds")',' 'approx' $(($next_check/60/60)) 'hrs from now.'
		sleep $next_check

	# after sunset till before sunrise
	elif [[ current_hr -gt six_pm ]]; then

		hrs_to_twelve_am=$(($((10#24*60 + 10#0)) - $((10#$current_hr*60 + 10#$current_min))))
		min_to_six=$(($((10#$hrs_to_twelve_am + 10#0)) + $((10#6*60 + 10#0))))

		next_check=$(($min_to_six * 60))

		#watch -x --interval $next_check -c xset led named 'Scroll Lock'
		xset led named 'Scroll Lock'
		#watch -x --interval $next_check -c auto-scrlck

		echo 'Next check at' $(date -d "now + $next_check seconds")',' 'approx' $(($next_check/60/60)) 'hrs from now.'
		sleep $next_check
	fi

done