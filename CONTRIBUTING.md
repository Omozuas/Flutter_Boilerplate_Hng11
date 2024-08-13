# Contributing to Flutter HNG Boilerplate

We appreciate your interest in contributing to the Flutter HNG Boilerplate. Here are some guidelines to help you get started.

## How to Contribute

1. **Get Linear Ticket:**

   Get your linear ticket approved for either feature or fix.

2. **Submit Code:**

   - **Clone the Repository:** Start by cloning the repository on GitHub.
     
     ```bash
     git clone https://github.com/Omozuas/Flutter_Boilerplate_Hng11.git
     ```

   - **Create a Branch:** Create a branch for your changes:
     
     ```bash
     git checkout -b feat/slack-id/your-feature
     ```
   
   - **Make Changes:** Implement your changes or new features.
   - **Test Your Changes:** Ensure your changes work as expected and do not break existing functionality.
   - **Commit Your Changes:** Commit your changes with a clear and descriptive message:
     
     ```bash
     git add .
     git commit -m "feat: Describe the changes made"
     ```
   
   - **Pull Changes from Dev:** Push and sync recent changes from the dev branch:
     
     ```bash
     git pull origin dev
     ```
   
   - **Push Your Changes:** Push your changes to your created branch:
     
     ```bash
     git push origin feat/slack-id/your-feature
     ```
   
   - **Create a Pull Request:** Open a pull request to the main branch with a description of your changes.

# Merging

Under any circumstances should you merge a pull requests on a specific branch to the `dev` or `main` branch

### _Commit CheatSheet_

| Type     |                          | Description                                                                                                 |
| -------- | ------------------------ | ----------------------------------------------------------------------------------------------------------- |
| feat     | Features                 | A new feature                                                                                               |
| fix      | Bug Fixes                | A bug fix                                                                                                   |
| docs     | Documentation            | Documentation only changes                                                                                  |
| style    | Styles                   | Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)      |
| refactor | Code Refactoring         | A code change that neither fixes a bug nor adds a feature                                                   |
| perf     | Performance Improvements | A code change that improves performance                                                                     |
| test     | Tests                    | Adding missing tests or correcting existing tests                                                           |
| build    | Builds                   | Changes that affect the build system or external dependencies (example scopes: gulp, broccoli, npm)         |
| ci       | Continuous Integrations  | Changes to our CI configuration files and scripts (example scopes: Travis, Circle, BrowserStack, SauceLabs) |
| chore    | Chores                   | Other changes that don't modify , frontend or test files                                                    |
| revert   | Reverts                  | Reverts a previous commit                                                                                   |

> _Sample Commit Messages_

- `chore: Update README file` := `chore` is used because the commit didn't make any changes to the , frontend or test folders in any way.
- `feat: Add plugin info endpoints` := `feat` is used here because the feature was non-existent before the commit.

### Note : Commit messages
- Use the present tense ("Add feature" not "Added feature")


## Code of Conduct

Please follow our [Code of Conduct](CODE_OF_CONDUCT.md) when contributing to this project.

## Style Guide

- Follow the Dart style guide for code formatting.
- Make use of the Re-Usable Components created in lib/utils/widgets
- Make use of the global colors created in lib/utils/globalColors
- Make use of PascalCase for Classes
- Make use of snake_case for File names
- Make use of camelCase for Methods
- Ensure your code is well-documented with comments and documentation.
- If you need to export image or icon from Figma, always do that in 4x.


Thank you for contributing to the Flutter HNG Boilerplate!
