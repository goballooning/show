## install mayavi 
- on windows via [Anaconda Python distribution](http://continuum.io/downloads)
    - download and install Anaconda
    - on windows cmd prompt or Anaconda Command Prompt: 

        ```
        > conda install mayavi
        ```
- on linux, search mayavi in software center 
- on mac, via macports

    ```bash
    sudo port install vtk +python27+qt4_mac
    sudo port install py27-mayavi
    ```

## in matlab

```matlab
load('test_data')

savePaths4mayaviRGBchu('~/f', fibers)
saveTensorScalarSlices4mayavi('~/t', noise_free_data, 10)
saveImageVolum3d4mayavi('~/i', noise_free_data.intensity, 1)
saveVectors4mayavi('~/v', test_data, 1) % single color
```

## to use `show`
- on command line

    ```bash
    $ show -ft f.mat
    $ show -i i.mat
    $ show -fl f.mat -i i.mat -t t.mat
    ```

- in ipython interpreter

    ```python
    In [1]: %run show_with_full_path -i i.mat

    ```
