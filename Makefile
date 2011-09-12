PLUGINNAME=WarpMarkers

JFLAGS=-cp .:lib/craftbukkit-0.0.1-SNAPSHOT.jar:lib/json_simple-1.1.jar:lib/Essentials.jar
SOURCES=is/brendan/WarpMarkers/WarpMarkers.java is/brendan/WarpMarkers/WarpMarkersSignPlayerListener.java is/brendan/WarpMarkers/WarpMarkersTimerTask.java is/brendan/WarpMarkers/WarpMarkersCommandTrap.java is/brendan/WarpMarkers/WarpMarkersWarpInfo.java is/brendan/WarpMarkers/BlockSign.java is/brendan/WarpMarkers/WarpMarkersUID.java
OBJECTS=$(SOURCES:.java=.class)
EXTRAS=Makefile config.yml README.md LICENSE web_assets/warp.jpg web_assets/cropcircles.png web_assets/marker_shadow.png web_assets/WarpMarkers.js web_assets/js/jquery.gritter.js web_assets/js/jquery.gritter.min.js web_assets/css/gritter.css web_assets/images/gritter-long.png web_assets/images/gritter.png web_assets/images/ie-spacer.gif web_assets/images/trees.jpg $(SOURCES)

all: $(PLUGINNAME).zip

clean:
	rm -rf $(PLUGINNAME).zip $(PLUGINNAME).jar $(OBJECTS)

$(PLUGINNAME).zip: $(PLUGINNAME).jar $(EXTRAS)
	zip -9 $(PLUGINNAME).zip $(PLUGINNAME).jar $(EXTRAS)

$(PLUGINNAME).jar: $(OBJECTS) plugin.yml
	jar -cf $(PLUGINNAME).jar $(OBJECTS) plugin.yml

%.class: %.java
	javac $(JFLAGS) $<