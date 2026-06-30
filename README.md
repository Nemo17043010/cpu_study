# ディジタル回路設計とコンピュータアーキテクチャ 第1版 — 演習成果物

> **教科書**: *Digital Design and Computer Architecture* (Harris & Harris) 第1版  
> **HDL**: Verilog HDL  
> **シミュレータ**: Icarus Verilog (iverilog) + GTKWave

---

## 📂 ディレクトリ構成

```
function/
├── sillyfunction.v        # 例題 4.1: 組み合わせ論理関数 (論理積和形)
├── 0401-sillyfunction.v   # 例題 4.1: SystemVerilog 版 (logic 型使用)
├── sillyfunction_tb.v     # sillyfunction のテストベンチ
├── sillyfunction_tb.vcd   # シミュレーション波形 (GTKWave 用)
│
├── gate.v                 # 基本ゲート: AND / OR / XOR / NAND / NOR (4-bit)
├── gate_tb.v              # gate のテストベンチ
├── gate_tb.vcd            # シミュレーション波形
│
├── and8.v                 # 8-bit AND (リダクション演算子 & を使用)
├── and8_tb.v              # and8 のテストベンチ
├── and8_tb.vcd            # シミュレーション波形
│
└── inv.v                  # 4-bit インバータ (ビット反転)
```

---

## 🔌 実装モジュール一覧

### `sillyfunction` — 組み合わせ論理関数

教科書 4.1 節の例題。3 入力 (`a`, `b`, `c`) から論理積和形 (SOP) で出力 `y` を生成する。

```
y = ~a & ~b & ~c
  |  a & ~b & ~c
  |  a & ~b &  c
```

| a | b | c | y |
|:-:|:-:|:-:|:-:|
| 0 | 0 | 0 | 1 |
| 0 | 0 | 1 | 0 |
| 0 | 1 | 0 | 0 |
| 0 | 1 | 1 | 0 |
| 1 | 0 | 0 | 1 |
| 1 | 0 | 1 | 1 |
| 1 | 1 | 0 | 0 |
| 1 | 1 | 1 | 0 |

---

### `gate` — 基本論理ゲート群 (4-bit)

4-bit 入力 `a`, `b` に対して 5 種類の基本ゲートを並列出力する。

| 出力 | 演算 | 記号 |
|------|------|------|
| `y1` | AND  | `a & b` |
| `y2` | OR   | `a \| b` |
| `y3` | XOR  | `a ^ b` |
| `y4` | NAND | `~(a & b)` |
| `y5` | NOR  | `~(a \| b)` |

---

### `and8` — 8-bit AND (リダクション)

8-bit 入力 `a` の全ビットを AND するリダクション演算子を使用。全ビットが `1` のとき `y = 1`。

```verilog
assign y = &a;
```

---

### `inv` — 4-bit インバータ

4-bit 入力 `a` を全ビット反転して出力する。

```verilog
assign y = ~a;
```

---

## ▶️ シミュレーション手順

### 必要なツール

- [Icarus Verilog](https://steveicarus.github.io/iverilog/) (`iverilog`, `vvp`)
- [GTKWave](https://gtkwave.sourceforge.net/) (波形表示, オプション)

### コンパイル & 実行

```bash
# sillyfunction
iverilog -o sillyfunction sillyfunction.v sillyfunction_tb.v
vvp sillyfunction

# gate
iverilog -o gate gate.v gate_tb.v
vvp gate

# and8
iverilog -o and8 and8.v and8_tb.v
vvp and8
```

### 波形の表示 (GTKWave)

```bash
gtkwave sillyfunction_tb.vcd &
gtkwave gate_tb.vcd &
gtkwave and8_tb.vcd &
```

---

## 📚 参考文献

- David Money Harris, Sarah L. Harris — *Digital Design and Computer Architecture*, 1st Edition, Morgan Kaufmann
- 日本語版: 『ディジタル回路設計とコンピュータアーキテクチャ 第1版』

---

## 📝 ライセンス

本リポジトリは個人学習目的の成果物です。
