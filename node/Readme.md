
## Extract or copy nodejs binaries here

Download from node website manually or use the script below:

```
nodeurl="https://nodejs.org/dist/v10.16.3/node-v10.16.3-linux-x64.tar.gz" 
curl -L -o node.tmp $nodeurl 
tar xf node.tmp -C ~/pwshise/node --strip 1
rm node.tmp 
```
