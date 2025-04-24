### Projeto

A primeira tabela criada, será a de Colaboradores. Nessa tabela, teremos informações como: Nome, Idade, Salário, Telefone Fixo e Trabalho Remoto.

Segue abaixo a tabela que a Tech passou para trabalharmos:

| Nome            | Idade | Salário | Telefone Fixo    | Trabalho Remoto |
|-----------------|-------|---------|------------------|-----------------|
| Ana Silva       | 28    | 6230.50 | Não possui       | Sim             |
| Carlos Oliveira | 35    | 7500.75 | \(11\) 1234-5678 | Sim             |
| Maria Santos    | 40    | 8000.25 | \(21\) 9876-5432 | Não             |
| João Costa      | 32    | 2460.80 | Não possui       | Sim             |
| Fernanda Lima   | 27    | 4230.35 | \(31\) 8765-4321 | Sim             |

Podemos armazenar os dados em variáveis:

```{r}
ana_silva <- 'Ana Silva'
idade <- 28
salario <- 6230.50
```

Por exemplo, vamos criar um vetor com dados da Ana:

```{r}
ana_silva <- c('Ana Silva', 28, 6230.50, 'Não possui', TRUE)
ana_silva
```

Para identificar cada um dos dados, podemos dar nomes aos valores do vetor. Para isso, utilizamos a função `names()`.

```{r}
names(ana_silva) <- c('Nome', 'Idade', 'Salário', 'Telefone fixo', 'Ensino Superior')
ana_silva
```

Vamos criar os vetores dos outros colaboradores:

```{r}
carlos_oliveira <- c('Carlos Oliveira', 35, 7500.75, '(11) 1234-5678', TRUE)

maria_santos <- c('Maria Santos', 40, 8000.25, '(21) 9876-5432', TRUE)

joao_costa <- c('Joao Costa', '32', 2460.80, 'Não possui', FALSE)

fernanda_lima <- c('Fernanda Lima', 27, 4230.35, '(31) 8765-4321', FALSE)
```

Para criar a matriz, precisamos combinar os vetores que criamos:

```{r}
colab_combinado <- c(ana_silva, carlos_oliveira, maria_santos, joao_costa, fernanda_lima)
colab_combinado
```

A partir desse vetor combinado, vamos criar a matriz:

```{r}
matriz_colab <- matrix(colab_combinado, byrow = TRUE, nrow = 5) # matrix do vetor combinado

matriz_colab
```

Assim como identificamos os valores dos vetores, podemos dar nomes para as linhas e para as colunas. Para isso, utilizamos as funções `rownames()` (linhas) e `colnames()` (colunas).

```{r}
rownames(matriz_colab) <- c('Registro Ana', 'Registro Carlos', 'Registro Maria', 'Registro Joao', 'Registro Fernanda')

colnames(matriz_colab) <- c('Nome', 'Idade', 'Salário', 'Telefone fixo', 'Ensino Superior')

print(matriz_colab)
```

## Aula 2 - Manipulando os dados

### Projeto da aula

Nesta aula, vamos utilizar uma tabela de vendas, contendo os valores das vendas de 5 colaboradores referentes a 6 meses de vendas.

```{r}
# Vetor com valores das vendas
vendas_jan <- c(20, 18, 25, 16, 23)
vendas_fev <- c(15, 20, 22, 18, 19)
vendas_mar <- c(25, 23, 20, 17, 21)
vendas_abr <- c(18, 15, 19, 20, 24)
vendas_mai <- c(22, 25, 21, 15, 18)
vendas_jun <- c(21, 22, 19, 17, 20)
```

```{r}
# Nomes das pessoas
pessoas <- c("Pedro Santos", "Carla Nunes", "Maria Eduarda", "Luiz Felipe", "Julio Costa")

# Nomes dos meses
meses <- c("Janeiro", "Fevereiro", "Marco", "Abril", "Maio", "Junho")
```

```{r}
# Combinar as vendas
vendas_semestre <- c(vendas_jan, vendas_fev, vendas_mar, vendas_abr, vendas_mai, vendas_jun)

# Vendas de cada pessoa por mês (em milhares)
matriz_vendas <- matrix(vendas_semestre, nrow = 5, byrow = FALSE)
```

```{r}
# Nomear a matriz
rownames(matriz_vendas) <- pessoas
colnames(matriz_vendas) <- meses
```

```{r}
# Exibir a matriz
matriz_vendas
```

Vamos tentar descobrir o seguinte:

-   Qual colaborador teve o maior faturamento nas vendas?

-   Qual mês teve maior faturamento?

Bom, a gente pode acessar os vetores que criamos antes de gerar a matriz. Por exemplo, podemos verificar as vendas do mês de Janeiro.

```{r}
vendas_jan
```

Para acessar um elemento específico do vetor, nós utilizamos a indexação, que é feita usando índices dentro de colchetes (`[]`).

No R, os índices começam em 1, diferente de outras linguagens que começam em 0.

Vamos acessar o valor 25 de Janeiro:

```{r}
vendas_jan[3]
```

Agora, vamos acessar o menor valor:

```{r}
vendas_jan[4]
```

Sabendo disso, vamos acessar as vendas de um colaborador específico, como o Luiz Felipe, por exemplo. Vamos conferir onde ele está na matriz:

```{r}
matriz_vendas
```

Vamos tentar!

```{r}
matriz_vendas[4, ]
```

Se tivéssemos uma matriz muito grande, que dificultasse achar pelo índice, poderíamos acessar utilizando o nome da pessoa:

```{r}
matriz_vendas['Luiz Felipe', ]
```


Agora, vamos concluir a nossa missão de verificar qual colaborador teve o maior faturamento nas vendas.

```{r}
matriz_vendas
```

Para calcular o faturamento dos colaboradores, devemos somar as suas vendas nos 6 meses.

Uma forma simples de somar os elementos das linhas é utilizando a função `rowSums()`.

```{r}
rowSums(matriz_vendas)
```

E para calcular o faturamento dos meses? Para isso, existe uma função que soma os elementos das colunas chamada `colSums()`:

```{r}
colSums(matriz_vendas)
```

Para adicionar uma coluna para o total dos colaboradores, podemos utilizar a função `cbind()`:

```{r}
total_colab <- rowSums(matriz_vendas)

matriz_total_colab <- cbind(matriz_vendas, total_colab)
matriz_total_colab
```

Para adicionar uma coluna para o total dos meses, podemos utilizar a função `rbind()`:

```{r}
total_meses <- colSums(matriz_vendas)

matriz_total_meses <- rbind(matriz_vendas, total_meses)
matriz_total_meses
```


## Aula 3 - Estruturas condicionais e de repetição

### Projeto da aula

Suponha que estamos lidando com dados de um armazém que vende produtos eletrônicos e tem um estoque representado por uma matriz de preços unitários e quantidades em estoque.

```{r}
preco <- c(50, 100, 150, 25, 75)

qtd_estoque <- c(10, 5, 20, 30, 7)

preco_estoque <- c(preco, qtd_estoque)

matriz_estoque <- matrix(preco_estoque, ncol = 2)

rownames(matriz_estoque) <- c('Notebook', 'Tablet', 'Monitor', 'Smartphone', 'Headset')
colnames(matriz_estoque) <- c('Produto', 'Estoque')

matriz_estoque
```

A partir dessa matriz, vamos buscar descobrir o seguinte:

-   Calcular o valor total em estoque.

-   Identificar produtos com estoque baixo (menos de 15 unidades).

-   Classificar o valor total em estoque em alto ou baixo.

-   Aplicar desconto de 10% em todos os produtos do estoque.

-   Descobrir qual o produto mais vendido.

Para calcular o valor total em estoque, vamos utilizar o operador aritmético de multiplicação (`*`).

```{r}
valor_total_estoque <- matriz_estoque[, 1] * matriz_estoque[, 2]

valor_total_estoque
```


Vamos unir esse resultado a nossa matriz:
```{r}
matriz_estoque <- cbind(matriz_estoque, total_estoque)

matriz_estoque
```


Imagine agora que queremos identificar os produtos que estão com estoque baixo, ou seja, aqueles que têm menos de 15 unidades disponíveis.

```{r}
estoque_baixo <- matriz_estoque[, 2] < 15

matriz_estoque[estoque_baixo, ]
```


Para calcular o valor total em estoque, podemos somar os valores da coluna que adicionamos na matriz:
```{r}
total_somado <- colSums(matriz_estoque)

total_somado
```
Agora podemos selecionar apenas a soma total do estoque, que está localizada no índice 3:

```{r}
total_somado[3]
```

Com o valor total do estoque somado, vamos criar a classificação utilizando IF e ELSE:
```{r}
if(total_somado[3] > 3000) {
  paste('Total em estoque é alto. Valor total: ', total_somado[3])
} else {
  paste('Total em estoque está baixo de 3000. Valor total: ', total_somado[3])
}
```


Vamos descobrir:

-   Aplicar desconto de 10% em todos os produtos do estoque.

-   Descobrir qual o produto mais vendido.



Vamos relembrar nossos dados:
```{r}
matriz_estoque
```

Suponha que queremos aplicar um desconto de 10% em todos os produtos do estoque.

```{r}
for (i in 1:nrow(matriz_estoque)) {
  matriz_estoque[i, 1] <- matriz_estoque[i, 1] * 0.9
}

matriz_estoque
```

Vamos usar um loop while para encontrar o produto mais vendido, ou seja, aquele que tem a quantidade em estoque mais alta.

Primeiro, vamos definir as variáveis que vamos utilizar:

```{r}
produto_mais_vendido <- ""
quantidade_mais_vendida <- 0
i <- 1
```

Agora, vamos construir o while:

```{r}
while (i <= nrow(matriz_estoque) | quantidade_mais_vendida == 50) {
  if (matriz_estoque[i, 2] > quantidade_mais_vendida) {
    produto_mais_vendido <- i
    quantidade_mais_vendida <- matriz_estoque[i, 2]
  }
  i <- i + 1
}

matriz_estoque[, 2][produto_mais_vendido]
```


## Aula 4 - Funções matemáticas e estatísticas

### Projeto da aula

Vamos criar uma nova matriz de vendas. Dessa vez, vamos incluir a receita das vendas na matriz.

A partir dessa matriz, vamos responder às seguintes :

-   Quantos produtos com preço acima de 600 foram vendidos?

-   Qual a receita média das vendas?

-   Existe uma diferença muito grande entre a média e a mediana das receitas?

-   Qual o produto mais caro e qual o mais barato?

Primeiramente, vamos criar a matriz:

```{r}
dados_vendas <- matrix(c(
  1230.75, 20, 24615,
  840.46, 35, 29416.10,
  110.20, 15, 1653,
  519.67, 10, 5196.70,
  650.90, 25, 16272.50

), ncol = 3, byrow = TRUE)

rownames(dados_vendas) <- c('Ar Condicinado', 'Cama', 'Mesa', 'Refrigerador', 'Sofa')
colnames(dados_vendas) <- c("Preco", "Quantidade", "Receita")

dados_vendas
```

Vamos verificar qual a quantidade de vendas de produtos com valor acima de 600:

```{r}
dados_vendas[dados_vendas[, 1] > 600, ]
```

```{r}
selecao <- dados_vendas[dados_vendas[, 1] > 600, ]

total_quantidades <- sum(selecao[, 2])
total_quantidades
```

Vamos verificar o QUANTO ESSES PRODUTOS REPRESENTAM NO TOTAL DE VENDAS.

Para isso, vamos dividir o `total_quantidades` pela soma de todas as vendas e multiplicar por 100:

```{r}
vendas_total <- sum(dados_vendas[, 2])

porcent <- (total_quantidades / vendas_total) * 100

porcent
```

Para melhorar a leitura desse valor, podemos arrendendá-lo. Para isso, podemos utilizar a função `round()`:

```{r}
round(porcent)
```


Para calcular a média da receita, podemos utilizar a função `mean()`:

```{r}
media_precos <- mean(dados_vendas[, 3])
media_precos
```

Vamos comparar com a mediana. Para isso, vamos utilizar a função `median()`.

```{r}
mediana_receitas <- median(dados_vendas[, 3])
mediana_receitas
```

E qual é o produto mais caro? Para descobrir isso, podemos utilizar a função `which.max()`, que encontra o valor máximo da matriz:

```{r}
dados_vendas
```

```{r}
produto_mais_caro <- dados_vendas[which.max(dados_vendas[, 1]), 1]
produto_mais_caro
```

E o produto mais barato? Basta mudarmos a função para `which.min()`, dessa forma:

```{r}
produto_mais_barato <- dados_vendas[which.min(dados_vendas[, 1]), 1]
produto_mais_barato
```

Vamos comparar a quantidade de vendas entre o produto mais caro e o mais barato:

```{r}
selecao_caro <- dados_vendas[dados_vendas[, 1] == produto_mais_caro]
selecao_barato <- dados_vendas[dados_vendas[, 1] == produto_mais_barato]

cat('Total de vendas de produtos mais caros:', selecao_caro[2], '| Com receita de ', selecao_caro[3])

cat('\nTotal de vendas de produtos mais baratos:', selecao_barato[2], '| Com receita de ', selecao_barato[3])
```


## Aula 5 - Fatores

### Projeto da aula

Suponha que você tenha um conjunto de dados que representa o status de entrega de diferentes produtos.

```{r}
status_entrega <- c("Entregue", "Em Trânsito", "Pendente", "Entregue", "Em Trânsito")

nomes_produtos <- c("Smartphone", "Notebook", "Monitor", "Mouse", "Tablet")

names(status_entrega) <- nomes_produtos

status_entrega
```


Para criar um fator no R, utilizamos a função `factor()`:

```{r}
fator_status <- factor(status_entrega)
fator_status
```


Para definir uma ordem nos fatores, podemos utilizar os argumentos `ordered` e `levels` da função `factor()`:

```{r}
fator_status <- factor(status_entrega, ordered = TRUE, levels = c("Em Trânsito", "Pendente", "Entregue"))

print(fator_status)
```


Podemos atualizar os níveis do fator utilizando a função `levels()`:

```{r}
levels(fator_status) <- c("Pendente", "Em Trânsito", "Entregue")

fator_status
```

Vamos verificar se um produto está em estado mais avançado de entrega que outro. Por exemplo, vamos comparar os produtos Monitor com Tablet:

```{r}
fator_status[3] > fator_status[5]
```

Agora, imagine que você queira priorizar a entrega dos produtos que estão "Em Trânsito" e estão "Pendentes". Você pode utilizar operadores lógicos para fazer isso:

```{r}
produtos_prioritarios <- fator_status %in% c("Em Trânsito", "Pendente")

status_entrega[produtos_prioritarios]
```

Agora, vamos verificar quantos produtos estão presentes em cada status:

```{r}
total_entregues <- sum(fator_status == "Entregue")
total_em_transito <- sum(fator_status == "Em Trânsito")
total_pendentes <- sum(fator_status == "Pendente")

total_entregues
total_em_transito
total_pendentes
```
