# multi-lang-battle

multi programming language battle

複数のプログラミング言語で約 1GB の CSV ファイルを Read/Write して時間を測定する

# 共通ルール

- どの言語でも同じファイルを使用して確認すること
- ファイルは一行ずつ読み散り、一行ずつ書き込むこと
- OS の差を無くすため、Docker Image は全て base(Ubuntu 18.04 LTS)を使用すること

# Dependence

- Docker
- Docker Compose
- Make

# Run All

```bash
# Build Containers
make build

# Run
make run_all

# Average only
make run_all | grep Average
```

Result example

```bash
C-lang Average: 6.2962
C++ Average: 6.0538
Golang Average: 10.3966
Java Average: 21.0840
Python Average: 32.6949
Ruby Average: 30.7153
Scala Average: 21.8364
```

# C Language

```bash
make run_c
```

# C++

```bash
make run_cpp
```

# Golang

```bash
make run_go
```

# Java

```bash
make run_java
```

# Python

```bash
make run_python
```

# Ruby

```bash
make run_ruby
```

# Scala

```bash
make run_scala
```
