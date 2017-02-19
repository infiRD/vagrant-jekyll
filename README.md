# vagrant-jekyllbox

Vagrant box aimed at bootstraping the work with [jekyll](https://github.com/jekyll/jekyll)
and/or [github pages](https://pages.github.com/). It supports live-reload
regime by using [jekyll-livereload](https://github.com/RobertDeRose/jekyll-livereload)
plugin.

## Getting Started

First of all you will need to install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
and [vagrant](https://www.vagrantup.com/docs/installation/). 

Then:

```bash
cd ~
git clone https://github.com/infiRD/vagrant-jekyllbox.git
cd vagrant-jekyllbox
vagrant up && vagrant ssh
```

If you want to upgrade linux distribution in the box, run following:

```bash
UPGRADE=true vagrant up && vagrant reload && vagrant ssh
```

## Working with jekyll projects

All project files should be placed in `projects` directory synchronized
between host and VM. Here you should clone your repository containing
jekyll project:

```bash
cd ~/projects
git clone <your repo URL>
```

In order to support live reload, it is neccesary to enable jekyll-livereload
plugin inside project's `Gemfile`:

```ruby
group :jekyll_plugins do
    gem 'jekyll-livereload'
end
```

It is neccesary to run bundle install:

```bash
bundle install
```

And only thing remaining is to run jekyll serve:

```bash
bundle exec jekyll serve --watch \
   --host 192.168.68.8 --port 4000 --force_polling \
   --livereload
```

Project will be accessible on [http://192.168.68.8:4000](http://192.168.68.8:4000)

Default livereload port is `35729`

*Note*: static IP address is neccesary for live reload plugin to inject the
live-reload script correctly. It can be changed by editing `Vagrantfile` on
the line:

```ruby
config.vm.network "private_network", ip: "192.168.68.8"
```

## Based on

- [Ubuntu 16.04.1 LTS (Xenial Xerus)](http://releases.ubuntu.com/16.04/) - Linux distro
- [VAGRANT](https://www.vagrantup.com/) - VM manager
- [jekyll](https://github.com/jekyll/jekyll) - Static site generator
- [Github Pages](https://pages.github.com/)
- [RobertDeRose/jekyll-livereload](https://github.com/RobertDeRose/jekyll-livereload) - jekyll live-reload plugin

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions
available, see the [tags on this repository](https://github.com/infiRD/Scibox/tags)

## Authors

- **Martin Zamba** - *Initial work* - [infiRD](https://github.com/infiRD)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

## Contributing

Contributions are welcome. Just fork the GitHub repository and send a pull request
