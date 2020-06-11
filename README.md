# Node automatic update for AVA Labs

**Requirements:**

* should be run as root from cron
* wget

**Configuration:**

* Pull
```bash
wget https://raw.githubusercontent.com/matsuro-hadouken/ava-autoupdate/master/update.sh
```
* Set node binary path. 
```bash
NODE_BINAR_PATH='/path/to/ava/binaties/folder/'
```
* Set log path
```bash
LOG_PATH=$HOME/ava-update.log
```
* setup cron as root:

```bash
*/15 * * * * /bin/bash -c /path/to/update.sh
```
