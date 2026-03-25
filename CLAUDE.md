# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

---

## 常用命令

- **构建项目**
  Flutter构建与调试请使用：
  ```bash
  flutter pub get
  flutter run  # 运行项目
  flutter build apk  # 构建Android安装包
  flutter build ios  # 构建iOS安装包
  ```

- **运行测试**
  单个测试文件运行：
  ```bash
  flutter test test/features/english/reading/reading_practice_page_test.dart
  ```
  运行全部测试：
  ```bash
  flutter test
  ```

- **代码格式检查与自动修复**
  依赖Flutter标准格式化工具：
  ```bash
  flutter format lib/
  ```

- **数据库迁移**
  Drift数据库使用代码迁移策略，变更表结构后请更新`database.dart`中`schemaVersion`和对应的迁移方法。

---

## 代码架构与结构概述

### 一、整体技术栈

- **Flutter + Riverpod**
  用于构建跨平台（iOS/Android）的UI和状态管理。
- **Drift ORM**
  本地SQLite数据库访问及持久化层，支持数据库表和迁移定义。
- **Kotlin/Gradle**
  Android端项目构建与依赖管理。

---

### 二、项目目录结构与职责分工

- `lib/core/database/`
  Drift数据库表定义与迁移实现，包含词汇、语法题、阅读文章与练习记录表。
- `lib/core/practice/`
  业务服务层，封装查询与写入，如`reading_service.dart`、`practice_engine.dart`负责各练习模块数据操作和刻意练习逻辑。
- `lib/features/`
  不同英语学习模块的UI页面和相关状态管理。
  - `english/reading/`
    阅读理解模块实现，包含文章列表页、练习页(`reading_practice_page.dart`)，练习结果页等。
  - `english/grammar/`
    语法练习相关页面和状态管理。

---

### 三、主要设计理念

- **功能拆分清晰**
  各模块（词汇、语法、阅读）各自拥有独立的数据库表和服务层，便于维护和扩展。

- **状态管理集中且可复用**
  采用Riverpod `StateNotifier` 管理各练习页的UI状态、业务逻辑和数据持久化。

- **刻意练习与错题管理**
  通过`PracticeEngine`记录用户答题情况，自动维护错题本(`WrongItems`表)，支持收藏与复习功能。

- **渐进式数据库迁移策略**
  schema版本升级时，使用增量创建/迁移逻辑，保证数据完整安全。

---

### 四、代码阅读建议

- 阅读数据库层时优先看`lib/core/database/database.dart`，了解核心表结构和迁移逻辑。
- 阅读业务服务层从`lib/core/practice/`开始，理解数据操作和核心逻辑。
- 阅读UI组件时关注`lib/features/english/reading/reading_practice_page.dart`等页面，结合状态管理Provider同步理解业务交互。

---

如需了解更多历史讨论、开发细节和调试记录，请查看项目根目录的相关Commit日志和README文件。
