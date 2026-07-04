---
title: bringhurst.css
subtitle: A web adaptation of *The Elements of Typographical Style*
author: Oskar Wickström
author-url: "https://wickstrom.tech"
lang: en
toc-title: Contents
---

# Foreword {.unnumbered}

Two summers ago, just before I started working at TigerBeetle, I picked up a
new side project during downtime. I've always had a soft spot for
<abbr>CSS</abbr> but I don't know why; frankly, it's weird, confusing, and
infamously error-prone. It could be nostalgia from my early days of programming
web applications, or *Stockholm Syndrome* after years of captivity. Whatever
the cause, [The Monospace Web](https://owickstrom.github.io/the-monospace-web/)
was born out of that love, and it took off way harder than I ever thought it
would, with many personal blogs and even application interfaces having adopted
it.

So, here I am again, spending weekend off-hours in a form of meditative state
writing <abbr>CSS</abbr> for no purpose at all. This time, inspiration struck
after reading Robert Bringhurst's classic *The Elements of Typographic Style*.
A challenge indeed, trying to implement the layout and typography of the book
itself in the browser. Reckless, some might say! Surely the same rules don't
apply across print and web, and any such attempt is vanity or misguided
nostalgia. Perhaps, perhaps not. I've decided to publish regardless, and bid
you to take from it what you will; if you find it pleasant or useful, that's a
wonder, and if you find it cursed or pointless, you may leave it aside and
enjoy the abundance of silver-gradient sans-serif on purple, or why not the
dual-line slop-serif marketing pages, with which we are bestowed.

Consider this the spiritual and variable-width successor of *The Monospace
Web*, and equally open for reuse. I'm a sucker for Pandoc, but it should work
in many other settings with minor tweaks.

# Foundations

> Typography is the craft of endowing human language with a durable visual form.
> <footer>
>   <span class="author">Robert Bringhurst</span>,
>   <cite>The Elements of Typographic Style</cite>, 2nd edition,
>   <span class="year">2002</span>
> </footer>

## Typography

### A single versatile font as the basis of the design

In this document and its design, I'm using two variants of the *Alegreya* font.
The regular variant is used for body text and third-level headings. Its
small-caps variant, *Alegreya SC*, is used for titling-caps top-level headings,
small-caps second-level headings, and for inline abbreviations such as
<abbr>HTML</abbr>. Finally, *Courier Prime* is used for monospace code snippets.

Bringhurst argues in his book for choosing a single versatile typeface rather
than a hodgepodge of different ones. I think Alegreya is such a choice, and
an excellent one at that.

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
attribute is useful to control the bounds of hyphenation.

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

This document uses a few extra classes here and there, but mostly it's just markup.
This, for instance, is a regular paragraph. Look at this horizontal break:

<hr>

Lovely. We can hide stuff in the `<details`> element:

<details>
<summary>A short summary of the contents</summary>
<p>Hidden gems.</p>
</details>

## Lists

This is a plain old bulleted list:

* Banana
* Paper boat
* Cucumber
* Rocket

Ordered lists look pretty much as you'd expect:

1. Goals
1. Motivations
    1. Intrinsic
    1. Extrinsic
1. Second-order effects

## Tables

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
    <td>43°45'50.78"N 11°15'3.34"E</td>
  </tr>
  <tr>
    <td>Pyramid of Khafre</td>
    <td>215.25m &times; 215.25m &times; 136.4m</td>
    <td>29°58'34"N 31°07'51"E</td>
  </tr>
</tbody>
</table>

## Code Blocks

```css
:root {
  --font-family: "Alegreya", serif;
  --line-height: 1.2;
  --border-thickness: 1.5px;
  --text-color: #000;
  --text-color-alt: #666;
  --background-color: #fff;
  --background-color-alt: #eee;
}
```
