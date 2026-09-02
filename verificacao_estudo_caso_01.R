# Verificação reprodutível do Estudo de Caso 01 em R
# Não requer pacotes externos.

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

# 1. Todos os vértices apresentados pertencem à região viável.
stopifnot(all(mapply(viavel, vertices$x, vertices$y)))

# 2. Avaliação da função objetivo nos vértices.
lucros <- mapply(lucro, vertices$x, vertices$y)
stopifnot(all(lucros <= 200))
stopifnot(max(lucros) == 200)

# 3. Prova algébrica do limite superior do lucro:
#    Z = 4x + 2y = 2(2x + y) <= 2(100) = 200.
stopifnot(lucro(40, 20) == 200)
stopifnot(lucro(20, 60) == 200)

# 4. Prova do segmento contínuo de soluções ótimas.
#    Na reta 2x + y = 100, a carpintaria exige x >= 20.
#    Com x <= 40 e y >= 0, resulta 20 <= x <= 40.
xs <- seq(20, 40, by = 0.25)
ys <- 100 - 2 * xs
stopifnot(all(mapply(viavel, xs, ys)))
stopifnot(all(abs(mapply(lucro, xs, ys) - 200) < 1e-10))

# 5. Extensão: produção mínima de 80 unidades.
#    Como x + y <= 80 e x + y >= 80, necessariamente x + y = 80.
#    C = 5x + 3y = 240 + 2x, logo C >= 240.
stopifnot(custo(0, 80) == 240)
stopifnot(custo(40, 40) == 320)
stopifnot(custo(0, 80) < custo(40, 40))

# Verificação adicional: pontos do segmento x + y = 80.
xs_ext <- seq(0, 40, by = 0.25)
ys_ext <- 80 - xs_ext
stopifnot(all(xs_ext + ys_ext == 80))
stopifnot(all(mapply(viavel, xs_ext, ys_ext)))
stopifnot(all(mapply(custo, xs_ext, ys_ext) >= 240 - 1e-10))

cat("Verificação concluída com sucesso.\n")
cat("Lucro máximo: R$ 200,00.\n")
cat("Soluções ótimas: 20 <= x <= 40 e y = 100 - 2x.\n")
cat("Custo mínimo na extensão: R$ 240,00 em (x, y) = (0, 80).\n")
