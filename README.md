# Google-Benchmark
Build2 package for [google-benchmark](https://github.com/google/benchmark.git)

The package uses and installs a patched version of `benchmark/benchmark.h` in order to build with `gcc`. The issue is summarized below.
 1. `gcc` errors out if macros are expanded when `-fdirectives_only` is used
 2. `build2` passes this flag for the header extraction which can be turned off while building `google-benchmark` itself.
 3. But given that `benchmark/benchmark.h` is a public header file, turning off header extraction for every consumer is tricky.
 4. The patch conditionally enables the problematic `__COUNTER__` expression by using `BENCHMARK_FORCE_COUNTER_INC_TEST` macro. By default without any addtional flags, the `__COUNTER__` expression is disabled.

__Note:__ the installed header file is compatible with upstream and can be used as a drop in replacement. Other build systems can also consume the header installed by this package without needing to define any additional flags. In case the `__COUNTER__` expression is required for some reason, it can be enabled with by passing `-DBENCHMARK_FORCE_COUNTER_INC_TEST` on the command line.

`google-benchmark` does not support building shared libs on Windows when compiling with MSVC.
This package will issue an error in case `config.bin.lib=shared`. When `config.bin.lib=both`, only `liba{benchmark}` is built.
