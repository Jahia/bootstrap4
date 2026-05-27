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

## [4.6.8] - 2024

See git history for previous changes.
