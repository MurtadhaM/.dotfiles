# Useful Windows Commands
---


### List all network interfaces with their MAC address

```powershell
getmac /v
```

### List pids listening on a specific port

```powershell
netstat -anob | findstr :<port>
```

## Processes
### List all processes as a list

```powershell
wmic process get processid,parentprocessid,commandline /format:list |findstr /v /r "^$"
```

## Services
### List all services

```powershell
wmic service get name,displayname,pathname,startmode | sort |findstr /v /r "^$"
```

### List all services with their associated process

```powershell
wmic service get name,displayname,pathname,startmode | sort |findstr /v /r "^$" | findstr /v "svchost.exe"
```

# TASK SCHEDULER

### List all scheduled tasks as a csv file with the associated process

```powershell
$tasks = schtasks /query  /v  /fo csv | ConvertFrom-Csv
```
