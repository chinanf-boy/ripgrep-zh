# ignore

ignore 箱 提供了一个快速的递归目录迭代器,它尊重各种过滤器,如 globs,文件类型和`.gitignore`文件。此包还提供对 gitignore 和文件类型匹配器的较低层的直接访问。

[![Linux build status](https://api.travis-ci.org/BurntSushi/ripgrep.svg)](https://travis-ci.org/BurntSushi/ripgrep)
[![Windows build status](https://ci.appveyor.com/api/projects/status/github/BurntSushi/ripgrep?svg=true)](https://ci.appveyor.com/project/BurntSushi/ripgrep)
[![](https://img.shields.io/crates/v/ignore.svg)](https://crates.io/crates/ignore)

MIT 或[UNLICENSE](http://unlicense.org)的双重许可.

### 文档

<https://docs.rs/ignore>

### 用法

将此添加到您的`Cargo.toml`:

```toml
[dependencies]
ignore = "0.4"
```

在你的箱根使用:

```rust
extern crate ignore;
```

### 例

此示例显示了此箱子的最基本用法。此代码将递归遍历当前目录,同时根据`.ignore`和`.gitignore`文件中的 ignore globs 模式，自动过滤掉文件和目录:

```rust,no_run
use ignore::Walk;

for result in Walk::new("./") {
    // Each item yielded by the iterator is either a directory entry or an
    // error, so either print the path or the error.
    match result {
        Ok(entry) => println!("{}", entry.path().display()),
        Err(err) => println!("ERROR: {}", err),
    }
}
```

### 示例:高级

默认情况下,递归目录迭代器将忽略隐藏的文件和目录。可以通过构建`WalkBuilder`迭代器来禁用它:

```rust,no_run
use ignore::WalkBuilder;

for result in WalkBuilder::new("./").hidden(false).build() {
    println!("{:?}", result);
}
```

请参阅文档`WalkBuilder`，有许多其他选择.
