# Node automatic update for AVA Labs

*Requirements:*

* should be run as root from cron

*Configuration:*

* Set node binary path. 
```bash
NODE_BINAR_PATH='/home/ava/ava/'
```
* Set log path
```bash
LOG_PATH=$HOME/ava-update.log
```
* setup cron as root:

```bash
*/15 * * * * /bin/bash -c /path/to/update.sh
```
