# Reference: Images, screencaps, and GIFs

By [Dan Phiffer](https://phiffer.org)

## Images

The visual rendition of a thing, is achieved through imagery. Online, images take on a format like this:

```html
<img src="fuji.jpg" alt="an illustration of Mount Fuji, with a cat looking over cherry blossom treetops">
```

In this HTML you have an `<img>` tag, a file `fuji.jpg` is implied, and is accompanied by a textual `alt` attribute, provided for visually impaired (and for search engines).

__Some image gotchas__

* Resizing large images can make them load faster online
* Different formats are better for different things (.jpg, .png, .gif, and .svg formats each have their advantages)
* Sometimes a photograph taken on a phone will appear rotated incorrectly

## Screencaps

For still images, you can capture a part of the screen with the following keyboard commands:

* __Cmd + shift + 3__ will take a screenshot of your entire screen in .png format (it will appear on your Desktop)
* __Cmd + shift + 4__ will let you click and drag to take a screenshot of a single area of the screen
* __Cmd + shift + 4 followed by spacebar__ will let you click on a window on the screen to screencap _just that window_

If you prefer not to include the dropshadow in your window screencaps, hold down the _option_ key as you click on the window.

## Video screencaps

For capturing a video screencap, use QuickTime Player.

* Choose __File menu → New screen recording__
* Check the little arrow context menu next to the record button for audio and "click circles"
* Click and drag the area you want to record (or just click without dragging to record the entire screen)

## GIFs

You can convert these video screencaps into GIFs using the following shell script in Bash:

```bash
function mov2gif() {
    name=`basename -s .mov $1`
    echo "$1 => $name.gif"
    ffmpeg -i "$1" -vf scale=980:-1 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=2 --delay=6 > "$name.gif"
}
```
