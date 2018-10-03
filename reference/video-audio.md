# Reference: Video and Audio

Moving images and sound-based content are both easy to include on your web page.

```html
<video src="img/hallingdal.mp4" poster="img/hallingdal.jpg" controls loop>
  <!-- this content is displayed if the video cannot be shown -->
  <a href="img/hallingdal.mp4">
    <img src="img/hallingdal.jpg" alt="Overhead view of the blue rapids of the Hallingdal River in Norway">
    This video could not be displayed, but you can load it by clicking here.
  </a>
</video>
```

The `<video>` tag has a few important attributes:

* `src` is a pointer to the video file
* `poster` is an image file that gets showed before the video starts playing
* `controls` displays pause/play controls
* other optional attributes include `type` (referring to the [kind of video file](https://en.wikipedia.org/wiki/Media_type)) `autoplay` (which may not work the same on all browsers)

You can find more documentation [on Wikipedia](https://en.wikipedia.org/wiki/HTML5_video) and at [W3schools](https://www.w3schools.com/tags/tag_video.asp)

<video src="img/hallingdal.mp4" poster="img/hallingdal.jpg" type='video/mp4; codecs="avc1.4D401E, mp4a.40.2"' controls loop>
  <!-- this content is displayed if the video cannot be shown -->
  <a href="img/hallingdal.mp4">
    <img src="img/hallingdal.jpg" alt="Overhead view of the blue rapids of the Hallingdal River in Norway">
    This video could not be displayed, but you can load it by clicking here.
  </a>
</video>
