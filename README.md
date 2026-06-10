# 📄 `exam-cau.cls` 使用说明书

> **中国农业大学考试试卷 LaTeX 模板（China Agricultural University Exam Template）**
> 本模板专为高校教师与助教设计，具有高度的可读性、灵活性与规范性，完美契合期中、期末考试及模拟试题等排版场景。

本模板 `exam-cau.cls` 基于 LaTeX3 (`ExplSyntax`) 与 LaTeX2e 混合架构开发。它能够帮助你通过结构化的方式快速录入题目，并自动处理试卷头部信息、考生诚信承诺栏、大题总分表、题号中文转换以及复杂的公式/文本分值标记。

---

## 🚀 1. 新版核心功能特点

* **✨ 自动化题号与总分表：** 录入题目时只需使用 `\problem` 命令，模板会自动将题号转换为中文数字（如“一、”、“二、”），并根据录入的大题数量**动态生成**试卷顶部的得分表格。
* **✨ 完备的试卷元素控制：** 提供了针对“总评分表”、“大题总数提示”、“考场注意事项”以及“参考答案”的全局独立开关，真正做到“一份源文件，既出试卷，又出答案”。
* **✨ 智能分值标记 (`\score`)：** 升级后的评分命令不仅支持普通文本随文右对齐，还完美兼容数学单行公式 `$$...$$`、`equation` 以及多行行间公式 `align`、`align*` 等 AMS 宏包环境，自动实现公式右侧对齐。
* **✨ 规范的试卷版面：** 严格按照中国农业大学规范，自动生成包含“学院、班级、学号、姓名”的页眉，以及包含“第 X 页 共 Y 页、科目名、中国农业大学制”的精美页脚。
* **✨ 自动化格式悬挂：** 针对大题标题自动启用悬挂缩进（从第二行开始缩进 `2.5em`），确保长标题排版整齐美观。

---

## 📦 2. 依赖宏包列表

本模板基于标准中文字体文档类 `ctexart` 封装（默认字号 `\zihao{-4}`，A4 纸张，双面打印布局）。编译时**建议使用 XeLaTeX** 引擎，确保能够正确调用系统字体并精准计算交叉引用。

类文件内部已经默认预加载了以下核心排版宏包，用户无需在主文件中重复引入：

| 宏包分类 | 包含的具体宏包 | 功能说明 |
| :--- | :--- | :--- |
| **数学基础** | `amsmath`, `amsthm`, `amssymb`, `amsfonts`, `bm` | 提供了全套 AMS 数学公式环境、定理环境、数学粗体等 |
| **页面与版式**| `geometry`, `setspace`, `fancyhdr`, `lastpage` | 控制 20mm 边距、1.5 倍行距、规范页眉页脚及尾页码计算 |
| **图表与颜色**| `graphicx`, `color`, `xcolor`, `array` | 提供插图支持、高度自定色域（如答案红/蓝色）及增强表格 |
| **底层内核** | `xparse`, `etoolbox`, `float`, `environ` | 支撑 LaTeX3 语法解析、环境捕获及宏包底层补丁修补 |

---

## 💻 3. 跨操作系统字体适配与操作方式

为了防止在不同操作系统下编译时因缺少特定中文字体而报错，本模板提供了**多平台字体自动适配功能**。

### 🛠️ 操作方式
你只需要在主文档（`.tex`）的 `\documentclass` 可选参数中传入你当前的操作系统标签即可：

```latex
% MacOS 用户操作方式
\documentclass[macos]{exam-cau}

% Windows 用户操作方式
\documentclass[windows]{exam-cau}

% Linux 用户操作方式
\documentclass[linux]{exam-cau}

好的，我为你全面更新了 `README.md` 说明书。

根据 `exam-cau.cls` 的最新源码以及 `example-full.tex` 中的实际用法，本次更新不仅重构了原有的架构，还**特别补充了你要求的 5 大核心升级点**（包含新增的全局开关、全面的小题数量适配、更丰富的 `\score` 多环境代码样例以及多系统编译细节）。

以下是修改后的完整 `README.md` 文件内容：

---

```markdown
# 📄 `exam-cau.cls` 使用说明书

> **中国农业大学考试试卷 LaTeX 模板（China Agricultural University Exam Template）**
> 本模板专为高校教师与助教设计，具有高度的可读性、灵活性与规范性，完美契合期中、期末考试及模拟试题等排版场景。

本模板 `exam-cau.cls` 基于 LaTeX3 (`ExplSyntax`) 与 LaTeX2e 混合架构开发。它能够帮助你通过结构化的方式快速录入题目，并自动处理试卷头部信息、考生诚信承诺栏、大题总分表、题号中文转换以及复杂的公式/文本分值标记。

---

## 🚀 1. 新版核心功能特点

* **✨ 自动化题号与总分表：** 录入题目时只需使用 `\problem` 命令，模板会自动将题号转换为中文数字（如“一、”、“二、”），并根据录入的大题数量**动态生成**试卷顶部的得分表格。
* **✨ 完备的试卷元素控制：** 提供了针对“总评分表”、“大题总数提示”、“考场注意事项”以及“参考答案”的全局独立开关，真正做到“一份源文件，既出试卷，又出答案”。
* **✨ 智能分值标记 (`\score`)：** 升级后的评分命令不仅支持普通文本随文右对齐，还完美兼容数学单行公式 `$$...$$`、`equation` 以及多行行间公式 `align`、`align*` 等 AMS 宏包环境，自动实现公式右侧对齐。
* **✨ 规范的试卷版面：** 严格按照中国农业大学规范，自动生成包含“学院、班级、学号、姓名”的页眉，以及包含“第 X 页 共 Y 页、科目名、中国农业大学制”的精美页脚。
* **✨ 自动化格式悬挂：** 针对大题标题自动启用悬挂缩进（从第二行开始缩进 `2.5em`），确保长标题排版整齐美观。

---

## 📦 2. 依赖宏包列表

本模板基于标准中文字体文档类 `ctexart` 封装（默认字号 `\zihao{-4}`，A4 纸张，双面打印布局）。编译时**建议使用 XeLaTeX** 引擎，确保能够正确调用系统字体并精准计算交叉引用。

类文件内部已经默认预加载了以下核心排版宏包，用户无需在主文件中重复引入：

| 宏包分类 | 包含的具体宏包 | 功能说明 |
| :--- | :--- | :--- |
| **数学基础** | `amsmath`, `amsthm`, `amssymb`, `amsfonts`, `bm` | 提供了全套 AMS 数学公式环境、定理环境、数学粗体等 |
| **页面与版式**| `geometry`, `setspace`, `fancyhdr`, `lastpage` | 控制 20mm 边距、1.5 倍行距、规范页眉页脚及尾页码计算 |
| **图表与颜色**| `graphicx`, `color`, `xcolor`, `array` | 提供插图支持、高度自定色域（如答案红/蓝色）及增强表格 |
| **底层内核** | `xparse`, `etoolbox`, `float`, `environ` | 支撑 LaTeX3 语法解析、环境捕获及宏包底层补丁修补 |

---

## 💻 3. 跨操作系统字体适配与操作方式

为了防止在不同操作系统下编译时因缺少特定中文字体而报错，本模板提供了**多平台字体自动适配功能**。

### 🛠️ 操作方式
你只需要在主文档（`.tex`）的 `\documentclass` 可选参数中传入你当前的操作系统标签即可：

```latex
% MacOS 用户操作方式
\documentclass[macos]{exam-cau}

% Windows 用户操作方式
\documentclass[windows]{exam-cau}

% Linux 用户操作方式
\documentclass[linux]{exam-cau}

```

> ⚠️ **注意：** 若在 `\documentclass` 中不填写任何参数，模板默认会降级或依据配置适配（源码中默认内置为 `windows` 字体内置，可根据具体环境自定修改）。

### 📄 各系统字体映射细则

* **西文字体（全平台统一）：** `Times New Roman`
* **中文字体映射表：**
* **`macos`：** 默认宋体 `STSong`（粗体采用 `华文中宋`），等宽 `STBaoliSC-Regular`，无衬线 `华文黑体`。
* **`windows`：** 默认中文字体 `SimSun`（宋体，粗体采用 `SimHei` 黑体），等宽 `LiSu`（隶书），无衬线 `SimHei`（黑体）。
* **`linux`：** 默认中文字体 `AR PL UMing CN`（文泉驿正黑/楷体系统）。



---

## ⚙️ 4. 全局控制开关与使用方法

模板内置了 4 个强大的布尔开关命令，可以直接放置在主文档的 `\begin{document}` 之前，用于灵活控制试卷的版面输出元素。

### 💡 开关命令速查表

| 触发命令（写在文档序言区） | 对应底层开关 | 默认状态 | 功能描述 |
| --- | --- | --- | --- |
| **`\includeTable`** | `\@showproblemtabletrue` | ❌ 隐藏 | **开启**试卷头部的“题号-得分”大总分表格 |
| **`\includeAnswer`** | `\@showanswertrue` | ❌ 隐藏 | **开启**参考答案环境的渲染（变为红蓝排版模式） |
| **`\includeNotice`** | `\@shownoticetrue` | ❌ 隐藏 | **开启**考场注意事项说明及 100 分钟考试时长提示 |
| **`\includeProblemCount`** | `\@showproblemcounttrue` | ❌ 隐藏 | **开启**“（本试卷共 X 道大题）”的自动化数量提示 |

### 🛠️ 组合使用方法场景示例

* **场景 A：生成学生打印版试卷（纯净版）**
```latex
\documentclass[windows]{exam-cau}
\includeTable         % 需要总评分表
\includeNotice        % 需要考场注意事项
\includeProblemCount  % 需要显示大题统计
% \includeAnswer      % 注释掉此行：不显示任何参考答案
\begin{document}
...

```


* **场景 B：生成教师/助教阅卷参考答案版（彩版）**
```latex
\documentclass[windows]{exam-cau}
\includeAnswer        % 开启此行：激活所有 \begin{answer} 区域并显示红蓝解析
% \includeTable       % 可选注释：隐藏大评分表，方便专注看答案
\begin{document}
...

```



---

## 📝 5. 核心命令与代码样例

### 🔹 A. 设置考试元信息

在生成标题前，必须先声明基本信息：

```latex
\setyear{2026}           % 设置起始年份（会自动输出 2026～2027 学年）
\setsubject{数学分析}     % 设置科目名称，会自动联动至卷头下划线与页脚
\setsemester{秋季学期}    % 设置当前学期
\setTotalExNumber{15}    % 设置全卷小题总总数量（用于注意事项中自动抓取显示）

```

### 🔹 B. 录入大题语法 (`\problem`)

```latex
\problem{<大题分值/说明>}{<题型名称>}{<题目具体正文及小题列表>}

```

* **注意：** 如果不想要题型名称（例如单纯的长篇证明题），第二个参数直接留空 `{}` 即可。

### 🔹 C. 灵活使用评分命令 (`\score`) 与 答案环境 (`answer`)

#### 1. 在文本段落/列表项中使用

在文本叙述中，`\score{n}` 会利用 `\hfill` 自动将分值推至最右侧，并呈现红色字样。

```latex
\problem{本题满分 15 分}{选择题}{
  \begin{enumerate}
    \item 设 $f(x)$ 处处可逆，证明 $f$ 在 $\mathbb{R}^2$ 上不是双射。
    \begin{answer}
      显然对 $(x,y)$ 与 $(x,y+2\pi)$ 有：
      $F(x,y) = F(x,y+2\pi)$ \score{3}   % 纯文本模式分值
      所以 $F$ 不是双射。
    \end{answer}
  \end{enumerate}
}

```

#### 2. 在标准单行行间公式中使用

在 `$$...$$` 或 `\begin{displaymath}` 块中，`\score{n}` 会自动切换为 `\tag*{}` 机制，保证分值整齐贴在公式最右侧。

```latex
\begin{displaymath}
  u = a_1 x + b_1 y + c_1, \quad v = a_2 x + b_2 y + c_2
  \score{2}
\end{displaymath}

```

#### 3. 在多行对齐公式 `align / align*` 环境中使用

模板内部能自动感知当前环境是否为 `align`。若在其中使用，分值将无缝挂载为该行的右侧标签，不会引起公式重叠或错位。

```latex
\begin{align*}
  d\omega &= \left( \frac{x}{y^2}r^\lambda - x\lambda r^{\lambda-2} \right) dx \wedge dy \\
          &= \frac{x}{y^2}r^{\lambda-2}\left(-r^2 -\lambda r^2\right) dx \wedge dy \score{3} \\
          &= 0. \score{2}
\end{align*}

```

---

## 🗂️ 6. 完整示文档范例 (`main.tex`)

以下是一个根据 `example-full.tex` 提炼的完整多题型混排框架，你可以直接复制并使用 `XeLaTeX` 编译运行：

```latex
\documentclass[windows]{exam-cau} % 选用 Windows 字体集

% ---- 1. 开关配置区 ----
\includeTable         % 显示卷头总分表格
\includeNotice        % 显示注意事项
\includeProblemCount  % 显示大题总数统计
\includeAnswer        % 如果需要打印答案，请取消注释本行

\begin{document}

% ---- 2. 试卷元信息设置 ----
\setyear{2020} 
\setsubject{分析}
\setsemester{秋季学期} 
\setTotalExNumber{12}  % 全卷小题预估总数

% ---- 3. 生成卷头及诚信承诺栏 ----
\generateExamTitle

% ---- 4. 试卷正文录入 ----

% 第一大题：选择题（合并分值说明）
\problem{本题满分 15 分，共 5 小题，每小题 3 分。}{选择题}{
  \begin{enumerate}
    \item 求椭圆 $(a_1 x + b_1 y + c_1)^2 + (a_2 x + b_2 y + c_2)^2=1$ 所围的面积。
      \begin{answer}
        做变量替换关系，引入新变量：
        \begin{displaymath}
          a_1 x + b_1 y + c_1 = u, \quad a_2 x + b_2 y + c_2 = v \score{2}
        \end{displaymath}
        由重积分雅可比行列式变换性质得：
        \begin{displaymath}
          \iint_D dxdy = \frac{\pi}{|a_1 b_2 - a_2 b_1|}. \score{3}
        \end{displaymath}
      \end{answer}
      
    \item 另一道选择题内容...
  \end{enumerate}
}

% 第二大题：解答题
\problem{本题满分 12 分}{解答题}{
  设 $f(x,y) = \frac{x^3 y}{x^4+y^2}$，当 $(x,y) \neq (0,0)$ 时。
  \begin{enumerate}
    \item \textsf{(6分)} 证明: $f(x,y)$ 在 $(0,0)$ 点沿任意方向可求方向导数；
    \item \textsf{(6分)} 证明: $f(x,y)$ 在 $(0,0)$ 不可微。
  \end{enumerate}
  
  \begin{answer}
     \begin{enumerate}
       \item 设方向向量为 $\bm{v}=(\cos\theta,\sin\theta)$：
         \begin{displaymath}
           \lim_{t\to0^+} \frac{f(t\cos\theta, t\sin\theta)-f(0,0)}{t} = 0 \score{6}
         \end{displaymath}
       \item 沿路径 $y=t^2, x=t$ 逼近时：
         \begin{displaymath} 
           R(t,t^2) = \frac{t^5}{t^4+t^4} = t \neq o(\sqrt{t^2+t^4}) \score{6}
         \end{displaymath}
         故不可微。
     \end{enumerate}
  \end{answer}
}

% 第三大题：纯证明题（隐藏题型字样）
\problem{本题满分 10 分}{}{
  证明：若 $u$ 在区域 $\Omega$ 上有二阶连续偏导数，则有：
  \begin{displaymath}
    \iiint_\Omega \Delta u \,dxdydz = \iint_S \frac{\partial u}{\partial \bm{n}}\,dS
  \end{displaymath}
  \begin{answer}
    结合散度定理与方向导数定义：
    \begin{align*}
      \iint_S \frac{\partial u}{\partial \bm{n}}dS &= \iint_S \nabla u \cdot \bm{n} \,dS \score{4} \\
      &= \iiint_\Omega \nabla\cdot \nabla u\, dxdydz = \iiint_\Omega \Delta u \,dxdydz \score{6}
    \end{align*}
    得证。
  \end{answer}
}

% ---- 5. 驱动渲染的核心命令 ----
% 该命令会依次：1.检查并输出大题评分表 2.渲染诚信承诺书 3.渲染注意事项 4.集中批量吐出上述所有 problem 的正文
\generateProblemTable

\end{document}

```

---

## 💡 7. 编译与避坑指南

1. **必须要编译两次：** 由于大总分表格需要动态统计 `\problem` 的调用次数，且页脚的“共 X 页”依赖 `lastpage` 宏包的引用标签，因此**必须使用 XeLaTeX 连续编译 2 次以上**才能获取正确排版。
2. **清空计数缓存：** 当你删除了某道大题或者大幅度调整结构后，如果遭遇表格列数报错，请手动**删除同目录下的 `.aux` 缓存文件**，然后重新编译即可。
3. **大题正文闭合：** 所有题目正文、`enumerate` 列表、甚至具体的 `answer` 模块，都必须完完整整地包裹在 `\problem{...}{...}{ 题目内容 }` 的**第三个参数内**。大题命令之后不要遗漏闭合花括号 `}`。

```

```