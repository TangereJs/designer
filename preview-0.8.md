#Polymer 0.8 Preview

Polymer 0.8 is a MAJOR change to Polymer. For an introduction to 0.8 see http://updates.html5rocks.com/2015/01/polymer-state-of-the-union and https://divshot.com/blog/web-components/polymer-0-8-sneak-peek/

The 0.8 primer https://github.com/Polymer/polymer/blob/0.8-preview/PRIMER.md provides a detailed reference for 0.8

From my point of view the main differences to 0.5 are

- changed data binding. Node.bind, template if, template repeate are gone. I think the main reason for that change is that it was based on Object.observe, which is only available natively in Chrome. Object.observe can become quite slow if the number of bound nodes increases. See https://github.com/Polymer/polymer/issues/1262 for more information about the new binding capabilities

- Shadow DOM is not required by default and mostly replaced by a Shady DOM (which just provides some basic features). The reason is probably the same: the polyfill for the complete ShadowDom is large and slow.


##Prepare your 0.8 Environment

Development for 0.8 is currently isolated from any Orchard development. To setup your development tree start with cloning the https://github.com/TangereJs/designer repo into a new directory and checkout the 0.8-preview branch.

Then run 

**pull-all.sh** *user* *pass*

where *user* is your github user name and *pass* is your password.

This will first save any components/at- directories (which fails the first time, but this can savely be ignored), then uses bower to get all dependencies, restores the saved components/at- and then uses git to check out the full components/at- repos.

The components.list contains only our components which are already converted to 0.8


##How to convert a component from 0.5

1. delete the component folder in components (e.g. component\at-carbon-message)
2. then clone the component into that folder to get the full git repo for the component
3. create (and checkout) a new branch called 0.8-preview
4. push that new and still empty branch to gitgub
5. at the component name to the components.list file in the designer root directory; commit and push that change
6. edit components\at-elements\bower.json and change the branch from #master  to #0.8-preview; commit and push that change
7. remove `<polymer-element>`, as it's not required any longer
8. the template is wrapped into a new `<dom-module>`, the id matches the element name
9. move `<style>` definition directly after `<dom-module>`, so out of the template (https://github.com/Polymer/polymer/blob/0.8-preview/PRIMER.md#scoped-styling). Merge element specific, external css files into this inline style.
10. in Polymer( a new *is:* parameter now defines the *component name*, *is:* matches the *id* used in `<dom-module>`
11. convert attributes and published to new properties
12. change demo to
  - use only components defined in external.html files, inline components in main html file don't work in FF/IE
  - FOUC prevention, `<body unresolved` seems to be missing, so removed unresolved for now or the demo will never show
  - ShadowDom is currently off by default. To test with shadow dom  invoke the demo.html page also with demo.html?dom=shadow
  




##Recommended Editor for component development: Brackets (http://brackets.io/)

It allows to open the designer repo with File -> Open Folder...

You can then open any file e.g. components/at-core-theme/demo.html and click on the preview button (Flash icon on top right) to directly start the demo.html in the browser

