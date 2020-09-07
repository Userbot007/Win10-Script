## Contents
 - [Description](#description)
 - [Usage](#usage)
 - [FAQ](#faq)
 - [Windows builds overview](#windows-builds-overview)
 - [Advanced usage](#advanced-usage)
 - [Maintaining own forks](#maintaining-own-forks)

&nbsp;

## Description

This is a PowerShell script for automation of routine tasks done after fresh installations of Windows 10 and Windows Server 2016 / 2019. This is by no means any complete set of all existing Windows tweaks and neither is it another "antispying" type of script. It's simply a setting which I like to use and which in my opinion make the system less obtrusive.

&nbsp;

## Usage
Run the script ``Win10.ps1`` with administrator privilidges (make sure your account has administrator privileges).
1. Download the appropriate variant of the script (i.e. between Moderate and Ultimate). Extract the ZIP file and place the Win10.ps1 file to your OS drive (Local Disk C primarily)
2. Open PowerShell, go two folders back by doing ```cd ../../```
3. Type ```Set-ExecutionPolicy Unrestricted``` and press Enter, in the warning that follows, press ```a``` key.
4. Finally, to run the script, do ```./Win10.ps1```. If it prompts with an alert, press ```r``` key.

&nbsp;

## Comparision

| Parameter            |    Moderate             |     Ultimate             |
| :-----:              | ----------------------- | ----------------------   |
| Action center        | Keep                    | Disable                  |
| Data collection      | No changes              | Disable (level-3)        |
| Lockscreen           | Keep                    | Disable                  |
| Microsoft Store      | Keep                    | Remove                   |
| Microsoft OneDrive   | Freeze                  | Uninstall                |
| Microsoft Defender   | No changes              | Disable                  |
| Microsoft Photos     | Keep                    | Remove                   |
| MSEdge PDF takeover  | Let Edge takeover       | Don't let Edge takeover  |
| Notepad++            | Don't install           | Install                  |
| Snip & Sketch        | Keep                    | Uninstall                |
| Tray icons           | Show all on taskbar     | Show all on taskbar      |
| User account control | No changes              | Lowered down             |
| Windows Media Player | Don't install           | Install                  |

&nbsp;

## FAQ

**Q:** Can I run the script safely?  
**A:** No, you have to understand what the functions do and what will be the implications for you if you run them. Some functions lower security, hide controls and uninstall applications. **If you're not sure what the script does, do not attempt to run it!**

**Q:** Can I run the script repeatedly?  
**A:** Yes! In fact the script has been written to support exactly that, as it's not uncommon that big Windows Updates reset some of the settings and tend to add back bloatware.

**Q:** Which versions and editions of Windows are supported?  
**A:** The script aims to be fully compatible with the most up-to-date 64-bit version of Windows 10 receiving updates from semi-annual channel, however if you create your own preset and exclude the incompatible tweaks, it will work also on LTSB/LTSC and possibly also on 32-bit systems. Vast majority of the tweaks will work on all Windows editions. Some of them rely on group policy settings, so there may be a few limitations for Home and Education editions.

**Q:** Can I run the script on Windows Server 2016 or 2019?  
**A:** Yes. Starting from version 2.5, Windows Server is supported. There are even few tweaks specific to Server environment. Keep in mind though, that the script is still primarily designed for Windows 10.

**Q:** Can I run the script on Windows 7, 8, 8.1 or other versions of Windows?  
**A:** No. Although some tweaks may work also on older versions of Windows, the script is developed only for Windows 10 and Windows Server 2016/2019. There are no plans to support older versions.

**Q:** Can I run the script in multi-user environment?  
**A:** Yes, to certain extent. Some tweaks (most notably UI tweaks) are set only for the user currently executing the script. As stated above, the script can be run repeatedly; therefore it's possible to run it multiple times, each time as different user. Due to the nature of authentication and privilege escalation mechanisms in Windows, most of the tweaks can be successfully applied only by users belonging to *Administrators* group. Standard users will get an UAC prompt asking for admin credentials which then causes the tweaks to be applied to the given admin account instead of the original non-privileged one. There are a few ways how this can be circumvented programmatically, but I'm not planning to include any as it would negatively impact code complexity and readability. If you still wish to try to use the script in multi-user environment, check [this answer in issue #29](https://github.com/Disassembler0/Win10-Initial-Setup-Script/issues/29#issuecomment-333040591) for some pointers.

**Q:** Did you test the script?  
**A:** Yes. I'm testing new additions on up-to-date 64-bit Home and Enterprise editions in VMs. I'm also regularly using it for all my home installations after all bigger updates.

**Q:** I've run the script and it did something I don't like, how can I undo it?  
**A:** For every tweak, there is also a corresponding function which restores the default settings. The default is considered freshly installed Windows 10 or Windows Server 2016 with no adjustments made during or after the installation. Use the tweaks to create and run new preset. Alternatively, since some functions are just automation for actions which can be done using GUI, find appropriate control and modify it manually.

**Q:** I've run the script and some controls are now greyed out and display message "*Some settings are hidden or managed by your organization*", why?  
**A:** To ensure that system-wide tweaks are applied smoothly and reliably, some of them make use of *Group Policy Objects* (*GPO*). The same mechanism is employed also in companies managing their computers in large scale, so the users without administrative privileges can't change the settings. If you wish to change a setting locked by GPO, apply the appropriate restore tweak and the control will become available again.

**Q:** I've run the script and it broke my computer / killed neighbor's dog / caused world war 3.  
**A:** I don't care. Also, that's not a question.

**Q:** I'm using a tweak for &lt;feature&gt; on my installation, can you add it?  
**A:** Submit a PR, create a feature request issue or drop me a message. If I find the functionality simple, useful and not dependent on any 3rd party modules or executables (including also *Chocolatey*, *NuGet*, *Ninite* or other automation solutions), I might add it.

**Q:** Can I use the script or modify it for my / my company's needs?  
**A:** Sure, knock yourself out. Just don't forget to include copyright notice as per MIT license requirements. I'd also suggest including a link to this GitHub repo as it's very likely that something will be changed, added or improved to keep track with future versions of Windows 10.

**Q:** Why are there repeated pieces of code throughout some functions?  
**A:** So you can directly take a function block or a line from within a function and use it elsewhere, without elaborating on any dependencies.

**Q:** For how long are you going to maintain the script?  
**A:** As long as I use Windows 10.

&nbsp;

## Windows builds overview (GA & RTM builds in semi-annual channel)

| Version |        Code name        |     Marketing name     | Build |
| :-----: | ----------------------- | ---------------------- | :---: |
|  1507   | Threshold 1 (TH1 / RTM) | N/A                    | 10240 |
|  1511   | Threshold 2 (TH2)       | November Update        | 10586 |
|  1607   | Redstone 1 (RS1)        | Anniversary Update     | 14393 |
|  1703   | Redstone 2 (RS2)        | Creators Update        | 15063 |
|  1709   | Redstone 3 (RS3)        | Fall Creators Update   | 16299 |
|  1803   | Redstone 4 (RS4)        | April 2018 Update      | 17134 |
|  1809   | Redstone 5 (RS5)        | October 2018 Update    | 17763 |
|  1903   | 19H1                    | May 2019 Update        | 18362 |
|  1909   | 19H2                    | November 2019 Update   | 18363 |
|  2004   | 20H1                    | May 2020 Update        | 19041 |
|  200x   | 20H2                    | TBA                    | 20xxx |

&nbsp;

## Advanced usage

    powershell.exe -NoProfile -ExecutionPolicy Bypass -File Win10.ps1 [-include filename] [-preset filename] [-log logname] [[!]tweakname]

    -include filename       load module with user-defined tweaks
    -preset filename        load preset with tweak names to apply
    -log logname            save script output to a file
    tweakname               apply tweak with this particular name
    !tweakname              remove tweak with this particular name from selection

### Presets

The tweak library consists of separate idempotent functions, containing one tweak each. The functions can be grouped to *presets*. Preset is simply a list of function names which should be called. Any function which is not present or is commented in a preset will not be called, thus the corresponding tweak will not be applied. In order for the script to do something, you need to supply at least one tweak library via `-include` and at least one tweak name, either via `-preset` or directly as command line argument.

The tweak names can be prefixed with exclamation mark (`!`) which will instead cause the tweak to be removed from selection. This is useful in cases when you want to apply the whole preset, but omit a few specific tweaks in the current run. Alternatively, you can have a preset which "patches" another preset by adding and removing a small amount of tweaks.

To supply a customized preset, you can either pass the function names directly as arguments.

    powershell.exe -NoProfile -ExecutionPolicy Bypass -File Win10.ps1 -include Win10.psm1 EnableFirewall EnableDefender

Or you can create a file where you write the function names (one function name per line, no commas or quotes, whitespaces allowed, comments starting with `#`) and then pass the filename using `-preset` parameter.  
Example of a preset file `mypreset.txt`:

    # Security tweaks
    EnableFirewall
    EnableDefender

    # UI tweaks
    ShowKnownExtensions
    ShowHiddenFiles   # Only hidden, not system

Command using the preset file above:

    powershell.exe -NoProfile -ExecutionPolicy Bypass -File Win10.ps1 -include Win10.psm1 -preset mypreset.txt

### Includes

The script also supports inclusion of custom tweaks from user-supplied modules passed via `-include` parameter. The content of the user-supplied module is completely up to the user, however it is strongly recommended to have the tweaks separated in respective functions as the main tweak library has. The user-supplied scripts are loaded into the main script via `Import-Module`, so the library should ideally be a `.psm1` PowerShell module. 
Example of a user-supplied tweak library `mytweaks.psm1`:

```powershell
Function MyTweak1 {
    Write-Output "Running MyTweak1..."
    # Do something
}

Function MyTweak2 {
    Write-Output "Running MyTweak2..."
    # Do something else
}
```

Command using the script above:

    powershell.exe -NoProfile -ExecutionPolicy Bypass -File Win10.ps1 -include mytweaks.psm1 MyTweak1 MyTweak2

### Combination

All features described above can be combined. You can have a preset which includes both tweaks from the original script and your personal ones. Both `-include` and `-preset` options can be used more than once, so you can split your tweaks into groups and then combine them based on your current needs. The `-include` modules are always imported before the first tweak is applied, so the order of the command line parameters doesn't matter and neither does the order of the tweaks (except for `RequireAdmin`, which should always be called first and `Restart`, which should be always called last). It can happen that some tweaks are applied more than once during a singe run because you have them in multiple presets. That shouldn't cause any problems as the tweaks are idempotent.  
Example of a preset file `otherpreset.txt`:

    MyTweak1
    MyTweak2
    !ShowHiddenFiles   # Will remove the tweak from selection
    WaitForKey

Command using all three examples combined:

    powershell.exe -NoProfile -ExecutionPolicy Bypass -File Win10.ps1 -include Win10.psm1 -include mytweaks.psm1 -preset mypreset.txt -preset otherpreset.txt Restart

&nbsp;

### Logging

If you'd like to store output from the script execution, you can do so using `-log` parameter followed by a filename of the log file you want to create. For example:

    powershell.exe -NoProfile -ExecutionPolicy Bypass -File Win10.ps1 -include Win10.psm1 -preset mypreset.txt -log myoutput.log

The logging is done using PowerShell `Start-Transcript` cmdlet, which writes extra information about current environment (date, machine and user name, command used for execution etc.) to the beginning of the file and logs both standard output and standard error streams.

## Maintaining own forks

The easiest way to customize the script settings it is to create your own preset and, if needed, your own tweak scripts as described above. For easy start, you can base the modifications on the *Default.cmd* and *Default.preset* and maintain just that. If you choose to fork the script anyway, you don't need to comment or remove the actual functions in *Win10.psm1*, because if they are not called, they are not used.

If you wish to make more elaborate modifications of the basic script and incorporate some personal tweaks or adjustments, then I suggest doing it in a following way:

1. Fork the repository on GitHub (obviously).
2. Clone your fork on your computer.

    ```
    git clone https://github.com/<yournamehere>/Win10-InitialSetupScript
    cd Win10-InitialSetupScript
    ```
3. Commit your modifications as you see fit.
4. Once there are new additions in the working directory, commit your changes and push them accordingly.

    ```
    git add .
    git commit
    git push -f
    ```
&nbsp;

