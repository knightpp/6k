# 6k

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
