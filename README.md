# 6k

## CAD source code

See <https://cad.onshape.com/documents/0360b5bd9e0d3711159f57da/w/847aee50a906ea16060a344b/e/36a4fe454d44095cf88feee9?renderMode=0&uiState=66536390534d9d0c80a89375> or probably out of date STEP file in ./cad/ folder.

```shell
# step 1
qmk setup -H ./qmk

# step 2
cd ./qmk/keyboards/handwired/
ln -s ../../../config ./6k

# step 3
qmk compile -kb handwired/6k -km via
# or 
qmk flash -kb handwired/6k -km via

# step 4
ls -l ./qmk/.build/
```
