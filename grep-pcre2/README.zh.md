## grep 的 pcre2

`grep-pcre2`箱 提供了，一个`grep-matcher`箱的`Matcher`trait 实现。这种实现允许 PCRE2 用在`grep`，的快速线路搜索.

[![Linux build status](https://api.travis-ci.org/BurntSushi/ripgrep.svg)](https://travis-ci.org/BurntSushi/ripgrep)
[![Windows build status](https://ci.appveyor.com/api/projects/status/github/BurntSushi/ripgrep?svg=true)](https://ci.appveyor.com/project/BurntSushi/ripgrep)
[![](https://img.shields.io/crates/v/grep-pcre2.svg)](https://crates.io/crates/grep-pcre2)

MIT 或[UNLICENSE](http://unlicense.org)的双重许可.

### 文档

<https://docs.rs/grep-pcre2>

**注意:**您可能不想直接使用此包.相反,你应该更喜欢在[`grep`](https://docs.rs/grep)箱中定义的外观（API).

如果您只想使用 Rust 的 PCRE2,那么您可能需要[`pcre2`](https://docs.rs/pcre2)箱子,为 PCRE2 提供高水平的安全装订。

### 用法

将此添加到您的`Cargo.toml`:

```toml
[dependencies]
grep-pcre2 = "0.1"
```

在你的箱根使用:

```rust
extern crate grep_pcre2;
```
