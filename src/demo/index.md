---
title: The Bringhurst Web
subtitle: A web adaptation of *The Elements of Typographical Style*
author: '[Oskar Wickström](https://wickstrom.tech)'
lang: en
toc-title: Contents
---

# Foreword {.unnumbered}

Two summers ago, just before I started working at TigerBeetle, I picked up a
new side project during downtime. I've always had a soft spot for
<abbr>CSS</abbr> but I don't know why; frankly, it's weird, confusing, and
infamously error-prone. It could be nostalgia from my early days of programming
web applications. Whatever the cause, [The Monospace
Web](https://owickstrom.github.io/the-monospace-web/){.canonical-name} was born
out of that love, and it took off way harder than I ever thought it would, with
many personal blogs and even application interfaces having adopted it.

So, here I am again, spending weekend off-hours in a form of meditative state
writing <abbr>CSS</abbr>. This time, inspiration struck after reading Robert
Bringhurst's classic *The Elements of Typographic Style*. A challenge indeed,
trying to implement the layout and typography of the book itself in the
browser. Reckless, some might say! Surely the same rules don't apply across
print and web, where the latter cannot lean on a fixed page size, but has all
the capabilities of a programmable platform. Perhaps, perhaps not. I've decided
to publish regardless, and bid you to take from it what you will; if you find
it pleasant or useful, that's a wonder, and if not, that's fine.

Consider this the spiritual and variable-width sequel of [The Monospace
Web]{.canonical-name}, and equally open for reuse. I'm a sucker for Pandoc, and
that's what I've used to produce this HTML, but the stylesheet should work in
many other settings with minor tweaks.

# Foundations

> Typography is the craft of endowing human language with a durable visual form.
> <footer>
>   <span class="author">Robert Bringhurst</span>,
>   <cite>The Elements of Typographic Style</cite>, 2nd edition,
>   <span class="year">2002</span>
> </footer>

## Typography

### A single versatile font as the basis of the design

In this document and its design, I'm using two variants of the
[Alegreya]{.canonical-name} font. The regular variant is used for body text and
third-level headings. Its small-caps variant, [Alegreya SC]{.canonical-name},
is used for titling-caps top-level headings, small-caps second-level headings,
and for inline abbreviations such as <abbr>HTML</abbr>. Finally, [Courier
Prime]{.canonical-name} is used for monospace code snippets.

<aside>
While this isn't the most lightweight CSS ever imagined, I am mindful
of the amount of bytes needing to be transmitted before you see something
decent. The stylesheets are around 10kB and the fonts are just shy of 200kB.
</aside>

Bringhurst argues in his book for choosing a single versatile typeface rather
than a hodgepodge of different ones. I think [Alegreya]{.canonical-name} is
such a choice, and an excellent one at that.

### A sizing system built on relative measurements

Every size is based on the root font size, which is 16px. Sizes are thus given
in `rem` units, relative to the root font size. The following table shows how
fractional, `rem`, and pixel measurements correlate.

<figure>
<table id="font-sizes">
    <tr>
        <td style="font-size: calc((3rem / 4));">a</td>
        <td style="font-size: calc((7rem / 8));">a</td>
        <td style="font-size: 1rem;">a</td>
        <td style="font-size: calc((9rem / 8));">a</td>
        <td style="font-size: calc((5rem / 4));">a</td>
        <td style="font-size: calc((11rem / 8));">a</td>
        <td style="font-size: calc((3rem / 2));">a</td>
        <td style="font-size: 2rem;">a</td>
        <td style="font-size: calc((5rem / 2));">a</td>
        <td style="font-size: 3rem;">a</td>
        <td style="font-size: 4rem;">a</td>
    </tr>
    <tr>
        <td>3/4</td>
        <td>7/8</td>
        <td>1</td>
        <td>9/8</td>
        <td>5/4</td>
        <td>11/8</td>
        <td>3/2</td>
        <td>2</td>
        <td>5/2</td>
        <td>3</td>
        <td>4</td>
    </tr>
    <tr>
        <td>0.75</td>
        <td>0.875</td>
        <td>1</td>
        <td>1.125</td>
        <td>1.25</td>
        <td>1.375</td>
        <td>1.5</td>
        <td>2</td>
        <td>2.5</td>
        <td>3</td>
        <td>4</td>
    </tr>
    <tr>
        <td>12</td>
        <td>14</td>
        <td>16</td>
        <td>18</td>
        <td>20</td>
        <td>22</td>
        <td>24</td>
        <td>32</td>
        <td>40</td>
        <td>48</td>
        <td>64</td>
    </tr>
</table>
<figcaption>Standard font sizes in fractional and decimal <code>rem</code> units, along with their <code>px</code> equivalents.</figcaption>
</figure>

Sizing everything based on the root font size makes it easy to scale the 
design, for instance on smaller viewports:

```css
@media screen and (max-width: 480px) {
  :root {
    font-size: 14px;
  }
}
```

The line height is 1.2rem, and is used as the basis for vertical alignment of
all elements. Much like in *The Monospace Web* --- but not to the same extremes
--- I've tried to get everything globally aligned to multiples of the line
height.

### Justified text in modern browsers

As in the book, body text is justified, not ragged right. To some, this is
grave heresy on the web. *Thou shalt not justify.* That's what we've all been
taught. But browsers have improved over time and today it's not unthinkable to
justify text. This stylesheet uses `word-break` and `hyphens` to control how
words are broken and hyphenated at line breaks. The `hyphenate-limit-chars`
property is useful to control the bounds of hyphenation.

The risk is of course getting horrible word spacing and *rivers* of whitespace
in your paragraphs. If justified text doesn't work for your uses, consider
`text-align: left` instead. In this document I find that it works acceptably
with the line lengths, font size, and the content itself.

<aside>
["Justified Text: Better Than
Expected?"](https://cloudfour.com/thinks/justified-text-better-than-expected/)
goes into the weeds of text justification and modern browser support.
</aside>

### Indented paragraphs for legibility

In keeping with tradition, each successive paragraph is indented 3ch,
which is the width of three 0 (0x30) characters. As an example, the 
paragraph following this one leads with an indent.

This lets your eyes more easily scan the structure of the text and find the
starts and ends of paragraphs. We've done this in print text for at least half
a millennium, and while the web has largely settled on no indent and vertical
space between paragraphs, it is still a valid approach.

## Colors

You may have noticed that this design is devoid of color. It's all black on
white. Not only am I personally inclined towards this minimalism in prose-heavy
documents, at least as a strong default that I depart from only with careful
consideration, but it's also what Bringhurst argues in his book, although with
print media in mind. I find it aesthetically pleasing and easier on the eyes,
and it reserves the arsenal of color, and thus the attention of the reader, for
the most critical things, such as diagrams conveying complex data.

# Elements

This document uses a few extra classes here and there, but mostly it's just
semantic <abbr>HTML5</abbr> markup. This, for instance, is a regular paragraph.
The examples below are indented for clarity; in normal use they'd span the full
width of the text.

## Headings

The design provides styles for three level of headings --- top-level chapter headings (`h1`), section headings (`h2`), and
sub-section headings (`h3`):

<figure class"example">

<h1 data-number="1">
<span class="header-section-number">1</span>
On the theory of war
</h1>

<h2 data-number="1.2">
<span class="header-section-number">1.2</span>
Art or science of war
</h2>

<h3 data-number="1.2.1">
<span class="header-section-number">1.2.1</span>
Usage still unsettled
</h3>
</figure>

<aside>
Sadly, due to how I've configured Pandoc section numbering, top level
headings are `<h1>` elements when they should be `<h2>` elements. If you 
produce HTML markup some other way, you might want to avoid this and modify
the stylesheet accordingly.
</aside>

## Emphasis

There's no surprise here; text in `<em>` tags is italicized, just as you'd
expect:

<figure class="example">
  Do you think I can stay to become <em>nothing</em> to you?
</figure>

## Horizontal line breaks

There's no clear guidance on horizontal line breaks in Bringhurst's book, but
it seems to me like a good place for ornamentation. Here's one:

<figure class="example">
<hr />
</figure>

The symbol used is U+2767 [Rotated Floral Heart Bullet]{.canonical-name} from
the Unicode *Dingbats* block.

## Details

We can hide stuff in the `<details`> element. Click the label below:

<figure class="example">
<details>
<summary>A short summary of the contents</summary>
<p>Hidden gems.</p>
</details>
</figure>

## Asides

The book uses plenty of side notes. In <abbr>HTML</abbr> we define those using
`<aside>` elements. Along with this paragraph there's a side note. With a large
enough viewport, you'll see it in the right margin, aligned with the top of the
previous paragraph; with a smaller viewport, it'll be collapsed into an inline
paragraph with ornamentation.

<aside>
This is the contents of the aside element, shown in a smaller font size and with ragged-right text alignment.
</aside>


## Names

Proper nouns and canonical names, distinguished using the `.canonical-name`
class, are rendered as small-caps much like in the example from the book:

<figure class="example">
... on the islands of [Lombok]{.canonical-name}, [Bali]{.canonical-name}, [Flores]{.canonical-name},
[Timor]{.canonical-name} and [Sulawesi]{.canonical-name}, the same textiles ...
</figure>

## Blockquotes

Bringhurst talks about various ways of typesetting quotations, and the one I
landed on is using an indented block, italic quote text, and a footer with
*author*, *work*, and *year*.

> Je n’ai fait celle-ci plus longue que parce que je n’ai pas eu le loisir de la faire plus courte.
> <footer>
>   <span class="author">Blaise Pascal</span>,
>   <cite>Lettres Provinciales</cite>, letter XVI,
>   <span class="year">1657</span>
> </footer>

## Figures

Images with captions are put in `<figure>` and `<figcaption>` elements,
respectively. Similar to blockquotes, *author* and *work* are styled 
specifically using small-caps and italic text.

<figure>
    <img src="src/demo/vitruvian-man.jpg" width="435" />
    <figcaption>
        <span class="author">Leonardo Da Vinci</span>,
        <cite>Vitruvian Man</cite>, 
        <span>c. 1490, pen and watercolor over metalpoint on paper, 34.4 × 24.5 cm (photograph via [Wikimedia Commons](https://en.wikipedia.org/wiki/File:VitruvianMan_Leonardo_a.jpg))</span>
    </figcaption>
</figure>

The captions are set in a smaller size, 0.875rem, matching the side notes. This
clarifies the distinction between primary and secondary content.


## Lists

This is a plain old bulleted list:

<figure class="example">
* Banana
* Paper boat
* Cucumber
* Rocket
</figure>

Ordered lists look pretty much as you'd expect:

<figure class="example">
1. Goals
1. Motivations
    1. Intrinsic
    1. Extrinsic
1. Second-order effects
</figure>

## Tables

Tabular data is presented with a strong table head, using small-caps labels and
a border. Otherwise it's very simple, relying only on spacing.

<figure class="example">
<table>
<thead>
  <tr>
    <th>Name</th>
    <th>Dimensions</th>
    <th>Position</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>Boboli Obelisk</td>
    <td>1.41m &times; 1.41m &times; 4.87m</td>
    <td>43°45&prime;50.78&Prime;N 11°15&prime;3.34&Prime;E</td>
  </tr>
  <tr>
    <td>Pyramid of Khafre</td>
    <td>215.25m &times; 215.25m &times; 136.4m</td>
    <td>29°58&prime;34&Prime;N 31°07&prime;51&Prime;E</td>
  </tr>
</tbody>
</table>
</figure>

## Code Blocks

This design is geared towards prose, not code-heavy technical writing, but code
blocks and inline code should read well nonetheless. The font choice of
[Courier Prime]{.canonical-name} might feel a bit typewriter-nostalgic, but I
find it goes very well with [Alegreya]{.canonical-name} and the overall feel
I'm aiming for. Here's some code from this page's `index.css` file:

<figure class="example">
```css
:root {
  --font-family: "Alegreya", serif;
  --line-height: 1.2;
  --border-thickness: 1.5px;
  --text-color: #000;
  --background-color: #fff;
}
```
</figure>

# Usage

> Immature poets imitate; mature poets steal.
> <footer>
>   <span class="author">T.S. Eliot</span>,
>   <cite>The Sacred Wood</cite>,
>   <span class="year">1920</span>
> </footer>

## Purpose

This design is meant for web documents comprised mainly of prose: books,
journals, blogs, manuals, and the like. You might use this as a basis for your
personal website, a specific project, or maybe a larger wiki. You probably
don't want it in a dynamic web application.

Copy or fork what you want, modify it to your heart's content, but don't forget
proper attribution. The sources have license information in their headers, so
it's easy as keeping those around.

## Getting started

To get started quickly, add these to the `head` element of your HTML:

```html
<link rel="stylesheet" href="https://owickstrom.github.io/the-bringhurst-web/index.css" />
```

If you're using Pandoc, download the sources, put it in your project as
`the-bringhurst-web`, and invoke it with some thing like the following set of
arguments:

```bash
pandoc \
    --toc --toc-depth=2 \
    -s \
    --number-sections --number-offset=0 \
    --css the-bringhurst-web/index.css \
    -V'header-includes=<script src="index.js"></script>' \
    --no-highlight \
   -i index.md \
   -o index.html
```

If you do need syntax highlighting, consider using a custom template like the
[one used for this HTML
output](https://github.com/owickstrom/the-bringhurst-web/blob/main/src/demo/template.html),
stripping away the default CSS included by Pandoc.

# Colophon {.unnumbered}

TODO: credits and such
