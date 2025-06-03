# 📄 `exam-cau.cls` 使用说明书

> 中国农业大学考试试卷模板
>

本模板 `exam-cau.cls` 是为中国农业大学设计的 LaTeX 考试试卷排版类文件。支持：

- 多平台字体自动适配（MacOS / Windows / Linux）
- 题目编号与表格自动生成
- 答案显示控制（开关式）
- 自定义年份、科目、学期信息
- 支持选择题、填空题、计算题等常见题型
- 支持在参考答案中设置各部分的分值 (New!)

---

## ⚙️ 1. 使用前提条件

### ✅ 必须安装的宏包（建议使用 TeX Live 或 MiKTeX）

```latex
xcolor, environ,
amsmath, amsthm, amssymb, amsfonts,
fontspec, graphicx, color, setspace,
fancyhdr, float, bm, xparse, array, etoolbox

```

> ✅ 编译方式推荐：XeLaTeX
>

---

## 🧱 2. 类选项说明（可选参数）

在 `\documentclass` 中可以传入以下操作系统选项以适配不同系统下的中文字体：

| 参数 | 含义 |
| --- | --- |
| `macos` | 使用 MacOS 字体（默认） |
| `windows` | 使用 Windows 常见中文字体（如宋体、黑体） |
| `linux` | 使用 Linux 下常见字体（如文泉驿正黑） |

示例：

```latex
\documentclass[macos]{exam-cau}

```

> ⚠️ 如果不指定，默认为 macos，可根据需要修改 .cls 文件中的默认值。
>

---

## 📌 3. 主要命令说明

### 🔹 设置考试基本信息

| 命令 | 功能 | 示例 |
| --- | --- | --- |
| `\setyear{<年份>}` | 设置考试年份 | `\setyear{2025}` |
| `\setsubject{<科目名>}` | 设置考试科目 | `\setsubject{高等数学}` |
| `\setsemester{<学期>}` | 设置考试学期 | `\setsemester{春季学期}` |

---

### 🔹 控制答案是否显示（调试/打印用）

| 命令 | 功能 | 示例 |
| --- | --- | --- |
| `\includeanswertrue` | 显示答案 | `\includeanswertrue` |
| `\includeanswerfalse` | 不显示答案（默认） | `\includeanswerfalse` |

---

### 🔹 添加题目内容

```latex
\problem{<分数>}{<题型标题>}{<题目内容>}

```

- `<分数>`：每道大题的总分
- `<题型标题>`：如“选择题”、“填空题”、“计算题”
- `<题目内容>`：具体题目正文，可包含 `enumerate` 列表、公式环境等

✅ 示例：

```latex
\problem{12}{选择题}{
  \begin{enumerate}
    \item 函数 $ f(x) = |x| $ 在 $ x=0 $ 处：
      \begin{answer}
        不可导
      \end{answer}
  \end{enumerate}
}

```

---

### 🔹 插入答案（配合 `\includeanswertrue`）

```latex
\begin{answer}
  正确答案或参考解答
\end{answer}

```

- 使用 `\includeanswertrue` 可显示答案区域
- 使用 `\includeanswerfalse` 或省略该命令则隐藏答案

---

### 🔹 生成试卷标题和题目表格

```latex
\generateExamTitle   % 输出试卷头部信息
\generateProblemTable % 输出题目列表表格 + 所有题目的正文

```

---

## 📋 4. 表格样式说明

| 表头 | 内容 |
| --- | --- |
| 第一行 | 题号（一、二、三...） |
| 第二行 | 分数占位符（空白单元格） |
| 第三行 | 总分列 |

---

## 🧾 5. 完整示例文档 (`main.tex`)

```latex

\documentclass[macos]{exam-cau}

\newcommand{\mb}{\bb}
\newcommand{\mc}{\mathcal}   
\newcommand{\Lim}{\lim\limits}
\newcommand{\Liminf}{\liminf\limits}

% 控制是否显示答案
%\includeanswertrue   % 显示答案
\includeanswerfalse  % 不显示答案

\begin{document}

% 考试信息设置
\setyear{2023}
\setsubject{模拟课程}
\setsemester{春季学期}

% 生成试卷标题等 
\generateExamTitle

% 一、填空题 
\problem{24}{填空题}{
     \begin{enumerate}
    \item [1.] $\Lim_{x\to 0}(\cos x)^{1/x^2}=$\underline{\quad\quad\quad\quad}
      \vspace{0.2in}

    \item [2.] 当 $p>0$ 时, $x^3+px+q=0$ 有\underline{\quad\quad\quad\quad}个实根
      \vspace{0.2in}
      
    \item [3.] 当 $x\to+\infty$ 时, 试将下述无穷大量按由低阶至高阶的顺序排列:\par
      $e^x, \, x^x,\, x^{100},\,x^{99}(\ln x)^{100},\,
      [x]!$ \underline{\quad\quad\quad\quad\quad\quad\quad\quad\quad\quad\quad\quad}
      \vspace{0.2in}

    \item [4.] $\int_0^\pi \cos^2 x dx =$ \underline{\quad\quad\quad\quad}
      \vspace{0.2in}

    \item [5.]
      $\left.\frac{d}{dx}\right|_{x=1}\frac{\sqrt{x}}{1+2x}=$\underline{\quad\quad\quad\quad}
      \vspace{0.2in}

    \item [6.] 求 $\Liminf_{n\to\infty}D(\frac1{\sqrt
        {n+1}})=$\underline{\quad\quad\quad\quad}, 其中 $D(x)$ 为 Dirichlet 函数,
      即
      $$D(x)=
      \begin{cases}
        1 & x\in \mathbb{Q}\\
        0 & x\not\in \mathbb{Q}
      \end{cases}.
      $$
      \vspace{0.2in}

    \item [7.] 求 $\frac{d^n}{dx^n}(x^2e^x)=$\underline{\quad\quad\quad\quad\quad\quad\quad\quad},
      ($n\in\mathbb{N}$,化简所得结果)
      \vspace{0.2in}
 
    \item [8.] 下列关于一致连续的说法中,正确的有多少个?\underline{\quad\quad\quad\quad}
      \begin{enumerate}
      \item 若$f(x)$在$(a,b)$连续,则对充分小的$\delta>0$,$f(x)$在
        $[a+\delta,b-\delta]$上一致连续
      \item 若$f(x)$在$(a,b)$连续,则在$(a,b)$上有界
      \item 若$f(x)$在$(a,b)$上一致连续,则在$(a,b)$上有界
      \item $\ln(x)$在$(1,+\infty)$上一致连续
      \item 某区间上两个一致连续的函数之和一定一致连续
      \end{enumerate}
      (注: $a,b$ 均为有限值)
    \end{enumerate}

} % 第一大题结束 

% 二、计算题
\problem{24}{计算题}{
    \begin{enumerate}
    \item [1.] $$\int \cos^2(x)\sin(x)dx$$ \vspace{2.5in}
    \item [2.] $$\int \frac x{\sqrt{1-x^2}}dx$$ \vspace{2.5in}
      \newpage
    \item [3.] $$\int \frac {-x^4+x^3-x^2-x-2}{(x^2+1)^2(x-1)}dx$$ \vspace{4in}
    \item [4.] $$\int \sin(\ln x)dx$$\vspace{2in}
    \end{enumerate}
    \newpage
} % 第二大题结束 

% 第三大题  
\problem{6}{}{
  求 $a,b$, 使
    $$f(x)=
    \begin{cases}
      ax+b & x>1\\
      x^2-3x+2 & x\le 1
    \end{cases}
    $$
    为可微函数.
    \vspace{2.5in}
} % 第三大题结束 

% 第四大题 
\problem{6}{}{ 
  对于$\mathbb{R}$上有定义的函数, 若所论的导函数存在, 证明结论:\\
    奇函数的导函数一定是偶函数.  \vspace{2in} \newpage
} % 第四大题结束 

% 第五大题 
\problem{10}{}{
求过曲线 $$x^{2n}+y^{2n}=1$$ 上 $(x_0,y_0)$ 点的切线方
    程(其中 $n$ 为自然数, $y_0\neq0$). 并证明当 $n\to+\infty$ 时, 除有限个点外,
    $y'(x)$ 要么趋于 $0$, 要么趋于 $\infty$. (注: 实际上随着 $n$ 的增加, 曲线越
    来越接近于正方形)  \vspace{3in}
} % 第五大题结束 

% 第六大题 
\problem{10}{}{
设 $a<b$, $f(x)$ 在 $(-\infty,b)$ 和 $(a,+\infty)$ 均
    一致连续, 证明 $f(x)$ 在 $(-\infty,+\infty)$ 上也一致连续.
    \vspace{2in} \newpage
} % 第六大题结束 

% 第七大题 
\problem{10}{}{
设 $f(x)$ 在 $\mathbb{R}$ 上连续, $f(1)>0$, 且
    $\Lim_{x\to\pm\infty}f(x)=0$, 证明 $f(x)$ 在 $\mathbb{R}$ 上有最大值.
    \vspace{3in}
} % 第七大题结束 

% 第八大题 
\problem{10}{}{
用 Bolzano-Weierstrass 定理证明有界闭区间上的连续函数一定有
    界.\vspace{2in}
} % 第八大题结束 

% 输出表格和正文
\generateProblemTable

\end{document}





```

---

## 🎨 6. 答案格式说明

- 答案部分用红色加粗显示“【参考答案】”
- 答案正文为蓝色字体
- 默认不显示答案（更适用于打印试卷）

---

## 🚩7. 设置评分分值

### **✅ 文本段落中使用：**

```latex
\problem{10}{填空题}{
 \begin{enumerate}
 \item 函数 $ f(x) = x^2 $ 的导数是：
  \score{3}
 \begin{answer}
  $ f'(x) = 2x $
 \end{answer}
 \end{enumerate}
}
```

### **✅ 单行公式中使用：**

```latex
$$
 \int_0^1 x dx = \frac{1}{2} \score{4}
$$
```

### **✅ 多行公式中使用（`align`）：**

```latex
\begin{align}
 \frac{d}{dx} \sin x &= \cos x \score{5} \\
 \frac{d}{dx} \ln x  &= \frac{1}{x}
\end{align}
```

✅ **可以在 `align`、`gather`、`equation` 等环境中使用 `\score{分值}` ！**

---

## **📌 注意事项**

| **环境** | **是否支持** | **说明** |
| --- | --- | --- |
| **`$$...$$`** | ✅ 支持 | 使用**`\tag*{}`**实现右对齐 |
| **`equation`** | ✅ 支持 | 同上 |
| **`align`** | ✅ 支持 | 使用 AMS 内部机制判断 |
| **`align*`** | ✅ 支持 | 无需编号也支持 |
| **`tabular`**、**`minipage`**等复杂结构中 | ⚠️ 不建议 | 可能导致布局混乱 |

---

## **✅ 总结**

| **功能** | **实现方式** |
| --- | --- |
| 在文本中右对齐红色分数 | **`\hfill \textcolor{red}{( #1 分)}`** |
| 在公式中右对齐红色分数 | **`\tag*{\textcolor{red}{( #1 分)}}`** |
| 在**`align`**等 AMS 环境中支持 | 使用**`\ifmeasuring@`**和**`\@currenvir`**判断环境类型 |
---

## 🛠️ 8. 已知功能与扩展建议

### ✅ 当前已实现功能

- 自动题号生成
- 表格自动对齐
- 答案显示控制
- 多平台字体适配
- 页眉页脚定制
- 诚信承诺栏
- 标题栏美观排版

### 💡 可扩展建议（后续可添加）

| 功能 | 描述 |
| --- | --- |
| `\scoreline` | 自动生成得分栏 |
| `\answerpage` | 单独输出所有答案一页 |
| `\useanswersheettrue` | 开启答题本模式（仅留空题） |
| `\zihao` 字号调整 | 更精细控制字体大小 |
| `\makecell` 美化表格 | 支持换行、居中 |
| `\boxed` | 数学公式答案框选 |

---

## 📝 9. 注意事项

- 推荐使用 `XeLaTeX` 编译两次以确保题号、页码正确
- 如需修改字体，请在 `.cls` 文件中调整对应系统的字体名称
- 答案环境必须成对出现：`\begin{answer}...\end{answer}`
- 题目应放在 `\generateProblemTable` 之前定义

---

## 📁 10. 目录结构建议

```
your-folder/
├── exam-cau.cls       ← 本模板类文件
└── main.tex           ← 用户主文档

```

---

## 🎉 11. 结语

本模板专为高校教师、助教设计，具有高度可读性和灵活性，适合用于期中期末考试、模拟试题等场景。

---

## 注记

本模版是在多个 AI 大语言模型的帮助下设计完成的。
