# Changelog

All notable changes to this project are documented in this file.

## [4.7.0] - 2026-05-27

### Breaking Changes

- **Requires Jahia 8.2.0+** — support for Jahia 8.0 and 8.1 dropped (both are end-of-life or critical-only)
- **Requires Java 11+** — compiler target raised from Java 8 to Java 11 (aligns with Jahia 8.2 supported stack)
- **Spring wiring removed** — the `META-INF/spring/` context and Blueprint extender dependency have been deleted; the module is now OSGi Declarative Services only

### Security Fixes

- `bootstrap4nt_navbar/html/navbar.basenav.jsp` — XSS: `page1Title` was rendered unescaped in dropdown-item link text
- `bootstrap4nt_navbar/html/navbar.jsp` — XSS: `brandText` was rendered unescaped in HTML body
- `bootstrap4nt_carouselItem/html/carouselItem.jsp` — Stored XSS: `title` and `caption` rendered unescaped in `<h3>`/`<h4>`/`<p>` body elements in both edit-mode and live view
- `bootstrap4nt_card/html/card.jsp` — Stored XSS: `footer` property rendered unescaped

### Bug Fixes

- `bootstrap4nt_carousel/html/carousel.jsp` — carousel indicators: `active` class was placed on `<button>` instead of `<li>`; Bootstrap 4 CSS/JS targets `<li>` — visual state was permanently broken after first auto-slide
- `bootstrap4nt_carousel/html/carousel.jsp` — wrong guard variable: `${empty ride}` defaulted `wrap` instead of `${empty wrap}`, so `wrap` never got its default `true` value
- `bootstrap4nt_carousel/html/carousel.jsp` — JS injection: pause/play labels were injected into a `<script>` string via `fn:escapeXml`, which does not escape single-quotes or backslashes; replaced with data-attribute approach
- `bootstrap4nt_pagination/html/pagination.jsp` — disabled Previous/Next links were keyboard-activatable after `tabindex="-1"` removal; restored `tabindex="-1"` alongside `aria-disabled="true"`
- `bootstrap4nt_card/html/card.jsp` — dynamic HTML tag name for card header sanitized with a proper whitelist (`h1`–`h6`, `div`) instead of `fn:escapeXml`, which provided no protection against attribute injection
- `bootstrap4-package/pom.xml` — package jar was named `bootstrap4-package-x.y.z-root.jar` due to missing `<appendAssemblyId>false</appendAssemblyId>`; now produces `bootstrap4-package-x.y.z.jar`
- `bootstrap4-package/pom.xml` — `bootstrap4-core` dependency version was set to literal `c` (typo)

### Accessibility (WCAG 2.1 AA)

All components now target WCAG 2.1 Level AA conformance:

- **Breadcrumb** — wrapped `<ol>` in `<nav aria-label>` landmark; added `aria-hidden` to edit-mode fallback
- **Carousel** — added `aria-label`/`aria-roledescription="carousel"` to container; converted indicator `<li>` + `<a>` to `<li>` + `<button>`; added `aria-label`/`aria-current` to each indicator; converted prev/next `<a role="button">` to `<button>`; added WCAG 2.2.2-compliant pause/play control with live-region-safe label updates
- **Carousel Item** — added `role="group"` and `aria-label` with slide position announcement (e.g. "Slide 2 of 5")
- **Tabs** — added `aria-selected`, `role="presentation"` on `<li>`, `aria-labelledby` and `tabindex="0"` on panels; JS syncs `aria-selected` on tab change
- **Navbar** — brand image gets `aria-hidden="true"` when text is present; dropdown triggers converted from `<a>` to `<button>`; active links use `aria-current="page"` instead of visually-hidden "(current)"
- **Navbar dropdowns** — removed invalid `aria-owns`/`role="menu"` from language and login dropdowns
- **Navbar login** — fixed duplicate `class` attribute on logout link
- **Pagination** — wrapped `<ul>` in `<nav aria-label>`; disabled links use `aria-disabled="true"` + `tabindex="-1"`
- **Button/Modal** — added `aria-modal="true"`; `aria-labelledby` used when modal title is present, `aria-label` fallback when absent
- **Alert** — close button uses `aria-label` from i18n key
- **Grid** — close-warning button uses `aria-label` from i18n key
- **Image** — removed duplicate `id` attribute; improved default alt text logic

### Build & Infrastructure

- Maven CI-friendly versioning: `<revision>` property defined once in root pom; child modules reference `${revision}` in `<parent>` block; `flatten-maven-plugin` resolves it for deployed artifacts
- `bootstrap4-package` parent changed from the internal `bootstrap4-modules` back to `org.jahia.packages:jahia-packages-parent:8.2.0.0` (aligned with Bootstrap 5 package pattern)
- `Jahia-Required-Version` in package manifests updated from `8.0.0.0` to `8.2.0.0`
- Full manifest entries added to package: `Jahia-Package-ID`, `Jahia-Package-Name`, `Jahia-Package-Version`, `Jahia-Package-License`, `Jahia-Package-Description`
- CodeQL analysis workflow added (Java/Kotlin, weekly + on push/PR)
- Dependabot enabled for Maven dependencies (weekly)
- `LICENSE.txt` and `SECURITY.md` added for community project compliance

### Documentation

- `README.md` restructured: H1 title, Bootstrap 4 EOL warning linking to Bootstrap 5, installation instructions, full component list (added Alert and Tabs), accessibility and architecture sections
- `MIGRATION.md` created: migration guides for v4.6.0 and v1.x extracted from README
- Bootstrap 4 EOL date (January 1, 2023) documented; migration to [Bootstrap 5](https://github.com/jahia/bootstrap5/) recommended

---

## [4.6.8] - 2023-09-05

- Update definitions and language bundle for BACKLOG-21521 (carousel item improvements)

---

## [4.6.7] - 2022-08-31

- Update Bootstrap assets to v4.6.2
- Update Bootstrap assets to v4.6.1

---

## [4.6.6] - 2021-07-20

- Add custom picker for button internal link (`pagesandfilespicker`)

---

## [4.6.5] - 2021-06-30

- Update Bootstrap assets to v4.6.0 (QA-13554)
- Fix navbar exception in Studio in-context mode (QA-13562, PR #25)
- Fix issue [#23](https://github.com/Jahia/bootstrap4/issues/23)
- Order mixins for Grid/Layout component: section → container → row → limit → absolute (PR #26)
- Fix `Jahia-Depends` for core and components (QA-13371)

---

## [4.6.4] - 2020-10-14

- Update Bootstrap assets to v4.5.3
- Move `Jahia-Module-Priority` to maven-bundle-plugin instructions
- Fix missing `mainResourceNode` declaration in language switch menu

---

## [4.6.3] - 2020-10-01

- Add `language-nav` CSS class on language menu for easier customization (PR #14)
- Add ARIA attributes to language menu
- Add `listLimit` property support on grid/layout components (PR #21)
- Add dismiss option for alert skin
- Add alert skin: apply Bootstrap alerts to any content via the skins mechanism
- Add `aria-current="page"` and meaningful label for breadcrumb navigation
- Add documentation images

---

## [4.6.2] - 2020-08-13

- Update Bootstrap assets to v4.5.2
- Fix ghost list handling: do not rename lists not starting with `main`/`side`/`extra`/`col` (PR #18)
- Allow removal of ghost lists in grid rename script
- Fix grid rename script

---

## [4.6.1] - 2020-06-29

- Add missing Groovy migration script (`grid-rename.groovy`)

---

## [4.6.0] - 2020-06-29

- Grid area rename to allow copy/paste without losing content (PR #12) — see [Migration Guide](MIGRATION.md)
- Grid layout: support `container-{breakpoint}` CSS classes (PR #17)
- Navbar: add brand image for small/mobile devices
- Navbar: allow choosing a custom root page (PR #10)
- Navbar: add language switch button
- Button: add `id` attribute support (PR #13)
- Section/Grid: add `aria-label` management (PR #9)
- Section/Grid: escape `aria-label`, `class`, `role`, and `style` attributes

---

## [4.5.0] - 2020-05-25

- First release targeting Jahia 8 (rebase from 3.0.x branch)
- Update Bootstrap assets to v4.5.0

---

## [3.0.1] - 2020-05-08

- Escape `class`, `role`, and `style` attributes (XSS hardening)
- Force toolbar at definition level (QA-12895)

---

## [3.0.0] - 2020-05-05

- Initial Jahia 8 / DX 8 compatible release

---

## [2.5.4] - 2021-06-30

- Update Bootstrap assets to v4.6.0
- Fix navbar exception in Studio in-context mode
- Fix issue [#23](https://github.com/Jahia/bootstrap4/issues/23)

---

## [2.5.3] - 2020-10-14

- Update Bootstrap assets to v4.5.3
- Add alert skin (dismissible alerts on any content via skins)
- Add ARIA attributes to language menu
- Fix language switch menu (`mainResourceNode` declaration)
- Move `Jahia-Module-Priority` to maven-bundle-plugin instructions
- Add `listLimit` support on grid/layout component

---

## [2.5.2] - 2020-08-13

- Update Bootstrap assets to v4.5.2
- Fix ghost list handling in grid rename script (PR #18)
- Allow removal of ghost lists

---

## [2.5.0] - 2020-06-29

- Grid area rename to allow copy/paste without losing content (PR #12) — see [Migration Guide](MIGRATION.md)
- Grid layout: support `container-{breakpoint}` CSS classes (PR #17)

---

## [2.4.2] - 2020-06-24

- Fix card footer area name conflict with `freeFooter` property
- Minor typo fixes

---

## [2.4.1] - 2020-06-18

- Navbar: add brand image for small/mobile devices

---

## [2.4.0] - 2020-06-09

- Update Bootstrap assets to v4.5.0
- Button: add `id` attribute support (PR #13)
- Section/Grid: add `aria-label` management (PR #9)
- Navbar: allow choosing a custom root page (PR #10)
- Navbar: add language switch button
- Section/Grid: escape `aria-label` on section grid

---

## [2.3.0] - 2020-01-17

- Update Popper.js to v1.16.0
- Remove Spring usage — OSGi DS only (PR #6, BACKLOG-12086)

---

## [2.2.2] - 2020-01-13

- Fix: prevent loading Bootstrap headers twice

---

## [2.2.1] - 2020-01-03

- Navbar: display area name conditionally (studio vs edit mode, depending on grid creation context)
- Navbar fixes and updates
- Add SCM configuration to POM

---

## [2.2.0] - 2020-01-03

- Update Bootstrap assets to v4.4.1
- Fix: do not load `bootstrap.min.js` from `jmix:list` default view (prevented conflicts in siteSettings)
- Add missing tag declaration

---

## [2.0.1] - 2019-11-28

- Fix: add missing resource calls
- Improve edit mode when creating a section without row or containers
- README updates

---

## [2.0.0] - 2019-11-21

- Initial stable release for Jahia 7 / DX 7
