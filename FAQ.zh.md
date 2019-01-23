## 常问问题

- [ripgrep 支持 配置文件吗?](#config)
- [ripgrep 有啥变化?](#changelog)
- [下一次发布，是什么时候?](#release)
- [ripgrep 是否 有 man 页面?](#manpage)
- [ripgrep 是否支持 shell-Tab 补全?](#complete)
- [How do I use lookaround and/or backreferences?](#fancy)
- [How do I configure ripgrep's colors?](#colors)
- [How do I enable true colors on Windows?](#truecolors-windows)
- [How do I stop ripgrep from messing up colors when I kill it?](#stop-ripgrep)
- [How can I get results in a consistent order?](#order)
- [我要如何搜索不是 UTF-8 编码的文件?](#encoding)
- [How do I search compressed files?](#compressed)
- [How do I search over multiple lines?](#multiline)
- [How do I get around the regex size limit?](#size-limit)
- [How do I make the `-f/--file` flag faster?](#dfa-size)
- [How do I make the output look like The Silver Searcher's output?](#silver-searcher-output)
- [Why does ripgrep get slower when I enabled PCRE2 regexes?](#pcre2-slow)
- [When I run `rg`, why does it execute some other command?](#rg-other-cmd)
- [How do I create an alias for ripgrep on Windows?](#rg-alias-windows)
- [How do I create a PowerShell profile?](#powershell-profile)
- [How do I pipe non-ASCII content to ripgrep on Windows?](#pipe-non-ascii-windows)
- [How can I search and replace with ripgrep?](#search-and-replace)
- [How is ripgrep licensed?](#license)
- [Can ripgrep replace grep?](#posix4ever)
- [What does the "rip" in ripgrep mean?](#intentcountsforsomething)

<h3 name="config">
ripgrep 支持 配置文件吗?
</h3>

是。见[配置文件的 指南部分](GUIDE.zh.md#configuration-file).

<h3 name="changelog">
ripgrep 有啥变化?
</h3>

请咨询 ripgrep 的 [CHANGELOG](CHANGELOG.md).

<h3 name="release">
下一次发布，是什么时候?
</h3>

ripgrep 是一个贡献者都是志愿者的项目。发布的时间表，给所述志愿者增加了不适当的压力。因此,发布是在尽力而为的基础上进行的，没有**永远指定的**日期。

一个例外，是高影响力的错误。如果 ripgrep 版本包含显着的退化，那么通常会强烈推动修补程序，以此发布修补程序。

<h3 name="manpage">
ripgrep 是否 有 man 页面?
</h3>

是! 每当 ripgrep 在一个系统上编译，而`asciidoc`又存在时，那么就会从 ripgrep 的 argv 解析器生成一个 man 页。编译 ripgrep 之后,您可以从存储库的根目录中找到这样的 man 页:

```
$ find ./target -name rg.1 -print0 | xargs -0 ls -t | head -n1
./target/debug/build/ripgrep-79899d0edd4129ca/out/rg.1
```

运行`man -l ./target/debug/build/ripgrep-79899d0edd4129ca/out/rg.1`将在您的普通寻呼机中显示 man 页.

请注意,man 页的选项文档等同于显示的输出`rg --help`。要查看更多精简文档(每个标志一行),请运行`rg -h`。

man 页也包含所有[ripgrep 二进制版本](https://github.com/BurntSushi/ripgrep/releases)内容。

<h3 name="complete">
ripgrep 是否支持 shell-Tab补全?
</h3>

是! 在构建 ripgrep 之后，可以在[同一目录下的 manpage](#manpage)找到。Zsh 补全被分开维护，并提交到`complete/_rg`存储库中。

shell 补全也包括所有[ripgrep binary releases](https://github.com/BurntSushi/ripgrep/releases)内容。

对于**bash**,移动`rg.bash`至`$XDG_CONFIG_HOME/bash_completion`要么`/etc/bash_completion.d/`.

对于**fish**,移动`rg.fish`至`$HOME/.config/fish/completions/`.

对于**zsh**,移动`_rg`给你的一个`$fpath`目录.

对于**PowerShell**,添加`. _rg.ps1`到你的 PowerShell[profile](<https://technet.microsoft.com/en-us/library/bb613488(v=vs.85).aspx>)(注意领头的符号)。如果`_rg.ps1`文件不在`PATH`，用`. /path/to/_rg.ps1`代替。

<h3 name="order">
我要怎么得到连贯顺序的结果?
</h3>

默认情况下，ripgrep 使用并行性来执行搜索，因为这使得在大多数现代系统上搜索速度更快。反过来说，这意味着 ripgrep 具有不确定性，因为在程序执行期间线程的交叉本身是非确定性的。这具有以某种任意顺序打印结果的效果，并且该顺序可以在 ripgrep 的运行中改变。

使结果顺序一致的唯一方法是让 ripgrep 对输出进行排序。就目前而言，这将禁用所有并行性。(在较小的存储库中,您可能没有注意到性能差异!)您可以使用`--sort-files`标志。

这里有关于这个主题的更多讨论:<https://github.com/BurntSushi/ripgrep/issues/152>

<h3 name="encoding">
我要如何搜索不是UTF-8编码的文件?
</h3>

见[文件编码的指南](GUIDE.zh.md#file-encoding).

<h3 name="compressed">
我要如何搜索压缩文件?
</h3>

ripgrep 的`-z/--search-zip`标志 会自动搜索压缩文件。目前而言,仅支持 gzip，bzip2，lzma，lz4 和 xz，并且需要相应的要在系统上安装的`gzip`，`bzip2`和`xz`二进制文件。(也就是说，ripgrep 通过 终端另一个进程来进行解压缩。)

ripgrep 目前不搜索存档格式，所以`*.tar.gz`之类的，会跳过。

<h3 name="multiline">
我要如何搜索 多行内容?
</h3>

目前这不可行。ripgrep 基本上是一种面向行的搜索工具。照这样说,[多行搜索 ，已在计划的特性](https://github.com/BurntSushi/ripgrep/issues/176).

<h3 name="fancy">
如何使用 lookaround 和/或 backreferences?
</h3>

ripgrep 的默认正则表达式引擎，不支持环视或反向引用。这主要是因为默认的正则表达式引擎是使用有限状态机实现的，以保证所有输入的线性最坏情况时间复杂度。在这种范例中无法实现反向引用，并且看起来很难有效地执行。

但是，ripgrep 可选择支持使用 PCRE2 作为正则表达式引擎，而不是基于有限状态机的默认引擎。您可以使用 PCRE2 并启用 `-P/--pcre2`标志。例如，在 ripgrep 存储库 的根目录中，您可以轻松找到所有回文:

```
$ rg -P '(\w{10})\1'
tests/misc.rs
483:    cmd.arg("--max-filesize").arg("44444444444444444444");
globset/src/glob.rs
1206:    matches!(match7, "a*a*a*a*a*a*a*a*a", "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
```

如果您的 ripgrep 版本不支持 PCRE2，那么当您尝试使用时，您将收到错误消息`-P/--pcre2`标志:

```
$ rg -P '(\w{10})\1'
PCRE2 is not available in this build of ripgrep
```

由 GitHub 而来的 ripgrep 分发项目的大多数版本，都与 PCRE2 捆绑在一起。如果你通过不同的方式安装 ripgrep(比如系统的软件包管理器),那么请联系该软件包的维护者，看看是否可以启用 PCRE2 功能。

<h3 name="colors">
怎么配置 ripgrep's 颜色?
</h3>

ripgrep 有两个与颜色相关的标志:

- `--color`控制*某时*使用颜色.
- `--colors`控制*某个*要使用的颜色.

`--color`标志 接受以下可能值之一:`never`，`auto`，`always`要么`ansi`。该`auto`是默认值，将导致 ripgrep 仅在打印到终端时启用颜色。但是如果你将 ripgrep 传输到文件或其他进程，那么它将抑制颜色。

`--colors`标志有点复杂。一般格式是:

```
--colors '{type}:{attribute}:{value}'
```

<!-- HERE -->

- `{type}`应该是`path`，`line`，`column`要么`match`其中之一。这些中的每一个都对应于 ripgrep 将在其输出中添加颜色的四种不同类型的事物。选择要更改其颜色的类型。
- `{attribute}`应该是`fg`，`bg`要么`style`其中之一，对应于前景色，背景色或其他样式(例如是否粗体输出)。
- `{value}`是由`{attribute}`值决定的。如果`{attribute}`是`style`， 然后`{value}`应该是`nobold`，`bold`，`nointense`，`intense`，`nounderline`要么`underline`其中之一。如果`{attribute}`是`fg`要么`bg`， 然后`{value}`应该是一种颜色。

颜色由八个英文名称，一个 256 位数字或一个 RGB 三元组中的任何一个指定(具有超过 1600 万个可能的值，或"真彩色").

颜色名称是`red`，`blue`，`green`，`cyan`，`magenta`，`yellow`，`white`要么`black`.

单个 256 位数是 0-255(含)范围内的值.它可以是十进制格式(例如，`62`)或十六进制格式(例如，`0x3E`).

RGB 三元组对应于逗号分隔的三个数字(十进制或十六进制).

作为特例，`--colors '{type}:none'`将清除与之相关的所有颜色和样式`{type}`，它允许你从一个干净的平板开始(而不是建立在 ripgrep 的默认颜色设置之上).

这是一个使用粗体白色文本突出显示匹配的蓝色背景的示例:

```
$ rg somepattern \
    --colors 'match:none' \
    --colors 'match:bg:0x33,0x66,0xFF' \
    --colors 'match:fg:white' \
    --colors 'match:style:bold'
```

在[配置文件](GUIDE.zh.md#configuration-file)上，设置你的理想选择颜色。见[模仿 The Silver Searcher's 输出颜色的问题](#silver-searcher-output)，其中有关颜色的示例.

<h3 name="truecolors-windows">
如何在Windows上启用真彩色?
</h3>

首先，看看上一个问题的[配置颜色回答](#colors).

其次，Windows 上的着色有点复杂。如果您正在使用像 Cygwin 这样的终端，那么很可能真正的色彩支持已经开箱即用。但是，如果您使用的是普通的 Windows 控制台(`cmd`要么`PowerShell`)和 10 之前的 Windows 版本，然后没有已知的方法来获得真正的颜色支持。如果您使用的是 Windows 10 并使用 Windows 控制台，那么真正的颜色应该是开箱即用的，但有一点需要注意:您可能需要先清除 ripgrep 的默认颜色设置。也就是说,而不是这样:

```
$ rg somepattern --colors 'match:fg:0x33,0x66,0xFF'
```

你应该做这个

```
$ rg somepattern --colors 'match:none' --colors 'match:fg:0x33,0x66,0xFF'
```

这是因为 ripgrep 可能会为其设置默认样式`match`至`bold`,似乎 Windows 10 的 VT100 支持不允许同时使用粗体和真彩色 ANSI 转义。上面的解决方法将清除 ripgrep 的默认样式,允许您根据需要精确地制作它.

<h3 name="stop-ripgrep">
当我杀死它时，如何防止 ripgrep 弄乱颜色?
</h3>

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

<h3 name="size-limit">
我该怎么绕过 Regex 的尺寸限制呢?
</h3>

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

将限制增加到 1GB 并不一定意味着 ripgrep 将使用那么多内存。限制标志只是说它允许(大致)使用那么多内存来构造正则表达式。

<h3 name="dfa-size">
如何让 <code>-f/--file</code> 标志更快?
</h3>

该`-f/--file`允许给 ripgrep 一个文件，每个行包含一个模式。然后 ripgrep 会报告任何匹配该模式的行。

如果这个模式文件太大，那么 ripgrep 可能会大幅减速。*通常*这是因为内部缓存太小，并且会导致 ripgrep 溢出到更慢但更强大的正则表达式引擎。如果这确实是问题，则可以增加此缓存并重新获得速度。缓存可以通过`--dfa-size-limit`标志。例如，使用`--dfa-size-limit 1G`将缓存大小设置为 1GB。(请注意，这并不意味着 ripgrep 会自动使用 1GB 内存，但如果需要，它将允许正则表达式引擎能用。)

<h3 name="silver-searcher-output">
如何使输出看起来像Silver Searcher的输出?
</h3>

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

或者，将您的颜色配置添加到您的 ripgrep 配置文件(通过设置`RIPGREP_CONFIG_PATH`环境变量指向您的配置文件)。例如:

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

<h3 name="pcre2-slow">
为什么启用PCRE2 正则式 时，ripgrep 会变慢？?
</h3>

<!-- HERE -->

当你使用`--pcre2`(`-P`简而言之，flag,ripgrep 将使用 PCRE2 正则表达式引擎而不是默认值.两个正则表达式引擎都非常快,但 PCRE2 提供了许多其他功能,例如许多人喜欢使用的环视和反向引用.这主要是因为 PCRE2 使用回溯实现,其中默认正则表达式引擎使用基于有限自动机的实现.前者提供了在后者上添加大量铃声和口哨的能力,但后者在最坏情况下线性时间复杂度执行.

如果你已经习惯了,那么就这样了`-P`使用 ripgrep,您可能已经注意到它可能会变慢.之所以如此复杂,原因很复杂,因为 ripgrep 用于实现快速搜索的优化很复杂.

任务 ripgrep 之前有点简单;它需要做的就是在文件中搜索某些模式的出现,然后打印包含这些模板的行.问题在于什么被认为是有效匹配以及我们如何从文件中读取字节.

就所谓的有效匹配而言,请记住 ripgrep 默认只报告跨越一行的匹配.这里的问题是一些模式可以匹配多行,而 ripgrep 需要防止这种情况发生.例如,`foo\sbar`会匹配`foo\nbar`.实现此目的最明显的方法是从文件中读取数据,然后将模式搜索应用于每行的数据.这种方法的问题在于它可能非常慢;让模式搜索尽可能多的数据要快得多.它更快,因为它摆脱了寻找每一行边界的开销,也因为它摆脱了开始和停止每一行的模式搜索的开销.(这是在一般假设下运行,即匹配线比非匹配线少得多.)

事实证明,我们可以通过对模式应用非常简单的限制来使用更快的方法:*静态防止*来自匹配的模式`\n`字符.即,当给出类似的模式时`foo\sbar`里弗雷普将移除`\n`从`\s`字符类自动生成.在某些情况下,简单的去除并不容易.例如,ReReGRP 将在模式包含一个错误时返回错误.`\n`字面意义的:

```
$ rg '\n'
the literal '"\n"' is not allowed in a regex
```

那么这与 PCRE2 有什么关系呢?嗯,ripgrep 的默认正则表达式引擎公开了 API,用于以一种非常容易剥离的方式对模式进行语法分析`\n`从模式(或以其他方式检测,并报告错误,如果剥离是不可能的).PCRE2 似乎没有提供类似的 API,所以当启用 PCRE2 时,ripgrep 不执行任何剥离.这迫使 RiReGRP 使用单独搜索每条线的"慢"搜索策略.

那么,如果启用 PCRE2 会减慢默认的搜索方法,因为它强制匹配被限制为单行,那么为什么 PCRE2 在执行多行搜索时有时也会变慢呢?那是因为那里有*倍数*在 ripgrep 中使用 PCRe2 的原因可能比默认的 ReGEX 引擎慢.这一次,指责 pCRE2 的 Unicode 支持,ReReGRP 默认启用.特别地,PCRe2 不能同时启用 Unicode 支持并搜索任意数据.也就是说,当启用了 pCRE2 的 Unicode 支持时,数据**必须**有效的 UTF-8(否则将调用未定义的行为).这与 ripgrep 的默认正则表达式引擎形成对比,后者可以支持 Unicode 并仍然搜索任意数据.ripgrep 的默认正则表达式引擎不能匹配无效的 UTF-8,否则只能匹配有效的 UTF-8.为什么 PCRE2 不这么做?这个作者不熟悉它的内部结构,所以我们不能在这里评论它.

这里的底线是,我们不能启用 PCRE2 的 Unicode 支持,而不会同时因为确保我们正在搜索有效的 UTF-8 而导致性能损失.特别是,ripgrep 将把每个文件的内容转换为 UTF-8,同时用 Unicode 替换代码点替换无效的 UTF-8 数据.ripgrep 然后禁用 PCRE2 自己的内部 UTF-8 检查,因为我们已经保证了所传递的数据将是有效的 UTF-8.ripgrep 采用此方法的原因是,如果我们手动执行 PCRE2 无效 UTF-8,那么如果遇到无效 UTF-8 序列,它将报告匹配错误.这对于 ripgrep 不是好消息,因为它将停止搜索文件的其余部分,并且还将向用户打印可能不希望的错误消息.

好的,如果您还不熟悉 ripgrep 内部,那么上面列出的信息很多.让我们用一些例子来具体说明这一点.首先,让我们得到一些足够大的数据来放大性能差异:

```
$ curl -O 'https://burntsushi.net/stuff/subtitles2016-sample.gz'
$ gzip -d subtitles2016-sample
$ md5sum subtitles2016-sample
e3cb796a20bbc602fbfd6bb43bda45f5   subtitles2016-sample
```

要搜索此数据,我们将使用该模式.`^\w{42}$`,它在文件中只包含一个命中,并且没有文字.没有文字很重要,因为它确保正则表达式引擎不会使用文字优化来加速搜索.换句话说,它让我们能够一致地推理正则表达式引擎正在执行的实际任务.

现在让我们根据上面的信息来浏览几个例子.首先,让我们考虑使用 ripgrep 的默认正则表达式引擎进行默认搜索,然后使用 PCRE2 进行相同的搜索:

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

在这个特定的示例中,两种模式搜索都使用 Unicode 感知`\w`字符类和两个都在计数行,以便报告行数.这里的关键区别在于,第一次搜索不会逐行搜索,而第二次搜索会.我们可以观察 ripgrep 使用的策略是什么?`--trace`标志帜:

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

第一种说法是使用"快速行搜索器",而后一种说法是使用"慢速行搜索器".

有趣的是,在这种情况下,模式不匹配.`\n`并且我们正在搜索的文件是有效的 UTF-8,所以不需要慢速逐行搜索策略和解码.我们可以用更好的 PCRE2 内省 API 来解决前一个问题.事实上,我们可以解决莱普雷普的后一个问题.`--no-encoding`标志,它阻止自动 UTF-8 解码,但是将启用 PCRE2 自己的 UTF-8 有效性检查.不幸的是,我在 RiGRIPP 的构建过程中速度较慢:

```
$ time rg -P '^\w{42}$' subtitles2016-sample --no-encoding
21225780:EverymajordevelopmentinthehistoryofAmerica

real    0m3.074s
user    0m3.021s
sys     0m0.051s
```

(提示:使用`--trace`标记以验证 ripgrep 中没有解码.

PCRE2 的 UTF-8 检查较慢的一个可能原因是,它可能不比在[`encoding_rs`](https://github.com/hsivonen/encoding_rs)库,这是 ripgrep 用于 UTF-8 解码的原因.此外,我的 ripgrep 构建`encoding_rs`的 SIMD 优化,这可能在这里发挥作用.

另外,请注意使用`--no-encoding`标志可能导致 PCRE2 报告无效的 UTF-8 错误,这导致 ripgrep 停止搜索文件:

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

好,所以在这一点上,您可能认为我们可以通过启用多行搜索来消除逐行搜索的惩罚.毕竟,我们的特定模式无论如何不能跨多行匹配,所以我们仍然会得到我们想要的结果.让我们试试看:

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

搜索时间与默认的正则表达式引擎保持相同,但 pCRE2 搜索得到*更慢的*. 发生了什么事?秘密可以用`--trace`再次标记.在前一种情况中,ripgrep 实际上检测到模式不能跨多行匹配,因此将回到"快速行搜索"策略,就像在没有搜索的情况下一样`-U`.

然而,对于 PCRE2 来说,情况就更糟了.也就是说,由于 Unicode 模式仍然启用,所以 ripgrep 仍然要对 UTF-8 进行解码,以确保它只将有效的 UTF-8 交给 PCRE2.不幸的是,多行搜索的一个关键缺点是 ripgrep 不能渐进地进行.由于匹配可以任意长,因此 ReReGRP 实际上需要在内存中的整个文件一次.通常,我们可以为此使用内存映射,但是因为我们需要在搜索文件之前对文件进行 UTF-8 解码,所以 ripgrep 在执行搜索之前将文件的全部内容读取到堆上.猫头鹰

好了,Unicode 在这里杀了我们.我们正在搜索的文件是*主要地*ASCII,所以我们可能错过了一些数据.(试一试`rg '[\w--\p{ascii}]'`只看到 ASCII 字的非 ASCII 字字符`\w`我们可以在两个搜索中禁用 Unicode,但是根据我们使用的正则表达式引擎的不同:

```
$ time rg '(?-u)^\w{42}$' subtitles2016-sample
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

在大多数情况下,ReReGRP 默认的 ReGEX 引擎执行相同的操作.PCRE2 确实提高了一点点,现在几乎和默认的正则表达式引擎一样快.如果你看的输出`--trace`您将看到 ripgrep 将不再执行 UTF-8 解码,但是它仍然使用缓慢的逐行搜索器.

此时,我们可以结合上面的所有见解:让我们通过启用多行模式来尝试摆脱缓慢的逐行搜索,并通过禁用 Unicode 支持来停止 UTF-8 解码:

```
$ time rg -U '(?-u)^\w{42}$' subtitles2016-sample
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

啊,PCRE2 的 JIT 闪闪发光!ripgrep 的默认 regex 引擎再次保持不变,但是 PCRE2 不再需要逐行搜索,也不再需要执行任何类型的 UTF-8 检查.这允许文件以令人印象深刻的速度映射内存并通过 PCRE2 的 JIT.(作为一个简单而有趣的历史记录,"内存映射+多行+非 Unicode"的配置正是 Silver Searcher 使用的配置.这个分析也许可以解释为什么这种配置是有用的!

总之,如果希望 PCRE2 尽可能快地进行,而不关心 Unicode,也不关心可能跨越多行的匹配,则启用多行模式`-U`并禁用 pCRE2 的 Unicode 支持`--no-pcre2-unicode`标志帜.

警告清空器:此作者不是 PCRE2 专家,因此可能有一些 API 可以提高作者错过的性能.类似地,可能存在更适合 PCRE2 工作方式的搜索工具的替代设计.

<h3 name="rg-other-cmd">
当我运行<code>rg<code>时，它为什么执行其他命令？
</h3>

很可能你有一个 shell 别名，甚至是另一个工具也叫`rg`的干扰了 ripgrep。运行`which rg`看看它是什么.

(特别是 Rails 插件[Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins#rails)建立了`rails generate`的一个`rg`别名)

像这样的问题可以通过以下几种方式来解决:

- 如果您使用的是 OMZ Rails 插件，则通过编辑在 ZSH 配置中的`plugins`数组.
- 暂时绕过现有的`rg`别名，通过`command rg`,`\rg`或`'rg'`调用 ripgrep。
- 暂时绕过现有别名或另一个`rg`工具，通过调用 ripgrep 的完整路径(例如`/usr/bin/rg`或`/usr/local/bin/rg`)
- 永久禁用现有的`rg`添加别名`unalias rg`到 shell 配置文件的底部(例如，`.bash_profile`或`.zshrc`)
- 通过在 shell 配置文件的底部添加如下行，为 ripgrep 提供与其他工具/不冲突的别名:`alias ripgrep='command rg'`.

<h3 name="rg-alias-windows">
如何在 Windows上 为ripgrep 创建别名？
</h3>

通常，您可以找到为使用大量设置指令的命令创建别名的必要性。但是 Posishell 函数别名，并不象典型的 Linux shell 别名。你总要需要传播参数和`stdin`输入。但不能像`function grep() { $input | rg.exe --hidden $args }`一样简单

使用下面的示例作为，如何在 PowerShell 中设置别名的参考。

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

- input - PowerShell 的`stdin`允许您访问其内容的对象。
- args - 是传递给这个函数的参数数组。

这个别名检查`stdin`输入是否存在，和仅当有一些行时传播。否则空`$input`将使 PowerShell 触发`rg`搜索空`stdin`。

<h3 name="powershell-profile">
如何创建 PowerShell 配置文件？
</h3>

要在启动时定制 powershell，必须创建一个特殊的 powershell 脚本.为了找到它的位置，见[Microsoft's 文档](<https://technet.microsoft.com/en-us/library/bb613488(v=vs.85).aspx>)`$profile`类型的更多细节.

这个文件中的任何 PowerShell 代码，在控制台的开始时被执行。这样,您可以在开始时创建自己的别名。

<h3 name="pipe-non-ascii-windows">
如何将 非ASCII 内容传输到 Windows上的ripgrep？
</h3>

当在 PowerShell 中将输入管道化到本地可执行文件时，输入的编码由`$OutputEncoding`变量.默认情况下，这将设置为 US-ASCII，并且流水线中没有 US-ASCII 编码的任何字符都被转换为`?`(问号)字符.

若要更改此设置，请设置`$OutputEncoding`由.NET 编码对象表示的不同编码.下面是一些常见的例子.当 PowerShell 重新启动时，该变量的值被重置，因此每次启动 PowerShell 时，都要将设置变量的行添加到 PowerShell 配置文件中，以使此更改生效.

例子`$OutputEncoding`设置:

- 没有 BOM 的 UTF-8:`$OutputEncoding = [System.Text.UTF8Encoding]::new()`
- 控制台的输出编码:`$OutputEncoding = [System.Console]::OutputEncoding`

如果继续存在编码问题,还可以强制控制台将用于打印到 UTF-8 的编码`[System.Console]::OutputEncoding = [System.Text.Encoding]::UTF8`. 当重新启动 PowerShell 时,这也将重置,因此如果希望使设置永久化,也可以将该行添加到配置文件中.

<h3 name="search-and-replace">
如何搜索并替换为ripgrep？
</h3>

RiGRIP 是一个永远不会接触你的文件的搜索工具.但是,RIPGREP 的输出可以被管道传输到其他修改磁盘上的文件的工具.见[this issue](https://github.com/BurntSushi/ripgrep/issues/74)欲了解更多信息.

SED 是一种可以在磁盘上修改文件的工具.SED 可以使用文件名和替换命令来搜索和替换指定的文件.可以将包含匹配模式的文件提供给 SED.

```
rg foo --files-with-matches
```

此命令的输出是包含匹配的文件名的列表.`foo`模式.

这个列表可以用管道输入.`xargs`它将文件名从标准输入中分离为 xargs 之后的命令的参数.您可以使用此组合将文件名列表导入 SED 中进行替换.例如:

```
rg foo --files-with-matches | xargs sed -i 's/foo/bar/g'
```

在 ripgrep 找到 FoO 模式的文件中,用"bar"替换"Foo"的所有实例.这个`-i`标记到 SED 指示您正在就地编辑文件,以及`s/foo/bar/g`说你在表演**s**髌骨置换术`foo`对于`bar`而且你正在做这个替换**g**(每个文件中的模式的所有出现).

注意:上面的命令假定您正在使用 GNUSED.如果您使用的是 BSDSed(macOS 和 FreeBSD 上的默认值),那么必须修改上面的命令如下:

```
rg foo --files-with-matches | xargs sed -i '' 's/foo/bar/g'
```

这个`-i`BSD SED 中的标志要求提供一个文件扩展名,以便对所有修改后的文件进行备份.指定空字符串可以防止文件备份.

最后,如果任何文件路径都包含空格,那么可能需要使用 NUL 终止符来分隔文件路径.这需要告诉 ripgrep 在每个路径之间输出 NUL 字节,并告诉 xargs 读取由 NUL 字节分隔的路径:

```
rg foo --files-with-matches -0 | xargs -0 sed -i 's/foo/bar/g'
```

要了解有关 SED 的更多信息,请参阅 SED 手册[here](https://www.gnu.org/software/sed/manual/sed.html).

另外,脸谱网有一个工具叫做[fastmod](https://github.com/facebookincubator/fastmod)它使用与 ripgrep 相同的一些库,并且可以提供更符合人体工程学的搜索和替换体验.

<h3 name="license">
Ripgrep是如何获得许可的？
</h3>

ripgrep 是双许可下的[Unlicense](https://unlicense.org/)和麻省理工学院执照.具体来说,可以使用任一许可证的条款 ripgrep.

ripgrep 是双重授权的原因是双重的:

1.  我,作为 ripgrep 的作者,想通过促进 Unlicense 的目标来参与一点意识形态活动:放弃版权垄断利益.
2.  我,正如里普雷普的作者一样,希望尽可能多地使用 RigPRP.由于 Unlicense 不是经过验证的或者众所周知的许可证,所以 ripgrep 也是在麻省理工学院的许可证下提供的,它无处不在,并且几乎被所有人接受.

更具体地说,ripgrep 及其所有依赖项都与此许可选择兼容.特别地,ripgrep 的依赖项(直接和传递的)将始终限于允许的许可证.也就是说,ripgrep 将永远不依赖于不允许许可的代码.这意味着拒绝使用诸如 GPL、LGPL、MPL 或任何 Creative Commons ShareAlike 许可证之类的版权许可的任何依赖项.许可证是否是"弱"的版权保留与否并不重要;**不**依靠它.

<h3 name="posix4ever">
Ripgrep能代替grep吗？
</h3>

是和不是.

如果听到"RiReGRP 能代替 GRIP",你*事实上*听着,"ripgrep 可以在每个实例中使用,以完全相同的方式,对于相同的用例,使用完全相同的 bug-for-bug 行为",然后没有,ripgrep 就很平常了*不能*替换 GRIP.此外,里普雷普威尔*从未*替换 GRIP.

如果听到"RiReGRP 能代替 GRIP",你*事实上*听着,"ripgrep 在某些情况下可以代替 grep,而在其他用例中则不能",那么是的,这是真的!

让我们来看看那些有利于 ripgrep 的用例.其中一些可能不适用于你.没关系.这里可能没有列出其他适用于您的用例.那也没问题.

(对于下列与申诉有关的索赔,请参阅我的申请)[blog post](https://blog.burntsushi.net/ripgrep/)介绍 ripgrep.

- 你经常搜索代码库吗?如果是这样,ripgrep 可能是一个不错的选择,因为可能存在大量您不想搜索的存储库.grep,当然可以用递归搜索来过滤文件,如果你不介意写出必要的`--exclude`规则或编写包装脚本,那么 GRIP 就足够了.(我不是在开玩笑,我自己在编写 ripgrep 之前用 grep 做了将近 10 年.)但是如果你喜欢使用搜索工具,请尊重`.gitignore`那么里普雷普对你来说可能是完美的!
- 您是否经常搜索 UTF-8 编码的非 ASCII 文本?ripgrep 的关键特性之一是它可以以一种比 GNU grep 更快的方式处理模式中的 Unicode 特性.ripgrep 中的 Unicode 特性默认情况下是启用的;不需要配置区域设置来正确使用 ripgrep,因为 ripgrep 不尊重区域设置.
- 您是否需要搜索 UTF 16 文件,而不想麻烦明确地对它们进行代码转换?伟大的.ripgrep 自动为你做这件事.不需要启用它.
- 需要搜索大型文件的大目录吗?ReReGRIP 默认使用并行性,这使得它比标准快.`grep -r`搜索.不过,如果你还好,偶尔写一封信.`find ./ -print0 | xargs -P8 -0 grep`命令,那么也许 GRIP 是足够好的.

以下是一些你可能会遇到的情况*不*想使用 ripgrep.同样适用于上一节的警告.

- 您是否编写了用于在各种环境中工作的便携式 shell 脚本?很好,用 RiReGRP 可能不是一个好主意!ripgrep 离 grep 还差得远,所以如果您确实使用 ripgrep,那么您可能需要比使用 grep 更忙于安装过程.
- 您关心 POSIX 兼容性吗?如果是这样,那么就不能使用 ReReGRP,因为它从来没有,不也永远不会是 POSIX 兼容的.
- 你讨厌尝试聪明的工具吗?如果是这样的话,ripgrep 完全是聪明的,所以你可能更愿意坚持 GRIP.
- 你依赖的 ripgrep 有没有什么特别的特性?如果前者,文件错误报告,也许 RiReGRP 可以做到这一点!如果后者,那么,只需使用 GRIP.

<h3 name="intentcountsforsomething">
“ripgrep”中的“rip”是什么意思？
</h3>

当我第一次开始写 RiReGRP 时,我把它叫做`rep`希望它是一个较短的变体`grep`. 不久之后,我把它改名为`xrep`自从`rep`对我的口味来说,名字不够明显.也因为加入`x`任何事情都能使它变得更好,对吧?

在莱普雷普首次公开发行之前,我决定不喜欢.`xrep`. 我觉得打字有点笨拙,尽管我以前称赞过这封信.`x`我有点觉得它很蹩脚.作为一个真正喜欢 Rust 的人,我想把它叫做"RuSugRp"或者简称 RrGRP.但我认为那是跛脚的,也许在你的脸上也有点.但我想继续使用`r`所以我至少可以假装铁锈和它有关.

我花了几天时间想从字母开始的很短的单词.`r`这甚至与搜索任务有些关系.我不记得它是怎么突然出现在我脑海中的,但"rip"这个词的意思是"快速",比如"撕破你的文本".RIP 也是"休息在和平中"(比如"rip grep 杀死 grep")的首字母缩写,这个事实从未真正出现在我脑海中.也许这个巧合太惊人了,以至于我不敢相信,但我直到第一次公开发行之后有人明确地指出来才意识到这一点.我承认我觉得这有点好笑,但是如果我在公开发布之前自己意识到,我可能会继续坚持下去,选择一个不同的名字.唉,发布后重命名是很难的,所以我决定继续.

鉴于这一事实[ripgrep never was, is or will be a 100% drop-in replacement for
grep](#posix4ever)里弗雷普既不是真正的"绿色杀手",也不是有意的.它确实会侵蚀它的一些用例,但是其他工具,比如 ack 或 Silver Searcher 还没有这么做.
