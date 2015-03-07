# Dockerized SABnzbd+
This is a Dockerfile to set up [SABnzbd+](http://sabnzbd.org).

Build image from docker file:

```bash
git clone https://github.com/openam/docker-sabnzbd.git
cd docker-sabnzbd
docker build -t sabnzbd .
```

Run the built image:

```bash
# run without linking volumes to host system
docker run -d --name sabnzbd -p 8080:8080 -p 9090:9090 sabnzbd

# run with linking volumes to host system
docker run -d --name sabnzbd -v /path/to/your/saved/config:/config -v /path/to/save/data:/data -p 8080:8080 -p 9090:9090 sabnzbd
```

The `/data` folder isn't used in the settings by default. Change the settings to use `/data` if wanted. Otherwise it defaults to using the `/config` folder.
