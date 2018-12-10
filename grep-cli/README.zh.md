## grep的-CLI

一个实用程序库,提供面向搜索的命令行应用程序所需的常用例程.这包括但不限于解析十六进制转义,检测stdin是否可读等等.在这种情况下,这个箱子力求在Windows,macOS和Linux之间实现兼容性.

[![Linux build status](https://api.travis-ci.org/BurntSushi/ripgrep.svg)](https://travis-ci.org/BurntSushi/ripgrep)
[![Windows build status](https://ci.appveyor.com/api/projects/status/github/BurntSushi/ripgrep?svg=true)](https://ci.appveyor.com/project/BurntSushi/ripgrep)
[![](https://img.shields.io/crates/v/grep-cli.svg)](https://crates.io/crates/grep-cli)

麻省理工学院或MIT下的双重许可[UNLICENSE](http://unlicense.org).

### 文档

<https://docs.rs/grep-cli>

**注意:**您可能不想直接使用此包.相反,你应该更喜欢在中定义的外观[`grep`](https://docs.rs/grep)箱.

### 用法

将此添加到您的`Cargo.toml`:

```toml
[dependencies]
grep-cli = "0.1"
```

这对你的箱子根:

```rust
extern crate grep_cli;
```
