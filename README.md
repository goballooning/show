## in matlab

load('test_data')

savePaths4mayaviRGBchu('~/f', fibers)
saveTensorScalarSlices4mayavi('~/t', noise_free_data, 10)
saveImageVolum3d4mayavi('~/i', noise_free_data.intensity, 1)
saveVectors4mayavi('~/v', test_data, 1) % single color

## on command line
```
$ show -ft f.mat
$ show -i i.mat
$ show -fl f.mat -i i.mat -t t.mat
```
