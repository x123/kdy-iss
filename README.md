# KDY ISS Documentation project

This project generates the static site for [KDY ISS
Documentation](https://x123.github.io/kdy-iss/) using MkDocs.

[![Docs Check](https://github.com/x123/kdy-iss/actions/workflows/check.yml/badge.svg)](https://github.com/x123/kdy-iss/actions/workflows/check.yml)

[![Deploy KDY Docs](https://github.com/x123/kdy-iss/actions/workflows/deploy.yml/badge.svg)](https://github.com/x123/kdy-iss/actions/workflows/deploy.yml)

## Quick Start for New Contributors

1. **Fork & Clone**: Fork the repository on GitHub and clone it to your local machine
2. **Setup Environment**: Use either nix or Python (see development sections below)
3. **Make Changes**: Edit or add markdown files in the `docs/` directory
4. **Preview**: Run `mkdocs serve` to preview your changes locally at `http://localhost:8000`
5. **Submit**: Create a pull request with your changes

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

You can run all the pre-commit hook checks (markdown linting, spell checking,
etc) with:

```bash
nix flake check
```

#### direnv

`direnv` with `nix-direnv` is also supported via the `.envrc` file.

If you're not using nix, you can use the [Determinate Systems
nix-installer](https://github.com/DeterminateSystems/nix-installer)

## Other methods

### Using Python

To serve the documentation locally only the following python packages are
needed:

- `mkdocs`
- `mkdocs-material`

`markdownlint` is used for Markdown linting, with custom settings for specific
rules (some disabled, some customized) defined in [flake.nix](flake.nix#L30).

[`typos`](https://github.com/crate-ci/typos) is used for spell checking.

## Serving MkDocs locally

`mkdocs serve`

## Contributing

- Make sure to run `markdownlint` with the appropriate rules first.
- Submit a PR.

### Using Github Desktop and an editor

To make contributions using Github Desktop and an editor of your choice (e.g.,
VSCode, SublimeText, R Studio editor, etc.):

1. Clone the repository using Github Desktop. (You can use the "<> Code" button
   on the github repository website to do that directly)
2. Create a branch, by forking the repository using Github desktop, website, or
   command line.
3. Open the repository in your editor of choice.
4. Modify the corresponding markdown.
5. Submit the changes (PR) to the main repository using Github Desktop or
   command line.
