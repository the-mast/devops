# Development

There is a `Vagrantfile` to setup up a local development workspace for developing Wordpress themes and plugins.
It's based on a `ubuntu/xenial64` base box and will install and configure the following:

1. **NodeJS**: for development on [NewsDayAfricaTheme](https://github.com/the-mast/NewsDayAfricaTheme), 
a theme based on [FoundationPress](https://github.com/olefredrik/FoundationPress).

2. **MariaDB**: the drop-in replacement for MySQL, with performance and other improvements.

3. **Apache2**: of course :)

4. **PHP7.0**: the de-facto PHP installation on Ubuntu Xenial.

5. **Wordpress**: installed using [tersmitten.wordpress](http://galaxy.ansible.com/roles/tersmitten/wordpress), an Ansible role.

## Getting started

### Developing on Vagrant Host machine

Check out this repo and the theme (NewsDayAfricaTheme, in our case) under construction as a sibling,
such that the directory structure looks like this:

```RUBY
├── mast/
│   ├── NewsDayAfricaTheme/
│   ├── devops/
```

Fire up the vagrant box:

```SHELL
cd mast/devops
vagrant up
```

Install npm packages and run the watch task for the theme:

```SHELL
cd NewsDayAfricaTheme/
npm install
gulp watch
```

Happy devving!

### Some considerations

+ Vagrantfile specifies the theme to mount within the vagrant box, currently defaults to `NewsDayAfricaTheme`.

```RUBY
  config.vm.synced_folder "../NewsDayAfricaTheme", "/var/www/html/wp-content/themes/newsdayafrica"
```

+ **gulpfile** in the theme project defines the browsersync proxy address.
```JS
  browserSync.init(files, {
    // Proxy address
    proxy: URL,

    // Port #
    // port: PORT
  });
```
