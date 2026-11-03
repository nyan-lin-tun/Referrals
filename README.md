# Referrals

All the referrals in one place.

Built with [Ignite](https://github.com/twostraws/Ignite), a static site generator for Swift.

## Development

Requires [Ignite](https://github.com/twostraws/Ignite) installed locally.

```sh
ignite build
```

After building, fix JS paths for subdirectory hosting:

```sh
find Build -name "*.html" -exec sed -i '' 's|src="/js/|src="/Referrals/js/|g' {} +
```

Then commit and push — GitHub Actions will deploy the `Build/` directory to GitHub Pages automatically.

## Live site

[nyanlintun.me/Referrals](https://nyanlintun.me/Referrals)

## Editing referrals

Each category lives in `Data/referrals/*.md`. Add or edit links directly in the
category file; no Swift changes are needed. For example:

```markdown
---
title: Investing
order: 20
---

- [Syfe](https://www.syfe.com/invite/trade/SRPS2ETNU)
```

Use an unquoted title and a unique integer order. Categories appear in ascending
order; links retain their order within each file. The body supports one Markdown
link per bullet, with an HTTP or HTTPS URL. Invalid entries, duplicate URLs, and
duplicate category titles or orders fail the build with the filename and reason.

After editing, run `ignite build`, then `ignite run --preview` to view the result.
Rebuild and refresh the browser after further Markdown edits.
