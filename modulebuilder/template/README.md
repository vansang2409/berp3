# MYMODULE FOR [BERP3 ERP CRM](https://www.berp3.org)

## Features

Description of the module...

<!--
![Screenshot mymodule](img/screenshot_mymodule.png?raw=true "MyModule"){imgmd}
-->

Other external modules are available on [Berp3store.com](https://www.berp3store.com).

## Translations

Translations can be completed manually by editing files into directories *langs*.

<!--
This module contains also a sample configuration for Transifex, under the hidden directory [.tx](.tx), so it is possible to manage translation using this service.

For more informations, see the [translator's documentation](https://bonaerp.com/index.php/Translator_documentation).

There is a [Transifex project](https://transifex.com/projects/p/berp3-module-template) for this module.
-->

<!--

## Installation

### From the ZIP file and GUI interface

- If you get the module in a zip file (like when downloading it from the market place [Berp3store](https://www.berp3store.com)), go into
menu ```Home - Setup - Modules - Deploy external module``` and upload the zip file.

Note: If this screen tell you there is no custom directory, check your setup is correct:

- In your Berp3 installation directory, edit the ```htdocs/conf/conf.php``` file and check that following lines are not commented:

    ```php
    //$berp3_main_url_root_alt ...
    //$berp3_main_document_root_alt ...
    ```

- Uncomment them if necessary (delete the leading ```//```) and assign a sensible value according to your Berp3 installation

    For example :

    - UNIX:
        ```php
        $berp3_main_url_root_alt = '/custom';
        $berp3_main_document_root_alt = '/var/www/Berp3/htdocs/custom';
        ```

    - Windows:
        ```php
        $berp3_main_url_root_alt = '/custom';
        $berp3_main_document_root_alt = 'C:/My Web Sites/Berp3/htdocs/custom';
        ```

### From a GIT repository

- Clone the repository in ```$berp3_main_document_root_alt/mymodule```

```sh
cd ....../custom
git clone git@github.com:gitlogin/mymodule.git mymodule
```

### <a name="final_steps"></a>Final steps

From your browser:

  - Log into Berp3 as a super-administrator
  - Go to "Setup" -> "Modules"
  - You should now be able to find and enable the module

-->

## Licenses

### Main code

GPLv3 or (at your option) any later version. See file COPYING for more information.

### Documentation

All texts and readmes are licensed under GFDL.
