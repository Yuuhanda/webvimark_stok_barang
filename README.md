
OFFICE INVENTORY MANAGEMENT SYSTEM - YII2
-----------------------------------------
DIRECTORY STRUCTURE
-------------------

      assets/             contains assets definition
      commands/           contains console commands (controllers)
      config/             contains application configurations
      controllers/        contains Web controller classes
      mail/               contains view files for e-mails
      models/             contains model classes
      runtime/            contains files generated during runtime
      tests/              contains various tests for the basic application
      vendor/             contains dependent 3rd-party packages
      views/              contains view files for the Web application
      web/                contains the entry script and Web resources
      componenents/       contains reusable components
      helpers/            contains reusable helpers
      services/           contains reusable services
      web/documents/      contains uploaded documents
      web/uploads/        contains uploaded images
      
DATABASE
-------------
import database.sql you can find in the root directory

CONFIGURATION
-------------

### Database

Edit the file `config/db.php` with real data, for example:

```php
return [
    'class' => 'yii\db\Connection',
    'dsn' => 'mysql:host=localhost;dbname=yii2basic',
    'username' => 'root',
    'password' => '1234',
    'charset' => 'utf8',
];
```

IMPORTANT FOR MYMEMORY TRANSLATION API
-------------
If you dont already have a mymemory account, you can create one here: https://mymemory.translated.net/signup
create a new API key and add it to config/params.php
add your email into components/MyMemoryService.php

IMPORTANT FOR WEBVIMARK RBAC
-------------
Do not make any change to any file in the vendor/webvimark as many parts of the code has been changed to fit in specific needs.

