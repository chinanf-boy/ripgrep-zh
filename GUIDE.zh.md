## 用户指南

本指南旨在提供ripgrep的基本描述及其功能概述.本指南假设ripgrep是[installed](README.md#installation)并且读者已经熟悉使用命令行工具.这也假定类似Unix的系统,尽管大多数命令可能很容易转换到任何命令行shell环境.

### 目录

-   [Basics](#basics)
-   [Recursive search](#recursive-search)
-   [Automatic filtering](#automatic-filtering)
-   [Manual filtering: globs](#manual-filtering-globs)
-   [Manual filtering: file types](#manual-filtering-file-types)
-   [Replacements](#replacements)
-   [Configuration file](#configuration-file)
-   [File encoding](#file-encoding)
-   [Common options](#common-options)

### 基本

ripgrep是一个命令行工具,可以在文件中搜索您提供的模式.ripgrep的行为就像逐行读取每个文件一样.如果一行与提供给ripgrep的模式匹配,那么将打印该行.如果线条与图案不匹配,则不打印该线条.

查看其工作原理的最佳方法是使用示例.为了展示一个例子,我们需要一些东西来搜索.让我们尝试搜索ripgrep的源代码.首先从中获取ripgrep源存档<https://github.com/BurntSushi/ripgrep/archive/0.7.1.zip>并提取它:

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

让我们通过查找所有出现的单词来尝试我们的第一次搜索`fast`在`README.md`:

```
$ rg fast README.md
75:  faster than both. (N.B. It is not, strictly speaking, a "drop-in" replacement
88:  color and full Unicode support. Unlike GNU grep, `ripgrep` stays fast while
119:### Is it really faster than everything else?
124:Summarizing, `ripgrep` is fast because:
129:  optimizations to make searching very fast.
```

(**注意:**如果您看到来自ripgrep的错误消息,说它没有搜索任何文件,那么请重新运行ripgrep`--debug`旗.一个可能的原因是你有一个`*`在...中的规则`$HOME/.gitignore`文件.)

那么这里发生了什么?ripgrep阅读的内容`README.md`,以及包含的每一行`fast`,ripgrep将它打印到您的终端.ripgrep默认还包括每行的行号.如果您的终端支持颜色,那么您的输出可能看起来像这个截图:

[![A screenshot of a sample search ripgrep](https://burntsushi.net/stuff/ripgrep-guide-sample.png)](https://burntsushi.net/stuff/ripgrep-guide-sample.png)

在这个例子中,我们搜索了一个叫做"文字"字符串的东西.这意味着我们的模式只是我们要求ripgrep查找的一些普通文本.但是ripgrep支持通过指定模式的能力[regular
expressions](https://en.wikipedia.org/wiki/Regular_expression).例如,如果我们想要查找所有行都包含一个单词,该怎么办?`fast`其次是一些其他字母?

```
$ rg 'fast\w+' README.md
75:  faster than both. (N.B. It is not, strictly speaking, a "drop-in" replacement
119:### Is it really faster than everything else?
```

在这个例子中,我们使用了模式`fast\w+`.此模式告诉ripgrep查找包含字母的任何行`fast`其次是*一个或多个*字样字符.也就是说,`\w`匹配组成单词的字符(如`a`和`L`但不像`.`和``)这个`+`后`\w`意味着,"匹配以前的模式一次或多次",这意味着这个词.`fast`不会匹配,因为后面没有单词字符.`t`. 但是一个词`faster`威尔.`faste`也会相配!

这里有一个不同的变化在这个相同的主题:

```
$ rg 'fast\w*' README.md
75:  faster than both. (N.B. It is not, strictly speaking, a "drop-in" replacement
88:  color and full Unicode support. Unlike GNU grep, `ripgrep` stays fast while
119:### Is it really faster than everything else?
124:Summarizing, `ripgrep` is fast because:
129:  optimizations to make searching very fast.
```

在这种情况下,我们使用`fast\w*`代替我们的模式`fast\w+`. 这个`*`意味着它应该匹配*零*或更多次.在这种情况下,RIPGRIP将打印与模式相同的行.`fast`但是如果你的终端支持颜色,你会注意到`faster`将突出显示而不仅仅是`fast`前缀.

提供关于正则表达式的完整教程超出了本指南的范围,但是ripgrep的特定语法在此进行文档化:<https://docs.rs/regex/0.2.5/regex/#syntax>

### 递归搜索

在前一节中,我们演示了如何使用ReReGRP来搜索单个文件.在本节中,我们将演示如何使用ReReGRP搜索文件的整个目录.事实上,*递归地*搜索当前工作目录是ripgrep的默认操作模式,这意味着这样做非常简单.

使用ripgrep源代码的解压归档文件,下面介绍如何查找名称为`write`:

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

(**注:**我们逃走了`(`这里因为`(`在正则表达式中具有特殊的意义.你也可以使用`rg -F 'fn write('`为了实现同样的事情,在哪里`-F`将您的模式解释为文字字符串,而不是正则表达式.

在这个例子中,我们根本没有指定一个文件.相反,RiReGRP默认在没有路径的情况下搜索当前目录.一般来说,`rg foo`相当于`rg foo ./`.

这个特殊的搜索显示了我们的结果.`src`和`termcolor`目录.这个`src`目录是核心ReReGRP代码`termcolor`是ReReGRP的一个依赖项(并且被其他工具使用).如果我们只想搜索核心RIPGRIP代码呢?这很简单,只需指定你想要的目录:

```
$ rg 'fn write\(' src
src/printer.rs
469:    fn write(&mut self, buf: &[u8]) {
```

在这里,RiReGRP将其搜索限制在`src`目录.做这个搜索的另一种方法是`cd`进入`src`目录及简单使用`rg 'fn
write\('`再一次.

### 自动滤波

在递归搜索之后,RIPGRIP最重要的特性是什么?*不*搜索.默认情况下,当搜索目录时,ReReGRP将忽略以下所有内容:

1.  与您的规则匹配的文件和目录`.gitignore`球状花纹
2.  隐藏的文件和目录.
3.  二进制文件.(ReReGRP考虑任何文件`NUL`字节为二进制.
4.  符号链接不被遵循.

所有这些东西都可以用RielGrp提供的各种标志来切换:

1.  你可以禁用`.gitignore`处理与`--no-ignore`旗帜.
2.  隐藏的文件和目录可以用`--hidden`旗帜.
3.  二进制文件可以通过`--text`(`-a`简而言之.小心这一面旗帜!二进制文件可以向终端发送控制字符,这可能会导致奇怪的行为.
4.  ReReGRP可以遵循与`--follow`(`-L`简而言之.

作为一种特殊的方便,ReReGRP还提供了一个称为`--unrestricted`(`-u`简而言之)重复使用此标志将导致RiReGRP禁用其越来越多的过滤.也就是说,`-u`将禁用`.gitignore`处理,`-uu`将搜索隐藏的文件和目录`-uuu`将搜索二进制文件.当您使用ripgrep并且不确定它的过滤是否对您隐藏结果时,这是非常有用的.缠住一对夫妇`-u`标志是一种快速的发现方法.(使用`--debug`如果你仍然困惑,如果没有帮助,[file an issue](https://github.com/BurntSushi/ripgrep/issues/new))

里普格雷普`.gitignore`处理实际上有点超出`.gitignore`文件夹.RIPGRIP还将尊重在库中发现的特定规则`$GIT_DIR/info/exclude`以及您的任何全局忽略规则`core.excludesFile`(通常是`$XDG_CONFIG_HOME/git/ignore`在类UNIX系统上.

有时你想搜索你的文件.`.gitignore`因此,可以在A中指定附加忽略规则或重写.`.ignore`(应用不可知论者)`.rgignore`(RIPGRIP特定)文件.

例如,假设你有一个`.gitignore`看起来像这样的文件:

```
log/
```

这通常意味着任何`log`目录不会被跟踪`git`. 然而,它可能包含您希望在搜索中包括的有用输出,但是您仍然不想跟踪它`git`. 你可以通过创建一个`.ignore`在同一目录中的文件`.gitignore`文件内容如下:

```
!log/
```

里普格雷普斯`.ignore`比优先级高的文件`.gitignore`文件(和对待)`.rgignore`比优先级高的文件`.ignore`文件).这意味着RiReGRP将看到`!log/`首先是白名单规则,然后搜索目录.

喜欢`.gitignore`A`.ignore`文件可以放在任何目录中.它的规则将对它所在的目录进行处理,就像`.gitignore`.

为了更深入地描述一个`.gitignore`文件被解释,请参阅`man gitignore`.

### 手动过滤:全球

在前一节中,我们讨论了ReReGRP的过滤,默认情况下它是这样做的.它是"自动"的,因为它对你的环境起反应.也就是说,它已经存在了.`.gitignore`生成更多相关搜索结果的文件.

除了自动过滤之外,RIPGRIP还提供更多的手动或自组织过滤.这有两种形式:在ripgrep命令和文件类型筛选中指定的其他glob模式.这一部分涵盖了GLUB模式,而下一部分则涵盖了文件类型过滤.

在我们的RIPGRIP源代码中(参见[Basics](#basics)有关如何获取要搜索的源归档的说明,我们假设希望查看哪些内容依赖于`clap`,我们的参数分析器.

我们可以做到这一点:

```
$ rg clap
[lots of results]
```

但这给我们展示了很多东西,我们只感兴趣的是我们写的地方.`clap`作为依赖关系.相反,我们可以限制自己使用TOML文件,这就是依赖项如何与Rust的构建工具Cargo:

```
$ rg clap -g '*.toml'
Cargo.toml
35:clap = "2.26"
51:clap = "2.26"
```

这个`-g '*.toml'`语法说,"确保搜索到的每个文件都匹配这个球模式."`'*.toml'`单引号防止壳膨胀`*`.

如果我们想要的话,我们可以告诉瑞普瑞普搜索任何东西.*但是* `*.toml`文件夹:

```
$ rg clap -g '!*.toml'
[lots of results]
```

这将给你更多的结果,但它们不会包含文件结尾.`.toml`. 注意使用A`!`这里的意思是"否定"有点不规范,但它被选择为与"全球化"的一致性.`.gitignore`文件被写入.(虽然意思颠倒了.在`.gitignore`文件,A`!`前缀意味着白名单,在命令行上`!`意味着黑名单.

GLUPS的解释方式完全相同.`.gitignore`模式.也就是说,后环球将取代早期环球.例如,下面的命令将只搜索`*.toml`文件夹:

```
$ rg clap -g '!*.toml' -g '*.toml'
```

有趣的是,在这种情况下,颠倒全局词的顺序将不匹配任何内容,因为至少一个非黑名单全局词的存在将规定搜索的每个文件必须匹配至少一个全局词.在这种情况下,黑名单glob优先于前一个glob,并完全防止搜索任何文件!

### 手动过滤:文件类型

随着时间的推移,你可能会注意到,你一遍遍地使用相同的GLUB模式.例如,您可能发现自己正在进行许多搜索,其中只希望看到Rust文件的结果:

```
$ rg 'fn run' -g '*.rs'
```

不是每次都写GLUB,也可以使用ReReGRP支持文件类型:

```
$ rg 'fn run' --type rust
```

或者,更简洁地说,

```
$ rg 'fn run' -trust
```

方式`--type`标志函数很简单.它作为一个名称被分配给一个或多个匹配相关文件的GLUs.这可以让您编写一个可能包含范围广泛的文件扩展名的单一类型.例如,如果要搜索C文件,必须同时检查C源文件和C头文件:

```
$ rg 'int main' -g '*.{c,h}'
```

或者你可以只使用C文件类型:

```
$ rg 'int main' -tc
```

正如你可以写黑名单环球,你也可以黑名单文件类型:

```
$ rg clap --type-not rust
```

或者,更简洁地说,

```
$ rg clap -Trust
```

也就是说,`-t`意味着"包括这种类型的文件"`-T`意思是"排除这种类型的文件".

要看到组成一个类型的球,运行`rg --type-list`:

```
$ rg --type-list | rg '^make:'
make: *.mak, *.mk, GNUmakefile, Gnumakefile, Makefile, gnumakefile, makefile
```

默认情况下,RiReGRP附带了一堆预定义类型.一般来说,这些类型对应于众所周知的公共格式.但是你也可以定义你自己的类型.例如,您可能经常搜索"Web"文件,该文件由JavaScript、HTML和CSS组成:

```
$ rg --type-add 'web:*.html' --type-add 'web:*.css' --type-add 'web:*.js' -tweb title
```

或者,更简洁地说,

```
$ rg --type-add 'web:*.{html,css,js}' -tweb title
```

上面的命令定义了一个新的类型,`web`,对应于球`*.{html,css,js}`. 然后应用新的滤波器.`-tweb`寻找模式`title`. 如果你跑

```
$ rg --type-add 'web:*.{html,css,js}' --type-list
```

然后你会看到你的`web`类型显示在列表中,即使它不是RiReGRP内置类型的一部分.

这里要强调的是`--type-add`标志只适用于当前命令.它不添加新的文件类型,并将其保存在某个持久窗体中.如果希望在每个ripgrep命令中可以使用类型,则应该创建一个shell别名:

```
alias rg="rg --type-add 'web:*.{html,css,js}'"
```

或添加`--type-add=web:*.{html,css,js}`到您的RIPGRIP配置文件.([Configuration files](#configuration-file)稍后将更详细地说明.

### 替代品

ripgrep通过将匹配的文本替换为其他文本来修改其输出提供了有限的能力.这是最容易用一个例子来解释的.记得当我们搜索这个词的时候`fast`里弗雷普的自述?

```
$ rg fast README.md
75:  faster than both. (N.B. It is not, strictly speaking, a "drop-in" replacement
88:  color and full Unicode support. Unlike GNU grep, `ripgrep` stays fast while
119:### Is it really faster than everything else?
124:Summarizing, `ripgrep` is fast because:
129:  optimizations to make searching very fast.
```

如果我们想*代替*所有的发生`fast`具有`FAST`?这对ripgrep来说很容易.`--replace`旗帜:

```
$ rg fast README.md --replace FAST
75:  FASTer than both. (N.B. It is not, strictly speaking, a "drop-in" replacement
88:  color and full Unicode support. Unlike GNU grep, `ripgrep` stays FAST while
119:### Is it really FASTer than everything else?
124:Summarizing, `ripgrep` is FAST because:
129:  optimizations to make searching very FAST.
```

或者,更简洁地说,

```
$ rg fast README.md -r FAST
[snip]
```

本质上,`--replace`标志应用*只有*到输出中文本的匹配部分.如果要替换整行文本,则需要在匹配中包括整行.例如:

```
$ rg '^.*fast.*$' README.md -r FAST
75:FAST
88:FAST
119:FAST
124:FAST
129:FAST
```

或者,您可以组合`--only-matching`(或)`-o`简而言之)`--replace`标志实现相同的结果:

```
$ rg fast README.md --only-matching --replace FAST
75:FAST
88:FAST
119:FAST
124:FAST
129:FAST
```

或者,更简洁地说,

```
$ rg fast README.md -or FAST
[snip]
```

最后,替换可以包括捕获组.例如,让我们说,我们想找到所有发生的事情.`fast`后面跟着另一个单词,然后用短线加在一起.我们可以使用的模式是`fast\s+(\w+)`哪些匹配`fast`后面是任意数量的空白,后面是任意数量的"Word"字符.我们把`\w+`在"捕获组"(用括号表示)中,以便以后在替换字符串中引用它.例如:

```
$ rg 'fast\s+(\w+)' README.md -r 'fast-$1'
88:  color and full Unicode support. Unlike GNU grep, `ripgrep` stays fast-while
124:Summarizing, `ripgrep` is fast-because:
```

我们的替换字符串在这里,`fast-$1`包括`fast-`其次是索引的捕获组的内容`1`. (捕获组实际上从索引0开始,但是`0`Th捕捉组总是对应于整个匹配.索引中的捕获组`1`总是对应于在正则表达式模式中发现的第一个显式捕获组.

捕获组也可以被命名,这有时比使用索引更方便.例如,下面的命令等效于上面的命令:

```
$ rg 'fast\s+(?P<word>\w+)' README.md -r 'fast-$word'
88:  color and full Unicode support. Unlike GNU grep, `ripgrep` stays fast-while
124:Summarizing, `ripgrep` is fast-because:
```

值得注意的是,RIPGRIP**永远不会修改你的文件**. 这个`--replace`标志只控制RIPGRIP的输出.(并且没有标志允许您在文件中进行替换).

### 配置文件

在任何情况下,ReReGRP的默认选项都是不合适的.由于这个原因,并且由于shell别名并不总是方便的,ripgrep支持配置文件.

设置配置文件很简单.ReReGRIP不会自动查看配置文件中的任何预定目录.相反,您需要设置`RIPGREP_CONFIG_PATH`环境变量到配置文件的文件路径.一旦设置了环境变量,打开该文件并输入您想要自动设置的标志.只有两个规则来描述配置文件的格式:

1.  每一行都是一个shell参数,在修剪ASCII空白之后.
2.  线开始`#`(可选之前,任何数量的ASCII空白)被忽略.

特别是,没有逃脱.每一行都是以RiGRIPP作为逐字逐句的命令行参数给出的.

下面是一个配置文件的例子,它演示了一些格式化特性:

```
$ cat $HOME/.ripgreprc
# Don't let ripgrep vomit really long lines to my terminal.
--max-columns=150

# Add my 'web' type.
--type-add
web:*.{html,css,js}*

# Using glob patterns to include/exclude files or folders
--glob=!git/*

# or
--glob
!git/*

# Set the colors.
--colors=line:none
--colors=line:style:bold

# Because who cares about case!?
--smart-case
```

当我们使用具有值的标志时,我们要么将标志和值放在同一行,但以`=`符号(例如,`--max-columns=150`或者,我们把国旗和价值放在两条不同的线上.这是因为ReReGRP的参数分析器知道要处理单个参数.`--max-columns=150`作为一个有价值的旗帜,但如果我们已经写了`--max-columns 150`在我们的配置文件中,RIPGRIP的参数分析器不知道该怎么处理它.

把旗帜和价值放在不同的线条上是完全等价的,是风格的问题.

鼓励注释,以便记住配置所做的事情.空行也可以.

所以假设您正在使用上面的配置文件,但是当您在终端时,您确实希望看到超过150列的行.你是做什么的?谢天谢地,你所需要做的就是通过.`--max-columns 0`(或)`-M0`在命令行上,它将覆盖配置文件的设置.这是因为ReReGRP的配置文件是*预先准备的*对于显式参数,您可以在命令行上给出.由于稍后给出的标志重写标志,一切都按预期工作.这也适用于大多数其他标志,并且每个标志的文档说明哪些其他标志覆盖它.

如果您对ripgrep从哪个配置文件读取参数感到困惑,那么使用`--debug`旗帜应该有助于澄清事物.调试输出应注意正在加载什么配置文件以及从配置读取的参数.

最后,如果你想绝对确定RiReGRP*不是*读取配置文件,则可以通过`--no-config`标志,它总是阻止ripgrep从环境中读取额外的配置,而不管将来向ripgrep添加了什么其他配置方法.

### 文件编码

[Text encoding](https://en.wikipedia.org/wiki/Character_encoding)是一个复杂的话题,但我们可以尝试总结它与RiReGRP的关联性:

-   文件通常只是一组字节.没有可靠的方法知道它们的编码.
-   模式的编码必须与正在搜索的文件的编码匹配,或者必须执行转换编码的形式,将模式或文件转换为与其他模式或文件相同的编码.
-   ripgrep最适合于纯文本文件,在纯文本文件中,最流行的编码可能由ASCII、拉丁1或UTF-8组成.作为一个特殊的例外,UTF 16在Windows环境中很流行.

综上所述,RiffGRIP是如何表现的:

-   假设所有输入都是ASCII兼容的(这意味着对应于ASCII码点的每个字节实际上是ASCII码点).这包括ASCII本身,LATIN1和UTF-8.
-   RIPGRIP最适合UTF-8.例如,ReReGRP的正则表达式引擎支持Unicode特性.即字符类`\w`将通过Unicode的定义匹配所有单词字符`.`将匹配任何Unicode代码点,而不是任何字节.这些构造假定为UTF-8,因此当遇到不是UTF-8的文件中的字节时,它们根本不匹配.
-   为了处理UTF16的情况,ReReGRIP将默认地执行所谓的"BOM嗅探".也就是说,文件的前三个字节将被读取,如果它们对应于UTF-16BOM,那么ripgrep将把文件的内容从UTF-16转换为UTF-8,然后对文件的转换版本执行搜索.(这是由于代码转换比正则表达式搜索慢而导致性能损失).
-   为了处理其他情况,RIPGRIP提供了一个`-E/--encoding`标志,它允许您从[Encoding Standard](https://encoding.spec.whatwg.org/#concept-encoding-get). 里普雷普将承担*全部的*搜索的文件是指定的编码,并且将执行与上述UTF-16情况相同的转码步骤.

默认情况下,RIPGRIP将不要求其输入为有效的UTF-8.也就是说,ReReGRP可以并且将搜索任意字节.这里的关键是,如果搜索的内容不是UTF-8,那么模式的有用性就会降低.如果您正在搜索与ASCII不兼容的字节,那么模式很可能找不到任何内容.尽管如此,这种操作模式很重要,因为它可以让你找到ASCII或UTF-8.*在内部*否则为任意字节的文件.

最后,可以在模式正则表达式中禁用ripgrep的Unicode支持.例如,假设你想要`.`匹配任何字节而不是任何Unicode代码点.(可能在搜索二进制文件时需要这个,因为`.`默认情况下将不匹配无效的UTF-8.)可以通过通过正则表达式标志禁用Unicode来实现这一点:

```
$ rg '(?-u:.)'
```

这适用于图案的任何部分.例如,以下将找到任何Unicode单词字符,后面跟随任何ASCII单词字符,后面跟随另一个Unicode单词字符:

```
$ rg '\w(?-u:\w)\w'
```

### 共同选项

里普雷普有很多旗帜.太多了,一下子就记不起来了.本节将向您展示一些最重要和最常用的选项,这些选项可能会影响您定期使用ripgrep的方式.

-   `-h`显示RiReGRP的浓缩帮助输出.
-   `--help`显示RiReGRP的更长形式的帮助输出.(几乎是你在RiReGRP的男人页面里找到的,所以把它变成一个传呼机!)
-   `-i/--ignore-case`当搜索模式时,忽略案例差异.那就是`rg -i fast`比赛`fast`,`fASt`,`FAST`等.
-   `-S/--smart-case`这类似于`--ignore-case`但如果模式包含大写字母,则禁用它自己.通常将此标志放入别名或配置文件中.
-   `-w/--word-regexp`要求图案的所有匹配都被单词边界包围.也就是说,给出`pattern`, the `--word-regexp`旗帜会使RiReGRP表现得像`pattern`实际上是`\b(?:pattern)\b`.
-   `-c/--count`报告总匹配线的计数.
-   `--files`打印RIPGRIP文件*将*搜索,但不要实际搜索它们.
-   `-a/--text`搜索二进制文件,就好像它们是纯文本一样.
-   `-z/--search-zip`搜索压缩文件(GZIP,BZIP2,LZMA,XZ).默认情况下这是禁用的.
-   `-C/--context`显示比赛周围的线.
-   `--sort-files`强制RiReGRP将其输出按文件名排序.(这禁用并行性,所以它可能会慢一些.)
-   `-L/--follow`在递归搜索的同时遵循符号链接.
-   `-M/--max-columns`限制RIPGRIP打印的行的长度.
-   `--debug`显示RIPGRIP的调试输出.这对于理解为什么在搜索中可以忽略特定文件,或者ripgrep正在从环境中加载何种配置非常有用.
