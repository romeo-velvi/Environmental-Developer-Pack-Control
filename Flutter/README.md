
---

# SwitchFlutter.bat — README

## Overview

`SwitchFlutter.bat` selects and configures a specific **Flutter version** for the current machine by updating environment variables and system paths so the chosen `Flutter` binary is used.

The script sets the `FLUTTER` environment variable and updates the `PATH` to ensure the selected JDK version is active in the terminal.

---

## Installation Note

1) The first thing to install your derired Flutter version following this link: https://docs.flutter.dev/install/archive. 
2) Move these files inside the `Flutter\versions` folder.
3) Extract the zip.
4) Rename the unzipped folder as `flutter-<version_choosen>` 

Two direct download link have been already added inside the `Flutter\versions`:
   - Flutter version 3.38.2	
   - Flutter version 3.27.2

<br>
For the script to work correctly, the folder hierarchy must remain consistent with the downloaded or cloned repository.

The script relies on the following structure to locate JDK folders:

```
[script folder]\
└─ versions\
   ├─ flutter-3.38.2\
   ├─ flutter-3.27.2\
```

Maintaining this layout also keeps your local Flutter installations organized.

---

## Working Principle

1. Ensure the Flutter version you want to use exists under the path `.\versions\flutter-<version>`.
2. Call `SwitchFlutter.bat <version>` in a terminal with administrative privileges to persist system changes.

---

## Usage

Launch the command prompt with **administrative privileges** (needed to update system environment variables):

```
.\SwitchFlutter.bat <version>
```

Example:

```
.\SwitchFlutter.bat 3.38.2
```

---

## Verification

Check the currently active Flutter version with:

```
Flutter -version
```

The output should match the version you passed to the script.

---

## Troubleshooting

* If `flutter --version` shows a different version, check `PATH` for residual references to other JDK installations.
* Run the script as administrator to persist system-wide environment variable changes.
* Ensure the selected JDK folder exists under `.\versions\flutter-<version>` and follows the correct naming convention.

---

## Safety

* Back up current environment variables before running the script.
* Confirm that required system paths are preserved when modifying `PATH`.

---
