## grep的匹配器

此包提供了一个低级接口,用于描述正则表达式匹配器.该`grep`crate使用此接口以使其使用可插拔的正则表达式引擎.

[![Linux build status](https://api.travis-ci.org/BurntSushi/ripgrep.svg)](https://travis-ci.org/BurntSushi/ripgrep)
[![Windows build status](https://ci.appveyor.com/api/projects/status/github/BurntSushi/ripgrep?svg=true)](https://ci.appveyor.com/project/BurntSushi/ripgrep)
[![](https://img.shields.io/crates/v/grep-matcher.svg)](https://crates.io/crates/grep-matcher)

麻省理工学院或MIT下的双重许可[UNLICENSE](http://unlicense.org).

### 文档

<https://docs.rs/grep-matcher>

**注意:**您可能不想直接使用此包.相反,你应该更喜欢在中定义的外观[`grep`](https://docs.rs/grep)箱.

### 用法

将此添加到您的`Cargo.toml`:

```toml
[dependencies]
grep-matcher = "0.1"
```

这对你的箱子根:

```rust
extern crate grep_matcher;
```
