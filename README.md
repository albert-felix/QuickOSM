# QuickOSM

![Logo of QuickOSM](QuickOSM/resources/icons/QuickOSM.svg)

[![Build Status](https://api.travis-ci.org/3liz/QuickOSM.svg?branch=master)](https://travis-ci.org/3liz/QuickOSM)

## Versions

* QuickOSM is maintained only for a maintained QGIS version (LTR, stable release and dev).

| QuickOSM  | QGIS Min | QGIS Max | Branch       |
|-----------|----------|----------|--------------|
| 1.0 → 1.4 | 2.0      | 2.18     | [master_qgis2](https://github.com/3liz/QuickOSM/tree/master_qgis2) |
| 1.5 → 1.7 | 3.0      | 3.2      |              |
| 1.8 →     | 3.4      |          | [master](https://github.com/3liz/QuickOSM/tree/master)       |

## Documentation

The user guide and the developer guide are available on GitHub pages.
https://3liz.github.io/QuickOSM/

## Generalities

QuickOSM allows you to work quickly with OSM data in QGIS thanks to [Overpass API][Overpass].
* Write some queries for you by providing a key/value
* Choose to run the query on an area or an extent
* Configure the query : which layers, which columns…
* Open a local OSM (.osm or .pbf) with a specific osmconf in QGIS
* Build some models with QGIS Processing

There are some useful tips, like automatic colours on lines (if the tag is present)
 or some actions (right-click in the attribute table) for each entities (edit in JOSM for instance).

[Overpass]: https://wiki.openstreetmap.org/wiki/Overpass_API

## Translation

* The web-based translating platform [Transifex](https://www.transifex.com/quickosm/gui/dashboard/) is used.

## Development and tests

* QuickOSM uses a [Git submodule](https://git-scm.com/book/en/v2/Git-Tools-Submodules).
  * For a new clone, including the submodule, do `git clone --recursive https://github.com/3liz/QuickOSM.git`.
  * For an existing clone, do `git submodule init` and `git submodule update`.
  * These command will populate the `qgis_plugin_tools`.
* For panels, you can find a quick diagram in the `doc` folder.
* For tests, it's using the `unittest` framework.
  * They are launched on GitHub using Travis, you can check the [Travis status](https://travis-ci.org/3liz/QuickOSM) on each commits and pull requests.
  * You can launch them locally:
     * `make docker_test` using Docker with the current LTR following the [QGIS release schedule](https://www.qgis.org/en/site/getinvolved/development/roadmap.html#release-schedule).
        * `qgis_plugin_tools/docker_test.sh QuickOSM release-3_4` for QGIS 3.4
        * `qgis_plugin_tools/docker_test.sh QuickOSM latest` for QGIS Master or any other tags available on [Docker Hub](https://hub.docker.com/r/qgis/qgis/tags).
        * If you are using docker, do not forget to update your image from time to time `docker pull qgis/qgis:latest`.
     * Setting up your IDE to launch them by adding paths to your QGIS installation. I personally use PyCharm on Ubuntu.
     * Launching tests from QGIS Desktop app, in the Python console using :

```python
from qgis.utils import plugins
plugins['QuickOSM'].run_tests()
```

## Credits

Author: Etienne Trimaille : https://twitter.com/etrimaille

Contributors:
* Richard Marsden [winwaed](https://github.com/winwaed)
