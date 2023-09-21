# Contributing to Cyber Vault 

Welcome to Cyber Vault Project! We're excited that you're interested in contributing. Before you get started, please take a moment to review these guidelines to help ensure a smooth and collaborative development process.

## Table of Contents

1. [Code of Conduct](#code-of-conduct)
2. [How Open-Source Works](#how-open-source-works)
3. [Ways to Contribute](#ways-to-contribute)
4. [Prerequisites](#prerequisites)
5. [How to Contribute](#how-to-contribute)
6. [Submitting Pull Requests](#submitting-pull-requests)
7. [Testing](#testing)
8. [Documentation](#documentation)
9. [Reporting Issues](#reporting-issues)
10. [Contact](#contact)

## Code of Conduct

Please review our [Code of Conduct](CODE_OF_CONDUCT.md) before contributing to this project. We expect all contributors to follow these guidelines to create a friendly and inclusive community.

## How Open-Source Works
1. **Issues:**
   - Use GitHub Issues to track and manage tasks, bugs, and feature requests.
   - Create new issues for specific tasks or features that need to be implemented.
   - Assign issues to team members responsible for working on them.
   - Label issues to categorize them (e.g., "bug," "feature," "enhancement," "documentation," etc.).

2. **Branches:**
   - Each team member should create their own branch when working on a specific issue or feature. Branch names can be descriptive of the task, such as "fix-issue-123" or "feature-xyz."
   - Always create a new branch from the latest main or development branch to ensure you're working with the most up-to-date code.
   - Make sure that code changes related to an issue are contained within the respective branch.

3. **Pull Requests (PRs):**
   - When a team member completes their work on a branch, they should create a pull request to merge their changes into the main or development branch.
   - PRs serve as a way to review and discuss code changes with the team.
   - Use the PR description to link to the relevant issue(s) using keywords like "Closes #123" to automatically close the issue when the PR is merged.
   - Assign reviewers to the PR to ensure code quality and consistency.

4. **Code Reviews:**
   - Reviewers should thoroughly review the code changes, suggest improvements, and ensure that the code meets project standards.
   - Discuss any feedback or concerns within the PR's comment section.

5. **Merging PRs:**
   - Once a PR has been reviewed and approved, a project maintainer or team lead can merge it into the main or development branch.

6. **Continuous Integration (CI):**
   - Implement CI/CD (Continuous Integration/Continuous Deployment) tools to automatically run tests and ensure that code changes do not introduce new issues.



## Ways to Contribute

There are several ways you can contribute to this project:

- **Bug Reports:** If you encounter a bug, please [submit an issue](#reporting-issues) with a detailed description and, if possible, steps to reproduce the problem.
  
- **Feature Requests:** Have an idea for a new feature or improvement? [Open an issue](../../issues) and describe your suggestion.

- **Code Contributions:** If you'd like to contribute code, please follow the [Procedure](#how-to-contribute) outlined below.

- **Documentation:** Help improve our documentation by submitting changes or additions.

- **Testing:** You can help us by testing the project, especially new features and bug fixes. Please report any issues you find.

## Prerequisites

Before you start contributing, make sure you have:

- A [GitHub account](https://github.com/signup) for tracking your contributions.
- [Flutter](https://flutter.dev/docs/get-started/install) installed on your local machine.
- [Git](https://git-scm.com/) installed on your local machine.

## How to Contribute
1. Clone then repository to your local machine:

```bash
git clone https://github.com/muhammadaffanmaqsood/Cyber-Vault.git
```

 2. Change your current directory to the project folder:

 ```bash
 cd Cyber-Vault
 ```

3. Install project dependencies using Flutter's package manager:

 ```bash
 flutter pub get
 ```
   
4. Create a new branch for your feature or bug fix:

```bash
git checkout -b feature-or-bugfix-name
```

5. Make your changes and commit them:

```bash
git commit -m "Description of your changes"
```

5. Push your changes to your branch:

```bash
git push origin feature-or-bugfix-name
```

6. Create a pull request from your branch on GitHub's web interface.

## Submitting Pull Requests

When creating a pull request, please provide the following information:

- A clear and descriptive title.
- A summary of the changes made and the problem it solves.
- Reference to any related issues.
- Mention if your changes require updates to the documentation.

Our team will review your pull request as soon as possible. Please be patient and be ready to address any feedback or requested changes.


## Testing

Ensure your code changes do not break existing functionality. Write tests if necessary and make sure all tests pass before submitting your changes.

## Documentation

If your changes introduce new features or require updates to documentation, please include these changes in your pull request.

## Reporting Issues

If you encounter any problems or have suggestions for improvements, please [open an issue](../../issues) on GitHub. Provide as much detail as possible, including your environment and steps to reproduce the issue.

## Contact

If you have questions or need assistance, feel free to reach out to [M. Affan Maqsood](mailto:muhammadaffanmaqsood@gmail.com).

