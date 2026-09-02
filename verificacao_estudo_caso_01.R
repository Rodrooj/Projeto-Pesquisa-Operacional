# Verificação independente do estudo de caso 01 em R
# Substitui a implementação equivalente anteriormente escrita em Python.

vertices <- data.frame(
  vertice = c("A", "B", "C", "D", "E"),
  x = c(0, 40, 40, 20, 0),
  y = c(0, 0, 20, 60, 80)
)

acabamento <- function(x, y) 2 * x + y
carpintaria <- function(x, y) x + y
lucro <- function(x, y) 4 * x + 2 * y
custo <- function(x, y) 5 * x + 3 * y

viavel <- function(x, y) {
  x >= 0 && y >= 0 &&
    acabamento(x, y) <= 100 &&
    carpintaria(x, y) <= 80 &&
    x <= 40
}

# Prova das restrições nos vértices.
stopifnot(all(mapply(viavel, vertices$x, vertices$y)))

# Prova do lucro nos vértices e do máximo conhecido.
lucros <- mapply(lucro, vertices$x, vertices$y)
stopifnot(lucro(40, 20) == 200)
stopifnot(lucro(20, 60) == 200)
stopifnot(all(lucros <= 200))

# Prova do segmento ótimo inteiro: 20 <= x <= 40 e y = 100 - 2x.
xs <- 20:40
ys <- 100 - 2 * xs
stopifnot(all(mapply(viavel, xs, ys)))
stopifnot(all(mapply(lucro, xs, ys) == 200))

# Prova da extensão de custos com x + y = 80.
stopifnot(custo(0, 80) == 240)
stopifnot(custo(40, 40) == 320)
stopifnot(custo(0, 80) < custo(40, 40))

cat("Verificação concluída com sucesso.\n")
cat("Lucro máximo: R$ 200,00.\n")
cat("Soluções ótimas inteiras: x entre 20 e 40 e y = 100 - 2x.\n")
cat("Custo mínimo na extensão: R$ 240,00 em (x, y) = (0, 80).\n")
