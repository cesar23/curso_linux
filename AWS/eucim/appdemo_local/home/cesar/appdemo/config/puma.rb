# cuantos procesadores tenemos: ejecutar( grep -c processor /proc/cpuinfo )
workers 2
threads 0, 1
queue_requests false
worker_boot_timeout 300

bind 'unix:///run/puma/canvas/canvas.socket'
#activate_control_app 'unix:///run/puma/canvas/canvas-pumactl.socket', { no_token: true }
directory '/home/cesar/appdemo'

environment ENV.fetch('RAILS_ENV', 'production')

# prune_bundler
preload_app!
