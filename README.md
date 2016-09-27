
# smi2yang
Docker image for translation from SMI to NETCONF YANG data model using smidump (libsmi)


## Build
Build docker image on this top directory.

```
docker build -t neoul/smi2yang .
```

## Run
Make sure your MIB files locate into ${PWD}/mib directory.
Your MIB files should be named as: 
- no extension
- yours.mib
And run neoul/smi2yang image as follow.

```
mkdir ${PWD}/mib
cp yours.mib to ${PWD}/mib
docker run -v ${PWD}/mib:/mib -v ${PWD}/yang:/yang neoul/smi2yang
```

## Result
Check the result (yang and log files) in ${PWD}/yang.
