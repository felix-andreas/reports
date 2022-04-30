---
title: Demo Report
date: April 30, 2022
abstract: |
  This is a demo report to showcase the capabilities of this pandoc template.
---

# Introduction

## Tables

| Col 1 | Col 2 |
| ----- | ----- |
| value | value |

## Sub Heading

*This is italic* and **this is bold!**

You can write math.

$$ E = m c^2
$$ {#eq:mass-energy-equivalence}

And you can referene it @eq:mass-energy-equivalence.

---

$$ \dot{N} \langle \epsilon^2 \rangle = \int_0^\infty \epsilon^2 \dot{n}(\epsilon) \mathrm{d} \epsilon = 2 C_\mathrm{q} \gamma^2 \frac{U_0 E_0}{T_0} \frac{|\kappa_\mathrm{x0}|^3}{\langle \kappa_\mathrm{x0}^2 \rangle_s} $$

[This is a link](https://github.com/andreasfelix).

### Sub Sub Heading

![This is an examplary fig caption](figures/example.svg)

* item 1
* item 2
    * sub item 1
    * sub item 2

Ordered List

1. item 1
1. item 2
    1. sub item 1
    1. sub item 2

Tasklist

- [x] finished
- [ ] todo


You can also cite NumPy @numpy or matplotlib @matplotlib

# References
