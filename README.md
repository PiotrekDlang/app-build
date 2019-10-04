# Build Application
A building tool for simple D programming

Experimental stage 

Can be tested by running the following command:

build.d
build.csv


build


lib:     draft/build.d
app:     build.d
out:     build 
install: build copyToFolder: apps



```

-------

project
    output
        build_name
            release_folder
                documentation
                    manual.pdf
                    readme.txt
                app.exe
            config
                build.csv
            bin
                obj
                    draft.o
                    d.o
                    app.o
                    main.o
                executable 
                libraries
            source
               # lib 1 
               draft
                    build.d
                    command.d 
               # lib 2
               d
                    types.d
               app
                    block.d
               object.d
               main.d
    docs 
    source
        app
            logic.d
            
        main.d
    build.cfg

```
