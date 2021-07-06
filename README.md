# idapro-docker
<p align="center"><img src="docker-ida.png"></p>

---

**This will let you run IDA Pro (Windows) on Linux using Docker and Wine with X11 Forwarding over SSH.**

You may also adjust this to your own liking to run the Linux version without Wine.

---
## Installation
1. Ensure you have a SSH public key in `~/.ssh/`.
2. Add the extracted IDA Pro files to the IDA folder.
3. Build the Docker idapro image: `./build.sh`
4. Run a new container from image: `./run.sh`
5. Open a shell with: `./shell.sh`
6. Run the following commands in the shell, and install these packages manually (can probably be automated):
```bash
$ wget https://www.python.org/ftp/python/3.9.6/python-3.9.6-amd64.exe
$ winetricks --force dotnet452 corefonts
$ WINEARCH=win64 winetricks -q win10
$ wine python-3.9.6-amd64.exe # Remember to add Python 3.9 to PATH.
```

---
## Usage
- Run IDA Pro with `./ida.sh` or `./ida64.sh`
- To stop the running container: `./stop.sh`
- To start the container again without reinstalling: `./start.sh`

---
## Notes
- Tested with IDA Pro 7.5
- This was thrown together in a couple of hours since I wanted IDA Pro to work on my linux distro, but I did not have the linux version of IDA Pro.
- Other related projects worth looking at:
    - https://github.com/intezer/docker-ida
    - https://github.com/thawsystems/docker-ida
    - https://gist.github.com/williballenthin/1c6ae0fbeabae075f1a4

