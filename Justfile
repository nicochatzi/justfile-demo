set dotenv-load

BUILD_DIR := 'build'

_default:
    @just --list --unsorted

# remove build directory
clean:
    rm -rf {{BUILD_DIR}}

# generate build files for a given build configurations
_generate CONFIG:
    cmake -B {{BUILD_DIR}}/{{CONFIG}} -S .

# generate build files for all build configurations
setup: (_generate "Debug") (_generate "Release") (_generate "MinSizeRel") (_generate "RelWithDebInfo")

# build a specific target for a given build configuration
build-target CONFIG TARGET:
    cmake --build {{BUILD_DIR}}/{{CONFIG}} \
          --config {{CONFIG}} \
          --target {{TARGET}} \
          -j8

# build all targets for a given build configuration
build CONFIG: (build-target CONFIG "all")

# run all registered tests for a given build configuration
test CONFIG:
    cd {{BUILD_DIR}}/{{CONFIG}} && \
        ctest --build-config {{CONFIG}}

# run application for a given build configuration
run CONFIG:
    ./{{BUILD_DIR}}/{{CONFIG}}/demo_app

# build and run for a given build configuration
build-run CONFIG: (build CONFIG) (run CONFIG)

# re-run a command whenever a source file has changed
dev COMMAND='just build Debug test Debug':
    watchexec --clear --ignore res -- {{COMMAND}}

# prints some env var set in the dotenv file
secrets:
    echo $SOME_ENV_VAR_SET_IN_DOTENV_FILE