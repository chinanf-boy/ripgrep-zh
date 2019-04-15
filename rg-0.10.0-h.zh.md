## ripgrep 0.10.0

Andrew Gallant<mailto:jamslam@gmail.com>

ripgrep（rg）以递归方式在当前目录中搜索正则表达式模式。默认情况下，ripgrep 遵循您的.gitignore ，并自动跳过隐藏的文件/目录和二进制文件。

ripgrep 的默认正则表达式引擎，使用有限自动机，并保证搜索的线性时间。因此，不支持反向引用和任意环视等功能。但是，如果 ripgrep 是使用 PCRE2 构建的，那么`--pcre2` 标志可用于启用反向引用和环视。

> [环视: 在知乎找了个说明文](https://zhuanlan.zhihu.com/p/50789818)

ripgrep 支持配置文件。将 RIPGREP_CONFIG_PATH 设置配置文件。该文件可以为每行指定一个 shell 参数。以"＃"开头的行将被忽略。有关更多详细信息，请参见 man 页，或 readme 文件。

项目主页：<https://github.com/BurntSushi/ripgrep>

使用 `-h` 进行简短描述，并使用 `--help` 获取更多详细信息。

```bash
USAGE:
    rg [OPTIONS] PATTERN [PATH ...]
    rg [OPTIONS] [-e PATTERN ...] [-f PATTERNFILE ...] [PATH ...]
    rg [OPTIONS] --files [PATH ...]
    rg [OPTIONS] --type-list
    command | rg [OPTIONS] PATTERN

ARGS:
    <PATTERN>    一个正则表达式，用于搜素
    <PATH>...    要搜索的文件或目录.

OPTIONS:
```

| 标志                               | 曰                                                                                       |
| ---------------------------------- | ---------------------------------------------------------------------------------------- |
| `-A, --after-context <NUM>`        | 每次匹配后，显示 NUM 行。                                                                |
| `-B, --before-context <NUM>`       | 在每次匹配前，显示 NUM 行。                                                              |
| `--block-buffered`                 | 强制，分块缓冲。                                                                         |
| `-b, --byte-offset`                | 打印每个匹配行的，字节偏移量，从 0 开始。                                                |
| `-s, --case-sensitive`             | 搜索，关注大小写（默认）。                                                               |
| `--color <WHEN>`                   | 控制何时，使用颜色。                                                                     |
| `--colors <COLOR_SPEC>...`         | 配置颜色设置和样式。                                                                     |
| `--column`                         | 显示列号。                                                                               |
| `-C, --context <NUM>`              | 显示每场匹配前后的 NUM 行。                                                              |
| `--context-separator <SEPARATOR>`  | 设置，内容分隔符的字符串。                                                               |
| `-c, --count`                      | 仅显示每个文件的匹配行数。                                                               |
| `--count-matches`                  | 仅显示每个文件的单个匹配数。                                                             |
| `--crlf`                           | 支持 CRLF 行终止符（在 Windows 上很有用）。                                              |
| `--debug`                          | 显示，调试消息。                                                                         |
| `--dfa-size-limit <NUM+SUFFIX?>`   | regex DFA 的大小上限。                                                                   |
| `-E, --encoding <ENCODING>`        | 指定要搜索的文件的文本编码。                                                             |
| `-f, --file <PATTERNFILE>...`      | 从给定的文件模式中，搜索。                                                               |
| `--files`                          | 打印，要搜索的每个文件。                                                                 |
| `-l, --files-with-matches`         | 只打印，至少有一个匹配的路径。                                                           |
| `--files-without-match`            | 只打印，包含零个匹配项的路径。                                                           |
| `-F, --fixed-strings`              | 将模式，视为字面字符串。                                                                 |
| `-L, --follow`                     | 遵循，符号链接。                                                                         |
| `-g, --glob <GLOB>...`             | 包括或排除文件。                                                                         |
| `-h, --help`                       | 打印帮助信息。使用 `--help` 了解更多详细信息。                                           |
| `--heading`                        | 打印，按每个文件分组的匹配项。                                                           |
| `--hidden`                         | 搜索隐藏的文件和目录。                                                                   |
| `--iglob <GLOB>...`                | 不关心大小写，包括或排除的文件 glob 模式。                                               |
| `-i, --ignore-case`                | 不区分大小写的搜索。                                                                     |
| `--ignore-file <PATH>...`          | 指定，其他忽略文件。                                                                     |
| `-v, --invert-match`               | 反匹配。                                                                                 |
| `--json`                           | 以 JSON 行格式，显示搜索结果。                                                           |
| `--line-buffered`                  | 强制，行缓冲。                                                                           |
| `-n, --line-number`                | 显示行号。                                                                               |
| `-x, --line-regexp`                | 仅显示由行边界包围的匹配项。                                                             |
| `-M, --max-columns <NUM>`          | 不要打印，超过此限制的行。                                                               |
| `-m, --max-count <NUM>`            | 限制匹配数。                                                                             |
| `--max-depth <NUM>`                | 最多深入 NUM 个目录。                                                                    |
| `--max-filesize <NUM+SUFFIX?>`     | 忽略，大于 NUM 的文件。                                                                  |
| `--mmap`                           | 尽可能，使用内存映射进行搜索。                                                           |
| `-U, --multiline`                  | 启用，跨多行匹配。                                                                       |
| `--multiline-dotall`               | 启用多行时，使"."与新行匹配。                                                            |
| `--no-config`                      | 从不读取配置文件。                                                                       |
| `--no-filename`                    | 不要用匹配的行，打印文件路径。                                                           |
| `--no-heading`                     | 不要按每个文件，对匹配项进行分组。                                                       |
| `--no-ignore`                      | 不遵循忽略文件。                                                                         |
| `--no-ignore-global`               | 不遵循全局忽略文件。                                                                     |
| `--no-ignore-messages`             | 禁止 gitignore 解析的错误消息。                                                          |
| `--no-ignore-parent`               | 不遵循忽略父目录中的文件。                                                               |
| `--no-ignore-vcs`                  | 不要遵循 VCS 忽略文件。                                                                  |
| `-N, --no-line-number`             | 没有行号。                                                                               |
| `--no-messages`                    | 禁止显示某些错误消息。                                                                   |
| `--no-mmap`                        | 不使用内存映射。                                                                         |
| `--no-pcre2-unicode`               | 禁用 PCRE2 匹配的 Unicode 模式。                                                         |
| `-0, --null`                       | 在文件路径后，打印 NUL 字节。                                                            |
| `--null-data`                      | 使用 NUL 作为行终止符，而不是`\n`。                                                      |
| `--one-file-system`                | 不要深入，到其他文件系统的目录中。                                                       |
| `-o, --only-matching`              | 打印仅匹配行的部分内容。                                                                 |
| `--passthru`                       | 打印匹配行和不匹配行。                                                                   |
| `--path-separator <SEPARATOR>`     | 设置路径分隔符。                                                                         |
| `-P, --pcre2`                      | 启用 PCRE2 匹配。                                                                        |
| `--pre <COMMAND>`                  | 搜索每个文件的命令文件输出                                                               |
| `--pre-glob <GLOB>...`             | 从预处理命令中，包括或排除文件。                                                         |
| `-p, --pretty`                     | `--color always--heading--line-number`的别名。                                           |
| `-q, --quiet`                      | 不要将任何内容，打印到 stdout。                                                          |
| `--regex-size-limit <NUM+SUFFIX?>` | 已编译 regex 的大小上限。                                                                |
| `-e, --regexp <PATTERN>...`        | 要搜索的模式。                                                                           |
| `-r, --replace <REPLACEMENT_TEXT>` | 用给定的文本，替换匹配项。                                                               |
| `-z, --search-zip`                 | 在压缩文件中搜索。                                                                       |
| `-S, --smart-case`                 | 智能案例搜索。(如果它包含大写字符，则将查询视为区分大小写，如果不包含，则不区分大小写。) |
| `--sort <SORTBY>`                  | 按升序对结果排序。暗示 `--threads=1`。                                                   |
| `--sortr <SORTBY>`                 | 按降序对结果排序。暗示 `--threads=1`。                                                   |
| `--stats`                          | 打印有关此 ripgrep 搜索的统计信息。                                                      |
| `-a, --text`                       | 像搜索文本一样，搜索二进制文件。                                                         |
| `-j, --threads <NUM>`              | 要使用的线程的近似数。                                                                   |
| `--trim`                           | 从匹配项中，删除前缀空格。                                                               |
| `-t, --type <TYPE>...`             | 仅搜索，与类型匹配的文件。                                                               |
| `--type-add <TYPE_SPEC>...`        | 为文件类型，添加新的 glob。                                                              |
| `--type-clear <TYPE>...`           | 清除文件类型的全局变量。                                                                 |
| `--type-list`                      | 显示所有支持的文件类型。                                                                 |
| `-T, --type-not <TYPE>...`         | 不要搜索与类型匹配的文件。                                                               |
| `-u, --unrestricted`               | 降低"智能"搜索的级别。                                                                   |
| `-V, --version`                    | 打印版本信息                                                                             |
| `--vimgrep`                        | 以 Vim 兼容格式，显示结果。                                                              |
| `-H, --with-filename`              | 用匹配的行，打印文件路径。                                                               |
| `-w, --word-regexp`                | 只显示，由单词边界包围的匹配项。                                                         |
