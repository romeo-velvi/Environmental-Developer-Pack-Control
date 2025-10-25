# SwitchDotnet.bat — README

## Overview
SwitchDotnet.bat selects and configures a specific .NET SDK/runtime version for the current machine by updating environment variables and system paths so the chosen dotnet binary is used.



## Note
In order to work, the folder hiearchy and layout must be the same as the cloned/downloaded project. 

This is because the .bat code will look to that folder structure to retrieve the path of the project (moreover, this can be seen also as a way to keep things organized). 



## Working principle
1. Check/Add your version you choose is in the path `.\version\dotnet-sdk-<verision>`. 
2. Remove or disable references to other .NET installations so the chosen version becomes the active one.
3. Call the SwitchDotnet.bat \<version> in terminal (`admin privileges`)



## Add Binaries of your version
You can insert into the folder `.\versions` your .NET SDK <b>BINARIES</b>. 

You can install the desired version following this link: https://dotnet.microsoft.com/en-us/download/dotnet. 


Unzip the downloaded resources in `.\versions` and <b>rename</b> the folder following the naming convention specified as: `dotnet-sdk-<verision>`

This repo comes with 3 different versions already unzipepd (8.0.121, 9.0.306, 10.0.100).



## Remove previously installed .NET verisons
You have to remove or disable references to other .NET installations before running the script, so the chosen version becomes the active one. 

You may easily do that following the procedure: 
1. Press Win + I to open Settings.
2. Go to Apps → Apps & features.
3. In the search box, type: .NET
4. You will see installed .NET SDKs and .NET Runtimes.
5. Click the entry you want to remove and select Uninstall.
6. Follow the prompts to complete the uninstallation.

You can consider check and remove also the folder `C:\Program Files\dotnet` or `C:\Program Files (x86)\dotnet`.

Don't forget to erease also in the environmental path eventual pointer residuals.

## Usage
You can launch the command prompt with <b>administrative</b> privileges (since it will modify system environment variables):
```
.\SwitchDotnet.bat <version>
```
Example:
```
.\SwitchDotnet.bat 9.0.306
```

- Argument: the single argument is the version identifier used to locate the corresponding dotnet folder (script-dependent naming).

- PATH handling: the script removes old dotnet entries and prepends/appends the path to the selected dotnet's `dotnet.exe`. It ensures `C:\files_to_dotnet` remains present in PATH.

- Persistency: when run with elevated privileges, the script can update system environment variables so changes persist across sessions; otherwise it updates only the current session.



## Verification
You can check if the verision has been changed by using the following command:
```
dotnet --version
```
Should report the choiced version passed to the script.



## Troubleshooting
- If `dotnet --version` shows a different version, check PATH for remaining references to other dotnet installations and ensure `C:\files_to_dotnet` is still present.
- Run the script in an elevated prompt if PATH changes need to be written to system environment variables.
- If the script cannot find the version folder, verify installation paths and naming conventions used by your dotnet folders.



## Safety
Back up current environment variables before running the script. Confirm that required Python directory `C:\files_to_dotnet` is preserved.
