WarpMarkers Bukkit Plugin
=========================

[![Foo](http://dev.bukkit.org/media/images/34/32/WarpMarkers.png)](http://dev.bukkit.org/server-mods/warpmarkers)

This plugin outputs a JSON file containing the locations of Warppoints from the [Essentials](http://ess.khhq.net/wiki/Main_Page) Bukkit plugin for use with various Minecraft mapping software. When clicking on a marker on the map, the following information is shown: The name of the warppoint, who created it, and when, who last used it, and when. In addition WarpMarkers shows live messages for any Warppoint related event on the map (can be turned off). The project includes all of the files needed and installation instructions for the [Minecraft Overviewer](https://github.com/brownan/Minecraft-Overviewer) map generator. The events shown are: warppoint created, warppoint used and warppoint deleted.

A live map using WarpMarkers is found at [mc.minecraftstuff.net](http://mc.minecraftstuff.net)

Resources
---------

* [Latest stable release](https://github.com/downloads/deadcyclo/WarpMarkers/WarpMarkers.zip)
* [Bukkit dev page](http://dev.bukkit.org/server-mods/warpmarkers/)
* [Github](https://github.com/deadcyclo/WarpMarkers)
* [Issue Tracker](https://github.com/deadcyclo/WarpMarkers/issues)
* [Wiki](https://github.com/deadcyclo/WarpMarkers/wiki)

Installation
------------

1. Download the [zip-file](https://github.com/downloads/deadcyclo/WarpMarkers/WarpMarkers.zip) 
2. Unzip the downloaded zip-file
3. Put the WarpMarkers.jar file in your plugin folder
4. Stop and start Minecraft
5. On first run, WarpMarkers will generate the configuration files needed in a folder called `WarpMarkers` in your plugin folder containing default values (by default it will output the JSON files to `<minecraft_server_working_directory>/world/`
6. To change see the configuration section below

Configuration
-------------

The following configuration options for configuring the plugin itself are available in the `<pluginfolder>/WarpMarkers/config.yml` file:

* interval (default 3000) how often (in miliseconds) the plugin should   check if a new output file needs to be generated
* outputFile (default world/warpmarkers.json) the location of the json file to contain all of the warpmarkers
* updateFile: (default world/warpupdates.json) the location of the json file to contain updates to the warpmarkers
* updateLife: (default 50000) the (shortest) amount of time (in miliseconds) an update should remain in the update json file. Note that this value MUST be higher than the refresh-value set in the javascript-file

The following configuration options for configuring how the plugin interacts with the map are available in the `WarpMarkers.js` file (see the setup sections for more information about this file):

* refreshrate (default 5000) How often the script checks for an update in miliseconds, value MUST be lower than the updateLife-value set in the config.yml file
* show_notifications (default true) Set this to false to turn of all notifications (events, start, stop)
* marker_image (default "cropcircles.png") Image file used for markers 
* marker_shadow (default "marker_shadow.png") Image file used for marker shadows
* warp_icon (default "warp.jpg") Icon showed in popups and notifications
* on_by_default (default true) Determines if warppoints should be shown on the map as soon as it renders, or only after the user clicks the button.
* warpmarkers_file (default "warpmarkers.json") The location of the main warpmarkers json file
* warpupdates_file (default "warpupdates.json") The location of the warpmarkers updates json file

Setup for Minecraft Overviewer
------------------------------

0. Perform installation (see above)
1. Edit `<minecraftpluginfolder>/WarpMarkers/config.yml` so that the warpmarkers.json file is placed in the same folder as your Minecraft Overviewer output. Alternatively on GNU/Linux don't edit config.yml, make a symlink. If you change the name of the file, you must reflect said namechange in the WarpMarkers.js file.
2. Edit `<minecraftpluginfolder>/WarpMarkers/config.yml` so that the warpupdates.json file is placed in the same folder as your Minecraft Overviewer output. Alternatively on GNU/Linux don't edit config.yml, make a symlink. If you change the name of the file, you must reflect said namechange in the WarpMarkers.js file.
3. Stop Minecraft
4. Start Minecraft 
5. Copy all of the files and folders in the `web_assets` folder to the `web_assets` folder your Minecraft Overviewer uses.
6. Add the following three lines to the `index.html` file in the `web_assets` folder your Minecraft Overviewer uses. Add them directly before the `</head>` tag:

       * `<link rel="stylesheet" type="text/css" href="css/gritter.css" />`
       * `<script type="text/javascript" src="js/jquery.gritter.js"></script>`
       * `<script type="text/javascript" src="WarpMarkers.js"></script>`	

7. In the same file, add `;warpmarkers.init();` to the bodies onload. In other words replace `<body onload="overviewer.util.initialize()">` with `<body onload="overviewer.util.initialize();warpmarkers.init();">`
8. Run Minecraft Overviewer and everything should work

Setup for Pigmap
----------------

TODO. Coming soon. 

Version history
===============

* **September 12 2011 - Version 1.0**
  Initial Release

Known bugs
==========

There are no known bugs at the moment.

Planned
=======

* Add files for, an instructions on, using WarpMarkers with Pigmap and perhaps other map software
* Add support for Warpx0r and other similar plugins

Building
--------

1. Unzip the [zip-file](https://github.com/downloads/deadcyclo/WarpMarkers/WarpMarkers.zip) or clone the project (`git clone git@github.com:deadcyclo/WarpMarkers.git`)
2. Make a sub-directory named lib 
3. Download the [Craftbukkit](http://bukkit.org) .jar file and put it in the lib directory
4. If different, rename it to `craftbukkit-0.0.1-SNAPSHOT.jar`
5. Download the [Essentials](http://ess.khhq.net/wiki/Main_Page) .jar file and put it in the lib directory
6. If different, rename it to `Essentials.jar`
7. Download the [JSON simple](http://code.google.com/p/json-simple/) .jar file and put it in the lib directory
8. If different, rename it to `json_simple-1.1.jar`
9. Create a [plugin.yml](http://wiki.bukkit.org/Plugin_YAML) file for the project
10. In the top directory run `make` (or `make WarpMarkers.jar` or `make WarpMarkers.zip`)

Contributing
------------

1. Fork it.
2. Create a branch (`git checkout -b my_project`)
3. Commit your changes (`git commit -am "Added Something"`)
4. Push to the branch (`git push origin my_project`)
5. Create an [Issue][1] with a link to your branch
6. Enjoy a cup of coffee or ten and wait

External projects used
----------------------

Notifications use [gritter](http://boedesign.com/blog/2009/07/11/growl-for-jquery-gritter) jQuery plugin by Jordan Boesch 

The map marker (is from the Map [Icons Collection project](http://mapicons.nicolasmollet.com) by Nicolas Mollet

The WarpMarkers icon warp.jgp is a remake of [this image](http://www.flickr.com/photos/torley/2508514525/in/photostream/) by Torley Olmstead

The following libraries where also used:

* [Essentials](http://ess.khhq.net/wiki/Main_Page)
* [JSON simple](http://code.google.com/p/json-simple/)
* [Craftbukkit](http://bukkit.org)