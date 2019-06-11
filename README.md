# Counting Fedora Packages


As of 2019-06-11 10:00 AM GMT, there was 49,464 binary RPM packages by name and module stream in Fedora 30. Of those, 1,119 (2.26%) came from a module stream.

## Calculating the numbers

First, you need the `modular-repoquery` script from [asamalik/modular-repoquery](https://github.com/asamalik/modular-repoquery).

Then you can list all packages in fedora by running the following command. The script is not very optimized, this took about 50 minutes for me.

```
./modular-repoquery > all-pkgs.txt
```

Finally, get the numbers:

```
./count-packages.sh
```

