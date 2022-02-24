This project provides a `Python` script `show` for visualizing 3D image volume, tensor field, vector field, large number of curves, and meshes.

It can be useful for people who analyze medical images in `Matlab` but would like to visualize data efficiently elsewhere.

The basic work flow is to

    - save data in `Matlab` in `mat` format
    - run `show` in a terminal or in a `ipython` interpreter to visualize the data


## Install Mayavi
* [Anaconda Python distribution](http://continuum.io/downloads, https://repo.continuum.io/archive/index.html)

    ```
    > conda install mayavi
    ```
As of Feb 24, 2022,
- Mayavi is not surpported on M1 Mac 2021; 
- I met the black screen problem in installing Mayavi via conda/mamba on Ubuntu Mate 20.04, which is solved by following [the pip approach for installation](https://github.com/prabhuramachandran/mayavi-workshop/blob/master/installation.md).

### Install dependency pyvtk (for viewing tensor only)
```
git clone https://github.com/hakostra/pyvtk
git checkout hakostra/tensor-out-encoding-fix
cd pyvtk
pip install .
```
(If `pyvtk` is installed by `pip install pyvtk`, an error will occur in saving tensor:
`_"TypeError: sequence item 1: expected str instance, bytes found"_`


## save data in matlab

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
    $ show -t t.mat
    $ show -i i.mat
    $ show -fl f.mat -i i.mat -t t.mat
    ```

- in ipython interpreter

    ```python
    In [1]: %run show_with_full_path -i i.mat

    ```
    
Note: user interaction with Mayavi window can be recorded as Python code, which could be useful for later use, e.g., creating other functions.
