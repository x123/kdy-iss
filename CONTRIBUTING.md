# Contributing to KDY ISS Documentation

Thank you for your interest in contributing to the KDY International Sailing
School documentation! This guide will help you get started with making
contributions.

## Getting Started

1. **Fork the Repository**: Start by forking the repository to your own GitHub
   account.
2. **Clone the Repository**: Clone your fork to your local machine.
3. **Set Up Development Environment**: Set up your development environment
   using one of the following methods:
   - **Using Nix** (recommended): `nix develop .`
   - **Using Python**: Install `mkdocs` and `mkdocs-material`

## Making Changes

### Types of Contributions

We welcome the following types of contributions:

- Documentation improvements
- New content for boats, harbors, or procedures
- Updates to existing content
- Image additions or improvements
- Structure and navigation enhancements

### Style Guidelines

When contributing to the documentation, please follow these style guidelines:

1. **Markdown Formatting**:
   - Use proper Markdown syntax
   - Use headings appropriately (# for top-level, ## for sections, etc.)
   - Use lists, tables, and code blocks where appropriate

2. **Writing Style**:
   - Be clear and concise
   - Use active voice where possible
   - Focus on instructional content
   - Include practical examples

3. **Images**:
   - Place all images in the `docs/img/` directory
   - Use descriptive filenames
   - Optimize images for web use
   - Include alt text for accessibility

### Testing Your Changes

Before submitting a pull request, test your changes locally:

```bash
mkdocs serve
```

Then visit `http://localhost:8000` in your browser to preview the documentation.

### Quality Checks

Run these checks before submitting your contribution:

1. **Markdown Linting**:

   ```bash
   markdownlint docs/
   ```

2. **Spell Checking**:

   ```bash
   typos
   ```

3. **Link Checking** - Make sure all links work properly in your local preview.

## Submitting Your Contribution

1. **Commit Your Changes**: Make your changes and commit them with a clear,
   descriptive commit message.
2. **Push to Your Fork**: Push your changes to your fork on GitHub.
3. **Create a Pull Request**: Submit a pull request to the main repository.

### Pull Request Process

1. Fill in the pull request template with details about your changes
2. Reference any relevant issues
3. Request a review from a maintainer if appropriate
4. Address any feedback or requested changes

## Documentation Structure

When adding new content, please follow the existing structure:

- **Boat Documentation**: Add to the appropriate boat manual section
- **Harbor Information**: Add to the harbors section
- **Safety Procedures**: Add to the safety section
- **Training Materials**: Add to the appropriate training section

For new boat documentation, use the template at `docs/templates/boat-documentation-template.md`.

## Questions?

If you have any questions about contributing, please open an issue, contact the
repository maintainer, or an instructor.

Thank you for helping improve the KDY ISS Documentation!
