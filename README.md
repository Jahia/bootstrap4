
# Bootstrap 4 for Jahia DXM

A Bootstrap 4 implementation of [getbootstrap.com](http://getbootstrap.com) for Jahia Digital Experience Manager.

> [!WARNING]
> **The Bootstrap 4 framework (CSS/JS assets) reached end of life on January 1, 2023.** It no longer receives features, updates, or security fixes. We strongly recommend migrating to [Bootstrap 5](https://github.com/jahia/bootstrap5/).

## WARNING: Migration to Bootstrap 4 v4.6.0
If you update the Bootstrap 4 modules to v4.6.0, please read the [Migration Guide](MIGRATION.md).

## Installation

**Dependencies (required before deployment):**
- [Popper.js](https://store.jahia.com/module/popperjs) — install from the Jahia Store first
- `bootstrap4-core` — deploy before `bootstrap4-components`

**Recommended:** install the `bootstrap4-package` module, which bundles all dependencies in one step.

## Components

### Alert
Contextual feedback messages for user actions. Supports dismissible alerts with multiple color variants (success, danger, warning, info, etc.).

### Breadcrumb
Indicates the current page's location within the site navigation hierarchy.

### Button
Styled call-to-action element. The button action can be:
- An internal or external link
- A collapsible content panel
- A modal dialog
- A popover

### Card
Flexible content container with optional header, footer, image, and colored background. Supports nested droppable content areas.

### Carousel
Slideshow cycling through a series of slides, each with an image, title, and caption. Includes accessible pause/play control and keyboard navigation.

### Figure
An image paired with an optional caption, using semantic `<figure>`/`<figcaption>` markup.

### Grid
Mobile-first flexbox layout system based on a 12-column grid. Supports predefined column splits and custom configurations across multiple breakpoints.

### Media Object
Positions a media element (image, icon) alongside a block of text that does not wrap around it.

### Navbar
Responsive site navigation bar with support for branding, dropdown menus, language switcher, and login button.

### Pagination
Navigation controls for paginated content lists, bound to a list component.

### Tabs
Toggleable tab panels for organizing content into labelled sections.

### Text
Rich-text content area with Bootstrap 4 typography styles and CKEditor templates.

### Version
Renders a label displaying the active Bootstrap version. Located in the `bootstrap4-core` module.

## Accessibility

All components target **WCAG 2.1 Level AA** conformance. This includes semantic landmark regions, keyboard navigation, ARIA roles and labels, accessible carousels with pause/play controls (WCAG 2.2.2), focus management, and screen-reader-compatible form and navigation patterns.

## Architecture

This module uses **OSGi Declarative Services** exclusively. There is no Spring application context and no Blueprint extender dependency. Service components (choice list initializers) are registered via `@Component` annotations scanned by the Felix maven-bundle-plugin.
