"""Verificação independente dos vértices e soluções ótimas do estudo de caso 01."""

from fractions import Fraction

# Pontos extremos obtidos pela interseção das restrições do modelo.
vertices = {
    "A": (0, 0),
    "B": (40, 0),
    "C": (40, 20),
    "D": (20, 60),
    "E": (0, 80),
}


def acabamento(x, y):
    return 2 * x + y


def carpintaria(x, y):
    return x + y


def lucro(x, y):
    return 4 * x + 2 * y


def custo(x, y):
    return 5 * x + 3 * y


def viavel(x, y):
    return (
        x >= 0
        and y >= 0
        and acabamento(x, y) <= 100
        and carpintaria(x, y) <= 80
        and x <= 40
    )


assert all(viavel(*point) for point in vertices.values())
assert lucro(*vertices["C"]) == 200
assert lucro(*vertices["D"]) == 200
assert all(lucro(*point) <= 200 for point in vertices.values())

# O segmento ótimo é y = 100 - 2x, com 20 <= x <= 40.
for x in range(20, 41):
    y = 100 - 2 * x
    assert viavel(x, y)
    assert lucro(x, y) == 200

# Na extensão de custos, x + y = 80 e o custo cresce 2 reais para cada boneco.
assert custo(0, 80) == 240
assert custo(40, 40) == 320
assert custo(0, 80) < custo(40, 40)

print("Verificação concluída com sucesso.")
print("Lucro máximo: R$ 200,00.")
print("Soluções ótimas inteiras: x entre 20 e 40 e y = 100 - 2x.")
print("Custo mínimo na extensão: R$ 240,00 em (x, y) = (0, 80).")
