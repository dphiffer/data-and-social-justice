# Tutorial: html + css

By [Dan Phiffer](https://phiffer.org/)

This tutorial is about HTML (aka HyperText Markup Language) and CSS (aka Cascading StyleSheets). It is based on our earlier tutorials using the [command line](01-command-line.md) and [logging into remote servers using SSH](02-ssh-scp.md). In this tutorial we will login to `dsj.organizer.network` and set up a new web page there.

## HTML

HTML composes the bones of a web page. It is a structured document and is probably the most widely deployed computer languages that exist today. Some people might try to convince you that it is not a "real" programming language, but they are wrong. (Same goes for CSS, JavaScript, etc., they are all "real" programming languages.)

HTML is made of *elements*, and each element is made of of *tags* structuring *text content*. Some elements have *attributes*. In this tutorial we will be using HTML 5 exclusively, although there are other older versions of it that exist (if you ever see XHTML out there, back away slowly).

__Input__

```html
HTML is basically plain text, plus some extra stuff.
    The   spacing   mostly   gets   ignored.
You have to specifically add line breaks,<br>like this.
<p>Or, even better, with a paragraph.</p>
<b>This text will be bold.</b>
<strong>This text will also be bold. <em>And italic</em></strong>
```

__Output__

HTML is basically plain text, plus some extra stuff.
    The   spacing   mostly   gets   ignored.
You have to specifically add line breaks,<br>like this.
<p>Or, even better, with a paragraph.</p>
<b>This text will be bold.</b>
<strong>This text will also be bold. <em>And italic</em></strong>

## Open tag, close tag

Each element describes or modifies the content enclosed between its tags. Each _open tag_, like `<h1>` and `<i>`, is matched by a corresponding _close tag_, like `</h1>` and `</i>`. Tags must be closed in the order they’re opened.

```html
<!-- This is wrong. -->
<h1>hello <i>world</h1></i>

<!-- This is right. -->
<h1>hello <i>world</i></h1>
```

Note: `<!-- ... -->` is how you add an HTML comment. Comments get ignored by the browser. Comments are like secret notes you leave for other programmers to understand the intentions of your code.

## Hello, web page

Let's make a very simple web page. Start by logging into `dsj` (or if that doesn't work, `ssh user@dsj.organizer.network`, but with your username instead of `user`).

```
$ ssh dsj
```

Next, create a new folder called `public_html`:

```
$ mkdir public_html
$ chmod +x public_html
```

That second command added an _executable_ permission to the folder, which basically means that the web server is allowed to look inside.

Now we can go inside the folder and make a new file called `index.html`, which is the default filename that is used inside a folder.

```
$ cd public_html
$ nano index.html
```

We will start extremely simply. A single message will do for now, type this into the editor:

```
Hello, world!
```

* Press __Ctrl-O__ to output the file
* Then close out of `nano` with __Ctrl-X__

Yes, that counts as HTML, you don't even need any tags to start out with. You can load that file up in a browser but going to this URL (replace `user` with your username):  
https://dsj.organizer.network/~user/

You should see a blank page with the message: "Hello, world!"

If you wanted to, you could also include the `index.html` in the URL, the first URL pulls up that file by default:  
https://dsj.organizer.network/~user/index.html

Let's try something slightly more interesting:

```
$ cowsay "Hi, I am a cow"
```

Now let's _pipe_ the output of `cowsay` into a file called `cow.html`. To save on typing, press the __up arrow__ and then just add the last ` > cow.html` part onto the end.

```
$ cowsay "Hi, I am a cow" > cow.html
```

That can now be found online at this URL (again, you will need to change the `user` part):

https://dsj.organizer.network/~user/cow.html

Wait, the cow is squished onto a single line! That's because HTML collapses all whitespace (spaces, tabs, and line breaks) into a single space. We can edit the file to preserve the cow whitespace.

```
$ nano cow.html
```

Surrounding the file contents with `<pre>` and `</pre>` should do the trick.

```
<pre>
 ________________
< Hi, I am a cow >
 ----------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
</pre>
```

Now save the file, and close with __Ctrl-O__ and __Ctrl-X__ and reload the page in your browser. The cow should reinflate onto multiple lines.

## Self-closing tags

Some elements, like `<img>` (image), `<br>` (line break), and `<hr>` (horizontal rule), don’t even need close tags. Because they don’t enclose any other content, they just exist as open tags.

```html
First line<br>
Second line: <img src="thing.jpg" alt="A thing">
<hr>
New section
```
You may encounter HTML that includes a slash at the end of a self-closing tag, `<img ... />`, it's not necessary.

## Attributes

* `href` defines where the link goes  
  ```html
  <a href="portfolio.html">my portfolio</a>
  ```
* `src` defines where the image gets loaded from  
  ```html
  <img src="cat.gif" alt="Cat shenanigans">
  ```
* `class` allows us to apply styles  
  ```html
  This text should <span class="highlight">get highlighted</span>.
  ```
* `id` names a part of the page (and lets us apply styles)  
  ```html
  <section id="introduction">...</section>
  ```

## CSS

CSS is like the "skin" of the web page, it defines how the structured HTML should get displayed by browsers. The page is styled by a set of *selectors*, each selector contains a set of *properties*, where each property assigns a *value*.

```css
a {                   /* Refers to <a> tags, the links on the page */
  color: red;         /* Sets the color property to be red */
  font-weight: bold;  /* Makes the text bold */
}                     /* The properties get enclosed within { ... } */
```

Note: `/* ... */` is how we encode comments CSS.

## Selectors

* `h1 { margin: 10px; } /* by element */`  
  ```html
  <h1>Page title</h1>
  ```
* `.highlight { background: #ff9; } /* by class */`  
  ```html
  <span class="highlight">lorem ipsum</span>
  ```
* `#introduction { font-size: 150%; } /* by ID */`
  ```html
  <section id="introduction">lorem ipsum</section>
  ```
* `h2 em { font-weight: bold; } /* by ancestor */`  
  ```html
  <h2>Hello <em>world</em></h2>
  ```

[A full listing of CSS properties is available from the W3C](https://www.w3.org/TR/CSS/#properties)

## CSS properties

There are many many CSS properties you can set, including:

* Text
* Colors + Backgrounds
* Size
* Position
* Spacing

## Text properties

There are a whole lot of ways to control text in CSS!

```css
.text-properties {
	font-family: "Helvetica Neue", arial, sans-serif;
	font-size: 10px;
	line-height: 20px;
	font-weight: bold;
	font-style: italic;
	text-align: center;
	text-transform: uppercase;
	text-decoration: underline;
	white-space: pre;
}
```

## Colors + Background properties

Text "foreground" color is controlled by the `color` property, and there are a whole bunch of different background properties.

```css
.color-properties {
	color: #474747;
	background-color: transparent;
	background-color: rebeccapurple;
	background-color: linear-gradient(to bottom, #1e5799 0%, #7db9e8 100%);
	background-image: url('pattern.png');
	background-repeat: no-repeat;
	background-size: 100px 50px;
	background-position: center;
	background-attachment: fixed;
}
```

## Position properties

You may be feeling a little overwhelmed by all these properties. Don't worry, you don't need to understand all of them to get started.

```css
.position-properties {
	display: none;
	visibility: hidden;
	position: absolute;
	left: 100px;
	top: 50px;
	z-index: 3;
	float: left;
	clear: both;
}
```

## Size

Different units of size include percentage (`%`), pixels (`px`), viewport units (`100vh` is the full viewport height and `100vw` is the full width), and some more familiar units like `cm` and `in`.

```css
.size-properties {
	width: 80%;
	height: 100px;
	max-width: 50vw;
	min-height: 5cm;
	box-sizing: border-box;
}
```

## Spacing

Leaving enough space between your page elements is very important. The two main kinds of spacing are `margin` and `padding`. The box model section below will explain this in more detail.

```css
.spacing-properties {
	margin: 10px;                 /* 10px all around */
	margin: 15px 10px;            /* Order: top/bottom (15px), left/right (10px) */
	margin: 10px 10px 15px 10px;  /* Order: top, right, bottom, left */
	margin-left: -20px;           /* Margins can be negative */
	border: 5px solid red;        /* border-width, border-style, border-color */
	padding-top: 100px;
	letter-spacing: 1px;
	word-spacing: 5px;
	text-indent: 10px;
}
```

## CSS Box Model

The CSS box model applies to each element that comprises a web page. If you were to set a background fill, you would only see it in the content + padding areas. Then the `border` property appears in between the edge of the visible element and a `margin`-defined spacing to the edge of the next element.

```
+-------------------------------------+
|               margin                |   .box {
|   +-----------------------------+   |       width: 70px;
|   |           border            |   |       padding: 10px;
|   |   +---------------------+   |   |       border: 5px solid #ccc;
|   |   |       padding       |   |   |       margin: 15px;
|   |   |   +-------------+   |   |   |   }
|   |   |   |             |   |   |   |
|   |   |   |   content   |   |   |   |
|   |   |   |             |   |   |   |
|   |   |   +-------------+   |   |   |
|   |   |                     |   |   |
|   |   +---------------------+   |   |
|   |                             |   |
|   +-----------------------------+   |
|                                     |
+-------------------------------------+

```

## Boiler plate HTML

There are many boiler plate web page templates out there, but this is the bare minimum that I like to start out with.

```html
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width">
		<title>Hello, world!</title>
		<link rel="stylesheet" href="style.css">
	</head>
	<body>
		<div id="page">
			Hello, world!
		</div>
	</body>
</html>
```

## Boiler plate CSS

Here is a bare minimum `style.css` to make a basic looking web page.

```css
body {
	font-size: 16px;
	line-height: 1.25em;
	margin: 15px;
}

#page {
	width: 100%;
	max-width: 750px;
	margin: 0 auto;
}
```

There are also a few _other_ things I like to throw into my CSS to start out with.

* [CSS reset](https://meyerweb.com/eric/tools/css/reset/)
* [Box sizing: border-box](https://www.paulirish.com/2012/box-sizing-border-box-ftw/)
* [System font stack](http://markdotto.com/2018/02/07/github-system-fonts/)

All of that comes out to:

```css
/* http://meyerweb.com/eric/tools/css/reset/
   v2.0 | 20110126
   License: none (public domain)
*/

html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed,
figure, figcaption, footer, header, hgroup,
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure,
footer, header, hgroup, menu, nav, section {
	display: block;
}
body {
	line-height: 1;
}
ol, ul {
	list-style: none;
}
blockquote, q {
	quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
	content: '';
	content: none;
}
table {
	border-collapse: collapse;
	border-spacing: 0;
}

/* https://www.paulirish.com/2012/box-sizing-border-box-ftw/ */
/* apply a natural box layout model to all elements, but allowing components to change */
html {
  box-sizing: border-box;
}
*, *:before, *:after {
  box-sizing: inherit;
}

body {
	/* http://markdotto.com/2018/02/07/github-system-fonts/ */
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
	font-size: 16px;
	line-height: 1.25em;
	margin: 15px;
}

#page {
	width: 100%;
	max-width: 750px;
	margin: 0 auto;
}
```

## CSS import

You might be thinking, _that CSS boiler plate is pretty complicated_, and you would be right. CSS is complicated, generally speaking. As you are struggling through it, know that getting good at CSS is a very good skill to have.

Here is one way we can make the CSS more manageable: `@import url("modular.css");`

Take a look at the [blank](blank/) folder for an example of how to use CSS `@import` commands to modularize your CSS.
