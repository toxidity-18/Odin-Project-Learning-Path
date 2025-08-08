# Links and Images 

## Introduction 
- Help to link two or more html pages together thus the term website

## Lesson overview 
1) Link external content on other websites .
2) Link content on ur own website .
3) Difference between absolute and relative links .
4) How to embed images on ur webpage .

### Anchor elements 
- a tags : href at the opening tag : show the destination of the link / the embedded link .

  - Open the link in new tab or new windows : target attr : set a value of _blank  and also rel attr which describes the relation between the current page and the linked document ( page opened in the new tab) 
  - ```html 
      <a href='"https://www.theodinproject.com/about"' target='_blank' rel='noopener norefferer'>About Odin project</a>
      <!-- target = _blank : this open the link document in a new tab .
      rel = noopener : prevent the current page from accessing and manipulating the original pages .
      rel = norefferer : prevent the current psge from knowing where the user come from thus enhances security  -->
      ```
       
### Absolute and relative links

1) Absolute : links to pages other website on the internet .

  - Usually made of three parts i.e : scheme://domain/path '"https://www.theodinproject.com/about"

2) Relative : Links to pages on our own webpage .
  - ```html 
      <a href=./pages/About.html>About page</a>
      <!-- - ./ = simply mean at the current directory
       -->
       ```

### Images 
- These are void elements which work the same way as anchor elements but now they have the src attr which embed both absolute and relative path to the require images .
- ```html 
    <img src="../images/image.png" alt="Screenshot"> # ../ choosing which directory our images are located 
  ```
  