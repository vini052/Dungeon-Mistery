# 🎮 Dungeon Mistery – Documento de Requisitos de Produto (PRD)
## 1. Visão Geral do Produto
- Nome do Produto: Dungeon Mistery
- Tipo de Produto: Jogo eletrônico estilo RPG
- Plataforma-alvo: PC (Windows/Linux), com possibilidade de expansão
- Público-alvo: Jogadores casuais e entusiastas de exploração e quebra-cabeças
- Objetivo: Permitir que o jogador explore uma dungeon com 20 salas interconectadas aleatoriamente, colete itens, resolva um enigma fragmentado e encontre a saída.

## 2. Descrição Geral
### 2.1 Conceito do Jogo
- O jogo se passa em uma dungeon com 20 salas. Cada sala possui elementos interativos como:
  
  📜 Placa com parte do enigma

  🚪 Porta que leva a outra sala aleatória
 
  🎁 Itens como baús, chaves, moedas, etc.</sub>
 
- O jogador precisa visitar todas as salas e coletar todas as partes do enigma para escapar.

### 2.2 Mecânica Principal
- Ao iniciar, o jogador entra em uma sala aleatória das 20.
- Cada porta leva a uma sala também escolhida aleatoriamente.
- O jogador deve coletar todas as partes do enigma para resolver o desafio final e escapar.

### 2.3 Controles Básicos
- **W A S D** : movimentação

- Barra de espaço: interagir com objetos (placas, baús, portas)


## 3. Funcionalidades Principais
### 3.1 Exploração de Sala
- Salas em 2D contendo porta, placa e objetos aleatórios.

### 3.2 Inventário
- Inventário em forma de lista na parte inferior da tela.
- Capacidade limitada para estimular decisões estratégicas.

### 3.3 Enigma
- Cada placa traz 1/20 do enigma.
- O jogador deve juntar todas as partes e interpretar para escapar.

### 3.4 Sistema de Som
- Sons ao coletar itens, abrir baús e mudar de sala.

### 3.5 Aleatoriedade de Navegação
- Algoritmo de aleatoriedade controlada garante acesso a todas as salas.

### 3.6 HUD (Interface)
- Inventário, progresso do enigma e (opcionalmente) mapa de salas visitadas.

## 4. Requisitos Funcionais
   
| ID	| Requisito	| Prioridade |
| --- |---------- | ---------- |
| RF01 | O jogador deve poder interagir com objetos da sala |	Alta |
| RF02 | O jogador deve poder coletar itens e armazená-los no inventário |	Alta |
| RF03	| O jogador deve ouvir efeitos sonoros ao realizar ações |	Média |
| RF04	| A placa da sala deve mostrar parte do enigma |	Alta |
| RF05	| As portas devem conectar a salas aleatórias |	Alta |
| RF06	| Deve haver um sistema para montar o enigma completo |	Alta |
| RF07	| O jogador deve conseguir escapar após resolver o enigma |	Alta |

## 5. Requisitos Não Funcionais

| ID	| Requisito	| Descrição |
| --- | ---- | ---- |
| RNF01 |	Usabilidade	| Interface simples e intuitiva para inventário e interações |
| RNF02 |	Desempenho	| O jogo deve rodar bem em máquinas com hardware modesto |
| RNF03 |	Escalabilidade	| Preparado para futuras adições de salas e enigmas |

## 6. Suposições, Restrições e Dependências
### 6.1 Suposições
- O jogador entende comandos básicos de RPGs.
- O jogador vai explorar todas as salas.
- O jogo será single player e offline.

### 6.2 Restrições
- Número fixo de 20 salas.
- Cada sala deve conter uma parte do enigma.
- Aleatoriedade controlada para evitar travamentos.
- Capacidade limitada no inventário.

### 6.3 Dependências
- Motor de jogo: Godot 4.
- Bibliotecas externas para som, interface e cenas.
- Sistema de arquivos para salvar progresso (opcional).
- Dispositivos de entrada: teclado ou controle.
