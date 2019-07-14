## Salmon

This application is for me to understand and remember about ruby on rails

### Memo

#### Versions of ruby and rails

```sh
$ rbenv version
2.5.0 (set by /Users/mamao/workspace/private/salmon/.ruby-version)

$ rails -v
Rails 5.2.2
```

#### Create a rest api application.

As I want to understand deeply about rails, I did not use the scaffold option.

```sh
$ rails new salmon --api
```

#### Setup mariadb (dismissal)

```sh
$ brew install mariadb
$ mkdir /usr/local/etc/my.cnf.d
$ mysql_secure_installation
```

Initialize mariadb settings are all default.

Create a database for devlopment and a user using the sequel pro.

But I abandon to use mariadb installed by homebrew because it can not use CURRENT_TIMESTAMP.

Mariadb uninstall

```sh
brew uninstall mariadb
rm -rf /usr/local/etc/mysql
```

If you exec `bundle install`, you must to reinstall mysql2.

```sh
bundle exec gem uninstall mysql2
bundle install
```

#### Setup mysql v8

Initialize root password.

```sh
mysql -u root -p
> Enter password (keep empty press enter)
# https://dev.mysql.com/doc/refman/8.0/en/resetting-permissions.html
> ALTER USER 'root'@'localhost' IDENTIFIED BY 'MyNewPass';
```

But cannot access by Sequel Pro because default authentication plugin was changed from `mysql_native_password` to `caching_sha2_password`.Therefor I will use the mysql command.

#### Exception handling

`rescue_from` is one of methods that catchs exceptions occured in a controller.
If exceptions are common, it will be used in `ApplicationController`.

```rb
class ApplicationController < ActionController::API
  rescue_from ActiveRecord::ActiveRecordError, with: :render_500

  def render_500
    ...
  end
end
```

I wanted to clarify these roles, so I cut it out into a module.

```rb
class ApplicationController < ActionController::API
  include ErrorHandling
end
```
