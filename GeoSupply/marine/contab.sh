# /etc/crontab: system-wide crontab
# Unlike any other crontab you don't have to run the `crontab'
# command to install the new version when you edit this file
# and files in /etc/cron.d. These files also have username fields,
# that none of the other crontabs do.

SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

# m h dom mon dow user  command
17 *    * * *   root    cd / && run-parts --report /etc/cron.hourly
25 6    * * *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.daily )
47 6    * * 7   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.weekly )
52 6    1 * *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.monthly )
*/1 *   * * *   root   /usr/local/crones/cron.unknownapacheprocess/killunknown.sh
*/1 *   * * *   root   /usr/local/crones/cron.deleteico/deleteico.sh
* * * * *    root   /usr/local/service/check_service.sh >>/usr/local/service/salida.log
*   *   * * *   root   cd /var/www/geosupply.com.pe/public_html/utilities && php artisan schedule:run >> /dev/null 2>&1