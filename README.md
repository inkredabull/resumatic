Resumatic
============

TAGLINE 
------------
"Like CSS selectors?  You'll love XPath!"

WELCOME
------------
Welcome to the most recent, Rails-flavored tool powering anthonybull.com.

BACKGROUND
------------
This tool began life as a scratched-itch.

Years ago, I was putting up content on my site to showcase my skills 
while maintaining my resume in MS Word.  The overlap was obvious, but 
I couldn't find a tool to make my resume 2HTML or 2PDF in a consistenly 
aesthetically-pleasing way (although [Easy Resume Creator Pro][1] gets an honorable mention.) 

LinkedIn showed promise when they introduced profile-to-PDF but not 
having control over the visual design irked me. 

And so, Resumatic was born (as a WordPress plugin in PHP.)

Why use XML and XSLT? 

Having worked with such technologies ([DocSouth][2]), I understood the potential
of encapsulating all data in a single source of truth - XML - 
and repurposing as desired using stylesheets.

The paradigm has stuck but the delivery mechanism has been updated 
on occasion as new web technologies emerge.

THREE STEP SETUP 
------------
1. <code>git clone git@github.com:inkredabull/resumatic.git</code>
2. <code>rails server</code>
3. you're in business : http://localhost:3000

AND THEN...
------------
- change defaults in application controller
- set Google Analytics ID in analytics.js
- edit data/resume.xml (gotcha: need to have image in public/images with project title)

[1]: http://www.winresume.com/    "Easy Resume Creator Pro"
[2]: http://anthonybull.com/project/docsouth "DocSouth" 
