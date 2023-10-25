# Cyber Vault 
Cyber Vault is a state-of-the-art password manager application designed to simplify and enhance the security of password management for individuals and organizations. In an age of increasing digital threats and the need for robust data protection, Cyber Vault offers a comprehensive solution to safeguard sensitive information, promote password hygiene, and provide a seamless user experience.

## Table of Content
1. [Key Features](#key-features)
2. [Functional Requirements](#functional-requirements)
3. [Non-Functional Requirements](#non-functional-requirements)
4. [Flutter Installation](#flutter-installation)
5. [Project Setup](#project-setup)
6. [Project Team](#project-team)
7. [Code of Conduct](#code-of-conduct)
8. [Contributing](#contributing)
9. [Support](#support)
10. [License](#license)
11. [Acknowledgments](#acknowledgments)

## Key Features  
### Password Vault: 
Cyber Vault provides a secure and user-friendly vault to store and manage a wide range of sensitive information, including:
- **Passwords:** Users can securely store and organize their passwords for various online accounts, ensuring that each password is strong and unique. 
- **Credit Card Information:** Users can conveniently manage credit card details, including card numbers, expiration dates, and CVVs, with encryption to safeguard financial data. 
- **Personal Identity Information:** Securely store personal identity information for quick and secure online form filling. 
- **Secure Notes and Documents:** Users can keep important notes and documents alongside passwords, ensuring that all sensitive data is easily accessible yet well-protected. 
### Security and Password Health:
-  **Strong Encryption:** Cyber Vault uses robust encryption algorithms (e.g., AES-256) to protect user data both in storage and during transmission. 
-  **Password Strength Analysis:** Users receive real-time feedback on password strength, helping them create stronger and more secure passwords. 
- **Password Reuse Detection:** The application identifies and alerts users about password reuse across multiple accounts, reducing the risk of security breaches. 
-  **Password Change Recommendations:** Cyber Vault provides recommendations for changing weak or commonly used passwords, along with tools to generate strong, unique replacements.

### User Convenience:
-  **Browser Integration:** A seamless browser extension integrates with popular web browsers (e.g., Chrome, Brave, Firefox, Safari) to offer auto-fill capabilities for passwords, credit card details, personal identity information, and documents, enhancing user convenience. 
-  **Password Generation:** Users can generate strong, unique passwords with ease, eliminating the hassle of creating and remembering complex passwords. 
-  **Search and Organization:** Cyber Vault offers a robust search functionality and the ability to organize passwords and data into folders or categories for efficient data management. 
### Enhanced Security Measures:  
-  **Biometric Authentication:** Users have the option to use biometric authentication (e.g., fingerprint, face recognition) for secure login. 
-  **Two-Factor Authentication (2FA) Integration:** For accounts with 2FA enabled, Cyber Vault includes an integrated authenticator tool that generates One-Time Passwords (OTPs) within the app, enhancing account security. 
-  **Emergency Access:** In case of emergencies, users have limited offline access to their password data.

## Functional Requirements: 
### User Registration:
Users should be able to create an account with a unique username and password.

### Login:
Users should be able to log in securely with their credentials.

### Biometric Authentication:
Users should have the option to use biometric authentication (e.g., fingerprint, face recognition) for login.

### Password Storage:
The app should securely store and encrypt user passwords.

### Integrated 2FA Authenticator:
For accounts that have 2FA enabled, the app should include an integrated authenticator tool that generates One-Time Passwords (OTP) within the app. Users should have the option to copy the OTPs to the clipboard for easy pasting during the login process.

### Secure Document Storage:
Users should be able to securely store and manage various documents such as passports, driver’s licenses, and birth certificates.

### Credit Card Storage:
Users should be able to securely store credit card information, including card numbers, expiration dates, and CVVs.

### Personal Identity Information Storage:
Users can conveniently create and securely store their personal identity information for use when filling out online forms.

### Secure Notes:
Users should be able to store secure notes and documents alongside passwords.

### Browser Extension:
The browser extension should seamlessly integrate with the password manager app to offer autofill capabilities for passwords, credit card details, personal identity information, and various documents when users encounter online forms and fields, enhancing user convenience and data management.

### Data Import/Export:
Users should be able to import and export app data securely.

### Cloud Backup:
The password manager app should provide users with a comprehensive cloud backup feature, ensuring the secure storage and synchronization of passwords, credit card details, notes, documents, and all other user data.

### Trash Feature:
Deleted passwords and other items should be stored in a trash and can be recovered within 30 days.

### Automatic Password Update:
Users should have the option to enable automatic password updates within a specified time interval.

### Password Organization:
Users should be able to organize passwords using folders or categories.

### Password Search:
Users should have a search functionality to quickly find stored passwords.

### Password Expiry Reminder:
The app should provide a feature for users to set password expiry dates and receive timely reminders to change passwords for enhanced security.

### Password Generation:
Users should be able to generate strong, unique passwords.

### Offline Access:
Users should have limited offline access to their password data for emergencies.

### Password Reuse Detection:
Implement a feature that checks for password reuse across multiple accounts and alerts users when they try to use a password that has been used elsewhere.

### Weak Password Detection:
The app should have a built-in algorithm that evaluates the strength of newly created passwords and provides feedback to users if the password is too weak. Suggestions for improving password strength should be included.

### Password Change Recommendations and Reminders:
The system should provide users with recommendations for changing weak or commonly used passwords and allow them to set reminders to periodically change their passwords, especially for critical accounts, to reduce the risk of unauthorized access.

### Password Blacklist:
Maintain a blacklist of commonly used and compromised passwords to prevent users from selecting easily guessable or unsafe passwords.

### Password History Check:
Regularly scan the password history to identify and notify users of any outdated, weak, or compromised passwords that need attention.

### Third-Party Data Breach Monitoring:
Integrate with third-party services that monitor data breaches and compromised passwords on the internet. Notify users if their passwords are found in any data breaches.

### Password Strength Meter:
Include a visual password strength meter during password creation and editing, providing real-time feedback to help users create stronger passwords.

## Non-Functional Requirements

### Security:
- The system should use strong encryption algorithms (e.g., AES-256) to protect user data.
- Passwords and sensitive information must be securely stored and transmitted.
- The application should undergo regular security audits and vulnerability assessments.

### Performance:
- The system should provide low-latency response times when accessing stored data.
- It should be able to handle a large number of users and a high volume of data without performance degradation.
- Response times for password retrieval and data synchronization should be within acceptable limits.

### Availability:
- The application should have high availability, with minimal downtime for maintenance and updates.
- Users should be informed in advance of any scheduled maintenance or downtime.

### Scalability:
- The system should be designed to scale horizontally or vertically to accommodate increasing user loads and data storage requirements.
- Scalability should be easy to achieve without significant disruptions.

### Reliability:
- The application should be highly reliable, with data integrity and consistency maintained at all times.
- Backup and disaster recovery mechanisms should be in place to prevent data loss.

### Usability:
- The user interface should be intuitive and user-friendly, catering to both technical and non-technical users.
- User documentation and help resources should be readily available.

### Compatibility:
- The application should be compatible with a wide range of devices, browsers, and operating systems.
- It should also support various password import/export formats for user convenience.

### Resource Efficiency:
- The application should be designed to minimize resource consumption, including memory and CPU usage, to ensure optimal performance.


## Flutter Installation

To get started with Flutter development, you'll need to install Flutter on your local machine. Follow these steps to set up Flutter:

1. **System Requirements:**
   Before you begin, ensure that your development environment meets the system requirements specified for Flutter, regardless of whether you are using [Windows](https://docs.flutter.dev/get-started/install/windows
), [macOS](https://docs.flutter.dev/get-started/install/macos), [Linux](https://docs.flutter.dev/get-started/install/linux), or [Chrome OS](https://docs.flutter.dev/get-started/install/chromeos) as your development platform.

2. **Download Flutter:**

   You can download the latest stable version of Flutter from the official [Flutter website](https://docs.flutter.dev/get-started/install/) using one of the following methods:

   - Using `git` (recommended):
     ```sh
     git clone https://github.com/flutter/flutter.git
     ```

   - Downloading the compressed archive:
     - Visit the [Flutter releases page](https://flutter.dev/docs/development/tools/sdk/releases).
     - Download the appropriate compressed archive for your operating system (e.g., `flutter_windows_vX.Y.Z.zip` for Windows, `flutter_macos_vX.Y.Z.tar.xz` for macOS).
     - Extract the archive to a location on your machine.

3. **Add Flutter to Your Path:**

   To execute Flutter commands from the command line, you'll need to add the Flutter binary directory to your system's `PATH` environment variable. The exact steps for this depend on your operating system:
   
   - **For macOS and Linux:**
     Add the following line to your shell profile file (e.g., `.bashrc`, `.zshrc`, `.profile`):
     ```sh
     export PATH="$PATH:`pwd`/flutter/bin"
     ```
     Then, reload your shell or run `source ~/.bashrc` (or equivalent) for the changes to take effect.

   - **For Windows:**
     Add the full path to the `flutter\bin` directory to your system's `PATH` environment variable.

4. **Run `flutter doctor`:**

   Open a terminal and run the following command to check if there are any dependencies you still need to install or further steps required:
   ```sh
   flutter doctor
   ```

   Follow the prompts to complete the installation of any missing dependencies.

5. **Verifying Installation:**

   Finally, run the following command to verify that Flutter has been successfully installed:
   ```sh
   flutter --version
   ```

   This should display the installed Flutter version.

Congratulations! You've successfully installed Flutter on your machine. You're now ready to start developing with Flutter.

For more information and detailed documentation, visit the [Flutter website](https://flutter.dev/).

## Project Setup

1. **Flutter Setup**: If you haven't already, you'll need to install Flutter. Follow the [official Flutter installation guide](https://flutter.dev/docs/get-started/install) to get started.

2. **Clone the Repository**: Clone this repository to your local machine using Git:

   ```bash
   git clone https://github.com/affan-ch/Cyber-Vault.git
   ```

3. **Navigate to the Project Folder**: Change your current directory to the project folder:

   ```bash
   cd Cyber-Vault
   ```

4. **Install Dependencies**: Install project dependencies using Flutter's package manager:

   ```bash
   flutter pub get
   ```

5. **Run the Application**: You can now run the Flutter application on an emulator or physical device:

   ```bash
   flutter run
   ```
   
## Project Team 
- [Affan Ch.](https://github.com/affan-ch)  
- [Sultan NoorudDin](https://github.com/SultanNoorudDin) 
- [Yasir Mehmood](https://github.com/Yasir-Mahmood-124) 
- [Umer Farooq](https://github.com/umer-farooq-official) 

## Code of Conduct

We are committed to fostering an inclusive and welcoming community. Please take a moment to review our [Code of Conduct](CODE_OF_CONDUCT.md) to understand our expectations for behavior within this project.
   
## Contributing

We welcome contributions! Please read our [Contribution Guidelines](CONTRIBUTING.md) for details on how to get started.

## Support 
If you encounter any issues or have questions, please [open an issue](https://github.com/affan-ch/Cyber-Vault/issues) or contact us at support@cybervault.com.

## License

This project is licensed under the [GNU General Public License v3.0](LICENSE).

## Acknowledgments

- Thanks to [Affan Ch.](https://github.com/affan-ch) for the inspiration.
- Special thanks to the [Flutter community](https://flutter.dev/community) for their support and resources.
- Thanks to the [Material Design 3 community](https://m3.material.io/) for their design guidance. 
- We are grateful for the services provided by [Firebase](https://firebase.google.com/) for making our project possible.
