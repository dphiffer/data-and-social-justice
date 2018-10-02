# Reference: Images, screencaps, and GIFs

By [Dan Phiffer](https://phiffer.org)

## Images

The visual rendition of a thing, is achieved through imagery. Online, images take on a format like this:

```html
<img src="fuji.jpg" alt="an illustration of Mount Fuji, with a cat looking over cherry blossom treetops">
```

In this HTML you have an `<img>` tag, a file `fuji.jpg` is implied, and is accompanied by a textual `alt` attribute, provided for visually impaired visitors (and for search engines).

![an illustration of Mount Fuji, with a cat looking over cherry blossom treetops](https://mltshp.com/p/1EEOD)

__Image tips__

* Resize large images to make them load faster online
* Different formats are better for different things (.jpg, .png, .gif, and .svg formats each have their advantages)
* Sometimes a photograph taken on a phone will appear rotated incorrectly (resizing it will fix this problem)
* JPEG metadata, especially the GPS location of a photo taken on a smartphone, could unexpectedly reveal information you did not intend

__Software for editing/resizing imagee__

* [ImageOptim](https://imageoptim.com/mac)
* Adobe Photoshop
* Adobe Lightroom
* ImageMagick (command-line utilities)

__ImageMagick__

ImageMagic is a popular set of command-line image manipulation utilities. To install it:

1. [Install Homebrew](https://brew.sh/)
2. Enter: `brew install imagemagick`

```
$ convert image.png image.jpg
$ convert -resize 1280 image.jpg
$ convert -resize 1280 *.jpg
```

## Screencapture

For still images, you can capture a part of the screen with the following keyboard commands:

* __Cmd + shift + 3__ will take a screenshot of your entire screen in .png format (it will appear on your Desktop)
* __Cmd + shift + 4__ will let you click and drag to take a screenshot of a single area of the screen
* __Cmd + shift + 4 followed by spacebar__ will let you click on a window on the screen to screencap _just that window_

If you prefer not to include the dropshadow in your window screencaps, hold down the _option_ key as you click on the window.

Another macOS utility you may want to try on the lab computers is called [Grab](https://appletoolbox.com/2013/01/how-to-use-mac-os-x-grab-utility-to-take-screenshots/). On Windows you should try out the built-in [Snipping tool](https://support.microsoft.com/en-us/help/13776/windows-use-snipping-tool-to-capture-screenshots).

## Video screencaps

For capturing a video screencap, use QuickTime Player.

* Choose __File menu → New screen recording__
* Check the little arrow context menu next to the record button for audio and "click circles"
* Click and drag the area you want to record (or just click without dragging to record the entire screen)
* Press the "stop" button in the right hand side of the menu bar, it looks like a circle with a square in it

The resulting video will open inside QuickTime Player. You can save it as a .mov file.

## GIFs

You can convert these video screencaps into GIFs using the following shell script in Bash:

Note: this apparently has stopped working??

```bash
function mov2gif() {
    name=`basename -s .mov $1`
    echo "$1 => $name.gif"
    ffmpeg -i "$1" -vf scale=980:-1 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=2 --delay=6 > "$name.gif"
}
```
