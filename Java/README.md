
---

# SwitchJava.bat — README

## Overview

`SwitchJava.bat` selects and configures a specific **Java JDK version** for the current machine by updating environment variables and system paths so the chosen `java` binary is used.

The script sets the `JAVA_HOME` environment variable and updates the `PATH` to ensure the selected JDK version is active in the terminal.

---

## Note

1) The first thing to do is decompress the zip modules: 
	- ".\versions\jdk-11.0.11\lib\modules.zip"	
	- ".\versions\jdk-19.0.2\lib\modules.zip"

For the script to work correctly, the folder hierarchy must remain consistent with the downloaded or cloned repository.

The script relies on the following structure to locate JDK folders:

```
[script folder]\
└─ versions\
   ├─ jdk-1.8.0\
   ├─ jdk-11.0.11\
   └─ jdk-19.0.2\
```

Maintaining this layout also keeps your local Java installations organized.

---

## Working Principle

1. Ensure the Java version you want to use exists under the path `.\versions\jdk-<version>`.
2. Remove or disable references to other Java installations so the chosen version becomes active.
3. Call `SwitchJava.bat <version>` in a terminal with administrative privileges to persist system changes.

---

## Add Binaries of Your Version

You can insert your desired JDK version into the `.\versions` folder.

1. Download the desired JDK from the official source: [https://www.oracle.com/java/technologies/javase-downloads.html](https://www.oracle.com/java/technologies/javase-downloads.html) or OpenJDK distributions.
2. Extract/unzip the downloaded archive into `.\versions`.
3. Rename the folder following the naming convention:

```
jdk-<version>
```

For example: `jdk-11.0.11`.

This repository comes with the following preconfigured versions:
`1.8.0`, `11.0.11`, `19.0.2`.

---

## Remove Previously Installed Java Versions

To ensure the selected version becomes active, remove or disable other Java installations:

1. Press **Win + I** to open **Settings**.
2. Navigate to **Apps → Apps & features**.
3. Search for `Java`.
4. Uninstall any versions you do not need.

Optionally, verify and clean up:

* `C:\Program Files\Java`
* `C:\Program Files (x86)\Java`
* Any leftover Java paths in the system `PATH`.

---

## Usage

Launch the command prompt with **administrative privileges** (needed to update system environment variables):

```
.\SwitchJava.bat <version>
```

Example:

```
.\SwitchJava.bat 11.0.11
```

* **Argument:** The single argument is the version identifier, used to locate the corresponding JDK folder (script-dependent naming).
* **PATH Handling:** The script prepends the selected JDK’s `bin` folder to the `PATH`, ensuring the correct `java` and `javac` executables are used.
* **Persistency:** Running the script with elevated privileges updates system environment variables, making the change persist across sessions; otherwise, it only applies to the current terminal session.

---

## Verification

Check the currently active Java version with:

```
java -version
```

The output should match the version you passed to the script.

---

## Troubleshooting

* If `java -version` shows a different version, check `PATH` for residual references to other JDK installations.
* Run the script as administrator to persist system-wide environment variable changes.
* Ensure the selected JDK folder exists under `.\versions\jdk-<version>` and follows the correct naming convention.

---

## Safety

* Back up current environment variables before running the script.
* Confirm that required system paths are preserved when modifying `PATH`.

---
