# Google-Benchmark
Build2 package for [google-benchmark](https://github.com/google/benchmark.git)

`google-benchmark` does not support building shared libs on Windows when compiling with MSVC.
This package will issue an error in this case.
Always set `config.bin.lib=static` for this package.