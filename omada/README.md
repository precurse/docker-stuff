# TP-Link Omada Controller

## Usage
```
# Not specifying volumes
docker run -d --network host -it precurse/omada

# Named volumes
docker run -d --network host -v eap-data:/data -v eap-logs:/logs -it precurse/omada
```

### Volumes
* `/data` - Omada Database and Backups
* `/logs` - Logs from Omada Controller application
