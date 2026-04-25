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
