docker sickbeard Raspberry Pi
=============================

This is a Dockerfile to set up "Sickbeard" - (http://sickbeard.com/) on a
Raspberry Pi.

## Usage

Build from docker file:

```bash
docker build -t sickbeard .
```

Run it:

```bash
docker run -d -h *your_host_name* -v /*your_config_location*:/config  -v /*your_videos_location*:/data -p 8081:8081 sickbeard
```

## Todo

  * Create a data container for the configuration
  * Provide fig integration
  * Configure HTTPS access

## Credits

This Dockerfile is based on [timhaak](https://github.com/timhaak/docker-sickbeard)'s.

## License

This project is released under the MIT License. See the bundled LICENSE file for
details.
