# globset

跨平台单个 glob 和 glob 集合匹配。glob 集合匹配是将一个或多个 glob 模式与单个备选路径同时匹配，并返回所有匹配的 glob 的过程。

[![Linux build status](https://api.travis-ci.org/BurntSushi/ripgrep.svg)](https://travis-ci.org/BurntSushi/ripgrep)
[![Windows build status](https://ci.appveyor.com/api/projects/status/github/BurntSushi/ripgrep?svg=true)](https://ci.appveyor.com/project/BurntSushi/ripgrep)
[![](https://img.shields.io/crates/v/globset.svg)](https://crates.io/crates/globset)

MIT 或[UNLICENSE](http://unlicense.org)的双重许可.

### 文档

<https://docs.rs/globset>

### 用法

将此添加到您的`Cargo.toml`:

```toml
[dependencies]
globset = "0.3"
```

在你的箱根使用:

```rust
extern crate globset;
```

### 示例:一个 glob

此示例显示如何将单个 glob 与单个文件路径匹配.

```rust
use globset::Glob;

let glob = Glob::new("*.rs")?.compile_matcher();

assert!(glob.is_match("foo.rs"));
assert!(glob.is_match("foo/bar.rs"));
assert!(!glob.is_match("Cargo.toml"));
```

### 示例:配置 glob 匹配器

此示例显示如何使用 一个`GlobBuilder`去配置匹配(match)语义。在此示例中,我们不要通配符,匹配路径分隔符。

```rust
use globset::GlobBuilder;

let glob = GlobBuilder::new("*.rs")
    .literal_separator(true).build()?.compile_matcher();

assert!(glob.is_match("foo.rs"));
assert!(!glob.is_match("foo/bar.rs")); // 不再 matches
assert!(!glob.is_match("Cargo.toml"));
```

### 示例:一次匹配多个 globs

此示例显示如何一次匹配多个 glob 模式.

```rust
use globset::{Glob, GlobSetBuilder};

let mut builder = GlobSetBuilder::new();
// 一个 GlobBuilder 就可以用来配置每个 glob's match 语义
// 单个.
builder.add(Glob::new("*.rs")?);
builder.add(Glob::new("src/lib.rs")?);
builder.add(Glob::new("src/**/foo.rs")?);
let set = builder.build()?;

assert_eq!(set.matches("src/bar/baz/foo.rs"), vec![0, 2]);
```

### 性能

这个 箱 通过将它们转换为正则表达式，和使用[`regex`](https://github.com/rust-lang-nursery/regex)箱来执行它们，来实现 globs。

对于单个全局匹配,此箱子的性能应该与[`glob`](https://github.com/rust-lang-nursery/glob)箱性能大致相当。(`*_regex`是针对此库的基准，`*_glob`是针对`glob`库的基准。)
优化`regex`箱，还可能推动这个库超过`glob`基准，特别是匹配较长的路径时。

```
test ext_glob             ... bench:         425 ns/iter (+/- 21)
test ext_regex            ... bench:         175 ns/iter (+/- 10)
test long_glob            ... bench:         182 ns/iter (+/- 11)
test long_regex           ... bench:         173 ns/iter (+/- 10)
test short_glob           ... bench:          69 ns/iter (+/- 4)
test short_regex          ... bench:          83 ns/iter (+/- 2)
```

此箱子的主要性能优势是将多个 glob 与单个路径匹配。要用`glob`箱,一个接一个地匹配每个 glob。在这个箱子里,许多人可以同时匹配。例如:

```
test many_short_glob      ... bench:       1,063 ns/iter (+/- 47)
test many_short_regex_set ... bench:         186 ns/iter (+/- 11)
```

### 与[`glob`](https://github.com/rust-lang-nursery/glob)箱比较

- 支持替代 "或" globs，例如，`*.{foo,bar}`.
- 可以正确匹配非 UTF-8 文件路径.
- 支持一次匹配多个 globs.
- 不提供匹配文件路径的递归目录迭代器,虽然我相信这个箱子最终应该增长一个。
- 支持不区分大小写和 require-literal-separator(需要路径分隔符) 匹配选项，但是**不**支持 require-literal-leading-dot((需要前路径点号)) 选项.
