[...document.querySelectorAll("aside")].forEach((aside, i) => {
  const anchor = aside.previousElementSibling;
  const name = `--paragraph-before-aside-${i}`;
  anchor.style.anchorName = name;
  aside.style.positionAnchor = name;
});
