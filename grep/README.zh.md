## grep的

ripgrep,作为一个图书馆.

[![Linux build status](https://api.travis-ci.org/BurntSushi/ripgrep.svg)](https://travis-ci.org/BurntSushi/ripgrep)
[![Windows build status](https://ci.appveyor.com/api/projects/status/github/BurntSushi/ripgrep?svg=true)](https://ci.appveyor.com/project/BurntSushi/ripgrep)
[![](https://img.shields.io/crates/v/grep.svg)](https://crates.io/crates/grep)

麻省理工学院或MIT下的双重许可[UNLICENSE](http://unlicense.org).

### 文档

<https://docs.rs/grep>

注意:此箱子尚未准备好广泛使用.雄心勃勃的人可能会将这些部分拼凑在一起,但没有高级文档描述所有部分如何组合在一起.

### 用法

将此添加到您的`Cargo.toml`:

```toml
[dependencies]
grep = "0.2"
```

这对你的箱子根:

```rust
extern crate grep;
```

### 特征

这个箱子提供了一个`pcre2`功能(默认情况下禁用),启用后,重新导出`grep-pcre2`箱子作为替代品`Matcher`实施到标准`grep-regex`实现.
