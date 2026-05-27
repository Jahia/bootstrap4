# Migration Guide

## Migration to Bootstrap 4 v4.6.0

**Please read carefully this part if you update Bootstrap 4 to v4.6.0.
We did refactor the *Layout / Grid* component by renaming the generated areas.**

From version v2.5.0 and 4.6.0 of Bootstrap 4 component, the contentList above a *Layout / Grid* component do not contain the systemName of the grid anymore.
As a result, you will be able to copy/paste or rename a *Layout / Grid* component without losing the content (or having ghost content).

This feature is only working on site content (not for *Layout / Grid* component created in the studio)

### How to apply this refactoring?

A groovy script has been made to refactor existing content. To execute this script, go to the *Groovy Console* (via the tools http://localhost:8080/tools). The name of the script is **grid-rename.groovy**
First, you can execute this script to test it without checking the *Apply refactoring*. It will list the nodes that will need to be updated. Then, you can check the **Apply refactoring** to save the updates by on the default workspace.
If you get an error during script execution, have a look at the console to get the list of nodes to manually publish. Then you can try to run the script again until there is no more errors.

### What is done on this script?

This script executes a query on your default repository and check on all *Layout / Grid* nodes if we need to rename the sub-nodes of type contentList to remove the grid systemName.

### What is not done with this script grid-rename.groovy?

#### Publication

This script updates the default workspace and publish nodes without pending modifications. All nodes with pending modification need to be manually published to be visible in live.

#### What else?

If you migrate from a 1.x version, please read the section below.

---

## Migration from Bootstrap 4 v1.x

**Please read this section if you update Bootstrap 4 from v1.x to v2.x**
We did refactor the *Layout / Grid* component by moving the *Grid* part to the *Create Row*.

As a result, when you want to create some columns, you will need to check the *Create Row / Columns* checkbox and then select the type of grid that you want to use (*Predefined* or *Custom*).

### How to apply this refactoring?

A groovy script has been made to refactor existing content. To execute this script, go to the *Groovy Console* (via the tools http://localhost:8080/tools). The name of the script is **grid-refactoring.groovy**
First, you can execute this script to test it without checking the *Apply refactoring*. It will list the nodes that will need to be updated. Then, you can check the **Apply refactoring** to save the updates by on the default workspace.

### What is done on this script grid-refactoring.groovy?

This script executes a query on your default repository and check on all *Layout / Grid* nodes if they use a *Predefined* or a *Custom* grid type, and set the right type on the *Create Row* mixin.

### What is not done with this script?

#### Publication

This script updates the default workspace and publish nodes without pending modifications; you will need to publish some nodes manually. Note that the publication is not mandatory; the output should be correct on Live even if you don't execute the groovy script.

#### Templates and other modules

You will also need to update all your modules or templates set that use the *Layout / Grid* module, and if you were using the legacy grid, you will need to check the *Create Row / Column* checkbox and select the right grid type.
