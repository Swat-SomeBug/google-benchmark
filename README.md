# Google-Benchmark
Build2 package for [google-benchmark](https://github.com/google/benchmark.git)

The package uses and installs a patched version of `benchmark/benchmark.h` in order to build with `gcc`. The issue is summarized below.
 1. `gcc` errors out if macros are expanded when `-fdirectives_only` is used
 2. `build2` passes this flag for the header extraction which can be turned off while building `google-benchmark` itself.
 3. But given that `benchmark/benchmark.h` is a public header file, turning off header extraction for every consumer is tricky.
 4. When building with `gcc`, `build2` defines `_NO_COUNTER_INC_TEST` macro and propagates it to consumers of `lib{benchmark}` and `lib{benchmark-main}`. For other compilers, no such macro is defined.

__Note:__ the installed header file is compatible with upstream and can be used as a drop in replacement. Other build systems can also consume the header installed by this package without needing to define any additional flags.
