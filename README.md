# Google-Benchmark
Build2 package for [google-benchmark](https://github.com/google/benchmark.git)

`google-benchmark` does not support building shared libs on Windows when compiling with MSVC.
This package will issue an error in case `config.bin.lib=shared`. When `config.bin.lib=both`, only `liba{benchmark}` is built.