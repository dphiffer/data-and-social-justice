# Referencee Video and Audio

Moving images and sound-based content are both easy to include on your web page.

```html
<video src="img/hallingdal.mp4" poster="img/hallingdal.jpg" controls loop>
  <!-- this content is displayed if the video cannot be shown -->
  <img src="img/hallingdal.jpg" alt="Overhead view of the blue rapids of the Hallingdal River in Norway">
</video>
```

The `<video>` tag has a few important attributes:

* `src` is a pointer to the video file
* `poster` is an image file that gets showed before the video starts playing
* `controls` displays pause/play controls
* other optional attributes include `autoplay` (which may not work the same on all browsers)

<video src="img/hallingdal.mp4" poster="img/hallingdal.jpg" controls loop>
  <!-- this content is displayed if the video cannot be shown -->
  <img src="img/hallingdal.jpg" alt="Overhead view of the blue rapids of the Hallingdal River in Norway">
</video>
