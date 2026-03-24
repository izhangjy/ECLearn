# ECLearn

高考英语和语文学习辅助App，基于刻意练习法。

## 功能特点

- **刻意练习法**：智能识别薄弱点，针对性强化训练
- **英语学习**：单词精通、语法攻克、阅读理解
- **语文学习**：基础积累、古诗文、现代文阅读
- **试卷分析**：OCR识别 + AI智能分析错题
- **学习统计**：可视化学习进度和知识掌握度

## 技术栈

- Flutter 3.x
- Riverpod 状态管理
- Drift (SQLite) 本地数据库
- 云端AI服务（通义千问/文心一言/DeepSeek）

## 开始使用

### 环境要求

- Flutter SDK >= 3.2.0
- Dart SDK >= 3.2.0

### 安装步骤

```bash
# 1. 克隆项目
git clone <repository-url>
cd eclearn

# 2. 安装依赖
flutter pub get

# 3. 生成数据库代码
dart run build_runner build

# 4. 运行应用
flutter run
```

## 项目结构

```
lib/
├── main.dart                 # 应用入口
├── app/                      # 应用配置
│   ├── app.dart             # App组件
│   ├── routes.dart          # 路由配置
│   └── theme.dart           # 主题配置
├── core/                     # 核心功能
│   ├── database/            # 数据库
│   ├── models/              # 数据模型
│   └── practice/            # 刻意练习引擎
├── features/                 # 功能模块
│   ├── home/                # 首页
│   ├── english/             # 英语模块
│   │   ├── vocabulary/      # 单词学习
│   │   ├── grammar/         # 语法学习
│   │   └── reading/         # 阅读理解
│   ├── chinese/             # 语文模块
│   ├── exam/                # 试卷分析
│   ├── stats/               # 学习统计
│   └── settings/            # 设置
└── shared/                   # 共享组件
```

## 开发计划

- [x] Phase 1: 基础框架 + 英语单词
- [ ] Phase 2: 英语语法 + 阅读
- [ ] Phase 3: 试卷分析
- [ ] Phase 4: 语文模块
- [ ] Phase 5: 完善优化
