# SwitchPython.bat — README

## Overview
SwitchPython.bat selects and configures a specific python version for the current machine by updating environment variables and system paths so the chosen python is actiive used.



## Note
In order to work, the folder hiearchy and layout must be the same as the cloned/downloaded project. 

This is because the .bat code will look to that folder structure to retrieve the path of the project (moreover, this can be seen also as a way to keep things organized). 



## Working principle
1. Check/Add your version you choose is in the path `.\version\Py-<verision>`. 
2. Remove or disable references to other python installations so the chosen version becomes the active one.
3. Call the SwitchPython.bat \<version> in terminal (`admin privileges`)



## Add Binaries of your version
You can insert into the folder `.\versions` your Python <b>folder</b>. 

You can install the desired version following this link: https://www.python.org/downloads/windows using the `installer (.exe)`.

The installation procedure in order to get just the folder containing all the files it the following:
1. Go and download the installer. 
2. After the downloas is completed click the .exe file. Usually, for this procedure appears a message which states: `Install Now` or `Customize installation` with the checkbox `use admin privileges ...` and another checkbox `Add pyhton.exe to path`. 
3. <b>Uncheck all</b> and click `Customize installation`.
4. You can see another page, you have to <b>uncheck all again</b> and click `next`. 
5. There is another page, you you have to <b>uncheck all again</b> and you can `customize installation location` and click `install`.

Once the folder with the python data is created, move it in the folder `.\versions` and <b>rename</b> the folder following the naming convention specified as: `Py-<verision>`

This repo comes with 3 different versions already installed (3.11.9, 3.12.7, 3.13.0).



## Remove previously installed Python verisons
You have to remove or disable references to other python installations before running the script, so the chosen version becomes the active one. 

You can check yourself in the environmental variables where the python is stored, in any case, the classical procedure is:
1. Open Control Panel
2. Click "Uninstall a Program"
3. Scroll down to Python and click uninstall.

You can consider check and remove also the folder `C:/program Files (x86)/Python35-32` or correlated versions.

Don't forget to erease also in the environmental path eventual pointer residuals.



## Usage
You can launch the command prompt with <b>administrative</b> privileges (since it will modify system environment variables):
```
.\SwitchPython.bat <version>
```
Example:
```
.\SwitchPython.bat 3.11.9
```

- Argument: the single argument is the version identifier used to locate the corresponding python folder (script-dependent naming).

- PATH handling: the script removes old python entries and prepends/appends the path to the selected python. It ensures `C:\files_to_python` remains present in PATH.

- Persistency: when run with elevated privileges, the script can update system environment variables so changes persist across sessions; otherwise it updates only the current session.



## Verification
You can check if the verision has been changed by using the following command:
```
python --version
```
Should report the choiced version passed to the script.



## Troubleshooting
- If `python --version` shows a different version, check PATH for remaining references to other python installations and ensure `C:\files_to_python` is still present.
- Run the script in an elevated prompt if PATH changes need to be written to system environment variables.
- If the script cannot find the version folder, verify installation paths and naming conventions used by your python folders.



## Safety
Back up current environment variables before running the script. Confirm that required Python directory `C:\files_to_python` is preserved.
