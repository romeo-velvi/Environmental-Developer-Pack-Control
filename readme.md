README — SDK & Runtime Switcher (Windows)

Overview
--------
This repository (or subdirectory) contains multiple installed SDK and runtime versions for the project.
Each version is kept in its own folder inside the subdirectory. Provided batch scripts allow you
to switch the active SDK or runtime for your current Windows shell session.

What the switch scripts do
--------------------------
- The Switch\<environment>.bat \<version> scripts adjust environment variables (for example PATH)
    in the current Command Prompt / PowerShell session so that the specified SDK/runtime version
    becomes active for commands you run in that shell.
- They do not permanently change system-wide environment variables. To make a global change,
    you must update System/User environment variables yourself.

Common usage
------------
From a Windows Command Prompt (cmd.exe) or PowerShell, run the appropriate switch script with `Administrator permissions`
the desired version string:

    Example (placeholder form):
        .\subdirectory\Switch<environment>.bat <version>

    Concrete examples:
        .\subdirectory\SwitchJava.bat 11.0.11
        .\subdirectory\SwitchFlutter.bat 9.0.306

Notes:
- Replace \<environment> with the actual environment name used by this repo (e.g., "Java", "Python", "Dotnet", "Flutter")
    or run the script filename that exists in the subdirectory.
- Replace \<version> with an exact version folder name that exists under the subdirectory.

Finding available versions
--------------------------
List the contents of the subdirectory to see which versions are available:

    cmd:
        dir .\subdirectory\versions

Verifying the active version
----------------------------
After running a switch script, verify the active tool version using the tool's version command.
Examples:
    - For flutter: flutter --version
    - For other toolchains: \<env> --version or \<tool> -v

for example, `javac --version` or `dotnet --version`

Troubleshooting
---------------
- If the switch doesn’t appear to take effect, confirm you ran the correct script for the current shell
    (cmd.exe vs PowerShell) and that you provided an exact version folder name.
- Ensure you run the script from a location that can reference the subdirectory (or specify the full path).
- If you need the change to persist across new shells or system-wide, update the system/user environment
    variables manually or use administrative tools.

Security and permissions
------------------------
- Running these scripts does <b>require</b> administrator privileges because it modifies the user's session environment variables. 

Contact / Notes
---------------
If the repository includes README.md at the root, add or adapt these instructions there. If the
switch scripts follow different naming or behavior conventions, refer to the script headers for specific details.