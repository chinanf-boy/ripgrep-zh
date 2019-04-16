## 用户指南

本指南旨在提供 ripgrep 的基本描述及其功能概述。本指南假设 ripgrep 是[已安装的](README.md#installation)，并且读者已经熟悉使用命令行工具。这也假定是在类似 Unix 的系统中，尽管大多数命令也许能很容易转换到任何命令行 shell 环境。

### 目录

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Basics](#basics)
- [递归搜索](#%E9%80%92%E5%BD%92%E6%90%9C%E7%B4%A2)
- [自动过滤](#%E8%87%AA%E5%8A%A8%E8%BF%87%E6%BB%A4)
- [手动过滤: globs](#%E6%89%8B%E5%8A%A8%E8%BF%87%E6%BB%A4-globs)
- [手动过滤:文件类型](#%E6%89%8B%E5%8A%A8%E8%BF%87%E6%BB%A4%E6%96%87%E4%BB%B6%E7%B1%BB%E5%9E%8B)
- [替换](#%E6%9B%BF%E6%8D%A2)
- [Configuration file](#configuration-file)
- [文件编码](#%E6%96%87%E4%BB%B6%E7%BC%96%E7%A0%81)
- [二进制数据](#%E4%BA%8C%E8%BF%9B%E5%88%B6%E6%95%B0%E6%8D%AE)
- [常用选项](#%E5%B8%B8%E7%94%A8%E9%80%89%E9%A1%B9)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

### Basics

> 基础

ripgrep 是一个命令行工具，可在文件中，搜索您提供的模式。ripgrep 的行为就像逐行读取每个文件一样。如果一行与提供给 ripgrep 的模式匹配，那么将打印该行。如果那行与模式不匹配,则不打印该行。

查看其工作原理的最佳方法是使用示例。为了展示一个例子，我们需要一些东西来搜索。让我们来尝试搜索 ripgrep 的源代码。首先从 ripgrep 源存档<https://github.com/BurntSushi/ripgrep/archive/0.7.1.zip>中获取，并提取它:

```
$ curl -LO https://github.com/BurntSushi/ripgrep/archive/0.7.1.zip
$ unzip 0.7.1.zip
$ cd ripgrep-0.7.1
$ ls
benchsuite  grep       tests         Cargo.toml       LICENSE-MIT
ci          ignore     wincolor      CHANGELOG.md     README.md
complete    pkg        appveyor.yml  compile          snapcraft.yaml
doc         src        build.rs      COPYING          UNLICENSE
globset     termcolor  Cargo.lock    HomebrewFormula
```

让我们通过在`README.md`，查找所有出现的`fast`单词，作为我们的第一次搜索尝试:

```
$ rg fast README.md
75:  faster than both. (N.B. It is not, strictly speaking, a "drop-in" replacement
88:  color and full Unicode support. Unlike GNU grep, `ripgrep` stays fast while
119:### Is it really faster than everything else?
124:Summarizing, `ripgrep` is fast because:
129:  optimizations to make searching very fast.
```

(**注意:**如果您看到来自 ripgrep 的错误消息，说它没有搜索任何文件，那么请重新运行 ripgrep 带 `--debug`标志。一个可能的原因是你`$HOME/.gitignore`文件中有一个`*`规则。)

那么这里发生了什么? ripgrep 阅读`README.md`的内容，以及对于包含`fast`的每一行，ripgrep 将它打印到您的终端。ripgrep 默认还包括每行的行号。如果您的终端支持颜色，那么您的输出可能看起来像这个截图:

[![A screenshot of a sample search ripgrep](https://burntsushi.net/stuff/ripgrep-guide-sample.png)](https://burntsushi.net/stuff/ripgrep-guide-sample.png)

在这个例子中，我们搜索了一个叫做"字面"(literal)字符串的东西。这意味着我们的模式只是我们要求 ripgrep 查找的一些普通文本。但是 ripgrep 支持通过[regular
expressions](https://en.wikipedia.org/wiki/Regular_expression)指定模式的能力。例如，如果我们想要查找所有行，找出包含一个单词`fast`，其次还有些其他字母的行? 该怎么办?

```
$ rg 'fast\w+' README.md
75:  faster than both. (N.B. It is not, strictly speaking, a "drop-in" replacement
119:### Is it really faster than everything else?
```

在这个例子中，我们使用了模式`fast\w+`。此模式告诉 ripgrep 查找包含`fast`字母，其次是*一个或多个*字样字符的任何行。也就是说，`\w`匹配组成单词的字符(如`a`和`L`，但不是`.`和``)这个`+`在`\w`后意味着，"匹配以前的模式一次或多次"，这意味着`fast`这个词不会匹配，因为字符`t`后面没有字符。 但是一个`faster`可以匹配。`faste`也行!

这里有个相同的主题，的不同的变化:

```
$ rg 'fast\w*' README.md
75:  faster than both. (N.B. It is not, strictly speaking, a "drop-in" replacement
88:  color and full Unicode support. Unlike GNU grep, `ripgrep` stays fast while
119:### Is it really faster than everything else?
124:Summarizing, `ripgrep` is fast because:
129:  optimizations to make searching very fast.
```

在这种情况下，我们使用`fast\w*`代替我们的模式`fast\w+`。 这个`*`意味着它应该匹配*零*或更多次。在这种情况下，ripgrip 将打印这个`fast`模式匹配的行，但是如果你的终端支持颜色，你会注意到`faster`将突出显示，而不仅仅是前缀`fast`。

提供关于正则表达式的完整教程超出了本指南的范围，但是 ripgrep 的特定语法在此进行文档化:<https://docs.rs/regex/0.2.5/regex/#syntax>

### 递归搜索

在前一节中，我们演示了如何使用 ripgrep 来搜索单个文件。在本节中，我们将演示如何使用 ripgrep 搜索文件的整个目录。事实上，*递归地*搜索当前工作目录是 ripgrep 的默认操作模式，这意味着递归搜索操作非常简单。

继续使用 ripgrep 源代码目录，下面介绍如何查找名称为`write`的所有函数定义:

```
$ rg 'fn write\('
src/printer.rs
469:    fn write(&mut self, buf: &[u8]) {

termcolor/src/lib.rs
227:    fn write(&mut self, b: &[u8]) -> io::Result<usize> {
250:    fn write(&mut self, b: &[u8]) -> io::Result<usize> {
428:    fn write(&mut self, b: &[u8]) -> io::Result<usize> { self.wtr.write(b) }
441:    fn write(&mut self, b: &[u8]) -> io::Result<usize> { self.wtr.write(b) }
454:    fn write(&mut self, buf: &[u8]) -> io::Result<usize> {
511:    fn write(&mut self, buf: &[u8]) -> io::Result<usize> {
848:    fn write(&mut self, buf: &[u8]) -> io::Result<usize> {
915:    fn write(&mut self, buf: &[u8]) -> io::Result<usize> {
949:    fn write(&mut self, buf: &[u8]) -> io::Result<usize> {
1114:    fn write(&mut self, buf: &[u8]) -> io::Result<usize> {
1348:    fn write(&mut self, buf: &[u8]) -> io::Result<usize> {
1353:    fn write(&mut self, buf: &[u8]) -> io::Result<usize> {
```

(**注意:**我们转义了`(`，因为这里的`(`在正则表达式中具有特殊的意义。你也可以使用`rg -F 'fn write('`做同样的事情，这里的`-F`会将您的模式解释为字面字符串，而不是正则表达式。

在这个例子中，我们根本没有指定一个文件。而，ripgrep 默认在没有路径的情况下，搜索当前目录。一般来说，`rg foo`相当于`rg foo ./`。

这个特殊的搜索显示了我们`src`和`termcolor`目录的结果。这个`src`目录是 ripgrep 核心代码，而`termcolor`是 ripgrep 的一个依赖项(并且被其他工具使用)。如果我们只想搜索 ripgrip 核心代码呢? 这很简单，只需指定你想要的目录:

```
$ rg 'fn write\(' src
src/printer.rs
469:    fn write(&mut self, buf: &[u8]) {
```

在这里，ripgrep 将其搜索限制在`src`目录。做相同搜索的另一种方法是`cd`进入`src`目录，及再一次简单使用`rg 'fn write\('`。

### 自动过滤

在递归搜索之后，ripgrip 最重要的特性是什么?*不是*搜索。而是默认情况下，当搜索目录时，ripgrep 将忽略以下所有内容:

**1.**  与您的`.gitignore`glob 模式规则匹配的文件和目录
**2.**  隐藏的文件和目录。
**3.**  二进制文件。(ripgrep 会将任何`NUL`字节的文件考虑为二进制)
**4.**  符号链接(快捷方式)不被遵循。

所有这些东西都可以用 ripgrep 提供的各种标志来切换:

**1.**  你可以禁用`.gitignore`处理，通过`--no-ignore`标志。
**2.**  隐藏的文件和目录，可以用`--hidden`标志搜索。
**3.**  二进制文件可以通过`--text`(短的`-a`)标志搜索。
    小心这一标志! 二进制文件可以向终端发送控制字符，这可能会导致奇怪的行为。
**4.**  ripgrep 可以用`--follow`遵循 symlinks(短的`-L`)。

作为一种特殊的方便，ripgrep 还提供了一个称为`--unrestricted`(短的`-u`)。重复使用此标志将导致 ripgrep 禁用其越来越多的过滤。也就是说，`-u`将禁用`.gitignore`处理，`-uu`将搜索隐藏的文件和目录`-uuu`将搜索二进制文件。当您使用 ripgrep ，但不确定它的过滤是否对您隐藏了结果时，这是非常有用的。缝上一对`-u`标志是一种快速的发现方法。(如果你仍然困惑使用`--debug`，还是没有帮助，[提出一个 issue](https://github.com/BurntSushi/ripgrep/issues/new))

ripgrep 的`.gitignore`处理实际上有点超出`.gitignore`文件。ripgrip 还将遵循以下的特定规则。一个是`$GIT_DIR/info/exclude`，以及您的任何全局忽略规则`core.excludesFile`(在类 UNIX 系统上,通常位于`$XDG_CONFIG_HOME/git/ignore`)。

有时你想搜索在`.gitignore`的文件，因此，可以再指定，附加(非)忽略规则，或在`.ignore`(未知应用) 或 `.rgignore`(ripgrip 特定)文件重写。

例如，假设你有一个`.gitignore`，看起来像这样的文件:

```
log/
```

这通常意味着任何`log`目录不会被`git`跟踪。 然而，它可能包含您希望在搜索中，包括的有用输出，但是您仍然不想`git`跟踪它。 你可以通过创建一个`.ignore`文件，与`.gitignore`文件处在同一目录，其内容如下:

```
!log/
```

ripgrep 对待`.ignore`会比文件`.gitignore`的优先级要高(和对待`.rgignore`比文件`.ignore`文件优先级要高)。这意味着 ripgrep 将`!log/`先作为白名单规则，然后搜索目录。

像`.gitignore`，一个可以放在任何目录中的`.ignore`文件。它的规则将对它所在的目录进行处理，就像`.gitignore`。

要在遵循 `.gitignore` 和 `.ignore` 文件期间，不关心大小写， 使用
`--ignore-file-case-insensitive`标志。 这在不关心大小写的文件系统中，像在 Windows 和 macOS 中，会很有用。 请注意，这可能会带来显着的性能损失，因此默认情况下会禁用。

为了更深入地描述一个`.gitignore`文件中的， glob 模式如何被解释，请参阅`man gitignore`。

### 手动过滤: globs

在前一节中，我们讨论了 ripgrep 的过滤，默认情况下它是"自动"的，它对你的环境起反应。也就是说，它使用已经存在了的`.gitignore`文件，去生成更多相关搜索结果。

除了自动过滤之外，ripgrip 还提供更多的手动或自定义过滤。这有两种形式:在 ripgrep 命令行指定其他的 glob 模式和文件类型筛选。这一部分是涵盖 glob 模式，而下一部分才是涵盖文件类型过滤。

在我们的 ripgrip 源代码中(参见[基本内容](#basics)有关如何获取要搜索的源归档的说明)，我们假设希望查看哪些内容依赖于`clap`(我们的参数解析器)。

我们可以这样，做到这一点:

```
$ rg clap
[lots of results]
```

但，这给我们展示了过多东西，而我们只感兴趣的是我们写的，`clap`作为依赖关系的地方。相反，我们可以限制为 TOML 文件，此为依赖项与 Rust 的构建工具 Cargo 的沟通:

```
$ rg clap -g '*.toml'
Cargo.toml
35:clap = "2.26"
51:clap = "2.26"
```

这个`-g '*.toml'`语法说的是，"确保搜索到的每个文件都匹配这个 glob 模式." 注意我们的`'*.toml'`是单引号，防止我们的 shell 展开了`*`.

如果我们想要的话，我们可以告诉 ripgrep 搜索任何文件，但不要 `*.toml`文件:

```
$ rg clap -g '!*.toml'
[lots of results]
```

这将给你更多的结果，但它们不会包含结尾`.toml`的文件。 注意使用 了一个`!`，这里的意思是"否定"(有点不规范)，但选择它是与写入`.gitignore`文件的"glob"保持对应性。。(虽然意思颠倒了。在`.gitignore`文件，一个前缀`!`意味着白名单，在命令行上`!`意味着黑名单。

Globs 的解释方式与`.gitignore`模式完全相同。也就是说，后 glob 将取代早 glob。例如，下面的命令将只搜索`*.toml`文件夹:

```
$ rg clap -g '!*.toml' -g '*.toml'
```

有趣的是，在这种情况下，调换 globs 的顺序将不匹配任何内容，因为白名单的存在，让搜索范围局限与此。

### 手动过滤:文件类型

随着时间的推移，你可能会注意到，你一遍遍地使用相同的 glob 模式。例如，您可能发现自己正在进行许多搜索，其中只希望看到 Rust 文件的结果:

```
$ rg 'fn run' -g '*.rs'
```

不是每次都写 glob，也可以使用 ripgrep 支持的文件类型:

```
$ rg 'fn run' --type rust
```

或者，更简洁点，

```
$ rg 'fn run' -trust
```

`--type`标志方式的函数很简单，给出一个具体名称(将被分配给一个或多个匹配相关文件)的 globs。这可以让您编写一个可能包含一定范围的文件扩展名的单一类型。例如，如果要搜索 C 文件，必须同时检查 C 源文件和 C 头文件:

```
$ rg 'int main' -g '*.{c,h}'
```

或者你可以只使用 C 文件类型:

```
$ rg 'int main' -tc
```

正如，你可以写黑名单 glob，你也可以黑名单文件类型:

```
$ rg clap --type-not rust
```

或者，更简洁点，

```
$ rg clap -Trust
```

也就是说，`-t`意味着"包括这种类型的文件"，`-T`意思是"排除这种类型的文件".

要看到组成一个类型的 glob 模式，运行`rg --type-list`:

```
$ rg --type-list | rg '^make:'
make: *.mak, *.mk, GNUmakefile, Gnumakefile, Makefile, gnumakefile, makefile
```

默认情况下，ripgrep 附带了一堆预定义类型。一般来说，这些类型对应于众所周知的公共格式。但是你也可以定义你自己的类型。例如，您可能经常搜索"Web"文件，该文件由 JavaScript、HTML 和 CSS 组成:

```
$ rg --type-add 'web:*.html' --type-add 'web:*.css' --type-add 'web:*.js' -tweb title
```

或者，更简洁点，

```
$ rg --type-add 'web:*.{html,css,js}' -tweb title
```

上面的命令定义了一个新的类型，`web`，对应于 glob 模式`*.{html,css,js}`。 然后应用新的过滤标志`-tweb`，寻找`title`匹配。如果你运行

```
$ rg --type-add 'web:*.{html,css,js}' --type-list
```

然后你会看到你的`web`类型显示在列表中，即使它不是 ripgrep 内置类型。

这里要强调的是`--type-add`标志只适用于当前命令。它不添加新的文件类型，并将其保存在某个持久窗体中。如果希望在每个 ripgrep 命令中可以使用类型，则应该创建一个 shell 别名:

```
alias rg="rg --type-add 'web:*.{html,css,js}'"
```

或添加`--type-add=web:*.{html,css,js}`到您的 ripgrip 配置文件。([配置文件](#configuration-file)稍后，将更详细点明)。

### 替换

ripgrep 通过将匹配的文本替换为其他文本，提供了有限的内容修改能力。这是最容易用一个例子来解释的。当我们在 ripgrep 的 README 中，搜索这个`fast`词的时候?

```
$ rg fast README.md
75:  faster than both. (N.B. It is not, strictly speaking, a "drop-in" replacement
88:  color and full Unicode support. Unlike GNU grep, `ripgrep` stays fast while
119:### Is it really faster than everything else?
124:Summarizing, `ripgrep` is fast because:
129:  optimizations to make searching very fast.
```

如果我们想*替换*所有的`fast`到`FAST`?这对 ripgrep 来说很容易。使用`--replace`标志:

```
$ rg fast README.md --replace FAST
75:  FASTer than both. (N.B. It is not, strictly speaking, a "drop-in" replacement
88:  color and full Unicode support. Unlike GNU grep, `ripgrep` stays FAST while
119:### Is it really FASTer than everything else?
124:Summarizing, `ripgrep` is FAST because:
129:  optimizations to make searching very FAST.
```

或者，更简洁点,

```
$ rg fast README.md -r FAST
[snip]
```

本质上，`--replace`标志*只*应用输出中的文本匹配部分。如果要替换整行文本，则需要在匹配中包括整行。例如:

```
$ rg '^.*fast.*$' README.md -r FAST
75:FAST
88:FAST
119:FAST
124:FAST
129:FAST
```

或者，您可以组合`--only-matching`(或`-o`短的)和`--replace`标志实现相同的结果:

```
$ rg fast README.md --only-matching --replace FAST
75:FAST
88:FAST
119:FAST
124:FAST
129:FAST
```

或者，更简洁点，

```
$ rg fast README.md -or FAST
[snip]
```

最后，替换可以包括捕获组。例如，让我们说，我们想找到所有`fast`的，换成后面跟着另一个单词，然后用破折号加在一起。我们可以使用的匹配模式是`fast\s+(\w+)`，意思是`fast`后面是任意数量的空格，再后面是任意数量的"Word"字符。我们把`\w+`放在"捕获组"(用括号表示)中，以便以后在替换字符串中引用它。例如:

```
$ rg 'fast\s+(\w+)' README.md -r 'fast-$1'
88:  color and full Unicode support. Unlike GNU grep, `ripgrep` stays fast-while
124:Summarizing, `ripgrep` is fast-because:
```

我们在这里的替换字符串`fast-$1`，包括一个`fast-`，其次是一个捕获组的索引内容`1`。 (捕获组实际上从索引 0 开始，但是`0`th 捕捉组总是对应于整个匹配。而捕获组索引`1`总是对应于在正则表达式模式中，发现的第一个显式捕获组。

捕获组也可以被命名，这有时比使用索引更方便。例如，下面的命令等效于上面的命令:

```
$ rg 'fast\s+(?P<word>\w+)' README.md -r 'fast-$word'
88:  color and full Unicode support. Unlike GNU grep, `ripgrep` stays fast-while
124:Summarizing, `ripgrep` is fast-because:
```

值得注意的是，ripgrip**永远不会修改你的文件**。 这个`--replace`标志只控制 ripgrip 的输出。(并且没有标志，允许在文件中进行替换)。

### Configuration file

> 配置文件

在任何情况下，ripgrep 的默认选项都有可能不合适的。由于这个原因，并且由于 shell 别名，总不方便的，ripgrep 会有配置文件支持。

设置配置文件很简单。ripgrep 不会自动查看配置文件中的任何预定目录。相反，您需要设置`RIPGREP_CONFIG_PATH`环境变量，为配置文件的文件路径。一旦设置了环境变量，打开该文件，并输入您想要自动设置的标志。只有两个规则来描述与规范配置文件的格式:

**1.**  在修剪空格之后，每一行都是一个 shell 参数。
**2.**  以`#`开始的行(可选之前，任何数量的空格)被忽略。

特别是，没有转义。每一行都会逐字逐句给到 ripgrep ，作为命令行参数。

下面是一个配置文件的例子，它演示了一些格式化特性:

```
$ cat $HOME/.ripgreprc
# 别让 ripgrep 呕吐到我的终端，
--max-columns=150
# 还展示一个预览。
--max-column-preview

# 添加我的“网络”类型。
--type-add
web:*.{html,css,js}*

# 使用全局模式包括/排除文件或文件夹
--glob=!git/*

# 或
--glob
!git/*

# 设置颜色。
--colors=line:none
--colors=line:style:bold

# 因为谁在乎这个案子！？
--smart-case
```

当我们使用具有值的标志时，我们要么将标志和值放在同一行，但以`=`符号(例如，`--max-columns=150`或者，我们把标志和值放在两条不同的行上。这是因为 ripgrep 的参数分析器知道要处理单个参数。`--max-columns=150`作为一个有值的标志，但如果我们已经写了`--max-columns 150`在我们的配置文件中，ripgrip 的参数分析器不知道该怎么处理它。

把标志和值放在不同的行上是完全等价的，只是风格的问题。

鼓励注释，以便记住配置所做的事情。空行也可以。

所以假设您正在使用上面的配置文件，但是当您在终端时，您确实希望看到超过 150 列的行。那你应该做什么? 谢天谢地，你所需要做的，就是在命令行上传递`--max-columns 0`(或)`-M0`，它将覆盖配置文件的设置。这是因为 ripgrep 的配置文件是*预先准备的*，而在命令行上，你可以给出显式参数。由于稍后给出的标志重写标志，一切都按预期工作。这也适用于大多数其他标志，并且每个标志的文档会，说明哪些其他标志能覆盖它。

如果您对 ripgrep 从哪个配置文件读取参数感到困惑，那么使用`--debug`标志应该有助于澄清事物。调试的输出会注意到加载了什么配置文件以及从配置读取的参数。

最后，如果你想绝对确定 ripgrep*不是*读取配置文件，则可以传递`--no-config`标志，它总是阻止 ripgrep 从环境中读取额外的配置，而不管将来向 ripgrep 添加了其他什么配置方法。

### 文件编码

[Text encoding](https://en.wikipedia.org/wiki/Character_encoding)是一个复杂的话题，但我们可以尝试总结下它与 ripgrep 的关联性:

- 文件通常只是一组字节。没有可靠的方法知道它们的编码。
- 模式的编码必须与正在搜索的文件编码匹配，或者必须执行转换编码的形式，将模式或文件转换为与其他模式或文件相同的编码。
- ripgrep 最适合于纯文本文件，在纯文本文件中，最流行的编码可能由 ASCII、latin1 或 UTF-8 组成。作为一个特殊的例外，UTF 16 在 Windows 环境中很流行。

综上所述，`--encoding auto` 的 ripgrep 是如何表现的，下面是默认情况:

- 假设所有输入都是 ASCII 兼容的(这意味着对应于 ASCII 码点的每个字节实际上是 ASCII 码点)。这包括 ASCII 本身，latin1 和 UTF-8。
- ripgrip 最适合 UTF-8。例如，ripgrep 的正则表达式引擎支持 Unicode 特性。即字符类的`\w`将通过 Unicode 的定义匹配所有单词字符`。`将匹配任何 Unicode 码点，而不是任何字节。这些构造都假定为 UTF-8，因此当遇到不是 UTF-8 的文件中的字节时，它们根本不匹配。
- 为了处理 UTF16 的情况，ripgrep 将默认地执行所谓的"BOM 嗅探"。也就是说，文件的前三个字节将被读取，如果它们对应于 UTF-16BOM，那么 ripgrep 将把文件的内容从 UTF-16 转换为 UTF-8，然后对文件的转换版本执行搜索。(由于代码转换比正则表达式搜索慢，而导致性能损失)。(这会导致性能损失，因为转码比正则表达式搜索慢。) 如果该文件包含 无效的 UTF-16， 那么，Unicode 替换代码点，替换无效代码单元的位置。
- 为了处理其他情况，ripgrip 提供了一个`-E/--encoding`标志，它允许您从[标准 编码](https://encoding.spec.whatwg.org/#concept-encoding-get)指定。 ripgrep 将假设*全部的*搜索的文件是指定的编码 (除非，这文件有 BOM) ，并且将执行与上述 UTF-16 情况相同的转码步骤。

默认情况下，ripgrip 将不要求其输入为有效的 UTF-8。也就是说，ripgrep 可以，并且将搜索任意字节。这里的关键是，如果搜索的内容不是 UTF-8，那么模式的有用性就会降低。如果您正在搜索与 ASCII 不兼容的字节，那么模式很可能找不到任何内容。尽管如此，这种操作模式很重要，因为它可以让你在文件*在内部*找到 ASCII 或 UTF-8。否则为任意字节。

作为一个特殊例子， the `-E/--encoding` 支持 `none`值， 它会完全禁用，所有的相关编码逻辑，其中包括 BOM 嗅探。
若是 ripgrep 真把 `-E/--encoding` 设为 `none`， 它会在没有转码步骤的情况下，对底层文件的原始字节进行搜索。 例如， 这里有个你想搜索的，原始 UTF-16 编码字符串 `Шерлок`:

```
$ rg '(?-u)\(\x045\x04@\x04;\x04>\x04:\x04' -E none -a some-utf16-file
```

当然， 这只是一个示例，旨在说明，如何将其换成原始字节。 也就是说，有个更简单的命令可以自动运行：

```
$ rg 'Шерлок' some-utf16-file
```

最后，可以在正则表达式中禁用 ripgrep 的 Unicode 支持。例如，假设你想要`.`匹配任何字节，而不是任何 Unicode 代码点。(可能在搜索二进制文件时需要这个，因为`.`默认情况下将不匹配无效的 UTF-8。)可以通过通过正则表达式标志，禁用 Unicode 来实现这一点:

```
$ rg '(?-u:.)'
```

这适用于图案的任何部分。例如，以下将找到任何 Unicode 单词字符，后面跟随任何 ASCII 单词字符，后面跟随另一个 Unicode 单词字符:

```
$ rg '\w(?-u:\w)\w'
```

### 二进制数据

除了，跳过隐藏文件和在`.gitignore`内的文件，ripgrep 还会跳过 二进制文件。 ripgrep 默认这么做，是因为
二进制文件 (像 PDFs 或 images) ，基本上是你不想搜索的正则搜索匹配。 就算，二进制文件的内容匹配到了，然后可能会在你的终端，打印出不需要的二进制数据，群魔乱舞。

不幸的是，不像 跳过隐藏文件和 遵循 your `.gitignore`
规则，一个(搜索的)文件不能轻易归类为二进制文件。 为了弄清是否为二进制文件，平衡正确性和性能的最有效的启发式方法是简单地查找`NUL`字节。此时，判定很简单：当且仅当文件在其内容的某处，包含`NUL`字节时，文件才被视为“二进制”。

可问题是，虽大多数二进制文件，在其内容的开头有一个“NUL”字节，但这不一定是对的。 这个 `NUL` 字节 可能会在大文件中的很后的位置，但这样的文件仍考虑为二进制。这会导致 ripgrep 实现的复杂性，也会导致一些不直观的用户体验。

思维开阔，ripgrep 运转着三个不同模式，来遵循二进制文件:

**1.** **默认模式**，会试图在完整搜索，移除二进制文件。 这意味，做与 ripgrep 自动移除隐藏文件和 `.gitignore`中的文件一样的行为。 这样一旦，一个文件被认为是二进制，那就停止搜索下去。如果说，(该文件)已有匹配项(因为，可能匹配项在`NUL`字节前，出现) ，那么， ripgrep 会打印一个警告信息，表明搜索过早结束。 默认模式
   **仅适用，被 ripgrep 作为搜索递归目录结果的文件**，但还是会遵循 ripgrep ，其他的自动过滤(条件)。 例如，`rg foo .file` 会搜索 `.file` ，即便它是隐藏文件。 类似的，`rg foo binary-file` 会在自动在二进制模式下，搜索 `binary-file`。
**2.** **二进制模式**，与默认模式类似，除了在发现`NUL`字节之后，并不总是停止搜索。 换句话说，在这个模式下，ripgrep
   会继续，搜索知道是二进制的文件，直到出现以下二种情况的一种: **1)** 文件的结尾到了 或 **2)** 一个匹配项有被看到。这意味着，这个模式下，如果 ripgrep 报告没有匹配项，那么说明这个文件没有匹配。而若匹配确实出现，那么就打印与默认模式下，过早结束相似的信息。
   。可用 `--binary` 标志为所有文件强制启动该模式。该模式的目的是为了，提供一种在所有文件中匹配，但不会有二进制数据在你终端上乱舞的方式。
**3.** **文本模式**，完全禁用，所有的二进制检查，和若是文件是文本，就搜索全部。对主要是文本，但也包括`NUL`字节的文件来说，很有用，或者如果你特别想尝试搜索下二进制数据。 用 `-a/--text`标志启动该模式。
   注意，在大型二进制文件，使用该模式的话，ripgrep 可能会占有大量的内存。

再次不幸的是，ripgrep 还有一个额外的复杂性，让推理二进制文件变得困难。就是，二进制检测的工作方式取决于 ripgrep 搜索文件的方式 具体:

- 当 ripgrep 使用内存映射， 那么，除了每个去匹配的行之外，二进制检测仅在文件的前几千字节上执行。
- 若不使用内存映射，然后对搜索到的所有字节执行二进制检测。

这意味着文件是否被检测为二进制文件，会根据 ripgrep 使用的内部搜索策略，而发生改变。如果您更喜欢对 ripgrep 的二进制文件保持检测，那么你可以通过`--no-mmap`标志，不使用 内存映射。(在某些平台上搜索非常大的文件时，成本将是一个小的性能退步。)

### 常用选项

ripgrep 还有很多标志。太多了，一下子就记不起来了。本节将向您展示一些最重要和最常用的选项，这些选项可能会影响您定期使用 ripgrep 的方式。

| 名                 | 曰                                                                                                                                             |
| ------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| `-h`               | 显示 ripgrep 的浓缩帮助输出。                                                                                                                  |
| `--help`           | 显示 ripgrep 的更长形式的帮助输出。(几乎是你在 ripgrep 的 man 页面里找到的，所以把它变成一个传呼机!)                                            |
| `-i/--ignore-case` | 当搜索模式时，忽略案例差异。那就是`rg -i fast`匹配`fast`，`fASt`，`FAST`等。                                                                    |
| `-S/--smart-case`  | 这类似于`--ignore-case`但如果模式包含大写字母，则禁用它自己。通常将此标志放入别名或配置文件中。                                                |
| `-w/--word-regexp` | 要求图案的所有匹配都被单词边界包围。也就是说，给出`pattern`， the `--word-regexp`标志会使 ripgrep 表现得像`pattern`实际上是`\b(?:pattern)\b`。 |
| `-c/--count`       | 报告总匹配行的计数。                                                                                                                           |
| `--files`          | 打印 ripgrip *将要*搜索的文件，但不要实际搜索它们。                                                                                              |
| `-a/--text`        | 搜索二进制文件，就好像它们是纯文本一样。                                                                                                       |
| `-z/--search-zip`  | 搜索压缩文件(gzip, bzip2, lzma, xz, lz4, brotli, zstd)。默认情况下这是禁用的。                                                                 |
| `-C/--context`     | 显示匹配周围的行。                                                                                                                             |
| `--sort path`      | 强制 ripgrep 将其输出按文件名排序。(这禁用并行性，所以它可能会慢一些。)                                                                        |
| `-L/--follow`      | 在递归搜索的同时遵循符号链接。                                                                                                                 |
| `-M/--max-columns` | 限制 ripgrip 打印的行的长度。                                                                                                                  |
| `--debug`          | 显示 ripgrip 的调试输出。这对于理解为什么在搜索中可以忽略特定文件，或者 ripgrep 正在从环境中加载何种配置非常有用。                             |

[更多: v0.10.0 的 `rg -h` 的 帮助信息](./rg-0.10.0-h.zh.md)
