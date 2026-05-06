Run `ignite build` to build the site. If it succeeds, run the JS path fix:

```sh
find Build -name "*.html" -exec sed -i '' 's|src="/js/|src="/Referrals/js/|g' {} +
```

Then commit any staged/unstaged changes (ask for a commit message if there are changes to commit) and run `git push`. If the build fails, stop and report the error without pushing.
