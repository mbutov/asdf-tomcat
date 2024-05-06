REPOSITORY MOVED TO https://github.com/asdf-community/asdf-tomcat

# asdf-tomcat [![Build](https://github.com/mbutov/asdf-tomcat/actions/workflows/build.yml/badge.svg)](https://github.com/mbutov/asdf-tomcat/actions/workflows/build.yml) [![Lint](https://github.com/mbutov/asdf-tomcat/actions/workflows/lint.yml/badge.svg)](https://github.com/mbutov/asdf-tomcat/actions/workflows/lint.yml)


[tomcat](https://github.com/mbutov/asdf-tomcat) plugin for the [asdf version manager](https://asdf-vm.com).

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Why?](#why)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`: generic POSIX utilities.

# Install

Plugin:

```shell
asdf plugin add tomcat
# or
asdf plugin add tomcat https://github.com/mbutov/asdf-tomcat.git
```

tomcat:

```shell
# Show all installable versions
asdf list-all tomcat

# Install specific version
asdf install tomcat latest

# Set a version globally (on your ~/.tool-versions file)
asdf global tomcat latest

# Now tomcat commands are available
catalina.sh version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Setting CATALINA_HOME environment variable

For setting CATALINA_HOME environment variable, add the following line into `~/.bashrc` or `~/.zshrc` (depending on your shell) file:

```shell
. ~/.asdf/plugins/tomcat/set-catalina-home.sh
```

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/mbutov/asdf-tomcat/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Maxim Butov](https://github.com/mbutov/)
