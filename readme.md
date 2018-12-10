# BurntSushi/ripgrep [![translate-svg]][translate-list]

<!-- [![explain]][source] -->

[explain]: http://llever.com/explain.svg
[source]: https://github.com/chinanf-boy/Source-Explain
[translate-svg]: http://llever.com/translate.svg
[translate-list]: https://github.com/chinanf-boy/chinese-translate-list

「 desc 」

[中文](./readme.md) | [english](https://github.com/BurntSushi/ripgrep)

---

## 校对 🀄️

<!-- doc-templite START generated -->
<!-- repo = 'BurntSushi/ripgrep' -->
<!-- commit = '401add0a9964ff0b154171553ce6d80934461ca0' -->
<!-- time = '2018-12-09' -->

| 翻译的原文 | 与日期        | 最新更新 | 更多                       |
| ---------- | ------------- | -------- | -------------------------- |
| [commit]   | ⏰ 2018-12-09 | ![last]  | [中文翻译][translate-list] |

[last]: https://img.shields.io/github/last-commit/BurntSushi/ripgrep.svg
[commit]: https://github.com/BurntSushi/ripgrep/tree/401add0a9964ff0b154171553ce6d80934461ca0

<!-- doc-templite END generated -->

- [ ] readme
- [ ] [grep-regex/README.md](./grep-regex/README.zh.md)
- [ ] [globset/README.md](./globset/README.zh.md)
- [ ] [ignore/README.md](./ignore/README.zh.md)
- [ ] [FAQ.md](./FAQ.zh.md)
- [ ] [grep/README.md](./grep/README.zh.md)
- [ ] [termcolor/README.md](./termcolor/README.zh.md)
- [ ] [grep-cli/README.md](./grep-cli/README.zh.md)
- [ ] [grep-pcre2/README.md](./grep-pcre2/README.zh.md)
- [ ] [GUIDE.md](./GUIDE.zh.md)
- [ ] [grep-searcher/README.md](./grep-searcher/README.zh.md)
- [ ] [wincolor/README.md](./wincolor/README.zh.md)
- [ ] [grep-printer/README.md](./grep-printer/README.zh.md)
- [ ] [grep-matcher/README.md](./grep-matcher/README.zh.md)

### 贡献

欢迎 👏 勘误/校对/更新贡献 😊 [具体贡献请看](https://github.com/chinanf-boy/chinese-translate-list#贡献)

## 生活

[help me live , live need money 💰](https://github.com/chinanf-boy/live-need-money)

---

### 目录

<!-- START doctoc -->
<!-- END doctoc -->

## ripgrep (rg)

ripgrep 是一个面向行的搜索工具,它在尊重 gitignore 规则的同时递归地搜索当前目录以寻找正则表达式模式.RIPGRIP 在 Windows、MaCOS 和 Linux 上拥有一流的支持,可以使用二进制下载[every release](https://github.com/BurntSushi/ripgrep/releases). RIPGRIP 类似于其他流行的搜索工具,如银搜索器,ACK 和 GRIP.

[![Linux build status](https://travis-ci.org/BurntSushi/ripgrep.svg)](https://travis-ci.org/BurntSushi/ripgrep)
[![Windows build status](https://ci.appveyor.com/api/projects/status/github/BurntSushi/ripgrep?svg=true)](https://ci.appveyor.com/project/BurntSushi/ripgrep)
[![Crates.io](https://img.shields.io/crates/v/ripgrep.svg)](https://crates.io/crates/ripgrep)

在 MIT 的双重许可[UNLICENSE](http://unlicense.org).

### CHANGELOG

请看[CHANGELOG](https://github.com/BurntSushi/ripgrep/blob/master/CHANGELOG.md)发布历史.

### Documentation quick links

- [Installation](#installation)
- [User Guide](GUIDE.md)
- [Frequently Asked Questions](FAQ.md)
- [Regex syntax](https://docs.rs/regex/1/regex/#syntax)
- [Configuration files](GUIDE.md#configuration-file)
- [Shell completions](FAQ.md#complete)
- [Building](#building)

### Screenshot of search results

[![A screenshot of a sample search with ripgrep](http://burntsushi.net/stuff/ripgrep1.png)](http://burntsushi.net/stuff/ripgrep1.png)

### Quick examples comparing tools

此示例搜索整个 Linux 内核源树(运行后)`make defconfig && make -j8`为`[A-Z]+_SUSPEND`,所有匹配必须是单词.在具有 Intel i7-6900K 3.2GHz 的系统上收集定时,并在启用 SIMD 的情况下编译 ripgrep.

请记住,单一的基准是不够的!看到我[blog post on ripgrep](http://blog.burntsushi.net/ripgrep/)与更多的基准和分析进行了非常详细的比较.

| 工具                                                                                 | 命令                                                    | 线路计数       | 时间       |
| ------------------------------------------------------------------------------------ | ------------------------------------------------------- | -------------- | ---------- |
| RIPGRIP(Unicode)                                                                     | `rg -n -w '[A-Z]+_SUSPEND'`                             | 四百五十       | **0.106s** |
| [git grep](https://www.kernel.org/pub/software/scm/git/docs/git-grep.html)           | `LC_ALL=C git grep -E -n -w '[A-Z]+_SUSPEND'`           | 四百五十       | 0.55       |
| [The Silver Searcher](https://github.com/ggreer/the_silver_searcher)                 | `ag -w '[A-Z]+_SUSPEND'`                                | 四百五十       | 0.895      |
| [git grep (Unicode)](https://www.kernel.org/pub/software/scm/git/docs/git-grep.html) | `LC_ALL=en_US.UTF-8 git grep -E -n -w '[A-Z]+_SUSPEND'` | 四百五十       | 2.266s     |
| [sift](https://github.com/svent/sift)                                                | `sift --git -n -w '[A-Z]+_SUSPEND'`                     | 四百五十       | 3.505s     |
| [ack](https://github.com/petdance/ack2)                                              | `ack -w '[A-Z]+_SUSPEND'`                               | 一千八百七十八 | 6823       |
| [The Platinum Searcher](https://github.com/monochromegane/the_platinum_searcher)     | `pt -w -e '[A-Z]+_SUSPEND'`                             | 四百五十       | 14208S     |

(是的,`ack` [has](https://github.com/petdance/ack2/issues/445)一[bug](https://github.com/petdance/ack2/issues/14))

这是另一个忽略 GiTigGORE 文件和用白名单搜索的基准.语料库与前面的基准测试相同,传递给每个命令的标志确保它们正在执行相同的工作:

| 工具                                           | 命令                                                              | 线路计数 | 时间       |
| ---------------------------------------------- | ----------------------------------------------------------------- | -------- | ---------- |
| 里普格雷普                                     | `rg -L -u -tc -n -w '[A-Z]+_SUSPEND'`                             | 四百零四 | **0.079s** |
| [ucg](https://github.com/gvansickle/ucg)       | `ucg --type=cc -w '[A-Z]+_SUSPEND'`                               | 三百九十 | 0.163s     |
| [GNU grep](https://www.gnu.org/software/grep/) | `egrep -R -n --include='*.c' --include='*.h' -w '[A-Z]+_SUSPEND'` | 四百零四 | 0.611s     |

(`ucg` [has slightly different behavior in the presence of symbolic links](https://github.com/gvansickle/ucg/issues/106))

最后,在一个单一的大文件(~93GB)上,ReReGRP 和 GNU-GRIP 之间的直接比较.[`OpenSubtitles2016.raw.en.gz`](http://opus.lingfil.uu.se/OpenSubtitles2016/mono/OpenSubtitles2016.raw.en.gz)):

| 工具                                           | 命令                                    | 线路计数       | 时间       |
| ---------------------------------------------- | --------------------------------------- | -------------- | ---------- |
| 里普格雷普                                     | `rg -w 'Sherlock [A-Z]\w+'`             | 五千二百六十八 | **2.108s** |
| [GNU grep](https://www.gnu.org/software/grep/) | `LC_ALL=C egrep -w 'Sherlock [A-Z]\w+'` | 五千二百六十八 | 7.014s     |

在上述基准中,通过`-n`标志(用于显示行号)增加时间到`2.640s`里弗雷普和`10.277s`对于 GNU-GRIP.

### Why should I use ripgrep?

- 它可以替换由其他搜索工具提供的许多用例,因为它包含它们的大部分特性,并且通常更快.(见[the FAQ](FAQ.md#posix4ever)有关 ReReGRP 是否能够真正取代 GRIP 的更多细节.
- 像其他专门用于代码搜索的工具一样,ripgrep 默认用于递归目录搜索,并且不会搜索被`.gitignore`文件夹.默认情况下,它也忽略了隐藏文件和二进制文件.RIPGRIP 还实现了对`.gitignore`然而,在其它代码搜索工具中,有许多与该功能相关的 bug 声称提供了相同的功能.
- ReReGRP 可以搜索特定类型的文件.例如,`rg -tpy foo`将搜索限制为 Python 文件`rg -Tjs foo`从搜索中排除 JavaScript 文件.RIPGRIP 可以用自定义匹配规则教给新的文件类型.
- RiReGRP 支持许多特性`grep`例如,显示搜索结果的上下文、搜索多个模式、突出显示具有颜色和全部 Unicode 支持的匹配.与 GNU-GRIP 不同,RIPGRIP 在支持 Unicode(总是在 ON)的同时保持快速.
- RIPGRIP 有可选的支持,以切换其正则表达式引擎使用 PCRe2.除此之外,这使得在模式中使用回头和回头引用成为可能,而这些在 ripgrep 的默认正则表达式引擎中不受支持.启用了 pCRE2 支持`-P`.
- ripgrep 支持以 UTF-8 以外的文本编码搜索文件,例如 UTF-16、拉丁文-1、GBK、EUC-JP、Shift_JIS 等等.提供了自动检测 UTF 16 的一些支持.其他文本编码必须与`-E/--encoding`旗帜)
- ripgrep 支持搜索以通用格式(gzip、xz、lzma、bzip2 或 lz4)压缩的文件,其中`-z/--search-zip`旗帜.
- ripgrep 支持任意的输入预处理过滤器,这些过滤器可以是 PDF 文本提取、较少支持的解压缩、解密、自动编码检测等.

换句话说,如果你喜欢速度,默认的过滤,更少的 bug 和 Unicode 支持,使用 ReReGRP.

### Why shouldn't I use ripgrep?

尽管最初不希望将每个特性都添加到 ripgrep 中,但是随着时间的推移,ripgrep 对其他文件搜索工具中的大多数特性的支持不断增加.这包括搜索跨越多行的结果,以及对 PCRE2 的 opt-in 支持,PCRE2 提供查找和回溯支持.

此时,不使用 ripgrep 的主要原因可能包括以下一个或多个:

- 你需要一个便携的无所不在的工具.尽管 ripgrep 在 Windows、macOS 和 Linux 上工作,但它并不普遍,也不符合 POSIX 等任何标准.做这项工作最好的工具是老好人.
- 在这个 README 中仍然有一些其他特性(或 bug)没有列出,您所依赖的是在 ripgrep 之外的其他工具中.
- 有一个性能边缘情况,RIPGRIP 在其他工具做得不好的地方做得不好.(请提交 bug 报告!)
- RIPGRIP 不可能安装在您的机器上,或者不适用于您的平台.(请提交 bug 报告!)

### Is it really faster than everything else?

一般来说,是的.大量的基准,每一个都有详细的分析.[available on my blog](http://blog.burntsushi.net/ripgrep/).

总之,RIPGRIP 很快,因为:

- 它建在[Rust's regex engine](https://github.com/rust-lang-nursery/regex). Rust 的正则表达式引擎使用有限自动机、SIMD 和积极的文字优化来使搜索非常快.(pCRE2 支持可以与`-P/--pcre2`旗帜)
- Rust 的 regex 库通过将 UTF-8 解码直接构建到其确定性有限自动机引擎中,从而在完全 Unicode 支持下保持性能.
- 它支持使用内存映射或通过使用中间缓冲区递增地搜索进行搜索.前者对于单个文件更好,后者对于大目录更好.RIPGRIP 自动为您选择最佳搜索策略.
- 将您的忽略模式应用于`.gitignore`使用一个文件[`RegexSet`](https://docs.rs/regex/1/regex/struct.RegexSet.html). 这意味着单个文件路径可以同时匹配多个球模式.
- 它使用一个无锁的并行递归目录迭代器[`crossbeam`](https://docs.rs/crossbeam)和[`ignore`](https://docs.rs/ignore).

### Feature comparison

Andy Lester,作者[ack](https://beyondgrep.com/)已发布了一个比较 ack、ag、git-grep、GNU grep 和 ripgrep 特性的优秀表:<https://beyondgrep.com/feature-comparison/>

请注意,ripgrep 最近增加了一些尚未出现在 Andy 表中的重要新特性.这包括但不限于配置文件、passthru、对搜索压缩文件的支持、多行搜索和通过 PCRE2 选择高级正则表达式支持.

### Installation

RIPGRIP 的二进制名是`rg`.

**[Archives of precompiled binaries for ripgrep are available for Windows,
macOS and Linux.](https://github.com/BurntSushi/ripgrep/releases)**以下未明确提到的平台的用户建议下载这些档案中的一个.

Linux 二进制文件是静态可执行文件.Windows 二进制文件可用 MinGW(GNU)或微软 Visual C++(MSVC)构建.如果可能的话,在 GNU 上更喜欢 MSVC,但是你需要有[Microsoft VC++ 2015
redistributable](https://www.microsoft.com/en-us/download/details.aspx?id=48145)安装.

如果你是**麦考斯自酿啤酒**或 A**红葡萄酒**用户,然后可以从 RealBurw 核心安装 ReReGRP,(用 RISE 稳定,没有 SIMD 编译):

```
$ brew install ripgrep
```

或者您可以通过使用定制的抽头来安装每晚用 rust 编译的二进制文件(包括 SIMD 和所有优化):

```
$ brew tap burntsushi/ripgrep https://github.com/BurntSushi/ripgrep.git
$ brew install ripgrep-bin
```

如果你是**麦克波特**用户,然后可以从[official ports](https://www.macports.org/ports.php?by=name&substr=ripgrep):

```
$ sudo port install ripgrep
```

如果你是**橱窗巧克力**用户,然后可以从[official repo](https://chocolatey.org/packages/ripgrep):

```
$ choco install ripgrep
```

如果你是**窗口勺**用户,然后可以从[official bucket](https://github.com/lukesampson/scoop/blob/master/bucket/ripgrep.json):

```
$ scoop install ripgrep
```

如果你是一个**ARCLinux**用户,然后您可以安装 ReReGRP 从官方回购:

```
$ pacman -S ripgrep
```

如果你是**圣母**用户,可以从[official repo](https://packages.gentoo.org/packages/sys-apps/ripgrep):

```
$ emerge sys-apps/ripgrep
```

如果你是**费多拉 27 +**用户,可以从官方存储库安装 RiReGRP.

```
$ sudo dnf install ripgrep
```

如果你是**费多拉 24 +**用户,可以安装 RIPGRIP[copr](https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/):

```
$ sudo dnf copr enable carlwgeorge/ripgrep
$ sudo dnf install ripgrep
```

如果你是一个**燕尾草**用户,可以从[official repo](http://software.opensuse.org/package/ripgrep):

```
$ sudo zypper install ripgrep
```

如果你是**RCEL/CENTOS 7**用户,可以安装 RIPGRIP[copr](https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/):

```
$ sudo yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo
$ sudo yum install ripgrep
```

如果你是**尼克斯**用户,可以安装 RIPGRIP[nixpkgs](https://github.com/NixOS/nixpkgs/blob/master/pkgs/tools/text/ripgrep/default.nix):

```
$ nix-env --install ripgrep
$ # (Or using the attribute name, which is also ripgrep.)
```

如果你是**德比**用户(或 Debian 导数的用户)**乌邦图**然后,可以使用二进制来安装 RIPGRIP.`.deb`文件中提供的每一个[ripgrep release](https://github.com/BurntSushi/ripgrep/releases).

```
$ curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep_0.10.0_amd64.deb
$ sudo dpkg -i ripgrep_0.10.0_amd64.deb
```

如果运行 Debian Buster(当前 Debian 测试)或 Debian SID,RiReGRP 是[officially maintained by Debian](https://tracker.debian.org/pkg/rust-ripgrep).

```
$ sudo apt-get install ripgrep
```

如果你是一个**Ubuntu 宇宙(18.10)**(或更新的)用户,RIPGRIP[available](https://launchpad.net/ubuntu/+source/rust-ripgrep)使用与 Debian 相同的包装:

```
$ sudo apt-get install ripgrep
```

(N.B.Ubuntu 上 ripgrep 的各种快照也是可用的,但是它们似乎都不能正常工作,并且生成许多非常奇怪的 bug 报告,我不知道如何修复,也没有时间修复).因此,它不再是推荐的安装选项.

如果你是**FreeBSD**用户,然后可以从[official ports](https://www.freshports.org/textproc/ripgrep/):

```
# pkg install ripgrep
```

如果你是一个**OpenBSD**用户,然后可以从[official ports](http://openports.se/textproc/ripgrep):

```
$ doas pkg_add ripgrep
```

如果你是**NetBSD**用户,然后可以安装 ReReGRP[pkgsrc](http://pkgsrc.se/textproc/ripgrep):

```
# pkgin install ripgrep
```

如果你是**锈蚀程序员**RIPGRIP 可以安装`cargo`.

- 请注意,RIPGRIP 的最小支持版本的锈是**1.23.0**,虽然 RIPGRIP 可能与旧版本一起工作.
- 请注意,二进制可能大于预期,因为它包含调试符号.这是故意的.若要删除调试符号并因此减少文件大小,请运行`strip`关于二进制.

```
$ cargo install ripgrep
```

当使用 Rust 1.27 或更新版本进行编译时,这将自动启用搜索的 SIMD 优化.

RIPGRIP 目前不在任何其他包库中.[I'd like to change that](https://github.com/BurntSushi/ripgrep/issues/10).

### Building

RiReGRP 是用锈写的,所以你需要抓取一个[Rust installation](https://www.rust-lang.org/)为了编纂它.RiReGRP 与锈 1.20.0(稳定)或更新.一般来说,RiReGRP 跟踪 RISE 编译器的最新稳定版本.

建立 RIPGRIP:

```
$ git clone https://github.com/BurntSushi/ripgrep
$ cd ripgrep
$ cargo build --release
$ ./target/release/rg --version
0.1.3
```

如果您有一个 Rust 夜间编译器和最近的 Intel CPU,那么您可以启用额外的可选 SIMD 加速,如下所示:

```
RUSTFLAGS="-C target-cpu=native" cargo build --release --features 'simd-accel avx-accel'
```

如果您的机器不支持 AVX 指令,则只需删除`avx-accel`从特征列表中.类似于 SIMD(它大致对应于 SSE 指令).

这个`simd-accel`和`avx-accel`在某些 ripgrep 依赖项中支持 SIMD(负责计算行数和转码).它们不需要获得 SIMD 搜索优化;那些是自动启用的.希望有一天,`simd-accel`和`avx-accel`特征也将变得不必要.

最后,通过启用 RIPGRIP,可以构建可选的 PCRe2 支持.`pcre2`特点:

```
$ cargo build --release --features 'pcre2'
```

(提示:使用`--features 'pcre2 simd-accel avx-accel'`还包括编译时 SIMD 优化,这将只适用于夜间编译器.

启用 PCRE2 特性可以与稳定的 Rust 编译器一起工作,并将尝试通过以下方式自动查找并链接到系统的 PCRE2 库`pkg-config`. 如果不存在,那么 ripgrep 将使用系统的 C 编译器从源代码构建 PCRE2,然后静态地将其链接到最终的可执行文件中.即使存在可用的 PCRE2 系统库,也可以通过构建具有 MUSL 目标的 ripgrep 或通过设置强制静态链接`PCRE2_SYS_STATIC=1`.

ripgrep 可以通过首先在您的系统上安装 MUSL 库(咨询您友好的邻居包管理器)在 Linux 上用 MUSL 目标构建.然后,您只需要将 MUSL 支持添加到 Rust 工具链并重新构建 ripgrep,它生成一个完全静态的可执行文件:

```
$ rustup target add x86_64-unknown-linux-musl
$ cargo build --release --target x86_64-unknown-linux-musl
```

应用`--features`上面的旗帜如愿以偿.如果您想用 Myl 和 pCRE2 构建静态可执行文件,那么您将需要`musl-gcc`已安装,它可能位于与实际 MUSL 库分开的包中,这取决于您的 Linux 发行版.

### Running tests

RIPGRIP 是比较好的测试,包括单元测试和集成测试.若要运行完整的测试套件,请使用:

```
$ cargo test --all
```

从存储库的根目录.
