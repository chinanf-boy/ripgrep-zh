## 常问问题

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [ripgrep 支持 配置文件吗？](#ripgrep-%E6%94%AF%E6%8C%81-%E9%85%8D%E7%BD%AE%E6%96%87%E4%BB%B6%E5%90%97)
- [ripgrep 有啥变化？](#ripgrep-%E6%9C%89%E5%95%A5%E5%8F%98%E5%8C%96)
- [下一次发布，是什么时候？](#%E4%B8%8B%E4%B8%80%E6%AC%A1%E5%8F%91%E5%B8%83%E6%98%AF%E4%BB%80%E4%B9%88%E6%97%B6%E5%80%99)
- [ripgrep 是否 有 man 页面？](#ripgrep-%E6%98%AF%E5%90%A6-%E6%9C%89-man-%E9%A1%B5%E9%9D%A2)
- [ripgrep 是否支持 shell-Tab 补全？](#ripgrep-%E6%98%AF%E5%90%A6%E6%94%AF%E6%8C%81-shell-tab-%E8%A1%A5%E5%85%A8)
- [我要怎么得到，连贯顺序的结果？](#%E6%88%91%E8%A6%81%E6%80%8E%E4%B9%88%E5%BE%97%E5%88%B0%E8%BF%9E%E8%B4%AF%E9%A1%BA%E5%BA%8F%E7%9A%84%E7%BB%93%E6%9E%9C)
- [我要如何搜索不是 UTF-8 编码的文件？](#%E6%88%91%E8%A6%81%E5%A6%82%E4%BD%95%E6%90%9C%E7%B4%A2%E4%B8%8D%E6%98%AF-utf-8-%E7%BC%96%E7%A0%81%E7%9A%84%E6%96%87%E4%BB%B6)
- [我要如何搜索压缩文件？](#%E6%88%91%E8%A6%81%E5%A6%82%E4%BD%95%E6%90%9C%E7%B4%A2%E5%8E%8B%E7%BC%A9%E6%96%87%E4%BB%B6)
- [我要如何搜索 多行内容？](#%E6%88%91%E8%A6%81%E5%A6%82%E4%BD%95%E6%90%9C%E7%B4%A2-%E5%A4%9A%E8%A1%8C%E5%86%85%E5%AE%B9)
- [如何使用 lookaround 和/或 backreferences？](#%E5%A6%82%E4%BD%95%E4%BD%BF%E7%94%A8-lookaround-%E5%92%8C%E6%88%96-backreferences)
- [怎么配置 ripgrep 的 颜色？](#%E6%80%8E%E4%B9%88%E9%85%8D%E7%BD%AE-ripgrep-%E7%9A%84-%E9%A2%9C%E8%89%B2)
- [如何在 Windows 上启用真彩色？](#%E5%A6%82%E4%BD%95%E5%9C%A8-windows-%E4%B8%8A%E5%90%AF%E7%94%A8%E7%9C%9F%E5%BD%A9%E8%89%B2)
- [当我杀死它时，如何防止 ripgrep 弄乱颜色？](#%E5%BD%93%E6%88%91%E6%9D%80%E6%AD%BB%E5%AE%83%E6%97%B6%E5%A6%82%E4%BD%95%E9%98%B2%E6%AD%A2-ripgrep-%E5%BC%84%E4%B9%B1%E9%A2%9C%E8%89%B2)
- [我该怎么绕过 正则式 的大小限制呢？](#%E6%88%91%E8%AF%A5%E6%80%8E%E4%B9%88%E7%BB%95%E8%BF%87-%E6%AD%A3%E5%88%99%E5%BC%8F-%E7%9A%84%E5%A4%A7%E5%B0%8F%E9%99%90%E5%88%B6%E5%91%A2)
- [如何让 <code>-f/--file</code> 标志更快？](#%E5%A6%82%E4%BD%95%E8%AE%A9-code-f--filecode-%E6%A0%87%E5%BF%97%E6%9B%B4%E5%BF%AB)
- [如何使输出看起来像 Silver Searcher 的输出？](#%E5%A6%82%E4%BD%95%E4%BD%BF%E8%BE%93%E5%87%BA%E7%9C%8B%E8%B5%B7%E6%9D%A5%E5%83%8F-silver-searcher-%E7%9A%84%E8%BE%93%E5%87%BA)
- [为什么启用 PCRE2 正则式 时，ripgrep 会变慢？？](#%E4%B8%BA%E4%BB%80%E4%B9%88%E5%90%AF%E7%94%A8-pcre2-%E6%AD%A3%E5%88%99%E5%BC%8F-%E6%97%B6ripgrep-%E4%BC%9A%E5%8F%98%E6%85%A2)
- [当我运行<code>rg</code>时，它为什么执行其他命令？](#%E5%BD%93%E6%88%91%E8%BF%90%E8%A1%8Ccodergcode%E6%97%B6%E5%AE%83%E4%B8%BA%E4%BB%80%E4%B9%88%E6%89%A7%E8%A1%8C%E5%85%B6%E4%BB%96%E5%91%BD%E4%BB%A4)
- [如何在 Windows 上 为 ripgrep 创建别名？](#%E5%A6%82%E4%BD%95%E5%9C%A8-windows-%E4%B8%8A-%E4%B8%BA-ripgrep-%E5%88%9B%E5%BB%BA%E5%88%AB%E5%90%8D)
- [如何创建 PowerShell 配置文件？](#%E5%A6%82%E4%BD%95%E5%88%9B%E5%BB%BA-powershell-%E9%85%8D%E7%BD%AE%E6%96%87%E4%BB%B6)
- [Windows 如何将 非 ASCII 内容传输到 ripgrep？](#windows-%E5%A6%82%E4%BD%95%E5%B0%86-%E9%9D%9E-ascii-%E5%86%85%E5%AE%B9%E4%BC%A0%E8%BE%93%E5%88%B0-ripgrep)
- [如何用 ripgrep 搜索并替换？](#%E5%A6%82%E4%BD%95%E7%94%A8-ripgrep-%E6%90%9C%E7%B4%A2%E5%B9%B6%E6%9B%BF%E6%8D%A2)
- [Ripgrep 是如何获得许可的？](#ripgrep-%E6%98%AF%E5%A6%82%E4%BD%95%E8%8E%B7%E5%BE%97%E8%AE%B8%E5%8F%AF%E7%9A%84)
- [Ripgrep 能代替 grep 吗？](#ripgrep-%E8%83%BD%E4%BB%A3%E6%9B%BF-grep-%E5%90%97)
- [“ripgrep”中的“rip”是什么意思？](#ripgrep%E4%B8%AD%E7%9A%84rip%E6%98%AF%E4%BB%80%E4%B9%88%E6%84%8F%E6%80%9D)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

### ripgrep 支持 配置文件吗？

是。见[配置文件的 指南部分](GUIDE.zh.md#configuration-file).

### ripgrep 有啥变化？

请咨询 ripgrep 的 [CHANGELOG](https://github.com/BurntSushi/ripgrep/blob/master/CHANGELOG.md).

### 下一次发布，是什么时候？

ripgrep 是一个贡献者都是志愿者的项目。发布的时间表，给所述志愿者增加了不适当的压力。因此,发布是在尽力而为的基础上进行的，没有**永远指定的**日期。

一个例外，是高影响力的错误。如果 ripgrep 版本包含显着的性能退步，那么通常会强烈 push 修补程序，以此发布修补程序。

### ripgrep 是否 有 man 页面？

是! 每当 ripgrep 在一个系统上编译，而`asciidoc`又存在时，那么就会从 ripgrep 的 argv 解析器生成一个 man 页。编译 ripgrep 之后，您可以从存储库的根目录中找到这样的 man 页:

```
$ find ./target -name rg.1 -print0 | xargs -0 ls -t | head -n1
./target/debug/build/ripgrep-79899d0edd4129ca/out/rg.1
```

运行`man -l ./target/debug/build/ripgrep-79899d0edd4129ca/out/rg.1`将在您的普通寻呼机中显示 man 页.

请注意，man 页的选项文档等同于显示的输出`rg --help`。要查看更多精简文档(每个标志一行)，请运行`rg -h`。

man 页也包含所有[ripgrep 二进制版本](https://github.com/BurntSushi/ripgrep/releases)内容。

### ripgrep 是否支持 shell-Tab 补全？

是! 在构建 ripgrep 之后，可以在[同一目录下的 manpage](#manpage)找到。Zsh 补全被分开维护，并提交到`complete/_rg`存储库中。

shell 补全也包括所有[ripgrep binary releases](https://github.com/BurntSushi/ripgrep/releases)内容。

对于**bash**，移动`rg.bash`至`$XDG_CONFIG_HOME/bash_completion`要么`/etc/bash_completion.d/`.

对于**fish**，移动`rg.fish`至`$HOME/.config/fish/completions/`.

对于**zsh**，移动`_rg`给你的一个`$fpath`目录.

对于**PowerShell**，添加`. _rg.ps1`到你的 PowerShell[profile](<https://technet.microsoft.com/en-us/library/bb613488(v=vs.85).aspx>)(注意领头的符号)。如果`_rg.ps1`文件不在`PATH`，用`. /path/to/_rg.ps1`代替。

### 我要怎么得到，连贯顺序的结果？

默认情况下，ripgrep 使用并行性来执行搜索，这在大多数现代系统上搜索速度更快。反过来说，意味着 ripgrep 具有不确定性，因为在程序执行期间，线程的交叉本身是非确定性的。这具有以某种任意顺序的方式，打印出结果，并且该顺序，会在 ripgrep 的运行中改变。

要使结果顺序一致的唯一方法，是让 ripgrep 对输出进行排序。就目前而言，会禁用所有并行。(在较小的存储库中，您可能没有注意到性能差异!)您可以使用`--sort path`标志，顺序打印。

这里有关于这个主题的更多讨论:<https://github.com/BurntSushi/ripgrep/issues/152>

### 我要如何搜索不是 UTF-8 编码的文件？

见[文件编码的指南](GUIDE.zh.md#file-encoding).

### 我要如何搜索压缩文件？

ripgrep 的`-z/--search-zip`标志，会自动搜索压缩文件。目前而言，仅支持`gzip, bzip2, xz, lzma, lz4, Brotli 和 Zstd`，并且需要系统，安装相应的`gzip`, `bzip2`, `xz`,
`lz4`, `brotli` 和 `zstd`二进制可执行文件。(也就是说，ripgrep 是通过终端的另一个进程，来进行解压缩，再进入(压缩)里面寻找的。)

ripgrep 目前不搜索的存档格式，`*.tar.gz`之类，会跳过。

### 我要如何搜索 多行内容？

`-U/--multiline` 标志，能让 ripgrep ，报告扫描多行的结果.

### 如何使用 lookaround 和/或 backreferences？

ripgrep 的默认正则表达式引擎，不支持环视(lookaround)或反向引用(backreferences)。这主要是因为默认的正则表达式引擎是，使用有限状态机实现的，以保证所有输入的线性最坏情况时间复杂度。在这种范例中无法实现反向引用，且看起来，很难有效地执行。

但是，ripgrep 可选择支持使用 PCRE2 作为正则表达式引擎，而不是基于有限状态机的默认引擎。您可以使用`-P/--pcre2`标志，启用 PCRE2 。例如，在 ripgrep 存储库 的根目录中，您可以轻松找到所有回文:

```
$ rg -P '(\w{10})\1'
tests/misc.rs
483:    cmd.arg("--max-filesize").arg("44444444444444444444");
globset/src/glob.rs
1206:    matches!(match7, "a*a*a*a*a*a*a*a*a", "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
```

如果您的 ripgrep 版本不支持 PCRE2，那么当您尝试使用`-P/--pcre2`标志时，您将收到错误消息:

```
$ rg -P '(\w{10})\1'
PCRE2 is not available in this build of ripgrep
```

来自 GitHub 的 ripgrep 项目的，大多数版本，都与 PCRE2 捆绑在一起。如果你是用不同方式安装的 ripgrep(比如系统的软件包管理器)，那么请联系该软件包的维护者，看看是否可以启用 PCRE2 功能。

### 怎么配置 ripgrep 的 颜色？

ripgrep 有两个与颜色相关的标志:

- `--color`控制*某时*使用颜色.
- `--colors`控制*某个*要使用的颜色.

`--color`标志 接受以下可能值之一:`never`，`auto`，`always`要么`ansi`。`auto`是默认值，将导致 ripgrep 仅在打印到终端时，才启用颜色。但是，如果你将 ripgrep 传输到文件或其他进程，那么它将抑制颜色。

`--colors`标志有点复杂。一般格式是:

```
--colors '{type}:{attribute}:{value}'
```

- `{type}`应该是`path`，`line`，`column`要么`match`其中之一。这每一个都对应 ripgrep 在其输出中，添加颜色的四种不同类型的事物。选择要更改其颜色的类型。
- `{attribute}`应该是`fg`，`bg`要么`style`其中之一，对应前景色，背景色或其他样式(例如是否粗体输出)。
- `{value}`是由`{attribute}`值决定的。如果`{attribute}`是`style`， 然后`{value}`应该是`nobold`，`bold`，`nointense`，`intense`，`nounderline`要么`underline`其中之一。如果`{attribute}`是`fg`要么`bg`， 然后`{value}`应该是一种颜色。

颜色由八个英文名称，一个 256 位数字，或一个 RGB 三元组中的任何一个指定(具有超过 1600 万个可能的值，或"真彩色")。

颜色名称是`red`，`blue`，`green`，`cyan`，`magenta`，`yellow`，`white`要么`black`。

单个 256 位数是 0-255(含)范围内的值。它可以是十进制格式(例如，`62`)或十六进制格式(例如，`0x3E`)。

RGB 三元组对应，逗号分隔的三个数字(十进制或十六进制)。

作为特例，`--colors '{type}:none'`将清除`{type}`相关的所有颜色和样式，它允许你从一个干净的白纸开始(而不是建立在 ripgrep 的默认颜色设置之上)。

这是一个使用粗体白色文本，高亮匹配的蓝色背景的示例:

```
$ rg somepattern \
    --colors 'match:none' \
    --colors 'match:bg:0x33,0x66,0xFF' \
    --colors 'match:fg:white' \
    --colors 'match:style:bold'
```

在[配置文件](GUIDE.zh.md#configuration-file)上，设置你的理想选择颜色。见[模仿 The Silver Searcher's 输出颜色的问题](#silver-searcher-output)，其中有关颜色的示例.

### 如何在 Windows 上启用真彩色？

首先，看看上一个问题的[配置颜色回答](#colors).

其次，Windows 上的着色有点复杂。如果您正在使用像 Cygwin 这样的终端，那么很可能真彩色，支持已经开箱即用。但是，如果您使用的是普通的 Windows 控制台(`cmd`要么`PowerShell`)和 Windows 10 之前的版本，然后没有已知的方法来获得真彩色支持。如果您使用的是 Windows 10 ，并使用 Windows 控制台，那么真彩色应该是开箱即用的，但有一点需要注意:您可能需要先清除 ripgrep 的默认颜色设置。也就是说，不是这样:

```
$ rg somepattern --colors 'match:fg:0x33,0x66,0xFF'
```

你应该做这个

```
$ rg somepattern --colors 'match:none' --colors 'match:fg:0x33,0x66,0xFF'
```

这是因为 ripgrep 可能会为`match`至`bold`设置默认样式，似乎 Windows 10 的 VT100 的支持，不允许同时使用粗体和真彩色 ANSI 转义。上面的解决方法将清除 ripgrep 的默认样式，允许您根据需要精确地制作它.

### 当我杀死它时，如何防止 ripgrep 弄乱颜色？

输入`color`在 cmd.exe(命令提示符)，和在类 Unix 系统上`echo -ne "\033[0m"`恢复原始前景色.

在 PowerShell 中，您可以将以下代码添加到配置文件中，以便调用`Reset-ForegroundColor`恢复原始前景色。其中的`Set-Alias`那行会允许您用`color`，就可以简单调用恢复。

```powershell
$OrigFgColor = $Host.UI.RawUI.ForegroundColor
function Reset-ForegroundColor {
	$Host.UI.RawUI.ForegroundColor = $OrigFgColor
}
Set-Alias -Name color -Value Reset-ForegroundColor
```

PR[#187](https://github.com/BurntSushi/ripgrep/pull/187)修复此问题，后来又被[#281](https://github.com/BurntSushi/ripgrep/issues/281)弃用了。[这里](https://github.com/BurntSushi/ripgrep/issues/281#issuecomment-269093893)有完整的解释。

### 我该怎么绕过 正则式 的大小限制呢？

如果你给 ripgrep 一个特别大的模式(或大量的小模式)，那么它可能无法编译，因为它达到了预设的限制。例如:

```
$ rg '\pL{1000}'
Compiled regex exceeds size limit of 10485760 bytes.
```

(注意:`\pL{1000}`可能看起来很小，但是`\pL`是包含所有 Unicode 字母的字符类，它非常大。*且*它重复了 1000 次.)

在这种情况下，您可以通过简单地增加限制来解决:

```
$ rg '\pL{1000}' --regex-size-limit 1G
```

将限制增加到 1GB 并不一定意味着 ripgrep 将使用那么多内存。限制标志只是说它允许(大致)使用那么多内存，来构造正则表达式。

### 如何让 <code>-f/--file</code> 标志更快？

该`-f/--file`允许给 ripgrep 一个文件，每个行包含一个模式。然后 ripgrep 会报告任何匹配该模式的行。

如果这个模式文件太大，那么 ripgrep 可能会大幅减速。*通常*这是因为内部缓存太小，并且会导致 ripgrep 换成更慢，但更强大的正则表达式引擎。如果这确成为了问题，那就可以增加此缓存，并重新获得速度。缓存可以通过`--dfa-size-limit`标志。例如，使用`--dfa-size-limit 1G`将缓存大小设置为 1GB。(请注意，这并不意味着 ripgrep 会自动使用 1GB 内存，但如果需要，它将允许正则表达式引擎使用。)

### 如何使输出看起来像 Silver Searcher 的输出？

使用`--colors`标志，像这样:

```
rg --colors line:fg:yellow      \
   --colors line:style:bold     \
   --colors path:fg:green       \
   --colors path:style:bold     \
   --colors match:fg:black      \
   --colors match:bg:yellow     \
   --colors match:style:nobold  \
   foo
```

或者，将您的颜色配置添加到您的 ripgrep 配置文件(通过设置`RIPGREP_CONFIG_PATH`环境变量，指向您的配置文件)。例如:

```
$ cat $HOME/.config/ripgrep/rc
--colors=line:fg:yellow
--colors=line:style:bold
--colors=path:fg:green
--colors=path:style:bold
--colors=match:fg:black
--colors=match:bg:yellow
--colors=match:style:nobold
$ RIPGREP_CONFIG_PATH=$HOME/.config/ripgrep/rc rg foo
```

### 为什么启用 PCRE2 正则式 时，ripgrep 会变慢？？

当你使用`--pcre2`(简写用`-P`)标志，ripgrep 将使用 PCRE2 正则表达式引擎而不是默认值。两个正则表达式引擎都非常快，但 PCRE2 提供了许多其他功能，例如许多人喜欢使用的环视和反向引用（look-around 和
backreferences）。这主要是因为 PCRE2 使用回溯实现，其中默认正则表达式引擎使用基于有限自动机的实现。前者比后者，添加了大量铃声和口哨的能力，但后者在最坏情况，亦为线性时间复杂度执行。

> 译者: [环视: 在知乎找了个说明文](https://zhuanlan.zhihu.com/p/50789818)

伴随着使用`-P`的 ripgrep，您可能已经注意到，它可能会变慢。导致的原因是复杂的，因为 ripgrep 实现快速搜索的优化，很复杂。

ripgrep 之前的任务有点简单; 它需要做的就是在文件中，搜索某些模式的出现，然后打印包含这些模板的行。因此，问题在于什么是有效的匹配，以及我们如何从文件中读取字节。

就所谓的有效匹配而言，请记住 ripgrep 默认只报告，单行的匹配。这里的问题是一些模式可以匹配多行，而 ripgrep 需要防止这种情况发生。例如，`foo\sbar`会匹配`foo\nbar`。实现这个，最明显的方法是，从文件中读取数据，然后对每行的数据，进行模式搜索。这种方法的问题在于它可能非常慢; 让模式搜索尽可能多的数据要快得多。这样更快，因为它摆脱了寻找每一行边缘情况的开销，也因为它摆脱了每行模式搜索开始和停止的开销。(这是在一般假设下运行，即匹配的行，比非匹配行要少得多。)

事实证明，更快的方法是，我们可以通过对模式进行非常简单的限制:*静态禁用*来自匹配`\n`字符的模式。即，当给出类似模式`foo\sbar`时，ripgrep 将自动从`\s`（匹配）字符类移除`\n`(静态字符)。在某些情况下，简单的去除并不容易。例如，在模式包含一个`\n`字面量，ripgrep 将会返回一个错误。:

```
$ rg '\n'
the literal '"\n"' is not allowed in a regex
```

那么这与 PCRE2 有什么关系呢？ 是这样的，ripgrep 的默认正则表达式引擎公开的 API，以一种非常容易的方式对模式进行语法分析，可以从模式中剥离`\n`(或以其他方式检测，如果剥离是不可能的，就报告错误)。PCRE2 似乎没有提供类似的 API，所以当启用 PCRE2 时，ripgrep 不执行任何剥离。这迫使 ripgrep 使用"慢"的搜索策略，单独搜索每行。

那么，如果 PCRE2 的启用，会让默认的搜索方法变慢，是因为它强制限制匹配单行，那么为什么 PCRE2 在执行多行搜索时有时也会变慢呢？PCRE2 可能比默认的 regex 引擎慢，有*多个*原因。这一次，要怪 PCRE2 的 Unicode 支持，ripgrep 会默认启用。特别地，PCRE2 不能即启用 Unicode 支持，又同时搜索任意数据。也就是说，当启用了 PCRE2 的 Unicode 支持时，数据**必须**是有效的 UTF-8(否则，将调用未定义的行为)。这与 ripgrep 的默认 regex 引擎形成对比，因其是可以支持 Unicode ，同时搜索任意数据。ripgrep 的默认 regex 引擎只是简单，把无效的 UTF-8 不匹配，只匹配有效的 UTF-8。为什么 PCRE2 不能这么做？这个作者不熟悉它的内部结构，所以我们在这里，不讨论它。

这里的底线是，要启用 PCRE2 的 Unicode 支持，同时确保我们正在搜索的是有效 UTF-8，且不会导致性能损失。具体做法是，ripgrep 把每个文件的内容转换为 UTF-8，同时让 Unicode 代码点，替换无效的 UTF-8 数据。ripgrep 然后，禁用 PCRE2 本身内部的 UTF-8 检查，因为我们已经保证了所传递的数据，是有效的 UTF-8。ripgrep 采用此方法的原因是，如果我们让 未知 UTF-8 到达 PCRE2 ，那么如果遇到无效 UTF-8 序列，它将报告一个匹配错误。这对 ripgrep 来说，不是好消息，因为它将停止搜索文件的其余部分，并且还将向用户打印，不希望存在的错误消息。

好的，如果您还不熟悉 ripgrep 内部，那么上面列出的信息很多。让我们用一些例子，来具体说明。首先，让我们得到一些足够大的数据，来放大性能差异:

```
$ curl -O 'https://burntsushi.net/stuff/subtitles2016-sample.gz'
$ gzip -d subtitles2016-sample
$ md5sum subtitles2016-sample
e3cb796a20bbc602fbfd6bb43bda45f5   subtitles2016-sample
```

要搜索此数据，我们将使用该模式`^\w{42}$`，它在文件中，只'命中'一个，并且没有字面量(literals)。没有字面量很重要，因为它确保 regex 引擎不会使用字面量优化，来加速搜索。换句话说，它让我们能够一致确定，regex 引擎正在执行的实际任务。

现在让我们根据上面的信息来浏览几个例子。首先，让我们考虑使用 ripgrep 的默认 regex 引擎进行默认搜索，然后使用 PCRE2 进行相同的搜索:

```
$ time rg '^\w{42}$' subtitles2016-sample
21225780:EverymajordevelopmentinthehistoryofAmerica

real    0m1.783s
user    0m1.731s
sys     0m0.051s

$ time rg -P '^\w{42}$' subtitles2016-sample
21225780:EverymajordevelopmentinthehistoryofAmerica

real    0m2.458s
user    0m2.419s
sys     0m0.038s
```

在这个特定的示例中，两种模式搜索都使用 Unicode，感知`\w`字符类和都在计算行数，以便报告行数。这里的关键区别在于，第一次搜索不会逐行搜索，而第二次搜索会。我们可以观察 ripgrep 使用的策略是什么？通过`--trace`标志:

```
$ rg '^\w{42}$' subtitles2016-sample --trace
[... snip ...]
TRACE|grep_searcher::searcher|grep-searcher/src/searcher/mod.rs:622: Some("subtitles2016-sample"): searching via memory map
TRACE|grep_searcher::searcher|grep-searcher/src/searcher/mod.rs:712: slice reader: searching via slice-by-line strategy
TRACE|grep_searcher::searcher::core|grep-searcher/src/searcher/core.rs:61: searcher core: will use fast line searcher
[... snip ...]

$ rg -P '^\w{42}$' subtitles2016-sample --trace
[... snip ...]
TRACE|grep_searcher::searcher|grep-searcher/src/searcher/mod.rs:622: Some("subtitles2016-sample"): searching via memory map
TRACE|grep_searcher::searcher|grep-searcher/src/searcher/mod.rs:705: slice reader: needs transcoding, using generic reader
TRACE|grep_searcher::searcher|grep-searcher/src/searcher/mod.rs:685: generic reader: searching via roll buffer strategy
TRACE|grep_searcher::searcher::core|grep-searcher/src/searcher/core.rs:63: searcher core: will use slow line searcher
[... snip ...]
```

第一种是使用"快速行搜索器（will use fast line searcher）"，而后一种是使用"慢速行搜索器（will use slow line searcher）".

有趣的是，在这种情况下，模式不匹配`\n`，并且我们正在搜索的文件是有效的 UTF-8，所以不需要慢速逐行搜索策略和解码。我们可以用更好的 PCRE2 内联 API ，来解决前一个问题。事实上，我们可以解决 ripgrep 的后一个问题`--no-encoding`标志，它阻止 UTF-8 的自动解码，但是将启用 PCRE2 自己的 UTF-8 有效性检查。不幸的是，我 ripgrep 构建版本中，速度较慢:

```
$ time rg -P '^\w{42}$' subtitles2016-sample --no-encoding
21225780:EverymajordevelopmentinthehistoryofAmerica

real    0m3.074s
user    0m3.021s
sys     0m0.051s
```

(提示:使用`--trace`标志，以验证 ripgrep 中没有解码)。

PCRE2 的 UTF-8 检查较慢的一个可能原因是，它可能不比 ripgrep 本身 UTF-8 解码更优化 —— [`encoding_rs`](https://github.com/hsivonen/encoding_rs)库。此外，我的 ripgrep 构建版本中的`encoding_rs`，是启动了 SIMD 优化的，可能在这里发挥作用。

另外，请注意使用`--no-encoding`标志，可能导致 PCRE2 报告无效的 UTF-8 错误，这导致 ripgrep 停止搜索文件:

```
$ cat invalid-utf8
foobar

$ xxd invalid-utf8
00000000: 666f 6fff 6261 720a                      foo.bar.

$ rg foo invalid-utf8
1:foobar

$ rg -P foo invalid-utf8
1:foo�bar

$ rg -P foo invalid-utf8 --no-encoding
invalid-utf8: PCRE2: error matching: UTF-8 error: illegal byte (0xfe or 0xff)
```

好，所以在这一点上，您可能认为我们可以通过启用多行搜索，来消除逐行搜索的惩罚。毕竟，我们的特定模式无论如何，**不能跨多行**匹配，所以我们仍然会得到我们想要的结果。让我们试试看:

```
$ time rg -U '^\w{42}$' subtitles2016-sample
21225780:EverymajordevelopmentinthehistoryofAmerica

real    0m1.803s
user    0m1.748s
sys     0m0.054s

$ time rg -P -U '^\w{42}$' subtitles2016-sample
21225780:EverymajordevelopmentinthehistoryofAmerica

real    0m2.962s
user    0m2.246s
sys     0m0.713s
```

搜索时间与默认的 regex 引擎保持相同，但 PCRE2 搜索*更慢*。 发生了什么事？秘密可以用`--trace`标记再次找寻。在前一种情况中，ripgrep 实际上，检测到模式不能跨多行匹配，因此将回到"快速行搜索"策略，就像搜索没有`-U`的情况下一样。

然而，对于 PCRE2 来说，情况就更糟了。就是说，由于 Unicode 模式依然启用，所以 ripgrep 仍然要对 UTF-8 进行解码，以确保它只将有效的 UTF-8 交给 PCRE2。不幸的是，多行搜索的一个关键缺点是， ripgrep 不能增量进行。由于匹配可以任意长度，因此 ripgrep 实际上需要一次性，搞到内存中的整个文件。通常，我们可以为此使用内存映射，但是因为我们需要在搜索文件之前，对文件进行 UTF-8 解码，所以 ripgrep 在执行搜索之前，文件的全部内容已经读取到堆上。Owch

好吧，Unicode 在这里击败了我们。若我们正在搜索的文件*主要*是 ASCII 编码，所以也许我们能接受，错失一些数据。(试一试`rg '[\w--\p{ascii}]'`看到 非 ASCII 文字，因 ASCII 字符`\w`类会 miss。) 我们可以在两个搜索中禁用 Unicode，但是，根据不同的 regex 引擎:

```
$ time rg '(？-u)^\w{42}$' subtitles2016-sample
21225780:EverymajordevelopmentinthehistoryofAmerica

real    0m1.714s
user    0m1.669s
sys     0m0.044s

$ time rg -P '^\w{42}$' subtitles2016-sample --no-pcre2-unicode
21225780:EverymajordevelopmentinthehistoryofAmerica

real    0m1.997s
user    0m1.958s
sys     0m0.037s
```

在大多数情况下，ripgrep 默认的 regex 引擎执行相同的操作。PCRE2 确实多了些东西，但现在几乎和默认的 regex 引擎一样快。如果你看的`--trace`输出，你会看到 ripgrep 不再执行 UTF-8 解码，但是它仍然使用缓慢的逐行搜索器.

此时，我们可以结合上面的所有招式：让我们通过启用多行模式来，尝试摆脱缓慢的逐行搜索，并通过禁用 Unicode 支持，来停止 UTF-8 解码:

```
$ time rg -U '(？-u)^\w{42}$' subtitles2016-sample
21225780:EverymajordevelopmentinthehistoryofAmerica

real    0m1.714s
user    0m1.655s
sys     0m0.058s

$ time rg -P -U '^\w{42}$' subtitles2016-sample --no-pcre2-unicode
21225780:EverymajordevelopmentinthehistoryofAmerica

real    0m1.121s
user    0m1.071s
sys     0m0.048s
```

啊，PCRE2 的 JIT 在发光啊！ripgrep 的默认 regex 引擎，再次保持不变，但是 PCRE2 不再需要逐行搜索，也不再需要执行任何类型的 UTF-8 检查。这允许文件以令人印象深刻的速度，映射内存并传递给 PCRE2 的 JIT。(一个简单而有趣的历史记录，"内存映射+多行+非 Unicode"的配置正是 Silver Searcher 使用的配置。而这个分析，也许可以解释为什么这种配置是有用的！)

总之，如果希望 PCRE2 尽可能快，和你并不关心 Unicode，也不关心可能跨越多行的匹配，则让`-U`启用多行模式，并让`--no-pcre2-unicode`标志，禁用 PCRE2 的 Unicode 支持。

警告清空器: 此作者不是 PCRE2 专家，因此可能有一些 API ，有作者错过的性能提高。类似地，可能存在更适合搜索工具，如同 PCRE2 工作方式的替代设计。

### 当我运行<code>rg</code>时，它为什么执行其他命令？

很可能你有一个 shell 别名，甚至另一个工具也叫`rg`的干扰。运行`which rg`看看它是什么。

(特别是 Rails 插件[Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins#rails)，会建立`rails generate`的一个`rg`别名)

像这样的问题可以通过以下几种方式来解决:

- 如果您使用的是 OMZ Rails 插件，则通过编辑在 ZSH 配置中的`plugins`数组，禁用它。
- 暂时绕过现有的`rg`别名，通过`command rg`，`\rg`或`'rg'`调用 ripgrep。
- 暂时绕过现有别名或另一个`rg`工具，通过调用 ripgrep 的完整路径(例如`/usr/bin/rg`或`/usr/local/bin/rg`)
- 永久禁用现有的`rg`别名，通过添加`unalias rg`到 shell 配置文件的底部(例如，`.bash_profile`或`.zshrc`)
- 通过在 shell 配置文件的底部添加如下行，让 ripgrep 与其他工具/别名不冲突:`alias ripgrep='command rg'`。

### 如何在 Windows 上 为 ripgrep 创建别名？

通常，您可以找到为使用大量设置指令的命令，创建别名的必要性。但是 Posishell 函数别名，并不象典型的 Linux shell 别名。你总要需要传播参数和`stdin`输入。但不能像`function grep() { $input | rg.exe --hidden $args }`一样简单

使用下面的示例，作为如何在 PowerShell 中，设置别名的参考。

```powershell
function grep {
    $count = @($input).Count
    $input.Reset()

    if ($count) {
        $input | rg.exe --hidden $args
    }
    else {
        rg.exe --hidden $args
    }
}
```

PowerShell 特殊变量:

- `input` - 是 PowerShell 的`stdin`，允许您访问其内容的对象。
- `args` - 是传递给这个函数的参数数组。

这个别名(函数)，检查`stdin`的`input`是否存在，和仅当有时，才传播给`rg.exe`。否则空`$input`，将使 PowerShell 触发，`rg`搜索空`stdin`。

### 如何创建 PowerShell 配置文件？

要在启动时，定制 powershell，必须创建一个特殊的 powershell 脚本。为了找到它的位置，见[Microsoft's 文档](<https://technet.microsoft.com/en-us/library/bb613488(v=vs.85).aspx>)的`$profile`类型，了解更多细节。

这个文件中的任何 PowerShell 代码，在控制台的开始时被执行。这样，您可以在开始时，创建自己的别名。

### Windows 如何将 非 ASCII 内容传输到 ripgrep？

当在 PowerShell 中将输入管道化，到本地可执行文件时，输入的编码由`$OutputEncoding`变量控制。默认设置为 US-ASCII，并且管道中，不为 US-ASCII 编码的任何字符，都被转换为`?`(问号)字符。

若要更改此设置，请设置`$OutputEncoding`成，`.NET`编码对象表示的不同编码。下面是一些常见的例子。当 PowerShell 重新启动时，该变量的值被重置，因此每次启动 PowerShell 时，都要将设置变量的行添加到 PowerShell 配置文件中，以使此更改生效。

例子`$OutputEncoding`设置:

- 没有 BOM 的 UTF-8:`$OutputEncoding = [System.Text.UTF8Encoding]::new()`
- 控制台的输出编码:`$OutputEncoding = [System.Console]::OutputEncoding`

如果编码问题还是存在，可以强制控制台，打印成 UTF-8 编码：`[System.Console]::OutputEncoding = [System.Text.Encoding]::UTF8`。 当重新启动 PowerShell 时，这也将重置，因此如果希望使设置永久化，也可以将该行添加到配置文件中。

### 如何用 ripgrep 搜索并替换？

ripgrep 是一个永远不会接触你的文件的搜索工具。但是，ripgrep 的输出可以被管道传输到，其他修改磁盘上的文件的工具。欲了解更多信息，见[this issue](https://github.com/BurntSushi/ripgrep/issues/74)。

SED 是一种可以在磁盘上修改文件的工具。SED 可以使用文件名和替换命令，来搜索和替换指定的文件。可以将包含匹配模式的文件，提供给 SED。

```
rg foo --files-with-matches
```

此命令的输出是，包含`foo`模式匹配的文件名的列表。

这个列表可以用管道输入`xargs`，它将文件名从标准输入中，分离为 xargs 之后的命令的参数。您可以使用下面的组合，将文件名列表导入 SED 中进行替换。例如:

```
rg foo --files-with-matches | xargs sed -i 's/foo/bar/g'
```

在 ripgrep 找到 foo 模式的文件中，用"bar"替换"foo"的所有实例。SED 指示的这个`-i`标记，是您正要编辑的文件，以及`s/foo/bar/g`说明，你在执行**替换**，`foo`到`bar`，而且你正在做的这个替换，是**全面性的**(替换，文件中的每个匹配)。

注意:上面的命令是假定，您正在使用 GNU sed。如果您使用的是 BSD sed(macOS 和 FreeBSD 上的默认值)，那么必须修改上面的命令如下:

```
rg foo --files-with-matches | xargs sed -i '' 's/foo/bar/g'
```

BSD sed 中这个`-i`的标志要求提供一个文件扩展名，以便对所有修改后的文件进行备份。指定空字符串可以防止文件备份.

最后，如果任何文件路径都包含空格，那么可能需要使用 NUL 终止符，来分隔文件路径。这需要告诉 ripgrep 在每个路径之间，输出 NUL 字节，并告诉 xargs 读取，由 NUL 字节分隔的路径:

```
rg foo --files-with-matches -0 | xargs -0 sed -i 's/foo/bar/g'
```

要了解有关 sed 的更多信息，请参阅[这里](https://www.gnu.org/software/sed/manual/sed.html)的 sed 手册。

另外，脸谱网有一个工具叫做[fastmod](https://github.com/facebookincubator/fastmod)，它使用与 ripgrep 相同的一些库，并且可以提供更符合人体工程学的搜索和替换体验。

### Ripgrep 是如何获得许可的？

ripgrep 是双许可下的[Unlicense](https://unlicense.org/)和 MIT 执照。具体来说， ripgrep 可以使用任一许可证的条款。

ripgrep 是双重授权的原因是两个方面的:

1。 我，作为 ripgrep 的作者，想通过促进 Unlicense 的目标来参与一点意识形态活动:放弃版权垄断利益。
2。 我，正如 ripgrep 的作者一样，希望尽可能多地使用 RigPRP。由于 Unlicense 不是经过验证的或者众所周知的许可证，所以 ripgrep 也是在 MIT 的许可证下提供的，它无处不在，并且几乎被所有人接受。

更具体地说，ripgrep 及其所有依赖项都与此许可选择兼容。特别地，ripgrep 的依赖项(直接和传递的)将始终限于允许的许可证。也就是说，ripgrep 将永远不依赖于不允许许可的代码。这意味着拒绝使用诸如 GPL、LGPL、MPL 或任何 Creative Commons ShareAlike 许可证之类的版权许可的任何依赖项。许可证是否是"弱"的版权保留与否，并不重要;**不**依靠它。

### Ripgrep 能代替 grep 吗？

是也不是。

如果听到"ripgrep 能代替 grep"，你*事实上*听到的是，"ripgrep 可以在每个 grep 实例中使用，完全相同的方式，对于相同的用例，使用完全相同的 bug-for-bug 行为"，然后没有了，ripgrep 很平凡，*不能*替换 grep。此外，ripgrep*从未*想替换 grep。

如果听到"ripgrep 能代替 grep"，你*事实上*听到的是，"ripgrep 在某些情况下，可以代替 grep，而在其他用例中，则不能"，那么是的，这是真的!

让我们来看看那些有利于 ripgrep 的用例。其中一些可能不适用于你。没关系。这里可能没有列出，其他适用于您的用例。那也没问题。

(对于下列与性能有关的申明，请参阅我介绍 ripgrep 的[博文](https://blog.burntsushi.net/ripgrep/)。)

- 你经常搜索代码库吗？如果是这样，ripgrep 可能是一个不错的选择，因为可能存在大量您不想搜索的存储库。当然也行，grep 可以用递归搜索，来过滤文件，如果你不介意写出必要的`--exclude`规则，或编写包装脚本，那么 grep 就足够了。(我不是在开玩笑，我自己在编写 ripgrep 之前用 grep 做了将近 10 年。)但是如果你喜欢搜索工具能遵循`.gitignore`，那么 ripgrep 对你来说可能是完美的!
- 您是否经常搜索 UTF-8 编码，的非 ASCII 文本？ripgrep 的关键功能之一是，它能以一种比 GNU grep 更快的方式，处理模式中的 Unicode 特性。ripgrep 中的 Unicode 特性，默认情况下是启用的; 不需要配置区域的设置，才能正确使用 ripgrep，因为 ripgrep 不遵循区域设置。
- 您是否需要搜索 UTF 16 文件，而不想麻烦，明确地对它们进行代码转换？伟大的 ripgrep 自动为你做这件事。不需要你启用它。
- 需要搜索大型文件的大目录吗？ripgrep 默认使用并行性，这使得它比标准`grep -r`搜索快。不过，如果你还好，只是偶尔`find ./ -print0 | xargs -P8 -0 grep`命令，那么也许 grep 是足够好的。

以下是一些你可能会遇到的情况，*不*想使用 ripgrep。同样适用于上一节的警告。

- 您是否编写了，用于在各种环境中，工作的便携式 shell 脚本？很好，用 ripgrep 可能不是一个好主意!ripgrep 离 grep 还差得远，所以如果您确实使用 ripgrep，那么您可能需要，比 grep ，更忙于安装过程。
- 您关心 POSIX 兼容性吗？如果是这样，那么就不能使用 ripgrep，因为它从来没有，也永远不会是 POSIX 兼容的。
- 你讨厌尝试自以为是的工具吗？如果是这样的话，ripgrep 完全是自以为是的，所以你可能更愿意坚持 grep。
- 你依赖 grep ，但 ripgrep 却没有的特别特性？如果是，文件错误报告，也许 ripgrep 可以做到这一点! 如果真没有，那么，只需使用 grep。

### “ripgrep”中的“rip”是什么意思？

当我第一次开始写 ripgrep 时，我把它叫做`rep`，希望它是一个较短的`grep`变体。 不久之后，我把它改名为`xrep`，因`rep`对我的口味来说，名字不够明显。也因为任何事情加入`x`，都能使它变得更好，对吧？

> 译者: 比喻某公司 X 代

在 ripgrep 首次公开发行之前，我决定不喜欢`xrep`。 我觉得打字有点笨拙，尽管我以前称赞过这`x`，但我有点觉得它很蹩脚。作为一个真正喜欢 Rust 的人，我想把它叫做"RuSugRp"或者简称 RrGRP。但我认为那也跛脚，也许你脸上表露了相同的表情。但我想继续使用`r`，所以至少让我，可以假装 Rust 和它有关。

我花了几天时间，想从字母`r`开始的短单词，甚至与搜索任务有些关系。我不记得它是怎么突然出现在我脑海中的，但"rip"这个词的意思是"快速"，比如"撕破(rip)你的文本"。RIP 也是"安静休息（Rest in Peace）"(更过激的 "ripgrep 杀死(kill) grep")的字母缩写，这个过激的想法，从未真正出现在我脑海中。也许这个巧合太惊人了，以至于我不敢相信，但我直到第一次公开发行之后，有人明确地指出来，才意识到这一点。我承认我觉得这有点好笑，但是如果我在公开发布之前，意识到了，可能会继续选择一个不同的名字。唉，发布后的重命名是很难的，所以我决定，就这样吧，不是有意的。

鉴于这一事实[ripgrep 从, 不是 100% 替换 grep，以后也不会](#posix4ever)，ripgrep 既不是真正的"grep 杀手"，也不是有意的。它确实会提升了一些用例，但是还有其他工具，比如 ack 或 Silver Searcher ，他们都没有这么做。
