## grep 的正则表达式

`grep-regex`箱提供了一个，`grep-matcher`箱的`Matcher`trait 实现。这个实现允许 Rust 的正则表达式引擎用于`grep`箱，的快速行搜索。

[![Linux build status](https://api.travis-ci.org/BurntSushi/ripgrep.svg)](https://travis-ci.org/BurntSushi/ripgrep)
[![Windows build status](https://ci.appveyor.com/api/projects/status/github/BurntSushi/ripgrep?svg=true)](https://ci.appveyor.com/project/BurntSushi/ripgrep)
[![](https://img.shields.io/crates/v/grep-regex.svg)](https://crates.io/crates/grep-regex)

MIT 或[UNLICENSE](http://unlicense.org)的双重许可.

### 文档

<https://docs.rs/grep-regex>

**注意:**您可能不想直接使用此包。那么,你会更喜欢[`grep`](https://docs.rs/grep)箱中定义的外观(API).

### 用法

将此添加到您的`Cargo.toml`:

```toml
[dependencies]
grep-regex = "0.1"
```

并在你的箱根中使用:

```rust
extern crate grep_regex;
```
