# Solução — Estudo de caso 01: Planejamento Semanal de Produção na Pinocchio S.A.

## 1. Resumo

Este estudo aplica Programação Linear ao planejamento semanal da Pinocchio S.A., que produz bonecos e trens de madeira. O objetivo principal é maximizar o lucro sob restrições de acabamento, carpintaria e demanda máxima de bonecos. A análise gráfica mostra que o problema possui **múltiplas soluções ótimas**, todas com lucro semanal de **R$ 200,00**, porque o lucro unitário de cada produto é proporcional ao consumo de horas de acabamento. Entre essas soluções, destaca-se o ponto `(40, 20)` por utilizar menos horas de carpintaria sem reduzir o lucro. Como extensão, é formulado um problema de minimização de custos com produção semanal mínima de 80 unidades, resultando em 80 trens, com custo de **R$ 240,00**.

## 2. Introdução

A Pesquisa Operacional oferece métodos quantitativos para apoiar decisões quando existem objetivos e recursos limitados. No caso da Pinocchio S.A., a decisão consiste em determinar quantos bonecos e trens devem ser produzidos semanalmente para obter o maior lucro possível.

O problema é adequado à Programação Linear porque tanto a função objetivo quanto as restrições são lineares. A solução é obtida pela análise da região viável e de seus pontos extremos.

## 3. Metodologia

Foram utilizadas as informações do enunciado registrado em `Docs/Estudo de caso 01.md`, que estabelece 100 horas semanais de acabamento, 80 horas de carpintaria e limite de 40 bonecos. O enunciado também informa lucro unitário de R$ 4 para bonecos e R$ 2 para trens, além da extensão de minimização com custos unitários de R$ 5 e R$ 3, respectivamente.

### 3.1 Variáveis de decisão

- `x` = quantidade de bonecos produzidos por semana.
- `y` = quantidade de trens produzidos por semana.

### 3.2 Modelo de maximização

**Função objetivo:**

```text
Max Z = 4x + 2y
```

**Restrições:**

```text
2x + y <= 100        (acabamento)
x + y <= 80          (carpintaria)
x <= 40               (demanda máxima de bonecos)
x >= 0, y >= 0        (não negatividade)
```

O conjunto de soluções possíveis é a região comum determinada por essas restrições.

## 4. Resolução gráfica e análise dos vértices

Os principais pontos extremos da região viável são:

| Vértice | x (bonecos) | y (trens) | Acabamento | Carpintaria | Lucro |
| --- | ---: | ---: | ---: | ---: | ---: |
| A | 0 | 0 | 0 | 0 | R$ 0 |
| B | 40 | 0 | 80 | 40 | R$ 160 |
| C | 40 | 20 | 100 | 60 | **R$ 200** |
| D | 20 | 60 | 100 | 80 | **R$ 200** |
| E | 0 | 80 | 80 | 80 | R$ 160 |

### 4.1 Interpretação da função objetivo

A função de lucro pode ser fatorada como:

```text
Z = 4x + 2y = 2(2x + y)
```

A primeira restrição é exatamente `2x + y <= 100`. Portanto, maximizar `Z` equivale a maximizar o uso da capacidade de acabamento. Qualquer solução viável que satisfaça `2x + y = 100` produz o lucro máximo de R$ 200, desde que também respeite as demais restrições.

Impondo `2x + y = 100` e `x + y <= 80`, obtemos `x >= 20`. Com `x <= 40` e `y >= 0`, o conjunto ótimo pode ser descrito por:

```text
20 <= x <= 40
 y = 100 - 2x
```

Assim, não existe apenas uma solução ótima: há um **segmento inteiro de soluções ótimas**, entre `(20, 60)` e `(40, 20)`.

### 4.2 Escolha gerencial entre soluções ótimas

Como todas as combinações do segmento ótimo geram R$ 200 de lucro, um critério secundário pode ser usado para escolher a solução operacionalmente mais conveniente.

Por exemplo, a solução `(40, 20)` usa apenas `40 + 20 = 60` horas de carpintaria, enquanto `(20, 60)` utiliza todas as 80 horas. Portanto, caso a empresa queira manter maior folga de carpintaria sem sacrificar lucro, **40 bonecos e 20 trens por semana** é uma escolha particularmente interessante.

Nesse ponto:

- acabamento: 100/100 h — recurso totalmente utilizado;
- carpintaria: 60/80 h — 20 h de folga;
- demanda de bonecos: 40/40 — limite totalmente utilizado;
- lucro: **R$ 200/semana**.

## 5. Extensão — minimização de custos

O enunciado determina custos de R$ 5 por boneco e R$ 3 por trem e exige um nível mínimo de produção para evitar a solução trivial `(0,0)`. Para tornar a comparação objetiva, adotamos como hipótese uma produção mínima de **80 unidades por semana**, justificando-a pelo limite de capacidade de carpintaria: cada unidade consome uma hora de carpintaria, de modo que 80 unidades representam a utilização integral dessa capacidade.

### 5.1 Novo modelo

**Função objetivo:**

```text
Min C = 5x + 3y
```

**Restrições:**

```text
2x + y <= 100        (acabamento)
x + y <= 80          (carpintaria)
x <= 40               (demanda máxima de bonecos)
x + y >= 80           (produção mínima adotada)
x >= 0, y >= 0
```

Das duas restrições sobre produção total:

```text
x + y <= 80
x + y >= 80
```

segue que, na solução da extensão,

```text
x + y = 80
```

Substituindo `y = 80 - x` na função de custo:

```text
C = 5x + 3(80 - x)
C = 240 + 2x
```

Como `x >= 0`, o custo é mínimo quando `x = 0`. Portanto:

```text
x = 0
 y = 80
 C = R$ 240
```

A solução é viável: requer 80 horas de acabamento, 80 horas de carpintaria e nenhum boneco.

### 5.2 Comparação dos modelos

| Aspecto | Maximização de lucro | Minimização de custos |
| --- | --- | --- |
| Objetivo | `Max 4x + 2y` | `Min 5x + 3y` |
| Solução característica | `(40,20)` entre várias ótimas | `(0,80)` |
| Produção total | 60 unidades na escolha `(40,20)` | 80 unidades |
| Uso de acabamento | 100 h | 80 h |
| Uso de carpintaria | 60 h | 80 h |
| Resultado | Lucro de R$ 200 | Custo de R$ 240 |

A comparação evidencia que mudar o objetivo altera substancialmente o mix produtivo. No modelo de lucro, o acabamento é o recurso determinante e existe indiferenteidade entre diferentes combinações. No modelo de custo, com a meta de 80 unidades, o trem é preferível porque tem custo unitário menor.

## 6. Conclusão e discussão gerencial

O caso demonstra que uma formulação correta da Programação Linear não termina na identificação de um único ponto ótimo. A análise da função objetivo revela uma **solução ótima múltipla**: todas as combinações entre 20 e 40 bonecos, complementadas por trens até satisfazer `2x + y = 100`, geram o mesmo lucro de R$ 200.

A existência de soluções múltiplas cria espaço para critérios gerenciais secundários. Por exemplo, `(40,20)` preserva o lucro máximo e deixa 20 horas de carpintaria disponíveis, podendo ser preferível quando essa capacidade possui valor operacional adicional.

A extensão de minimização também reforça a importância de explicitar premissas. Sem uma produção mínima, minimizar custos levaria à solução trivial de não produzir nada. Ao fixar uma meta de 80 unidades, obtém-se um problema comparável e não trivial, no qual a combinação de menor custo é produzir exclusivamente trens.

Em termos gerenciais, o modelo pode ser expandido futuramente com preços, demanda por trens, limites de estoque, horas extras, custos fixos, múltiplos períodos e outros recursos. Essas extensões permitiriam transformar o exercício acadêmico em uma ferramenta de planejamento mais próxima de uma operação real.

## 7. Referências

HILLIER, Frederick S.; LIEBERMAN, Gerald J. **Introdução à pesquisa operacional**. 9. ed. Porto Alegre: AMGH, 2013.

ARENALES, Marcos et al. **Pesquisa operacional**. 2. ed. Rio de Janeiro: Elsevier, 2015.

UNIVERSIDADE CATÓLICA DE BRASÍLIA. **Pesquisa Operacional — Estudo de caso 01: Planejamento Semanal de Produção na Pinocchio S.A.** Documento de atividade avaliativa, 2026.
