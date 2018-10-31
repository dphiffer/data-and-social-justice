# Tutorial: QGIS + Census TIGER/Line

This is a tutorial for learning how to find and map data from the US Census with QGIS open GIS mapping software.

## 1. Download QGIS

* [Download the newest version of QGIS](https://www.qgis.org/), currently at version 3.4.
* When you unzip the file you will find three different files to open.

![QGIS installer window](img/09/09-0.png)

* We'll start with __1. Install Python 3.rtf__: double click on it to see the included message.

![Install Python](img/09/09-1.png)

We will need to verify that the version of `python3` we have installed matches what QGIS wants us to use in the Terminal.

```
$ python3 --version
Python 3.6.5
```

If you see some other version, you may need to go to [python.org](https://www.python.org/downloads/) and install the newest release of version 3.6.x.

* Next, double click on __2. Install GDAL Complete.pkg__ to install [Geospatial Data Abstraction Library](https://www.gdal.org/).

You will see an error message about how the installer hasn't been cryptographically signed. Click okay to close it.

![GDAL install error](img/09/09-2.png)

* Go to __Apple Menu → System Preferences__ then click on __Security & Privacy__ then click on __Open Anyway__ and then confirm by pressing __Open__.

* Follow the steps through the installer, clicking __Continue__ and agreeing to the terms of use.

* Repeat the process for __3. Install QGIS 3.pkg__, including the part where you "open it anyway" from the system preferences.

## 2. Download data files

Next we will download the files we need to make a map.

* Go to the [Census TIGER/Line home page](https://www.census.gov/geo/maps-data/data/tiger.html).
* Click on [TIGER/Line shape files](https://www.census.gov/geo/maps-data/data/tiger-line.html).
* From the __2018__ tab click on __Download__ then on __Web Interface__.

![TIGER/Line web interface](img/09/09-5.png)

The web interface gives us an index of all the different kinds of shapefiles we can download.

* Select __2018__ and __Census Tracts__ and then press __Submit__.

![Census tracts](img/09/09-6.png)

* Next, select __Vermont__ and click __Download__.

![Vermont Census tracts](img/09/09-7.png)

* Open the zip file that downloaded, it should be called __tl_2018_50_tract.zip__.

![Vermont Census download](img/09/09-8.png)

The one we are going to work with is the file called __tl_2018_50_tract.shp__.

## 3. Look at the shapefile

Next we will open up the shapefile and see what we can learn from it.

* Open __QGIS.app__ from your Applications folder.
* Choose __Project → New__ from the menu bar.
* Choose __Layer → Add Layer → Add Vector Layer__

![Add Vector Layer](img/09/09-9.png)

* Click on the "..." button to navigate eto the Vermont shapefile you downloaded.

![Find shapefile](img/09/09-10.png)

* Find the file __tl_2018_50_tract.shp__ and click __Open__.

![Add the layer then close](img/09/09-11.png)

* At the bottom of the window click __Add__ and then __Close__.

![Add the layer then close](img/09/09-12.png)

Now you should see something that looks like Vermont, but maybe a little more squished than you are used to seeing.

![It is Vermont](img/09/09-13.png)

Your version may have different colors (QGIS picks randomly by default), but it will probably look unusually wide compared to what we're accustomed to seeing. The reason for this distortion is the map projection that's being used. We can pick a different projection that works better for the part of the globe we're looking at.

* Click on the projection button on the bottom right part of the window.

![Projection button](img/09/09-14.png)

* Marvel at the many projection options, they are each designed to minimize distortion for some part of the globe.

![OMG so many projections](img/09/09-15.png)

* We would be wise to pick a projection that is designed to work well for Vermont.

![Vermont projection](img/09/09-16.png)

And now we have someething that looks a little less distorted.

![Vermont mapped with a VT projection](img/09/09-17.png)
