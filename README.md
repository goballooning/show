## install mayavi 
- on windows via Anaconda Python distribution
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

## on command line

```bash
$ show -ft f.mat
$ show -i i.mat
$ show -fl f.mat -i i.mat -t t.mat
```
