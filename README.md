
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
1. Create an installation directory (`C:\sCMDra\` is `Install sCMDra.bat`'s default).
2. Add the installation directory to your user's environment Path variable.
3. Relocate `___repo.bat` and `___cecho.exe` to your installation directory.
4. Inside `___repo.bat`, Find and replace in instances of `INSTALL_TEMP` with your installation directory, without quotes.
5. Inside `___repo.bat`, Find and replace in instances of `REPO_TEMP` with where your repositories are located, without quotes.
6. Rename `___repo.bat` to the keyword you'd like to use to access sCMDra (`repo.bat` is `Install sCMDra.bat`'s default).
   * You will not need to type the `.bat` file extension to access sCMDra in Command Prompt, but be sure to include the extension in the file's name.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- USAGE -->
## Usage

Access sCMDra by typing in your keyword into Command Prompt from any directory.

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

* [Confirm administrator mode](https://stackoverflow.com/questions/1894967/how-to-request-administrator-access-inside-a-batch-file)
* [Echo with colors](https://www.codeproject.com/Articles/17033/Add-Colors-to-Batch-Files)
* []()

<p align="right">(<a href="#readme-top">back to top</a>)</p>


[contributors-shield]: https://img.shields.io/github/contributors/nTh0rn/sCMDra.svg?style=for-the-badge
[contributors-url]: https://github.com/nTh0rn/sCMDra/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/nTh0rn/sCMDra.svg?style=for-the-badge
[forks-url]: https://github.com/nTh0rn/sCMDra/network/members
[stars-shield]: https://img.shields.io/github/stars/nTh0rn/sCMDra.svg?style=for-the-badge
[stars-url]: https://github.com/nTh0rn/sCMDra/stargazers
[issues-shield]: https://img.shields.io/github/issues/nTh0rn/sCMDra.svg?style=for-the-badge
[issues-url]: https://github.com/nTh0rn/sCMDra/issues
[license-shield]: https://img.shields.io/github/license/nTh0rn/sCMDra.svg?style=for-the-badge
[license-url]: https://github.com/nTh0rn/sCMDra/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/linkedin_username
[product-screenshot]: images/screenshot.png
[Next.js]: https://img.shields.io/badge/next.js-000000?style=for-the-badge&logo=nextdotjs&logoColor=white
[Next-url]: https://nextjs.org/
[React.js]: https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB
[React-url]: https://reactjs.org/
[Vue.js]: https://img.shields.io/badge/Vue.js-35495E?style=for-the-badge&logo=vuedotjs&logoColor=4FC08D
[Vue-url]: https://vuejs.org/
[Angular.io]: https://img.shields.io/badge/Angular-DD0031?style=for-the-badge&logo=angular&logoColor=white
[Angular-url]: https://angular.io/
[Svelte.dev]: https://img.shields.io/badge/Svelte-4A4A55?style=for-the-badge&logo=svelte&logoColor=FF3E00
[Svelte-url]: https://svelte.dev/
[Laravel.com]: https://img.shields.io/badge/Laravel-FF2D20?style=for-the-badge&logo=laravel&logoColor=white
[Laravel-url]: https://laravel.com
[Bootstrap.com]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com
[JQuery.com]: https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white
[JQuery-url]: https://jquery.com 