
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
        <li><a href="#manual-installation">Manual Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

## About

sCMDra is quickly accessible in Command Prompt using a customizable keyword, `repo` by default. It parses a specified folder for Git repositories and lists them for you to access quickly.

![Screenshot](https://nthorn.com/images/sCMDra/sCMDra.png)

After selecting a repository, your CMD session is redirected to the corresponding folder and Windows Explorer is opened to the selected repository.
<p align="right">(<a href="#readme-top">back to top</a>)</p>


## Installation

<ins>IMPORTANT NOTICE:</ins>
Even if you use the automatic installer, you will need to **manually** add your installation directory to your user's environment Path variable. Instructions for this are included in this README as well as during the automatic installation process.

1. Clone/download the repo
   ```sh
   git clone https://github.com/nTh0rn/sCMDra.git
   ```

### Automatic Installation
1. Run `Install sCMDra.bat`.

### Manual Installation
1. Create an installation directory (`C:\sCMDra\` is `Install sCMDra.bat`'s default).
2. Add the installation directory to your user's environment Path variable.
3. Relocate `___repo.bat` and `___cecho.exe` to your installation directory.
4. Inside `___repo.bat`, Find and replace in instances of `INSTALL_TEMP` with your installation directory, without quotes.
5. Inside `___repo.bat`, Find and replace in instances of `REPO_TEMP` with where your repositories are located, without quotes.
6. Rename `___repo.bat` to the keyword you'd like to use to access sCMDra (`repo.bat` is `Install sCMDra.bat`'s default).
  * You will not need to type the `.bat` file extension to access sCMDra, but be sure to include it in the file's name.

<!-- USAGE EXAMPLES -->
## Usage

Use this space to show useful examples of how a project can be used. Additional screenshots, code examples and demos work well in this space. You may also link to more resources.

_For more examples, please refer to the [Documentation](https://example.com)_

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ROADMAP -->
## Roadmap

- [ ] Feature 1
- [ ] Feature 2
- [ ] Feature 3
    - [ ] Nested Feature

See the [open issues](https://github.com/nTh0rn/sCMDra/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

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

* []()
* []()
* []()

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
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