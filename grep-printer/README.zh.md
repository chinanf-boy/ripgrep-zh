## grep 的打印机

以人类可读,统计或 JSON 行格式，打印面向行的搜索结果。

[![Linux build status](https://api.travis-ci.org/BurntSushi/ripgrep.svg)](https://travis-ci.org/BurntSushi/ripgrep)
[![Windows build status](https://ci.appveyor.com/api/projects/status/github/BurntSushi/ripgrep?svg=true)](https://ci.appveyor.com/project/BurntSushi/ripgrep)
[![](https://img.shields.io/crates/v/grep-printer.svg)](https://crates.io/crates/grep-printer)

MIT 或[UNLICENSE](http://unlicense.org)的双重许可.

### 文档

<https://docs.rs/grep-printer>

**注意:**您可能不想直接使用此包.相反,你应该更喜欢在[`grep`](https://docs.rs/grep)箱中定义的外观（API).

### 用法

将此添加到您的`Cargo.toml`:

```toml
[dependencies]
grep-printer = "0.1"
```

在你的箱根使用:

```rust
extern crate grep_printer;
```
