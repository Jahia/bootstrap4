
Bootstrap 4 This is a Bootstrap 4 implementation of http://getbootstrap.com for Digital Experience Manager. This version is not compliant with the official bootstrap 3.  
  
## WARNING: Migration to Bootstrap 4 v2.5.0 or to v4.6.0
If you update the Bootstrap 4 modules to v2.5.0 (for Jahia 7.3 users) or to v4.6.0 (for Jahia 8 users), please read the dedicated part [below](#migration-to-bootstrap-4-v250-or-v460)

## Installation/dependencies  
 * First, you need to install the module Popper.js: available on the store https://store.jahia.com/module/popperjs  
 * Then you can deploy the bootstrap4-core module and the bootstrap4-components

You can also install the Bootstrap 4 package that comes with all dependencies.   
  
## List of components : ### Breadcrumb  
Indicate the current page’s location within a navigational hierarchy  
  
### Button  
Use Bootstrap’s custom button styles for actions in forms, dialogs, and more. Includes support for a handful of contextual variations, sizes, states, and more.  
#### Button action can be  
 * An internal or an external link  
 * A collapsible content   
 * A modal (dialog prompts)  
 * A popover  
  
### Card  
A card is a flexible and extensible content container. It includes options for headers and footers, a wide variety of content, contextual background colors, and powerful display options.  
Cards replace our old panels, wells, and thumbnails in bootstrap 3.  
  
### Carousel  
The carousel is a slideshow for cycling through a series of content  
  
### Figure  
Anytime you need to display a piece of content—like an image with an optional caption, consider using a figure.  
  
### Grid  
Bootstrap includes a powerful mobile-first flexbox grid system for building layouts of all shapes and sizes. It’s based on a 12 column layout and has multiple tiers, one for each media query range.  
  
### Media object  
The media object helps build complex and repetitive components where some media is positioned alongside content that doesn’t wrap around said media.   
  
### Navbar  
The navbar provides simple navigation for your site  
  
### Pagination  
Pagination links indicate a series of related content exists across multiple pages.  
  
### Text  
This component provides bootstrap 4 styles and CK templates  
  
### Version  
Adds a div describing the bootstrap version used  
  

# Migration to Bootstrap 4 v2.5.0 or v4.6.0

**Please read carefully this part if you update Bootstrap 4 v2.5.0 (for Jahia 7.3 users) or to v4.6.0 (for Jahia 8 users).
We did refactor the *Layout / Grid* component by renaming the generated areas.** 

From version v2.5.0 or 4.6.0 of Bootstrap 4 component, the contentList above a *Layout / Grid* component do not contain the systemName of the grid anymore. 
As a result, you will be able to copy/paste or rename a *Layout / Grid* component without losing the content (or having ghost content). 

This feature is only working on site content (not for *Layout / Grid* component created in the studio)  

## How to apply this refactoring?  
A groovy script has been made to refactor existing content. To execute this script, go to the  *Groovy Console* (via the tools http://localhost:8080/tools). The name of the script is **grid-rename.groovy**  
First, you can execute this script to test it without checking the *Apply refactoring*. It will list the nodes that will need to be updated. Then, you can check the **Apply refactoring** to save the updates by on the default workspace.  
If you get an error during script execution, have a look at the console to get the list of nodes to manually publish. Then you can try to run the script again. 

  
## What is done on this script?  
This script executes a query on your default repository and check on all *Layout / Grid* nodes if we need to rename the sub-nodes of type contentList to remove the grid systemName.
  
## What is not done with this script grid-rename.groovy?  
### Publication  
This script updates the default workspace and publish nodes without pending modifications. All nodes with pending modification need to be manually published to be visible in live.  
### What else?
If you migrate from a 1.x version, please read carefully the dedicated paragraph below. 

# Migration from Bootstrap 4 v1.x
  
**Please read this file if you update Bootstrap 4 from v1.x to v2.x**  
We did refactor the *Layout / Grid* component by moving the *Grid* part to the *Create Row*.  
  
As a result, when you want to create some columns, you will need to check the *Create Row / Columns* checkbox and then select the type of grid that you want to use (*Predefined* or *Custom*).  
## How to apply this refactoring?  
A groovy script has been made to refactor existing content. To execute this script, go to the  *Groovy Console* (via the tools http://localhost:8080/tools). The name of the script is **grid-refactoring.groovy**  
First, you can execute this script to test it without checking the *Apply refactoring*. It will list the nodes that will need to be updated. Then, you can check the **Apply refactoring** to save the updates by on the default workspace.  
  
## What is done on this script grid-refactoring.groovy?  
This script executes a query on your default repository and check on all *Layout / Grid* nodes if they use a *Predefined* or a *Custom* grid type, and set the right type on the *Create Row* mixin.  
  
## What is not done with this script?  
### Publication  
This script updates the default workspace and publish nodes without pending modifications; you will need to publish some nodes manually. Note that the publication is not mandatory; the output should be correct on Live even if you don't execute the groovy script.  
### Templates and other modules  
You will also need to update all your modules or templates set that use the *Layout / Grid* module, and if you were using the legacy grid, you will need to check the *Create Row / Column* checkbox and select the right grid type.
