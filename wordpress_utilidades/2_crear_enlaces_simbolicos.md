# crear enlace  simbolico de plugin

```shell
DOMAIN_MASTER="inversionesletich.com"
DOMAIN_MASTER_PATH="/home/kpopilrp/${DOMAIN_MASTER}"
DOMAIN="lissacorp.pe"
DOMAIN_PATH="/home/kpopilrp/${DOMAIN}"
# limieza


ln -s "${DOMAIN_MASTER_PATH}/wp-content/plugins/elementor" "${DOMAIN_PATH}/wp-content/plugins/elementor"
ln -s "${DOMAIN_MASTER_PATH}/wp-content/plugins/elementor-pro" "${DOMAIN_PATH}/wp-content/plugins/elementor-pro"

ln -s "${DOMAIN_MASTER_PATH}/wp-content/plugins/wpforms-pro" "${DOMAIN_PATH}/wp-content/plugins/wpforms-pro"
ln -s "${DOMAIN_MASTER_PATH}/wp-content/plugins/all-in-one-wp-security-and-firewall" "${DOMAIN_PATH}/wp-content/plugins/all-in-one-wp-security-and-firewall"


ln -s "${DOMAIN_MASTER_PATH}/wp-content/themes/flatsome-child/classSoluciones" "${DOMAIN_PATH}/wp-content/themes/generatepress-child/classSoluciones"

```

### para class soluciones
```shell

DOMAIN_MASTER="inversionesletich.com"
DOMAIN_MASTER_PATH="/home/kpopilrp/${DOMAIN_MASTER}"
DOMAIN="lissacorp.pe"
DOMAIN_PATH="/home/kpopilrp/${DOMAIN}"


ln -s "${DOMAIN_MASTER_PATH}/wp-content/themes/flatsome-child/classSoluciones" "${DOMAIN_PATH}/wp-content/themes/generatepress-child/classSoluciones"

```