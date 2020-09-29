## Avalanche validator check tools

Requirements installation:

``` bash
sudo apt install jq
sudo apt install git
sudo apt install curl
```

How to use:

* create folder for your scripts
``` bash
mkdir scripts
```
* cd in to this folder
``` bash
cd scripts
```
* clone repo ( pay attention to the dot in the end )
```bash
git clone https://github.com/matsuro-hadouken/Avalanche-tools.git .
```
* make scripts executable
```bash
chmod +x *.sh
```
To run sctipts use
```bash
./script_name.sh
```
Example:
```bash
./id.node.sh
```
Output:
```bash
NodeID-22F5CwB9PSEeuXbkrHeZ9c4CYQQUpP8xJ

https://avascan.info/staking/validator/NodeID-22F5CwB9PSEeuXbkrHeZ9c4CYQQUpP8xJ
```
