# BurntSushi/ripgrep [![translate-svg]][translate-list]

<!-- [![explain]][source] -->

[explain]: http://llever.com/explain.svg
[source]: https://github.com/chinanf-boy/Source-Explain
[translate-svg]: http://llever.com/translate.svg
[translate-list]: https://github.com/chinanf-boy/chinese-translate-list

「 ripgrep 是一个面向行的搜索工具 」

[中文](./readme.md) | [english](https://github.com/BurntSushi/ripgrep)

---

## 校对 🀄️

<!-- doc-templite START generated -->
<!-- repo = 'BurntSushi/ripgrep' -->
<!-- commit = '401add0a9964ff0b154171553ce6d80934461ca0' -->
<!-- time = '2018-12-09' -->
翻译的原文 | 与日期 | 最新更新 | 更多
---|---|---|---
[commit] | ⏰ 2018-12-09 | ![last] | [中文翻译][translate-list]

[last]: https://img.shields.io/github/last-commit/BurntSushi/ripgrep.svg
[commit]: https://github.com/BurntSushi/ripgrep/tree/401add0a9964ff0b154171553ce6d80934461ca0

<!-- doc-templite END generated -->

- [x] readme
- [x] [GUIDE.md](./GUIDE.zh.md)
- [ ] [FAQ.md](./FAQ.zh.md)
- [x] [grep-regex/README.md](./grep-regex/README.zh.md)
- [x] [globset/README.md](./globset/README.zh.md)
- [x] [ignore/README.md](./ignore/README.zh.md)
- [x] [grep/README.md](./grep/README.zh.md)
- [x] [termcolor/README.md](./termcolor/README.zh.md)
- [x] [grep-cli/README.md](./grep-cli/README.zh.md)
- [x] [grep-PCRE2/README.md](./grep-PCRE2/README.zh.md)
- [x] [grep-searcher/README.md](./grep-searcher/README.zh.md)
- [x] [wincolor/README.md](./wincolor/README.zh.md)
- [x] [grep-printer/README.md](./grep-printer/README.zh.md)
- [x] [grep-matcher/README.md](./grep-matcher/README.zh.md)

### 贡献

欢迎 👏 勘误/校对/更新贡献 😊 [具体贡献请看](https://github.com/chinanf-boy/chinese-translate-list#贡献)

## 生活

[help me live , live need money 💰](https://github.com/chinanf-boy/live-need-money)

---

### 目录

<!-- START doctoc -->
<!-- END doctoc -->

## ripgrep (rg)

ripgrep 是一个面向行的搜索工具,它在遵循 gitignore 规则的同时，递归地搜索当前目录以寻找正则表达式模式。ripgrep 在 Windows、MaCOS 和 Linux 上拥有一流的支持，可以下载并使用[每个 release](https://github.com/BurntSushi/ripgrep/releases)二进制文件。 ripgrep 类似于其他流行的搜索工具,如 ag，ACK 和 grep.

[![Linux build status](https://travis-ci.org/BurntSushi/ripgrep.svg)](https://travis-ci.org/BurntSushi/ripgrep)
[![Windows build status](https://ci.appveyor.com/api/projects/status/github/BurntSushi/ripgrep?svg=true)](https://ci.appveyor.com/project/BurntSushi/ripgrep)
[![Crates.io](https://img.shields.io/crates/v/ripgrep.svg)](https://crates.io/crates/ripgrep)

MIT 或 [UNLICENSE](http://unlicense.org)的双重许可。

### CHANGELOG

请看[CHANGELOG](https://github.com/BurntSushi/ripgrep/blob/master/CHANGELOG.md)发布历史`en`。

### 文档快速链接

- [安装](#installation)
- [用户指南](GUIDE.zh.md)
- [Frequently Asked Questions](FAQ.zh.md)
- [Regex 语法](https://docs.rs/regex/1/regex/#syntax)
- [配置文件](GUIDE.zh.md#configuration-file)
- [Shell tab 补全](FAQ.zh.md#complete)
- [构建](#building)

### 搜索结果快照

[![A screenshot of a sample search with ripgrep](http://burntsushi.net/stuff/ripgrep1.png)](http://burntsushi.net/stuff/ripgrep1.png)

### 各大工具对比例子

此示例搜索整个 Linux 内核源树(运行`make defconfig && make -j8`后)，找寻匹配项为`[A-Z]+_SUSPEND`，所有匹配必须是单词。在具有 Intel i7-6900K 3.2GHz 的系统上统计时间,并在启用 SIMD 的情况下编译 ripgrep。

请记住,单一的基准是不够的! 看到我[博客上关于 ripgrep 的博文](http://blog.burntsushi.net/ripgrep/)，其有更多的基准和分析进行了非常详细的比较.

| 工具                                                                                 | 命令                                                    | 行计数         | 时间       |
| ------------------------------------------------------------------------------------ | ------------------------------------------------------- | -------------- | ---------- |
| ripgrep(Unicode)                                                                     | `rg -n -w '[A-Z]+_SUSPEND'`                             | 450            | **0.106s** |
| [git grep](https://www.kernel.org/pub/software/scm/git/docs/git-grep.html)           | `LC_ALL=C git grep -E -n -w '[A-Z]+_SUSPEND'`           | 450            | 0.55       |
| [The Silver Searcher](https://github.com/ggreer/the_silver_searcher)                 | `ag -w '[A-Z]+_SUSPEND'`                                | 450            | 0.895      |
| [git grep (Unicode)](https://www.kernel.org/pub/software/scm/git/docs/git-grep.html) | `LC_ALL=en_US.UTF-8 git grep -E -n -w '[A-Z]+_SUSPEND'` | 450            | 2.266s     |
| [sift](https://github.com/svent/sift)                                                | `sift --git -n -w '[A-Z]+_SUSPEND'`                     | 450            | 3.505s     |
| [ack](https://github.com/petdance/ack2)                                              | `ack -w '[A-Z]+_SUSPEND'`                               | 一千八百七十八 | 6.823s     |
| [The Platinum Searcher](https://github.com/monochromegane/the_platinum_searcher)     | `pt -w -e '[A-Z]+_SUSPEND'`                             | 450            | 14.208s    |

(是的,`ack` [会有个](https://github.com/petdance/ack2/issues/445)一[bug](https://github.com/petdance/ack2/issues/14))

这是另一个忽略 gitignore 文件和用白名单搜索的基准。语料库与前面的基准测试相同,传递给每个命令的相同标志，确保它们正在执行相同的工作:

| 工具                                           | 命令                                                              | 行计数 | 时间       |
| ---------------------------------------------- | ----------------------------------------------------------------- | ------ | ---------- |
| ripgrep                                        | `rg -L -u -tc -n -w '[A-Z]+_SUSPEND'`                             | 404    | **0.079s** |
| [ucg](https://github.com/gvansickle/ucg)       | `ucg --type=cc -w '[A-Z]+_SUSPEND'`                               | 390    | 0.163s     |
| [GNU grep](https://www.gnu.org/software/grep/) | `egrep -R -n --include='*.c' --include='*.h' -w '[A-Z]+_SUSPEND'` | 404    | 0.611s     |

(`ucg` [在存在符号链接时，行为略有不同](https://github.com/gvansickle/ucg/issues/106))

最后,在一个单一的大文件(~9.3GB)上,ripgrep 和 GNU grep 之间的直接比较。[`OpenSubtitles2016.raw.en.gz`](http://opus.lingfil.uu.se/OpenSubtitles2016/mono/OpenSubtitles2016.raw.en.gz):

| 工具                                           | 命令                                    | 线路计数 | 时间       |
| ---------------------------------------------- | --------------------------------------- | -------- | ---------- |
| ripgrep                                        | `rg -w 'Sherlock [A-Z]\w+'`             | 5268     | **2.108s** |
| [GNU grep](https://www.gnu.org/software/grep/) | `LC_ALL=C egrep -w 'Sherlock [A-Z]\w+'` | 5268     | 7.014s     |

在上述基准中,传递`-n`标志(用于显示行号)，会增加时间，`2.640s`的 ripgrep 和`10.277s`的 GNU grep.

### 为什么我应该使用 ripgrep?

- 它可以替换由其他搜索工具提供的许多用例，因为它包含它们的大部分特性,并且通常更快.(见[FAQ](FAQ.zh.md#posix4ever)有关 ripgrep 是否能够真正取代 grep 的更多细节。
- 像其他专门用于代码搜索的工具一样，ripgrep 默认用于递归目录搜索，并且不会搜索被`.gitignore`匹配的文件/+夹。默认情况下，它也忽略了隐藏文件和二进制文件。ripgrep 还实现了对`.gitignore`支持，然而，在其它代码搜索工具中，有许多与该功能相关的 bug 工具，声称提供了相同的功能。
- ripgrep 可以搜索特定类型的文件。例如，`rg -tpy foo`将搜索限制为 Python 文件，`rg -Tjs foo`从搜索中排除 JavaScript 文件 。ripgrep 可以用自定义匹配规则教给新的文件类型。
- ripgrep 支持许多`grep`特性。例如，显示搜索结果的上下文、搜索多个模式、突出显示具有颜色和全部 Unicode 支持的匹配与 GNU grep 不同，ripgrep 在支持 Unicode(总是在 启动)的同时保持快速。
- ripgrep 有可选的支持，以切换其正则表达式引擎使用 PCRE2 。除此之外，这使得在模式中，使用环视和反向引用成为可能，而这些在 ripgrep 的默认正则表达式引擎中不受支持。启用 PCRE2 支持用`-P`。
- ripgrep 支持以 UTF-8 以外的文本编码搜索文件，例如 UTF-16, latin-1, GBK, EUC-JP, Shift_JIS 等等。提供了自动检测 UTF 16 的一些支持。其他文本编码必须与`-E/--encoding`参数搭配使用)
- ripgrep 支持搜索通用格式(gzip、xz、lzma、bzip2 或 lz4)的压缩文件，搭配`-z/--search-zip`参数.
- ripgrep 支持任意的输入预处理过滤器，这些过滤器可以是 PDF 文本提取、较少支持的解压缩、解密、自动编码检测等。

换句话说，如果你喜欢速度，默认的过滤,更少的 bug 和 Unicode 支持,使用 ripgrep。

### 为什么我不用 ripgrep?

尽管最初不希望将每个特性都添加到 ripgrep 中,但是随着时间的推移,ripgrep 对其他文件搜索工具中的大多数特性的支持不断增加。这包括搜索跨越多行的结果,以及对 PCRE2 的 opt-in 支持,PCRE2 提供环视和反引号支持。

此时,不使用 ripgrep 的主要原因可能包括以下一个或多个:

- 你需要一个便携的无所不在的工具。尽管 ripgrep 在 Windows、macOS 和 Linux 上工作,但它并不普遍,也不符合 POSIX 等任何标准.做这项工作最好的工具是老 grep。
- 在这个 README 中仍然有一些您心目中所依赖的其他特性(或 bug)没有列出，这些东东在其他工具中，而不在 ripgrep 。
- 有一个性能边缘情况,ripgrep 做得不好（而在其他工具做得好的地方）.(请提交 bug 报告!)
- ripgrep 不可能安装在您的机器上,或者不适用于您的平台.(请提交 bug 报告!)

### 真的超越所有?

一般来说,是的。大量的基准,每一个都有详细的分析.[尽在我的博客上](http://blog.burntsushi.net/ripgrep/).

总之,ripgrep 很快,因为:

- 它建在[Rust's regex 引擎](https://github.com/rust-lang-nursery/regex). Rust 的正则表达式引擎使用有限自动机、SIMD 和积极的文字优化来使搜索非常快。(PCRE2 支持可以与`-P/--PCRE2`参数)
- Rust 的 regex 库通过将 UTF-8 解码直接构建到其确定性有限自动机引擎中,从而在完全 Unicode 支持下，保持性能。
- 它支持使用内存映射，或通过使用中间缓冲区递增地搜索进行搜索。前者对于单个文件更好,后者对于大目录更好。ripgrep 自动为您选择最佳搜索策略。
- 将您的`.gitignore`文件的忽略模式，应用了一个[`RegexSet`](https://docs.rs/regex/1/regex/struct.RegexSet.html)。 这意味着单个文件路径,可以同时匹配多个 glob 模式。
- 它使用一个无锁的并行递归目录迭代器[`crossbeam`](https://docs.rs/crossbeam)和[`ignore`](https://docs.rs/ignore)。

### 功能 比较

Andy Lester,[ack](https://beyondgrep.com/)作者已发布了一个比较 ack、ag、git-grep、GNU grep 和 ripgrep 特性的优秀表:<https://beyondgrep.com/feature-comparison/>

请注意,ripgrep 最近增加了一些尚未出现在 Andy 表中的重要新特性。这包括但不限于，配置文件、passthru、对搜索压缩文件的支持、多行搜索和通过 PCRE2 支持选择高级正则表达式。

### Installation

- 安装

ripgrep 的二进制名是`rg`.

**[Windows,macOS 和 Linux 的 二进制文件，尽在于此](https://github.com/BurntSushi/ripgrep/releases)**，若以下有用户的平台没提到的，建议下载这些压缩中的一个。

Linux 二进制文件是静态可执行文件。Windows 二进制文件可用 MinGW(GNU)或微软 Visual C++(MSVC)构建。如果可能的话，更喜欢 MSVC 超过 GNU，但是你需要安装有[Microsoft VC++ 2015
redistributable](https://www.microsoft.com/en-us/download/details.aspx?id=48145)。

如果你是**macOS Homebrew**或 一个**Linuxbrew**用户，然后可以从 homebrew-core 安装 ripgrep,(用 Rust 稳定版编译,没有 SIMD 支持):

```
$ brew install ripgrep
```

或者您可以通过使用定制的 tab 来安装，用 rust nightly 版本 编译的二进制文件(包括 SIMD 和所有优化):

```
$ brew tap burntsushi/ripgrep https://github.com/BurntSushi/ripgrep.git
$ brew install ripgrep-bin
```

如果你是**MacPorts**用户,然后可以从[官方 ports](https://www.macports.org/ports.php?by=name&substr=ripgrep)下载 ripgrep:

```
$ sudo port install ripgrep
```

<!-- HERE -->

如果你是**Windows Chocolatey**用户,然后可以从[官方 repo](https://chocolatey.org/packages/ripgrep):

```
$ choco install ripgrep
```

如果你是**Windows Scoop**用户,然后可以从[官方 bucket](https://github.com/lukesampson/scoop/blob/master/bucket/ripgrep.json):

```
$ scoop install ripgrep
```

如果你是一个**Arch Linux**用户,然后您可以从官方，安装 ripgrep :

```
$ pacman -S ripgrep
```

如果你是**Gentoo**用户,可以从[官方 repo](https://packages.gentoo.org/packages/sys-apps/ripgrep):

```
$ emerge sys-apps/ripgrep
```

如果你是**Fedora 27 +**用户,可以从官方存储库安装 ripgrep.

```
$ sudo dnf install ripgrep
```

如果你是**Fedora 24 +**用户,可以从[copr](https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/)安装 ripgrep:

```
$ sudo dnf copr enable carlwgeorge/ripgrep
$ sudo dnf install ripgrep
```

如果你是一个**openSUSE Tumbleweed**用户,可以从[官方 repo](http://software.opensuse.org/package/ripgrep):

```
$ sudo zypper install ripgrep
```

如果你是**RHEL/CentOS 7**用户,可以从[copr](https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/)安装 ripgrep:

```
$ sudo yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo
$ sudo yum install ripgrep
```

如果你是**Nix**用户,可以从[nixpkgs](https://github.com/NixOS/nixpkgs/blob/master/pkgs/tools/text/ripgrep/default.nix)安装 ripgrep:

```
$ nix-env --install ripgrep
$ # (Or using the attribute name, which is also ripgrep.)
```

如果你是**Debian**用户(或 **Ubuntu** 的用户),然后,可以使用每一个[ripgrep release](https://github.com/BurntSushi/ripgrep/releases)提供的二进制`.deb`文件来安装 ripgrep。

```
$ curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep_0.10.0_amd64.deb
$ sudo dpkg -i ripgrep_0.10.0_amd64.deb
```

如果运行 Debian Buster(当前 Debian 测试)或 Debian SID,ripgrep 是[Debian 官方包所具备的](https://tracker.debian.org/pkg/rust-ripgrep).

```
$ sudo apt-get install ripgrep
```

如果你是一个**Ubuntu Cosmic(18.10)**(或更新的)用户,ripgrep[与上面相同](https://launchpad.net/ubuntu/+source/rust-ripgrep)，是可以使用与 Debian 包装:

```
$ sudo apt-get install ripgrep
```

(N.B.Ubuntu 上 ripgrep 的各种快照包也是可用的，但是它们似乎都不能正常工作,并且生成许多非常奇怪的 bug 报告,我不知道如何修复,也没有时间修复)。因此,它**不再是推荐的安装选项**。

如果你是**FreeBSD**用户,然后可以从[官方 ports](https://www.freshports.org/textproc/ripgrep/)安装:

```
# pkg install ripgrep
```

如果你是一个**OpenBSD**用户,然后可以从[官方 ports](http://openports.se/textproc/ripgrep)安装:

```
$ doas pkg_add ripgrep
```

如果你是**NetBSD**用户,然后可以从[pkgsrc](http://pkgsrc.se/textproc/ripgrep)安装 ripgrep:

```
# pkgin install ripgrep
```

如果你是**Rust 程序员** 可以用`cargo`安装 ripgrep.

- 请注意,ripgrep 的最小 Rust 支持版本的是**1.23.0**,虽然 ripgrep 可能与旧版本一起工作。
- 请注意,二进制可能大于预期,因为它包含调试符号。这是故意的。若要删除调试符号，并减少文件大小,请运行二进制的`strip`。

```
$ cargo install ripgrep
```

当使用 Rust 1.27 或更新版本进行编译时,这将自动启用搜索的 SIMD 优化。

ripgrep 目前不在任何其他包库中。[我更喜欢这样](https://github.com/BurntSushi/ripgrep/issues/10).

### Building

- 构建

ripgrep 是用 Rust 编写的,所以你需要先具有一个[Rust](https://www.rust-lang.org/)。ripgrep 与 Rust 1.28.0(稳定)或打上。一般来说,ripgrep 会跟随 Rust 编译器的最新稳定版本.

构建 ripgrep:

```
$ git clone https://github.com/BurntSushi/ripgrep
$ cd ripgrep
$ cargo build --release
$ ./target/release/rg --version
0.1.3
```

如果您有一个 Rust 夜间(nightly)编译器和最近的 Intel CPU,那么您可以启用额外的可选 SIMD 加速,如下所示:

```
RUSTFLAGS="-C target-cpu=native" cargo build --release --features 'simd-accel avx-accel'
```

如果您的机器不支持 AVX 指令，则只需从功能列表中删除`avx-accel`。SIMD 也类似(它大致对应于 SSE 指令).

在某些 ripgrep 依赖项中，`simd-accel`和`avx-accel`功能会支持 SIMD(负责计算行数和转码)。它们不需要获得 SIMD 优化搜索; 那些是自动启用。希望有一天,`simd-accel`和`avx-accel`特征变得不必要。

最后,可选择加入 PCRE2 的支持，此为通过启用`PCRE2`功能参与 ripgrep 的构建:

```
$ cargo build --release --features 'PCRE2'
```

(提示:使用`--features 'PCRE2 simd-accel avx-accel'`还包括编译时 SIMD 优化，这将只适用于夜间编译器。

启用 PCRE2 特性可以与稳定的 Rust 编译器一起工作，并将尝试通过`pkg-config`自动查找，并链接到系统的 PCRE2 库。 如果不存在,那么 ripgrep 将使用系统的 C 编译器，从源代码构建 PCRE2，然后静态地将其链接到最终的可执行文件中。即使存在可用的 PCRE2 系统库，也可以通过构建具有 MUSL 目标的 ripgrep ，或通过设置强制静态链接`PCRE2_SYS_STATIC=1`。

在 Linux 上，能以 MUSL 为目标，构建 ripgrep ，通过在您的系统上先安装 MUSL 库(咨询您友好的邻居 - 包管理器)。然后,您只需要将 MUSL 支持，添加到 Rust 工具链，并重新构建 ripgrep，它就会生成一个完全静态的可执行文件:

```
$ rustup target add x86_64-unknown-linux-musl
$ cargo build --release --target x86_64-unknown-linux-musl
```

应用上面的`--features`参数，就会如愿以偿。如果您想用 MUSL 和 PCRE2 构建静态可执行文件，那么您将需要已安装`musl-gcc`，它可能位于与实际 MUSL 库分隔的包中，这取决于您的 Linux 发行版。

### Running tests

- 运行测试

ripgrep 的测试相对不错，包括单元测试和集成测试。若要运行完整的测试套件,请使用:

```
$ cargo test --all
```

位于存储库的根目录。
