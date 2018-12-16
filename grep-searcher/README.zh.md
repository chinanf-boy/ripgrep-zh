## grep-searcher

用于执行快速面向行的搜索的高级库。这可以处理报告上下文行，计数行，反转搜索，检测二进制数据，自动 UTF-16 转码，以及决定是否使用内存映射等内容.

[![Linux build status](https://api.travis-ci.org/BurntSushi/ripgrep.svg)](https://travis-ci.org/BurntSushi/ripgrep)
[![Windows build status](https://ci.appveyor.com/api/projects/status/github/BurntSushi/ripgrep?svg=true)](https://ci.appveyor.com/project/BurntSushi/ripgrep)
[![](https://img.shields.io/crates/v/grep-searcher.svg)](https://crates.io/crates/grep-searcher)

MIT 或[UNLICENSE](http://unlicense.org)的双重许可.

### 文档

<https://docs.rs/grep-searcher>

**注意:**您可能不想直接使用此包.相反,你应该更喜欢在[`grep`](https://docs.rs/grep)箱中定义的外观（API).

### 用法

将此添加到您的`Cargo.toml`:

```toml
[dependencies]
grep-searcher = "0.1"
```

在你的箱根使用:

```rust
extern crate grep_searcher;
```
