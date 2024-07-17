
<a id="readme-top"></a>
<div align="center">
<h2 align="center">Simple Command Prompt Repository Access</h2>

  <p align="center">
    A simple Git repository access tool for Command Prompt.
    <br />
    <a href="https://github.com/nTh0rn/sCMDra/issues/new?labels=bug&template=bug-report---.md">Report Bug</a>
    ·
    <a href="https://github.com/nTh0rn/sCMDra/issues/new?labels=enhancement&template=feature-request---.md">Request Feature</a>
  </p>
</div>

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about">About</a>
    </li>
    <li>
      <a href="#installation">Installation</a>
      <ul>
        <li><a href="#automatic-installer">Automatic Installer</a></li>
      </ul>
      <ul>
        <li><a href="#manual-installation">Manual Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li>
      <a href="#uninstallation">Installation</a>
      <ul>
        <li><a href="#automatic-uninstaller">Automatic Unnstaller</a></li>
      </ul>
      <ul>
        <li><a href="#manual-uninstallation">Manual Unnstallation</a></li>
      </ul>
    </li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT -->
## About
sCMDra parses your Git repositories and lists them in Command Prompt from a single command, allowing quick access to your projects from anywhere.

After selecting a repository, your Command Prompt session is redirected and Windows Explorer is opened to the corresponding directory.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- INSTALLATION -->
## Installation

**<ins>IMPORTANT NOTICE:</ins>**
Even if you use the automatic installer, you will need to **manually** add the installation directory to your user's environment Path variable. Instructions for this are included in `Install sCMDra.bat`.

1. Clone/download the repo
   ```sh
   git clone https://github.com/nTh0rn/sCMDra.git
   ```

### Automatic Installer
1. Run `Install sCMDra.bat` and follow the steps within.

### Manual Installation
1. Create an installation directory (For example, `C:\sCMDra\`).
2. Add the installation directory to your user's environment Path variable.
3. Relocate `sCMDra.bat` and `___cecho.exe` to your installation directory.
4. Inside `sCMDra.bat`, Find and replace in instances of `INSTALL_TEMP` with your installation directory, without quotes.
5. Inside `sCMDra.bat`, Find and replace in instances of `REPO_TEMP` with where your repositories are located, without quotes.
6. Rename `sCMDra.bat` to the keyword you'd like to use to access sCMDra (For example, "`repo.bat`", "`$.bat`", or "`projects.bat`").
   * **You will not need to type the `.bat` file extension to access sCMDra in Command Prompt, but be sure to include the extension in the file's name.**

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- USAGE -->
## Usage

Access sCMDra by typing in your keyword into Command Prompt from any directory (`repo` by default).

![Screenshot](https://nthorn.com/images/sCMDra/sCMDra.png)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- UNINSTALLATION -->
## Uninstallation

**<ins>IMPORTANT NOTICE:</ins>**
Even if you use the automatic uninstaller, you will need to **manually** remove the installation directory from your user's environment Path variable. Instructions for this are included during the automatic uninstallation.

### Automatic Uninstaller
1. Access sCMDra in Command Prompt by using your access keyword (`repo` by default).
2. Select "Additional Options".
3. Select "Uninstall sCMDra" and follow the steps provided.

### Manual Uninstallation
1. Navigate to and delete the installation folder while sCMDra is not running (`C:\sCMDra\` by default).
2. Remove the installation folder from your user's environment Path variable.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Nikolas Thornton - [nthorn.com](https://nthorn.com) - contact@nthorn.com

Project Link: [https://github.com/nTh0rn/sCMDra](https://github.com/nTh0rn/sCMDra)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Batch UAC prompt](https://stackoverflow.com/a/10052222/4689611)
* [Echo with colors](https://www.codeproject.com/Articles/17033/Add-Colors-to-Batch-Files)
* [Folder selector](https://stackoverflow.com/a/15885133/4689611)

<p align="right">(<a href="#readme-top">back to top</a>)</p>