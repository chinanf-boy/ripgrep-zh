## grep

ripgrep,的一库.

[![Linux build status](https://api.travis-ci.org/BurntSushi/ripgrep.svg)](https://travis-ci.org/BurntSushi/ripgrep)
[![Windows build status](https://ci.appveyor.com/api/projects/status/github/BurntSushi/ripgrep?svg=true)](https://ci.appveyor.com/project/BurntSushi/ripgrep)
[![](https://img.shields.io/crates/v/grep.svg)](https://crates.io/crates/grep)

MIT 或[UNLICENSE](http://unlicense.org)的双重许可.

### 文档

<https://docs.rs/grep>

**注意**:此箱子尚未准备好广泛使用。雄心勃勃的人可能会将这些部分(自行了解的使用方式)拼凑在一起，但没有高级文档描述所有部分如何组合在一起。

### 用法

将此添加到您的`Cargo.toml`:

```toml
[dependencies]
grep = "0.2"
```

在你的箱根使用:

```rust
extern crate grep;
```

### 特征

这个箱子提供了一个`pcre2`功能(默认情况下禁用),启用后,重新导出`grep-pcre2`箱子，作为替代`Matcher`的实现，到标准`grep-regex`实现中。
