# multi-lang-battle

multi programming language battle

複数のプログラミング言語で約 1GB の CSV ファイルを Read/Write して時間を測定する

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
C-lang Average: 4.5778
C++ Average: 4.4509
Golang Average: 5.1160
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
