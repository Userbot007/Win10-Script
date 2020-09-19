# Documentation

## Contents
 - [Description](#description)
 - [Usage](#usage)
 - [Comparision](#comparision)
 - [FAQ](#faq)
 - [Windows builds overview](#windows-builds-overview)
 - [Advanced usage](#advanced-usage)
 - [Maintaining own forks](#maintaining-own-forks)

&nbsp;

## Description

This is a PowerShell script for automation of routine tasks done after fresh installations of Windows 10 and Windows Server 2016 / 2019. This is by no means any complete set of all existing Windows tweaks and neither is it another "antispying" type of script. It's simply a setting which I like to use and which in my opinion make the system less obtrusive.

&nbsp;

## Usage
1. Download the appropriate variant of the script (i.e. between Moderate and Ultimate). Extract the ZIP file and place the Win10.ps1 file to your OS drive (Local Disk C primarily)
2. Open PowerShell, go two folders back by doing ```cd ../../```
3. Type ```Set-ExecutionPolicy Unrestricted``` and press Enter, in the warning that follows, press ```a``` key.
4. Finally, to run the script, do ```./Win10.ps1```. If it prompts with an alert, press ```r``` key.


&nbsp;

## Comparision

| Parameter            |    Moderate             |     Ultimate             |
| :-----:              | ----------------------- | ----------------------   |
| Action center        |           -             |         Hide             |
| Data collection      |           -             |       Disable            |
| Library icons        |           -             |         Hide             |
| Lockscreen           |           -             |       Disable            |
| Microsoft Store      |           -             |      Uninstall           |
| Microsoft OneDrive   |        Freeze           |      Uninstall           |
| Microsoft Defender   |           -             |       Disable            |
| Microsoft Photos     |           -             |      Uninstall           |
| MSEdge PDF takeover  |           -             |        Remove            |
| Notepad++            |           -             |       Install            |
| Snip & Sketch        |           -             |      Uninstall           |
| Tray icons           |       Unhidden          |      Unhidden            |
| User account control |           -             |     Lowered down         |
| Windows Media Player |           -             |       Install            |

Please note: 
- Here, the **Libary icons** indicate Documents, Pictures, Music & Videos from Sidebar in This PC // Explorer
- The **ultimate** script disables data collection on level-3. This means, you might experience some apps, for instance Microsoft apps, to break functionality and/or not run at all. If that happens, do not blame me for doing that. It is completely revertable AND you should've read documentation properly before executing the **ultimate** variant of the script.
- The **moderate** variant of the script does not touch data collection and telemetry at all, and this makes it the variant that has no business to have with apps being non-functional due to data collection or telemetry hardening.


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

**Q:** Did you test the script?  
**A:** Yes. I'm testing new additions on up-to-date 64-bit Home and Enterprise editions in VMs.

**Q:** I've run the script and it did something I don't like, how can I undo it?  
**A:** For every tweak, there is also a corresponding function which restores the default settings. The default is considered freshly installed Windows 10 or Windows Server 2016 with no adjustments made during or after the installation. Use the tweaks to create and run new preset. Alternatively, since some functions are just automation for actions which can be done using GUI, find appropriate control and modify it manually.

**Q:** I've run the script and some controls are now greyed out and display message "*Some settings are hidden or managed by your organization*", why?  
**A:** To ensure that system-wide tweaks are applied smoothly and reliably, some of them make use of *Group Policy Objects* (*GPO*). The same mechanism is employed also in companies managing their computers in large scale, so the users without administrative privileges can't change the settings. If you wish to change a setting locked by GPO, apply the appropriate restore tweak and the control will become available again.

**Q:** I've run the script and it broke my computer / killed neighbor's dog / caused world war 3.  
**A:** I don't care. Also, that's not a question.

**Q:** I'm using a tweak for &lt;feature&gt; on my installation, can you add it?  
**A:** Submit a PR, create a feature request issue or drop me a message. 

**Q:** Can I use the script or modify it for my / my company's needs?  
**A:** Sure, knock yourself out. Just don't forget to include copyright notice as per MIT license requirements. I'd also suggest including a link to this GitHub repo as it's very likely that something will be changed, added or improved to keep track with future versions of Windows 10.

**Q:** Why are there repeated pieces of code throughout some functions?  
**A:** So you can directly take a function block or a line from within a function and use it elsewhere, without elaborating on any dependencies.

&nbsp;

## Windows builds overview

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
|  200x   | 20H2                    | October 2020 Update    | 19042 |

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
    git clone https://github.com/<yournamehere>/Win10-Script
    cd Win10-Script
    ```
3. Commit your modifications as you see fit.
4. Once there are new additions in the working directory, commit your changes and push them accordingly.

    ```
    git add .
    git commit
    git push -f
    ```
&nbsp;
