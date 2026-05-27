
Bootstrap 4 This is a Bootstrap 4 implementation of http://getbootstrap.com for Digital Experience Manager. This version is not compliant with the official bootstrap 3.

## Accessibility

All components target **WCAG 2.1 Level AA** conformance. This includes semantic landmark regions, keyboard navigation, ARIA roles and labels, accessible carousels with pause/play controls (WCAG 2.2.2), focus management, and screen-reader-compatible form and navigation patterns.

## Architecture

This module uses **OSGi Declarative Services** exclusively. There is no Spring application context and no Blueprint extender dependency. Service components (choice list initializers) are registered via `@Component` annotations scanned by the Felix maven-bundle-plugin.

## WARNING: Migration to Bootstrap 4 v4.6.0
If you update the Bootstrap 4 modules to v4.6.0, please read the [Migration Guide](MIGRATION.md).

## Installation/dependencies  
 * First, you need to install the module Popper.js: available on the store https://store.jahia.com/module/popperjs  
 * Then you can deploy the bootstrap4-core module and the bootstrap4-components

You can also install the Bootstrap 4 package that comes with all dependencies.   
  
## List of components : 

### Breadcrumb  
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
  
### Tabs
Toggleable tabs for displaying grouped content panels.

### Text  
This component provides bootstrap 4 styles and CK templates  
  
### Version  
Adds a div describing the bootstrap version used
