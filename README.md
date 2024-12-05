# imCrypto - 多链加密货币钱包应用

## 项目概述

imCrypto 是一款基于 Flutter 开发的现代化加密货币钱包应用，支持多链资产管理、安全转账和实时市场数据展示。本应用旨在为用户提供简单易用、安全可靠的数字资产管理解决方案。

## 技术架构

### 前端技术栈
- Flutter 3.0+ 
- Provider 状态管理
- web3dart 区块链交互
- local_auth 生物识别
- flutter_secure_storage 安全存储

### 后端服务
- Firebase (推送通知、分析)
- AWS Lambda (API 服务)
- Redis (缓存层)

### 区块链集成
- Ethereum: Infura/Alchemy API
- Bitcoin: BlockCypher API
- 其他 EVM 链: 各链 RPC 节点

## 核心功能模块

### 1. 账户管理
- 创建/导入钱包
- 多账户支持
- 生物识别验证
- 助记词加密存储

### 2. 资产管理
- 多链资产展示
- 实时价格更新
- 资产分类展示
- 自定义代币添加

### 3. 交易功能
- 多链转账支持
- 交易记录查询
- 地址簿管理
- Gas 费用估算

### 4. 安全特性
- 生物识别锁定
- 加密存储
- 交易签名验证
- 安全退出机制

## 项目结构 