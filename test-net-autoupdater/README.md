# I'm not a part of test-net anymore, this tool is deprecated, will leave here for educational porpoise only.

# WARNING: Do not use as is in any production

## Node automatic update for AVA Labs

**Requirements:**

* daemon controlled by systemd under name denali
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
