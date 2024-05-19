# KDY ISS Documentation project

This project generates the static site for [KDY ISS
Documentation](https://x123.github.io/kdy-iss/) using MkDocs.

## Development

### Using nix

If you are using nix, the entire development shell environment (including all
dependencies and pre-commit-hooks) can be easily instantiated using:

```bash
git clone https://github.com/x123/kdy-iss.git
cd kdy-iss
nix develop .
```

Then you can run and serve the docs locally with:

```bash
mkdocs serve
```

#### direnv

`direnv` with `nix-direnv` is also supported via the `.envrc` file.

If you're not using nix, you can use the [Determinate Systems
nix-installer](https://github.com/DeterminateSystems/nix-installer)

### Other methods

To serve the documentation locally only the following python packages are
needed:

- `mkdocs`
- `mkdocs-material`

`markdownlint` is used for Markdown linting, with custom settings for specific
rules (some disabled, some customized) defined in [flake.nix](flake.nix#L30).

## Serving MkDocs locally

`mkdocs serve`

## Contributing

- Make sure to run `markdownlint` with the appropriate rules first.
- Submit a PR.
