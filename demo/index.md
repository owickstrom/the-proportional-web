---
title: Elements of Web Typography
subtitle: Or, stealing from the greats. 
author: Oskar Wickström
author-url: "https://wickstrom.tech"
lang: en
toc-title: Contents
---

# Introduction

## Thoughts & Reasons

Lorem ipsum dolor sit amet, consectetur *adipiscing elit*. Sed vitae tortor ut
arcu facilisis fermentum quis eget sem. Fusce pharetra velit nec nisi lacinia,
vel dapibus nulla fermentum. Sed vitae metus fringilla, sodales ipsum nec,
volutpat dolor. Nam euismod augue metus, et sollicitudin metus euismod ac.
Quisque posuere euismod eros, non dapibus odio commodo vitae. Donec fermentum
ex ut purus condimentum facilisis at pharetra velit. 

> Typography is the craft of endowing human language with a durable visual form.
> <cite>Robert Bringhurst</cite>

Aliquam vestibulum turpis ornare ex tincidunt, placerat mollis neque fermentum.
Suspendisse potenti. Quisque non ante velit. Sed tincidunt ultrices odio,
euismod interdum lorem convallis a. Etiam eros odio, pretium et gravida et,
feugiat sit amet enim. Aenean sed neque dictum, hendrerit enim dictum, accumsan
velit. Mauris porta risus sed quam laoreet, ac porta ex lacinia. Praesent
consectetur quam enim, sed faucibus orci congue a.

## Principles

### Do the thing.

Sed scelerisque pretium velit consectetur ultricies. Maecenas dignissim dolor
sed diam feugiat, sit amet iaculis felis hendrerit. Sed vestibulum dui sed sem
cursus, non facilisis dolor rutrum. Duis tincidunt vestibulum mi et luctus.
Orci varius natoque penatibus et magnis dis parturient montes, nascetur
ridiculus mus.

Vivamus pharetra arcu a dui ultrices, non fermentum massa
sollicitudin. Orci varius natoque penatibus et magnis dis parturient montes,
nascetur ridiculus mus. Suspendisse imperdiet, dui a luctus dapibus, leo velit
convallis augue, a malesuada ex leo eget justo. Integer nec malesuada eros.
Curabitur mi quam, suscipit id enim sit amet, condimentum aliquam quam.
Phasellus in elementum odio, ut efficitur tortor.

### Do it well.

Orci varius natoque penatibus et magnis dis parturient montes, nascetur
ridiculus mus. In rutrum, dolor a gravida dignissim, felis tortor laoreet odio,
eget ornare lacus nunc ac lectus. Nulla quis nisl id mauris ultricies porttitor
id quis ante. Donec vestibulum at lorem non rutrum. Etiam feugiat feugiat
elementum. Etiam erat mauris, eleifend ac fermentum nec, accumsan nec nisi.
Nullam eu consequat sapien. Proin lacinia vestibulum aliquam. Nunc dignissim
nisi in metus tempus, porta consequat sapien auctor. Quisque congue, sem at
congue tempus, libero nulla vestibulum justo, a facilisis magna erat eu ante.
Curabitur posuere erat ut risus pharetra, convallis tempor erat volutpat.
Integer lectus lectus, eleifend ut sagittis nec, rhoncus a est. Nulla non
scelerisque nisl.

### Do it every day.

Aliquam interdum felis nunc, vitae accumsan ipsum ultricies finibus. Nullam
dictum magna id justo ornare, quis aliquam nulla dignissim. Praesent vitae leo
volutpat, consectetur enim nec, rutrum risus. Quisque rhoncus, lorem sed
elementum condimentum, leo augue cursus felis, vitae molestie ipsum lacus sed
massa. Aenean at elit ac erat facilisis placerat. Donec luctus arcu vel dictum
hendrerit. Sed a lacinia arcu. Sed ullamcorper, massa sit amet feugiat
tincidunt, neque ante varius urna, in porttitor nulla massa eu justo. Morbi
eleifend est vitae elementum varius. Cras scelerisque augue ullamcorper mauris
vestibulum maximus. Etiam ullamcorper sem nec arcu ultrices luctus nec eu
tortor. Quisque fermentum libero eu ex pulvinar aliquet. Curabitur semper eu
diam ac pellentesque. Donec hendrerit congue enim, at laoreet massa porta at.
Maecenas eu augue mi.

Nulla in tellus mauris. Cras aliquet quis ex quis ullamcorper. Suspendisse eu
orci sit amet ligula imperdiet ultrices quis euismod ante. Fusce ut lobortis
erat. Sed convallis est a cursus aliquam. Pellentesque a ultrices dui. Praesent
mattis nisl eget metus imperdiet rhoncus.

# Elements

This document uses a few extra classes here and there, but mostly it's just markup.
This, for instance, is a regular paragraph.

Look at this horizontal break:

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

It's nice to visualize trees.
This is a regular unordered list with a `tree` class:

<ul class="tree"><li><p style="margin: 0;"><strong>/dev/nvme0n1p2</strong></p>

* usr                               
    * local                         
    * share                         
    * libexec                       
    * include                       
    * sbin                          
    * src                           
    * lib64                         
    * lib                           
    * bin                           
    * games                         
        * solitaire
        * snake
        * tic-tac-toe
    * media                         
* media                             
* run                               
* tmp                               

</li></ul>

## Tables

We can use regular tables that automatically adjust to the monospace grid.
They're responsive. 

<table>
<thead>
  <tr>
    <th class="width-min">Name</th>
    <th class="width-auto">Dimensions</th>
    <th class="width-min">Position</th>
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

Note that only one column is allowed to grow.

## Forms

Here are some buttons:

<nav>
    <button>Reset</button>
    <button>Save</button>
</nav>

And inputs:

<form class="grid">
<label>First name <input type="text" placeholder="Placeholder..." /></label>
<label>Last name <input type="text" placeholder="Text goes here..." /></label>
<label>Age <input type="text" value="30" /></label>
</form>

And radio buttons:

<form class="grid">
<label><input name="radio" type="radio" /> Option #1</label>
<label><input name="radio" type="radio" /> Option #2</label>
<label><input name="radio" type="radio" /> Option #3</label>
</form>

## Grids

Add the `grid` class to a container to divide up the horizontal space evenly for the cells.
Note that it maintains the monospace, so the total width might not be 100%.
Here are six grids with increasing cell count:

<div class="grid"><input readonly value="1" /></div>
<div class="grid"><input readonly value="1" /><input readonly value="2" /></div>
<div class="grid"><input readonly value="1" /><input readonly value="2" /><input readonly value="3" /></div>
<div class="grid"><input readonly value="1" /><input readonly value="2" /><input readonly value="3" /><input readonly value="4" /></div>
<div class="grid"><input readonly value="1" /><input readonly value="2" /><input readonly value="3" /><input readonly value="4" /><input readonly value="5" /></div>
<div class="grid"><input readonly value="1" /><input readonly value="2" /><input readonly value="3" /><input readonly value="4" /><input readonly value="5" /><input readonly value="6" /></div>

If we want one cell to fill the remainder, we set `flex-grow: 1;` for that particular cell.

<div class="grid"><input readonly value="1" /><input readonly value="2" /><input readonly value="3!" style="flex-grow: 1;" /><input readonly value="4" /><input readonly value="5" /><input readonly value="6" /></div>

## ASCII Drawings

We can draw in `<pre>` tags using [box-drawing characters](https://en.wikipedia.org/wiki/Box-drawing_characters):

```
╭─────────────────╮
│ MONOSPACE ROCKS │
╰─────────────────╯
```

To have it stand out a bit more, we can wrap it in a `<figure>` tag, and why not also add a `<figcaption>`.

<figure>
<pre>
┌───────┐ ┌───────┐ ┌───────┐
│Actor 1│ │Actor 2│ │Actor 3│
└───┬───┘ └───┬───┘ └───┬───┘
    │         │         │    
    │         │  msg 1  │    
    │         │────────►│    
    │         │         │    
    │  msg 2  │         │    
    │────────►│         │    
┌───┴───┐ ┌───┴───┐ ┌───┴───┐
│Actor 1│ │Actor 2│ │Actor 3│
└───────┘ └───────┘ └───────┘</pre>
<figcaption>Example: Message passing.</figcaption>
</figure>

Let's go wild and draw a chart!

<figure><pre>
                      Things I Have
                                              
    │                                     ████ Usable
15  │
    │                                     ░░░░ Broken
    │
12  │             ░            
    │             ░            
    │   ░         ░              
 9  │   ░         ░              
    │   ░         ░              
    │   ░         ░                    ░
 6  │   █         ░         ░          ░
    │   █         ░         ░          ░
    │   █         ░         █          ░
 3  │   █         █         █          ░
    │   █         █         █          ░
    │   █         █         █          ░
 0  └───▀─────────▀─────────▀──────────▀─────────────
      Socks     Jeans     Shirts   USB Drives
</pre></figure>

## Media

Media objects are supported, like images and video:

![A room in an old French castle (2024)](demo/castle.jpg)

![[The Center of the Web (1914), Wikimedia](https://en.wikisource.org/wiki/Page:The_Center_of_the_Web_(1914).webm/11)](https://upload.wikimedia.org/wikipedia/commons/e/e0/The_Center_of_the_Web_%281914%29.webm)

They extend to the width of the page, and add appropriate padding in the bottom to maintain the monospace grid.

# Discussion

That's it for now.
I've very much enjoyed making this, pushing my CSS chops and having a lot of fun with the design.
If you like it or even decide to use it, please [let me know](https://x.com/owickstrom).

The full source code is here: [github.com/owickstrom/the-monospace-web](https://github.com/owickstrom/the-monospace-web)

Finally, a massive shout-out to [U.S. Graphics Company](https://x.com/usgraphics) for all the inspiration.
