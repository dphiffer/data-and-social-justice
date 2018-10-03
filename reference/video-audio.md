# Reference: Video and Audio

HTML5 makes it fairly easy (with some caveats) to embed audio and video content onto your web pages.

## Video

```html
<video src="video/hallingdal.mp4" poster="img/hallingdal.jpg" controls loop>
  <!-- this content is displayed if the video cannot be shown -->
  <a href="video/hallingdal.mp4">
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
* Instead of `<video src="...">` you can specify multiple file formats of the video with `<video><source src="..."></video>`

You can find more documentation [on Wikipedia](https://en.wikipedia.org/wiki/HTML5_video) and at [W3schools](https://www.w3schools.com/tags/tag_video.asp)

<video src="video/hallingdal.mp4" poster="img/hallingdal.jpg" controls loop>
  <!-- this content is displayed if the video cannot be shown -->
  <a href="video/hallingdal.mp4">
    <img src="img/hallingdal.jpg" alt="Overhead view of the blue rapids of the Hallingdal River in Norway">
    This video could not be displayed, but you can load it by clicking here.
  </a>
</video>

## Audio

The `<audio>` tag works very similarly to the `<video>` tag.

* `src` is a pointer to the audio file
* `controls` displays pause/play controls
* other optional attributes include `type`, `autoplay`, and `loop`
* Instead of `<audio src="...">` you can specify multiple file formats of the audio with `<audio><source src="..."></audio>`

```html
<audio src="audio/mlk.mp3" controls>
  <!-- this content is displayed if the audio cannot be played -->
  <a href="audio/mlk.mp3">
    This audio could not be displayed, but you can load it by clicking here.
  </a>
</audio>
```

You can find more documentation [on Wikipedia](https://en.wikipedia.org/wiki/HTML5_audio) and at [W3schools](https://www.w3schools.com/tags/tag_audio.asp)

<audio src="audio/mlk.mp3" controls>
  <!-- this content is displayed if the audio cannot be played -->
  <a href="audio/mlk.mp3">
    This audio could not be displayed, but you can load it by clicking here.
  </a>
</audio>
