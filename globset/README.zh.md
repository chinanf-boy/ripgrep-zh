# globset

跨平台单个glob和glob集匹配.全局集匹配是将一个或多个glob模式与单个候选路径同时匹配并返回所有匹配的glob的过程.

[![Linux build status](https://api.travis-ci.org/BurntSushi/ripgrep.svg)](https://travis-ci.org/BurntSushi/ripgrep)
[![Windows build status](https://ci.appveyor.com/api/projects/status/github/BurntSushi/ripgrep?svg=true)](https://ci.appveyor.com/project/BurntSushi/ripgrep)
[![](https://img.shields.io/crates/v/globset.svg)](https://crates.io/crates/globset)

麻省理工学院或MIT下的双重许可[UNLICENSE](http://unlicense.org).

### 文档

<https://docs.rs/globset>

### 用法

将此添加到您的`Cargo.toml`:

```toml
[dependencies]
globset = "0.3"
```

这对你的箱子根:

```rust
extern crate globset;
```

### 示例:一个glob

此示例显示如何将单个glob与单个文件路径匹配.

```rust
use globset::Glob;

let glob = Glob::new("*.rs")?.compile_matcher();

assert!(glob.is_match("foo.rs"));
assert!(glob.is_match("foo/bar.rs"));
assert!(!glob.is_match("Cargo.toml"));
```

### 示例:配置glob匹配器

此示例显示如何使用a`GlobBuilder`配置匹配语义的方面.在此示例中,我们阻止通配符匹配路径分隔符.

```rust
use globset::GlobBuilder;

let glob = GlobBuilder::new("*.rs")
    .literal_separator(true).build()?.compile_matcher();

assert!(glob.is_match("foo.rs"));
assert!(!glob.is_match("foo/bar.rs")); // no longer matches
assert!(!glob.is_match("Cargo.toml"));
```

### 示例:一次匹配多个globs

此示例显示如何一次匹配多个glob模式.

```rust
use globset::{Glob, GlobSetBuilder};

let mut builder = GlobSetBuilder::new();
// A GlobBuilder can be used to configure each glob's match semantics
// independently.
builder.add(Glob::new("*.rs")?);
builder.add(Glob::new("src/lib.rs")?);
builder.add(Glob::new("src/**/foo.rs")?);
let set = builder.build()?;

assert_eq!(set.matches("src/bar/baz/foo.rs"), vec![0, 2]);
```

### 性能

这个crate通过将它们转换为正则表达式并使用它来执行它们来实现globs[`regex`](https://github.com/rust-lang-nursery/regex)箱.

对于单个全局匹配,此箱子的性能应该与性能大致相当[`glob`](https://github.com/rust-lang-nursery/glob)箱.(`*_regex`对应于此库的基准`*_glob`对应于基准`glob`图书馆.)优化`regex`箱子可能推动这个图书馆过去`glob`,特别是匹配较长的路径时.

```
test ext_glob             ... bench:         425 ns/iter (+/- 21)
test ext_regex            ... bench:         175 ns/iter (+/- 10)
test long_glob            ... bench:         182 ns/iter (+/- 11)
test long_regex           ... bench:         173 ns/iter (+/- 10)
test short_glob           ... bench:          69 ns/iter (+/- 4)
test short_regex          ... bench:          83 ns/iter (+/- 2)
```

此箱子的主要性能优势是将多个球体与单个路径匹配时.随着`glob`crate,必须一个接一个地匹配每个glob.在这个箱子里,许多人可以同时匹配.例如:

```
test many_short_glob      ... bench:       1,063 ns/iter (+/- 47)
test many_short_regex_set ... bench:         186 ns/iter (+/- 11)
```

### 与...比较[`glob`](https://github.com/rust-lang-nursery/glob)箱

-   支持替代"或"球,例如,`*.{foo,bar}`.
-   可以正确匹配非UTF-8文件路径.
-   支持一次匹配多个globs.
-   不提供匹配文件路径的递归目录迭代器,虽然我相信这个箱子最终应该增长一个.
-   支持不区分大小写和require-literal-separator匹配选项,但是**不**支持require-literal-leading-dot选项.
