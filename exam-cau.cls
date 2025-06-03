\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{exam-cau}[2025/05/28 v1.0 中国农业大学考试试卷模板]

\LoadClass[zihao=-4,a4paper,twoside]{ctexart}

% 加载常用宏包
\RequirePackage{amsmath, amsthm, amssymb, amsfonts}
\RequirePackage[top=20mm,bottom=20mm,left=20mm,right=20mm]{geometry}
\RequirePackage{setspace}
\RequirePackage{fontspec}
\RequirePackage{graphicx,color}
\RequirePackage{fancyhdr}
\RequirePackage{float}
\RequirePackage{bm}
\RequirePackage{xparse}
\RequirePackage{array}
\RequirePackage{etoolbox}


% 定义操作系统选项
\newif\if@usemacos
\newif\if@usewindows
\newif\if@uselinux

\DeclareOption{macos}{\@usemacostrue}
\DeclareOption{windows}{\@usewindowstrue}
\DeclareOption{linux}{\@uselinuxtrue}

% 默认行为：自动检测（可选）
\ExecuteOptions{macos} % 默认为 Linux（多数系统可用 fallback 字体）

\ProcessOptions\relax

% 根据选项设置字体
\if@usemacos
  \setmainfont{Times New Roman}
  \setCJKmainfont[BoldFont=华文中宋]{STSong}
  \setCJKmonofont{STBaoliSC-Regular}
  \setCJKsansfont{华文黑体}
\else
  \if@usewindows
    \setmainfont{Times New Roman}
    \setCJKmainfont[BoldFont=SimHei]{SimSun} % Windows 常见中文字体
    \setCJKmonofont{Lisu}
    \setCJKsansfont{SimHei}
  \else
    % Linux 或默认情况（也可用 xelatex 支持的本地字体）
    \setmainfont{Times New Roman}
    \setCJKmainfont[BoldFont=AR PL UMing CN]{WenQuanYi Zen Hei}
    \setCJKmonofont{AR PL UKai CN}
    \setCJKsansfont{AR PL UMing CN}
  \fi
\fi


% 页面设置
\setlength{\parindent}{0mm}
\AtEndDocument{\label{LastPage}}
\onehalfspacing

% 页眉页脚
\pagestyle{fancy}
\fancyhead{}
\fancyfoot{}

% 页眉
\fancyhead[LE]{
  {\zihao{-4}学院：\underline{\qquad\qquad\quad\quad}
  班级：\underline{\qquad\qquad\quad\quad}
  学号：\underline{\qquad\qquad\qquad\qquad}
  姓名：\underline{\qquad\qquad\qquad\quad}}}
\renewcommand{\headrulewidth}{0pt} 
\renewcommand{\footrulewidth}{0pt}

\ExplSyntaxOn

% 变量定义
\int_new:N \g_problem_num_int
\int_new:N \g_problem_total_int
\tl_new:N \g_problem_list_tl
\tl_new:N \g_problem_content_tl
\tl_new:N \g_problem_spacer_tl
\int_new:N \g_exam_year_int
\tl_new:N \g_exam_subject_tl
\tl_new:N \g_exam_semester_tl
\tl_new:N \g_exam_footer_tl

% 中文数字转换
\cs_new:Npn \my_chinese_num:n #1
 {
   \int_case:nn {#1}
    {
      {1}{一}
      {2}{二}
      {3}{三}
      {4}{四}
      {5}{五}
      {6}{六}
      {7}{七}
      {8}{八}
      {9}{九}
      {10}{十}
      {11}{十一}
      {12}{十二}
      {13}{十三}
      {14}{十四}
      {15}{十五}
      {16}{十六}
      {17}{十七}
      {18}{十八}
      {19}{十九}
      {20}{二十}
    }
 }

% 表头初始化
\tl_gput_right:Nn \g_problem_list_tl { ~~题号~~ }
\tl_gput_right:Nn \g_problem_list_tl { & }
\tl_gput_right:Nn \g_problem_spacer_tl { ~分数~ }
\tl_gput_right:Nn \g_problem_spacer_tl { & }

% 设置年份
\NewDocumentCommand{\setyear}{ m }
  { \int_gset:Nn \g_exam_year_int {#1} }

% 设置科目 + 更新页脚
\NewDocumentCommand{\setsubject}{ m }
  {
    \tl_gset:Nn \g_exam_subject_tl {#1}
    \tl_gset:Nx \g_exam_footer_tl {
      \footnotesize 
      第~\noexpand\thepage~页~共~\noexpand\pageref{LastPage}~页\quad\nobreakspace #1 \quad 中国农业大学制
    }
  }

% 显示页脚
\NewDocumentCommand{\examfooter}{}
  { \tl_use:N \g_exam_footer_tl }

% 页脚设置
\fancyfoot[C]{\examfooter}

% 设置学期
\NewDocumentCommand{\setsemester}{ m }
  { \tl_gset:Nn \g_exam_semester_tl {#1} }

% 添加题目
\NewDocumentCommand{\problem}{ m m +m }
{
  \int_gincr:N \g_problem_num_int
  \int_gincr:N \g_problem_total_int

  % 构建表格头部
  \tl_gput_right:Nx \g_problem_list_tl { \my_chinese_num:n { \g_problem_num_int } }
  \tl_gput_right:Nn \g_problem_list_tl { & }

  % 构建表格第二行
  \tl_gput_right:Nx \g_problem_spacer_tl { ~ }
  \tl_gput_right:Nn \g_problem_spacer_tl { \vphantom{$\bigg{|}$} & }

  % 构建题目正文
  \tl_gput_right:Nx \g_problem_content_tl
    {
      \noindent \exp_not:N \textsf {
        \zihao{-4}
        \my_chinese_num:n { \int_use:N \g_problem_num_int } 、~（#1分）~ #2
      }
      \exp_not:N \par \exp_not:N \vspace {0.5em}
      \noindent \zihao{-4}
    }
  \tl_gput_right:No \g_problem_content_tl { #3 }
  \tl_gput_right:Nn \g_problem_content_tl
    {
      \par\vspace{2em}
    }
}

% 输出标题
\NewDocumentCommand{\generateExamTitle}{}
{
  \begin{center}
    {\zihao{2}\tt 中国农业大学}\\ \vspace{2mm}
    {\zihao{2} \int_use:N \g_exam_year_int ～ \int_eval:n {\g_exam_year_int +1 } \tt 学年 { \tl_use:N \g_exam_semester_tl }}\\ \vspace{2mm}
    {\zihao{2} \tt \underline{~~\tl_use:N \g_exam_subject_tl~~} 课程考试试题}
  \end{center}
}

% 输出题表和题目内容
\NewDocumentCommand{\generateProblemTable}{}
{
  % 删除最后多余的 &
  \tl_set:Nx \g_problem_list_tl { \tl_range:Nnn \g_problem_list_tl { 1 } { -2 } }

  % 输出表格
  \zihao{4}
  \begin{center}
    \begin{tabular}{|c|*{ \int_use:N \g_problem_num_int }{c|c|}}
      \hline
      \g_problem_list_tl & 总分\vphantom{$\Big|$} \\
      \hline
      \g_problem_spacer_tl  \\
      \hline
    \end{tabular}
  \end{center}
  %\vspace{1em}

  % 输出大题数量统计
  \begin{center}
    （本试卷共 {\int_use:N \g_problem_num_int} 道大题）\\ 
    \vspace{0.5em} %spacing 
    \textbf{考生诚信承诺}
  \end{center}
  \vspace{-1em}
  {\zihao{4}本人承诺自觉遵守考试纪律,~诚信应考,~服从监考人员管理。\\
  本人清楚学校考试考场规则,~如有违纪行为,~将按照学校违纪处分规定严肃处理。\par}
  \vspace{1em}

  % 输出题目正文
  \noindent\g_problem_content_tl

  % 清空计数器和变量
  \int_gzero:N \g_problem_num_int
  \tl_gclear:N \g_problem_list_tl
  \tl_gclear:N \g_problem_content_tl
}

\ExplSyntaxOff

% ===== LaTeX2e 模式下的定义放在这里 =====
\RequirePackage{xcolor}
\RequirePackage{environ}

% 答案显示开关
\newif\if@showanswer
\@showanswerfalse

\newcommand{\includeanswertrue}{\@showanswertrue}
\newcommand{\includeanswerfalse}{\@showanswerfalse}

% 答案环境定义
\NewEnviron{answer}{%
  \if@showanswer
    \par
    \textcolor{red}{\bfseries 【参考答案】}\par
    \color{blue}%
    \BODY
    \par
  \fi
}

% 定义 \score 命令
\makeatletter
\newcommand{\score}[1]{%
  \ifmeasuring@
    % 在 align 等 AMS 环境的测量阶段不执行任何输出
  \else
    \if@display
      % 显示公式或 align 环境中
      \ifx\@currenvir\@score@align@env
        % 在 align 环境中，使用 \tag*
        \tag*{\textcolor{red}{( #1 分)}}
      \else
        % 普通 $$...$$ 公式中
        \tag*{\textcolor{red}{( #1 分)}}
      \fi
    \else
      % 文本模式下靠右对齐
      \hfill \textcolor{red}{( #1 分)}%
    \fi
  \fi
}
\makeatother

% 定义 AMS 环境名称
\def\@score@align@env{align}

\endinput
