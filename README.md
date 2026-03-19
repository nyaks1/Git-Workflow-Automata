# Git Workflow Automata
**By Nyaks**

> "Why do it in 30 seconds when a script can do it in 2?"

### Overview
This repository contains a cross-platform automation suite for streamlining the Git development lifecycle. Whether you are on a Linux lab machine at WeThinkCode_ or your Windows setup at home, these scripts handle the heavy lifting.

---

### Features
- **One-Command Deployment:** Stage, commit, and push in a single breath.
- **Flamboyant Feedback:** High-visibility terminal output for status updates.
- **Cross-Platform:** Native support for both Bash (Linux/GitBash) and PowerShell (Windows).
- **Safety Rails:** Built-in validation to prevent empty commits.

---

### Installation & Setup

#### Linux (or Windows via GitBash)
Uses the `gpush.sh` script. This is the recommended "Sloth" method.

1. **Move the script:** `sudo mv Linux/gpush.sh /usr/local/bin/gpush`
2. **Make it executable:** `sudo chmod +x /usr/local/bin/gpush`
3. **Add the Alias:** Add `alias g='gpush'` to your `~/.bashrc` or `~/.bash_profile`. if you don't have any becacuase 
                      you are using GitBash via Windows, you just have to create `~/.bash_profile`
4. **Refresh:** `source ~/.bashrc`

> **Note for Windows Users:** If you have **GitBash** installed, you can skip the PowerShell setup and use this     method! Just point your alias to the `.sh` file.

#### Windows (Native PowerShell)
Uses the `gpush.ps1` script for a native Windows experience.

1. **Move the script:** Place `gpush.ps1` in a folder (e.g., `C:\Scripts\`).
2. **Update your Path:** Add `C:\Scripts\` to your System Environment Variables (Path).
3. **Add to Profile:** Open `notepad $PROFILE` and add:
   `function g { & "C:\Scripts\gpush.ps1" $args }`
4. **Execution Policy:** Ensure you can run scripts: `Set-Execution Policy RemoteSigned -Scope CurrentUser`.

---

### The "Sloth-Tier" (The Lazy Way)
# If you don't want to move files manually or worry about directory paths, just copy and paste the "Magic Spell" for your system. This will download the script and set it up as a global command in one shot.

### For Linux (Pop!_OS / Ubuntu / Mac)
# This command downloads the script, gives it execution power, and moves it to your system's "VIP" folder.

### Bash
curl -sSL https://raw.githubusercontent.com/nyaks1/Git-Workflow-Automata/main/Linux/gpush.sh -o gpush && chmod +x gpush && sudo mv gpush /usr/local/bin/g
Now, just type g "your message" from any folder.

## For Windows (PowerShell - Admin Required)
This will create your PowerShell profile if it doesn't exist, download the script to your user folder, and link it to the g command.

## PowerShell
iwr https://raw.githubusercontent.com/nyaks1/Git-Workflow-Automata/main/Windows/gpush.ps1 -OutFile $env:USERPROFILE\gpush.ps1; if (!(Test-Path $PROFILE)) { New-Item -Path $PROFILE -Type File -Force }; Add-Content $PROFILE "`nfunction g { & `"$env:USERPROFILE\gpush.ps1`" `$args }"
Restart PowerShell or run . $PROFILE to activate.

### Usage
Once installed, simply type:
```bash
g "Your commit message here"

Embrace the laziness 